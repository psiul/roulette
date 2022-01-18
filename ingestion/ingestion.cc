/*Copyright (c) 2021 Data Intensive Applications and Systems Laboratory (DIAS)
                   Ecole Polytechnique Federale de Lausanne
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.*/

#include "ingestion.h"

#include "../datablock/datablock.h"
#include "../frontend/schema.h"
#include "../memory/buffer-manager.h"
#include "../primitives/atomic-stack.h"
#include "../expressions/evaluators.h"

Ingestion::Ingestion (int table, int size, int numthreads, Schema* schema, Ingestion** ingestion, AtomicStack<DataBlock>& dallocator, std::atomic_flag& dallocator_lock) : table(table), rowCount(schema->getRowCount(table)), size(size), numthreads(numthreads), schema(schema), ingestion(ingestion), bufferManager(schema->getBufferManager()), dallocator(dallocator), dallocator_lock(dallocator_lock), activeScansNumber(0) {
	iterator.store(0);
	storage_lock.clear();
	relationNum = schema->getTableNumber();

	for (int i = 0; i < numthreads; i++)
		bufferBatchRemaining[i*16] = 0;
}

/*
reset used in order to use reset state of roulette instance
*/
void Ingestion::reset () {
	iterator.store(0);
	activeScansNumber = 0;
}

/*
get the next vector to process
*/
DataBlock* Ingestion::getNext(int threadId) {
	/*ingestion lock*/
	while (storage_lock.test_and_set(std::memory_order_acquire));
	/*find next vector to process*/
	int cur = iterator.fetch_add(1);
	int chunks = (rowCount+size-1)/size;
	/*compute active queries and terminate outgoing queries*/
	std::bitset<MAXQUERIES> queries = getQueryMask(cur, threadId);
	storage_lock.clear(std::memory_order_release);

	if (queries.none())
		return nullptr;

	/*produce input vector vids based on chosen range*/
	int offset = (cur%chunks)*size;
	int len = (offset + size > rowCount)? rowCount - offset : size;

	if (bufferBatchRemaining[threadId*16] == 0) {
		bufferManager->getBufferN(&bufferBatch[threadId*BUFFER_BATCH_SIZE], BUFFER_BATCH_SIZE);
		bufferBatchRemaining[threadId*16] = BUFFER_BATCH_SIZE;
	}

	bufferBatchRemaining[threadId*16] -= 2;

	std::bitset<MAXQUERIES> * mask = (std::bitset<MAXQUERIES> *) bufferBatch[threadId*BUFFER_BATCH_SIZE + bufferBatchRemaining[threadId*16]];

	int* index = (int*) bufferBatch[threadId*BUFFER_BATCH_SIZE + bufferBatchRemaining[threadId*16]+1];

	for (int i = 0; i < size; i++) {
		index[i] = offset + i;
	}

	/*reuse existing vector structures*/
	while(dallocator_lock.test_and_set(std::memory_order_acquire));
	DataBlock* dataBlock = dallocator.pop();
	dallocator_lock.clear(std::memory_order_release);

	assert(dataBlock != nullptr);

	dataBlock->init(schema, table, mask, index, len, bufferManager->getBlockSize()/sizeof(std::bitset<MAXQUERIES>));
	dataBlock->setQuery(queries);

	return dataBlock;
}

void Ingestion::registerScan (std::bitset<MAXQUERIES> queries, Triggers* trigger, bool empty) {
	/*ingestion lock*/
	while (storage_lock.test_and_set(std::memory_order_acquire));
	/*record start of scan and triggers*/
	int chunks = (rowCount+size-1)/size;
	activeScans[activeScansNumber] = queries;
	activeCursor[activeScansNumber] = (!empty)? iterator.load()+chunks : iterator.load();
	activeTriggers[activeScansNumber] = trigger;
	activeScansNumber++;
	std::cout << "Starting scan of " << schema->getTableString(table)  << std::endl;

	/*get timing information*/
	struct timespec finish;
	clock_gettime(CLOCK_MONOTONIC, &finish);
	double elapsed = (finish.tv_sec - (activeTriggers[activeScansNumber-1]->start).tv_sec);
	elapsed += (finish.tv_nsec - (activeTriggers[activeScansNumber-1]->start).tv_nsec) / 1000000000.0;

	/*set scan as active*/
	for (int i = 0; i < numthreads; i++)
		(trigger->done[MAXRELATIONS*i + table]) = false;
	storage_lock.clear(std::memory_order_release);
}

std::bitset<MAXQUERIES> Ingestion::getQueryMask(int cursor, int threadId) {
	std::bitset<MAXQUERIES> queries;
	queries.reset();
	bool term = true;

	int i = 0;

	while (i < activeScansNumber) {
		/*scan is still active*/
		if (cursor < activeCursor[i]) {
			queries |= activeScans[i];
			term = false;
		/*scan is inactive*/
		} else {
			/*termination wasn't detected before for this thread*/
			if ((activeTriggers[i]->threadMask[table] & (1 << threadId)) == 0) {
				/*set as terminated for current thread*/
				uint64_t newmask = (activeTriggers[i]->threadMask[table]).fetch_or(1 << threadId) | (1 << threadId);
					
				/*all threads are done (no in-flight probes)*/
				if (newmask == (1 << numthreads) - 1) {
					/*scan is done*/
					int howmany = (activeTriggers[i]->counter)->fetch_add(1) + 1;

					/*notify successor scans*/
					for (int k = activeTriggers[i]->successorOffsets[table]; k < activeTriggers[i]->successorOffsets[table+1]; k++) {
						activeTriggers[i]->predecessors[activeTriggers[i]->successors[k]].fetch_add(-1);

						/*start successor scan*/
						if (activeTriggers[i]->predecessors[activeTriggers[i]->successors[k]] == 0) {
							ingestion[activeTriggers[i]->successors[k]]->registerScan(activeTriggers[i]->queryMask[activeTriggers[i]->successors[k]], activeTriggers[i]);
						}
						assert(activeTriggers[i]->predecessors[activeTriggers[i]->successors[k]] >= 0);
					}

					/*all scans are done*/
					if (howmany == relationNum) {
						std::bitset<MAXQUERIES> curQueries;
						curQueries.reset();
						for (int j = 0; j < relationNum; j++)
							curQueries |= activeTriggers[i]->queryMask[j];

						activeTriggers[i]->activeQueries[0] &= ~curQueries;

						struct timespec finish;
						clock_gettime(CLOCK_MONOTONIC, &finish);

						/*produce output for current queries*/
						for (int q = 0; q < MAXQUERIES; q++) {
							if (curQueries.test(q)) {
								std::vector<Evaluator*>* targets = activeTriggers[i]->aggrs[q];
								for (int j = 0; j < targets->size(); j++) {
									/*delete prints output (output is in destructor)*/
									delete (*targets)[j];
									(*targets)[j] = nullptr;
								}
							}
						}

						double elapsed = (finish.tv_sec - (activeTriggers[i]->start).tv_sec);
						elapsed += (finish.tv_nsec - (activeTriggers[i]->start).tv_nsec) / 1000000000.0;

						std::cout << "time: " << elapsed << std::endl;

						timer = elapsed;
					}
				} else {
					term = false;
				}
			} else {
				term = false;
			}
		}

		i++;
	}

	/*scan is inactive, nothing to return*/
	if (queries == 0 && activeScansNumber > 0)
		(activeTriggers[0]->done[MAXRELATIONS*threadId + table]) = true;

	return queries;
}

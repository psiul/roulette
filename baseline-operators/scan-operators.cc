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

#include "scan-operators.h"
#include "../datablock/datablock.h"

#include <iostream>

ScanOperator::ScanOperator (Schema* schema, int tableId, const std::bitset<MAXQUERIES>& queries, AtomicStack<DataBlock>& dallocator, std::atomic_flag& dallocator_lock, int numthreads)
		: Operator(queries, ((1ull) << tableId), dallocator, dallocator_lock), tableId_(tableId), schema_(schema), bufferManager(schema->getBufferManager()), numthreads(numthreads) {
			for (int i = 0; i < MAXTHREADS; i++) {
				bufferBatchRemaining[i*16] = 0;
				blockBatchRemaining[i*16] = 0;
			}

			lock_.clear();
		}

void ScanOperator::execute (int threadId) {
	const int size = 1024;

	uint64_t rowCount = schema_->getRowCount(tableId_);

	/*iterate over the vectors of the relation*/
	for (int offset = size*threadId; offset < rowCount; offset += size*numthreads) {
		int len = (offset + size > rowCount)? rowCount - offset : size;

		if (bufferBatchRemaining[threadId*16] == 0) {
			bufferManager->getBufferN(&bufferBatch[threadId*BUFFER_BATCH_SIZE], BUFFER_BATCH_SIZE);
			bufferBatchRemaining[threadId*16] = BUFFER_BATCH_SIZE;
		}
	
		bufferBatchRemaining[threadId*16] -= 2;

		if (blockBatchRemaining[threadId*16] == 0) {
			while(dallocator_lock.test_and_set(std::memory_order_acquire));
			dallocator.popN(&blockBatch[threadId*BUFFER_BATCH_SIZE], BUFFER_BATCH_SIZE);
			dallocator_lock.clear(std::memory_order_release);
			blockBatchRemaining[threadId*16] = BUFFER_BATCH_SIZE;
		}
	
		blockBatchRemaining[threadId*16] -= 1;

		DataBlock* dataBlock = blockBatch[threadId*BUFFER_BATCH_SIZE + blockBatchRemaining[threadId*16]]; 

		std::bitset<MAXQUERIES> * mask = (std::bitset<MAXQUERIES> *) bufferBatch[threadId*BUFFER_BATCH_SIZE + bufferBatchRemaining[threadId*16]];

		int* index = (int*) bufferBatch[threadId*BUFFER_BATCH_SIZE + bufferBatchRemaining[threadId*16]+1];

		for (int i = 0; i < size; i++) {
			index[i] = offset + i;
		}

		//while(dallocator_lock.test_and_set(std::memory_order_acquire));
		//DataBlock* dataBlock = dallocator.pop();
		//dallocator_lock.clear(std::memory_order_release);

		assert(dataBlock != nullptr);

		dataBlock->init(schema_, tableId_, mask, index, len, bufferManager->getBlockSize()/sizeof(std::bitset<MAXQUERIES>));
		dataBlock->setQuery(queries_);
		dataBlock->initFlag = false;
		dataBlock->localized = false;

		route (dataBlock, threadId);
	}
}

void ScanOperator::consume (DataBlock* data, int threadId) {
	assert(false);
}
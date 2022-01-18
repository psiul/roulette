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

#include "../utilities/common.h"
#include "../ingestion/ingestion.h"
#include "../datablock/datablock.h"
#include "../primitives/atomic-stack.h"
#include "../frontend/schema.h"
#include "../roulette-operators/filter.h"

#include <atomic>

extern double timer;
extern int64_t intermediate_filters;
extern int64_t intermediate_enter;
extern int64_t intermediate_joins;

#define CUR_SOCKET 1

int* readColumnFromBinary (std::string relPath, int column, int n) {
	char* fname = new char[10000];
	sprintf(fname, "%s.%d", relPath.c_str(), column);
	printf ("reading %s\n", fname);

	int fd = open(fname, O_RDONLY); 

	assert(fd >= 0);

	int* res = (int*) numa_alloc_onnode(((int64_t) n)*sizeof(int), CUR_SOCKET);

	int dummy = read(fd, res, ((int64_t) n)*sizeof(int));

	close(fd);

	return res;
}

Table* createTable1 (int fraction) {
	Table* table = new Table("t1", 2528312);
	int* col = readColumnFromBinary("job/title.csv", 0, 2528312);
	table->addColumn("0", new DataInt(), true, col);
	table->shuffle();
	table->resize(2528312*fraction);
	return table;
}

Table* createTable2 (int fraction) {
	Table* table = new Table("t2", 2528312);
	int* col = readColumnFromBinary("job/title.csv", 0, 2528312);
	table->addColumn("0", new DataInt(), true, col);
	table->shuffle();
	table->resize(2528312*fraction);
	return table;
}

Schema* getSchema (int fraction1, int fraction2) {
	std::vector<Table*> tables;
	std::vector<bool> dummy;

	tables.push_back(createTable1(fraction1));
	dummy.push_back(false);

	tables.push_back(createTable2(fraction2));
	dummy.push_back(false);

	Schema* schema = new Schema(tables, dummy, new BufferManager (1 << 14, 1 << 18, CUR_SOCKET));

	return schema;
}


void rangeIndexBench (Schema* schema, Ingestion* table, int range, std::bitset<MAXQUERIES> queries) {
	PolyFilter* filter = new PolyFilter(schema, 0);
	filter->addLt(range, queries);

	struct timespec start;
	struct timespec finish;

	clock_gettime(CLOCK_MONOTONIC, &start);

	while (true) {
		DataBlock* data = table->getNext(0);

		if (data == nullptr) break;

		std::bitset<MAXQUERIES>* pred = (std::bitset<MAXQUERIES> *) filter->apply(data, 0);
		assert(pred != nullptr);
		data->filter(pred);
	}

	clock_gettime(CLOCK_MONOTONIC, &finish);
	double elapsed = (finish.tv_sec - start.tv_sec);
	elapsed += (finish.tv_nsec - start.tv_nsec) / 1000000000.0;
	std::cout << "time: " << elapsed << std::endl;
}

void routingFilterBench (Schema* schema, Ingestion* table, int range, std::bitset<MAXQUERIES> queries) {
	PolyFilter* filter = new PolyFilter(schema, 0);
	filter->addLt(range, 1);

	struct timespec start;
	struct timespec finish;

	clock_gettime(CLOCK_MONOTONIC, &start);

	while (true) {
		DataBlock* data = table->getNext(0);

		if (data == nullptr) break;

		std::bitset<MAXQUERIES>* pred = (std::bitset<MAXQUERIES> *) filter->apply(data, 0);
		assert(pred != nullptr);
		data->filter(pred);
		data->filterQuery(1);
	}

	clock_gettime(CLOCK_MONOTONIC, &finish);
	double elapsed = (finish.tv_sec - start.tv_sec);
	elapsed += (finish.tv_nsec - start.tv_nsec) / 1000000000.0;
	std::cout << "time: " << elapsed << std::endl;
}

void stemBench (Schema* schema, Ingestion** table, Stem* ht, int range, std::bitset<MAXQUERIES> queries, std::atomic_flag* versionLock, int* snapshots, std::atomic<int>* version) {
	PolyFilter* filter = new PolyFilter(schema, 1);
	filter->addLt(range, queries);

	int globalVersion = 0;
	std::atomic<int> globalOffset;
	globalOffset.store(0);

	int tupleSize = ((3+2)*sizeof(int)+sizeof(std::bitset<MAXQUERIES>))/sizeof(int);
	tupleSize = (tupleSize % 2)? tupleSize + 1 : tupleSize; 

	while (true) {
		DataBlock* data = table[1]->getNext(0);

		if (data == nullptr) break;

		std::bitset<MAXQUERIES>* pred = (std::bitset<MAXQUERIES> *) filter->apply(data, 0);
		assert(pred != nullptr);
		data->filter(pred);

		int nextVersion = version->fetch_add(1)+1;
		uint64_t offset = globalOffset.fetch_add(data->getSize()*tupleSize);

		if (ht != nullptr)
			ht->build(data, nextVersion, offset, 0, queries);

		int expected = nextVersion-1;

		while (versionLock->test_and_set(std::memory_order_acquire));
		int snapshot = globalVersion;
		snapshots[nextVersion] = snapshot;
		globalVersion = snapshot + 1;
		versionLock->clear(std::memory_order_release);
	}

	DataBlock* results[1024];

	struct timespec start;
	struct timespec finish;

	clock_gettime(CLOCK_MONOTONIC, &start);

	while (true) {
		DataBlock* data = table[0]->getNext(0);

		if (data == nullptr) break;

		data->filterTrue();

		if (ht != nullptr)
			ht->probe(results, &data, 1, 0, 1 << 18, -1, -1, queries, 0, queries);

	}

	clock_gettime(CLOCK_MONOTONIC, &finish);
	double elapsed = (finish.tv_sec - start.tv_sec);
	elapsed += (finish.tv_nsec - start.tv_nsec) / 1000000000.0;
	std::cout << "time: " << elapsed << std::endl;
}


int main (int argc, char** argv) {
	srand(time(NULL));

	float f1 = atof(argv[1]);
	float f2 = atof(argv[2]);

	float s1 = atof(argv[3]);
	float s2 = atof(argv[4]);

	Schema* schema = getSchema(f1, f2);

	AtomicStack<DataBlock> dallocator;
	std::atomic_flag dallocator_lock;

	DataBlock* dblocks = new(numa_alloc_onnode((1 << 24)*sizeof(DataBlock), SOCKET)) DataBlock[1 << 24];
	for (int i = 0; i < (1 << 24); i++)
		dallocator.push(dblocks+i);
	dallocator_lock.clear(std::memory_order_release);

	Ingestion* ingestion[2];
	ingestion[0] = new Ingestion(0, 1024, 1, schema, ingestion, dallocator, dallocator_lock);
	ingestion[1] = new Ingestion(1, 1024, 1, schema, ingestion, dallocator, dallocator_lock);

	std::bitset<MAXQUERIES> queries;
	queries.set(0);
	queries.set(1);

	Triggers t;
	t.predecessors = new(numa_alloc_onnode(2*sizeof(std::atomic<int>), SOCKET)) std::atomic<int>[2];
	t.predecessors[0] = 0;
	t.predecessors[1] = 0;

	t.successors = new(numa_alloc_onnode(2*sizeof(int), SOCKET)) int[2];
	t.successorOffsets = new(numa_alloc_onnode(2*sizeof(int), SOCKET)) int[2];
	t.successorOffsets[0] = 0;
	t.successorOffsets[1] = 0;

	t.queryMask = new(numa_alloc_onnode(2*sizeof(std::bitset<MAXQUERIES>), SOCKET)) std::bitset<MAXQUERIES>[2];
	t.queryMask[0] = queries;
	t.queryMask[1] = queries;

	t.done = new(numa_alloc_onnode(2*sizeof(bool), SOCKET)) bool[2];
	t.done[0] = false;
	t.done[1] = false;

	t.aggrs = new std::vector<Evaluator*>*[2];
	t.aggrs[0] = new std::vector<Evaluator*>();
	t.aggrs[1] = new std::vector<Evaluator*>();

	t.counter = new(numa_alloc_onnode(2*sizeof(std::atomic<int>), SOCKET)) std::atomic<int>[2];

	t.activeQueries = &queries;

	t.threadMask = new(numa_alloc_onnode(2*sizeof(std::atomic<uint64_t>), SOCKET)) std::atomic<uint64_t>[2];
	t.threadMask[0] = 0;
	t.threadMask[1] = 0;

	ingestion[0]->registerScan(queries, &t, false);
	ingestion[1]->registerScan(queries, &t, false);
	
	//routingFilterBench (schema, ingestion[0], s1*2528312, queries);
	
	uint64_t htSize = (MEGABUFFER_SIZE+(1 << 20))*sizeof(int);
	int* htArray = (int*) numa_alloc_onnode(htSize, CUR_SOCKET);
	memset(htArray, 5, htSize);
	
	std::atomic_flag* versionLock = new(numa_alloc_onnode(sizeof(std::atomic_flag), CUR_SOCKET)) std::atomic_flag;
	int* snapshots = new(numa_alloc_onnode(((1 << 20)+1)*sizeof(int), CUR_SOCKET)) int[(1 << 20) + 1];
	std::atomic<int>* version = new(numa_alloc_onnode(sizeof(std::atomic<int>), CUR_SOCKET)) std::atomic<int>();
	version->store(-1);
	std::vector<int> keySet;
	keySet.push_back(1);
	snapshots[0] = -1;
	snapshots++;
	for (int j = 0; j < (1 << 20); j++)
		snapshots[j] = INT_MAX;

	Stem* ht = new(numa_alloc_onnode(sizeof(Stem), CUR_SOCKET)) 
					Stem (
						schema, 
						htArray, 
						&dallocator, 
						&dallocator_lock,
						versionLock, 
						snapshots,
						version,
						keySet, 
						1, 
						24, 
						htSize, 
						1);

	ht->registerJoin(0, 1, 0);

	stemBench (schema, ingestion, ht, s1*2528312, queries, versionLock, snapshots, version);

	return 0;
}
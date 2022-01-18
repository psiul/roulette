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

#ifndef INGESTION_H_
#define INGESTION_H_

#include "../utilities/common.h"

class DataBlock;
class Schema;
class BufferManager;
template <class T> class AtomicStack;
class Evaluator;

#include <atomic>
#include <bitset>

extern double timer;

/*
Triggers hold all the required information for query management:
1) scanordering
2) query termination
3) host-side consumer operators to notify for end of input
*/
struct Triggers {
	std::atomic<int>* predecessors;
	int* successors;
	int* successorOffsets;
	std::bitset<MAXQUERIES>* queryMask;
	bool* done;
	std::vector<Evaluator*>** aggrs;
	std::atomic<int>* counter;
	std::bitset<MAXQUERIES>* activeQueries;
	std::atomic<uint64_t>* threadMask;
	struct timespec start;
};


/*
Ingestion models the circular scan of a single relation
The executor handles the round-robin ingestion
*/
struct Ingestion {
	const int table;
	const int rowCount;
	const int size;
	const int numthreads;

	int relationNum;

	Schema* schema;
	BufferManager* bufferManager;

	Ingestion** ingestion;

	AtomicStack<DataBlock>& dallocator;
	std::atomic_flag& dallocator_lock;

	std::bitset<MAXQUERIES> activeScans[MAXQUERIES];
	int activeCursor[MAXQUERIES];
	Triggers* activeTriggers[MAXQUERIES];
	int activeScansNumber;

	std::atomic<int> iterator;
	std::atomic_flag storage_lock;

	void* bufferBatch[MAXTHREADS*BUFFER_BATCH_SIZE];
	int bufferBatchRemaining[MAXTHREADS*16];

	Ingestion (int table, int size, int numthreads, Schema* schema, Ingestion** ingestion, AtomicStack<DataBlock>& dallocator, std::atomic_flag& dallocator_lock);

	void reset ();

	/*
	choose the next vector for the RouLette worker 
	*/
	DataBlock* getNext(int threadId);

	/*
	register the circular scan of an incoming query
	empty means that the query is not interested in the relation and only uses the scan to co-ordinate the scanning order
	*/
	void registerScan (std::bitset<MAXQUERIES> queries, Triggers* trigger, bool empty = false);

private:
	/*
	decide which queries are active
	*/
	std::bitset<MAXQUERIES> getQueryMask(int cursor, int threadId);
};

#endif

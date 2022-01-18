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

#ifndef JOIN_OPERATOR_H_
#define JOIN_OPERATOR_H_

#include "operators.h"

class Schema;

struct JoinHT {
	uint64_t probeProjections_;
	uint64_t buildProjections_;

	int indexList_[32];
	int indexListSize_;

	int buildKey_;
	int probeKey_;

	uint64_t tupleSize_;

	uint64_t maxSize_;

	int* data_;
	int64_t* heads_;

	std::atomic<uint64_t>& offset_;

	int hashBits;

	AtomicStack<DataBlock>& dallocator;
	std::atomic_flag& dallocator_lock;

	int* project_[MAXTHREADS*32];
	int* buffer_[MAXTHREADS];

	void* bufferBatch[MAXTHREADS*BUFFER_BATCH_SIZE];
	int bufferBatchRemaining[MAXTHREADS*16];

	DataBlock* blockBatch[MAXTHREADS*BUFFER_BATCH_SIZE];
	int blockBatchRemaining[MAXTHREADS*16];

	Schema* schema_;

public:
	JoinHT (Schema*, uint64_t, uint64_t, int, int, int, int, std::atomic<uint64_t>*, uint64_t*, AtomicStack<DataBlock>&, std::atomic_flag&);

	void finalize ();

	void build (DataBlock*, std::bitset<MAXQUERIES>&, int, int);

	int probe(DataBlock**, DataBlock*, std::bitset<MAXQUERIES>&, int, int);

	void pack (DataBlock**, int*, std::bitset<MAXQUERIES> *, uint64_t, uint64_t, int*, int, int*, int, std::bitset<MAXOPS>, uint64_t, int);

	void updateProjections(uint64_t relations, int submask);
};

class JoinOperator : public Operator {
	int buildKey_;
	int probeKey_;

	DataBlock* probeData_[MAXTHREADS*30000];
	int ctr[MAXTHREADS*16];

	JoinHT* ht;

	int submask;

	const int numthreads;

	int cntleft;
	int cntright;

	DataBlock** results_g;

	std::atomic_flag build_lock_;
	std::atomic_flag probe_lock_;
	std::atomic_flag queue_lock_;

public:
	JoinOperator (Schema*, const std::bitset<MAXQUERIES>&, int, int, uint64_t, uint64_t, int, std::atomic<uint64_t>*,  uint64_t*, AtomicStack<DataBlock>&, std::atomic_flag&, bool, int);

	virtual void execute (int threadId) override;
	virtual void consume (DataBlock*, int) override;
	virtual void updateProjections () override;
	virtual void finalize () override {
		ht->finalize();
	}

	static uint64_t intermediates;
};




#endif
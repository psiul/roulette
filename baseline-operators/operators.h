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

#ifndef OPERATORS_H_
#define OPERATORS_H_


#include "../utilities/common.h"
#include "../primitives/atomic-stack.h"

#include <bitset>
#include <vector>
#include <map>

class DataBlock;
class Filter;


/*Vectorized operator class for the shared-work baseline
The class defines the abstract methods:
execute: processes all the pending work if the operator is not fully pipelined
consume: registers vectors for processing and performs the pipelined part of the work*/
class Operator {
protected:
	uint64_t projections_;

	std::vector<int> bindings_;
	std::bitset<MAXQUERIES> queries_;
	std::vector<Operator*> consumers_;

	AtomicStack<DataBlock>& dallocator;
	std::atomic_flag& dallocator_lock;

	void* bufferBatchOp[MAXTHREADS*BUFFER_BATCH_SIZE];
	int bufferBatchRemainingOp[MAXTHREADS*16];

	DataBlock* blockBatchOp[MAXTHREADS*BUFFER_BATCH_SIZE];
	int blockBatchRemainingOp[MAXTHREADS*16];

public:
	Operator (const std::bitset<MAXQUERIES>&, uint64_t, AtomicStack<DataBlock>&, std::atomic_flag&);

	virtual void execute (int) = 0;
	virtual void consume (DataBlock*, int) = 0;
	/*register a parent operator to this operator*/
	virtual void registerConsumer (Operator*);
	/*pipeline output to all consumers*/
	virtual void route (DataBlock*, int);

	/*garbage collect vectors in a batched way*/
	void garbageCollect (DataBlock*, int);

	/*identify tables required in future operators in order to project unnecessary columns*/
	virtual void updateProjections ();

	/*currently not in use*/
	virtual void finalize () {}

	std::bitset<MAXQUERIES> getQueries () {
		return queries_;
	}

	/*tables that the output of the operator requires*/
	uint64_t getProjections () {
		return projections_;
	}

	virtual void getMapping (std::map<int, int>& mapping);
};


#endif
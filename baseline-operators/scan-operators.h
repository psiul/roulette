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

#ifndef SCAN_OPERATOR_H_
#define SCAN_OPERATOR_H_

#include "operators.h"
#include "../frontend/schema.h"

#include <iostream>

/*scan pipelines all the vectors of base relation in a push-based way*/
class ScanOperator : public Operator {
	int tableId_;
	Schema* schema_;
	int numthreads;

	BufferManager* bufferManager;
	void* bufferBatch[MAXTHREADS*BUFFER_BATCH_SIZE];
	int bufferBatchRemaining[MAXTHREADS*16];

	DataBlock* blockBatch[MAXTHREADS*BUFFER_BATCH_SIZE];
	int blockBatchRemaining[MAXTHREADS*16];


	std::atomic_flag lock_;

public:
	ScanOperator (Schema*, int, const std::bitset<MAXQUERIES>&, AtomicStack<DataBlock>&, std::atomic_flag&, int);

	virtual void execute (int) override;

	virtual void consume (DataBlock*, int) override;
};




#endif
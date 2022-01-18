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

#include "operators.h"

#include "../datablock/datablock.h"
#include "../frontend/schema.h"

Operator::Operator (const std::bitset<MAXQUERIES>& queries, uint64_t projections, AtomicStack<DataBlock>& dallocator, std::atomic_flag& dallocator_lock) : queries_(queries), projections_(projections), dallocator(dallocator), dallocator_lock(dallocator_lock) {
	for (int threadId = 0; threadId < MAXTHREADS; threadId++) {
		bufferBatchRemainingOp[threadId*16] = 0;
		blockBatchRemainingOp[threadId*16] = 0;
	}
}


void Operator::registerConsumer (Operator* op) {
	consumers_.push_back(op);
}

void Operator::route (DataBlock* data, int threadId) {
	for (int i = 0; i < consumers_.size(); i++) {
		consumers_[i]->consume(data, threadId);
	}
}

void Operator::getMapping (std::map<int, int>& mapping) {
	for (int i = 0; i < consumers_.size(); i++) {
		consumers_[i]->getMapping(mapping);
	}
}

void Operator::updateProjections () {
	for (int i = 0; i < consumers_.size(); i++) {
		consumers_[i]->updateProjections();
		projections_ |= consumers_[i]->getProjections();
	}
}

void Operator::garbageCollect (DataBlock* data, int threadId) {
	if (bufferBatchRemainingOp[threadId*16] == BUFFER_BATCH_SIZE) {
		data->getSchema()->getBufferManager()->freeBufferN(&bufferBatchOp[BUFFER_BATCH_SIZE*threadId], BUFFER_BATCH_SIZE);
		bufferBatchRemainingOp[threadId*16] = 0;
	}

	assert(data != nullptr);
	assert(data->getMask() != nullptr);
	assert(data->getVIDSAll() != nullptr);

	bufferBatchOp[BUFFER_BATCH_SIZE*threadId + bufferBatchRemainingOp[threadId*16]] = (void*) data->getMask();
	bufferBatchOp[BUFFER_BATCH_SIZE*threadId + bufferBatchRemainingOp[threadId*16] + 1] = (void*) data->getVIDSAll();

	bufferBatchRemainingOp[threadId*16] += 2;

	if (blockBatchRemainingOp[threadId*16] == BUFFER_BATCH_SIZE) {
		while(dallocator_lock.test_and_set(std::memory_order_acquire));
		dallocator.pushN(&blockBatchOp[BUFFER_BATCH_SIZE*threadId], BUFFER_BATCH_SIZE);
		dallocator_lock.clear(std::memory_order_release);
		blockBatchRemainingOp[threadId*16] = 0;
	}

	blockBatchOp[BUFFER_BATCH_SIZE*threadId + blockBatchRemainingOp[threadId*16]] = data;
	blockBatchRemainingOp[threadId*16] += 1;
}
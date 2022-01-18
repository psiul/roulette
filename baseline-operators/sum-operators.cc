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

#include "sum-operators.h"
#include "../datablock/datablock.h"
#include "../roulette-operators/partitioner.h"

#include <iostream>

SumOperator::SumOperator (std::bitset<MAXQUERIES>& queries, Partitioner* partitioner, AtomicStack<DataBlock>& dallocator, std::atomic_flag& dallocator_lock) 
		: Operator(queries, partitioner->getProjections(), dallocator, dallocator_lock), partitioner_(partitioner) {
			mapped = false;
			queue_lock_.clear();
		}

void SumOperator::execute (int threadId) {
	/*process shared output tuples*/
	while (1) {
		DataBlock* data = nullptr;
		if (aggr_data[16*threadId].size() > 0) {
			data = aggr_data[16*threadId][aggr_data[16*threadId].size()-1];
			aggr_data[16*threadId].pop_back();
		}
	
		if (data == nullptr) break;

		partitioner_->partition(&data, 1, threadId);

		/*check if this is the last operator for shared output*/
		std::bitset<MAXQUERIES> excl = ~queries_;
		std::bitset<MAXQUERIES> test = data->hasQuery(excl);
		if (test.any()) {
			data->filterQuery(excl);
		} else {
			garbageCollect(data, threadId);
		}
	}
}

void SumOperator::consume (DataBlock* data, int threadId) {
	if (data->initFlag == false) {
		data->filterTrue();
		data->initFlag = true;
	}

	/*temporarily cache shared output if needed by another operator i.e. a join
	we found that output routing is expensive so it is better to drop irrelevant queries for query set first*/
	std::bitset<MAXQUERIES> excl = ~queries_;
	std::bitset<MAXQUERIES> test = data->hasQuery(excl);
	if (test.any()) {
		aggr_data[16*threadId].push_back(data);
	} else {
		partitioner_->partition(&data, 1, threadId);

		garbageCollect(data, threadId);
	}
}

void SumOperator::getMapping (std::map<int, int>& mapping) {
	if (mapped)
		return;

	mapped = true;

	for (int q = 0; q < MAXQUERIES; q++) {
		if (queries_.test(q)) {
			int num = mapping.size();
			mapping[num]  = q;
		}
	}
}

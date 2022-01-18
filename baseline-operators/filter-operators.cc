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

#include "filter-operators.h"
#include "../datablock/datablock.h"
#include "../roulette-operators/filter.h"

#include <iostream>

FilterOperator::FilterOperator (const std::bitset<MAXQUERIES>& queries, Filter* filter_kernel, AtomicStack<DataBlock>& dallocator, std::atomic_flag& dallocator_lock) 
		: Operator(queries, 0, dallocator, dallocator_lock), filter_kernel_(filter_kernel) {}

void FilterOperator::execute (int threadId) {
	
}

void FilterOperator::consume (DataBlock* data, int threadId) {
	std::bitset<MAXQUERIES> * pred = filter_kernel_->apply(data, threadId);

	/*first filter sets query set while the others update it*/
	if (data->initFlag)	{
		data->filterAnd(pred);
	} else {
		data->filter(pred);
	}

	data->initFlag = true;

	route (data, threadId);
}
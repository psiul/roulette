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

#ifndef AGGREGATOR_H_
#define AGGREGATOR_H_


#include "../utilities/common.h"

class Evaluator;
class DataBlock;
class Schema;
class Dictionary;

#include <stdint.h>
#include <vector>
#include <bitset>
#include <mutex>

/*
The Aggregator class implements a groupby consumer operator. It is used for implementing TPC-DS queries. 
Aggregator is called through a GROUPBY evaluator to provide a common interface with other aggregations and vector operations.
The result is written in-memory.
Aggregator may also sort the results.
The interface of the Aggregator is as follows:
consume: processes an output vector and performs the required aggregations
produce: produces the aggregation results (call at query termination)
*/

struct Aggregator {
	const int maxRows_;
	const int hashBits_;
	const int numthreads_;

	const int tableId_;

	int valWidth;
	int defaultVal[32];

	int* key_;
	int numKeys_;
	Dictionary** dicts_;

	int* swap_;
	int* swap2_;

	int limit_;

	std::vector<int> ordering_;
	std::vector<std::pair<int, int*> > having_conds_;

	Evaluator** values_;
	int* opcode_;

	int numValues_;

	int64_t* heads_;
	int64_t* next_;
	int* arrays_[32];

	int* buffer_;
	int** valkeeper_;
	int* offsets_;

	int* counters_;

	Schema* schema_;

	std::mutex aggr_mutex;

public:
	Aggregator (
		Schema* schema, 
		std::vector<Evaluator*> vals, 
		std::vector<int*>& valsData, 
		std::vector<std::string> ops, 
		std::vector<int> keys, 
		std::vector<int*>& keysData, 
		std::vector<Dictionary*> dicts,
		std::vector<std::pair<int, int*> > having_conds,
		std::vector<int> ordering, 
		int limit,
		int hashBits, 
		int tableId, 
		int numthreads);

	/*
	Process an output vector
	data: output vector to process
	queries: bitset of aggregation's queries. can be used to exclude irrelevant tuples from vector of shared tuples
	threadId: id of RouLette worker
	*/
	void consume (DataBlock* data, std::bitset<MAXQUERIES> queries, int threadId);

	/*
	Finalize output in the output buffer
	*/
	void produce ();
};






#endif
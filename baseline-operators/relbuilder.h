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

#ifndef REL_BUILDER_H_
#define REL_BUILDER_H_

#include "../frontend/schema.h"
#include "../frontend/parse-util.h"
#include "operators.h"

class Partitioner;

/*
relbuilder compiles and executes plan for query batch
*/
class RelBuilder {
	int relationNum_;
	Schema* schema_;

	Partitioner* partitioner_;

	std::vector<Operator*> ops_;
	std::vector<std::pair<std::pair<uint64_t, std::bitset<MAXQUERIES> >, Operator*> > opIndex_;

	AtomicStack<DataBlock> dallocator;
	std::atomic_flag dallocator_lock_;

	int numthreads;

	/*
	produce filters for the query plan
	*/
	void parseFilters (const ParsedQuery&);

	/*
	produce aggregates for the query plan
	*/
	void parseAggregates (const ParsedQuery& pquery);

	/*
	produce joins for the query plan
	*/
	void parseJoins (const ParsedQuery& pquery, std::vector<std::pair<std::pair<int, std::bitset<MAXQUERIES> >, std::pair<std::pair<uint64_t, uint64_t>, std::pair<bool, uint64_t> > > >, bool, int);

public:
	RelBuilder (Schema*, const ParsedQuery&, std::vector<std::pair<std::pair<int, std::bitset<MAXQUERIES> >, std::pair<std::pair<uint64_t, uint64_t>, std::pair<bool, uint64_t> > > >&, bool, int);

	/*
	execute query plan
	*/
	void execute (int threadId, std::atomic<int>* barriers, int numthreads);

	void getMappings (std::map<int, int>& mapping);

	int getNumberOfOps() { return ops_.size(); }
};

#endif
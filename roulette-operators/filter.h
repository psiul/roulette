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

#ifndef FILTER_H_
#define FILTER_H_

#include "../datablock/datablock.h"
#include "../frontend/schema.h"
#include "../expressions/evaluators.h"
#include "../primitives/mini-ht.h"
#include "../primitives/ranges.h"

#include <stdint.h>

#include <bitset>
#include <vector>
#include <string>

class Filter {
	bool mark_;

public:
	Filter () : mark_(false) {}

	virtual std::bitset<MAXQUERIES>* apply (DataBlock* data, int threadId) = 0;

	virtual void print () {

	}

	virtual void destroy () {

	}

	void mark () {
		mark_ = true;
	}

	bool isMarked () {
		return mark_;
	}

	virtual int getTarget () {
		return -1;
	}

	virtual Filter* merge (Filter* filter, std::bitset<MAXQUERIES> validQueries) {
		return nullptr;
	}

	virtual void updateQuery (std::map<int, int>& mapping) {
		assert(false);
	}

	virtual void printtype () {
		std::cout << "filter" << std::endl;
	}
};

class PolyFilter : public Filter {
protected:
	Schema* schema;

	int columnId;
	void* buffers[2*MAXTHREADS];

	MiniHT* eqPredicates;
	MiniHT* neqPredicates;

	/*
	Range index is the novel optimization for grouped filters with arithmetic comparisons
	*/
	RangeIndex ridx;

	std::bitset<MAXQUERIES> eqQueryAggr;
	std::bitset<MAXQUERIES> neqQueryAggr;
	std::bitset<MAXQUERIES> ltQueryAggr;
	std::bitset<MAXQUERIES> gtQueryAggr;
	std::bitset<MAXQUERIES> leQueryAggr;
	std::bitset<MAXQUERIES> geQueryAggr;
	std::bitset<MAXQUERIES> lkQueryAggr;

	int filterNumber;
	int eqFilterNumber;
	int neqFilterNumber;
	int ltFilterNumber;
	int gtFilterNumber;
	int leFilterNumber;
	int geFilterNumber;

	std::vector<int*> likeLookup;
	std::vector<int*> nlikeLookup;

	std::vector<std::bitset<MAXQUERIES>> likeQueries;
	std::vector<std::bitset<MAXQUERIES>> nlikeQueries;

	std::vector<std::string> likeExpr;
	std::vector<std::string> nlikeExpr;

	std::vector<int> likeType;

public:
	PolyFilter (Schema* schema, int columnId);

	void destroy ();


	std::bitset<MAXQUERIES>* apply (DataBlock* data, int threadId);

	void setQuery (std::bitset<MAXQUERIES> queries);

	void updateQuery (std::map<int, int>& mapping);

	void addEq (int val, std::bitset<MAXQUERIES> queries);
	
	void addNeq (int val, std::bitset<MAXQUERIES> queries);
	
	void addLt (int val, std::bitset<MAXQUERIES> queries);
	
	void addGt (int val, std::bitset<MAXQUERIES> queries);

	void addLe (int val, std::bitset<MAXQUERIES> queries);
	
	void addGe (int val, std::bitset<MAXQUERIES> queries);

	void addLikeLookup (int* lookup, std::bitset<MAXQUERIES> queries, std::string expr, int type);

	void addNLikeLookup (int* lookup, std::bitset<MAXQUERIES> queries, std::string expr);

	void fuseLikeLookups ();

	void print ();

	bool isFilter ();

	int getTarget ();

	Filter* merge (Filter* filter, std::bitset<MAXQUERIES> validQueries);
};

class ConjunctiveFilter : public Filter {
	Evaluator* cond;
	const std::bitset<MAXQUERIES> queries;
	char* mark;

public:
	ConjunctiveFilter (Evaluator* cond, std::bitset<MAXQUERIES> queries);

	void destroy ();

	std::bitset<MAXQUERIES>* apply (DataBlock* data, int threadId);

	Filter* merge (Filter* filter);

	void updateQuery (std::map<int, int>& mapping);
};

/*special filter for tpc-ds query 13*/
class Q28Filter : public Filter {
	PolyFilter* cf1;
	PolyFilter* cf2;
	PolyFilter* cf3;

public:
	Q28Filter (
		Schema* schema, 
		std::vector<int> columnId, 
		std::vector<std::bitset<MAXQUERIES> > queries,
		std::vector<int> low1, std::vector<int> high1,
		std::vector<int> low2, std::vector<int> high2,
		std::vector<int> low3, std::vector<int> high3	
	); 

	std::bitset<MAXQUERIES>* apply (DataBlock* data, int threadId);
};

/*special filter for tpc-ds query 13*/
class Q13Filter : public Filter {
	PolyFilter* cf1;
	PolyFilter* cf2;
	PolyFilter* cf3;
	PolyFilter* cf4;

public:
	Q13Filter (
		Schema* schema, 
		std::vector<int> columnId, 
		std::vector<std::bitset<MAXQUERIES> > queries,
		std::vector<int> eq1, 
		std::vector<int> eq2,
		std::vector<int> eq3,
		std::vector<int> low4, std::vector<int> high4	
	);

	std::bitset<MAXQUERIES>* apply (DataBlock* data, int threadId);
};

class JoinFilter : public Filter {
	FilterJoinEvaluator* cond;

public:
	JoinFilter (FilterJoinEvaluator* cond);

	void destroy ();

	std::bitset<MAXQUERIES>* apply (DataBlock* data, int threadId);

	Filter* merge (Filter* filter);
	void updateQuery (std::map<int, int>& mapping);

	virtual void printtype () override;

	int getJoinID ();

	std::bitset<MAXQUERIES> getQuery ();

	void addQuery (std::bitset<MAXQUERIES> newqueries);

	void setQuery (std::bitset<MAXQUERIES>& queries);
};





#endif

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

#ifndef SEARCH_H_
#define SEARCH_H_

#include <vector>
#include <unordered_set>
#include <unordered_map>

#include <map>
#include <utility>
#include <cassert>

#include <cmath>

#include "../frontend/schema.h"
#include "../frontend/parse-util.h"

#include "loader.h"

#include <iostream>
#include <cstdint>

#include <cfloat>

#define STATE_ARENA_SIZE 10000000
#define MINVEC_ARENA_SIZE 10000000
#define OPERATOR_MAX 128

struct State;

struct ProblemParameters {
	int relNum;
	int opNum;
	int queryNum;

	std::vector<ParsedJoin> predicates;

	std::bitset<MAXQUERIES>* relQueries;
	std::bitset<MAXQUERIES>* opQueries;
	uint64_t* opRelations;

	uint64_t* gridRelations;
	std::bitset<MAXQUERIES>* gridQueries;
	int* gridNum;

	int* opTableLeft;
	int* opTableRight;
	int* opColumnLeft;
	int* opColumnRight;

	StatisticsVector*** stats;

	std::bitset<MAXQUERIES> * aux;

	State* state_arena;
	std::vector<State*> state_alloca;

	std::pair<double, double>* minvec_arena;
	std::vector<std::pair<double, double>* > minvec_alloca;

	ProblemParameters (Schema* schema, 
		std::vector<ParsedJoin>& predicates, 
		std::vector<ExpressionWrapper>& filters, 
		int queryNum);
};

struct State {
	std::vector<std::pair<std::pair<int, std::bitset<MAXQUERIES> >, int> > decisions;
	std::vector<std::pair<std::pair<uint64_t, std::bitset<MAXQUERIES> >, double* > > subqueries;

	std::vector<std::pair<size_t, double> > lineage;

	std::map<int, std::pair<double, double> > opinputs;
	std::map<int, std::pair<uint64_t, uint64_t> > oprels;

	std::unordered_map<uint64_t, std::string> subplan;

	std::vector<std::bitset<MAXQUERIES> > active;

	double cost;
	double cost2;
	double bound;
	double heuristic;

	uint64_t locked;

	double* tmp;

	~State();

	void test ();

	void purge ();

	void init (State*  parent, std::pair<int, std::bitset<MAXQUERIES> > d, ProblemParameters* params);

	void computeBound(ProblemParameters* params);

	std::size_t hash_state ();

	void init_bound_start (State* parent, std::bitset<MAXQUERIES>  q);

	double getSelectivity (std::pair<int, std::bitset<MAXQUERIES> > d, ProblemParameters* params);

	void init_root (ProblemParameters* params);

	bool isComplete (ProblemParameters* params);

	void init_bound (State* parent, std::pair<int, std::bitset<MAXQUERIES> > d, ProblemParameters* params);

	void init_bound_subexpr (Schema* schema, State* parent, std::pair<int, std::bitset<MAXQUERIES> > d, ProblemParameters* params, std::map<std::pair<int, std::pair<std::string, std::string> >, std::pair<double, double> >& subexpression_cache);

	void getOptSubexpr (Schema* schema, ProblemParameters* params, double& best, double& worst, std::map<int, std::pair<int, std::bitset<MAXQUERIES> > >* actions_taken, std::map<std::pair<int, std::pair<uint64_t, uint64_t> >, std::pair<double, double> >& opcards, std::map<std::pair<int, std::pair<uint64_t, uint64_t> >, std::pair<double, double> >* cards_per_query);

	double getBound (ProblemParameters* params, double& optimal_bound, double& greedy_solution);

	void getOpt (ProblemParameters* params, double& best, double& worst, std::map<int, std::pair<int, std::bitset<MAXQUERIES> > >* actions_taken, std::map<std::pair<int, std::pair<uint64_t, uint64_t> >, std::pair<double, double> >& opcards, std::map<std::pair<int, std::pair<uint64_t, uint64_t> >, std::pair<double, double> >* cards_per_query);

	void getOptGreedy (ProblemParameters* params, double& best, double& worst, std::map<int, std::pair<int, std::bitset<MAXQUERIES> > >* actions_taken, std::map<std::pair<int, std::pair<uint64_t, uint64_t> >, std::pair<double, double> >& opcards, std::map<std::pair<int, std::pair<uint64_t, uint64_t> >, std::pair<double, double> >* cards_per_query);


	void parseOpt (ProblemParameters* params, double& best, double& worst, std::map<int, std::pair<int, std::bitset<MAXQUERIES> > >* actions_taken, std::map<std::pair<int, std::pair<uint64_t, uint64_t> >, std::pair<double, double> >& opcards, std::map<std::pair<int, std::pair<uint64_t, uint64_t> >, std::pair<double, double> >* cards_per_query, Loader* loader, std::map<int, std::string> parseFile);

	State* heuristicNext (ProblemParameters* params);

	void getHeuristicCost (ProblemParameters* params, double& prune, double& prune2);


	void expand (std::vector<State*>& frontier, ProblemParameters* params, std::map<std::size_t, double>& cnt, double& gbound);

	void print ();
};


struct Search {
	ProblemParameters* params;

	std::vector<State*> frontier;
	State* solution;

	Search (Schema* schema, 
		std::vector<ParsedJoin>& predicates, 
		std::vector<ExpressionWrapper>& filters, 
		int queryNum);

	void run ();

	void opt (Schema* schema, std::vector<std::pair<std::pair<int, std::bitset<MAXQUERIES> >, std::pair<std::pair<uint64_t, uint64_t>, std::pair<bool, uint64_t> > > >& mqo_join_order);

	void optSubexpr (Schema* schema, std::vector<std::pair<std::pair<int, std::bitset<MAXQUERIES> >, std::pair<std::pair<uint64_t, uint64_t>, std::pair<bool, uint64_t> > > >& mqo_join_order);

	void parseOpt (Schema* schema, std::vector<std::pair<std::pair<int, std::bitset<MAXQUERIES> >, std::pair<std::pair<uint64_t, uint64_t>, std::pair<bool, uint64_t> > > >& mqo_join_order, Loader* loader, std::map<int, std::string> parseFile);
};

#endif
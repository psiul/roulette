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

#ifndef EXECUTOR_H_
#define EXECUTOR_H_

#include "../frontend/parser.h"
#include "../frontend/schema.h"
#include "../roulette-operators/projector.h"
#include "../expressions/evaluators.h"
#include "../primitives/atomic-stack.h"
#include "../executor/graph.h"
#include "../executor/sym-join.h"
#include "../dictionary/dictionary.h"
#include "../ingestion/ingestion.h"
#include "../roulette-operators/filter.h"

#include "../utilities/common.h"
#include <numa.h>

#include <unistd.h>
#include <fcntl.h>
#include <ctime>
#include <climits>
#include <utility>

#define NUMPARTS 4096

extern int64_t intermediate_filters;
extern int64_t intermediate_enter;
extern int64_t intermediate_joins;

/*The Executor orchestrates all the steps of execution in the engine*/
struct Executor {
	int relationNum;
	std::bitset<MAXQUERIES> activeQueries;
	Schema* schema_;

	QueryState qs;

	SymmetricJoin* join;

	Ingestion** ingestion;

	Stem** hashtables_;

	std::atomic<int>* version_;
	std::atomic<int>* committed_;
	std::atomic<uint64_t>* elements_;
	int** snapshots_;

	int globalVersion_;
	std::atomic_flag* versionLock_;

	Triggers triggers[MAXQUERIES];
	int numTriggers;

	uint64_t minOffset[MAXQUERIES];

	int* tupleSize;

	bool* done;

	QLearningSelection* qSelect[MAXRELATIONS];

	int filterCostArray[128*MAXTHREADS];
	uint64_t filterSigArray[128*MAXTHREADS];
	int filterOpArray[128*MAXTHREADS];

	int filterCostAggregator;


	void finalize ();

	int getCount ();

	void reset ();

	void remap (std::map<int, int> mapping);

	void print ();

	void clearTimer ();

	void mergeInto (Executor* ctx);

	void orderInputs (int* ordering);


	DataBlock* applyFilters(DataBlock* data, int i, int threadId);

	int buildCommit (DataBlock* data, int i, int threadId);

	void execute (int threadId, bool alwaysOn);
};

#endif

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

#ifndef QLEARNING_H_
#define QLEARNING_H_

#include "../utilities/common.h"
#include "../frontend/schema.h"
#include "../executor/graph.h"

#include <shared_mutex>
#include <atomic>
#include <cassert>
#include <bitset>
#include <stdint.h>

#include "../primitives/ht-bucket.h"


struct SelectivityJoin {
	std::atomic<uint64_t>* probesum;
	std::atomic<uint64_t>* probesq;
	std::atomic<uint64_t>* consumed;

	SelectivityJoin (int e);

	void reset();

	void buildLattice (Graph* graph);

	int select (int* options, int optnum, uint64_t sig, std::bitset<MAXQUERIES> query, Graph* const graph, int root);

	float predict (int i, Graph* const graph);

	void record (int i, int tsp, Graph* const graph, int probeSize, int simpleSum);

	void explain (Schema* schema);
};


struct QLearningJoin {
	double gamma;
	double alpha;
	double epsilon;

	HTBuckettized1 qtable;

	std::atomic<uint64_t>* consumed;
	std::atomic<uint64_t>* produced;

	std::atomic_flag reader_lock;
	std::atomic_flag global_lock;
	int readers;


	QLearningJoin (double gamma, double alpha, double epsilon);

	void reset ();

	void buildLattice (Graph* graph);

	int select (int* options, int optnum, uint64_t sig, std::bitset<MAXQUERIES> query, Graph* const graph, int root);

	double getBestEstimate (int* options, int optnum, uint64_t sig, std::bitset<MAXQUERIES> query, Graph* const graph, int root);

	double predict (int i, uint64_t sig, std::bitset<MAXQUERIES> query, Graph* const graph, int root);

	void record (int* joinArray, uint64_t* sigArray, std::bitset<MAXQUERIES>* queryArray, int* inArray, int* outArray, int* splitArray, Graph* const graph, int step, std::bitset<MAXQUERIES> active);

	void printLattice ();

	std::string printSpanningTree (Schema* schema, int node);

	void explain (Schema* schema);
};

struct QLearningJoinHeuristic {
	double gamma;
	double alpha;
	double epsilon;

	HTBuckettized1 qtable;

	std::atomic<uint64_t>* consumed;
	std::atomic<uint64_t>* produced;

	std::atomic_flag reader_lock;
	std::atomic_flag global_lock;
	int readers;


	QLearningJoinHeuristic (double gamma, double alpha, double epsilon);

	void reset ();

	void buildLattice (Graph* graph);

	int select (int* options, int optnum, uint64_t sig, std::bitset<MAXQUERIES> query, Graph* const graph, int root, int* mode);

	double getBestEstimate (int* options, int optnum, uint64_t sig, std::bitset<MAXQUERIES> query, Graph* const graph, int root);

	double predict (int i, uint64_t sig, std::bitset<MAXQUERIES> query, Graph* const graph, int root);

	void record (int* joinArray, uint64_t* sigArray, std::bitset<MAXQUERIES>* queryArray, int* inArray, int* outArray, int* splitArray, Graph* const graph, int step, std::bitset<MAXQUERIES> active);

	void printLattice ();

	std::string printSpanningTree (Schema* schema, int node);

	void explain (Schema* schema);
};

struct QLearningSelection {
	int selectionNum;
	double gamma;
	double alpha;
	double epsilon;

	HTBuckettized1 qtable;

	std::atomic_flag reader_lock;
	std::atomic_flag global_lock;
	int readers;

	QLearningSelection (double gamma, double alpha, double epsilon);

	void reset ();

	void setSelectionNum (int selectionNum);

	int select (uint64_t sig, std::bitset<MAXQUERIES> query);

	double predict (int i, uint64_t sig, std::bitset<MAXQUERIES> query);

	void record (int* opArray, uint64_t* sigArray, int* costArray, int selectionCnt, std::bitset<MAXQUERIES> active);

	void explain (Schema* schema);
};

struct SelectivitySelection {
	int selectionNum;

	int consumed[4*MAXQUERIES];
	int produced[4*MAXQUERIES];

	SelectivitySelection ();

	void reset ();

	void setSelectionNum (int selectionNum);

	int select (uint64_t sig, uint64_t query);

	double predict (int i, uint64_t sig, uint64_t query);

	void record (int* opArray, uint64_t* sigArray, int* costArray, int selectionCnt, uint64_t active);

	void explain (Schema* schema);
};

#endif
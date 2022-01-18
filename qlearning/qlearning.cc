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

#include "qlearning.h"

SelectivityJoin::SelectivityJoin (int e) {
	probesum = new(numa_alloc_onnode(e*sizeof(std::atomic<uint64_t>), SOCKET)) std::atomic<uint64_t>[e];
	probesq = new(numa_alloc_onnode(e*sizeof(std::atomic<uint64_t>), SOCKET)) std::atomic<uint64_t>[e];
	consumed = new(numa_alloc_onnode(e*sizeof(std::atomic<uint64_t>), SOCKET)) std::atomic<uint64_t>[e];

	for (int i = 0; i < e; i++) {
		probesum[i].store(0);
		probesq[i].store(0);
		consumed[i].store(1);
	}
}

void SelectivityJoin::reset() {

}

void SelectivityJoin::buildLattice (Graph* graph) {

}

int SelectivityJoin::select (int* options, int optnum, uint64_t sig, std::bitset<MAXQUERIES> query, Graph* const graph, int root) {
	for (int i = 0; i < optnum; i++) {
		if (options[i] == -1)
			return i;
			
		int next = graph->edgeIndex_[options[i]];
		uint64_t nextsig = ((1ull) << next) | sig;

		if (sig == nextsig)
			return i;
		
		if ((query & graph->metaIndex_[options[i]].query).any() == false)
			return i;
	}

	if (rand()/((float)RAND_MAX) < 0.01) {
		return rand()%optnum;
	}

	int besti = -1;
	double bestv = 0.0;

	for (int i = 0; i < optnum; i++) {
		int queriesAfter = 1; //(query & graph->metaIndex_[options[i]].query).count();

		double newv = predict(options[i], graph)/queriesAfter;
		if (besti < 0 || newv < bestv) {
			bestv = newv;
			besti = i;
		}
	}

	return besti;
}

float SelectivityJoin::predict (int i, Graph* const graph) {
	float mean = 0.01;

	if (consumed[i] > 1) {
		mean += probesum[i]/((float) consumed[i]);
	}

	return mean;
}

void SelectivityJoin::record (int i, int tsp, Graph* const graph, int probeSize, int simpleSum) {
	consumed[i].fetch_add(probeSize);
	probesum[i].fetch_add(simpleSum);
}

void SelectivityJoin::explain (Schema* schema) {

}


QLearningJoin::QLearningJoin (double gamma, double alpha, double epsilon) : gamma(gamma), alpha(alpha), epsilon(epsilon), readers(0), qtable(true) {
	produced = new(numa_alloc_onnode(MAXOPS*sizeof(std::atomic<uint64_t>), SOCKET)) std::atomic<uint64_t>[MAXOPS];
	consumed = new(numa_alloc_onnode(MAXOPS*sizeof(std::atomic<uint64_t>), SOCKET)) std::atomic<uint64_t>[MAXOPS];

	for (int i = 0; i < MAXOPS; i++) {
		produced[i].store(0);
		consumed[i].store(1);
	}

	reader_lock.clear();
	global_lock.clear();
}

void QLearningJoin::reset () {
	for (int i = 0; i < MAXOPS; i++) {
		produced[i].store(0);
		consumed[i].store(1);
	}

	qtable.reset();

	reader_lock.clear();
	global_lock.clear();
}

void QLearningJoin::buildLattice (Graph* graph) {

}

int QLearningJoin::select (int* options, int optnum, uint64_t sig, std::bitset<MAXQUERIES> query, Graph* const graph, int root) {
	for (int i = 0; i < optnum; i++) {
		if (options[i] == -1) {
			return i;
		}
			
		int next = graph->edgeIndex_[options[i]];
		uint64_t nextsig = ((1ull) << next) | sig;

		if (sig == nextsig) {
			return i;
		}
	}

	if (rand()/((float)RAND_MAX) < epsilon) {
		return rand()%optnum;
	}

	int besti = -1;
	double bestv = 0.0;
	double bestsel = 0.0;

	double mindiff = 0.001;

	while (reader_lock.test_and_set(std::memory_order_acquire));

	if (readers == 0) {
		while (global_lock.test_and_set(std::memory_order_acquire));
	}

	readers++;
	reader_lock.clear(std::memory_order_release);

	//for (int i = 0; i < optnum; i++) {
	for (int i = optnum-1; i > -1; i--) {
		double newv = predict(options[i], sig, query, graph, root);

		if (besti < 0 || newv < bestv/* || (fabs(newv-bestv) < mindiff && newsel < bestsel)*/) {
			bestv = newv;
			besti = i;
		}
	}

	while (reader_lock.test_and_set(std::memory_order_acquire));

	readers--;

	if (readers == 0) {
		global_lock.clear(std::memory_order_release);
	}

	reader_lock.clear(std::memory_order_release);

	return besti;
}

double QLearningJoin::getBestEstimate (int* options, int optnum, uint64_t sig, std::bitset<MAXQUERIES> query, Graph* const graph, int root) {
	for (int i = 0; i < optnum; i++) {
		if (options[i] == -1) {
			return -1.0;
		}
			
		int next = graph->edgeIndex_[options[i]];
		uint64_t nextsig = ((1ull) << next) | sig;

		if (sig == nextsig) {
			return -1.0;
		}
	}

	int besti = -1;
	double bestv = 0.0;
	double bestsel = 0.0;

	double mindiff = 0.001;

	while (reader_lock.test_and_set(std::memory_order_acquire));

	if (readers == 0) {
		while (global_lock.test_and_set(std::memory_order_acquire));
	}

	readers++;
	reader_lock.clear(std::memory_order_release);

	//for (int i = 0; i < optnum; i++) {
	for (int i = optnum-1; i > -1; i--) {
		double newv = predict(options[i], sig, query, graph, root);

		if (besti < 0 || newv < bestv/* || (fabs(newv-bestv) < mindiff && newsel < bestsel)*/) {
			bestv = newv;
			besti = i;
		}
	}

	while (reader_lock.test_and_set(std::memory_order_acquire));

	readers--;

	if (readers == 0) {
		global_lock.clear(std::memory_order_release);
	}

	reader_lock.clear(std::memory_order_release);

	return bestv;
}


double QLearningJoin::predict (int i, uint64_t sig, std::bitset<MAXQUERIES> query, Graph* const graph, int root) {
	//return rand()/((float) RAND_MAX);
	uint64_t next = graph->edgeIndex_[i];
	uint64_t nextsig = ((1ull) << next) | sig;

	if (sig == nextsig)
		return 0.0;

	int key = graph->metaIndex_[i].keyBuild;

	double qval = qtable.lookup1(query, sig, key);

	return 0.001-qval;
}

void QLearningJoin::record (int* joinArray, uint64_t* sigArray, std::bitset<MAXQUERIES>* queryArray, int* inArray, int* outArray, int* splitArray, Graph* const graph, int step, std::bitset<MAXQUERIES> active) {
	while (global_lock.test_and_set(std::memory_order_acquire));

	for (int i = step-1; i >= 0; i--) { 
		double future = 0.0;
		double reward = -38.57945898;

		int curJoin = joinArray[i];
		uint64_t curSig = sigArray[i];
		std::bitset<MAXQUERIES> curQuery = queryArray[i];
		int curKey = graph->metaIndex_[curJoin].keyBuild;
		std::bitset<MAXQUERIES> joinMask = (graph->metaIndex_[curJoin].query);

		assert(curJoin < MAXOPS);
		consumed[curJoin].fetch_add(inArray[i]);
		produced[curJoin].fetch_add(outArray[i]);

		std::bitset<MAXQUERIES> nextQuery1 = curQuery & joinMask;

		if (nextQuery1.any()) {
			double ratio = outArray[i]/((float) inArray[i]);
			reward -= ratio*43.29155004;

			uint64_t nextSig = ((1ull) << graph->edgeIndex_[curJoin]) | curSig;

			bool init = false;
			double bestpath = 0.0;

			uint64_t sigit = nextSig;

			while (sigit != 0) {
				int offset = __builtin_ctzll(sigit);
				for (int k = graph->nodeIndex_[offset]; k < graph->nodeIndex_[offset+1]; k++) {
					if (((1ull) << graph->edgeIndex_[k]) & nextSig)
						continue;

					if ((graph->metaIndex_[k].query & nextQuery1).any() == false)
						continue;

					int edge = k;
					int key = graph->metaIndex_[edge].keyBuild;

					double qval = qtable.lookup1(nextQuery1, nextSig, key);
			
					if (!init || bestpath < qval) {
						bestpath = qval;
						init = true;
					}
				}

				sigit &= (sigit-1);
			}

			future += ratio*bestpath;
		}

		std::bitset<MAXQUERIES> nextQuery2 = curQuery & (~joinMask);

		if (nextQuery2.any()) {
			double ratio = splitArray[i]/((float) inArray[i]);
			reward -= 3.597;
			reward -= 0.923*ratio;

			bool init = false;
			double bestpath = 0.0;
				
			uint64_t sigit = curSig;

			while (sigit != 0) {
				int offset = __builtin_ctzll(sigit);
				for (int k = graph->nodeIndex_[offset]; k < graph->nodeIndex_[offset+1]; k++) {
					if (((1ull) << graph->edgeIndex_[k]) & curSig)
						continue;

					if ((graph->metaIndex_[k].query & nextQuery2).any() == false)
						continue;

					int edge = k;
					int key = graph->metaIndex_[edge].keyBuild;

					double qval = qtable.lookup1(nextQuery2, curSig, key);

					if (!init || bestpath < qval) {
						bestpath = qval;
						init = true;
					}
				}

				sigit &= (sigit-1);
			}

			future += ratio*bestpath;
		}
		
		qtable.update1(curQuery, curSig, curKey, active, alpha, reward + gamma*future);
	}

	global_lock.clear(std::memory_order_release);
}

void QLearningJoin::printLattice () {

}

std::string QLearningJoin::printSpanningTree (Schema* schema, int node) {
	for (int i = 0; i < MAXRELATIONS; i++)
		if (node & (1 << i)) {
			std::cout << schema->getTableString(i) << "|";
		}
	std::string s("");
	return s;
}

void QLearningJoin::explain (Schema* schema) {
		/*for (std::map<uint64_t, std::map<int, double>* >::iterator it = qfunction.begin(); it != qfunction.end(); ++it) {
			std::map<int, double>* innerMap = it->second;

			std::cout << "Query: " << it->first/(1 << MAXRELATIONS) << " Node: " << printSpanningTree(schema, it->first%(1 << MAXRELATIONS)) << std::endl;

			for (std::map<int, double>::iterator it2 = innerMap->begin(); it2 != innerMap->end(); it2++) {
				std::cout << schema->getColumnString(it2->first) << ":" << it2->second << " ";
			}
			std::cout << std::endl;
		}*/

	for (int i = 0; i < schema->getTableNumber(); i++) {
		std::cout << i << " " << schema->getTableString(i) << std::endl;
	}
}

QLearningJoinHeuristic::QLearningJoinHeuristic (double gamma, double alpha, double epsilon) : gamma(gamma), alpha(alpha), epsilon(epsilon), readers(0), qtable(true) {
	produced = new(numa_alloc_onnode(MAXOPS*sizeof(std::atomic<uint64_t>), SOCKET)) std::atomic<uint64_t>[MAXOPS];
	consumed = new(numa_alloc_onnode(MAXOPS*sizeof(std::atomic<uint64_t>), SOCKET)) std::atomic<uint64_t>[MAXOPS];

	for (int i = 0; i < MAXOPS; i++) {
		produced[i].store(0);
		consumed[i].store(1);
	}

	reader_lock.clear();
	global_lock.clear();
}

void QLearningJoinHeuristic::reset () {
	for (int i = 0; i < MAXOPS; i++) {
		produced[i].store(0);
		consumed[i].store(1);
	}

	qtable.reset();

	reader_lock.clear();
	global_lock.clear();
}

void QLearningJoinHeuristic::buildLattice (Graph* graph) {

}

int QLearningJoinHeuristic::select (int* options, int optnum, uint64_t sig, std::bitset<MAXQUERIES> query, Graph* const graph, int root, int* mode) {
	for (int i = 0; i < optnum; i++) {
		if (options[i] == -1) {
			return i;
		}
			
		int next = graph->edgeIndex_[options[i]];
		uint64_t nextsig = ((1ull) << next) | sig;

		if (sig == nextsig) {
			return i;
		}
	}

	//if (*mode && rand()/((float)RAND_MAX) < epsilon) {
	//	*mode += 1;
	//	return rand()%optnum;
	//}

	int besti = -1;
	double bestv = 0.0;
	double bestsel = 0.0;

	double mindiff = 0.001;

	while (reader_lock.test_and_set(std::memory_order_acquire));

	if (readers == 0) {
		while (global_lock.test_and_set(std::memory_order_acquire));
	}

	readers++;
	reader_lock.clear(std::memory_order_release);

	//for (int i = 0; i < optnum; i++) {
	bool newstate = true;

	for (int i = optnum-1; i > -1; i--) {
		double newv = predict(options[i], sig, query, graph, root);

		if (newv < 0.0) newv = 0.0;
		else newstate = false;

		if (besti < 0 || newv < bestv) {
			bestv = newv;
			besti = i;
		}
	}

	if (predict(options[besti], sig, query, graph, root) < 0.0) {
		*mode += 1;
	}

	if (newstate) {
			besti = -1;
			bestv = 0.0;

			for (int i = 0; i < optnum; i++) {
				int queriesAfter = (query & graph->metaIndex_[options[i]].query).count();

				double newv = produced[options[i]]/((double) consumed[options[i]])/queriesAfter;
				if (besti < 0 || newv < bestv) {
					bestv = newv;
					besti = i;
				}
			}
	}

	while (reader_lock.test_and_set(std::memory_order_acquire));

	readers--;

	if (readers == 0) {
		global_lock.clear(std::memory_order_release);
	}

	reader_lock.clear(std::memory_order_release);

	return besti;
}

double QLearningJoinHeuristic::getBestEstimate (int* options, int optnum, uint64_t sig, std::bitset<MAXQUERIES> query, Graph* const graph, int root) {
	for (int i = 0; i < optnum; i++) {
		if (options[i] == -1) {
			return -1.0;
		}
			
		int next = graph->edgeIndex_[options[i]];
		uint64_t nextsig = ((1ull) << next) | sig;

		if (sig == nextsig) {
			return -1.0;
		}
	}

	int besti = -1;
	double bestv = 0.0;
	double bestsel = 0.0;

	double mindiff = 0.001;

	while (reader_lock.test_and_set(std::memory_order_acquire));

	if (readers == 0) {
		while (global_lock.test_and_set(std::memory_order_acquire));
	}

	readers++;
	reader_lock.clear(std::memory_order_release);

	//for (int i = 0; i < optnum; i++) {
	for (int i = optnum-1; i > -1; i--) {
		double newv = predict(options[i], sig, query, graph, root);

		if (newv < 0.0) newv = 0.0;

		if (besti < 0 || newv < bestv/* || (fabs(newv-bestv) < mindiff && newsel < bestsel)*/) {
			bestv = newv;
			besti = i;
		}
	}

	while (reader_lock.test_and_set(std::memory_order_acquire));

	readers--;

	if (readers == 0) {
		global_lock.clear(std::memory_order_release);
	}

	reader_lock.clear(std::memory_order_release);

	return bestv;
}


double QLearningJoinHeuristic::predict (int i, uint64_t sig, std::bitset<MAXQUERIES> query, Graph* const graph, int root) {
	//return rand()/((float) RAND_MAX);
	uint64_t next = graph->edgeIndex_[i];
	uint64_t nextsig = ((1ull) << next) | sig;

	if (sig == nextsig)
		return 0.0;

	int key = graph->metaIndex_[i].keyBuild;

	double qval = qtable.lookup1(query, sig, key);

	return 0.001-qval;
}

void QLearningJoinHeuristic::record (int* joinArray, uint64_t* sigArray, std::bitset<MAXQUERIES>* queryArray, int* inArray, int* outArray, int* splitArray, Graph* const graph, int step, std::bitset<MAXQUERIES> active) {
	while (global_lock.test_and_set(std::memory_order_acquire));

	for (int i = step-1; i >= 0; i--) { 
		double future = 0.0;
		double reward = 0.0;

		int curJoin = joinArray[i];
		uint64_t curSig = sigArray[i];
		std::bitset<MAXQUERIES> curQuery = queryArray[i];
		int curKey = graph->metaIndex_[curJoin].keyBuild;
		std::bitset<MAXQUERIES> joinMask = (graph->metaIndex_[curJoin].query);

		assert(curJoin < MAXOPS);
		consumed[curJoin].fetch_add(inArray[i]);
		produced[curJoin].fetch_add(outArray[i]);

		std::bitset<MAXQUERIES> nextQuery1 = curQuery & joinMask;

		if (nextQuery1.any()) {
			double ratio = outArray[i]/((float) inArray[i]);
			reward -= ratio;

			uint64_t nextSig = ((1ull) << graph->edgeIndex_[curJoin]) | curSig;

			bool init = false;
			double bestpath = 0.0;

			uint64_t sigit = nextSig;

			while (sigit != 0) {
				int offset = __builtin_ctzll(sigit);
				for (int k = graph->nodeIndex_[offset]; k < graph->nodeIndex_[offset+1]; k++) {
					if (((1ull) << graph->edgeIndex_[k]) & nextSig)
						continue;

					if ((graph->metaIndex_[k].query & nextQuery1).any() == false)
						continue;

					int edge = k;
					int key = graph->metaIndex_[edge].keyBuild;

					double qval = qtable.lookup1(nextQuery1, nextSig, key);
					if (qval >= 0.0) qval = 0.0;
			
					if (!init || bestpath < qval) {
						bestpath = qval;
						init = true;
					}
				}

				sigit &= (sigit-1);
			}

			future += ratio*bestpath;
		}

		std::bitset<MAXQUERIES> nextQuery2 = curQuery & (~joinMask);

		if (nextQuery2.any()) {
			double ratio = splitArray[i]/((float) inArray[i]);
			reward -= 0.0*ratio;

			bool init = false;
			double bestpath = 0.0;
				
			uint64_t sigit = curSig;

			while (sigit != 0) {
				int offset = __builtin_ctzll(sigit);
				for (int k = graph->nodeIndex_[offset]; k < graph->nodeIndex_[offset+1]; k++) {
					if (((1ull) << graph->edgeIndex_[k]) & curSig)
						continue;

					if ((graph->metaIndex_[k].query & nextQuery2).any() == false)
						continue;

					int edge = k;
					int key = graph->metaIndex_[edge].keyBuild;

					double qval = qtable.lookup1(nextQuery2, curSig, key);
					if (qval >= 0.0) qval = 0.0;

					if (!init || bestpath < qval) {
						bestpath = qval;
						init = true;
					}
				}

				sigit &= (sigit-1);
			}

			future += ratio*bestpath;
		}
		
		qtable.update1(curQuery, curSig, curKey, active, alpha, reward + gamma*future);
	}

	global_lock.clear(std::memory_order_release);
}

void QLearningJoinHeuristic::printLattice () {

}

std::string QLearningJoinHeuristic::printSpanningTree (Schema* schema, int node) {
	for (int i = 0; i < MAXRELATIONS; i++)
		if (node & (1 << i)) {
			std::cout << schema->getTableString(i) << "|";
		}
	std::string s("");
	return s;
}

void QLearningJoinHeuristic::explain (Schema* schema) {
		/*for (std::map<uint64_t, std::map<int, double>* >::iterator it = qfunction.begin(); it != qfunction.end(); ++it) {
			std::map<int, double>* innerMap = it->second;

			std::cout << "Query: " << it->first/(1 << MAXRELATIONS) << " Node: " << printSpanningTree(schema, it->first%(1 << MAXRELATIONS)) << std::endl;

			for (std::map<int, double>::iterator it2 = innerMap->begin(); it2 != innerMap->end(); it2++) {
				std::cout << schema->getColumnString(it2->first) << ":" << it2->second << " ";
			}
			std::cout << std::endl;
		}*/

	for (int i = 0; i < schema->getTableNumber(); i++) {
		std::cout << i << " " << schema->getTableString(i) << std::endl;
	}
}

QLearningSelection::QLearningSelection (double gamma, double alpha, double epsilon) : gamma(gamma), alpha(alpha), epsilon(epsilon), readers(0), qtable(false) {
	reader_lock.clear();
	global_lock.clear();
}

void QLearningSelection::reset () {
	qtable.reset();

	reader_lock.clear();
	global_lock.clear();

	selectionNum = 0;
}

void QLearningSelection::setSelectionNum (int selectionNum) {
	this->selectionNum = selectionNum;
	assert(selectionNum < 64);
}

int QLearningSelection::select (uint64_t sig, std::bitset<MAXQUERIES> query) {
	if (rand()/((float)RAND_MAX) < epsilon) {
		int ret = rand()%selectionNum;
		while ((sig & ((1ull) << ret)) != 0) {
			ret = (ret+1)%selectionNum;
		}
		return ret;
	}

	int besti = -1;
	double bestv = 0.0;

	while (reader_lock.test_and_set(std::memory_order_acquire));

	if (readers == 0) {
		while (global_lock.test_and_set(std::memory_order_acquire));
	}

	readers++;
	reader_lock.clear(std::memory_order_release);

	for (int i = 0; i < selectionNum; i++) {
		if ((sig & ((1ull) << i)) == 0) {
			double newv = predict(i, sig, query);
			if (besti < 0 || newv < bestv) {
				bestv = newv;
				besti = i;
			}
		}
	}

	while (reader_lock.test_and_set(std::memory_order_acquire));

	readers--;

	if (readers == 0) {
		global_lock.clear(std::memory_order_release);
	}

	reader_lock.clear(std::memory_order_release);

	return besti;
}

double QLearningSelection::predict (int i, uint64_t sig, std::bitset<MAXQUERIES> query) {
	double qval = qtable.lookup2(sig, i);

	return 0.001-qval;
}

void QLearningSelection::record (int* opArray, uint64_t* sigArray, int* costArray, int selectionCnt, std::bitset<MAXQUERIES> active) {
	while (global_lock.test_and_set(std::memory_order_acquire));

	for (int i = selectionCnt; i > 0; i--) {
		double ratio = costArray[i]/((double) costArray[i-1]);

		bool init = false;
		double bestpath = 0.0;

		uint64_t curSig = sigArray[i];
		int curOp = opArray[i];

		uint64_t nextSig = curSig | ((1ull) << curOp);

		for (int j = 0; j < selectionNum; j++) {
			if ((nextSig & ((1ull) << j)) == 0) {
				double qval = qtable.lookup2(nextSig, j);

				if (!init || qval > bestpath) {
					bestpath = qval;
				}
			}
		}

		qtable.update2(curSig, curOp, active, alpha, -9.329 -4.616*ratio + gamma*ratio*bestpath);
	}

	global_lock.clear(std::memory_order_release);
}

void QLearningSelection::explain (Schema* schema) {
		
}

SelectivitySelection::SelectivitySelection () {
	for (int i = 0; i < 32; i++) {
		consumed[i] = 1;
		produced[i] = 0;
	}
}

void SelectivitySelection::reset () { 
	for (int i = 0; i < 32; i++) {
		consumed[i] = 1;
		produced[i] = 0;
	}
}

void SelectivitySelection::setSelectionNum (int selectionNum) {
	this->selectionNum = selectionNum;
	assert(selectionNum < 32);
}

int SelectivitySelection::select (uint64_t sig, uint64_t query) {
	int besti = -1;
	double bestv = 1.5;

	for (int i = 0; i < selectionNum; i++) {
		if ((sig & ((1ull) << i)) == 0) {
			double newv = predict(i, sig, query);
			if (besti < 0 || newv < bestv) {
				bestv = newv;
				besti = i;
			}
		}
	}

	return besti;
}

double SelectivitySelection::predict (int i, uint64_t sig, uint64_t query) {
	double qval = produced[i]/((double) consumed[i]);

	return qval;
}

void SelectivitySelection::record (int* opArray, uint64_t* sigArray, int* costArray, int selectionCnt, uint64_t active) {
	for (int i = selectionCnt; i > 0; i--) {
		uint64_t curSig = sigArray[i];
		int curOp = opArray[i];

		produced[curOp] = costArray[i];
		consumed[curOp] = costArray[i-1];
		if (costArray[i-1] < costArray[i]) {
			assert(false);
		}
	}
}

void SelectivitySelection::explain (Schema* schema) {
		
}
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

#include "executor.h"

void Executor::finalize () {
	delete join;
}

int Executor::getCount () {
	return join->getCount(qs);
}

void Executor::reset () {
	activeQueries.reset();

	for (int i = 0; i < MAXQUERIES; i++) {
		(qs.aggrs)[i] = nullptr;
		minOffset[i] = INT_MAX;
	}

	for (int i = 0; i < relationNum; i++)
		(qs.filterArray)[i] = nullptr;

	(qs.projector_)->reset();
	(qs.graph)->reset();

	for (int i = 0; i < relationNum; i++) {
		ingestion[i]->reset();

		if (hashtables_[i] != nullptr) {
			hashtables_[i]->reset();
			(version_)[i].store(-1);
			(committed_)[i].store(-1);

			snapshots_[i][-1] = -1;

			for (int j = 0; j < (1 << 20); j++)
				snapshots_[i][j] = INT_MAX;
		}
	}

	(elements_)[0].store(0);
	globalVersion_ = 0;

	numTriggers = 0;

	for (int j = 0; j < MAXRELATIONS*MAXTHREADS; j++)
		done[j] = true;

	for (int i = 0; i < relationNum; i++) {
		qSelect[i]->reset();
	}


	for (int i = 0; i < MAXQUERIES; i++) {
		((qs).aggrs)[i] = nullptr;
		minOffset[i] = INT_MAX;
		(qs).postFilters[i] = nullptr;
	}

	for (int i = 0; i < relationNum; i++) {
		((qs).filterArray)[i] = nullptr;
		(qs).semijoinFilters[i].clear();
	}

	for (int i = 0; i < relationNum; i++) {
		triggers[0].queryMask[i].reset();
	}

	join->reset();

	(qs.partitioner)->reset();

	filterCostAggregator = 0;
}

void Executor::remap (std::map<int, int> mapping) {
	std::bitset<MAXQUERIES> newActiveQueries = 0;

	for (int i = 0; i < MAXQUERIES; i++) {
		if (activeQueries.test(i))
			newActiveQueries.set(mapping[i]);
	}

	activeQueries = newActiveQueries;

	qs.graph->remap(mapping);

	//remap filters
	for (int i = 0; i < relationNum; i++) {
		if (qs.filterArray[i] != nullptr) {
			for (int j = 0; j < qs.filterArray[i]->size(); j++) {
				(*qs.filterArray[i])[j]->updateQuery(mapping);
			}
		}
	}

	//remap aggrs
	for (int i = 0; i < MAXQUERIES; i++) {
		if (mapping.find(i) == mapping.end())
			continue;

		std::bitset<MAXQUERIES> newQueryMask = 0;
		newQueryMask.set(mapping[i]);

		if (qs.aggrs[i] == nullptr) {
			assert(false);
		}

		for (int j = 0; j < (qs.aggrs[i])->size(); j++) {
			(*(qs.aggrs[i]))[j]->setQuery(newQueryMask);
		}

		std::vector<Evaluator*>* tmp = qs.aggrs[i];
		qs.aggrs[i] = nullptr;
		qs.aggrs[mapping[i]] = tmp;
	}


	for (int i = 0; i < relationNum; i++) {
		if (triggers[0].queryMask[i].any()) {
			std::bitset<MAXQUERIES> newQueryMask = 0;

			for (int j = 0; j < MAXQUERIES; j++) {
				if (triggers[0].queryMask[i].test(j))
					newQueryMask.set(mapping[j]);
			}

			triggers[0].queryMask[i] = newQueryMask;
		}
	}
}

void Executor::print () {
	for (int i = 0; i < MAXQUERIES; i++) {
		if (qs.aggrs[i] != nullptr)
			for (int j = 0; j < (qs.aggrs[i])->size(); j++) {
				std::cout << i << " " << j;
				qs.aggrs[i][0][j]->print();
				std::cout << std::endl;
			}
	}
}

void Executor::clearTimer () {
	for (int i = 0; i < numTriggers; i++)
		clock_gettime(CLOCK_MONOTONIC, &(triggers[i].start));
}

void Executor::mergeInto (Executor* ctx) {
	triggers[0].done = ctx->done;
	triggers[0].activeQueries = &(ctx->activeQueries);

	triggers[0].aggrs = (ctx->qs).aggrs;
	ctx->triggers[ctx->numTriggers] = triggers[0];

	std::bitset<MAXQUERIES> newActiveQueries = ctx->activeQueries | activeQueries;

	for (int i = 0; i < MAXQUERIES; i++) {
		if (qs.aggrs[i] != nullptr) { 
			(ctx->qs).aggrs[i] = qs.aggrs[i];
		}
	}

	qs.aggrs = (ctx->qs).aggrs;

	for (int i = 0; i < relationNum; i++) {
		if ((ctx->qs).filterArray[i] != nullptr) {
			if (qs.filterArray[i] == nullptr)
				qs.filterArray[i] = new std::vector<Filter*>;

			for (int j = 0; j < (ctx->qs).filterArray[i]->size(); j++) {
				bool found = false;

				for (int k = 0; k < qs.filterArray[i]->size(); k++) {
					if (qs.filterArray[i][0][k]->getTarget() == (ctx->qs).filterArray[i][0][j]->getTarget() && qs.filterArray[i][0][k]->getTarget() != -1) {
						found = true;
						(ctx->qs).filterArray[i][0][j]->merge(qs.filterArray[i][0][k], newActiveQueries);
						(ctx->qs).filterArray[i][0][j]->mark();
					}
				}

				if (!found) {
					qs.filterArray[i]->push_back((*(ctx->qs).filterArray[i])[j]);
				}
			}				
		}
	}

	for (int i = 0; i < relationNum; i++) {
		for (int j = 0; j < (ctx->qs).semijoinFilters[i].size(); j++) {
			bool found = false;

			for (int k = 0; k < qs.semijoinFilters[i].size(); k++) {
				if (qs.semijoinFilters[i][k]->getJoinID() == (ctx->qs).semijoinFilters[i][j]->getJoinID()) {
					qs.semijoinFilters[i][k]->addQuery((ctx->qs).semijoinFilters[i][j]->getQuery());
					found = true;
				}
			}

			if (!found)
				qs.semijoinFilters[i].push_back((ctx->qs).semijoinFilters[i][j]);
		}
	}

	(qs.projector_)->merge((ctx->qs).projector_);
	(qs.graph)->merge((ctx->qs).graph);
		
	for (int i = 0; i < relationNum; i++) {
		if (qs.filterArray[i] != nullptr) {
 			qSelect[i]->setSelectionNum(qs.filterArray[i]->size());
		} else {
			qSelect[i]->setSelectionNum(0);
		}
	}

	qs.partitioner = (ctx->qs).partitioner;

	QueryState tmp = ctx->qs;
	while (__atomic_compare_exchange(&(ctx->qs), &tmp, &qs, false, __ATOMIC_ACQ_REL, __ATOMIC_RELAXED) == false);

	ctx->activeQueries |= activeQueries;

	clock_gettime(CLOCK_MONOTONIC, &((ctx->triggers[ctx->numTriggers]).start));
		
	for (int j = 0; j < relationNum; j++) {
		if ((ctx->triggers[ctx->numTriggers]).predecessors[j] == 0) {
			ctx->ingestion[j]->registerScan((ctx->triggers[ctx->numTriggers]).queryMask[j], &(ctx->triggers[ctx->numTriggers]), 
									((ctx->triggers[ctx->numTriggers]).queryMask[j] == 0));
		}
	}

	(ctx->numTriggers)++;

	/*take offset at time of registration = underestimate but cheap*/
	std::bitset<MAXQUERIES> queries = activeQueries;
	uint64_t maxCommitted = ctx->elements_[1];

	for (int j = 0; j < MAXQUERIES; j++) {
		if ((queries.test(j)) && maxCommitted < ctx->minOffset[j])
			ctx->minOffset[j] = maxCommitted;
	}
}

/*apply input ordering*/
void Executor::orderInputs (int* ordering) {
	triggers[0].counter = (std::atomic<int>*) numa_alloc_onnode(sizeof(std::atomic<int>), SOCKET);
	triggers[0].threadMask = (std::atomic<uint64_t>*) numa_alloc_onnode(relationNum*sizeof(std::atomic<uint64_t>), SOCKET);
	triggers[0].successorOffsets = (int*) numa_alloc_onnode((relationNum+1)*sizeof(int), SOCKET);
	triggers[0].predecessors = (std::atomic<int>*) numa_alloc_onnode(relationNum*sizeof(std::atomic<int>), SOCKET);

	std::map<int, int> orderings;

	for (int i = 0; i < relationNum; i++) {
		(triggers[0].threadMask)[i].store(0);
		(triggers[0].predecessors)[i].store(0);

		orderings[ordering[i]] = 0;;
	}

	int cnt = -1;

	for (std::map<int, int>::iterator it = orderings.begin(); it != orderings.end(); ++it) {
		it->second = cnt;
		cnt++;
	}

	for (int i = 0; i < relationNum; i++) {
		ordering[i] = orderings[ordering[i]];
	}

	for (int i = 0; i < relationNum; i++) {
		for (int j = 0; j < relationNum; j++) {
			if (ordering[i] + 1 == ordering[j]) {
				((triggers[0].predecessors)[j]).fetch_add(1);
				((triggers[0].successorOffsets)[i])++;
			}
		}
	}

	int sum = 0;
	for (int i = 0; i < relationNum; i++) {
		sum += (triggers[0].successorOffsets)[i];
		(triggers[0].successorOffsets)[i] = sum;
	}

	triggers[0].successors = (int*) numa_alloc_onnode(sum*sizeof(int), SOCKET);

	for (int i = 0; i < relationNum; i++) {
		for (int j = 0; j < relationNum; j++) {
			if (ordering[i] + 1 == ordering[j]) {
				((triggers[0].successorOffsets)[i])--;
				(triggers[0].successors)[(triggers[0].successorOffsets)[i]] = j;
			}
		}
	}

	(triggers[0].successorOffsets)[relationNum] = sum;

	triggers[0].done = done;

	triggers[0].counter->store(0);
	triggers[0].activeQueries = &activeQueries;
	triggers[0].aggrs = qs.aggrs;
}


DataBlock* Executor::applyFilters(DataBlock* data, int i, int threadId) {
	bool init = false;
	std::bitset<MAXQUERIES> * pred;

	data->initFlag = false;

	std::bitset<MAXQUERIES>  query = data->getQuery();

	if (qs.filterArray[i] != nullptr) {
		filterCostArray[threadId*128+0] = data->getSize();
		filterSigArray[threadId*128+0] = 0;
		filterOpArray[threadId*128+0] = -1;

		uint64_t sig = 0;
		int filterCnt = 0;

		for (int curFilter = 0; curFilter < qs.filterArray[i]->size(); curFilter++) {
			filterCostAggregator += data->getSize();

			uint64_t next = qSelect[i]->select(sig, query);

			pred = (std::bitset<MAXQUERIES> *) (*(qs.filterArray[i]))[next]->apply(data, threadId);

			if (pred != nullptr) {
				if (init) {
					data->filterAnd(pred);
				} else {
					data->filter(pred);
				}
					
				init = true;
				data->initFlag = true;
			}

			assert(curFilter+1 < 128);

			filterCostArray[threadId*128+curFilter+1] = data->getSize();
			filterSigArray[threadId*128+curFilter+1] = sig;
			filterOpArray[threadId*128+curFilter+1] = next;

			filterCnt++;
			sig = sig | ((1ull) << next);

			if (data->getSize() == 0)
				break;
		}

		qSelect[i]->record(filterOpArray+threadId*128, filterSigArray+threadId*128, filterCostArray+threadId*128, filterCnt, activeQueries);
	}
		

	if (!init) {
		data->filterTrue();
		data->initFlag = true;
	}

	return data;
}

int Executor::buildCommit (DataBlock* data, int i, int threadId) {
	/*Stem-local version*/
	int nextVersion = (version_)[i].fetch_add(1)+1;
	uint64_t offset = (elements_)[0].fetch_add(data->getSize()*(tupleSize)[i]);

	if (hashtables_[i] != nullptr)
		(hashtables_)[i]->build(data, nextVersion, offset, threadId, activeQueries);

	int expected = nextVersion-1;

	/*get global version*/
	while (versionLock_->test_and_set(std::memory_order_acquire));
	int snapshot = globalVersion_;
	(snapshots_)[i][nextVersion] = snapshot;
	globalVersion_ = snapshot + 1;
	if (offset + data->getSize()*tupleSize[i] > elements_[1])
		elements_[1] = offset + data->getSize()*tupleSize[i];
	versionLock_->clear(std::memory_order_release);

	return snapshot;
}

void Executor::execute (int threadId, bool alwaysOn) {
	int sum = 0;
	int cnt = 0;

	filterCostAggregator = 0;

	int rotate = 0;

	int checkpoint = 0;

	bool printed = true;

	int episodeId = 0;

	while (true) {
		bool active = false;

		int besti = -1;
		float bestv = -1.0;

		/*pick the next relation in a round-robin way*/
		for (int j = 0; j < relationNum; j++) {
			int next = ((rotate++)&((1 << 30)-1))%relationNum;
			assert(next >= 0);
			if (!done[MAXRELATIONS*threadId + next]) {
				besti = next;
				active = true;
				printed = false;
				break;
			}
		}


		int i = besti;

		if (besti >= 0) {
			/*ingest next vector*/
			DataBlock* data = (done[MAXRELATIONS*threadId + i]) ? nullptr : ingestion[i]->getNext(threadId);

			if (data != nullptr) {
				checkpoint++;

				data->setTrait(0);

				/*selection phase*/
				data = applyFilters(data, i, threadId);
				sum += data->getSize();

				/*build and get versioning timestamp*/
				int snapshot = buildCommit(data, i, threadId);

				/*symmetric join*/
				join->execute(data, qs, i, snapshot, threadId, activeQueries, episodeId);

				episodeId++;
			}
		}

		/*all queries are done - print results*/
		if (activeQueries.any() == false && !printed) {
			intermediate_joins = join->counter_[0];
			intermediate_enter = sum;
			intermediate_filters = filterCostAggregator;


			printed = true;

			if (alwaysOn == false)
				break;
		}
	}

	(qs.partitioner)->flush();
}
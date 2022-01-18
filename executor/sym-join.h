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

#ifndef SYMJOIN_H_
#define SYMJOIN_H_

#define BORDER_SIZE_ ((1 << 10))
#define CHECKPOINTS_ (MAXQUERIES)
#define MAXRESULTSIZE (1024*8)

#include "../utilities/common.h"
#include "graph.h"
#include "../roulette-operators/filter.h"
#include "../roulette-operators/projector.h"
#include "../roulette-operators/partitioner.h"

#include <cassert>
#include <iostream>
#include <cmath>

#include "../qlearning/qlearning.h"

struct PostFilterWrapper {
	Evaluator* expr;
	std::bitset<MAXQUERIES> queries;
	uint64_t tables;
};

struct QueryState {
	Graph* graph;
	Projector* projector_;
	std::vector<Filter*>** filterArray;
	std::vector<JoinFilter*>* semijoinFilters;
	std::vector<Evaluator*>** aggrs;
	std::vector<PostFilterWrapper>** postFilters;
	Partitioner* partitioner;
};

struct SymmetricJoin {
	uint64_t* visited_;
	int* border_;
	int* meta_;
	float* est_;

	DataBlock** pending_;
	DataBlock** results_;

	AtomicStack<DataBlock>* dallocator;

	//SelectivityJoin* estimator;
	QLearningJoin* estimator;

	int timestamp_[MAXTHREADS*32];

	int pendingNum_[CHECKPOINTS_*MAXTHREADS];
	int border_size_[CHECKPOINTS_*MAXTHREADS];

	std::atomic<uint64_t> counter_[MAXQUERIES];
	std::atomic_flag* dallocator_lock_;

	std::atomic_flag probe_lock_;

	void* bufs[2*MAXTHREADS];

	void* bufferBatch[MAXTHREADS*BUFFER_BATCH_SIZE];
	int bufferBatchRemaining[MAXTHREADS*16];

	DataBlock* blockBatch[MAXTHREADS*BUFFER_BATCH_SIZE];
	int blockBatchRemaining[MAXTHREADS*16];

	int* inArray;
	int* outArray;
	int* splitArray;
	int* joinArray;
	uint64_t* sigArray;
	std::bitset<MAXQUERIES>* queryArray;

	int* step;

	int outputCnt[MAXRELATIONS];
	int inputCnt[MAXRELATIONS];
	int costCnt[MAXRELATIONS];

	int lastOutputCnt;
	int lastCostCnt;

	int forks;

	FILE* joinLog;

public:
	SymmetricJoin (int e, AtomicStack<DataBlock>* dallocator, std::atomic_flag* dallocator_lock) : dallocator(dallocator), dallocator_lock_(dallocator_lock) {
		probe_lock_.clear();
		dallocator_lock_->clear(std::memory_order_release);

		visited_ = new((numa_alloc_onnode(CHECKPOINTS_*MAXTHREADS*sizeof(uint64_t), SOCKET))) uint64_t[CHECKPOINTS_*MAXTHREADS];
		border_ = new(numa_alloc_onnode(BORDER_SIZE_*CHECKPOINTS_*MAXTHREADS*sizeof(int), SOCKET)) int[BORDER_SIZE_*CHECKPOINTS_*MAXTHREADS];
		meta_ = new(numa_alloc_onnode(BORDER_SIZE_*CHECKPOINTS_*MAXTHREADS*sizeof(int), SOCKET)) int[BORDER_SIZE_*CHECKPOINTS_*MAXTHREADS];
		est_ = new(numa_alloc_onnode(BORDER_SIZE_*CHECKPOINTS_*MAXTHREADS*sizeof(float), SOCKET)) float[BORDER_SIZE_*CHECKPOINTS_*MAXTHREADS];

		pending_ = new((numa_alloc_onnode(MAXRESULTSIZE*CHECKPOINTS_*MAXTHREADS*sizeof(DataBlock*), SOCKET))) DataBlock*[MAXRESULTSIZE*CHECKPOINTS_*MAXTHREADS];
		results_ = new((numa_alloc_onnode(MAXRESULTSIZE*CHECKPOINTS_*MAXTHREADS*sizeof(DataBlock*), SOCKET))) DataBlock*[MAXRESULTSIZE*CHECKPOINTS_*MAXTHREADS];

		estimator = new(numa_alloc_onnode(sizeof(QLearningJoin), SOCKET)) QLearningJoin(1.0, 0.21, 0.008);
		//estimator = new(numa_alloc_onnode(sizeof(SelectivityJoin), SOCKET)) SelectivityJoin(e);
		inArray = (int*) numa_alloc_onnode(MAXQUERIES*MAXRELATIONS*MAXTHREADS*sizeof(int), SOCKET);
		outArray = (int*) numa_alloc_onnode(MAXQUERIES*MAXRELATIONS*MAXTHREADS*sizeof(int), SOCKET);
		splitArray = (int*) numa_alloc_onnode(MAXQUERIES*MAXRELATIONS*MAXTHREADS*sizeof(int), SOCKET);
		joinArray = (int*) numa_alloc_onnode(MAXQUERIES*MAXRELATIONS*MAXTHREADS*sizeof(int), SOCKET);
		sigArray = (uint64_t*) numa_alloc_onnode(MAXQUERIES*MAXRELATIONS*MAXTHREADS*sizeof(uint64_t), SOCKET);
		queryArray = (std::bitset<MAXQUERIES>*) numa_alloc_onnode(MAXQUERIES*MAXRELATIONS*MAXTHREADS*sizeof(std::bitset<MAXQUERIES>), SOCKET);

		step = (int*) numa_alloc_onnode((MAXQUERIES+1)*MAXTHREADS*sizeof(int), SOCKET);

		for (int i = 0; i < MAXRELATIONS; i++) {
			outputCnt[i] = 0;
			inputCnt[i] = 0;
			costCnt[i] = 0;
		}

		for (int i = 0; i < CHECKPOINTS_*MAXTHREADS; i++)
			visited_[i] = 0;

		for (int i = 0; i < MAXTHREADS*32; i++)
			timestamp_[i] = 0;

		for (int i = 0; i < MAXQUERIES; i++)
			counter_[i].store(0);

		for (int i = 0; i < 2*MAXTHREADS; i++)
			bufs[i] = numa_alloc_onnode((1 << 16), SOCKET);

		for (int i = 0; i < MAXTHREADS; i++) {
			bufferBatchRemaining[i*16] = 0;
			blockBatchRemaining[i*16] = 0;
		}

		lastOutputCnt = 0;
		lastCostCnt = 0;
		forks = 0;

		#ifdef EPISODE_LOGGING

		joinLog = fopen("join-log.csv", "w");

		#endif
	}

	~SymmetricJoin () {
		#ifdef EPISODE_LOGGING

		fclose(joinLog);

		#endif
	}

	void reset () {
		for (int i = 0; i < CHECKPOINTS_*MAXTHREADS; i++)
			visited_[i] = 0;

		for (int i = 0; i < MAXTHREADS*32; i++)
			timestamp_[i] = 0;

		for (int i = 0; i < MAXQUERIES; i++)
			counter_[i].store(0);

		for (int i = 0; i < MAXRELATIONS; i++) {
			outputCnt[i] = 0;
			inputCnt[i] = 0;
			costCnt[i] = 0;
		}

		estimator->reset();

		lastOutputCnt = 0;
		lastCostCnt = 0;
		forks = 0;
	}

	int getCount (QueryState& qs) {
		std::vector<Evaluator*>** const aggrs = qs.aggrs;

		for (int i = 0; i < MAXQUERIES; i++)
			std::cout << counter_[i] << " ";
		std::cout << std::endl;

		for (int i = 0; i < MAXQUERIES; i++) {
			if (aggrs[i] == nullptr) {
				continue;
			}
		}

		return forks;
	}

	void garbageCollect (DataBlock** threadPending, int frame, int framePendingNum, int threadId) {
		for (int i = 0; i < framePendingNum; i++) {
			if (bufferBatchRemaining[threadId*16] == BUFFER_BATCH_SIZE) {
				threadPending[MAXRESULTSIZE*frame + i]->getSchema()->getBufferManager()->freeBufferN(&bufferBatch[threadId*BUFFER_BATCH_SIZE], BUFFER_BATCH_SIZE);
				bufferBatchRemaining[threadId*16] = 0;
			}

			bufferBatch[threadId*BUFFER_BATCH_SIZE + bufferBatchRemaining[threadId*16]] = (void*) threadPending[MAXRESULTSIZE*frame + i]->getMask();
			bufferBatch[threadId*BUFFER_BATCH_SIZE + bufferBatchRemaining[threadId*16] + 1] = (void*) threadPending[MAXRESULTSIZE*frame + i]->getVIDSAll();

			bufferBatchRemaining[threadId*16] += 2;

			if (blockBatchRemaining[threadId*16] == BUFFER_BATCH_SIZE) {
				while(dallocator_lock_->test_and_set(std::memory_order_acquire));
				dallocator->pushN(&blockBatch[threadId*BUFFER_BATCH_SIZE], BUFFER_BATCH_SIZE);
				dallocator_lock_->clear(std::memory_order_release);
				blockBatchRemaining[threadId*16] = 0;
			}

			blockBatch[threadId*BUFFER_BATCH_SIZE + blockBatchRemaining[threadId*16]] = threadPending[MAXRESULTSIZE*frame + i];
			blockBatchRemaining[threadId*16] += 1;
		}
	}

	void aggregate (Partitioner* partitioner, std::vector<Evaluator*>** const aggrs, std::vector<PostFilterWrapper>** const postfilters, DataBlock** threadPending, int frame, int framePendingNum, int threadId) {
		partitioner->partition(&threadPending[MAXRESULTSIZE*frame], framePendingNum, threadId);
	}

	void snapshot (int* pendingNum_, int* border_size_, uint64_t* visited_, DataBlock** threadPending, int* threadBorder, int* threadMeta, float* threadEst, int frameBorderSize, int framePendingNum, int resultsNum_, int curStep, int frame, int threadId) {
		border_size_[threadId*CHECKPOINTS_+frame] = frameBorderSize;
		pendingNum_[threadId*CHECKPOINTS_+frame] = framePendingNum;

		border_size_[threadId*CHECKPOINTS_+frame+1] = frameBorderSize;
		pendingNum_[threadId*CHECKPOINTS_+frame+1] = resultsNum_;

		visited_[CHECKPOINTS_*threadId+frame+1] = visited_[CHECKPOINTS_*threadId+frame];

		for (int i = 0; i < frameBorderSize; i++) {
			threadBorder[BORDER_SIZE_*(frame+1) + i] = threadBorder[BORDER_SIZE_*frame + i];
			threadMeta[BORDER_SIZE_*(frame+1) + i] = threadMeta[BORDER_SIZE_*frame + i];
			threadEst[BORDER_SIZE_*(frame+1) + i] = threadEst[BORDER_SIZE_*frame + i];
		}

		for (int i = 0; i < framePendingNum; i++) {
			threadPending[MAXRESULTSIZE*(frame+1) + i] = threadPending[MAXRESULTSIZE*frame + i];
		}

		forks += threadPending[MAXRESULTSIZE*frame]->getSize();
	}

	int selectBest (Graph* const graph, int* threadBorder, int* threadMeta, float* threadEst, int frame, int frameBorderSize, std::bitset<MAXQUERIES>& queryMask, float* tc, uint64_t signature, int nodeId, double& totalCostEstimate) {
		std::bitset<MAXQUERIES> qMaskll = queryMask;

		*tc = 1000.0;

		for (int i = 0; i < frameBorderSize; i++) {
			if (threadMeta[BORDER_SIZE_*frame + i] == -1 || (graph->metaIndex_[threadMeta[BORDER_SIZE_*frame + i]].query & qMaskll).any() == false) {
				threadMeta[BORDER_SIZE_*frame + i] = -1;
			}
		}

		int besti = estimator->select(&threadMeta[BORDER_SIZE_*frame], frameBorderSize, signature, qMaskll, graph, nodeId);

		frameBorderSize--;

		int tmpb = threadBorder[BORDER_SIZE_*frame + frameBorderSize];
		int tmpm = threadMeta[BORDER_SIZE_*frame + frameBorderSize];
		float tmpe = threadEst[BORDER_SIZE_*frame + frameBorderSize];

		threadBorder[BORDER_SIZE_*frame + frameBorderSize] = threadBorder[BORDER_SIZE_*frame + besti];
		threadMeta[BORDER_SIZE_*frame + frameBorderSize] = threadMeta[BORDER_SIZE_*frame + besti];
		threadEst[BORDER_SIZE_*frame + frameBorderSize] = threadEst[BORDER_SIZE_*frame + besti];

		threadBorder[BORDER_SIZE_*frame + besti] = tmpb;
		threadMeta[BORDER_SIZE_*frame + besti] = tmpm;
		threadEst[BORDER_SIZE_*frame + besti] = tmpe;

		return frameBorderSize;
	}

	int bestInsert (Graph* const graph, int* threadBorder, int* threadMeta, float* threadEst, int i, int frame, int frameBorderSize, std::bitset<MAXQUERIES>& queryMask) {
		threadBorder[BORDER_SIZE_*frame + frameBorderSize] = graph->edgeIndex_[i];
		threadMeta[BORDER_SIZE_*frame + frameBorderSize] = i;
		threadEst[BORDER_SIZE_*frame + frameBorderSize] = -0.01;
		
		frameBorderSize++;

		return frameBorderSize;
	}

	int timeoutInsert (Graph* const graph, int* threadBorder, int* threadMeta, float* threadEst, int i, int frame, int frameBorderSize, std::bitset<MAXQUERIES>& queryMask, float val) {
		threadBorder[BORDER_SIZE_*frame + frameBorderSize] = graph->edgeIndex_[i];
		threadMeta[BORDER_SIZE_*frame + frameBorderSize] = i;
		threadEst[BORDER_SIZE_*frame + frameBorderSize] = val;

		frameBorderSize++;

		return frameBorderSize;
	}

	void execute (DataBlock* data, QueryState& qs, int nodeId, int version, int threadId, std::bitset<MAXQUERIES> active, int episodeId) {
		int localTsp = ++(timestamp_[threadId*32]);
		visited_[CHECKPOINTS_*threadId+0] = 0;

		int* threadBorder = &border_[BORDER_SIZE_*CHECKPOINTS_*threadId];
		int* threadMeta = &meta_[BORDER_SIZE_*CHECKPOINTS_*threadId];
		float* threadEst = &est_[BORDER_SIZE_*CHECKPOINTS_*threadId];

		DataBlock** threadPending = &pending_[MAXRESULTSIZE*CHECKPOINTS_*threadId];
		DataBlock** threadResults = &results_[MAXRESULTSIZE*CHECKPOINTS_*threadId];

		Graph* const graph = qs.graph;
		Projector* const projector_ = qs.projector_;
		std::vector<Evaluator*>** const aggrs = qs.aggrs;
		std::vector<PostFilterWrapper>** const postfilters = qs.postFilters;

		threadBorder[0] = nodeId;
		threadMeta[0] = -1;
		threadEst[0] = 0.01;
		threadPending[0] = data;
		
		for (int i = 0; i < CHECKPOINTS_; i++)
			pendingNum_[CHECKPOINTS_*threadId + i] = 0;

		pendingNum_[CHECKPOINTS_*threadId] = 1;
		border_size_[threadId*CHECKPOINTS_] = 1;

		int probeSize = data->getSize();

		inputCnt[nodeId] += probeSize;

		int frame = 0;

		step[0+(MAXQUERIES+1)*threadId] = 0;

		void* buf1 = bufs[2*threadId];
		void* buf2 = bufs[2*threadId+1];

		uint64_t oldest = data->getTrait();

		if (probeSize == 0) {
			garbageCollect (threadPending, 0, 1, threadId);
			return;
		}

		counter_[1] += probeSize;

		lastOutputCnt = 0;
		lastCostCnt = 0;

		int curStep = 0;

		int episodeInput = data->getSize();
		int episodeProbeInput = 0;
		int episodeProbeOutput = 0;
		int episodeDivInput = 0;
		int episodeDivOutput = 0;
		double totalCostEstimate = -1.0;

		while (frame >= 0) {
			int frameBorderSize = border_size_[threadId*CHECKPOINTS_+frame];
			int framePendingNum = pendingNum_[threadId*CHECKPOINTS_+frame];

			probeSize = 0;
			for (int i = 0; i < framePendingNum; i++)
				probeSize += threadPending[MAXRESULTSIZE*frame + i]->getSize();

			if (probeSize != 0) {

				while (frameBorderSize > 0 && framePendingNum > 0) {
					float tc;

					std::bitset<MAXQUERIES> selectMask;
					if (framePendingNum > 0)
						selectMask = threadPending[MAXRESULTSIZE*frame + 0]->getQuery();

					frameBorderSize = selectBest (graph, 
						threadBorder, 
						threadMeta, 
						threadEst, 
						frame, 
						frameBorderSize, 
						selectMask,
						&tc,
						visited_[CHECKPOINTS_*threadId+frame],
						nodeId,
						totalCostEstimate);

					int nextId = threadBorder[BORDER_SIZE_*frame + frameBorderSize];
					int nextMeta = threadMeta[BORDER_SIZE_*frame + frameBorderSize];

					if (nextMeta == -1 && nextId != nodeId)
						continue;

					Stem* ht = (nextMeta != -1)? graph->metaIndex_[nextMeta].ht : nullptr;
					uint64_t join = (nextMeta != -1)? graph->metaIndex_[nextMeta].join : -1;
					std::bitset<MAXQUERIES> queryMask = 0;

					if (nextMeta != -1)
						queryMask = graph->metaIndex_[nextMeta].query;
					else
						queryMask = ~queryMask;

					int timeout = INT_MAX;
					assert (timeout >= 0);

					probeSize = 0;
					for (int i = 0; i < framePendingNum; i++)
						probeSize += threadPending[MAXRESULTSIZE*frame + i]->getSize();

					if (threadPending[MAXRESULTSIZE*frame + 0]->hasQuery(queryMask) == 0)
						continue;



					uint64_t tsp = visited_[CHECKPOINTS_*threadId+frame];

					if ((((1ull) << nextId) & tsp) != 0) {
						assert(join != -1);
						if (framePendingNum > 0 && (threadPending[MAXRESULTSIZE*frame + 0]->getLineage()).test(join) == false) {
							for (int i = 0; i < framePendingNum; i++) {
								threadPending[MAXRESULTSIZE*frame + i]->registerTarget(join);
							}
						}
						continue;
					}

					std::bitset<MAXQUERIES> queryNow = threadPending[MAXRESULTSIZE*frame + 0]->getQuery();
					std::bitset<MAXQUERIES> queryAfter = threadPending[MAXRESULTSIZE*frame + 0]->hasQuery(queryMask);
					int resultsNum_ = 0;

					if (nextId != nodeId) {
						std::bitset<MAXOPS>	 nextLineage = threadPending[MAXRESULTSIZE*frame + 0]->getLineage();
						nextLineage.set(join);

						uint64_t projection = (framePendingNum)? projector_->getWantedColumns(nextLineage) : 0;

						int maxprobes = timeout;

						if (ht != nullptr) {
							resultsNum_ += ht->probe(threadResults + resultsNum_, &threadPending[MAXRESULTSIZE*frame], framePendingNum, join, version, oldest, projection, queryMask, threadId, queryAfter);
						} else {
							assert(false);
						}

						assert(curStep < MAXQUERIES*MAXRELATIONS);
						inArray[curStep+MAXQUERIES*MAXRELATIONS*threadId] = probeSize;
						splitArray[curStep+MAXQUERIES*MAXRELATIONS*threadId] = 0;
						joinArray[curStep+MAXQUERIES*MAXRELATIONS*threadId] = nextMeta;
						sigArray[curStep+MAXQUERIES*MAXRELATIONS*threadId] = tsp;
						queryArray[curStep+MAXQUERIES*MAXRELATIONS*threadId] = queryNow;

						episodeProbeInput += probeSize;

						bool fork = false;

						std::bitset<MAXQUERIES> excl = ~queryMask;

						std::bitset<MAXQUERIES> test = threadPending[MAXRESULTSIZE*frame + 0]->hasQuery(excl);
						if (test.any()) {
						    snapshot (pendingNum_, border_size_, visited_, threadPending, threadBorder, threadMeta, threadEst, frameBorderSize, framePendingNum, framePendingNum, curStep, frame, threadId);

						    frame++;
						    fork = true;
						}

						if (fork) {
						    episodeDivInput += probeSize;

						    int split = 0;

						    for (int i = 0; i < framePendingNum; i++) {
						        threadPending[MAXRESULTSIZE*(frame-1) + i]->filterQuery(excl);
						        split += threadPending[MAXRESULTSIZE*(frame-1) + i]->getSize();
						    }

						    episodeDivOutput += split;

						    splitArray[curStep+MAXQUERIES*MAXRELATIONS*threadId] = split;
						} else {
						    garbageCollect (threadPending, frame, framePendingNum, threadId);
						}

						lastCostCnt += probeSize;

						int oldProbeSize = probeSize;

						probeSize = 0;

						assert(resultsNum_ < MAXRESULTSIZE);
						for (int i = 0; i < resultsNum_; i++) {
						    threadResults[i]->setQuery(queryAfter);
						    threadPending[MAXRESULTSIZE*frame + i] = threadResults[i];
						    probeSize += threadResults[i]->getSize();
						}

						episodeProbeOutput += probeSize;

						//estimator->record(nextMeta, tsp, graph, oldProbeSize, probeSize);

						counter_[0] += probeSize;

						uint64_t nextTSP = ((1ull) << nextId) | tsp;

						counter_[__builtin_popcountll(nextTSP)] += probeSize;

						outArray[curStep+MAXQUERIES*MAXRELATIONS*threadId] = probeSize;

						curStep++;

						assert(curStep < MAXRELATIONS*MAXQUERIES);

						costCnt[nodeId] += probeSize;

						framePendingNum = resultsNum_;
					}

					visited_[CHECKPOINTS_*threadId+frame] = ((1ull) << nextId) | tsp;

					for (int i = graph->nodeIndex_[nextId]; i < graph->nodeIndex_[nextId+1]; i++) {
					    std::bitset<MAXQUERIES> relevant = queryAfter & graph->metaIndex_[i].query;
					    if (framePendingNum > 0 && (relevant.any())) {
					        frameBorderSize = bestInsert(graph, threadBorder, threadMeta, threadEst, i, frame, frameBorderSize, queryAfter);
					    }
					}
				}
			}

			lastOutputCnt += probeSize;

			if (curStep > 0) {
			    assert(curStep < MAXRELATIONS*MAXQUERIES);
			}

			if (framePendingNum > 0 && probeSize > 0) {
			    aggregate (qs.partitioner, aggrs, postfilters, threadPending, frame, framePendingNum, threadId);
			    outputCnt[nodeId] += probeSize;
			}

			garbageCollect (threadPending, frame, framePendingNum, threadId);

			frame--;
		} 

		estimator->record (joinArray+MAXQUERIES*MAXRELATIONS*threadId, sigArray+MAXQUERIES*MAXRELATIONS*threadId, queryArray+MAXQUERIES*MAXRELATIONS*threadId, inArray+MAXQUERIES*MAXRELATIONS*threadId, outArray+MAXQUERIES*MAXRELATIONS*threadId, splitArray+MAXQUERIES*MAXRELATIONS*threadId, graph, curStep, active);
	
		#ifdef EPISODE_LOGGING

		fprintf(joinLog, "%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\n", episodeId, nodeId, episodeInput, episodeProbeInput, episodeProbeOutput, episodeDivInput, episodeDivOutput, (int) (totalCostEstimate*episodeInput));

		#endif
	}	
};

#endif






















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

#include "partitioner.h"

Partitioner::Partitioner (Schema* schema) : schema(schema), projections(0) {
	outBuffer = (int*) numa_alloc_onnode(32*WIDTH*MAXQUERIES*MAXTHREADS*sizeof(int), SOCKET);

	memset(outBuffer, 5, 32*WIDTH*MAXQUERIES*MAXTHREADS*sizeof(int));

	for (int i = 0; i < (MAXQUERIES/64)*MAXTHREADS; i++) {
		localNum[i] = 0;
	}

	for (int i = 0; i < 32*MAXQUERIES*MAXTHREADS; i++) {
		outNum[i] = 0;
	}
}

void Partitioner::addColumn (int col) {
	for (int t = 0; t < MAXTHREADS; t++) {
		columns[col*MAXTHREADS+t] = (int*) schema->getBufferManager()->getBuffer();
	}
}

void Partitioner::reset () {
	columns.clear();
	opVector.clear();
	colVector.clear();
	for (int i = 0; i < MAXTHREADS; i++)
		valVector[i].clear();
	queryIndex.clear();

	for (int i = 0; i < (MAXQUERIES/64)*MAXTHREADS; i++) {
		localNum[i] = 0;
	}

	for (int i = 0; i < 32*MAXQUERIES*MAXTHREADS; i++) {
		outNum[i] = 0;
	}
}

void Partitioner::startQuery(int queryId) {
	int size = opVector.size();

	std::pair<int, int> p(size, size);
	queryIndex[queryId] = p;
}

void Partitioner::addAggregation(int queryId, std::string op, int col) {
	if (queryIndex.find(queryId) == queryIndex.end()) {
		startQuery(queryId);
	}

	std::pair<int, int> p = queryIndex[queryId];
	p.second += 1;
	queryIndex[queryId] = p;

	if (columns.find(col*MAXTHREADS) == columns.end()) {
		addColumn(col);
	}

	projections |= ((1ull) << schema->getColumnParent(col));

	colVector.push_back(col);

	if (op.compare("min") == 0) {
		opVector.push_back(0);
		for (int i = 0; i < MAXTHREADS; i++)
			valVector[i].push_back(INT_MAX);
	} else if (op.compare("max") == 0) {
		opVector.push_back(1);
		for (int i = 0; i < MAXTHREADS; i++)
			valVector[i].push_back(INT_MIN);
	} else if (op.compare("sum") == 0) {
		opVector.push_back(2);
		for (int i = 0; i < MAXTHREADS; i++)
			valVector[i].push_back(0);
	} else if (op.compare("count") == 0) {
		opVector.push_back(3);
		for (int i = 0; i < MAXTHREADS; i++)
			valVector[i].push_back(0);
	}
}

uint64_t Partitioner::getProjections () {
	return projections;
}

void Partitioner::flush () {
	for (int q = 0; q < MAXQUERIES; q++) {
		if (queryIndex.find(q) == queryIndex.end())
			continue;
			
		std::pair<int, int> p = queryIndex[q];
	
		for (int j = p.first; j < p.second; j++) {
			int op = opVector[j];			
			int localsum = valVector[0][j];

			for (int t = 1; t < MAXTHREADS; t++) {
				if (op == 2) {
					localsum += valVector[t][j];
				} else if (op == 1) {
					if (localsum < valVector[t][j]) {
						localsum = valVector[t][j];
					}
				} else if (op == 0) {
					if (localsum > valVector[t][j]) {
						localsum = valVector[t][j];
					}
				} else if (op == 3) {
					localsum += valVector[t][j];
				}
			}

			std::cout << "query=" << j << ",result=" << localsum << " ";
		}
		std::cout << std::endl;
	}
}

void Partitioner::partition (DataBlock** dataArray, int numData, int threadId) {
	if (numData > 1) {
		for (int i = 0; i < numData; i++) {
			partition(dataArray+i, 1, threadId);
			return;
		}
	}

	int width = WIDTH;

	int mask = (WIDTH - 1);

	for (int i = 0; i < numData; i++) {
		DataBlock* data = dataArray[i];
		const std::bitset<MAXQUERIES> blockMask = data->getQuery();

		for (std::map<int, int*>::iterator it = columns.begin(); it != columns.end(); ++it) {
			if (it->first % MAXTHREADS == threadId && data->hasColumn(it->first / MAXTHREADS)) {
				//assert(data->size < width);
				data->getColumn(it->first / MAXTHREADS, it->second);
			}
		}

		const std::bitset<MAXQUERIES> * dataMask =  data->getMask();
		uint64_t dataCount = data->getSize();

		int synopsis = 0;

		for (int q = 0; q < MAXQUERIES/(sizeof(uint64_t)*8); q++) {
			if (((uint64_t*) &blockMask)[q]) {
				synopsis |= (1 << q);
			}
		}

		int step = 0;

		for (int ext = 0; ext < dataCount; ext += 128) {
			int end = (ext+128 < dataCount)? ext+128 : dataCount;

			uint64_t* l1Num = &localNum[(MAXQUERIES/64)*threadId];
			int* l1Ids = &localIds[(MAXQUERIES/64)*WIDTH*threadId];
			uint64_t* l1Masks = &localMasks[(MAXQUERIES/64)*WIDTH*threadId];

			int* outBuffer_t = outBuffer + step*WIDTH*MAXQUERIES*MAXTHREADS + WIDTH*MAXQUERIES*threadId;
			uint64_t* outNum_t = outNum + step*MAXQUERIES*MAXTHREADS + MAXQUERIES*threadId;

			/*for (int k = 0; k < (MAXQUERIES/512); k++) {
				for (int j = ext; j < end; j++) {
					uint64_t* curMask = ((uint64_t*) &dataMask[j]) + (512/64) * k;

					for (int i = 0; i < (512/64); i++) {
						int curNum = l1Num[(512/64)*k+i];
						uint64_t curMaski = curMask[(512/64)*k+i];
						l1Ids[WIDTH*(512/64)*k + WIDTH*i + curNum] = j;
						l1Masks[WIDTH*(512/64)*k + WIDTH*i + curNum] = curMaski;
						l1Num[(512/64)*k+i] = curNum + (curMaski != 0);
					}
				}
			}*/

			for (int j = ext; j < end; j++) {
					uint64_t* curMask = ((uint64_t*) &dataMask[j]);

					for (int i = 0; i < (MAXQUERIES/64); i++) {
						int curNum = l1Num[i];
						uint64_t curMaski = curMask[i];
						l1Ids[WIDTH*i + curNum] = j;
						l1Masks[WIDTH*i + curNum] = curMaski;
						l1Num[i] = curNum + (curMaski != 0);
					}
			}

			for (int j = 0; j < MAXQUERIES/64; j++) {
				int jnum = l1Num[j];
				int baseL1 = WIDTH*j;
				int baseOffset = 64*j;

				for (int k = 0; k < jnum; k++) {
					uint64_t baseMask = l1Masks[baseL1 + k];
					int id = l1Ids[baseL1 + k];

					while (baseMask != 0) {
						int offset = __builtin_ctzll(baseMask) + baseOffset;

						int cnt = outNum_t[offset];
						outBuffer_t[offset*width+cnt] = id;
						outNum_t[offset] = (cnt+1);

						baseMask &= (baseMask-1);
					}
				}

				l1Num[j] = 0;
			}

			step++;
			assert(step < 32);
		}

		int base = 0;
		for (int q = 0; q < MAXQUERIES/64; q++) {
			uint64_t baseMask = ((uint64_t*) &blockMask)[q];

			while (baseMask != 0) {
				int offset = __builtin_ctzll(baseMask) + base;
					
				if (queryIndex.find(offset) != queryIndex.end()) {
					std::pair<int, int> p = queryIndex[offset];

					for (int k = p.first; k < p.second; k++) {
						int col = colVector[k];
						int op = opVector[k];

						int* colBuffer = columns[col*MAXTHREADS+threadId];
							
						if (op == 0) {
							int localsum = INT_MAX;

							for (int s = 0; s < step; s++) {
								int cnt = outNum[s*MAXQUERIES*MAXTHREADS+MAXQUERIES*threadId+offset];
								int* qBuffer = outBuffer + s*WIDTH*MAXQUERIES*MAXTHREADS + WIDTH*MAXQUERIES*threadId + WIDTH*offset;

								for (int j = 0; j < cnt; j++) {
									int val = colBuffer[qBuffer[j]];
									if (val != -1 && val < localsum)
										localsum = val;
								}
							}
								
							if (localsum < valVector[threadId][k])
								valVector[threadId][k] = localsum;
						} else if (op == 1) {
							int localsum = INT_MIN;

							for (int s = 0; s < step; s++) {
								int cnt = outNum[s*MAXQUERIES*MAXTHREADS+MAXQUERIES*threadId+offset];
								int* qBuffer = outBuffer + s*WIDTH*MAXQUERIES*MAXTHREADS + WIDTH*MAXQUERIES*threadId + WIDTH*offset;

								for (int j = 0; j < cnt; j++) {
									int val = colBuffer[qBuffer[j]];
									if (val != -1 && val > localsum)
										localsum = val;
								}
							}

							if (localsum > valVector[threadId][k])
								valVector[threadId][k] = localsum;
						} else if (op == 2) {
							int localsum = 0;

							for (int s = 0; s < step; s++) {
								int cnt = outNum[s*MAXQUERIES*MAXTHREADS+MAXQUERIES*threadId+offset];
								int* qBuffer = outBuffer + s*WIDTH*MAXQUERIES*MAXTHREADS + WIDTH*MAXQUERIES*threadId + WIDTH*offset;

								for (int j = 0; j < cnt; j++) {
									int val = colBuffer[qBuffer[j]];
									localsum += (val != -1) ? val : 0;
								}
							}

							valVector[threadId][k] += localsum;
						} else if (op == 3) {
							int localsum = 0;

							for (int s = 0; s < step; s++) {
								int cnt = outNum[s*MAXQUERIES*MAXTHREADS+MAXQUERIES*threadId+offset];
								int* qBuffer = outBuffer + s*WIDTH*MAXQUERIES*MAXTHREADS + WIDTH*MAXQUERIES*threadId + WIDTH*offset;

								for (int j = 0; j < cnt; j++) {
									int val = colBuffer[qBuffer[j]];
									localsum += (val != -1) ? 1 : 0;
								}
							}
							

							valVector[threadId][k] += localsum;
						} else {
							assert(false);
						}
					}
				}

				for (int s = 0; s < step; s++) {
					outNum[s*MAXQUERIES*MAXTHREADS+MAXQUERIES*threadId+offset] = 0;
				}

				baseMask &= (baseMask-1);
			}

			base += 64;
		}
	}
}

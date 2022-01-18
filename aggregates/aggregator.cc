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

#include "aggregator.h"
#include "../frontend/evaluators.h"
#include "../dictionary/dictionary.h"
#include <cmath>

Aggregator::Aggregator (
	Schema* schema, 
	std::vector<Evaluator*> vals, /*aggregation functions*/
	std::vector<int*>& valsData, /*output for aggregates*/
	std::vector<std::string> ops, /*aggregations to perform*/
	std::vector<int> keys, /*groupings*/
	std::vector<int*>& keysData, /*output for groupings*/
	std::vector<Dictionary*> dicts,
	std::vector<std::pair<int, int*> > having_conds, /*having conds of the form aggr > it.first*/
	std::vector<int> ordering, /*ordering keys (ascending)*/
	int limit,
	int hashBits, 
	int tableId, /*id of output table*/
	int numthreads) : hashBits_(hashBits), maxRows_(schema->getRowCount(tableId)), numthreads_(numthreads), schema_(schema), tableId_(tableId), limit_(limit) {
	
	numKeys_ = keys.size();
	key_ = (int*) numa_alloc_onnode(numKeys_*sizeof(int), SOCKET);
	dicts_ = (Dictionary**) numa_alloc_onnode(numKeys_*sizeof(Dictionary*), SOCKET);

	numValues_ = vals.size();
	values_ = (Evaluator**) numa_alloc_onnode(numValues_*sizeof(Evaluator*), SOCKET);
	opcode_ = (int*) numa_alloc_onnode(numValues_*sizeof(int), SOCKET);

	heads_ = (int64_t*) numa_alloc_onnode((numthreads_ << hashBits_)*sizeof(int64_t), SOCKET);

	buffer_ = (int*) numa_alloc_onnode(((numKeys_*MAXTHREADS) << 16)*sizeof(int), SOCKET);
	valkeeper_ = (int**) numa_alloc_onnode((numValues_*MAXTHREADS)*sizeof(int), SOCKET);
	offsets_ = (int*) numa_alloc_onnode((1 << 16)*sizeof(int), SOCKET);

	counters_ = (int*) numa_alloc_onnode(16*MAXTHREADS*sizeof(int), SOCKET);

	next_ = (int64_t*) numa_alloc_onnode(maxRows_*sizeof(int64_t), SOCKET);

	aggr_mutex.unlock();

	/*input keys and dictionaries*/
	for (int i = 0; i < numKeys_; i++) {
		key_[i] = keys[i];
		dicts_[i] = dicts[i];
	}

	for (int i = 0; i < maxRows_; i++)
		next_[i] = -1;

	/*ouput location*/
	for (int i = 0; i < numKeys_; i++) {
		if (keysData[i] == nullptr)
			arrays_[i] = (int*) numa_alloc_onnode(maxRows_*sizeof(int), SOCKET);
		else
			arrays_[i] = keysData[i];
	}

	/*allocate swap space for reordering/sorting output*/
	if (ordering.size() > 0) {
		swap_ = (int*) numa_alloc_onnode(maxRows_*sizeof(int), SOCKET);
		swap2_ = (int*) numa_alloc_onnode(maxRows_*sizeof(int), SOCKET);

		for (int j = 0; j < maxRows_; j++) {
			swap_[j] = j;
			swap2_[j] = j;
		}
	}

	for (int i = 0; i < having_conds.size(); i++) {
		having_conds_.push_back(having_conds[i]);
	}

	for (int i = 0; i < ordering.size(); i++) {
		ordering_.push_back(ordering[i]);
	}

	int valw = 0;

	/*initialize based on aggregation function*/
	for (int i = 0; i < numValues_; i++) {
		values_[i] = vals[i];

		if (ops[i].compare("min") == 0) {
			opcode_[i] = 0;
			defaultVal[valw] = INT_MAX;
			arrays_[numKeys_ + valw] = valsData[i];
			valw++;
		} else if (ops[i].compare("max") == 0) {
			opcode_[i] = 1;
			defaultVal[valw] = INT_MIN;
			arrays_[numKeys_ + valw] = valsData[i];
			valw++;
		} else if (ops[i].compare("sum") == 0) {
			opcode_[i] = 2;
			defaultVal[valw] = 0;
			arrays_[numKeys_ + valw] = valsData[i];
			valw++;
		} else if (ops[i].compare("count") == 0) {
			opcode_[i] = 3;
			defaultVal[valw] = 0;
			arrays_[numKeys_ + valw] = valsData[i];
			valw++;
		} else if (ops[i].compare("avg") == 0) {
			opcode_[i] = 4;
			defaultVal[valw] = 0;
			defaultVal[valw+1] = 0;
			arrays_[numKeys_ + valw] = valsData[i];
			arrays_[numKeys_ + valw + 1] = (int*) numa_alloc_onnode(maxRows_*sizeof(int), SOCKET);
			valw += 2;
		} else if (ops[i].compare("avg2") == 0) {
			opcode_[i] = 5;
			defaultVal[valw] = 0;
			defaultVal[valw+1] = 0;
			arrays_[numKeys_ + valw] = valsData[i];
			arrays_[numKeys_ + valw + 1] = (int*) numa_alloc_onnode(maxRows_*sizeof(int), SOCKET);
			valw += 2;
		} else if (ops[i].compare("avg3") == 0) {
			opcode_[i] = 6;
			defaultVal[valw] = 0;
			defaultVal[valw+1] = 0;
			arrays_[numKeys_ + valw] = valsData[i];
			arrays_[numKeys_ + valw + 1] = (int*) numa_alloc_onnode(maxRows_*sizeof(int), SOCKET);
			valw += 2;
		}

		assert(valw < 32);
	}

	valWidth = valw;

	assert(numKeys_ + valWidth < 32);

	/*-1 means empty buckets*/
	for (int i = 0; i < (numthreads_ << hashBits); i++)
		heads_[i] = -1;

	/*touch pages to complete intialization*/
	for (int i = 0; i < numKeys_ + valWidth; i++) {
		for (int j = 0; j < maxRows_; j++)
			arrays_[i][j] = 5;
	}

	for (int i = 0; i < MAXTHREADS; i++)
		counters_[16*i] = 0;
}

void Aggregator::consume (DataBlock* data, std::bitset<MAXQUERIES> queries, int threadId) {
	/*We implement aggregators in a single-threaded way.
	An efficient GROUPBY implementation is beyond the scope of the paper but a planned feature for RouLette*/
	aggr_mutex.lock();

	/*materialize columns needed for groupings*/
	const int* threadKeys = buffer_ + (1 << 16)*numKeys_*threadId;
	for (int i = 0; i < numKeys_; i++)
		data->getColumn(key_[i], buffer_ + (1 << 16)*(numKeys_*threadId+i));

	/*materialize expressions needed for aggregations*/
	int** const localKeeper = valkeeper_ + numValues_*threadId;
	for (int i = 0; i < numValues_; i++)
		localKeeper[i] = (int*) values_[i]->apply(data, threadId);

	/*copy to local variables to avoid accessing this->arrays_ every time (compiler cannot place base address to register)*/
	int* threadArrays_[32];
	for (int i = 0; i < numKeys_ + valWidth; i++) {
		threadArrays_[i] = arrays_[i];
	}

	/*place base address for hashtable heads in registers*/
	int64_t* const threadHeads_ = heads_ + (threadId << hashBits_);

	/*use 16* to avoid false sharing*/
	int offset = counters_[16*threadId];

	uint64_t dataCnt = data->getSize();
	uint64_t inserted = 0;

	std::bitset<MAXQUERIES>* mask = data->getMask();

	int accepted = 0;

	for (int i = 0; i < dataCnt; i++) {
		/*find relevant queries (in case aggregations processes shared output)*/
		std::bitset<MAXQUERIES> activeMask = mask[i] & queries;

		bool nulltup = false;

		/*use tuple in aggregation*/
		if (activeMask.any() && !nulltup) {
			accepted++;
			int collector = 0;

			/*hash all aggregated values*/
			for (int j = 0; j < numKeys_; j++) {
				collector ^= HASHT((uint) threadKeys[i + (j << 16)]);
			}

			int hval = HASHT(collector) & ((1 << hashBits_) - 1);

			/*search hashtable for the grouping*/
			bool flag = true;
			int64_t cur = threadHeads_[hval];

			bool foundmatch = false;

			while (cur >= 0) {
				bool equals = true;
				for (int j = 0; j < numKeys_; j++) {
					if (equals) {
						if (threadKeys[i + (j << 16)] != threadArrays_[j][cur]) {
							equals = false;
						}
					}
				}

				/*grouping found - record location and aggregate later in vectorized way*/
				if (equals) {
					flag = false;
					offsets_[i] = cur;
					foundmatch = true;
					break;
				}

				cur = next_[cur];
			}

			/*new grouping - create entry*/
			if (flag) {
				assert(foundmatch == false);

				next_[offset] = threadHeads_[hval];
				for (int j = 0; j < numKeys_; j++) {
					threadArrays_[j][offset] = threadKeys[i + (j << 16)];
				}

				offsets_[i] = offset;

				for (int j = 0; j < valWidth; j++) {
					threadArrays_[numKeys_ + j][offset] = defaultVal[j];
				}

				threadHeads_[hval] = offset;
				offset++;
			}
		} else {
			offsets_[i] = INT_MIN;
		}
	}

	int valw = 0;

	/*vectorized aggregation based on recorded groupings*/
	for (int j = 0; j < numValues_; j++) {
		int* local = localKeeper[j];
		if (opcode_[j] == 0) {
			for (int i = 0; i < dataCnt; i++) {
				int cur = offsets_[i];

				if (cur != INT_MIN) {
					int val = local[i];
					if (val != -1 && val < threadArrays_[numKeys_ + valw][cur])
						threadArrays_[numKeys_ + valw][cur] = val;
				}
			}
			valw++;
		} else if (opcode_[j] == 1) {
			for (int i = 0; i < dataCnt; i++) {
				int cur = offsets_[i];

				if (cur != INT_MIN) {
					int val = local[i];
					if (val != -1 && val > threadArrays_[numKeys_ + valw][cur])
						threadArrays_[numKeys_ + valw][cur] = local[i];
				}
			}
			valw++;
		} else if (opcode_[j] == 2) {
			for (int i = 0; i < dataCnt; i++) {
				int cur = offsets_[i];

				if (cur != INT_MIN) {
					int val = local[i];
					if (val != -1) {
						threadArrays_[numKeys_ + valw][cur] += val;
					}
				}
			}
			valw++;
		} else if (opcode_[j] == 3) {
			for (int i = 0; i < dataCnt; i++) {
				int cur = offsets_[i];

				if (cur != INT_MIN) {
					int val = local[i];
					threadArrays_[numKeys_ + valw][cur] += (val != -1);
				}
			}
			valw++;
		} else if (opcode_[j] == 4) {
			for (int i = 0; i < dataCnt; i++) {
				int cur = offsets_[i];

				if (cur != INT_MIN) {
					int val = local[i];
					if (val != -1) {
							threadArrays_[numKeys_ + valw][cur] += val;
							threadArrays_[numKeys_ + valw + 1][cur] += 1;
						}
					}
				}
				valw++;
				valw++;
		} else if (opcode_[j] == 5) {
			for (int i = 0; i < dataCnt; i++) {
				int cur = offsets_[i];

				if (cur != INT_MIN) {
					int val = local[i];
					if (val != -1) {
						threadArrays_[numKeys_ + valw][cur] += val;
						threadArrays_[numKeys_ + valw + 1][cur] += 1;
					}
				}
			}
			valw++;
			valw++;
		} else if (opcode_[j] == 6) {
			for (int i = 0; i < dataCnt; i++) {
				int cur = offsets_[i];

				if (cur != INT_MIN) {
					int val = local[i];
					if (val != -1) {
						threadArrays_[numKeys_ + valw][cur] += val;
						threadArrays_[numKeys_ + valw + 1][cur] += 1;
					}
				}
			}
			valw++;
			valw++;
		}
	}

	counters_[16*threadId] = offset;
	counters_[16*threadId + 1] += accepted;

	assert(offset <= maxRows_);

	aggr_mutex.unlock();
}

/*
Quicksort for ORDER BY with 1 attribute
keys: keys for sorting
rows: row number of a sorted element (rows sorted at the end)
start: start of quicksort range
end: end of quicksort range
*/
void sortOnKeys_1 (const int* keys, int* rows, int start, int end) {
		if (start+1 >= end)
			return;

		int pivot = rows[start+rand()%(end-start)];
		int val = keys[pivot];

		int offset = start;
		int count = 0;

		for (int i = start; i < end; i++) {
			int cur = rows[i];
			int curKey = keys[cur];

			if (curKey <= val) {
				int tmpRow = cur;
				rows[i] = rows[offset];
				rows[offset] = tmpRow;
				offset++;

				if (curKey == val)
					count++;
			}
		}

		if (count == end-start)
			return;

		sortOnKeys_1(keys, rows, start, offset);
		sortOnKeys_1(keys, rows, offset, end);
}

/*
Quicksort for ORDER BY with 2 attributes
keys: keys for sorting
rows: row number of a sorted element (rows sorted at the end)
start: start of quicksort range
end: end of quicksort range
*/
void sortOnKeys_2 (const int* keys1, const int* keys2, int* rows, int start, int end) {
		if (start+1 >= end)
			return;

		int pivot = rows[start+rand()%(end-start)];
		int val1 = keys1[pivot];
		int val2 = keys2[pivot];

		int offset = start;
		int count = 0;

		for (int i = start; i < end; i++) {
			int cur = rows[i];
			int curKey1 = keys1[cur];

			if (curKey1 < val1) {
				int tmpRow = cur;
				rows[i] = rows[offset];
				rows[offset] = tmpRow;
				offset++;
			} else if (curKey1 == val1) {
				int curKey2 = keys2[cur];

				if (curKey2 <= val2) {
					int tmpRow = cur;
					rows[i] = rows[offset];
					rows[offset] = tmpRow;
					offset++;

					if (curKey2 == val2)
						count++;
				}
			}
		}

		if (count == end-start)
			return;

		sortOnKeys_2(keys1, keys2, rows, start, offset);
		sortOnKeys_2(keys1, keys2, rows, offset, end);
}

/*
Quicksort for ORDER BY with 3 attributes
keys: keys for sorting
rows: row number of a sorted element (rows sorted at the end)
start: start of quicksort range
end: end of quicksort range
*/
void sortOnKeys_3 (const int* keys1, const int* keys2, const int* keys3, int* rows, int start, int end) {
		if (start+1 >= end)
			return;

		int pivot = rows[start+rand()%(end-start)];
		int val1 = keys1[pivot];
		int val2 = keys2[pivot];
		int val3 = keys3[pivot];

		int offset = start;
		int count = 0;

		for (int i = start; i < end; i++) {
			int cur = rows[i];
			int curKey1 = keys1[cur];

			if (curKey1 < val1) {
				int tmpRow = cur;
				rows[i] = rows[offset];
				rows[offset] = tmpRow;
				offset++;
			} else if (curKey1 == val1) {
				int curKey2 = keys2[cur];

				if (curKey2 < val2) {
					int tmpRow = cur;
					rows[i] = rows[offset];
					rows[offset] = tmpRow;
					offset++;
				} else if (curKey2 == val2) {
					int curKey3 = keys3[cur];

					if (curKey3 <= val3) {
						int tmpRow = cur;
						rows[i] = rows[offset];
						rows[offset] = tmpRow;
						offset++;

						if (curKey3 == val3)
							count++;
					}
				}
			}
		}

		if (count == end-start)
			return;

		sortOnKeys_3(keys1, keys2, keys3, rows, start, offset);
		sortOnKeys_3(keys1, keys2, keys3, rows, offset, end);
}

/*
Quicksort for ORDER BY with 4 attributes
keys: keys for sorting
rows: row number of a sorted element (rows sorted at the end)
start: start of quicksort range
end: end of quicksort range
*/
void sortOnKeys_4 (const int* keys1, const int* keys2, const int* keys3, const int* keys4, int* rows, int start, int end) {
		if (start+1 >= end)
			return;

		int pivot = rows[start+rand()%(end-start)];
		int val1 = keys1[pivot];
		int val2 = keys2[pivot];
		int val3 = keys3[pivot];
		int val4 = keys4[pivot];

		int offset = start;
		int count = 0;

		for (int i = start; i < end; i++) {
			int cur = rows[i];
			int curKey1 = keys1[cur];

			if (curKey1 < val1) {
				int tmpRow = cur;
				rows[i] = rows[offset];
				rows[offset] = tmpRow;
				offset++;
			} else if (curKey1 == val1) {
				int curKey2 = keys2[cur];

				if (curKey2 < val2) {
					int tmpRow = cur;
					rows[i] = rows[offset];
					rows[offset] = tmpRow;
					offset++;
				} else if (curKey2 == val2) {
					int curKey3 = keys3[cur];

					if (curKey3 < val3) {
						int tmpRow = cur;
						rows[i] = rows[offset];
						rows[offset] = tmpRow;
						offset++;
					} else if (curKey3 == val3) {
						int curKey4 = keys4[cur];

						if (curKey4 <= val4) {
							int tmpRow = cur;
							rows[i] = rows[offset];
							rows[offset] = tmpRow;
							offset++;

							if (curKey4 == val4)
								count++;
						}
					}
				}
			}
		}

		if (count == end-start)
			return;

		sortOnKeys_4(keys1, keys2, keys3, keys4, rows, start, offset);
		sortOnKeys_4(keys1, keys2, keys3, keys4, rows, offset, end);
}

/*
Quicksort for ORDER BY with 5 attributes
keys: keys for sorting
rows: row number of a sorted element (rows sorted at the end)
start: start of quicksort range
end: end of quicksort range
*/
void sortOnKeys_5 (const int* keys1, const int* keys2, const int* keys3, const int* keys4, const int* keys5, int* rows, int start, int end) {
		if (start+1 >= end)
			return;

		int pivot = rows[start+rand()%(end-start)];
		int val1 = keys1[pivot];
		int val2 = keys2[pivot];
		int val3 = keys3[pivot];
		int val4 = keys4[pivot];
		int val5 = keys5[pivot];

		int offset = start;
		int count = 0;

		for (int i = start; i < end; i++) {
			int cur = rows[i];
			int curKey1 = keys1[cur];

			if (curKey1 < val1) {
				int tmpRow = cur;
				rows[i] = rows[offset];
				rows[offset] = tmpRow;
				offset++;
			} else if (curKey1 == val1) {
				int curKey2 = keys2[cur];

				if (curKey2 < val2) {
					int tmpRow = cur;
					rows[i] = rows[offset];
					rows[offset] = tmpRow;
					offset++;
				} else if (curKey2 == val2) {
					int curKey3 = keys3[cur];

					if (curKey3 < val3) {
						int tmpRow = cur;
						rows[i] = rows[offset];
						rows[offset] = tmpRow;
						offset++;
					} else if (curKey3 == val3) {
						int curKey4 = keys4[cur];

						if (curKey4 < val4) {
							int tmpRow = cur;
							rows[i] = rows[offset];
							rows[offset] = tmpRow;
							offset++;
						} else if (curKey4 == val4) {
							int curKey5 = keys5[cur];

							if (curKey5 <= val5) {
								int tmpRow = cur;
								rows[i] = rows[offset];
								rows[offset] = tmpRow;
								offset++;

								if (curKey5 == val5)
									count++;
							}
						}
					}
				}
			}
		}

		if (count == end-start)
			return;

		sortOnKeys_5(keys1, keys2, keys3, keys4, keys5, rows, start, offset);
		sortOnKeys_5(keys1, keys2, keys3, keys4, keys5, rows, offset, end);
}


void Aggregator::produce () {
		int offset = counters_[0];

		int* threadArrays_[32];
		for (int i = 0; i < numKeys_ + valWidth; i++)
			threadArrays_[i] = arrays_[i];

		int sum = 0;
		int outcount = 0;

		for (int i = 0; i < offset; i++) {
			int valw = 0;
			
			/*compute composite aggregates such as avg = sum/count, floor(1.2*avg), floor(1.3*avg)*/
			for (int j = 0; j < numValues_; j++) {
				if (opcode_[j] < 4) {
					valw++;
				} else if (opcode_[j] == 4) {
					if (threadArrays_[numKeys_ + valw + 1][i] > 0)
						threadArrays_[numKeys_ + valw][i] = threadArrays_[numKeys_ + valw][i]/threadArrays_[numKeys_ + valw + 1][i];
					else
						threadArrays_[numKeys_ + valw][i] = -1;
					valw++;
					valw++;
				} else if (opcode_[j] == 5) {
					if (threadArrays_[numKeys_ + valw + 1][i] > 0)
						threadArrays_[numKeys_ + valw][i] = floor((1.2*threadArrays_[numKeys_ + valw][i])/threadArrays_[numKeys_ + valw + 1][i]);
					else
						threadArrays_[numKeys_ + valw][i] = -1;
					valw++;
					valw++;
				} else if (opcode_[j] == 6) {
					if (threadArrays_[numKeys_ + valw + 1][i] > 0)
						threadArrays_[numKeys_ + valw][i] = floor((1.3*threadArrays_[numKeys_ + valw][i])/threadArrays_[numKeys_ + valw + 1][i]);
					else
						threadArrays_[numKeys_ + valw][i] = -1;
					valw++;
					valw++;
				}
			}

			outcount++;
		}

		std::cout << "Rows: " << outcount << std::endl;

		/*set size of output table*/
		schema_->setRowCount(tableId_, outcount);

		/*apply having filters*/
		for (int p = 0; p < having_conds_.size(); p++) {
			int* keys = (int*) schema_->getColumnData(having_conds_[p].first);
			int val = having_conds_[p].second[0];

			/*produce having bitmask predicate*/
			for (int i = 0; i < outcount; i++) {
				swap2_[i] = (keys[i] > val);
			}

			/*apply predicate*/
			schema_->forceFiltering(tableId_, swap2_);
		}

		outcount = schema_->getRowCount(tableId_);

		/*apply orderby*/
		if (ordering_.size() == 1) {
			int* keys = (int*) schema_->getColumnData(ordering_[0]);
			sortOnKeys_1(keys, swap_, 0, outcount);

			schema_->forceOrdering(tableId_, swap_, swap2_);
		} else if (ordering_.size() == 2) {
			int* keys1 = (int*) schema_->getColumnData(ordering_[0]);
			int* keys2 = (int*) schema_->getColumnData(ordering_[1]);

			sortOnKeys_2(keys1, keys2, swap_, 0, outcount);

			schema_->forceOrdering(tableId_, swap_, swap2_);
		} else if (ordering_.size() == 3) {
			int* keys1 = (int*) schema_->getColumnData(ordering_[0]);
			int* keys2 = (int*) schema_->getColumnData(ordering_[1]);
			int* keys3 = (int*) schema_->getColumnData(ordering_[2]);

			sortOnKeys_3(keys1, keys2, keys3, swap_, 0, outcount);

			schema_->forceOrdering(tableId_, swap_, swap2_);
		} else if (ordering_.size() == 4) {
			int* keys1 = (int*) schema_->getColumnData(ordering_[0]);
			int* keys2 = (int*) schema_->getColumnData(ordering_[1]);
			int* keys3 = (int*) schema_->getColumnData(ordering_[2]);
			int* keys4 = (int*) schema_->getColumnData(ordering_[3]);

			sortOnKeys_4(keys1, keys2, keys3, keys4, swap_, 0, outcount);

			schema_->forceOrdering(tableId_, swap_, swap2_);
		} else if (ordering_.size() == 5) {
			int* keys1 = (int*) schema_->getColumnData(ordering_[0]);
			int* keys2 = (int*) schema_->getColumnData(ordering_[1]);
			int* keys3 = (int*) schema_->getColumnData(ordering_[2]);
			int* keys4 = (int*) schema_->getColumnData(ordering_[3]);
			int* keys5 = (int*) schema_->getColumnData(ordering_[4]);

			sortOnKeys_5(keys1, keys2, keys3, keys4, keys5, swap_, 0, outcount);

			schema_->forceOrdering(tableId_, swap_, swap2_);
		}

		/*apply limit clause
		limit = -1 means no limit*/
		if (limit_ >= 0 && outcount > limit_) {
			schema_->setRowCount(tableId_, limit_);
		}
}





































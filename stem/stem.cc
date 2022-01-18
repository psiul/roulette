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

#include "stem.h"

Stem::Stem (Schema* schema, int* array, AtomicStack<DataBlock>* dallocator, std::atomic_flag* dallocator_lock, std::atomic_flag* version_lock, int* snapshots, std::atomic<int>* version, std::vector<int>& key, int table, int hashBits, uint64_t maxSize, int numthreads) : version_(version), schema_(schema), dallocator_(dallocator), dallocator_lock_(dallocator_lock), snapshots_(snapshots), maxSize_(maxSize), hashBits_(hashBits), table_(table), numthreads_(numthreads) {
	version_lock_ = version_lock;
	numKeys_ = key.size();

	tupleCnt = 0;

	activated = false;

	compositeIndexSize_ = 0;

	for (int i = 0; i < 8; i++) {
		compositeIndex_[i] = -1;
		compHeads_[i] = nullptr;
		compNext_[i] = nullptr;
	}

	array_ = array;

	keyIndex_ = (int*) numa_alloc_onnode(MAXOPS*sizeof(int), SOCKET);
	joinIndex_ = (int*) numa_alloc_onnode(MAXOPS*sizeof(int), SOCKET);

	mainJoinIndex_ = (int*) numa_alloc_onnode(MAXOPS*sizeof(int), SOCKET);
	mainKeyIndex_ = (int*) numa_alloc_onnode(MAXOPS*sizeof(int), SOCKET);
	secJoinIndex_ = (int*) numa_alloc_onnode(MAXOPS*sizeof(int), SOCKET);
	secKeyIndex_ = (int*) numa_alloc_onnode(MAXOPS*sizeof(int), SOCKET);
	secOpIndex_ = (int*) numa_alloc_onnode(MAXOPS*sizeof(int), SOCKET);

	for (int i = 0; i < MAXOPS; i++) {
		keyIndex_[i] = -1;
		joinIndex_[i] = -1;
		secJoinIndex_[i] = -1;
		secKeyIndex_[i] = -1;
		secOpIndex_[i] = -1;
	}

	key_ = (int*) numa_alloc_onnode(numKeys_*sizeof(int), SOCKET);
	heads_ = (int64_t*) numa_alloc_onnode(((numKeys_) << hashBits_)*sizeof(int64_t), SOCKET);
	buffer_ = (int*) numa_alloc_onnode((((numKeys_+2)*MAXTHREADS) << 16)*sizeof(int), SOCKET);
	buffer2_ = (int*) numa_alloc_onnode((((numKeys_+2)*MAXTHREADS) << 16)*sizeof(int), SOCKET);
	buffer3_ = (int*) numa_alloc_onnode((((numKeys_+2)*MAXTHREADS) << 16)*sizeof(int), SOCKET);

	project_ = (int**) numa_alloc_onnode((MAXTHREADS * (MAXRELATIONS+1))*sizeof(int*), SOCKET);

	for (int i = 0; i < numKeys_; i++)
		key_[i] = key[i];

	for (int i = 0; i < ((numKeys_) << hashBits); i++)
		heads_[i] = -1;

	for (int i = 0; i < ((numKeys_+2) * MAXTHREADS) << 16; i++) {
		buffer_[i] = 5;
		buffer2_[i] = 5;
		buffer3_[i] = 5;
	}

	for (int i = 0; i < (MAXTHREADS * (MAXRELATIONS+1)); i++)
		project_[i] = (int*) 5;

	bucket_lock.clear();
}

Stem::~Stem () {
	//numa_free(array_, maxSize_*sizeof(int));

	numa_free(keyIndex_, MAXOPS*sizeof(int));
	numa_free(joinIndex_, MAXOPS*sizeof(int));

	numa_free(key_, numKeys_*sizeof(int));
	numa_free(heads_, (numKeys_ << hashBits_)*sizeof(int64_t));
	numa_free(buffer_, ((numKeys_*MAXTHREADS) << 16)*sizeof(int));
		
	numa_free(project_, (MAXTHREADS * (MAXRELATIONS+1))*sizeof(int*));
}

void Stem::reset () {
	tupleCnt = 0;

	for (int i = 0; i < ((numKeys_) << hashBits_); i++)
		heads_[i] = -1;

	bucket_lock.clear();
}

void Stem::registerTheta (int joinId, int mainKeyBuild, int mainKeyProbe, int secKeyBuild, int secKeyProbe, std::string op) {

	std::cout << "THETA:" << mainKeyProbe << " " << mainKeyBuild << "-"
					<< secKeyProbe << " " << secKeyBuild << std::endl;

	mainKeyIndex_[joinId] = mainKeyProbe;
	mainJoinIndex_[joinId] = mainKeyBuild;
	secKeyIndex_[joinId] = secKeyProbe;
	secJoinIndex_[joinId] = secKeyBuild;

	if (op.compare("None") == 0) {
		secOpIndex_[joinId] = -1;
	} else if (op.compare("lt") == 0) {
		secOpIndex_[joinId] = 0;
	} else if (op.compare("gt") == 0) {
		secOpIndex_[joinId] = 1;
	} else if (op.compare("eq") == 0) {
		secOpIndex_[joinId] = 2;

		compositeIndex_[compositeIndexSize_] = joinId;
		compHeads_[compositeIndexSize_] = (int64_t*) numa_alloc_onnode((1 << hashBits_)*sizeof(int64_t), SOCKET);
		compNext_[compositeIndexSize_] = (int64_t*) numa_alloc_onnode(schema_->getRowCount(table_)*sizeof(int64_t), SOCKET);
		compHash_[compositeIndexSize_] = (int*) numa_alloc_onnode(schema_->getRowCount(table_)*sizeof(int), SOCKET);
		compIdx_[compositeIndexSize_] = (int*) numa_alloc_onnode(schema_->getRowCount(table_)*sizeof(int), SOCKET);

		for (int i = 0; i < (1 << hashBits_); i++) {
			compHeads_[compositeIndexSize_][i] = -1;
		}

		for (int i = 0; i < schema_->getRowCount(table_); i++) {
			compNext_[compositeIndexSize_][i] = 5;
			compHash_[compositeIndexSize_][i] = 5;
		}

		compositeIndexSize_++;
	} else if (op.compare("eq2") == 0) {
		secOpIndex_[joinId] = 3;
	} else {
		assert(false);
	}
}

void Stem::registerJoin (int joinId, int keyBuild, int keyProbe) {
	assert(joinId >= 0 && joinId < MAXOPS);

	for (int i = 0; i < numKeys_; i++)
		if (key_[i] == keyBuild) {
			keyIndex_[joinId] = keyProbe;
			joinIndex_[joinId] = i;
			secJoinIndex_[joinId] = -1;
			/*
			secKeyIndex_[joinId] = secKeyProbe;
			secJoinIndex_[joinId] = secKeyBuild;

			if (op.compare("None") == 0) {
				secOpIndex_[joinId] = -1;
			} else if (op.compare("lt") == 0) {
				secOpIndex_[joinId] = 0;
			} else if (op.compare("gt") == 0) {
				secOpIndex_[joinId] = 1;
			} else if (op.compare("eq") == 0) {
				secOpIndex_[joinId] = 2;

				compositeIndex_[compositeIndexSize_] = joinId;
				compHeads_[compositeIndexSize_] = (int64_t*) numa_alloc_onnode((1 << hashBits_)*sizeof(int64_t), SOCKET);
				compNext_[compositeIndexSize_] = (int64_t*) numa_alloc_onnode(schema_->getRowCount(table_)*sizeof(int64_t), SOCKET);
				compHash_[compositeIndexSize_] = (int*) numa_alloc_onnode(schema_->getRowCount(table_)*sizeof(int), SOCKET);
				compIdx_[compositeIndexSize_] = (int*) numa_alloc_onnode(schema_->getRowCount(table_)*sizeof(int), SOCKET);

				for (int i = 0; i < (1 << hashBits_); i++) {
					compHeads_[compositeIndexSize_][i] = -1;
				}

				for (int i = 0; i < schema_->getRowCount(table_); i++) {
					compNext_[compositeIndexSize_][i] = 5;
					compHash_[compositeIndexSize_][i] = 5;
				}

				compositeIndexSize_++;
			} else if (op.compare("eq2") == 0) {
				secOpIndex_[joinId] = 3;
			} else {
				assert(false);
			}*/
		}
}

void Stem::buildAux (const int* ids, int* key1, int* key2, uint64_t size, int index, int64_t offset) {
	int* const hashes = compHash_[index];
	int64_t* const next = compNext_[index];
	int64_t* const head = compHeads_[index];
	int* const idx = compIdx_[index];

	for (int i = 0; i < size; i++) {
		int collector = HASHT(key1[i]*0x67676767) ^ HASHT(key2[i]*0x73737373);
		int hval = collector & ((1 << hashBits_) - 1);
		hashes[offset+i] = collector;
		int64_t cur = offset+i;
		__atomic_exchange (&head[hval], &cur, &next[offset+i], __ATOMIC_RELAXED);
	}
}

int* Stem::build (DataBlock* data, int version, uint64_t offset, int threadId, std::bitset<MAXQUERIES>  active) {
	if (numKeys_ == 0) return nullptr;

  for (int i = 0; i < numKeys_; i++)
		data->getColumn(key_[i], buffer_ + (1 << 16)*(numKeys_*threadId+i));
	const int* keys = buffer_ + (1 << 16)*numKeys_*threadId;
	
	const std::bitset<MAXQUERIES>* dataMask =  data->getMask();
	const int* ids = data->getVIDSAll();

	int* const dest = array_;
	int64_t* const chains = heads_;

	uint64_t dataCount = data->getSize();

	int nextVersion = version;

	int64_t numElementsLocal = offset;

	int tupleSize = ((3*numKeys_+2)*sizeof(int)+sizeof(std::bitset<MAXQUERIES>))/sizeof(int);
	tupleSize = (tupleSize % 2)? tupleSize + 1 : tupleSize; 


	if (offset+tupleSize*dataCount > maxSize_/sizeof(int)) {
		assert(offset+tupleSize*dataCount <= maxSize_/sizeof(int));
	}


	for (int i = 0; i < dataCount; i++) {
		int buildIdx = ids[i];
		const std::bitset<MAXQUERIES>& buildMask = dataMask[i];

		uint64_t pos = numElementsLocal+tupleSize*i; //& MEGABUFFER_MASK

		__builtin_prefetch(&array_[pos]);

		tupleCnt++;

		dest[pos+3*numKeys_] = buildIdx;

		dest[pos+3*numKeys_+1] = nextVersion;

		*((std::bitset<MAXQUERIES>*) &dest[pos+3*numKeys_+2]) = buildMask;

		for (int j = 0; j < numKeys_; j++) {
		  int buildKey = keys[i + (j << 16)];
		  dest[pos+2*numKeys_+j] = buildKey;
		}
	}

	__atomic_thread_fence(__ATOMIC_ACQ_REL);

	for (int j = 0; j < numKeys_; j++)  {
		for (int i = 0; i < dataCount; i++) {
			int buildIdx = ids[i];

			uint64_t pos = numElementsLocal+tupleSize*i;

			int buildKey = keys[i + (j << 16)];
			int hval = (HASHT(buildKey) & ((1 << hashBits_) - 1)) + (j << hashBits_);
										
			int64_t cur = numElementsLocal+tupleSize*i;

			__atomic_exchange (&chains[hval], &cur, (int64_t*) &dest[pos+2*j], __ATOMIC_RELAXED);
		}
	}

	return nullptr;
}

bool testIntersectTriple (uint64_t* dest, uint64_t* probe, uint64_t* build, uint64_t* mask) {
	uint64_t any = 0;
	for (int i = 0; i < MAXQUERIES/64; i++) {
		uint64_t intersect = probe[i] & build[i] & mask[i];
		dest[i] = intersect;
		any |= intersect;
	}

	return any;
}

int Stem::probe (DataBlock** output, DataBlock** dataArray, int numData, int joinId, int version, uint64_t oldest, uint64_t projection, std::bitset<MAXQUERIES>& queries, int threadId, std::bitset<MAXQUERIES>&  active) {
	if (!tupleCnt)
		return 0;

	const int keyProbe = keyIndex_[joinId];
	assert(keyProbe != -1);
	const int buildOffset = joinIndex_[joinId];
	assert(buildOffset != -1);
	const int numKeys_t = numKeys_;
	const int hashBits_t = hashBits_;

	int* const dest = array_;
	int64_t* const chains = heads_;
	int** const project_t = project_;

	int resultSize = 0;

	for (int i = 0; i < numData; i++) {
		uint64_t outCount = 0;

		if (bufferBatchRemaining[threadId*16] == 0) {
			schema_->getBufferManager()->getBufferN(&bufferBatch[threadId*BUFFER_BATCH_SIZE], BUFFER_BATCH_SIZE);
			bufferBatchRemaining[threadId*16] = BUFFER_BATCH_SIZE;
		}

		bufferBatchRemaining[threadId*16] -= 2;

		std::bitset<MAXQUERIES>* outMask = (std::bitset<MAXQUERIES>*) bufferBatch[threadId*BUFFER_BATCH_SIZE + bufferBatchRemaining[threadId*16]];
		int* outIds = (int*) bufferBatch[threadId*BUFFER_BATCH_SIZE + bufferBatchRemaining[threadId*16]+1];

		DataBlock* data = dataArray[i];

		const int* keys = (int*) data->getColumn(keyProbe, buffer_ + (1 << 16)*threadId*numKeys_t);
		const std::bitset<MAXQUERIES> * dataMask =  data->getMask();
		const int* ids = data->getVIDSAll();

		int* indexList = data->getIndexList();
		int  indexListSize = data->getIndexListSize();

		int indexListLocal[MAXRELATIONS];
		int cols = 0;

		for (int i = 0; i < indexListSize; i++) {
			if ((((1ull) << indexList[i]) & projection)) {
				int dbIndex = indexList[i];
				indexListLocal[cols] = dbIndex;
				project_t[cols + (MAXRELATIONS+1)*threadId] = data->getVIDS(dbIndex);
				cols++;
			}
		}

		indexListSize = cols;

		uint64_t denominator = ((indexListSize+1)*sizeof(int) > sizeof(std::bitset<MAXQUERIES>)) ? (indexListSize+1)*sizeof(int) : sizeof(std::bitset<MAXQUERIES>);
		uint64_t capacity = schema_->getBufferManager()->getBlockSize()/denominator;
		if (capacity > 1024)
			capacity = 1024;

		assert(capacity*(indexListSize+1)*sizeof(int) <= schema_->getBufferManager()->getBlockSize());
		assert(capacity*sizeof(std::bitset<MAXQUERIES>) <= schema_->getBufferManager()->getBlockSize());

		uint64_t dataCount = data->getSize();
		std::bitset<MAXOPS> lineage = data->getLineage();	

		for (int i = 0; i < dataCount; i++) {
			std::bitset<MAXQUERIES> probeMask = dataMask[i] & queries;

			if (probeMask.any() == false) continue;

			if (true) {
				int probeKey = keys[i];
				int hval = (HASHT(probeKey) & ((1 << hashBits_t) - 1)) + (buildOffset << hashBits_t);
				int64_t cur = chains[hval];

				__builtin_prefetch(&dest[cur]);

				while (cur >= 0) {
					int buildKey = dest[cur+2*numKeys_t+buildOffset];
					int buildVersion = dest[cur+3*numKeys_t+1];
					int64_t next = *((int64_t*) &dest[cur+2*buildOffset]);

					__builtin_prefetch(&dest[next]);

					if (probeKey == buildKey && version >= snapshots_[buildVersion]) {
						//std::bitset<MAXQUERIES> buildMask = *((std::bitset<MAXQUERIES>*) &dest[cur+3*numKeys_t+2]);

						//buildMask = probeMask & buildMask & queries;

						//bool done = buildMask.any();

						bool done = testIntersectTriple((uint64_t*) &outMask[outCount], (uint64_t*) &dataMask[i], (uint64_t*) &dest[cur+3*numKeys_t+2], (uint64_t*) &queries);

						if (done) {
							//outMask[outCount] = buildMask;

							for (int j = 0; j < indexListSize; j++)
								outIds[outCount + j*capacity] = project_t[j + (MAXRELATIONS+1)*threadId][i];
							outIds[outCount + indexListSize*capacity] = dest[cur+3*numKeys_t];

							outCount++;

							if (outCount == capacity) {
								pack(output + resultSize, outIds, outMask, outCount, capacity, indexListLocal, indexListSize, lineage, joinId, threadId);

								if (bufferBatchRemaining[threadId*16] == 0) {
									schema_->getBufferManager()->getBufferN(&bufferBatch[threadId*BUFFER_BATCH_SIZE], BUFFER_BATCH_SIZE);
									bufferBatchRemaining[threadId*16] = BUFFER_BATCH_SIZE;
								}

								bufferBatchRemaining[threadId*16] -= 2;

								outMask = (std::bitset<MAXQUERIES>*) bufferBatch[threadId*BUFFER_BATCH_SIZE + bufferBatchRemaining[threadId*16]];
								outIds = (int*) bufferBatch[threadId*BUFFER_BATCH_SIZE + bufferBatchRemaining[threadId*16]+1];

								outCount = 0;

								resultSize++;
							}
						}
					}

					cur = next;
				}
			}
		}
		
		if (outCount != 0) {
			pack(output + resultSize, outIds, outMask, outCount, capacity, indexListLocal, indexListSize, lineage, joinId, threadId);
			resultSize++;		
		} else {
			bufferBatch[threadId*BUFFER_BATCH_SIZE + bufferBatchRemaining[threadId*16]] = (void*) outMask;
			bufferBatch[threadId*BUFFER_BATCH_SIZE + bufferBatchRemaining[threadId*16]+1] = (void*) outIds;
			bufferBatchRemaining[threadId*16] += 2;
		}
	}

	return resultSize;
}

int Stem::pruning (std::bitset<MAXQUERIES> * ret, DataBlock* data, int joinId, uint64_t oldest, std::bitset<MAXQUERIES> pass, std::bitset<MAXQUERIES> fail, std::bitset<MAXQUERIES> queries, int threadId) {
	if (data->initFlag)
		return pruningSelective(ret, data, joinId, oldest, pass, fail, queries, threadId);

	int cnt = 0;
	const int keyProbe = keyIndex_[joinId];
	const int buildOffset = joinIndex_[joinId];
	assert(keyProbe != -1);
	assert(buildOffset != -1);
	const int numKeys_t = numKeys_;

	const int* keys = (int*) data->getColumn(keyProbe, buffer_ + (1 << 16)*threadId*numKeys_);
	const std::bitset<MAXQUERIES>* dataMask =  data->getMask();

	int* const dest = array_;
	int64_t* const chains = heads_;

	uint64_t dataCount = data->getSize();

	int loops = 0;
	int matches = 0;

	for (int i = 0; i < dataCount; i++) {
		int probeKey = keys[i];
		int hval = (HASHT(probeKey) & ((1 << hashBits_) - 1)) + (buildOffset << hashBits_);
		int64_t	cur = chains[hval];
		std::bitset<MAXQUERIES>	val = fail;
		//__builtin_prefetch(&dest[cur]);

		bool resume = true;

		while (cur >= 0) {
			loops++;
			resume = true;
			int buildKey = dest[cur+2*numKeys_t+buildOffset];

			if ((probeKey == buildKey)) {
				val |= *((std::bitset<MAXQUERIES>*) &dest[cur+3*numKeys_t+2]);
			}

			cur = *((int64_t*) &dest[cur+2*buildOffset]);
				//__builtin_prefetch(&dest[cur]);
		}
			
		ret[i] = val;
	}

	return cnt;
}

int Stem::pruningSelective (std::bitset<MAXQUERIES> * ret, DataBlock* data, int joinId, uint64_t oldest, std::bitset<MAXQUERIES> pass, std::bitset<MAXQUERIES> fail, std::bitset<MAXQUERIES> queries, int threadId) {
	int cnt = 0;
	const int keyProbe = keyIndex_[joinId];
	const int buildOffset = joinIndex_[joinId];
	assert(keyProbe != -1);
	assert(buildOffset != -1);

	const int* keys = (int*) data->getColumn(keyProbe, buffer_ + (1 << 16)*threadId*numKeys_);
	const std::bitset<MAXQUERIES>* dataMask =  data->getMask();
	const int numKeys_t = numKeys_;

	int* const dest = array_;
	int64_t* const chains = heads_;

	uint64_t dataCount = data->getSize();

		
	for (int i = 0; i < dataCount; i++) {
		std::bitset<MAXQUERIES>	val = fail;

		int matches = 0;
		int loops = 0;

		if ((queries&dataMask[i]).any()) {
			int probeKey = keys[i];
			int hval = (HASHT(probeKey) & ((1 << hashBits_) - 1)) + (buildOffset << hashBits_);
			//__builtin_prefetch(&dest[cur]);

			bool resume = true;
			int64_t	cur = chains[hval];

			while (cur >= 0) {
				loops++;
				resume = true;
				int buildKey = dest[cur+2*numKeys_t+buildOffset];

				if ((probeKey == buildKey)) {
					val |= *((std::bitset<MAXQUERIES>*) &dest[cur+3*numKeys_t+2]);
				}

				cur = *((int64_t*) &dest[cur+2*buildOffset]);
				//__builtin_prefetch(&dest[cur]);
			}
		}
			
		ret[i] = val;
	}

	return cnt;
}

void Stem::pack (DataBlock** output, int* ids, std::bitset<MAXQUERIES> * mask, uint64_t cnt, uint64_t capacity, int* indexListProbe, int indexListProbeSize, std::bitset<MAXOPS> lineage, uint64_t joinId, int threadId) {
	if (blockBatchRemaining[threadId*16] == 0) {
		while(dallocator_lock_->test_and_set(std::memory_order_acquire));
		blockBatchRemaining[threadId*16] = dallocator_->popN(&blockBatch[threadId*BUFFER_BATCH_SIZE], BUFFER_BATCH_SIZE);
		dallocator_lock_->clear(std::memory_order_release);
	}
		
	blockBatchRemaining[threadId*16] -= 1;
	DataBlock* block = blockBatch[threadId*BUFFER_BATCH_SIZE + blockBatchRemaining[threadId*16]];

	int indexListBuild[1];
	indexListBuild[0] = table_;

	block->init(schema_, mask, ids, indexListProbe, indexListProbeSize, indexListBuild, 1, cnt, capacity);
	block->registerTarget(joinId);
	block->registerTargets(lineage);

	*output = block;
}

int Stem::findVersion (int version) {
	int minversion = 0;
	int maxversion = *version_;

	int sel = -1;
	int seli = -1;

	while (minversion <= maxversion) {
		int mid = (minversion + maxversion)/2;
		int midval = snapshots_[mid];

		if (midval < 0)
			midval = INT_MAX;

		if (midval < version) {
			sel = midval;
			seli = mid;
			minversion = mid+1;
		} else {
			maxversion = mid-1;
		}
	}

	return seli;
}
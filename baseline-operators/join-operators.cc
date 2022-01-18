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

#include "join-operators.h"

#include "../datablock/datablock.h"
#include "../frontend/schema.h"

uint64_t JoinOperator::intermediates = 0;

JoinOperator::JoinOperator (Schema* schema, const std::bitset<MAXQUERIES>& queries, int buildKey, int probeKey, uint64_t buildSchema, uint64_t probeSchema, int hashBits, std::atomic<uint64_t>* offset, uint64_t* array, AtomicStack<DataBlock>& dallocator, std::atomic_flag& dallocator_lock, bool istrue, int numthreads) 
		: Operator(queries, ((1ull) << schema->getColumnParent(buildKey)) | ((1ull) << schema->getColumnParent(probeKey)), dallocator, dallocator_lock), buildKey_(buildKey), probeKey_(probeKey), numthreads(numthreads) {

	submask = -1;

	if (istrue)
		ht = new(numa_alloc_onnode(sizeof(JoinHT), SOCKET)) JoinHT(schema, buildSchema, probeSchema, buildKey_, probeKey_, hashBits, submask, offset, array, dallocator, dallocator_lock);
	else
		ht = nullptr;

	cntleft = 0;
	cntright = 0;

	results_g = new(numa_alloc_onnode((1 << 14)*numthreads*sizeof(DataBlock*), SOCKET)) DataBlock*[(1 << 14)*numthreads];
	memset(results_g, 5, (1 << 14)*numthreads*sizeof(DataBlock*));

	for (int i = 0; i < MAXTHREADS; i++) {
		ctr[16*i] = 0;
	}
}

void JoinOperator::execute (int threadId) {
	DataBlock** results = results_g + (1 << 14)*threadId;

	//std::cout << threadId << ":" << ctr[16*threadId] << std::endl;

	int blockNum = ctr[16*threadId];

	for (int i = 0; i < blockNum; i++) {
			DataBlock* probeBlock = probeData_[threadId*30000+i];

			int resultSize = ht->probe(results, probeBlock, queries_, submask, threadId);

			std::bitset<MAXQUERIES> excl = ~queries_;
			std::bitset<MAXQUERIES> test = probeBlock->hasQuery(excl);
			if (test.any()) {
				probeBlock->filterQuery(excl);
			} else {
				garbageCollect(probeBlock, threadId);
			}

			for (int j = 0; j < resultSize; j++) {
				results[j]->setQuery(queries_);
				results[j]->initFlag = true;
	 
				results[j]->localized = false;
				JoinOperator::intermediates += results[j]->getSize();
				route(results[j], threadId);
			}
	}
}

void JoinOperator::consume (DataBlock* data, int threadId) {
	if (data->initFlag == false) {
		data->filterTrue();
		data->initFlag = true;
	}
	//route (data);
	if (data->hasColumn(buildKey_)) {
		//cntleft += data->getSize();

		ht->build(data, queries_, submask, threadId);

		std::bitset<MAXQUERIES> excl = ~queries_;
		std::bitset<MAXQUERIES> test = data->hasQuery(excl);
		if (test.any()) {
			data->filterQuery(excl);
		} else {
			garbageCollect(data, threadId);
		}
	} else if (data->hasColumn(probeKey_)) {
		//cntright += data->getSize();

		probeData_[threadId*30000+ctr[16*threadId]] = data;
		ctr[16*threadId]++;
		assert(ctr[16*threadId] < 30000);
	}
}

void JoinOperator::updateProjections () {
	Operator::updateProjections();

	if (ht != nullptr)
	ht->updateProjections(getProjections(), submask);
}

JoinHT::JoinHT (Schema* schema, uint64_t relations, uint64_t relationsProbe, int buildKey, int probeKey, int hashBits, int submask, std::atomic<uint64_t>* offset, uint64_t* array, AtomicStack<DataBlock>& dallocator, std::atomic_flag& dallocator_lock) : buildKey_(buildKey), probeKey_(probeKey), buildProjections_(relations), probeProjections_(relationsProbe), indexListSize_(0), offset_(*offset), dallocator_lock(dallocator_lock), dallocator(dallocator), schema_(schema) {
	maxSize_ = 0;

	while (relations) {
		int tbit = __builtin_ctzll(relations);

		if (schema_->getRowCount(tbit) > maxSize_)
			maxSize_ = schema_->getRowCount(tbit);

		indexList_[indexListSize_] = tbit;
		indexListSize_++;

		relations &= (relations-1);
	}

	this->hashBits = 1;

	while (maxSize_ > (1 << this->hashBits) && this->hashBits < 22) {
		this->hashBits = this->hashBits+1;
	}

	maxSize_ = ((((1ull) << 36)*0.5)/sizeof(int));

	tupleSize_ = indexListSize_*sizeof(int)+sizeof(int)+sizeof(int64_t);
	if (submask == -1) {
		tupleSize_ += sizeof(std::bitset<MAXQUERIES>);
	} else {
		tupleSize_ += sizeof(uint64_t);
	}
	tupleSize_ = ((tupleSize_ + 7)/8)*8/sizeof(int);

	data_ = (int*) array; //(int*) numa_alloc_onnode(tupleSize_*maxSize_*sizeof(int), SOCKET);
	heads_ = (int64_t*) numa_alloc_onnode((1 << this->hashBits)*sizeof(int64_t), SOCKET);

	for (int i = 0; i < (1 << this->hashBits); i++) {
		heads_[i] = -1;
	}

	for (int i = 0; i < MAXTHREADS; i++) {
		bufferBatchRemaining[i*16] = 0;
		blockBatchRemaining[i*16] = 0;
		buffer_[i] = (int*) numa_alloc_onnode((1 << 16)*sizeof(int), SOCKET);
		memset(buffer_[i], 5, (1 << 16)*sizeof(int));
	}
}

void JoinHT::updateProjections(uint64_t relations, int submask) {
	probeProjections_ &= relations;

	relations &= buildProjections_;
	buildProjections_ = relations;
	
	indexListSize_ = 0;

	while (relations) {
		int tbit = __builtin_ctzll(relations);

		indexList_[indexListSize_] = tbit;
		indexListSize_++;

		relations &= (relations-1);
	}

	tupleSize_ = indexListSize_*sizeof(int)+sizeof(int)+sizeof(int64_t);
	if (submask == -1) {
		tupleSize_ += sizeof(std::bitset<MAXQUERIES>);
	} else {
		tupleSize_ += sizeof(uint64_t);
	}
	tupleSize_ = ((tupleSize_ + 7)/8)*8/sizeof(int);
}

void:: JoinHT::finalize () {

}

bool testIntersectTripleJ (uint64_t* dest, uint64_t* probe, uint64_t* build) {
	uint64_t any = 0;
	for (int i = 0; i < MAXQUERIES/64; i++) {
		uint64_t intersect = probe[i] & build[i];
		dest[i] = intersect;
		any |= intersect;
	}

	return any;
}

bool testIntersectTripleJ2 (uint64_t* dest, uint64_t* probe, uint64_t* build, uint64_t* queries) {
	uint64_t any = 0;
	for (int i = 0; i < MAXQUERIES/64; i++) {
		uint64_t intersect = probe[i] & build[i] & queries[i];
		dest[i] = intersect;
		any |= intersect;
	}

	return any;
}

void JoinHT::build (DataBlock* data, std::bitset<MAXQUERIES>& queries, int submask, int threadId) {
	assert(submask < MAXQUERIES/64);

	data->getColumn(buildKey_, buffer_[threadId]);

	const int* keys = buffer_[threadId];
	
	const std::bitset<MAXQUERIES>* dataMask =  data->getMask();
	const int* ids = data->getVIDSAll();

	int* const dest = data_;
	int64_t* const chains = heads_;

	int** const project_t = &project_[32*threadId];

	const int hashBits_ = hashBits;

	uint64_t dataCount = data->getSize();

	int64_t numElementsLocal = offset_.fetch_add(tupleSize_*dataCount);


	if (numElementsLocal+tupleSize_*dataCount > maxSize_) {
		assert(numElementsLocal+tupleSize_*dataCount <= maxSize_);
	}

	for (int i = 0; i < indexListSize_; i++) {
		project_t[i] = data->getVIDS(indexList_[i]);
	}

	for (int i = 0; i < dataCount; i++) {
		int buildIdx = ids[i];
		//const std::bitset<MAXQUERIES>& buildMask = dataMask[i];

		uint64_t pos = numElementsLocal+tupleSize_*i;
		
		bool any = testIntersectTripleJ((uint64_t*) &dest[pos+3+indexListSize_], (uint64_t*) &dataMask[i], (uint64_t*) &queries);
		//*((std::bitset<MAXQUERIES>*) &dest[pos+3+indexListSize_]) = dataMask[i];
		//if (!any) continue;

			__builtin_prefetch(&dest[pos]);

			int key = keys[i];
			int hval = (HASHT(key) & ((1 << hashBits_) - 1));

			dest[pos+2] = key;

			for (int j = 0; j < indexListSize_; j++) {
				dest[pos+3+j] = project_t[j][i];
			}


			int64_t cur = pos;

			__atomic_exchange (&chains[hval], &cur, (int64_t*) &dest[pos], __ATOMIC_RELAXED);
	}

	__atomic_thread_fence(__ATOMIC_ACQ_REL);
}


int JoinHT::probe(DataBlock** output, DataBlock* data, std::bitset<MAXQUERIES>& queries, int submask, int threadId) {
	assert(submask < MAXQUERIES/64);

	int* const dest = data_;
	int64_t* const chains = heads_;
	int** const project_t = &project_[32*threadId];

	const int hashBits_ = hashBits;

	int resultSize = 0;

	uint64_t outCount = 0;

	if (bufferBatchRemaining[threadId*16] == 0) {
		schema_->getBufferManager()->getBufferN(&bufferBatch[threadId*BUFFER_BATCH_SIZE], BUFFER_BATCH_SIZE);
		bufferBatchRemaining[threadId*16] = BUFFER_BATCH_SIZE;
	}

	bufferBatchRemaining[threadId*16] -= 2;

	std::bitset<MAXQUERIES>* outMask = (std::bitset<MAXQUERIES>*) bufferBatch[threadId*BUFFER_BATCH_SIZE + bufferBatchRemaining[threadId*16]];
	int* outIds = (int*) bufferBatch[threadId*BUFFER_BATCH_SIZE + bufferBatchRemaining[threadId*16]+1];

	const int* keys = (int*) data->getColumn(probeKey_, buffer_[threadId]);
	const std::bitset<MAXQUERIES> * dataMask =  data->getMask();
	const int* ids = data->getVIDSAll();

	int* indexList = data->getIndexList();
	int  indexListSize = data->getIndexListSize();

	int indexListLocal[MAXRELATIONS];
	int cols = 0;

	uint64_t projection = probeProjections_;

	for (int i = 0; i < indexListSize; i++) {
		if ((((1ull) << indexList[i]) & projection)) {
			int dbIndex = indexList[i];
			indexListLocal[cols] = dbIndex;
			project_t[cols] = data->getVIDS(dbIndex);
			cols++;
		}
	}

	indexListSize = cols;

	uint64_t denominator = ((indexListSize+indexListSize_)*sizeof(int) > sizeof(std::bitset<MAXQUERIES>)) ? (indexListSize+indexListSize_)*sizeof(int) : sizeof(std::bitset<MAXQUERIES>);
	uint64_t capacity = schema_->getBufferManager()->getBlockSize()/denominator;
	if (capacity > 1024) capacity = 1024;

	assert(capacity*(indexListSize+indexListSize_)*sizeof(int) <= schema_->getBufferManager()->getBlockSize());
	assert(capacity*sizeof(std::bitset<MAXQUERIES>) <= schema_->getBufferManager()->getBlockSize());


	uint64_t dataCount = data->getSize();
	std::bitset<MAXOPS> lineage = data->getLineage();	

	//std::bitset<MAXQUERIES> buildMask;

	for (int i = 0; i < dataCount; i++) {
		std::bitset<MAXQUERIES> probeMask = dataMask[i] & queries;

		int probeKey = keys[i];
		int hval = (HASHT(probeKey) & ((1 << hashBits_) - 1));
		int64_t cur = chains[hval];

		if (probeMask.any() == false) continue;

		while (cur >= 0) {
			int buildKey = dest[cur+2];
			int64_t next = *((int64_t*) &dest[cur]);

			if (probeKey == buildKey) {
				//buildMask = *((std::bitset<MAXQUERIES>*) &dest[cur+3+indexListSize_]);

				//buildMask = (probeMask & buildMask) & queries;

				bool done = testIntersectTripleJ2((uint64_t*) &outMask[outCount], (uint64_t*) &dataMask[i], (uint64_t*) &dest[cur+3+indexListSize_], (uint64_t*) &queries);
				//bool done = testIntersectTripleJ((uint64_t*) &outMask[outCount], (uint64_t*) &probeMask, (uint64_t*) &dest[cur+3+indexListSize_]);

				if (done) {
				//if (buildMask.any()) {
					//outMask[outCount] = buildMask;

					for (int j = 0; j < indexListSize; j++)
						outIds[outCount + j*capacity] = project_t[j][i];

					for (int j = 0; j < indexListSize_; j++)
						outIds[outCount + (j+indexListSize)*capacity] = dest[cur+3+j];

					outCount++;

					if (outCount == capacity) {
						assert(resultSize < (1 << 14));
						pack(output + resultSize, outIds, outMask, outCount, capacity, indexListLocal, indexListSize, indexList_, indexListSize_, lineage, 0, threadId);

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
			
	if (outCount != 0) {
		pack(output + resultSize, outIds, outMask, outCount, capacity, indexListLocal, indexListSize, indexList_, indexListSize_, lineage, 0, threadId);
		resultSize++;		
	} else {
		bufferBatch[threadId*BUFFER_BATCH_SIZE + bufferBatchRemaining[threadId*16]] = (void*) outMask;
		bufferBatch[threadId*BUFFER_BATCH_SIZE + bufferBatchRemaining[threadId*16]+1] = (void*) outIds;
		bufferBatchRemaining[threadId*16] += 2;
	}

	return resultSize;
}


void JoinHT::pack (DataBlock** output, int* ids, std::bitset<MAXQUERIES> * mask, uint64_t cnt, uint64_t capacity, int* indexListProbe, int indexListProbeSize, int* indexListBuild, int indexListBuildSize, std::bitset<MAXOPS> lineage, uint64_t joinId, int threadId) {
	if (blockBatchRemaining[threadId*16] == 0) {
		while(dallocator_lock.test_and_set(std::memory_order_acquire));
		blockBatchRemaining[threadId*16] = dallocator.popN(&blockBatch[threadId*BUFFER_BATCH_SIZE], BUFFER_BATCH_SIZE);
		dallocator_lock.clear(std::memory_order_release);
	}
		
	blockBatchRemaining[threadId*16] -= 1;
	DataBlock* block = blockBatch[threadId*BUFFER_BATCH_SIZE + blockBatchRemaining[threadId*16]];

	block->init(schema_, mask, ids, indexListProbe, indexListProbeSize, indexListBuild, indexListBuildSize, cnt, capacity);
	block->registerTarget(joinId);
	block->registerTargets(lineage);

	*output = block;
}



























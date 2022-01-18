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

#ifndef STEM_H_
#define STEM_H_

#include "../memory/buffer-manager.h"
#include "../frontend/schema.h"
#include "../primitives/atomic-stack.h"
#include "../utilities/common.h"

#include <climits>
#include <atomic>
#include <emmintrin.h>
#include <immintrin.h>

#include <mutex>

/*
Stem stores base relation tuples
It provides a build/probe interface and is used in symmetric joins
Also it provides pruning methods which implement join pruning
*/
struct Stem {
	const uint64_t maxSize_;
	const int hashBits_;
	int* key_;
	const int table_;

	const int numthreads_;

	bool activated;

	int numKeys_;

	int compositeIndex_[8];
	int compositeIndexSize_;
	int64_t* compHeads_[8];
	int64_t* compNext_[8];
	int* compIdx_[8];
	int* compHash_[8];

	int* joinIndex_;
	int* keyIndex_;

	int* mainJoinIndex_;
	int* mainKeyIndex_;
	int* secJoinIndex_;
	int* secKeyIndex_;
	int* secOpIndex_;

	std::atomic<int>* version_;
	const int* const snapshots_;

	std::atomic_flag* version_lock_;

	int64_t* idIndex;

	int64_t* heads_;
	int* array_;
	int* buffer_;
	int* buffer2_;
	int* buffer3_;

	int tupleCnt;

	int** project_;

	Schema* schema_;

	std::atomic_flag bucket_lock;

	AtomicStack<DataBlock>* dallocator_;
	std::atomic_flag* dallocator_lock_;

	void* bufferBatch[MAXTHREADS*BUFFER_BATCH_SIZE];
	int bufferBatchRemaining[MAXTHREADS*16];

	DataBlock* blockBatch[MAXTHREADS*BUFFER_BATCH_SIZE];
	int blockBatchRemaining[MAXTHREADS*16];

public:
	Stem (Schema* schema, int* array, AtomicStack<DataBlock>* dallocator, std::atomic_flag* dallocator_lock, std::atomic_flag* version_lock, int* snapshots, std::atomic<int>* version, std::vector<int>& key, int table, int hashBits, uint64_t maxSize, int numthreads);

	~Stem ();

	void reset ();

	void registerTheta (int joinId, int mainKeyBuild, int mainKeyProbe, int secKeyBuild, int secKeyProbe, std::string op);

	void registerJoin (int joinId, int keyBuild, int keyProbe);

	/*auxilary index for composite key*/
	void buildAux (const int* ids, int* key1, int* key2, uint64_t size, int index, int64_t offset);

	int* build (DataBlock* data, int version, uint64_t offset, int threadId, std::bitset<MAXQUERIES>  active);

	int probe (DataBlock** output, DataBlock** dataArray, int numData, int joinId, int version, uint64_t oldest, uint64_t projection, std::bitset<MAXQUERIES>& queries, int threadId, std::bitset<MAXQUERIES>&  active);

	int pruning (std::bitset<MAXQUERIES> * ret, DataBlock* data, int joinId, uint64_t oldest, std::bitset<MAXQUERIES> pass, std::bitset<MAXQUERIES> fail, std::bitset<MAXQUERIES> queries, int threadId);

	int pruningSelective (std::bitset<MAXQUERIES> * ret, DataBlock* data, int joinId, uint64_t oldest, std::bitset<MAXQUERIES> pass, std::bitset<MAXQUERIES> fail, std::bitset<MAXQUERIES> queries, int threadId);

	void pack (DataBlock** output, int* ids, std::bitset<MAXQUERIES> * mask, uint64_t cnt, uint64_t capacity, int* indexListProbe, int indexListProbeSize, std::bitset<MAXOPS> lineage, uint64_t joinId, int threadId);

	int findVersion (int version);
};

#endif
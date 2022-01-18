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

#include "buffer-manager.h"
#include <cstdlib>
#include <cstring>
#include <cassert>
#include <iostream>
#include <numa.h>

#include "../utilities/common.h"

#define ALLOCA_STEP 16 

BufferManager::BufferManager (int node) : blockSize(BUFFER_SIZE), step(ALLOCA_STEP), node(node), cnt(0), poolSize(0) {
	pool = (void**) numa_alloc_onnode(BUFFER_POOL*sizeof(void*), SOCKET);
	spinlock.clear();

	freeBuffer(getBuffer());
}
BufferManager::BufferManager (uint64_t blockSize, int node) : blockSize(blockSize), step(ALLOCA_STEP), node(node), cnt(0), poolSize(0) {
	pool = (void**) numa_alloc_onnode(BUFFER_POOL*sizeof(void*), SOCKET);
	spinlock.clear();

	freeBuffer(getBuffer());
}
BufferManager::BufferManager (uint64_t blockSize, uint64_t step, int node) : blockSize(blockSize), step(step), node(node), cnt(0), poolSize(0) {
	pool = (void**) numa_alloc_onnode(BUFFER_POOL*sizeof(void*), SOCKET);
	spinlock.clear();

	freeBuffer(getBuffer());
}

BufferManager::~BufferManager () {
	for (uint64_t i = 0; i < allocations.size(); i++)
		free(allocations[i]);
}

void* BufferManager::getBuffer_ () {
	if (poolSize == 0) {
		cnt += step;
		char* buf = (char*) numa_alloc_onnode(blockSize*step+ALIGNMENT, node);
		while (((int64_t) buf) & (ALIGNMENT-1))
			buf++;
		memset(buf, 5, blockSize*step);
		assert(buf != nullptr);

		allocations.push_back(buf);

		for (uint64_t i = 0; i < step; i++) {
			pool[i] = buf + i*blockSize;
			poolSize++;
		}
	}

	void* ret = pool[poolSize - 1];
	poolSize--;

	return ret;
}

void* BufferManager::getBuffer () {
	while (spinlock.test_and_set(std::memory_order_acquire));

	void* ret = getBuffer_ ();

	spinlock.clear(std::memory_order_release);

	return ret;
}

void BufferManager::getBufferN (void** ret, int n) {
	while (spinlock.test_and_set(std::memory_order_acquire));

	if (poolSize > n) {
		poolSize -= n;

		for (int i = 0; i < n; i++) {
			ret[i] = pool[poolSize+i];
		}
	} else {
		for (int i = 0; i < n; i++)
			ret[i] = getBuffer_ ();
	}

	spinlock.clear(std::memory_order_release);
}

void  BufferManager::freeBuffer_ (void* buf) {
	pool[poolSize] = buf;
	poolSize++;
}

void  BufferManager::freeBuffer (void* buf) {
	while (spinlock.test_and_set(std::memory_order_acquire));

	freeBuffer_(buf);

	spinlock.clear(std::memory_order_release);
}

void  BufferManager::freeBufferN (void** buf, int n) {
	while (spinlock.test_and_set(std::memory_order_acquire));

	for (int i = 0; i < n; i++)
		freeBuffer_(buf[i]);

	spinlock.clear(std::memory_order_release);
}

uint64_t BufferManager::pendingBuffers () {
	return poolSize;
}

uint64_t BufferManager::getBlockSize () {
	return blockSize;
}
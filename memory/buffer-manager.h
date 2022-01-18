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

#ifndef BUFFER_MANAGER_H_
#define BUFFER_MANAGER_H_

#include <list>
#include <vector>
#include <atomic>
#include <stdint.h>

#define BUFFER_SIZE ((1 << 16))
#define BUFFER_POOL ((1 << 21))
#define ALIGNMENT ((1 << 12))

/*
BufferManager is RouLette's memory manager
It provides fixed-length buffers to callees
Buffers are eventually freed and returned to the buffer pool
The BufferManager has the following design choices:
- it is thread-safe
- it allows batching of allocations and frees to reduce overhead
- it batches syscalls (allocates BUFFER_POOL allocations in a single malloc)
*/
class BufferManager {
	void** pool;
	uint64_t poolSize;

	std::vector<void*> allocations;
	uint64_t blockSize;
	uint64_t step;
	int node;
	uint64_t cnt;

	std::atomic_flag spinlock;

	void* getBuffer_ ();
	void freeBuffer_ (void*);


public:
	BufferManager (int node);
	BufferManager (uint64_t blockSize, int node);
	BufferManager (uint64_t blockSize, uint64_t step, int node);
	~BufferManager ();

	void* getBuffer ();
	void getBufferN (void**, int n);
	void  freeBuffer (void*);
	void freeBufferN (void**, int n);
	uint64_t pendingBuffers ();
	uint64_t getBlockSize ();
};

#endif
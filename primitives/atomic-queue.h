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

#ifndef ATOMIC_QUEUE_
#define ATOMIC_QUEUE_

#include <atomic>
#include <cassert>
#include <numa.h>

#define QUEUE_CAPACITY_ ((1 << 19))
#define QUEUE_CAPACITY_MASK_ (QUEUE_CAPACITY_ - 1)

/*
atomic queue data structure, currently not in use
*/
template <class T>
class AtomicQueue {
	T** elements_;
	std::atomic<uint64_t> state_;

public:
	AtomicQueue () : state_(0) {
		elements_ = new(numa_alloc_onnode(QUEUE_CAPACITY_*sizeof(T*), 0)) T*[QUEUE_CAPACITY_];
	}

	int size () {
		uint64_t offset = state_.load(std::memory_order_acq_rel);
		uint64_t tail = offset & ((1L << 32) - 1);
		uint64_t head = offset >> 32;

		if (head >= tail)
			return 0;
		return tail - head;
	}

	int push (T* t) {
		uint64_t offset = state_.load(std::memory_order_acq_rel);
		uint64_t tail = offset & ((1L << 32) - 1);
		uint64_t head = offset >> 32;
		assert(tail < QUEUE_CAPACITY_ + head);
		elements_[tail & QUEUE_CAPACITY_MASK_] = t;
		state_.fetch_add(1, std::memory_order_acq_rel);
		return tail - head + 1;
	}

	int pushN (T** t, int n) {
		uint64_t offset = state_.load(std::memory_order_acq_rel);
		uint64_t tail = offset & ((1L << 32) - 1);
		uint64_t head = offset >> 32;
		assert(tail + n < QUEUE_CAPACITY_ + head);
		for (int i = 0; i < n; i++) {
			elements_[tail & QUEUE_CAPACITY_MASK_] = t[i];
			tail++;
		}
		state_.fetch_add(n, std::memory_order_acq_rel);
		return tail - head;
	}

	T* pop (bool& val) {
		uint64_t offset = state_.fetch_add(1L << 32, std::memory_order_acq_rel);
		uint64_t tail = offset & ((1L << 32) - 1);
		uint64_t head = offset >> 32;
		
		if (head >= tail) {
			uint64_t offset = state_.fetch_add(-(1L << 32), std::memory_order_acq_rel);
			val = true;
			return nullptr;
		}

		return elements_[head & QUEUE_CAPACITY_MASK_];
	}

	int popN (T** out, uint64_t n) {
		uint64_t offset = state_.fetch_add(n << 32, std::memory_order_acq_rel);
		uint64_t tail = offset & ((1L << 32) - 1);
		uint64_t head = offset >> 32;
		if (head >= tail) {
			uint64_t offset = state_.fetch_add(-(n << 32), std::memory_order_acq_rel);
			out[0] = nullptr;
			return 0;
		}

		if (head + n > tail) {
			uint64_t offset = state_.fetch_add(-((head + n - tail) << 32), std::memory_order_acq_rel);
			n = tail - head;
		}

		for (int i = 0; i < n; i++)
			out[i] = elements_[(head + i) & QUEUE_CAPACITY_MASK_];

		return n;
	}

	int popNSafe (T** out, uint64_t n) {
		uint64_t offset = state_.fetch_add(n << 32, std::memory_order_acq_rel);
		uint64_t tail = offset & ((1L << 32) - 1);
		uint64_t head = offset >> 32;

		for (int i = 0; i < n; i++)
			out[i] = elements_[(head + i) & QUEUE_CAPACITY_MASK_];

		return n;
	}
};

#endif
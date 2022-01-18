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

#ifndef ATOMIC_STACK_
#define ATOMIC_STACK_

#include <atomic>
#include <cassert>
#include <numa.h>
#include <cstdlib>

#include "../utilities/common.h"

#define STACK_CAPACITY_ ((1 << 24))

/*
stack data structure, currently used for recycling vector structures -- spinlock has been moved out of the stack to merge with other critical sections
*/
template <class T>
class AtomicStack {
	T** elements_;
	std::atomic<int> state_;

public:
	AtomicStack () : state_(0) {
		elements_ = new(numa_alloc_onnode(STACK_CAPACITY_*sizeof(T*), SOCKET)) T*[STACK_CAPACITY_];
	}

	void push (T* t) {
		int offset = state_.fetch_add(1, std::memory_order_acq_rel);
		assert(offset >=0 && offset < STACK_CAPACITY_);
		elements_[offset] = t;
	}

	void pushN (T** t, int n) {
		int offset = state_.fetch_add(n, std::memory_order_acq_rel);
		assert(offset < STACK_CAPACITY_);
		for (int i = 0; i < n; i++)
			elements_[offset + i] = t[i];
	}

	T* pop () {
		int offset = state_.fetch_add(-1, std::memory_order_acq_rel) - 1;
		if (offset < 0)
			return nullptr;

		return elements_[offset];
	}

	int popN (T** t, int n) {
		if (n > state_)
			n = state_;
		assert (n > 0);

		int offset = state_.fetch_add(-n, std::memory_order_acq_rel) - n;

		for (int i = 0; i < n; i++)
			t[i] = elements_[offset+i];
	
		return n;
	}
};

#endif
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

#ifndef MINI_HT_H_
#define MINI_HT_H_

#include <iostream>
#include <cassert>
#include "../utilities/common.h"

#define HTMAXSIZE 128
#define HTHASHBITS 7

/*hash table optimized for equality predicates*/
struct MiniHT {
	int heads[1 << HTHASHBITS];
	int values[HTMAXSIZE];
	std::bitset<MAXQUERIES> payloads[HTMAXSIZE];
	int next[HTMAXSIZE];
	int freeNode;

	MiniHT () {
		freeNode = -1;

		for (int i = 0; i < (1 << HTHASHBITS); i++)
			heads[i] = -1;

		for (int i = 0; i < HTMAXSIZE; i++) {
			next[i] = freeNode;
			freeNode = i;
		}
	}

	void updateQuery (std::map<int, int>& mapping) {
		for (int i = 0; i < (1 << HTHASHBITS); i++) {
			int cur = heads[i];

			while (cur != -1) {
				payloads[cur] = mapQueries(payloads[cur], mapping);

				cur = next[cur];
			}
		}
	}

	void insertVal (int val, std::bitset<MAXQUERIES> payload) {
		int hval = HASHT(val) & ((1 << HTHASHBITS) - 1);
		int it = heads[hval];

		while (it >= 0) {
			if (values[it] == val) {
				payloads[it] |= payload;
				return;
			}
			it = next[it];
		}

		int cur = freeNode;
		assert(cur >= 0);
		freeNode = next[freeNode];

		next[cur] = heads[hval];
		values[cur] = val;
		payloads[cur] = payload;
		heads[hval] = cur;
	}

	void deleteVal (int val) {
		int hval = HASHT(val) & ((1 << HTHASHBITS) - 1);

		int* ptr = &heads[hval];
		while (values[*ptr] != val) {
			ptr = &next[*ptr];
		}

		int cur = *ptr;
		*ptr = next[cur];
		next[cur] = freeNode;
		freeNode = cur;
	}

	void printVals () {
		for (int i = 0; i < (1 << HTHASHBITS); i++) {
			int cur = heads[i];

			while (cur != -1) {
				std::cout << values[cur] << " " << payloads[cur] << std::endl;
				cur = next[cur];
			}
		}

		std::cout << std::endl;
	}
};






#endif

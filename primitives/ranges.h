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

#include "../utilities/common.h"

#ifndef RANGES_H_
#define RANGES_H_

#define MAXPIVOTS 1024

/*
Range index is the novel optimization for grouped filters with arithmetic comparisons
*/
class RangeIndex {
	std::bitset<MAXQUERIES> accumulator;

	int pivots[MAXPIVOTS];
	std::bitset<MAXQUERIES> masks[MAXPIVOTS];

	int low[MAXPIVOTS];
	int high[MAXPIVOTS];

	int elements;

public:
	RangeIndex () : elements(0) {
		pivots[0] = INT_MIN;
		pivots[1] = INT_MAX;

		masks[0].reset();
		masks[0] = ~masks[0];
		masks[1].reset();
		masks[1] = ~masks[1];

		elements = 2;

		accumulator.reset();
	}

	void addGT (int l, std::bitset<MAXQUERIES> queries) {
		addGE(l+1, queries);
	}

	void addLE (int h, std::bitset<MAXQUERIES> queries) {
		addLT(h+1, queries);
	}

	void addGE (int l, std::bitset<MAXQUERIES> queries) {
		assert(elements < MAXPIVOTS);

		int pos = -1;

		for (int i = 0; i < elements; i++) {
			if (pivots[i] >= l) {
				pos = i;
				break;
			}
		}

		if (pos == -1) {
			assert(false);
		} else {
			if (pivots[pos] > l) {
				for (int i = elements-1; i >= pos; i--) {
					pivots[i+1] = pivots[i];
					masks[i+1] = masks[i];
				}

				pivots[pos] = l;
				masks[pos] = masks[pos-1];

				elements++;
			}

			for (int i = 0; i < pos; i++) {
				masks[i] &= ~queries;
			}
		}

		accumulator |= queries;
	}

	void addLT (int h, std::bitset<MAXQUERIES> queries) {
		assert(elements < MAXPIVOTS);

		int pos = -1;

		for (int i = 0; i < elements; i++) {
			if (pivots[i] >= h) {
				pos = i;
				break;
			}
		}

		if (pos == -1) {
			assert(false);
		} else {
			if (pivots[pos] > h) {
				for (int i = elements-1; i >= pos; i--) {
					pivots[i+1] = pivots[i];
					masks[i+1] = masks[i];
				}

				pivots[pos] = h;
				masks[pos] = masks[pos-1];

				elements++;
			}

			for (int i = pos; i < elements; i++) {
				masks[i] &= ~queries;
			}
		}

		accumulator |= queries;
	}

	void addXX (int l, int h, int q) {
		std::bitset<MAXQUERIES> queries;
		queries.set(q);
		addGT(l, queries);
		addLT(h, queries);
	}

	void addIX (int l, int h, int q) {
		std::bitset<MAXQUERIES> queries;
		queries.set(q);
		addGE(l, queries);
		addLT(h, queries);
	}

	void addXI (int l, int h, int q) {
		std::bitset<MAXQUERIES> queries;
		queries.set(q);
		addGT(l, queries);
		addLE(h, queries);
	}

	void addII (int l, int h, int q) {
		std::bitset<MAXQUERIES> queries;
		queries.set(q);
		addGE(l, queries);
		addLE(h, queries);
	}

	void print () {
		for (int i = 0; i < elements; i++) {
			std::cout << pivots[i] << "\t\t" << masks[i] << std::endl;
		}
	}

	int lookup (int p) {
		for (int i = 0; i < elements-1; i++) {
			if (pivots[i+1] > p) {
				return i;
			}
		}

		assert(false);
		return -1;
	}

	std::bitset<MAXQUERIES> getAccumulator () {
		return accumulator;
	}

	/*lookup is a binary search*/
	std::bitset<MAXQUERIES>  lookupOpt (int p) {
		int mini = 0;
		int maxi = elements;

		while (mini < maxi) {
			int midi = (mini+maxi+1)/2;

			int midval = pivots[midi];

			if (midval > p) {
				maxi = midi-1;
			} else {
				mini = midi;
			}
		}

		assert(pivots[mini] <= p && pivots[mini+1] > p);
		return masks[mini] & accumulator;
	}

	void validate (int p) {
		for (int i = 0; i < elements-1; i++) {
			if (pivots[i+1] > p) {
				std::cout << p << " and " << pivots[i] << std::endl;
				for (int j = 1; j < 5; j++) {
					if (masks[i].test(j)) {
						std::cout << p << " in " << "[" << low[j] << "," << high[j] << ")" << std::endl;
					} 
				}

				return;
			}
		}

		assert(false);
	}
};

#endif
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

#ifndef HT_BUCKET_H_
#define HT_BUCKET_H_


#define HT_BUCKET_SIZE 4
#define HT_BUCKET_NUM (16*1024*1024)
#define HT_BUCKET_NUM2 (8*1024)
#define HT_BUCKET_RANGE (1024*1024)


/*
HTBuckets are the data structures used for Q-learning
*/

struct HTBucket1 {
	int next;
	int elements;
	std::bitset<MAXQUERIES> qId[HT_BUCKET_SIZE];
	uint64_t sId[HT_BUCKET_SIZE];
	int jId[HT_BUCKET_SIZE];
	double qVal[HT_BUCKET_SIZE];
	std::bitset<MAXQUERIES> queries;
};

struct HTBuckettized1 {
	//HTBucket1 buckets[HT_BUCKET_NUM];
	HTBucket1* buckets;
	int freeHead;

	int heads[HT_BUCKET_RANGE];

	int elements;

	int size;

	HTBuckettized1 (bool join) {
		elements = 0;

		for (int i = 0; i < HT_BUCKET_RANGE; i++) {
			heads[i] = -1;
		}

		if (join) {
			size = HT_BUCKET_NUM;
			buckets = (HTBucket1*) numa_alloc_onnode(HT_BUCKET_NUM*sizeof(HTBucket1), SOCKET);
		} else {
			size = HT_BUCKET_NUM2;
			buckets = (HTBucket1*) numa_alloc_onnode(HT_BUCKET_NUM2*sizeof(HTBucket1), SOCKET);
		}

		for (int i = 0; i < size; i++) {
			buckets[i].next = i+1;
			buckets[i].elements = 0;
		}

		buckets[size-1].next = -1;

		freeHead = 0;
	}

	uint64_t hashbitset (std::bitset<MAXQUERIES> b) {
		std::hash<std::bitset<MAXQUERIES> > fn;
		return fn(b);
	}

	void reset () {
		elements = 0;

		for (int i = 0; i < HT_BUCKET_RANGE; i++) {
			heads[i] = -1;
		}

		for (int i = 0; i < size; i++) {
			buckets[i].next = i+1;
			buckets[i].elements = 0;
		}

		buckets[size-1].next = -1;

		freeHead = 0;
	}

	int hash (uint64_t x, uint64_t y, int z) {
		return ((8925401ull*(x ^ (x >> 20))+3899761ull*(y ^ (y >> 20))+5671669ull*z+2925211ull)) & (((1ull) << 30) - 1);
	}

	double update1 (std::bitset<MAXQUERIES> x, uint64_t y, int z, std::bitset<MAXQUERIES> active, double alpha, double delta) {
		double* qval = getOrCreate1(x, y, z, active);
		qval[0] = (1-alpha)*qval[0]+alpha*delta;
	}

	double update2 (uint64_t y, int z, std::bitset<MAXQUERIES> active, double alpha, double delta) {
		double* qval = getOrCreate2(y, z, active);
		qval[0] = (1-alpha)*qval[0]+alpha*delta;
	}

	double* getOrCreate1 (std::bitset<MAXQUERIES> x, uint64_t y, int z, std::bitset<MAXQUERIES> active) {
		uint64_t hx = hashbitset(x);
		int hval = hash(hx, y, z) & (HT_BUCKET_RANGE-1);

		int curBucket = heads[hval];

		while (curBucket != -1) {
			int offset = buckets[curBucket].elements;

			for (int i = 0; i < offset; i++) {
				if (buckets[curBucket].sId[i] == y && buckets[curBucket].jId[i] == z && buckets[curBucket].qId[i] == x) {
					return &buckets[curBucket].qVal[i];
				}
			}

			curBucket = buckets[curBucket].next;
		}

		return insert1(x,y,z,active);
	}

	double* getOrCreate2 (uint64_t y, int z, std::bitset<MAXQUERIES> active) {
		uint64_t hx = 1;
		int hval = hash(hx, y, z) & (HT_BUCKET_RANGE-1);

		int curBucket = heads[hval];

		while (curBucket != -1) {
			int offset = buckets[curBucket].elements;

			for (int i = 0; i < offset; i++) {
				if (buckets[curBucket].sId[i] == y && buckets[curBucket].jId[i] == z) {
					return &buckets[curBucket].qVal[i];
				}
			}

			curBucket = buckets[curBucket].next;
		}

		return insert2(y,z,active);
	}

	double* insert1 (std::bitset<MAXQUERIES> x, uint64_t y, int z, std::bitset<MAXQUERIES> active) {
		bool check = false;

		uint64_t hx = hashbitset(x);
		int hval = hash(hx, y, z) & (HT_BUCKET_RANGE-1);

		int curBucket = heads[hval];

		if (curBucket == -1 || buckets[curBucket].elements == HT_BUCKET_SIZE) {
			int newBucket = freeHead;
			if (newBucket == -1) {
				//std::cout << elements << std::endl;
				assert(newBucket != -1);
			}
			freeHead = buckets[newBucket].next;

			buckets[newBucket].next = curBucket;
			buckets[newBucket].elements = 0;
			buckets[newBucket].queries = 0;
			heads[hval] = newBucket;
			curBucket = newBucket;

			check = true;
		}

		/*garbage collection*/
		if (check) {
			int clipBucket = curBucket;
			while (buckets[clipBucket].next >= 0) {
				int succ = buckets[clipBucket].next;

				if ((buckets[succ].queries & active) == 0) {
					int last = succ;
					while (buckets[last].next >= 0) {
						last = buckets[last].next;
					}

					buckets[last].next = freeHead;
					freeHead = succ;
					buckets[clipBucket].next = -1;

					break;
				}
				clipBucket = succ;
			}
		}

		elements++;

		int offset = buckets[curBucket].elements;

		buckets[curBucket].qId[offset] = x;
		buckets[curBucket].sId[offset] = y;
		buckets[curBucket].jId[offset] = z;
		buckets[curBucket].qVal[offset] = 0.0;

		buckets[curBucket].queries |= x;
		buckets[curBucket].elements = offset+1;

		return &buckets[curBucket].qVal[offset];
	}

	double* insert2 (uint64_t y, int z, std::bitset<MAXQUERIES> active) {
		bool check = false;

		uint64_t hx = 1;
		int hval = hash(hx, y, z) & (HT_BUCKET_RANGE-1);

		int curBucket = heads[hval];

		if (curBucket == -1 || buckets[curBucket].elements == HT_BUCKET_SIZE) {
			int newBucket = freeHead;
			if (newBucket == -1) {
				std::cout << elements << std::endl;
				assert(newBucket != -1);
			}
			freeHead = buckets[newBucket].next;

			buckets[newBucket].next = curBucket;
			buckets[newBucket].elements = 0;
			buckets[newBucket].queries = 0;
			heads[hval] = newBucket;
			curBucket = newBucket;

			check = true;
		}

		/*garbage collection*/
		if (check) {
			int clipBucket = curBucket;
			while (buckets[clipBucket].next >= 0) {
				int succ = buckets[clipBucket].next;

				if ((buckets[succ].queries & active).any() == false) {
					int last = succ;
					while (buckets[last].next >= 0) {
						last = buckets[last].next;
					}

					buckets[last].next = freeHead;
					freeHead = succ;
					buckets[clipBucket].next = -1;

					break;
				}
				clipBucket = succ;
			}
		}

		elements++;

		int offset = buckets[curBucket].elements;

		buckets[curBucket].sId[offset] = y;
		buckets[curBucket].jId[offset] = z;
		buckets[curBucket].qVal[offset] = 0.0;

		buckets[curBucket].elements = offset+1;

		return &buckets[curBucket].qVal[offset];
	}

	double lookup1 (std::bitset<MAXQUERIES> x, uint64_t y, int z) {
		uint64_t hx = hashbitset(x);
		int hval = hash(hx, y, z) & (HT_BUCKET_RANGE-1);

		int curBucket = heads[hval];

		while (curBucket != -1) {
			int offset = buckets[curBucket].elements;

			for (int i = 0; i < offset; i++) {
				if (buckets[curBucket].sId[i] == y && buckets[curBucket].jId[i] == z && buckets[curBucket].qId[i] == x) {
					return buckets[curBucket].qVal[i];
				}
			}

			curBucket = buckets[curBucket].next;
		}

		return -38.57945898;
	}

	double lookup2 (uint64_t y, int z) {
		uint64_t hx = 1;
		int hval = hash(hx, y, z) & (HT_BUCKET_RANGE-1);

		int curBucket = heads[hval];

		while (curBucket != -1) {
			int offset = buckets[curBucket].elements;

			for (int i = 0; i < offset; i++) {
				if (buckets[curBucket].sId[i] == y && buckets[curBucket].jId[i] == z) {
					return buckets[curBucket].qVal[i];
				}
			}

			curBucket = buckets[curBucket].next;
		}

		return -9.329;
	}
};








#endif
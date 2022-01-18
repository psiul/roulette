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

#ifndef COMMON_H_
#define COMMON_H_

#include <vector>
#include <emmintrin.h>
#include <immintrin.h>
#include <stdint.h>

#include <map>
#include <bitset>

#define EPISODE_LOGGING

#define MAXTHREADS 12
#define SOCKET 1

#define NULL_VALUE ((-1))

#define MAXRELATIONS 63
#define MAXQUERIES 64
#define MAXOPS 160

#define MEGABUFFER_SIZE (((1ull) << 33))
#define MEGABUFFER_MASK (MEGABUFFER_SIZE-1)

#define BUFFER_BATCH_SIZE 8

void getAffinityTable (int* mapping);

#define HASHT(X)  ((X) ^ ((X) >> 16))

#define HASHT2(X)  (0x85ebca6b*(X)+0xc2b2ae35)



inline int hasht2(int x) {
	x = x ^ (x >> 16);
	x *= 0x85ebca6b;
	x = x ^ (x >> 13);
	x *= 0xc2b2ae35;
	x = x ^ (x >> 16);
	return x;
}

inline __m128i hashv(__m128i x) {
    __m128i sft = _mm_srli_epi32(x, 16);
    return _mm_xor_si128(x, sft);
}

inline std::bitset<MAXQUERIES> mapQueries(std::bitset<MAXQUERIES> queries, std::map<int, int> mapping) {
	std::bitset<MAXQUERIES> newQueries = 0;
	for (int i = 0; i < MAXQUERIES; i++) {
		if (queries.test(i))
			newQueries.set(mapping[i]);
	}
	return newQueries;
}

char* customtok (char* ptr, char delim);

char* customtokn (char* ptr, char delim, int n);

void heapify (int* border, int* meta, float* est, int n);

void heapMaintenance (int* border, int* meta, float* est, int n, int i = 0);

void heapInsert (int* border, int* meta, float* est, int n);

bool checkHeap (int* border, float* est, int i, int n);


#endif

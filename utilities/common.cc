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

#include "common.h"

#include <cassert>
#include <climits>
#include <numa.h>
#include <iostream>

double timer;
int64_t intermediate_filters;
int64_t intermediate_enter;
int64_t intermediate_joins;

void getAffinityTable (int* mapping) {
	//for (int i = 0; i < NUMTHREADS; i++)
	//	mapping[i] = (i+1)%8;

	//for (int i = 0; i < MAXTHREADS; i++)
	//	mapping[i] = 2*i + 2;

	for (int i = 0; i < MAXTHREADS; i++)
		mapping[i] = 2*i + 1;
}

char* customtok (char* ptr, char delim) {
	static char* cur = nullptr;

	if (ptr != nullptr)
		cur = ptr;

	if (cur == nullptr)
		return nullptr;

	char* ret = cur;

	while (*cur != delim && *cur != '\0')
		cur++;

	if (*cur == delim) {
		*cur = '\0';
		cur++;
	}

	return ret;
}

char* customtokn (char* ptr, char delim, int i) {
	char* last = nullptr;
	bool inquote = false;
	bool escape = false;

	do {
		last = ptr;

		while ((*ptr != delim || inquote) && *ptr != '\0') {
			if (*ptr == '\"' && !escape)
				inquote = !inquote;
			
			if (*ptr == '\\')
				escape = true;
			else
				escape = false;

			ptr++;
		}

		*ptr = '\0';

		ptr++;

		i--;
	} while (i >= 0);

	if (*last == '\"') {
		last++;

		ptr = last;

		while (*ptr != '\0') {
			if (*ptr == '\"')
				*ptr = '\0';
			ptr++;
		}
	}

	return last;
}

void heapify (int* border, int* meta, float* est, int n) {
	for (int i = n/2 - 1; i  >= 0; i--)
		heapMaintenance(border, meta, est, n, i);
}

void heapMaintenance (int* border, int* meta, float* est, int n, int i) {
	bool resume = true;

	while (resume) {
		int mini = -1;
		float minv = est[i];

		if (2*i+1 < n && est[2*i+1] < minv) {
			mini = 2*i+1;
			minv = est[2*i+1];
		}

		if (2*i+2 < n && est[2*i+2] < minv) {
			mini = 2*i+2;
			minv = est[2*i+2];
		}

		if (mini < 0) {
			resume = false;
		} else {
			int tmpBorder = border[i];
			int tmpMeta = meta[i];
			float tmpEst = est[i];

			border[i] = border[mini];
			meta[i] = meta[mini];
			est[i] = est[mini];

			border[mini] = tmpBorder;
			meta[mini] = tmpMeta;
			est[mini] = tmpEst;

			i = mini;
		}
	}
}

void heapInsert (int* border, int* meta, float* est, int n) {
	bool resume = true;
	int i = n-1;

	while (resume && i > 0) {
		int parent = (i-1)/2;

		if (est[i] < est[parent]) {
			int tmpBorder = border[i];
			int tmpMeta = meta[i];
			int tmpEst = est[i];

			border[i] = border[parent];
			meta[i] = meta[parent];
			est[i] = est[parent];

			border[parent] = tmpBorder;
			meta[parent] = tmpMeta;
			est[parent] = tmpEst;

			i = parent;
		} else {
			resume = false;
		}
	}
}

bool checkHeap (int* border, float* est, int i, int n) {
	for (int i = 1; i < n; i++)
		if (est[0] > est[i]+0.00001)
			return false;
	return true;
}

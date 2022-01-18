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

#ifndef PARTITIONER_H_
#define PARTITIONER_H_

#include "../memory/buffer-manager.h"
#include "../frontend/schema.h"
#include "../primitives/atomic-stack.h"
#include "../utilities/common.h"

#include <climits>
#include <atomic>
#include <emmintrin.h>
#include <immintrin.h>

#define WIDTH 128

/*
Partitioner takes shared output vectors
It multicasts tuples to output buffers per query, then applies the aggregation for each query
*/
class Partitioner {
	uint64_t projections;

	Schema* schema;
	int* outBuffer;
	uint64_t outNum[128*MAXQUERIES*MAXTHREADS];

	uint64_t localNum[(MAXQUERIES/64)*MAXTHREADS]; 
	int localIds[(MAXQUERIES/64)*WIDTH*MAXTHREADS];
	uint64_t localMasks[(MAXQUERIES/64)*WIDTH*MAXTHREADS];

	std::map<int, int*> columns;

	std::vector<int> opVector;
	std::vector<int> colVector;
	std::vector<int> valVector[MAXTHREADS];
	std::map<int, std::pair<int, int> > queryIndex;

public:
	Partitioner (Schema* schema);

	void addColumn (int col);
	void reset ();

	void startQuery(int queryId);

	void addAggregation(int queryId, std::string op, int col);

	uint64_t getProjections ();

	/*print results*/
	void flush ();

	/*do routing and aggregations*/
	void partition (DataBlock** dataArray, int numData, int threadId);
};

#endif
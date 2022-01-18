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

#include "projector.h"

Projector::Projector (int n) : operatorMask(0), projectionMask(0), n(n) {
	n  = MAXOPS;
	this->n = MAXOPS;

	operators = new uint64_t[n];
	operatorCols = new uint64_t[n];

	for (int i = 0; i < n; i++) {
		operators[i] = 0;
		operatorCols[i] = 0;
	}

	bitfilter.reset();
	for (int i = 0; i < 64; i++) {
		bitfilter.set(i);
	}
}

void Projector::destroy () {
	delete[] operators;
	delete[] operatorCols;
}

void Projector::reset () {
	for (int i = 0; i < n; i++) {
		operators[i] = 0;
		operatorCols[i] = 0;
	}

	operatorMask.reset();
	projectionMask = 0;
}

void Projector::merge (Projector* master) {
	for (int i = 0; i < master->n; i++) {
		operators[i] |= master->operators[i];
		operatorCols[i] |= master->operatorCols[i];
	}

	operatorMask |= master->operatorMask;
	projectionMask |= master->projectionMask;
}

void Projector::registerOperator (int op, int table1, int table2) {
	assert(op < n);
	operators[op] = 0;
	operators[op] |= (1ull) << table1;
	operators[op] |= (1ull) << table2;
	operatorMask.set(op);
}

void Projector::registerOperatorColumns (int op, int col1, int col2) {
	assert(op < n);
	operatorCols[op] = (1ull) << col1;
	operatorCols[op] = (1ull) << col2;
	operatorMask.set(op);
}

void Projector::registerProjections (int col) {
	projectionMask |= (1ull) << col;
}

uint64_t Projector::getWantedColumns (const std::bitset<MAXOPS>& lineage) {
	uint64_t wantedColumns = 0;
	std::bitset<MAXOPS> joinsRemaining = operatorMask & (~lineage);

	int base = 0;

	while (joinsRemaining.any()) {
		uint64_t joinsRemainingInner = (joinsRemaining & bitfilter).to_ullong();

		while (joinsRemainingInner != 0) {
			int offset = __builtin_ctzll(joinsRemainingInner) + base;
			wantedColumns |= operators[offset];
			joinsRemainingInner &= (joinsRemainingInner-1);
		}

		joinsRemaining >>= 64;
		base += 64;
	}

	wantedColumns |= projectionMask;
	return wantedColumns;
}

int Projector::getOperatorCount () {
	return n;
}
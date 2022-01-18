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

#ifndef PROJECTOR_H_
#define PROJECTOR_H_

#include <bitset>
#include <cassert>
#include <iostream>
#include "../utilities/common.h"

/*Projections are incorporated in joins
The Projector provides a bitset with the required tables so that the remaining vids can be dropped*/
struct Projector {
	uint64_t* operators;
	uint64_t* operatorCols;
	std::bitset<MAXOPS>  operatorMask;
	uint64_t  projectionMask;
	int n;

	std::bitset<MAXOPS> bitfilter;

public:
	Projector (int);

	void destroy ();

	void reset ();

	/*copy required tables from another projector*/
	void merge (Projector* master);

	/*register the tables of a join*/
	void registerOperator (int, int, int);

	/*register the columns of a join*/
	void registerOperatorColumns (int, int, int);

	/*register the output tables of a query*/
	void registerProjections (int);

	/*vids that need to be kept for future operators*/
	uint64_t getWantedColumns (const std::bitset<MAXOPS>&);

	int getOperatorCount ();
};



#endif
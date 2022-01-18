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

/**
DataBlock class: the class that encapsulates the data that operators consume
*/

#ifndef DATABLOCK_H_
#define DATABLOCK_H_

#include <vector>
#include <bitset>
#include <stdint.h>
#include "../utilities/common.h"
#include "../memory/buffer-manager.h"


class Schema;


/*Class for late materialized vectors
Includes methods for applying filters, materialization and adjusting query sets*/
struct DataBlock {
	bool 					initFlag;

	/*number of tuples*/
	uint64_t				size;
	/*allocated size per column/table*/
	uint64_t 				width;

	uint64_t				trait;
	bool localized;

	/*buffer including all virtual ids*/
	int* 					idsAll;

	/*lookup table for locating vids of a table*/
	int*					idsIndex[MAXRELATIONS];

	/*vector and tuple query sets*/
	std::bitset<MAXQUERIES>	queryMask;
	std::bitset<MAXQUERIES>* mask;

	/*tables contained in the vector*/
	int 					indexListSize;
	int						indexList[MAXRELATIONS+1];

	std::bitset<MAXOPS>		lineage;

	Schema*					schema;

	void 					init (Schema* schema, int tableId, std::bitset<MAXQUERIES>* mask, int* index, uint64_t size, uint64_t width);
	void 					init (Schema* schema, std::bitset<MAXQUERIES>* mask, std::vector<int*>& index, std::vector<int>& indexList, uint64_t size, uint64_t width);
	void 					init (Schema* schema, std::bitset<MAXQUERIES>* mask, int* index, std::vector<int>& indexList, uint64_t size, uint64_t width);
	void 					init (Schema* schema, std::bitset<MAXQUERIES>* mask, int* index, int* indexListProbe, int indexListProbeSize, int* indexListBuild, int indexListBuildSize, uint64_t size, uint64_t width);

	/*Apply a bitset to update the query sets*/
	void					update(bool* newmask, int queryId);
	void 					filter(bool* mask);
	void 					filter(std::bitset<MAXQUERIES>* mask);
	void 					filterAnd(std::bitset<MAXQUERIES>* newmask);
	void 					filterAnd2(std::bitset<MAXQUERIES>* newmask);
	void 					filterTrue();
	void 					applyConstraint(uint64_t mask, std::bitset<MAXQUERIES>& query, void* buf1, void* buf2);

	void 					freeBuffers ();

	uint64_t				getSize ();
	int*					getIds (int);
	std::bitset<MAXQUERIES>* getMask ();
	int* 					getVIDSAll ();
	/*get virtual ids of the table*/
	int*					getVIDS (int) const;
	/*materialize column*/
	void*					getColumn (int, void* column = nullptr);
	void*					getColumnSparse (int, char*, void* column = nullptr);

	bool					hasColumn (int);

	int*					getIndexList ();
	int 					getIndexListSize ();

	Schema* 				getSchema ();

	void 					registerTarget (int id);
	void 					registerTargets (const std::bitset<MAXOPS>& bitmask);
	bool 					isTarget (int id);
	std::bitset<MAXOPS>	 	getLineage ();

	std::bitset<MAXQUERIES> 				hasQuery (const std::bitset<MAXQUERIES>&);
	void 	 				setQuery (const std::bitset<MAXQUERIES>&);

	/*filter keeps only tuples with relevant query sets*/
	void 					filterQuery (const std::bitset<MAXQUERIES>&);
	std::bitset<MAXQUERIES> 				getQuery ();

	uint64_t 				getTrait ();
	void 					setTrait (uint64_t);

	int 					checkSum ();

	DataBlock* 				copy ();
};

#endif
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

#ifndef DICTIONARY_H_
#define DICTIONARY_H_

#include "../utilities/common.h"
#include "../expressions/types.h"

#include <iostream>
#include <string>
#include <cstdio>
#include <algorithm>
#include <vector>
#include <cstring>
#include <numa.h>
#include <regex.h>

#include <cassert>


#define BUFFER_LEN_ 10000 

class Dictionary {
	std::string relPath;
	int fieldNo;
	std::vector<std::string> entries;
	int capacity_;

	DataTypeEnum type_;

	char* line;

public:
	/*create dictionary from a file
	key:value is sorted by keys
	relPath: path of relation
	fieldNo: field that dictionary refers to
	n: number of lines in file
	txt: read from csv (true) or use prebuild dictionary (false)
	delim: CSV delimiter
	type: type of column (string or date)*/
	Dictionary (std::string relPath, int fieldNo, int n, bool txt, char delim, DataTypeEnum type);

	std::string getRel ();

	std::vector<std::string>& getEntries ();


	/*write dictionary to a cached key:value file*/
	void cache ();

	/*allocate filter array for string-processing operations*/
	int* allocateFilter ();

	/*de-allocate filter array for string-processing operations*/
	void freeFilter (int* array);

	/*populate filter using a regex*/
	void populateFilter (int* output, regex_t* rex, int threadId, int threadNum);

	/*populate filter using disjunction of regexes in expr*/
	void populateFiltersOr (int* output, const std::string& expr, int threadId, int threadNum);

	/*populate filter using conjunction of regexes in expr*/
	void populateFiltersAnd (int* output, const std::string& expr, int threadId, int threadNum);

	/*populate filter using in predicate*/
	void populateSet (int* output, const std::string& expr, int threadId, int threadNum);

	/*convert string to key using binary search*/
	int mapDictionary (const std::string& val, bool strict = false);

	/*convert string to key using binary search - interpolate value for missing keys -- use in cardinality estimation*/
	int mapDictionary2 (const std::string& val, bool strict = false);

	std::string& getValue (int i);
};
















#endif

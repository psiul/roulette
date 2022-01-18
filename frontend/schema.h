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

#ifndef SCHEMA_H_
#define SCHEMA_H_

#include <map>
#include <vector>
#include <iostream>
#include <unistd.h>
#include <fcntl.h>
#include <string>
#include <climits>
#include "../expressions/types.h"
#include "../datablock/datablock.h"
#include "../dictionary/dictionary.h"

struct Statistics {
	int distinct;
	int min;
	int max;

	Statistics (int* column, uint64_t n);
};

struct StatisticsVector {
	std::vector<Statistics>  fieldStatistics;
	uint64_t cardinality;

	StatisticsVector (std::vector<void*> fieldData, uint64_t rowCount) : cardinality(rowCount) {
		for (int i = 0; i < fieldData.size(); i++) {
			int* column = (int*) fieldData[i];
			fieldStatistics.emplace_back(column, rowCount);
		}
	}
};

class Table {
	std::map<std::string, int>		reverseIndex;

	std::map<std::string, Dictionary*> dictIndex; 		

	std::vector<std::string>       	fieldNames;
	std::vector<DataType*>        	fieldTypes;
	std::vector<bool>        		fieldPermission;
	std::vector<void*>             	fieldData;
	std::vector<int>             	fieldGlobalIdx;

	StatisticsVector* 				statistics;

	uint64_t                       	rowCount;
	std::string						relName;
public:
	Table (std::string relName, uint64_t rowCount);

	void addColumn (std::string fieldName, DataType* type, bool permit, void* data);

	void addDictionary (std::string fieldName, Dictionary* dict);

	bool hasDictionary (std::string fieldName);

	Dictionary* getDictionary (std::string fieldName);

	void loadColumn (std::string fieldName, std::string path, DataType* type);

	int getFieldNumber (std::string fieldName);

	void createStatistics ();

	StatisticsVector* getStatistics ();

	uint64_t getSize ();

	void setSize (uint64_t size);

	std::string getTableName ();

	int getColumnNumber ();

	int getColumnGlobalIdx (int i);

	void setColumnGlobalIdx (int i, int globalIdx);

	void* getColumnData (int i);

	bool getPermission (int i);

	DataType* getColumnType (int i);

	std::string getColumnName (int i);

	void forceOrdering (int* ordering, int* spare);

	void forceFiltering (int* mask);

	void printSummary ();

	void printTableInfo ();

	void shuffle ();

	void resize (uint64_t);
};

class Schema {
	int  											relationNum;
	int 											fieldNum;

	std::vector<Table*> 							tables;
	std::map<int, int>								fieldParent;
	std::map<int, void*>							fieldData;
	std::map<int, bool>								fieldPermit;
	std::map<int, DataType*>						fieldTypes;
	std::map<int, int>								fieldMin;

	std::map<std::string, int>                      tableIndex;
	std::map<std::string, int>                      fieldIndex;

	BufferManager*									bufferManager;

public:
	Schema (std::vector<Table*>& tables_origin, std::vector<bool>& isDummy, BufferManager* bufferManager);

	void updateTableColumns (int id);

	void createStatistics ();

	StatisticsVector* getStatistics (int id);

	int getTableNumber ();

	int getTotalFieldNumber ();

	int getFieldNumber (std::string relName, std::string attrName);

	int getFieldNumberInTable (std::string relName, std::string attrName);

	int getMinField (int id);

	int getLastField (int id);

	void printTableSummary (int id);

	std::string getTableString (int id);

	std::string getColumnString (int id);

	bool hasDictionary (std::string relName, std::string fieldName);

	Dictionary* getDictionary (std::string relName, std::string fieldName);

	BufferManager* getBufferManager ();

	int getTableId (std::string relName);

	int getColumnId (std::string relName, std::string attrName);

	int getColumnParent (int id);

	void* getColumnData (int id);

	DataType* getColumnType (int id);

	bool getPermission (int id);

	uint64_t getRowCount (int id);

	void setRowCount (int id, uint64_t size);

	void forceOrdering (int id, int* ordering, int* spare);

	void forceFiltering (int id, int* mask);

	DataBlock* getDataBlock (std::string relName, int offset, int size, std::bitset<MAXQUERIES> queries);

	void shuffle ();
};

#endif
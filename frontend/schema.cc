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

#include "schema.h"

Statistics::Statistics (int* column, uint64_t n) {
	std::map<int,int> occurences;

	min = INT_MAX;
	max = INT_MIN;

	for (int i = 0; i < n; i++) {
		if (column[i] < min) {
			min = column[i];
		}

		if (column[i] > max) {
			max = column[i];
		}

		occurences[column[i]] = 0;
	}

	distinct = occurences.size();
}

Table::Table (std::string relName, uint64_t rowCount) : rowCount(rowCount), relName(relName), statistics(nullptr) {

}

void Table::addColumn (std::string fieldName, DataType* type, bool permit, void* data) {
	reverseIndex[fieldName] = fieldNames.size();

	fieldNames.push_back(fieldName);
	fieldTypes.push_back(type);
	fieldPermission.push_back(permit);
	fieldData.push_back(data);
	fieldGlobalIdx.push_back(-1);
}

void Table::addDictionary (std::string fieldName, Dictionary* dict) {
	dictIndex[fieldName] = dict;
}

bool Table::hasDictionary (std::string fieldName) {
	return dictIndex.find(fieldName) != dictIndex.end();
}

Dictionary* Table::getDictionary (std::string fieldName) {
	return dictIndex[fieldName];
}

void Table::loadColumn (std::string fieldName, std::string path, DataType* type) {
	int size = type->getSize()*rowCount;
	void* data = malloc(size);

	int fd = open(path.c_str(), O_RDONLY);
	int err = read(fd, data, size);

	reverseIndex[fieldName] = fieldNames.size();

	fieldNames.push_back(fieldName);
	fieldTypes.push_back(type);
	fieldData.push_back(data);
	fieldGlobalIdx.push_back(-1);
}

int Table::getFieldNumber (std::string fieldName) {
	return reverseIndex[fieldName];
}

void Table::createStatistics () {
	statistics = new StatisticsVector(fieldData, rowCount);
}

void Table::shuffle() {
	for (uint64_t i = 0; i < rowCount; i++) {
		uint64_t row1 = rand() % rowCount;
		uint64_t row2 = rand() % rowCount;

		for (int j = 0; j < fieldData.size(); j++) {
			int* col = (int*) fieldData[j];

			int tmp = col[row1];
			col[row1] = col[row2];
			col[row2] = tmp;
		}
	}
}


void Table::resize(uint64_t newRowCount) {
	shuffle();

	if (newRowCount <= rowCount) {
		rowCount = newRowCount;
	} else {
		std::vector<void*> newFieldData;

		for (int j = 0; j < fieldData.size(); j++) {
			void* buffer = malloc(newRowCount*sizeof(int));
			newFieldData.push_back(buffer);

			int* colSource = (int*) fieldData[j];
			int* colDest = (int*) newFieldData[j];
		
			for (uint64_t i = 0; i < rowCount; i++) {
				colDest[i] = colSource[i];
			}

			for (uint64_t i = rowCount; i < newRowCount; i++) {
				uint64_t row = rand() % rowCount;
				colDest[i] = colSource[row];
			}
		}

		fieldData = newFieldData;

		rowCount = newRowCount;
	}
}

StatisticsVector* Table::getStatistics () {
	return statistics;
}

uint64_t Table::getSize () { return rowCount; }

void Table::setSize (uint64_t size) { rowCount = size; }

std::string Table::getTableName () {
	return relName;
}

int Table::getColumnNumber () {
	return fieldData.size();
}

int Table::getColumnGlobalIdx (int i) {
	return fieldGlobalIdx[i];
}

void Table::setColumnGlobalIdx (int i, int globalIdx) {
	fieldGlobalIdx[i] = globalIdx;
}

void* Table::getColumnData (int i) {
	return fieldData[i];
}

bool Table::getPermission (int i) {
	return fieldPermission[i];
}

DataType* Table::getColumnType (int i) {
	return fieldTypes[i];
}

std::string Table::getColumnName (int i) {
	return fieldNames[i];
}

void Table::forceOrdering (int* ordering, int* spare) {
	for (int j = 0; j < getColumnNumber(); j++) {
		int* source = (int*) fieldData[j];

		for (int i = 0; i < rowCount; i++) {
			int row = ordering[i];

			spare[i] = source[row];
		}

		fieldData[j] = spare;
		spare = source;
	}
}

void Table::forceFiltering (int* mask) {
	int cnt = 0;

	int colNumber = getColumnNumber();

	for (int i = 0; i < rowCount; i++) {
		if (mask[i]) {
			for (int j = 0; j < colNumber; j++) {
				((int*) fieldData[j])[cnt] = ((int*) fieldData[j])[i];
			}

			cnt++;
		}
	}

	rowCount = cnt;
}

void Table::printSummary () {
	std::cout << "Table: " << relName << std::endl; 

	int len = 10;
	if (len > rowCount)
		len = rowCount;

	for (int i = 0; i < getColumnNumber(); i++)
		std::cout << fieldNames[i] << ",";
	std::cout << std::endl;

	for (int i = 0; i < getColumnNumber(); i++) {
		std::string s = fieldNames[i];
		std::cout << hasDictionary(s) << ",";
	}

	std::cout << std::endl;

	for (int j = 0; j < rowCount; j++) {
		std::cout << j << ":";
		for (int i = 0; i < getColumnNumber(); i++) {
			std::string s = fieldNames[i];
			int val = ((int*) fieldData[i])[j];
			if (hasDictionary(s)) {
				if (val != NULL_VALUE) {
					std::cout << getDictionary(s)->getValue(val) << ",";
				} else {
					std::cout << "NULL,";
				}
			} else
				std::cout << val << ",";
		}
		std::cout << std::endl;
	}
}

void Table::printTableInfo () {
	std::cout << "Table: " << relName << std::endl; 
	std::cout << "Count: " << rowCount << std::endl;

	for (int i = 0; i < getColumnNumber(); i++)
		std::cout << fieldNames[i] << " " << fieldTypes[i]->toString() << std::endl;
}


Schema::Schema (std::vector<Table*>& tables_origin, std::vector<bool>& isDummy, BufferManager* bufferManager) : bufferManager(bufferManager), relationNum(0), fieldNum(0) {
	for (int i = 0; i < tables_origin.size(); i++) {
		if (isDummy[i] == false) {
			tables.push_back(tables_origin[i]);
				
			relationNum++;
			fieldNum += tables_origin[i]->getColumnNumber();
		}
	}

	for (int i = 0; i < tables_origin.size(); i++) {
		if (isDummy[i] == true) {
			tables.push_back(tables_origin[i]);
		}
	}

	int acc = 0;

	for (uint i = 0; i < tables.size(); i++)
		for (int j = 0; j < tables[i]->getColumnNumber(); j++) {
			std::string s = tables[i]->getTableName();
			s += ".";
			s += tables[i]->getColumnName(j);
			fieldIndex[s] = acc;
			tables[i]->setColumnGlobalIdx(j, acc);

			if (fieldMin.find(i) == fieldMin.end() || fieldMin[i] > acc)
				fieldMin[i] = acc;

			fieldParent[acc] = i;
			fieldData[acc] = tables[i]->getColumnData(j);
			fieldTypes[acc] = tables[i]->getColumnType(j);
			fieldPermit[acc] = tables[i]->getPermission(j);

			tableIndex[tables[i]->getTableName()] = i;
			acc++;
		}

	//shuffle();
}

void Schema::updateTableColumns (int id) {
	int acc = 0;

	for (uint i = 0; i < tables.size(); i++) {
		if (i == id) {
			for (int j = 0; j < tables[i]->getColumnNumber(); j++) {
				fieldData[acc] = tables[i]->getColumnData(j);
				acc++;
			}
		} else {
			acc += tables[i]->getColumnNumber();
		}
	}
}

void Schema::createStatistics () {
	for (uint i = 0; i < tables.size(); i++) {
		tables[i]->createStatistics();
	}
}

StatisticsVector* Schema::getStatistics (int id) {
	StatisticsVector* sv = tables[id]->getStatistics();
	assert(sv != nullptr);

	return sv;
}

int Schema::getTableNumber () {
	return relationNum;
}

int Schema::getTotalFieldNumber () {
	return fieldNum;
}

int Schema::getFieldNumber (std::string relName, std::string attrName) {
	std::string s = relName;
	s += ".";
	s += attrName;
	return fieldIndex[s];
}

int Schema::getFieldNumberInTable (std::string relName, std::string attrName) {
	int table = tableIndex[relName];
	return tables[table]->getFieldNumber(attrName);
}

int Schema::getMinField (int id) {
	return fieldMin[id];
}

int Schema::getLastField (int id) {
	return fieldMin[id]+tables[id]->getColumnNumber();;
}

void Schema::printTableSummary (int id) {
	tables[id]->printSummary();
}

std::string Schema::getTableString (int id) {
	return tables[id]->getTableName();
}

std::string Schema::getColumnString (int id) {
	for (std::map<std::string, int>::iterator it = fieldIndex.begin(); it != fieldIndex.end(); it++) {
		if (id == it->second)
			return it->first;
	}
	return "not found";
}

bool Schema::hasDictionary (std::string relName, std::string fieldName) {
	int parent = tableIndex[relName];
	return tables[parent]->hasDictionary(fieldName);
}

Dictionary* Schema::getDictionary (std::string relName, std::string fieldName) {
	assert(hasDictionary(relName, fieldName));
	int parent = tableIndex[relName];
	return tables[parent]->getDictionary(fieldName);
}

BufferManager* Schema::getBufferManager () {
	return bufferManager;
}

int Schema::getTableId (std::string relName) {
	if (tableIndex.find(relName) == tableIndex.end())
		return -1;
	return tableIndex[relName];
}

int Schema::getColumnId (std::string relName, std::string attrName) {
	std::string key = relName;
	key += ".";
	key += attrName;
	return fieldIndex[key];
}

int Schema::getColumnParent (int id) {
	return fieldParent[id];
}

void* Schema::getColumnData (int id) {
	return fieldData[id];
}

DataType* Schema::getColumnType (int id) {
	return fieldTypes[id];
}

bool Schema::getPermission (int id) {
	return fieldPermit[id];
}

uint64_t Schema::getRowCount (int id) {
	return tables[id]->getSize();
}

void Schema::setRowCount (int id, uint64_t size) {
	tables[id]->setSize(size);
}

void Schema::forceOrdering (int id, int* ordering, int* spare) {
	tables[id]->forceOrdering(ordering, spare);
	updateTableColumns(id);
}

void Schema::forceFiltering (int id, int* mask) {
	tables[id]->forceFiltering(mask);
}

DataBlock* Schema::getDataBlock (std::string relName, int offset, int size, std::bitset<MAXQUERIES> queries) {
	std::bitset<MAXQUERIES>* mask = (std::bitset<MAXQUERIES>*) bufferManager->getBuffer();
	for (int i = 0; i < size; i++)
		mask[i] = queries;

	int* index = (int*) bufferManager->getBuffer();
	for (int i = 0; i < size; i++) {
		index[i] = offset + i;
	}

	DataBlock* dataBlock = new DataBlock();
	dataBlock->init(this, tableIndex[relName], mask, index, size, bufferManager->getBlockSize()/sizeof(int));
	dataBlock->setQuery(queries);

	return dataBlock;
}

void Schema::shuffle() {
	for (int i = 0; i < tables.size(); i++) {
		std::cout << "start shuffle" << std::endl;
		tables[i]->shuffle();
		std::cout << "end shuffle" << std::endl;
	}
}
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

#include "datablock.h"
#include "../expressions/primitive-loops.h"
#include "../frontend/schema.h"
#include <cassert>
#include <cstring>

#include <immintrin.h>

void DataBlock::init(Schema* schema, int tableId, std::bitset<MAXQUERIES>* mask, int* index, uint64_t size, uint64_t width) {
	assert(size <= width);

	this->schema = schema;
	this->mask = mask;
	this->size = size;
	this->width = width;
	(this->lineage).reset();
	this->indexListSize = 0;

	for (int i = 0; i < schema->getTableNumber(); i++)
		idsIndex[i] = nullptr;

	idsIndex[tableId] = index;
	idsAll = index;

	indexList[0] = tableId;
	indexListSize = 1;
}

void DataBlock::init (Schema* schema, std::bitset<MAXQUERIES>* mask, std::vector<int*>& index, std::vector<int>& indexListV, uint64_t size, uint64_t width) {
	assert(size <= width);

	this->schema = schema;
	this->mask = mask;
	this->size = size;
	this->width = width;
	(this->lineage).reset();
	this->indexListSize = 0;

	idsAll = (int*) schema->getBufferManager()->getBuffer();

	indexListSize = indexListV.size();
	for (uint i = 0; i < indexListV.size(); i++)
		indexList[i] = indexListV[i];

	for (int i = 0; i < schema->getTableNumber(); i++)
		idsIndex[i] = nullptr;

	for (int i = 0; i < indexListSize; i++) {
		memcpy(idsAll + i*width, index[i], size*sizeof(int));
		schema->getBufferManager()->freeBuffer(index[i]);
		idsIndex[indexList[i]] = idsAll + i*width;
	}
}

void DataBlock::init (Schema* schema, std::bitset<MAXQUERIES>* mask, int* index, std::vector<int>& indexListV, uint64_t size, uint64_t width) {
	assert(size <= width);

	this->schema = schema;
	this->mask = mask;
	this->size = size;
	this->width = width;
	(this->lineage).reset();
	this->indexListSize = 0;

	idsAll = index;

	indexListSize = indexListV.size();
	for (uint i = 0; i < indexListV.size(); i++)
		indexList[i] = indexListV[i];

	for (int i = 0; i < schema->getTableNumber(); i++)
		idsIndex[i] = nullptr;

	for (int i = 0; i < indexListSize; i++) {
		idsIndex[indexList[i]] = idsAll + i*width;
	}
}

void DataBlock::init (Schema* schema, std::bitset<MAXQUERIES>* mask, int* index, int* indexListProbe, int indexListProbeSize, int* indexListBuild, int indexListBuildSize, uint64_t size, uint64_t width) {
	assert(size <= width);

	this->schema = schema;
	this->mask = mask;
	this->size = size;
	this->width = width;
	this->lineage = 0;
	this->indexListSize = 0;

	idsAll = index;

	indexListSize = indexListProbeSize + indexListBuildSize;
	for (int i = 0; i < indexListProbeSize; i++)
		indexList[i] = indexListProbe[i];

	for (int i = 0; i < indexListBuildSize; i++)
		indexList[i + indexListProbeSize] = indexListBuild[i];


	for (int i = 0; i < schema->getTableNumber(); i++)
		idsIndex[i] = nullptr;

	for (int i = 0; i < indexListSize; i++) {
		idsIndex[indexList[i]] = idsAll + i*width;
	}
}

void DataBlock::freeBuffers () {
	void* bufs[2];
	bufs[0] = mask;
	bufs[1] = idsAll;

	schema->getBufferManager()->freeBufferN(bufs, 2);
}

void DataBlock::update(bool* newmask, int queryId) {
	assert (queryMask.test(queryId));

	std::bitset<MAXQUERIES> masktrue = queryMask;
	std::bitset<MAXQUERIES> maskfalse = queryMask.flip(queryId);

	std::cout << masktrue << std::endl;
	std::cout << maskfalse << std::endl;

	for (uint64_t i = 0; i < size; i++)
		mask[i] = (mask[i] & (newmask[i]? masktrue: maskfalse));
}

void DataBlock::filter(bool* newmask) {
	assert(false);
	int cur = 0;

	for (uint64_t i = 0; i < size; i++) {
		if (newmask[i]) {
			mask[cur] = mask[i];
			for (int j = 0; j < indexListSize; j++)
				idsAll[j*width + cur] = idsAll[j*width + i];
			cur++;
		}
	}

	size = cur;
}

void DataBlock::filter(std::bitset<MAXQUERIES>* newmask) {
	int cur = 0;
	uint64_t dataCnt = size;

	for (uint64_t i = 0; i < dataCnt; i++) {
		mask[cur] = (newmask[i]);
		idsAll[cur] = idsAll[i];
		cur += (newmask[i].any());
	}

	size = cur;
}

void DataBlock::filterAnd(std::bitset<MAXQUERIES>* newmask) {
	int cur = 0;
	uint64_t dataCnt = size;

	for (uint64_t i = 0; i < dataCnt; i++) {
		mask[cur] = newmask[i] & mask[i];
		idsAll[cur] = idsAll[i];
		cur += (mask[cur].any());
	}

	size = cur;
}

void DataBlock::filterAnd2(std::bitset<MAXQUERIES>* newmask) {
	int cur = 0;
	uint64_t dataCnt = size;

	for (uint64_t i = 0; i < dataCnt; i++) {
		mask[cur] = newmask[i] & mask[i];
		for (int j = 0; j < indexListSize; j++)
			idsAll[j*width + cur] = idsAll[j*width + i];
		cur += (mask[cur].any());
	}

	size = cur;
}

void DataBlock::filterTrue() {
	std::bitset<MAXQUERIES> defMask = getQuery();
	uint64_t dataCnt = size;

	for (uint64_t i = 0; i < dataCnt; i++) {
		mask[i] = defMask;
	}
}

void DataBlock::applyConstraint(uint64_t cols, std::bitset<MAXQUERIES>& query, void* buffer1, void* buffer2) {
	int col1 = __builtin_ctzll(cols);
	cols = cols & (cols-1);
	int col2 = __builtin_ctzll(cols);

	int* data1 = (int*) getColumn(col1, buffer1);
	int* data2 = (int*) getColumn(col2, buffer2);

	int cur = 0;

	for (int i = 0; i < size; i++) {
		if (data1[i] == data2[i]) {
			mask[cur] = mask[i];
			for (int j = 0; j < indexListSize; j++)
				idsAll[j*width + cur] = idsAll[j*width + i];
			cur++;
		}
	}

	size = cur;
}

int* DataBlock::getVIDSAll () {
	return idsAll;
}

std::bitset<MAXQUERIES>* DataBlock::getMask () {
	return mask;
}

uint64_t DataBlock::getSize() {
	return size;
}

int* DataBlock::getVIDS (int parentId) const {
	assert(parentId >= 0 && parentId < MAXRELATIONS);
	return idsIndex[parentId];
}

bool DataBlock::hasColumn (int columnId) {
	int parentId = schema->getColumnParent(columnId);
	int* ids = getVIDS(parentId);

	return (ids != nullptr);
}

void* DataBlock::getColumn (int columnId, void* column) {
	int parentId = schema->getColumnParent(columnId);
	int* ids = getVIDS(parentId);

	if (ids == nullptr) {
		std::cout << getSchema()->getTableString(parentId) << " not found" << std::endl;
		for (int i = 0; i < indexListSize; i++)
			std::cout << indexList[i] << " " << std::endl;

		assert(false);
		return nullptr;
	}

	if (column == nullptr)
		column = schema->getBufferManager()->getBuffer();

	if (column == nullptr)
		std::cout << "no buffers" << std::endl;

	assert(size <= schema->getBufferManager()->getBlockSize()/sizeof(int));

	switch (schema->getColumnType(columnId)->getTypeValue()) {
		case INT: {
			EvaluationLoop<int32_t> loop;
			loop.MaterializeLoop (column, schema->getColumnData(columnId), ids, size);
			break; }
		case INT64: {
			EvaluationLoop<int64_t> loop;
			loop.MaterializeLoop (column, schema->getColumnData(columnId), ids, size);
			break; }
		case BOOL: {
			EvaluationLoop<bool> loop;
			loop.MaterializeLoop (column, schema->getColumnData(columnId), ids, size);
			break; }
		case FLOAT: {
			EvaluationLoop<float> loop;
			loop.MaterializeLoop (column, schema->getColumnData(columnId), ids, size);
			break; }
		case DOUBLE: {
			EvaluationLoop<double> loop;
			loop.MaterializeLoop (column, schema->getColumnData(columnId), ids, size);
			break; }
		default:
			assert(false && "Not implemented yet!");
	}

	return column;
}

void* DataBlock::getColumnSparse (int columnId, char* mark, void* column) {
	assert(false);
	int parentId = schema->getColumnParent(columnId);
	int* ids = getVIDS(parentId);

	if (ids == nullptr) {
		std::cout << getSchema()->getTableString(parentId) << " not found" << std::endl;
		for (int i = 0; i < indexListSize; i++)
			std::cout << indexList[i] << " " << std::endl;

		assert(false);
		return nullptr;
	}

	if (column == nullptr)
		column = schema->getBufferManager()->getBuffer();

	if (column == nullptr)
		std::cout << "no buffers" << std::endl;

	assert(size <= schema->getBufferManager()->getBlockSize()/sizeof(int));

	switch (schema->getColumnType(columnId)->getTypeValue()) {
		case INT: {
			EvaluationLoop<int32_t> loop;
			loop.MaterializeLoopSparse (column, mark, schema->getColumnData(columnId), ids, size);
			break; }
		case INT64: {
			EvaluationLoop<int64_t> loop;
			loop.MaterializeLoopSparse (column, mark, schema->getColumnData(columnId), ids, size);
			break; }
		case BOOL: {
			EvaluationLoop<bool> loop;
			loop.MaterializeLoopSparse (column, mark, schema->getColumnData(columnId), ids, size);
			break; }
		case FLOAT: {
			EvaluationLoop<float> loop;
			loop.MaterializeLoopSparse (column, mark, schema->getColumnData(columnId), ids, size);
			break; }
		case DOUBLE: {
			EvaluationLoop<double> loop;
			loop.MaterializeLoopSparse (column, mark, schema->getColumnData(columnId), ids, size);
			break; }
		default:
			assert(false && "Not implemented yet!");
	}

	return column;
}


Schema* DataBlock::getSchema () { 
	return schema; 
}

void DataBlock::registerTarget (int id) {
	lineage.set(id);
}

void DataBlock::registerTargets (const std::bitset<MAXOPS>& bitmask) {
	lineage |= bitmask;
}


bool DataBlock::isTarget (int id) {
	return !lineage.test(id);
}

std::bitset<MAXOPS> DataBlock::getLineage () {
	return lineage;
}

int* DataBlock::getIndexList () {
	return &indexList[0];
}

int DataBlock::getIndexListSize () {
	return indexListSize;
}

int DataBlock::checkSum () {
	int x = 0;
	for (int i = 0; i < size; i++)
		for (int j = 0; j < indexListSize; j++) {
			int f = idsAll[j*width + i];
			x = x ^ f;
		}

	for (int j = 0; j < indexListSize; j++)
		x = x ^ indexList[j];

	x = x ^ lineage.to_ullong();

	return x;
}

std::bitset<MAXQUERIES> DataBlock::hasQuery (const std::bitset<MAXQUERIES>& queries) {
	return queryMask & queries;
}

void DataBlock::setQuery (const std::bitset<MAXQUERIES>& queries) {
	queryMask = queries;
}

bool testIntersect(std::bitset<MAXQUERIES>* mask, const std::bitset<MAXQUERIES>& queries) {
	//impl1
	//*mask = queries & *mask;
	//return mask->any();

	//impl2
	uint64_t* mask_c = (uint64_t*) mask;
	uint64_t* queries_c = (uint64_t*) &queries;
	uint64_t any = 0;
	for (int i = 0; i < MAXQUERIES/64; i++) {
		uint64_t intersect = mask_c[i] & queries_c[i];
		mask_c[i] = intersect;
		any |= intersect;
	}
	return true;
}

bool testIntersect2(std::bitset<MAXQUERIES>* maskDst, std::bitset<MAXQUERIES>* maskSrc, const std::bitset<MAXQUERIES>& queries) {
	//impl1
	//*mask = queries & *mask;
	//return mask->any();

	//impl2
	uint64_t* maskSrc_c = (uint64_t*) maskSrc;
	uint64_t* maskDst_c = (uint64_t*) maskDst;
	uint64_t* queries_c = (uint64_t*) &queries;
	uint64_t any = 0;
	for (int i = 0; i < MAXQUERIES/64; i++) {
		uint64_t intersect = maskSrc_c[i] & queries_c[i];
		maskDst_c[i] = intersect;
		any |= intersect;
	}
	return any;
}

bool testIntersect512(uint64_t* mask, uint64_t* queries) {
	//impl1
	//*mask = queries & *mask;
	//return mask->any();

	//impl2
	for (int i = 0; i < 512/64; i++) {
		uint64_t intersect = mask[i] & queries[i];
		mask[i] = intersect;
	}
	return true;
}

void DataBlock::filterQuery (const std::bitset<MAXQUERIES>& queries) {
	std::bitset<MAXQUERIES> newqueries = getQuery() & queries;
	setQuery(newqueries);

	int cur = 0;
	int tsize = size;

	for (uint64_t i = 0; i < tsize; i++) {
		//for (int j = 0; j < indexListSize; j++)
		//	idsAll[j*width + cur] = idsAll[j*width + i];
		//mask[cur] = queries & mask[i];
		//cur += (mask[cur].any());
		testIntersect(&mask[i], queries);
	}

	//size = cur;
}

std::bitset<MAXQUERIES> DataBlock::getQuery () {
	return queryMask;
}

uint64_t DataBlock::getTrait () {
	return trait;
}

void DataBlock::setTrait (uint64_t trait) {
	this->trait = trait;
}

DataBlock* 	DataBlock::copy () {
	assert(true && "bug in index allocation");

	DataBlock* data = new DataBlock();

	std::bitset<MAXQUERIES>* newmask = (std::bitset<MAXQUERIES>*) schema->getBufferManager()->getBuffer();
	memcpy (newmask, mask, schema->getBufferManager()->getBlockSize());

	std::vector<int*> index;
	std::vector<int> indexListV;
	for (int i = 0; i < indexListSize; i++) {
		indexListV.push_back(indexList[i]);
		index.push_back(idsIndex[indexList[i]]);
	}

	data->init(schema, newmask, index, indexListV, size, width);

	data->registerTargets(lineage);
	data->setQuery(queryMask);

	return data;
}

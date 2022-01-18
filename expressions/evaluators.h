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

#ifndef EVALUATORS_H_
#define EVALUATORS_H_

#include <climits>
#include <cfloat>
#include <bitset>
#include "types.h"
#include "primitive-loops.h"
#include "../datablock/datablock.h"
#include "../dictionary/dictionary.h"
#include "../stem/stem.h"
#include "../aggregates/aggregator.h"
#include "../primitives/mini-ht.h"
#include "../frontend/schema.h"

class Evaluator {
public:
	Evaluator () {}
	virtual ~Evaluator () {}

	virtual void*  apply 				(DataBlock*, int) {
		assert(false);
		return nullptr;
	}

	virtual void*  applySelective		(DataBlock*, char*, int) {
		assert(false);
		return nullptr;
	}

	virtual float getSelectivity () = 0;

	virtual std::bitset<MAXQUERIES> getQuery () = 0;

	virtual void setQuery (std::bitset<MAXQUERIES>& queries) {
		assert(false);
	}

	virtual void updateQuery (std::map<int,int>& mapping) {
		assert(false);
	}

	virtual uint64_t  getTableSet			() = 0;

	virtual void print                  () {
		std::cout << "generic";
	}
};

class BinaryEvaluator : public Evaluator {
	Evaluator* childLeft;
	Evaluator* childRight;

public:
	BinaryEvaluator (Evaluator* childLeft, Evaluator* childRight) : Evaluator(), childLeft(childLeft), childRight(childRight) {}
	
	~BinaryEvaluator () {
		delete childLeft;
		delete childRight;
	}

	Evaluator* getChildLeft		() { return childLeft;  }
	Evaluator* getChildRight		() { return childRight; }
};

class UnaryEvaluator : public Evaluator {
	Evaluator* child;
protected:
	Dictionary* dict;

public:
	UnaryEvaluator (Evaluator* child) : Evaluator(), child(child), dict(nullptr) {}

	UnaryEvaluator () {
		delete child;
	}

	Evaluator* getChild 			() { return child; }
	void registerDictionary 			(Dictionary* dict) { this->dict = dict; }
};

class AttributeEvaluator : public Evaluator {
	Schema* schema;
	DataType* type;
	int       offset;
	void* buffers[MAXTHREADS];

public:
	AttributeEvaluator (Schema* schema, DataType* type, int offset) : Evaluator(), type(type), offset(offset), schema(schema) {
		for (int i = 0; i < MAXTHREADS; i++) {
			buffers[i] = schema->getBufferManager()->getBuffer();
		}
	}

	~AttributeEvaluator () {
		delete type;
	}

	void* apply (DataBlock* data, int threadId) {
		return data->getColumn(offset, buffers[threadId]);
	}

	void* applySelective (DataBlock* data, char* mark, int threadId) {
		return data->getColumnSparse(offset, mark, buffers[threadId]);
	}

	virtual uint64_t  getTableSet () override {
		int table = schema->getColumnParent(offset);
		assert(table >= 0 && table < 64);
		return (((1ull) << table));
	}

	std::bitset<MAXQUERIES> getQuery () {
		std::bitset<MAXQUERIES> q;
		return q;
	}

	float getSelectivity () {
		return 1.0;
	}

	void print () {
		std::cout << "(";
		std::cout << offset;
		std::cout << ")";
	}
};

class ADDEvaluator : public BinaryEvaluator {
public:
	ADDEvaluator (Evaluator* left, Evaluator* right) : BinaryEvaluator(left, right) {}
	~ADDEvaluator () {}

	void* apply (DataBlock* data, int threadId) {
		int* val1 = (int*) getChildLeft()->apply(data, threadId);
		int* val2 = (int*) getChildRight()->apply(data, threadId);

		if (val1 == nullptr) {
			return val2;
		} else if (val2 == nullptr) {
			return val1;
		}else {
			uint64_t size = data->getSize();

			for (int i = 0 ; i < size; i++)
				val1[i] = (val1[i] + val2[i]);
		}

		return val1;
	}

	void print () {
		std::cout << "(";
		getChildLeft()->print();
		std::cout << " add ";
		getChildRight()->print();
		std::cout << ")";
	}

	virtual uint64_t  getTableSet () override {
		return getChildLeft()->getTableSet() | getChildRight()->getTableSet();
	}

	float getSelectivity () {
		return getChildLeft()->getSelectivity()*getChildRight()->getSelectivity();
	}

	std::bitset<MAXQUERIES> getQuery () {
		return (getChildLeft()->getQuery() & getChildRight()->getQuery());
	}
};

class SUBEvaluator : public BinaryEvaluator {
public:
	SUBEvaluator (Evaluator* left, Evaluator* right) : BinaryEvaluator(left, right) {}
	~SUBEvaluator () {}

	void* apply (DataBlock* data, int threadId) {
		int* val1 = (int*) getChildLeft()->apply(data, threadId);
		int* val2 = (int*) getChildRight()->apply(data, threadId);

		if (val1 == nullptr) {
			return val2;
		} else if (val2 == nullptr) {
			return val1;
		}else {
			uint64_t size = data->getSize();

			for (int i = 0 ; i < size; i++)
				val1[i] = (val1[i] - val2[i]);
		}

		return val1;
	}

	virtual uint64_t  getTableSet () override {
		return getChildLeft()->getTableSet() | getChildRight()->getTableSet();
	}

	void print () {
		std::cout << "(";
		getChildLeft()->print();
		std::cout << " sub ";
		getChildRight()->print();
		std::cout << ")";
	}

	float getSelectivity () {
		return getChildLeft()->getSelectivity()*getChildRight()->getSelectivity();
	}

	std::bitset<MAXQUERIES> getQuery () {
		return (getChildLeft()->getQuery() & getChildRight()->getQuery());
	}
};

class MULEvaluator : public BinaryEvaluator {
public:
	MULEvaluator (Evaluator* left, Evaluator* right) : BinaryEvaluator(left, right) {}
	~MULEvaluator () {}

	void* apply (DataBlock* data, int threadId) {
		int* val1 = (int*) getChildLeft()->apply(data, threadId);
		int* val2 = (int*) getChildRight()->apply(data, threadId);

		if (val1 == nullptr) {
			return val2;
		} else if (val2 == nullptr) {
			return val1;
		}else {
			uint64_t size = data->getSize();

			for (int i = 0 ; i < size; i++)
				val1[i] = (val1[i] * val2[i]);
		}

		return val1;
	}

	virtual uint64_t  getTableSet () override {
		return getChildLeft()->getTableSet() | getChildRight()->getTableSet();
	}

	void print () {
		std::cout << "(";
		getChildLeft()->print();
		std::cout << " mul ";
		getChildRight()->print();
		std::cout << ")";
	}

	float getSelectivity () {
		return getChildLeft()->getSelectivity()*getChildRight()->getSelectivity();
	}

	std::bitset<MAXQUERIES> getQuery () {
		return (getChildLeft()->getQuery() & getChildRight()->getQuery());
	}
};



class MINEvaluator : public UnaryEvaluator {
	DataType* type;
	int* value;
	std::bitset<MAXQUERIES> queries;
	int numthreads;

	int* output;

	public:
	MINEvaluator (Evaluator* attribute, int* output, DataType* type, int numthreads, std::bitset<MAXQUERIES> queries) : UnaryEvaluator(attribute), type(type), queries(queries), numthreads(numthreads) {
		switch (type->getTypeValue()) {
			case INT: case FLOAT:
			{
				value = (int*) malloc(16*numthreads*sizeof(int32_t));
				for (int i = 0; i < numthreads; i++) {
					value[16*i] = INT_MAX;
				}
				break;
			}
			case INT64:
			{
				value = (int*) malloc(16*numthreads*sizeof(int64_t));
				*((int64_t*) value) = INT_MAX;		
				break;
			}
			case DOUBLE:
			{
				value = (int*) malloc(16*numthreads*sizeof(double));
				*((double*) value) = FLT_MAX;			
				break;
			}
			default:
			{
				std::cerr << type->toString() << " not valid for Min" << std::endl;
			}
		}
	}
	~MINEvaluator () {
		switch (type->getTypeValue()) {
			case INT: case FLOAT:
			{
				int min = value[0];
				for (int i = 1; i < numthreads; i++)
					if (min > value[16*i])
						min = value[16*i];

				//output[0] = min;
				std::cout << min << " ";
				if (dict != nullptr && min != INT_MAX)
					std::cout << dict->getValue(min) << " ";
				break;
			}
			case INT64:
			{
				std::cout << *((int64_t*) value) << " ";		
				break;
			}
			case DOUBLE:
			{
				std::cout << *((double*) value) << " ";		
				break;
			}
			default:
			{
				std::cerr << type->toString() << " not valid for Min" << std::endl;
			}
		}

		free(value);
		delete type;
	}

	void* apply (DataBlock* data, int threadId) {
		void* attr = getChild()->apply(data, threadId);

		switch (type->getTypeValue()) {
			case INT: case FLOAT:
			{
				EvaluationLoop<int32_t> eval;
				value[16*threadId] = eval.MinLoop(attr, data->getMask(), &value[16*threadId], data->getSize(), queries);				
				break;
			}
			case INT64:
			{
				EvaluationLoop<int64_t> eval;
				*((int64_t*) value) = eval.MinLoop(attr, data->getMask(), value, data->getSize(), queries);				
				break;
			}
			case DOUBLE:
			{
				EvaluationLoop<double> eval;
				*((double*) value) = eval.MinLoop(attr, data->getMask(), value, data->getSize(), queries);				
				break;
			}
			default:
			{
				std::cerr << type->toString() << " not valid for Min" << std::endl;
			}
		}

		return nullptr;
	}

	virtual uint64_t  getTableSet () override {
		return getChild()->getTableSet();
	}

	std::bitset<MAXQUERIES> getQuery () {
		std::bitset<MAXQUERIES> q;
		q.reset();
		return q;
	}

	void setQuery (std::bitset<MAXQUERIES>& queries) {
		this->queries = queries;
	}

	void updateQuery (std::map<int,int>& mapping) {
		queries = mapQueries(queries, mapping);
	}

	float getSelectivity () {
		return 1.0;
	}

	void print () {
		std::cout << "(";
		std::cout << "min ";
		getChild()->print();
		std::cout << " for " << queries;
		std::cout << ")";
	}
};

class MAXEvaluator : public UnaryEvaluator {
	DataType* type;
	int* value;
	std::bitset<MAXQUERIES> queries;
	int numthreads;

	int* output;

	public:
	MAXEvaluator (Evaluator* attribute, int* output, DataType* type, int numthreads, std::bitset<MAXQUERIES> queries) : UnaryEvaluator(attribute), output(output), type(type), queries(queries), numthreads(numthreads) {
		switch (type->getTypeValue()) {
			case INT: case FLOAT:
			{
				value = (int*) malloc(16*numthreads*sizeof(int32_t));
				for (int i = 0; i < numthreads; i++) {
					value[16*i] = INT_MIN;
				}
				break;
			}
			case INT64:
			{
				value = (int*) malloc(16*numthreads*sizeof(int64_t));
				*((int64_t*) value) = INT_MIN;		
				break;
			}
			case DOUBLE:
			{
				value = (int*) malloc(16*numthreads*sizeof(double));
				*((double*) value) = FLT_MIN;			
				break;
			}
			default:
			{
				std::cerr << type->toString() << " not valid for Max" << std::endl;
			}
		}
	}
	~MAXEvaluator () {
		switch (type->getTypeValue()) {
			case INT: case FLOAT:
			{
				int min = value[0];
				for (int i = 1; i < numthreads; i++)
					if (min < value[16*i])
						min = value[16*i];

				output[0] = min;
				std::cout << min << " ";
				if (dict != nullptr && min != INT_MIN)
					std::cout << dict->getValue(min) << " ";
				break;
			}
			case INT64:
			{
				std::cout << *((int64_t*) value) << " ";		
				break;
			}
			case DOUBLE:
			{
				std::cout << *((double*) value) << " ";		
				break;
			}
			default:
			{
				std::cerr << type->toString() << " not valid for Max" << std::endl;
			}
		}

		free(value);
		delete type;
	}

	void* apply (DataBlock* data, int threadId) {
		void* attr = getChild()->apply(data, threadId);

		switch (type->getTypeValue()) {
			case INT: case FLOAT:
			{
				EvaluationLoop<int32_t> eval;
				value[16*threadId] = eval.MaxLoop(attr, data->getMask(), &value[16*threadId], data->getSize(), queries);				
				break;
			}
			case INT64:
			{
				EvaluationLoop<int64_t> eval;
				*((int64_t*) value) = eval.MaxLoop(attr, data->getMask(), value, data->getSize(), queries);				
				break;
			}
			case DOUBLE:
			{
				EvaluationLoop<double> eval;
				*((double*) value) = eval.MaxLoop(attr, data->getMask(), value, data->getSize(), queries);				
				break;
			}
			default:
			{
				std::cerr << type->toString() << " not valid for Max" << std::endl;
			}
		}

		return nullptr;
	}

	virtual uint64_t  getTableSet () override {
		return getChild()->getTableSet();
	}

	std::bitset<MAXQUERIES> getQuery () {
		std::bitset<MAXQUERIES> q;
		q.reset();
		return q;
	}

	void setQuery (std::bitset<MAXQUERIES>& queries) {
		this->queries = queries;
	}

	void updateQuery (std::map<int,int>& mapping) {
		queries = mapQueries(queries, mapping);
	}

	float getSelectivity () {
		return 1.0;
	}

	void print () {
		std::cout << "(";
		std::cout << "max ";
		getChild()->print();
		std::cout << " for " << queries;
		std::cout << ")";
	}
};

class COUNTEvaluator : public UnaryEvaluator {
	DataType* type;
	int* value;
	std::bitset<MAXQUERIES> queries;
	int numthreads;

	int* output;

	public:
	COUNTEvaluator (Evaluator* attribute, int* output, DataType* type, int numthreads, std::bitset<MAXQUERIES> queries) : UnaryEvaluator(attribute), output(output), type(type), queries(queries), numthreads(numthreads) {
		value = (int*) malloc(numthreads*16*sizeof(int));
		for (int i = 0; i < numthreads; i++)
			value[16*i] = 0;
	}
	~COUNTEvaluator () {
		int sum = 0; 
		for (int i = 0; i < numthreads; i++)
			sum += value[16*i];

		output[0] = sum;
		std::cout << sum << " ";
		delete type;
	}

	void* apply (DataBlock* data, int threadId) {
		void* attr = getChild()->apply(data, threadId);

		switch (type->getTypeValue()) {
			case INT: case FLOAT:
			{
				EvaluationLoop<int32_t> eval;
				value[16*threadId] = eval.CountLoop(attr, data->getMask(), &value[16*threadId], data->getSize(), queries);				
				break;
			}
			case INT64:
			{
				EvaluationLoop<int64_t> eval;
				value[16*threadId] = eval.CountLoop(attr, data->getMask(), &value[16*threadId], data->getSize(), queries);				
				break;
			}
			case DOUBLE:
			{
				EvaluationLoop<double> eval;
				value[16*threadId] = eval.CountLoop(attr, data->getMask(), &value[16*threadId], data->getSize(), queries);				
				break;
			}
			default:
			{
				std::cerr << type->toString() << " not valid for Min" << std::endl;
			}
		}

		return nullptr;
	}

	std::bitset<MAXQUERIES> getQuery () {
		std::bitset<MAXQUERIES> q;
		q.reset();
		return q;
	}

	virtual uint64_t  getTableSet () override {
		return getChild()->getTableSet();
	}

	void setQuery (std::bitset<MAXQUERIES>& queries) {
		this->queries = queries;
	}

	void updateQuery (std::map<int,int>& mapping) {
		queries = mapQueries(queries, mapping);
	}

	float getSelectivity () {
		return 1.0;
	}

	void print () {
		std::cout << "(";
		std::cout << "count ";
		getChild()->print();
		std::cout << " for " << queries;
		std::cout << ")";
	}
};

class SUMEvaluator : public UnaryEvaluator {
	DataType* type;
	int* value;
	std::bitset<MAXQUERIES> queries;
	int numthreads;

	int* output;

	public:
	SUMEvaluator (Evaluator* attribute, int* output, DataType* type, int numthreads, std::bitset<MAXQUERIES> queries) : UnaryEvaluator(attribute), output(output), type(type), queries(queries), numthreads(numthreads) {
		value = (int*) malloc(numthreads*16*sizeof(int));
		for (int i = 0; i < numthreads; i++)
			value[16*i] = 0;
	}
	~SUMEvaluator () {
		int sum = 0; 
		for (int i = 0; i < numthreads; i++)
			sum += value[16*i];

		output[0] = sum;
		std::cout << sum << " ";
		delete type;
	}

	void* apply (DataBlock* data, int threadId) {
		void* attr = getChild()->apply(data, threadId);

		switch (type->getTypeValue()) {
			case INT: case FLOAT:
			{
				EvaluationLoop<int32_t> eval;
				value[16*threadId] = eval.SumLoop(attr, data->getMask(), &value[16*threadId], data->getSize(), queries);				
				break;
			}
			case INT64:
			{
				EvaluationLoop<int64_t> eval;
				value[16*threadId] = eval.SumLoop(attr, data->getMask(), &value[16*threadId], data->getSize(), queries);				
				break;
			}
			case DOUBLE:
			{
				EvaluationLoop<double> eval;
				value[16*threadId] = eval.SumLoop(attr, data->getMask(), &value[16*threadId], data->getSize(), queries);				
				break;
			}
			default:
			{
				std::cerr << type->toString() << " not valid for Sum" << std::endl;
			}
		}

		return nullptr;
	}

	std::bitset<MAXQUERIES> getQuery () {
		std::bitset<MAXQUERIES> q;
		q.reset();
		return q;
	}

	virtual uint64_t  getTableSet () override {
		return getChild()->getTableSet();
	}

	void setQuery (std::bitset<MAXQUERIES>& queries) {
		this->queries = queries;
	}

	void updateQuery (std::map<int,int>& mapping) {
		queries = mapQueries(queries, mapping);
	}

	float getSelectivity () {
		return 1.0;
	}

	void print () {
		std::cout << "(";
		std::cout << "sum ";
		getChild()->print();
		std::cout << " for " << queries;
		std::cout << ")";
	}
};

class AVGEvaluator : public UnaryEvaluator {
	DataType* type;
	int* value;
	int* valued;
	std::bitset<MAXQUERIES> queries;
	int numthreads;

	int* output;

	public:
	AVGEvaluator (Evaluator* attribute, int* output, DataType* type, int numthreads, std::bitset<MAXQUERIES> queries) : UnaryEvaluator(attribute), output(output), type(type), queries(queries), numthreads(numthreads) {
		value = (int*) malloc(numthreads*16*sizeof(int));
		for (int i = 0; i < numthreads; i++)
			value[16*i] = 0;

		valued = (int*) malloc(numthreads*16*sizeof(int));
		for (int i = 0; i < numthreads; i++)
			valued[16*i] = 0;
	}
	~AVGEvaluator () {
		int sum = 0;
		int sumd = 0;

		for (int i = 0; i < numthreads; i++) {
			sum += value[16*i];
			sumd += valued[16*i];
		}

		if (sumd > 0)
			output[0] = sum/sumd;
		else
			output[0] = -1;
		std::cout << sum << " ";
		delete type;
	}

	void* apply (DataBlock* data, int threadId) {
		void* attr = getChild()->apply(data, threadId);

		switch (type->getTypeValue()) {
			case INT: case FLOAT:
			{
				EvaluationLoop<int32_t> eval;
				value[16*threadId] = eval.SumLoop(attr, data->getMask(), &value[16*threadId], data->getSize(), queries);				
				break;
			}
			case INT64:
			{
				EvaluationLoop<int64_t> eval;
				value[16*threadId] = eval.SumLoop(attr, data->getMask(), &value[16*threadId], data->getSize(), queries);				
				break;
			}
			case DOUBLE:
			{
				EvaluationLoop<double> eval;
				value[16*threadId] = eval.SumLoop(attr, data->getMask(), &value[16*threadId], data->getSize(), queries);				
				break;
			}
			default:
			{
				std::cerr << type->toString() << " not valid for Sum" << std::endl;
			}
		}

		switch (type->getTypeValue()) {
			case INT: case FLOAT:
			{
				EvaluationLoop<int32_t> eval;
				valued[16*threadId] = eval.CountLoop(attr, data->getMask(), &valued[16*threadId], data->getSize(), queries);				
				break;
			}
			case INT64:
			{
				EvaluationLoop<int64_t> eval;
				valued[16*threadId] = eval.CountLoop(attr, data->getMask(), &valued[16*threadId], data->getSize(), queries);				
				break;
			}
			case DOUBLE:
			{
				EvaluationLoop<double> eval;
				valued[16*threadId] = eval.CountLoop(attr, data->getMask(), &valued[16*threadId], data->getSize(), queries);				
				break;
			}
			default:
			{
				std::cerr << type->toString() << " not valid for Count" << std::endl;
			}
		}

		return nullptr;
	}

	virtual uint64_t  getTableSet () override {
		return getChild()->getTableSet();
	}

	std::bitset<MAXQUERIES> getQuery () {
		std::bitset<MAXQUERIES> q;
		q.reset();
		return q;
	}

	void setQuery (std::bitset<MAXQUERIES>& queries) {
		this->queries = queries;
	}

	void updateQuery (std::map<int,int>& mapping) {
		queries = mapQueries(queries, mapping);
	}

	float getSelectivity () {
		return 1.0;
	}

	void print () {
		std::cout << "(";
		std::cout << "sum ";
		getChild()->print();
		std::cout << " for " << queries;
		std::cout << ")";
	}
};

class GROUPBYEvaluator2 : public Evaluator {
	Aggregator* aggregator;
	std::bitset<MAXQUERIES> queries;

	public:
	GROUPBYEvaluator2 (
		Schema* schema, 
		std::vector<Evaluator*> vals, 
		std::vector<int*>& valsData, 
		std::vector<std::string> ops, 
		std::vector<int> keys, 
		std::vector<int*>& keysData, 
		std::vector<Dictionary*> dicts,
		std::vector<std::pair<int, int*> > having_conds,
		std::vector<int> ordering,
		int limit,
		int tableId, 
		int numthreads, 
		std::bitset<MAXQUERIES> queries) : queries(queries) {
		aggregator = new Aggregator (schema, vals, valsData, ops, keys, keysData, dicts, having_conds, ordering, limit, 20, tableId, numthreads);
	}
	~GROUPBYEvaluator2 () {
		aggregator->produce();
		delete aggregator;
	}

	void* apply (DataBlock* data, int threadId) {
		aggregator->consume(data, queries, threadId);

		return nullptr;
	}

	std::bitset<MAXQUERIES> getQuery () {
		std::bitset<MAXQUERIES> q;
		q.reset();
		return q;
	}

	float getSelectivity () {
		return 1.0;
	}

	virtual uint64_t  getTableSet () override {
		return 0;
	}

	void print () {
		std::cout << "(";
		std::cout << "groupby ";
		std::cout << " for " << queries;
		std::cout << ")";
	}
};

class IFELSEEvaluator : public Evaluator {
	Evaluator* lhs;
	Evaluator* rhs;
	Evaluator* cond;

	int* buffers[MAXTHREADS];
public:
	IFELSEEvaluator (Schema* schema, Evaluator* cond, Evaluator* lhs, Evaluator* rhs) : cond(cond), lhs(lhs), rhs(rhs) {
		for (int i = 0; i < MAXTHREADS; i++) {
			buffers[i] = (int*)  schema->getBufferManager()->getBuffer();
		}
	}

	~IFELSEEvaluator () {}

	void* apply (DataBlock* data, int threadId) {
		int* ret = buffers[threadId];

		std::bitset<MAXQUERIES>* mask = (std::bitset<MAXQUERIES>*) cond->apply(data, threadId);
		int* src1 = (int*) lhs->apply(data, threadId);
		int* src2 = (int*) rhs->apply(data, threadId);

		uint64_t size = data->getSize();

		for (int i = 0; i < size; i++) {
			if (mask[i].any())
				ret[i] = src1[i];
			else
				ret[i] = src2[i];
		}
	}

	virtual uint64_t  getTableSet () override {
		return lhs->getTableSet() | rhs->getTableSet() | cond->getTableSet();
	}

	std::bitset<MAXQUERIES> getQuery () {
		std::bitset<MAXQUERIES> q;
		q.reset();
		return q;
	}

	float getSelectivity () {
		return 1.0;
	}
};

class ConstantIntEvaluator : public Evaluator {
	int* buffers[MAXTHREADS];
	const int val_;

	public:
	ConstantIntEvaluator (Schema* schema, int val) : val_(val) {
		for (int i = 0; i < MAXTHREADS; i++) {
			buffers[i] = (int*)  schema->getBufferManager()->getBuffer();
		}
	}

	~ConstantIntEvaluator () {}

	void* apply (DataBlock* data, int threadId) {
		int* ret    = buffers[threadId];

		uint64_t size = data->getSize();

		for (int i = 0; i < size; i++)
			ret[i] = val_;

		return ret;
	}

	float getSelectivity () {
		return 1.0;
	}

	virtual uint64_t  getTableSet () override {
		return 0;
	}

	std::bitset<MAXQUERIES> getQuery () {
		std::bitset<MAXQUERIES> q;
		q.reset();
		return q;
	}

	void print () {
		std::cout << "(";
		std::cout << val_;
		std::cout << ")";
	}
};

class TRUEEvaluator : public Evaluator {
	std::bitset<MAXQUERIES>* buffers[MAXTHREADS];

public:
	TRUEEvaluator (Schema* schema) {
		for (int i = 0; i < MAXTHREADS; i++) {
			buffers[i] = (std::bitset<MAXQUERIES>*)  schema->getBufferManager()->getBuffer();
		}
	}

	~TRUEEvaluator () {}

	void* apply (DataBlock* data, int threadId) {
		std::bitset<MAXQUERIES>* ret    = buffers[threadId];

		std::bitset<MAXQUERIES> queries = data->getQuery();

		uint64_t size = data->getSize();

		for (int i = 0; i < size; i++)
			ret[i] = queries;

		return ret;
	}

	virtual uint64_t  getTableSet () override {
		return 0;
	}

	float getSelectivity () {
		return 1.0;
	}

	std::bitset<MAXQUERIES> getQuery () {
		std::bitset<MAXQUERIES> q;
		q.reset();
		return q;
	}

	void print () {
		std::cout << "(";
		std::cout << " true";
		std::cout << ")";
	}
};

class EXTENDEvaluator : public UnaryEvaluator {
	std::bitset<MAXQUERIES> queries;

public:
	EXTENDEvaluator (Evaluator* attribute) : UnaryEvaluator(attribute) {
		queries = getChild()->getQuery();
	}
	~EXTENDEvaluator () {}

	void* apply (DataBlock* data, int threadId) {
		std::bitset<MAXQUERIES>* mask = (std::bitset<MAXQUERIES>*) getChild()->apply(data, threadId);

		std::bitset<MAXQUERIES> localQueries = data->getQuery() & queries;

		if (mask == nullptr || localQueries.any() == false)
			return nullptr;

		std::bitset<MAXQUERIES> orbits = data->getQuery() & (~queries);

		uint64_t size = data->getSize();

		for (int i = 0 ; i < size; i++) {
			mask[i] = (mask[i] | orbits);
		}

		return mask;
	}

	float getSelectivity () {
		return getChild()->getSelectivity();
	}

	virtual uint64_t  getTableSet () override {
		return 0;
	}

	std::bitset<MAXQUERIES> getQuery () {
		std::bitset<MAXQUERIES> q;
		q.reset();
		return q;
	}

	void setQuery (std::bitset<MAXQUERIES>& queries) {
		this->queries = queries;
	}

	void updateQuery (std::map<int,int>& mapping) {
		queries = mapQueries(queries, mapping);
	}

	void print () {
		getChild()->print();
	}
};

class FilterJoinEvaluator : public Evaluator {
	Stem* ht;
	int joinId;
	std::bitset<MAXQUERIES> queries;

	std::atomic<uint64_t> consumed;
	std::atomic<uint64_t> produced;

	std::bitset<MAXQUERIES>* buffers[MAXTHREADS];

public:
	FilterJoinEvaluator (Schema* schema, Stem* ht, int joinId, std::bitset<MAXQUERIES> queries) : ht(ht), joinId(joinId), queries(queries), consumed(1), produced(0) {
		for (int i = 0; i < MAXTHREADS; i++) {
			buffers[i] = (std::bitset<MAXQUERIES>*)  schema->getBufferManager()->getBuffer();
		}
	}
	~FilterJoinEvaluator () {}

	void* apply (DataBlock* data, int threadId) {
		std::bitset<MAXQUERIES> cqueries = queries & data->getQuery();

		if (cqueries.any() == false)
			return nullptr;

		std::bitset<MAXQUERIES>* ret = buffers[threadId];

		uint64_t oldest = data->getTrait();

		std::bitset<MAXQUERIES> orbits = data->getQuery() & (~cqueries);
		std::bitset<MAXQUERIES> pass = cqueries | orbits;
		std::bitset<MAXQUERIES> fail = orbits;

		int cnt = ht->pruning (ret, data, joinId, oldest, pass, fail, cqueries, threadId);

		consumed.fetch_add(data->getSize());
		produced.fetch_add(cnt);

		return ret;
	}

	float getSelectivity () {
		return 0.1;
	}

	float getSelectivityEstimate () {
		return produced/(float) consumed;
	}

	virtual uint64_t  getTableSet () override {
		const int keyProbe = ht->keyIndex_[joinId];
		int table = ht->schema_->getColumnParent(keyProbe);
		return (((1ull) << table));
	}

	std::bitset<MAXQUERIES> getQuery () {
		return queries;
	}

	void addQuery (std::bitset<MAXQUERIES> newqueries) {
		//assert((queries & newqueries) == 0);
		queries |= newqueries;
	}

	void setQuery (std::bitset<MAXQUERIES>& queries) {
		this->queries = queries;
	}

	void updateQuery (std::map<int,int>& mapping) {
		queries = mapQueries(queries, mapping);
	}

	int getJoinID () {
		return joinId;
	}

	void print () {
		std::cout << "(";
		std::cout << "filter join " << joinId << " on " << ht->schema_->getColumnString(ht->keyIndex_[joinId]);
		std::cout << ")";
	}
};



class NULLEvaluator : public UnaryEvaluator {
	std::bitset<MAXQUERIES> queries;
	std::bitset<MAXQUERIES>* buffers[MAXTHREADS];

public:
	NULLEvaluator (Schema* schema, Evaluator* attribute, std::bitset<MAXQUERIES> queries) : UnaryEvaluator(attribute), queries(queries) {
		for (int i = 0; i < MAXTHREADS; i++) {
			buffers[i] = (std::bitset<MAXQUERIES>*)  schema->getBufferManager()->getBuffer();
		}
	}
	~NULLEvaluator () {}

	void* apply (DataBlock* data, int threadId) {
		std::bitset<MAXQUERIES> cqueries = queries & data->getQuery();

		std::bitset<MAXQUERIES> relevance = data->getQuery() & queries;

		if (relevance.any() == false)
			return nullptr;

		int* attr = (int*) getChild()->apply(data, threadId);

		std::bitset<MAXQUERIES>* ret    = buffers[threadId];

		std::bitset<MAXQUERIES> orbits = data->getQuery() & (~cqueries);
		std::bitset<MAXQUERIES> pass = cqueries | orbits;
		std::bitset<MAXQUERIES> fail = orbits;

		uint64_t size = data->getSize();

		for (int i = 0; i < size; i++)
			ret[i] = (attr[i] == NULL_VALUE) ? pass : fail;

		return ret;
	}

	void print () {
		std::cout << "(";
		getChild()->print();
		std::cout << " is null " << queries;
		std::cout << ")";
	}

	float getSelectivity () {
		return 0.1;
	}

	virtual uint64_t  getTableSet () override {
		return getChild()->getTableSet();
	}

	std::bitset<MAXQUERIES> getQuery () {
		return queries;
	}

	void setQuery (std::bitset<MAXQUERIES>& queries) {
		this->queries = queries;
	}

	void updateQuery (std::map<int,int>& mapping) {
		queries = mapQueries(queries, mapping);
	}
};

class NOTNULLEvaluator : public UnaryEvaluator {
	std::bitset<MAXQUERIES> queries;
	std::bitset<MAXQUERIES>* buffers[MAXTHREADS];

public:
	NOTNULLEvaluator (Schema* schema, Evaluator* attribute, std::bitset<MAXQUERIES> queries) : UnaryEvaluator(attribute), queries(queries) {
		for (int i = 0; i < MAXTHREADS; i++) {
			buffers[i] = (std::bitset<MAXQUERIES>*)  schema->getBufferManager()->getBuffer();
		}
	}
	~NOTNULLEvaluator () {}

	void* apply (DataBlock* data, int threadId) {
		std::bitset<MAXQUERIES> cqueries = queries & data->getQuery();

		if ((data->getQuery() & queries) == 0)
			return nullptr;

		int* attr = (int*) getChild()->apply(data, threadId);

		std::bitset<MAXQUERIES>* ret    = buffers[threadId];

		std::bitset<MAXQUERIES> orbits = data->getQuery() & (~cqueries);
		std::bitset<MAXQUERIES> pass = cqueries | orbits;
		std::bitset<MAXQUERIES> fail = orbits;

		uint64_t size = data->getSize();

		for (int i = 0; i < size; i++)
			ret[i] = (attr[i] != NULL_VALUE) ? pass : fail;

		return ret;
	}

	void print () {
		std::cout << "(";
		getChild()->print();
		std::cout << " is not null " << queries;
		std::cout << ")";
	}

	float getSelectivity () {
		return 1.0;
	}

	virtual uint64_t  getTableSet () override {
		return getChild()->getTableSet();
	}

	std::bitset<MAXQUERIES> getQuery () {
		return queries;
	}

	void setQuery (std::bitset<MAXQUERIES>& queries) {
		this->queries = queries;
	}

	void updateQuery (std::map<int,int>& mapping) {
		queries = mapQueries(queries, mapping);
	}
};

class LTEvaluator : public UnaryEvaluator {
	DataType* type;
	void*     mem_value;
	std::bitset<MAXQUERIES> queries;
	std::bitset<MAXQUERIES>* buffers[MAXTHREADS];

public:
	LTEvaluator (Schema* schema, Evaluator* attribute, void* mem_value, DataType* type, std::bitset<MAXQUERIES> queries) : UnaryEvaluator(attribute), type(type), mem_value(mem_value), queries(queries) {
		for (int i = 0; i < MAXTHREADS; i++) {
			buffers[i] = (std::bitset<MAXQUERIES>*)  schema->getBufferManager()->getBuffer();
		}
	}
	~LTEvaluator () {
		free(mem_value);
		delete type;
	}

	void* apply (DataBlock* data, int threadId) {
		std::bitset<MAXQUERIES> cqueries = queries & data->getQuery();

		if ((data->getQuery() & queries) == 0)
			return nullptr;

		void* attr = getChild()->apply(data, threadId);

		std::bitset<MAXQUERIES>* ret = buffers[threadId];

		std::bitset<MAXQUERIES> orbits = data->getQuery() & (~cqueries);
		std::bitset<MAXQUERIES> pass = cqueries | orbits;
		std::bitset<MAXQUERIES> fail = orbits;

		switch (type->getTypeValue()) {
			case INT: case FLOAT:
			{
				EvaluationLoop<int32_t> eval;
				eval.LTLoop(ret, attr, mem_value, data->getSize(), pass, fail);				
				break;
			}
			case INT64:
			{
				EvaluationLoop<int64_t> eval;
				eval.LTLoop(ret, attr, mem_value, data->getSize(), pass, fail);				
				break;
			}
			case DOUBLE:
			{
				EvaluationLoop<double> eval;
				eval.LTLoop(ret, attr, mem_value, data->getSize(), pass, fail);				
				break;
			}
			default:
			{
				std::cerr << type->toString() << " not valid for LT" << std::endl;
			}
		}

		return ret;
	}

	virtual uint64_t  getTableSet () override {
		return getChild()->getTableSet();
	}

	void print () {
		std::cout << "(";
		getChild()->print();
		std::cout << " < " << *((int*) mem_value) << " for " << queries;
		std::cout << ")";
	}

	float getSelectivity () {
		return 0.1;
	}

	std::bitset<MAXQUERIES> getQuery () {
		return queries;
	}

	void setQuery (std::bitset<MAXQUERIES>& queries) {
		this->queries = queries;
	}

	void updateQuery (std::map<int,int>& mapping) {
		queries = mapQueries(queries, mapping);
	}
};

class LEEvaluator : public UnaryEvaluator {
	DataType* type;
	void*     mem_value;
	std::bitset<MAXQUERIES> queries;
	std::bitset<MAXQUERIES>* buffers[MAXTHREADS];

public:
	LEEvaluator (Schema* schema, Evaluator* attribute, void* mem_value, DataType* type, std::bitset<MAXQUERIES> queries) : UnaryEvaluator(attribute), type(type), mem_value(mem_value), queries(queries) {
		for (int i = 0; i < MAXTHREADS; i++) {
			buffers[i] = (std::bitset<MAXQUERIES>*)  schema->getBufferManager()->getBuffer();
		}
	}
	~LEEvaluator () {
		free(mem_value);
		delete type;
	}

	void* apply (DataBlock* data, int threadId) {
		std::bitset<MAXQUERIES> cqueries = queries & data->getQuery();

		if ((data->getQuery() & queries) == 0)
			return nullptr;

		void* attr = getChild()->apply(data, threadId);

		std::bitset<MAXQUERIES>* ret    = buffers[threadId];

		std::bitset<MAXQUERIES> orbits = data->getQuery() & (~cqueries);
		std::bitset<MAXQUERIES> pass = cqueries | orbits;
		std::bitset<MAXQUERIES> fail = orbits;

		switch (type->getTypeValue()) {
			case INT: case FLOAT:
			{
				EvaluationLoop<int32_t> eval;
				eval.LELoop(ret, attr, mem_value, data->getSize(), pass, fail);				
				break;
			}
			case INT64:
			{
				EvaluationLoop<int64_t> eval;
				eval.LELoop(ret, attr, mem_value, data->getSize(), pass, fail);				
				break;
			}
			case DOUBLE:
			{
				EvaluationLoop<double> eval;
				eval.LELoop(ret, attr, mem_value, data->getSize(), pass, fail);				
				break;
			}
			default:
			{
				std::cerr << type->toString() << " not valid for LE" << std::endl;
			}
		}

		return ret;
	}

	void* applySelective (DataBlock* data, char* mark, int threadId) {
		std::bitset<MAXQUERIES> cqueries = queries & data->getQuery();

		if ((data->getQuery() & queries) == 0)
			return nullptr;

		void* attr = getChild()->applySelective(data, mark, threadId);

		std::bitset<MAXQUERIES>* ret    = buffers[threadId];

		std::bitset<MAXQUERIES> orbits = data->getQuery() & (~cqueries);
		std::bitset<MAXQUERIES> pass = cqueries | orbits;
		std::bitset<MAXQUERIES> fail = orbits;

		switch (type->getTypeValue()) {
			case INT: case FLOAT:
			{
				EvaluationLoop<int32_t> eval;
				eval.LELoopSparse(ret, mark, attr, mem_value, data->getSize(), pass, fail);				
				break;
			}
			case INT64:
			{
				assert(false);				
				break;
			}
			case DOUBLE:
			{
				assert(false);			
				break;
			}
			default:
			{
				assert(false);
				std::cerr << type->toString() << " not valid for LE" << std::endl;
			}
		}

		return ret;
	}

	virtual uint64_t  getTableSet () override {
		return getChild()->getTableSet();
	}

	void print () {
		std::cout << "(";
		getChild()->print();
		std::cout << " <= " << *((int*) mem_value) << " for " << queries;
		std::cout << ")";
	}

	float getSelectivity () {
		return 0.1;
	}

	std::bitset<MAXQUERIES> getQuery () {
		return queries;
	}

	void setQuery (std::bitset<MAXQUERIES>& queries) {
		this->queries = queries;
	}

	void updateQuery (std::map<int,int>& mapping) {
		queries = mapQueries(queries, mapping);
	}
};

class GTEvaluator : public UnaryEvaluator {
	DataType* type;
	void*     mem_value;
	std::bitset<MAXQUERIES> queries;

	std::bitset<MAXQUERIES>* buffers[MAXTHREADS];

public:
	GTEvaluator (Schema* schema, Evaluator* attribute, void* mem_value, DataType* type, std::bitset<MAXQUERIES> queries) : UnaryEvaluator(attribute), type(type), mem_value(mem_value), queries(queries) {
		for (int i = 0; i < MAXTHREADS; i++) {
			buffers[i] = (std::bitset<MAXQUERIES>*)  schema->getBufferManager()->getBuffer();
		}
	}
	~GTEvaluator () {
		free(mem_value);
		delete type;
	}

	void* apply (DataBlock* data, int threadId) {
		std::bitset<MAXQUERIES> cqueries = queries & data->getQuery();

		if ((data->getQuery() & queries) == 0)
			return nullptr;

		void* attr = getChild()->apply(data, threadId);

		std::bitset<MAXQUERIES>* ret    = buffers[threadId];

		std::bitset<MAXQUERIES> orbits = data->getQuery() & (~cqueries);
		std::bitset<MAXQUERIES> pass = cqueries | orbits;
		std::bitset<MAXQUERIES> fail = orbits;

		switch (type->getTypeValue()) {
			case INT: case FLOAT:
			{
				EvaluationLoop<int32_t> eval;
				eval.GTLoop(ret, attr, mem_value, data->getSize(), pass, fail);				
				break;
			}
			case INT64:
			{
				EvaluationLoop<int64_t> eval;;
				eval.GTLoop(ret, attr, mem_value, data->getSize(), pass, fail);			
				break;
			}
			case DOUBLE:
			{
				EvaluationLoop<double> eval;
				eval.GTLoop(ret, attr, mem_value, data->getSize(), pass, fail);				
				break;
			}
			default:
			{
				std::cerr << type->toString() << " not valid for GT" << std::endl;
			}
		}

		return ret;
	}

	virtual uint64_t  getTableSet () override {
		return getChild()->getTableSet();
	}

	void print () {
		std::cout << "(";
		getChild()->print();
		std::cout << " > " << *((int*) mem_value) << " for " << queries;
		std::cout << ")";
	}

	float getSelectivity () {
		return 0.1;
	}

	std::bitset<MAXQUERIES> getQuery () {
		return queries;
	}

	void setQuery (std::bitset<MAXQUERIES>& queries) {
		this->queries = queries;
	}

	void updateQuery (std::map<int,int>& mapping) {
		queries = mapQueries(queries, mapping);
	}
};

class GEEvaluator : public UnaryEvaluator {
	DataType* type;
	void*     mem_value;
	std::bitset<MAXQUERIES> queries;

	std::bitset<MAXQUERIES>* buffers[MAXTHREADS];

public:
	GEEvaluator (Schema* schema, Evaluator* attribute, void* mem_value, DataType* type, std::bitset<MAXQUERIES> queries) : UnaryEvaluator(attribute), type(type), mem_value(mem_value), queries(queries) {
		for (int i = 0; i < MAXTHREADS; i++) {
			buffers[i] = (std::bitset<MAXQUERIES>*)  schema->getBufferManager()->getBuffer();
		}
	}
	~GEEvaluator () {
		free(mem_value);
		delete type;
	}

	void* apply (DataBlock* data, int threadId) {
		std::bitset<MAXQUERIES> cqueries = queries & data->getQuery();

		if ((data->getQuery() & queries) == 0)
			return nullptr;

		void* attr = getChild()->apply(data, threadId);

		std::bitset<MAXQUERIES>* ret    = buffers[threadId];

		std::bitset<MAXQUERIES> orbits = data->getQuery() & (~cqueries);
		std::bitset<MAXQUERIES> pass = cqueries | orbits;
		std::bitset<MAXQUERIES> fail = orbits;

		switch (type->getTypeValue()) {
			case INT: case FLOAT:
			{
				EvaluationLoop<int32_t> eval;
				eval.GELoop(ret, attr, mem_value, data->getSize(), pass, fail);				
				break;
			}
			case INT64:
			{
				EvaluationLoop<int64_t> eval;
				eval.GELoop(ret, attr, mem_value, data->getSize(), pass, fail);				
				break;
			}
			case DOUBLE:
			{
				EvaluationLoop<double> eval;
				eval.GELoop(ret, attr, mem_value, data->getSize(), pass, fail);				
				break;
			}
			default:
			{
				std::cerr << type->toString() << " not valid for GE" << std::endl;
			}
		}

		return ret;
	}

	void* applySelective (DataBlock* data, char* mark, int threadId) {
		std::bitset<MAXQUERIES> cqueries = queries & data->getQuery();

		if ((data->getQuery() & queries) == 0)
			return nullptr;

		void* attr = getChild()->applySelective(data, mark, threadId);

		std::bitset<MAXQUERIES>* ret    = buffers[threadId];

		std::bitset<MAXQUERIES> orbits = data->getQuery() & (~cqueries);
		std::bitset<MAXQUERIES> pass = cqueries | orbits;
		std::bitset<MAXQUERIES> fail = orbits;

		switch (type->getTypeValue()) {
			case INT: case FLOAT:
			{
				EvaluationLoop<int32_t> eval;
				eval.GELoopSparse(ret, mark, attr, mem_value, data->getSize(), pass, fail);				
				break;
			}
			case INT64:
			{
				assert(false);				
				break;
			}
			case DOUBLE:
			{
				assert(false);			
				break;
			}
			default:
			{
				std::cerr << type->toString() << " not valid for GE" << std::endl;
			}
		}

		return ret;
	}

	virtual uint64_t  getTableSet () override {
		return getChild()->getTableSet();
	}

	void print () {
		std::cout << "(";
		getChild()->print();
		std::cout << " >= " << *((int*) mem_value) << " for " << queries;
		std::cout << ")";
	}

	float getSelectivity () {
		return 0.1;
	}

	std::bitset<MAXQUERIES> getQuery () {
		return queries;
	}

	void setQuery (std::bitset<MAXQUERIES>& queries) {
		this->queries = queries;
	}

	void updateQuery (std::map<int,int>& mapping) {
		queries = mapQueries(queries, mapping);
	}
};

class EQEvaluator : public UnaryEvaluator {
	DataType* type;
	void*     mem_value;
	std::bitset<MAXQUERIES> queries;

	std::bitset<MAXQUERIES>* buffers[MAXTHREADS];

public:
	EQEvaluator (Schema* schema, Evaluator* attribute, void* mem_value, DataType* type, std::bitset<MAXQUERIES> queries) : UnaryEvaluator(attribute), type(type), mem_value(mem_value), queries(queries) {
		for (int i = 0; i < MAXTHREADS; i++) {
			buffers[i] = (std::bitset<MAXQUERIES>*)  schema->getBufferManager()->getBuffer();
		}
	}
	~EQEvaluator () {
		free(mem_value);
		delete type;
	}

	void* apply (DataBlock* data, int threadId) {
		std::bitset<MAXQUERIES> cqueries = queries & data->getQuery();

		if ((data->getQuery() & queries) == 0)
			return nullptr;

		void* attr = getChild()->apply(data, threadId);

		std::bitset<MAXQUERIES>* ret    = buffers[threadId];

		std::bitset<MAXQUERIES> orbits = data->getQuery() & (~cqueries);
		std::bitset<MAXQUERIES> pass = cqueries | orbits;
		std::bitset<MAXQUERIES> fail = orbits;

		switch (type->getTypeValue()) {
			case INT: case FLOAT:
			{
				EvaluationLoop<int32_t> eval;
				eval.EQLoop(ret, attr, mem_value, data->getSize(), pass, fail);				
				break;
			}
			case INT64:
			{
				EvaluationLoop<int64_t> eval;
				eval.EQLoop(ret, attr, mem_value, data->getSize(), pass, fail);				
				break;
			}
			case DOUBLE:
			{
				EvaluationLoop<double> eval;
				eval.EQLoop(ret, attr, mem_value, data->getSize(), pass, fail);	
				break;
			}
			default:
			{
				std::cerr << type->toString() << " not valid for GE" << std::endl;
			}
		}

		return ret;
	}

	void* applySelective (DataBlock* data, char* mark, int threadId) {
		std::bitset<MAXQUERIES> cqueries = queries & data->getQuery();

		if ((data->getQuery() & queries) == 0)
			return nullptr;

		void* attr = getChild()->applySelective(data, mark, threadId);

		std::bitset<MAXQUERIES>* ret    = buffers[threadId];

		std::bitset<MAXQUERIES> orbits = data->getQuery() & (~cqueries);
		std::bitset<MAXQUERIES> pass = cqueries | orbits;
		std::bitset<MAXQUERIES> fail = orbits;

		switch (type->getTypeValue()) {
			case INT: case FLOAT:
			{
				EvaluationLoop<int32_t> eval;
				eval.EQLoopSparse(ret, mark, attr, mem_value, data->getSize(), pass, fail);				
				break;
			}
			case INT64:
			{
				assert(false);			
				break;
			}
			case DOUBLE:
			{
				assert(false);	
				break;
			}
			default:
			{
				std::cerr << type->toString() << " not valid for GE" << std::endl;
				assert(false);	
			}
		}

		return ret;
	}

	virtual uint64_t  getTableSet () override {
		return getChild()->getTableSet();
	}

	void print () {
		std::cout << "(";
		getChild()->print();
		std::cout << " = " << *((int*) mem_value) << " for " << queries;
		std::cout << ")";
	}

	float getSelectivity () {
		return 0.1;
	}

	std::bitset<MAXQUERIES> getQuery () {
		return queries;
	}

	void setQuery (std::bitset<MAXQUERIES>& queries) {
		this->queries = queries;
	}

	void updateQuery (std::map<int,int>& mapping) {
		queries = mapQueries(queries, mapping);
	}
};

class NEQEvaluator : public UnaryEvaluator {
	DataType* type;
	void*     mem_value;
	std::bitset<MAXQUERIES> queries;

	std::bitset<MAXQUERIES>* buffers[MAXTHREADS];

public:
	NEQEvaluator (Schema* schema, Evaluator* attribute, void* mem_value, DataType* type, std::bitset<MAXQUERIES> queries) : UnaryEvaluator(attribute), type(type), mem_value(mem_value), queries(queries) {
		for (int i = 0; i < MAXTHREADS; i++) {
			buffers[i] = (std::bitset<MAXQUERIES>*)  schema->getBufferManager()->getBuffer();
		}
	}
	~NEQEvaluator () {
		free(mem_value);
		delete type;
	}

	void* apply (DataBlock* data, int threadId) {
		std::bitset<MAXQUERIES> cqueries = queries & data->getQuery();

		if ((data->getQuery() & queries) == 0)
			return nullptr;

		void* attr = getChild()->apply(data, threadId);

		std::bitset<MAXQUERIES>* ret    = buffers[threadId];

		std::bitset<MAXQUERIES> orbits = data->getQuery() & (~cqueries);
		std::bitset<MAXQUERIES> pass = cqueries | orbits;
		std::bitset<MAXQUERIES> fail = orbits;

		switch (type->getTypeValue()) {
			case INT: case FLOAT:
			{
				EvaluationLoop<int32_t> eval;
				eval.NEQLoop(ret, attr, mem_value, data->getSize(), pass, fail);				
				break;
			}
			case INT64:
			{
				EvaluationLoop<int64_t> eval;
				eval.NEQLoop(ret, attr, mem_value, data->getSize(), pass, fail);				
				break;
			}
			case DOUBLE:
			{
				EvaluationLoop<double> eval;
				eval.NEQLoop(ret, attr, mem_value, data->getSize(), pass, fail);	
				break;
			}
			default:
			{
				std::cerr << type->toString() << " not valid for GE" << std::endl;
			}
		}

		return ret;
	}

	virtual uint64_t  getTableSet () override {
		return getChild()->getTableSet();
	}

	void print () {
		std::cout << "(";
		getChild()->print();
		std::cout << " != " << *((int*) mem_value) << " for " << queries;
		std::cout << ")";
	}

	float getSelectivity () {
		return 0.1;
	}

	std::bitset<MAXQUERIES> getQuery () {
		return queries;
	}

	void setQuery (std::bitset<MAXQUERIES>& queries) {
		this->queries = queries;
	}

	void updateQuery (std::map<int,int>& mapping) {
		queries = mapQueries(queries, mapping);
	}
};

class VEQEvaluator : public BinaryEvaluator {
	Dictionary* d1;
	Dictionary* d2;

	std::bitset<MAXQUERIES> queries;

	std::bitset<MAXQUERIES>* buffers[MAXTHREADS];

public:
	VEQEvaluator (Schema* schema, Evaluator* attr1, Evaluator* attr2, Dictionary* d1, Dictionary* d2, std::bitset<MAXQUERIES> queries) : BinaryEvaluator(attr1, attr2), d1(d1), d2(d2), queries(queries) {
		for (int i = 0; i < MAXTHREADS; i++) {
			buffers[i] = (std::bitset<MAXQUERIES>*)  schema->getBufferManager()->getBuffer();
		}
	}
	~VEQEvaluator () {
	}

	void* apply (DataBlock* data, int threadId) {
		std::bitset<MAXQUERIES> cqueries = queries & data->getQuery();

		if ((data->getQuery() & queries) == 0)
			return nullptr;

		int* attr1 = (int*) getChildLeft()->apply(data, threadId);
		int* attr2 = (int*) getChildRight()->apply(data, threadId);

		std::bitset<MAXQUERIES>* ret    = buffers[threadId];

		std::bitset<MAXQUERIES> orbits = data->getQuery() & (~cqueries);
		std::bitset<MAXQUERIES> pass = cqueries | orbits;
		std::bitset<MAXQUERIES> fail = orbits;

		int dataCnt = data->getSize();

		if (d1 == nullptr) {
			for (int i = 0; i < dataCnt; i++) {
				ret[i] = (attr1[i] == attr2[i])? pass : fail;
			}
		} else {
			assert(d1 != d2);

			std::vector<std::string>& entries1 = d1->getEntries();
			std::vector<std::string>& entries2 = d2->getEntries();

			for (int i = 0; i < dataCnt; i++) {
				ret[i] = (attr1[i] != NULL_VALUE && attr2[i] != NULL_VALUE && entries1[attr1[i]].compare(entries2[attr2[i]]) == 0)? pass : fail;
			}
		}

		return ret;
	}

	virtual uint64_t  getTableSet () override {
		return getChildLeft()->getTableSet() | getChildRight()->getTableSet();
	}

	void print () {
		std::cout << "(vneq)";
	}

	float getSelectivity () {
		return 0.1;
	}

	std::bitset<MAXQUERIES> getQuery () {
		return queries;
	}

	void setQuery (std::bitset<MAXQUERIES>& queries) {
		this->queries = queries;
	}

	void updateQuery (std::map<int,int>& mapping) {
		queries = mapQueries(queries, mapping);
	}
};

class VNEQEvaluator : public BinaryEvaluator {
	Dictionary* d1;
	Dictionary* d2;

	std::bitset<MAXQUERIES> queries;

	std::bitset<MAXQUERIES>* buffers[MAXTHREADS];

public:
	VNEQEvaluator (Schema* schema, Evaluator* attr1, Evaluator* attr2, Dictionary* d1, Dictionary* d2, std::bitset<MAXQUERIES> queries) : BinaryEvaluator(attr1, attr2), d1(d1), d2(d2), queries(queries) {
		for (int i = 0; i < MAXTHREADS; i++) {
			buffers[i] = (std::bitset<MAXQUERIES>*)  schema->getBufferManager()->getBuffer();
		}
	}
	~VNEQEvaluator () {
	}

	void* apply (DataBlock* data, int threadId) {
		std::bitset<MAXQUERIES> cqueries = queries & data->getQuery();

		if ((data->getQuery() & queries) == 0)
			return nullptr;

		int* attr1 = (int*) getChildLeft()->apply(data, threadId);
		int* attr2 = (int*) getChildRight()->apply(data, threadId);

		std::bitset<MAXQUERIES>* ret    = buffers[threadId];

		std::bitset<MAXQUERIES> orbits = data->getQuery() & (~cqueries);
		std::bitset<MAXQUERIES> pass = cqueries | orbits;
		std::bitset<MAXQUERIES> fail = orbits;

		int dataCnt = data->getSize();

		if (d1 == nullptr) {
			for (int i = 0; i < dataCnt; i++) {
				ret[i] = (attr1[i] != attr2[i])? pass : fail;
			}
		} else {
			assert(d1 != d2);

			std::vector<std::string>& entries1 = d1->getEntries();
			std::vector<std::string>& entries2 = d2->getEntries();

			for (int i = 0; i < dataCnt; i++) {
				ret[i] = (attr1[i] != NULL_VALUE && attr2[i] != NULL_VALUE && entries1[attr1[i]].compare(entries2[attr2[i]]) != 0)? pass : fail;
			}
		}

		return ret;
	}

	virtual uint64_t  getTableSet () override {
		return getChildLeft()->getTableSet() | getChildRight()->getTableSet();
	}

	void print () {
		std::cout << "(vneq)";
	}

	float getSelectivity () {
		return 0.1;
	}

	std::bitset<MAXQUERIES> getQuery () {
		return queries;
	}

	void setQuery (std::bitset<MAXQUERIES>& queries) {
		this->queries = queries;
	}

	void updateQuery (std::map<int,int>& mapping) {
		queries = mapQueries(queries, mapping);
	}
};

class VGTEvaluator2 : public BinaryEvaluator {
	std::bitset<MAXQUERIES> queries;

	std::bitset<MAXQUERIES>* buffers[MAXTHREADS];

public:
	VGTEvaluator2 (Schema* schema, Evaluator* attr1, Evaluator* attr2, std::bitset<MAXQUERIES> queries) : BinaryEvaluator(attr1, attr2), queries(queries) {
		for (int i = 0; i < MAXTHREADS; i++) {
			buffers[i] = (std::bitset<MAXQUERIES>*)  schema->getBufferManager()->getBuffer();
		}
	}
	~VGTEvaluator2 () {
	}

	void* apply (DataBlock* data, int threadId) {
		std::bitset<MAXQUERIES> cqueries = queries & data->getQuery();

		if ((data->getQuery() & queries) == 0)
			return nullptr;

		int* attr1 = (int*) getChildLeft()->apply(data, threadId);
		int* attr2 = (int*) getChildRight()->apply(data, threadId);

		std::bitset<MAXQUERIES>* ret    = buffers[threadId];

		std::bitset<MAXQUERIES> orbits = data->getQuery() & (~cqueries);
		std::bitset<MAXQUERIES> pass = cqueries | orbits;
		std::bitset<MAXQUERIES> fail = orbits;

		int dataCnt = data->getSize();

		for (int i = 0; i < dataCnt; i++) {
			ret[i] = (attr1[i] != NULL_VALUE && attr2[i] > 0 && attr1[i]/((float)attr2[i]) > 1.2)? pass : fail;
		}

		return ret;
	}

	virtual uint64_t  getTableSet () override {
		return getChildLeft()->getTableSet() | getChildRight()->getTableSet();
	}

	void print () {
		std::cout << "(vneq)";
	}

	float getSelectivity () {
		return 0.1;
	}

	std::bitset<MAXQUERIES> getQuery () {
		return queries;
	}

	void setQuery (std::bitset<MAXQUERIES>& queries) {
		this->queries = queries;
	}

	void updateQuery (std::map<int,int>& mapping) {
		queries = mapQueries(queries, mapping);
	}
};

class VLTEvaluator : public BinaryEvaluator {
	std::bitset<MAXQUERIES> queries;

	std::bitset<MAXQUERIES>* buffers[MAXTHREADS];

public:
	VLTEvaluator (Schema* schema, Evaluator* attr1, Evaluator* attr2, std::bitset<MAXQUERIES> queries) : BinaryEvaluator(attr1, attr2), queries(queries) {
		for (int i = 0; i < MAXTHREADS; i++) {
			buffers[i] = (std::bitset<MAXQUERIES>*)  schema->getBufferManager()->getBuffer();
		}
	}
	~VLTEvaluator () {
	}

	void* apply (DataBlock* data, int threadId) {
		std::bitset<MAXQUERIES> cqueries = queries & data->getQuery();

		if ((data->getQuery() & queries) == 0)
			return nullptr;

		int* attr1 = (int*) getChildLeft()->apply(data, threadId);
		int* attr2 = (int*) getChildRight()->apply(data, threadId);

		std::bitset<MAXQUERIES>* ret    = buffers[threadId];

		std::bitset<MAXQUERIES> orbits = data->getQuery() & (~cqueries);
		std::bitset<MAXQUERIES> pass = cqueries | orbits;
		std::bitset<MAXQUERIES> fail = orbits;

		int dataCnt = data->getSize();

		for (int i = 0; i < dataCnt; i++) {
			ret[i] = (attr1[i] != NULL_VALUE && attr2[i] != NULL_VALUE && attr1[i]  < attr2[i])? pass : fail;
		}

		return ret;
	}

	virtual uint64_t  getTableSet () override {
		return getChildLeft()->getTableSet() | getChildRight()->getTableSet();
	}

	void print () {
		std::cout << "(vneq)";
	}

	float getSelectivity () {
		return 0.1;
	}

	std::bitset<MAXQUERIES> getQuery () {
		return queries;
	}

	void setQuery (std::bitset<MAXQUERIES>& queries) {
		this->queries = queries;
	}

	void updateQuery (std::map<int,int>& mapping) {
		queries = mapQueries(queries, mapping);
	}
};

class VGTEvaluator : public BinaryEvaluator {
	std::bitset<MAXQUERIES> queries;

	std::bitset<MAXQUERIES>* buffers[MAXTHREADS];

public:
	VGTEvaluator (Schema* schema, Evaluator* attr1, Evaluator* attr2, std::bitset<MAXQUERIES> queries) : BinaryEvaluator(attr1, attr2), queries(queries) {
		for (int i = 0; i < MAXTHREADS; i++) {
			buffers[i] = (std::bitset<MAXQUERIES>*)  schema->getBufferManager()->getBuffer();
		}
	}
	~VGTEvaluator () {
	}

	void* apply (DataBlock* data, int threadId) {
		std::bitset<MAXQUERIES> cqueries = queries & data->getQuery();

		if ((data->getQuery() & queries) == 0)
			return nullptr;

		int* attr1 = (int*) getChildLeft()->apply(data, threadId);
		int* attr2 = (int*) getChildRight()->apply(data, threadId);

		std::bitset<MAXQUERIES>* ret    = buffers[threadId];

		std::bitset<MAXQUERIES> orbits = data->getQuery() & (~cqueries);
		std::bitset<MAXQUERIES> pass = cqueries | orbits;
		std::bitset<MAXQUERIES> fail = orbits;

		int dataCnt = data->getSize();

		for (int i = 0; i < dataCnt; i++) {
			ret[i] = (attr1[i] != NULL_VALUE && attr2[i] != NULL_VALUE && attr1[i]  > attr2[i])? pass : fail;
		}

		return ret;
	}

	virtual uint64_t  getTableSet () override {
		return getChildLeft()->getTableSet() | getChildRight()->getTableSet();
	}

	void print () {
		std::cout << "(vneq)";
	}

	float getSelectivity () {
		return 0.1;
	}

	std::bitset<MAXQUERIES> getQuery () {
		return queries;
	}

	void setQuery (std::bitset<MAXQUERIES>& queries) {
		this->queries = queries;
	}

	void updateQuery (std::map<int,int>& mapping) {
		queries = mapQueries(queries, mapping);
	}
};

class VGTEvaluator5 : public BinaryEvaluator {
	std::bitset<MAXQUERIES> queries;

	std::bitset<MAXQUERIES>* buffers[MAXTHREADS];

public:
	VGTEvaluator5 (Schema* schema, Evaluator* attr1, Evaluator* attr2, std::bitset<MAXQUERIES> queries) : BinaryEvaluator(attr1, attr2), queries(queries) {
		for (int i = 0; i < MAXTHREADS; i++) {
			buffers[i] = (std::bitset<MAXQUERIES>*)  schema->getBufferManager()->getBuffer();
		}
	}
	~VGTEvaluator5 () {
	}

	void* apply (DataBlock* data, int threadId) {
		std::bitset<MAXQUERIES> cqueries = queries & data->getQuery();

		if ((data->getQuery() & queries) == 0)
			return nullptr;

		int* attr1 = (int*) getChildLeft()->apply(data, threadId);
		int* attr2 = (int*) getChildRight()->apply(data, threadId);

		std::bitset<MAXQUERIES>* ret    = buffers[threadId];

		std::bitset<MAXQUERIES> orbits = data->getQuery() & (~cqueries);
		std::bitset<MAXQUERIES> pass = cqueries | orbits;
		std::bitset<MAXQUERIES> fail = orbits;

		int dataCnt = data->getSize();

		for (int i = 0; i < dataCnt; i++) {
			ret[i] = (attr1[i] != NULL_VALUE && attr2[i] != NULL_VALUE && attr1[i]  > attr2[i] + 5)? pass : fail;
		}

		return ret;
	}

	virtual uint64_t  getTableSet () override {
		return getChildLeft()->getTableSet() | getChildRight()->getTableSet();
	}

	void print () {
		std::cout << "(vneq)";
	}

	float getSelectivity () {
		return 0.1;
	}

	std::bitset<MAXQUERIES> getQuery () {
		return queries;
	}

	void setQuery (std::bitset<MAXQUERIES>& queries) {
		this->queries = queries;
	}

	void updateQuery (std::map<int,int>& mapping) {
		queries = mapQueries(queries, mapping);
	}
};

class INEvaluator : public UnaryEvaluator {
	DataType* type;
	Dictionary* dict;
	std::string expr;
	int* lookup;
	std::bitset<MAXQUERIES> queries;

	std::bitset<MAXQUERIES>* buffers[MAXTHREADS];

public:
	INEvaluator (Schema* schema,Evaluator* attribute, const std::string& expr, Dictionary* dict, DataType* type, std::bitset<MAXQUERIES>  queries) : UnaryEvaluator(attribute), type(type), expr(expr), queries(queries), dict(dict) {
		lookup = dict->allocateFilter();

		dict->populateSet(lookup, expr, 0, 1);

		for (int i = 0; i < MAXTHREADS; i++) {
			buffers[i] = (std::bitset<MAXQUERIES>*)  schema->getBufferManager()->getBuffer();
		}
	}

	~INEvaluator () {
		delete type;
		dict->freeFilter(lookup);
	}

	void* apply (DataBlock* data, int threadId) {
		std::bitset<MAXQUERIES> cqueries = queries & data->getQuery();

		if ((data->getQuery() & queries) == 0)
			return nullptr;

		int* attr = (int*) getChild()->apply(data, threadId);

		std::bitset<MAXQUERIES>* ret    = buffers[threadId];

		uint64_t dataCnt = data->getSize();

		std::bitset<MAXQUERIES> orbits = data->getQuery() & (~cqueries);
		std::bitset<MAXQUERIES> pass = cqueries | orbits;
		std::bitset<MAXQUERIES> fail = orbits;

		for (int i = 0; i < dataCnt; i++) {
			ret[i] = (attr[i] != NULL_VALUE && lookup[attr[i]] == 0)? pass : fail;
		}		

		return ret;
	}

	void* applySelective (DataBlock* data, char* mark, int threadId) {
		std::bitset<MAXQUERIES> cqueries = queries & data->getQuery();

		if ((data->getQuery() & queries) == 0)
			return nullptr;

		int* attr = (int*) getChild()->applySelective(data, mark, threadId);

		std::bitset<MAXQUERIES>* ret    = buffers[threadId];

		uint64_t dataCnt = data->getSize();

		std::bitset<MAXQUERIES> orbits = data->getQuery() & (~cqueries);
		std::bitset<MAXQUERIES> pass = cqueries | orbits;
		std::bitset<MAXQUERIES> fail = orbits;

		for (int i = 0; i < dataCnt; i++) {
			if (mark[i])
				ret[i] = (attr[i] != NULL_VALUE && lookup[attr[i]] == 0)? pass : fail;
		}		

		return ret;
	}

	virtual uint64_t  getTableSet () override {
		return getChild()->getTableSet();
	}

	void print () {
		std::cout << "(";
		getChild()->print();
		std::cout << " in " << expr << " for " << queries;
		std::cout << ")";
	}

	float getSelectivity () {
		return 0.1;
	}

	std::bitset<MAXQUERIES> getQuery () {
		return queries;
	}

	void setQuery (std::bitset<MAXQUERIES>& queries) {
		this->queries = queries;
	}

	void updateQuery (std::map<int,int>& mapping) {
		queries = mapQueries(queries, mapping);
	}
};

class NumericINEvaluator : public UnaryEvaluator {
	DataType* type;
	std::string expr;
	MiniHT* ht;
	std::bitset<MAXQUERIES> queries;

	std::bitset<MAXQUERIES>* buffers[MAXTHREADS];

public:
	NumericINEvaluator (Schema* schema,Evaluator* attribute, const std::string& expr, DataType* type, std::bitset<MAXQUERIES>  queries) : UnaryEvaluator(attribute), type(type), expr(expr), queries(queries) {
		ht = new MiniHT();;

		for (int i = 0; i < MAXTHREADS; i++) {
			buffers[i] = (std::bitset<MAXQUERIES>*)  schema->getBufferManager()->getBuffer();
		}

		char line[1024];

		assert(strlen(expr.c_str()) < 1024);

		strcpy(line, expr.c_str());

		int count = 1;
		int len = strlen(line);

		for (int i = 0; i < len; i++)
			if (line[i] == '|')
				count++;

		for (int i = 0; i < count; i++) {
			char* tok = customtokn(line, '|', i);
			std::string str(tok);
			int val = atoi(str.c_str());

			std::cout << "adding " << val << std::endl;

			ht->insertVal(val, queries);

			strcpy(line, expr.c_str());
		}
	}

	~NumericINEvaluator () {

	}

	void* apply (DataBlock* data, int threadId) {
		std::bitset<MAXQUERIES> cqueries = queries & data->getQuery();

		if ((data->getQuery() & queries) == 0)
			return nullptr;

		int* attr = (int*) getChild()->apply(data, threadId);

		std::bitset<MAXQUERIES>* ret    = buffers[threadId];

		uint64_t dataCnt = data->getSize();

		std::bitset<MAXQUERIES> orbits = data->getQuery() & (~cqueries);
		std::bitset<MAXQUERIES> pass = cqueries | orbits;
		std::bitset<MAXQUERIES> fail = orbits;

		for (int i = 0; i < dataCnt; i++) {
			std::bitset<MAXQUERIES> bits = fail;

			if (attr[i] != NULL_VALUE) {
				int hval = HASHT(attr[i]) & ((1 << HTHASHBITS) - 1);

				int cur = ht->heads[hval];
				while (cur >= 0) {
					if (ht->values[cur] == attr[i])
						bits |= ht->payloads[cur];
					cur = ht->next[cur];
				}

			}

			ret[i] = bits;
		}		

		return ret;
	}

	virtual uint64_t  getTableSet () override {
		return getChild()->getTableSet();
	}

	void print () {
		std::cout << "(";
		getChild()->print();
		std::cout << " in " << expr << " for " << queries;
		std::cout << ")";
	}

	float getSelectivity () {
		return 0.1;
	}

	std::bitset<MAXQUERIES> getQuery () {
		return queries;
	}

	void setQuery (std::bitset<MAXQUERIES>& queries) {
		this->queries = queries;
	}

	void updateQuery (std::map<int,int>& mapping) {
		queries = mapQueries(queries, mapping);
	}
};

class LIKEEvaluator : public UnaryEvaluator {
	DataType* type;
	Dictionary* dict;
	std::string expr;
	int* lookup;
	std::bitset<MAXQUERIES> queries;

	std::bitset<MAXQUERIES>* buffers[MAXTHREADS];

public:
	LIKEEvaluator (Schema* schema, Evaluator* attribute, const std::string& expr, Dictionary* dict, DataType* type, std::bitset<MAXQUERIES>  queries) : UnaryEvaluator(attribute), type(type), expr(expr), queries(queries), dict(dict) {
		lookup = dict->allocateFilter();

		regex_t rex;
		regcomp(&rex, expr.c_str(), REG_NOSUB);

		dict->populateFilter(lookup, &rex, 0, 1);

		for (int i = 0; i < MAXTHREADS; i++) {
			buffers[i] = (std::bitset<MAXQUERIES>*)  schema->getBufferManager()->getBuffer();
		}
	}

	~LIKEEvaluator () {
		delete type;
		dict->freeFilter(lookup);
	}

	void* apply (DataBlock* data, int threadId) {
		std::bitset<MAXQUERIES> cqueries = queries & data->getQuery();

		if ((data->getQuery() & queries) == 0)
			return nullptr;

		int* attr = (int*) getChild()->apply(data, threadId);

		std::bitset<MAXQUERIES>* ret    = buffers[threadId];

		uint64_t dataCnt = data->getSize();

		std::bitset<MAXQUERIES> orbits = data->getQuery() & (~cqueries);
		std::bitset<MAXQUERIES> pass = cqueries | orbits;
		std::bitset<MAXQUERIES> fail = orbits;

		for (int i = 0; i < dataCnt; i++) {
			ret[i] = (attr[i] != NULL_VALUE && lookup[attr[i]] == 0)? pass : fail;
		}		

		return ret;
	}

	virtual uint64_t  getTableSet () override {
		return getChild()->getTableSet();
	}

	void print () {
		std::cout << "(";
		getChild()->print();
		std::cout << " like " << expr << " for " << queries;
		std::cout << ")";
	}

	float getSelectivity () {
		return 0.1;
	}

	std::bitset<MAXQUERIES> getQuery () {
		return queries;
	}

	void setQuery (std::bitset<MAXQUERIES>& queries) {
		this->queries = queries;
	}

	void updateQuery (std::map<int,int>& mapping) {
		queries = mapQueries(queries, mapping);
	}
};

class LIKEOREvaluator : public UnaryEvaluator {
	DataType* type;
	Dictionary* dict;
	std::string expr;
	int* lookup;
	std::bitset<MAXQUERIES> queries;

	std::bitset<MAXQUERIES>* buffers[MAXTHREADS];

public:
	LIKEOREvaluator (Schema* schema, Evaluator* attribute, const std::string& expr, Dictionary* dict, DataType* type, std::bitset<MAXQUERIES> queries) : UnaryEvaluator(attribute), type(type), expr(expr), queries(queries), dict(dict) {
		lookup = dict->allocateFilter();

		dict->populateFiltersOr(lookup, expr, 0, 1);

		for (int i = 0; i < MAXTHREADS; i++) {
			buffers[i] = (std::bitset<MAXQUERIES>*)  schema->getBufferManager()->getBuffer();
		}
	}
	~LIKEOREvaluator () {
		delete type;
		dict->freeFilter(lookup);
	}

	void* apply (DataBlock* data, int threadId) {
		std::bitset<MAXQUERIES> cqueries = queries & data->getQuery();

		if ((data->getQuery() & queries) == 0)
			return nullptr;

		int* attr = (int*) getChild()->apply(data, threadId);

		std::bitset<MAXQUERIES>* ret    = buffers[threadId];

		uint64_t dataCnt = data->getSize();

		std::bitset<MAXQUERIES> orbits = data->getQuery() & (~cqueries);
		std::bitset<MAXQUERIES> pass = cqueries | orbits;
		std::bitset<MAXQUERIES> fail = orbits;

		for (int i = 0; i < dataCnt; i++) {
			ret[i] = (attr[i] != NULL_VALUE && lookup[attr[i]] == 0)? pass : fail;
		}		

		return ret;
	}

	virtual uint64_t  getTableSet () override {
		return getChild()->getTableSet();
	}

	void print () {
		std::cout << "(";
		getChild()->print();
		std::cout << " likeor " << expr << " for " << queries;
		std::cout << ")";
	}

	float getSelectivity () {
		return 0.1;
	}

	std::bitset<MAXQUERIES> getQuery () {
		return queries;
	}

	void setQuery (std::bitset<MAXQUERIES>& queries) {
		this->queries = queries;
	}

	void updateQuery (std::map<int,int>& mapping) {
		queries = mapQueries(queries, mapping);
	}
};

class LIKEANDEvaluator : public UnaryEvaluator {
	DataType* type;
	Dictionary* dict;
	std::string expr;
	int* lookup;
	std::bitset<MAXQUERIES> queries;

	std::bitset<MAXQUERIES>* buffers[MAXTHREADS];

public:
	LIKEANDEvaluator (Schema* schema, Evaluator* attribute, const std::string& expr, Dictionary* dict, DataType* type, std::bitset<MAXQUERIES> queries) : UnaryEvaluator(attribute), type(type), expr(expr), queries(queries), dict(dict) {
		lookup = dict->allocateFilter();

		dict->populateFiltersAnd(lookup, expr, 0, 1);

		for (int i = 0; i < MAXTHREADS; i++) {
			buffers[i] = (std::bitset<MAXQUERIES>*)  schema->getBufferManager()->getBuffer();
		}
	}
	~LIKEANDEvaluator () {
		delete type;
		dict->freeFilter(lookup);
	}

	void* apply (DataBlock* data, int threadId) {
		std::bitset<MAXQUERIES> cqueries = queries & data->getQuery();

		if ((data->getQuery() & queries) == 0)
			return nullptr;

		int* attr = (int*) getChild()->apply(data, threadId);

		std::bitset<MAXQUERIES>* ret    = buffers[threadId];

		uint64_t dataCnt = data->getSize();

		std::bitset<MAXQUERIES> orbits = data->getQuery() & (~cqueries);
		std::bitset<MAXQUERIES> pass = cqueries | orbits;
		std::bitset<MAXQUERIES> fail = orbits;

		for (int i = 0; i < dataCnt; i++) {
			ret[i] = (attr[i] != NULL_VALUE && lookup[attr[i]] == 0)? pass : fail;
		}		

		return ret;
	}

	virtual uint64_t  getTableSet () override {
		return getChild()->getTableSet();
	}

	void print () {
		std::cout << "(";
		getChild()->print();
		std::cout << " likeand " << expr << " for " << queries;
		std::cout << ")";
	}

	float getSelectivity () {
		return 0.1;
	}

	std::bitset<MAXQUERIES> getQuery () {
		return queries;
	}

	void setQuery (std::bitset<MAXQUERIES>& queries) {
		this->queries = queries;
	}

	void updateQuery (std::map<int,int>& mapping) {
		queries = mapQueries(queries, mapping);
	}
};

class NLIKEEvaluator : public UnaryEvaluator {
	DataType* type;
	Dictionary* dict;
	std::string expr;
	int* lookup;
	std::bitset<MAXQUERIES> queries;

	std::bitset<MAXQUERIES>* buffers[MAXTHREADS];

public:
	NLIKEEvaluator (Schema* schema, Evaluator* attribute, const std::string& expr, Dictionary* dict, DataType* type, std::bitset<MAXQUERIES> queries) : UnaryEvaluator(attribute), type(type), expr(expr), queries(queries), dict(dict) {
		lookup = dict->allocateFilter();

		regex_t rex;
		regcomp(&rex, expr.c_str(), REG_NOSUB);

		dict->populateFilter(lookup, &rex, 0, 1);

		for (int i = 0; i < MAXTHREADS; i++) {
			buffers[i] = (std::bitset<MAXQUERIES>*)  schema->getBufferManager()->getBuffer();
		}
	}
	~NLIKEEvaluator () {
		delete type;
		dict->freeFilter(lookup);
	}

	void* apply (DataBlock* data, int threadId) {
		std::bitset<MAXQUERIES> cqueries = queries & data->getQuery();

		if ((data->getQuery() & queries) == 0)
			return nullptr;

		int* attr = (int*) getChild()->apply(data, threadId);

		std::bitset<MAXQUERIES>* ret    = buffers[threadId];

		uint64_t dataCnt = data->getSize();

		std::bitset<MAXQUERIES> orbits = data->getQuery() & (~cqueries);
		std::bitset<MAXQUERIES> pass = cqueries | orbits;
		std::bitset<MAXQUERIES> fail = orbits;

		for (int i = 0; i < dataCnt; i++) {
			ret[i] = (attr[i] == NULL_VALUE || lookup[attr[i]] != 0)? pass : fail;
		}		

		return ret;
	}

	virtual uint64_t  getTableSet () override {
		return getChild()->getTableSet();
	}

	void print () {
		std::cout << "(";
		getChild()->print();
		std::cout << " not like " << expr << " for " << queries;
		std::cout << ")";
	}

	float getSelectivity () {
		return 0.1;
	}

	std::bitset<MAXQUERIES> getQuery () {
		return queries;
	}

	void setQuery (std::bitset<MAXQUERIES>& queries) {
		this->queries = queries;
	}

	void updateQuery (std::map<int,int>& mapping) {
		queries = mapQueries(queries, mapping);
	}
};

class ANDEvaluator : public BinaryEvaluator {
public:
	ANDEvaluator (Evaluator* left, Evaluator* right) : BinaryEvaluator(left, right) {}
	~ANDEvaluator () {}

	void* apply (DataBlock* data, int threadId) {
		std::bitset<MAXQUERIES> * mask1 = (std::bitset<MAXQUERIES> *) getChildLeft()->apply(data, threadId);
		std::bitset<MAXQUERIES> * mask2 = (std::bitset<MAXQUERIES> *) getChildRight()->apply(data, threadId);

		if (mask1 == nullptr) {
			return mask2;
		} else if (mask2 == nullptr) {
			return mask1;
		}else {
			uint64_t size = data->getSize();

			for (int i = 0 ; i < size; i++)
				mask1[i] = (mask1[i] & mask2[i]);
		}

		return mask1;
	}

	void* applySelective (DataBlock* data, char* mark, int threadId) {
		std::bitset<MAXQUERIES> * mask1 = (std::bitset<MAXQUERIES> *) getChildLeft()->applySelective(data, mark, threadId);
		std::bitset<MAXQUERIES> * mask2 = (std::bitset<MAXQUERIES> *) getChildRight()->applySelective(data, mark, threadId);

		if (mask1 == nullptr) {
			return mask2;
		} else if (mask2 == nullptr) {
			return mask1;
		}else {
			uint64_t size = data->getSize();

			for (int i = 0 ; i < size; i++) {
				if (mark[i]) {
					mask1[i] = (mask1[i] & mask2[i]);
				}
			}
		}

		return mask1;
	}

	virtual uint64_t  getTableSet () override {
		return getChildLeft()->getTableSet() | getChildRight()->getTableSet();
	}

	static ANDEvaluator* createAnd(std::list<Evaluator*>& expressions) {
		if (expressions.size() == 2)
			return new ANDEvaluator(expressions.front(), expressions.back());
		
		Evaluator* front = expressions.front();
		expressions.pop_front();
		return new ANDEvaluator(front, createAnd(expressions));
	}

	void print () {
		std::cout << "(";
		getChildLeft()->print();
		std::cout << " and ";
		getChildRight()->print();
		std::cout << ")";
	}

	float getSelectivity () {
		return getChildLeft()->getSelectivity()*getChildRight()->getSelectivity();
	}

	std::bitset<MAXQUERIES> getQuery () {
		return (getChildLeft()->getQuery() & getChildRight()->getQuery());
	}

	void setQuery (std::bitset<MAXQUERIES>& queries) {
		getChildLeft()->setQuery(queries);
		getChildRight()->setQuery(queries);
	}

	void updateQuery (std::map<int,int>& mapping) {
		getChildLeft()->updateQuery(mapping);
		getChildRight()->updateQuery(mapping);
	}
};

class OREvaluator : public BinaryEvaluator {
public:
	OREvaluator (Evaluator* left, Evaluator* right) : BinaryEvaluator(left, right) {}
	~OREvaluator () {}

	void* apply (DataBlock* data, int threadId) {
		std::bitset<MAXQUERIES> * mask1 = (std::bitset<MAXQUERIES> *) getChildLeft()->apply(data, threadId);
		std::bitset<MAXQUERIES> * mask2 = (std::bitset<MAXQUERIES> *) getChildRight()->apply(data, threadId);

		if (mask1 == nullptr || mask2 == nullptr)
			return nullptr;

		uint64_t size = data->getSize();

		for (int i = 0 ; i < size; i++) {
			mask1[i] = (mask1[i] | mask2[i]);
		}

		return mask1;
	}

	void* applySelective (DataBlock* data, char* mark, int threadId) {
		std::bitset<MAXQUERIES> * mask1 = (std::bitset<MAXQUERIES> *) getChildLeft()->applySelective(data, mark, threadId);
		std::bitset<MAXQUERIES> * mask2 = (std::bitset<MAXQUERIES> *) getChildRight()->applySelective(data, mark, threadId);

		if (mask1 == nullptr || mask2 == nullptr)
			return nullptr;

		uint64_t size = data->getSize();

		for (int i = 0 ; i < size; i++) {
			if (mark[i]) {
				mask1[i] = (mask1[i] | mask2[i]);
			}
		}

		return mask1;
	}

	virtual uint64_t  getTableSet () override {
		return getChildLeft()->getTableSet() | getChildRight()->getTableSet();
	}

	static OREvaluator* createOr(std::list<Evaluator*>& expressions) {
		if (expressions.size() == 2)
			return new OREvaluator(expressions.front(), expressions.back());
		
		Evaluator* front = expressions.front();
		expressions.pop_front();
		return new OREvaluator(front, createOr(expressions));
	}

	void print () {
		std::cout << "(";
		getChildLeft()->print();
		std::cout << " or ";
		getChildRight()->print();
		std::cout << ")";
	}

	float getSelectivity () {
		return 1.0 - (1.0-getChildLeft()->getSelectivity())*(1.0-getChildRight()->getSelectivity());
	}

	std::bitset<MAXQUERIES> getQuery () {
		return (getChildLeft()->getQuery() | getChildRight()->getQuery());
	}

	void setQuery (std::bitset<MAXQUERIES>& queries) {
		getChildLeft()->setQuery(queries);
		getChildRight()->setQuery(queries);
	}

	void updateQuery (std::map<int,int>& mapping) {
		getChildLeft()->updateQuery(mapping);
		getChildRight()->updateQuery(mapping);
	}
};


#endif

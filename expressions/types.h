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

#ifndef TYPES_H_
#define TYPES_H_

#include <vector>
#include <string>
#include <stdint.h>

enum DataTypeEnum { BOOL, INT, INT64, FLOAT, DOUBLE, STRING, POINTER, RECORD, DATE };

class DataType {
public:
	DataType () {}
	virtual ~DataType () {}

	virtual bool isPrimitive () = 0;
	virtual DataType* getChildType (int child = 0) = 0;
	virtual DataTypeEnum getTypeValue () = 0;
	virtual std::string toString () = 0;
	virtual int getSize () = 0;
};

class DataPrimitive : public DataType {
public:
	DataPrimitive () : DataType () {}
	~DataPrimitive () {}

	bool isPrimitive () { return true; }
	DataType* getChildType (int child) { return nullptr; }
};

class DataBoolean : public DataPrimitive {
public:
	DataBoolean () : DataPrimitive () {}
	~DataBoolean () {}

	DataTypeEnum getTypeValue () { return BOOL; }
	std::string toString () { return "BOOLEAN"; }
	int getSize () { return sizeof(bool); }
};

class DataInt : public DataPrimitive {
public:
	DataInt () : DataPrimitive () {}
	~DataInt () {}

	DataTypeEnum getTypeValue () { return INT; }
	std::string toString () { return "INTEGER"; }
	int getSize () { return sizeof(int32_t); }
};

class DataInt64 : public DataPrimitive {
public:
	DataInt64 () : DataPrimitive () {}
	~DataInt64 () {}

	DataTypeEnum getTypeValue () { return INT64; }
	std::string toString () { return "INTEGER64"; }
	int getSize () { return sizeof(int64_t); }
};

class DataFloat : public DataPrimitive {
public:
	DataFloat () : DataPrimitive () {}
	~DataFloat () {}

	DataTypeEnum getTypeValue () { return FLOAT; }
	std::string toString () { return "FLOAT"; }
	int getSize () { return sizeof(float); }
};

class DataDouble : public DataPrimitive {
public:
	DataDouble () : DataPrimitive () {}
	~DataDouble () {}

	DataTypeEnum getTypeValue () { return DOUBLE; }
	std::string toString () { return "DOUBLE"; }
	int getSize () { return sizeof(double); }
};

class DataString : public DataPrimitive {
public:
	DataString () : DataPrimitive () {}
	~DataString () {}

	DataTypeEnum getTypeValue () { return STRING; }
	std::string toString () { return "STRING"; }
	int getSize () { return sizeof(char*); }
};

class DataDate : public DataPrimitive {
public:
	DataDate () : DataPrimitive () {}
	~DataDate () {}

	DataTypeEnum getTypeValue () { return DATE; }
	std::string toString () { return "DATE"; }
	int getSize () { return sizeof(char*); }
};

class DataPointer : public DataType {
	DataType* type;
public:
	DataPointer (DataType* baseType) : type (baseType) {}
	~DataPointer () {}

	bool isPrimitive () { return false; }
	DataType* getChildType (int child) { return type; }
	DataTypeEnum getTypeValue () { return POINTER; }
	std::string toString () {
		std::string aggregator = "POINTER(";
		aggregator += type->toString();
		aggregator += ")";
		return aggregator; }
	int getSize () { return sizeof(void*); }
};

class DataRecord : public DataType {
	std::vector<DataType*> type;
public:
	DataRecord (std::vector<DataType*> recordTypes) : type (recordTypes) {}
	~DataRecord () {}

	bool isPrimitive () { return false; }
	DataType* getChildType (int child) { return type[child]; }
	DataTypeEnum getTypeValue () { return RECORD; }
	std::string toString () { 
		std::string aggregator = "RECORD(";
		for (uint i = 0; i < type.size(); i++)
			aggregator += type[i]->toString() + " ";
		aggregator += ")";
		return aggregator; 
	}
	int getSize () { return sizeof(void*); }
};

#endif
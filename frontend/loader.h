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

#ifndef LOADER_H_
#define LOADER_H_

#include "../expressions/types.h"
#include "../frontend/schema.h"
#include "../dictionary/dictionary.h"

#include "../frontend/parse-util.h"

#include <cstring>
#include <map>
#include <vector>

#include "../rapidjson/document.h"
#include "../rapidjson/writer.h"
#include "../rapidjson/stringbuffer.h"
#include "../rapidjson/filereadstream.h"

struct Loader {
	Schema* schema_;
	bool txt_;
	char delim_;

	std::map<std::string, bool> dummy;
	std::map<std::string, int> rows;
	std::map<std::string, double> samplingRate;
	std::map<std::string, int> binding;
	std::map<std::string, std::map<std::string, std::string> > translator;
	std::map<std::string, std::map<std::string, ParsedAttribute> > origins;
	std::map<std::string, std::string> fullname;
	std::map<std::string, std::vector<DataType*> > types;
	std::map<std::string, std::vector<bool> > permission;

	int* readColumnFromBinary (std::string relPath, int column, int n);

	int* parseColumn (std::string relPath, int column, int n, bool cache = false);

	int* parseColumnDecimal (std::string relPath, int column, int n, bool cache = false);

	int* parseColumnWithDict (std::string relPath, int column, int n, Dictionary* dict, bool cache = false);

	void registerAdHocTable (
		const rapidjson::GenericValue<rapidjson::UTF8<> >::Object& doc, 
		std::map<std::string, std::string>& paths,
		std::string relName);

	void parseSchema (std::string schemaPath);

	Table* createTable (std::string relName, std::vector<ParsedAttribute>& refs, std::map<std::string, std::string> paths, bool cache = true);

public:
	Loader (std::string schemaPath, bool txt, char delim);

	void createSchema (std::vector<ParsedAttribute>& refs, std::map<std::string, std::string> paths);

	Schema* getSchema();
};

#endif


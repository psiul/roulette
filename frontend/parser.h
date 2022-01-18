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

#ifndef PARSER_H_
#define PARSER_H_

#include "parse-util.h"
#include "loader.h"

#include <cstring>
#include <map>
#include <vector>
#include "../primitives/atomic-stack.h"
#include "../dictionary/dictionary.h"
#include "../expressions/types.h"
#include "../frontend/schema.h"
#include "../expressions/expressions.h"

#include <iostream>
#include <fstream>

#include "../rapidjson/document.h"
#include "../rapidjson/writer.h"
#include "../rapidjson/stringbuffer.h"
#include "../rapidjson/filereadstream.h"

class Parser {
	std::string path_;
	std::string prefix_;
	Schema* schema_;
	Loader* loader_;

	std::map<std::string, int> queryIndex; 
	std::vector<ParsedQuery*> queries;

	std::vector<std::string> queriesToParse;

	std::map<std::string, std::string> outputCollection;

	void getRefs (std::vector<ParsedAttribute>& refs, ParsedQuery* pquery);

	void matchOutputs (
		std::map<std::string, 
		std::string>& paths,
		std::vector<ParsedAggregate>* paggr);

	void matchOrderings (
		std::map<std::string, 
		std::string>& paths,
		std::vector<ParsedAttribute>* porder);

	void parseOutput(
			const rapidjson::GenericValue<rapidjson::UTF8<> >::Object& doc,
			std::map<std::string, std::string>& paths,
			std::vector<ParsedAggregate>* paggr
		);

	void parseKey(
			const rapidjson::GenericValue<rapidjson::UTF8<> >::Object& doc,
			std::map<std::string, std::string>& paths,
			std::vector<ParsedAttribute>* pgroup
		);

	void parseJoin (
			const rapidjson::GenericValue<rapidjson::UTF8<> >::Object& doc,
			std::map<std::string, std::string>& paths,
			std::vector<ParsedJoin>* pjoins
		);

	void parseCondition (
			const rapidjson::GenericValue<rapidjson::UTF8<> >::Object& doc,
			std::map<std::string, std::string>& paths,
			std::vector<ParsedCondition>* accumulator
		);

	Expression* parseFilterExpression(
		const rapidjson::GenericValue<rapidjson::UTF8<> >::Object& doc,
			std::map<std::string, std::string>& paths
	);

	void parseFilterTree(
			const rapidjson::GenericValue<rapidjson::UTF8<> >::Object& doc,
			std::map<std::string, std::string>& paths,
			std::vector<ParsedFilter>* pfilters,
			std::vector<ParsedCondition>* accumulator,
			bool flag
		);

	void parseFilterRoot (
			const rapidjson::GenericValue<rapidjson::UTF8<> >::Object& doc,
			std::map<std::string, std::string>& paths,
			std::vector<ParsedFilter>* pfilters
		);

	void parseQueryTree(
			const rapidjson::GenericValue<rapidjson::UTF8<> >::Object& doc,
			std::map<std::string, std::string>& paths,
			std::vector<ParsedJoin>* pjoins,
			std::vector<ExpressionWrapper>* pfilters,
			std::vector<ExpressionWrapper>* ppostfilters,
			std::vector<ParsedAggregate>* paggr,
			std::vector<ParsedAttribute>* pgroup,
			std::vector<ParsedAttribute>* porder,
			int& limit,
			std::vector<ParsedExpression>* pexpr
		);

	int parseQuery (std::string path);

	int setUpQuery (std::string path);

	public:
	Parser(std::string prefix, std::string schemaPath, bool txt, char delim);

	int addQuery(std::string path);

	void prepare();

	Schema* getSchema ();

	Loader * getLoader () {
		return loader_;
	}

	ParsedQuery& getQuery(int i);

	void load (int*& topOrdering, int i);

	void load (int*& topOrdering, ParsedQuery* query);

	std::vector<ParsedQuery*>& getAllQueries ();
};

#endif
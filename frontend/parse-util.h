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

#ifndef PARSE_UTIL_
#define PARSE_UTIL_

#include <cstring>
#include <string>
#include <vector>
#include <cstdlib>

#include "../frontend/schema.h"
#include "../expressions/expressions.h"



struct ParsedAttribute {
	std::string table;
	std::string key;


	ParsedAttribute (std::string table, std::string key) : table(table), key(key) {}

	ParsedAttribute (const ParsedAttribute& pattr) : ParsedAttribute(pattr.table, pattr.key) {}

	ParsedAttribute () : ParsedAttribute("", "") {}

	bool equals(ParsedAttribute attr) const {
		if (table == attr.table && key == attr.key)
			return true;

		return false;
	}

	void print () const {
		std::cout << table << "." << key;
	}
};

struct ParsedExpression {
	std::string op;
	ParsedAttribute first;
	ParsedAttribute second;
	ParsedAttribute res;

	ParsedExpression (std::string op, ParsedAttribute first, ParsedAttribute second, ParsedAttribute res) : op(op), first(first), second(second), res(res) {}
};


struct ParsedTheta {
	ParsedAttribute left;
	ParsedAttribute right;
	std::string op;

	ParsedTheta (ParsedAttribute left, ParsedAttribute right, std::string op) : left(left), right(right), op(op) {

	}
};

struct ParsedJoin {
	ParsedAttribute left;
	ParsedAttribute right;
	int id;
	int type;
	std::bitset<MAXQUERIES>  queries;

	std::vector<ParsedTheta> thetas;

	ParsedJoin (ParsedAttribute left, ParsedAttribute right, std::string t) : left(left), right(right) {
		id = -1;
		type = 1;
		queries.reset();
		queries.set(0);
	}

	bool equals(ParsedJoin join) {
		return ((left.equals(join.left) && right.equals(join.right)) || (left.equals(join.right) && right.equals(join.left))) && thetas.size() == join.thetas.size();
	}

	void print () const {
		std::cout << "join ";
		left.print();
		std::cout << " = ";
		right.print();
		std::cout << " " << queries << std::endl;
	}

	void addTheta(ParsedTheta t) {
		thetas.push_back(t);
	}
};

struct ParsedCondition {
	std::string op;
	ParsedAttribute attr;
	std::string val;

	ParsedCondition (std::string op, ParsedAttribute attr, std::string val) : attr(attr), op(op), val(val) {
		
	}

	void print () {
		attr.print();
		std::cout << " " << op << " " << val;
	}
};

struct ParsedFilter {
	std::vector<ParsedCondition> disjunction;
	std::bitset<MAXQUERIES>  queries;

	ParsedFilter (std::vector<ParsedCondition> disjunction) : disjunction(disjunction) {
		queries.reset();
		queries.set(0);
	}

	void print () {
		std::cout << "filter ";
		for (int i = 0; i < disjunction.size(); i++) {
			disjunction[i].print();
			std::cout << " or ";
		}
		std::cout << " " << queries << std::endl;
	}
};

struct ParsedAggregate {
	ParsedAttribute attr;
	ParsedAttribute as;
	std::string op;
	std::bitset<MAXQUERIES>  queries;

	std::string having_type;
	std::string having_val;

	ParsedAggregate (std::string op, ParsedAttribute attr, ParsedAttribute as) : attr(attr), op(op), as(as), having_type("None") {
		queries.reset();
		queries.set(0);
	}

	void print () {
		std::cout << "aggr ";
		attr.print();
		std::cout << " " << op << " " << queries << std::endl;
	}
};


struct ParsedAggregateList {
	std::vector<ParsedAggregate>* aggregates;
	std::vector<ParsedAttribute>* grouping;
	std::vector<ParsedAttribute>* ordering;
	std::bitset<MAXQUERIES>  queries;
	int limit;

	ParsedAggregateList (
		std::vector<ParsedAggregate>* aggregates, 
		std::vector<ParsedAttribute>* grouping, 
		std::vector<ParsedAttribute>* ordering,
		int limit
		) : aggregates(aggregates), grouping(grouping), ordering(ordering), limit(limit) {
		queries.reset();
		queries.set(0);
	}
};

class Expression;

struct ExpressionWrapper {
	Expression* expr;
	std::bitset<MAXQUERIES>  queries;

	ExpressionWrapper (Expression* expr) : expr(expr) {
		queries.reset();
		queries.set(0);
	}
};

ParsedFilter parseFilter (char* line);

ParsedJoin parseJoin (char* line);

ParsedAggregate parseAggregate (char* line);

ParsedExpression parseExpression (char* line);

struct ParsedQuery {
	int* relOffset;
	int* relEdges;
	int* relJoins;
	int* relOrder;
	int* relMark;

	std::map<std::string, std::string> alias;
	std::vector<ParsedJoin>*  joins;
	std::vector<ExpressionWrapper>* filters;
	std::vector<ExpressionWrapper>* postfilters;
	std::vector<ParsedExpression>* expressions;
	std::vector<ParsedAggregateList*>* aggrList;


	std::map<std::string, std::bitset<MAXQUERIES> > queryMask;

	int batch_;

	int relNum;
	std::map<int, float> reduction;
	std::map<int, bool> optimized;

	std::vector<std::string> dependencies;

	ParsedQuery (
		std::map<std::string, 
		std::string> alias, 
		ParsedAggregateList* aggrs, 
		std::vector<ParsedJoin>* joins, 
		std::vector<ExpressionWrapper>* filters,
		std::vector<ExpressionWrapper>* postfilters, 
		std::vector<ParsedExpression>* expressions, 
		std::vector<std::string>& dependencies, 
		int batch);


	ParsedQuery (
		std::map<std::string, 
		std::string> alias, 
		std::vector<ParsedAggregateList*>* aggrs, 
		std::vector<ParsedJoin>* joins, 
		std::vector<ExpressionWrapper>* filters,
		std::vector<ExpressionWrapper>* postfilters, 
		std::vector<ParsedExpression>* expressions);

	

	void reorderJoins (Schema* schema);

	void populateGraph (Schema* schema);

	bool optimizePass (Schema* schema);

	void optimizeBuild (Schema* schema);

	void printGraph ();

	void setOrders (Schema* schema);

	void optimizeGraph (Schema* schema);

	int* getOrdering ();

	void makeBase (bool master);

	void useAsBase (ParsedQuery& base, int query);

	void print ();
};

ParsedQuery batchQueries (std::vector<ParsedQuery*>& queries, int start);

void expandCommas (const ParsedQuery& pquery, ParsedAttribute attr, std::vector<ParsedAttribute>& expansion);

#endif
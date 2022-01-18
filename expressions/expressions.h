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

#ifndef EXPRESSIONS_H_
#define EXPRESSIONS_H_

#include "../utilities/common.h"
#include <iostream>
#include <cassert>

class Schema;
class Evaluator;
class Dictionary;
class Projector;
class ParsedAttribute;
class StatisticsVector;

class AttributeExpression;
class ConstExpression;
class CaseExpression;
class LogicalExpression;
class ConstComparisonExpression;
class ValueComparisonExpression;
class Q28Expression;
class Q13Expression;

/*use visitor patterns to generate expressions
this way roulette can support complex expressions
also it can update estimated statistics that are used for the shared-work baseline's optimizer*/
class ExpressionVisitor {
	Schema* schema;
	Dictionary* lastDict;

public:
	ExpressionVisitor(Schema*);

	Evaluator* visit(AttributeExpression*, std::bitset<MAXQUERIES>);
	Evaluator* visit(ConstExpression*, std::bitset<MAXQUERIES>);
	Evaluator* visit(CaseExpression*, std::bitset<MAXQUERIES>);
	Evaluator* visit(LogicalExpression*, std::bitset<MAXQUERIES>);
	Evaluator* visit(ConstComparisonExpression*, std::bitset<MAXQUERIES>);
	Evaluator* visit(ValueComparisonExpression*, std::bitset<MAXQUERIES>);
	Evaluator* visit(Q28Expression*, std::bitset<MAXQUERIES>);
	Evaluator* visit(Q13Expression*, std::bitset<MAXQUERIES>);

	Dictionary* getDictionary () { return lastDict; }
};

class Expression {
public:
	virtual Evaluator* accept (ExpressionVisitor* visitor, std::bitset<MAXQUERIES>) = 0;
	/*debug function for printing expressions*/
	virtual void print () = 0;
	virtual void getRefs (std::vector<ParsedAttribute>&) = 0;
	/*find which tables are required by this expression*/
	virtual void registerProjections (Schema*, Projector*) = 0;
	/*returns 1 if expression is complex (i.e. nested) else -1 or 0*/
	virtual int isComplex () { return 1; }
	/*include conditional expression to the statistics estimation*/
	virtual void updateStatistics (Schema* schema, StatisticsVector* stats) = 0;
	/*returns table id if only one table is involved else -1*/
	virtual int getTable (Schema* schema) { return -1; }
	/*number of conditions in a disjunctive expression*/
	virtual int disjunctionSize () = 0;
	/*check if two expressions are the same, taking left/right child swaps into account*/
	virtual bool equals (Expression*) {
		assert(false);
		return false;
	}
	/*expression type -- used for simple comparisons*/
	virtual std::string type () {
		std::string s("none");
		return s;
	}
}; 

class ValueExpression : public Expression {

};

class ConditionExpression : public Expression {

};

class AttributeExpression : public ValueExpression {
	std::string attrName;
	std::string relName;

public:
	AttributeExpression (std::string attrName, std::string relName) : attrName(attrName), relName(relName) {}

	std::string& getName () { return attrName; }
	std::string& getRelation () { return relName; }
	virtual Evaluator* accept (ExpressionVisitor* visitor, std::bitset<MAXQUERIES>) override;
	void print () {
		std::cout << attrName << " " << relName << std::endl;
	}
	virtual void getRefs (std::vector<ParsedAttribute>& refs) override;
	virtual void registerProjections (Schema* schema, Projector* projector) override;

	virtual int getTable (Schema* schema) override;

	virtual void updateStatistics (Schema* schema, StatisticsVector* stats) override;

	virtual int isComplex () override { return 0; }

	virtual int disjunctionSize () override {
		return 0;
	}

	virtual bool equals (Expression*) override;

	virtual std::string type () {
		std::string s("attr");
		return s;
	}
};

class ConstExpression : public Expression {
	std::string value;

public:
	ConstExpression (std::string value) : value(value) {}

	std::string& getValue () { return value; }
	virtual Evaluator* accept (ExpressionVisitor* visitor, std::bitset<MAXQUERIES>) override;
	void print () {
		std::cout << value << std::endl;
	}
	void getRefs (std::vector<ParsedAttribute>& refs) {
		return;
	}
	virtual void registerProjections (Schema* schema, Projector* projector) override;

	virtual void updateStatistics (Schema* schema, StatisticsVector* stats) override;

	virtual int getTable (Schema* schema) override;

	virtual int disjunctionSize () override {
		return 0;
	}

	virtual bool equals (Expression*) override;

	virtual std::string type () {
		std::string s("const");
		return s;
	}
};

class CaseExpression : public ValueExpression {
	ConditionExpression* cond;
	ValueExpression* lhs;
	ValueExpression* rhs;

public:
	CaseExpression (ConditionExpression* cond, ValueExpression* lhs, ValueExpression* rhs) 
					: cond(cond), lhs(lhs), rhs(rhs) {}

	ConditionExpression* getCondition () { return cond; }
	ValueExpression* getLHS () { return lhs; }
	ValueExpression* getRHS () { return rhs; }
	virtual Evaluator* accept (ExpressionVisitor* visitor, std::bitset<MAXQUERIES>) override;
	void print () {
		std::cout << "cond: " << std::endl;
		cond->print();
		std::cout << "lhs: " << std::endl;
		lhs->print();
		std::cout << "rhs: " << std::endl;
		rhs->print();
	}
	void getRefs (std::vector<ParsedAttribute>& refs) {
		cond->getRefs(refs);
		lhs->getRefs(refs);
		rhs->getRefs(refs);
	}
	virtual void registerProjections (Schema* schema, Projector* projector) override;

	virtual void updateStatistics (Schema* schema, StatisticsVector* stats) override;

	virtual int getTable (Schema* schema) override;

	virtual int disjunctionSize () override {
		return 0;
	}

	virtual bool equals (Expression*) override;

	virtual std::string type () {
		std::string s("case");
		return s;
	}
};

class LogicalExpression : public ConditionExpression {
	ConditionExpression* lhs;
	ConditionExpression* rhs;
	std::string op;

public:
	LogicalExpression (std::string op, ConditionExpression* lhs, ConditionExpression* rhs)
					: op(op), lhs(lhs), rhs(rhs) {}

	std::string& getOp () { return op; }
	ConditionExpression* getLHS () { return lhs; }
	ConditionExpression* getRHS () { return rhs; }
	virtual Evaluator* accept (ExpressionVisitor* visitor, std::bitset<MAXQUERIES>) override;
	void print () {
		std::cout << "logical: " << op << std::endl;
		std::cout << "lhs: " << std::endl;
		lhs->print();
		std::cout << "rhs: " << std::endl;
		rhs->print();
	}
	void getRefs (std::vector<ParsedAttribute>& refs) {
		lhs->getRefs(refs);
		rhs->getRefs(refs);
	}
	virtual void registerProjections (Schema* schema, Projector* projector) override;

	virtual void updateStatistics (Schema* schema, StatisticsVector* stats) override;

	virtual int getTable (Schema* schema) override;

	virtual int disjunctionSize () override {
		if (op.compare("OR") == 0)
			return lhs->disjunctionSize() + rhs->disjunctionSize();
		return 1;
	}

	virtual bool equals (Expression*) override;

	virtual std::string type () {
		std::string s("logical");
		return s;
	}
};

class ConstComparisonExpression : public ConditionExpression {
	ValueExpression* lhs;
	ConstExpression* rhs;
	std::string op;

public:
	ConstComparisonExpression (std::string op, ValueExpression* lhs, ConstExpression* rhs)
					: op(op), lhs(lhs), rhs(rhs) {}

	std::string& getOp () { return op; }
	ValueExpression* getLHS () { return lhs; }
	ConstExpression* getRHS () { return rhs; }
	virtual Evaluator* accept (ExpressionVisitor* visitor, std::bitset<MAXQUERIES>) override;
	void print () {
		std::cout << "ccmp: " << op << std::endl;
		std::cout << "lhs: " << std::endl;
		lhs->print();
		std::cout << "rhs: " << std::endl;
		rhs->print();
	}
	void getRefs (std::vector<ParsedAttribute>& refs) {
		lhs->getRefs(refs);
		rhs->getRefs(refs);
	}
	virtual void registerProjections (Schema* schema, Projector* projector) override;

	virtual int isComplex () override { if (lhs->isComplex() == 0) return -1; else return 1; }

	virtual void updateStatistics (Schema* schema, StatisticsVector* stats) override;

	virtual int getTable (Schema* schema) override;

	virtual int disjunctionSize () override {
		return 1;
	}

	virtual bool equals (Expression*) override;

	virtual std::string type () {
		std::string s("cmp");
		return s;
	}
};

class ValueComparisonExpression : public ConditionExpression {
	ValueExpression* lhs;
	ValueExpression* rhs;
	std::string op;

public:
	ValueComparisonExpression (std::string op, ValueExpression* lhs, ValueExpression* rhs)
					: op(op), lhs(lhs), rhs(rhs) {}

	std::string& getOp () { return op; }
	ValueExpression* getLHS () { return lhs; }
	ValueExpression* getRHS () { return rhs; }
	virtual Evaluator* accept (ExpressionVisitor* visitor, std::bitset<MAXQUERIES>) override;
	void print () {
		std::cout << "vcmp: " << std::endl;
		std::cout << "lhs: " << std::endl;
		lhs->print();
		std::cout << "rhs: " << std::endl;
		rhs->print();
	}
	void getRefs (std::vector<ParsedAttribute>& refs) {
		lhs->getRefs(refs);
		rhs->getRefs(refs);
	}
	virtual void registerProjections (Schema* schema, Projector* projector) override;

	virtual void updateStatistics (Schema* schema, StatisticsVector* stats) override;

	virtual int getTable (Schema* schema) override;

	virtual int disjunctionSize () override {
		return 1;
	}

	virtual bool equals (Expression*) override;

	virtual std::string type () {
		std::string s("vcmp");
		return s;
	}
};

class Q28Filter;

/*specialized expression for TPC-DS Q28*/
class Q28Expression : public ConditionExpression {
	AttributeExpression* expr1;
	std::vector<ConstExpression*> low1;
	std::vector<ConstExpression*> high1;

	AttributeExpression* expr2;
	std::vector<ConstExpression*> low2;
	std::vector<ConstExpression*> high2;

	AttributeExpression* expr3;
	std::vector<ConstExpression*> low3;
	std::vector<ConstExpression*> high3;

	std::vector<std::bitset<MAXQUERIES> > queries;

public:
	Q28Expression (
		AttributeExpression* expr1, ConstExpression* lc1, ConstExpression* hc1,
		AttributeExpression* expr2, ConstExpression* lc2, ConstExpression* hc2,
		AttributeExpression* expr3, ConstExpression* lc3, ConstExpression* hc3
		) : expr1(expr1), expr2(expr2), expr3(expr3) {

		low1.push_back(lc1);
		high1.push_back(hc1);

		low2.push_back(lc2);
		high2.push_back(hc2);

		low3.push_back(lc3);
		high3.push_back(hc3);
	}

	ValueExpression* get1 () { return expr1; }
	ValueExpression* get2 () { return expr2; }
	ValueExpression* get3 () { return expr3; }

	virtual Evaluator* accept (ExpressionVisitor* visitor, std::bitset<MAXQUERIES>) override;
	void print () {
		std::cout << "q28: " << std::endl;
	}
	void getRefs (std::vector<ParsedAttribute>& refs) {
		expr1->getRefs(refs);
		expr2->getRefs(refs);
		expr3->getRefs(refs);
	}
	virtual void registerProjections (Schema* schema, Projector* projector) override;

	virtual void updateStatistics (Schema* schema, StatisticsVector* stats) override;

	virtual int getTable (Schema* schema) override;

	virtual int disjunctionSize () override {
		return 1;
	}

	virtual bool equals (Expression*) override;

	virtual std::string type () {
		std::string s("q28");
		return s;
	}

	void initIf (std::bitset<MAXQUERIES> q) {
		if (queries.size() == 0)
			queries.push_back(q);
	}

	void addQ28(Q28Expression* q) {
		assert(equals(q));

		for (int i = 0; i < (q->queries).size(); i++) {
			low1.push_back(q->low1[i]);
			low2.push_back(q->low2[i]);
			low3.push_back(q->low3[i]);

			high1.push_back(q->high1[i]);
			high2.push_back(q->high2[i]);
			high3.push_back(q->high3[i]);

			queries.push_back(q->queries[i]);
		}
	}

	Q28Filter* getFilter (Schema*);
};

class Q13Filter;

/*specialized expression for TPC-DS Q13*/
class Q13Expression : public ConditionExpression {
	AttributeExpression* expr1;
	std::vector<ConstExpression*> eq1;

	AttributeExpression* expr2;
	std::vector<ConstExpression*> eq2;

	AttributeExpression* expr3;
	std::vector<ConstExpression*> eq3;

	AttributeExpression* expr4;
	std::vector<ConstExpression*> low4;
	std::vector<ConstExpression*> high4;

	std::vector<std::bitset<MAXQUERIES> > queries;

public:
	Q13Expression (
		AttributeExpression* expr1, ConstExpression* e1,
		AttributeExpression* expr2, ConstExpression* e2,
		AttributeExpression* expr3, ConstExpression* e3,
		AttributeExpression* expr4, ConstExpression* lc4, ConstExpression* hc4
		) : expr1(expr1), expr2(expr2), expr3(expr3), expr4(expr4) {

		eq1.push_back(e1);
		eq2.push_back(e2);
		eq3.push_back(e3);

		low4.push_back(lc4);
		high4.push_back(hc4);
	}

	ValueExpression* get1 () { return expr1; }
	ValueExpression* get2 () { return expr2; }
	ValueExpression* get3 () { return expr3; }
	ValueExpression* get4 () { return expr4; }

	virtual Evaluator* accept (ExpressionVisitor* visitor, std::bitset<MAXQUERIES>) override;
	void print () {
		std::cout << "q13: " << std::endl;
	}
	void getRefs (std::vector<ParsedAttribute>& refs) {
		expr1->getRefs(refs);
		expr2->getRefs(refs);
		expr3->getRefs(refs);
		expr4->getRefs(refs);
	}
	virtual void registerProjections (Schema* schema, Projector* projector) override;

	virtual void updateStatistics (Schema* schema, StatisticsVector* stats) override;

	virtual int getTable (Schema* schema) override;

	virtual int disjunctionSize () override {
		return 1;
	}

	virtual bool equals (Expression*) override;

	virtual std::string type () {
		std::string s("q13");
		return s;
	}

	void initIf (std::bitset<MAXQUERIES> q) {
		if (queries.size() == 0)
			queries.push_back(q);
	}

	void addQ13(Q13Expression* q) {
		assert(equals(q));

		for (int i = 0; i < (q->queries).size(); i++) {
			eq1.push_back(q->eq1[i]);
			eq2.push_back(q->eq2[i]);
			eq3.push_back(q->eq3[i]);

			low4.push_back(q->low4[i]);
			high4.push_back(q->high4[i]);

			queries.push_back(q->queries[i]);
		}
	}

	Q13Filter* getFilter (Schema*);
};



#endif
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

#include "expressions.h"
#include "../frontend/schema.h"
#include "evaluators.h"
#include "../utilities/common.h"
#include "../roulette-operators/projector.h"
#include "../frontend/parse-util.h"
#include "../roulette-operators/filter.h"

Evaluator* AttributeExpression::accept (ExpressionVisitor* visitor, std::bitset<MAXQUERIES> queries) {
	return visitor->visit(this, queries);
}

void AttributeExpression::registerProjections (Schema* schema, Projector* projector)  {
	projector->registerProjections(schema->getColumnParent(schema->getFieldNumber(relName, attrName)));
}

int AttributeExpression::getTable (Schema* schema) {
	return schema->getColumnParent(schema->getFieldNumber(relName, attrName));
}

void AttributeExpression::getRefs (std::vector<ParsedAttribute>& refs) {
	ParsedAttribute pattr(relName, attrName);
	refs.push_back(pattr);
}

bool AttributeExpression::equals (Expression* expr) {
 	if (expr->type().compare("attr") != 0)
 		return false;

 	AttributeExpression* aexpr = (AttributeExpression*) expr;

 	return (relName.compare(aexpr->relName) == 0 && attrName.compare(aexpr->attrName) == 0);
}

void AttributeExpression::updateStatistics (Schema* schema, StatisticsVector* stats) {
	return;
}

Evaluator* ConstExpression::accept (ExpressionVisitor* visitor, std::bitset<MAXQUERIES> queries) {
	return visitor->visit(this, queries);
}

void ConstExpression::registerProjections (Schema* schema, Projector* projector) {
	return;
}

int ConstExpression::getTable (Schema* schema) {
	return -1;
}

bool ConstExpression::equals (Expression* expr) {
 	if (expr->type().compare("const") != 0)
 		return false;

 	ConstExpression* cexpr = (ConstExpression*) expr;

 	return (value.compare(cexpr->value) == 0);
}

void ConstExpression::updateStatistics (Schema* schema, StatisticsVector* stats) {
	return;
}

Evaluator* CaseExpression::accept (ExpressionVisitor* visitor, std::bitset<MAXQUERIES> queries) {
	return visitor->visit(this, queries);
}

void CaseExpression::registerProjections (Schema* schema, Projector* projector) {
	cond->registerProjections(schema, projector);
	lhs->registerProjections(schema, projector);
	rhs->registerProjections(schema, projector);
}

int CaseExpression::getTable (Schema* schema) {
	int t1 = cond->getTable(schema);
	int t2 = lhs->getTable(schema);
	int t3 = rhs->getTable(schema);

	if (t1 == t2 && t2 == t3) {
		return t1;
	}

	return -1;
}

bool CaseExpression::equals (Expression* expr) {
 	if (expr->type().compare("case") != 0)
 		return false;

 	CaseExpression* cexpr = (CaseExpression*) expr;

 	return (cond->equals(cexpr->cond) && lhs->equals(cexpr->lhs) && rhs->equals(cexpr->rhs));
}

void CaseExpression::updateStatistics (Schema* schema, StatisticsVector* stats) {
	return;
}

Evaluator* LogicalExpression::accept (ExpressionVisitor* visitor, std::bitset<MAXQUERIES> queries) {
	return visitor->visit(this, queries);
}

void LogicalExpression::registerProjections (Schema* schema, Projector* projector) {
	lhs->registerProjections(schema, projector);
	rhs->registerProjections(schema, projector);
}

int LogicalExpression::getTable (Schema* schema) {
	int t1 = lhs->getTable(schema);
	int t2 = rhs->getTable(schema);

	if (t1 == t2) {
		return t1;
	}

	return -1;
}

bool LogicalExpression::equals (Expression* expr) {
 	if (expr->type().compare("logical") != 0)
 		return false;

 	LogicalExpression* lexpr = (LogicalExpression*) expr;

 	return (op.compare(lexpr->op) && ((lhs->equals(lexpr->lhs) && rhs->equals(lexpr->rhs)) || (lhs->equals(lexpr->rhs) && rhs->equals(lexpr->lhs))));
}

void LogicalExpression::updateStatistics (Schema* schema, StatisticsVector* stats) {
	if (op.compare("OR") == 0)
		return;

	lhs->updateStatistics(schema, stats);
	rhs->updateStatistics(schema, stats);
}

Evaluator* ConstComparisonExpression::accept (ExpressionVisitor* visitor, std::bitset<MAXQUERIES> queries) {
	return visitor->visit(this, queries);
}

void ConstComparisonExpression::registerProjections (Schema* schema, Projector* projector) {
	lhs->registerProjections(schema, projector);
}

int ConstComparisonExpression::getTable (Schema* schema) {
	return lhs->getTable(schema);
}

bool ConstComparisonExpression::equals (Expression* expr) {
 	if (expr->type().compare("cmp") != 0)
 		return false;

 	ConstComparisonExpression* cexpr = (ConstComparisonExpression*) expr;

 	return (op.compare(cexpr->op) && ((lhs->equals(cexpr->lhs) && rhs->equals(cexpr->rhs)) || (lhs->equals(cexpr->rhs) && rhs->equals(cexpr->lhs))));
}

void ConstComparisonExpression::updateStatistics (Schema* schema, StatisticsVector* stats) {
	AttributeExpression* attr = (AttributeExpression*) lhs;
	int columnId = schema->getFieldNumberInTable((attr->getRelation()).c_str(), (attr->getName()).c_str());
	std::string& value = getRHS()->getValue();

	Dictionary* dict = nullptr;
	if (schema->hasDictionary(attr->getRelation(), attr->getName()))
		dict = schema->getDictionary(attr->getRelation(), attr->getName());

	if ((getOp()).compare("NLIKE") == 0) {
		stats->cardinality = 0.9*stats->cardinality;
	} else if ((getOp()).compare("LIKE") == 0) {
		stats->cardinality = 0.1*stats->cardinality;
	} else if ((getOp()).compare("LIKEOR") == 0) {
		stats->cardinality = 0.1*stats->cardinality;
	} else if ((getOp()).compare("LIKEAND") == 0) {
		stats->cardinality = 0.1*stats->cardinality;
	} else if ((getOp()).compare("EQ") == 0) {
		int val;
		if (dict != nullptr)
			val = dict->mapDictionary(value);
		else
			val = atoi(value.c_str());

		double selectivity = 1.0/stats->fieldStatistics[columnId].distinct;

		stats->fieldStatistics[columnId].distinct = 1;
		stats->fieldStatistics[columnId].min = val;
		stats->fieldStatistics[columnId].max = val;

		assert(selectivity < 1.1 && selectivity > -0.1);
		stats->cardinality = selectivity*stats->cardinality;
	} else if ((getOp()).compare("NEQ") == 0) {
		int val;
		if (dict != nullptr)
			val = dict->mapDictionary(value);
		else
			val = atoi(value.c_str());

		double selectivity = (stats->fieldStatistics[columnId].distinct-1)/stats->fieldStatistics[columnId].distinct;

		stats->fieldStatistics[columnId].distinct = stats->fieldStatistics[columnId].distinct-1;

		if (stats->fieldStatistics[columnId].distinct == 0)
			stats->fieldStatistics[columnId].distinct = 1;

		assert(selectivity < 1.1 && selectivity > -0.1);
		stats->cardinality = selectivity*stats->cardinality;
	} else if ((getOp()).compare("IN") == 0) {
		stats->cardinality = 0.1*stats->cardinality;
	} else if ((getOp()).compare("LE") == 0) {
		int val;
		if (dict != nullptr)
			val = dict->mapDictionary2(value);
		else
			val = atoi(value.c_str());

		if (val > stats->fieldStatistics[columnId].max)
			val = stats->fieldStatistics[columnId].max;

		if (val < stats->fieldStatistics[columnId].min)
			val = stats->fieldStatistics[columnId].min;

		double selectivity = (stats->fieldStatistics[columnId].max != stats->fieldStatistics[columnId].min) ?
					(val - stats->fieldStatistics[columnId].min)
					/(double (stats->fieldStatistics[columnId].max - stats->fieldStatistics[columnId].min)) : 
								1.0;

		stats->fieldStatistics[columnId].distinct = selectivity*stats->fieldStatistics[columnId].distinct;
		if (stats->fieldStatistics[columnId].distinct == 0)
			stats->fieldStatistics[columnId].distinct = 1;

		stats->fieldStatistics[columnId].max = val;

		assert(selectivity < 1.1 && selectivity > -0.1);
		stats->cardinality = selectivity*stats->cardinality;
	} else if ((getOp()).compare("GE") == 0) {
		int val;
		if (dict != nullptr)
			val = dict->mapDictionary2(value);
		else
			val = atoi(value.c_str());

		if (val < stats->fieldStatistics[columnId].min)
			val = stats->fieldStatistics[columnId].min;

		if (val > stats->fieldStatistics[columnId].max)
			val = stats->fieldStatistics[columnId].max;

		double selectivity = (stats->fieldStatistics[columnId].max != stats->fieldStatistics[columnId].min) ?
					(stats->fieldStatistics[columnId].max - val)
					/(double (stats->fieldStatistics[columnId].max - stats->fieldStatistics[columnId].min)) : 
								1.0;

		stats->fieldStatistics[columnId].distinct = selectivity*stats->fieldStatistics[columnId].distinct;
		if (stats->fieldStatistics[columnId].distinct == 0)
			stats->fieldStatistics[columnId].distinct = 1;

		stats->fieldStatistics[columnId].min = val;

		assert(selectivity < 1.1 && selectivity > -0.1);
		stats->cardinality = selectivity*stats->cardinality;
	} else if ((getOp()).compare("GT") == 0) {
		int val;
		if (dict != nullptr)
			val = dict->mapDictionary2(value);
		else
			val = atoi(value.c_str());

		if (val < stats->fieldStatistics[columnId].min)
			val = stats->fieldStatistics[columnId].min;

		double selectivity = (stats->fieldStatistics[columnId].max != stats->fieldStatistics[columnId].min) ?
					(stats->fieldStatistics[columnId].max - val)
					/(double (stats->fieldStatistics[columnId].max - stats->fieldStatistics[columnId].min)) : 
								1.0;

		stats->fieldStatistics[columnId].distinct = selectivity*stats->fieldStatistics[columnId].distinct;

		if (stats->fieldStatistics[columnId].distinct == 0)
			stats->fieldStatistics[columnId].distinct = 1;

		stats->fieldStatistics[columnId].min = val;

		assert(selectivity < 1.1 && selectivity > -0.1);
		stats->cardinality = selectivity*stats->cardinality;
	} else if ((getOp()).compare("LT") == 0) {
		int val;
		if (dict != nullptr)
			val = dict->mapDictionary2(value);
		else
			val = atoi(value.c_str());

		if (val > stats->fieldStatistics[columnId].max)
			val = stats->fieldStatistics[columnId].max;

		double selectivity = (stats->fieldStatistics[columnId].max != stats->fieldStatistics[columnId].min) ?
					(val - stats->fieldStatistics[columnId].min)
					/(double (stats->fieldStatistics[columnId].max - stats->fieldStatistics[columnId].min)) : 
								1.0;

		stats->fieldStatistics[columnId].distinct = selectivity*stats->fieldStatistics[columnId].distinct;

		if (stats->fieldStatistics[columnId].distinct == 0)
			stats->fieldStatistics[columnId].distinct = 1;

		stats->fieldStatistics[columnId].max = val;

		assert(selectivity < 1.1 && selectivity > -0.1);
		stats->cardinality = selectivity*stats->cardinality;
	} else if ((getOp()).compare("ISNULL") == 0) {
		return;
	} else if ((getOp()).compare("ISNOTNULL") == 0) {
		return;
	} else if ((getOp()).compare("LT") == 0) {
		int val;
		if (dict != nullptr)
			val = dict->mapDictionary2(value);
		else
			val = atoi(value.c_str());

		double selectivity = (stats->fieldStatistics[columnId].max != stats->fieldStatistics[columnId].min) ?
					(val - stats->fieldStatistics[columnId].min)
					/(double (stats->fieldStatistics[columnId].max - stats->fieldStatistics[columnId].min)) : 
								1.0;

		stats->fieldStatistics[columnId].distinct = selectivity*stats->fieldStatistics[columnId].distinct;

		if (stats->fieldStatistics[columnId].distinct == 0)
			stats->fieldStatistics[columnId].distinct = 1;
		
		stats->fieldStatistics[columnId].max = val;

		assert(selectivity < 1.1 && selectivity > -0.1);
		stats->cardinality = selectivity*stats->cardinality;
	} else {
		assert(false);
	}

	if (stats->cardinality == 0)
		stats->cardinality = 1;
}

Evaluator* ValueComparisonExpression::accept (ExpressionVisitor* visitor, std::bitset<MAXQUERIES> queries) {
	return visitor->visit(this, queries);
}

void ValueComparisonExpression::registerProjections (Schema* schema, Projector* projector) {
	lhs->registerProjections(schema, projector);
	rhs->registerProjections(schema, projector);
}

int ValueComparisonExpression::getTable (Schema* schema) {
	int t1 = lhs->getTable(schema);
	int t2 = rhs->getTable(schema);

	if (t1 == t2) {
		return t1;
	}

	return -1;
}

bool ValueComparisonExpression::equals (Expression* expr) {
	if (expr->type().compare("vcmp") != 0)
 		return false;

 	ValueComparisonExpression* cexpr = (ValueComparisonExpression*) expr;

 	return (op.compare(cexpr->op) && ((lhs->equals(cexpr->lhs) && rhs->equals(cexpr->rhs)) || (lhs->equals(cexpr->rhs) && rhs->equals(cexpr->lhs))));
}

Evaluator* Q28Expression::accept (ExpressionVisitor* visitor, std::bitset<MAXQUERIES> queries) {
	return visitor->visit(this, queries);
}

void ValueComparisonExpression::updateStatistics (Schema* schema, StatisticsVector* stats) {
	return;
}

void Q28Expression::registerProjections (Schema* schema, Projector* projector) {
	expr1->registerProjections(schema, projector);
	expr2->registerProjections(schema, projector);
	expr3->registerProjections(schema, projector);
}

int Q28Expression::getTable (Schema* schema) {
	int t1 = expr1->getTable(schema);
	int t2 = expr2->getTable(schema);
	int t3 = expr3->getTable(schema);

	if (t1 == t2 && t1 == t3) {
		return t1;
	}

	return -1;
}

bool Q28Expression::equals (Expression* expr) {
	if (expr->type().compare(type()) != 0)
 		return false;


 	return true;
}

void Q28Expression::updateStatistics (Schema* schema, StatisticsVector* stats) {
	return;
}

Evaluator* Q13Expression::accept (ExpressionVisitor* visitor, std::bitset<MAXQUERIES> queries) {
	return visitor->visit(this, queries);
}

void Q13Expression::registerProjections (Schema* schema, Projector* projector) {
	expr1->registerProjections(schema, projector);
	expr2->registerProjections(schema, projector);
	expr3->registerProjections(schema, projector);
	expr4->registerProjections(schema, projector);
}

int Q13Expression::getTable (Schema* schema) {
	return -1;
}

bool Q13Expression::equals (Expression* expr) {
	if (expr->type().compare(type()) != 0)
 		return false;

 	return true;
}

void Q13Expression::updateStatistics (Schema* schema, StatisticsVector* stats) {
	return;
}

ExpressionVisitor::ExpressionVisitor (Schema* schema) : schema(schema), lastDict(nullptr) {}

Evaluator* ExpressionVisitor::visit(AttributeExpression* expr, std::bitset<MAXQUERIES> queries) {
	int key = schema->getFieldNumber(expr->getRelation(), expr->getName());
	Evaluator* attr = new AttributeEvaluator(schema, new DataInt(), key);
	lastDict = nullptr;
	if (schema->hasDictionary(expr->getRelation(), expr->getName()))
		lastDict = schema->getDictionary(expr->getRelation(), expr->getName());
	return attr;
}

Evaluator* ExpressionVisitor::visit(ConstExpression* expr, std::bitset<MAXQUERIES> queries) {
	assert(nullptr);
	return nullptr;
}

Evaluator* ExpressionVisitor::visit(CaseExpression* expr, std::bitset<MAXQUERIES> queries) {
	std::bitset<MAXQUERIES> allqueries;
	allqueries.reset();
	allqueries = ~allqueries;

	Evaluator* cond = expr->getCondition()->accept(this, allqueries);
	Evaluator* lhs = expr->getLHS()->accept(this, queries);
	Evaluator* rhs = expr->getRHS()->accept(this, queries);
	Evaluator* ifelse = new IFELSEEvaluator(schema, cond, lhs, rhs);
	return ifelse;
}

Evaluator* ExpressionVisitor::visit(LogicalExpression* expr, std::bitset<MAXQUERIES> queries) {
	lastDict = nullptr;
	Evaluator* lhs = expr->getLHS()->accept(this, queries);
	lastDict = nullptr;
	Evaluator* rhs = expr->getRHS()->accept(this, queries);
	Evaluator* ret;

	if ((expr->getOp()).compare("AND") == 0) {
		ret = new ANDEvaluator(lhs, rhs);
	} else if ((expr->getOp()).compare("OR") == 0) {
		ret = new OREvaluator(lhs, rhs);
	} else {
		assert(false);
	}

	return ret;
}

Evaluator* ExpressionVisitor::visit(ConstComparisonExpression* expr, std::bitset<MAXQUERIES> queries) {
	Evaluator* lhs = expr->getLHS()->accept(this, queries);
	std::string& value = expr->getRHS()->getValue();
	Dictionary* dict = getDictionary();
	Evaluator* ret;
	int* memval = nullptr;

	if ((expr->getOp()).compare("NLIKE") == 0) {
		ret = new NLIKEEvaluator(schema, lhs, value, dict, new DataInt(), queries);
	} else if ((expr->getOp()).compare("LIKE") == 0) {
		ret = new LIKEEvaluator(schema, lhs, value, dict, new DataInt(), queries);
	} else if ((expr->getOp()).compare("LIKEOR") == 0) {
		ret = new LIKEOREvaluator(schema, lhs, value, dict, new DataInt(), queries);
	} else if ((expr->getOp()).compare("LIKEAND") == 0) {
		ret = new LIKEANDEvaluator(schema, lhs, value, dict, new DataInt(), queries);
	} else if ((expr->getOp()).compare("EQ") == 0) {
		memval = (int*) malloc(sizeof(int));
		if (dict != nullptr)
			*memval = dict->mapDictionary(value);
		else
			*memval = atoi(value.c_str());

		ret = new EQEvaluator(schema, lhs, memval, new DataInt(), queries);
	} else if ((expr->getOp()).compare("NEQ") == 0) {
		memval = (int*) malloc(sizeof(int));
		if (dict != nullptr)
			*memval = dict->mapDictionary(value);
		else
			*memval = atoi(value.c_str());

		ret = new NEQEvaluator(schema, lhs, memval, new DataInt(), queries);
	} else if ((expr->getOp()).compare("IN") == 0) {
		if (dict != nullptr) {
			ret = new INEvaluator(schema, lhs, value, dict, new DataInt(), queries);
		} else {
			ret = new NumericINEvaluator(schema, lhs, value, new DataInt(), queries);
		}
	} else if ((expr->getOp()).compare("LE") == 0) {
		memval = (int*) malloc(sizeof(int));
		if (dict != nullptr)
			*memval = dict->mapDictionary(value);
		else
			*memval = atoi(value.c_str());

		ret = new LEEvaluator(schema, lhs, memval, new DataInt(), queries);
	} else if ((expr->getOp()).compare("GE") == 0) {
		memval = (int*) malloc(sizeof(int));
		if (dict != nullptr)
			*memval = dict->mapDictionary(value);
		else
			*memval = atoi(value.c_str());

		ret = new GEEvaluator(schema, lhs, memval, new DataInt(), queries);
	} else if ((expr->getOp()).compare("GT") == 0) {
		memval = (int*) malloc(sizeof(int));
		if (dict != nullptr)
			*memval = dict->mapDictionary(value);
		else
			*memval = atoi(value.c_str());

		ret = new GTEvaluator(schema, lhs, memval, new DataInt(), queries);
	} else if ((expr->getOp()).compare("LT") == 0) {
		memval = (int*) malloc(sizeof(int));
		if (dict != nullptr)
			*memval = dict->mapDictionary(value);
		else
			*memval = atoi(value.c_str());

		ret = new LTEvaluator(schema, lhs, memval, new DataInt(), queries);
	} else if ((expr->getOp()).compare("ISNULL") == 0) {
		ret = new NULLEvaluator(schema, lhs, queries);
	} else if ((expr->getOp()).compare("ISNOTNULL") == 0) {
		ret = new NOTNULLEvaluator(schema, lhs, queries);
	} else if ((expr->getOp()).compare("LT") == 0) {
		memval = (int*) malloc(sizeof(int));
		if (dict != nullptr)
			*memval = dict->mapDictionary(value);
		else
			*memval = atoi(value.c_str());

		ret = new LTEvaluator(schema, lhs, memval, new DataInt(), queries);
	} else {
		assert(false);
	}

	return ret;
}

Evaluator* ExpressionVisitor::visit(ValueComparisonExpression* expr, std::bitset<MAXQUERIES> queries) {
	Evaluator* lhs = expr->getLHS()->accept(this, queries);
	Dictionary* ldict = getDictionary();
	Evaluator* rhs = expr->getRHS()->accept(this, queries);
	Dictionary* rdict = getDictionary();
	Evaluator* ret;

	if ((expr->getOp()).compare("NLIKE") == 0) {
		assert(false);
	} else if ((expr->getOp()).compare("LIKE") == 0) {
		assert(false);
	} else if ((expr->getOp()).compare("EQ") == 0) {
		ret = new VEQEvaluator(schema, lhs, rhs, ldict, rdict,  queries);
	} else if ((expr->getOp()).compare("NEQ") == 0) {
		ret = new VNEQEvaluator(schema, lhs, rhs, ldict, rdict, queries);
	} else if ((expr->getOp()).compare("IN") == 0) {
		assert(false);
	} else if ((expr->getOp()).compare("LE") == 0) {
		assert(false);
	} else if ((expr->getOp()).compare("GE") == 0) {
		assert(false);
	} else if ((expr->getOp()).compare("GT") == 0) {
		ret = new VGTEvaluator(schema, lhs, rhs, queries);
	} else if ((expr->getOp()).compare("GT2") == 0) {
		ret = new VGTEvaluator2(schema, lhs, rhs, queries);
	} else if ((expr->getOp()).compare("GT5") == 0) {
		ret = new VGTEvaluator5(schema, lhs, rhs, queries);
	} else if ((expr->getOp()).compare("LT") == 0) {
		ret = new VLTEvaluator(schema, lhs, rhs, queries);
		
	} else {
		assert(false);
	}

	return ret;
}

Evaluator* ExpressionVisitor::visit(Q28Expression* expr, std::bitset<MAXQUERIES> queries) {
	assert(false);
	return nullptr;
}

Evaluator* ExpressionVisitor::visit(Q13Expression* expr, std::bitset<MAXQUERIES> queries) {
	assert(false);
	return nullptr;
}


Q28Filter* Q28Expression::getFilter (Schema* schema) {
	std::vector<int> columnId;
	columnId.push_back(schema->getColumnId(expr1->getRelation(), expr1->getName()));
	columnId.push_back(schema->getColumnId(expr2->getRelation(), expr2->getName()));
	columnId.push_back(schema->getColumnId(expr3->getRelation(), expr3->getName()));

	std::vector<int> ilow1, ilow2, ilow3, ihigh1, ihigh2, ihigh3;

	for (int i = 0; i < queries.size(); i++) {
		std::string& val = low1[i]->getValue();
		int numval = atoi(val.c_str());
		ilow1.push_back(numval);
	}

	for (int i = 0; i < queries.size(); i++) {
		std::string& val = high1[i]->getValue();
		int numval = atoi(val.c_str());
		ihigh1.push_back(numval);
	}

	for (int i = 0; i < queries.size(); i++) {
		std::string& val = low2[i]->getValue();
		int numval = atoi(val.c_str());
		ilow2.push_back(numval);
	}

	for (int i = 0; i < queries.size(); i++) {
		std::string& val = high2[i]->getValue();
		int numval = atoi(val.c_str());
		ihigh2.push_back(numval);
	}

	for (int i = 0; i < queries.size(); i++) {
		std::string& val = low3[i]->getValue();
		int numval = atoi(val.c_str());
		ilow3.push_back(numval);
	}

	for (int i = 0; i < queries.size(); i++) {
		std::string& val = high3[i]->getValue();
		int numval = atoi(val.c_str());
		ihigh3.push_back(numval);
	}

	return new Q28Filter(schema, columnId, queries, ilow1, ihigh1, ilow2, ihigh2, ilow3, ihigh3);
}


Q13Filter* Q13Expression::getFilter (Schema* schema) {
	std::vector<int> columnId;
	columnId.push_back(schema->getColumnId(expr1->getRelation(), expr1->getName()));
	columnId.push_back(schema->getColumnId(expr2->getRelation(), expr2->getName()));
	columnId.push_back(schema->getColumnId(expr3->getRelation(), expr3->getName()));
	columnId.push_back(schema->getColumnId(expr4->getRelation(), expr4->getName()));

	std::vector<int> ieq1, ieq2, ieq3, ilow4, ihigh4;

	for (int i = 0; i < queries.size(); i++) {
		std::string& val = eq1[i]->getValue();
		int numval = atoi(val.c_str());
		ieq1.push_back(numval);
	}

	for (int i = 0; i < queries.size(); i++) {
		std::string& val = eq2[i]->getValue();
		int numval = atoi(val.c_str());
		ieq2.push_back(numval);
	}

	for (int i = 0; i < queries.size(); i++) {
		std::string& val = eq3[i]->getValue();
		int numval = atoi(val.c_str());
		ieq3.push_back(numval);
	}

	for (int i = 0; i < queries.size(); i++) {
		std::string& val = low4[i]->getValue();
		int numval = atoi(val.c_str());
		ilow4.push_back(numval);
	}

	for (int i = 0; i < queries.size(); i++) {
		std::string& val = high4[i]->getValue();
		int numval = atoi(val.c_str());
		ihigh4.push_back(numval);
	}


	return new Q13Filter(schema, columnId, queries, ieq1, ieq2, ieq3, ilow4, ihigh4);
}















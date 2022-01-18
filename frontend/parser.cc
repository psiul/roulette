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

#include "parser.h"

Parser::Parser(std::string prefix, std::string schemaPath, bool txt, char delim) : schema_(nullptr), prefix_(prefix) {
	loader_ = new Loader(prefix + schemaPath, txt, delim);
}

void Parser::getRefs (std::vector<ParsedAttribute>& refs, ParsedQuery* pquery) {
	std::vector<ParsedJoin>& pjoins = *(pquery->joins);
	std::vector<ExpressionWrapper>& pfilters = *(pquery->filters);
	std::vector<ExpressionWrapper>& ppostfilters = *(pquery->postfilters);
	std::vector<ParsedAggregateList*>& paggrList = *(pquery->aggrList);
	std::vector<ParsedExpression>& pexpr = *(pquery->expressions);

	for (int i = 0; i < pjoins.size(); i++) {
		refs.push_back(pjoins[i].left);
		refs.push_back(pjoins[i].right);

		for (int j = 0; j < pjoins[i].thetas.size(); j++) {
			if (pjoins[i].thetas[j].op.compare("eq2") == 0) {
				int secKey11, secKey12, secKey21, secKey22;
				sscanf(pjoins[i].thetas[j].left.key.c_str(), "%d.%d", &secKey11, &secKey12);
				sscanf(pjoins[i].thetas[j].right.key.c_str(), "%d.%d", &secKey21, &secKey22);

				ParsedAttribute pa11(pjoins[i].thetas[j].left.table, std::to_string(secKey11));
				ParsedAttribute pa12(pjoins[i].thetas[j].left.table, std::to_string(secKey12));

				ParsedAttribute pa21(pjoins[i].thetas[j].right.table, std::to_string(secKey21));
				ParsedAttribute pa22(pjoins[i].thetas[j].right.table, std::to_string(secKey22));

				refs.push_back(pa11);
				refs.push_back(pa12);
				refs.push_back(pa21);
				refs.push_back(pa22);
			} else {
				refs.push_back(pjoins[i].thetas[j].left);
				refs.push_back(pjoins[i].thetas[j].right);
			}
		}
	}

	for (int i = 0; i < pfilters.size(); i++) {
		pfilters[i].expr->getRefs(refs);
	}

	for (int i = 0; i < ppostfilters.size(); i++) {
		ppostfilters[i].expr->getRefs(refs);
	}

	for (int i = 0; i < pexpr.size(); i++) {
		bool match1 = false;
		bool match2 = false;

		for (int j = 0; j < pexpr.size(); j++) {
			if (pexpr[j].res.equals(pexpr[i].first))
				match1 = true;

			if (pexpr[j].res.equals(pexpr[i].second))
				match2 = true;
		}

		if (!match1)
			refs.push_back(pexpr[i].first);

		if (!match2)
			refs.push_back(pexpr[i].second);
	}

	for (int j = 0; j < paggrList.size(); j++) {
		std::vector<ParsedAggregate>& paggr = *(paggrList[j]->aggregates);
		
		for (int i = 0; i < paggr.size(); i++) {
			bool match = false;

			for (int j = 0; j < pexpr.size(); j++) {
				if (pexpr[j].res.equals(paggr[i].attr))
					match = true;
			}

			if (!match)
				refs.push_back(paggr[i].attr);
		}

		std::vector<ParsedAttribute>& groupkeys = *(paggrList[j]->grouping);

		for (int i = 0; i < groupkeys.size(); i++) {
			refs.push_back(groupkeys[i]);
		}
	}
}

void Parser::matchOutputs (
	std::map<std::string, 
	std::string>& paths,
	std::vector<ParsedAggregate>* paggr) {
	
	for (int i = 0; i < paggr->size(); i++) {
		paggr[0][i].as.key = loader_->translator[paggr[0][i].as.table][paggr[0][i].as.key];
	}
}

void Parser::matchOrderings (
	std::map<std::string, 
	std::string>& paths,
	std::vector<ParsedAttribute>* porder) {

	for (int i = 0; i < porder->size(); i++) {
		porder[0][i].key = loader_->translator[porder[0][i].table][porder[0][i].key];
	}
}

void Parser::parseOutput(
	const rapidjson::GenericValue<rapidjson::UTF8<> >::Object& doc,
	std::map<std::string, std::string>& paths,
	std::vector<ParsedAggregate>* paggr
) {
	assert(doc.HasMember("op"));
	assert(doc["op"].IsString());
	std::string op = doc["op"].GetString();

	assert(op.compare("avg") == 0 || op.compare("avg2") == 0 || op.compare("avg3") == 0 || op.compare("count") == 0 || op.compare("sum") == 0 || op.compare("min") == 0 || op.compare("max") == 0 || op.compare("project") == 0);

	assert(doc.HasMember("attr"));
	assert(doc["attr"].IsObject());
	const auto& attr = doc["attr"].GetObject();

	assert(attr.HasMember("relation"));
	assert(attr["relation"].IsString());
	std::string table = attr["relation"].GetString();

	assert(attr.HasMember("attr"));
	assert(attr["attr"].IsString());
	std::string key = attr["attr"].GetString();
	key = loader_->translator[paths[table]][key];

	assert(doc.HasMember("as"));
	assert(doc["as"].IsObject());
	const auto& as = doc["as"].GetObject();

	assert(as.HasMember("relation"));
	assert(as["relation"].IsString());
	std::string newtable = as["relation"].GetString();

	assert(as.HasMember("attr"));
	assert(as["attr"].IsString());
	std::string newkey = as["attr"].GetString();

	std::string q("1");

	ParsedAttribute pattr(table, key);
	ParsedAttribute pas(newtable, newkey);
	ParsedAggregate aggr(op, pattr, pas);

	if (doc.HasMember("having")) {
		assert(doc["having"].IsObject());
		const auto& having = doc["having"].GetObject();

		assert(having.HasMember("type"));
		assert(having["type"].IsString());
		std::string having_type = having["type"].GetString();

		assert(having.HasMember("val"));
		assert(having["val"].IsString());
		std::string having_val = having["val"].GetString();

		aggr.having_type = having_type;
		aggr.having_val = having_val;
	}

	paggr->push_back(aggr);
}

void Parser::parseKey(
	const rapidjson::GenericValue<rapidjson::UTF8<> >::Object& doc,
	std::map<std::string, std::string>& paths,
	std::vector<ParsedAttribute>* pgroup
) {
	assert(doc.HasMember("relation"));
	assert(doc["relation"].IsString());
	std::string table = doc["relation"].GetString();

	assert(doc.HasMember("attr"));
	assert(doc["attr"].IsString());
	std::string key = doc["attr"].GetString();
	key = loader_->translator[paths[table]][key];

	std::string q("1");

	ParsedAttribute pattr(table, key);
	pgroup->push_back(pattr);
}

void Parser::parseJoin (
	const rapidjson::GenericValue<rapidjson::UTF8<> >::Object& doc,
	std::map<std::string, std::string>& paths,
	std::vector<ParsedJoin>* pjoins
) {
	assert(doc.HasMember("left"));
	assert(doc["left"].IsObject());
	const auto& left = doc["left"].GetObject();

	assert(doc.HasMember("right"));
	assert(doc["right"].IsObject());
	const auto& right = doc["right"].GetObject();

	assert(left.HasMember("relation"));
	assert(left["relation"].IsString());
	std::string table1 = left["relation"].GetString();

	assert(left.HasMember("attr"));
	assert(left["attr"].IsString());
	std::string key1 = left["attr"].GetString();
	key1 = loader_->translator[paths[table1]][key1];

	assert(right.HasMember("relation"));
	assert(right["relation"].IsString());
	std::string table2 = right["relation"].GetString();

	assert(right.HasMember("attr"));
	assert(right["attr"].IsString());
	std::string key2 = right["attr"].GetString();
	key2 = loader_->translator[paths[table2]][key2];

	std::string t("1");

	ParsedAttribute attr1(table1, key1);
	ParsedAttribute attr2(table2, key2);

	ParsedJoin join(attr1, attr2, t);

	if (doc.HasMember("theta")) {
		assert(doc["theta"].IsObject());
		const auto& theta = doc["theta"].GetObject();

		assert(theta.HasMember("op"));
		assert(theta["op"].IsString());
		std::string op = theta["op"].GetString();

		assert(theta.HasMember("left"));
		assert(theta["left"].IsObject());
		const auto& thetaLeft = theta["left"].GetObject();

		assert(theta.HasMember("right"));
		assert(theta["right"].IsObject());
		const auto& thetaRight = theta["right"].GetObject();

		assert(thetaLeft.HasMember("relation"));
		assert(thetaLeft["relation"].IsString());
		std::string table3 = thetaLeft["relation"].GetString();

		assert(thetaRight.HasMember("relation"));
		assert(thetaRight["relation"].IsString());
		std::string table4 = thetaRight["relation"].GetString();

		std::string key3;
		std::string key4;

		if (op.compare("eq2") == 0) {
			assert(thetaLeft.HasMember("attr1"));
			assert(thetaLeft["attr1"].IsString());
			std::string key31 = thetaLeft["attr1"].GetString();
			key31 = loader_->translator[paths[table3]][key31];

			assert(thetaLeft.HasMember("attr2"));
			assert(thetaLeft["attr2"].IsString());
			std::string key32 = thetaLeft["attr2"].GetString();
			key32 = loader_->translator[paths[table3]][key32];

			assert(thetaRight.HasMember("attr1"));
			assert(thetaRight["attr1"].IsString());
			std::string key41 = thetaRight["attr1"].GetString();
			key41 = loader_->translator[paths[table4]][key41];

			assert(thetaRight.HasMember("attr2"));
			assert(thetaRight["attr2"].IsString());
			std::string key42 = thetaRight["attr2"].GetString();
			key42 = loader_->translator[paths[table4]][key42];

			key3 = key31 + "." + key32;
			key4 = key41 + "." + key42;

		} else {
			assert(thetaLeft.HasMember("attr"));
			assert(thetaLeft["attr"].IsString());
			key3 = thetaLeft["attr"].GetString();
			key3 = loader_->translator[paths[table3]][key3];

			assert(thetaRight.HasMember("attr"));
			assert(thetaRight["attr"].IsString());
			key4 = thetaRight["attr"].GetString();
			key4 = loader_->translator[paths[table4]][key4];
		}
			

		ParsedAttribute attr3(table3, key3);
		ParsedAttribute attr4(table4, key4);

		ParsedTheta ptheta(attr3, attr4, op);
		join.addTheta(ptheta);
	}
	
	pjoins->push_back(join);
}

void Parser::parseCondition (
	const rapidjson::GenericValue<rapidjson::UTF8<> >::Object& doc,
	std::map<std::string, std::string>& paths,
	std::vector<ParsedCondition>* accumulator
) {
	assert(doc.HasMember("op"));
	assert(doc["op"].IsString());

	std::string op = doc["op"].GetString();

	const char* opname;

	if (op.compare("!~~") == 0) {
		opname = "NLIKE";
	} else if (op.compare("~~") == 0) {
		opname = "LIKE";
	} else if (op.compare("=") == 0) {
		opname = "EQ";
	} else if (op.compare("!=") == 0) {
		opname = "NEQ";
	} else if (op.compare("in") == 0) {
		opname = "IN";
	} else if (op.compare("<=") == 0) {
		opname = "LE";
	} else if (op.compare(">=") == 0) {
		opname = "GE";
	} else if (op.compare(">") == 0) {
		opname = "GT";
	} else if (op.compare("<") == 0) {
		opname = "LT";
	} else {
		assert(false);
	}

	assert(doc.HasMember("left"));
	assert(doc["left"].IsObject());
	const auto& left = doc["left"].GetObject();

	assert(doc.HasMember("right"));
	assert(doc["right"].IsObject());
	const auto& right = doc["right"].GetObject();

	assert(left.HasMember("relation"));
	assert(left["relation"].IsString());
	std::string table = left["relation"].GetString();

	assert(left.HasMember("attr"));
	assert(left["attr"].IsString());
	std::string key = left["attr"].GetString();
	key = loader_->translator[paths[table]][key];

	ParsedAttribute attr(table, key);
	assert(right.HasMember("type"));
	assert(right["type"].IsString());
	std::string type = right["type"].GetString();
	assert(type.compare("value") == 0);

	assert(right.HasMember("val"));
	assert(right["val"].IsString());
	std::string val= right["val"].GetString();

	ParsedCondition pcond(opname, attr, val);
	accumulator->push_back(pcond);
}

Expression* Parser::parseFilterExpression(
	const rapidjson::GenericValue<rapidjson::UTF8<> >::Object& doc,
		std::map<std::string, std::string>& paths
) {
	if (doc.HasMember("type")) {
		assert(doc["type"].IsString());
		std::string type = doc["type"].GetString();

		if (type.compare("logical") == 0) {
			assert(doc.HasMember("op"));
			assert(doc["op"].IsString());
			std::string op = doc["op"].GetString();

			assert(doc.HasMember("left"));
			assert(doc["left"].IsObject());
			const auto& leftTree = doc["left"].GetObject();

			assert(doc.HasMember("right"));
			assert(doc["right"].IsObject());
			const auto& rightTree = doc["right"].GetObject();

			ConditionExpression* left = (ConditionExpression*)  parseFilterExpression(leftTree, paths);
			ConditionExpression* right = (ConditionExpression*)  parseFilterExpression(rightTree, paths);

			assert(op.compare("AND") == 0 || op.compare("OR") == 0);

			return new LogicalExpression(op, left, right);
		} else if (type.compare("ifelse") == 0) {
			assert(doc.HasMember("op"));
			assert(doc["op"].IsString());
			std::string op = doc["op"].GetString();

			assert(doc.HasMember("cond"));
			assert(doc["cond"].IsObject());
			const auto& condTree = doc["cond"].GetObject();

			assert(doc.HasMember("left"));
			assert(doc["left"].IsObject());
			const auto& leftTree = doc["left"].GetObject();

			assert(doc.HasMember("right"));
			assert(doc["right"].IsObject());
			const auto& rightTree = doc["right"].GetObject();

			ConditionExpression* cond = (ConditionExpression*) parseFilterExpression(condTree, paths);
			ValueExpression* lhs = (ValueExpression*) parseFilterExpression(leftTree, paths);
			ValueExpression* rhs = (ValueExpression*) parseFilterExpression(rightTree, paths);

			return new CaseExpression(cond, lhs, rhs);
		} else if (type.compare("cmp") == 0) {
			assert(doc.HasMember("op"));
			assert(doc["op"].IsString());
			std::string op = doc["op"].GetString();

			const char* opname;

			if (op.compare("!~~") == 0) {
				opname = "NLIKE";
			} else if (op.compare("~~") == 0) {
				opname = "LIKE";
			} else if (op.compare("~~OR") == 0) {
				opname = "LIKEOR";
			} else if (op.compare("~~AND") == 0) {
				opname = "LIKEAND";
			} else if (op.compare("=") == 0) {
				opname = "EQ";
			} else if (op.compare("!=") == 0) {
				opname = "NEQ";
			} else if (op.compare("in") == 0) {
				opname = "IN";
			} else if (op.compare("<=") == 0) {
				opname = "LE";
			} else if (op.compare(">=") == 0) {
				opname = "GE";
			} else if (op.compare(">") == 0) {
				opname = "GT";
			} else if (op.compare("<") == 0) {
				opname = "LT";
			} else if (op.compare("isnull") == 0) {
				opname = "ISNULL";
			} else if (op.compare("isnotnull") == 0) {
				opname = "ISNOTNULL";
			} else {
				assert(false);
			}

			assert(doc.HasMember("left"));
			assert(doc["left"].IsObject()); 
			const auto& leftTree = doc["left"].GetObject();

			assert(doc.HasMember("right"));
			assert(doc["right"].IsObject());
			const auto& rightTree = doc["right"].GetObject();

			assert(rightTree.HasMember("type"));
			assert(rightTree["type"].IsString());
			std::string type = rightTree["type"].GetString();
			assert(type.compare("value") == 0);

			assert(rightTree.HasMember("val"));
			assert(rightTree["val"].IsString());
			std::string val= rightTree["val"].GetString();

			ValueExpression* lhs = (ValueExpression*) parseFilterExpression(leftTree, paths);
			ConstExpression* rhs = new ConstExpression(val);
				
			return new ConstComparisonExpression (opname, lhs, rhs);
		} else if (type.compare("vcmp") == 0) {
			assert(doc.HasMember("op"));
			assert(doc["op"].IsString());
			std::string op = doc["op"].GetString();

			const char* opname;

			if (op.compare("=") == 0) {
				opname = "EQ";
			} else if (op.compare("!=") == 0) {
				opname = "NEQ";
			} else if (op.compare("<=") == 0) {
				opname = "LE";
			} else if (op.compare(">=") == 0) {
				opname = "GE";
			} else if (op.compare(">") == 0) {
				opname = "GT";
			} else if (op.compare(">2") == 0) {
				opname = "GT2";
			} else if (op.compare(">5") == 0) {
				opname = "GT5";
			} else if (op.compare("<") == 0) {
				opname = "LT";
			} else {
				assert(false);
			}

			assert(doc.HasMember("left"));
			assert(doc["left"].IsObject());
			const auto& leftTree = doc["left"].GetObject();

			assert(doc.HasMember("right"));
			assert(doc["right"].IsObject());
			const auto& rightTree = doc["right"].GetObject();

			ValueExpression* lhs = (ValueExpression*) parseFilterExpression(leftTree, paths);
			ValueExpression* rhs = (ValueExpression*) parseFilterExpression(rightTree, paths);
				
			return new ValueComparisonExpression(opname, lhs, rhs);
		} else if (type.compare("q28") == 0) {
			assert(doc.HasMember("1"));
			assert(doc["1"].IsObject());
			const auto& tree1 = doc["1"].GetObject();

			assert(tree1.HasMember("attr"));
			assert(tree1["attr"].IsObject());
			const auto& attr1 = tree1["attr"].GetObject();

			assert(tree1.HasMember("low"));
			assert(tree1["low"].IsObject());
			const auto& low1 = tree1["low"].GetObject();

			assert(tree1.HasMember("high"));
			assert(tree1["high"].IsObject());
			const auto& high1 = tree1["high"].GetObject();

			assert(low1.HasMember("type"));
			assert(low1["type"].IsString());
			std::string typel1 = low1["type"].GetString();
			assert(typel1.compare("value") == 0);

			assert(low1.HasMember("val"));
			assert(low1["val"].IsString());
			std::string vall1= low1["val"].GetString();

			assert(high1.HasMember("type"));
			assert(high1["type"].IsString());
			std::string typeh1 = high1["type"].GetString();
			assert(typeh1.compare("value") == 0);

			assert(high1.HasMember("val"));
			assert(high1["val"].IsString());
			std::string valh1= high1["val"].GetString();

			AttributeExpression* ae1 = (AttributeExpression*) parseFilterExpression(attr1, paths);
			ConstExpression* le1 = new ConstExpression(vall1);
			ConstExpression* he1 = new ConstExpression(valh1);

			assert(doc.HasMember("2"));
			assert(doc["2"].IsObject());
			const auto& tree2 = doc["2"].GetObject();

			assert(tree2.HasMember("attr"));
			assert(tree2["attr"].IsObject());
			const auto& attr2 = tree2["attr"].GetObject();

			assert(tree2.HasMember("low"));
			assert(tree2["low"].IsObject());
			const auto& low2 = tree2["low"].GetObject();

			assert(tree2.HasMember("high"));
			assert(tree2["high"].IsObject());
			const auto& high2 = tree2["high"].GetObject();

			assert(low2.HasMember("type"));
			assert(low2["type"].IsString());
			std::string typel2 = low2["type"].GetString();
			assert(typel2.compare("value") == 0);

			assert(low2.HasMember("val"));
			assert(low2["val"].IsString());
			std::string vall2= low2["val"].GetString();

			assert(high2.HasMember("type"));
			assert(high2["type"].IsString());
			std::string typeh2 = high2["type"].GetString();
			assert(typeh2.compare("value") == 0);

			assert(high2.HasMember("val"));
			assert(high2["val"].IsString());
			std::string valh2= high2["val"].GetString();

			AttributeExpression* ae2 = (AttributeExpression*) parseFilterExpression(attr2, paths);
			ConstExpression* le2 = new ConstExpression(vall2);
			ConstExpression* he2 = new ConstExpression(valh2);

			assert(doc.HasMember("3"));
			assert(doc["3"].IsObject());
			const auto& tree3 = doc["3"].GetObject();

			assert(tree3.HasMember("attr"));
			assert(tree3["attr"].IsObject());
			const auto& attr3 = tree3["attr"].GetObject();

			assert(tree3.HasMember("low"));
			assert(tree3["low"].IsObject());
			const auto& low3 = tree3["low"].GetObject();

			assert(tree3.HasMember("high"));
			assert(tree3["high"].IsObject());
			const auto& high3 = tree3["high"].GetObject();

			assert(low3.HasMember("type"));
			assert(low3["type"].IsString());
			std::string typel3 = low3["type"].GetString();
			assert(typel3.compare("value") == 0);

			assert(low3.HasMember("val"));
			assert(low3["val"].IsString());
			std::string vall3= low3["val"].GetString();

			assert(high3.HasMember("type"));
			assert(high3["type"].IsString());
			std::string typeh3 = high3["type"].GetString();
			assert(typeh3.compare("value") == 0);

			assert(high3.HasMember("val"));
			assert(high3["val"].IsString());
			std::string valh3= high3["val"].GetString();

			AttributeExpression* ae3 = (AttributeExpression*) parseFilterExpression(attr3, paths);
			ConstExpression* le3 = new ConstExpression(vall3);
			ConstExpression* he3 = new ConstExpression(valh3);

			return new Q28Expression (ae1, le1, he1, ae2, le2, he2, ae3, le3, he3);
		} else {
			assert(false);
		}
	} else if (doc.HasMember("attr")) {
		assert(doc.HasMember("relation"));
		assert(doc["relation"].IsString());
		std::string table = doc["relation"].GetString();

		assert(doc.HasMember("attr"));
		assert(doc["attr"].IsString());
		std::string key = doc["attr"].GetString();
		key = loader_->translator[paths[table]][key];

		return new AttributeExpression(key, table);
	} else {
		assert(false);
	}

	return nullptr;
}

void Parser::parseFilterTree(
	const rapidjson::GenericValue<rapidjson::UTF8<> >::Object& doc,
	std::map<std::string, std::string>& paths,
	std::vector<ParsedFilter>* pfilters,
	std::vector<ParsedCondition>* accumulator,
	bool flag
) {
	assert(doc.HasMember("type"));
	assert(doc["type"].IsString());

	std::string type = doc["type"].GetString();

	if (type.compare("logical") == 0) {
		assert(doc.HasMember("op"));
		assert(doc["op"].IsString());

		std::string op = doc["op"].GetString();

		if (op.compare("AND") == 0) {
			assert(flag);

			assert(doc.HasMember("left"));
			assert(doc["left"].IsObject());
			const auto& left = doc["left"].GetObject();

			assert(doc.HasMember("right"));
			assert(doc["right"].IsObject());
			const auto& right = doc["right"].GetObject();

			std::vector<ParsedCondition> accumulatorLeft;

			parseFilterTree(left, paths, pfilters, &accumulatorLeft, flag);

			if (accumulatorLeft.size() > 0) {
				ParsedFilter pfilt(accumulatorLeft);
				pfilters->push_back(pfilt);
			}

			std::vector<ParsedCondition> accumulatorRight;

			parseFilterTree(right, paths, pfilters, &accumulatorRight, flag);

			if (accumulatorRight.size() > 0) {
				ParsedFilter pfilt(accumulatorRight);
				pfilters->push_back(pfilt);
			}
		} else if (op.compare("OR") == 0) {
			assert(doc.HasMember("left"));
			assert(doc["left"].IsObject());
			const auto& left = doc["left"].GetObject();

			assert(doc.HasMember("right"));
			assert(doc["right"].IsObject());
			const auto& right = doc["right"].GetObject();

			parseFilterTree(left, paths, pfilters, accumulator, false);
			parseFilterTree(right, paths, pfilters, accumulator, false);
		} else {
			assert(false);
		}
	} else if (type.compare("cmp") == 0) {
		parseCondition(doc, paths, accumulator);
	} else {
		assert(false);
	}
}

void Parser::parseFilterRoot (
	const rapidjson::GenericValue<rapidjson::UTF8<> >::Object& doc,
	std::map<std::string, std::string>& paths,
	std::vector<ParsedFilter>* pfilters
) {
	std::vector<ParsedCondition> accumulator;

	parseFilterTree(doc, paths, pfilters, &accumulator, true);

	if (accumulator.size() > 0) {
		ParsedFilter pfilt(accumulator);
		pfilters->push_back(pfilt);
	}
}

void Parser::parseQueryTree(
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
) {
	assert(doc.HasMember("type"));
	assert(doc["type"].IsString());

	std::string type = doc["type"].GetString();

	if (type.compare("aggr") == 0) {
		assert(doc.HasMember("child"));
		assert(doc["child"].IsObject());
		const auto& child = doc["child"].GetObject();
		parseQueryTree(child, paths, pjoins, pfilters, ppostfilters, paggr, pgroup, porder, limit, pexpr);

		assert(doc.HasMember("output"));
		assert(doc["output"].IsArray());
		const auto& children = doc["output"].GetArray();
		for (auto& v : children) {
			assert(v.IsObject());
			const auto& output = v.GetObject();
			parseOutput(output, paths, paggr);
		}	

		assert(doc.HasMember("key"));
		assert(doc["key"].IsArray());
		const auto& grouping = doc["key"].GetArray();
		for (auto& v : grouping) {
			assert(v.IsObject());
			const auto& key = v.GetObject();
			parseKey(key, paths, pgroup);
		}

		assert(doc.HasMember("ordering"));
		assert(doc["ordering"].IsArray());
		const auto& ordering = doc["ordering"].GetArray();
		for (auto& v : ordering) {
			assert(v.IsObject());
			const auto& order = v.GetObject();

			assert(order.HasMember("relation"));
			assert(order["relation"].IsString());
			std::string table = order["relation"].GetString();

			assert(order.HasMember("attr"));
			assert(order["attr"].IsString());
			std::string key = order["attr"].GetString();

			std::string q("1");

			ParsedAttribute pattr(table, key);
			porder->push_back(pattr);
		}

		if (doc.HasMember("limit")) {
			assert(doc["limit"].IsInt());
			limit = doc["limit"].GetInt();
		}

		if (doc.HasMember("post_filter")) {
			assert(doc["post_filter"].IsArray());
			const auto& filters = doc["post_filter"].GetArray();
			for (auto& f : filters) {
				assert(f.IsObject());
				const auto& filter = f.GetObject();
				Expression* expr = parseFilterExpression(filter, paths);
				ExpressionWrapper ew(expr);
				ppostfilters->push_back(ew);
			}
		}
	} else if (type.compare("multijoin") == 0) {
		assert(doc.HasMember("children"));
		assert(doc["children"].IsArray());
		const auto& children = doc["children"].GetArray();
		for (auto& v : children) {
			assert(v.IsObject());
			const auto& child = v.GetObject();
			parseQueryTree(child, paths, pjoins, pfilters, ppostfilters, paggr, pgroup, porder, limit, pexpr);
		}

		const auto& conds = doc["cond"].GetArray();
		for (auto& v : conds) {
			assert(v.IsObject());
			const auto& cond = v.GetObject();
			parseJoin(cond, paths, pjoins);
		}
	} else if (type.compare("scan") == 0) {
		assert(doc.HasMember("relation"));
		assert(doc["relation"].IsString());
		std::string relation = doc["relation"].GetString();
		std::string relPath = loader_->fullname[relation];

		assert(doc.HasMember("name"));
		assert(doc["name"].IsString());
		std::string relNameStr = doc["name"].GetString();

		paths[relNameStr] = relPath;

		if (doc.HasMember("filter")) {
			assert(doc["filter"].IsArray());
			const auto& filters = doc["filter"].GetArray();
			for (auto& f : filters) {
				assert(f.IsObject());
				const auto& filter = f.GetObject();
				Expression* expr = parseFilterExpression(filter, paths);
				ExpressionWrapper ew(expr);
				pfilters->push_back(ew);
			}
		}
	} else {
		assert(false);
	}
}

int Parser::parseQuery (std::string path) {
	char readBuffer[65536];
	FILE* fp = fopen(path.c_str(), "rb");
	rapidjson::FileReadStream is(fp, readBuffer, sizeof(readBuffer));

	rapidjson::Document d;
   	d.ParseStream(is);
   	assert(d.IsObject());
   	const auto& doc = d.GetObject();

   	std::map<std::string, std::string> paths;
	std::vector<ParsedJoin>* pjoins = new std::vector<ParsedJoin>();
	std::vector<ExpressionWrapper>* pfilters = new std::vector<ExpressionWrapper>();
	std::vector<ExpressionWrapper>* ppostfilters = new std::vector<ExpressionWrapper>();
	std::vector<ParsedAggregate>* paggr = new std::vector<ParsedAggregate>();
	std::vector<ParsedAttribute>* pgroup = new std::vector<ParsedAttribute>();
	std::vector<ParsedAttribute>* porder = new std::vector<ParsedAttribute>();
	std::vector<ParsedExpression>* pexpr = new std::vector<ParsedExpression>();

	assert(doc.HasMember("name"));
	assert(doc["name"].IsString());

	std::string queryName = doc["name"].GetString();

	if (queryIndex.find(queryName) != queryIndex.end()) {
		return queryIndex[queryName];
	} else {
	
	}

	assert(doc.HasMember("batch"));
	assert(doc["batch"].IsInt());

	int queryBatch = doc["batch"].GetInt();

	assert(doc.HasMember("query"));
	assert(doc["query"].IsObject());

	const auto& queryDoc = doc["query"].GetObject();

	int limit = -1;

   	parseQueryTree(queryDoc, paths, pjoins, pfilters, ppostfilters, paggr, pgroup, porder, limit, pexpr);

   	std::vector<std::string> dependencies;

   	assert(doc.HasMember("requires"));
	assert(doc["requires"].IsArray());

	const auto& requires = doc["requires"].GetArray();
	for (auto& r : requires) {
		assert(r.IsString());
		std::string requirement = r.GetString();
		dependencies.push_back(requirement);
	}

	if (doc.HasMember("export")) {
		assert(doc["export"].IsObject());

		outputCollection[queryName] = queryName;

		const auto& exported = doc["export"].GetObject();
		loader_->registerAdHocTable(exported, paths, queryName);
	}

	matchOutputs (paths, paggr);
	matchOrderings (paths, porder);

	if (ppostfilters->size() > 0) {
		//ppostfilters[0][0].expr->print();
	}

	ParsedAggregateList* paggrlist = new ParsedAggregateList(paggr, pgroup, porder, limit);

   	ParsedQuery* pquery = new ParsedQuery(paths, paggrlist, pjoins, pfilters, ppostfilters, pexpr, dependencies, queryBatch);

   	int ret = queries.size();
   	queryIndex[queryName] = ret;
   	queries.push_back(pquery);

   	fclose(fp);

   	return ret;
}

int Parser::setUpQuery (std::string path) {
	char readBuffer[65536];
	FILE* fp = fopen(path.c_str(), "rb");
	rapidjson::FileReadStream is(fp, readBuffer, sizeof(readBuffer));

	rapidjson::Document d;
   	d.ParseStream(is);
   	assert(d.IsObject());
   	const auto& doc = d.GetObject();

   	std::vector<std::string> dependencies;

   	assert(doc.HasMember("requires"));
	assert(doc["requires"].IsArray());

	const auto& requires = doc["requires"].GetArray();
	for (auto& r : requires) {
		assert(r.IsString());
		std::string requirement = r.GetString();
		dependencies.push_back(requirement);
	}

	fclose(fp);

	for (int i = 0; i < dependencies.size(); i++)
   		setUpQuery(prefix_ + dependencies[i]);

   	int ret = queriesToParse.size();

   	queriesToParse.push_back(path);

   	return ret;
}



int Parser::addQuery(std::string path) {
	return setUpQuery(prefix_ + path);
}

void Parser::prepare() {
	for (int i = 0; i < queriesToParse.size(); i++)
		parseQuery(queriesToParse[i]);

	std::vector<ParsedAttribute> refs;
	for (int i = 0; i < queries.size(); i++)
		getRefs(refs, queries[i]);

	std::map<std::string, std::string> alias;
	for (int i = 0; i < queries.size(); i++) {
		std::map<std::string, std::string>& local = queries[i]->alias;
		for (std::map<std::string, std::string>::iterator it = local.begin(); it != local.end(); ++it) {
			alias[it->first] = it->second;
		}
	}

	for (std::map<std::string, std::string>::iterator it = outputCollection.begin(); it != outputCollection.end(); ++it) {
		alias[it->first] = it->second;
	}

	loader_->createSchema(refs, alias);
	schema_ = loader_->getSchema();

	//for (int i = 0; i < queries.size(); i++)
	//	queries[i]->optimizeGraph(schema_);
}

Schema* Parser::getSchema () {
	return schema_;
}

ParsedQuery& Parser::getQuery(int i) {
	return *(queries[i]);
}

void Parser::load (int*& topOrdering, int i) {
	int tables = schema_->getTableNumber();
	topOrdering = new(numa_alloc_onnode(tables*sizeof(int), SOCKET)) int[tables];

	for (int i = 0; i < tables; i++)
		topOrdering[i] = -1;

	for (std::map<std::string, int>::iterator it = (loader_->binding).begin(); it != (loader_->binding).end(); ++it) {
		if ((queries[i]->alias).find(it->first) != (queries[i]->alias).end()) {
			int  tableId = schema_->getTableId(it->first);
			if (tableId < tables)
				topOrdering[tableId] = (queries[i]->getOrdering())[tableId];
		}
	}
}

void Parser::load (int*& topOrdering, ParsedQuery* query) {
	int tables = schema_->getTableNumber();
	topOrdering = new(numa_alloc_onnode(tables*sizeof(int), SOCKET)) int[tables];

	for (int i = 0; i < tables; i++)
		topOrdering[i] = -1;

	for (std::map<std::string, int>::iterator it = (loader_->binding).begin(); it != (loader_->binding).end(); ++it) {
		if ((query->alias).find(it->first) != (query->alias).end()) {
			int  tableId = schema_->getTableId(it->first);
			if (tableId < tables)
				topOrdering[tableId] = (query->getOrdering())[tableId];
		}
	}
}

std::vector<ParsedQuery*>& Parser::getAllQueries () {
	return queries;
}
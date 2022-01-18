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

#include "../frontend/parse-util.h"

ParsedFilter parseFilter (char* line) {
	char* tok = strtok(line, " ");

	int filters = atoi(tok);
	std::vector<ParsedCondition> conditions;

	for (int i = 0; i < filters; i++) {
		std::string op(strtok(NULL, " "));

		std::string table(strtok(NULL, "."));
		std::string key(strtok(NULL, " "));

		char* condval = strtok(NULL, " ");
		for (int j = 0; j < strlen(condval); j++)
			if (condval[j] == '%')
				condval[j] = ' ';
		std::string val (condval);

		ParsedAttribute attr(table, key);
		ParsedCondition cond(op, attr, val);
		conditions.push_back(cond);
	}

	std::string q(strtok(NULL, "\n"));

	ParsedFilter filter(conditions);
	return filter;
}

ParsedJoin parseJoin (char* line) {
	std::string table1(strtok(line, "."));
	std::string key1(strtok(NULL, "="));
	std::string table2(strtok(NULL, "."));
	std::string key2(strtok(NULL, " "));
	std::string t(strtok(NULL, "\n"));
		
	ParsedAttribute attr1(table1, key1);
	ParsedAttribute attr2(table2, key2);

	ParsedJoin join(attr1, attr2, t);

	return join;
}

ParsedAggregate parseAggregate (char* line) {
	std::string op(strtok(line, " "));

	std::string table(strtok(NULL, "."));
	std::string key(strtok(NULL, " "));

	std::string q(strtok(NULL, "\n"));

	ParsedAttribute attr(table, key);
	ParsedAggregate aggr(op, attr, attr);
	return aggr;
}

ParsedExpression parseExpression (char* line) {
	std::string op(strtok(line, " "));

	std::string table1(strtok(NULL, "."));
	std::string key1(strtok(NULL, " "));

	std::string table2(strtok(NULL, "."));
	std::string key2(strtok(NULL, " "));

	std::string table3(strtok(NULL, "."));
	std::string key3(strtok(NULL, " "));

	std::string q(strtok(NULL, "\n"));

	ParsedAttribute attr1(table1, key1);
	ParsedAttribute attr2(table2, key2);
	ParsedAttribute attr3(table3, key3);
	ParsedExpression expr(op, attr1, attr2, attr3);

	return expr;
}

ParsedQuery batchQueries (std::vector<ParsedQuery*>& queries, int start) {
	std::map<std::string, std::string> alias; 
	std::vector<ParsedAggregateList*>* aggrList; 
	std::vector<ParsedJoin>* joins;
	std::vector<ExpressionWrapper>* filters;
	std::vector<ExpressionWrapper>* postfilters;
	std::vector<ParsedExpression>* expressions;


	aggrList = new std::vector<ParsedAggregateList*>();
	joins = new std::vector<ParsedJoin>();
	filters = new std::vector<ExpressionWrapper>();
	postfilters = new std::vector<ExpressionWrapper>();
	expressions = new std::vector<ParsedExpression>();

	std::map<std::string, std::bitset<MAXQUERIES> > queryMask;

	for (int i = 0; i < queries.size(); i++) {
		ParsedQuery& q = *(queries[i]);

		for (std::map<std::string, std::string>::iterator it = q.alias.begin(); it != q.alias.end(); ++it) {
			alias[it->first] = it->second;

			if (queryMask.find(it->first) == queryMask.end()) {
				std::bitset<MAXQUERIES> q;
				q.reset();
				queryMask[it->first] = q;
			}
			queryMask[it->first].set(start + i);
		}

		ParsedAggregateList* qAggrList = q.aggrList[0][0];

		(qAggrList->queries).reset();
		(qAggrList->queries).set(start + i);

		std::vector<ParsedAggregate>* qAggregates = qAggrList->aggregates;

		for (int j = 0; j < qAggregates->size(); j++) {
			(*qAggregates)[j].queries.reset();
			(*qAggregates)[j].queries.set(start + i);
		}

		for (int j = 0; j < (*q.joins).size(); j++) {
			bool found = false;
			for (int k = 0; k < (*joins).size(); k++) {
				if ((*joins)[k].equals((*q.joins)[j])) {
					(*joins)[k].queries.set(start + i);
					found = true;
					break;
				}
			}
			if (!found) {
				ParsedJoin pj = (*q.joins)[j];
				pj.queries.reset();
				pj.queries.set(start + i);
				pj.type = (*q.joins)[j].type;
				joins->push_back(pj);
			}
		}

		aggrList->push_back(qAggrList);

		for (int j = 0; j < (*q.filters).size(); j++) {
			ExpressionWrapper pf = (*q.filters)[j];
			pf.queries.reset();
			pf.queries.set(start + i);

			bool found = false;

			if ((pf.expr->type()).compare("q28") == 0) {
				((Q28Expression*) pf.expr)->initIf(pf.queries);

				for (int k = 0; k < filters->size(); k++) {
					if ((filters[0][k].expr->type()).compare("q28") == 0) {
						assert(((Q28Expression*) pf.expr)->equals((Q28Expression*) filters[0][k].expr));
						((Q28Expression*) filters[0][k].expr)->addQ28((Q28Expression*) pf.expr);
						found = true;
					}
				}
			}

			if (!found) {
				filters->push_back(pf);
			}
		}

		for (int j = 0; j < (*q.postfilters).size(); j++) {
			ExpressionWrapper pf = (*q.postfilters)[j];
			bool found = false;

			//pf.expr->print();

			for (int k = 0; k < postfilters->size(); k++) {
				if (postfilters[0][k].expr->equals(pf.expr)) {
					postfilters[0][k].queries.set(start+i);
					std::cout << "Matched postfilters!!!!" << std::endl;
					found = true;
					break;
				}
			}

			if (!found) {
				pf.queries.reset();
				pf.queries.set(start + i);
				postfilters->push_back(pf);
			}
		}

		for (int j = 0; j < (*q.expressions).size(); j++) {
			ParsedExpression pe = (*q.expressions)[j];
			expressions->push_back(pe);
		}
	}

	//assert(false);

	ParsedQuery batch (alias, aggrList, joins, filters, postfilters, expressions);
	batch.queryMask = queryMask;
	return batch;
}

void expandCommas (const ParsedQuery& pquery, ParsedAttribute attr, std::vector<ParsedAttribute>& expansion) {
	std::vector<ParsedExpression>& pexpr = *(pquery.expressions);

	for (int i = 0; i < pexpr.size(); i++) {
		if (attr.equals(pexpr[i].res) && pexpr[i].op.compare("COMMA") == 0) {
			expandCommas(pquery, pexpr[i].first, expansion);
			expandCommas(pquery, pexpr[i].second, expansion);
			return;
		}
	}

	expansion.push_back(attr);
}


ParsedQuery::ParsedQuery (
	std::map<std::string, 
	std::string> alias, 
	ParsedAggregateList* aggrs, 
	std::vector<ParsedJoin>* joins, 
	std::vector<ExpressionWrapper>* filters,
	std::vector<ExpressionWrapper>* postfilters, 
	std::vector<ParsedExpression>* expressions, 
	std::vector<std::string>& dependencies, 
	int batch) :
	alias(alias), joins(joins), filters(filters), postfilters(postfilters), expressions(expressions), dependencies(dependencies), batch_(batch) {
	aggrList = new std::vector<ParsedAggregateList*>();

	aggrList->push_back(aggrs);

	for (std::map<std::string, std::string>::iterator it = alias.begin(); it != alias.end(); ++it) {
		std::bitset<MAXQUERIES> q;
		q.reset();
		q.set(0);
		queryMask[it->first] = 0;
		queryMask[it->first].set(0);
	}
}


ParsedQuery::ParsedQuery (
	std::map<std::string, 
	std::string> alias, 
	std::vector<ParsedAggregateList*>* aggrs, 
	std::vector<ParsedJoin>* joins, 
	std::vector<ExpressionWrapper>* filters,
	std::vector<ExpressionWrapper>* postfilters, 
	std::vector<ParsedExpression>* expressions) :
		alias(alias), joins(joins), aggrList(aggrs), filters(filters), postfilters(postfilters), expressions(expressions) {
	for (std::map<std::string, std::string>::iterator it = alias.begin(); it != alias.end(); ++it) {
		std::bitset<MAXQUERIES> q;
		q.reset();
		q.set(0);
		queryMask[it->first] = 0;
		queryMask[it->first].set(0);
	}
}

	

void ParsedQuery::reorderJoins (Schema* schema) {
	for (int i = 0; i < joins->size(); i++) {
		int leftId = schema->getTableId((*joins)[i].left.table);
		int rightId = schema->getTableId((*joins)[i].right.table);

		if (relOrder[leftId] < relOrder[rightId] ||  (relOrder[leftId] == relOrder[rightId] && reduction[leftId]*schema->getRowCount(leftId) < reduction[rightId]*schema->getRowCount(rightId))) {
			ParsedAttribute attr1 = (*joins)[i].left;
			ParsedAttribute attr2 = (*joins)[i].right;

			(*joins)[i].left = attr2;
			(*joins)[i].right = attr1;
		}
	}
}


void ParsedQuery::printGraph () {
	//for (int i = 0; i < joins->size(); i++)
	//	std::cout << (*joins)[i].left.table << "." << (*joins)[i].left.key << " " << (*joins)[i].right.table << "." << (*joins)[i].right.key << " " <<( *joins)[i].type << std::endl;
}

void ParsedQuery::setOrders (Schema* schema) {
	/*
	//Batch 5
	//kind_type 2
	if (schema->getTableId("kt") >= 0) {
		relOrder[schema->getTableId("kt")] = 0;
	}
	if (schema->getTableId("kt2") >= 0) {
		relOrder[schema->getTableId("kt2")] = 0;
	}
	//relOrder[15] = 0;
	//relOrder[16] = 0;
	//info_type 5
	if (schema->getTableId("it") >= 0) {
		relOrder[schema->getTableId("it")] = 0;
	}
	if (schema->getTableId("it_idx") >= 0) {
		relOrder[schema->getTableId("it_idx")] = 0;
	}
	if (schema->getTableId("it_p") >= 0) {
		relOrder[schema->getTableId("it_p")] = 0;
	}
	//relOrder[11] = 0;
	//relOrder[12] = 0;
	//relOrder[13] = 0;
	//link_type 6
	if (schema->getTableId("lt") >= 0) {
		relOrder[schema->getTableId("lt")] = 0;
	}
	//relOrder[17] = 0;
	//role_type 7
	if (schema->getTableId("rt") >= 0) {
		relOrder[schema->getTableId("rt")] = 0;
	}
	//relOrder[27] = 0;
	//comp_cast_type 10
	if (schema->getTableId("cct1") >= 0) {
		relOrder[schema->getTableId("cct1")] = 0;
	}
	if (schema->getTableId("cct2") >= 0) {
		relOrder[schema->getTableId("cct2")] = 0;
	}
	//relOrder[4] = 0;
	//relOrder[5] = 0;
	//relOrder[6] = 0;
	//company_type 11
	if (schema->getTableId("ct") >= 0) {
		relOrder[schema->getTableId("ct")] = 0;
	}
	//relOrder[9] = 0;
	//aka_name 12
	if (schema->getTableId("an") >= 0) {
		relOrder[schema->getTableId("an")] = 0;
	}
	//relOrder[0] = 0;
	//aka_tilte 13
	if (schema->getTableId("at") >= 0) {
		relOrder[schema->getTableId("at")] = 0;
	}
	//relOrder[1] = 0;
	//char_name 14
	if (schema->getTableId("chn") >= 0) {
		relOrder[schema->getTableId("chn")] = 0;
	}
	//relOrder[3] = 0;
	//company_name 16
	if (schema->getTableId("cn") >= 0) {
		relOrder[schema->getTableId("cn")] = 1;
	}
	if (schema->getTableId("cn2") >= 0) {
		relOrder[schema->getTableId("cn2")] = 1;
	}
	//relOrder[7] = 1;
	//relOrder[8] = 1;
	//keyword 17
	if (schema->getTableId("k") >= 0) {
		relOrder[schema->getTableId("k")] = 0;
	}
	//relOrder[14] = 0;
	//title 19
	if (schema->getTableId("t") >= 0) {
		relOrder[schema->getTableId("t")] = 1;
	}
	if (schema->getTableId("t2") >= 0) {
		relOrder[schema->getTableId("t2")] = 1;
	}
	//relOrder[28] = 1;
	//relOrder[29] = 1;
	//name 20
	if (schema->getTableId("n") >= 0) {
		relOrder[schema->getTableId("n")] = 1;
	}
	//relOrder[25] = 1;
	//person_info 21
	if (schema->getTableId("pi") >= 0) {
		relOrder[schema->getTableId("pi")] = 2;
	}
	//relOrder[26] = 2;
	//movie companies 23
	if (schema->getTableId("mc") >= 0) {
		relOrder[schema->getTableId("mc")] = 2;
	}
	if (schema->getTableId("mc2") >= 0) {
		relOrder[schema->getTableId("mc2")] = 2;
	}
	//relOrder[18] = 2;
	//relOrder[19] = 2;
	//movie_info 24
	if (schema->getTableId("mi") >= 0) {
		relOrder[schema->getTableId("mi")] = 2;
	}
	//relOrder[20] = 2;
	//movie_info_idx 26
	if (schema->getTableId("midx") >= 0) {
		relOrder[schema->getTableId("midx")] = 2;
	}
	if (schema->getTableId("midx2") >= 0) {
		relOrder[schema->getTableId("midx2")] = 2;
	}
	//relOrder[21] = 2;
	//relOrder[22] = 2;
	//movie link 27
	if (schema->getTableId("ml") >= 0) {
		relOrder[schema->getTableId("ml")] = 2;
	}
		//relOrder[24] = 2;
		//movie keyword 28
		if (schema->getTableId("mk") >= 0) {
			relOrder[schema->getTableId("mk")] = 2;
		}
		//relOrder[23] = 2;
		//complete_cast 29 
		if (schema->getTableId("cc") >= 0) {
			relOrder[schema->getTableId("cc")] = 1;
		}
		//relOrder[1] = 1;
		//cast_info 30
		if (schema->getTableId("ci") >= 0) {
			relOrder[schema->getTableId("ci")] = 2;
		}
		//relOrder[2] = 2;
		*/

		/*
		//Batch 4
		//kind_type 2
		if (schema->getTableId("kt") >= 0) {
			relOrder[schema->getTableId("kt")] = 0;
		}
		//relOrder[15] = 0;
		if (schema->getTableId("kt2") >= 0) {
			relOrder[schema->getTableId("kt2")] = 0;
		}
		//relOrder[16] = 0;
		//info_type 5
		if (schema->getTableId("it") >= 0) {
			relOrder[schema->getTableId("it")] = 0;
		}
		if (schema->getTableId("it_idx") >= 0) {
			relOrder[schema->getTableId("it_idx")] = 0;
		}
		if (schema->getTableId("it_p") >= 0) {
			relOrder[schema->getTableId("it_p")] = 0;
		}
		//relOrder[11] = 0;
		//relOrder[12] = 0;
		//relOrder[13] = 0;
		//link_type 6
		if (schema->getTableId("lt") >= 0) {
			relOrder[schema->getTableId("lt")] = 0;
		}
		//relOrder[17] = 0;
		//role_type 7
		if (schema->getTableId("rt") >= 0) {
			relOrder[schema->getTableId("rt")] = 0;
		}
		//relOrder[27] = 0;
		//comp_cast_type 10
		if (schema->getTableId("cct1") >= 0) {
			relOrder[schema->getTableId("cct1")] = 0;
		}
		if (schema->getTableId("cct2") >= 0) {
			relOrder[schema->getTableId("cct2")] = 0;
		}
		//relOrder[4] = 0;
		//relOrder[5] = 0;
		//relOrder[6] = 0;
		//company_type 11
		if (schema->getTableId("ct") >= 0) {
			relOrder[schema->getTableId("ct")] = 0;
		}
		//relOrder[9] = 0;
		//aka_name 12
		if (schema->getTableId("an") >= 0) {
			relOrder[schema->getTableId("an")] = 2;
		}
		//relOrder[0] = 2;
		//aka_tilte 13
		if (schema->getTableId("at") >= 0) {
			relOrder[schema->getTableId("at")] = 2;
		}
		//relOrder[1] = 2;
		//char_name 14
		if (schema->getTableId("chn") >= 0) {
			relOrder[schema->getTableId("chn")] = 0;
		}
		//relOrder[3] = 0;
		//company_name 16
		if (schema->getTableId("cn") >= 0) {
			relOrder[schema->getTableId("cn")] = 1;
		}
		if (schema->getTableId("cn2") >= 0) {
			relOrder[schema->getTableId("cn2")] = 1;
		}
		//relOrder[7] = 1;
		//relOrder[8] = 1;
		//keyword 17
		if (schema->getTableId("k") >= 0) {
			relOrder[schema->getTableId("k")] = 0;
		}
		//relOrder[14] = 0;
		//title 19
		if (schema->getTableId("t") >= 0) {
			relOrder[schema->getTableId("t")] = 1;
		}
		if (schema->getTableId("t2") >= 0) {
			relOrder[schema->getTableId("t2")] = 1;
		}
		//relOrder[28] = 1;
		//relOrder[29] = 1;
		//relOrder[30] = 1;
		//name 20
		if (schema->getTableId("n") >= 0) {
			relOrder[schema->getTableId("n")] = 1;
		}
		//relOrder[25] = 1;
		//person_info 21
		if (schema->getTableId("pi") >= 0) {
			relOrder[schema->getTableId("pi")] = 2;
		}
		//relOrder[26] = 2;
		//movie companies 23
		if (schema->getTableId("mc") >= 0) {
			relOrder[schema->getTableId("mc")] = 2;
		}
		if (schema->getTableId("mc2") >= 0) {
			relOrder[schema->getTableId("mc2")] = 2;
		}
		//relOrder[18] = 2;
		//relOrder[19] = 2;
		//movie_info 24
		if (schema->getTableId("mi") >= 0) {
			relOrder[schema->getTableId("mi")] = 2;
		}
		//relOrder[20] = 2;
		//movie_info_idx 26
		if (schema->getTableId("midx") >= 0) {
			relOrder[schema->getTableId("midx")] = 2;
		}
		if (schema->getTableId("midx2") >= 0) {
			relOrder[schema->getTableId("midx2")] = 2;
		}
		//relOrder[21] = 2;
		//relOrder[22] = 2;
		//movie link 27
		if (schema->getTableId("ml") >= 0) {
			relOrder[schema->getTableId("ml")] = 2;
		}
		//relOrder[24] = 2;
		//movie keyword 28
		if (schema->getTableId("mk") >= 0) {
			relOrder[schema->getTableId("mk")] = 2;
		}
		//relOrder[23] = 2;
		//complete_cast 29
		if (schema->getTableId("cc") >= 0) {
			relOrder[schema->getTableId("cc")] = 2;
		}
		//relOrder[1] = 2;
		//cast_info 30
		if (schema->getTableId("ci") >= 0) {
			relOrder[schema->getTableId("ci")] = 3;
		}
		//relOrder[2] = 2;
		*/

		/*
		//Batch 3
		//kind_type 2
		if (schema->getTableId("kt") >= 0) {
			relOrder[schema->getTableId("kt")] = 0;
		}
		//relOrder[14] = 0;
		//info_type 5
		if (schema->getTableId("it") >= 0) {
			relOrder[schema->getTableId("it")] = 0;
		}
		if (schema->getTableId("it_idx") >= 0) {
			relOrder[schema->getTableId("it_idx")] = 0;
		}
		if (schema->getTableId("it_p") >= 0) {
			relOrder[schema->getTableId("it_p")] = 0;
		}
		//relOrder[10] = 0;
		//relOrder[11] = 0;
		//relOrder[12] = 0;
		//link_type 6
		if (schema->getTableId("lt") >= 0) {
			relOrder[schema->getTableId("lt")] = 0;
		}
		//relOrder[15] = 0;
		//role_type 7
		if (schema->getTableId("rt") >= 0) {
			relOrder[schema->getTableId("rt")] = 0;
		}
		//relOrder[23] = 0;
		//comp_cast_type 10
		if (schema->getTableId("cct1") >= 0) {
			relOrder[schema->getTableId("cct1")] = 0;
		}
		if (schema->getTableId("cct2") >= 0) {
			relOrder[schema->getTableId("cct2")] = 0;
		}
		//relOrder[4] = 0;
		//relOrder[5] = 0;
		//relOrder[6] = 0;
		//company_type 11
		if (schema->getTableId("ct") >= 0) {
			relOrder[schema->getTableId("ct")] = 0;
		}
		//relOrder[8] = 0;
		//aka_name 12
		if (schema->getTableId("an") >= 0) {
			relOrder[schema->getTableId("an")] = 2;
		}
		//relOrder[0] = 2;
		//aka_tilte 13
		if (schema->getTableId("at") >= 0) {
			relOrder[schema->getTableId("at")] = 2;
		}
		//relOrder[1] = 2;
		//char_name 14
		if (schema->getTableId("chn") >= 0) {
			relOrder[schema->getTableId("chn")] = 0;
		}
		//relOrder[3] = 0;
		//company_name 16
		if (schema->getTableId("cn") >= 0) {
			relOrder[schema->getTableId("cn")] = 1;
		}
		//relOrder[7] = 1;
		//keyword 17
		if (schema->getTableId("k") >= 0) {
			relOrder[schema->getTableId("k")] = 0;
		}
		//relOrder[13] = 0;
		//title 19
		if (schema->getTableId("t") >= 0) {
			relOrder[schema->getTableId("t")] = 1;
		}
		if (schema->getTableId("t2") >= 0) {
			relOrder[schema->getTableId("t2")] = 1;
		}
		//relOrder[24] = 1;
		//relOrder[25] = 1;
		//relOrder[26] = 1;
		//name 20
		if (schema->getTableId("n") >= 0) {
			relOrder[schema->getTableId("n")] = 1;
		}
		//relOrder[21] = 1;
		//person_info 21
		if (schema->getTableId("pi") >= 0) {
			relOrder[schema->getTableId("pi")] = 2;
		}
		//relOrder[22] = 2;
		//movie companies 23
		if (schema->getTableId("mc") >= 0) {
			relOrder[schema->getTableId("mc")] = 2;
		}
		//relOrder[16] = 2;
		//movie_info 24
		if (schema->getTableId("mi") >= 0) {
			relOrder[schema->getTableId("mi")] = 2;
		}
		//relOrder[17] = 2;
		//movie_info_idx 26
		if (schema->getTableId("midx") >= 0) {
			relOrder[schema->getTableId("midx")] = 2;
		}
		//relOrder[18] = 2;
		//movie link 27
		if (schema->getTableId("ml") >= 0) {
			relOrder[schema->getTableId("ml")] = 2;
		}
		//relOrder[20] = 2;
		//movie keyword 28
		if (schema->getTableId("mk") >= 0) {
			relOrder[schema->getTableId("mk")] = 2;
		}
		//relOrder[19] = 2;
		//complete_cast 29 
		if (schema->getTableId("cc") >= 0) {
			relOrder[schema->getTableId("cc")] = 2;
		}
		//relOrder[9] = 2;
		//cast_info 30
		if (schema->getTableId("ci") >= 0) {
			relOrder[schema->getTableId("ci")] = 3;
		}
		//relOrder[2] = 2;
		*/

		/*
		//Batch 2
		//kind_type 2
		if (schema->getTableId("kt") >= 0) {
			relOrder[schema->getTableId("kt")] = 0;
		}
		//relOrder[13] = 0;
		//info_type 5
		if (schema->getTableId("it") >= 0) {
			relOrder[schema->getTableId("it")] = 0;
		}
		if (schema->getTableId("it_idx") >= 0) {
			relOrder[schema->getTableId("it_idx")] = 0;
		}
		if (schema->getTableId("it_p") >= 0) {
			relOrder[schema->getTableId("it_p")] = 0;
		}
		//relOrder[9] = 0;
		//relOrder[10] = 0;
		//relOrder[11] = 0;
		//link_type 6
		if (schema->getTableId("lt") >= 0) {
			relOrder[schema->getTableId("lt")] = 0;
		}
		//relOrder[14] = 0;
		//role_type 7
		if (schema->getTableId("rt") >= 0) {
			relOrder[schema->getTableId("rt")] = 0;
		}
		//relOrder[22] = 0;
		//comp_cast_type 10
		if (schema->getTableId("cct1") >= 0) {
			relOrder[schema->getTableId("cct1")] = 0;
		}
		if (schema->getTableId("cct2") >= 0) {
			relOrder[schema->getTableId("cct2")] = 0;
		}
		//relOrder[3] = 0;
		//relOrder[4] = 0;
		//relOrder[5] = 0;
		//company_type 11
		if (schema->getTableId("ct") >= 0) {
			relOrder[schema->getTableId("ct")] = 0;
		}
		//relOrder[7] = 0;
		//aka_name 12
		if (schema->getTableId("an") >= 0) {
			relOrder[schema->getTableId("an")] = 1;
		}
		//relOrder[0] = 1;
		//char_name 14
		if (schema->getTableId("chn") >= 0) {
			relOrder[schema->getTableId("chn")] = 0;
		}
		//relOrder[2] = 0;
		//company_name 16
		if (schema->getTableId("cn") >= 0) {
			relOrder[schema->getTableId("cn")] = 1;
		}
		//relOrder[6] = 1;
		//keyword 17
		if (schema->getTableId("k") >= 0) {
			relOrder[schema->getTableId("k")] = 0;
		}
		//relOrder[12] = 0;
		//title 19
		if (schema->getTableId("t") >= 0) {
			relOrder[schema->getTableId("t")] = 1;
		}
		if (schema->getTableId("t2") >= 0) {
			relOrder[schema->getTableId("t2")] = 1;
		}
		if (schema->getTableId("t3") >= 0) {
			relOrder[schema->getTableId("t3")] = 1;
		}
		//relOrder[23] = 1;
		//relOrder[24] = 1;
		//relOrder[25] = 1;
		//name 20
		if (schema->getTableId("n") >= 0) {
			relOrder[schema->getTableId("n")] = 1;
		}
		//relOrder[20] = 1;
		//person_info 21
		if (schema->getTableId("pi") >= 0) {
			relOrder[schema->getTableId("pi")] = 2;
		}
		//relOrder[21] = 2;
		//movie companies 23
		if (schema->getTableId("mc") >= 0) {
			relOrder[schema->getTableId("mc")] = 2;
		}
		//relOrder[15] = 2;
		//movie_info 24
		if (schema->getTableId("mi") >= 0) {
			relOrder[schema->getTableId("mi")] = 2;
		}
		//relOrder[16] = 2;
		//movie_info_idx 26
		if (schema->getTableId("midx") >= 0) {
			relOrder[schema->getTableId("midx")] = 2;
		}
		//relOrder[17] = 2;
		//movie link 27
		if (schema->getTableId("ml") >= 0) {
			relOrder[schema->getTableId("ml")] = 2;
		}
		if (schema->getTableId("ml3") >= 0) {
			relOrder[schema->getTableId("ml3")] = 2;
		}
		//relOrder[19] = 2;
		//movie keyword 28
		if (schema->getTableId("mk") >= 0) {
			relOrder[schema->getTableId("mk")] = 2;
		}
		//relOrder[18] = 2;
		//complete_cast 29 
		if (schema->getTableId("cc") >= 0) {
			relOrder[schema->getTableId("cc")] = 2;
		}
		//relOrder[8] = 2;
		//cast_info 30
		if (schema->getTableId("ci") >= 0) {
			relOrder[schema->getTableId("ci")] = 3;
		}
		//relOrder[1] = 2;
		*/

		
		//Batch 1
		//kind_type 2
		if (schema->getTableId("kt") >= 0) {
			relOrder[schema->getTableId("kt")] = 0;
		}
		if (schema->getTableId("kt2") >= 0) {
			relOrder[schema->getTableId("kt2")] = 0;
		}
		//relOrder[15] = 0;
		//relOrder[16] = 0;
		//info_type 5
		if (schema->getTableId("it") >= 0) {
			relOrder[schema->getTableId("it")] = 0;
		}
		if (schema->getTableId("it_idx") >= 0) {
			relOrder[schema->getTableId("it_idx")] = 0;
		}
		if (schema->getTableId("it_p") >= 0) {
			relOrder[schema->getTableId("it_p")] = 0;
		}
		//relOrder[11] = 0;
		//relOrder[12] = 0;
		//relOrder[13] = 0;
		//link_type 6
		if (schema->getTableId("lt") >= 0) {
			relOrder[schema->getTableId("lt")] = 0;
		}
		//relOrder[17] = 0;
		//role_type 7
		if (schema->getTableId("rt") >= 0) {
			relOrder[schema->getTableId("rt")] = 0;
		}
		//relOrder[27] = 0;
		//comp_cast_type 10
		if (schema->getTableId("cct1") >= 0) {
			relOrder[schema->getTableId("cct1")] = 0;
		}
		if (schema->getTableId("cct2") >= 0) {
			relOrder[schema->getTableId("cct2")] = 0;
		}
		//relOrder[4] = 0;
		//relOrder[5] = 0;
		//relOrder[6] = 0;
		//company_type 11
		if (schema->getTableId("ct") >= 0) {
			relOrder[schema->getTableId("ct")] = 0;
		}
		//relOrder[9] = 0;
		//aka_name 12
		if (schema->getTableId("an") >= 0) {
			relOrder[schema->getTableId("an")] = 1;
		}
		//relOrder[0] = 1;
		//aka_title 12
		if (schema->getTableId("at") >= 0) {
			relOrder[schema->getTableId("at")] = 1;
		}
		//relOrder[1] = 1;
		//char_name 14
		if (schema->getTableId("chn") >= 0) {
			relOrder[schema->getTableId("chn")] = 0;
		}
		//relOrder[3] = 0;
		//company_name 16
		if (schema->getTableId("cn") >= 0) {
			relOrder[schema->getTableId("cn")] = 1;
		}
		//relOrder[7] = 1;
		//company_name2 16
		if (schema->getTableId("cn2") >= 0) {
			relOrder[schema->getTableId("cn2")] = 1;
		}
		//relOrder[8] = 1;
		//keyword 17
		if (schema->getTableId("k") >= 0) {
			relOrder[schema->getTableId("k")] = 0;
		}
		//relOrder[14] = 0;
		//title 19
		if (schema->getTableId("t") >= 0) {
			relOrder[schema->getTableId("t")] = 1;
		}
		if (schema->getTableId("t2") >= 0) {
			relOrder[schema->getTableId("t2")] = 1;
		}
		//relOrder[28] = 1;
		//relOrder[29] = 1;
		//relOrder[30] = 1;
		//name 20
		if (schema->getTableId("n") >= 0) {
			relOrder[schema->getTableId("n")] = 1;
		}
		//relOrder[25] = 1;
		//person_info 21
		if (schema->getTableId("pi") >= 0) {
			relOrder[schema->getTableId("pi")] = 2;
		}
		//relOrder[26] = 2;
		//movie companies 23
		if (schema->getTableId("mc") >= 0) {
			relOrder[schema->getTableId("mc")] = 2;
		}
		if (schema->getTableId("mc2") >= 0) {
			relOrder[schema->getTableId("mc2")] = 2;
		}
		//relOrder[18] = 2;
		//relOrder[19] = 2;
		//movie_info 24
		if (schema->getTableId("mi") >= 0) {
			relOrder[schema->getTableId("mi")] = 2;
		}
		//relOrder[20] = 2;
		//movie_info_idx 26
		if (schema->getTableId("midx") >= 0) {
			relOrder[schema->getTableId("midx")] = 2;
		}
		if (schema->getTableId("midx2") >= 0) {
			relOrder[schema->getTableId("midx2")] = 2;
		}
		//relOrder[21] = 2;
		//relOrder[22] = 2;
		//movie link 27
		if (schema->getTableId("ml") >= 0) {
			relOrder[schema->getTableId("ml")] = 2;
		}
		//relOrder[24] = 2;
		//movie keyword 28
		if (schema->getTableId("mk") >= 0) {
			relOrder[schema->getTableId("mk")] = 2;
		}
		//relOrder[23] = 2;
		//complete_cast 29 
		if (schema->getTableId("cc") >= 0) {
			relOrder[schema->getTableId("cc")] = 1;
		}
		//relOrder[10] = 1;
		//cast_info 30
		if (schema->getTableId("ci") >= 0) {
			relOrder[schema->getTableId("ci")] = 3;
		}
		//relOrder[2] = 2;
		

		/*
		int lvl = 0;
		//11 relations
		bool l1 = false;
		if (schema->getTableId("d") >= 0) {
			relOrder[schema->getTableId("d")] = lvl;
			l1 = true;
		}
		if (schema->getTableId("d_cr") >= 0) {
			relOrder[schema->getTableId("d_cr")] = lvl;
			l1 = true;
		}
		if (schema->getTableId("d_cs") >= 0) {
			relOrder[schema->getTableId("d_cs")] = lvl;
			l1 = true;
		}
		if (schema->getTableId("d_inv") >= 0) {
			relOrder[schema->getTableId("d_inv")] = lvl;
			l1 = true;
		}
		if (schema->getTableId("d_sr") >= 0) {
			relOrder[schema->getTableId("d_sr")] = lvl;
			l1 = true;
		}
		if (schema->getTableId("d_ss") >= 0) {
			relOrder[schema->getTableId("d_ss")] = lvl;
			l1 = true;
		}
		if (schema->getTableId("d_ws") >= 0) {
			relOrder[schema->getTableId("d_ws")] = lvl;
			l1 = true;
		}
		if (schema->getTableId("t") >= 0) {
			relOrder[schema->getTableId("t")] = lvl;
			l1 = true;
		}
		
		if (schema->getTableId("cd") >= 0) {
			relOrder[schema->getTableId("cd")] = lvl;
			l1 = true;
		}

		if (schema->getTableId("cd_c") >= 0) {
			relOrder[schema->getTableId("cd_c")] = lvl;
			l1 = true;
		}

		if (schema->getTableId("ib") >= 0) {
			relOrder[schema->getTableId("ib")] = lvl;
			l1 = true;
		}

		if (schema->getTableId("hd") >= 0) {
			relOrder[schema->getTableId("hd")] = lvl;
			l1 = true;
		}

		if (schema->getTableId("hd1") >= 0) {
			relOrder[schema->getTableId("hd1")] = lvl;
			l1 = true;
		}

		if (schema->getTableId("cd1") >= 0) {
			relOrder[schema->getTableId("cd1")] = lvl;
			l1 = true;
		}

		if (schema->getTableId("w") >= 0) {
			relOrder[schema->getTableId("w")] = lvl;
			l1 = true;
		}
		if (schema->getTableId("sm") >= 0) {
			relOrder[schema->getTableId("sm")] = lvl;
			l1 = true;
		}

		if (schema->getTableId("a") >= 0) {
			relOrder[schema->getTableId("a")] = lvl;
			l1 = true;
		}
		//relOrder[schema->getTableId("a1")] = 0;

		//4 relations
		//they can join with date
		if (schema->getTableId("cc") >= 0) {
			relOrder[schema->getTableId("cc")] = lvl;
			l1 = true;
		}
		if (schema->getTableId("wp") >= 0) {
			relOrder[schema->getTableId("wp")] = lvl;
			l1 = true;
		}
		if (schema->getTableId("wsi") >= 0) {
			relOrder[schema->getTableId("wsi")] = lvl;
			l1 = true;
		}
		if (schema->getTableId("s") >= 0) {
			relOrder[schema->getTableId("s")] = lvl;
			l1 = true;
		}

		//1 relation
		//can join with both date and item
		if (schema->getTableId("p") >= 0) {
			relOrder[schema->getTableId("p")] = lvl;
			l1 = true;
		}

		if (l1) lvl++;

		//1 relation
		bool l2 = false;
		if (schema->getTableId("i") >= 0) {
			relOrder[schema->getTableId("i")] = lvl;
			l2 = true;
		}

		//1 relation
		if (schema->getTableId("c") >= 0) {
			relOrder[schema->getTableId("c")] = lvl;
			l2 = true;
		}

		if (l2) lvl++;

		//5 relations
		bool l3 = false;
		if (schema->getTableId("ws") >= 0) {
			relOrder[schema->getTableId("ws")] = lvl;
			l3 = true;
		}
		if (schema->getTableId("ss") >= 0) {
			relOrder[schema->getTableId("ss")] = lvl;
			l3 = true;
		}
		if (schema->getTableId("cs") >= 0) {
			relOrder[schema->getTableId("cs")] = lvl;
			l3 = true;
		}
		if (schema->getTableId("cr") >= 0) {
			relOrder[schema->getTableId("cr")] = lvl;
			l3 = true;
		}

		if (schema->getTableId("sr") >= 0) {
			relOrder[schema->getTableId("sr")] = lvl;
			l3 = true;
		}

		if (schema->getTableId("wr") >= 0) {
			relOrder[schema->getTableId("wr")] = lvl;
			l3 = true;
		}

		if (l3) lvl++;

		//1 relation
		if (schema->getTableId("inv") >= 0) {
			relOrder[schema->getTableId("inv")] = lvl;
		}*/
	}

void ParsedQuery::optimizeGraph (Schema* schema) {
	//rules:
	//minimum in neighborhood
	//the smaller ones are filtering it already and are not filtering neighbors
	//at the end, order joins based on cardinality
		
	bool flag = false;

	populateGraph(schema);

	int k = 0;

	optimizePass(schema);

	/*for (int i = 0; i < relNum; i++) {
		relOrder[i] = 0;
	}

	if (schema->getTableId("c") >= 0) {
		relOrder[schema->getTableId("c")] = 1;
	}

	if (schema->getTableId("ss") >= 0) {
		relOrder[schema->getTableId("ss")] = 3;
	}

	setOrders (schema);*/

	//reorderJoins(schema);

	optimizeBuild (schema);

	//printGraph();
}

int* ParsedQuery::getOrdering () {
	return relOrder;
}

void ParsedQuery::makeBase (bool master) {
	for (int i = 0; i < joins->size(); i++) {
		(*joins)[i].id = i;
		if (master)
			(*joins)[i].queries.reset();
	}
}

void ParsedQuery::useAsBase (ParsedQuery& base, int query) {
	for (int i = 0; i < joins->size(); i++) {
		bool flag = false;
		for (int j = 0; j < (base.joins)->size(); j++) {
			if ((*joins)[i].equals((*(base.joins))[j])) {
				(*joins)[i].id = (*(base.joins))[j].id;
				flag = true;
				assert((*joins)[i].id >= 0);
				break;
			}
		}
		assert(flag);
	}

	for (std::map<std::string, std::bitset<MAXQUERIES> >::iterator it = queryMask.begin(); it != queryMask.end(); ++it) {
		std::bitset<MAXQUERIES> q;
		q.reset();
		q.set(query);
		queryMask[it->first] = 0;
		queryMask[it->first].set(query);
	}

	for (int i = 0; i < joins->size(); i++) {
		(*joins)[i].queries.reset();
		(*joins)[i].queries.set(query);
	}

	for (int i = 0; i < filters->size(); i++) {
		(*filters)[i].queries.reset();
		(*filters)[i].queries.set(query);
	}

	(aggrList[0][0]->queries).reset();
	(aggrList[0][0]->queries).set(query);

	std::vector<ParsedAggregate>* aggregates = aggrList[0][0]->aggregates;

	for (int i = 0; i < aggregates->size(); i++) {
		(*aggregates)[i].queries.reset();
		(*aggregates)[i].queries.set(query);
	}
}

void ParsedQuery::print () {
	for (int i = 0; i < joins->size(); i++)
		(*joins)[i].print();

	for (int j = 0; j < aggrList->size(); j++) {
		std::vector<ParsedAggregate>* aggregates = aggrList[0][j]->aggregates;
		for (int i = 0; i < aggregates->size(); i++)
			(*aggregates)[i].print();
	}

	//for (int i = 0; i < filters->size(); i++)
	//	(*filters)[i].expr->print();
}

void ParsedQuery::populateGraph (Schema* schema) {
		relNum = schema->getTableNumber();

		relOffset = new int[relNum+1];
		relOrder = new int[relNum+1];
		relMark = new int[relNum+1];
		relEdges = new int[2*joins->size()];
		relJoins = new int[2*joins->size()];

		for (int i = 0; i < relNum; i++) {
			relOffset[i] = 0;
			relMark[i] = 0;
			relOrder[i] = 0;
		}

		for (int i = 0; i < joins->size(); i++) {
			int leftId = schema->getTableId((*joins)[i].left.table);
			(relOffset[leftId])++;
			int rightId = schema->getTableId((*joins)[i].right.table);
			(relOffset[rightId])++;
		}

		int suffix = 0;
		for (int i = 0; i < relNum; i++) {
			suffix += relOffset[i];
			relOffset[i] = suffix;
		}
		relOffset[relNum] = 2*joins->size();

		for (int i = 0; i < joins->size(); i++) {
			int leftId = schema->getTableId((*joins)[i].left.table);
			(relOffset[leftId])--;

			int rightId = schema->getTableId((*joins)[i].right.table);
			(relOffset[rightId])--;

			relEdges[relOffset[leftId]] = rightId;
			relEdges[relOffset[rightId]] = leftId;

			relJoins[relOffset[leftId]] = i;
			relJoins[relOffset[rightId]] = i;
		}

		std::map<int, float> reductionQueries;

		for (std::map<std::string, std::bitset<MAXQUERIES> >::iterator it = queryMask.begin(); it != queryMask.end(); ++it) {
			int table = schema->getTableId(it->first);
			std::bitset<MAXQUERIES>  q = it->second;
			for (int j = 0; j < MAXQUERIES; j++)
				if (q.test(j))
					reductionQueries[table*MAXQUERIES+j] = 1.0;
		}

		for (int i = 0; i < filters->size(); i++) {
			int table = filters[0][i].expr->getTable(schema);

			if (table == -1)
				continue;

			float sel = 1.0;

			for (int j = 0; j < 1; j++) {
				float sellocal = 1.0;

				sellocal = 0.1;

				sel = sel*(1-sellocal);
			}

			sel = 1.0-sel;

			int q = -1;
			for (int j = 0; j < MAXQUERIES; j++) {
				if ((*filters)[i].queries.test(j) && (*filters)[i].queries.count() == 1)
					q = j;
			}

			//std::cout << "filter " << i << " " << q << std::endl;

			if (reductionQueries.find(table*MAXQUERIES+q) == reductionQueries.end())
				reductionQueries[table*MAXQUERIES+q] = 1.0;

			reductionQueries[table*MAXQUERIES+q] = sel*reductionQueries[table*MAXQUERIES+q];
		}



		for (int i = 0; i < relNum; i++) {
			float sel = 1.0;
			bool flag = false;

			for (int j = 0; j < MAXQUERIES; j++) {
				if (reductionQueries.find(i*MAXQUERIES+j) != reductionQueries.end()) {
					float sellocal = reductionQueries[i*MAXQUERIES+j];
					sel = sel*(1.0-sellocal);
					flag = true;
				}
			}

			if (flag)
				reduction[i] = 1.0-sel;
			else
				reduction[i] = 1.0;
		}
	}

	bool ParsedQuery::optimizePass (Schema* schema) {
		//rules:
		//minimum in neighborhood
		//the smaller ones are filtering it already and are not filtering neighbors
		//at the end, order joins based on cardinality
		schema->createStatistics();

		std::bitset<MAXQUERIES> q;

		for (int i = 0; i < relNum; i++) {
			relOrder[i] = 0;
			if (queryMask.find(schema->getTableString(i)) != queryMask.end())
				q |= queryMask[schema->getTableString(i)];
		}

		int queryNum = q.count();
		StatisticsVector*** stats = new StatisticsVector**[relNum];

		for (int i = 0; i < relNum; i++) {
			stats[i] = new StatisticsVector*[queryNum];

			for (int j = 0; j < queryNum; j++) {
				stats[i][j] = new StatisticsVector(*(schema->getStatistics(i)));
			}
		}

		for (int i = 0; i < filters->size(); i++) {
			int table = filters[0][i].expr->getTable(schema);

			assert(table >= 0);

			for (int j = 0; j < queryNum; j++)
				if ((filters[0][i].queries).test(j)) {
					filters[0][i].expr->updateStatistics(schema, stats[table][j]);
				}
		}

		std::map<int, bool> selected;

		int rank = 0;

		while (true) {
			std::map<int, uint64_t> cardinality;

			for (int i = 0; i < relNum; i++) {
				double invsel = 1.0;

				for (int j = 0; j < queryNum; j++) {
					invsel *= 1.0 - stats[i][j]->cardinality/((double) schema->getRowCount(i));
				}

				cardinality[i] = (1.0-invsel)*schema->getRowCount(i);
			}

			std::map<int, bool> candidates;

			for (int i = 0; i < relNum; i++) {
				if (selected.find(i) == selected.end()) {
					bool flag = true;

					for (int j = relOffset[i]; j < relOffset[i+1]; j++) {
						int neighbor = relEdges[j];

						if (selected.find(neighbor) == selected.end() && cardinality[i] > cardinality[neighbor]) {
							flag = false;
							break;
						}
					}

					if (flag) {
						candidates[i] = true;
					}
				}
			}

			if (candidates.size() == 0) {
				break;
			}

			for (auto& it : candidates) {
				relOrder[it.first] = rank;
				selected[it.first] = true;
			}

			rank++;
		}

		return true;
	}

	void ParsedQuery::optimizeBuild (Schema* schema) {
		for (int i = 0; i < joins->size(); i++) {
			int leftId = schema->getTableId((*joins)[i].left.table);
			int rightId = schema->getTableId((*joins)[i].right.table);

			int leftKey = schema->getColumnId((*joins)[i].left.table, (*joins)[i].left.key);
			int rightKey = schema->getColumnId((*joins)[i].right.table, (*joins)[i].right.key);

			if ((relOrder[leftId] > relOrder[rightId] && atoi((*joins)[i].right.key.c_str()) == 0 && schema->getPermission(leftKey)) 
				|| (relOrder[leftId] < relOrder[rightId] && atoi((*joins)[i].left.key.c_str()) == 0 && schema->getPermission(rightKey)) ) {
				
				(*joins)[i].type = 0;
			} else {
				(*joins)[i].type = 1;
			}
		}
	}


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

#ifndef PLANNER_H_
#define PLANNER_H_

#include "../frontend/parser.h"
#include "../frontend/schema.h"
#include "../roulette-operators/projector.h"
#include "../expressions/evaluators.h"
#include "../primitives/atomic-stack.h"
#include "../executor/graph.h"
#include "../executor/sym-join.h"
#include "../dictionary/dictionary.h"
#include "../ingestion/ingestion.h"
#include "../roulette-operators/filter.h"
#include "../executor/executor.h"

#include "../utilities/common.h"
#include <numa.h>

#include <unistd.h>
#include <fcntl.h>
#include <ctime>
#include <climits>
#include <utility>

#define NUMPARTS 4096


class Planner {
	const int relationNum;
	const int numthreads;

	Schema* const schema_;

	AtomicStack<DataBlock> dallocator;
	std::atomic_flag dallocator_lock_;

	void expressionGenerator(const ParsedQuery& pquery, ParsedAttribute attr, Evaluator*& expr, bool& base) {
		std::vector<ParsedExpression>& pexpr = *(pquery.expressions);

		for (int i = 0; i < pexpr.size(); i++) {
			if (attr.equals(pexpr[i].res)) {
				Evaluator* left;
				Evaluator* right;

				bool baseRec;

				expressionGenerator(pquery, pexpr[i].first, left, baseRec);
				expressionGenerator(pquery, pexpr[i].second, right, baseRec);

				base = false;

				if (pexpr[i].op.compare("*") == 0) {
					expr = new MULEvaluator(left, right);
				} else if (pexpr[i].op.compare("+") == 0) {
					expr = new ADDEvaluator(left, right);
				} else if (pexpr[i].op.compare("-") == 0) {
					expr = new SUBEvaluator(left, right);
				} else
					assert(false);

				return;
			}
		}

		int key = schema_->getFieldNumber(attr.table, attr.key);
		int table = schema_->getColumnParent(key);

		base = true;
		expr = new AttributeEvaluator(schema_, new DataInt(), key);
	}

	/*parse aggregate structures*/
	void parseAggregates (Executor* ctx, const ParsedQuery& pquery) {
		const std::vector<ParsedAggregateList*>& paggrList = *(pquery.aggrList);

		for (int j = 0; j < paggrList.size(); j++) {
			const std::vector<ParsedAggregate>& aggregates = *(paggrList[j]->aggregates);
		
			if (paggrList[j]->grouping->size() > 0) {
				assert(false);
				int limit = paggrList[j]->limit;
				std::bitset<MAXQUERIES>  queries = paggrList[j]->queries;
				Evaluator* expr = nullptr;

				std::vector<int> keys;
				std::vector<Dictionary*> dicts;

				std::vector<int*> valsData;
				std::vector<int*> keysData;

				for (int i = 0; i < paggrList[j]->grouping->size(); i++) {
					keys.push_back(schema_->getFieldNumber(paggrList[j]->grouping[0][i].table, paggrList[j]->grouping[0][i].key));
					if (schema_->hasDictionary(paggrList[j]->grouping[0][i].table, paggrList[j]->grouping[0][i].key))
						dicts.push_back(schema_->getDictionary(paggrList[j]->grouping[0][i].table, paggrList[j]->grouping[0][i].key));
					else
						dicts.push_back(nullptr);
					keysData.push_back(nullptr);
				}

				std::vector<int> ordering;

				for (int i = 0; i < paggrList[j]->ordering->size(); i++) {
					ordering.push_back(schema_->getFieldNumber(paggrList[j]->ordering[0][i].table, paggrList[j]->ordering[0][i].key)); 
				}


				std::vector<Evaluator*> vals;
				std::vector<std::string> ops;
				std::map<int, int> outrel;
				std::vector<std::pair<int, int*> > having_conds;

				int lastalias = -1;

				for (int i = 0; i < paggrList[j]->aggregates->size(); i++) {
					ParsedAttribute pa = (*(paggrList[j]->aggregates))[i].attr;
					int key = schema_->getFieldNumber(pa.table, pa.key);
					int table = schema_->getColumnParent(key);

					ParsedAttribute pas = (*(paggrList[j]->aggregates))[i].as;
					int newkey = schema_->getFieldNumber(pas.table, pas.key);
					int newtable = schema_->getColumnParent(newkey);

					outrel[newtable] = 1;
					lastalias = newtable;

					if ((*(paggrList[j]->aggregates))[i].op.compare("project") == 0) {
						for (int k = 0; k < paggrList[j]->grouping->size(); k++) {
							if (pa.table.compare(paggrList[j]->grouping[0][k].table) == 0 &&
								pa.key.compare(paggrList[j]->grouping[0][k].key) == 0) {
								int curkey = schema_->getFieldNumber(paggrList[j]->grouping[0][k].table, paggrList[j]->grouping[0][k].key);

								int* outData = (int*) schema_->getColumnData(newkey);

								keysData[k] = outData;
							}
						}
					} else {
						Evaluator* attr = new AttributeEvaluator(schema_, new DataInt(), key);

						vals.push_back(attr);
						ops.push_back((*(paggrList[j]->aggregates))[i].op);

						int* outData = (int*) schema_->getColumnData(newkey);

						valsData.push_back(outData);
					}

					if ((*(paggrList[j]->aggregates))[i].having_type.compare("None") != 0) {
						if ((*(paggrList[j]->aggregates))[i].having_type.compare("const") == 0) {
							int* mem = (int*) numa_alloc_onnode(sizeof(int), SOCKET);
							*mem = atoi((*(paggrList[j]->aggregates))[i].having_val.c_str());

							std::pair<int, int*> p(newkey, mem);
							having_conds.push_back(p);
						} else if ((*(paggrList[j]->aggregates))[i].having_type.compare("result") == 0) {
							std::string cond_attr("0");
							int cond_key = schema_->getFieldNumber((*(paggrList[j]->aggregates))[i].having_val, cond_attr);
							int* mem = (int*) schema_->getColumnData(cond_key);

							std::pair<int, int*> p(newkey, mem);
							having_conds.push_back(p);
						} else {
							assert(false);
						}
					}
				}

				if (outrel.size() > 1) {
					

					assert(false);
				}

				expr = new GROUPBYEvaluator2 (schema_, vals, valsData, ops, keys, keysData, dicts, having_conds, ordering, limit, lastalias, numthreads, queries);

				for (int j = 0; j < MAXQUERIES; j++) {
					if (queries.test(j)) {
						assert(j < MAXQUERIES);
						if (((ctx->qs).aggrs)[j] == nullptr)
							((ctx->qs).aggrs)[j] = new std::vector<Evaluator*>();

						((ctx->qs).aggrs)[j]->push_back(expr);
					}
				}
			} else {
				for (int i = 0; i < aggregates.size(); i++) {
					const ParsedAggregate& paggr = aggregates[i];

					std::bitset<MAXQUERIES>  queries = paggr.queries;
					Evaluator* expr = nullptr;

					int queryId = -1;

					for (int q = 0; q < MAXQUERIES; q++) {
						if (queries.test(q)) {
							assert(queryId == -1);
							queryId = q;
						}
					}

					assert(queryId >= 0);

					int key = schema_->getFieldNumber(paggr.attr.table, paggr.attr.key);
					int table = schema_->getColumnParent(key);

					Evaluator* attr = new AttributeEvaluator(schema_, new DataInt(), key);
					bool base = true;

					expressionGenerator(pquery, paggr.attr, attr, base);

					//int askey = schema_->getFieldNumber(paggr.as.table, paggr.as.key);
					//int astable = schema_->getColumnParent(askey);

					//int* outData = (int*) schema_->getColumnData(askey);

					if (paggr.op.compare("count") == 0) {
						//expr = new COUNTEvaluator(attr, outData, new DataInt(), numthreads, queries);
						(ctx->qs).partitioner->addAggregation(queryId, "count", key);
					} else if (paggr.op.compare("sum") == 0) {
						//expr = new SUMEvaluator(attr, outData, new DataInt(), numthreads, queries);
						(ctx->qs).partitioner->addAggregation(queryId, "sum", key);
					} else if (paggr.op.compare("min") == 0) {
						//MINEvaluator* mexpr = new MINEvaluator(attr, outData, new DataInt(), numthreads, queries);
						//if (base && schema_->hasDictionary(paggr.attr.table, paggr.attr.key))
						//	mexpr->registerDictionary(schema_->getDictionary(paggr.attr.table, paggr.attr.key));
						//expr = mexpr;
						(ctx->qs).partitioner->addAggregation(queryId, "min", key);
					} else if (paggr.op.compare("max") == 0) {
						//MAXEvaluator* mexpr = new MAXEvaluator(attr, outData, new DataInt(), numthreads, queries);
						//if (base && schema_->hasDictionary(paggr.attr.table, paggr.attr.key))
						//	mexpr->registerDictionary(schema_->getDictionary(paggr.attr.table, paggr.attr.key));
						//expr = mexpr;
						(ctx->qs).partitioner->addAggregation(queryId, "max", key);
					} else if (paggr.op.compare("avg") == 0) {
						//expr = new AVGEvaluator(attr, outData, new DataInt(), numthreads, queries);
						assert(false);
					} else
						assert(false);

					for (int j = 0; j < MAXQUERIES; j++) {
						if (queries.test(j)) {
							assert(j < MAXQUERIES);
							if (((ctx->qs).aggrs)[j] == nullptr)
								((ctx->qs).aggrs)[j] = new std::vector<Evaluator*>();
							((ctx->qs).aggrs)[j]->push_back(expr);
						}
					}
				}
			}
		}
			
	}

	/*parse joins to create pruning semi-joins*/
	void parseJoinFilters (Executor* ctx, const std::vector<ParsedJoin> predicates, const std::map<std::string, std::bitset<MAXQUERIES>>& queryMask, int* ordering) {
		for (int i = 0; i < predicates.size(); i++) {
			const ParsedJoin& pjoin = predicates[i];

			if (pjoin.type <= 0) {
				int leftKey = schema_->getFieldNumber(pjoin.left.table, pjoin.left.key);
				int leftTable = schema_->getColumnParent(leftKey);

				int rightKey = schema_->getFieldNumber(pjoin.right.table, pjoin.right.key);
				int rightTable = schema_->getColumnParent(rightKey);

				if (ordering[leftTable] > ordering[rightTable]) {
					assert(rightTable < relationNum);
					FilterJoinEvaluator* expr = new FilterJoinEvaluator (schema_, (ctx->hashtables_)[rightTable], pjoin.id, pjoin.queries);

					if ((ctx->qs).filterArray[leftTable] == nullptr) {
						(ctx->qs).filterArray[leftTable] = new std::vector<Filter*>();
					}

					((ctx->qs).filterArray[leftTable])->push_back(new JoinFilter(expr));

				} else if (ordering[leftTable] < ordering[rightTable]) {
					assert(leftTable < relationNum);
					FilterJoinEvaluator* expr = new FilterJoinEvaluator (schema_, (ctx->hashtables_)[leftTable], pjoin.id, pjoin.queries);

					if ((ctx->qs).filterArray[rightTable] == nullptr) {
						(ctx->qs).filterArray[rightTable] = new std::vector<Filter*>();
					}

					((ctx->qs).filterArray[rightTable])->push_back(new JoinFilter(expr));

				}
			}
		}
	}

	/*parse consumer filters*/
	void parsePostFilters (Executor* ctx, const ParsedQuery& pquery) {
		const std::vector<ExpressionWrapper>& filters = *(pquery.postfilters);
		const std::map<std::string, std::bitset<MAXQUERIES>>& queryMask = pquery.queryMask;

		for (int i = 0; i < filters.size(); i++) {
			ExpressionVisitor ev(schema_);

			Evaluator* cond = filters[i].expr->accept(&ev, filters[i].queries);
			uint64_t filterTables = cond->getTableSet();

			PostFilterWrapper pfw;

			pfw.expr = cond;
			pfw.tables = filterTables;
			pfw.queries = filters[i].queries;


			for (int j = 0; j < MAXQUERIES; j++) {
				if (filters[i].queries.test(j)) {
					assert(j < MAXQUERIES);
					if (((ctx->qs).postFilters)[j] == nullptr)
						((ctx->qs).postFilters)[j] = new std::vector<PostFilterWrapper>();
					((ctx->qs).postFilters)[j]->push_back(pfw);
				}
			}
		}
	}

	/*parse filters to add to selection phase*/
	void parseFilters (Executor* ctx, const ParsedQuery& pquery, int* ordering) {
		const std::vector<ParsedJoin>& predicates = *(pquery.joins);
		const std::vector<ExpressionWrapper>& filters = *(pquery.filters);
		const std::map<std::string, std::bitset<MAXQUERIES>>& queryMask = pquery.queryMask;

		std::vector<Evaluator*>** filterExpr_;

		/*init data structure for accummulating filters*/
		PolyFilter** filterAggr = new PolyFilter*[schema_->getTotalFieldNumber()];
		for (int i = 0; i < schema_->getTotalFieldNumber(); i++)
			filterAggr[i] = nullptr;

		/*create explicit filters per query*/
		for (int i = 0; i < filters.size(); i++) {
			const ExpressionWrapper& pfilter = filters[i];

			if (pfilter.expr->isComplex() < 0 && (pfilter.expr->type()).compare("q28") != 0) {
				ConstComparisonExpression* ccexpr = (ConstComparisonExpression*) pfilter.expr;
				AttributeExpression* aexpr = (AttributeExpression*) ccexpr->getLHS();
				ConstExpression* cexpr = (ConstExpression*) ccexpr->getRHS();

				int key = schema_->getFieldNumber(aexpr->getRelation(), aexpr->getName());
				int table = schema_->getColumnParent(key); 

				PolyFilter* filter;

				if (filterAggr[key] == nullptr) {
					filter = new PolyFilter(schema_, key);
				} else {

					filter = filterAggr[key];
				}

				int* val;
				Dictionary* dict = nullptr;
				std::string op = ccexpr->getOp();

				if (schema_->hasDictionary(aexpr->getRelation(), aexpr->getName())) {
					dict = schema_->getDictionary(aexpr->getRelation(), aexpr->getName());
					val = (int*) malloc(sizeof(int));
					if (op.compare("LIKE") == 0 || 
						op.compare("NLIKE") == 0 || 
						op.compare("ISNULL") == 0 || 
						op.compare("ISNOTNULL") == 0 || 
						op.compare("IN") == 0 || 
						op.compare("LIKEOR") == 0 || 
						op.compare("LIKEAND") == 0) {
						//val = nullptr;
					} else {
						*val = dict->mapDictionary(cexpr->getValue());
					}
				} else {
					val = (int*) malloc(sizeof(int));
					*val = atoi(cexpr->getValue().c_str());
				}
				

				if (op.compare("LT") == 0) {
					filter->addLt(*val, pfilter.queries);
				} else if (op.compare("LE") == 0) {
					filter->addLe(*val, pfilter.queries);
				} else if (op.compare("GT") == 0) {
					filter->addGt(*val, pfilter.queries);
				} else if (op.compare("GE") == 0) {
					filter->addGe(*val, pfilter.queries);
				} else if (op.compare("EQ") == 0) {
					filter->addEq(*val, pfilter.queries);
				} else if (op.compare("NEQ") == 0) {
					filter->addNeq(*val, pfilter.queries);
				} else if (op.compare("LIKE") == 0) {
					int* lookup = dict->allocateFilter();
					regex_t rex;
					const std::string expr = cexpr->getValue();
					regcomp(&rex, expr.c_str(), REG_NOSUB);
					dict->populateFilter(lookup, &rex, 0, 1);
					filter->addLikeLookup(lookup, pfilter.queries, expr, 0);
				}  else if (op.compare("NLIKE") == 0) {
					int* lookup = dict->allocateFilter();
					regex_t rex;
					const std::string expr = cexpr->getValue();
					regcomp(&rex, expr.c_str(), REG_NOSUB);
					dict->populateFilter(lookup, &rex, 0, 1);
					filter->addNLikeLookup(lookup, pfilter.queries, expr);
				} else if (op.compare("LIKEOR") == 0) {
					int* lookup = dict->allocateFilter();
					const std::string expr = cexpr->getValue();
					dict->populateFiltersOr(lookup, expr, 0, 1);
					filter->addLikeLookup(lookup, pfilter.queries, expr, 1);
				} else if (op.compare("LIKEAND") == 0) {
					int* lookup = dict->allocateFilter();
					const std::string expr = cexpr->getValue();
					dict->populateFiltersAnd(lookup, expr, 0, 1);
					filter->addLikeLookup(lookup, pfilter.queries, expr, 2);
				} else if (op.compare("ISNOTNULL") == 0) {
					*val = -1;
					filter->addNeq(*val, pfilter.queries);
				} else if (op.compare("ISNULL") == 0) {
					*val = -1;
					filter->addEq(*val, pfilter.queries);
				} else if (op.compare("IN") == 0) {
					if (dict != nullptr) {
						int* lookup = dict->allocateFilter();
						const std::string expr = cexpr->getValue();
						dict->populateSet(lookup, expr, 0, 1);
						filter->addLikeLookup(lookup, pfilter.queries, expr, 3);
					} else {
						char line[1024];

						const std::string expr = cexpr->getValue();

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

							*val = atoi(str.c_str());

							filter->addEq(*val, pfilter.queries);

							strcpy(line, expr.c_str());
						}
					}
				} else {
					assert(false);
				}

				filterAggr[key] = filter;
			} else if (false && (pfilter.expr->type()).compare("q28") == 0) {
				Q28Filter* filter = ((Q28Expression*) pfilter.expr)->getFilter(schema_);
				int table = filters[i].expr->getTable(schema_);

				assert(table >= 0);

				if ((ctx->qs).filterArray[table] == nullptr) {
					(ctx->qs).filterArray[table] = new std::vector<Filter*>();
				}

				(ctx->qs).filterArray[table]->push_back(filter);
			} else {
				ExpressionVisitor ev(schema_);

				Evaluator* cond = filters[i].expr->accept(&ev, filters[i].queries);
				int table = filters[i].expr->getTable(schema_);

				assert(table >= 0);

				if ((ctx->qs).filterArray[table] == nullptr) {
					(ctx->qs).filterArray[table] = new std::vector<Filter*>();
				}

				ConjunctiveFilter* filter = new ConjunctiveFilter(cond, filters[i].queries);
				(ctx->qs).filterArray[table]->push_back(filter);
			}
		}

		

		for (int i = 0; i < schema_->getTotalFieldNumber(); i++) {
			if (filterAggr[i] != nullptr) {
				int table = schema_->getColumnParent(i);
				if ((ctx->qs).filterArray[table] == nullptr) {
					(ctx->qs).filterArray[table] = new std::vector<Filter*>();
				}

				(ctx->qs).filterArray[table]->push_back(filterAggr[i]);
				filterAggr[i]->fuseLikeLookups();
			}
		}

		/*generate filters for joins*/
		//parseJoinFilters (ctx, predicates, queryMask, ordering);

		/*put filters in an array to allow heap structure for re-optimization*/
	}

	/*parse join strctures*/
	void parseJoins (Executor* ctx, const ParsedQuery& pquery, int* ordering) {
		std::vector<ParsedJoin>& predicates = *(pquery.joins);

		assert(predicates.size() < MAXOPS);

		std::map<int, std::vector<int>*> keyIndex;
		std::map<int, std::vector<int>*> probeIndex;
		std::map<int, std::vector<int>*> joinIndex;

		std::map<int, std::vector<int>*> mainJoinIndex;
		std::map<int, std::vector<int>*> mainProbeIndex;
		std::map<int, std::vector<int>*> mainKeyIndex;

		std::map<int, std::vector<int>*> secProbeIndex;
		std::map<int, std::vector<int>*> secKeyIndex;
		std::map<int, std::vector<std::string>*> secOpIndex;

		std::map<int, int> satCond1;
		std::map<int, int> noMaterialize;

		for (int i = 0; i < predicates.size(); i++) {
			const ParsedJoin& pjoin = predicates[i];

				int leftKey = schema_->getFieldNumber(pjoin.left.table, pjoin.left.key);
				int leftTable = schema_->getColumnParent(leftKey);

				int rightKey = schema_->getFieldNumber(pjoin.right.table, pjoin.right.key);
				int rightTable = schema_->getColumnParent(rightKey);


				int lowKey = (ordering[leftTable] > ordering[rightTable])? rightKey : leftKey;
				int highKey = (ordering[leftTable] > ordering[rightTable])? leftKey : rightKey;

				int lowTable = (ordering[leftTable] > ordering[rightTable])? rightTable : leftTable;
				int highTable = (ordering[leftTable] > ordering[rightTable])? leftTable : rightTable;

				//condition 1: lowTable only joins with highKey for the queries of the join
				std::bitset<MAXQUERIES> queries = pjoin.queries;
				bool condition1 = true;
				std::map<int, int> visited;
				std::vector<int> border;

				border.push_back(lowTable);

				visited[highTable] = 0;

				while (border.size() > 0) {
					int cur = border[border.size()-1];
					border.pop_back();

					if (visited.find(cur) != visited.end())
						continue;

					visited[cur] = 0;

					if (ordering[cur] >= ordering[highTable]) {
						condition1 = false;
						break;
					}

					for (int j = 0; j < predicates.size(); j++) {
						if (predicates[j].id != pjoin.id && (predicates[j].queries&queries).any()) {
							int leftKey = schema_->getFieldNumber(predicates[j].left.table, predicates[j].left.key);
							int leftTable = schema_->getColumnParent(leftKey);

							int rightKey = schema_->getFieldNumber(predicates[j].right.table, predicates[j].right.key); 
							int rightTable = schema_->getColumnParent(rightKey);

							if (leftTable == cur) {
								border.push_back(rightTable);
							} else if (rightTable == cur) {
								border.push_back(leftTable);
							}
						}
					}
				}

				if (condition1) {
					satCond1[pjoin.id] = 0;
				} else {
				}

		}

		for (int i = 0; i < predicates.size(); i++) {
			const ParsedJoin& pjoin = predicates[i];

				int leftKey = schema_->getFieldNumber(pjoin.left.table, pjoin.left.key);
				int leftTable = schema_->getColumnParent(leftKey);

				int rightKey = schema_->getFieldNumber(pjoin.right.table, pjoin.right.key);
				int rightTable = schema_->getColumnParent(rightKey);


				int lowKey = (ordering[leftTable] > ordering[rightTable])? rightKey : leftKey;
				int highKey = (ordering[leftTable] > ordering[rightTable])? leftKey : rightKey;

				int lowTable = (ordering[leftTable] > ordering[rightTable])? rightTable : leftTable;
				int highTable = (ordering[leftTable] > ordering[rightTable])? leftTable : rightTable;

				//condition 1: lowTable only joins with highKey for the queries of the join


				//condition 2: hightable does not join on highkey in any query
				//possible relaxation: or all the relations that do join are in condition 1
				bool condition2 = true;
				for (int j = 0; j < predicates.size(); j++) {
					if (predicates[j].id != pjoin.id) {
						int leftKey = schema_->getFieldNumber(predicates[j].left.table, predicates[j].left.key);
						int leftTable = schema_->getColumnParent(leftKey);

						int rightKey = schema_->getFieldNumber(predicates[j].right.table, predicates[j].right.key);
						int rightTable = schema_->getColumnParent(rightKey);

						if (leftKey == highKey || rightKey == highKey) {
							int highTable2 = (ordering[leftTable] > ordering[rightTable])? leftTable : rightTable;

							if (satCond1.find(pjoin.id) == satCond1.end() || highTable != highTable2) {
								condition2 = false;
							}
						}
					}
				}

				bool condition1 = false;
				if (satCond1.find(pjoin.id) != satCond1.end()) {
					condition1 = true;
				}

				if (condition1 && condition2) {
					//std::cout << "==================================================" << std::endl;
					//std::cout << "==================================================" << std::endl;
					//std::cout << "==================================================" << std::endl;

					//std::cout << "can avoid materializing " << schema_->getColumnString(highKey) << std::endl;
					//std::cout << schema_->getColumnString(highKey) << " " << schema_->getColumnString(lowKey) << std::endl;

					//std::cout << "==================================================" << std::endl;
					//std::cout << "==================================================" << std::endl;
					//std::cout << "==================================================" << std::endl;

					noMaterialize[highKey] = 0;
				}
		}

		int cnt = 0;

		for (int i = 0; i < predicates.size(); i++) {
			int key1, table1, key2, table2;

			key1 = schema_->getFieldNumber(predicates[i].left.table, predicates[i].left.key);
			table1 = schema_->getColumnParent(key1);

			key2 = schema_->getFieldNumber(predicates[i].right.table, predicates[i].right.key);
			table2 = schema_->getColumnParent(key2);

			if (joinIndex.find(table1) == joinIndex.end()) {
				joinIndex[table1] = new std::vector<int>();
				probeIndex[table1] = new std::vector<int>();
				keyIndex[table1] = new std::vector<int>();
				mainJoinIndex[table1] = new std::vector<int>();
				mainProbeIndex[table1] = new std::vector<int>();
				mainKeyIndex[table1] = new std::vector<int>();
				secProbeIndex[table1] = new std::vector<int>();
				secKeyIndex[table1] = new std::vector<int>();
				secOpIndex[table1] = new std::vector<std::string>();
			}

			if (joinIndex.find(table2) == joinIndex.end()) {
				joinIndex[table2] = new std::vector<int>();
				probeIndex[table2] = new std::vector<int>();
				keyIndex[table2] = new std::vector<int>();
				mainJoinIndex[table2] = new std::vector<int>();
				mainProbeIndex[table2] = new std::vector<int>();
				mainKeyIndex[table2] = new std::vector<int>();
				secProbeIndex[table2] = new std::vector<int>();
				secKeyIndex[table2] = new std::vector<int>();
				secOpIndex[table2] = new std::vector<std::string>();
			}

			assert(predicates[i].thetas.size() <= 1);

			

			if (predicates[i].thetas.size() > 0) {
				assert(false);
				cnt++;
				if (predicates[i].thetas[0].op.compare("gt") == 0) {
					int secKey1 = schema_->getFieldNumber(predicates[i].thetas[0].left.table, predicates[i].thetas[0].left.key);
					int secTable1 = schema_->getColumnParent(secKey1);

					int secKey2 = schema_->getFieldNumber(predicates[i].thetas[0].right.table, predicates[i].thetas[0].right.key);
					int secTable2 = schema_->getColumnParent(secKey2);

					assert(secTable1 == table1 && secTable2 == table2);

					secProbeIndex[table1]->push_back(secKey2);
					secKeyIndex[table1]->push_back(secKey1);

					std::string symop("lt");
					secOpIndex[table1]->push_back(symop);

					secProbeIndex[table2]->push_back(secKey1);
					secKeyIndex[table2]->push_back(secKey2);
					secOpIndex[table2]->push_back(predicates[i].thetas[0].op);

					mainProbeIndex[table1]->push_back(key2);
					mainKeyIndex[table1]->push_back(key1);
					mainJoinIndex[table1]->push_back(predicates[i].id);

					mainProbeIndex[table2]->push_back(key1);
					mainKeyIndex[table2]->push_back(key2);
					mainJoinIndex[table2]->push_back(predicates[i].id);
				} else if (predicates[i].thetas[0].op.compare("lt") == 0) {
					int secKey1 = schema_->getFieldNumber(predicates[i].thetas[0].left.table, predicates[i].thetas[0].left.key);
					int secTable1 = schema_->getColumnParent(secKey1);

					int secKey2 = schema_->getFieldNumber(predicates[i].thetas[0].right.table, predicates[i].thetas[0].right.key);
					int secTable2 = schema_->getColumnParent(secKey2);

					assert(secTable1 == table1 && secTable2 == table2);

					secProbeIndex[table1]->push_back(secKey2);
					secKeyIndex[table1]->push_back(secKey1);

					std::string symop("gt");
					secOpIndex[table1]->push_back(symop);

					secProbeIndex[table2]->push_back(secKey1);
					secKeyIndex[table2]->push_back(secKey2);
					secOpIndex[table2]->push_back(predicates[i].thetas[0].op);

					mainProbeIndex[table1]->push_back(key2);
					mainKeyIndex[table1]->push_back(key1);
					mainJoinIndex[table1]->push_back(predicates[i].id);

					mainProbeIndex[table2]->push_back(key1);
					mainKeyIndex[table2]->push_back(key2);
					mainJoinIndex[table2]->push_back(predicates[i].id);
				} else if (predicates[i].thetas[0].op.compare("eq") == 0) {
					int secKey1 = schema_->getFieldNumber(predicates[i].thetas[0].left.table, predicates[i].thetas[0].left.key);
					int secTable1 = schema_->getColumnParent(secKey1);

					int secKey2 = schema_->getFieldNumber(predicates[i].thetas[0].right.table, predicates[i].thetas[0].right.key);
					int secTable2 = schema_->getColumnParent(secKey2);

					assert(secTable1 == table1 && secTable2 == table2);

					secProbeIndex[table1]->push_back(secKey2);
					secKeyIndex[table1]->push_back(secKey1);

					std::string symop("eq");
					secOpIndex[table1]->push_back(symop);
				
					secProbeIndex[table2]->push_back(secKey1);
					secKeyIndex[table2]->push_back(secKey2);
					secOpIndex[table2]->push_back(predicates[i].thetas[0].op);

					mainProbeIndex[table1]->push_back(key2);
					mainKeyIndex[table1]->push_back(key1);
					mainJoinIndex[table1]->push_back(predicates[i].id);

					mainProbeIndex[table2]->push_back(key1);
					mainKeyIndex[table2]->push_back(key2);
					mainJoinIndex[table2]->push_back(predicates[i].id);

				} else if (predicates[i].thetas[0].op.compare("eq2") == 0) {
					int secKey11, secKey12, secKey21, secKey22;
					sscanf(predicates[i].thetas[0].left.key.c_str(), "%d.%d", &secKey11, &secKey12);
					sscanf(predicates[i].thetas[0].right.key.c_str(), "%d.%d", &secKey21, &secKey22);

					secKey11 = schema_->getFieldNumber(predicates[i].thetas[0].left.table, std::to_string(secKey11));
					int secTable11 = schema_->getColumnParent(secKey11);

					secKey12 = schema_->getFieldNumber(predicates[i].thetas[0].left.table, std::to_string(secKey12));
					int secTable12 = schema_->getColumnParent(secKey12);

					secKey21 = schema_->getFieldNumber(predicates[i].thetas[0].right.table, std::to_string(secKey21));
					int secTable21 = schema_->getColumnParent(secKey21);

					secKey22 = schema_->getFieldNumber(predicates[i].thetas[0].right.table, std::to_string(secKey22));
					int secTable22 = schema_->getColumnParent(secKey22);

					assert(secTable11 == table1 && secTable21 == table2 && secTable12 == table1 && secTable22 == table2);

					assert(secKey11 < 1024 && secKey21 < 1024);

					int secKey1 = secKey11 + 1024*secKey12;
					int secKey2 = secKey21 + 1024*secKey22;



					secProbeIndex[table1]->push_back(secKey2);
					secKeyIndex[table1]->push_back(secKey1);

					std::string symop("eq2");
					secOpIndex[table1]->push_back(symop);
				
					secProbeIndex[table2]->push_back(secKey1);
					secKeyIndex[table2]->push_back(secKey2);
					secOpIndex[table2]->push_back(predicates[i].thetas[0].op);

					mainProbeIndex[table1]->push_back(key2);
					mainKeyIndex[table1]->push_back(key1);
					mainJoinIndex[table1]->push_back(predicates[i].id);

					mainProbeIndex[table2]->push_back(key1);
					mainKeyIndex[table2]->push_back(key2);
					mainJoinIndex[table2]->push_back(predicates[i].id);
				} else {
					assert(false);
				}				
			} else {
				if (noMaterialize.find(key1) == noMaterialize.end()) {
					joinIndex[table1]->push_back(predicates[i].id);
					probeIndex[table1]->push_back(key2);
					keyIndex[table1]->push_back(key1);
				}

				if (noMaterialize.find(key2) == noMaterialize.end()) {
					joinIndex[table2]->push_back(predicates[i].id);
					probeIndex[table2]->push_back(key1);
					keyIndex[table2]->push_back(key2);
				}
			}
		}

		uint64_t htSize = (MEGABUFFER_SIZE+(1 << 20))*sizeof(int);
		int* htArray = (int*) numa_alloc_onnode(htSize, SOCKET);
		memset(htArray, 5, htSize);
		uint64_t maxSizeSum = 0;


		for (int table = 0; table < relationNum; table++) {
			if (keyIndex.find(table) == keyIndex.end())
				continue;

			uint64_t rowCount = schema_->getRowCount(table);

			std::vector<int> keySet;

			for (int i = 0; i < keyIndex[table]->size(); i++) {
				bool found = false;
				for (int j = 0; j < keySet.size(); j++)
					if ((*keyIndex[table])[i] == keySet[j])
						found = true;
				if (!found) {
					keySet.push_back((*keyIndex[table])[i]);
				}
			}

			bool notindexed = true;

			if (notindexed) {
				int hashBits = 23;

				Stem* ht = new(numa_alloc_onnode(sizeof(Stem), SOCKET)) 
					Stem (schema_, htArray, &dallocator, &dallocator_lock_, ctx->versionLock_, (ctx->snapshots_)[table], &(ctx->version_)[table], keySet, table, hashBits, htSize, numthreads);
				
				std::vector<int>* probes = probeIndex[table];
				std::vector<int>* joins = joinIndex[table];
				std::vector<int>* keys = keyIndex[table];
				std::vector<int>* secKeys = secKeyIndex[table];
				std::vector<int>* secProbes = secProbeIndex[table];
				std::vector<std::string>* secOps = secOpIndex[table];

				for (int i = 0; i < probes->size(); i++) {
					ht->registerJoin((*joins)[i], (*keys)[i], (*probes)[i]);
				}

				for (int i = 0; i < secOpIndex[table]->size(); i++) {
					assert(false);
					ht->registerTheta(mainJoinIndex[table][0][i], mainKeyIndex[table][0][i], mainProbeIndex[table][0][i],
						secKeyIndex[table][0][i], secProbeIndex[table][0][i], secOpIndex[table][0][i]);
				}

				(ctx->hashtables_)[table] = ht;

				int tupleSize = ((3*keySet.size()+2)*sizeof(int)+sizeof(std::bitset<MAXQUERIES>))/sizeof(int);
				tupleSize = (tupleSize % 2)? tupleSize + 1 : tupleSize; 

				(ctx->tupleSize)[table] = tupleSize;
			} else {
				assert(false);
			}
		}
	}

	void setAggregateProjection (Projector* projector, const ParsedQuery& pquery, ParsedAttribute attr) {
		std::vector<ParsedExpression>& pexpr = *(pquery.expressions);

		for (int i = 0; i < pexpr.size(); i++) {
			if (attr.equals(pexpr[i].res)) {
				setAggregateProjection(projector, pquery, pexpr[i].first);
				setAggregateProjection(projector, pquery, pexpr[i].second);

				return;
			}
		}

		projector->registerProjections(schema_->getColumnParent(schema_->getFieldNumber(attr.table, attr.key)));
	}

	void setProjections (Executor* ctx, const ParsedQuery& pquery) {
		const std::vector<ParsedAggregateList*>& paggrList = *(pquery.aggrList);
		const std::vector<ExpressionWrapper>& postFilters = *(pquery.postfilters);
		const std::vector<ParsedJoin>& predicates = *(pquery.joins);

		for (int j = 0; j < paggrList.size(); j++) {
			const std::vector<ParsedAggregate>& aggregates = *(paggrList[j]->aggregates);
		
			for (int i = 0; i < aggregates.size(); i++)
				setAggregateProjection((ctx->qs).projector_, pquery, aggregates[i].attr);

			std::vector<ParsedAttribute>& groupkeys = *(paggrList[j]->grouping);

			for (int i = 0; i < groupkeys.size(); i++) {
				setAggregateProjection((ctx->qs).projector_, pquery, groupkeys[i]);
			}
		}

		for (int j = 0; j < postFilters.size(); j++) {
			postFilters[j].expr->registerProjections(schema_, (ctx->qs).projector_);

		}

		for (int i = 0; i < predicates.size(); i++) {
			if (predicates[i].type >= 0) {
				int col1 = schema_->getColumnParent(schema_->getFieldNumber(predicates[i].left.table, predicates[i].left.key));
				int col2 = schema_->getColumnParent(schema_->getFieldNumber(predicates[i].right.table, predicates[i].right.key));
				((ctx->qs).projector_)->registerOperator(predicates[i].id, col1, col2);
				((ctx->qs).projector_)->registerOperatorColumns(predicates[i].id, schema_->getFieldNumber(predicates[i].left.table, predicates[i].left.key), schema_->getFieldNumber(predicates[i].right.table, predicates[i].right.key));
			}
		}
	}

	void init (Executor* ctx, const ParsedQuery& pquery) {
		ctx->versionLock_ = new(numa_alloc_onnode(sizeof(std::atomic_flag), SOCKET)) std::atomic_flag;
		ctx->versionLock_->clear();
		ctx->schema_ = schema_;
		ctx->relationNum = schema_->getTableNumber();
		ctx->globalVersion_ = 0;
		ctx->numTriggers = 0;

		if (schema_->getTableNumber() > MAXRELATIONS) {
			std::cout << "time: crashed" << std::endl;
			std::cout << "CHECKPOINTFINAL: crashed" << std::endl;
		}

		assert(schema_->getTableNumber() <= MAXRELATIONS);

		ctx->ingestion = (Ingestion**) numa_alloc_onnode(relationNum*sizeof(Ingestion*), SOCKET);
		for (int i = 0; i < relationNum; i++) {
			int size = 1024;
			(ctx->ingestion)[i] = new Ingestion(i, size, numthreads, schema_, ctx->ingestion, dallocator, dallocator_lock_);
		}

		ctx->hashtables_ = new Stem*[relationNum];
		for (int i = 0; i < relationNum; i++)
			(ctx->hashtables_)[i] = nullptr;

		ctx->tupleSize = (int*) numa_alloc_onnode(relationNum*sizeof(int), SOCKET);
		for (int i = 0; i < relationNum; i++)
			(ctx->tupleSize)[i] = 0;

		ctx->version_ = (std::atomic<int>*) numa_alloc_onnode(MAXRELATIONS*sizeof(std::atomic<int>), SOCKET);
		ctx->committed_ = (std::atomic<int>*) numa_alloc_onnode(MAXRELATIONS*sizeof(std::atomic<int>), SOCKET);
		ctx->elements_ = (std::atomic<uint64_t>*) numa_alloc_onnode(MAXRELATIONS*sizeof(std::atomic<uint64_t>), SOCKET);
		ctx->snapshots_ = (int**) numa_alloc_onnode(MAXRELATIONS*sizeof(int*), SOCKET);

		for (int i = 0; i < MAXRELATIONS; i++) {
			(ctx->version_)[i].store(-1);
			(ctx->committed_)[i].store(-1);
			(ctx->elements_)[i].store(0);

			(ctx->snapshots_)[i] = new(numa_alloc_onnode(((1 << 20)+1)*sizeof(int), SOCKET)) int[(1 << 20) + 1];
			(ctx->snapshots_)[i][0] = -1;
			(ctx->snapshots_)[i]++;
			for (int j = 0; j < (1 << 20); j++)
				(ctx->snapshots_)[i][j] = INT_MAX;
		}

		ctx->done = (bool*) numa_alloc_onnode(MAXRELATIONS*MAXTHREADS*sizeof(bool), SOCKET);

		for (int j = 0; j < MAXRELATIONS*MAXTHREADS; j++)
			(ctx->done)[j] = true;

		(ctx->qs).aggrs = new std::vector<Evaluator*>*[MAXQUERIES];
		(ctx->qs).postFilters = new std::vector<PostFilterWrapper>*[MAXQUERIES];

		for (int i = 0; i < MAXQUERIES; i++) {
			((ctx->qs).aggrs)[i] = nullptr;
			ctx->minOffset[i] = INT_MAX;
			(ctx->qs).postFilters[i] = nullptr;
		}

		(ctx->qs).filterArray = new std::vector<Filter*>*[relationNum];
		(ctx->qs).semijoinFilters = new std::vector<JoinFilter*>[relationNum];
		

		for (int i = 0; i < relationNum; i++) {
			((ctx->qs).filterArray)[i] = nullptr;
			(ctx->qs).semijoinFilters[i].clear();
		}

		(ctx->qs).projector_ = new(numa_alloc_onnode(sizeof(Projector), SOCKET)) Projector((pquery.joins)->size());

		(ctx->qs).partitioner = new(numa_alloc_onnode(sizeof(Partitioner), SOCKET)) Partitioner(schema_);

		for (int i = 0; i < MAXRELATIONS; i++) {
			ctx->qSelect[i] = new(numa_alloc_onnode(sizeof(QLearningSelection), SOCKET)) QLearningSelection(1.0, 0.2, 0.001);
			ctx->qSelect[i]->setSelectionNum(0);
		}
	}

	void attach (Executor* ctx, Executor* master, const ParsedQuery& pquery) {
		//std::cout << master << " " << ctx << std::endl;
		ctx->versionLock_ = master->versionLock_;
		ctx->schema_ = schema_;
		ctx->relationNum = schema_->getTableNumber();
		ctx->globalVersion_ = 0;
		ctx->numTriggers = 1;

		ctx->ingestion = master->ingestion;

		ctx->hashtables_ = master->hashtables_;

		ctx->tupleSize = master->tupleSize;

		ctx->version_ = master->version_;
		ctx->committed_ = master->committed_;
		ctx->elements_ = master->elements_;
		ctx->snapshots_ = master->snapshots_;

		ctx->done = nullptr;

		//((ctx->qs).aggrs) = (master->qs).aggrs;
		(ctx->qs).aggrs = new std::vector<Evaluator*>*[MAXQUERIES];
		(ctx->qs).postFilters = new std::vector<PostFilterWrapper>*[MAXQUERIES];
		
		for (int i = 0; i < MAXQUERIES; i++) {
			((ctx->qs).aggrs)[i] = nullptr;
			ctx->minOffset[i] = INT_MAX;
			(ctx->qs).postFilters[i] = nullptr;
		}

		(ctx->qs).filterArray  = new std::vector<Filter*>*[relationNum];
		(ctx->qs).semijoinFilters = new std::vector<JoinFilter*>[relationNum];

		for (int i = 0; i < relationNum; i++) {
			((ctx->qs).filterArray)[i] = nullptr;
			(ctx->qs).semijoinFilters[i].clear();
		}

		(ctx->qs).projector_ = new(numa_alloc_onnode(sizeof(Projector), SOCKET)) Projector((pquery.joins)->size());

		(ctx->qs).partitioner = (master->qs).partitioner;

		for (int i = 0; i < MAXRELATIONS; i++) {
			ctx->qSelect[i] = master->qSelect[i];
		}
	}

public:
	Planner (Schema* schema, int numthreads) : schema_(schema), relationNum(schema->getTableNumber()), numthreads(numthreads) {
		DataBlock* dblocks = new(numa_alloc_onnode((1 << 24)*sizeof(DataBlock), SOCKET)) DataBlock[1 << 24];
		for (int i = 0; i < (1 << 24); i++)
			dallocator.push(dblocks+i);
	}

	~Planner () {

	}

	Executor* getMaster(const ParsedQuery& pquery, int* ordering) {
		Executor* ctx = (Executor*) numa_alloc_onnode(sizeof(Executor), SOCKET);

		init(ctx, pquery);

		parseJoins(ctx, pquery, ordering);

		(ctx->triggers[0]).queryMask = (std::bitset<MAXQUERIES>*) numa_alloc_onnode(relationNum*sizeof(std::bitset<MAXQUERIES>), SOCKET);
		for (int i = 0; i < relationNum; i++) {
			((ctx->triggers[0]).queryMask)[i].reset();
		}

		(ctx->activeQueries).reset();

		std::vector<ParsedJoin>& predicates = *(pquery.joins);
		//ctx->projector = new(numa_alloc_onnode(sizeof(Projector), SOCKET)) Projector(predicates.size());
		(ctx->qs).graph = new(numa_alloc_onnode(sizeof(Graph), SOCKET)) Graph(schema_->getTableNumber(), schema_, predicates, ctx->hashtables_);
		ctx->join = new(numa_alloc_onnode(sizeof(SymmetricJoin), SOCKET)) SymmetricJoin(((ctx->qs).graph)->nodeIndex_[relationNum], &dallocator, &dallocator_lock_);

		//ctx->join->estimator->buildLattice((ctx->qs).graph);

		return ctx;
	}

	Executor* getContextUsingMaster(Executor* master, const ParsedQuery& pquery, int* ordering) {
		Executor* ctx = (Executor*) numa_alloc_onnode(sizeof(Executor), SOCKET);

		attach(ctx, master, pquery);

		//parseJoins(ctx, pquery);
		parseFilters(ctx, pquery, ordering);
		parsePostFilters(ctx, pquery);
		parseAggregates(ctx, pquery);
		
		(ctx->triggers[0]).queryMask = (std::bitset<MAXQUERIES>*) numa_alloc_onnode(relationNum*sizeof(std::bitset<MAXQUERIES>), SOCKET);
		for (int i = 0; i < relationNum; i++) {
			((ctx->triggers[0]).queryMask)[i].reset();
		}

		std::bitset<MAXQUERIES> activeQueries;
		activeQueries.reset();

		for (std::map<std::string, std::bitset<MAXQUERIES>>::const_iterator it = pquery.queryMask.begin(); it != pquery.queryMask.end(); ++it) {
			((ctx->triggers[0]).queryMask)[schema_->getTableId(it->first)] = it->second;
			activeQueries |= it->second;
		}

		for (int i = 0; i < relationNum; i++) {
			if (((ctx->triggers[0]).queryMask)[i].any() == false) {
				ordering[i] = -1;
			}
		}

		ctx->activeQueries = activeQueries;

		std::vector<ParsedJoin>& predicates = *(pquery.joins);

		(ctx->qs).graph = new(numa_alloc_onnode(sizeof(Graph), SOCKET)) Graph((master->qs).graph);
		((ctx->qs).graph)->update(schema_, predicates);
		//((ctx->qs).graph)->printGraph();
		//ctx->join = new(numa_alloc_onnode(sizeof(SymmetricJoin), SOCKET)) SymmetricJoin(((ctx->qs).graph)->nodeIndex_[relationNum], &dallocator, &dallocator_lock_);

		setProjections (ctx, pquery);

		ctx->orderInputs(ordering);
 
		return ctx;
	}

	Executor* getContext(const ParsedQuery& pquery, int* ordering) {
		Executor* ctx = (Executor*) numa_alloc_onnode(sizeof(Executor), SOCKET);

		init(ctx, pquery);

		parseJoins(ctx, pquery, ordering);
		parseFilters(ctx, pquery, ordering);
		parsePostFilters(ctx, pquery);
		parseAggregates(ctx, pquery);
		
		(ctx->triggers[0]).queryMask = (std::bitset<MAXQUERIES>*) numa_alloc_onnode(relationNum*sizeof(std::bitset<MAXQUERIES>), SOCKET);
		for (int i = 0; i < relationNum; i++) {
			((ctx->triggers[0]).queryMask)[i].reset();
		}

		std::bitset<MAXQUERIES> activeQueries;
		activeQueries.reset();

		for (std::map<std::string, std::bitset<MAXQUERIES>>::const_iterator it = pquery.queryMask.begin(); it != pquery.queryMask.end(); ++it) {
			((ctx->triggers[0]).queryMask)[schema_->getTableId(it->first)] = it->second;
			activeQueries |= it->second;
		}

		ctx->activeQueries = activeQueries;

		std::vector<ParsedJoin>& predicates = *(pquery.joins);

		(ctx->qs).graph = new(numa_alloc_onnode(sizeof(Graph), SOCKET)) Graph(schema_->getTableNumber(), schema_, predicates, ctx->hashtables_);
		ctx->join = new(numa_alloc_onnode(sizeof(SymmetricJoin), SOCKET)) SymmetricJoin(((ctx->qs).graph)->nodeIndex_[relationNum], &dallocator, &dallocator_lock_);

		setProjections (ctx, pquery);

		ctx->orderInputs(ordering);

		return ctx;
	}
};

#endif

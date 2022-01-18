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

#include "relbuilder.h"

#include "scan-operators.h"
#include "filter-operators.h"
#include "sum-operators.h"
#include "join-operators.h"
#include "../roulette-operators/filter.h"
#include "../roulette-operators/partitioner.h"

#include <map>
#include <utility>
#include <ctime>

RelBuilder::RelBuilder (Schema* schema, const ParsedQuery& pquery, std::vector<std::pair<std::pair<int, std::bitset<MAXQUERIES> >, std::pair<std::pair<uint64_t, uint64_t>, std::pair<bool, uint64_t> > > >& joinorder, bool istrue, int numthreads) : schema_(schema), numthreads(numthreads) {
	relationNum_ = schema_->getTableNumber();

	/*
	preallocate vector objects
	*/
	DataBlock* dblocks = (istrue)? new(numa_alloc_onnode((1 << 24)*sizeof(DataBlock), SOCKET)) DataBlock[1 << 24] : nullptr;
	for (int i = 0; i < (1 << 24); i++)
		dallocator.push(dblocks+i);

	dallocator_lock_.clear();

	/*
	create scan operators
	*/
	for (std::map<std::string, std::bitset<MAXQUERIES> >::const_iterator it = pquery.queryMask.begin(); it != pquery.queryMask.end(); ++it) {
		int tableId = schema_->getTableId(it->first);
		ScanOperator* scan = new((numa_alloc_onnode(sizeof(ScanOperator), SOCKET))) ScanOperator(schema_, tableId, it->second, dallocator, dallocator_lock_, numthreads);
		
		ops_.push_back(scan);

		std::pair<uint64_t, std::bitset<MAXQUERIES> > p1((1ull) << tableId, it->second);
		std::pair<std::pair<uint64_t, std::bitset<MAXQUERIES> >, Operator*> p2(p1, scan);
		opIndex_.push_back(p2);
	}

	/*
	create plan bottom-up (filters - joins - aggregates)
	*/
	parseFilters (pquery);
	parseJoins (pquery, joinorder, istrue, numthreads);
	parseAggregates (pquery);

	for (int i = 0; i < ops_.size(); i++) {
		ops_[i]->updateProjections();
		ops_[i]->finalize();
	}
}

void RelBuilder::getMappings (std::map<int, int>& mapping) {
	for (int i = 0; i < ops_.size(); i++) {
		ops_[i]->getMapping(mapping);
	}
}

/*
execute operators bottom up
*/
void RelBuilder::execute(int threadId, std::atomic<int>* barriers, int numthreads) {
	struct timespec begin;
	clock_gettime(CLOCK_MONOTONIC, &begin);

	for (int i = 0; i < ops_.size(); i++) {
		ops_[i]->execute(threadId);

		barriers[i].fetch_add(1); 
		while(barriers[i].load() < numthreads);
	}

	struct timespec finish;
	clock_gettime(CLOCK_MONOTONIC, &finish);
	double elapsed = (finish.tv_sec - begin.tv_sec);
	elapsed += (finish.tv_nsec - begin.tv_nsec) / 1000000000.0;

	if (threadId == 0) {
		std::cout << "time: " << elapsed << std::endl;
		//partitioner_->flush();
		std::cout << "tuples: " << JoinOperator::intermediates << std::endl;
	}
}

void RelBuilder::parseFilters (const ParsedQuery& pquery) {
	const std::vector<ExpressionWrapper>& filters = *(pquery.filters);

	std::vector<Filter*>** filterArray = new std::vector<Filter*>*[relationNum_];
	for (int i = 0; i < relationNum_; i++) {
		filterArray[i] = nullptr;
	}

	/*init data structure for accummulating filters per relation*/
	PolyFilter** filterAggr = new PolyFilter*[schema_->getTotalFieldNumber()];
	for (int i = 0; i < schema_->getTotalFieldNumber(); i++) {
		filterAggr[i] = nullptr;
	}

	/*create explicit filters per query*/
	for (int i = 0; i < filters.size(); i++) {
		const ExpressionWrapper& pfilter = filters[i];

		/*
		simple filter - add it to a grouped filter
		*/
		if (pfilter.expr->isComplex() < 0) {
			ConstComparisonExpression* ccexpr = (ConstComparisonExpression*) pfilter.expr;
			AttributeExpression* aexpr = (AttributeExpression*) ccexpr->getLHS();
			ConstExpression* cexpr = (ConstExpression*) ccexpr->getRHS();

			int key = schema_->getFieldNumber(aexpr->getRelation(), aexpr->getName());
			int table = schema_->getColumnParent(key); 

			PolyFilter* filter;

			if (filterAggr[key] == nullptr) {
				filter = new((numa_alloc_onnode(sizeof(PolyFilter), SOCKET))) PolyFilter(schema_, key);
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
					std::cout << schema_->getColumnString(key) << std::endl;
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
		}  else {
			/*
			complex filter - produce expression
			*/
			ExpressionVisitor ev(schema_);

			Evaluator* cond = filters[i].expr->accept(&ev, filters[i].queries);
			int table = filters[i].expr->getTable(schema_);

			assert(table >= 0);

			if (filterArray[table] == nullptr) {
				filterArray[table] = new std::vector<Filter*>();
			}

			ConjunctiveFilter* filter = new ConjunctiveFilter(cond, filters[i].queries);
			filterArray[table]->push_back(filter);
		}
	}

		

	for (int i = 0; i < schema_->getTotalFieldNumber(); i++) {
		if (filterAggr[i] != nullptr) {
			int table = schema_->getColumnParent(i);
			if (filterArray[table] == nullptr) {
				filterArray[table] = new std::vector<Filter*>();
			}

			filterArray[table]->push_back(filterAggr[i]);
			filterAggr[i]->fuseLikeLookups();
		}
	}

	/*
	add one filter operator per poly filter OR complex filter
	*/
	for (int i = 0; i < relationNum_; i++) {
		if (filterArray[i] == nullptr)
			continue;

		for (int j = 0; j < opIndex_.size(); j++) {
			if (((1ull) << i) & opIndex_[j].first.first) {
				Operator* top = opIndex_[j].second;

				for (int k = 0; k < filterArray[i]->size(); k++) {
					FilterOperator* newop = new FilterOperator(top->getQueries(), filterArray[i][0][k], dallocator, dallocator_lock_);
					top->registerConsumer(newop);
					top = newop;
				}

				opIndex_[j].second = top;
			}
		}
	}
}

void RelBuilder::parseAggregates (const ParsedQuery& pquery) {
	partitioner_ = new(((numa_alloc_onnode(sizeof(Partitioner), SOCKET)))) Partitioner(schema_);

	const std::vector<ParsedAggregateList*>& paggrList = *(pquery.aggrList);

	std::bitset<MAXQUERIES> allqueries;
	allqueries.reset();

	/*
	get required aggregates
	*/
	for (int j = 0; j < paggrList.size(); j++) {
		const std::vector<ParsedAggregate>& aggregates = *(paggrList[j]->aggregates);
		
		if (paggrList[j]->grouping->size() > 0) {
			assert(false);
		} else {
			for (int i = 0; i < aggregates.size(); i++) {
				const ParsedAggregate& paggr = aggregates[i];

				std::bitset<MAXQUERIES>  queries = paggr.queries;
				allqueries |= queries;
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

				if (paggr.op.compare("count") == 0) {
					partitioner_->addAggregation(queryId, "count", key);
				} else if (paggr.op.compare("sum") == 0) {
					partitioner_->addAggregation(queryId, "sum", key);
				} else if (paggr.op.compare("min") == 0) {
					partitioner_->addAggregation(queryId, "min", key);
				} else if (paggr.op.compare("max") == 0) {
					partitioner_->addAggregation(queryId, "max", key);
				} else if (paggr.op.compare("avg") == 0) {
					assert(false);
				} else
					assert(false);
			}
		}
	}

	std::map<int, std::bitset<MAXQUERIES> > topMap;

	/*
	find last operator for each query -- this is theaggregate's child
	*/
	for (int j = 0; j < MAXQUERIES; j++) {
		if (allqueries.test(j)) {
			int maxi = -1;
			int maxc = 0;

			for (int i = 0; i < opIndex_.size(); i++) {
				if (opIndex_[i].first.second.test(j)) {
					int cnt = __builtin_popcountll(opIndex_[i].first.first);

					if (cnt > maxc) {
						maxc = cnt;
						maxi = i;
					}
				}
			}

			if (topMap.find(maxi) == topMap.end()) {
				topMap[maxi] = 0;
			}

			topMap[maxi].set(j);
		}
	}

	for (std::map<int, std::bitset<MAXQUERIES> >::iterator it = topMap.begin(); it != topMap.end(); ++it) {
		SumOperator* op = new(((numa_alloc_onnode(sizeof(SumOperator), SOCKET)))) SumOperator(it->second, partitioner_, dallocator, dallocator_lock_);
		(opIndex_[it->first].second)->registerConsumer(op);
		ops_.push_back(op);
	}
}


void RelBuilder::parseJoins (const ParsedQuery& pquery, std::vector<std::pair<std::pair<int, std::bitset<MAXQUERIES> >, std::pair<std::pair<uint64_t, uint64_t>, std::pair<bool, uint64_t> > > > joinorder, bool istrue, int numthreads) {
	std::vector<ParsedJoin>& predicates = *(pquery.joins);

	uint64_t* array = nullptr;

	/*
	allocate shared arena forhashtable entry allocation
	*/
	if (istrue) {
		array = (uint64_t*) numa_alloc_onnode(((1ull) << 36)*0.5, SOCKET);
		memset(array, 5, ((1ull) << 36)*0.5);
	}
	std::atomic<uint64_t>* offset = (std::atomic<uint64_t>*) numa_alloc_onnode(sizeof(std::atomic<uint64_t>), SOCKET);
	offset->store(0);

	std::cout << joinorder.size() << std::endl;

	/*
	build join dag bottom-up
	for each join, the join order holds the left and right expression
	each loop locates two joinable expressions and adds their join to an expression list (starting from scan-filter)
	*/
	while (joinorder.size() > 0) {
		std::vector<std::pair<std::pair<int, std::bitset<MAXQUERIES> >, std::pair<std::pair<uint64_t, uint64_t>, std::pair<bool, uint64_t> > > >::const_iterator chosen = joinorder.end();

		/*
		iterate over joins that haven't been added yet
		*/
		for (std::vector<std::pair<std::pair<int, std::bitset<MAXQUERIES> >, std::pair<std::pair<uint64_t, uint64_t>, std::pair<bool, uint64_t> > > >::const_iterator it = joinorder.begin(); it != joinorder.end(); ++it) {
			uint64_t left = (it->second).first.first;
			uint64_t right = (it->second).first.second;

			int op = (it->first).first;
			std::bitset<MAXQUERIES> queries = (it->first).second;

			int leftIdx_ = -1;

			/*
			find lhs expression
			*/
			for (int j = 0; j < opIndex_.size(); j++) {
				if (opIndex_[j].first.first == left && (opIndex_[j].first.second & queries).any()) {
					leftIdx_ = j;
					break;
				}
			}

			/*
			not found - try later
			*/
			if (leftIdx_ == -1)
				continue;

			int rightIdx_ = -1;

			/*
			find rhs expression
			*/

			for (int j = 0; j < opIndex_.size(); j++) {
				if (opIndex_[j].first.first == right && (opIndex_[j].first.second & queries).any()) {
					rightIdx_ = j;
					break;
				}
			}

			/*
			not found - try later
			*/
			if (rightIdx_ == -1)
				continue;

			int predicateIdx = -1;

			for (int j = 0; j < predicates.size(); j++) {
				assert(predicates[j].id == j);
			}

			int leftKey = schema_->getFieldNumber(predicates[op].left.table, predicates[op].left.key);
			int leftTable = schema_->getColumnParent(leftKey);

			int rightKey = schema_->getFieldNumber(predicates[op].right.table, predicates[op].right.key);
			int rightTable = schema_->getColumnParent(rightKey);

			//std::cout << predicates[op].left.table << "." << predicates[op].left.key << " " << 
			//	predicates[op].right.table << "." << predicates[op].right.key << " " << queries << std::endl;

			/*
			produce join and connect children to parent operator
			*/
			JoinOperator* joinop;
			if ((it->second).second.first == false) {
				joinop = new(((numa_alloc_onnode(sizeof(JoinOperator), SOCKET)))) JoinOperator(schema_, queries, rightKey, leftKey, right, left, 20, offset, array, dallocator, dallocator_lock_, istrue, numthreads);
			} else {
				joinop = new((numa_alloc_onnode(sizeof(JoinOperator), SOCKET))) JoinOperator(schema_, queries, leftKey, rightKey, left, right, 20, offset, array, dallocator, dallocator_lock_, istrue, numthreads);
			}
			(opIndex_[leftIdx_].second)->registerConsumer(joinop);
			(opIndex_[rightIdx_].second)->registerConsumer(joinop);

			/*
			add join to expressionlist
			*/
			std::pair<uint64_t, std::bitset<MAXQUERIES> > p1(left | right, queries);
			std::pair<std::pair<uint64_t, std::bitset<MAXQUERIES> >, Operator*> p2(p1, joinop);
			opIndex_.push_back(p2);
			ops_.push_back(joinop);

			chosen = it;

			break;
		}

		/*
		remove chosen join
		*/
		assert(chosen != joinorder.end());
		joinorder.erase(chosen);
	}
}















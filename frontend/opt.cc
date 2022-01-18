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

#include "opt.h"


#include "../rapidjson/document.h"
#include "../rapidjson/writer.h"
#include "../rapidjson/stringbuffer.h"
#include "../rapidjson/filereadstream.h"



void parseJoinOrderRec(const rapidjson::GenericValue<rapidjson::UTF8<> >::Object& doc, Loader* loader, 	std::map<std::string, std::string>& relTranslator, std::vector<ParsedJoin>& predicates, std::vector<int>& joinOrder) {
	assert(doc.HasMember("type"));
	assert(doc["type"].IsString());
	std::string type = doc["type"].GetString();

	if (type.compare("scan") == 0) {
		assert(doc.HasMember("relation"));
		assert(doc["relation"].IsString());
		std::string relation = doc["relation"].GetString();

		assert(doc.HasMember("name"));
		assert(doc["name"].IsString());
		std::string name = doc["name"].GetString();

		relTranslator[name] = loader->fullname[relation];

		return;
	} else if (type.compare("join") == 0) {
		assert(doc.HasMember("right"));
		assert(doc["right"].IsObject());
		const auto& rhs = doc["right"].GetObject();
		parseJoinOrderRec(rhs, loader, relTranslator, predicates, joinOrder);

		assert(doc.HasMember("left"));
		assert(doc["left"].IsObject());
		const auto& lhs = doc["left"].GetObject();
		parseJoinOrderRec(lhs, loader, relTranslator, predicates, joinOrder);

		assert(doc.HasMember("cond"));
		assert(doc["cond"].IsObject());
		const auto& cond = doc["cond"].GetObject();

		assert(cond.HasMember("left"));
		assert(cond["left"].IsObject());
		const auto& lkey = cond["left"].GetObject();

		assert(cond.HasMember("right"));
		assert(cond["right"].IsObject());
		const auto& rkey = cond["right"].GetObject();

		assert(lkey.HasMember("relation"));
		assert(lkey["relation"].IsString());
		std::string relL = lkey["relation"].GetString();

		//for (const auto& it : loader->fullname) {
		//	std::cout << it.first << std::endl;
		//}

		assert(lkey.HasMember("attr"));
		assert(lkey["attr"].IsString());
		assert((loader->translator).find(relTranslator[relL]) != (loader->translator).end());
		assert((loader->translator)[relTranslator[relL]].find(lkey["attr"].GetString()) != (loader->translator)[relTranslator[relL]].end());
		std::string origL = lkey["attr"].GetString();
		std::string attrL = (loader->translator)[relTranslator[relL]][origL];

		assert(rkey.HasMember("relation"));
		assert(rkey["relation"].IsString());
		std::string relR = rkey["relation"].GetString();

		assert(rkey.HasMember("attr"));
		assert(rkey["attr"].IsString());
		assert((loader->translator).find(relTranslator[relR]) != (loader->translator).end());
		assert((loader->translator)[relTranslator[relR]].find(rkey["attr"].GetString()) != (loader->translator)[relTranslator[relR]].end());
		std::string origR = rkey["attr"].GetString();
		std::string attrR = loader->translator[relTranslator[relR]][origR];

		for (int i = 0; i < predicates.size(); i++) {
			if (attrL.compare(predicates[i].left.key) == 0 && relL.compare(predicates[i].left.table) == 0 && attrR.compare(predicates[i].right.key) == 0 && relR.compare(predicates[i].right.table) == 0) {
				joinOrder.push_back(predicates[i].id);
				return;
			}

			if (attrR.compare(predicates[i].left.key) == 0 && relR.compare(predicates[i].left.table) == 0 && attrL.compare(predicates[i].right.key) == 0 && relL.compare(predicates[i].right.table) == 0) {
				joinOrder.push_back(predicates[i].id);
				return;
			}
		}

		assert(false);
	} else {
		assert(false);
	}
}

void parseJoinOrder(std::string joinOrderFilename, Loader* loader, std::vector<ParsedJoin>& predicates, std::vector<int>& joinOrder) {
	char readBuffer[65536];
	FILE* fp = fopen(joinOrderFilename.c_str(), "rb");
	rapidjson::FileReadStream is(fp, readBuffer, sizeof(readBuffer));

	rapidjson::Document d;
   	d.ParseStream(is);
   	assert(d.IsObject());
   	const auto& doc = d.GetObject();

   	std::map<std::string, std::string> relTranslator;

   	parseJoinOrderRec(doc, loader, relTranslator, predicates, joinOrder);
}

ProblemParameters::ProblemParameters (Schema* schema, 
		std::vector<ParsedJoin>& predicates, 
		std::vector<ExpressionWrapper>& filters, 
		int queryNum)  : queryNum(queryNum), predicates(predicates)
	{
		opRelations = new uint64_t[predicates.size()];
		opQueries = new std::bitset<MAXQUERIES>[predicates.size()];
		aux = new std::bitset<MAXQUERIES> [predicates.size()];

		state_arena = new State[STATE_ARENA_SIZE];
		for (int i = 0; i < STATE_ARENA_SIZE; i++) {
			state_alloca.push_back(&state_arena[i]);
			state_arena[i].test();
		}

		minvec_arena = new std::pair<double, double>[OPERATOR_MAX*MINVEC_ARENA_SIZE];
		memset(minvec_arena, 0, OPERATOR_MAX*MINVEC_ARENA_SIZE*sizeof(std::pair<double, double>));
		for (int i = 0; i < MINVEC_ARENA_SIZE; i++) {
			minvec_alloca.push_back(minvec_arena+i*OPERATOR_MAX);
		}

		opTableLeft = new int[predicates.size()];
		opTableRight = new int[predicates.size()];
		opColumnLeft = new int[predicates.size()];
		opColumnRight = new int[predicates.size()];

		opNum = predicates.size();
		relNum = schema->getTableNumber();

		gridRelations = new uint64_t[relNum*queryNum];
		gridQueries = new std::bitset<MAXQUERIES>[relNum*queryNum];
		gridNum = new int[relNum];

		std::cout << opNum << std::endl;
		assert(opNum <= OPERATOR_MAX);

		relQueries = new std::bitset<MAXQUERIES>[relNum];

		stats = new StatisticsVector**[relNum];

		for (int i = 0; i < relNum; i++) {
			relQueries[i] = 0;

			stats[i] = new StatisticsVector*[queryNum];

			for (int j = 0; j < queryNum; j++) {
				stats[i][j] = new StatisticsVector(*(schema->getStatistics(i)));
			}
		}

		for (int i = 0; i < predicates.size(); i++) {
			opQueries[i] = predicates[i].queries;

			int table1 = schema->getColumnParent(schema->getFieldNumber(predicates[i].left.table, predicates[i].left.key));
			int table2 = schema->getColumnParent(schema->getFieldNumber(predicates[i].right.table, predicates[i].right.key));
			opRelations[i] = ((1ull) << table1) | ((1ull) << table2);
		
			relQueries[table1] |= predicates[i].queries;
			relQueries[table2] |= predicates[i].queries;

			opTableLeft[i] = table1;
			opColumnLeft[i] = schema->getFieldNumberInTable(predicates[i].left.table, predicates[i].left.key);

			opTableRight[i] = table2;
			opColumnRight[i] = schema->getFieldNumberInTable(predicates[i].right.table, predicates[i].right.key);
		}

		for (int i = 0; i < filters.size(); i++) {
			int table = filters[i].expr->getTable(schema);

			assert(table >= 0);

			for (int j = 0; j < queryNum; j++)
				if ((filters[i].queries).test(j)) {
					std::cout << "predicate " << table << " " << j << std::endl;
					std::cout << stats[table][j]->cardinality << std::endl;
					filters[i].expr->updateStatistics(schema, stats[table][j]);
					std::cout << stats[table][j]->cardinality << std::endl;
				}
		}

		std::cout << "rels " << relNum << std::endl;
		for (int i = 0; i < relNum; i++) {
			for (int j = 0; j < queryNum; j++) {
					std::cout << stats[i][j]->cardinality << std::endl;
			}
		}
	}

	State::~State() {
		if (tmp != nullptr) {
			delete tmp;
		}
	}

	void State::test () {
		cost = 0.0;
		cost2 = 0.0;
		assert(decisions.size() == 0);
		assert(subqueries.size() == 0);
		assert(lineage.size() == 0);
		assert(opinputs.size() == 0);
		assert(oprels.size() == 0);
	}

	void State::purge () {
		decisions.clear();
		subqueries.clear();
		lineage.clear();
		opinputs.clear();
		oprels.clear();
	}

	void State::init (State*  parent, std::pair<int, std::bitset<MAXQUERIES> > d, ProblemParameters* params) {
		assert(false);
		decisions = parent->decisions;
		subqueries = parent->subqueries;
		//blacklist = parent->blacklist;
		lineage = parent->lineage;
		cost = parent->cost;
		cost2 = parent->cost2;
		tmp = nullptr;

		active = parent->active;

		std::pair<std::pair<int, std::bitset<MAXQUERIES> >, int> pd(d, decisions.size());
		decisions.push_back(pd);

		std::pair<size_t, double> newlineage(parent->hash_state(), parent->cost);
		lineage.push_back(newlineage);
		
		std::vector<int> sq;

		for (int64_t it = 0; it < subqueries.size(); ++it) {
			if ((d.second & subqueries[it].first.second).any() && (params->opRelations[d.first] & subqueries[it].first.first)) {
				sq.push_back(it);
			}
		}

		assert(sq.size() < 3 && sq.size() > 0);

		if (sq.size() == 2) {
			assert(sq[0] >= 0 && sq[0] < subqueries.size());
			assert(sq[1] >= 0 && sq[1] < subqueries.size());

			double* stat1 = subqueries[sq[0]].second;
			double* stat2 = subqueries[sq[1]].second;

			std::pair<uint64_t, std::bitset<MAXQUERIES> > sq1 = subqueries[sq[0]].first;
			std::pair<uint64_t, std::bitset<MAXQUERIES> > sq2 = subqueries[sq[0]].first;
			std::pair<uint64_t, std::bitset<MAXQUERIES> > sq3 = subqueries[sq[1]].first;

			sq1.first |= subqueries[sq[1]].first.first;
			sq1.second &=  d.second;
			sq1.second &= sq3.second;

			sq2.second &=  (~d.second);
			sq3.second &=  (~d.second);

			assert(sq1.second.any());

			if (sq1.second.any()) {
				std::bitset<MAXQUERIES> lastactive = active[active.size()-1];
				active[active.size()-1] = lastactive & (~sq1.second);
				active.push_back(sq1.second & lastactive);

				double* newstats = new double[params->queryNum];

				std::bitset<MAXQUERIES> mask = sq1.second;

				int table1 = params->opTableLeft[d.first];
				int table2 = params->opTableRight[d.first];

				int column1 = params->opColumnLeft[d.first];
				int column2 = params->opColumnRight[d.first];

				double max1 = 0.0;
				double max2 = 0.0;

				int base = 0;
				std::bitset<MAXQUERIES> bitfilter = 0;
				for (int i = 0; i < 64; i++) {
					bitfilter.set(i);
				}


				while (mask.any()) {
					uint64_t localmask = (mask&bitfilter).to_ullong();

					while (localmask != 0) {
						int offset = __builtin_ctzll(localmask) + base;

						if (stat1[offset] > max1)
							max1 = stat1[offset];

						if (stat2[offset] > max2)
							max2 = stat2[offset];

						uint64_t maxdistinct = ((params->stats[table1][offset]->fieldStatistics[column1]).distinct > 
												(params->stats[table2][offset]->fieldStatistics[column2]).distinct) ?
													(params->stats[table1][offset]->fieldStatistics[column1]).distinct :
													(params->stats[table2][offset]->fieldStatistics[column2]).distinct;

						if (maxdistinct == 0)
							maxdistinct = 1;

						assert(offset < params->queryNum);

						newstats[offset] = ceil(((double) stat1[offset])*((double) stat2[offset])/((double) maxdistinct));

						if (newstats[offset] < 1.0)
							newstats[offset] = 1.0;

						cost2 += stat1[offset] + stat2[offset];

						localmask &= (localmask-1);
					}

					mask = mask >> 64;
					base += 64;
				}

				assert(max1 >= 0);
				assert(max2 >= 0);

				cost += max1 + max2;

				std::pair<std::pair<uint64_t, std::bitset<MAXQUERIES> >, double* > newsq1(sq1, newstats);
				subqueries.push_back(newsq1);

				assert(cost >= 0);
			} else {
				assert(false);
			}

			if (sq2.second.any()) {
				std::pair<std::pair<uint64_t, std::bitset<MAXQUERIES> >, double* > newsq2(sq2, stat1);
				subqueries.push_back(newsq2);
			}

			if (sq3.second.any()) {
				std::pair<std::pair<uint64_t, std::bitset<MAXQUERIES> >, double* > newsq3(sq3, stat2);
				subqueries.push_back(newsq3);
			}

			int maxsq = (sq[0] > sq[1]) ? sq[0] : sq[1];
			int minsq = (sq[0] > sq[1]) ? sq[1] : sq[0];

			subqueries[maxsq] = subqueries[subqueries.size()-1];
			subqueries.pop_back();

			subqueries[minsq] = subqueries[subqueries.size()-1];
			subqueries.pop_back();
		} else if (sq.size() == 1) {
			assert(false);
		}

		std::bitset<MAXQUERIES> * opQueries = params->aux;
		int opNum = params->opNum;

		for (int i = 0; i < opNum; i++)
			opQueries[i] = (params->opQueries[i]);

		for (int i = 0; i < decisions.size(); ++i) {
			opQueries[decisions[i].first.first] &= (~decisions[i].first.second);
		}

		for (int i = 0; i < opNum; i++) {
			if (opQueries[i].any()) {
				for (int64_t it = 0; it < subqueries.size(); ++it) {
					if ((opQueries[i] & subqueries[it].first.second).any() && ((params->opRelations[i] & ~subqueries[it].first.first) == 0)) {
						std::pair<uint64_t, std::bitset<MAXQUERIES> > p(i, opQueries[i] & subqueries[it].first.second);

						std::pair<std::pair<int, std::bitset<MAXQUERIES> >, int> pd(p, decisions.size());
						decisions.push_back(pd);
					}
				}
			}
		}
	}

	void State::computeBound(ProblemParameters* params) {
		getBound(params, bound, heuristic);
	}

	std::size_t State::hash_state ()  {
		std::map<uint64_t, size_t> collector;

		auto maskh = std::hash<std::bitset<MAXQUERIES> >{};

		for (int64_t it = 0; it < subqueries.size(); ++it) {
			collector[subqueries[it].first.first] ^= maskh(subqueries[it].first.second);
		}

		std::string h = "";

		for (std::map<uint64_t, size_t>::const_iterator it = collector.begin(); it != collector.end(); ++it) {
			h += "|" + std::to_string(it->first) + "." + std::to_string(it->second);
		}

		return std::hash<std::string>{}(h);
	}

	void State::init_bound_start (State* parent, std::bitset<MAXQUERIES>  q) {
		locked = 0;
		cost = 0.0;
		cost2 = 0.0;
		tmp = nullptr;

		for (int64_t it = 0; it < (parent->subqueries).size(); ++it) {
			if ((q & (parent->subqueries)[it].first.second).any()) {
				std::pair<std::pair<uint64_t, std::bitset<MAXQUERIES> >, double*> p = (parent->subqueries)[it];
				p.first.second = q;
				subqueries.push_back(p);

				subplan[p.first.first] = std::to_string(p.first.first);
			}
		}

		bound = 0.0;
	}

	double State::getSelectivity (std::pair<int, std::bitset<MAXQUERIES> > d, ProblemParameters* params) {
		assert(false);
		std::vector<int> sq;

		for (int64_t it = 0; it < subqueries.size(); ++it) {
			if ((d.second & subqueries[it].first.second).any() && (params->opRelations[d.first] & subqueries[it].first.first)) {
				sq.push_back(it);
			}
		}

		assert(sq.size() < 3 && sq.size() > 0);

		if (sq.size() == 2) {
			//assert(subqueries.find(sq[0]) != subqueries.end());
			//assert(subqueries.find(sq[1]) != subqueries.end());

			double* stat1 = subqueries[sq[0]].second;
			double* stat2 = subqueries[sq[1]].second;

			std::bitset<MAXQUERIES>  mask = subqueries[sq[0]].first.second & subqueries[sq[0]].first.second & d.second;

			if (subqueries[sq[0]].first.second.any()) {
				int table1 = params->opTableLeft[d.first];
				int table2 = params->opTableRight[d.first];

				int column1 = params->opColumnLeft[d.first];
				int column2 = params->opColumnRight[d.first];

				double max1 = 0;
				double max2 = 0;
				double maxout = 0;

				int base = 0;
				std::bitset<MAXQUERIES> bitfilter = 0;
				for (int i = 0; i < 64; i++) {
					bitfilter.set(i);
				}

				while (mask.any()) {
					uint64_t localmask = (mask & bitfilter).to_ullong();

					while (localmask != 0) {
						int offset = __builtin_ctzll(localmask) + base;

						if (stat1[offset] > max1)
							max1 = stat1[offset];

						if (stat2[offset] > max2)
							max2 = stat2[offset];

						uint64_t maxdistinct = ((params->stats[table1][offset]->fieldStatistics[column1]).distinct > 
												(params->stats[table2][offset]->fieldStatistics[column2]).distinct) ?
													(params->stats[table1][offset]->fieldStatistics[column1]).distinct :
													(params->stats[table2][offset]->fieldStatistics[column2]).distinct;

						if (maxdistinct == 0)
							maxdistinct = 1;

						assert(offset < params->queryNum);

						double out = ceil(stat1[offset]*stat2[offset]/((double) maxdistinct));

						if (out > maxout) {
							maxout = out;
						}

						localmask &= (localmask-1);
					}

					mask = mask >> 64;
					base += 64;
				}

				return maxout/(max1+max2);
			} else {
				return 0.0;
			}
		}

		return 0.0;
	}

	void State::init_root (ProblemParameters* params) {
		locked = 0;
		tmp = nullptr;

		std::bitset<MAXQUERIES> queryMask;
		for (int i = 0; i < params->queryNum; i++) {
			queryMask.set(i);
		}

		active.push_back(queryMask);

		for (int i = 0; i < params->relNum; i++) {
			std::pair<uint64_t, std::bitset<MAXQUERIES> > p((1ull) << i, (params->relQueries[i]));
			std::pair<std::pair<uint64_t, std::bitset<MAXQUERIES> >, double*> p2(p, new double[params->queryNum]);
			subqueries.push_back(p2);

			for (int j = 0; j < params->queryNum; j++) {
				p2.second[j] = (params->stats[i][j])->cardinality;
			}
		}

		cost = 0.0;
		cost2 = 0.0;

		//getBound(params, bound, heuristic);
		bound = cost;
	}

	bool State::isComplete (ProblemParameters* params) {
		assert(false);
		std::bitset<MAXQUERIES> * opQueries = params->aux;
		int opNum = params->opNum;

		for (int i = 0; i < opNum; i++)
			opQueries[i] = (params->opQueries[i]);

		for (int i = 0; i < decisions.size(); ++i) {
			opQueries[decisions[i].first.first] &= (~decisions[i].first.second);
		}

		for (int i = 0; i < opNum; i++) {
			if (opQueries[i].any()) {
				return false;
			}
		}

		return true;
	}

	void State::init_bound (State* parent, std::pair<int, std::bitset<MAXQUERIES> > d, ProblemParameters* params) {
		locked = 0;
		tmp = nullptr;

		opinputs = parent->opinputs;
		oprels = parent->oprels;
		decisions = parent->decisions;
		subqueries = parent->subqueries;
		cost = parent->cost;
		cost2 = parent->cost2;

		std::pair<std::pair<int, std::bitset<MAXQUERIES> >, int> pd(d, decisions.size());
		decisions.push_back(pd);

		std::vector<int> sq;
		std::map<int, std::bitset<MAXQUERIES> > participant;

		uint64_t leftColumn = (1ull) << params->opTableLeft[d.first];
		uint64_t rightColumn = (1ull) << params->opTableRight[d.first];

		for (int64_t it = 0; it < subqueries.size(); ++it) {
			if ((leftColumn & subqueries[it].first.first) && (d.second & subqueries[it].first.second).any()) {
				uint64_t otherside = rightColumn;
				std::bitset<MAXQUERIES>  thesequeries = d.second & subqueries[it].first.second;

				if (otherside & subqueries[it].first.first)
					continue;

				for (int64_t it_other = 0; it_other < subqueries.size(); ++it_other) {
					if ((subqueries[it_other].first.first & otherside) && (thesequeries & subqueries[it_other].first.second).any()) {
						sq.push_back(it);
						sq.push_back(it_other);

						participant[it] = subqueries[it].first.second;
						participant[it_other] = subqueries[it_other].first.second;
					}
				}
			}
		}

		double max1_total = -1.0;
		double max2_total = -1.0;

		//assert(sq.size() == 0 || sq.size() == 2);

		for (int64_t i = 0; i < sq.size(); i += 2) {
			assert(sq[i] >= 0 && sq[i] < subqueries.size());
			assert(sq[i+1] >= 0 && sq[i+1] < subqueries.size());

			double* stat1 = subqueries[sq[i]].second;
			double* stat2 = subqueries[sq[i+1]].second;


			std::bitset<MAXQUERIES>  mask = d.second & subqueries[sq[i]].first.second & subqueries[sq[i+1]].first.second;

			std::pair<uint64_t, std::bitset<MAXQUERIES> > newsq;

			newsq.first = subqueries[sq[i]].first.first | subqueries[sq[i+1]].first.first;
			newsq.second =  mask;

			participant[sq[i]] &=  (~mask);
			participant[sq[i+1]] &=  (~mask);

			if (mask.any()) {
				double* newstats = new double[params->queryNum];

				tmp = newstats;

				int table1 = params->opTableLeft[d.first];
				int table2 = params->opTableRight[d.first];

				int column1 = params->opColumnLeft[d.first];
				int column2 = params->opColumnRight[d.first];

				double max1 = 0;
				double max2 = 0;

				int base = 0;

				std::bitset<MAXQUERIES> bitfilter = 0;
				for (int i = 0; i < 64; i++) {
					bitfilter.set(i);
				}

				while (mask.any()) {
					uint64_t localmask = (mask & bitfilter).to_ullong();

					while (localmask != 0) {
						int offset = __builtin_ctzll(localmask) + base;

						if (stat1[offset] > max1)
							max1 = stat1[offset];

						if (stat2[offset] > max2)
							max2 = stat2[offset];

						uint64_t maxdistinct = ((params->stats[table1][offset]->fieldStatistics[column1]).distinct > 
												(params->stats[table2][offset]->fieldStatistics[column2]).distinct) ?
													(params->stats[table1][offset]->fieldStatistics[column1]).distinct :
													(params->stats[table2][offset]->fieldStatistics[column2]).distinct;

						if (maxdistinct == 0)
							maxdistinct = 1;

						assert(offset < params->queryNum);

						newstats[offset] = ceil(stat1[offset]*stat2[offset]/((double) maxdistinct));

						if (newstats[offset] == 0)
							newstats[offset] = 1;



						localmask &= (localmask-1);
					}

					base += 64;
					mask = mask >> 64;
				}

				assert(max1 >= 0);
				assert(max2 >= 0);

				double curcost = max1 + max2;

				std::pair<double, double> costtup(max1, max2);
				opinputs[d.first] = costtup;

				std::pair<uint64_t, uint64_t> reltup(subqueries[sq[i]].first.first , subqueries[sq[i+1]].first.first);
				oprels[d.first] = reltup;

				/*if (mincost < 0 || curcost < mincost)
					mincost = curcost;*/

				if (max1 > max1_total)
					max1_total = max1;

				if (max2 > max2_total)
					max2_total = max2;

				std::pair<std::pair<uint64_t, std::bitset<MAXQUERIES> >, double* > newsq1(newsq, newstats);
				subqueries.push_back(newsq1);
			}
		}

		for (std::map<int, std::bitset<MAXQUERIES> >::iterator it = participant.begin();
																	it != participant.end();
																	++it) {
			subqueries[it->first].first.second = it->second;
		}

		cost += max1_total + max2_total;

		bound = cost;
	}


	double State::getBound (ProblemParameters* params, double& optimal_bound, double& greedy_solution) {
		std::bitset<MAXQUERIES> * opQueries = params->aux;
		int opNum = params->opNum;

		std::map<int, std::pair<double, double> > opCost;
		std::map<std::pair<int, std::pair<uint64_t, uint64_t> >, std::pair<double, double> > opCostGreedy;
		std::map<int, std::pair<double, double> > opCostBound;

		for (int i = 0; i < opNum; i++) {
			opQueries[i] = (params->opQueries[i]);
		}

		for (int i = 0; i < decisions.size(); ++i) {
			opQueries[decisions[i].first.first] &= (~decisions[i].first.second);
		}

		std::vector<std::pair<int, std::bitset<MAXQUERIES>  > > actions;

		for (int i = 0; i < opNum; i++) {
			if (opQueries[i].any()) {
				uint64_t opLeftRelation = (1ull) << params->opTableLeft[i];
				uint64_t opRightRelation = (1ull) << params->opTableRight[i];

				for (int64_t it = 0; it < subqueries.size(); ++it) {
					if ((opLeftRelation & subqueries[it].first.first) && (opQueries[i] & subqueries[it].first.second).any()) {
						uint64_t otherside = opRightRelation;
						std::bitset<MAXQUERIES>  thesequeries = opQueries[i] & subqueries[it].first.second;

						if (otherside & subqueries[it].first.first) {
							std::pair<int, std::bitset<MAXQUERIES> > a(i, opQueries[i] & subqueries[it].first.second);
							actions.push_back(a);
							assert(false);
						} else {
							for (int64_t it_other = 0; it_other < subqueries.size(); ++it_other) {
								if ((subqueries[it_other].first.first & otherside) && (thesequeries & subqueries[it_other].first.second).any()) {
									std::pair<int, std::bitset<MAXQUERIES> > a(i, thesequeries & subqueries[it_other].first.second);

									actions.push_back(a);
								}
							}
						}
					}
				}
			}
		}

		for (int i = 0; i < actions.size(); i++) {
			std::pair<double, double> p(0.0, 0.0);
			opCost[i] = p;
			opCostBound[i] = p;
		}

		double totalcost = 0.0;

		for (int q = 0; q < params->queryNum; q++) {
			std::vector<int> opActive;

			for (int i = 0; i < opNum; i++) {
				if (opQueries[i].test(q)) {
					opActive.push_back(i);
				}
			}

			std::map<uint64_t, std::pair<State*, std::pair<double, double>* > > allstates;
			std::vector<uint64_t> level[2];

			level[0].clear();
			level[1].clear();

			int u = 0;

			level[0].push_back(0);

			assert((params->minvec_alloca).size() > 0);
			std::pair<double, double>* minvector = (params->minvec_alloca)[(params->minvec_alloca).size()-1];
			(params->minvec_alloca).pop_back();

			for (int i = 0; i < opNum; i++) {
				minvector[i].first = DBL_MAX;
				minvector[i].second = DBL_MAX;
			}

			assert((params->state_alloca).size() > 0);
			State* s = params->state_alloca[(params->state_alloca).size()-1];
			(params->state_alloca).pop_back();

			std::pair<State*, std::pair<double, double>* > statepair(s, minvector);

			allstates[0] = statepair;

			std::bitset<MAXQUERIES> queryMask;
			queryMask.set(q);
			(allstates[0].first)->init_bound_start(this, queryMask);

			for (int64_t i = 0; i < opActive.size(); i++) {
				for (int64_t j = 0; j < level[u].size(); j++) {
					for (int64_t k = 0; k < opActive.size(); k++) {
						if ((((1ull) << k) & level[u][j]) == 0) {
							uint64_t next = ((1ull) << k) | level[u][j];

							if (allstates.find(next) == allstates.end()) {
								level[1-u].push_back(next);
							}

							int op = opActive[k];

							State* cur = allstates[level[u][j]].first;

							assert((params->minvec_alloca).size() > 0);
							std::pair<double, double>* minvector = (params->minvec_alloca)[(params->minvec_alloca).size()-1];
							(params->minvec_alloca).pop_back();

							for (int i = 0; i < opNum; i++) {
								minvector[i].first = allstates[level[u][j]].second[i].first;
								minvector[i].second = allstates[level[u][j]].second[i].second;
							}

							assert((params->state_alloca).size() > 0);
							State* s = params->state_alloca[(params->state_alloca).size()-1];
							(params->state_alloca).pop_back();

							std::bitset<MAXQUERIES> queryMask;
							queryMask.set(q);
							std::pair<int, std::bitset<MAXQUERIES> > a(op, queryMask);
							s->init_bound(cur, a, params);

							minvector[op].first = (s->opinputs[op]).first;
							minvector[op].second = (s->opinputs[op]).second;

							if (allstates.find(next) == allstates.end()) {
								std::pair<State*, std::pair<double, double>*> statepair(s, minvector);
								allstates[next] = statepair;
							} else {
								if (s->cost < (allstates[next].first)->cost) {
									State* old = allstates[next].first;
									old->purge();
									(params->state_alloca).push_back(old);
									allstates[next].first = s;
								} else {
									//delete s;
									s->purge();
									(params->state_alloca).push_back(s);
								}

								for (int i = 0; i < opNum; i++) {
									if (allstates[next].second[i].first > minvector[i].first) {
										allstates[next].second[i].first = minvector[i].first;
									}

									if (allstates[next].second[i].second > minvector[i].second) {
										allstates[next].second[i].second = minvector[i].second;
									}
								}

								(params->minvec_alloca).push_back(minvector);
							}
						}
					}
				}

				level[u].clear();

				u = 1 - u;
			}


			assert(level[u].size() == 1);

			for (std::map<int, std::pair<double, double> >::iterator it = ((allstates[level[u][0]].first)->opinputs).begin();
																	it != ((allstates[level[u][0]].first)->opinputs).end();
																	++it) {
				int op = it->first;

				for (int i = 0; i < actions.size(); i++) {
					if (actions[i].first == op && (actions[i].second.test(q))) {
						if (opCost[i].first < (it->second).first) {
							opCost[i].first = (it->second).first;
						}

						if (opCost[i].second < (it->second).second) {
							opCost[i].second = (it->second).second;
						}

						if (opCostBound[i].first < (allstates[level[u][0]].second)[op].first) {
							opCostBound[i].first = (allstates[level[u][0]].second)[op].first;
						}

						if (opCostBound[i].second < (allstates[level[u][0]].second)[op].second) {
							opCostBound[i].second = (allstates[level[u][0]].second)[op].second;
						}
					}
				}

				std::pair<uint64_t, uint64_t> oprel = (allstates[level[u][0]].first)->oprels[op];
				std::pair<int, std::pair<uint64_t, uint64_t> > optup(op, oprel);

				if (opCostGreedy.find(optup) == opCostGreedy.end()) {
					std::pair<double, double> initval(0.0, 0.0);
					opCostGreedy[optup] = initval;
				}

				if (opCostGreedy[optup].first < (it->second).first) {
					opCostGreedy[optup].first = (it->second).first;
				}

				if (opCostGreedy[optup].second < (it->second).second) {
					opCostGreedy[optup].second = (it->second).second;
				}
			}

			for (std::map<uint64_t, std::pair<State*, std::pair<double, double>*> >::iterator it = allstates.begin(); it != allstates.end(); ++it) {
				(it->second).first->purge();
				(params->state_alloca).push_back((it->second).first);
				(params->minvec_alloca).push_back((it->second).second);
			}

			//totalcost += allstates[level[u][0]]->cost;
		}

		for (std::map<int, std::pair<double, double> >::iterator it = opCost.begin(); it != opCost.end(); ++it) {
			totalcost += (it->second).first + (it->second).second;
		}

		double totalcost2 = 0.0;

		for (std::map<std::pair<int, std::pair<uint64_t, uint64_t> >, std::pair<double, double> >::iterator it = opCostGreedy.begin(); it != opCostGreedy.end(); ++it) {
			totalcost2 += (it->second).first + (it->second).second;
		}

		double totalcost3 = 0.0;

		for (std::map<int, std::pair<double, double> >::iterator it = opCostBound.begin(); it != opCostBound.end(); ++it) {
			totalcost3 += (it->second).first + (it->second).second;
		}

		assert(totalcost3 <= totalcost + 1000);

		optimal_bound = totalcost3 + cost;

		greedy_solution = totalcost2 + cost;
	}

	void State::getOpt (ProblemParameters* params, double& best, double& worst, std::map<int, std::pair<int, std::bitset<MAXQUERIES> > >* actions_taken, std::map<std::pair<int, std::pair<uint64_t, uint64_t> >, std::pair<double, double> >& opcards, std::map<std::pair<int, std::pair<uint64_t, uint64_t> >, std::pair<double, double> >* cards_per_query) {
		std::bitset<MAXQUERIES> * opQueries = params->aux;
		int opNum = params->opNum;

		std::map<std::pair<int, std::pair<uint64_t, uint64_t> >, std::pair<double, double> >& opCost = opcards;
		std::map<std::pair<int, std::pair<uint64_t, uint64_t> >, std::pair<double, double> > opCost2;

		for (int i = 0; i < opNum; i++) {
			opQueries[i] = (params->opQueries[i]);
		}

		for (int i = 0; i < decisions.size(); ++i) {
			opQueries[(decisions[i].first).first] &= (~(decisions[i].first).second);
		}

		double totalcost = 0.0;

		for (int q = 0; q < params->queryNum; q++) {
			std::vector<int> opActive;

			for (int i = 0; i < opNum; i++) {
				if (opQueries[i].test(q)) {
					opActive.push_back(i);
				}
			}

			std::map<uint64_t, State*> allstates;
			std::vector<uint64_t> level[2];

			level[0].clear();
			level[1].clear();

			int u = 0;

			level[0].push_back(0);
			
			assert((params->state_alloca).size() > 0);
			State* s = params->state_alloca[(params->state_alloca).size()-1];
			(params->state_alloca).pop_back();

			allstates[0] = s;

			std::bitset<MAXQUERIES> queryMask = 0;
			queryMask.set(q);
			allstates[0]->init_bound_start(this, queryMask);

			for (int64_t i = 0; i < opActive.size(); i++) {
				for (int64_t j = 0; j < level[u].size(); j++) {
					for (int64_t k = 0; k < opActive.size(); k++) {
						if ((((1ull) << k) & level[u][j]) == 0) {
							uint64_t next = ((1ull) << k) | level[u][j];

							if (allstates.find(next) == allstates.end()) {
								level[1-u].push_back(next);
							}

							int op = opActive[k];
							State* cur = allstates[level[u][j]];
							

							assert((params->state_alloca).size() > 0);
							State* s = params->state_alloca[(params->state_alloca).size()-1];
							(params->state_alloca).pop_back();

							std::bitset<MAXQUERIES> queryMask = 0;
							queryMask.set(q);
							std::pair<int, std::bitset<MAXQUERIES> > a(op, queryMask);
							s->init_bound(cur, a, params);

							if (allstates.find(next) == allstates.end()) {
								allstates[next] = s;
							} else if (s->cost < allstates[next]->cost) {
								State* old = allstates[next];
								old->purge();
								(params->state_alloca).push_back(old);
								allstates[next] = s;
							}
						}
					}
				}

				level[u].clear();

				u = 1 - u;
			}


			assert(level[u].size() == 1);

			for (std::map<int, std::pair<double, double> >::iterator it = (allstates[level[u][0]]->opinputs).begin(); it != (allstates[level[u][0]]->opinputs).end(); ++it) {
				int op = it->first;

				assert(( allstates[level[u][0]]->oprels).find(op) !=  (allstates[level[u][0]]->oprels).end());
				std::pair<uint64_t, uint64_t> oprel = allstates[level[u][0]]->oprels[op];
				std::pair<int, std::pair<uint64_t, uint64_t> > optup(op, oprel);

				if (opCost.find(optup) == opCost.end()) {
					std::pair<double, double> initval(0.0, 0.0);
					opCost[optup] = initval;
					opCost2[optup] = initval;
				} else {
				}

				if (opCost[optup].first < (it->second).first) {
					opCost[optup].first = (it->second).first;
				}

				opCost2[optup].first += (it->second).first;

				if (opCost[optup].second < (it->second).second) {
					opCost[optup].second = (it->second).second;
				}

				opCost2[optup].second += (it->second).second;

				cards_per_query[q][optup] = (it->second);
			}

			for (std::vector<std::pair<std::pair<int, std::bitset<MAXQUERIES> >, int> >::iterator it = (allstates[level[u][0]]->decisions).begin(); it != (allstates[level[u][0]]->decisions).end(); ++it) {
				actions_taken[q][it->second] = it->first;
			}

			for (std::map<uint64_t, State*>::iterator it = allstates.begin(); it != allstates.end(); ++it) {
				it->second->purge();
				(params->state_alloca).push_back(it->second);
			}
			//totalcost += allstates[level[u][0]]->cost;
		}

		for (std::map<std::pair<int, std::pair<uint64_t, uint64_t> >, std::pair<double, double> >::iterator it = opCost.begin(); it != opCost.end(); ++it) {
			totalcost += (it->second).first + (it->second).second;
		}

		double worstcost = 0.0;

		for (std::map<std::pair<int, std::pair<uint64_t, uint64_t> >, std::pair<double, double> >::iterator it = opCost2.begin(); it != opCost2.end(); ++it) {
			worstcost += (it->second).first + (it->second).second;
		}

		best = totalcost + cost;

		worst = worstcost + cost;

	}

	void State::getOptGreedy (ProblemParameters* params, double& best, double& worst, std::map<int, std::pair<int, std::bitset<MAXQUERIES> > >* actions_taken, std::map<std::pair<int, std::pair<uint64_t, uint64_t> >, std::pair<double, double> >& opcards, std::map<std::pair<int, std::pair<uint64_t, uint64_t> >, std::pair<double, double> >* cards_per_query) {
		std::bitset<MAXQUERIES> * opQueries = params->aux;
		int opNum = params->opNum;

		std::map<std::pair<int, std::pair<uint64_t, uint64_t> >, std::pair<double, double> >& opCost = opcards;
		std::map<std::pair<int, std::pair<uint64_t, uint64_t> >, std::pair<double, double> > opCost2;

		for (int i = 0; i < opNum; i++) {
			opQueries[i] = (params->opQueries[i]);
		}

		for (int i = 0; i < decisions.size(); ++i) {
			opQueries[(decisions[i].first).first] &= (~(decisions[i].first).second);
		}

		double totalcost = 0.0;

		for (int q = 0; q < params->queryNum; q++) {
			std::cout << "ready" << std::endl;

			std::vector<int> opActive;

			for (int i = 0; i < opNum; i++) {
				if (opQueries[i].test(q)) {
					opActive.push_back(i);
				}
			}

			std::map<uint64_t, State*> allstates;
			std::vector<uint64_t> level[2];

			level[0].clear();
			level[1].clear();

			int u = 0;

			level[0].push_back(0);
			
			assert((params->state_alloca).size() > 0);
			State* s = params->state_alloca[(params->state_alloca).size()-1];
			(params->state_alloca).pop_back();

			allstates[0] = s;

			std::bitset<MAXQUERIES> queryMask = 0;
			queryMask.set(q);
			allstates[0]->init_bound_start(this, queryMask);


			uint64_t chosen = 0;

			int factIdx = -1;
			uint64_t factCard =-0;

			for (int i = 0; i < params->relNum; i++) {
				if ((params->stats[i][q])->cardinality > factCard) {
					factCard = (params->stats[i][q])->cardinality;
					factIdx = i;
				}
			}

			assert(factIdx != -1);

			chosen |= ((1ull) << factIdx);

			for (int64_t k = 0; k < opActive.size(); k++) {
				uint64_t minCard = 50000000000L;
				int minIdx = -1;
				int minOp = -1;

				for (int64_t i = 0; i < opActive.size(); i++) {
					int op = opActive[i];
					int other = -1;

					if ((((1ull) << params->opTableLeft[op]) & chosen) && (((1ull) << params->opTableRight[op]) & chosen)) {
						continue;
					} else if (((1ull) << params->opTableLeft[op]) & chosen) {
						other = params->opTableRight[op];
					} else if (((1ull) << params->opTableRight[op]) & chosen) {
						other = params->opTableLeft[op];
					} else {
						continue;
					}

					if (minCard > (params->stats[other][q])->cardinality) {
						minCard = (params->stats[other][q])->cardinality;
						minIdx = other;
						minOp = i;
					}
				}

				/*std::cout << "next:" << opActive[minOp] << " " << minOp << std::endl;
				std::cout << "left:" << params->opTableLeft[opActive[minOp]] << std::endl;
				std::cout << "right:" << params->opTableRight[opActive[minOp]] << std::endl;
				std::cout << "chosen:" << chosen << std::endl;*/

				assert(minOp != -1);

				chosen |= ((1ull) << minIdx);

				uint64_t next = ((1ull) << minOp) | level[u][0];

				State* cur = allstates[level[u][0]];
				assert((params->state_alloca).size() > 0);
				State* s = params->state_alloca[(params->state_alloca).size()-1];
				(params->state_alloca).pop_back();

				std::bitset<MAXQUERIES> queryMask = 0;
				queryMask.set(q);
				std::pair<int, std::bitset<MAXQUERIES> > a(opActive[minOp], queryMask);
				s->init_bound(cur, a, params);
				allstates[next] = s;

				level[1-u].push_back(next);
				level[u].clear();
				u = 1-u;
			}

			//assert(__builtin_popcountll(chosen) == 17);

			assert(level[u].size() == 1);

			for (std::map<int, std::pair<double, double> >::iterator it = (allstates[level[u][0]]->opinputs).begin(); it != (allstates[level[u][0]]->opinputs).end(); ++it) {
				int op = it->first;

				assert(( allstates[level[u][0]]->oprels).find(op) !=  (allstates[level[u][0]]->oprels).end());
				std::pair<uint64_t, uint64_t> oprel = allstates[level[u][0]]->oprels[op];
				std::pair<int, std::pair<uint64_t, uint64_t> > optup(op, oprel);

				if (opCost.find(optup) == opCost.end()) {
					std::pair<double, double> initval(0.0, 0.0);
					opCost[optup] = initval;
					opCost2[optup] = initval;
				} else {
				}

				if (opCost[optup].first < (it->second).first) {
					opCost[optup].first = (it->second).first;
				}

				opCost2[optup].first += (it->second).first;

				if (opCost[optup].second < (it->second).second) {
					opCost[optup].second = (it->second).second;
				}

				opCost2[optup].second += (it->second).second;

				cards_per_query[q][optup] = (it->second);
			}

			for (std::vector<std::pair<std::pair<int, std::bitset<MAXQUERIES> >, int> >::iterator it = (allstates[level[u][0]]->decisions).begin(); it != (allstates[level[u][0]]->decisions).end(); ++it) {
				actions_taken[q][it->second] = it->first;
			}

			for (std::map<uint64_t, State*>::iterator it = allstates.begin(); it != allstates.end(); ++it) {
				it->second->purge();
				(params->state_alloca).push_back(it->second);
			}
			//totalcost += allstates[level[u][0]]->cost;
		}

		for (std::map<std::pair<int, std::pair<uint64_t, uint64_t> >, std::pair<double, double> >::iterator it = opCost.begin(); it != opCost.end(); ++it) {
			totalcost += (it->second).first + (it->second).second;
		}

		double worstcost = 0.0;

		for (std::map<std::pair<int, std::pair<uint64_t, uint64_t> >, std::pair<double, double> >::iterator it = opCost2.begin(); it != opCost2.end(); ++it) {
			worstcost += (it->second).first + (it->second).second;
		}

		best = totalcost + cost;

		worst = worstcost + cost;

	}

	void State::init_bound_subexpr (Schema* schema, State* parent, std::pair<int, std::bitset<MAXQUERIES> > d, ProblemParameters* params, std::map<std::pair<int, std::pair<std::string, std::string> >, std::pair<double, double> >& subexpression_cache) {
		locked = 0;
		tmp = nullptr;

		opinputs = parent->opinputs;
		oprels = parent->oprels;
		decisions = parent->decisions;
		subqueries = parent->subqueries;
		cost = parent->cost;
		cost2 = parent->cost2;
		subplan = parent->subplan;

		std::pair<std::pair<int, std::bitset<MAXQUERIES> >, int> pd(d, decisions.size());
		decisions.push_back(pd);

		std::vector<int> sq;
		std::map<int, std::bitset<MAXQUERIES> > participant;

		uint64_t leftColumn = (1ull) << params->opTableLeft[d.first];
		uint64_t rightColumn = (1ull) << params->opTableRight[d.first];

		for (int64_t it = 0; it < subqueries.size(); ++it) {
			if ((leftColumn & subqueries[it].first.first) && (d.second & subqueries[it].first.second).any()) {
				uint64_t otherside = rightColumn;
				std::bitset<MAXQUERIES>  thesequeries = d.second & subqueries[it].first.second;

				if (otherside & subqueries[it].first.first)
					continue;

				for (int64_t it_other = 0; it_other < subqueries.size(); ++it_other) {
					if ((subqueries[it_other].first.first & otherside) && (thesequeries & subqueries[it_other].first.second).any()) {
						sq.push_back(it);
						sq.push_back(it_other);

						participant[it] = subqueries[it].first.second;
						participant[it_other] = subqueries[it_other].first.second;
					}
				}
			}
		}

		double max1_total = -1.0;
		double max2_total = -1.0;

		//assert(sq.size() == 0 || sq.size() == 2);

		for (int64_t i = 0; i < sq.size(); i += 2) {
			assert(sq[i] >= 0 && sq[i] < subqueries.size());
			assert(sq[i+1] >= 0 && sq[i+1] < subqueries.size());

			double* stat1 = subqueries[sq[i]].second;
			double* stat2 = subqueries[sq[i+1]].second;


			std::bitset<MAXQUERIES>  mask = d.second & subqueries[sq[i]].first.second & subqueries[sq[i+1]].first.second;

			std::pair<uint64_t, std::bitset<MAXQUERIES> > newsq;

			newsq.first = subqueries[sq[i]].first.first | subqueries[sq[i+1]].first.first;
			newsq.second =  mask;

			participant[sq[i]] &=  (~mask);
			participant[sq[i+1]] &=  (~mask);

			if (mask.any()) {
				double* newstats = new double[params->queryNum];

				tmp = newstats;

				int table1 = params->opTableLeft[d.first];
				int table2 = params->opTableRight[d.first];

				int column1 = params->opColumnLeft[d.first];
				int column2 = params->opColumnRight[d.first];

				double max1 = 0;
				double max2 = 0;

				int base = 0;

				std::bitset<MAXQUERIES> bitfilter = 0;
				for (int i = 0; i < 64; i++) {
					bitfilter.set(i);
				}

				while (mask.any()) {
					uint64_t localmask = (mask & bitfilter).to_ullong();

					while (localmask != 0) {
						int offset = __builtin_ctzll(localmask) + base;

						if (stat1[offset] > max1)
							max1 = stat1[offset];

						if (stat2[offset] > max2)
							max2 = stat2[offset];

						uint64_t maxdistinct = ((params->stats[table1][offset]->fieldStatistics[column1]).distinct > 
												(params->stats[table2][offset]->fieldStatistics[column2]).distinct) ?
													(params->stats[table1][offset]->fieldStatistics[column1]).distinct :
													(params->stats[table2][offset]->fieldStatistics[column2]).distinct;

						if (maxdistinct == 0)
							maxdistinct = 1;

						assert(offset < params->queryNum);

						newstats[offset] = ceil(stat1[offset]*stat2[offset]/((double) maxdistinct));

						if (newstats[offset] == 0)
							newstats[offset] = 1;



						localmask &= (localmask-1);
					}

					base += 64;
					mask = mask >> 64;
				}

				assert(max1 >= 0);
				assert(max2 >= 0);

				double curcost = max1 + max2;

				std::pair<double, double> costtup(max1, max2);
				opinputs[d.first] = costtup;

				std::pair<uint64_t, uint64_t> reltup(subqueries[sq[i]].first.first , subqueries[sq[i+1]].first.first);
				oprels[d.first] = reltup;

				std::pair<int, std::pair<uint64_t, uint64_t> > oprel(d.first, reltup);

				std::pair<std::string, std::string> oprelstr(subplan[reltup.first], subplan[reltup.second]);
				std::pair<int, std::pair<std::string, std::string> > optupstr(d.first, oprelstr);

				if (subexpression_cache.find(optupstr) != subexpression_cache.end()) {
					std::cout << "SUBEXPRESSION FOUND!!!" << std::endl;

					uint64_t maskrel;
					uint64_t maxcard;
					double sel1, sel2, sel3, sel4;

					maskrel = subqueries[sq[i]].first.first;
					maxcard = 0;

					while (maskrel != 0) {
						int tbit = __builtin_ctzll(maskrel);

						if (schema->getRowCount(tbit) > maxcard)
							maxcard = schema->getRowCount(tbit);

						maskrel &= maskrel-1;
					}

					assert(maxcard > 0);

					sel1 = max1/((double) maxcard);
					sel2 = subexpression_cache[optupstr].first/((double) maxcard);
					sel3 = sel1 - sel1*sel2;
					sel3 = sel3*maxcard;

					maskrel = subqueries[sq[i+1]].first.first;
					maxcard = 0;

					while (maskrel != 0) {
						int tbit = __builtin_ctzll(maskrel);

						if (schema->getRowCount(tbit) > maxcard)
							maxcard = schema->getRowCount(tbit);

						maskrel &= maskrel-1;
					}

					assert(maxcard > 0);

					sel1 = max2/((double) maxcard);
					sel2 = subexpression_cache[optupstr].second/((double) maxcard);
					sel4 = sel1 - sel1*sel2;
					sel4 = sel4*maxcard;

					std::cout << "est: " << max1 << " " << sel3 << std::endl;
					std::cout << "est: " << max2 << " " << sel4 << std::endl;

					max1 = sel3;
					max2 = sel4;
				}



				/*if (mincost < 0 || curcost < mincost)
					mincost = curcost;*/

				assert(subplan.find(subqueries[sq[i]].first.first) != subplan.end());
				assert(subplan.find(subqueries[sq[i+1]].first.first) != subplan.end());

				subplan[newsq.first] = "(" + subplan[subqueries[sq[i]].first.first] + ") JOIN (" + subplan[subqueries[sq[i+1]].first.first] + ")";


				if (max1 > max1_total)
					max1_total = max1;

				if (max2 > max2_total)
					max2_total = max2;

				if (__builtin_popcountll(subqueries[sq[i]].first.first) == 1 && __builtin_popcountll(subqueries[sq[i+1]].first.first)) {
					if (max1_total < max2_total) {
						double tmp = max2_total;
						max2_total = max1_total;
						max1_total = tmp;
					}
				} else if (__builtin_popcountll(subqueries[sq[i+1]].first.first) > 1) {
					double tmp = max2_total;
					max2_total = max1_total;
					max1_total = tmp;
				}

				std::pair<std::pair<uint64_t, std::bitset<MAXQUERIES> >, double* > newsq1(newsq, newstats);
				subqueries.push_back(newsq1);
			}
		}

		for (std::map<int, std::bitset<MAXQUERIES> >::iterator it = participant.begin();
																	it != participant.end();
																	++it) {
			subqueries[it->first].first.second = it->second;
		}

		cost += max1_total + 2*max2_total;

		bound = cost;
	}


	void State::getOptSubexpr (Schema* schema, ProblemParameters* params, double& best, double& worst, std::map<int, std::pair<int, std::bitset<MAXQUERIES> > >* actions_taken, std::map<std::pair<int, std::pair<uint64_t, uint64_t> >, std::pair<double, double> >& opcards, std::map<std::pair<int, std::pair<uint64_t, uint64_t> >, std::pair<double, double> >* cards_per_query) {
		std::bitset<MAXQUERIES> * opQueries = params->aux;
		int opNum = params->opNum;

		std::map<std::pair<int, std::pair<uint64_t, uint64_t> >, std::pair<double, double> >& opCost = opcards;
		std::map<std::pair<int, std::pair<uint64_t, uint64_t> >, std::pair<double, double> > opCost2;

		for (int i = 0; i < opNum; i++) {
			opQueries[i] = (params->opQueries[i]);
		}

		for (int i = 0; i < decisions.size(); ++i) {
			opQueries[(decisions[i].first).first] &= (~(decisions[i].first).second);
		}

		double totalcost = 0.0;

		std::map<std::pair<int, std::pair<std::string, std::string> >, std::pair<double, double> > subexpression_cache;

		for (int q = 0; q < params->queryNum; q++) {
			std::vector<int> opActive;

			for (int i = 0; i < opNum; i++) {
				if (opQueries[i].test(q)) {
					opActive.push_back(i);
				}
			}

			std::map<uint64_t, State*> allstates;
			std::vector<uint64_t> level[2];

			level[0].clear();
			level[1].clear();

			int u = 0;

			level[0].push_back(0);
			
			assert((params->state_alloca).size() > 0);
			State* s = params->state_alloca[(params->state_alloca).size()-1];
			(params->state_alloca).pop_back();

			allstates[0] = s;

			std::bitset<MAXQUERIES> queryMask = 0;
			queryMask.set(q);
			allstates[0]->init_bound_start(this, queryMask);

			for (int64_t i = 0; i < opActive.size(); i++) {
				for (int64_t j = 0; j < level[u].size(); j++) {
					for (int64_t k = 0; k < opActive.size(); k++) {
						if ((((1ull) << k) & level[u][j]) == 0) {
							uint64_t next = ((1ull) << k) | level[u][j];

							int op = opActive[k];
							State* cur = allstates[level[u][j]];

							std::bitset<MAXQUERIES> queryMask = 0;
							queryMask.set(q);
							std::pair<int, std::bitset<MAXQUERIES> > a(op, queryMask);
							
							if (allstates.find(next) == allstates.end()) {
								level[1-u].push_back(next);
							}

							assert((params->state_alloca).size() > 0);
							State* s = params->state_alloca[(params->state_alloca).size()-1];
							(params->state_alloca).pop_back();

							s->init_bound_subexpr(schema, cur, a, params,subexpression_cache);

							if (allstates.find(next) == allstates.end()) {
								allstates[next] = s;
							} else if (s->cost < allstates[next]->cost) {
								State* old = allstates[next];
								old->purge();
								(params->state_alloca).push_back(old);
								allstates[next] = s;
							}
						}
					}
				}

				level[u].clear();

				u = 1 - u;
			}


			assert(level[u].size() == 1);

			for (std::map<int, std::pair<double, double> >::iterator it = (allstates[level[u][0]]->opinputs).begin(); it != (allstates[level[u][0]]->opinputs).end(); ++it) {
				int op = it->first;

				assert(( allstates[level[u][0]]->oprels).find(op) !=  (allstates[level[u][0]]->oprels).end());
				std::pair<uint64_t, uint64_t> oprel = allstates[level[u][0]]->oprels[op];
				std::pair<int, std::pair<uint64_t, uint64_t> > optup(op, oprel);

				std::pair<std::string, std::string> oprelstr(allstates[level[u][0]]->subplan[oprel.first], allstates[level[u][0]]->subplan[oprel.second]);
				std::pair<int, std::pair<std::string, std::string> > optupstr(optup.first, oprelstr);

				if (opCost.find(optup) == opCost.end()) {
					std::pair<double, double> initval(0.0, 0.0);
					opCost[optup] = initval;
					opCost2[optup] = initval;
					subexpression_cache[optupstr] = initval;
				} else {
					std::cout << op << " with " << oprel.first << "-" << oprel.second << " already seen" << std::endl;
				}

				if (opCost[optup].first < (it->second).first) {
					opCost[optup].first = (it->second).first;
				}

				opCost2[optup].first += (it->second).first;

				if (opCost[optup].second < (it->second).second) {
					opCost[optup].second = (it->second).second;
				}

				opCost2[optup].second += (it->second).second;

				uint64_t maskrel;
				uint64_t maxcard;
				double sel1, sel2, sel3, sel4;

				maskrel = oprel.first;
				maxcard = 0;

				while (maskrel != 0) {
					int tbit = __builtin_ctzll(maskrel);

					if (schema->getRowCount(tbit) > maxcard)
						maxcard = schema->getRowCount(tbit);

					maskrel &= maskrel-1;
				}

				assert(maxcard > 0);

				sel1 = (it->second).first/((double) maxcard);
				sel2 = subexpression_cache[optupstr].first/((double) maxcard);
				sel3 = sel1 + sel2 - sel1*sel2;
				sel3 = sel3*maxcard;

				maskrel = oprel.second;
				maxcard = 0;

				while (maskrel != 0) {
					int tbit = __builtin_ctzll(maskrel);

					if (schema->getRowCount(tbit) > maxcard)
						maxcard = schema->getRowCount(tbit);

					maskrel &= maskrel-1;
				}

				assert(maxcard > 0);

				sel1 = (it->second).second/((double) maxcard);
				sel2 = subexpression_cache[optupstr].second/((double) maxcard);
				sel4 = sel1 + sel2 - sel1*sel2;
				sel4 = sel4*maxcard;

				std::pair<double, double> orcard(sel3, sel4);

				subexpression_cache[optupstr] = orcard;

				cards_per_query[q][optup] = (it->second);
			}

			for (std::vector<std::pair<std::pair<int, std::bitset<MAXQUERIES> >, int> >::iterator it = (allstates[level[u][0]]->decisions).begin(); it != (allstates[level[u][0]]->decisions).end(); ++it) {
				actions_taken[q][it->second] = it->first;
			}

			for (std::map<uint64_t, State*>::iterator it = allstates.begin(); it != allstates.end(); ++it) {
				it->second->purge();
				(params->state_alloca).push_back(it->second);
			}
			//totalcost += allstates[level[u][0]]->cost;
		}

		for (std::map<std::pair<int, std::pair<uint64_t, uint64_t> >, std::pair<double, double> >::iterator it = opCost.begin(); it != opCost.end(); ++it) {
			std::cout << "adding " << totalcost << std::endl;
			totalcost += (it->second).first + (it->second).second;
		}

		double worstcost = 0.0;

		for (std::map<std::pair<int, std::pair<uint64_t, uint64_t> >, std::pair<double, double> >::iterator it = opCost2.begin(); it != opCost2.end(); ++it) {
			worstcost += (it->second).first + (it->second).second;
		}

		best = totalcost + cost;

		worst = worstcost + cost;

		std::cout << opcards.size() << std::endl;
	}


	void State::parseOpt (ProblemParameters* params, double& best, double& worst, std::map<int, std::pair<int, std::bitset<MAXQUERIES> > >* actions_taken, std::map<std::pair<int, std::pair<uint64_t, uint64_t> >, std::pair<double, double> >& opcards, std::map<std::pair<int, std::pair<uint64_t, uint64_t> >, std::pair<double, double> >* cards_per_query, Loader* loader, std::map<int, std::string> parseFile) {
		std::bitset<MAXQUERIES> * opQueries = params->aux;
		int opNum = params->opNum;

		std::map<std::pair<int, std::pair<uint64_t, uint64_t> >, std::pair<double, double> >& opCost = opcards;
		std::map<std::pair<int, std::pair<uint64_t, uint64_t> >, std::pair<double, double> > opCost2;

		for (int i = 0; i < opNum; i++) {
			opQueries[i] = (params->opQueries[i]);
		}

		for (int i = 0; i < decisions.size(); ++i) {
			opQueries[(decisions[i].first).first] &= (~(decisions[i].first).second);
		}

		double totalcost = 0.0;

		for (int q = 0; q < params->queryNum; q++) {
			std::string joinOrderFilename = parseFile[q];
			std::vector<int> joinOrder;
			parseJoinOrder(joinOrderFilename, loader, params->predicates, joinOrder);

			State* s = params->state_alloca[(params->state_alloca).size()-1];
			(params->state_alloca).pop_back();

			std::vector<State*> oldStates;

			std::bitset<MAXQUERIES> queryMask = 0;
			queryMask.set(q);
			s->init_bound_start(this, queryMask);

			for (int k = 0; k < joinOrder.size(); k++) {
				int op = joinOrder[k];
				State* cur = s;
							
				assert((params->state_alloca).size() > 0);
				State* next = params->state_alloca[(params->state_alloca).size()-1];
				(params->state_alloca).pop_back();

				std::bitset<MAXQUERIES> queryMask = 0;
				queryMask.set(q);
				std::pair<int, std::bitset<MAXQUERIES> > a(op, queryMask);
				next->init_bound(cur, a, params);

				oldStates.push_back(cur);
				s = next;
			}

			for (int k = 0; k < oldStates.size(); k++) {
				oldStates[k]->purge();
				(params->state_alloca).push_back(oldStates[k]);
			}

			for (std::map<int, std::pair<double, double> >::iterator it = (s->opinputs).begin(); it != (s->opinputs).end(); ++it) {
				int op = it->first;

				assert(( s->oprels).find(op) !=  (s->oprels).end());
				std::pair<uint64_t, uint64_t> oprel = s->oprels[op];
				std::pair<int, std::pair<uint64_t, uint64_t> > optup(op, oprel);

				if (opCost.find(optup) == opCost.end()) {
					std::pair<double, double> initval(0.0, 0.0);
					opCost[optup] = initval;
					opCost2[optup] = initval;
				} else {
				}

				if (opCost[optup].first < (it->second).first) {
					opCost[optup].first = (it->second).first;
				}

				opCost2[optup].first += (it->second).first;

				if (opCost[optup].second < (it->second).second) {
					opCost[optup].second = (it->second).second;
				}

				opCost2[optup].second += (it->second).second;

				cards_per_query[q][optup] = (it->second);
			}

			for (std::vector<std::pair<std::pair<int, std::bitset<MAXQUERIES> >, int> >::iterator it = (s->decisions).begin(); it != (s->decisions).end(); ++it) {
				actions_taken[q][it->second] = it->first;
			}

			s->purge();
			(params->state_alloca).push_back(s);
		}
	}

	State* State::heuristicNext (ProblemParameters* params) {
		assert(false);
		std::bitset<MAXQUERIES> * opQueries = params->aux;
		int opNum = params->opNum;

		for (int i = 0; i < opNum; i++)
			opQueries[i] = (params->opQueries[i]);

		for (int i = 0; i < decisions.size(); ++i) {
			opQueries[(decisions[i].first).first] &= (~(decisions[i].first).second);
		}

		std::pair<int, std::bitset<MAXQUERIES> > abest;
		double selectivity_best = -1.0;

		for (int i = 0; i < opNum; i++) {
			if (opQueries[i].any()) {
				uint64_t opLeftRelation = (1ull) << params->opTableLeft[i];
				uint64_t opRightRelation = (1ull) << params->opTableRight[i];

				for (int64_t it = 0; it < subqueries.size(); ++it) {
					if ((opLeftRelation & subqueries[it].first.first) && (opQueries[i] & subqueries[it].first.second).any()) {
						uint64_t otherside = opRightRelation;
						std::bitset<MAXQUERIES>  thesequeries = opQueries[i] & subqueries[it].first.second;

						if (otherside & subqueries[it].first.first) {
							std::pair<int, std::bitset<MAXQUERIES> > a(i, opQueries[i] & subqueries[it].first.second);
							
							double sel = getSelectivity(a, params);
							if (selectivity_best < 0 || sel < selectivity_best) {
								selectivity_best = sel;
								abest = a;
							}
						} else {
							for (int64_t it_other = 0; it_other < subqueries.size(); ++it_other) {
								if ((subqueries[it_other].first.first & otherside) && (thesequeries & subqueries[it_other].first.second).any()) {
									std::pair<int, std::bitset<MAXQUERIES> > a(i, thesequeries & subqueries[it_other].first.second);
									
									double sel = getSelectivity(a, params);
									if (selectivity_best < 0 ||  sel < selectivity_best) {
										selectivity_best = sel;
										abest = a;
									}
								}
							}
						}
					}
				}
			}
		}

		assert(selectivity_best >=-0.001);
		
		assert((params->state_alloca).size() > 0);
		State* s = params->state_alloca[(params->state_alloca).size()-1];
		(params->state_alloca).pop_back();


		s->init(this, abest, params);
		return s;
	}

	void State::getHeuristicCost (ProblemParameters* params, double& prune, double& prune2) {
		assert(false);

		State* cur = this;

		while (cur->isComplete(params) == false) {
			State* tmp = cur;
			cur = cur->heuristicNext(params);

			if (tmp != this) {
				tmp->purge();
				(params->state_alloca).push_back(tmp);
			}
		}

		prune = cur->cost;
		prune2 = cur->cost2;
	}


	void State::expand (std::vector<State*>& frontier, ProblemParameters* params, std::map<std::size_t, double>& cnt, double& gbound) {
		assert(false);
		std::bitset<MAXQUERIES> * opQueries = params->aux;
		int opNum = params->opNum;

		for (int i = 0; i < opNum; i++)
			opQueries[i] = (params->opQueries[i]);

		for (int i = 0; i < decisions.size(); ++i) {
			opQueries[(decisions[i].first).first] &= (~(decisions[i].first).second);
		}

		std::vector<std::pair<int, std::bitset<MAXQUERIES> > > actions;
		std::vector<std::pair<uint64_t, uint64_t> > inputs;

		
		for (int i = 0; i < opNum; i++) {
			if (opQueries[i].any()) {
				uint64_t opLeftRelation = (1ull) << params->opTableLeft[i];
				uint64_t opRightRelation = (1ull) << params->opTableRight[i];

				for (int64_t it = 0; it < subqueries.size(); ++it) {
					if ((opLeftRelation & subqueries[it].first.first) && (opQueries[i] & subqueries[it].first.second).any()) {
						uint64_t otherside = opRightRelation;
						std::bitset<MAXQUERIES>  thesequeries = opQueries[i] & subqueries[it].first.second;

						if (otherside & subqueries[it].first.first) {
							std::pair<int, std::bitset<MAXQUERIES> > a(i, opQueries[i] & subqueries[it].first.second);
							actions.push_back(a);
							assert(false);
						} else {
							for (int64_t it_other = 0; it_other < subqueries.size(); ++it_other) {
								if ((subqueries[it_other].first.first & otherside) && (thesequeries & subqueries[it_other].first.second).any()) {
									std::pair<int, std::bitset<MAXQUERIES> > a(i, thesequeries & subqueries[it_other].first.second);

									actions.push_back(a);

									std::pair<uint64_t, uint64_t> i(subqueries[it].first.first, subqueries[it_other].first.first);
									inputs.push_back(i);
								}
							}
						}
					}
				}
			}
		}

		std::vector<std::pair<int, std::bitset<MAXQUERIES> > > relevant_actions;

		while (active.size() > 0) {
			std::bitset<MAXQUERIES>  curactive = active[active.size()-1];

			for (int i = 0; i < actions.size(); ++i) {
				if ((actions[i].second & curactive).any()) {
					relevant_actions.push_back(actions[i]);
				}
			}

			if (relevant_actions.size() > 0) {
				break;
			} else {
				active.pop_back();
			}
		}
		

		for (int i = 0; i < relevant_actions.size(); ++i) {
			assert((params->state_alloca).size() > 0);
			State* s = params->state_alloca[(params->state_alloca).size()-1];
			(params->state_alloca).pop_back();


			s->init(this, relevant_actions[i], params);

			std::size_t h = s->hash_state();
			if (cnt.find(h) == cnt.end()) {
				cnt[h] = s->cost;
			} else {
				if (s->cost < cnt[h]) {
					cnt[h] = s->cost;
				} else {
					s->purge();
					(params->state_alloca).push_back(s);
					continue;
				}
			}

			s->computeBound(params);

			if (s->heuristic < gbound)
				gbound = s->heuristic;
			else if (s->bound > 1.0*gbound) {
				s->purge();
				(params->state_alloca).push_back(s);
				continue;
			}


			frontier.push_back(s);
			int ptr = frontier.size()-1;
			while (ptr > 0) {
				int parent = (ptr-1)/2;

				if (frontier[parent]->bound > frontier[ptr]->bound) {
					State* tmp = frontier[ptr];
					frontier[ptr] = frontier[parent];
					frontier[parent] = tmp;
					ptr = parent;
				} else {
					break;
				}
			}
		}
	}

	void State::print () {

	}


	Search::Search (Schema* schema, 
		std::vector<ParsedJoin>& predicates, 
		std::vector<ExpressionWrapper>& filters, 
		int queryNum) 
	{
		params = new ProblemParameters(schema, predicates, filters, queryNum);

		assert((params->state_alloca).size() > 0);
		State* root = params->state_alloca[(params->state_alloca).size()-1];
		(params->state_alloca).pop_back();

		root->init_root(params);

		frontier.push_back(root);
		solution = nullptr;
	}

	void Search::run () {
		int explored = 0;
		double bound = -1.0;
		double worst = -1.0;
		double lastbound = -1.0;

		std::map<std::size_t, double> cnt;

		while (frontier.empty() == false) {
			explored++;
			
			int64_t besti = -1;
			double bestb = -1.0;

			besti = 0;
			bestb = frontier[0]->bound;

			assert(besti >= 0);
			assert(bestb >= 0.0);

			lastbound = bestb;

			State* cur = frontier[besti];

			frontier[besti] = frontier[frontier.size()-1];
			frontier.pop_back();

			while (1) {
				if (2*besti+1 >= frontier.size()) {
					break;
				} else if (2*besti+2 >= frontier.size()) {
					if (frontier[besti]->bound > frontier[2*besti+1]->bound) {
						State* tmp = frontier[besti];
						frontier[besti] = frontier[2*besti+1];
						frontier[2*besti+1] = tmp;
						besti = 2*besti+1;
					} else {
						break;
					}
				} else {
					int mini = -1;
					if (frontier[2*besti+1]->bound > frontier[2*besti+2]->bound) {
						mini = 2*besti+2;
					} else {
						mini = 2*besti+1;
					}

					if (frontier[besti]->bound > frontier[mini]->bound) {
						State* tmp = frontier[besti];
						frontier[besti] = frontier[mini];
						frontier[mini] = tmp;
						besti = mini;
					} else {
						break;
					}
				}
			}

			double prune;
			double prune2;


			//cur->getHeuristicCost(params, prune, prune2);
			prune = cur->heuristic;

			if (bound < 0 || prune < bound) {
				bound = prune;
				//worst = prune2;
			}

			if (bound < 0 || bestb < 1.0*bound) {
				if (cur->isComplete(params)) {
					solution = cur;
					bound = cur->cost;
					worst = cur->cost2;
					//std::cout << "new solution " << cur->cost << std::endl;
				} else {
					cur->expand(frontier, params, cnt, bound);
				}
			}

			//std::cout << "before" << std::endl;

			cur->purge();
			(params->state_alloca).push_back(cur);
		}
	}

	void Search::opt (Schema* schema, std::vector<std::pair<std::pair<int, std::bitset<MAXQUERIES> >, std::pair<std::pair<uint64_t, uint64_t>, std::pair<bool, uint64_t> > > >& mqo_join_order) {
		std::map<int, std::pair<int, std::bitset<MAXQUERIES> > >* actions_taken = new std::map<int, std::pair<int, std::bitset<MAXQUERIES> > >[params->queryNum];
		std::map<std::pair<int, std::pair<uint64_t, uint64_t> >, std::pair<double, double> > opcards;
		std::map<std::pair<int, std::pair<uint64_t, uint64_t> >, std::pair<double, double> >* cards_per_query = new std::map<std::pair<int, std::pair<uint64_t, uint64_t> >, std::pair<double, double> >[params->queryNum];

		assert((params->state_alloca).size() > 0);
		State* root = params->state_alloca[(params->state_alloca).size()-1];
		(params->state_alloca).pop_back();

		root->init_root(params);
		double cost, cost2;
		root->getOpt(params, cost, cost2, actions_taken, opcards, cards_per_query);

		std::map<std::string, bool > lineageFlip;
		std::map<std::string, uint64_t > lineageMaxsize;
		std::map<std::string, std::bitset<MAXQUERIES> > lineageQueries;
		std::map<std::string, uint64_t> lineageOperators;
		std::map<std::string, std::pair<uint64_t, uint64_t> > lineageInputs;

		for (int i = 0; i < params->queryNum; i++) {
			std::vector<uint64_t> relClusters;

			std::map<uint64_t, std::string> lineage;
			std::map<uint64_t, std::string> lineageop;

			for (int j = 0; j < params->relNum; j++) {
				if (params->relQueries[j].test(i)) {
					relClusters.push_back((1ull) << j);
					std::string expr = schema->getTableString(j);
					lineage[(1ull) << j] = expr;
				}
			}

			std::string s;

			for (std::map<int, std::pair<int, std::bitset<MAXQUERIES> > >::iterator it = actions_taken[i].begin(); it != actions_taken[i].end(); ++it) {
				uint64_t opLeftRelation = (1ull) << params->opTableLeft[(it->second).first];
				uint64_t opRightRelation = (1ull) << params->opTableRight[(it->second).first];

				int idx1 = -1;
				int idx2 = -1;

				for (int j = 0; j < relClusters.size(); j++) {
					if (relClusters[j] & opLeftRelation) {
						idx1 = j;
					}

					if (relClusters[j] & opRightRelation) {
						idx2 = j;
					}
				}

				assert(idx1 != -1);

				assert(idx2 != -1);

				assert(idx1 != idx2);

				uint64_t tmp;

				tmp = relClusters[idx1];
				relClusters[idx1] = relClusters[relClusters.size()-2];
				relClusters[relClusters.size()-2] = tmp;

				if (idx2 == relClusters.size()-2)
					idx2 = idx1;

				tmp = relClusters[idx2];
				relClusters[idx2] = relClusters[relClusters.size()-1];
				relClusters[relClusters.size()-1] = tmp;

				std::pair<uint64_t, uint64_t> p (relClusters[relClusters.size()-2], relClusters[relClusters.size()-1]);
				std::pair<int, std::pair<uint64_t, uint64_t> > pc((it->second).first, p);
				assert(cards_per_query[i].find(pc) != cards_per_query[i].end());

				std::pair<double, double> card_est = cards_per_query[i][pc];

				

				//assert(match);

				double buildSize = -1;

				std::string expr;
				if (true) {
					expr = "(" + lineage[relClusters[relClusters.size()-2]] + ") JOIN (" + lineage[relClusters[relClusters.size()-1]] + ")";
					lineageFlip[expr] = false;
					buildSize = card_est.second;
				} else {
					expr = "(" + lineage[relClusters[relClusters.size()-1]] + ") JOIN (" + lineage[relClusters[relClusters.size()-2]] + ")";
					lineageFlip[expr] = true;
					buildSize = card_est.first;
				}
				

				lineage[relClusters[relClusters.size()-2] | relClusters[relClusters.size()-1]] = expr;
				lineageop[(it->second).first] = lineage[relClusters[relClusters.size()-2] | relClusters[relClusters.size()-1]];


				if (lineageQueries.find(lineage[relClusters[relClusters.size()-2] | relClusters[relClusters.size()-1]]) == lineageQueries.end()) {
					lineageQueries[lineage[relClusters[relClusters.size()-2] | relClusters[relClusters.size()-1]]] = 0;
					lineageOperators[lineage[relClusters[relClusters.size()-2] | relClusters[relClusters.size()-1]]] = (it->second).first;

					std::pair<uint64_t, uint64_t> p (relClusters[relClusters.size()-2], relClusters[relClusters.size()-1]);
					lineageInputs[lineage[relClusters[relClusters.size()-2] | relClusters[relClusters.size()-1]]] = p;

					lineageMaxsize[lineage[relClusters[relClusters.size()-2] | relClusters[relClusters.size()-1]]] = 0;
				}

				lineageQueries[lineage[relClusters[relClusters.size()-2] | relClusters[relClusters.size()-1]]].set(i);
				lineageMaxsize[lineage[relClusters[relClusters.size()-2] | relClusters[relClusters.size()-1]]] += ceil(buildSize);

				relClusters[relClusters.size()-2] |= relClusters[relClusters.size()-1];
				relClusters.pop_back();

				s = expr;
			}
		}

		for (std::map<std::string, uint64_t>::iterator it = lineageOperators.begin(); it != lineageOperators.end(); ++it) {
			std::pair<int, std::bitset<MAXQUERIES> > p(lineageOperators[it->first], lineageQueries[it->first]);

			std::pair<uint64_t, uint64_t> inputs = lineageInputs[it->first];

			
			bool match = false;
			bool flipb = false;

			for (std::map<std::pair<int, std::pair<uint64_t, uint64_t> >, std::pair<double, double> >::iterator it2 = opcards.begin(); it2 != opcards.end(); ++it2) {
				if ((it2->first).first == lineageOperators[it->first] && inputs.first == (it2->first).second.first && inputs.second == (it2->first).second.second) {
					match = true;

					if ((it2->second).second > (it2->second).first) {
						flipb = true;
					}
					break;
				}
			}

			assert(match);

			assert(lineageMaxsize.find(it->first) != lineageMaxsize.end());
			assert(lineageFlip.find(it->first) != lineageFlip.end());

			std::pair<bool, uint64_t> flip (flipb, lineageMaxsize[it->first]);

			std::pair<std::pair<uint64_t, uint64_t>, std::pair<bool, uint64_t> > p2(lineageInputs[it->first], flip);


			std::pair<std::pair<int, std::bitset<MAXQUERIES> >, std::pair<std::pair<uint64_t, uint64_t>, std::pair<bool, uint64_t> > > p3(p, p2);
			mqo_join_order.push_back(p3);
		}
	}

	void Search::optSubexpr (Schema* schema, std::vector<std::pair<std::pair<int, std::bitset<MAXQUERIES> >, std::pair<std::pair<uint64_t, uint64_t>, std::pair<bool, uint64_t> > > >& mqo_join_order) {
		std::map<int, std::pair<int, std::bitset<MAXQUERIES> > >* actions_taken = new std::map<int, std::pair<int, std::bitset<MAXQUERIES> > >[params->queryNum];
		std::map<std::pair<int, std::pair<uint64_t, uint64_t> >, std::pair<double, double> > opcards;
		std::map<std::pair<int, std::pair<uint64_t, uint64_t> >, std::pair<double, double> >* cards_per_query = new std::map<std::pair<int, std::pair<uint64_t, uint64_t> >, std::pair<double, double> >[params->queryNum];

		assert((params->state_alloca).size() > 0);
		State* root = params->state_alloca[(params->state_alloca).size()-1];
		(params->state_alloca).pop_back();

		root->init_root(params);
		double cost, cost2;

		clock_t begin = clock();

		root->getOptSubexpr(schema, params, cost, cost2, actions_taken, opcards, cards_per_query);

		clock_t end = clock();
		double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;

		std::cout << "time: " << time_spent << std::endl;
		exit(0);

		std::map<std::string, bool > lineageFlip;
		std::map<std::string, uint64_t > lineageMaxsize;
		std::map<std::string, std::bitset<MAXQUERIES> > lineageQueries;
		std::map<std::string, uint64_t> lineageOperators;
		std::map<std::string, std::pair<uint64_t, uint64_t> > lineageInputs;

		for (int i = 0; i < params->queryNum; i++) {
			std::vector<uint64_t> relClusters;

			std::map<uint64_t, std::string> lineage;
			std::map<uint64_t, std::string> lineageop;

			for (int j = 0; j < params->relNum; j++) {
				if (params->relQueries[j].test(i)) {
					relClusters.push_back((1ull) << j);
					std::string expr = schema->getTableString(j);
					lineage[(1ull) << j] = expr;
				}
			}

			std::string s;

			for (std::map<int, std::pair<int, std::bitset<MAXQUERIES> > >::iterator it = actions_taken[i].begin(); it != actions_taken[i].end(); ++it) {
				uint64_t opLeftRelation = (1ull) << params->opTableLeft[(it->second).first];
				uint64_t opRightRelation = (1ull) << params->opTableRight[(it->second).first];

				int idx1 = -1;
				int idx2 = -1;

				for (int j = 0; j < relClusters.size(); j++) {
					if (relClusters[j] & opLeftRelation) {
						idx1 = j;
					}

					if (relClusters[j] & opRightRelation) {
						idx2 = j;
					}
				}

				assert(idx1 != -1);

				assert(idx2 != -1);

				assert(idx1 != idx2);

				uint64_t tmp;

				tmp = relClusters[idx1];
				relClusters[idx1] = relClusters[relClusters.size()-2];
				relClusters[relClusters.size()-2] = tmp;

				if (idx2 == relClusters.size()-2)
					idx2 = idx1;

				tmp = relClusters[idx2];
				relClusters[idx2] = relClusters[relClusters.size()-1];
				relClusters[relClusters.size()-1] = tmp;

				std::pair<uint64_t, uint64_t> p (relClusters[relClusters.size()-2], relClusters[relClusters.size()-1]);
				std::pair<int, std::pair<uint64_t, uint64_t> > pc((it->second).first, p);
				assert(cards_per_query[i].find(pc) != cards_per_query[i].end());

				std::pair<double, double> card_est = cards_per_query[i][pc];

				

				//assert(match);

				double buildSize = -1;

				std::string expr;
				if (true) {
					expr = "(" + lineage[relClusters[relClusters.size()-2]] + ") JOIN (" + lineage[relClusters[relClusters.size()-1]] + ")";
					lineageFlip[expr] = false;
					buildSize = card_est.second;
				} else {
					expr = "(" + lineage[relClusters[relClusters.size()-1]] + ") JOIN (" + lineage[relClusters[relClusters.size()-2]] + ")";
					lineageFlip[expr] = true;
					buildSize = card_est.first;
				}

				std::cout << expr << std::endl;
				

				lineage[relClusters[relClusters.size()-2] | relClusters[relClusters.size()-1]] = expr;
				lineageop[(it->second).first] = lineage[relClusters[relClusters.size()-2] | relClusters[relClusters.size()-1]];


				if (lineageQueries.find(lineage[relClusters[relClusters.size()-2] | relClusters[relClusters.size()-1]]) == lineageQueries.end()) {
					lineageQueries[lineage[relClusters[relClusters.size()-2] | relClusters[relClusters.size()-1]]] = 0;
					lineageOperators[lineage[relClusters[relClusters.size()-2] | relClusters[relClusters.size()-1]]] = (it->second).first;

					std::pair<uint64_t, uint64_t> p (relClusters[relClusters.size()-2], relClusters[relClusters.size()-1]);
					lineageInputs[lineage[relClusters[relClusters.size()-2] | relClusters[relClusters.size()-1]]] = p;

					lineageMaxsize[lineage[relClusters[relClusters.size()-2] | relClusters[relClusters.size()-1]]] = 0;
				}

				lineageQueries[lineage[relClusters[relClusters.size()-2] | relClusters[relClusters.size()-1]]].set(i);
				lineageMaxsize[lineage[relClusters[relClusters.size()-2] | relClusters[relClusters.size()-1]]] += ceil(buildSize);

				relClusters[relClusters.size()-2] |= relClusters[relClusters.size()-1];
				relClusters.pop_back();

				s = expr;
			}
		}

		for (std::map<std::string, uint64_t>::iterator it = lineageOperators.begin(); it != lineageOperators.end(); ++it) {
			std::pair<int, std::bitset<MAXQUERIES> > p(lineageOperators[it->first], lineageQueries[it->first]);

			std::pair<uint64_t, uint64_t> inputs = lineageInputs[it->first];

			
			bool match = false;
			bool flipb = false;

			for (std::map<std::pair<int, std::pair<uint64_t, uint64_t> >, std::pair<double, double> >::iterator it2 = opcards.begin(); it2 != opcards.end(); ++it2) {
				if ((it2->first).first == lineageOperators[it->first] && inputs.first == (it2->first).second.first && inputs.second == (it2->first).second.second) {
					match = true;

					if ((it2->second).second > (it2->second).first) {
						flipb = true;
					}
					break;
				}
			}

			assert(match);

			assert(lineageMaxsize.find(it->first) != lineageMaxsize.end());
			assert(lineageFlip.find(it->first) != lineageFlip.end());

			std::pair<bool, uint64_t> flip (flipb, lineageMaxsize[it->first]);

			std::pair<std::pair<uint64_t, uint64_t>, std::pair<bool, uint64_t> > p2(lineageInputs[it->first], flip);


			std::pair<std::pair<int, std::bitset<MAXQUERIES> >, std::pair<std::pair<uint64_t, uint64_t>, std::pair<bool, uint64_t> > > p3(p, p2);
			mqo_join_order.push_back(p3);
		}
	}

	void Search::parseOpt (Schema* schema, std::vector<std::pair<std::pair<int, std::bitset<MAXQUERIES> >, std::pair<std::pair<uint64_t, uint64_t>, std::pair<bool, uint64_t> > > >& mqo_join_order, Loader* loader, std::map<int, std::string> parseFile) {
		std::map<int, std::pair<int, std::bitset<MAXQUERIES> > >* actions_taken = new std::map<int, std::pair<int, std::bitset<MAXQUERIES> > >[params->queryNum];
		std::map<std::pair<int, std::pair<uint64_t, uint64_t> >, std::pair<double, double> > opcards;
		std::map<std::pair<int, std::pair<uint64_t, uint64_t> >, std::pair<double, double> >* cards_per_query = new std::map<std::pair<int, std::pair<uint64_t, uint64_t> >, std::pair<double, double> >[params->queryNum];

		assert((params->state_alloca).size() > 0);
		State* root = params->state_alloca[(params->state_alloca).size()-1];
		(params->state_alloca).pop_back();

		root->init_root(params);
		double cost, cost2;
		root->parseOpt(params, cost, cost2, actions_taken, opcards, cards_per_query, loader, parseFile);

		std::map<std::string, bool > lineageFlip;
		std::map<std::string, uint64_t > lineageMaxsize;
		std::map<std::string, std::bitset<MAXQUERIES> > lineageQueries;
		std::map<std::string, uint64_t> lineageOperators;
		std::map<std::string, std::pair<uint64_t, uint64_t> > lineageInputs;

		for (int i = 0; i < params->queryNum; i++) {
			std::vector<uint64_t> relClusters;

			std::map<uint64_t, std::string> lineage;
			std::map<uint64_t, std::string> lineageop;

			for (int j = 0; j < params->relNum; j++) {
				if (params->relQueries[j].test(i)) {
					relClusters.push_back((1ull) << j);
					std::string expr = schema->getTableString(j);
					lineage[(1ull) << j] = expr;
				}
			}

			std::string s;

			for (std::map<int, std::pair<int, std::bitset<MAXQUERIES> > >::iterator it = actions_taken[i].begin(); it != actions_taken[i].end(); ++it) {
				uint64_t opLeftRelation = (1ull) << params->opTableLeft[(it->second).first];
				uint64_t opRightRelation = (1ull) << params->opTableRight[(it->second).first];

				int idx1 = -1;
				int idx2 = -1;

				for (int j = 0; j < relClusters.size(); j++) {
					if (relClusters[j] & opLeftRelation) {
						idx1 = j;
					}

					if (relClusters[j] & opRightRelation) {
						idx2 = j;
					}
				}

				assert(idx1 != -1);

				assert(idx2 != -1);

				assert(idx1 != idx2);

				uint64_t tmp;

				tmp = relClusters[idx1];
				relClusters[idx1] = relClusters[relClusters.size()-2];
				relClusters[relClusters.size()-2] = tmp;

				if (idx2 == relClusters.size()-2)
					idx2 = idx1;

				tmp = relClusters[idx2];
				relClusters[idx2] = relClusters[relClusters.size()-1];
				relClusters[relClusters.size()-1] = tmp;

				std::pair<uint64_t, uint64_t> p (relClusters[relClusters.size()-2], relClusters[relClusters.size()-1]);
				std::pair<int, std::pair<uint64_t, uint64_t> > pc((it->second).first, p);
				assert(cards_per_query[i].find(pc) != cards_per_query[i].end());

				std::pair<double, double> card_est = cards_per_query[i][pc];

				

				//assert(match);

				double buildSize = -1;

				std::string expr;
				if (true) {
					expr = "(" + lineage[relClusters[relClusters.size()-2]] + ") JOIN (" + lineage[relClusters[relClusters.size()-1]] + ")";
					lineageFlip[expr] = false;
					buildSize = card_est.second;
				} else {
					expr = "(" + lineage[relClusters[relClusters.size()-1]] + ") JOIN (" + lineage[relClusters[relClusters.size()-2]] + ")";
					lineageFlip[expr] = true;
					buildSize = card_est.first;
				}
				

				lineage[relClusters[relClusters.size()-2] | relClusters[relClusters.size()-1]] = expr;
				lineageop[(it->second).first] = lineage[relClusters[relClusters.size()-2] | relClusters[relClusters.size()-1]];


				if (lineageQueries.find(lineage[relClusters[relClusters.size()-2] | relClusters[relClusters.size()-1]]) == lineageQueries.end()) {
					lineageQueries[lineage[relClusters[relClusters.size()-2] | relClusters[relClusters.size()-1]]] = 0;
					lineageOperators[lineage[relClusters[relClusters.size()-2] | relClusters[relClusters.size()-1]]] = (it->second).first;

					std::pair<uint64_t, uint64_t> p (relClusters[relClusters.size()-2], relClusters[relClusters.size()-1]);
					lineageInputs[lineage[relClusters[relClusters.size()-2] | relClusters[relClusters.size()-1]]] = p;

					lineageMaxsize[lineage[relClusters[relClusters.size()-2] | relClusters[relClusters.size()-1]]] = 0;
				}

				lineageQueries[lineage[relClusters[relClusters.size()-2] | relClusters[relClusters.size()-1]]].set(i);
				lineageMaxsize[lineage[relClusters[relClusters.size()-2] | relClusters[relClusters.size()-1]]] += ceil(buildSize);

				relClusters[relClusters.size()-2] |= relClusters[relClusters.size()-1];
				relClusters.pop_back();

				s = expr;
			}
		}

		for (std::map<std::string, uint64_t>::iterator it = lineageOperators.begin(); it != lineageOperators.end(); ++it) {
			std::pair<int, std::bitset<MAXQUERIES> > p(lineageOperators[it->first], lineageQueries[it->first]);

			std::pair<uint64_t, uint64_t> inputs = lineageInputs[it->first];

			
			bool match = false;
			bool flipb = false;

			for (std::map<std::pair<int, std::pair<uint64_t, uint64_t> >, std::pair<double, double> >::iterator it2 = opcards.begin(); it2 != opcards.end(); ++it2) {
				if ((it2->first).first == lineageOperators[it->first] && inputs.first == (it2->first).second.first && inputs.second == (it2->first).second.second) {
					match = true;

					if ((it2->second).second > (it2->second).first) {
						flipb = true;
					}
					break;
				}
			}

			assert(match);

			assert(lineageMaxsize.find(it->first) != lineageMaxsize.end());
			assert(lineageFlip.find(it->first) != lineageFlip.end());

			std::pair<bool, uint64_t> flip (flipb, lineageMaxsize[it->first]);

			std::pair<std::pair<uint64_t, uint64_t>, std::pair<bool, uint64_t> > p2(lineageInputs[it->first], flip);


			std::pair<std::pair<int, std::bitset<MAXQUERIES> >, std::pair<std::pair<uint64_t, uint64_t>, std::pair<bool, uint64_t> > > p3(p, p2);
			mqo_join_order.push_back(p3);
		}
	}
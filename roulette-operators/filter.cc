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

#include "filter.h"

PolyFilter::PolyFilter (Schema* schema, int columnId) 
	: schema(schema), columnId(columnId), filterNumber(0), 
	eqFilterNumber(0), neqFilterNumber(0), ltFilterNumber(0), gtFilterNumber(0), leFilterNumber(0), geFilterNumber(0),
	eqQueryAggr(0), neqQueryAggr(0), ltQueryAggr(0), leQueryAggr(0), gtQueryAggr(0), geQueryAggr(0) {
		eqPredicates = new MiniHT();
		neqPredicates = new MiniHT();

	for (int i = 0; i < 2*MAXTHREADS; i++) {
		buffers[i] = schema->getBufferManager()->getBuffer();
		memset(buffers[i], -1, 1024*sizeof(std::bitset<MAXQUERIES>));
	}
}

void PolyFilter::destroy () {
	for (int i = 0; i < 2*MAXTHREADS; i++) {
		schema->getBufferManager()->freeBuffer(buffers[i]);
	}

	delete eqPredicates;
	delete neqPredicates;
}


std::bitset<MAXQUERIES>* PolyFilter::apply (DataBlock* data, int threadId) {
	int* attr = (int*) data->getColumn(columnId, buffers[threadId]);
	std::bitset<MAXQUERIES>* ret = (std::bitset<MAXQUERIES>*) buffers[threadId+MAXTHREADS];

	int size = data->getSize();

	for (int i = 0; i < size; i++) {
		ret[i].reset();
		ret[i] = ~ret[i];
	}

	assert(size*sizeof(std::bitset<MAXQUERIES>) <= schema->getBufferManager()->getBlockSize());
	memset(ret, -1, size*sizeof(std::bitset<MAXQUERIES>));

	if (eqFilterNumber != 0) {
		std::bitset<MAXQUERIES> cqueries = eqQueryAggr & data->getQuery();
		std::bitset<MAXQUERIES> fail = data->getQuery() & (~cqueries);

		int* heads = &(eqPredicates->heads[0]);
		int* values = &(eqPredicates->values[0]);
		std::bitset<MAXQUERIES> * payloads = &(eqPredicates->payloads[0]);
		int* next = &(eqPredicates->next[0]);

		for (int i = 0; i < size; i++) {
			int hval = HASHT(attr[i]) & ((1 << HTHASHBITS) - 1);
			std::bitset<MAXQUERIES> bits = fail;

			int cur = heads[hval];
			while (cur >= 0) {
				if (values[cur] == attr[i])
					bits |= payloads[cur];
				cur = next[cur];
			}

			ret[i] &= bits;
		}
	}

	if (neqFilterNumber != 0) {
		std::bitset<MAXQUERIES> cqueries = neqQueryAggr & data->getQuery();
		std::bitset<MAXQUERIES> fail = data->getQuery() & (~cqueries);
		std::bitset<MAXQUERIES> pass = cqueries | fail;

		int* heads = &(neqPredicates->heads[0]);
		int* values = &(neqPredicates->values[0]);
		std::bitset<MAXQUERIES> * payloads = &(neqPredicates->payloads[0]);
		int* next = &(neqPredicates->next[0]);

		for (int i = 0; i < size; i++) {
			int hval = HASHT(attr[i]) & ((1 << HTHASHBITS) - 1);
			std::bitset<MAXQUERIES> bits = pass;

			int cur = heads[hval];
			while (cur >= 0) {
				if (values[cur] == attr[i])
					bits &= ~payloads[cur];
				cur = next[cur];
			}

			ret[i] &= bits;
		}
	}
		
	std::bitset<MAXQUERIES> cqueries = ridx.getAccumulator() & data->getQuery();
	std::bitset<MAXQUERIES> fail = data->getQuery() & (~cqueries);

	if (ridx.getAccumulator().any()){
			for (int i = 0; i < size; i++) {
				int val = attr[i];
		
				if (val != NULL_VALUE) {
					std::bitset<MAXQUERIES> msk = ridx.lookupOpt(val) | fail;
		
					ret[i] &= msk;
				}
			}
		}

	if (likeLookup.size() != 0) {
		for (int j = 0; j < likeLookup.size(); j++) {
			std::bitset<MAXQUERIES> cqueries = likeQueries[j] & data->getQuery();
			std::bitset<MAXQUERIES> fail = data->getQuery() & (~cqueries);
			std::bitset<MAXQUERIES> pass = cqueries | fail;

			int* curLookup = likeLookup[j];

			for (int i = 0; i < size; i++) {
				ret[i] &= (attr[i] != NULL_VALUE && curLookup[attr[i]] == 0)? pass : fail;
			}
		}
	}

	if (nlikeLookup.size() != 0) {
		for (int j = 0; j < nlikeLookup.size(); j++) {
			std::bitset<MAXQUERIES> cqueries = nlikeQueries[j] & data->getQuery();
			std::bitset<MAXQUERIES> fail = data->getQuery() & (~cqueries);
			std::bitset<MAXQUERIES> pass = cqueries | fail;

			for (int i = 0; i < size; i++) {
				ret[i] &= (attr[i] == NULL_VALUE || nlikeLookup[j][attr[i]] != 0)? pass : fail;
			}
		}
	}
		
	return ret;
}

void PolyFilter::setQuery (std::bitset<MAXQUERIES> queries) {
	eqQueryAggr = queries;
	neqQueryAggr = queries;
	ltQueryAggr = queries;
	gtQueryAggr = queries;
	leQueryAggr = queries;
	geQueryAggr = queries;
	lkQueryAggr = queries;
}

void PolyFilter::updateQuery (std::map<int, int>& mapping) {
	eqQueryAggr = mapQueries(eqQueryAggr, mapping);
	neqQueryAggr = mapQueries(neqQueryAggr, mapping);
	ltQueryAggr = mapQueries(ltQueryAggr, mapping);
	gtQueryAggr = mapQueries(gtQueryAggr, mapping);
	leQueryAggr = mapQueries(leQueryAggr, mapping);
	geQueryAggr = mapQueries(geQueryAggr, mapping);
	lkQueryAggr = mapQueries(lkQueryAggr, mapping);

	for (int i = 0; i < likeQueries.size(); i++) {
		likeQueries[i] = mapQueries(likeQueries[i], mapping);
	}

	for (int i = 0; i < nlikeQueries.size(); i++) {
		nlikeQueries[i] = mapQueries(nlikeQueries[i], mapping);
	}

	eqPredicates->updateQuery(mapping);
	neqPredicates->updateQuery(mapping);
}

void PolyFilter::addEq (int val, std::bitset<MAXQUERIES> queries) {
	eqPredicates->insertVal(val, queries);
	eqQueryAggr |= queries;
	filterNumber++;
	eqFilterNumber++;
}
	
void PolyFilter::addNeq (int val, std::bitset<MAXQUERIES> queries) {
	neqPredicates->insertVal(val, queries);
	neqQueryAggr |= queries;
	filterNumber++;
	neqFilterNumber++;
}
	
void PolyFilter::addLt (int val, std::bitset<MAXQUERIES> queries) {
	ridx.addLT(val, queries);

	ltQueryAggr |= queries;
	filterNumber++;
	ltFilterNumber++;
}
	
void PolyFilter::addGt (int val, std::bitset<MAXQUERIES> queries) {
	ridx.addGT(val, queries);

	gtQueryAggr |= queries;
	filterNumber++;
	gtFilterNumber++;
}

void PolyFilter::addLe (int val, std::bitset<MAXQUERIES> queries) {
	ridx.addLE(val, queries);

	leQueryAggr |= queries;
	filterNumber++;
	leFilterNumber++;
}
	
void PolyFilter::addGe (int val, std::bitset<MAXQUERIES> queries) {
	ridx.addGE(val, queries);

	geQueryAggr |= queries;
	filterNumber++;
	geFilterNumber++;
}

void PolyFilter::addLikeLookup (int* lookup, std::bitset<MAXQUERIES> queries, std::string expr, int type) {
	for (int i = 0; i < likeLookup.size(); i++) {
		if (expr.compare(likeExpr[i]) == 0 && type == likeType[i]) {

			likeQueries[i] |= queries;
			lkQueryAggr |= queries;
			return;
		}
	}

	likeLookup.push_back(lookup);
	likeQueries.push_back(queries);
	likeExpr.push_back(expr);
	likeType.push_back(type);
	lkQueryAggr |= queries;
	filterNumber++;
}

void PolyFilter::addNLikeLookup (int* lookup, std::bitset<MAXQUERIES> queries, std::string expr) {
	for (int i = 0; i < nlikeLookup.size(); i++) {
		if (expr.compare(nlikeExpr[i]) == 0) {

			nlikeQueries[i] |= queries;
			lkQueryAggr |= queries;
			return;
		}
	}

	nlikeLookup.push_back(lookup);
	nlikeQueries.push_back(queries);
	nlikeExpr.push_back(expr);
	lkQueryAggr |= queries;
	filterNumber++;
}

void PolyFilter::fuseLikeLookups () {
	for (int j = 0; j < likeLookup.size(); j++)
		std::cout << "size of table " << sizeof(likeLookup[j]) << std::endl;
}

void PolyFilter::print () {
	std::cout << "eq hashtable" << std::endl;
	eqPredicates->printVals();

	std::cout << "neq hashtable" << std::endl;
	neqPredicates->printVals();


	std::cout << "like " << likeLookup.size() << std::endl;

	std::cout << "nlike " << nlikeLookup.size() << std::endl;
}

bool PolyFilter::isFilter () {
	return filterNumber != 0;
}

int PolyFilter::getTarget () {
	return columnId;
}

Filter* PolyFilter::merge (Filter* filter, std::bitset<MAXQUERIES> validQueries) {
	assert(false);

	return nullptr;
}

ConjunctiveFilter::ConjunctiveFilter (Evaluator* cond, std::bitset<MAXQUERIES> queries) : cond(cond), queries(queries) {
	mark = (char*) numa_alloc_onnode((1 << 16)*MAXTHREADS*sizeof(int), SOCKET);

	for (int i = 0; i < (1 << 16)*MAXTHREADS*sizeof(int); i++) {
		mark[i] = 5;
	}
}

void ConjunctiveFilter::destroy () {
	assert(false);
}

std::bitset<MAXQUERIES>* ConjunctiveFilter::apply (DataBlock* data, int threadId) {
	return (std::bitset<MAXQUERIES>*) cond->apply(data, threadId);
}

Filter* ConjunctiveFilter::merge (Filter* filter) {
	return nullptr;
}

void ConjunctiveFilter::updateQuery (std::map<int, int>& mapping) {
	assert(false && "need to update queries attribute as well" == nullptr);
	cond->updateQuery(mapping);
}

JoinFilter::JoinFilter (FilterJoinEvaluator* cond) : cond(cond) {

}

void JoinFilter::destroy () {
	assert(false);
}

std::bitset<MAXQUERIES>* JoinFilter::apply (DataBlock* data, int threadId) {
	return (std::bitset<MAXQUERIES>*) cond->apply(data, threadId);
}

Filter* JoinFilter::merge (Filter* filter) {
	return nullptr;
}

void JoinFilter::updateQuery (std::map<int, int>& mapping) {
	cond->updateQuery(mapping);
}

void JoinFilter::printtype () {
	std::cout << "filter join" << std::endl;
}

int JoinFilter::getJoinID () {
	return cond->getJoinID();
}

std::bitset<MAXQUERIES> JoinFilter::getQuery () {
	return cond->getQuery();
}

void JoinFilter::addQuery (std::bitset<MAXQUERIES> newqueries) {
	cond->addQuery(newqueries);
}

void JoinFilter::setQuery (std::bitset<MAXQUERIES>& queries) {
	cond->setQuery(queries);
}

Q28Filter::Q28Filter (
	Schema* schema, 
	std::vector<int> columnId, 
	std::vector<std::bitset<MAXQUERIES> > queries,
	std::vector<int> low1, std::vector<int> high1,
	std::vector<int> low2, std::vector<int> high2,
	std::vector<int> low3, std::vector<int> high3	
) {
	assert(columnId.size() == 3);

	cf1 = new PolyFilter(schema, columnId[0]);
	cf2 = new PolyFilter(schema, columnId[1]);
	cf3 = new PolyFilter(schema, columnId[2]);

	std::bitset<MAXQUERIES> q;

	for (int i = 0; i < queries.size(); i++) {
		cf1->addGe(low1[i], queries[i]);
		cf2->addGe(low2[i], queries[i]);
		cf3->addGe(low3[i], queries[i]);

		cf1->addLe(high1[i], queries[i]);
		cf2->addLe(high2[i], queries[i]);
		cf3->addLe(high3[i], queries[i]);

		q |= queries[i];
	}

	cf1->setQuery(q);
	cf2->setQuery(q);
	cf3->setQuery(q);
}

std::bitset<MAXQUERIES>* Q28Filter::apply (DataBlock* data, int threadId) {
	std::bitset<MAXQUERIES>* ret1 = cf1->apply(data, threadId);
	std::bitset<MAXQUERIES>* ret2 = cf2->apply(data, threadId);
	std::bitset<MAXQUERIES>* ret3 = cf3->apply(data, threadId);

	uint64_t size = data->getSize();

	for (int i = 0; i < size; i++) {
		ret1[i] = ret1[i] | ret2[i] | ret3[i];
	}

	return ret1;
}


Q13Filter::Q13Filter (
		Schema* schema, 
		std::vector<int> columnId, 
		std::vector<std::bitset<MAXQUERIES> > queries,
		std::vector<int> eq1, 
		std::vector<int> eq2,
		std::vector<int> eq3,
		std::vector<int> low4, std::vector<int> high4	
) {
		/*assert(columnId.size() == 3);

		cf1 = new PolyFilter(schema, columnId[0]);
		cf2 = new PolyFilter(schema, columnId[1]);
		cf3 = new PolyFilter(schema, columnId[2]);

		std::bitset<MAXQUERIES> q;

		for (int i = 0; i < queries.size(); i++) {
			cf1->addGe(low1[i], queries[i]);
			cf2->addGe(low2[i], queries[i]);
			cf3->addGe(low3[i], queries[i]);

			cf1->addLe(high1[i], queries[i]);
			cf2->addLe(high2[i], queries[i]);
			cf3->addLe(high3[i], queries[i]);

			q |= queries[i];
		}

		cf1->setQuery(q);
		cf2->setQuery(q);
		cf3->setQuery(q);*/
}

std::bitset<MAXQUERIES>* Q13Filter::apply (DataBlock* data, int threadId) {
	/*std::bitset<MAXQUERIES>* ret1 = cf1->apply(data, threadId);
	std::bitset<MAXQUERIES>* ret2 = cf2->apply(data, threadId);
	std::bitset<MAXQUERIES>* ret3 = cf3->apply(data, threadId);

	uint64_t size = data->getSize();

	for (int i = 0; i < size; i++) {
		ret1[i] = ret1[i] | ret2[i] | ret3[i];
	}

	return ret1;*/
	return nullptr;
}
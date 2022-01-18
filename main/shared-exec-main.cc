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

#include "../baseline-operators/filter-operators.h"
#include "../baseline-operators/join-operators.h"
#include "../baseline-operators/sum-operators.h"
#include "../baseline-operators/relbuilder.h"

#include "../frontend/parser.h"
#include "../frontend/opt.h"

#include <thread>
#include <map>



void worker(RelBuilder* rel, std::atomic<int>* lock, std::atomic<int>* barriers, Schema* schema, const ParsedQuery& pquery, std::vector<std::pair<std::pair<int, std::bitset<MAXQUERIES> >, std::pair<std::pair<uint64_t, uint64_t>, std::pair<bool, uint64_t> > > >* joinorder, int threadId, int numthreads) {
	lock->fetch_add(1);
	while (lock->load() < numthreads+1);
	std::cout << threadId << " started" << std::endl;
	
	
	rel->execute(threadId, barriers, numthreads);
}

void run1 (Schema* schema, const ParsedQuery& pquery, std::vector<std::pair<std::pair<int, std::bitset<MAXQUERIES> >, std::pair<std::pair<uint64_t, uint64_t>, std::pair<bool, uint64_t> > > >& joinorder, int numthreads) {
	int* mapping = new int[48];
	getAffinityTable(mapping);

	std::thread t[MAXTHREADS];
	cpu_set_t thread_affinity[MAXTHREADS];

	std::atomic<int> spinlock;
	spinlock.store(0);

	RelBuilder* rel = new(numa_alloc_onnode(sizeof(RelBuilder), SOCKET)) RelBuilder(schema, pquery, joinorder, true, numthreads);

	std::atomic<int>* barriers = new(numa_alloc_onnode(rel->getNumberOfOps()*sizeof(std::atomic<int>), SOCKET)) std::atomic<int>[rel->getNumberOfOps()]; 

	for (int i = 0; i < rel->getNumberOfOps(); i++) {
		barriers[i].store(0);
	}

	for (int i = 0; i < numthreads; i++) {
		t[i] = std::thread(worker, rel, &spinlock, barriers, schema, pquery, &joinorder, i, numthreads);
		CPU_ZERO(&thread_affinity[i]);
		CPU_SET(mapping[i], &thread_affinity[i]);
		pthread_setaffinity_np(t[i].native_handle(), sizeof(cpu_set_t), &thread_affinity[i]);
	}
	

	spinlock.fetch_add(1);

	for (int i = 0; i < numthreads; i++)
		t[i].join();

	delete[] mapping;
}

int main (int argc, char** argv) {
	srand(time(NULL));

	std::string path(argv[1]);
	std::cout << "Path=" << path << std::endl;


	std::string execPath(argv[2]);
	std::cout << "QueryFile=" << execPath << std::endl;

	int numthreads = atoi(argv[3]);

	std::vector<std::string> queryPath;
	std::map<int, std::string> planPath;

	std::ifstream execFile(path+"/"+execPath);
	if (execFile.is_open()) {
		int howmany;

		execFile >> howmany;
	
		for (int i = 0; i < howmany; i++) {
			std::string s;
			execFile >> s;
			queryPath.push_back(s);
			planPath[i] = path + s + ".postgres";
			std::cout << planPath[i] << std::endl;
		}

		execFile.close();
	} else {
		assert(false);
	}

	std::string schemaPath = "/schema.json";

	Parser parser(path, schemaPath, false, '|');

	for (int i = 0; i < queryPath.size(); i++) {
		parser.addQuery(queryPath[i]);
	}
	
	parser.prepare();

	Schema* schema = parser.getSchema();

	std::vector<ParsedQuery*>& allQueries = parser.getAllQueries();

	int* ordering;

	ParsedQuery batch = batchQueries(allQueries, 0);
	batch.optimizeGraph(schema);
	batch.makeBase(false);
	parser.load(ordering, &batch);

	schema->createStatistics();

	Search* s = new Search(schema, *(batch.joins), *(batch.filters), queryPath.size());

	std::vector<std::pair<std::pair<int, std::bitset<MAXQUERIES> >, std::pair<std::pair<uint64_t, uint64_t>, std::pair<bool, uint64_t> > > > mqo_join_order;

	s->opt(schema, mqo_join_order);
	//s->optSubexpr(schema, mqo_join_order);
	//s->parseOpt(schema, mqo_join_order, parser.getLoader(), planPath);

	//RelBuilder  rel(schema, batch, mqo_join_order, false);

	run1(schema, batch, mqo_join_order, numthreads);

	/*std::map<int,int> mapping;
	rel.getMappings(mapping);

	std::vector<ParsedQuery*> shuffle;

	for (std::map<int,int>::iterator it = mapping.begin(); it != mapping.end(); it++) {
		shuffle.push_back(allQueries[it->second]);
	}

	ParsedQuery batch2 = batchQueries(shuffle, 0);
	batch2.optimizeGraph(schema);
	batch2.makeBase(false);
	parser.load(ordering, &batch2);

	Search* s2 = new Search(schema, *(batch2.joins), *(batch2.filters), queryPath.size());

	std::vector<std::pair<std::pair<int, std::bitset<MAXQUERIES> >, std::pair<std::pair<uint64_t, uint64_t>, std::pair<bool, uint64_t> > > > mqo_join_order2;

	s2->opt(schema, mqo_join_order2);

	run1(schema, batch2, mqo_join_order2);*/

	return 0;
}

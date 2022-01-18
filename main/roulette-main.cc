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

#include "../frontend/planner.h"
#include "../memory/buffer-manager.h"
#include "../utilities/common.h"

#include "../frontend/parser.h"

#include <thread>

#include <iostream>
#include <fstream>


void worker(Executor* ctx, std::atomic<int>* lock, int id, int numthreads, bool alwaysOn) {
	lock->fetch_add(1);
	while (lock->load() < numthreads+1);
	ctx->execute(id, alwaysOn);
}

void run1 (Executor* master, Executor* ctx, int numthreads) {
	int* mapping = new int[48];
	getAffinityTable(mapping);

	std::thread t[MAXTHREADS];
	cpu_set_t thread_affinity[MAXTHREADS];

	std::atomic<int> spinlock;
	spinlock.store(0); 

	for (int i = 0; i < numthreads; i++) {
		t[i] = std::thread(worker, master, &spinlock, i, numthreads, false);
		CPU_ZERO(&thread_affinity[i]);
		CPU_SET(mapping[i], &thread_affinity[i]);
		pthread_setaffinity_np(t[i].native_handle(), sizeof(cpu_set_t), &thread_affinity[i]);
	}
	
	ctx->clearTimer();

	spinlock.fetch_add(1);


	for (int i = 0; i < numthreads; i++)
		t[i].join();

	delete[] mapping;
}

void run2 (Executor* master, Executor** ctx, std::vector<int> interval, int n, int numthreads) {
	int* mapping = new int[48];
	getAffinityTable(mapping);

	std::thread t[MAXTHREADS];
	cpu_set_t thread_affinity[MAXTHREADS];

	struct timespec start, finish;
	double elapsed;

	std::atomic<int> spinlock;
	spinlock.store(0);

	for (int i = 0; i < numthreads; i++) {
		t[i] = std::thread(worker, master, &spinlock, i, numthreads, true);
		CPU_ZERO(&thread_affinity[i]);
		CPU_SET(mapping[i], &thread_affinity[i]);
		pthread_setaffinity_np(t[i].native_handle(), sizeof(cpu_set_t), &thread_affinity[i]);
	}

	clock_gettime(CLOCK_MONOTONIC, &start);

	for (int i = 0; i < n; i++) {
		ctx[i]->mergeInto(master);

		if (i == 0) {
			spinlock.fetch_add(1);
		}

		usleep(1000*interval[i]);
	}

	for (int i = 0; i < numthreads; i++)
		t[i].join();

	delete[] mapping;
}


extern double timer;
extern int64_t intermediate_filters;
extern int64_t intermediate_enter;
extern int64_t intermediate_joins;


int main (int argc, char** argv) {
	srand(time(NULL));

	std::string path(argv[1]);
	std::cout << "Path=" << path << std::endl;

	std::string execPath(argv[2]);
	std::cout << "QueryFile=" << execPath << std::endl;

	std::vector<std::string> queryPath;

	std::ifstream execFile(path+"/"+execPath);
	if (execFile.is_open()) {
		int howmany;

		execFile >> howmany;
	
		for (int i = 0; i < howmany; i++) {
			std::string s;
			execFile >> s;
			queryPath.push_back(s);
		}

		execFile.close();
	} else {
		assert(false);
	}


	int numthreads = atoi(argv[3]);
	std::cout << "#Workers=" << numthreads << std::endl;


	std::string schemaPath = "/schema.json";

	Parser parser(path, schemaPath, false, '|'); 
	for (int i = 0; i < queryPath.size(); i++) {
		parser.addQuery(queryPath[i]);
	}
	
	parser.prepare();

	Schema* schema = parser.getSchema();
	BufferManager* bufferManager = schema->getBufferManager();

	std::vector<ParsedQuery*>& allQueries = parser.getAllQueries();


	int* ordering;

	ParsedQuery batch = batchQueries(allQueries, 0);
	batch.optimizeGraph(schema);
	batch.makeBase(false);
	parser.load(ordering, &batch);

	Planner* p = new(numa_alloc_onnode(sizeof(Planner), SOCKET)) Planner(schema, numthreads);
	Executor* master = p->getMaster(batch, ordering);

	std::string response = "B";

	parser.load(ordering, &batch);
	Executor* ctx = p->getContextUsingMaster(master, batch, ordering);
	ctx->mergeInto(master);

	run1(master, ctx, numthreads);

	std::cout << "Finished : " << execPath << " time : " << timer
			<< " intermediate result size :" << intermediate_joins << std::endl;


	master->reset();

	return 0;
}



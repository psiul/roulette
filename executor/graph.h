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

#ifndef GRAPH_H_
#define GRAPH_H_

#include "../frontend/parse-util.h"

#include <map>
#include <vector>
#include <utility>
#include <iostream> 

#include "../stem/stem.h"

struct HashTable;

struct GraphPayload {
	Stem* ht;
	int join;
	int keyProbe;
	int keyBuild;
	std::bitset<MAXQUERIES>  query;
};

struct Graph {
	//std::map<std::string, int> nameBindings_;
	int* nodeIndex_;
	int* edgeIndex_;
	GraphPayload* metaIndex_;
	int numNodes_;

	void extractGraph (Schema* schema_, const std::vector<ParsedJoin>& predicates, std::vector<int>& tables, std::vector<int>& attrs, std::vector<int>& joins, std::vector<std::bitset<MAXQUERIES> >& queries) {
		for (int i = 0; i < predicates.size(); i++) {
			if (predicates[i].type >= 0) {
				int key = schema_->getFieldNumber(predicates[i].left.table, predicates[i].left.key);
				int table = schema_->getColumnParent(key);
				uint64_t rowCount = schema_->getRowCount(table);

				tables.push_back(table);
				attrs.push_back(key);
				joins.push_back(predicates[i].id);
				queries.push_back(predicates[i].queries);

				key = schema_->getFieldNumber(predicates[i].right.table, predicates[i].right.key);
				table = schema_->getColumnParent(key);
				rowCount = schema_->getRowCount(table);

				tables.push_back(table);
				attrs.push_back(key);
				joins.push_back(predicates[i].id);
				queries.push_back(predicates[i].queries);

				assert (schema_->getFieldNumber(predicates[i].left.table, predicates[i].left.key) != schema_->getFieldNumber(predicates[i].right.table, predicates[i].right.key));
			}
		}
	}

	public:
	Graph (int numNodes, Schema* schema, const std::vector<ParsedJoin>& predicates, Stem** hashtables) : numNodes_(numNodes) {
		std::vector<int> graph; 
		std::vector<int> attrs; 
		std::vector<int> joins; 
		std::vector<std::bitset<MAXQUERIES> > queryMask;

		extractGraph(schema, predicates, graph, attrs, joins, queryMask);

		nodeIndex_ = new(numa_alloc_onnode((numNodes_+1)*sizeof(int), SOCKET)) int[numNodes_ + 1];
		edgeIndex_ = new(numa_alloc_onnode((graph.size()+1)*sizeof(int), SOCKET)) int[(graph.size()+1)];
		metaIndex_ = new(numa_alloc_onnode((graph.size()+1)*sizeof(GraphPayload), SOCKET)) GraphPayload[(graph.size()+1)];

		for (int i = 0; i < numNodes_; i++)
			nodeIndex_[i] = 0;

		for (int i = 0; i < graph.size(); i++) {
			nodeIndex_[graph[i]]++;
		}

		int suffixSum = 0;
		for (int i = 0; i < numNodes_; i++) {
			int tmp = nodeIndex_[i];
			suffixSum += tmp;
			nodeIndex_[i] = suffixSum;
		}
		nodeIndex_[numNodes_] = suffixSum;

		for (int i = 0; i < graph.size(); i += 2) {
			int n1, n2;

			n1 = graph[i];
			nodeIndex_[n1]--;

			n2 = graph[i+1];
			nodeIndex_[n2]--;

			edgeIndex_[nodeIndex_[n1]] = n2;
			edgeIndex_[nodeIndex_[n2]] = n1;

			metaIndex_[nodeIndex_[n1]].join = joins[i];
			metaIndex_[nodeIndex_[n2]].join = joins[i+1];

			metaIndex_[nodeIndex_[n1]].ht = hashtables[n2];
			metaIndex_[nodeIndex_[n2]].ht = hashtables[n1];

			metaIndex_[nodeIndex_[n1]].keyProbe = attrs[i];
			metaIndex_[nodeIndex_[n2]].keyProbe = attrs[i+1];

			metaIndex_[nodeIndex_[n1]].keyBuild = attrs[i+1];
			metaIndex_[nodeIndex_[n2]].keyBuild = attrs[i];

			metaIndex_[nodeIndex_[n1]].query = queryMask[i];
			metaIndex_[nodeIndex_[n2]].query = queryMask[i+1];
		}

		reset();
	}

	Graph (Graph* master) : numNodes_(master->numNodes_) {
		nodeIndex_ = new(numa_alloc_onnode((numNodes_+1)*sizeof(int), SOCKET)) int[numNodes_ + 1];
		edgeIndex_ = new(numa_alloc_onnode((master->nodeIndex_[numNodes_]+1)*sizeof(int), SOCKET)) int[master->nodeIndex_[numNodes_]+1];
		metaIndex_ = new(numa_alloc_onnode((master->nodeIndex_[numNodes_]+1)*sizeof(GraphPayload), SOCKET)) GraphPayload[master->nodeIndex_[numNodes_]+1];

		for (int i = 0; i < numNodes_+1; i++) {
			nodeIndex_[i] = master->nodeIndex_[i];
		}

		for (int i = 0; i < nodeIndex_[numNodes_]; i++) {
			edgeIndex_[i] = master->edgeIndex_[i];
			metaIndex_[i] = master->metaIndex_[i];
		}
	}

	void destroy () {
		numa_free(edgeIndex_, (nodeIndex_[numNodes_]+1)*sizeof(int));
		numa_free(metaIndex_, (nodeIndex_[numNodes_]+1)*sizeof(GraphPayload));
		numa_free(nodeIndex_, (numNodes_+1)*sizeof(int));
	}

	void remap (std::map<int, int>& mapping) {
		for (int i = 0; i < nodeIndex_[numNodes_]; i++) {
			metaIndex_[i].query = mapQueries(metaIndex_[i].query, mapping);
		}
	}

	void merge (Graph* master) {
		for (int i = 0; i < nodeIndex_[numNodes_]; i++) {
			metaIndex_[i].query |= (master->metaIndex_)[i].query;
		}
	}

	void reset () {
		for (int i = 0; i < nodeIndex_[numNodes_]; i++) {
			metaIndex_[i].query.reset();
		}
	}

	void printGraph () {
		for (int i = 0; i < numNodes_; i++) {
			std::cout << i << ": ";
			for (int j = nodeIndex_[i]; j < nodeIndex_[i+1]; j++)
				std::cout << edgeIndex_[j] << "-" << metaIndex_[j].query << " ";
			std::cout << std::endl;
		}
	}

	void update (Schema* schema, const std::vector<ParsedJoin>& predicates) {
		std::vector<int> graph;
		std::vector<int> attrs; 
		std::vector<int> joins; 
		std::vector<std::bitset<MAXQUERIES> > queryMask;

		extractGraph(schema, predicates, graph, attrs, joins, queryMask);

		for (int i = 0; i < graph.size(); i++) {
			bool flag = false;
			for (int j = nodeIndex_[graph[i]]; j < nodeIndex_[graph[i]+1]; j++) {
				if (joins[i] == metaIndex_[j].join) {
					metaIndex_[j].query |= queryMask[i];
					flag = true;
				}
			}
			
			assert(flag);
		}
	}
};

#endif
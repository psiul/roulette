CXX=g++

CXXFLAGS= -O3 -std=c++11 -g -pthread -mavx2 -mbmi2

LDLIBS=-lnuma -latomic 

all: roulette shared-exec bench

roulette: main/roulette-main.cc executor/executor.cc ingestion/ingestion.cc dictionary/dictionary.cc datablock/datablock.cc memory/buffer-manager.cc expressions/expressions.cc utilities/common.cc frontend/parse-util.cc roulette-operators/projector.cc roulette-operators/partitioner.cc roulette-operators/filter.cc frontend/schema.cc frontend/loader.cc frontend/parser.cc qlearning/qlearning.cc stem/stem.cc
	$(CXX) -o roulette $(CXXFLAGS) main/roulette-main.cc executor/executor.cc dictionary/dictionary.cc ingestion/ingestion.cc  datablock/datablock.cc memory/buffer-manager.cc expressions/expressions.cc utilities/common.cc frontend/parse-util.cc roulette-operators/projector.cc roulette-operators/partitioner.cc roulette-operators/filter.cc frontend/loader.cc frontend/parser.cc qlearning/qlearning.cc stem/stem.cc frontend/schema.cc $(LDLIBS)

shared-exec: main/shared-exec-main.cc frontend/opt.cc dictionary/dictionary.cc memory/buffer-manager.cc utilities/common.cc frontend/parse-util.cc expressions/expressions.cc datablock/datablock.cc baseline-operators/relbuilder.cc baseline-operators/join-operators.cc baseline-operators/operators.cc baseline-operators/sum-operators.cc frontend/loader.cc frontend/parser.cc qlearning/qlearning.cc stem/stem.cc baseline-operators/filter-operators.cc baseline-operators/scan-operators.cc roulette-operators/projector.cc roulette-operators/partitioner.cc roulette-operators/filter.cc frontend/schema.cc
	$(CXX) -o shared-exec $(CXXFLAGS) main/shared-exec-main.cc frontend/opt.cc dictionary/dictionary.cc memory/buffer-manager.cc utilities/common.cc frontend/parse-util.cc expressions/expressions.cc datablock/datablock.cc baseline-operators/relbuilder.cc baseline-operators/join-operators.cc baseline-operators/operators.cc frontend/loader.cc frontend/parser.cc baseline-operators/sum-operators.cc stem/stem.cc qlearning/qlearning.cc baseline-operators/filter-operators.cc baseline-operators/scan-operators.cc roulette-operators/projector.cc roulette-operators/partitioner.cc roulette-operators/filter.cc frontend/schema.cc $(LDLIBS)

bench: main/roulette-standalone-bench.cc executor/executor.cc ingestion/ingestion.cc dictionary/dictionary.cc datablock/datablock.cc memory/buffer-manager.cc expressions/expressions.cc utilities/common.cc frontend/parse-util.cc roulette-operators/projector.cc roulette-operators/partitioner.cc roulette-operators/filter.cc frontend/schema.cc frontend/loader.cc frontend/parser.cc qlearning/qlearning.cc stem/stem.cc
	$(CXX) -o bench $(CXXFLAGS) main/roulette-standalone-bench.cc executor/executor.cc dictionary/dictionary.cc ingestion/ingestion.cc  datablock/datablock.cc memory/buffer-manager.cc expressions/expressions.cc utilities/common.cc frontend/parse-util.cc roulette-operators/projector.cc roulette-operators/partitioner.cc roulette-operators/filter.cc frontend/loader.cc frontend/parser.cc qlearning/qlearning.cc stem/stem.cc frontend/schema.cc $(LDLIBS)


clean:
	rm -f roulette shared-exec bench

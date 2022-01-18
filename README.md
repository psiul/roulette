# Code repository for RouLette

The current repository contains the source code of our prototype implementatiton of RouLette, scripts, queries and instructions on how to execute RouLette.

## Overview

In this subsection, we match source code files with paper content.
The executor/executor(.h/.cc) contains the execution path described in section 5. The multi-step optimization is blended and interleaved with execution (execute operators as soon as the eddy plans them) to simplify data structure management. The executor peforms the ingestion - selections - build - probe - route - consume pipeline. In the prototype, the host DBMS is simply composed of consumer operators. executor/sym-join.h includes the implementation of the symmetric join. Finally, graph is an auxilary query graph that helps resolve candidate operators.

Policies are implemented in qlearning/qlearning(.h/.cc). QLearning* classes implement reinforcement learning-based policies, whereas Selectivity* classes implement selectivity-based policies.

Ingestion state is in ingestion/ingestion(.h/.cc), sub-operators (selections, routing, projections) are in roulette-operators/ and expressions/evaluators.h implement complex expressions.

THe repository also includes the shared-work system baseline. The operators of the baseline are implemented in baseline-operators/.

The remaining files serve as infrastructure (i.e., data structures, memory management) or high-level functionality such as query parsing.

By default, RouLette executes queries as a batch, using the syntax:

./roulette db-path batch-path threadnum

For example,

./roulette queries/job-queries /job-exp/batch-64-4.json 1

executes a batch of 64 Join Order Benchmark queries.

To execute the baseline, use

./shared-exec db-path batch-path threadnum


## Query Plans

RouLette does not currently parse queries written in SQL. Instead, it scans relational algebra Select - Project - Join - Aggregate queries from json files. The directory queries/ contains queries from different benchmarks. Each subdirectory contains query json files, a json files that holds the schema of the database and batch files that provide a way to specify which queries to execute as a batch.

## Data

RouLette needs to have the input data in the path specified in the input catalog. RouLette can read both binary and CSV files. Also, it can be configured to cache tables in columnar binary format to reduce warm-up costs. To generate control-ds, the user needs to append a column to each TPC-DS table, randomly generated from 0 to 999.

## Scripts

The scripts/ directory contains useful utilities that we used for experiments. query-gen.py provides the query generator that we used for the TPC-DS based benchmarks. generate_microbenchmark(case, seed, selectivity (divided by 10000), output_path) produces 1024 queries per configuration. json-to-sql.py converts json plans to SQL to enable execution in traditional baselines. gen-exec.py can be configured to generate experiment files from batches.

## Experiments Main

For the main experiments of the paper (Figures 11-16) the scripts for producing the numbers are in the experiments/ directory.


## Acknowledgements

rapidjson is a third-party open source library

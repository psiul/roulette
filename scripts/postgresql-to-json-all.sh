#!/bin/bash

files=$(ls /localhome/sioulas/job-plans/)

for file in ${files}
do
	python /home/sioulas/sigmod/sybil/prototype/scripts/postgresql-to-json.py /localhome/sioulas/job-plans/${file}
done

import sys

dataset = sys.argv[1]
workload = sys.argv[2]
queryNum = int(sys.argv[3])
output = workload + ".out"

filename = "exec-" + workload + ".sh"
f = open(filename, "w")

f.write("#!/bin/bash\n\n")

for i in range(queryNum) :
	batch = "batch-" + str(i) + ".json"
	line = "./roulette " + dataset + " /" + workload + "/" + batch + " 1 >> " + output + "\n\n"
	f.write(line)

f.close()


import os
import sys

from os import listdir
from os.path import isfile, join


path = sys.argv[1]
oname = sys.argv[2]

batch_size = [1 , 2, 4, 8, 16, 32, 64, 128, 256, 512]
total_num = 1024

f = open(oname, "w")

header = "#!/bin/bash\n\n"
f.write(header)

for i in range(total_num) :
	cmd = "./test queries/control-queries " + path + "/batch-" + str(i) +".json 1\n\n"
	f.write(cmd)

for s in batch_size :
	for i in range(5) :
		cmd = "./test queries/control-queries " + path + "/batch-" + str(s) + "-" + str(i) + ".json 1\n\n"
		f.write(cmd)

f.close()
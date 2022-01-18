#include <cstdio>
#include <cstring>
#include <cstdlib>
#include <unistd.h>

int main (int argc, char** argv) {
	char** args = (char**) malloc((argc+6)*sizeof(char*));

	args[0] = (char*) malloc((strlen("numactl")+1)*sizeof(char));
	strcpy(args[0], "numactl");

	args[1] = (char*) malloc((strlen("-N")+1)*sizeof(char));
	strcpy(args[1], "-N");

	args[2] = (char*) malloc((strlen("1")+1)*sizeof(char));
	strcpy(args[2], "1");

	args[3] = (char*) malloc((strlen("-m")+1)*sizeof(char));
	strcpy(args[3], "-m");

	args[4] = (char*) malloc((strlen("1")+1)*sizeof(char));
	strcpy(args[4], "1");

	//args[5] = (char*) malloc((strlen("x100_server_real")+1)*sizeof(char));
	//strcpy(args[5], "x100_server_real");

	args[5] = (char*) malloc((strlen("iimerge_real")+1)*sizeof(char));
	strcpy(args[5], "iimerge_real");

	for (int i = 1; i < argc; i++) {
		args[i+5] = (char*) malloc((strlen(argv[i])+1)*sizeof(char));
		strcpy(args[i+5], argv[i]);
	}

	args[argc+5] = NULL;

	for (int i = 0; i < argc+5; i++) {
		printf("%s ", args[i]);
	}
	printf("\n");

	execvp("numactl", args);

	return 0;
}
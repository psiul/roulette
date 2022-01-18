#include <cstdio>
#include <cstring>
#include <cstdlib>
#include <unistd.h>
#include <sys/wait.h>
#include <cassert>
#include <vector>
#include <ctime>

#define NUM_CLIENTS 2048
#define DURATION 10000

int main (int argc, char** argv) {
	const char* setup = "SET QEP\n\\g\n";
	const char* timer = "\n\\rt\n";
	const char* go = "\n\\g\n";
	const char* end = "\n\\q\n";

	FILE* inputFile = fopen(argv[1], "r");

	std::vector<char*> queries;
	//std::vector<int> pending;

	char* buffer = (char*) malloc(1000);
	size_t bufsize = 1000;
	int len = -1;

	while ((len = getline(&buffer, &bufsize, inputFile)) >= 0) {
		if (len > 4) {
			buffer[strlen(buffer)-1] = '\0';
			queries.push_back(buffer);
			buffer = (char*) malloc(1000);
			bufsize = 1000;
			len = -1;
		}
	}

	fclose(inputFile);

	/*FILE* queryFile = fopen(argv[2], "r");

	buffer = (char*) malloc(100000);
	bufsize = 100000;
	len = -1;

	len = getline(&buffer, &bufsize, queryFile);
	assert(len >= 0);

	char* tok = strtok(buffer, " ");
	while (tok != NULL) {
		int toklen = strlen(tok);
		for (int i = 1; i < toklen; i++) {
			if (tok[i] == '/') {
				int j = i+1;
				int acc = 0;

				while (tok[j] != '.') {
					acc = 10*acc + (tok[j] - '0');
					j++;
				}

				pending.push_back(acc);
				break;
			}
		}

		tok = strtok(NULL, " ");
	}

	fclose(queryFile);*/

	int fd[NUM_CLIENTS][2];

	for (int i = 0; i < NUM_CLIENTS; i++) {
		assert(pipe(fd[i]) != -1);
	}

	close(0);

	for (int i = 0; i < NUM_CLIENTS; i++) {
		int pid = fork();

		if (pid == 0) {
			close(fd[i][1]);
			dup2(fd[i][0], 0);

			char* args[3];
			args[0] = (char*) malloc((strlen("sql")+1)*sizeof(char));
			strcpy(args[0], "sql");
			args[1] = (char*) malloc((strlen("control")+1)*sizeof(char));
			strcpy(args[1], "control");
			args[2] = NULL;
			execvp("sql", args);
		}

		usleep(50000);

		assert(pid != -1);
		close(fd[i][0]);
	}

	//for (int i = 0; i < NUM_CLIENTS; i++) {
	//	write(fd[i][1], setup, strlen(setup)+1);
	//}

	sleep(2);

	struct timespec startTime;
	clock_gettime(CLOCK_MONOTONIC, &startTime);

	for (int it = 0; it < DURATION; it++) {
		int i = it % NUM_CLIENTS;
		int target = rand() % queries.size();

		write(fd[i][1], timer, strlen(timer)+1);
		write(fd[i][1], queries[target], strlen(queries[target])+1);
		write(fd[i][1], go, strlen(go)+1);
	}

	for (int i = 0; i < NUM_CLIENTS; i++) {
		write(fd[i][1], end, strlen(end)+1);
		close(fd[i][1]);
	}

	for (int i = 0; i < NUM_CLIENTS; i++) {
		wait(NULL);
	}

	struct timespec endTime;
	clock_gettime(CLOCK_MONOTONIC, &endTime);

	double elapsed = (endTime.tv_sec - startTime.tv_sec);
	elapsed += (endTime.tv_nsec - startTime.tv_nsec) / 1000000000.0;

	printf("Time: %f\n", elapsed);
	printf("Throughput: %f\n", DURATION/elapsed);

	return 0;
}
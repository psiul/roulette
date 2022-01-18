#include <cstdio>
#include <cstring>
#include <cstdlib>
#include <unistd.h>
#include <sys/wait.h>
#include <cassert>

int main (void) {
	char hello[1000];
	read(0, hello, 500);
	printf("%s\n", hello);

	return 0;
}
#include <cstdlib>
#include <cstdint>
#include <cassert>
#include <unistd.h>
#include <fcntl.h>
#include <cstdio>

void generateColumnNull(int* column, uint64_t columnSize) {
	for (uint64_t i = 0; i < columnSize; i++) {
		column[i] = -1;
	}	
}

void generateColumnFromDomain(int* column, uint64_t columnSize, uint64_t domainSize) {
	for (uint64_t i = 0; i < columnSize; i++) {
		column[i] = rand() % domainSize;
	}
}

void storeAsRelation(const char* fileName, int* column, uint64_t columnSize) {
	int fd = open(fileName, O_WRONLY | O_CREAT | O_TRUNC, S_IRUSR | S_IWUSR | S_IXUSR);
	assert(fd >= 0);
	write(fd, column, columnSize*sizeof(int));
	close(fd);
}

void shuffleSingleColumn(int* column, uint64_t columnSize) {
	for (uint64_t i = 0; i < columnSize; i++) {
		int row1 = rand() % columnSize;
		int row2 = rand() % columnSize;

		int tmp = column[row1];
		column[row1] = column[row2];
		column[row2] = tmp;
	}
}

void shuffleRelation(int* columnA, int* columnB, int* columnC, uint64_t columnSize) {
	for (uint64_t i = 0; i < columnSize; i++) {
		int row1 = rand() % columnSize;
		int row2 = rand() % columnSize;

		int tmpA = columnA[row1];
		columnA[row1] = columnA[row2];
		columnA[row2] = tmpA;

		int tmpB = columnB[row1];
		columnB[row1] = columnB[row2];
		columnB[row2] = tmpB;

		int tmpC = columnC[row1];
		columnC[row1] = columnC[row2];
		columnC[row2] = tmpC;
	}
}

void gen1() {
	uint64_t sizeR = 50000000;
	uint64_t domU = 100000;
	uint64_t domT = 50000;
	uint64_t domSi = 100000;
	uint64_t numS = 4;

	float selU = 1.3;
	float selT = 1.4;
	float selS = 1.2;

	assert(sizeR % 2 == 0);

	int* Ra = (int*) malloc(sizeR*sizeof(int));
	int* Rb = (int*) malloc(sizeR*sizeof(int));
	int* Rc = (int*) malloc(sizeR*sizeof(int));

	generateColumnFromDomain(Ra, sizeR, domU);

	generateColumnNull(Rb, sizeR / 2);
	generateColumnFromDomain(Rb + sizeR / 2, sizeR / 2, domT);

	generateColumnFromDomain(Rc, sizeR / 2, domSi);
	generateColumnNull(Rc + sizeR / 2, sizeR / 2);

	shuffleRelation(Ra, Rb, Rc, sizeR);

	storeAsRelation("test.R.dat.0", Ra, sizeR);
	storeAsRelation("test.R.dat.1", Rb, sizeR);
	storeAsRelation("test.R.dat.2", Rc, sizeR);
	
	uint64_t sizeU = domU * selU;

	int* Ua = (int*) malloc(sizeU*sizeof(int));

	generateColumnFromDomain(Ua, sizeU, domU);

	shuffleSingleColumn(Ua, sizeU);

	storeAsRelation("test.U.dat.0", Ua, sizeU);

	uint64_t sizeT = 2.0 * domT * selT;

	int* Tb = (int*) malloc(sizeT*sizeof(int));

	generateColumnFromDomain(Tb, sizeT, domT);

	shuffleSingleColumn(Tb, sizeT);

	storeAsRelation("test.T.dat.0", Tb, sizeT);

	for (int i = 0; i < numS; i++) {
		uint64_t sizeSi = 2.0 * domSi * selS;

		int* Sic = (int*) malloc(sizeSi*sizeof(int));

		generateColumnFromDomain(Sic, sizeSi, domSi);

		shuffleSingleColumn(Sic, sizeSi);

		char* fileName = (char*) malloc(10000);

		sprintf(fileName, "test.S.%d.dat.0", i);

		storeAsRelation(fileName, Sic, sizeSi);

		free(Sic);
		free(fileName);
	}

	free(Ra);
	free(Rb);
	free(Rc);
	free(Ua);
	free(Tb);
}

void gen2() {
	uint64_t sizeR = 50000000;
	uint64_t domV = 100000;
	uint64_t domU = 100000;
	uint64_t domT = 100000;
	float selV = 1.5;
	float selU = 0.9;
	float selT = 1.4;

	assert(sizeR % 2 == 0);

	int* Ra = (int*) malloc(sizeR*sizeof(int));
	int* Rb = (int*) malloc(sizeR*sizeof(int));
	int* Rc = (int*) malloc(sizeR*sizeof(int));

	generateColumnFromDomain(Ra, sizeR, domV);
	generateColumnFromDomain(Rb, sizeR, domU);
	generateColumnFromDomain(Rc, sizeR, domT);

	shuffleRelation(Ra, Rb, Rc, sizeR);

	storeAsRelation("test.R.dat.0", Ra, sizeR);
	storeAsRelation("test.R.dat.1", Rb, sizeR);
	storeAsRelation("test.R.dat.2", Rc, sizeR);
	
	uint64_t sizeU = domU * selU;

	int* Ub = (int*) malloc(sizeU*sizeof(int));

	generateColumnFromDomain(Ub, sizeU, domU);

	shuffleSingleColumn(Ub, sizeU);

	storeAsRelation("test.U.dat.0", Ub, sizeU);

	uint64_t sizeT = domT * selT;

	int* Tb = (int*) malloc(sizeT*sizeof(int));

	generateColumnFromDomain(Tb, sizeT, domT);

	shuffleSingleColumn(Tb, sizeT);

	storeAsRelation("test.T.dat.0", Tb, sizeT);

	uint64_t sizeV = domV * selV;

	int* Va = (int*) malloc(sizeV*sizeof(int));

	generateColumnFromDomain(Va, sizeV, domV);

	shuffleSingleColumn(Va, sizeV);

	storeAsRelation("test.V.dat.0", Va, sizeV);

	free(Ra);
	free(Rb);
	free(Rc);
	free(Ub);
	free(Tb);
	free(Va);
}

void gen3() {
	uint64_t sizeR = 50000000;
	uint64_t domV = 100000;
	uint64_t domU = 100000;
	uint64_t domT = 100000;

	float selV = 3.0;
	float selU = 5.0;
	float selT = 0.1;

	assert(sizeR % 2 == 0);

	int* Ra = (int*) malloc(sizeR*sizeof(int));
	int* Rb = (int*) malloc(sizeR*sizeof(int));
	int* Rc = (int*) malloc(sizeR*sizeof(int));

	generateColumnFromDomain(Ra, sizeR, domV);
	generateColumnFromDomain(Rb, sizeR, domU);

	shuffleRelation(Ra, Rb, Rc, sizeR);

	storeAsRelation("test.R.dat.0", Ra, sizeR);
	storeAsRelation("test.R.dat.1", Rb, sizeR);

	uint64_t sizeU = domU * selU;

	int* Ub = (int*) malloc(sizeU*sizeof(int));

	generateColumnFromDomain(Ub, sizeU, domU);

	shuffleSingleColumn(Ub, sizeU);

	storeAsRelation("test.U.dat.0", Ub, sizeU);

	uint64_t sizeT = domT * selT;

	int* Tb = (int*) malloc(sizeT*sizeof(int));

	generateColumnFromDomain(Tb, sizeT, domT);

	shuffleSingleColumn(Tb, sizeT);

	storeAsRelation("test.T.dat.0", Tb, sizeT);

	uint64_t sizeV = domV * selV;

	int* Va = (int*) malloc(sizeV*sizeof(int));

	generateColumnFromDomain(Va, sizeV, domV);

	shuffleSingleColumn(Va, sizeV);

	storeAsRelation("test.V.dat.0", Va, sizeV);

	free(Ra);
	free(Rb);
	free(Ub);
	free(Tb);
	free(Va);
}


int main(void) {
	gen2();

	return 0;
}
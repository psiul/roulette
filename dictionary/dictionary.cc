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

#include "dictionary.h"


Dictionary::Dictionary (std::string relPath, int fieldNo, int n, bool txt, char delim, DataTypeEnum type) : capacity_(n), relPath(relPath), fieldNo(fieldNo), type_(type) {
	line = new char[BUFFER_LEN_];
	const char* cpath = relPath.c_str();

	/*build column dictionary from the CSV file*/
	if (txt) {
		size_t w, len;
		len = BUFFER_LEN_;

		FILE* f = fopen(cpath, "r");

		std::vector<std::string> local;

		for (int i = 0; i < n; i++) {
			int w = getline(&line, &len, f);
			char* str = line;

			char* tok = customtokn(str, delim, fieldNo);

			if (strlen(tok) > 0 && tok[strlen(tok)-1] == '\n') {
				tok[strlen(tok)-1] = '\0';
			}

			if (strlen(tok) > 0 && type == DataTypeEnum::DATE) {
				assert(strlen(tok) == 10);
			}

			local.emplace_back(tok);
		}

		fclose(f);

		/*sort unique values*/
		std::sort (local.begin(), local.end());

		/*eliminate duplicates*/
		for (int i = 0; i < local.size(); i++) {
			if (i == 0 || local[i-1] != local[i])
				entries.push_back(local[i]);
		}

	/*use precomputed/cached dictionary with key:value pairs*/
	} else {
		char* fname = new char[10000];
		sprintf(fname, "%s.%d.dict", relPath.c_str(), fieldNo);

		FILE* f = fopen(fname, "r");

		bool resume = true;
		int cnt = 0;

		while (resume) {
			int c = fgetc(f);

			if (c == EOF) {
				resume = false;
			}

			if (c == EOF || c == '\n') {
				if (cnt != 0) {
					line[cnt] = '\0';
					for (int i = cnt-1; i >= 0; i--)
						if (line[i] == ':') {
							line[i] = '\0';
							break;
						}
		
					entries.emplace_back(line); 
					cnt = 0;
				}
			} else {
				line[cnt] = c;
				cnt++;
			}
		}

		fclose(f);		
	}
}

std::string Dictionary::getRel () {
	return relPath;
}

std::vector<std::string>& Dictionary::getEntries () {
	return entries;
}


/*write dictionary to a cached key:value file*/
void Dictionary::cache () {
	char* fname = new char[10000];
	sprintf(fname, "%s.%d.dict", relPath.c_str(), fieldNo);

	FILE* f = fopen(fname, "r");

	if (f == nullptr) {
		std::cout << "caching " << fname << std::endl;

		FILE* f = fopen(fname, "w");

		for (int i = 0; i < entries.size(); i++) {
			fprintf(f, "%s:%d\n", entries[i].c_str(), i);
		}

		fclose(f);
	}
}

/*allocate filter array for string-processing operations*/
int* Dictionary::allocateFilter () {
	return (int*) numa_alloc_onnode(capacity_*sizeof(int), SOCKET);
}

/*de-allocate filter array for string-processing operations*/
void Dictionary::freeFilter (int* array) {
	numa_free(array, capacity_*sizeof(int));
}

/*populate filter using a regex*/
void Dictionary::populateFilter (int* output, regex_t* rex, int threadId, int threadNum) {
	int chunkSize = (entries.size() + threadNum - 1)/threadNum;

	int start = threadId*chunkSize;
	int end = (threadId+1)*chunkSize;

	if (end > entries.size())
		end = entries.size();

	for (int i = start; i < end; i++) {
		output[i] = regexec(rex, entries[i].c_str(), 0, nullptr, 0);
	}
}

/*populate filter using disjunction of regexes in expr*/
void Dictionary::populateFiltersOr (int* output, const std::string& expr, int threadId, int threadNum) {
	int chunkSize = (entries.size() + threadNum - 1)/threadNum;

	int start = threadId*chunkSize;
	int end = (threadId+1)*chunkSize;

	if (end > entries.size())
		end = entries.size();

	strcpy(line, expr.c_str());

	int count = 1;
	int len = strlen(line);

	for (int i = 0; i < len; i++)
		if (line[i] == '|')
			count++;

	std::vector<regex_t> rexlist;

	for (int i = 0; i < count; i++) {
		char* tok = customtokn(line, '|', i);
		std::string str(tok);

		regex_t rex;
		regcomp(&rex, str.c_str(), REG_NOSUB);
		rexlist.push_back(rex);

		strcpy(line, expr.c_str());
	}

	for (int i = start; i < end; i++) {
		bool sat = false;

		for (int j = 0; j < rexlist.size() && !sat; j++)
			if (regexec(&rexlist[j], entries[i].c_str(), 0, nullptr, 0) == 0)
				sat = true;

		output[i] = (sat)? 0 : 1;
	}
}

/*populate filter using conjunction of regexes in expr*/
void Dictionary::populateFiltersAnd (int* output, const std::string& expr, int threadId, int threadNum) {
	int chunkSize = (entries.size() + threadNum - 1)/threadNum;

	int start = threadId*chunkSize;
	int end = (threadId+1)*chunkSize;

	if (end > entries.size())
		end = entries.size();

	strcpy(line, expr.c_str());

	int count = 1;
	int len = strlen(line);

	for (int i = 0; i < len; i++)
		if (line[i] == '|')
			count++;

	std::vector<regex_t> rexlist;

	for (int i = 0; i < count; i++) {
		char* tok = customtokn(line, '|', i);
		std::string str(tok);

		regex_t rex;
		regcomp(&rex, str.c_str(), REG_NOSUB);
		rexlist.push_back(rex);

		strcpy(line, expr.c_str());
	}

	for (int i = start; i < end; i++) {
		bool sat = true;

		for (int j = 0; j < rexlist.size() && sat; j++)
			if (regexec(&rexlist[j], entries[i].c_str(), 0, nullptr, 0))
				sat = false;

		output[i] = (sat)? 0 : 1;
	}
}

/*populate filter using in predicate*/
void Dictionary::populateSet (int* output, const std::string& expr, int threadId, int threadNum) {
	assert(threadId == 0);

	int chunkSize = (entries.size() + threadNum - 1)/threadNum;

	int start = threadId*chunkSize;
	int end = (threadId+1)*chunkSize;

	if (end > entries.size())
		end = entries.size();

	for (int i = start; i < end; i++) {
		output[i] = 1;
	}

	strcpy(line, expr.c_str());

	int count = 1;
	int len = strlen(line);

	for (int i = 0; i < len; i++)
		if (line[i] == '|')
			count++;

	for (int i = 0; i < count; i++) {
		char* tok = customtokn(line, '|', i);
		std::string str(tok);
		int idx = mapDictionary(str);

		if (idx < 0) {
			//std::cout << "Didn't find " << str << std::endl; 
		} else {
			output[idx] = 0;
		}
		strcpy(line, expr.c_str());
	}
}

/*convert string to key using binary search*/
int Dictionary::mapDictionary (const std::string& val, bool strict) {
	int mini = 0;
	int maxi = entries.size();

	while (mini <= maxi) {
		int midi = (mini+maxi)/2;

		if (midi == entries.size())
			break;

		std::string& midval = entries[midi];

		if (midval > val) {
			maxi = midi-1;
		} else if (midval < val) {
			mini = midi+1;
		} else {
			return midi;
		}
	}

	assert(!strict);

	//for (int i = 0; i < entries.size(); i++)
	//	std::cout << entries[i] << std::endl;

	return -2;
}

/*convert string to key using binary search - interpolate value for missing keys -- use in cardinality estimation*/
int Dictionary::mapDictionary2 (const std::string& val, bool strict) {
	int mini = 0;
	int maxi = entries.size();

	while (mini <= maxi) {
		int midi = (mini+maxi)/2;

		if (midi == entries.size())
			break;

		std::string& midval = entries[midi];

		if (midval > val) {
			maxi = midi-1;
		} else if (midval < val) {
			mini = midi+1;
		} else {
			return midi;
		}
	}

	return maxi;
}

std::string& Dictionary::getValue (int i) {
	return entries[i];
}

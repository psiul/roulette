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

#ifndef LOOPS_H_
#define LOOPS_H_

#include <bitset>

template <class T>
class EvaluationLoop {
public:
	EvaluationLoop () {}

	T MinLoop (void* input, std::bitset<MAXQUERIES> * mask, void* mem_val, int size, std::bitset<MAXQUERIES> queries) {
		T* target = (T*) input;
		T  val    = *((T*) (mem_val));
		for (int i = 0; i < size; i++) {
			std::bitset<MAXQUERIES> pred = queries & mask[i];
			if (pred.any() && target[i] != NULL_VALUE && target[i] < val)
				val = target[i];
		}

		return val;
	}

	T MaxLoop (void* input, std::bitset<MAXQUERIES> * mask, void* mem_val, int size, std::bitset<MAXQUERIES> queries) {
		T* target = (T*) input;
		T  val    = *((T*) (mem_val));
		for (int i = 0; i < size; i++) {
			std::bitset<MAXQUERIES> pred = queries & mask[i];
			if (pred.any()  && target[i] != NULL_VALUE && target[i] > val)
				val = target[i];
		}

		return val;
	}

	int CountLoop (void* input, std::bitset<MAXQUERIES> * mask, int* mem_val, int size, std::bitset<MAXQUERIES> queries) {
		T* target = (T*) input;
		int  val    = *mem_val;
		for (int i = 0; i < size; i++) {
			std::bitset<MAXQUERIES> pred = queries & mask[i];
			if (pred.any() && target[i] != NULL_VALUE)
				val++;
		}

		return val;
	}

	int SumLoop (void* input, std::bitset<MAXQUERIES> * mask, int* mem_val, int size, std::bitset<MAXQUERIES> queries) {
		T* target = (T*) input;
		int  val    = *mem_val;
		for (int i = 0; i < size; i++) {
			std::bitset<MAXQUERIES> pred = queries & mask[i];
			if (pred.any() && target[i] != NULL_VALUE)
				val += target[i];
		}

		return val;
	}

	void LTLoop (std::bitset<MAXQUERIES>* output, void* input, void* mem_val, int size, std::bitset<MAXQUERIES> pass, std::bitset<MAXQUERIES> fail) {
		T* target = (T*) input;
		T  val    = *((T*) (mem_val));
		for (int i = 0; i < size; i++)
			output[i] = (target[i] != NULL_VALUE && target[i] < val) ? pass : fail;
	}

	void LTLoopSparse (std::bitset<MAXQUERIES>* output, char* mark, void* input, void* mem_val, int size, std::bitset<MAXQUERIES> pass, std::bitset<MAXQUERIES> fail) {
		T* target = (T*) input;
		T  val    = *((T*) (mem_val));
		for (int i = 0; i < size; i++) {
			if (mark[i])
				output[i] = (target[i] != NULL_VALUE && target[i] < val) ? pass : fail;
		}
	}

	void LELoop (std::bitset<MAXQUERIES>* output, void* input, void* mem_val, int size, std::bitset<MAXQUERIES> pass, std::bitset<MAXQUERIES> fail) {
		T* target = (T*) input;
		T  val    = *((T*) (mem_val));
		for (int i = 0; i < size; i++)
			output[i] = (target[i] != NULL_VALUE && target[i] <= val) ? pass : fail;
	}

	void LELoopSparse (std::bitset<MAXQUERIES>* output, char* mark, void* input, void* mem_val, int size, std::bitset<MAXQUERIES> pass, std::bitset<MAXQUERIES> fail) {
		T* target = (T*) input;
		T  val    = *((T*) (mem_val));
		for (int i = 0; i < size; i++) {
			if (mark[i])
				output[i] = (target[i] != NULL_VALUE && target[i] <= val) ? pass : fail;
		}
	}

	void GTLoop (std::bitset<MAXQUERIES>* output, void* input, void* mem_val, int size, std::bitset<MAXQUERIES> pass, std::bitset<MAXQUERIES> fail) {
		T* target = (T*) input;
		T  val    = *((T*) (mem_val));
		for (int i = 0; i < size; i++)
			output[i] = (target[i] != NULL_VALUE && target[i] > val) ? pass : fail;
	}

	void GTLoopSparse (std::bitset<MAXQUERIES>* output, char* mark, void* input, void* mem_val, int size, std::bitset<MAXQUERIES> pass, std::bitset<MAXQUERIES> fail) {
		T* target = (T*) input;
		T  val    = *((T*) (mem_val));
		for (int i = 0; i < size; i++) {
			if (mark[i])
				output[i] = (target[i] != NULL_VALUE && target[i] > val) ? pass : fail;
		}
	}

	void GELoop (std::bitset<MAXQUERIES>* output, void* input, void* mem_val, int size, std::bitset<MAXQUERIES> pass, std::bitset<MAXQUERIES> fail) {
		T* target = (T*) input;
		T  val    = *((T*) (mem_val));
		for (int i = 0; i < size; i++)
			output[i] = (target[i] != NULL_VALUE && target[i] >= val) ? pass : fail;
	}

	void GELoopSparse (std::bitset<MAXQUERIES>* output, char* mark, void* input, void* mem_val, int size, std::bitset<MAXQUERIES> pass, std::bitset<MAXQUERIES> fail) {
		T* target = (T*) input;
		T  val    = *((T*) (mem_val));
		for (int i = 0; i < size; i++) {
			if (mark[i])
				output[i] = (target[i] != NULL_VALUE && target[i] >= val) ? pass : fail;
		}
	}

	void EQLoop (std::bitset<MAXQUERIES>* output, void* input, void* mem_val, int size, std::bitset<MAXQUERIES> pass, std::bitset<MAXQUERIES> fail) {
		T* target = (T*) input;
		T  val    = *((T*) (mem_val));
		for (int i = 0; i < size; i++)
			output[i] = (target[i] != NULL_VALUE && target[i] == val) ? pass : fail;
	}

	void EQLoopSparse (std::bitset<MAXQUERIES>* output, char* mark, void* input, void* mem_val, int size, std::bitset<MAXQUERIES> pass, std::bitset<MAXQUERIES> fail) {
		T* target = (T*) input;
		T  val    = *((T*) (mem_val));
		for (int i = 0; i < size; i++) {
			if (mark[i]) 
				output[i] = (target[i] != NULL_VALUE && target[i] == val) ? pass : fail;
		}
	}

	void NEQLoop (std::bitset<MAXQUERIES>* output, void* input, void* mem_val, int size, std::bitset<MAXQUERIES> pass, std::bitset<MAXQUERIES> fail) {
		T* target = (T*) input;
		T  val    = *((T*) (mem_val));
		for (int i = 0; i < size; i++)
			output[i] = (target[i] != NULL_VALUE && target[i] != val) ? pass : fail;
	}

	void CopyLoop (T* output, T* input, int offset, int size) {
		memcpy(output + offset, input, size*sizeof(T));
	}

	void MaterializeLoop (void* output_raw, void* source_raw, int* ids, int size) {
		T* output = (T*) output_raw;
		T*  source    = (T*) source_raw;
		for (int i = 0; i < size; i++)
			output[i] = source[ids[i]];
	}

	void MaterializeLoopSparse (void* output_raw, char* mark, void* source_raw, int* ids, int size) {
		T* output = (T*) output_raw;
		T*  source    = (T*) source_raw;
		for (int i = 0; i < size; i++) {
			if (mark[i])
				output[i] = source[ids[i]];
		}
	}

	void ChainLoop (int* heads, int* chains, int* values, int offset, int size, int hash_bits) {
		chains += offset;
		for (int i = 0; i < size; i++) {
			int hashval = (values[i] & ((1 << hash_bits) - 1));
			chains[i] = heads[hashval];
			heads[hashval] = offset + i;
		}
	}
};

#endif
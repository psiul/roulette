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

#include "loader.h"

Loader::Loader (std::string schemaPath, bool txt, char delim) : schema_(nullptr), txt_(txt), delim_(delim) {
	parseSchema(schemaPath);
}

int* Loader::readColumnFromBinary (std::string relPath, int column, int n) {
	char* fname = new char[10000];
	sprintf(fname, "%s.%d", relPath.c_str(), column);
	int fd = open(fname, O_RDONLY); 

	assert(fd >= 0);

	int* res = (int*) numa_alloc_onnode(((int64_t) n)*sizeof(int), SOCKET);

	int dummy = read(fd, res, ((int64_t) n)*sizeof(int));

	close(fd);

	return res;
}



int* Loader::parseColumn (std::string relPath, int column, int n, bool cache) {
	char* line = new char[10000];
	const char* cpath = relPath.c_str();

	size_t w, len;
	len = 10000;

	FILE* f = fopen(cpath, "r");

	int* res = (int*) numa_alloc_onnode(n*sizeof(int), SOCKET);

	for (int i = 0; i < n; i++) {
		int w = getline(&line, &len, f);
		char* str = line;

		char* tok = customtokn(str, delim_, column);

		if (strlen(tok) > 0 && tok[strlen(tok)-1] == '\n')
			tok[strlen(tok)-1] = '\0';

		res[i] = (strlen(tok) > 0)? atoi(tok) : NULL_VALUE;
	}

	fclose(f);

	if (cache) {
		sprintf(line, "%s.%d", relPath.c_str(), column);

		int fd = open(line, O_RDONLY);

		if (fd < 0) {
			std::cout << "caching " << line << std::endl;

			fd = open(line, O_WRONLY | O_TRUNC | O_CREAT, S_IRUSR | S_IWUSR | S_IXUSR);

			int x= write(fd, res, ((int64_t) n)*sizeof(int));

			close(fd);
		}

	}

	return res;
}

int* Loader::parseColumnDecimal (std::string relPath, int column, int n, bool cache) {
	char* line = new char[10000];
	const char* cpath = relPath.c_str();

	size_t w, len;
	len = 10000;

	FILE* f = fopen(cpath, "r");

	int* res = (int*) numa_alloc_onnode(n*sizeof(int), SOCKET);

	for (int i = 0; i < n; i++) {
		int w = getline(&line, &len, f);
		char* str = line;

		char* tok = customtokn(str, delim_, column);

		if (strlen(tok) > 0 && tok[strlen(tok)-1] == '\n')
			tok[strlen(tok)-1] = '\0';

		res[i] = (strlen(tok) > 0)? int(100*atof(tok)) : NULL_VALUE;
	}

	fclose(f);

	if (cache) {
		sprintf(line, "%s.%d", relPath.c_str(), column);

		int fd = open(line, O_RDONLY);

		if (fd < 0) {
			std::cout << "caching " << line << std::endl;

			fd = open(line, O_WRONLY | O_TRUNC | O_CREAT, S_IRUSR | S_IWUSR | S_IXUSR);

			int x= write(fd, res, ((int64_t) n)*sizeof(int));

			close(fd);
		}

	}

	return res;
}

int* Loader::parseColumnWithDict (std::string relPath, int column, int n, Dictionary* dict, bool cache) {
	char* line = new char[10000];
	const char* cpath = relPath.c_str();

	size_t w, len;
	len = 10000;

	FILE* f = fopen(cpath, "r");

	int* res = (int*) numa_alloc_onnode(n*sizeof(int), SOCKET);

	for (int i = 0; i < n; i++) {
		int w = getline(&line, &len, f);

		char* str = line;

		char* tok = customtokn(str, delim_, column);

		if (strlen(tok) > 0 && tok[strlen(tok)-1] == '\n')
			tok[strlen(tok)-1] = '\0';
				
		std::string stok(tok);
		res[i] = (strlen(tok) > 0)? dict->mapDictionary(stok, true) : NULL_VALUE;
	}

	fclose(f);

	if (cache) {
		sprintf(line, "%s.%d", relPath.c_str(), column);

		int fd = open(line, O_RDONLY);

		if (fd < 0) {
			std::cout << "caching " << line << std::endl;

			fd = open(line, O_WRONLY | O_TRUNC | O_CREAT, S_IRUSR | S_IWUSR | S_IXUSR);

			int x = write(fd, res, ((int64_t) n)*sizeof(int));

			close(fd);
		}
	}

	return res;
}

void Loader::registerAdHocTable (
	const rapidjson::GenericValue<rapidjson::UTF8<> >::Object& doc, 
	std::map<std::string, std::string>& paths,
	std::string relName) {
	std::string relNameStr = relName;

	assert(doc.HasMember("linehint"));
	assert(doc["linehint"].IsInt());

	rows[relNameStr] = doc["linehint"].GetInt();

	assert(doc.HasMember("dummy"));
	assert(doc["dummy"].IsBool());

	bool isDummy = doc["dummy"].GetBool();

	if (isDummy) {
		dummy[relName] = true;
	}

	std::vector<bool> permitvector;
	std::vector<DataType*> typevector;
	fullname[relName] = relNameStr;
	std::map<std::string, std::string> translatormap;
	std::map<std::string, ParsedAttribute> originLocal;
	
	assert(doc.HasMember("schema"));
	assert(doc["schema"].IsArray());
	const auto& columns = doc["schema"].GetArray();
	for (auto& iter : columns) {
		assert(iter.IsObject());
		const auto& col = iter.GetObject();

		assert(col.HasMember("attr"));
		assert(col["attr"].IsString());
		std::string colName = col["attr"].GetString();

		assert(col.HasMember("ord"));
		assert(col["ord"].IsInt());
		int ord = col["ord"].GetInt();

		assert(ord == typevector.size());

		translatormap[colName] = std::to_string(ord);

		assert(col.HasMember("type"));
		assert(col["type"].IsString());
		std::string type = col["type"].GetString();

		if (type.compare("int") == 0) {
			typevector.push_back(new DataInt());
		} else if (type.compare("float") == 0) {
			typevector.push_back(new DataFloat());
		} else if (type.compare("string") == 0) {
			typevector.push_back(new DataString());
		} else if (type.compare("date") == 0) {
			typevector.push_back(new DataDate());
		} else {
			assert(false);
		}

		if (col.HasMember("unique")); {
			assert(col["unique"].IsBool());
			bool unique = col["unique"].GetBool();
		}

		if (col.HasMember("block")) {
			assert(col["block"].IsBool());
			bool block = col["block"].GetBool();
			permitvector.push_back(block);
		} else {
			permitvector.push_back(true);
		}

		assert(col.HasMember("origin"));
		assert(col["origin"].IsObject());
		const auto& origin = col["origin"].GetObject();

		assert(origin.HasMember("attr"));
		assert(origin["attr"].IsString());
		std::string originAttr = origin["attr"].GetString();

		assert(origin.HasMember("relation"));
		assert(origin["relation"].IsString());
		std::string originRel = origin["relation"].GetString();

		assert(paths.find(originRel) != paths.end());
		originAttr = translator[paths[originRel]][originAttr];

		ParsedAttribute pattr(originRel, originAttr);

		originLocal[translatormap[colName]] = pattr;
	}

	types[relNameStr] = typevector;
	translator[relNameStr] = translatormap;
	origins[relNameStr] = originLocal;
	permission[relNameStr] = permitvector;
}

void Loader::parseSchema (std::string schemaPath) {
	char readBuffer[65536];
	FILE* fp = fopen(schemaPath.c_str(), "rb");
	rapidjson::FileReadStream is(fp, readBuffer, sizeof(readBuffer));

	rapidjson::Document d;
   	d.ParseStream(is);
   	assert(d.IsObject());
   	const auto& doc = d.GetObject();

   	for (rapidjson::Value::ConstMemberIterator iter = doc.MemberBegin(); iter != doc.MemberEnd(); ++iter) {
	    std::string relName = iter->name.GetString();

	    assert(iter->value.IsObject());
	    const auto& payload = iter->value.GetObject();
		    
	    assert(payload.HasMember("path"));
	    assert(payload["path"].IsString());

	    std::string relNameStr = payload["path"].GetString();

	    assert(payload.HasMember("linehint"));
	    assert(payload["linehint"].IsInt());

	    rows[relNameStr] = payload["linehint"].GetInt();

	    double sampling = -1.0;
	    if (payload.HasMember("sampling")) {
	    	assert(payload["sampling"].IsDouble());
	    	sampling = payload["sampling"].GetDouble();
	    }

	    samplingRate[relNameStr] = sampling;


	    std::vector<DataType*> typevector;
	    std::vector<bool> permitvector;
	    fullname[relName] = relNameStr;
	    std::map<std::string, std::string> translatormap;

	    assert(payload.HasMember("columns"));
		assert(payload["columns"].IsObject());
		const auto& columns = payload["columns"].GetObject();
		for (rapidjson::Value::ConstMemberIterator iter2 = columns.MemberBegin(); iter2 != columns.MemberEnd(); ++iter2) {
			std::string colName = iter2->name.GetString();

	    	assert(iter2->value.IsObject());
			const auto& col = iter2->value.GetObject();

			assert(col.HasMember("ord"));
			assert(col["ord"].IsInt());
			int ord = col["ord"].GetInt();

			translatormap[colName] = std::to_string(ord);

			assert(col.HasMember("type"));
			assert(col["type"].IsString());
			std::string type = col["type"].GetString();

			if (type.compare("int") == 0) {
				typevector.push_back(new DataInt());
			} else if (type.compare("float") == 0) {
				typevector.push_back(new DataFloat());
			} else if (type.compare("string") == 0) {
				typevector.push_back(new DataString());
			} else if (type.compare("date") == 0) {
				typevector.push_back(new DataDate());
			} else {
				assert(false);
			}

			assert(col.HasMember("unique"));
			assert(col["unique"].IsBool());
			bool unique = col["unique"].GetBool();

			if (col.HasMember("block")) {
				assert(col["block"].IsBool());
				bool block = col["block"].GetBool();
				permitvector.push_back(block);
			} else {
				permitvector.push_back(true);
			}
		}

		types[relNameStr] = typevector;
		permission[relNameStr] = permitvector;
		translator[relNameStr] = translatormap;
	}
}

Table* Loader::createTable (std::string relName, std::vector<ParsedAttribute>& refs, std::map<std::string, std::string> paths, bool cache) {
	std::string path = paths[relName];
	int n = rows[path];

	char readpathBuffer[1000];
	strcpy(readpathBuffer, path.c_str());

	if (samplingRate.find(path) != samplingRate.end() && samplingRate[path] >= 0.0) {
		for (int i = strlen(readpathBuffer)-1; i >= 0; i--) {
			if (readpathBuffer[i] == '#') {
				readpathBuffer[i] = '\0';
				break;
			}
		}
	}

	std::string readpath(readpathBuffer);

	Table* table = new Table(relName, n);

	if (path.compare(relName) != 0) {
		std::cout << "loading " << readpath << std::endl;
		std::map<std::string, int> done;

		for (int i = 0; i < refs.size(); i++) {
			if (relName == refs[i].table && done.find(refs[i].key) == done.end()) {
				int k = atoi(refs[i].key.c_str());
				if (types[path][k]->getTypeValue() != STRING && types[path][k]->getTypeValue() != DATE) {
					int* col;
					if (txt_) {
						if (types[path][k]->getTypeValue() == INT) {
							col = parseColumn(readpath, k, n, cache);
						} else if (types[path][k]->getTypeValue() == FLOAT) {
							col = parseColumnDecimal(readpath, k, n, cache);
						}
					} else {
						col = readColumnFromBinary(readpath, k, n);
					}
					table->addColumn(refs[i].key.c_str(), types[path][k], permission[path][k], col);
				} else {
					Dictionary* dict;
					int* col;
					
					if (txt_) {
						dict = new Dictionary(readpath, k, n, txt_, delim_, types[path][k]->getTypeValue());
						col = parseColumnWithDict(readpath, k, n, dict, cache);
						if (cache) {
							dict->cache();
						}
					} else {
						dict = new Dictionary(readpath, k, n, txt_, delim_, types[path][k]->getTypeValue());
						col = readColumnFromBinary(readpath, k, n);
					}
					table->addColumn(refs[i].key.c_str(), new DataInt(), permission[path][k], col);
					table->addDictionary(refs[i].key.c_str(), dict);
				}
				done[refs[i].key] = 0;
			}
		}
	} else {
		std::vector<DataType*>& typevector = types[path];

		for (int i = 0; i < typevector.size(); i++) {
			std::string key = std::to_string(i);

			int* col = (int*) numa_alloc_onnode(((int64_t) n)*sizeof(int), SOCKET);
			memset(col, 0, ((int64_t) n)*sizeof(int));

			table->addColumn(key.c_str(), new DataInt(), true, col);

			ParsedAttribute originAttr = origins[relName][key];

			int k = atoi(key.c_str());;
			assert(paths.find(originAttr.table) != paths.end());
			if (types[path][k]->getTypeValue() == STRING || types[path][k]->getTypeValue() == DATE) {
				int koriginal = atoi(originAttr.key.c_str());
				Dictionary* dict = new Dictionary(paths[originAttr.table], koriginal, rows[paths[originAttr.table]], txt_, delim_, types[path][k]->getTypeValue());
				table->addDictionary(key, dict);
			}
		}
	}

	if (samplingRate.find(path) != samplingRate.end() && samplingRate[path] >= 0.0) {
		table->resize(n*samplingRate[path]);
	}

	return table;
}



void Loader::createSchema (std::vector<ParsedAttribute>& refs, std::map<std::string, std::string> paths) {
	BufferManager* bm = new(numa_alloc_onnode(sizeof(BufferManager), SOCKET))  BufferManager((1 << 16), 1 << 19, SOCKET);
		
	std::vector<Table*> tables;
	std::vector<bool> isDummy;

	for (std::map<std::string, std::string>::iterator it = paths.begin(); it != paths.end(); ++it) {
		binding[it->first] = tables.size();

		Table* t = createTable(it->first, refs, paths);
		tables.push_back(t);

		if (dummy.find(it->first) != dummy.end())
			isDummy.push_back(true);
		else
			isDummy.push_back(false);
	}

	schema_ = new Schema(tables, isDummy, bm);
}

Schema* Loader::getSchema() {
	return schema_;
}
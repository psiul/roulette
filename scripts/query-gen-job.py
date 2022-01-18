import random
import json

def init_graph() : 
	graph = {}

	graph["aka_name"] = []
	#graph["aka_name"] += [("name", "person_id", "id")]

	graph["aka_title"] = [("kind_type2", "kind_id", "id")]
	#graph["aka_title"] += [("title", "movie_id", "id")]
	
	graph["cast_info"] = [("name", "person_id", "id")]
	graph["cast_info"] += [("title", "movie_id", "id")]
	graph["cast_info"] += [("char_name", "person_role_id", "id")]
	graph["cast_info"] += [("role_type", "role_id", "id")]

	graph["char_name"] = []

	graph["comp_cast_type1"] = []
	graph["comp_cast_type2"] = []

	graph["company_name"] = []

	graph["company_type"] = []

	graph["complete_cast"] = [("comp_cast_type1", "subject_id", "id")]
	graph["complete_cast"] += [("comp_cast_type2", "status_id", "id")]
	#graph["complete_cast"] += [("title", "movie_id", "id")]

	graph["info_type1"] = []
	graph["info_type2"] = []
	graph["info_type3"] = []

	graph["kind_type"] = []
	graph["kind_type2"] = []

	graph["link_type"] = []

	graph["keyword"] = []

	graph["movie_companies"] = [("company_name", "company_id", "id")]
	graph["movie_companies"] += [("company_type", "company_type_id", "id")]
	#graph["movie_companies"] += [("title", "movie_id", "id")]

	graph["movie_info"] = [("info_type1", "info_type_id", "id")]
	#graph["movie_info"] += [("title", "movie_id", "id")]

	graph["movie_info_idx"] = [("info_type2", "info_type_id", "id")]
	#graph["movie_info_idx"] += [("title", "movie_id", "id")]


	graph["movie_keyword"] = [("keyword", "keyword_id", "id")]
	#graph["movie_keyword"] += [("title", "movie_id", "id")]

	graph["movie_link"] = [("title2", "linked_movie_id", "id")]
	graph["movie_link"] += [("link_type", "link_type_id", "id")]
	#graph["movie_link"] = [("title", "movie_id", "id")]

	graph["name"] = [("aka_name", "id", "person_id")]
	#graph["name"] += [("cast_info", "id", "person_id")]
	graph["name"] += [("person_info", "id", "person_id")]

	graph["person_info"] = [("info_type3", "info_type_id", "id")]
	#graph["person_info"] += [("name", "person_id", "id")]

	graph["role_type"] = []

	graph["title"] = [("aka_title", "id", "movie_id")]
	graph["title"] += [("cast_info", "id", "movie_id")]
	graph["title"] += [("complete_cast", "id", "movie_id")]
	graph["title"] += [("movie_companies", "id", "movie_id")]
	graph["title"] += [("movie_info", "id", "movie_id")]
	graph["title"] += [("movie_info_idx", "id", "movie_id")]
	graph["title"] += [("movie_keyword", "id", "movie_id")]
	graph["title"] += [("movie_link", "id", "movie_id")]

	graph["title2"] = []

	return graph

def generate_graph(graph, seed, size) :
	relations = [seed]
	joins = []

	frontier = [((seed,x[1]),(x[0],x[2])) for x in graph[seed]]

	while frontier and len(relations) < size :
		i = random.randrange(len(frontier))
		assert(i < len(frontier))

		cur = frontier.pop(i)
		newrel = cur[1][0]

		if newrel not in relations :
			relations.append(newrel)
			joins.append(cur)

			for e in graph[newrel] :
				frontier.append(((newrel,e[1]),(e[0],e[2])))

	"""equivalences = {}

	for j in joins :
		if j[0] not in equivalences :
			equivalences[j[0]] = []

		equivalences[j[0]] += [j[1]]

		if j[1] not in equivalences :
			equivalences[j[1]] = []
			
		equivalences[j[1]] += [j[0]]

	newjoins = []

	for attr in equivalences :
		for attr1 in equivalences[attr] :
			for attr2 in equivalences[attr] :
				if attr1[0] < attr2[0] and (attr1, attr2) not in joins :
					derived = (attr1, attr2)
					joins.append(derived)"""
	
	return (relations, joins)

def get_filter_attribute(rel) :
	choice = "hash"

	return choice

def get_filter_values(attr, mode) :
	if mode == 10000 :
		return [(">=", 0), ("<=", 10000)]
	else :
		i = random.randrange(10000-mode)
		return [(">=", i), ("<=", i+mode)]

def generate_filters(query, k) :
	relations = query[0]

	options = [rel for rel in relations if rel != "cast_info"]
	filter_relations = options
	filter_attributes = [(rel, get_filter_attribute(rel)) for rel in filter_relations]
	return filter_attributes

def instantiate_filters(query, mode, filter_attributes) :
	random.shuffle(filter_attributes)
	filter_complete = []

	for i in range(len(filter_attributes)) :
		f = filter_attributes[i]

		filter_complete.append((f, get_filter_values(f[1], 5000)))

	return (query[0], query[1], filter_complete)



def find_representative(query) : 
	relation = query[0][0]

	if relation == "cast_info" :
		return ("cast_info", "id")
	else :
		print(relation)
		assert False

	return None

def get_alias(relation) :
	if relation == "aka_name" :
		return "an"
	elif relation == "aka_title" :
		return "at"
	elif relation == "cast_info" :
		return "ci"
	elif relation == "char_name" :
		return "chn"
	elif relation == "comp_cast_type1" :
		return "cct1"
	elif relation == "comp_cast_type2" :
		return "cct2"
	elif relation == "company_name" :
		return "cn"
	elif relation == "company_type" :
		return "ct"
	elif relation == "complete_cast" :
		return "cc"
	elif relation == "info_type1" :
		return "it1"
	elif relation == "info_type2" :
		return "it2"
	elif relation == "info_type3" :
		return "it3"
	elif relation == "keyword" :
		return "k"
	elif relation == "kind_type" :
		return "kt"
	elif relation == "kind_type2" :
		return "kt2"
	elif relation == "link_type" :
		return "lt"
	elif relation == "movie_companies" :
		return "mc"
	elif relation == "movie_info" :
		return "mi"
	elif relation == "movie_info_idx" :
		return "midx"
	elif relation == "movie_keyword" :
		return "mk"
	elif relation == "movie_link" :
		return "ml"
	elif relation == "name" :
		return "n"
	elif relation == "person_info" :
		return "pi"
	elif relation == "role_type" :
		return "rt"
	elif relation == "title" :
		return "t"
	elif relation == "title2" :
		return "t2"
	else :
		print(relation)
		assert False

	return None

def generate_plan(query, qid) :
	plan = {}
	plan["name"] = qid
	plan["requires"] = []
	plan["batch"] = 0

	rep = find_representative(query)
	
	origin = {}
	origin["relation"] = get_alias(rep[0])
	origin["attr"] = rep[1]

	field = {}
	field["attr"] = rep[1]
	field["type"] = "int"
	field["ord"] = 0
	field["unique"] = False
	field["origin"] = origin

	schema = {}
	schema["dummy"] = True
	schema["linehint"] = 1
	schema["schema"] = [field]

	plan["export"] = schema

	scans = []

	for rel in query[0] :
		cur_scan = {}
		if rel == "comp_cast_type1" or rel == "comp_cast_type2" :
			cur_scan["relation"] = "comp_cast_type"
		elif rel == "info_type1" or rel == "info_type2" or rel == "info_type3" :
			cur_scan["relation"] = "info_type"
		elif rel == "kind_type" or rel == "kind_type2" :
			cur_scan["relation"] = "kind_type"
		elif rel == "title" or rel == "title2" :
			cur_scan["relation"] = "title"
		else :
			cur_scan["relation"] = rel
		cur_scan["name"] = get_alias(rel)
		cur_scan["type"] = "scan"

		filters = []

		for f in query[2] :
			if f[0][0] == rel :
				vals = f[1]
				for v in vals :
					tmp = {}
					tmp["type"] = "cmp"
					tmp["op"] = v[0]

					left = {}
					left["relation"] = get_alias(rel)
					left["attr"] = f[0][1]
					tmp["left"] = left

					right = {}
					right["type"] = "value"
					if v[0] == "in" :
						right["val"] = '|'.join(v[1])
					else :
						right["val"] = str(v[1])
					tmp["right"] = right

					filters.append(tmp)

		cur_scan["filter"] = filters
		scans.append(cur_scan)

	multijoin = {}
	multijoin["children"] = scans
	multijoin["type"] = "multijoin"

	conds = []

	post_conds = []

	for j in query[1] :
		join = {}

		left = {}
		left["relation"] = get_alias(j[0][0])
		left["attr"] = j[0][1]
		join["left"] = left

		right = {}
		right["relation"] = get_alias(j[1][0])
		right["attr"] = j[1][1]
		join["right"] = right

		conds.append(join)

		"""
		if j[0][1] == "cr_order_number" or j[0][1] == "cs_order_number" :
			join1 = {}

			left1 = {}
			left1["relation"] = get_alias("catalog_sales")
			left1["attr"] = "cs_item_sk"
			join1["left"] = left1

			right1 = {}
			right1["relation"] = get_alias("catalog_returns")
			right1["attr"] = "cr_item_sk"
			join1["right"] = right1

			join1["type"] = "vcmp"
			join1["op"] = "="

			join2 = {}

			left2 = {}
			left2["relation"] = get_alias("catalog_sales")
			left2["attr"] = "cs_bill_customer_sk"
			join2["left"] = left2

			right2 = {}
			right2["relation"] = get_alias("catalog_returns")
			right2["attr"] = "cr_refunded_customer_sk"
			join2["right"] = right2

			join2["type"] = "vcmp"
			join2["op"] = "="

			post_conds.append(join1)
			post_conds.append(join2)
		elif j[0][1] == "sr_ticket_number" or j[0][1] == "ss_ticket_number" :
			join1 = {}

			left1 = {}
			left1["relation"] = get_alias("store_sales")
			left1["attr"] = "ss_item_sk"
			join1["left"] = left1

			right1 = {}
			right1["relation"] = get_alias("store_returns")
			right1["attr"] = "sr_item_sk"
			join1["right"] = right1

			join1["type"] = "vcmp"
			join1["op"] = "="

			join2 = {}

			left2 = {}
			left2["relation"] = get_alias("store_sales")
			left2["attr"] = "ss_customer_sk"
			join2["left"] = left2

			right2 = {}
			right2["relation"] = get_alias("store_returns")
			right2["attr"] = "sr_customer_sk"
			join2["right"] = right2

			join2["type"] = "vcmp"
			join2["op"] = "="

			post_conds.append(join1)
			post_conds.append(join2)
		elif j[0][1] == "wr_order_number" or j[0][1] == "ws_order_number" :
			join1 = {}

			left1 = {}
			left1["relation"] = get_alias("web_sales")
			left1["attr"] = "ws_item_sk"
			join1["left"] = left1

			right1 = {}
			right1["relation"] = get_alias("web_returns")
			right1["attr"] = "wr_item_sk"
			join1["right"] = right1

			join1["type"] = "vcmp"
			join1["op"] = "="

			join2 = {}

			left2 = {}
			left2["relation"] = get_alias("web_sales")
			left2["attr"] = "ws_bill_customer_sk"
			join2["left"] = left2

			right2 = {}
			right2["relation"] = get_alias("web_returns")
			right2["attr"] = "wr_refunded_customer_sk"
			join2["right"] = right2

			join2["type"] = "vcmp"
			join2["op"] = "="

			post_conds.append(join1)
			post_conds.append(join2)
	"""

	multijoin["cond"] = conds

	aggr = {}
	aggr["child"] = multijoin
	aggr["ordering"] = []
	aggr["key"] = []
	aggr["type"] = "aggr"

	aggr["post_filter"] = post_conds

	output = []

	output0 = {}
	output0["attr"] = {}
	output0["attr"]["relation"] = get_alias(rep[0])
	output0["attr"]["attr"] = rep[1]
	output0["op"] = "count"
	output0["as"] = {}
	output0["as"]["relation"] = qid
	output0["as"]["attr"] = get_alias(rep[0])

	output.append(output0)

	aggr["output"] = output

	plan["query"] = aggr

	f = open(qid[1:], "w")
	f.write(json.dumps(plan, indent=4))
	f.close()


def get_name(prefix, i) :
	name = prefix + "/" + str(i) + ".json"
	return name

def get_batch_name(prefix, i) :
	name = prefix + "/batch-" + str(i) + ".json"
	return name

def get_batch_iname(prefix, n, i) :
	name = prefix + "/batch-" +str(n) + "-" + str(i) + ".json"
	return name

def generate_microbenchmark (joins, prefix) :
	random.seed()

	graph = init_graph()

	n = 1024

	for i in range(n) :
		start = random.sample(["cast_info"],1)[0]
		#start = "store_sales"
		tmp1 = generate_graph(graph, start, joins)
		seed = tmp1

		query_v1 = generate_filters(seed, 3)

		query_v2 = instantiate_filters(seed, 100, query_v1)

		name = get_name(prefix, i)

		generate_plan(query_v2, name)

		batch_text = "1 " + name
		batch_name = get_batch_name(prefix, i)

		f = open(batch_name[1:], "w")
		f.write(batch_text)
		f.close()

	allqueries = [get_name(prefix,i) for i in range(n)]

	sizes = [512]

	for s in sizes :
		for i in range(5) :
			queries = random.sample(allqueries, s)
			batch_text = str(s) + " " + ' '.join(queries)
			batch_name = get_batch_iname(prefix, s, i)

			f = open(batch_name[1:], "w")
			f.write(batch_text)
			f.close()




joins = 3

generate_microbenchmark(joins, "/job2-" + str(joins-1))



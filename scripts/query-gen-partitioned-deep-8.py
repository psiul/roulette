import random
import json

def init_graph(schema) : 
	graph = {}

	graph["store_sales"] = []

	low = schema[:len(schema)/2]
	high = schema[len(schema)/2:]

	lowborder = random.sample(low,4)
	for rel in lowborder :
		graph["store_sales"] += [(rel, "ss_sold_date_sk", "d_date_sk",)]
		graph[rel] = []
	low = [x for x in low if x not in lowborder]

	while low :
		newlowborder = []
		for rel in lowborder :
			nextrel = random.sample(low,1)[0]
			graph[rel] = [(nextrel, "d_date_sk", "d_date_sk",)]
			graph[nextrel] = []
			newlowborder.append(nextrel)
			low = [x for x in low if x != nextrel]
		lowborder = newlowborder

	highborder = random.sample(high,4)
	for rel in highborder :
		graph["store_sales"] += [(rel, "ss_sold_date_sk", "d_date_sk",)]
		graph[rel] = []
	high = [x for x in high if x not in highborder]

	while high :
		newhighborder = []
		for rel in highborder :
			nextrel = random.sample(high,1)[0]
			graph[rel] = [(nextrel, "d_date_sk", "d_date_sk",)]
			graph[nextrel] = []
			newhighborder.append(nextrel)
			high = [x for x in high if x != nextrel]
		highborder = newhighborder

	print(graph)

	return graph

def generate_graph(graph, schema, seed, size) :
	relations = [seed]
	joins = []

	frontier = [((seed,x[1]),(x[0],x[2])) for x in graph[seed] if x[0] in schema[:len(schema)/2]]

	while frontier and len(relations) < (size+1)/2 :
		i = random.randrange(len(frontier))
		assert(i < len(frontier))

		cur = frontier.pop(i)
		newrel = cur[1][0]

		if newrel not in relations :
			relations.append(newrel)
			joins.append(cur)

			for e in graph[newrel] :
				if e[0] in schema :
					frontier.append(((newrel,e[1]),(e[0],e[2])))

	frontier = [((seed,x[1]),(x[0],x[2])) for x in graph[seed] if x[0] in schema[len(schema)/2:]]

	while frontier and len(relations) < size :
		i = random.randrange(len(frontier))
		assert(i < len(frontier))

		cur = frontier.pop(i)
		newrel = cur[1][0]

		if newrel not in relations :
			relations.append(newrel)
			joins.append(cur)

			for e in graph[newrel] :
				if e[0] in schema :
					frontier.append(((newrel,e[1]),(e[0],e[2])))

	print(relations)
	
	return (relations, joins)

def find_representative(query) : 
	relation = query[0][0]

	if relation == "store_sales" :
		return ("store_sales", "ss_item_sk")
	else :
		print(relation)
		assert False

	return None

def get_alias(relation) :
	if relation == "store_sales" :
		return "ss"
	elif relation.startswith("date_dim") :
		return "d" + relation[len("date_dim"):]
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
		cur_scan["relation"] = rel #if rel[-1] != '1' else rel[:-1]
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

def generate_microbenchmark (schema, joins, prefix) :
	random.seed()

	graph = init_graph(schema)

	n = 1024

	for i in range(n) :
		start = random.sample(["store_sales"],1)[0]
		#start = "store_sales"
		tmp1 = generate_graph(graph, schema, start, joins)
		seed = tmp1

		query_v1 = []

		query_v2 = (seed[0], seed[1], [])

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

	print(graph)


size = 8
targetsel = 1.0

clustersize = size/2
relerror = pow(5, 1.0/(size/2))

highcentroid = targetsel*1.25
lowcentroid = targetsel/1.25

highcluster = [random.uniform(1/relerror, relerror)*highcentroid for x in range(clustersize)]
lowcluster = [random.uniform(1/relerror, relerror)*lowcentroid for x in range(clustersize)]

highcluster.sort()
lowcluster.sort()

clusters = lowcluster + highcluster

dims = ["date_dim" + str(x) for x in range(1, size+1, 1)]

joins = 5

generate_microbenchmark(dims, joins, "/d8joins-" + str(joins-1) + "-" + str(size))

print(clusters)
print(dims)


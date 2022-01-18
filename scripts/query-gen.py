import random
import json

def init_graph() : 
	graph = {}

	graph["inventory"] = []
	graph["inventory"] += [("date_dim", "inv_date_sk", "d_date_sk",)]
	graph["inventory"] += [("item", "inv_item_sk", "i_item_sk",)]
	graph["inventory"] += [("warehouse", "inv_warehouse_sk", "w_warehouse_sk",)]

	graph["item"] = []
	#graph["item"] += [("store_sales", "i_item_sk", "ss_item_sk")]
	#graph["item"] += [("web_sales", "i_item_sk", "ws_item_sk")]
	#graph["item"] += [("catalog_sales", "i_item_sk", "cs_item_sk")]
	#graph["item"] += [("inventory", "i_item_sk", "inv_item_sk")]

	graph["customer"] = []
	graph["customer"] += [("customer_demographics1", "c_current_cdemo_sk", "cd_demo_sk",)]
	graph["customer"] += [("household_demographics1", "c_current_hdemo_sk", "hd_demo_sk",)]
	graph["customer"] += [("customer_address", "c_current_addr_sk", "ca_address_sk",)]
	
	graph["web_sales"] = []
	graph["web_sales"] += [("date_dim", "ws_sold_date_sk", "d_date_sk",)]
	graph["web_sales"] += [("date_dim", "ws_ship_date_sk", "d_date_sk",)]
	graph["web_sales"] += [("item", "ws_item_sk", "i_item_sk",)]
	graph["web_sales"] += [("customer", "ws_bill_customer_sk", "c_customer_sk",)]
	graph["web_sales"] += [("customer_demographics", "ws_bill_cdemo_sk", "cd_demo_sk",)]
	graph["web_sales"] += [("household_demographics", "ws_bill_hdemo_sk", "hd_demo_sk",)]
	graph["web_sales"] += [("ship_mode", "ws_ship_mode_sk", "sm_ship_mode_sk",)]
	graph["web_sales"] += [("warehouse", "ws_warehouse_sk", "w_warehouse_sk",)]
	graph["web_sales"] += [("web_returns", "ws_order_number", "wr_order_number",)]

	graph["store_sales"] = []
	graph["store_sales"] += [("date_dim", "ss_sold_date_sk", "d_date_sk",)]
	graph["store_sales"] += [("item", "ss_item_sk", "i_item_sk",)]
	graph["store_sales"] += [("customer", "ss_customer_sk", "c_customer_sk",)]
	graph["store_sales"] += [("customer_demographics", "ss_cdemo_sk", "cd_demo_sk",)]
	graph["store_sales"] += [("household_demographics", "ss_hdemo_sk", "hd_demo_sk",)]
	#graph["store_sales"] += [("store_returns", "ss_ticket_number", "sr_ticket_number",)]

	graph["catalog_sales"] = []
	graph["catalog_sales"] += [("date_dim", "cs_sold_date_sk", "d_date_sk",)]
	graph["catalog_sales"] += [("date_dim", "cs_ship_date_sk", "d_date_sk",)]
	graph["catalog_sales"] += [("item", "cs_item_sk", "i_item_sk",)]
	graph["catalog_sales"] += [("customer", "cs_bill_customer_sk", "c_customer_sk",)]
	graph["catalog_sales"] += [("customer_demographics", "cs_bill_cdemo_sk", "cd_demo_sk",)]
	graph["catalog_sales"] += [("household_demographics", "cs_bill_hdemo_sk", "hd_demo_sk",)]
	graph["catalog_sales"] += [("ship_mode", "cs_ship_mode_sk", "sm_ship_mode_sk",)]
	graph["catalog_sales"] += [("warehouse", "cs_warehouse_sk", "w_warehouse_sk",)]
	graph["catalog_sales"] += [("catalog_returns", "cs_order_number", "cr_order_number",)]

	graph["web_returns"] = []
	graph["web_returns"] += [("date_dim", "wr_returned_date_sk", "d_date_sk",)]
	graph["web_returns"] += [("item", "wr_item_sk", "i_item_sk",)]
	graph["web_returns"] += [("customer", "wr_refunded_customer_sk", "c_customer_sk",)]
	graph["web_returns"] += [("customer_demographics", "wr_returning_cdemo_sk", "cd_demo_sk",)]
	graph["web_returns"] += [("household_demographics", "wr_returning_hdemo_sk", "hd_demo_sk",)]
	graph["web_returns"] += [("reason", "wr_reason_sk", "r_reason_sk",)]
	graph["web_returns"] += [("web_sales", "wr_order_number", "ws_order_number",)]

	graph["store_returns"] = []
	graph["store_returns"] += [("date_dim", "sr_returned_date_sk", "d_date_sk",)]
	graph["store_returns"] += [("item", "sr_item_sk", "i_item_sk",)]
	graph["store_returns"] += [("customer", "sr_customer_sk", "c_customer_sk",)]
	graph["store_returns"] += [("customer_demographics", "sr_cdemo_sk", "cd_demo_sk",)]
	graph["store_returns"] += [("household_demographics", "sr_hdemo_sk", "hd_demo_sk",)]
	graph["store_returns"] += [("store_sales", "sr_ticket_number", "ss_ticket_number",)]

	graph["catalog_returns"] = []
	graph["catalog_returns"] += [("date_dim", "cr_returned_date_sk", "d_date_sk",)]
	graph["catalog_returns"] += [("item", "cr_item_sk", "i_item_sk",)]
	graph["catalog_returns"] += [("customer", "cr_refunded_customer_sk", "c_customer_sk",)]
	graph["catalog_returns"] += [("customer_demographics", "cr_refunded_cdemo_sk", "cd_demo_sk",)]
	graph["catalog_returns"] += [("household_demographics", "cr_refunded_hdemo_sk", "hd_demo_sk",)]
	graph["catalog_returns"] += [("catalog_sales", "cr_order_number", "cs_order_number",)]

	graph["customer_demographics"] = []

	graph["customer_demographics1"] = []

	graph["household_demographics"] = []

	graph["household_demographics1"] = []

	graph["customer_address"] = []

	graph["ship_mode"] = []

	graph["warehouse"] = []

	graph["date_dim"] = []

	graph["reason"] = []

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
	
	return (relations, joins)

def get_filter_attribute(rel) :
	candidates = []

	if rel == "store_sales" :
		candidates.append("ss_hash")
	elif rel == "store" :
		candidates.append("s_hash")
	elif rel == "customer" :
		candidates.append("c_hash")
	elif rel == "date_dim" :
		candidates.append("d_hash")
	elif rel == "ship_mode" :
		candidates.append("sm_hash")
	elif rel == "customer_address" :
		candidates.append("ca_hash")
	elif rel == "customer_demographics" :
		candidates.append("cd_hash")
	elif rel == "customer_demographics1" :
		candidates.append("cd_hash")
	elif rel == "household_demographics" :
		candidates.append("hd_hash")
	elif rel == "household_demographics1" :
		candidates.append("hd_hash")
	elif rel == "item" :
		candidates.append("i_hash")
	elif rel == "web_sales" :
		candidates.append("ws_hash")
	elif rel == "catalog_sales" :
		candidates.append("cs_hash")
	elif rel == "inventory" :
		candidates.append("inv_hash")

	choice = random.sample(candidates, 1)[0]

	return choice


def get_filter_values_corr(attr, mode) :
	if attr == "d_year" :
		if mode == "h" :
			i = random.randrange(2)
			return [(">=", 1998+i), ("<=", 2000+i)]
		else :
			i = random.randrange(4)
			return [("=", 1998+i)]
	elif attr == "d_moy" :
		if mode == "h" :
			i = random.randrange(2)
			return [(">=", 1+i), ("<=", 7+i)]
		elif mode == "l" :
			i = random.randrange(8)
			return [(">=", 1+i), ("<=", 2+i)]
	elif attr == "d_dom" :
		if mode == "h" :
			i = random.randrange(7)
			return [(">=", 1+i), ("<=", 15+i)]
		else :
			i = random.randrange(17)
			return [(">=", 1+i), ("<=", 5+i)]
	elif attr == "d_dow" :
		if mode == "h" :
			i = random.randrange(2)
			return [(">=", 0+i), ("<=", 3+i)]
		else :
			i = random.randrange(5)
			return [("=", i)]
	elif attr == "d_qoy" :
		if mode == "h" :
			i = random.randrange(2)
			return [(">=", 1+i), ("<=", 2+i)]
		else :
			i = random.randrange(3)
			return [("=", 1+i)]
	elif attr == "ss_quantity" :
		if mode == "h" :
			i = random.randrange(30)
			return [(">=", 1+i), ("<=", 50+i)]
		else :
			i = random.randrange(60)
			return [(">=", 1+i), ("<=", 20+i)]
	elif attr == "ss_wholesale_cost" :
		if mode == "h" :
			i = random.randrange(3000)
			return [(">=", 1+i), ("<=", 5000+i)]
		else :
			i = random.randrange(6000)
			return [(">=", 1+i), ("<=", 2000+i)]
	elif attr == "ss_sales_price" :
		if mode == "h" :
			i = random.randrange(2000)
			return [(">=", 1+i), ("<=", 10000+i)]
		else :
			i = random.randrange(14000)
			return [(">=", 1+i), ("<=", 2000+i)]
	elif attr == "ws_quantity" :
		if mode == "h" :
			i = random.randrange(30)
			return [(">=", 1+i), ("<=", 50+i)]
		else :
			i = random.randrange(60)
			return [(">=", 1+i), ("<=", 20+i)]
	elif attr == "ws_wholesale_cost" :
		if mode == "h" :
			i = random.randrange(3000)
			return [(">=", 1+i), ("<=", 5000+i)]
		else :
			i = random.randrange(6000)
			return [(">=", 1+i), ("<=", 2000+i)]
	elif attr == "ws_sales_price" :
		if mode == "h" :
			i = random.randrange(9000)
			return [(">=", 1+i), ("<=", 15000+i)]
		else :
			i = random.randrange(21000)
			return [(">=", 1+i), ("<=", 5000+i)]
	elif attr == "cs_quantity" :
		if mode == "h" :
			i = random.randrange(30)
			return [(">=", 1+i), ("<=", 50+i)]
		else :
			i = random.randrange(60)
			return [(">=", 1+i), ("<=", 20+i)]
	elif attr == "cs_wholesale_cost" :
		if mode == "h" :
			i = random.randrange(3000)
			return [(">=", 1+i), ("<=", 5000+i)]
		else :
			i = random.randrange(6000)
			return [(">=", 1+i), ("<=", 2000+i)]
	elif attr == "cs_sales_price" :
		if mode == "h" :
			i = random.randrange(9000)
			return [(">=", 1+i), ("<=", 15000+i)]
		else :
			i = random.randrange(19000)
			return [(">=", 1+i), ("<=", 5000+i)]
	elif attr == "s_city" :
		options = ["Pleasant Hill", "Midway", "Oak Grove", "Fairview"]
		if mode == "h" :
			return [("in", random.sample(options, 3))]
		else :
			return [("in", random.sample(options, 1))]
	elif attr == "s_state" :
		options = ["SD", "TN"]
		if mode == "h" :
			return [("in", random.sample(options, 2))]
		else :
			return [("in", random.sample(options, 1))]
	elif attr == "cd_gender" :
		options = ["F", "M"]
		return [("in", random.sample(options, 1))]
	elif attr == "cd_marital_status" :
		options = ["D", "M", "S", "U"]
		if mode == "h" :
			return [("in", random.sample(options, 3))]
		else :
			return [("in", random.sample(options, 1))]
	elif attr == "cd_education_status" :
		options = ["Primary", "Secondary", "College", "2 yr Degree", "4 yr Degree"]
		if mode == "h" :
			return [("in", random.sample(options, 4))]
		else :
			return [("in", random.sample(options, 1))]
	elif attr == "sm_type" :
		options = ["EXPRESS", "NEXT DAY", "OVERNIGHT", "TWO DAY"]
		if mode == "h" :
			return [("in", random.sample(options, 4))]
		else :
			return [("in", random.sample(options, 2))]
	elif attr == "c_birth_year" :
		if mode == "h" :
			i = random.randrange(14)
			return [(">=", 1924+i), ("<=", 1959+i)]
		else :
			i = random.randrange(40)
			return [(">=", 1924+i), ("<=", 1934+i)]
	elif attr == "c_birth_month" :
		if mode == "h" :
			i = random.randrange(3)
			return [(">=", 1+i), ("<=", 7+i)]
		elif mode == "l" :
			i = random.randrange(8)
			return [(">=", 1+i), ("<=", 2+i)]
	elif attr == "c_birth_day" :
		if mode == "h" :
			i = random.randrange(5)
			return [(">=", 1+i), ("<=", 15+i)]
		else :
			i = random.randrange(15)
			return [(">=", 1+i), ("<=", 5+i)]
	elif attr == "inv_quantity_on_hand" :
		if mode == "h" :
			i = random.randrange(300)
			return [(">=", 1+i), ("<=", 500+i)]
		else :
			i = random.randrange(600)
			return [(">=", 1+i), ("<=", 200+i)]
	else :
		print(attr)
		assert False

def get_filter_values(attr, mode) :
	if mode == 1000 :
		return [(">=", 0), ("<=", 1000)]
	else :
		i = random.randrange(1000-mode)
		return [(">=", i), ("<=", i+mode)]

def generate_filters(query, k) :
	relations = query[0]

	candidates = ["date_dim", "store_sales", "store", "web_sales", "catalog_sales", "store", "customer_demographics","customer_demographics1",  "ship_mode", "inventory", "customer", "customer_address", "household_demographics", "household_demographics1", "item"]
	options = [rel for rel in relations if rel in candidates]
	if k > len(options) :
		k = len(options)
	filter_relations = random.sample(options, k)
	filter_attributes = [(rel, get_filter_attribute(rel)) for rel in filter_relations]
	return filter_attributes

def instantiate_filters(query, mode, filter_attributes) :
	random.shuffle(filter_attributes)
	filter_complete = []

	for i in range(len(filter_attributes)) :
		f = filter_attributes[i]

		if mode == 10000 :
			filter_complete.append((f, get_filter_values(f[1], 1000)))
		elif mode == 1000 :
			if i == 0 :
				filter_complete.append((f, get_filter_values(f[1], 750)))
			elif i == 1 :
				filter_complete.append((f, get_filter_values(f[1], 400)))
			else :
				filter_complete.append((f, get_filter_values(f[1], 333)))
		elif mode == 100 :
			if i == 0 :
				filter_complete.append((f, get_filter_values(f[1], 500)))
			elif i == 1 :
				filter_complete.append((f, get_filter_values(f[1], 200)))
			else :
				filter_complete.append((f, get_filter_values(f[1], 100)))
		elif mode == 10 :
			if i == 0 :
				filter_complete.append((f, get_filter_values(f[1], 200)))
			elif i == 1 :
				filter_complete.append((f, get_filter_values(f[1], 100)))
			else :
				filter_complete.append((f, get_filter_values(f[1], 50)))
		elif mode == 1 :
			if i == 0 :
				filter_complete.append((f, get_filter_values(f[1], 100)))
			elif i == 1 :
				filter_complete.append((f, get_filter_values(f[1], 50)))
			else :
				filter_complete.append((f, get_filter_values(f[1], 20)))

	return (query[0], query[1], filter_complete)

def find_representative(query) : 
	relation = query[0][0]

	if relation == "store_sales" :
		return ("store_sales", "ss_item_sk")
	elif relation == "store_returns" :
		return ("store_returns", "sr_item_sk")
	elif relation == "web_sales" :
		return ("web_sales", "ws_item_sk")
	elif relation == "catalog_sales" :
		return ("catalog_sales", "cs_item_sk")
	elif relation == "item" :
		return ("item", "i_item_sk")
	elif relation == "customer_demographics" :
		return ("customer_demographics", "cd_demo_sk")
	elif relation == "customer_demographics1" :
		return ("customer_demographics", "cd_demo_sk")
	elif relation == "household_demographics" :
		return ("household_demographics", "hd_demo_sk")
	elif relation == "household_demographics1" :
		return ("household_demographics1", "hd_demo_sk")
	elif relation == "ship_mode" :
		return ("ship_mode", "sm_ship_mode_sk")
	elif relation == "inventory" :
		return ("inventory", "inv_item_sk")
	elif relation == "customer" :
		return ("customer", "c_customer_sk")
	elif relation == "customer_address" :
		return ("customer_address", "ca_address_sk")
	elif relation == "warehouse" :
		return ("warehouse", "w_warehouse_sk")
	elif relation == "date_dim" :
		return ("date_dim", "d_date_sk")
	else :
		print(relation)
		assert False

	return None

def get_alias(relation) :
	if relation == "store_sales" :
		return "ss"
	elif relation == "web_sales" :
		return "ws"
	elif relation == "catalog_sales" :
		return "cs"
	elif relation == "item" :
		return "i"
	elif relation == "customer_demographics" :
		return "cd"
	elif relation == "customer_demographics1" :
		return "cd1"
	elif relation == "household_demographics" :
		return "hd"
	elif relation == "household_demographics1" :
		return "hd1"
	elif relation == "ship_mode" :
		return "sm"
	elif relation == "inventory" :
		return "inv"
	elif relation == "customer" :
		return "c"
	elif relation == "customer_address" :
		return "a"
	elif relation == "warehouse" :
		return "w"
	elif relation == "date_dim" :
		return "d"
	elif relation == "store_returns" :
		return "sr"
	elif relation == "web_returns" :
		return "wr"
	elif relation == "catalog_returns" :
		return "cr"
	elif relation == "reason" :
		return "r"
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
		cur_scan["relation"] = rel if rel[-1] != '1' else rel[:-1]
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

def generate_microbenchmark (case, seed, ratio, prefix) :
	random.seed()

	schema = init_graph()

	if case == "case-1" :
		if seed == None :
			start = random.sample(["store_sales", "web_sales", "catalog_sales", "inventory"],1)[0]
			tmp1 = generate_graph(schema, start, 5)
			tmp2 = generate_filters(tmp1, 3)
			seed = (tmp1, tmp2,)
			print(seed)

		n = 1000

		for i in range(n) :
			if random.random() < ratio :
				mode = "h"
			else :
				mode = "l"

			query_v2 = instantiate_filters(seed[0], mode, seed[1])

			name = get_name(prefix, i)

			generate_plan(query_v2, name)

			batch_text = "1 " + name
			batch_name = get_batch_name(prefix, i)

			f = open(batch_name[1:], "w")
			f.write(batch_text)
			f.close()

		allqueries = [get_name(prefix,i) for i in range(n)]

		sizes = [1, 2, 4, 8, 16, 32, 64, 128, 256, 512]

		for s in sizes :
			for i in range(5) :
				queries = random.sample(allqueries, s)
				batch_text = str(s) + " " + ' '.join(queries)
				batch_name = get_batch_iname(prefix, s, i)

				f = open(batch_name[1:], "w")
				f.write(batch_text)
				f.close()

	elif case == "case-2" :
		if seed == None : 
			start = random.sample(["store_sales", "web_sales", "catalog_sales", "inventory"],1)[0]
			tmp1 = generate_graph(schema, start, 5)
			seed = tmp1
			print(seed)

		n = 50

		for i in range(n) :
			query_v1 = generate_filters(seed, 3)

			if random.random() < ratio :
				mode = "h"
			else :
				mode = "l"

			query_v2 = instantiate_filters(seed, mode, query_v1)

			name = get_name(prefix, i)

			generate_plan(query_v2, name)

			batch_text = "1 " + name
			batch_name = get_batch_name(prefix, i)

			f = open(batch_name[1:], "w")
			f.write(batch_text)
			f.close()

		allqueries = [get_name(prefix,i) for i in range(n)]

		sizes = [1, 10, 20, 30, 40, 50]

		for s in sizes :
			for i in range(5) :
				queries = random.sample(allqueries, s)
				batch_text = str(s) + " " + ' '.join(queries)
				batch_name = get_batch_iname(prefix, s, i)

				f = open(batch_name[1:], "w")
				f.write(batch_text)
				f.close()

	elif case == "case-3" :
		n = 4096

		fnum = 3

		for i in range(n) :
			start = random.sample(["store_sales"],1)[0]
			#start = "store_sales"
			tmp1 = generate_graph(schema, start, 5)
			seed = tmp1

			#seed = (['store_sales', 'date_dim', 'household_demographics', 'item', 'customer'], [(('store_sales', 'ss_sold_date_sk'), ('date_dim', 'd_date_sk')), (('store_sales', 'ss_hdemo_sk'), ('household_demographics', 'hd_demo_sk')), (('store_sales', 'ss_item_sk'), ('item', 'i_item_sk')), (('store_sales', 'ss_customer_sk'), ('customer', 'c_customer_sk'))])

			query_v1 = generate_filters(seed, fnum)

			query_v2 = instantiate_filters(seed, ratio, query_v1)

			name = get_name(prefix, i)

			generate_plan(query_v2, name)

			batch_text = "1 " + name
			batch_name = get_batch_name(prefix, i)

			f = open(batch_name[1:], "w")
			f.write(batch_text)
			f.close()

		allqueries = [get_name(prefix,i) for i in range(n)]

		sizes = [512, 1024, 2048, 4096]

		for s in sizes :
			for i in range(5) :
				queries = random.sample(allqueries, s)
				batch_text = str(s) + " " + ' '.join(queries)
				batch_name = get_batch_iname(prefix, s, i)

				f = open(batch_name[1:], "w")
				f.write(batch_text)
				f.close()

#seed2 = (['store_sales', 'date_dim', 'household_demographics', 'item', 'customer'], [(('store_sales', 'ss_sold_date_sk'), ('date_dim', 'd_date_sk')), (('store_sales', 'ss_hdemo_sk'), ('household_demographics', 'hd_demo_sk')), (('store_sales', 'ss_item_sk'), ('item', 'i_item_sk')), (('store_sales', 'ss_customer_sk'), ('customer', 'c_customer_sk'))])


generate_microbenchmark("case-3", None, 1000, "/scaling")

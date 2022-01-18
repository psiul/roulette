import json

fname = "/home/sioulas/RouLette/prototype/queries/tpcds-queries/h17-100/2.json"

def convert(fname, flist) :
	with open(fname, 'r') as f:
		plan = json.load(f)

	oname = fname[:-4] + "sql"

	query = plan["query"]

	output = query["output"]
	out_attrs = []

	for o in output:
		attr = "("+o["attr"]["relation"]+"."+o["attr"]["attr"]+")"
		expr = o["op"]+attr
		out_attrs.append(expr)


	cnt = 0
	select = "select "
	for o in out_attrs :
		if cnt > 0 :
			select += ","
		select += o
		cnt += 1

	multijoin = query["child"]

	rels = multijoin["children"]
	in_rels = []
	for r in rels :
		in_rel = r["relation"] + " " + r["name"]
		in_rels.append(in_rel)

	cnt = 0
	froms = "from "
	for i in in_rels :
		if cnt > 0 :
			froms += ","
		froms += i
		cnt += 1

	cnt = 0
	where = "where "
	for c in multijoin["cond"] :
		attr1 = c["left"]["relation"]+"."+c["left"]["attr"]
		attr2 = c["right"]["relation"]+"."+c["right"]["attr"]
		cond = attr1+" = "+attr2
		if cnt > 0:
			where += " and "
		where += cond
		cnt += 1

	for i in rels :
		f = i["filter"]
		for c in f :
			assert(c["type"] == "cmp")
			attr1 = c["left"]["relation"]+"."+c["left"]["attr"]
			val = c["right"]["val"]

			if c["left"]["attr"] in ["ss_wholesale_cost", "ss_sales_price", "ws_wholesale_cost", "ws_sales_price", "cs_wholesale_cost", "cs_sales_price"] :
				val = str(float(int(val))/100)

			if c["op"] == "=" :
				cond = attr1+" = "+val
				if cnt > 0:
					where += " and "
				where += cond
				cnt += 1
			elif c["op"] == ">=" :
				cond = attr1+" >= "+val
				if cnt > 0:
					where += " and "
				where += cond
				cnt += 1
			elif c["op"] == "<=" :
				cond = attr1+" <= "+val
				if cnt > 0:
					where += " and "
				where += cond
				cnt += 1
			elif c["op"] == "in" :
				vals = ["'" + v + "'" for v in val.split("|")]
				val = "("+ ",".join(vals) + ")"

				cond = attr1+" in "+val
				if cnt > 0:
					where += " and "
				where += cond
				cnt += 1
			else :
				assert(False)

	engine_specific = "with max_parallel 1;\\g\n"

	sql_query = select + "\n" + froms + "\n" + where + "\n" + engine_specific
	print(sql_query)

	f = open(oname, "w")
	f.write(sql_query)
	f.close()

	flist.append(oname)

n = 512
flist = []
prefix = "/home/sioulas/RouLette/prototype/queries/tpcds-queries/h17-100/"

for i in range(n) :
	fname = prefix + str(i) + ".json"
	convert(fname, flist)


print(flist)
























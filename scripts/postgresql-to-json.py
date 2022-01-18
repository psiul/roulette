import sys
import re

filename = sys.argv[1].split(".")[0]

file = open(filename + ".postgres.txt", 'r')
lines = file.readlines()
file.close()

lines = lines[2:-2]
assert lines[0][0] == ' ' and lines[0][1] != ' '
lines[0] = "-> " + lines[0]

root = lines[0].strip()
hierarchy = {}
stack = []

for line in lines :
	zerocount = 0
	for c in line :
		if c != ' ' :
			break
		zerocount += 1
	
	while True :
		stackcount = 0
		if not stack :
			stackcount = -1
		else :
			stackcount = 0
			for c in stack[-1] :
				if c != ' ' :
					break
				stackcount += 1

		if stackcount < zerocount :
			if stack :
				if stack[-1].strip() not in hierarchy :
					hierarchy[stack[-1].strip()] = []
				hierarchy[stack[-1].strip()] += [line.strip()]
			stack.append(line)
			stackcount = zerocount
			break
		else :
			stack.pop()

for item in hierarchy :
	assert item.startswith("->")
	#print(item + " " + str(hierarchy[item]))

nodes = {}
nodesInv = {}
plan = {}
nodeCount = {}
nodeCount[0] = 0

def make_plan_rec (plan, hierarchy, cur) :
	children = []
	properties = []

	#print(cur)
	assert cur not in nodes

	if cur in hierarchy :
		for attr in hierarchy[cur] :
			if attr.startswith("->") :
				make_plan_rec(plan, hierarchy, attr)
				children.append(nodes[attr])
				del nodes[attr]
			else :
				properties.append(attr)

	nodeId = "node#" + str(nodeCount[0])
	nodes[cur] = nodeId
	nodesInv[nodeId] = cur
	plan[nodeId] = (children, properties)
	nodeCount[0] += 1

make_plan_rec(plan, hierarchy, root)
#for l in plan :
#	print(l + " " + str(plan[l]))
#print("Index")
#for l in nodesInv :
#	print(l + " " + nodesInv[l])
#assert False

#for item in plan :
#	print(item, plan[item])


newplan = {}

def strip_plan_rec (newplan, plan, cur) :
	node = plan[cur]

	for child in node[0] :
		strip_plan_rec(newplan, plan, child)

	if nodesInv[cur].startswith("->  Nested Loop") :
		lhs = newplan[node[0][0]]
		rhs = newplan[node[0][1]]
		newplan[cur] = (nodesInv[cur], ([lhs, rhs], node[1]))
	elif nodesInv[cur].startswith("->  Hash Join") :
		lhs = newplan[node[0][0]]
		rhs = newplan[node[0][1]]
		newplan[cur] = (nodesInv[cur], ([lhs, rhs], node[1]))
	elif nodesInv[cur].startswith("->  Parallel Hash Join") :
		lhs = newplan[node[0][0]]
		rhs = newplan[node[0][1]]
		newplan[cur] = (nodesInv[cur], ([lhs, rhs], node[1]))
	elif nodesInv[cur].startswith("->  Index Only Scan") :
		newplan[cur] = (nodesInv[cur], plan[cur])
	elif nodesInv[cur].startswith("->  Index Scan") :
		newplan[cur] = (nodesInv[cur], plan[cur])
	elif nodesInv[cur].startswith("->  Seq Scan") :
		newplan[cur] = (nodesInv[cur], plan[cur])
	elif nodesInv[cur].startswith("->  Parallel Seq Scan") :
		newplan[cur] = (nodesInv[cur], plan[cur])
	elif nodesInv[cur].startswith("->  Hash") :
		newplan[cur] = newplan[node[0][0]]
	elif nodesInv[cur].startswith("->  Parallel Hash") :
		newplan[cur] = newplan[node[0][0]]
	elif nodesInv[cur].startswith("->  Gather") :
		newplan[cur] = newplan[node[0][0]]
	elif nodesInv[cur].startswith("->  Partial Aggregate") :
		newplan[cur] = newplan[node[0][0]]
	elif nodesInv[cur].startswith("->  Finalize Aggregate") :
		newplan[cur] = newplan[node[0][0]]
	elif nodesInv[cur].startswith("->  Aggregate") :
		newplan[cur] = newplan[node[0][0]]
	else :
		print(nodesInv[cur])
		assert False


strip_plan_rec(newplan, plan, nodes[root])


def getValue(val) :
	val = val.strip()

	if ':' in val :
		val = val.split("::")[0]

	if '(' in val :
		val = val[1:-1]

	if '\'' in val : 
		val = val[1:-1]

	if '\"' in val : 
		val = val[1:-1]

	return val

def checkAttr(val) :
	prog = re.compile("^([a-zA-Z\_])*$")
	match = prog.match(val)

	if match :
		return True

	return False

def checkString(val) :
	if (val[0] == '\'' and val[-1] == '\'') or (val[0] == '\"' and val[-1] == '\"') :
		return True

	return False

def checkNumber(val) :
	prog = re.compile("^[0-9]*$")
	match = prog.match(val)

	if match :
		return True

	return False

def checkAnnotated(val) :
	if "::" in val :
		members = val.split("::")

		if not checkAttr(members[1]) :
			return False

		if members[0][0] == '(' and members[0][-1] == ')' :
			return checkAttr(members[0][1:-1])
		elif checkString(members[0]) or checkNumber(members[0]) :
			return True

		return False

	return False

def checkComparison(val) :
	if " = " in val :
		members = val.split(" = ")

		if (len(members) > 2) :
			return False

		if (checkAttr(members[0]) or checkAnnotated(members[0])) and (checkAnnotated(members[1]) or checkString(members[1]) or checkNumber(members[1])) :
			return True

	if " != " in val :
		members = val.split(" != ")

		if (len(members) > 2) :
			return False

		if (checkAttr(members[0]) or checkAnnotated(members[0])) and (checkAnnotated(members[1]) or checkString(members[1]) or checkNumber(members[1])) :
			return True

	if " ~~ " in val :
		members = val.split(" ~~ ")

		if (len(members) > 2) :
			return False

		if (checkAttr(members[0]) or checkAnnotated(members[0])) and (checkAnnotated(members[1]) or checkString(members[1]) or checkNumber(members[1])) :
			return True

	if " !~ " in val :
		members = val.split(" !~ ")

		if (len(members) > 2) :
			return False

		if (checkAttr(members[0]) or checkAnnotated(members[0])) and (checkAnnotated(members[1]) or checkString(members[1]) or checkNumber(members[1])) :
			return True

	if " > " in val :
		members = val.split(" > ")

		if (len(members) > 2) :
			return False

		if (checkAttr(members[0]) or checkAnnotated(members[0])) and (checkAnnotated(members[1]) or checkString(members[1]) or checkNumber(members[1])) :
			return True

	if " < " in val :
		members = val.split(" < ")

		if (len(members) > 2) :
			return False

		if (checkAttr(members[0]) or checkAnnotated(members[0])) and (checkAnnotated(members[1]) or checkString(members[1]) or checkNumber(members[1])) :
			return True

	if " >= " in val :
		members = val.split(" >= ")

		if (len(members) > 2) :
			return False

		if (checkAttr(members[0]) or checkAnnotated(members[0])) and (checkAnnotated(members[1]) or checkString(members[1]) or checkNumber(members[1])) :
			return True

	if " <= " in val :
		members = val.split(" <= ")

		if (len(members) > 2) :
			return False

		if (checkAttr(members[0]) or checkAnnotated(members[0])) and (checkAnnotated(members[1]) or checkString(members[1]) or checkNumber(members[1])) :
			return True

	return False

def checkLogical(val) :
	if checkComparison(val) :
		return True

	if " AND " in val :
		members = val.split(" AND ")

		if checkLogical(members[0][1:-1]) and checkLogical(members[1][1:-1]) :
			return True

	if " OR " in val :
		members = val.split(" OR ")

		if checkLogical(members[0][1:-1]) and checkLogical(members[1][1:-1]) :
			return True

	return False


def parseAttr(val, table) :
	attrObj = {}
	attrObj["attr"] = val
	attrObj["relation"] = table
	return attrObj

def parseAnnotated(val, table) :
	if "::" in val :
		members = val.split("::")

		if not checkAttr(members[1]) :
			assert False

		if members[0][0] == '(' and members[0][-1] == ')' :
			return parseAttr(members[0][1:-1], table)
		elif checkString(members[0]) :
			return parseString(members[0])
		elif checkNumber(members[0]) :
			return parseNumber(members[0])

		assert False

	assert False

def parseString(val) :
	if (val[0] == '\'' and val[-1] == '\'') or (val[0] == '\"' and val[-1] == '\"') :
		strObj = {}
		strObj["value"] = val[1:-1]
		strObj["type"] = "value"
		return strObj

	assert False

def parseNumber(val) :
	numObj = {}
	numObj["value"] = val
	numObj["type"] = "value"
	return numObj

def parseComparison(val, table) :
	if " = " in val :
		members = val.split(" = ")

		if (len(members) > 2) :
			assert False

		if (checkAttr(members[0]) or checkAnnotated(members[0])) and (checkAnnotated(members[1]) or checkString(members[1]) or checkNumber(members[1])) :
			cmpObj = {}
			cmpObj["type"] = "cmp"
			cmpObj["op"] = "="

			if checkAttr(members[0]) :
				cmpObj["left"] = parseAttr(members[0], table)
			else :
				cmpObj["left"] = parseAnnotated(members[0], table)

			if checkAnnotated(members[1]) :
				cmpObj["right"] = parseAnnotated(members[1], table)
			elif checkString(members[1])  :
				cmpObj["right"] = parseString(members[1])
			else :
				cmpObj["right"] = parseNumber(members[1])

			return cmpObj

	if " <> " in val :
		members = val.split(" <> ")

		if (len(members) > 2) :
			assert False

		if (checkAttr(members[0]) or checkAnnotated(members[0])) and (checkAnnotated(members[1]) or checkString(members[1]) or checkNumber(members[1])) :
			cmpObj = {}
			cmpObj["type"] = "cmp"
			cmpObj["op"] = "!="

			if checkAttr(members[0]) :
				cmpObj["left"] = parseAttr(members[0], table)
			else :
				cmpObj["left"] = parseAnnotated(members[0], table)

			if checkAnnotated(members[1]) :
				cmpObj["right"] = parseAnnotated(members[1], table)
			elif checkString(members[1])  :
				cmpObj["right"] = parseString(members[1])
			else :
				cmpObj["right"] = parseNumber(members[1])

			return cmpObj

	if " ~~ " in val :
		members = val.split(" ~~ ")

		if (len(members) > 2) :
			assert False

		if (checkAttr(members[0]) or checkAnnotated(members[0])) and (checkAnnotated(members[1]) or checkString(members[1]) or checkNumber(members[1])) :
			cmpObj = {}
			cmpObj["type"] = "cmp"
			cmpObj["op"] = "~~"

			if checkAttr(members[0]) :
				cmpObj["left"] = parseAttr(members[0], table)
			else :
				cmpObj["left"] = parseAnnotated(members[0], table)

			if checkAnnotated(members[1]) :
				cmpObj["right"] = parseAnnotated(members[1], table)
			elif checkString(members[1])  :
				cmpObj["right"] = parseString(members[1])
			else :
				cmpObj["right"] = parseNumber(members[1])

			return cmpObj

	if " !~ " in val :
		members = val.split(" !~ ")

		if (len(members) > 2) :
			assert False

		if (checkAttr(members[0]) or checkAnnotated(members[0])) and (checkAnnotated(members[1]) or checkString(members[1]) or checkNumber(members[1])) :
			cmpObj = {}
			cmpObj["type"] = "cmp"
			cmpObj["op"] = "!~~"

			if checkAttr(members[0]) :
				cmpObj["left"] = parseAttr(members[0], table)
			else :
				cmpObj["left"] = parseAnnotated(members[0], table)

			if checkAnnotated(members[1]) :
				cmpObj["right"] = parseAnnotated(members[1], table)
			elif checkString(members[1])  :
				cmpObj["right"] = parseString(members[1])
			else :
				cmpObj["right"] = parseNumber(members[1])

			return cmpObj

	if " > " in val :
		members = val.split(" > ")

		if (len(members) > 2) :
			assert False

		if (checkAttr(members[0]) or checkAnnotated(members[0])) and (checkAnnotated(members[1]) or checkString(members[1]) or checkNumber(members[1])) :
			cmpObj = {}
			cmpObj["type"] = "cmp"
			cmpObj["op"] = ">"

			if checkAttr(members[0]) :
				cmpObj["left"] = parseAttr(members[0], table)
			else :
				cmpObj["left"] = parseAnnotated(members[0], table)

			if checkAnnotated(members[1]) :
				cmpObj["right"] = parseAnnotated(members[1], table)
			elif checkString(members[1])  :
				cmpObj["right"] = parseString(members[1])
			else :
				cmpObj["right"] = parseNumber(members[1])

			return cmpObj

	if " < " in val :
		members = val.split(" < ")

		if (len(members) > 2) :
			assert False

		if (checkAttr(members[0]) or checkAnnotated(members[0])) and (checkAnnotated(members[1]) or checkString(members[1]) or checkNumber(members[1])) :
			cmpObj = {}
			cmpObj["type"] = "cmp"
			cmpObj["op"] = "<"

			if checkAttr(members[0]) :
				cmpObj["left"] = parseAttr(members[0], table)
			else :
				cmpObj["left"] = parseAnnotated(members[0], table)

			if checkAnnotated(members[1]) :
				cmpObj["right"] = parseAnnotated(members[1], table)
			elif checkString(members[1])  :
				cmpObj["right"] = parseString(members[1])
			else :
				cmpObj["right"] = parseNumber(members[1])

			return cmpObj

	if " >= " in val :
		members = val.split(" >= ")

		if (len(members) > 2) :
			assert False

		if (checkAttr(members[0]) or checkAnnotated(members[0])) and (checkAnnotated(members[1]) or checkString(members[1]) or checkNumber(members[1])) :
			cmpObj = {}
			cmpObj["type"] = "cmp"
			cmpObj["op"] = ">="

			if checkAttr(members[0]) :
				cmpObj["left"] = parseAttr(members[0], table)
			else :
				cmpObj["left"] = parseAnnotated(members[0], table)

			if checkAnnotated(members[1]) :
				cmpObj["right"] = parseAnnotated(members[1], table)
			elif checkString(members[1])  :
				cmpObj["right"] = parseString(members[1])
			else :
				cmpObj["right"] = parseNumber(members[1])

			return cmpObj

	if " <= " in val :
		members = val.split(" <= ")

		if (len(members) > 2) :
			assert False

		if (checkAttr(members[0]) or checkAnnotated(members[0])) and (checkAnnotated(members[1]) or checkString(members[1]) or checkNumber(members[1])) :
			cmpObj = {}
			cmpObj["type"] = "cmp"
			cmpObj["op"] = "<="

			if checkAttr(members[0]) :
				cmpObj["left"] = parseAttr(members[0], table)
			else :
				cmpObj["left"] = parseAnnotated(members[0], table)

			if checkAnnotated(members[1]) :
				cmpObj["right"] = parseAnnotated(members[1], table)
			elif checkString(members[1])  :
				cmpObj["right"] = parseString(members[1])
			else :
				cmpObj["right"] = parseNumber(members[1])

			return cmpObj

	assert False

def parseLogical(val, table) :
	if checkComparison(val) :
		return parseComparison(val, table)

	if " AND " in val :
		members = val.split(" AND ")

		if checkLogical(members[0][1:-1]) and checkLogical(members[1][1:-1]) :
			lhs = parseLogical(members[0][1:-1], table)
			rhs = parseLogical(members[1][1:-1], table)

			logicalObj = {}
			logicalObj["type"] = "logical"
			logicalObj["op"] = "OR"
			logicalObj["left"] = lhs
			logicalObj["right"] = rhs
			return logicalObj

	if " OR " in val :
		members = val.split(" OR ")

		if checkLogical(members[0][1:-1]) and checkLogical(members[1][1:-1]) :
			lhs = parseLogical(members[0][1:-1], table)
			rhs = parseLogical(members[1][1:-1], table)

			logicalObj = {}
			logicalObj["type"] = "logical"
			logicalObj["op"] = "OR"
			logicalObj["left"] = lhs
			logicalObj["right"] = rhs
			return logicalObj

	assert False

def parseJoin(val) :
	members = [x.strip() for x in val.split(" = ")]

	joinObj = {}

	lhs = {}
	lhs["relation"] = members[0].split(".")[0]
	lhs["attr"] = members[0].split(".")[1]

	rhs = {}
	rhs["relation"] = members[1].split(".")[0]
	rhs["attr"] = members[1].split(".")[1]

	joinObj["left"] = lhs
	joinObj["right"] = rhs

	return joinObj

def parseIndex(val, table) :
	members = [x.strip() for x in val.split(" = ")]

	joinObj = {}

	lhs = {}
	lhs["relation"] = table
	lhs["attr"] = members[0]

	rhs = {}
	rhs["relation"] = members[1].split(".")[0]
	rhs["attr"] = members[1].split(".")[1]

	joinObj["left"] = lhs
	joinObj["right"] = rhs

	return joinObj


def json_plan_rec(plan, cur) :
	if cur.startswith("->  Index Only Scan") or cur.startswith("->  Index Scan") or cur.startswith("->  Seq Scan") or cur.startswith("->  Parallel Seq Scan") :
		node = {}
		inputRelation = cur.split(" on ")[1].split(" ")[0:2]
		node["relation"] = inputRelation[0]
		node["name"] = inputRelation[1]
		node["type"] = "scan"

		filterList = []

		for attr in plan[1][1] :
			if attr.startswith("Filter:") :
				continue
				cond = attr[len("Filter: "):]
				assert cond[0] == '(' and cond[-1] == ')'
				parsedCond = parseLogical(cond[1:-1], inputRelation[1])
				filterList.append(parsedCond)

		if filterList :
			node["filter"] = filterList

		return node
	elif cur.startswith("->  Nested Loop") or cur.startswith("->  Hash Join") or cur.startswith("->  Parallel Hash Join") :
		node = {}
		node["left"] = json_plan_rec(plan[1][0][0], plan[1][0][0][0])
		node["right"] = json_plan_rec(plan[1][0][1], plan[1][0][1][0])
		node["type"] = "join"

		if cur.startswith("->  Nested Loop") :
			attrs = plan[1][0][1][1][1]
			for attr in attrs :
				#print(attr)
				if attr.startswith("Index Cond:") :
					cond = attr[len("Index Cond: "):]
					assert cond[0] == '(' and cond[-1] == ')'
					parsedCond = parseIndex(cond[1:-1], node["right"]["name"])
					node["cond"] = parsedCond
			if "cond" not in node :
				attrs = plan[1][1]
			for attr in attrs :
				if attr.startswith("Join Filter:") :
					cond = attr[len("Join Filter: "):]
					assert cond[0] == '(' and cond[-1] == ')'
					parsedCond = parseJoin(cond[1:-1])
					node["cond"] = parsedCond
		elif cur.startswith("->  Hash Join") or cur.startswith("->  Parallel Hash Join") :
			attrs = plan[1][1]
			for attr in attrs :
				if attr.startswith("Hash Cond:") :
					cond = attr[len("Hash Cond: "):]
					assert cond[0] == '(' and cond[-1] == ')'
					parsedCond = parseJoin(cond[1:-1])
					node["cond"] = parsedCond

		if "cond" not in node :
			print(cur)
			print(filename)
		assert "cond" in node
		return node
	else :
		print(cur)
		assert False
			

key = newplan[nodes[root]][0]

join_plan = json_plan_rec(newplan[nodes[root]], key)

import json


f = open(filename + ".postgres.json", "w")
f.write(json.dumps(join_plan, indent=4))
f.close()

				

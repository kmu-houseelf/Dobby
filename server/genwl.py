import codecs
import re
from operator import itemgetter, attrgetter

COMMENT_SYMBOL = '#'
FLAG_SYMBOL = '@'

LIST_FLAG = 1
MAPPING_FLAG = 2
USER_FLAG = 3
PATTERN_FLAG = 4
UNKNOWN_FLAG = -1

filename = 'config.txt'
list_dict = {}
mapping_dict = {}
user_func_dict = {}
pattern_dict = {}
patternline_dict = {}

global_pattern_num = 1

def isComment(symbol):
	return symbol == COMMENT_SYMBOL

def isWhiteSpace(symbol):
	return symbol == '\n' or symbol == '\0' or symbol == '\r'

def isFlagSymbol(symbol):
	return symbol == FLAG_SYMBOL

def getFlag(line):
	if line[1:].strip() == 'list':
		return LIST_FLAG
	elif line[1:].strip() == 'mapping':
		return MAPPING_FLAG
	elif line[1:].strip() == 'user':
		return USER_FLAG
	elif line[1:].strip() == 'pattern':
		return PATTERN_FLAG
	else:
		return UNKNOWN_FLAG

def run(flag, line):
	if flag == LIST_FLAG:
		variable, array = line.split('=')
		variable, array	= variable.strip(), array.strip()
		list_dict[variable] = array

	elif flag == MAPPING_FLAG:
		lhs, rhs = line.split('=')
		lhs, rhs = lhs.strip(), rhs.strip()
		mapping_dict[lhs] = rhs

	elif flag == USER_FLAG:
		mapping_func, value = line.split('=')
		mapping_func, value = mapping_func.strip(), value.strip()

		mapping_func_name, parameter = re.findall(r"[\w]+", mapping_func)

		if not mapping_func_name in user_func_dict:
			user_func_dict[mapping_func_name] = {}		

		user_func_dict[mapping_func_name][parameter] = value

	elif flag == PATTERN_FLAG:
		global global_pattern_num
		pattern, json_rule = line.split('/')
		pattern, json_rule = pattern.strip(), json_rule.strip()
		pattern_dict[pattern] = json_rule

		rules = json_rule.split(',')
		for i, rule in enumerate(rules):
			lhs, rhs = rule.split('=')
			lhs, rhs = lhs.strip(), rhs.strip()
			rhs = [item.strip() for item in rhs.split('+')]

			# if $pattern
			if rhs[0][0] == '$':
				patternline_dict[rhs[0][1:]]=global_pattern_num
		global_pattern_num += 1



with codecs.open(filename,'r',encoding='utf8') as f:
    for line in f.readlines():
    	text = line.strip('\n')
	if text == "":
		continue
    	symbol = text[0]

    	if isComment(symbol) or isWhiteSpace(symbol):
    		continue
    	elif isFlagSymbol(symbol):
    		flag = getFlag(text)
    	else:
    		run(flag, text)


def printResult():
	print('# list table')
	for variable, array in list_dict.items():
	    print(variable, array)

	print('# mapping table')
	for lhs, rhs in list_dict.items():
		print(lhs, rhs)

	print('# user table')
	for func_name, pair in user_func_dict.items():
		print(func_name)
		for parameter, value in pair.items():
			print(parameter, value)

	print('# pattern table')
	for pattern, json_rule in pattern_dict.items():
		print(pattern, json_rule)

	print('# pattern variable table')
	for symbol, num in patternline_dict.items():
		print(symbol, num)

def generateWl():
	with codecs.open('module/auto_gen_wl.wl','w',encoding='utf8') as f:
		f.write('\n(* define morph pattern *)\n')
		for variable, array in list_dict.items():
			f.write(variable + ' = Apply[Alternatives, ' + array + ']\n')

		f.write('\n(* define mapping *)\n')
		for variable, array in list_dict.items():
			if variable in mapping_dict:
				lhs = array[1:-1].split(',')
				rhs = mapping_dict[variable][1:-1].split(',')
				res = [l + '->' + rhs[i] for i, l in enumerate(lhs)]
				res = '{' + ','.join(res) + '}'
				f.write(variable + 'Mapping = ' + res + '\n')

			else:
				b = re.findall(r"[A-Z][a-z]+", variable)[-1]
				f.write('{}Mapping = #->{}&/@'.format(variable, b) + array + '\n')

		f.write('\n(* define sentence pattern *)\n')
		pattern_number = 1
		for pattern, _ in pattern_dict.items():
			lst = re.findall(r"[\w]+", pattern)
			lst = ['{}:{}'.format(item.lower(), item) for item in lst]
			if pattern[0] == '%':
				lst[0] = '\"Q{}\"'.format(patternline_dict[lst[0].split(':')[0]])

			pat = '~~___~~'.join(lst)
			pat = '___~~' + pat + '~~___'
			f.write('SentencePattern{} = {}\n'.format(pattern_number, pat))
			pattern_number += 1

		f.write('\n(* define sentence parameter *)\n')
		parameter_number = 1
		for pattern, _ in pattern_dict.items():
			lst = re.findall(r"[\w]+", pattern)

			if lst[0] in patternline_dict:
				lst.remove(lst[0])

			lst = [item.lower() for item in lst]
			arr = ','.join(lst)
			f.write('SentenceParameter{} = {{{}}}\n'.format(parameter_number, arr))
			parameter_number += 1

		f.write('\n(* define sentence json *)\n')
		json_number = 1
		for pattern, json_rule in pattern_dict.items():
			# paramter 
			lst = re.findall(r"[\w]+", pattern)
			if lst[0] in patternline_dict:
				lst.remove(lst[0])

			lst2 = ['{}_'.format(item.lower()) for item in lst]
			arr = ','.join(lst2)
			json = ''

			# paramter json 
			for item in lst:
				temp = re.findall(r"[A-Z][a-z]+", item)
				temp = ['[\"{}\"]'.format(t) for t in temp if t != "True" and t != 'False' ]
				lhs = 'json'+''.join(temp)
				rhs = item.lower() + '/.' + item + 'Mapping'
				json += '{} = {};'.format(lhs, rhs)

			# rule json
			rules = json_rule.split(',')
			for rule in rules:
				lhs, rhs = rule.split('=')
				lhs, rhs = lhs.strip(), rhs.strip()
				temp = re.findall(r"[A-Z][a-z]+", lhs)
				temp = ['[\"{}\"]'.format(t) for t in temp if t != "True" and t != 'False' ]
				lhs = 'json'+''.join(temp)

				rhs = [item.strip() for item in rhs.split('+')]

				# if $pattern
				if rhs[0][0] == '$':
					rhs = '{}'.format(patternline_dict[rhs[0][1:]])
					json += lhs + ' = ' + rhs + ';'
					continue

				# if user function exist
				for i, item in enumerate(rhs):
					if re.match(r'[\w]+\[[\w]+\]', item):
						func, param = re.findall(r"[\w]+", item)
						if func in user_func_dict and param in user_func_dict[func]:
							rhs[i] = user_func_dict[func][param]

				rhs = [item.lower() if item in list_dict else item for item in rhs]
				rhs = '~~'.join(rhs)

				json += lhs + ' = ' + rhs + ';'

			f.write('SentenceJson{}[{{{}}}] := Module[{{json = DefaultJson}},'.format(json_number, arr) + json + 'json]\n')
			json_number += 1


		pattern_list = [(i, key.count(','), not(value.find('Pattern') >= 0)) for i, (key, value) in enumerate(pattern_dict.items())]

		pattern_list = sorted(pattern_list, key=itemgetter(2,1), reverse=True)

		f.write('\n(* define function template *)\n')
		for p in pattern_list:
			print p
			f.write('FuncTemplate[SentencePattern{0}, SentenceParameter{0}, SentenceJson{0}]\n'.format(p[0] + 1))


printResult()
generateWl()


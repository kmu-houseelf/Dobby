import codecs
import re

COMMENT_SYMBOL = '#'
FLAG_SYMBOL = '@'

LIST_FLAG = 1
MAPPING_FLAG = 2
USER_FLAG = 3
PATTERN_FLAG = 4
UNKNOWN_FLAG = -1

filename = 'config.txt'
list_dict = {}
user_func_dict = {}
pattern_dict = {}

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
		
		pass

	elif flag == USER_FLAG:
		mapping_func, value = line.split('=')
		mapping_func, value = mapping_func.strip(), value.strip()

		mapping_func_name, parameter = re.findall(r"[\w]+", mapping_func)

		if not mapping_func_name in user_func_dict:
			user_func_dict[mapping_func_name] = {}		

		user_func_dict[mapping_func_name][parameter] = value

	elif flag == PATTERN_FLAG:
		pattern, json_rule = line.split('/')
		pattern, json_rule = pattern.strip(), json_rule.strip()
		pattern_dict[pattern] = json_rule

with codecs.open(filename,'r',encoding='utf8') as f:
    for line in f.readlines():
    	text = line.strip('\n')
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
	for func_name, pair in user_func_dict.items():
		print(func_name)
		for parameter, value in pair.items():
			print(parameter, value)

	print('# pattern table')
	for pattern, json_rule in pattern_dict.items():
		print(pattern, json_rule)

def generateWl():
	with codecs.open('auto_gen_wl.wl','w',encoding='utf8') as f:
		f.write('\n(* define morph pattern *)\n')
		for variable, array in list_dict.items():
			f.write(variable + ' = Apply[Alternatives, ' + array + ']\n')

		f.write('\n(* define sentence pattern *)\n')
		pattern_number = 1
		for pattern, _ in pattern_dict.items():
			lst = re.findall(r"[\w]+", pattern)
			lst = ['{}:{}'.format(item.lower(), item) for item in lst]
			pat = '~~___~~'.join(lst)
			pat = '___~~' + pat + '~~___'
			f.write('SentencePattern{} = {}\n'.format(pattern_number, pat))
			pattern_number += 1

		f.write('\n(* define sentence parameter *)\n')
		parameter_number = 1
		for pattern, _ in pattern_dict.items():
			lst = re.findall(r"[\w]+", pattern)
			lst = [item.lower() for item in lst]
			arr = ','.join(lst)
			f.write('SentenceParameter{} = {{{}}}\n'.format(parameter_number, arr))
			parameter_number += 1

		f.write('\n(* define sentence json *)\n')
		json_number = 1
		for pattern, json_rule in pattern_dict.items():
			# paramter 
			lst = re.findall(r"[\w]+", pattern)
			lst2 = ['{}_'.format(item.lower()) for item in lst]
			arr = ','.join(lst2)
			json = ''

			# paramter json 
			for item in lst:
				temp = re.findall(r"[A-Z][a-z]+", item)
				temp = ['[\"{}\"]'.format(t) for t in temp if t != "True" and t != 'False' ]
				lhs = 'json'+''.join(temp)
				rhs = item.lower() 
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

		f.write('\n(* define function template *)\n')
		for i in range(json_number - 1):
			f.write('FuncTemplate[SentencePattern{0}, SentenceParameter{0}, SentenceJson{0}]\n'.format(i + 1))
		

printResult()
generateWl()





# process Unicode text
#with codecs.open(filename,'w',encoding='utf8') as f:
#    f.write(text)
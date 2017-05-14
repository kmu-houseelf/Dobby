from konlpy.tag import Twitter
from konlpy.utils import pprint

twitterMorph = Twitter()

with open('data1.csv', 'r') as data:
	for idx, line in enumerate(data.readlines()):
		sentence, _ = line.split(',')
		morphList = twitterMorph.pos(sentence.decode('utf8'))
		
		with open('morph_data1.txt','a') as result_file:
			for morph in morphList:
				result_file.write(morph[0].encode('utf8') + '+'.encode('utf8'))
				result_file.write(morph[1].encode('utf8') + '/'.encode('utf8'))
			result_file.write('\n'.encode('utf8'))

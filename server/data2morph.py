from konlpy.tag import Twitter
from konlpy.utils import pprint

twitterMorph = Twitter()
morphSet = set()

with open('data1.csv', 'r') as data:
	for idx, line in enumerate(data.readlines()):
		sentence, _ = line.split(',')
		morphList = twitterMorph.morphs(sentence.decode('utf8'))
		morphSet.update(morphList)

	with open('morph_data1.txt', 'a') as resultFile:
		resultFile.write(','.join(morphSet).encode('utf8'))
				
		

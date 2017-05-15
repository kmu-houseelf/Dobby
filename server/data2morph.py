from konlpy.tag import Twitter
from konlpy.utils import pprint
from os.path import basename
import sys

twitterMorph = Twitter()
morphSet = set()

with open(sys.argv[1], 'r') as data:
	for idx, line in enumerate(data.readlines()):
		morphList = twitterMorph.morphs(line.decode('utf8'))
		morphSet.update(morphList)

	with open('data/morph_' + basename(sys.argv[1]), 'a') as resultFile:
		resultFile.write(','.join(morphSet).encode('utf8'))
				
		

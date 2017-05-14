from konlpy.tag import Twitter
from konlpy.utils import pprint
import sys

double_encode_sentence = sys.argv[1]
abnormal_single_encode_sentence = double_encode_sentence.decode('utf8')
hex_list = [chr(int(hex(ord(ch)),16)) for ch in abnormal_single_encode_sentence]
single_encode_sentence = ''.join(hex_list)
sentence = single_encode_sentence.decode('utf8')

twitterMorph = Twitter()
morph_list = twitterMorph.morphs(sentence)
pprint(morph_list)

with open('temp.txt', 'w') as result_file:
	result_file.write(','.join(morph_list).encode('utf8'))


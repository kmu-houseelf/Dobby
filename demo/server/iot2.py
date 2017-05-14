# -*- coding: utf-8 -*-
# 간단한 데모 실습- 1
# 홈IOT 조명 부분 대화 처리
# 입력된 문장을 형태소 분석하여 명사 정보를 추출하고 ner 사전을 통해
# 명사정보에 분류 정보를 태깅하여 문장 분석을 통해
# json 형식의 조명 정보를 조작한다.

import sys
import string
import MeCab
from tag import *
from light import *
#from konlpy.tag import Mecab
from konlpy.utils import pprint

reload(sys)
sys.setdefaultencoding('utf8')

def run(sentence):
        # input sentence
        # 형태소 분석기는 Mecab 사용
        mecabParse = MeCab.Tagger('-d /usr/local/lib/mecab/dic/mecab-ko-dic')
        parse = mecabParse.parse(sentence)
        print parse
        request = tagging(parse) # 단어, 품사, ner정보만 spilt
        domain, location = find_ner(request) # NER을 찾는다

        if domain == "device_house_light" : # domain이 조명일 경우
                act = light(domain, location, request)
                act.action()

        f = open('./newconfig.json')
        result = f.read()
        f.close()
        return result
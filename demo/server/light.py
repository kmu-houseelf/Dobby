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
nlpcapstone@nlpcapstone-p6-2340kr:~/Desktop/nghserver$ cat light.py
# -*- coding: utf-8 -*-
import json

# json 파일 조작
CONFIG_FILE="./newconfig.json"
CONFIG={}

def readConfig(filename) :
        f = open(filename, 'r')
        js = json.loads(f.read()) # 파싱
        f.close()
        return js

def writeConfig(filename, s) :
        f = open(filename, 'w')
        f.write(s)
        f.close()

def readJson() :
        global CONFIG_FILE
        global CONFIG
        CONFIG = readConfig(CONFIG_FILE)

def writeJson() :
        state = json.dumps(CONFIG, indent = 4, ensure_ascii = False)
        writeConfig(CONFIG_FILE, state)

class light :

        def __init__(self, dom=None, loc=None, request=None) :
                self.domain = dom
                self.location = loc
                self.number = None
                self.request = request
                readJson()

        def __del__(self) :
                writeJson()

        def action(self) :
                verbs_dict = { 'on' : ['켜', '틀', '밝혀'], 'off' : ['꺼', '오프'], 'lighter' : ['밝', '환하', '세', '강하', '높', '높이', '높여', '높히', '높혀', '올리', '올려'], 'lightless' : ['어둡', '약하', '낮추', '낮춰'] }
                for word, pos, ner in self.request :

                        try :
                                next_pos = request[1][1]        # 형용사 + 동사 조합인지 확인
                        except Exception :
                                # 동사만 있을 경우
                                if pos.startswith('VV'):
                                        if word in verbs_dict['on'] :           # 켜는 동사일 경우
                                                self.turnOnAll(1)
                                        elif word in verbs_dict['off'] :        # 끄는 동사일 경우
                                                self.turnOffAll()
                                # 형용사만 있을 경우
                                elif pos.startswith('VA'):
                                        if word in verbs_dict['lighter'] :              # 밝게
                                                self.lighter()
                                        elif word in verbs_dict['lightless'] :          # 어둡게
                                                self.lightless()
                        else :
                                next_word = request[1][0]
                                if pos.startswith('VA') and next_pos.startswith('VV'):
                                        if word in dic['lighter'] :             # 밝게
                                                if next_word in verbs_dict['on'] :              # 켜는 동사일 경우
                                                        self.turnOnAll(3)
                                                elif next_word in ['해'] :               # 형용사 자체가 명령일 경우
                                                        self.lighter()

                                        elif word in dic['lightless'] :         # 어둡게
                                                if next_word in verbs_dict['on'] :              # 켜는 동사일 경우
                                                        self.turnOnAll(0)
                                                elif next_word in ['해'] :               # 형용사 자체가 명령일 경우
                                                        self.lightless()
                writeJson()
        # 켜는 동작 (default : 모두 켠다, 스마트등의 경우 1단계 밝기로)
        def turnOnAll(self, num = 1) :
                for i in CONFIG[self.domain][self.location] :
                        if i.find('스마트등') != -1 :       # key값 문자열에 스마트등이 있을경우
                                CONFIG[self.domain][self.location][i] = num     # 스마트등 단계 :1 ~ 3
                                print self.location, '스마트등', num, '단계'
                        elif i.find('등') != -1 :                # key값 문자열에 등이 있을경우
                                CONFIG[self.domain][self.location][i] = 1
                                print self.location, i, 'on'

        # 끄는 동작
        def turnOffAll(self) :
                for i in CONFIG[self.domain][self.location] :
                        if i.find('등') != -1 :          # key값 문자열에 등이 있을경우
                                CONFIG[self.domain][self.location][i] = 0
                                print self.location, i, 'off'
        # 밝게 (일반등 -> 스마트등 순서)
        def lighter(self) :
                for i in CONFIG[self.domain][self.location] :
                        if i.find('등') != -1 :          # key값 문자열에 등이 있을경우
                            if CONFIG[self.domain][self.location][i] == 0 :
                                CONFIG[self.domain][self.location][i] = 1
                                print self.location, i, 'on'
                                break
                        if i.find('스마트등') != -1 :       # key값 문자열에 스마트등이 있을경우
                            if CONFIG[self.domain][self.location][i] < 3 :      # 스마트등 단계 :1 ~ 3
                                CONFIG[self.domain][self.location][i] += 1      # 단계를 높인다
                                print self.location, '스마트등 ', CONFIG[self.domain][self.location][i], '단계'
                                break

        # 어둡게 (스마트등 -> 일반등 순서)
        def lightless(self) :
                for i in CONFIG[self.domain][self.location] :
                        if i.find('스마트등') != -1 :       # key값 문자열에 스마트등이 있을경우
                            if CONFIG[self.domain][self.location][i] > 0 :      # 스마트등 단계 :1 ~ 3
                                CONFIG[self.domain][self.location][i] -= 1      # 단계를 낮춘다
                                print self.location, '스마트등 ', CONFIG[self.domain][self.location][i], '단계'
                                break
                        elif i.find('등') != -1 :                # key값 문자열에 등이 있을경우
                            if CONFIG[self.domain][self.location][i] == 1 :
                                CONFIG[self.domain][self.location][i] = 0
                                print self.location, i, 'off'
                                break
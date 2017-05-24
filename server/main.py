#!/usr/bin/python

import socket 
import sys
import subprocess
import codecs
import json
from datetime import datetime


result = subprocess.check_output('python genwl.py', shell=True)

sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
sock.bind(('', 1759))
sock.listen(1)

with codecs.open('default_json.json', 'r', encoding='utf8') as f:
	default_json = f.read()

while True:
	print '... wait connection ...'
	conn, client = sock.accept()

	try:
		print 'conn from', client
		data = conn.recv(2048)
		print str(datetime.now()), data

		if '/' in data:
			sent, js = data.split('/')
		else:
			conn.send('data must be sentence / json')
			conn.close()
			continue


		if 'unknown' in js:
			js = default_json


		j = json.loads(js)


		with codecs.open('protocol.json','w',encoding='utf8') as f:
			f.write(js.decode('utf8'))
#		with codecs.open('protocol.json','r',encoding='utf8') as f:
#			j = json.load(f)

		if j["Pattern"] != "Null":
			sent = "Q" + str(j["Pattern"]) + sent

	finally:
		try:
			result = subprocess.check_output('./sentence2json.wl \"'+sent.replace(' ','')+'\"', shell=True)
			print result
			conn.send(result)
		except:
			pass
		conn.close()

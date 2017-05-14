#-*- coding:utf-8 -*-

import RPi.GPIO as GPIO
import socket
import sys
import json, time

def run(msg):
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        sock.connect(('203.246.112.77', 7777))

        p1, p2 = 19, 26
        GPIO.setmode(GPIO.BCM)
        GPIO.setup(p1, GPIO.OUT)
        GPIO.setup(p2, GPIO.OUT)

        try:
                sock.send(msg)

                receive = 0
                expected = len(msg)

                while receive < expected:
                        data = sock.recv(1024)
                        receive += len(data)
                        #print data
                js = json.loads(data)

        #print (js["device_house_light"])
        #print (js["device_house_light"]["거실"])

                if js["device_house_light"][u"거실"][u"등1"]:
                # p1 on
                        GPIO.output(p1, True)
                else:
                # p1 off
                        GPIO.output(p1, False)
                if js["device_house_light"][u"안방"][u"등1"]:
                # p2 on
                        GPIO.output(p2, True)
                else:
                # p2 off
                        GPIO.output(p2, False)

        finally:
                time.sleep(1)
                sock.close()
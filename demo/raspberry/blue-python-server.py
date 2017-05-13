import RPi.GPIO as GPIO
import bluetooth
import test
import socket

server_sock=bluetooth.BluetoothSocket( bluetooth.RFCOMM )

port = bluetooth.PORT_ANY
server_sock.bind(("",port))
server_sock.listen(1)
print "listening on port %d" % port

uuid = "00001101-0000-1000-8000-00805f9b34fb"
bluetooth.advertise_service( server_sock, "FooBar Service", uuid )

client_sock,address = server_sock.accept()
print "Accepted connection from ",address

while 1:
        try:
                data = client_sock.recv(1024)
                print "received [%s]" % data
                test.run(data)
                client_sock.send('echo) ' + data)
        except:
                GPIO.cleanup()
                client_sock.close()
                server_sock.close()
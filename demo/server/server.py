import socket
import sys
import iot2

sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
sock.bind(('', 7777))
sock.listen(1)

while True:
        print 'wait connection...'
        conn, client = sock.accept()
        data  = ''
        try:
                print 'conn from', client

                data = conn.recv(1024)
                print data
        finally:
                try:
                        result = iot2.run(data)
                        print result
                        conn.send(result)
                except:
                        pass
                conn.close()
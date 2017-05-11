Android
=======
Client Application transmit user's command to server and receive server's json file.
Informs the user that the command has been executed.

Speech To Text
--------------
Using the Recognitionservice & Speechrecognizer
Recognitionservice will recognize Start Word(=Dobby). Then Speechrecognizer will convert user's command to text and transmit that text(=string) to server.

Text To Speech
--------------
When server has been executed user's command, server will transmit json output to client. Then cilent informs to user whether executed is success or not.


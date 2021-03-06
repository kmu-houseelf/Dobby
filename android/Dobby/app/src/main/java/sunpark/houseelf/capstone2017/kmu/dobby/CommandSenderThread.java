
/**
 * Created by Sunpark on 2017-05-11.
 * Kookmin Univ. CS Capstone Design Project Dobby
 */

package sunpark.houseelf.capstone2017.kmu.dobby;

import android.os.Handler;
import android.os.Message;
import android.util.Log;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.Socket;

public class CommandSenderThread extends Thread implements Runnable {
    private String IP = "203.246.112.77";
    private int SERVER_PORT = 1759; //1759
    private int UNITY_PORT = 6666;
    private Socket socket = null;

    private String command;
    private String JSONString;
    private String resultString = "";


    BufferedWriter out;
    BufferedReader in;

    public CommandSenderThread(String cmd, String jsonString) {
        command = cmd;
        JSONString = jsonString;
    }

    public void run(){
        super.run();

        try {
            openSocket(SERVER_PORT);
        } catch (Exception e) {
            e.printStackTrace();
            Log.e("openSocket err", "openSocket err");
        }
        try {
            sendAndReceive(command, JSONString);
        } catch (IOException e) {
            e.printStackTrace();
            Log.e("sendCommand err", "sendCommand err");
        }
        try {
            closeSocket();
        } catch (IOException e) {
            e.printStackTrace();
            Log.e("closeSocket err", "closeSocket err");
        }

        Log.d("resultString", resultString);

        try {
            openSocket(UNITY_PORT);
        } catch (Exception e) {
            e.printStackTrace();
        }

        try {
            sendToUnity(resultString);
        } catch (IOException e) {
            e.printStackTrace();
        }

        try {
            closeSocket();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void openSocket(int port) throws Exception {
        socket = new Socket(IP, port);
        Log.d("openSocket", "openSocket");
    }

    private void sendAndReceive(String cmd, String json) throws IOException {
        out = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream()));
        in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
        out.write(cmd+"/"+json);
        out.flush();

        String tmpString;
        while((tmpString = in.readLine()) != null){
         resultString += tmpString + "\n";
        }
        Log.d("sendCommand", cmd);
    }

    private void sendToUnity(String cmd) throws IOException {
        out = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream()));
        out.write(cmd);
        out.flush();

        Log.d("sendUnity", cmd);
    }

    private void closeSocket() throws IOException {
        out.close();
        in.close();
        socket.close();
        Log.d("closeSocket", "closeSocket");
    }

    public String getResultString(){
        return resultString;
    }
}

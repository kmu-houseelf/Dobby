
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
    private int PORT = 1759; //1759
    private Socket socket = null;

    private String command;
    private String resultString = "";
    Handler mHandler;

    BufferedWriter out;
    BufferedReader in;

    public CommandSenderThread(String str, Handler handler) {
        command = str;
        mHandler = handler;
    }

    public void run(){
        super.run();

        try {
            openSocket();
        } catch (Exception e) {
            e.printStackTrace();
            Log.e("openSocket err", "openSocket err");
        }
        try {
            sendAndReceive(command);
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

        Message msg = new Message();
        msg.what = 0;
        msg.obj = resultString;
        mHandler.sendMessage(msg);
    }

    private void openSocket() throws Exception {
        socket = new Socket(IP, PORT);
        Log.d("openSocket", "openSocket");
    }

    private void sendAndReceive(String cmd) throws IOException {
        out = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream()));
        in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
        out.write(cmd);
        out.flush();

        String tmpString;
        in.readLine();
        while((tmpString = in.readLine()) != null){
         resultString += tmpString;
         Log.d("readLine", tmpString);
        }
        Log.d("sendCommand", "sendCommand");
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

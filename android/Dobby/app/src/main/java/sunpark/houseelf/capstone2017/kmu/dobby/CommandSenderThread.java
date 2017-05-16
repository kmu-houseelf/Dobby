
/**
 * Created by Sunpark on 2017-05-11.
 * Kookmin Univ. CS Capstone Design Project Dobby
 */

package sunpark.houseelf.capstone2017.kmu.dobby;

import android.util.Log;

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.net.Socket;

public class CommandSenderThread extends Thread implements Runnable {
    private String IP = "203.246.112.77";
    private int PORT = 7777;
    private Socket socket = null;

    private String command;

    public CommandSenderThread(String str) {
        command = str;
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
            sendCommand(command);
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
    }

    private void openSocket() throws Exception {
        socket = new Socket(IP, PORT);
        Log.d("openSocket", "openSocket");
    }

    private void sendCommand(String cmd) throws IOException {
        BufferedWriter out = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream()));
        out.write(cmd);
        out.flush();
        Log.d("sendCommand", "sendCommand");
    }

    private void closeSocket() throws IOException {
        socket.close();
        Log.d("closeSocket", "closeSocket");
    }

}

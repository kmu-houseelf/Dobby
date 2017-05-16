package sunpark.houseelf.capstone2017.kmu.dobby;

import android.util.Log;

import org.json.JSONObject;

import java.net.ServerSocket;
import java.net.Socket;

/**
 * Created by Sunpark on 2017-05-15.
 */

public class JSONReceiverThread extends Thread implements Runnable{
    private String IP = "";
    private int PORT = 8888;
    private ServerSocket socket = null;

    private String receivedMessage = null;
    private JSONObject receivedJSON = null;

    public JSONReceiverThread() {

    }

    public void run() {
        super.run();
        try {
            openServerSocket();
        } catch (Exception e) {
            e.printStackTrace();
            Log.e("openServerSocket err", "openServerSocket err");
        }


    }

    private void openServerSocket() throws Exception {
        socket = new ServerSocket(PORT);
        Log.d("openServerSocket", "openServerSocket");
    }
}

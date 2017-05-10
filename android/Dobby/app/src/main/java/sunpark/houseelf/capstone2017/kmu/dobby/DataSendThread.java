//package sunpark.houseelf.capstone2017.kmu.dobby;
//
//import android.util.Log;
//
//import org.json.JSONException;
//import org.json.JSONObject;
//
//import java.io.IOException;
//
//import okhttp3.MediaType;
//import okhttp3.OkHttpClient;
//import okhttp3.Request;
//import okhttp3.RequestBody;
//import okhttp3.Response;
//
///**
// * Created by Sunpark on 2017-04-05.
// */
//
//public class DataSendThread extends Thread {
//    private String IP = "203.246.112.77:7777/data";
//    private int PORT = 7777;
//    private static final MediaType JSON = MediaType.parse("application/json; charset=utf-8");
//    private OkHttpClient client = new OkHttpClient();
//    private String jsonData;
//
//    public DataSendThread(String jsonData) {
//        this.jsonData = jsonData;
//    }
//
//    String post(String url, String json) throws IOException {
//        RequestBody body = RequestBody.create(JSON, json);
//        Request request = new Request.Builder()
//                .url(url)
//                .post(body)
//                .build();
//        Response response = client.newCall(request).execute();
//        return response.body().string();
//    }
//
//    @Override
//    public void run() {
//        super.run();
//        try {
//            post(IP, jsonData);
//        } catch (IOException e1) {
//            e1.printStackTrace();
//        }
//    }
//}

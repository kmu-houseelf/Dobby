package sunpark.houseelf.capstone2017.kmu.dobby;

import android.os.AsyncTask;
import android.util.Log;
import android.view.View;
import android.widget.ProgressBar;

import com.google.api.client.util.DateTime;
import com.google.api.services.calendar.model.Event;
import com.google.api.services.calendar.model.EventDateTime;
import com.google.api.services.calendar.model.Events;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.net.Socket;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by User on 2017-05-22.
 */

public class ScheduleManager extends AsyncTask<Void, Void, Boolean> {
    //    private CommandSenderToUnityThread sendThread;
    final GoogleLogIn activity;
    final com.google.api.services.calendar.Calendar mService;
    private ProgressBar mProgress;
    //    private Exception mLastError = null;
//    private TextView mOutputText;
    String stringForJSON;
    JSONObject scheduleObject;

    private String action;
    private String resultDateString = "";
    private String resultContentString = "";


    private Events events;
    private List<Event> items;
    private DateTime now = new DateTime(System.currentTimeMillis());


    ScheduleManager(GoogleLogIn activity) throws JSONException, IOException{
        this.activity = activity;
        stringForJSON = activity.stringForJSON;
        JSONObject resultJSON = new JSONObject(stringForJSON);
        JSONObject secretaryObject = resultJSON.getJSONObject("Secretary");
        scheduleObject = secretaryObject.getJSONObject("Schedule");
        action =  scheduleObject.getString("Action");

        mService = activity.mService;
        mProgress = (ProgressBar) activity.findViewById(R.id.progressBar2);
    }

    public void insertSchedule(ScheduleStructure scheduleStructure) throws IOException{
        Event event = new Event()
                .setSummary(scheduleStructure.getContent());
        DateTime startDateTime = new DateTime(scheduleStructure.getStartDateTime());

        EventDateTime start = new EventDateTime()
                .setDateTime(startDateTime);
        event.setStart(start);

        DateTime endDateTime = new DateTime(scheduleStructure.getEndDateTime());
        EventDateTime end = new EventDateTime()
                .setDateTime(endDateTime);
        event.setEnd(end);
        try {
            //event = GoogleLogIn.mService.events().insert("primary", event).execute();
            mService.events().insert("primary", event).execute();
            Log.d("insert", "complete");
        } catch (IOException e) {
            e.printStackTrace();
        }

        refreshEvents();

    }

    private void deleteSchedule(ScheduleStructure scheduleStructure) throws IOException{
        List<String> deleteEventIdList = new ArrayList<String>();
        String searchContent = scheduleStructure.getContent();

        Events events = mService.events().list("primary")
                .setTimeMin(now)    // 지금시간부터
                .setOrderBy("startTime")
                .setSingleEvents(true)
                .execute();
        List<Event> items = events.getItems();
//        Log.d("eventjson", events.toPrettyString());
        Log.d("eventjson", items.toString());

        for (Event event : items) {
            if(searchContent.equals(event.getSummary())){   // 현재 콘텐츠 명으로만 삭제 가능
                deleteEventIdList.add(event.getId());
                mService.events().delete("primary", event.getId()).execute();
                Log.d("delete", "complete");
            }
            else {
                Log.d("에러", "삭제할 일정이 아닙니다");
            }
        }
        refreshEvents();
    }

    private void refreshEvents() throws IOException{
        events = mService.events().list("primary")
                .setTimeMin(now)    // 지금시간부터
                .setOrderBy("startTime")
                .setSingleEvents(true)
                .execute();
        items = events.getItems();

        for (Event event : items) {
            if(resultDateString.equals(""))
                resultDateString += event.getStart().toString().split("T")[0];
            else
                resultDateString += "/" + event.getStart().toString().split("T")[0];
            if(resultContentString.equals(""))
                resultContentString += event.getSummary();
            else
                resultContentString += "/" + event.getSummary();
        }

        try {
            CommandSenderToUnityThread sendThread = new CommandSenderToUnityThread( resultDateString + "\n" + resultContentString);
            sendThread.start();
            sendThread.join();
            Log.e("sendunity", "complete");
        } catch (Exception e){
            e.printStackTrace();
            Log.e("errerrerr", "errerrerr");
        }
    }

    @Override
    protected void onPreExecute() {
        Log.d("preexe", "edit schedule start");
        super.onPreExecute();
        //activity.numAsyncTasks++;
        mProgress.setVisibility(View.VISIBLE);
    }

    @Override
    protected final Boolean doInBackground(Void... ignored) {
        Log.d("doInBack", "schedulemanager");
//        try {
        //doInBackground();
        Log.d("action=", action);
        try {
            if (action.equals("0")){
                insertSchedule(new ScheduleStructure(scheduleObject));
            }
            else if (action.equals("1")){
                deleteSchedule(new ScheduleStructure(scheduleObject));
            }
        } catch(JSONException e) {
            e.printStackTrace();
            Log.e("schedule parse err", stringForJSON);
        } catch(IOException e) {
            e.printStackTrace();
        }

        return true;
    }

    @Override
    protected final void onPostExecute(Boolean success) {
        super.onPostExecute(success);
        mProgress.setVisibility(View.INVISIBLE);
        if (success) {
            Log.d("postexe", "edit schedule complete");
        }
    }

    class CommandSenderToUnityThread extends Thread implements Runnable {
        private String IP = "203.246.112.77";
        private int UNITY_PORT = 6666;
        private Socket socket = null;
        private String sendString;
        BufferedWriter out;

        CommandSenderToUnityThread(String resultString) {
            sendString = resultString;
        }

        public void run() {
            super.run();
            try {
                openSocket(UNITY_PORT);
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                sendToUnity(sendString);
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
        private void closeSocket() throws IOException {
            out.close();
            socket.close();
            Log.d("closeSocket", "closeSocket");
        }
        private void sendToUnity(String cmd) throws IOException {
            out = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream()));
            out.write(cmd);
            out.flush();

            Log.d("sendUnity", cmd);
        }
    }
}

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
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by User on 2017-05-22.
 */

public class ScheduleManager extends AsyncTask<Void, Void, Boolean> {
    final GoogleLogIn activity;
    final com.google.api.services.calendar.Calendar mService;
    private ProgressBar mProgress;

    private String stringForJSON;
    private JSONObject resultJSON;
    private JSONObject scheduleObject;

    private Boolean action;
    private String resultDateString = "";
    private String resultContentString = "";

    private Events events;
    private List<Event> items;
    private DateTime now = new DateTime(System.currentTimeMillis());


    ScheduleManager(GoogleLogIn activity) throws JSONException, IOException{
        this.activity = activity;
        stringForJSON = activity.stringForJSON;
        resultJSON = new JSONObject(stringForJSON);
        JSONObject secretaryObject = resultJSON.getJSONObject("Secretary");
        scheduleObject = secretaryObject.getJSONObject("Schedule");
        action =  scheduleObject.getBoolean("Action");

        mService = activity.mService;
        mProgress = (ProgressBar) activity.findViewById(R.id.progressBar2);
    }

    public void insertSchedule(ScheduleStructure scheduleStructure) throws JSONException, IOException{
        Event event = new Event()
                .setSummary(scheduleStructure.getContent());
        DateTime startDateTime = new DateTime(scheduleStructure.getStartDateTime());
        DateTime endDateTime = new DateTime(scheduleStructure.getEndDateTime());

        EventDateTime start = new EventDateTime()
                .setDateTime(startDateTime);
        event.setStart(start);

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

    private void deleteSchedule(ScheduleStructure scheduleStructure) throws JSONException, IOException {
        List<String> deleteEventIdList = new ArrayList<String>();
        String searchContent = scheduleStructure.getContent();
        if (scheduleStructure.getStartDate().equals("Null")) {
            Events events = mService.events().list("primary")
                    .setTimeMin(now)
                    .setOrderBy("startTime")
                    .setSingleEvents(true)
                    .execute();
            List<Event> items = events.getItems();
            for (Event event : items) {
                if (searchContent.equals(event.getSummary())) {
                    deleteEventIdList.add(event.getId());
                    mService.events().delete("primary", event.getId()).execute();
                    Log.d("delete", event.getSummary());
                }
            }
        } else {
            DateTime searchStartDateTime = new DateTime(scheduleStructure.getDayStartTime());
            Log.d("startDT", searchStartDateTime.toString());
            DateTime searchEndDateTime = new DateTime(scheduleStructure.getDayEndTime());
            Log.d("endDT", searchEndDateTime.toString());
            Events events = mService.events().list("primary")
                    .setTimeMin(searchStartDateTime)
                    .setTimeMax(searchEndDateTime)
                    .setOrderBy("startTime")
                    .setSingleEvents(true)
                    .execute();
            List<Event> items = events.getItems();
            if (scheduleStructure.getContent().equals("Null")) {
                for (Event event : items) {
                    deleteEventIdList.add(event.getId());
                      mService.events().delete("primary", event.getId()).execute();
                    Log.d("delete", event.getSummary());
                }
            } else {
                for (Event event : items) {
                    if (searchContent.equals(event.getSummary())) {
                        deleteEventIdList.add(event.getId());
                       mService.events().delete("primary", event.getId()).execute();
                        Log.d("delete", event.getSummary());
                    }
                }
            }
        }
        refreshEvents();
    }

    private void refreshEvents() throws JSONException, IOException{
        events = mService.events().list("primary")
                .setTimeMin(now)    // 지금시간부터
                .setOrderBy("startTime")
                .setSingleEvents(true)
                .execute();
        items = events.getItems();

        resultJSON.put("Tasktype", "1");
        resultJSON.put("Pattern", "Null");
        JSONObject HomeIotObject = resultJSON.getJSONObject("Homeiot");
        HomeIotObject.put("Homeiottype", "3");
        JSONObject scheduleObject = HomeIotObject.getJSONObject("Schedule");


        for (Event event : items) {
            if(resultDateString.equals("")) {
                resultDateString += event.getStart().getDateTime().toString().split("T")[0];
            }
            else {
                resultDateString += "_" + event.getStart().getDateTime().toString().split("T")[0];
            }
            if(resultContentString.equals(""))
                resultContentString += event.getSummary();
            else
                resultContentString += "_" + event.getSummary();
        }

        scheduleObject.put("Date", resultDateString);
        scheduleObject.put("Content", resultContentString);
        Log.d("schedulejsonobj", scheduleObject.getString("Date"));
        Log.d("schedulejsonobj", scheduleObject.getString("Content"));
        Log.d("schedulejsonobj", resultJSON.toString());

        //String stringForJSON = resultJSON.t;

        try {
            CommandSenderToUnityThread sendThread = new CommandSenderToUnityThread(resultJSON.toString() + "\n");
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
        mProgress.setVisibility(View.VISIBLE);
    }

    @Override
    protected final Boolean doInBackground(Void... ignored) {
        Log.d("doInBack", "schedulemanager");
//        try {
        //doInBackground();
        Log.d("action=", action.toString());
        try {
            if (!action){
                insertSchedule(new ScheduleStructure(scheduleObject));
            }
            else if (action){
                deleteSchedule(new ScheduleStructure(scheduleObject));
            }
        } catch(JSONException e) {
            e.printStackTrace();
            Log.e("schedule parse err", stringForJSON);
        } catch(IOException e) {
            e.printStackTrace();
        } catch (ParseException e) {
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

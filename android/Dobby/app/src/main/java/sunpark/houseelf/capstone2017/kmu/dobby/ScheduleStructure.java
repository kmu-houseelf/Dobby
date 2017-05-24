package sunpark.houseelf.capstone2017.kmu.dobby;

import android.util.Log;

import com.google.api.client.util.DateTime;

import org.json.JSONException;
import org.json.JSONObject;

public class ScheduleStructure {
    private String action;     // 0:insert,  1:delete,  2:search
    private String startDate;
    private String startTime;
    private String endDate;
    private String endTime;
    private String content;
    DateTime now = new DateTime(System.currentTimeMillis());

    ScheduleStructure(){
        action = "0";
        startDate = "2017-05-29";
        startTime = "09:00:00.000";
        endDate = "2017-05-29";
        endTime = "17:00:00.000";
        content = "저녁";
    }

    ScheduleStructure(JSONObject scheduleObject) throws JSONException{
//        JSONObject resultJSON = new JSONObject(stringForJSON);
//        JSONObject secretaryObject = resultJSON.getJSONObject("Secretary");
//        JSONObject scheduleObject = secretaryObject.getJSONObject("Schedule");

        DateTime now = new DateTime(System.currentTimeMillis());
        String currentDateTime = now.toString();

        String[] currentDateTimeToken = currentDateTime.split("T");
        String currentDate =  currentDateTimeToken[0];
        Log.d("currentdate", currentDate);
        String[] currentTimeToken = currentDateTimeToken[1].split("\\.");
        String currentTime =  currentTimeToken[0];
        Log.d("currenttime", currentTime);

        action = scheduleObject.getString("Action");
        startDate = scheduleObject.getString("Startdate");
        if(startDate.equals("Null")){
            startDate = currentDate;
        }
        startTime = scheduleObject.getString("Starttime");
        if(startTime.equals("Null")){
            startTime = currentTime + ".000";
        }
        else {
            startTime += ".000";
        }
        endDate = scheduleObject.getString("Enddate");
        if(endDate.equals("Null")){
            endDate = startDate;
        }
        endTime = scheduleObject.getString("Endtime");
        if(endTime.equals("Null")){
            endTime = startTime;
        }
        else {
            endTime += ".000";
        }
        content = scheduleObject.getString("Content");
        if(content.equals("Null")){
            content = "제목없음";
        }
    }
    protected String getAction(){ return action; }
    protected String getStartTime(){ return startTime; }
    protected String getStartDate(){ return startDate; }
    protected String getEndTime(){ return endTime; }
    protected String getEndDate(){ return endDate; }
    protected String getContent(){ return content; }
    protected String getStartDateTime(){ return startDate + "T" + startTime + "+09:00"; }
    protected String getEndDateTime(){ return endDate + "T" + endTime + "+09:00"; }

}

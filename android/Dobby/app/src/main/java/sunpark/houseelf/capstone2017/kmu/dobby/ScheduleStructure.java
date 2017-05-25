package sunpark.houseelf.capstone2017.kmu.dobby;

import android.util.Log;

import com.google.api.client.util.DateTime;

import org.json.JSONException;
import org.json.JSONObject;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ScheduleStructure {
    private Boolean action;     // 0:insert,  1:delete,  2:search
    private Boolean ampm;
    private String startDate;
    private String startTime;
    private String endDate;
    private String endTime;
    private String content;
    DateTime now = new DateTime(System.currentTimeMillis());

    ScheduleStructure(){
        action = true;
        ampm = true;
        startDate = "2017-05-29";
        startTime = "09:00:00.000";
        endDate = "2017-05-29";
        endTime = "17:00:00.000";
        content = "저녁";
    }

    ScheduleStructure(JSONObject scheduleObject) throws JSONException, ParseException{
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

        action = scheduleObject.getBoolean("Action");
        ampm = scheduleObject.getBoolean("Ampm");

        startDate = scheduleObject.getString("Startdate");
        if (startDate.equals("Null"))
                startDate = currentDate;
        Date tempDate = new SimpleDateFormat("yyyy-MM-dd").parse(startDate);
        startDate = new SimpleDateFormat("yyyy-MM-dd").format(tempDate);


        startTime = scheduleObject.getString("Starttime");
        String tempTime = "";
        if (! startTime.equals("Null")) {
            String[] timeSplitList = startTime.split(":");
            for (int i = 0 ; i < 2 ; i++) {
                String temp = timeSplitList[i];
                if (Integer.parseInt(temp) < 10) {
                    if (i == 0 && !ampm) //오후
                        tempTime += String.valueOf(Integer.parseInt(temp) + 12);
                    else
                        tempTime += "0" + temp;
                }
                else {
                    tempTime += temp;
                }
                tempTime += ":";
            }
            tempTime += "00";
            //Log.d("eeeeeee", temp);
            startTime = tempTime;
        }

        Log.d("startTime", startTime);

        endDate = scheduleObject.getString("Enddate");
        endTime = scheduleObject.getString("Endtime");

        content = scheduleObject.getString("Content");
        if (!action) {
            if (startDate.equals("Null"))
                startDate = currentDate;
            if (startTime.equals("Null"))
                startTime = currentTime + ".000";
            else
                startTime += ".000";
            if (endDate.equals("Null") || content.equals(""))
                endDate = startDate;
            if (endTime.equals("Null") || content.equals(""))
                endTime = startTime;
            else
                endTime += ".000";
            if (content.equals("Null") || content.equals(""))
                content = "제목 없음";
        }
//        else if (action.equals("1")) {
//
//        }
    }
    protected Boolean getAction(){ return action; }
    protected String getStartTime(){ return startTime; }
    protected String getStartDate(){ return startDate; }
    protected String getEndTime(){ return endTime; }
    protected String getEndDate(){ return endDate; }
    protected String getContent(){ return content; }
    protected String getStartDateTime(){ return startDate + "T" + startTime + "+09:00"; }
    protected String getEndDateTime(){ return endDate + "T" + endTime + "+09:00"; }
    protected String getDayStartTime(){ return getStartDate() + "T00:00:00.000+09:00"; }
    protected String getDayEndTime(){ return getStartDate() + "T24:00:00.000+09:00"; }

}

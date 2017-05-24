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
    /*
        SecretaryStructure(){
            action = 2;
            startDate = "2017-06-30";
            startTime = "09:00:00";
            endDate = "2017-07-04";
            endTime = "17:00:00";
            content = "제목없음";
        }
*/
    ScheduleStructure(){
        action = "0";
        startDate = "2017-05-29";
        startTime = "09:00:00.000";
        endDate = "2017-05-29";
        endTime = "17:00:00.000";
        content = "저녁";
    }

    ScheduleStructure(String stringForJSON) throws JSONException{
        JSONObject resultJSON = new JSONObject(stringForJSON);
        JSONObject secretaryObject = resultJSON.getJSONObject("Secretary");
        JSONObject scheduleObject = secretaryObject.getJSONObject("Schedule");

        this.action = scheduleObject.getString("Action");
        this.startDate = scheduleObject.getString("Startdate");
        this.startTime = scheduleObject.getString("Starttime");
        this.endDate = scheduleObject.getString("Enddate");
        this.endTime = scheduleObject.getString("Endtime");
        this.content = scheduleObject.getString("Content");
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

package sunpark.houseelf.capstone2017.kmu.dobby;

import android.os.AsyncTask;
import android.util.Log;
import android.view.View;
import android.widget.ProgressBar;
import android.widget.TextView;

import com.google.api.client.extensions.android.http.AndroidHttp;
import com.google.api.client.googleapis.extensions.android.gms.auth.GoogleAccountCredential;
import com.google.api.client.googleapis.extensions.android.gms.auth.GooglePlayServicesAvailabilityIOException;
import com.google.api.client.googleapis.extensions.android.gms.auth.UserRecoverableAuthIOException;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.client.util.DateTime;
import com.google.api.services.calendar.model.Event;
import com.google.api.services.calendar.model.EventDateTime;

import org.json.JSONException;

import java.io.IOException;

/**
 * Created by User on 2017-05-22.
 */

public class insertSchedule extends AsyncTask<Void, Void, Boolean> {
    //private com.google.api.services.calendar.Calendar mService = null;
    private Exception mLastError = null;

    final GoogleLogIn activity;
    //final CalendarModel model;
    final com.google.api.services.calendar.Calendar mService;
    private ProgressBar mProgress;
    private TextView mOutputText;
    String stringForJSON;

    insertSchedule(GoogleLogIn activity) {
//        HttpTransport transport = AndroidHttp.newCompatibleTransport();
//        JsonFactory jsonFactory = JacksonFactory.getDefaultInstance();
//        mService = new com.google.api.services.calendar.Calendar.Builder(
//                transport, jsonFactory, credential)
//                .setApplicationName("Google Calendar API Android Quickstart")
//                .build();

        Log.d("sasdasdasfgegegsgg", "234235235");

        this.activity = activity;
        stringForJSON = activity.stringForJSON;
        mService = activity.mService;
        mProgress = (ProgressBar) activity.findViewById(R.id.progressBar2);
        mOutputText = (TextView) activity.findViewById(R.id.textView);
    }

    public void insertScheduleToCalendar(ScheduleStructure scheduleStructure){
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
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void onPreExecute() {
        Log.d("preexe", "insetschedule");
        super.onPreExecute();
        //activity.numAsyncTasks++;
        mProgress.setVisibility(View.VISIBLE);
    }

    @Override
    protected final Boolean doInBackground(Void... ignored) {
        Log.d("doInBack", "insetschedule");
//        try {
//            //doInBackground();
//        try {
//            insertScheduleToCalendar(new ScheduleStructure(stringForJSON));
//        } catch(JSONException e) {
//            e.printStackTrace();
//            Log.e("schedule parse err", stringForJSON);
//        }
        return true;
//        }
//        } catch (final GooglePlayServicesAvailabilityIOException availabilityException) {
//            activity.showGooglePlayServicesAvailabilityErrorDialog(
//                    availabilityException.getConnectionStatusCode());
//        } catch (UserRecoverableAuthIOException userRecoverableException) {
//            activity.startActivityForResult(
//                    userRecoverableException.getIntent(), GoogleLogIn.REQUEST_AUTHORIZATION);
//        } catch (IOException e) {
//            //Utils.logAndShow(activity, CalendarSampleActivity.TAG, e);
//            e.printStackTrace();
//        }
//        return false;
    }

    @Override
    protected final void onPostExecute(Boolean success) {
        super.onPostExecute(success);
//        if (0 == --activity.numAsyncTasks) {
//            progressBar.setVisibility(View.GONE);
//        }
        mProgress.setVisibility(View.INVISIBLE);
        if (success) {
            Log.d("postexe", "insetschedule");
            //activity.refreshView();
        }

    }

}

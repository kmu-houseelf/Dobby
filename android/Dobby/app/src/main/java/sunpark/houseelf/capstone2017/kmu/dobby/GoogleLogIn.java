package sunpark.houseelf.capstone2017.kmu.dobby;

import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GoogleApiAvailability;
import com.google.api.client.extensions.android.http.AndroidHttp;
import com.google.api.client.googleapis.extensions.android.gms.auth.GoogleAccountCredential;
import com.google.api.client.googleapis.extensions.android.gms.auth.GooglePlayServicesAvailabilityIOException;
import com.google.api.client.googleapis.extensions.android.gms.auth.UserRecoverableAuthIOException;

import com.google.api.client.http.HttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.gson.GsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.client.util.ExponentialBackOff;

import com.google.api.services.calendar.CalendarScopes;
import com.google.api.client.util.DateTime;

import com.google.api.services.calendar.model.*;

import android.Manifest;
import android.accounts.AccountManager;
import android.app.Activity;
import android.app.Dialog;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.v7.app.AppCompatActivity;
import android.text.TextUtils;
import android.text.method.ScrollingMovementMethod;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;

import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import pub.devrel.easypermissions.AfterPermissionGranted;
import pub.devrel.easypermissions.EasyPermissions;

public class GoogleLogIn extends AppCompatActivity implements EasyPermissions.PermissionCallbacks {

    private static final Level LOGGING_LEVEL = Level.OFF;

    GoogleAccountCredential mCredential;
    private TextView mOutputText;
    private Button mCallApiButton;
    ProgressBar mProgress;

    com.google.api.services.calendar.Calendar mService;
    final HttpTransport transport = AndroidHttp.newCompatibleTransport();
    final JsonFactory jsonFactory = GsonFactory.getDefaultInstance();
    int numAsyncTasks;

    static final int REQUEST_ACCOUNT_PICKER = 1000;
    static final int REQUEST_AUTHORIZATION = 1001;
    static final int REQUEST_GOOGLE_PLAY_SERVICES = 1002;
    static final int REQUEST_PERMISSION_GET_ACCOUNTS = 1003;
    //private final static int ADD_OR_EDIT_CALENDAR_REQUEST = 1004;

    private static final String BUTTON_TEXT = "Call Google Calendar API";
    private static final String PREF_ACCOUNT_NAME = "accountName";
    private static final String[] SCOPES = { CalendarScopes.CALENDAR };

    String stringForJSON;
    /**
     * Create the main activity.
     * @param savedInstanceState previously saved instance data.
     */
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

//        LinearLayout activityLayout = new LinearLayout(this);
//        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
//                LinearLayout.LayoutParams.MATCH_PARENT,
//                LinearLayout.LayoutParams.MATCH_PARENT);
//        activityLayout.setLayoutParams(lp);
//        activityLayout.setOrientation(LinearLayout.VERTICAL);
//        activityLayout.setPadding(16, 16, 16, 16);
//
//        ViewGroup.LayoutParams tlp = new ViewGroup.LayoutParams(
//                ViewGroup.LayoutParams.WRAP_CONTENT,
//                ViewGroup.LayoutParams.WRAP_CONTENT);
        setContentView(R.layout.activity_schedule);

        Intent thisIntent = getIntent();
        stringForJSON = thisIntent.getExtras().getString("resultJSON");
        Log.d("googleloginjson", stringForJSON);
        stringForJSON = "{\n" +
                "\t\"Tasktype\" : \"Null\",\n" +
                "\n" +
                "\t\"Pattern\" : \"Null\",\n" +
                "\n" +
                "\t\"Tts\" : \"Null\",\n" +
                "\t\n" +
                "\t\"Homeiot\" : \n" +
                "\t{\n" +
                "\t\t\"Homeiottype\" : \"Null\",\n" +
                "\n" +
                "\t\t\"Light\":\n" +
                "\t\t{\n" +
                "\t\t\t\"Location\" : \"Null\",\n" +
                "\t\t\t\"Object\" : \"Null\",\n" +
                "\t\t\t\"Action\" : \"Null\",\n" +
                "\t\t\t\"Brightness\" : \"Null\"\n" +
                "\t\t},\n" +
                "\n" +
                "\t\t\"Tv\":\n" +
                "\t\t{\n" +
                "\t\t\t\"Component\" : \"Null\",\n" +
                "\t\t\t\"Option\" : \"Null\",\n" +
                "\t\t\t\"Object\" : \"Null\",\n" +
                "\t\t\t\"Power\" : \"Null\",\n" +
                "\t\t\t\"Channel\" : \"Null\",\n" +
                "\t\t\t\"Volume\" : \"Null\",\n" +
                "\t\t\t\"Mute\" : \"Null\",\n" +
                "\t\t\t\"Remoteloc\" : \"Null\"\n" +
                "\t\t},\n" +
                "\t\t\n" +
                "\t\t\"Schedule\" :\n" +
                "\t\t{\n" +
                "\t\t\t\"Month\": \"Null\",\n" +
                "\t\t\t\"Day\": \"Null\",\n" +
                "\t\t\t\"Action\" : \"Null\",\n" +
                "\t\t\t\"Content\" : \"Null\"\n" +
                "\t\t},\n" +
                "\n" +
                "\t\t\"Music\" :\n" +
                "\t\t{\n" +
                "\t\t\t\"Title\" : \"Null\",\n" +
                "\t\t\t\"Singer\" : \"Null\",\n" +
                "\t\t\t\"Gnr\" : \"Null\",\n" +
                "\t\t\t\"Action\" : \"Null\"\n" +
                "\t\t}\t\t\n" +
                "\t},\n" +
                "\n" +
                "\t\"Secretary\" :\n" +
                "\t{\n" +
                "\t\t\"Secretarytype\" : \"1\",\n" +
                "\n" +
                "\t\t\"Schedule\" :\n" +
                "\t\t{\n" +
                "\t\t\t\"Action\" : \"2017-05-29\",\n" +
                "\t\t\t\"Startdate\" : \"2017-05-29\",\n" +
                "\t\t\t\"Starttime\": \"11:00:00.000\",\n" +
                "\t\t\t\"Enddate\" : \"2017-05-29\",\n" +
                "\t\t\t\"Endtime\" : \"13:00:00.000\",\n" +
                "\t\t\t\"Content\" : \"휴가\"\n" +
                "\t\t},\n" +
                "\n" +
                "\t\t\"Music\" :\n" +
                "\t\t{\n" +
                "\t\t\t\"Title\" : \"Null\",\n" +
                "\t\t\t\"Singer\" : \"Null\",\n" +
                "\t\t\t\"Album\" : \"Null\",\n" +
                "\t\t\t\"Gnr\" : \"Null\",\n" +
                "\t\t\t\"Dtlgnr\" : \"Null\"\n" +
                "\t\t}\n" +
                "\t}\n" +
                "}";

        mOutputText = (TextView) findViewById(R.id.textView);
        mCallApiButton = (Button) findViewById(R.id.button_login);
        mProgress = (ProgressBar) findViewById(R.id.progressBar2);

//        mCallApiButton.setText(BUTTON_TEXT);
        mCallApiButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                mCallApiButton.setEnabled(false);
                mOutputText.setText("");
                getResultsFromApi();
                mCallApiButton.setEnabled(true);
            }
        });
        mProgress.setVisibility(View.INVISIBLE);

//
//        mOutputText = new TextView(this);
//        mOutputText.setLayoutParams(tlp);
//        mOutputText.setPadding(16, 16, 16, 16);
//        mOutputText.setVerticalScrollBarEnabled(true);
//        mOutputText.setMovementMethod(new ScrollingMovementMethod());
//        mOutputText.setText(
//                "Click the \'" + BUTTON_TEXT +"\' button to test the API.");
//        activityLayout.addView(mOutputText);
//
//        mProgress = new ProgressDialog(this);
//        mProgress.setMessage("Calling Google Calendar API ...");
//
//        setContentView(activityLayout);

//
//
//        mOutputText = (TextView) findViewById(R.id.textView);
//        //mOutputText.setText("Click the button to test the API.");
//
//        //mProgress = (ProgressBar) findViewById(R.id.progressBar2);
//        //mProgress.setMessage("Calling Google Calendar API ...");
//        mProgress = new ProgressDialog(this);
//        mProgress.setMessage("Calling Google Calendar API ...");

//        Logger.getLogger("com.google.api.client").setLevel(LOGGING_LEVEL);
//        setContentView(R.layout.activity_schedule);
//
//        // Google Accounts
//        mCredential =
//                GoogleAccountCredential.usingOAuth2(this, Collections.singleton(CalendarScopes.CALENDAR));
//        SharedPreferences settings = getPreferences(Context.MODE_PRIVATE);
//        mCredential.setSelectedAccountName(settings.getString(PREF_ACCOUNT_NAME, null));
//        // Calendar client
//        mService = new com.google.api.services.calendar.Calendar.Builder(
//                transport, jsonFactory, mCredential).setApplicationName("Google-CalendarAndroidSample/1.0")
//                .build();
        // Initialize credentials and service object.
        mCredential =
                GoogleAccountCredential.usingOAuth2(getApplicationContext(), Arrays.asList(SCOPES)).setBackOff(new ExponentialBackOff());

        mService = new com.google.api.services.calendar.Calendar.Builder(transport, jsonFactory, mCredential)
                    .setApplicationName("Google Calendar API Android Quickstart")
                    .build();
    }

    @Override
    protected void onResume() {
        super.onResume();
        Log.d("onResume", "GoogleLogIn");
//        if (checkGooglePlayServicesAvailable()) {
//            haveGooglePlayServices();
//        }
    }

    /**
     * Attempt to call the API, after verifying that all the preconditions are
     * satisfied. The preconditions are: Google Play Services installed, an
     * account was selected and the device currently has online access. If any
     * of the preconditions are not satisfied, the app will prompt the user as
     * appropriate.
     */

    private void getResultsFromApi() {
        if (! isGooglePlayServicesAvailable()) {
            acquireGooglePlayServices();
        } else if (mCredential.getSelectedAccountName() == null) {
            chooseAccount();
        } else if (! isDeviceOnline()) {
            mOutputText.setText("No network connection available.");
        } else {
            Log.d("getResultsFromApi", "Login success");
            new insertSchedule(this).execute();
            Intent sttIntent = new Intent(this, STTActivity.class);
            sttIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            sttIntent.putExtra("status", 1);
            startActivity(sttIntent);
        }
    }

    /**
     * Attempts to set the account used with the API credentials. If an account
     * name was previously saved it will use that one; otherwise an account
     * picker dialog will be shown to the user. Note that the setting the
     * account to use with the credentials object requires the app to have the
     * GET_ACCOUNTS permission, which is requested here if it is not already
     * present. The AfterPermissionGranted annotation indicates that this
     * function will be rerun automatically whenever the GET_ACCOUNTS permission
     * is granted.
     */
    @AfterPermissionGranted(REQUEST_PERMISSION_GET_ACCOUNTS)
    private void chooseAccount() {
        if (EasyPermissions.hasPermissions(
                this, Manifest.permission.GET_ACCOUNTS)) {
            String accountName = getPreferences(Context.MODE_PRIVATE)
                    .getString(PREF_ACCOUNT_NAME, null);
            if (accountName != null) {
                mCredential.setSelectedAccountName(accountName);
                getResultsFromApi();
            } else {
                // Start a dialog from which the user can choose an account
                startActivityForResult(
                        mCredential.newChooseAccountIntent(),
                        REQUEST_ACCOUNT_PICKER);
            }
        } else {
            // Request the GET_ACCOUNTS permission via a user dialog
            EasyPermissions.requestPermissions(
                    this,
                    "This app needs to access your Google account (via Contacts).",
                    REQUEST_PERMISSION_GET_ACCOUNTS,
                    Manifest.permission.GET_ACCOUNTS);
        }
    }

    /**
     * Called when an activity launched here (specifically, AccountPicker
     * and authorization) exits, giving you the requestCode you started it with,
     * the resultCode it returned, and any additional data from it.
     * @param requestCode code indicating which activity result is incoming.
     * @param resultCode code indicating the result of the incoming
     *     activity result.
     * @param data Intent (containing result data) returned by incoming
     *     activity result.
     */
    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        switch(requestCode) {
            case REQUEST_GOOGLE_PLAY_SERVICES:
                if (resultCode != RESULT_OK) {
                    mOutputText.setText(
                            "This app requires Google Play Services. Please install " +
                                    "Google Play Services on your device and relaunch this app.");
                } else {
                    getResultsFromApi();
                }
                break;
            case REQUEST_ACCOUNT_PICKER:
                if (resultCode == RESULT_OK && data != null &&
                        data.getExtras() != null) {
                    String accountName =
                            data.getStringExtra(AccountManager.KEY_ACCOUNT_NAME);
                    if (accountName != null) {
                        SharedPreferences settings =
                                getPreferences(Context.MODE_PRIVATE);
                        SharedPreferences.Editor editor = settings.edit();
                        editor.putString(PREF_ACCOUNT_NAME, accountName);
                        editor.apply();
                        mCredential.setSelectedAccountName(accountName);
                        getResultsFromApi();
                    }
                }
                break;
            case REQUEST_AUTHORIZATION:
                if (resultCode == RESULT_OK) {
                    getResultsFromApi();
                }
                break;
        }
    }

    /**
     * Respond to requests for permissions at runtime for API 23 and above.
     * @param requestCode The request code passed in
     *     requestPermissions(android.app.Activity, String, int, String[])
     * @param permissions The requested permissions. Never null.
     * @param grantResults The grant results for the corresponding permissions
     *     which is either PERMISSION_GRANTED or PERMISSION_DENIED. Never null.
     */
    @Override
    public void onRequestPermissionsResult(int requestCode,
                                           @NonNull String[] permissions,
                                           @NonNull int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        EasyPermissions.onRequestPermissionsResult(
                requestCode, permissions, grantResults, this);
    }

    /**
     * Callback for when a permission is granted using the EasyPermissions
     * library.
     * @param requestCode The request code associated with the requested
     *         permission
     * @param list The requested permission list. Never null.
     */
    @Override
    public void onPermissionsGranted(int requestCode, List<String> list) {
        // Do nothing.
    }

    /**
     * Callback for when a permission is denied using the EasyPermissions
     * library.
     * @param requestCode The request code associated with the requested
     *         permission
     * @param list The requested permission list. Never null.
     */
    @Override
    public void onPermissionsDenied(int requestCode, List<String> list) {
        // Do nothing.
    }

    /**
     * Checks whether the device currently has a network connection.
     * @return true if the device has a network connection, false otherwise.
     */
    private boolean isDeviceOnline() {
        ConnectivityManager connMgr =
                (ConnectivityManager) getSystemService(Context.CONNECTIVITY_SERVICE);
        NetworkInfo networkInfo = connMgr.getActiveNetworkInfo();
        return (networkInfo != null && networkInfo.isConnected());
    }

    /**
     * Check that Google Play services APK is installed and up to date.
     * @return true if Google Play Services is available and up to
     *     date on this device; false otherwise.
     */
    private boolean isGooglePlayServicesAvailable() {
        GoogleApiAvailability apiAvailability =
                GoogleApiAvailability.getInstance();
        final int connectionStatusCode =
                apiAvailability.isGooglePlayServicesAvailable(this);
        return connectionStatusCode == ConnectionResult.SUCCESS;
    }

    /**
     * Attempt to resolve a missing, out-of-date, invalid or disabled Google
     * Play Services installation via a user dialog, if possible.
     */
    private void acquireGooglePlayServices() {
        GoogleApiAvailability apiAvailability =
                GoogleApiAvailability.getInstance();
        final int connectionStatusCode =
                apiAvailability.isGooglePlayServicesAvailable(this);
        if (apiAvailability.isUserResolvableError(connectionStatusCode)) {
            showGooglePlayServicesAvailabilityErrorDialog(connectionStatusCode);
        }
    }

    /**
     * Display an error dialog showing that Google Play Services is missing
     * or out of date.
     * @param connectionStatusCode code describing the presence (or lack of)
     *     Google Play Services on this device.
     */
    void showGooglePlayServicesAvailabilityErrorDialog(final int connectionStatusCode) {
        GoogleApiAvailability apiAvailability = GoogleApiAvailability.getInstance();
        Dialog dialog = apiAvailability.getErrorDialog(
                this,
                connectionStatusCode,
                REQUEST_GOOGLE_PLAY_SERVICES);
        dialog.show();
    }

//    void refreshView() {
//        adapter = new ArrayAdapter<CalendarInfo>(
//                this, android.R.layout.simple_list_item_1, model.toSortedArray()) {
//
//            @Override
//            public View getView(int position, View convertView, ViewGroup parent) {
//                // by default it uses toString; override to use summary instead
//                TextView view = (TextView) super.getView(position, convertView, parent);
//                CalendarInfo calendarInfo = getItem(position);
//                view.setText(calendarInfo.summary);
//                return view;
//            }
//        };
//        listView.setAdapter(adapter);
//    }

    /**
     * An asynchronous task that handles the Google Calendar API call.
     * Placing the API calls in their own task ensures the UI stays responsive.
     */
//    private class MakeRequestTask extends AsyncTask<Void, Void, List<String>> {
//
//        private Exception mLastError = null;
//
//        MakeRequestTask(GoogleAccountCredential credential) {
//            HttpTransport transport = AndroidHttp.newCompatibleTransport();
//            JsonFactory jsonFactory = JacksonFactory.getDefaultInstance();
//            mService = new com.google.api.services.calendar.Calendar.Builder(
//                    transport, jsonFactory, credential)
//                    .setApplicationName("Google Calendar API Android Quickstart")
//                    .build();
//        }
//
//        /**
//         * Background task to call Google Calendar API.
//         * @param params no parameters needed for this task.
//         */
//        @Override
//        protected List<String> doInBackground(Void... params) {
//            Log.d("doInBack", "doInBack");
//            try {
//                return getDataFromApi();
//            } catch (Exception e) {
//                mLastError = e;
//                cancel(true);
//                return null;
//            }
//        }
//
//        /**
//         * Fetch a list of the next 10 events from the primary calendar.
//         * @return List of Strings describing returned events.
//         * @throws IOException
//         */
//        private List<String> getDataFromApi() throws IOException {
//            // List the next 10 events from the primary calendar.
//            DateTime now = new DateTime(System.currentTimeMillis());
//            List<String> eventStrings = new ArrayList<String>();
//            Events events = mService.events().list("primary")
//                    .setMaxResults(10)
//                    .setTimeMin(now)
//                    .setOrderBy("startTime")
//                    .setSingleEvents(true)
//                    .execute();
//            List<Event> items = events.getItems();
//
//            for (Event event : items) {
//                DateTime start = event.getStart().getDateTime();
//                if (start == null) {
//                    // All-day events don't have start times, so just use
//                    // the start date.
//                    start = event.getStart().getDate();
//                }
//                eventStrings.add(
//                        String.format("%s (%s)", event.getSummary(), start));
//            }
//            return eventStrings;
//        }
//
//
//        @Override
//        protected void onPreExecute() {
//            Log.d("Pre", "Pre");
//            mOutputText.setText("");
//            mProgress.show();
//        }
//
//        @Override
//        protected void onPostExecute(List<String> output) {
//            Log.d("Post", "Post");
//            mProgress.hide();
//            if (output == null || output.size() == 0) {
//                mOutputText.setText("No results returned.");
//            } else {
//                output.add(0, "Data retrieved using the Google Calendar API:");
//                mOutputText.setText(TextUtils.join("\n", output));
//            }
//            //Intent sttIntent = new Intent(GoogleLogIn.this, STTActivity.class);
//            Intent sttIntent = new Intent(GoogleLogIn.this, STTActivity.class);
//            sttIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_NO_HISTORY);
//            sttIntent.putExtra("status", 5);
//            //sttIntent.putExtra("credential", mCredential);
//            startActivity(sttIntent);
//        }
//
//        @Override
//        protected void onCancelled() {
//            mProgress.hide();
//            if (mLastError != null) {
//                if (mLastError instanceof GooglePlayServicesAvailabilityIOException) {
//                    showGooglePlayServicesAvailabilityErrorDialog(
//                            ((GooglePlayServicesAvailabilityIOException) mLastError)
//                                    .getConnectionStatusCode());
//                } else if (mLastError instanceof UserRecoverableAuthIOException) {
//                    startActivityForResult(
//                            ((UserRecoverableAuthIOException) mLastError).getIntent(),
//                            REQUEST_AUTHORIZATION);
//                } else {
//                    mOutputText.setText("The following error occurred:\n"
//                            + mLastError.getMessage());
//                }
//            } else {
//                mOutputText.setText("Request cancelled.");
//            }
//        }
//    }

}

//import android.Manifest;
//import android.accounts.AccountManager;
//import android.app.Dialog;
//import android.app.ProgressDialog;
//import android.content.Context;
//import android.content.Intent;
//import android.content.SharedPreferences;
//import android.net.ConnectivityManager;
//import android.net.NetworkInfo;
//import android.os.AsyncTask;
//import android.os.Bundle;
//import android.support.annotation.NonNull;
//import android.support.v7.app.AppCompatActivity;
//import android.text.TextUtils;
//import android.text.method.ScrollingMovementMethod;
//import android.view.View;
//import android.view.ViewGroup;
//import android.widget.Button;
//import android.widget.LinearLayout;
//import android.widget.ProgressBar;
//import android.widget.TextView;
//
//import com.google.android.gms.common.ConnectionResult;
//import com.google.android.gms.common.GoogleApiAvailability;
//import com.google.api.client.extensions.android.http.AndroidHttp;
//import com.google.api.client.googleapis.extensions.android.gms.auth.GoogleAccountCredential;
//import com.google.api.client.googleapis.extensions.android.gms.auth.GooglePlayServicesAvailabilityIOException;
//import com.google.api.client.googleapis.extensions.android.gms.auth.UserRecoverableAuthIOException;
//import com.google.api.client.http.HttpTransport;
//import com.google.api.client.json.JsonFactory;
//import com.google.api.client.json.jackson2.JacksonFactory;
//import com.google.api.client.util.DateTime;
//import com.google.api.client.util.ExponentialBackOff;
//import com.google.api.services.calendar.CalendarScopes;
//import com.google.api.services.calendar.model.Event;
//import com.google.api.services.calendar.model.EventDateTime;
//
//import java.io.IOException;
//import java.util.Arrays;
//import java.util.List;
//
//import pub.devrel.easypermissions.AfterPermissionGranted;
//import pub.devrel.easypermissions.EasyPermissions;
//
///**
// * Created by User on 2017-05-19.
// */
//
//public class GoogleLogIn extends AppCompatActivity implements EasyPermissions.PermissionCallbacks{
//
//    Intent mainIntent;
//    private int status;
//
//
//    //HttpTransport transport = AndroidHttp.newCompatibleTransport();
//    //JsonFactory jsonFactory = JacksonFactory.getDefaultInstance();
//    GoogleAccountCredential mCredential;
//
//    protected Button mCallApiButton;
//    protected ProgressDialog mProgress;
//    protected TextView mOutputText;
//    com.google.api.services.calendar.Calendar mService = null;
//
//    static final int REQUEST_ACCOUNT_PICKER = 1000;
//    static final int REQUEST_AUTHORIZATION = 1001;
//    static final int REQUEST_GOOGLE_PLAY_SERVICES = 1002;
//    static final int REQUEST_PERMISSION_GET_ACCOUNTS = 1003;
//
//    private static final String BUTTON_TEXT = "Call Google Calendar API";
//    private static final String PREF_ACCOUNT_NAME = "accountName";
//    private static final String[] SCOPES = { CalendarScopes.CALENDAR };
//
//    @Override
//    protected void onCreate(Bundle savedInstanceState) {
//        super.onCreate(savedInstanceState);
//        setContentView(R.layout.activity_schedule);
//
//        Intent currentIntent = getIntent();
//        status = currentIntent.getExtras().getInt("status");
//
//        mCallApiButton =  (Button) findViewById(R.id.button_login);
//        //mCallApiButton.setText(BUTTON_TEXT);
//        mCallApiButton.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View v) {
//                mCallApiButton.setEnabled(false);
//                mOutputText.setText("");
//                getResultsFromApi();
//                mCallApiButton.setEnabled(true);
//            }
//        });
//
//        mOutputText = (TextView) findViewById(R.id.textView);
//        //mOutputText.setText("Click the button to test the API.");
//
//        //mProgress = (ProgressBar) findViewById(R.id.progressBar2);
//        //mProgress.setMessage("Calling Google Calendar API ...");
//        mProgress = new ProgressDialog(this);
//        mProgress.setMessage("Calling Google Calendar API ...");
//
//        setContentView(R.layout.activity_schedule);
//
//        // Initialize credentials and service object.
//        mCredential = GoogleAccountCredential.usingOAuth2(
//                getApplicationContext(), Arrays.asList(SCOPES))
//                .setBackOff(new ExponentialBackOff());
//
///*
//        HttpTransport transport = AndroidHttp.newCompatibleTransport();
//        JsonFactory jsonFactory = JacksonFactory.getDefaultInstance();
//        mService = new com.google.api.services.calendar.Calendar.Builder(
//                transport, jsonFactory, mCredential)
//                .setApplicationName("Google Calendar API Android Quickstart")
//                .build();
//                */
//    }
//
//    private void insertEventFromJson(ScheduleStructure scheduleStructure) {
//
//        Event event = new Event()
//                .setSummary(scheduleStructure.getContent());
//        DateTime startDateTime = new DateTime(scheduleStructure.getStartDateTime());
//
//        EventDateTime start = new EventDateTime()
//                .setDateTime(startDateTime);
//        event.setStart(start);
//
//        DateTime endDateTime = new DateTime(scheduleStructure.getEndDateTime());
//        EventDateTime end = new EventDateTime()
//                .setDateTime(endDateTime);
//        event.setEnd(end);
//        try {
//            event = mService.events().insert("primary", event).execute();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//
//        System.out.printf("Event created: %s\n", event.getHtmlLink());
//    }
//    /**
//     * Attempt to call the API*, after verifying that all the preconditions are
//     * satisfied. The preconditions are: Google Play Services installed, an
//     * account was selected and the device currently has online access. If any
//     * of the preconditions are not satisfied, the app will prompt the user as
//     * appropriate.
//     */
//    private void getResultsFromApi() {
//        if (! isGooglePlayServicesAvailable()) {
//            acquireGooglePlayServices();
//        } else if (mCredential.getSelectedAccountName() == null) {
//            chooseAccount();
//        } else if (! isDeviceOnline()) {
//            mOutputText.setText("No network connection available.");
//        } else {
//            //Intent scheduleManagerIntent = new Intent(GoogleLogIn.this, ScheduleManager.class);
//            //scheduleManagerIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_NO_HISTORY);
//            //sttIntent.putExtra("mCredential", mCredential);
//            //startActivity(scheduleManagerIntent);
//
//            System.out.println("mcre = " + mCredential);
//            new ScheduleManager(mCredential).execute();
//
//            //Intent sttIntent = new Intent(GoogleLogIn.this, STTActivity.class);
//            //sttIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_NO_HISTORY);
//            //sttIntent.putExtra("stats", 5);
//            //startActivity(sttIntent);
//        }
//    }
//    /**
//     * Attempts to set the account used with the API credentials. If an account
//     * name was previously saved it will use that one; otherwise an account
//     * picker dialog will be shown to the user. Note that the setting the
//     * account to use with the credentials object requires the app to have the
//     * GET_ACCOUNTS permission, which is requested here if it is not already
//     * present. The AfterPermissionGranted annotation indicates that this
//     * function will be rerun automatically whenever the GET_ACCOUNTS permission
//     * is granted.
//     */
//    @AfterPermissionGranted(REQUEST_PERMISSION_GET_ACCOUNTS)
//    private void chooseAccount() {
//        if (EasyPermissions.hasPermissions(
//                this, Manifest.permission.GET_ACCOUNTS)) {
//            String accountName = getPreferences(Context.MODE_PRIVATE)
//                    .getString(PREF_ACCOUNT_NAME, null);
//            if (accountName != null) {
//                mCredential.setSelectedAccountName(accountName);
//                getResultsFromApi();
//            } else {
//                // Start a dialog from which the user can choose an account
//                startActivityForResult(
//                        mCredential.newChooseAccountIntent(),
//                        REQUEST_ACCOUNT_PICKER);
//            }
//        } else {
//            // Request the GET_ACCOUNTS permission via a user dialog
//            EasyPermissions.requestPermissions(
//                    this,
//                    "This app needs to access your Google account (via Contacts).",
//                    REQUEST_PERMISSION_GET_ACCOUNTS,
//                    Manifest.permission.GET_ACCOUNTS);
//        }
//    }
//
//
//    /**
//     * Called when an activity launched here (specifically, AccountPicker
//     * and authorization) exits, giving you the requestCode you started it with,
//     * the resultCode it returned, and any additional data from it.
//     * @param requestCode code indicating which activity result is incoming.
//     * @param resultCode code indicating the result of the incoming
//     *     activity result.
//     * @param data Intent (containing result data) returned by incoming
//     *     activity result.
//     */
//    @Override
//    protected void onActivityResult(
//            int requestCode, int resultCode, Intent data) {
//        super.onActivityResult(requestCode, resultCode, data);
//        switch(requestCode) {
//            case REQUEST_GOOGLE_PLAY_SERVICES:
//                if (resultCode != RESULT_OK) {
//                    mOutputText.setText(
//                            "This app requires Google Play Services. Please install " +
//                                    "Google Play Services on your device and relaunch this app.");
//                } else {
//                    getResultsFromApi();
//                }
//                break;
//            case REQUEST_ACCOUNT_PICKER:
//                if (resultCode == RESULT_OK && data != null &&
//                        data.getExtras() != null) {
//                    String accountName =
//                            data.getStringExtra(AccountManager.KEY_ACCOUNT_NAME);
//                    if (accountName != null) {
//                        SharedPreferences settings =
//                                getPreferences(Context.MODE_PRIVATE);
//                        SharedPreferences.Editor editor = settings.edit();
//                        editor.putString(PREF_ACCOUNT_NAME, accountName);
//                        editor.apply();
//                        mCredential.setSelectedAccountName(accountName);
//                        getResultsFromApi();
//                    }
//                }
//                break;
//            case REQUEST_AUTHORIZATION:
//                if (resultCode == RESULT_OK) {
//                    getResultsFromApi();
//                }
//                break;
//        }
//    }
//
//
//    /**
//     * Checks whether the device currently has a network connection.
//     * @return true if the device has a network connection, false otherwise.
//     */
//    private boolean isDeviceOnline() {
//        ConnectivityManager connMgr =
//                (ConnectivityManager) getSystemService(Context.CONNECTIVITY_SERVICE);
//        NetworkInfo networkInfo = connMgr.getActiveNetworkInfo();
//        return (networkInfo != null && networkInfo.isConnected());
//    }
//
//    /**
//     * Check that Google Play services APK is installed and up to date.
//     * @return true if Google Play Services is available and up to
//     *     date on this device; false otherwise.
//     */
//    private boolean isGooglePlayServicesAvailable() {
//        GoogleApiAvailability apiAvailability =
//                GoogleApiAvailability.getInstance();
//        final int connectionStatusCode =
//                apiAvailability.isGooglePlayServicesAvailable(this);
//        return connectionStatusCode == ConnectionResult.SUCCESS;
//    }
//
//    /**
//     * Attempt to resolve a missing, out-of-date, invalid or disabled Google
//     * Play Services installation via a user dialog, if possible.
//     */
//    private void acquireGooglePlayServices() {
//        GoogleApiAvailability apiAvailability =
//                GoogleApiAvailability.getInstance();
//        final int connectionStatusCode =
//                apiAvailability.isGooglePlayServicesAvailable(this);
//        if (apiAvailability.isUserResolvableError(connectionStatusCode)) {
//            showGooglePlayServicesAvailabilityErrorDialog(connectionStatusCode);
//        }
//    }
//
//
//    /**
//     * Display an error dialog showing that Google Play Services is missing
//     * or out of date.
//     * @param connectionStatusCode code describing the presence (or lack of)
//     *     Google Play Services on this device.
//     */
//    void showGooglePlayServicesAvailabilityErrorDialog(
//            final int connectionStatusCode) {
//        GoogleApiAvailability apiAvailability = GoogleApiAvailability.getInstance();
//        Dialog dialog = apiAvailability.getErrorDialog(
//                this,
//                connectionStatusCode,
//                REQUEST_GOOGLE_PLAY_SERVICES);
//        dialog.show();
//    }
//
//    /**
//     * Respond to requests for permissions at runtime for API 23 and above.
//     * @param requestCode The request code passed in
//     *     requestPermissions(android.app.Activity, String, int, String[])
//     * @param permissions The requested permissions. Never null.
//     * @param grantResults The grant results for the corresponding permissions
//     *     which is either PERMISSION_GRANTED or PERMISSION_DENIED. Never null.
//     */
//    @Override
//    public void onRequestPermissionsResult(int requestCode,
//                                           @NonNull String[] permissions,
//                                           @NonNull int[] grantResults) {
//        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
//        EasyPermissions.onRequestPermissionsResult(
//                requestCode, permissions, grantResults, this);
//    }
//
//    /**
//     * Callback for when a permission is granted using the EasyPermissions
//     * library.
//     * @param requestCode The request code associated with the requested
//     *         permission
//     * @param list The requested permission list. Never null.
//     */
//    @Override
//    public void onPermissionsGranted(int requestCode, List<String> list) {
//        // Do nothing.
//    }
//
//    /**
//     * Callback for when a permission is denied using the EasyPermissions
//     * library.
//     * @param requestCode The request code associated with the requested
//     *         permission
//     * @param list The requested permission list. Never null.
//     */
//    @Override
//    public void onPermissionsDenied(int requestCode, List<String> list) {
//        // Do nothing.
//    }
//
//
//    private class ScheduleManager extends AsyncTask<Void, Void, List<String>> {
//        //    GoogleAccountCredential mCredential;
//        private com.google.api.services.calendar.Calendar mService = null;
//        private Exception mLastError = null;
//        // Initialize credentials and service object.
//
//        ScheduleManager(GoogleAccountCredential mCredential) {
//            System.out.println(mCredential);
//            HttpTransport transport = AndroidHttp.newCompatibleTransport();
//            JsonFactory jsonFactory = JacksonFactory.getDefaultInstance();
//            mService = new com.google.api.services.calendar.Calendar.Builder(
//                    transport, jsonFactory, mCredential)
//                    .setApplicationName("Google Calendar API Android")
//                    .build();
//
//
//        }
///*
//    protected void onCreate(Bundle savedInstanceState) {
//        super.onCreate(savedInstanceState);
//
//        HttpTransport transport = AndroidHttp.newCompatibleTransport();
//        JsonFactory jsonFactory = JacksonFactory.getDefaultInstance();
//        mService = new com.google.api.services.calendar.Calendar.Builder(
//                transport, jsonFactory, mCredential)
//                .setApplicationName("Google Calendar API Android Quickstart")
//                .build();
//
//        ScheduleStructure scheduleStructure = new ScheduleStructure();
//        if (scheduleStructure.getAction() == 0){
//            insertEventFromJson(scheduleStructure);
//        }
//        else if (scheduleStructure.getAction() == 1){
//            //          deleteEventFromJson(scheduleStructure);
//        }
//        else if (scheduleStructure.getAction() == 2){
//            //        searchEventFromJson(scheduleStructure);
//        }
///*
//        // List the next 10 events from the primary calendar.
//        DateTime now = new DateTime(System.currentTimeMillis());
//        List<String> eventStrings = new ArrayList<String>();
//        Events events = mService.events().list("primary")
//                .setMaxResults(10) // 결과는 10개만
//                .setTimeMin(now)  // 지금시간부터
//                .setOrderBy("startTime")  // startTime으로 정렬
//                .setSingleEvents(true)  // singleEvent도 보여줌
//                .execute();
//        List<Event> items = events.getItems();
//
//        for (Event event : items) {
//            DateTime start = event.getStart().getDateTime();
//            if (start == null) {
//                // All-day events don't have start times, so just use
//                // the start date.
//                start = event.getStart().getDate();
//            }
//            eventStrings.add(
//                    String.format("%s (%s)", event.getSummary(), start));
//        }
//        return eventStrings;
//
//    }
//*/
//
//        /*
//         * Fetch a list of the next 10 events from the primary calendar.
//         * @return List of Strings describing returned events.
//         * @throws IOException
//    */
//        @Override
//        protected List<String> doInBackground(Void... params) {
//            ScheduleStructure scheduleStructure = new ScheduleStructure();
//
//            if (scheduleStructure.getAction() == 0) {
//                insertEventFromJson(scheduleStructure);
//            } else if (scheduleStructure.getAction() == 1) {
//                //          deleteEventFromJson(scheduleStructure);
//            } else if (scheduleStructure.getAction() == 2) {
//                //        searchEventFromJson(scheduleStructure);
//            }
//            return null;
//        }
//
//        private void insertEventFromJson(ScheduleStructure scheduleStructure) {
//
//            Event event = new Event()
//                    .setSummary(scheduleStructure.getContent());
//            DateTime startDateTime = new DateTime(scheduleStructure.getStartDateTime());
//
//            EventDateTime start = new EventDateTime()
//                    .setDateTime(startDateTime);
//            event.setStart(start);
//
//            DateTime endDateTime = new DateTime(scheduleStructure.getEndDateTime());
//            EventDateTime end = new EventDateTime()
//                    .setDateTime(endDateTime);
//            event.setEnd(end);
//            try {
//                event = mService.events().insert("primary", event).execute();
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//
//            System.out.printf("Event created: %s\n", event.getHtmlLink());
//        }
//
//        @Override
//        protected void onPreExecute() {
//            mOutputText.setText("clear");
//            mProgress.show();
//        }
//
//        @Override
//        protected void onPostExecute(List<String> output) {
//            mProgress.hide();
//            if (output == null || output.size() == 0) {
//                mOutputText.setText("No results returned.");
//            } else {
//                output.add(0, "Data retrieved using the Google Calendar API:");
//                mOutputText.setText(TextUtils.join("\n", output));
//            }
//        }
//
//        /*
//        @Override
//        protected void onCancelled() {
//            mProgress.hide();
//            if (mLastError != null) {
//                if (mLastError instanceof GooglePlayServicesAvailabilityIOException) {
//                    showGooglePlayServicesAvailabilityErrorDialog(
//                            ((GooglePlayServicesAvailabilityIOException) mLastError)
//                                    .getConnectionStatusCode());
//                } else if (mLastError instanceof UserRecoverableAuthIOException) {
//                    startActivityForResult(
//                            ((UserRecoverableAuthIOException) mLastError).getIntent(),
//                            MainActivity.REQUEST_AUTHORIZATION);
//                } else {
//                    mOutputText.setText("The following error occurred:\n"
//                            + mLastError.getMessage());
//                }
//            } else {
//                mOutputText.setText("Request cancelled.");
//            }
//        }
//        */
//    }
//}
//*/
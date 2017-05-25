package sunpark.houseelf.capstone2017.kmu.dobby;

import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GoogleApiAvailability;
import com.google.api.client.extensions.android.http.AndroidHttp;
import com.google.api.client.googleapis.extensions.android.gms.auth.GoogleAccountCredential;

import com.google.api.client.http.HttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.gson.GsonFactory;
import com.google.api.client.util.ExponentialBackOff;

import com.google.api.services.calendar.CalendarScopes;

import android.Manifest;
import android.accounts.AccountManager;
import android.app.Dialog;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.ProgressBar;
import android.widget.TextView;

import org.json.JSONException;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.logging.Level;

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
    //int numAsyncTasks;

    static final int REQUEST_ACCOUNT_PICKER = 1000;
    static final int REQUEST_AUTHORIZATION = 1001;
    static final int REQUEST_GOOGLE_PLAY_SERVICES = 1002;
    static final int REQUEST_PERMISSION_GET_ACCOUNTS = 1003;
    //private final static int ADD_OR_EDIT_CALENDAR_REQUEST = 1004;

    //private static final String BUTTON_TEXT = "Call Google Calendar API";
    private static final String PREF_ACCOUNT_NAME = "accountName";
    private static final String[] SCOPES = {CalendarScopes.CALENDAR};

    String stringForJSON;

    /**
     * Create the main activity.
     *
     * @param savedInstanceState previously saved instance data.
     */
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.activity_schedule);

        Intent thisIntent = getIntent();
        stringForJSON = thisIntent.getExtras().getString("resultJSON");
        Log.d("googleloginjson", stringForJSON);


//        stringForJSON = "{\n" +
//                "\t\"Tasktype\" : \"2\",\n" +
//                "\t\"Pattern\" : \"Null\",\n" +
//                "\t\"Tts\" : \"Null\",\n" +
//                "\t\"Homeiot\" : \n" +
//                "\t{\n" +
//                "\t\t\"Homeiottype\" : \"Null\",\n" +
//                "\t\t\"Light\":\n" +
//                "\t\t{\n" +
//                "\t\t\t\"Location\" : \"Null\",\n" +
//                "\t\t\t\"Object\" : \"Null\",\n" +
//                "\t\t\t\"Action\" : \"Null\",\n" +
//                "\t\t\t\"Brightness\" : \"Null\"\n" +
//                "\t\t},\n" +
//                "\t\t\"Tv\":\n" +
//                "\t\t{\n" +
//                "\t\t\t\"Component\" : \"Null\",\n" +
//                "\t\t\t\"Option\" : \"Null\",\n" +
//                "\t\t\t\"Object\" : \"Null\",\n" +
//                "\t\t\t\"Power\" : \"Null\",\n" +
//                "\t\t\t\"Channel\" : \"Null\",\n" +
//                "\t\t\t\"Volume\" : \"Null\",\n" +
//                "\t\t\t\"Mute\" : \"Null\",\n" +
//                "\t\t\t\"Remoteloc\" : \"Null\"\n" +
//                "\t\t},\n" +
//                "\t\t\"Schedule\" :\n" +
//                "\t\t{\n" +
//                "\t\t\t\"Date\": \"Null\",\n" +
//                "\t\t\t\"Content\" : \"Null\"\n" +
//                "\t\t},\n" +
//                "\t\t\"Music\" :\n" +
//                "\t\t{\n" +
//                "\t\t\t\"Title\" : \"Null\",\n" +
//                "\t\t\t\"Singer\" : \"Null\",\n" +
//                "\t\t\t\"Gnr\" : \"Null\",\n" +
//                "\t\t\t\"Action\" : \"Null\"\n" +
//                "\t\t},\n" +
//                "\t\t\"Aircon\" :\n" +
//                "\t\t{\n" +
//                "\t\t\t\"Object\" : \"Null\",\n" +
//                "\t\t\t\"Sub\" : \"Null\",\n" +
//                "\t\t\t\"Temperature\" : \"Null\",\n" +
//                "\t\t\t\"Power\" : \"Null\",\n" +
//                "\t\t\t\"Action\" : \"Null\"\n" +
//                "\t\t}\t\t\n" +
//                "\t},\n" +
//                "\n" +
//                "\t\"Secretary\" :\n" +
//                "\t{\n" +
//                "\t\t\"Secretarytype\" : \"1\",\n" +
//                "\n" +
//                "\t\t\"Schedule\" :\n" +
//                "\t\t{\n" +
//                "\t\t\t\"Action\" : false,\n" +
//                "\t\t\t\"Ampm\" : false,\n" +
//                "\t\t\t\"Startdate\" : \"2017-6-1\",\n" +
//                "\t\t\t\"Starttime\": \"8:3:00\",\n" +
//                "\t\t\t\"Enddate\" : \"Null\",\n" +
//                "\t\t\t\"Endtime\" : \"Null\",\n" +
//                "\t\t\t\"Content\" : \"Null\"\n" +
//                "\t\t},\n" +
//                "\t\t\"Food\" : \n" +
//                "\t\t{\n" +
//                "\t\t\t\"Object\" : \"Null\",\n" +
//                "\t\t\t\"Action\" : \"Null\"\n" +
//                "\t\t}\n" +
//                "\t}\n" +
//                "}";

        mOutputText = (TextView) findViewById(R.id.textView);
        mCallApiButton = (Button) findViewById(R.id.button_login);
        mProgress = (ProgressBar) findViewById(R.id.progressBar2);
        mProgress.setVisibility(View.INVISIBLE);

        mCredential =
                GoogleAccountCredential.usingOAuth2(getApplicationContext(), Arrays.asList(SCOPES)).setBackOff(new ExponentialBackOff());

        mService = new com.google.api.services.calendar.Calendar.Builder(transport, jsonFactory, mCredential)
                .setApplicationName("Google Calendar API Android Quickstart")
                .build();

        getResultsFromApi();

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
        if (!isGooglePlayServicesAvailable()) {
            acquireGooglePlayServices();
        } else if (mCredential.getSelectedAccountName() == null) {
            chooseAccount();
        } else if (!isDeviceOnline()) {
            mOutputText.setText("No network connection available.");
        } else {
            Log.d("getResultsFromApi", "Login success");
            try {
                new ScheduleManager(this).execute();
            } catch (JSONException e) {
                e.printStackTrace();
            }  catch (IOException e) {
                e.printStackTrace();
            }
            finish();
//            Intent sttIntent = new Intent(GoogleLogIn.this, MainActivity.class);
//            sttIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
//
//            sttIntent.putExtra("status", 1);
//            startActivity(sttIntent);
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
     *
     * @param requestCode code indicating which activity result is incoming.
     * @param resultCode  code indicating the result of the incoming
     *                    activity result.
     * @param data        Intent (containing result data) returned by incoming
     *                    activity result.
     */
    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        switch (requestCode) {
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
     *
     * @param requestCode  The request code passed in
     *                     requestPermissions(android.app.Activity, String, int, String[])
     * @param permissions  The requested permissions. Never null.
     * @param grantResults The grant results for the corresponding permissions
     *                     which is either PERMISSION_GRANTED or PERMISSION_DENIED. Never null.
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
     *
     * @param requestCode The request code associated with the requested
     *                    permission
     * @param list        The requested permission list. Never null.
     */
    @Override
    public void onPermissionsGranted(int requestCode, List<String> list) {
        // Do nothing.
    }

    /**
     * Callback for when a permission is denied using the EasyPermissions
     * library.
     *
     * @param requestCode The request code associated with the requested
     *                    permission
     * @param list        The requested permission list. Never null.
     */
    @Override
    public void onPermissionsDenied(int requestCode, List<String> list) {
        // Do nothing.
    }

    /**
     * Checks whether the device currently has a network connection.
     *
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
     *
     * @return true if Google Play Services is available and up to
     * date on this device; false otherwise.
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
     *
     * @param connectionStatusCode code describing the presence (or lack of)
     *                             Google Play Services on this device.
     */
    void showGooglePlayServicesAvailabilityErrorDialog(final int connectionStatusCode) {
        GoogleApiAvailability apiAvailability = GoogleApiAvailability.getInstance();
        Dialog dialog = apiAvailability.getErrorDialog(
                this,
                connectionStatusCode,
                REQUEST_GOOGLE_PLAY_SERVICES);
        dialog.show();
    }

}

/**
 * Created by Sunpark on 2017-04-05.
 * Kookmin Univ. CS Capstone Design Project Dobby
 */

package sunpark.houseelf.capstone2017.kmu.dobby;

import android.content.Context;
import android.content.Intent;
import android.media.AudioManager;
import android.os.Bundle;
import android.os.SystemClock;
import android.speech.RecognitionListener;
import android.speech.RecognizerIntent;
import android.speech.SpeechRecognizer;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;

import static android.speech.SpeechRecognizer.ERROR_NO_MATCH;
import static android.speech.SpeechRecognizer.ERROR_RECOGNIZER_BUSY;
import static android.speech.SpeechRecognizer.ERROR_SPEECH_TIMEOUT;

public class STTActivity extends AppCompatActivity {

    Intent recognizerIntent;
    Intent mainIntent;
    int status;

    SpeechRecognizer mSpeechRecognizer;
    String sttResultStr = "";
    String stringForJSON = "";

    JSONObject resultJSON;
    String pattern;
    String TTSMessage = " ";
    int tasktype;

    private static final int START_MESSAGE = 1;
    private static final int RESTART_MESSAGE = 2;
    private static final int NEEDINFO_MESSAGE = 3;
    private static final int RESULT_MESSAGE = 4;
    private static final int ERROR_MESSAGE = 5;

    String defaultJSON = "{\n" +
            "\t\"Tasktype\" : \"Null\",\n" +
            "\t\"Pattern\" : \"Null\",\n" +
            "\t\"Tts\" : \"Null\",\n" +
            "\t\"Homeiot\" : \n" +
            "\t{\n" +
            "\t\t\"Homeiottype\" : \"Null\",\n" +
            "\t\t\"Light\":\n" +
            "\t\t{\n" +
            "\t\t\t\"Location\" : \"Null\",\n" +
            "\t\t\t\"Object\" : \"Null\",\n" +
            "\t\t\t\"Action\" : \"Null\",\n" +
            "\t\t\t\"Brightness\" : \"Null\"\n" +
            "\t\t},\n" +
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
            "\t\t\"Schedule\" :\n" +
            "\t\t{\n" +
            "\t\t\t\"Month\": \"Null\",\n" +
            "\t\t\t\"Day\": \"Null\",\n" +
            "\t\t\t\"Action\" : \"Null\",\n" +
            "\t\t\t\"Content\" : \"Null\"\n" +
            "\t\t},\n" +
            "\t\t\"Music\" :\n" +
            "\t\t{\n" +
            "\t\t\t\"Title\" : \"Null\",\n" +
            "\t\t\t\"Singer\" : \"Null\",\n" +
            "\t\t\t\"Gnr\" : \"Null\",\n" +
            "\t\t\t\"Action\" : \"Null\"\n" +
            "\t\t},\n" +
            "\t\t\"Aircon\" :\n" +
            "\t\t{\n" +
            "\t\t\t\"Object\" : \"Null\",\n" +
            "\t\t\t\"Sub\" : \"Null\",\n" +
            "\t\t\t\"Temperature\" : \"Null\",\n" +
            "\t\t\t\"Power\" : \"Null\",\n" +
            "\t\t\t\"Action\" : \"Null\"\n" +
            "\t\t}\t\t\n" +
            "\t},\n" +
            "\n" +
            "\t\"Secretary\" :\n" +
            "\t{\n" +
            "\t\t\"Secretarytype\" : \"Null\",\n" +
            "\n" +
            "\t\t\"Schedule\" :\n" +
            "\t\t{\n" +
            "\t\t\t\"Action\" : \"Null\",\n" +
            "\t\t\t\"Startdate\" : \"Null\",\n" +
            "\t\t\t\"Starttime\": \"Null\",\n" +
            "\t\t\t\"Enddate\" : \"Null\",\n" +
            "\t\t\t\"Endtime\" : \"Null\",\n" +
            "\t\t\t\"Content\" : \"Null\"\n" +
            "\t\t},\n" +
            "\t\t\"Food\" : \n" +
            "\t\t{\n" +
            "\t\t\t\"Object\" : \"Null\",\n" +
            "\t\t\t\"Action\" : \"Null\"\n" +
            "\t\t}\n" +
            "\t}\n" +
            "}";

    private CommandSenderThread sendThread;
    private AudioManager mAudioManager;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_stt);
        mAudioManager = (AudioManager) getSystemService(Context.AUDIO_SERVICE);
        mAudioManager.setStreamVolume(AudioManager.STREAM_MUSIC, 0, 0);

        Intent thisIntent = getIntent();
        status = thisIntent.getExtras().getInt("status");

        if(status == NEEDINFO_MESSAGE) {
            defaultJSON = thisIntent.getExtras().getString("JSON");
        }

        initSpeechRecognition();
        mSpeechRecognizer.startListening(recognizerIntent);
    }

    @Override
    public void onResume() {
        // TODO Auto-generated method stub
        super.onResume();
    }

    @Override
    public void onPause() {
        // TODO Auto-generated method stub
        super.onPause();
    }

    @Override
    public void onDestroy() {
        super.onDestroy();

        Log.d("sttAct Destroy", "sttAct Destroy");

        if(mSpeechRecognizer != null) {
            mSpeechRecognizer.stopListening();
            mSpeechRecognizer.destroy();
        }
    }

    RecognitionListener mRecognitionListener = new RecognitionListener() {
        @Override
        public void onBeginningOfSpeech() {
            // TODO Auto-generated method stub
            Log.d("onBeginningOfSpeech", "onBeginningOfSpeech");
        }
        @Override
        public void onBufferReceived(byte[] buffer) {
            // TODO Auto-generated method stub
            Log.d("onBufferReceived", "onBufferReceived");
        }
        @Override
        public void onEndOfSpeech() {
            // TODO Auto-generated method stub
            Log.d("onEndOfSpeech", "onEndOfSpeech");
        }
        @Override
        public void onError(int error) {
            // TODO Auto-generated method stub
            if(error == ERROR_NO_MATCH || error == ERROR_SPEECH_TIMEOUT || error == ERROR_RECOGNIZER_BUSY) {
                SystemClock.sleep(2000);
                restartListening();
            }
            Log.d("sttAct onError", "onError" + error);
        }
        @Override
        public void onEvent(int eventType, Bundle params) {
            // TODO Auto-generated method stub
            Log.d("onEvent", "onEvent");
        }
        @Override
        public void onPartialResults(Bundle partialResults) {
            // TODO Auto-generated method stub
            restartListening();
            Log.d("onPartialResults", "onPartialResults");
        }
        @Override
        public void onReadyForSpeech(Bundle params) {
            // TODO Auto-generated method stub
            Log.d("onReadyForSpeech", "onReadyForSpeech");
        }

        @SuppressWarnings("unchecked")
        @Override
        public void onResults(Bundle results) {
            // TODO Auto-generated method stub
            Log.d("onResults", "onResults");
            ArrayList<String> resultList = results.getStringArrayList(mSpeechRecognizer.RESULTS_RECOGNITION);
            sttResultStr = resultList.get(0);

            Log.d("resultSTR", sttResultStr);

            if(sttResultStr.equals("들어가")) {
                finish();
            } else {

                try {
                    sendThread = new CommandSenderThread(sttResultStr, defaultJSON);
                    sendThread.start();
                    sendThread.join();
                    stringForJSON = sendThread.getResultString();
                } catch (Exception e) {
                    e.printStackTrace();
                    Log.e("errerrerr", "errerrerr");
                }

                Log.d("stringForJONS", stringForJSON);

                try {
                    resultJSON = new JSONObject(stringForJSON);
                } catch (JSONException e) {
                    e.printStackTrace();
                    Log.e("convert JSONObj err", stringForJSON);
                }

                try {
                    pattern = resultJSON.getString("Pattern");
                } catch (JSONException e) {
                    e.printStackTrace();
                    Log.e("pattern parse err", stringForJSON);
                }

                try {
                    TTSMessage = resultJSON.getString("Tts");
                } catch (JSONException e) {
                    e.printStackTrace();
                }

                try {
                    tasktype = resultJSON.getInt("Tasktype");
                } catch (JSONException e) {
                    e.printStackTrace();
                }

//            pattern != null -> restart stt and
//            pattern == null -> perfect sentence

                Intent TTSIntent = new Intent(getApplicationContext(), TTSActivity.class);
                TTSIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK  | Intent.FLAG_ACTIVITY_NO_HISTORY);

                if(pattern.equals("Null")) {
                    finish();
                    if(tasktype == 0) {
                        TTSIntent.putExtra("status", ERROR_MESSAGE);
                    } else {
                        TTSIntent.putExtra("status", RESULT_MESSAGE);
                        TTSIntent.putExtra("Message", TTSMessage);
                    }
                    startActivity(TTSIntent);
                }
                else {
                    finish();
                    defaultJSON = stringForJSON;
                    TTSIntent.putExtra("status", NEEDINFO_MESSAGE);
                    TTSIntent.putExtra("Message", TTSMessage);
                    TTSIntent.putExtra("JSON", defaultJSON);
                    startActivity(TTSIntent);
                }
            }

        }
        @Override
        public void onRmsChanged(float rmsdB) {
            // TODO Auto-generated method stub
           // Log.d("onRmsChanged", "onRmsChanged");
        }
    };

    private void restartListening(){
        mSpeechRecognizer.stopListening();
        mSpeechRecognizer.destroy();
        this.initSpeechRecognition();
        mSpeechRecognizer.startListening(recognizerIntent);
    }

    private void initSpeechRecognition() {
        recognizerIntent = new Intent(RecognizerIntent.ACTION_RECOGNIZE_SPEECH);
        recognizerIntent.putExtra(RecognizerIntent.EXTRA_CALLING_PACKAGE, getPackageName());
        recognizerIntent.putExtra(RecognizerIntent.EXTRA_LANGUAGE, "ko-KR");
        recognizerIntent.putExtra(RecognizerIntent.EXTRA_SPEECH_INPUT_MINIMUM_LENGTH_MILLIS, 10000);
        recognizerIntent.putExtra(RecognizerIntent.EXTRA_SPEECH_INPUT_POSSIBLY_COMPLETE_SILENCE_LENGTH_MILLIS, 3000);
        mSpeechRecognizer = SpeechRecognizer.createSpeechRecognizer(this);
        mSpeechRecognizer.setRecognitionListener(mRecognitionListener);
    }

//    private void returnMainActivity() {
//        mainIntent = new Intent(this, MainActivity.class);
//        mainIntent.setAction("android.intent.action.MAIN");
//        mainIntent.addCategory("android.intent.category.HOME");
//        mainIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TOP);
//        startActivity(mainIntent);
//    }
}

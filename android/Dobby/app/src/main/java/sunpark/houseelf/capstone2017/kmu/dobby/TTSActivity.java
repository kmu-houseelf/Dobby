
/**
 * Created by Sunpark on 2017-05-14.
 * Kookmin Univ. CS Capstone Design Project Dobby
 */

package sunpark.houseelf.capstone2017.kmu.dobby;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.Intent;
import android.media.AudioManager;
import android.os.Build;
import android.os.SystemClock;
import android.speech.RecognitionListener;
import android.speech.RecognizerIntent;
import android.speech.SpeechRecognizer;
import android.speech.tts.UtteranceProgressListener;
import android.support.annotation.RequiresApi;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.speech.tts.TextToSpeech;
import android.util.Log;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;

import static android.speech.SpeechRecognizer.ERROR_NO_MATCH;
import static android.speech.SpeechRecognizer.ERROR_SPEECH_TIMEOUT;

public class TTSActivity extends AppCompatActivity {

    //for TTS
    private TextToSpeech textToSpeech;
    private String message;

    Intent recognizerIntent;
    Intent mainIntent;

    //for STT
    SpeechRecognizer mSpeechRecognizer;
    String sttResultStr = "";
    String stringForJSON = "";

    JSONObject resultJSON;
    String pattern;
    String TTSMessage = " ";

    String defaultJSON = "{\n" +
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
            "                        \"Option\" : \"Null\",\n" +
            "\t\t\t\"Object\" : \"Null\",\n" +
            "                        \"Power\" : \"Null\",\n" +
            "\t\t\t\"Channel\" : \"Null\",\n" +
            "\t\t\t\"Volume\" : \"Null\",\n" +
            "\t\t\t\"Mute\" : \"Null\",\n" +
            "\t\t\t\"Remoteloc\" : \"Null\"\n" +
            "\t\t}\n" +
            "\t},\n" +
            "\n" +
            "\t\"Secretary\" :\n" +
            "\t{\n" +
            "\t\t\"Secretarytype\" : \"Null\",\n" +
            "\n" +
            "\t\t\"Schedule\" :\n" +
            "\t\t{\n" +
            "\t\t\t\"Startdate\" : \"Null\",\n" +
            "\t\t\t\"Starttime\": \"Null\",\n" +
            "\t\t\t\"Enddate\" : \"Null\",\n" +
            "\t\t\t\"Endtime\" : \"Null\",\n" +
            "\t\t\t\"Content\" : \"Null\"\n" +
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

    private CommandSenderThread sendThread;

    private int currentStatus;

    private final int START_MESSAGE = 1;
    private final int RESTART_MESSAGE = 2;
    private final int NEEDINFO_MESSAGE = 3;
    private final int RESULT_MESSAGE = 4;

    AudioManager mAudioManager;

    @TargetApi(Build.VERSION_CODES.LOLLIPOP)
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_tts);
        mAudioManager = (AudioManager) getSystemService(Context.AUDIO_SERVICE);
        mAudioManager.adjustStreamVolume(AudioManager.STREAM_MUSIC, AudioManager.ADJUST_UNMUTE, 100);

        Log.d("TTSACT", "setMessage");

        setMessage();

        Log.d("Message", message);

        Log.d("TTSACT", "startTTS");
        startTTS();

//        Log.d(finish())
//        finish();
    }

    @Override
    protected void onPause() {
        Log.d("TTSACT", "Pause");
        super.onPause();
    }

    @Override
    protected void onDestroy() {
        Log.d("TTSACT", "DESTROY");
        super.onDestroy();
        if(textToSpeech != null){
            textToSpeech.stop();
            textToSpeech.shutdown();
        }
    }

    private void startTTS() {
        textToSpeech = new TextToSpeech(getApplicationContext(), new TextToSpeech.OnInitListener(){
            @RequiresApi(api = Build.VERSION_CODES.LOLLIPOP)
            @Override
            public void onInit(int status) {
                if(status == TextToSpeech.SUCCESS) {
                    textToSpeech.setLanguage(Locale.KOREAN);

                    textToSpeech.setOnUtteranceProgressListener(new UtteranceProgressListener() {
                        @Override
                        public void onStart(String utteranceId) {

                        }

                        @Override
                        public void onDone(String utteranceId) {
                            switch (currentStatus) {
                                case START_MESSAGE:
                                    Intent STTIntent = new Intent(getApplicationContext(), STTActivity.class);
                                    STTIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_NO_HISTORY);
                                    startActivity(STTIntent);
                                    finish();
                                    break;
                                case RESTART_MESSAGE:case NEEDINFO_MESSAGE:
//                                    restartListening();
                                    break;
                                case RESULT_MESSAGE:
                                    finish();
                                    break;
                            }
                        }

                        @Override
                        public void onError(String utteranceId) {

                        }
                    });

                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP){
                        ttsUnder20(message);                    }
                    else
                        ttsUpper21(message);

                } else {
                    Log.e("TTS Activity", "Init Failed");
                }
            }
        });
    }

    @SuppressWarnings("deprecation")
    private void ttsUnder20(String text) {
        HashMap<String, String> map = new HashMap<>();
        map.put(TextToSpeech.Engine.KEY_PARAM_UTTERANCE_ID, "MessageID");
        textToSpeech.speak(text, TextToSpeech.QUEUE_ADD, map);
    }

    @TargetApi(Build.VERSION_CODES.LOLLIPOP)
    private void ttsUpper21(String text) {
        String utteranceID = this.hashCode() + "";
        textToSpeech.speak(text, TextToSpeech.QUEUE_ADD, null, utteranceID);
    }

    private void setMessage() {
        Intent TTSIntent = getIntent();
        currentStatus = TTSIntent.getExtras().getInt("status");
        switch (currentStatus) {
            case START_MESSAGE:
                message = "말씀하세요";
                break;

            case RESTART_MESSAGE:
                message = "다시 한번 말씀해 주세요";
                break;

            case NEEDINFO_MESSAGE: case RESULT_MESSAGE:
                message = TTSIntent.getExtras().getString("Message");
                break;

            default:
                break;
        }
    }

//    RecognitionListener mRecognitionListener = new RecognitionListener() {
//        @Override
//        public void onBeginningOfSpeech() {
//            // TODO Auto-generated method stub
//            Log.d("onBeginningOfSpeech", "onBeginningOfSpeech");
//        }
//        @Override
//        public void onBufferReceived(byte[] buffer) {
//            // TODO Auto-generated method stub
//            Log.d("onBufferReceived", "onBufferReceived");
//        }
//        @Override
//        public void onEndOfSpeech() {
//            // TODO Auto-generated method stub
//            Log.d("onEndOfSpeech", "onEndOfSpeech");
//        }
//        @Override
//        public void onError(int error) {
//            // TODO Auto-generated method stub
//            if(error == ERROR_NO_MATCH || error == ERROR_SPEECH_TIMEOUT) {
//                SystemClock.sleep(1000);
//                restartListening();
//            }
//            Log.d("sttAct onError", "onError" + error);
//        }
//        @Override
//        public void onEvent(int eventType, Bundle params) {
//            // TODO Auto-generated method stub
//            Log.d("onEvent", "onEvent");
//        }
//        @Override
//        public void onPartialResults(Bundle partialResults) {
//            // TODO Auto-generated method stub
//            restartListening();
//            Log.d("onPartialResults", "onPartialResults");
//        }
//        @Override
//        public void onReadyForSpeech(Bundle params) {
//            // TODO Auto-generated method stub
//            Log.d("onReadyForSpeech", "onReadyForSpeech");
//        }
//
//        @SuppressWarnings("unchecked")
//        @Override
//        public void onResults(Bundle results) {
//            // TODO Auto-generated method stub
//            Log.d("onResults", "onResults");
//            ArrayList<String> resultList = results.getStringArrayList(mSpeechRecognizer.RESULTS_RECOGNITION);
//            sttResultStr = resultList.get(0);
//
//            Log.d("resultSTR", sttResultStr);
//
//            if(sttResultStr.equals("들어가")) {
//                finish();
//            }
//
//            try {
//                sendThread = new CommandSenderThread(sttResultStr, defaultJSON);
//                sendThread.start();
//                sendThread.join();
//                stringForJSON = sendThread.getResultString();
//            } catch (Exception e) {
//                e.printStackTrace();
//                Log.e("errerrerr", "errerrerr");
//            }
//
//            Log.d("stringForJONS", stringForJSON);
//
//            try {
//                resultJSON = new JSONObject(stringForJSON);
//            } catch (JSONException e) {
//                e.printStackTrace();
//                Log.e("convert JSONObj err", stringForJSON);
//            }
//
//            try {
//                pattern = resultJSON.getString("Pattern");
//            } catch (JSONException e) {
//                e.printStackTrace();
//                Log.e("pattern parse err", stringForJSON);
//            }
//
//            try {
//                TTSMessage = resultJSON.getString("Tts");
//            } catch (JSONException e) {
//                e.printStackTrace();
//            }
//
////            pattern != null -> restart stt and
////            pattern == null -> perfect sentence
//            if(pattern.equals("Null")) {
//                //tts TTSMessage and stop
//                finish();
//            }
//            else {
//                defaultJSON = stringForJSON;
//                //tts TTSMessage and restart;
//                restartListening();
//            }
//        }
//        @Override
//        public void onRmsChanged(float rmsdB) {
//            // TODO Auto-generated method stub
//            // Log.d("onRmsChanged", "onRmsChanged");
//        }
//    };
//
//    private void restartListening(){
//        mSpeechRecognizer.stopListening();
//        mSpeechRecognizer.destroy();
//        this.initSpeechRecognition();
//        mSpeechRecognizer.startListening(recognizerIntent);
//    }
//
//    private void initSpeechRecognition() {
//        recognizerIntent = new Intent(RecognizerIntent.ACTION_RECOGNIZE_SPEECH);
//        recognizerIntent.putExtra(RecognizerIntent.EXTRA_CALLING_PACKAGE, getPackageName());
//        recognizerIntent.putExtra(RecognizerIntent.EXTRA_LANGUAGE, "ko-KR");
//        recognizerIntent.putExtra(RecognizerIntent.EXTRA_SPEECH_INPUT_MINIMUM_LENGTH_MILLIS, 10000);
//        recognizerIntent.putExtra(RecognizerIntent.EXTRA_SPEECH_INPUT_POSSIBLY_COMPLETE_SILENCE_LENGTH_MILLIS, 3000);
//        mSpeechRecognizer = SpeechRecognizer.createSpeechRecognizer(this);
//        mSpeechRecognizer.setRecognitionListener(mRecognitionListener);
//    }
//
//    private void returnMainActivity() {
//        mainIntent = new Intent(this, MainActivity.class);
//        mainIntent.setAction("android.intent.action.MAIN");
//        mainIntent.addCategory("android.intent.category.HOME");
//        mainIntent.addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP);
//        startActivity(mainIntent);
//    }
}


/**
 * Created by Sunpark on 2017-04-05.
 * Kookmin Univ. CS Capstone Design Project Dobby
 */

package sunpark.houseelf.capstone2017.kmu.dobby;

import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.speech.RecognitionListener;
import android.speech.RecognizerIntent;
import android.speech.SpeechRecognizer;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;

import static android.speech.SpeechRecognizer.ERROR_NO_MATCH;
import static android.speech.SpeechRecognizer.ERROR_SPEECH_TIMEOUT;

public class STTActivity extends AppCompatActivity {

    Intent recognizerIntent;
    Intent TTSIntent;
    Intent mainIntent;

    SpeechRecognizer mSpeechRecognizer;
    String resultStr = "";
    String stringForJSON = "";
    JSONObject resultJSON;
    String pattern;
    String TTSMessage;

    private int status = FIRST_STT;
    private static final int FIRST_STT = 1;
    private static final int RESTART_STT= 2;
    private CommandSenderThread sendThread;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_stt);

        TTSIntent = new Intent(this, TTSActivity.class);
        mainIntent = new Intent(this, MainActivity.class);
        recognizerIntent = new Intent(RecognizerIntent.ACTION_RECOGNIZE_SPEECH);
        recognizerIntent.putExtra(RecognizerIntent.EXTRA_CALLING_PACKAGE, getPackageName());
        recognizerIntent.putExtra(RecognizerIntent.EXTRA_LANGUAGE, "ko-KR");
        recognizerIntent.putExtra(RecognizerIntent.EXTRA_SPEECH_INPUT_MINIMUM_LENGTH_MILLIS, 5000);

        mSpeechRecognizer = SpeechRecognizer.createSpeechRecognizer(this);
        mSpeechRecognizer.setRecognitionListener(mRecognitionListener);
        mSpeechRecognizer.startListening(recognizerIntent);
    }

    @Override
    public void onResume() {
        // TODO Auto-generated method stub
        super.onResume();
        if(mSpeechRecognizer == null) {
            mSpeechRecognizer = SpeechRecognizer.createSpeechRecognizer(this);
            mSpeechRecognizer.setRecognitionListener(mRecognitionListener);
        }
    }

    @Override
    public void onPause() {
        // TODO Auto-generated method stub
        super.onPause();
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        if(mSpeechRecognizer != null) {
            mSpeechRecognizer.stopListening();
            mSpeechRecognizer.destroy();
        }

        mainIntent.setAction("android.intent.action.MAIN");
        mainIntent.addCategory("android.intent.category.HOME");
        mainIntent.addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP);
        startActivity(mainIntent);
        Log.d("sttAct Destroy", "sttAct Destroy");
    }

    RecognitionListener mRecognitionListener = new RecognitionListener() {
        @Override
        public void onBeginningOfSpeech() {
            // TODO Auto-generated method stub
            Log.d("onBeginningOfSpeech", "onBeginningOfSpeech");
//            mSpeechRecognizer.stopListening();
//            TTSThread ttsThread = new TTSThread(FIRST_STT);
//            ttsThread.start();
//            try {
//                ttsThread.join();
//            } catch (InterruptedException e) {
//                e.printStackTrace();
//                Log.d("sttBegin join", "sttBegin join");
//            }
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
            if(error == ERROR_NO_MATCH || error == ERROR_SPEECH_TIMEOUT) {
                status = RESTART_STT;
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
            resultStr = resultList.get(0);
            try {
                sendThread = new CommandSenderThread(resultStr, mHandler);
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
            }

            try {
                pattern = (String) resultJSON.get("Pattern");
            } catch (JSONException e) {
                e.printStackTrace();
            }

            try {
                TTSMessage = resultJSON.getString("Tts");
            } catch (JSONException e) {
                e.printStackTrace();
            }

            mSpeechRecognizer.stopListening();
            mSpeechRecognizer.destroy();
            TTSThread ttsThread = new TTSThread();
            ttsThread.start();
            try {
                ttsThread.join();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }


            finish();
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
        mSpeechRecognizer = SpeechRecognizer.createSpeechRecognizer(getApplicationContext());
        mSpeechRecognizer.setRecognitionListener(mRecognitionListener);
        mSpeechRecognizer.startListening(recognizerIntent);
    }

    Handler mHandler = new Handler() {
        public void handleMessage(Message msg){
            if(msg.what == 0){
                stringForJSON = (String) msg.obj;
            }
        }
    };

    class TTSThread extends Thread {
        public void run(){
            TTSIntent.putExtra("status", status);
            TTSIntent.putExtra("TTSMessage", TTSMessage);
            startActivity(TTSIntent);
        }
    }
}

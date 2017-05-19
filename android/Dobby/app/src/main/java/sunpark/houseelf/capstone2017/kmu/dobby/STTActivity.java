
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

    private int status;
    private static final int FIRST_STT = 1;
    private static final int RESTART_STT= 2;
    private static final int NEEDINFO_STT = 3;
    private static final int RESULT_STT = 4;

    private CommandSenderThread sendThread;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_stt);

        Intent currentIntent = getIntent();
        status = currentIntent.getExtras().getInt("status");
        if(status == RESULT_STT || status == NEEDINFO_STT) {
            TTSMessage = currentIntent.getExtras().getString("TTSMessage");
        }
//
//        TTSIntent = new Intent(this, TTSActivity.class);
//
//        TTSThread startTTS = new TTSThread();
//        startTTS.start();
//        try {
//            startTTS.join();
//        } catch (InterruptedException e) {
//            e.printStackTrace();
//        }

        mainIntent = new Intent(this, MainActivity.class);
        recognizerIntent = new Intent(RecognizerIntent.ACTION_RECOGNIZE_SPEECH);
        recognizerIntent.putExtra(RecognizerIntent.EXTRA_CALLING_PACKAGE, getPackageName());
        recognizerIntent.putExtra(RecognizerIntent.EXTRA_LANGUAGE, "ko-KR");
        recognizerIntent.putExtra(RecognizerIntent.EXTRA_SPEECH_INPUT_MINIMUM_LENGTH_MILLIS, 10000);

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

//        if(status == RESULT_STT){
//            mainIntent.setAction("android.intent.action.MAIN");
//            mainIntent.addCategory("android.intent.category.HOME");
//            mainIntent.addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP);
//            startActivity(mainIntent);
//        }
//        else {
//            Intent reSTTIntent = new Intent(this, STTActivity.class);
//            reSTTIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_NO_HISTORY);
//            reSTTIntent.putExtra("status", status);
//            reSTTIntent.putExtra("message", TTSMessage);
//            startActivity(reSTTIntent);
//        }

        Log.d("sttAct Destroy", "sttAct Destroy");
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
            if(error == ERROR_NO_MATCH || error == ERROR_SPEECH_TIMEOUT) {
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
//            TTSThread startTTS = new TTSThread();
//            startTTS.start();
//            try {
//                startTTS.join();
//            } catch (InterruptedException e) {
//                e.printStackTrace();
//            }
            Log.d("onReadyForSpeech", "onReadyForSpeech");
        }

        @SuppressWarnings("unchecked")
        @Override
        public void onResults(Bundle results) {
            // TODO Auto-generated method stub
            Log.d("onResults", "onResults");
            ArrayList<String> resultList = results.getStringArrayList(mSpeechRecognizer.RESULTS_RECOGNITION);
            resultStr = resultList.get(0);

            if(status == NEEDINFO_STT) {

            }

            try {
                sendThread = new CommandSenderThread(resultStr);
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

            if(!pattern.equals("Null")) {
                status = NEEDINFO_STT;
            }
            else {
                status = RESULT_STT;
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
        recognizerIntent = null;
        recognizerIntent = new Intent(RecognizerIntent.ACTION_RECOGNIZE_SPEECH);
        recognizerIntent.putExtra(RecognizerIntent.EXTRA_CALLING_PACKAGE, getPackageName());
        recognizerIntent.putExtra(RecognizerIntent.EXTRA_LANGUAGE, "ko-KR");
        recognizerIntent.putExtra(RecognizerIntent.EXTRA_SPEECH_INPUT_MINIMUM_LENGTH_MILLIS, 10000);
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
            if(status == NEEDINFO_STT || status == RESULT_STT)
                TTSIntent.putExtra("TTSMessage", TTSMessage);
            startActivity(TTSIntent);
        }
    }
}

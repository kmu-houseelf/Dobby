
/**
 * Created by Sunpark on 2017-04-05.
 * Kookmin Univ. CS Capstone Design Project Dobby
 */

package sunpark.houseelf.capstone2017.kmu.dobby;

import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.speech.RecognitionListener;
import android.speech.RecognizerIntent;
import android.speech.SpeechRecognizer;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;

import java.util.ArrayList;

import static android.speech.SpeechRecognizer.ERROR_NO_MATCH;
import static android.speech.SpeechRecognizer.ERROR_SPEECH_TIMEOUT;

public class STTActivity extends AppCompatActivity {

    Intent recognizerIntent;
    Intent TTSIntent;
    Intent mainIntent;

    SpeechRecognizer mSpeechRecognizer;
    String resultStr = "";

    private Thread sendThread;

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
        recognizerIntent.putExtra(RecognizerIntent.EXTRA_SPEECH_INPUT_POSSIBLY_COMPLETE_SILENCE_LENGTH_MILLIS, 3000);

        mSpeechRecognizer = SpeechRecognizer.createSpeechRecognizer(this);
        mSpeechRecognizer.setRecognitionListener(mRecognitionListener);
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
        mainIntent.setAction("android.intent.action.MAIN");
        mainIntent.addCategory("android.intent.category.HOME");
        mainIntent.addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP);
        startActivity(mainIntent);
        super.onDestroy();
        mSpeechRecognizer.destroy();
        Log.d("sttAct Destroy", "sttAct Destroy");
    }

    RecognitionListener mRecognitionListener = new RecognitionListener() {
        @Override
        public void onBeginningOfSpeech() {
            // TODO Auto-generated method stub
            Log.d("onBeginningOfSpeech", "onBeginningOfSpeech");
            TTSIntent.addFlags(Intent.FLAG_ACTIVITY_NO_ANIMATION);
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
                sendThread = new CommandSenderThread(resultStr);
                sendThread.start();
                sendThread.interrupt();
            } catch (Exception e) {
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
}

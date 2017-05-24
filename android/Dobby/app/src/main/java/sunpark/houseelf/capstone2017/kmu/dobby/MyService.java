
package sunpark.houseelf.capstone2017.kmu.dobby;

import android.app.ActivityManager;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.media.AudioManager;
import android.os.Bundle;
import android.os.IBinder;
import android.os.SystemClock;
import android.speech.RecognitionListener;
import android.speech.RecognizerIntent;
import android.speech.SpeechRecognizer;
import android.support.annotation.Nullable;
import android.util.Log;

import java.util.ArrayList;


import static android.content.ContentValues.TAG;
import static android.speech.SpeechRecognizer.ERROR_CLIENT;
import static android.speech.SpeechRecognizer.ERROR_NO_MATCH;
import static android.speech.SpeechRecognizer.ERROR_SPEECH_TIMEOUT;

public class MyService extends Service {
    protected AudioManager mAudioManager;
    protected SpeechRecognizer mSpeechRecognizer;
    protected Intent mSpeechRecognizerIntent;

    static final String startWord = "도비";
    private boolean found;

    @Override
    public void onCreate() {
        super.onCreate();
        found = false;
        mAudioManager = (AudioManager) getSystemService(Context.AUDIO_SERVICE);
        mAudioManager.setStreamVolume(AudioManager.STREAM_MUSIC, 0, 0);

        mSpeechRecognizer = SpeechRecognizer.createSpeechRecognizer(this);
        mSpeechRecognizer.setRecognitionListener(new SpeechRecognitionListener());

        mSpeechRecognizerIntent = new Intent(RecognizerIntent.ACTION_RECOGNIZE_SPEECH);
        mSpeechRecognizerIntent.putExtra(RecognizerIntent.EXTRA_LANGUAGE, "ko-KR");
        mSpeechRecognizerIntent.putExtra(RecognizerIntent.EXTRA_CALLING_PACKAGE, getApplication().getPackageName());
        mSpeechRecognizerIntent.putExtra(RecognizerIntent.EXTRA_SPEECH_INPUT_MINIMUM_LENGTH_MILLIS, 5000);

        mSpeechRecognizer.startListening(mSpeechRecognizerIntent);
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        if (mSpeechRecognizer != null) {
            mSpeechRecognizer.destroy();
        }
    }

    @Nullable
    @Override
    public IBinder onBind(Intent intent) {
        Log.d(TAG, "onBind");
        return null;
    }

    public void stop() {
        stopSelf();
    }


    protected class SpeechRecognitionListener implements RecognitionListener {
        @Override
        public void onBeginningOfSpeech() {
            Log.d("onBeginingOfSpeech", "onBeginingOfSpeech");
        }

        @Override
        public void onBufferReceived(byte[] buffer) {
            Log.d("onBufferReceived", "onBufferReceived");
        }

        @Override
        public void onEndOfSpeech() {
            Log.d("onEndOfSpeech", "onEndOfSpeech");
        }

        @Override
        public void onError(int error) {
            Log.d("onerror", "error = " + error);
            if(error == ERROR_CLIENT) {
                stopSelf();
            }
            if(error == ERROR_SPEECH_TIMEOUT || error == ERROR_NO_MATCH) {
                SystemClock.sleep(1500);
                restartListening();
            }
        }

        @Override
        public void onEvent(int eventType, Bundle params) {
            Log.d("onEvent", "onEvent");
        }

        @Override
        public void onPartialResults(Bundle partialResults) {
            Log.d("onPartialResults", "onPartialResults");
            restartListening();
        }

        @Override
        public void onReadyForSpeech(Bundle params) {
            Log.d("onReadyForSpeech", "onReadyForSpeech");
        }

        @Override
        public void onResults(Bundle results) {
            Log.d("onResults", "onResults");
            ArrayList<String> resultList = results.getStringArrayList(mSpeechRecognizer.RESULTS_RECOGNITION);
            String inputWord = resultList.get(0);
            for(String e : resultList) {
                Log.d("ResultList", e);
                if(startWord.equals(e)){
                    found = true;
                    break;
                }
            }

            Log.d(TAG, "result = " + inputWord);

            if(found) {
                mSpeechRecognizer.stopListening();
                mSpeechRecognizer.destroy();
                found = false;
                Intent TTSIntent = new Intent(MyService.this, TTSActivity.class);
                TTSIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_NO_HISTORY);
                TTSIntent.putExtra("status", 1);
                startActivity(TTSIntent);
                stopSelf();
            }
            else {
                restartListening();
            }
        }

        @Override
        public void onRmsChanged(float rmsdB) {

        }
    }

    private void restartListening(){
        mSpeechRecognizer.stopListening();
        mSpeechRecognizer.destroy();
        mSpeechRecognizer = SpeechRecognizer.createSpeechRecognizer(getApplicationContext());
        mSpeechRecognizer.setRecognitionListener(new SpeechRecognitionListener());
        mSpeechRecognizer.startListening(mSpeechRecognizerIntent);
    }

    public static boolean isServiceRunning(Context context) {
        ActivityManager am = (ActivityManager)context.getSystemService(Context.ACTIVITY_SERVICE);

        for (ActivityManager.RunningServiceInfo rsi : am.getRunningServices(Integer.MAX_VALUE)) {
            if (MyService.class.getName().equals(rsi.service.getClassName()))
                return true;
        }
        return false;
    }

}
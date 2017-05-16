
package sunpark.houseelf.capstone2017.kmu.dobby;

import android.app.ActivityManager;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.media.AudioManager;
import android.os.Build;
import android.os.Bundle;
import android.os.CountDownTimer;
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;
import android.os.Messenger;
import android.os.RemoteException;
import android.speech.RecognitionListener;
import android.speech.RecognizerIntent;
import android.speech.SpeechRecognizer;
import android.support.annotation.Nullable;
import android.util.Log;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import static android.content.ContentValues.TAG;
import static android.speech.SpeechRecognizer.ERROR_RECOGNIZER_BUSY;

public class MyService extends Service {
    protected AudioManager mAudioManager;
    protected SpeechRecognizer mSpeechRecognizer;
    protected Intent mSpeechRecognizerIntent;
    protected final Messenger mServerMessenger = new Messenger(new IncomingHandler(this));

    protected boolean mIsListening;
    protected volatile boolean mIsCountDownOn;
    private boolean mIsStreamSolo;

    static final int MSG_RECOGNIZER_START_LISTENING = 1;
    static final int MSG_RECOGNIZER_CANCEL = 2;
    static final String startWord = "도비";

    @Override
    public void onCreate() {
        super.onCreate();
        mAudioManager = (AudioManager) getSystemService(Context.AUDIO_SERVICE);
        mSpeechRecognizer = SpeechRecognizer.createSpeechRecognizer(this);
        mSpeechRecognizer.setRecognitionListener(new SpeechRecognitionListener());

        mSpeechRecognizerIntent = new Intent(RecognizerIntent.ACTION_RECOGNIZE_SPEECH);
        mSpeechRecognizerIntent.putExtra(RecognizerIntent.EXTRA_LANGUAGE, "ko-KR");
        mSpeechRecognizerIntent.putExtra(RecognizerIntent.EXTRA_CALLING_PACKAGE,
                getApplication().getPackageName());
    }

    protected static class IncomingHandler extends Handler {
        private WeakReference<MyService> mtarget;

        IncomingHandler(MyService target) {
            mtarget = new WeakReference<MyService>(target);
        }

        @Override
        public void handleMessage(Message msg) {
            final MyService target = mtarget.get();

            switch (msg.what) {
                case MSG_RECOGNIZER_START_LISTENING:

                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN) {
                        // turn off beep sound
                        if (!target.mIsStreamSolo) {
                            target.mAudioManager.setStreamSolo(AudioManager.STREAM_VOICE_CALL, true);
                            target.mIsStreamSolo = true;
                        }
                    }
                    if (!target.mIsListening) {
                        target.mSpeechRecognizer.startListening(target.mSpeechRecognizerIntent);
                        target.mIsListening = true;
                        Log.d("Start Listening", "message start listening");
                    }
                    break;

                case MSG_RECOGNIZER_CANCEL:
                    if (target.mIsStreamSolo) {
                        target.mAudioManager.setStreamSolo(AudioManager.STREAM_VOICE_CALL, false);
                        target.mIsStreamSolo = false;
                    }
                    target.mSpeechRecognizer.cancel();
                    target.mIsListening = false;
                    Log.d("Cancel Listening", "message canceled recognizer");
                    break;
            }
        }
    }

    // Count down timer for Jelly Bean work around
    protected CountDownTimer mNoSpeechCountDown = new CountDownTimer(5000, 5000) {
        @Override
        public void onTick(long millisUntilFinished) {
            // TODO Auto-generated method stub

        }

        @Override
        public void onFinish() {
            mIsCountDownOn = false;
            Message message = Message.obtain(null, MSG_RECOGNIZER_CANCEL);
            try
            {
                mServerMessenger.send(message);
                message = Message.obtain(null, MSG_RECOGNIZER_START_LISTENING);
                mServerMessenger.send(message);
            }
            catch (RemoteException e)
            {
                Log.e("Service onFinish err", "Service onFinish err");
            }
        }
    };

    @Override
    public void onDestroy() {
        super.onDestroy();

        if (mIsCountDownOn) {
            mNoSpeechCountDown.cancel();
        }
        if (mSpeechRecognizer != null) {
            mSpeechRecognizer.destroy();
        }
    }

    @Nullable
    @Override
    public IBinder onBind(Intent intent) {
        Log.d(TAG, "onBind");
        return mServerMessenger.getBinder();
    }

    protected class SpeechRecognitionListener implements RecognitionListener {

        @Override
        public void onBeginningOfSpeech() {
            // speech input will be processed, so there is no need for count down anymore
            if (mIsCountDownOn) {
                mIsCountDownOn = false;
                mNoSpeechCountDown.cancel();
            }
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
//            if(error == ERROR_RECOGNIZER_BUSY) {
//
//            }
            if (mIsCountDownOn) {
                mIsCountDownOn = false;
                mNoSpeechCountDown.cancel();
            }
            mIsListening = false;
            Message message = Message.obtain(null, MSG_RECOGNIZER_START_LISTENING);
            try
            {
                mServerMessenger.send(message);
            }
            catch (RemoteException e)
            {

            }
            Log.d("onerror", "error = " + error);
        }

        @Override
        public void onEvent(int eventType, Bundle params) {
            Log.d("onEvent", "onEvent");
        }

        @Override
        public void onPartialResults(Bundle partialResults) {
            Log.d("onPartialResults", "onPartialResults");
        }

        @Override
        public void onReadyForSpeech(Bundle params) {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN) {
                mIsCountDownOn = true;
                mNoSpeechCountDown.start();
            }
            Log.d("onReadyForSpeech", "onReadyForSpeech");
        }

        @Override
        public void onResults(Bundle results) {
            Log.d("onResults", "onResults"); //$NON-NLS-1$
            ArrayList<String> resultList = results.getStringArrayList(mSpeechRecognizer.RESULTS_RECOGNITION);
            String inputWord = resultList.get(0);

            Log.d(TAG, "result = " + inputWord);

            if(startWord.equals(inputWord)) {
                mSpeechRecognizer.stopListening();
                Intent sttIntent = new Intent(MyService.this, STTActivity.class);
                sttIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                startActivity(sttIntent);
            }
            else{
                mSpeechRecognizer.startListening(mSpeechRecognizerIntent);
                mIsListening = true;
            }
        }

        @Override
        public void onRmsChanged(float rmsdB) {
            //Log.d(TAG, "onRMSChanged");
        }

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
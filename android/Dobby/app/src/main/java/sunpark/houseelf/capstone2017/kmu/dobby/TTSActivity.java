
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
    private int currentStatus;

    private static final int START_MESSAGE = 1;
    private static final int RESTART_MESSAGE = 2;
    private static final int NEEDINFO_MESSAGE = 3;
    private static final int RESULT_MESSAGE = 4;
    private static final int ERROR_MESSAGE = 5;

    Intent STTIntent;
    AudioManager mAudioManager;

    @TargetApi(Build.VERSION_CODES.LOLLIPOP)
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        Log.d("TTSACT", "onCreate");

        setContentView(R.layout.activity_tts);
        mAudioManager = (AudioManager) getSystemService(Context.AUDIO_SERVICE);
        mAudioManager.setStreamVolume(AudioManager.STREAM_MUSIC, 100, 0);

        Log.d("TTSACT", "setMessage");

        setMessage();

        Log.d("status", Integer.toString(currentStatus));
        Log.d("Message", message);

        Log.d("TTSACT", "startTTS");
        startTTS();
    }

    @Override
    protected void onResume() {
        super.onResume();
        Log.d("TTSACT", "resume");
        mAudioManager.setStreamVolume(AudioManager.STREAM_MUSIC, 100, 0);
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
        if(currentStatus == ERROR_MESSAGE || currentStatus == RESULT_MESSAGE)
            returnMainActivity();
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
                                    finish();
                                    STTIntent = new Intent(getApplicationContext(), STTActivity.class);
                                    STTIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_NO_HISTORY/*| Intent.FLAG_ACTIVITY_NO_HISTORY*/);
                                    STTIntent.putExtra("status", START_MESSAGE);
                                    startActivity(STTIntent);
                                    break;
                                case RESTART_MESSAGE:
                                    finish();
                                    STTIntent = new Intent(getApplicationContext(), STTActivity.class);
                                    STTIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_NO_HISTORY);
                                    STTIntent.putExtra("status", RESTART_MESSAGE);
                                    startActivity(STTIntent);
                                    break;
                                case NEEDINFO_MESSAGE:
                                    finish();
                                    STTIntent = new Intent(getApplicationContext(), STTActivity.class);
                                    STTIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_NO_HISTORY);
                                    STTIntent.putExtra("status", NEEDINFO_MESSAGE);
                                    STTIntent.putExtra("JSON", getIntent().getExtras().getString("JSON"));
                                    startActivity(STTIntent);
                                    break;

                                case ERROR_MESSAGE: case RESULT_MESSAGE:
                                    finish();
                                    returnMainActivity();
                                    break;
                            }
                        }

                        @Override
                        public void onError(String utteranceId) {
                        }
                    });

                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP)
                        ttsUnder20(message);
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
        map.put(TextToSpeech.Engine.KEY_PARAM_STREAM, String.valueOf(AudioManager.STREAM_ALARM));
        map.put(TextToSpeech.Engine.KEY_PARAM_UTTERANCE_ID, "MessageID");
        textToSpeech.speak(text, TextToSpeech.QUEUE_FLUSH, map);
    }

    @TargetApi(Build.VERSION_CODES.LOLLIPOP)
    private void ttsUpper21(String text) {
        String utteranceID = this.hashCode() + "";
        textToSpeech.speak(text, TextToSpeech.QUEUE_FLUSH , null, utteranceID);
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

            case ERROR_MESSAGE:
                message = "말씀을 이해하지 못했어요";
                break;

            default:
                break;
        }
    }

    private void returnMainActivity() {
        Intent mainIntent = new Intent(getApplicationContext(), MainActivity.class);
        mainIntent.setAction("android.intent.action.MAIN");
        mainIntent.addCategory("android.intent.category.HOME");
        mainIntent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
        startActivity(mainIntent);
    }
}
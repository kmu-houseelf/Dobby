
/**
 * Created by Sunpark on 2017-05-14.
 * Kookmin Univ. CS Capstone Design Project Dobby
 */

package sunpark.houseelf.capstone2017.kmu.dobby;

import android.annotation.TargetApi;
import android.content.Intent;
import android.os.Build;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.speech.tts.TextToSpeech;
import android.util.Log;

import java.util.HashMap;
import java.util.Locale;

public class TTSActivity extends AppCompatActivity {

    private TextToSpeech textToSpeech;
    private String message;

    private int status;

    private final int START_MESSAGE = 1;
    private final int RESTART_MESSAGE = 2;
    private final int NEEDINFO_MESSAGE = 3;
    private final int RESULT_MESSAGE = 4;

    @TargetApi(Build.VERSION_CODES.LOLLIPOP)
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_tts);

        setMessage();
        startTTS();

//        while(!textToSpeech.isSpeaking()){
//            Log.d("isSpeaking", "speaking");
//        }

        this.finish();
    }

    @Override
    protected void onPause() {
        super.onPause();
    }

    @Override
    protected void onDestroy(){
        if(textToSpeech != null){
            textToSpeech.stop();
            textToSpeech.shutdown();
        }
        super.onDestroy();
    }

    private void startTTS(){
        textToSpeech = new TextToSpeech(getApplicationContext(), new TextToSpeech.OnInitListener(){
            @Override
            public void onInit(int status) {
                if(status != TextToSpeech.ERROR) {
                    textToSpeech.setLanguage(Locale.KOREAN);
                    if(Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP)
                        ttsUnder20(message);
                    else
                        ttsUpper21(message);
                }
            }
        });
    }

    @SuppressWarnings("deprecation")
    private void ttsUnder20(String text) {
        HashMap<String, String> map = new HashMap<>();
        map.put(TextToSpeech.Engine.KEY_PARAM_UTTERANCE_ID, "MessageID");
        textToSpeech.speak(text, TextToSpeech.QUEUE_FLUSH, map);
    }

    @TargetApi(Build.VERSION_CODES.LOLLIPOP)
    private void ttsUpper21(String text) {
        String utteranceID = this.hashCode() + "";
        textToSpeech.speak(text, TextToSpeech.QUEUE_FLUSH, null, utteranceID);
    }

    private void setMessage() {
        Intent TTSIntent = getIntent();
        status = TTSIntent.getExtras().getInt("status");
        switch (status) {
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
}

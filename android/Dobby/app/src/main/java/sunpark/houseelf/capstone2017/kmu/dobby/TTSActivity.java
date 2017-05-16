
/**
 * Created by Sunpark on 2017-05-14.
 * Kookmin Univ. CS Capstone Design Project Dobby
 */

package sunpark.houseelf.capstone2017.kmu.dobby;

import android.annotation.TargetApi;
import android.os.Build;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.speech.tts.TextToSpeech;

import java.util.HashMap;
import java.util.Locale;

public class TTSActivity extends AppCompatActivity {

    private TextToSpeech textToSpeech;
    private String message;

    @TargetApi(Build.VERSION_CODES.LOLLIPOP)
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_tts);

        message = "테스트입니다.";

        startTTS();

        if(textToSpeech != null){
            textToSpeech.stop();
            textToSpeech.shutdown();
        }

        this.finish();
    }

    @Override
    protected void onPause() {
        super.onPause();
        if(textToSpeech != null){
            textToSpeech.stop();
            textToSpeech.shutdown();
        }
        finish();
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
}

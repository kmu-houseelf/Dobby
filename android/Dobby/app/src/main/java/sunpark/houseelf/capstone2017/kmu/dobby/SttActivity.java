package sunpark.houseelf.capstone2017.kmu.dobby;

/**
*   Kookmin Univ. CS Capstone Design Project Dobby
*
*/

import android.content.Intent;
import android.os.Bundle;
import android.speech.RecognitionListener;
import android.speech.RecognizerIntent;
import android.speech.SpeechRecognizer;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import java.util.ArrayList;

public class SttActivity extends AppCompatActivity {

    Button bSend, bRestart;
    TextView resultsView;
    Intent recognizerIntent;
    SpeechRecognizer mSpeechRecognizer;
    String resultStr;

    private Thread sendThread;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_stt);

        resultsView = (TextView) findViewById(R.id.results);
        recognizerIntent = new Intent(RecognizerIntent.ACTION_RECOGNIZE_SPEECH);
        recognizerIntent.putExtra(RecognizerIntent.EXTRA_CALLING_PACKAGE, getPackageName());
        recognizerIntent.putExtra(RecognizerIntent.EXTRA_LANGUAGE, "ko-KR");
        recognizerIntent.putExtra(RecognizerIntent.EXTRA_PROMPT, "말씀하세요");

        startActivityForResult(recognizerIntent, 2);

        bSend = (Button)findViewById(R.id.button_send);

        bSend.setOnClickListener(new Button.OnClickListener(){
            public void onClick(View view) {
                try {
                    sendThread = new CommandSenderThread(resultStr);
                    sendThread.start();
                    sendThread.interrupt();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (resultCode == RESULT_OK && requestCode == 2) {
            ArrayList<String> sstResult = data.getStringArrayListExtra(RecognizerIntent.EXTRA_RESULTS);
            resultStr = sstResult.get(0);
            resultsView.setText(resultStr);
        }
    }

    @Override
    public void onResume() {
        // TODO Auto-generated method stub
        super.onResume();
        mSpeechRecognizer = SpeechRecognizer.createSpeechRecognizer(this);
        mSpeechRecognizer.setRecognitionListener(mRecognitionListener);
    }

    @Override
    public void onPause() {
        // TODO Auto-generated method stub
        super.onPause();
        mSpeechRecognizer.destroy();
    }

    @Override
    protected void onStop() {
        super.onStop();
    }

    RecognitionListener mRecognitionListener = new RecognitionListener() {
        @Override
        public void onBeginningOfSpeech() {
            // TODO Auto-generated method stub
        }
        @Override
        public void onBufferReceived(byte[] buffer) {
            // TODO Auto-generated method stub
        }
        @Override
        public void onEndOfSpeech() {
            // TODO Auto-generated method stub
        }
        @Override
        public void onError(int error) {
            // TODO Auto-generated method stub
        }
        @Override
        public void onEvent(int eventType, Bundle params) {
            // TODO Auto-generated method stub
        }
        @Override
        public void onPartialResults(Bundle partialResults) {
            // TODO Auto-generated method stub
        }
        @Override
        public void onReadyForSpeech(Bundle params) {
            // TODO Auto-generated method stub
        }
        @SuppressWarnings("unchecked")
        @Override
        public void onResults(Bundle results) {
            // TODO Auto-generated method stub
        }
        @Override
        public void onRmsChanged(float rmsdB) {
            // TODO Auto-generated method stub
        }
    };
}

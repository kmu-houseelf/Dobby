
/**
 * Created by Sunpark on 2017-04-05.
 * Kookmin Univ. CS Capstone Design Project Dobby
 */

package sunpark.houseelf.capstone2017.kmu.dobby;

import android.content.Intent;
import android.os.Bundle;
import android.speech.RecognitionListener;
import android.speech.RecognizerIntent;
import android.speech.SpeechRecognizer;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.widget.TextView;

import java.util.ArrayList;

public class SttActivity extends AppCompatActivity {

    TextView resultsView;
    Intent recognizerIntent;
    SpeechRecognizer mSpeechRecognizer;
    String resultStr = "";

    private Thread sendThread;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_stt);

        resultsView = (TextView) findViewById(R.id.results);
        recognizerIntent = new Intent(RecognizerIntent.ACTION_RECOGNIZE_SPEECH);
        recognizerIntent.putExtra(RecognizerIntent.EXTRA_CALLING_PACKAGE, getPackageName());
        recognizerIntent.putExtra(RecognizerIntent.EXTRA_LANGUAGE, "ko-KR");

        startActivityForResult(recognizerIntent, 2);
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (resultCode == RESULT_OK) {
            ArrayList<String> sstResult = data.getStringArrayListExtra(RecognizerIntent.EXTRA_RESULTS);
            resultStr = sstResult.get(0);
            resultsView.setText(resultStr);

            try {
                sendThread = new CommandSenderThread(resultStr);
                sendThread.start();
                sendThread.interrupt();
            } catch (Exception e) {
                e.printStackTrace();
            }

            mSpeechRecognizer.destroy();
            finish();
        }
    }

    @Override
    public void onResume() {
        // TODO Auto-generated method stub
        super.onResume();
        mSpeechRecognizer = SpeechRecognizer.createSpeechRecognizer(this);
        mSpeechRecognizer.setRecognitionListener(mRecognitionListener);
        mSpeechRecognizer.startListening(recognizerIntent);
    }

    @Override
    public void onPause() {
        // TODO Auto-generated method stub
        super.onPause();
        mSpeechRecognizer.destroy();
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        mSpeechRecognizer.destroy();
    }

    RecognitionListener mRecognitionListener = new RecognitionListener() {
        @Override
        public void onBeginningOfSpeech() {
            // TODO Auto-generated method stub
            Log.d("onBegginingOfSpeech", "onBegginingOfSpeech");
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
            Log.d("onError", "onError");
        }
        @Override
        public void onEvent(int eventType, Bundle params) {
            // TODO Auto-generated method stub
            Log.d("onEvent", "onEvent");
        }
        @Override
        public void onPartialResults(Bundle partialResults) {
            // TODO Auto-generated method stub
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
        }
        @Override
        public void onRmsChanged(float rmsdB) {
            // TODO Auto-generated method stub
            Log.d("onRmsChanged", "onRmsChanged");
        }
    };
}

package sunpark.houseelf.capstone2017.kmu.dobby;

/*
*   Kookmin Univ. CS Capstone Design Project DOBBY
*
*
*
*
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

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.Socket;
import java.util.ArrayList;

public class SttActivity extends AppCompatActivity {

    Button bSend, bRestart;
    TextView resultsView;
    Intent recognizerIntent;
    SpeechRecognizer mSpeechRecognizer;
    String resultStr;

    private String IP = "203.246.112.77";
    private int PORT = 7777;
    private Socket socket = null;

    private InputStream inputStream;
    private OutputStream outputStream;

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
        bRestart = (Button)findViewById(R.id.button_restart);

        bRestart.setOnClickListener(new Button.OnClickListener()
        {
            public void onClick(View view)
            {
                Intent i = getIntent();
                finish();
                startActivity(i);
            }
        });

        bSend.setOnClickListener(new Button.OnClickListener(){
            public void onClick(View view)
            {
                connectServer.start();
//                String data = "{\n" + resultsView.getText().toString() + "\n}";
//                DataSendThread dataSendThread = new DataSendThread(data);
//                dataSendThread.start();
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
        try {
            socket.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private Thread connectServer = new Thread() {
        public void run(){
            try {
                setSocket(IP, PORT);
                BufferedWriter out = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream()));

                out.write(resultStr);
                out.flush();
            } catch (IOException e1) {
                e1.printStackTrace();
            }
        }
    };

    public void setSocket(String ip, int port) throws IOException {
        try {
            socket = new Socket(ip, port);
            inputStream = socket.getInputStream();
            outputStream = socket.getOutputStream();
        } catch (IOException e) {
            System.out.println(e);
            e.printStackTrace();
        }
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

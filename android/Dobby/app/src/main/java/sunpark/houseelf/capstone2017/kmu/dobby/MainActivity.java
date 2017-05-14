
/**
 * Created by Sunpark on 2017-04-05.
 * Kookmin Univ. CS Capstone Design Project Dobby
 */

package sunpark.houseelf.capstone2017.kmu.dobby;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;


public class MainActivity extends AppCompatActivity {

    private BackPressCloseHandler backPressCloseHandler;
    private Button bTTS;

    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        backPressCloseHandler = new BackPressCloseHandler(this);

        Intent sttIntent = new Intent(MainActivity.this, SttActivity.class);
        sttIntent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
        startActivity(sttIntent);

        bTTS = (Button)findViewById(R.id.button_TTS);
        bTTS.setOnClickListener(new Button.OnClickListener(){
            public void onClick(View view) {
                Intent ttsIntent = new Intent(MainActivity.this, TTSActivity.class);
                ttsIntent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
                startActivity(ttsIntent);
            }
        });

    }



    @Override
    public void onBackPressed() {
        backPressCloseHandler.onBackPressed();
    }

}

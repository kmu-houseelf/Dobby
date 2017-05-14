
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
    private Button bStart;
    private Button bTTS;

    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        backPressCloseHandler = new BackPressCloseHandler(this);

        bStart = (Button)findViewById(R.id.button_start);
        bStart.setOnClickListener(new Button.OnClickListener() {
            public void onClick(View view) {
                Intent i = new Intent(MainActivity.this, SttActivity.class);
                startActivity(i);
            }
        });

        bTTS = (Button)findViewById(R.id.button_TTS);
        bTTS.setOnClickListener(new Button.OnClickListener(){
            public void onClick(View view) {
                Intent i = new Intent(MainActivity.this, TTSActivity.class);
                startActivity(i);
            }
        });

    }

    @Override
    public void onBackPressed() {
        backPressCloseHandler.onBackPressed();
    }

}

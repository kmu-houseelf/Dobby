
/**
 * Created by Sunpark on 2017-04-05.
 * Kookmin Univ. CS Capstone Design Project Dobby
 */

package sunpark.houseelf.capstone2017.kmu.dobby;

import android.content.Context;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;

public class MainActivity extends AppCompatActivity {

    private BackPressCloseHandler backPressCloseHandler;

    Intent STTServiceIntent;
    Context activityContext;
    Button bStopService;

    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        backPressCloseHandler = new BackPressCloseHandler(this);

        bStopService = (Button) findViewById(R.id.button_Stop);
        bStopService.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                stopService(STTServiceIntent);
                finish();
            }
        });
    }

    @Override
    protected void onResume(){
        if(MyService.isServiceRunning(getApplicationContext())){
            Log.i("service", "is running");
        }
        else {
            activityContext = getApplicationContext();
            STTServiceIntent = new Intent(activityContext, MyService.class);
//            STTServiceIntent.addFlags(Intent.FLAG_ACTIVITY_NO_HISTORY);
            activityContext.startService(STTServiceIntent);
        }
        super.onResume();
        Log.d("onResume", "Main onResume");
    }

    @Override
    protected void onStart() {
        super.onStart();
    }

    @Override
    protected void onPause() {
        super.onPause();
    }

    @Override
    protected void onStop() {
        super.onStop();
        Log.d("onSTOP", "onSTOP");
    }

    @Override
    public void onBackPressed() {
        super.onBackPressed();
    }

    public void onDestroy() {
        super.onDestroy();
        Log.d("Main onDestroy", "Main onDestroy");
    }
}

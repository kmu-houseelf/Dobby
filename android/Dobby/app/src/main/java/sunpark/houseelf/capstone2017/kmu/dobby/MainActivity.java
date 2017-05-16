
/**
 * Created by Sunpark on 2017-04-05.
 * Kookmin Univ. CS Capstone Design Project Dobby
 */

package sunpark.houseelf.capstone2017.kmu.dobby;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Build;
import android.os.IBinder;
import android.os.Message;
import android.os.Messenger;
import android.os.RemoteException;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;

import static sunpark.houseelf.capstone2017.kmu.dobby.BuildConfig.DEBUG;


public class MainActivity extends AppCompatActivity {

    private BackPressCloseHandler backPressCloseHandler;
    private Button bTTS;

    int mBindFlag;
    Messenger mServiceMessenger;

    Intent STTServiceIntent;
    Context activityContext;

    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        backPressCloseHandler = new BackPressCloseHandler(this);

        activityContext = getApplicationContext();
        STTServiceIntent = new Intent(activityContext, MyService.class);
        activityContext.startService(STTServiceIntent);
        mBindFlag = Build.VERSION.SDK_INT < Build.VERSION_CODES.ICE_CREAM_SANDWICH ? 0 : Context.BIND_ABOVE_CLIENT;

//      Intent ttsIntent = new Intent(MainActivity.this, TTSActivity.class);

        bTTS = (Button)findViewById(R.id.button_TTS);
        bTTS.setOnClickListener(new Button.OnClickListener(){
            public void onClick(View view) {
                if(MyService.isServiceRunning(getApplicationContext())){
                    Log.i("service", "is running");
                }
//                ttsIntent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
//                startActivity(ttsIntent);
            }
        });



    }

    @Override
    protected void onResume(){
        super.onResume();
        Log.d("onResume", "onResume");
    }

    @Override
    protected void onStart() {
        super.onStart();
        bindService(new Intent(this, MyService.class), mServiceConnection, mBindFlag);
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
        backPressCloseHandler.onBackPressed();
        if (mServiceMessenger != null) {
            unbindService(mServiceConnection);
            mServiceMessenger = null;
        }
    }

    public void onDestroy() {
        super.onDestroy();
    }

    private final ServiceConnection mServiceConnection = new ServiceConnection() {
        @Override
        public void onServiceConnected(ComponentName name, IBinder service) {
            if (DEBUG) {Log.d("TAG", "onServiceConnected");}

            mServiceMessenger = new Messenger(service);
            Message msg = new Message();
            msg.what = MyService.MSG_RECOGNIZER_START_LISTENING;

            try
            {
                mServiceMessenger.send(msg);
            }
            catch (RemoteException e)
            {
                e.printStackTrace();
            }
        }

        @Override
        public void onServiceDisconnected(ComponentName name) {
            if (DEBUG) {Log.d("TAG", "onServiceDisconnected");}
            mServiceMessenger = null;
        }

    }; // mServiceConnection
}

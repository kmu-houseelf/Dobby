package sunpark.houseelf.capstone2017.kmu.dobby;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;


public class MainActivity extends AppCompatActivity {

    private BackPressCloseHandler backPressCloseHandler;
    private Button btStart;

    @Override
    protected void onCreate(Bundle savedInstanceState) {


        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        backPressCloseHandler = new BackPressCloseHandler(this);

        btStart = (Button)findViewById(R.id.button_start);
        btStart.setOnClickListener(new Button.OnClickListener()
        {
            public void onClick(View view)
            {
                Intent i = new Intent(MainActivity.this, SttActivity.class);
                startActivity(i);
            }
        });


    }

    @Override public void onBackPressed() {
        //super.onBackPressed();
        backPressCloseHandler.onBackPressed();
    }

}

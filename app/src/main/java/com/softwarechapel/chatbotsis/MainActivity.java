package com.softwarechapel.chatbotsis;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.os.Bundle;

import androidx.appcompat.app.AppCompatActivity;
import androidx.core.content.ContextCompat;

import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.EditText;
import android.widget.ListView;

import com.example.dialogflow.DetectIntentTexts;

import com.google.cloud.dialogflow.v2.QueryResult;


import java.util.Map;


public class MainActivity extends AppCompatActivity {
    private EditText editText;
    private static ListView listView;
    private static ListViewAdapter listViewAdapter;
    private static Util util;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.activity_main);
        listView = (ListView) findViewById(R.id.list_view);
        listViewAdapter = new ListViewAdapter(this);
        // reister adapter with listview
        util = new Util(listView, listViewAdapter);
        editText = (EditText) findViewById(R.id.editText);

    }

    public void sendMessage(View view) {
        String text = editText.getText().toString();
        try {
            new DetectIntentTexts(this,text).execute();
            if (text.length() > 0) {
                final Message message =new Message( text, true);
                runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        Util.addMessageToView(message);
                    }
                });
                editText.getText().clear();
            }
        }catch (Exception ex){
            ex.printStackTrace();
        }

    }



    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }


    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }

}

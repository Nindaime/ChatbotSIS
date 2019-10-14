package com.softwarechapel.chatbotsis;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.ListView;

import com.example.dialogflow.DetectIntentTexts;

public class ChatActivity extends AppCompatActivity {
    private EditText editText;
    private static Util util;
    private static ListView listView;
    private static ListViewAdapter listViewAdapter;

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
}

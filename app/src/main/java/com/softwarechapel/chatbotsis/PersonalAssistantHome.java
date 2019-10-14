package com.softwarechapel.chatbotsis;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class PersonalAssistantHome extends AppCompatActivity {

    Button adminButton;
    Context context = this;
    Button genQuestions;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_personal_assistant_home);

        adminButton = findViewById(R.id.admin_button_card);
        adminButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(context, DashboardActivity.class));
                finish();
            }
        });

        genQuestions = findViewById(R.id.general_question_button_card);
        genQuestions.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(context, ChatActivity.class));
                finish();
            }
        });
    }
}

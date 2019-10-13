package com.softwarechapel.chatbotsis;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Spinner;

public class CreateAssignment extends AppCompatActivity {

    Context context = this;
    public Spinner deptSpinner;
    public ArrayAdapter<String> arrayAdapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_create_assignment);

        deptSpinner = findViewById(R.id.department_spinner);

        arrayAdapter = new ArrayAdapter<String>(context, android.R.layout.simple_spinner_dropdown_item) {
            @NonNull
            @Override
            public View getView(int position, @Nullable View convertView, @NonNull ViewGroup parent) {
                View v =  super.getView(position, convertView, parent);
                if(position == getCount()) {

                }
                return  v;

            }

            @Override
            public int getCount() {
                return super.getCount() - 1;
            }
        };

        arrayAdapter.add("Item 1");
        arrayAdapter.add("Select Department");

        deptSpinner.setAdapter(arrayAdapter);
        deptSpinner.setSelection(arrayAdapter.getCount());
    }
}

package com.softwarechapel.chatbotsis;

import android.widget.ListView;

public class Util {
    private static ListView listView;
    private static ListViewAdapter listViewAdapter;

    public Util(ListView _listView, ListViewAdapter _listViewAdapter){
        listView = _listView;
        listViewAdapter =_listViewAdapter;
        // register adapter from main activity
        listView.setAdapter(listViewAdapter);
    }

    public static void addMessageToView(Message message){
        listViewAdapter.add(message);
        // scroll the ListView to the last added element
        listView.setSelection(listView.getCount() - 1);
    }
}
// https://www.scaledrone.com/blog/android-chat-tutorial/ help ful
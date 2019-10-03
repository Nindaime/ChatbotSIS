package com.softwarechapel.chatbotsis;


public class Message {
    private String text;
    private boolean belongsToUser; // is the current user the one that sent the message
    private final static String CHAT_BOT_NAME = "Cyndy";
    private final static String CHAT_BOT_COLOR = "yellow";
    private final static String USER_COLOR = "blue";

    public Message(String text, boolean belongsToUser) {
        this.text = text;
        this.belongsToUser = belongsToUser;
    }

    public String getText() {
        return text;
    }

    public String getUser() {
        if(belongsToUser){
            return "me";
        }

        return CHAT_BOT_NAME;
    }

    public String getColor() {
        if(belongsToUser){
            return USER_COLOR;
        }

        return CHAT_BOT_COLOR;
    }



    public boolean isBelongsToUser() {
        return belongsToUser;
    }
}
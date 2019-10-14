/*
 * Copyright 2018 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.example.dialogflow;

// Imports the Google Cloud client library

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.AsyncTask;
import android.util.Log;


import com.google.api.client.json.JsonGenerator;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.gax.core.FixedCredentialsProvider;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.auth.oauth2.ServiceAccountCredentials;
import com.google.cloud.dialogflow.v2.DetectIntentResponse;
import com.google.cloud.dialogflow.v2.Intent;
import com.google.cloud.dialogflow.v2.QueryInput;
import com.google.cloud.dialogflow.v2.QueryResult;
import com.google.cloud.dialogflow.v2.SessionName;
import com.google.cloud.dialogflow.v2.SessionsClient;
import com.google.cloud.dialogflow.v2.SessionsSettings;
import com.google.cloud.dialogflow.v2.TextInput;
import com.google.cloud.dialogflow.v2.TextInput.Builder;
import com.google.cloud.dialogflow.v2.WebhookRequest;
import com.google.cloud.dialogflow.v2.WebhookResponse;
import com.google.common.collect.Maps;
import com.softwarechapel.chatbotsis.Message;
import com.softwarechapel.chatbotsis.R;
import com.softwarechapel.chatbotsis.Util;
import com.squareup.okhttp.MediaType;


import org.apache.http.HttpStatus;

import com.google.api.client.json.JsonGenerator;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.services.dialogflow.v2.model.*;

import java.io.IOException;
import java.io.InputStream;
import java.io.StringWriter;
import java.util.Map;
import java.util.UUID;
import java.util.logging.Logger;

import androidx.appcompat.app.AppCompatActivity;

/**
 * DialogFlow API Detect Intent sample with text inputs.
 */
public class DetectIntentTexts extends AsyncTask<Void, Void, DetectIntentResponse> {
    // [START dialogflow_detect_intent_text]

    /**
     * Returns the result of detect intent with texts as inputs.
     *
     * Using the same `session_id` between requests allows continuation of the conversation.
     *
     * @param projectId    Project/Agent Id.
     * @param sessionId    Identifier of the DetectIntent session.
     * @param languageCode Language code of the query.
     * @return The QueryResult for each input text.
     */
    private static final String LANGUAGE_CODE = "en-US";
    private static SessionsClient sessionsClient ;
    private static SessionName session ;
    private static String projectId;
    private final static String sessionId = String.valueOf(UUID.randomUUID()); // session id must be unique for a session
    private static String text;

    private static  AppCompatActivity activity;

    public DetectIntentTexts(AppCompatActivity _activity, String _text){

        activity =_activity;
        text = _text;

        try  {
            

            InputStream stream = activity.getResources().openRawResource(R.raw.test_key);
            //System.out.println("the key is: "+BuildConfig.TEST_KEY);
            //InputStream st = new FileInputStream( new File(BuildConfig.TEST_KEY));

            GoogleCredentials credentials = GoogleCredentials.fromStream(stream);
            projectId = ((ServiceAccountCredentials)credentials).getProjectId();

            SessionsSettings.Builder settingsBuilder = SessionsSettings.newBuilder();
            SessionsSettings sessionsSettings = settingsBuilder.setCredentialsProvider(FixedCredentialsProvider.create(credentials)).build();
            sessionsClient = SessionsClient.create(sessionsSettings);
            session = SessionName.of(projectId, sessionId);
        

            
        }catch(IOException ex){

            Log.e("Bad","Query Text: "+ ex.getMessage());
        }
    }


/*
    @Override
    protected void onPreExecute() {
        super.onPreExecute();

    }
*/



    @Override
    protected DetectIntentResponse doInBackground(Void... voids) {
        // Detect intents for text input

        Builder textInput = TextInput.newBuilder().setText(text).setLanguageCode(LANGUAGE_CODE);

        // Build the query with the TextInput
        QueryInput queryInput = QueryInput.newBuilder().setText(textInput).build();

        // Performs the detect intent request
        DetectIntentResponse response = sessionsClient.detectIntent(session, queryInput);
        // try WebhookResponse
        //GoogleCloudDialogflowV2WebhookResponse response2 = new GoogleCloudDialogflowV2WebhookResponse();



        //return response
        return response;
    }

    @Override
    protected void onPostExecute(DetectIntentResponse response) {



        Log.i("Good","Response: "+ response.toString());
        //WebhookClient a ;

        // Display the query result
        QueryResult queryResult = response.getQueryResult();


        Log.i("Good","Query Text: "+ queryResult.getQueryText());
        Log.i("Good","Detected Intent: "+queryResult.getIntent().getDisplayName()+ "(confidence: "+queryResult.getIntentDetectionConfidence()+")");
        Log.i("Good","Fulfillment Text: "+queryResult.getFulfillmentText());

        //Receive message
        Message message = new Message( queryResult.getFulfillmentText(), false);
        Util.addMessageToView(message);

    }


}
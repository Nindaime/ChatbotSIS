# ChatbotSIS
The Chatbot SIS (School Information System) is developed as an information management system that aids students interact with an AI chatbot to retreive relevant school information. The Chatbot developed with Dialogflow API is written to intrepret human language text and reply in the chat module. This application is developed for the android OS.

## Comment By @victorex27


### Install google cloud sdk
  [Read how to connect dialogflow with your sdk ](https://cloud.google.com/dialogflow/docs/quick/setup)

### To authenticate the application each time you want to 
### run it from the cloud sdk command line
### Run in powershell
```
    $env:GOOGLE_APPLICATION_CREDENTIALS="[PATH-TO-JSON-FILE]" 
```
### Then run this in cmd
``` 
    set GOOGLE_APPLICATION_CREDENTIALS=[PATH-TO-JSON-FILE]
```

### Test authentication with this

```
    gcloud auth application-default print-access-token
```

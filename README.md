# ChatbotSIS
The Chatbot SIS (School Information System) is developed as an information management system that aids students interact with an AI chatbot to retreive relevant school information. The Chatbot developed with Dialogflow API is written to intrepret human language text and reply in the chat module. This application is developed for the android OS.
<<<<<<< HEAD

## Comment By @victorex27


### Steps to Run app 
- Install [ngrok ](https://ngrok.com/)

- after unzipping it cd into the ngrok folder
- if on linux run
```
    ./ngrok http 3010
```

- if on windows run 
```
    ngrok http 3010

```
- with the addres created by ngrok, go to fulfillment in dialogflow and paste the address.<address>/webhook
something like this
```
    https://85143995.ngrok.io/webhook
```
- open another terminal and cd into the backend folder and run
```
    npm run start:dev
    
```
-this will start the backend server on port 3010

#NOTE 
Make sure your sql server is running and that you have uploaded the database tables with the relevant data
=======
>>>>>>> origin/master

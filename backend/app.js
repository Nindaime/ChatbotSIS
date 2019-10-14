import express from 'express';
//import session from 'express-session';
import bodyParser from 'body-parser';
import logger from 'morgan';
const resultRoutes = require('./routes/result');


const app = express();


app.use((req, res, next) => {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content, Accept, Content-Type, Authorization');
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, PATCH, OPTIONS');
  next();
});

app.use(logger('dev'));
app.use(bodyParser.json());
//app.use(bodyParser.urlencoded({extended: true}));

/*
app.use(session({
  key: 'user_sid',
  secret: 'somerandonstuffs',
  resave: false,
  saveUninitialized: false,
  cookie: {
      expires: 600000
  }
}));
*/

app.use('/webhook',resultRoutes);
export default app;

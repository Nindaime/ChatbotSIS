// in controllers/stuff.js

const Result = require('../models').Result;

exports.getResult = (req, res, next) => {
    //let studentMatricId = req.body.queryResult.parameters.number;
    //console.log('studentMatricId',studentMatricId);
    // if(req.body.queryResult.intent.displayName)
    //console.log('queryResult',req.body.queryResult.intent.displayName);

        const {displayName} = req.body.queryResult.intent;
        const {parameters} = req.body.queryResult;
        console.log('display name ', displayName);
        console.log('parameters ', parameters);
        Result.findOne({ attributes: ['grade'],where:{studentMatricId: '20081629725'}
      //Result.findOne({ where:{studentMatricId: '20081629725'}
      })
        .then( (result) => {

            let payload = {
                            "fulfillmentText": "This is a text response "+result.get('grade'),
                            "fulfillmentMessages": [
                              {
                                "card": {
                                  "title": "card title",
                                  "subtitle": "card text",
                                  "imageUri": "https://assistant.google.com/static/images/molecule/Molecule-Formation-stop.png",
                                  "buttons": [
                                    {
                                      "text": "button text",
                                      "postback": "https://assistant.google.com/"
                                    }
                                  ]
                                }
                              }
                            ]
                          };

            //console.log(payload);
          res.status(200).json( payload );
        }).catch( (e)=>{ console.log(e)});
        
};


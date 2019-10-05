// in controllers/stuff.js

const Result = require('../models').Result;

exports.getResult = (req, res, next) => {
    let studentMatricId = req.body.queryResult.parameters.number;
    console.log('studentMatricId',studentMatricId);
    Result.findOne({ attributes: ['grade'],where:{studentMatricId: studentMatricId}
        
      })
        .then( (result) => {


            let payload = {
                            "payload": {
                              "google": {
                                "expectUserResponse": true,
                                "richResponse": {
                                  "items": [
                                    {
                                      "simpleResponse": {
                                        "textToSpeech": "Howdy! I can tell you fun facts about almost any number."
                                      }
                                    }
                                  ]
                                }
                              }
                            }
                          };
            console.log(payload);
          res.status(200).json( payload );
        }).catch( (e)=>{ console.log(e)});
        
};


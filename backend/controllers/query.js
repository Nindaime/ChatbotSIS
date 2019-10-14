class Query{

    static findAll(Model, attr, joinObject){

        Model.findAll({
            attributes: [attr],
            include: [{
              model: Course,
              as: 'courses',
              attributes: ['courseTitle', 'courseCode']
              ,
              where: { courseCode: parameters.course.replace(/ +/g, "") }
            }
            ]
      
      
          })
            .then((result) => {
      
              Payload.clear();
              if (result.length === 0) {
                Payload.setText('I could not find any result');
                return res.status(200).json(Payload.getPayload());
              }
      
              let text = '';
      
              result.forEach(element => {
      
                //let course = element.get('courses');
                //'title', 'date', 'description','venue','departmentGroup'
                text += `The format for submitting ${element.get('assignmentDetails')} on ${course} is ${element.get('assignmentFormat')}  \n`
              });
      
              Payload.setText(text);
      
              return res.status(200).json(Payload.getPayload());
            }).catch((e) => {
              console.log(e);
              let text = "You should expect an error";
              Payload.setText(text);
              return res.status(200).json(Payload.getPayload());
      
            });
      
    }

    static findOne(Model){

    }
}

export default Query;
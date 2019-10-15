// in controllers/stuff.js
import Payload from './payload';
import Query from './query';
import Sequelize from 'sequelize';
import moment from 'moment';

const Result = require('../models').Result;
const Student = require('../models').Student;
const Course = require('../models').Course;
const TimeTable = require('../models').TimeTable;
const SchoolActivityEvent = require('../models').SchoolActivityEvent;
const Assignment = require('../models').Assignment;
const Op = Sequelize.Op;



const INTENT_NAME = {
  score: 'score-custom',
  login: 'login',
  time: 'timetable',
  evt: 'event.activity',
  format: 'homework.format',
  mode: 'homework.mode',
  deadline: 'homework.deadline',
  homework: 'homework',

};

const weekday = new Array(7);
weekday[0] = "Sunday";
weekday[1] = "Monday";
weekday[2] = "Tuesday";
weekday[3] = "Wednesday";
weekday[4] = "Thursday";
weekday[5] = "Friday";
weekday[6] = "Saturday";

exports.getResult = async (req, res, next) => {


  const { displayName } = req.body.queryResult.intent;
  const { parameters,session } = req.body.queryResult;

  if (displayName === INTENT_NAME.format) {

    const { course } = parameters;
    return Assignment.findAll({
      attributes: ['assignmentFormat', 'assignmentDetails'],
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
  
        let text = "You should expect an error";
        Payload.setText(text);
        return res.status(200).json(Payload.getPayload());

      });

  }


  if (displayName === INTENT_NAME.deadline) {

    const { course } = parameters;
    return Assignment.findAll({
      attributes: ['deadline', 'assignmentDetails'],
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
          text += `The deadline for submitting ${element.get('assignmentDetails')} assignment for course: ${course} is ${element.get('deadline')}  \n`
        });

        Payload.setText(text);

        return res.status(200).json(Payload.getPayload());
      }).catch((e) => {
        
        let text = "You should expect an error";
        Payload.setText(text);
        return res.status(200).json(Payload.getPayload());

      });

  }

  if (displayName === INTENT_NAME.homework) {

    const { course } = parameters;
    return Assignment.findAll({
      attributes: ['assignmentFormat', 'dateOfAssignment', 'modeOfSubmission', 'deadline', 'assignmentDetails'],
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
          Payload.setText('Can not find any assignment. Guess this is your free time');
          return res.status(200).json(Payload.getPayload());
        }

        let text = 'These are your assignment details:';

        result.forEach(element => {

          //let course = element.get('courses');
          //'title', 'date', 'description','venue','departmentGroup'
          text += `Course: ${course} Detail:${element.get('assignmentDetails')} given at ${element.get('assignmentDate')} and due ${element.get('deadline')}. Should be submmited ${element.get('modeOfSubmission')} using the format ${element.get('assignmentFormat')} `
        });

        Payload.setText(text);

        return res.status(200).json(Payload.getPayload());
      }).catch((e) => {
        
        let text = "You should expect an error";
        Payload.setText(text);
        return res.status(200).json(Payload.getPayload());

      });

  }

  if (displayName === INTENT_NAME.mode) {

    const { course } = parameters;
    
    return Assignment.findAll({
      attributes: ['modeOfSubmission', 'assignmentDetails'],
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
          text += `You are to submit ${element.get('assignmentDetails')} on ${course} through ${element.get('modeOfSubmission')} \n `
        });

        Payload.setText(text);

        return res.status(200).json(Payload.getPayload());
      }).catch((e) => {
        
        let text = "You should expect an error";
        Payload.setText(text);
        return res.status(200).json(Payload.getPayload());

      });

  }


  if (displayName === INTENT_NAME.evt) {

    const { type, date, schoolEventName, schoolActivityName } = parameters;


    let queryDate;

    if (date !== '') {
      //var d = new Date(date);
      let momentDate = moment(date);
      let date = momentDate.format("YYYY-MM-DD").split('T');
      queryDate = date[0];

    }


    if (type !== '' && date !== '') {

      return SchoolActivityEvent.findAll({
        attributes: ['title', 'date', 'description', 'venue', 'departmentGroup'],
        where: {
          type: type, date: {
            [Op.like]: moment(queryDate).format("YYYY-MM-DD")
          }
        }


      })
        .then((result) => {

          Payload.clear();
          if (result.length === 0) {
            Payload.setText('I could not find any result');
            return res.status(200).json(Payload.getPayload());
          }

          let text = '';

          result.forEach(element => {


            text += `${element.get('title')}, (${element.get('description')}) holds on ${element.get('date')} at ${element.get('venue')}. It is meant for ${element.get('departmentGroup')} \n`
          });

          Payload.setText(text);

          return res.status(200).json(Payload.getPayload());
        }).catch((e) => {
          
          let text = "You should expect an error";
          Payload.setText(text);
          return res.status(200).json(Payload.getPayload());

        });
    }


    if (type !== '' && (schoolActivityName !== '' || schoolEventName !== '')) {

      let queryName = schoolActivityName || schoolEventName;
      return SchoolActivityEvent.findAll({
        attributes: ['title', 'date', 'description', 'venue', 'departmentGroup'],
        where: {
          type: type, title: {
            [Op.like]: `%${queryName}%`
          }
        }

      })
        .then((result) => {

          Payload.clear();
          if (result.length === 0) {
            Payload.setText('I could not find any result');
            return res.status(200).json(Payload.getPayload());
          }

          let text = '';

          result.forEach(element => {


            text += `${element.get('title')}, (${element.get('description')}) holds on ${element.get('date')} at ${element.get('venue')}. It is meant for ${element.get('departmentGroup')} \n`
          });

          Payload.setText(text);

          return res.status(200).json(Payload.getPayload());
        }).catch((e) => {
          
          let text = "You should expect an error";
          Payload.setText(text);
          return res.status(200).json(Payload.getPayload());

        });
    }

    if (schoolActivityName !== '' || schoolEventName !== '') {

      let queryName = schoolActivityName || schoolEventName;
      return SchoolActivityEvent.findAll({
        attributes: ['title', 'date', 'description', 'venue', 'departmentGroup'],
        where: {
          title: {
            [Op.like]: `%${queryName}%`
          }
        }

      })
        .then((result) => {

          Payload.clear();
          if (result.length === 0) {
            Payload.setText('I could not find any result');
            return res.status(200).json(Payload.getPayload());
          }

          let text = '';

          result.forEach(element => {


            text += `${element.get('title')}, (${element.get('description')}) holds on ${element.get('date')} at ${element.get('venue')}. It is meant for ${element.get('departmentGroup')} \n`
          });

          Payload.setText(text);

          return res.status(200).json(Payload.getPayload());
        }).catch((e) => {
          
          let text = "You should expect an error";
          Payload.setText(text);
          return res.status(200).json(Payload.getPayload());

        });
    }






    if (type !== '') {

      return SchoolActivityEvent.findAll({
        attributes: ['title', 'date', 'description', 'venue', 'departmentGroup'],
        where: { type: type }

      })
        .then((result) => {

          Payload.clear();
          if (result.length === 0) {
            Payload.setText('I could not find any result');
            res.status(200).json(Payload.getPayload());
          }

          let text = '';

          result.forEach(element => {

            text += `${element.get('title')}, (${element.get('description')}) holds on ${element.get('date')} at ${element.get('venue')}. It is meant for ${element.get('departmentGroup')} \n`
          });

          Payload.setText(text);

          return res.status(200).json(Payload.getPayload());
        }).catch((e) => {
          
          let text = "You should expect an error";
          Payload.setText(text);
          res.status(200).json(Payload.getPayload());

        });
    }


  }



  if (displayName === INTENT_NAME.time) {

    const { course, date } = parameters;
    

    let queryDate;
    let queryCourse;
    if (date !== '') {
      const dateObject = new Date(date);
      const day = dateObject.getDay();
      queryDate = weekday[day];
    }

    if (course !== '') {
      queryCourse = parameters.course.replace(/ +/g, "");
    }

    if (course === '' && date === '') {
      return TimeTable.findAll({
        attributes: ['weekday', 'startTime', 'endTime'],
        include: [{
          model: Course,
          as: 'courses',
          attributes: ['courseTitle', 'courseCode']
        }
        ]
      })
        .then((result) => {

          Payload.clear();
          if (result.length === 0) {
            Payload.setText('I could not find any result');
            res.status(200).json(Payload.getPayload());
          }

          let text = 'This is your time table \n';

          result.forEach(element => {

            let course = element.get('courses');
            text += `(${element.get('weekday')}) course:${course.get('courseCode')} starts at ${element.get('startTime')} and ends by ${element.get('endTime')} \n`
          });

          Payload.setText(text);

          return res.status(200).json(Payload.getPayload());
        }).catch((e) => {
          
          let text = "You should expect an error";
          Payload.setText(text);
          res.status(200).json(Payload.getPayload());

        });
    }

    if (course === '' && date !== '') {


      return TimeTable.findAll({
        attributes: ['weekday', 'startTime', 'endTime'],
        where: { weekday: queryDate },
        include: [{
          model: Course,
          as: 'courses',
          attributes: ['courseTitle', 'courseCode']
        }
        ]
      })
        .then((result) => {

          Payload.clear();
          if (result.length === 0) {
            Payload.setText('I could not find any result');
            res.status(200).json(Payload.getPayload());
          }

          let text = '';

          result.forEach(element => {

            let course = element.get('courses');
            text += `${element.get('weekday')} course:${course.get('courseCode')} starts at ${element.get('startTime')} and ends by ${element.get('endTime')} \n`
          });

          Payload.setText(text);

          res.status(200).json(Payload.getPayload());
        }).catch((e) => {
        
          let text = "You should expect an error";
          Payload.setText(text);
          res.status(200).json(Payload.getPayload());

        });

    }

    if (course !== '' && date === '') {


      return TimeTable.findAll({
        attributes: ['weekday', 'startTime', 'endTime'],
        include: [{
          model: Course,
          as: 'courses',
          attributes: ['courseTitle', 'courseCode']
          ,
          where: { courseCode: queryCourse }
        }
        ]
      })
        .then((result) => {

          Payload.clear();
          if (result.length === 0) {
            Payload.setText('I could not find any result');
            res.status(200).json(Payload.getPayload());
          }

          let text = '';

          result.forEach(element => {

            let course = element.get('courses');
            text += `${element.get('weekday')} course:${course.get('courseCode')} starts at ${element.get('startTime')} and ends by ${element.get('endTime')} \n`
          });

          Payload.setText(text);

          res.status(200).json(Payload.getPayload());
        }).catch((e) => {

          let text = "You should expect an error";
          Payload.setText(text);
          res.status(200).json(Payload.getPayload());

        });

    }


    return TimeTable.findAll({
      attributes: ['weekday', 'startTime', 'endTime'],

      where: { weekday: queryDate },
      include: [{
        model: Course,
        as: 'courses',
        attributes: ['courseTitle', 'courseCode']
        ,
        where: { courseCode: queryCourse }
      }
      ]
    })
      .then((result) => {


        Payload.clear();
        if (result.length === 0) {
          Payload.setText('I could not find any result');
          res.status(200).json(Payload.getPayload());
        }

        let text = '';

        result.forEach(element => {

          let course = element.get('courses');
          text += `${element.get('weekday')} course:${course.get('courseCode')} starts at ${element.get('startTime')} and ends by ${element.get('endTime')}`
        });

        Payload.setText(text);

        res.status(200).json(Payload.getPayload());
      }).catch((e) => {

        let text = "You should expect an error";
        Payload.setText(text);
        res.status(200).json(Payload.getPayload());

      });



  }



  if (displayName === INTENT_NAME.score) {

    let student = await Student.findOne({
      attributes: ['userId'], where: { studentMatricId: parameters.studentMatricId, password: parameters.password }
    }).then((_student) => {
      return _student.get('userId');
    }).catch((e) => {
      return null;
    });


    if (student === null) {

      console.log(req.body.queryResult.outputContexts[0].lifeSpanCount);

        Payload.clear();
        if(req.body.queryResult.outputContexts.lifeSpanCount === 1){
          Payload.setText('I dont think you are who you say you are');
        }else{
          Payload.setText('Your login credentials are incorrect. Give me your reg number again');
          Payload.setContext(session,'score-followup');
        }
        

        return res.status(200).json(Payload.getPayload());
    }


    

    let clause = {studentMatricId: parameters.studentMatricId};
    
    if (parameters.session !== ''){
      clause.sessionYear= parameters.session;
    }


    if(parameters.course === '' ){
      return Result.findAll({

        attributes: ['grade','sessionYear'], where: clause,
        include: [{
          model: Course,
          as: 'courses',
          attributes: ['courseCode','semester'],
          where: { semester: parameters.semester }
        }
        ]
      })
        .then((result) => {
  
        
  
          if(result === null){
            let text = ` You do not currently have any result`;
            Payload.clear();
            Payload.setText(text);
  
            return res.status(200).json(Payload.getPayload());
  
          }
  
          let text = `These are your results these ${parameters.semester} semester \n`;

        result.forEach(element => {
          
          let course = element.get('courses');
          
          text += `${course.get('courseCode')} : ${element.get('grade')} (${element.get('sessionYear')})  \n`
        });
          Payload.clear();
          Payload.setText(text);
  
          return res.status(200).json(Payload.getPayload());
        }).catch((e) => {
          
          let text = "Something went wrong. What else would you like to know???";
          Payload.setText(text);
          return res.status(200).json(Payload.getPayload());
  
        });
    }
    
    



    return Result.findOne({

      attributes: ['grade'], where: clause,
      include: [{
        model: Course,
        as: 'courses',
        attributes: ['courseTitle'],
        where: { courseCode: parameters.course.replace(/ +/g, "") }
      }
      ]
    })
      .then((result) => {


        if(result === null){
          let text = ` You do not currently have any result for this course ${parameters.course}`;
          Payload.clear();
          Payload.setText(text);

          return res.status(200).json(Payload.getPayload());

        }

        let text = ` You got ${result.get('grade')} in ${parameters.course}`;
        Payload.clear();
        Payload.setText(text);

        return res.status(200).json(Payload.getPayload());
      }).catch((e) => {
          
        let text = "Something went wrong. What else would you like to know???";
        Payload.setText(text);
        return res.status(200).json(Payload.getPayload());

      });
  }

};


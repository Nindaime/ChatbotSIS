'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {

    const users = [{
      firstName: 'amaobi',
      lastName: 'obikobe',
      userType: 'admin',
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {

      firstName: 'peter',
      lastName: 'okonam',
      userType: 'student',
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      firstName: 'amanda',
      lastName: 'aduchie',
      userType: 'admin',
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {

      firstName: 'felix',
      lastName: 'felicia',
      userType: 'student',
      createdAt: new Date(),
      updatedAt: new Date()
    }
    ];

    await queryInterface.bulkInsert('User', users, {});

    const faculties = [{ falcultyName: 'Science' }, { falcultyName: 'Art' }, { falcultyName: 'Technicals' }];

    await queryInterface.bulkInsert('Faculty', faculties, {});

    const faculty = await queryInterface.sequelize.query(
      `SELECT facultyId from Faculties ;`
    );

    const facultyRows = faculty[0];

    const departments = [{
      facultyId: faculty[0].facultyId,
      departmentName: 'Computer Science',
      programmeSpan: '4'

    },
    {
      facultyId: faculty[0].facultyId,
      departmentName: 'Biotechnology',
      programmeSpan: '5'

    }, {
      facultyId: faculty[0].facultyId,
      departmentName: 'Information Management Technology',
      programmeSpan: '6'

    }



    ];

    await queryInterface.bulkInsert('Department', departments, {});

    const department = await queryInterface.sequelize.query(
      `SELECT departmentId from Departments ;`
    );

    const departmentRows = department[0];

    const courses = [{

      courseCode: 'CSC 201',
      courseTitle: 'Introduction to Computer Science',
      courseUnit: 3,
      courseLevel: 200,
      semester: 'first',
      lecturerName: 'Richard Mofe',
      departmentId: department[0].departmentId
    },
    {

      courseCode: 'CSC 202',
      courseTitle: 'Introduction to Computer Science II',
      courseUnit: 3,
      courseLevel: 200,
      semester: 'Second',
      lecturerName: 'Richard Mofe',
      departmentId: department[0].departmentId
    },
    {

      courseCode: 'CSC 201',
      courseTitle: 'Introduction to Computer Science',
      courseUnit: 3,
      courseLevel: 200,
      semester: 'first',
      lecturerName: 'Richard Mofe',
      departmentId: department[0].departmentId
    },
    {

      courseCode: 'BIO 301',
      courseTitle: 'Genetic Algorithm and It\'s Applications',
      courseUnit: 3,
      courseLevel: 300,
      semester: 'First',
      lecturerName: 'Edwin Reno',
      departmentId: department[0].departmentId
    }

    ];

    await queryInterface.bulkInsert('Course', courses, {});

    const course = await queryInterface.sequelize.query(
      `SELECT courseId from courses ;`
    );

    const courseRows = course[0];



    const user = await queryInterface.sequelize.query(
      `SELECT userId from USERS where userType='student';`
    );

    const studentRows = student[0];

    const students = [{
      userId: user[0].userId,
      studentMatricId: '20081629725',
      departmentId: department[0].departmentId,
      level: '100',
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {

      userId: user[1].userId,
      studentMatricId: '20081629735',
      departmentId: department[0].departmentId,
      level: '100',
      createdAt: new Date(),
      updatedAt: new Date()
    }
    ];

    await queryInterface.bulkInsert('Student', students, {});

    const student = await queryInterface.sequelize.query(
      `SELECT studentMatricId from Students;`
    );

    const results = [{
      studentMatricId: student[0].studentMatricId,
    sessionYear: '2015',
    courseId: course[0].id,
    level: '200',
    departmentId: DataTypes.INTEGER,
    grade: 'A'
    }];

    return await queryInterface.bulkInsert('Result', results, {});

  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.bulkDelete('Student', null, {});
    await queryInterface.bulkDelete('Users', null, {});
  }
};

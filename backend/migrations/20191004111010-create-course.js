'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('Courses', {
      
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      courseCode: {
        type: Sequelize.STRING
      },
      courseTitle: {
        type: Sequelize.STRING
      },
      courseUnit: {
        type: Sequelize.INTEGER
      },
      courseLevel: {
        type: Sequelize.ENUM('100','200','300','400','500','600')
      },
      semester: {
        type: Sequelize.ENUM('first','second')
      },
      lecturerName: {
        type: Sequelize.STRING
      },
      departmentId: {
        type: Sequelize.INTEGER,
        allowNull: false,
        references: {
          model: 'Departments',
          key: 'departmentId'
        }
      },
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE
      }
    });
  },
  down: (queryInterface, Sequelize) => {
    return queryInterface.dropTable('Courses');
  }
};
'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('Results', {
      
      studentMatricId: {
        type: Sequelize.STRING,
        allowNull: false,
        primaryKey: true
        ,
        references: {
          model: 'Students',
          key: 'studentMatricId'
        }
        
      },
      sessionYear: {
        type: Sequelize.STRING
      },
      courseId: {
        type: Sequelize.INTEGER,
        allowNull: false,
        references: {
          model: 'Courses',
          key: 'courseId'
        }
        
      },
      level: {
        type: Sequelize.ENUM('100','200','300','400','500','600')
      },
      departmentId: {
        type: Sequelize.INTEGER
      },
      grade: {
        type: Sequelize.ENUM('A','B','C','D','E')
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
    return queryInterface.dropTable('Results');
  }
};
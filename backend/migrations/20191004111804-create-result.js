'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('Results', {
      
      studentMatricId: {
        type: Sequelize.STRING,
        allowNull: false
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
          key: 'id'
        }
        
      },
      level: {
        type: Sequelize.ENUM('100','200','300','400','500','600')
      },
      departmentId: {
        type: Sequelize.INTEGER,
        references: {
               model: 'Departments',
                  key: 'departmentId'
                }
      },
      grade: {
        type: Sequelize.ENUM('A','B','C','D','E','F')
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
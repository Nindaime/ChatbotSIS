'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('Students', {
      userId: {
        type: Sequelize.INTEGER(11).UNSIGNED,
        allowNull: false,
        references: {
          model: 'Users',
          key: 'userId'
        }
      },
      studentMatricId: {
        allowNull: false,
        primaryKey: true,
        type: Sequelize.STRING
      },
      
      password: {
        allowNull: false,
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
      level: {
        type: Sequelize.ENUM('100','200','300','400','500','600')
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
    return queryInterface.dropTable('Students');
  }
};
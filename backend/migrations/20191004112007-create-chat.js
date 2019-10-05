'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('Chats', {
    
      datetime: {
        autoIncrement:false,
        type: Sequelize.DATE,
        allowNull: false,
        primaryKey: true,
      },
      senderId: {
        type: Sequelize.INTEGER(11).UNSIGNED,
        allowNull: false,
        references: {
          model: 'Users',
          key: 'userId'
        }
      },
      recipientId: {
        type: Sequelize.INTEGER(11).UNSIGNED,
        allowNull: false
        ,
        references: {
          model: 'Users',
          key: 'userId'
        }
        
      },
      message: {
        type: Sequelize.TEXT
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
    return queryInterface.dropTable('Chats');
  }
};
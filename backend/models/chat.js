'use strict';
module.exports = (sequelize, DataTypes) => {
  const Chat = sequelize.define('Chat', {
    datetime: DataTypes.DATE,
    senderId: DataTypes.INTEGER,
    recipientId: DataTypes.INTEGER,
    message: DataTypes.TEXT
  }, {});
  Chat.associate = function(models) {
    // associations can be defined here
    Chat.belongsTo(models.User, {foreignKey: 'senderId', as: 'users'});
    Chat.belongsTo(models.User, {foreignKey: 'recipientId', as: 'recipient'});
  };
  return Chat;
};
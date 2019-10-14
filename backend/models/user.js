'use strict';
module.exports = (sequelize, DataTypes) => {
  const User = sequelize.define('User', {
    userId: DataTypes.INTEGER(11).UNSIGNED,
    firstName: DataTypes.STRING(30),
    lastName: DataTypes.STRING(30),
    userType: DataTypes.ENUM('student','admin')
  }, {});
  User.associate = function(models) {
    // associations can be defined here
    User.hasMany(models.Student, {as: 'students'});
    User.hasMany(models.Chat, {as: 'chats'});
  };
  return User;
};
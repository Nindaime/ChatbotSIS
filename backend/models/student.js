'use strict';
module.exports = (sequelize, DataTypes) => {
  const Student = sequelize.define('Student', {
    userId: DataTypes.INTEGER,
    studentMatricId: DataTypes.STRING,
    departmentId: DataTypes.INTEGER,
    level: DataTypes.ENUM('100','200','300','400','500','600')
  }, {});
  Student.associate = function(models) {
    
    // associations can be defined here
    Student.belongsTo(models.Department, {foreignKey: 'departmentId', as: 'departments'});
    Student.belongsTo(models.User, {foreignKey: 'userId', as: 'users'});
    Student.hasMany(models.Result, {as: 'results'});
  };
  return Student;
};
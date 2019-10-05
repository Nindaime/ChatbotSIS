'use strict';
module.exports = (sequelize, DataTypes) => {
  const Result = sequelize.define('Result', {
    studentMatricId: DataTypes.STRING,
    sessionYear: DataTypes.STRING,
    courseId: DataTypes.INTEGER,
    level: DataTypes.ENUM('100','200','300','400','500','600'),
    departmentId: DataTypes.INTEGER,
    grade: DataTypes.ENUM('A','B','C','D','E')
  }, {});
  Result.associate = function(models) {
    // associations can be defined here
    Result.belongsTo(models.Student, {foreignKey: 'studentMatricId', as: 'students'});
    Result.belongsTo(models.Course, {foreignKey: 'courseId', as: 'courses'});
  };
  return Result;
};
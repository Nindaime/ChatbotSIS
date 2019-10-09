'use strict';
module.exports = (sequelize, DataTypes) => {
  const Course = sequelize.define('Course', {
    courseId: DataTypes.INTEGER,
    courseCode: DataTypes.STRING,
    courseTitle: DataTypes.STRING,
    courseUnit: DataTypes.INTEGER,
    courseLevel: DataTypes.ENUM('100','200','300','400','500','600'),
    semester: DataTypes.ENUM('first','second'),
    lecturerName: DataTypes.STRING,
    departmentId: DataTypes.INTEGER
  }, {});
  Course.associate = function(models) {
    // associations can be defined here
    Course.belongsTo(models.Department, {foreignKey: 'departmentId', as: 'department'});
    Course.hasMany(models.TimeTable, {as: 'timetables'});
    Course.hasMany(models.Result, {as: 'results'});
    Course.hasMany(models.Assignment, {as: 'assignments'});
  };

  //Course.removeAttribute('id');
  return Course;
};
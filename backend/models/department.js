'use strict';
module.exports = (sequelize, DataTypes) => {
  const Department = sequelize.define('Department', {
    departmentId: DataTypes.INTEGER,
    facultyId: DataTypes.INTEGER,
    departmentName: DataTypes.STRING(20),
    programmeSpan: DataTypes.ENUM('4','5','6')
  }, {});
  Department.associate = function(models) {
    // associations can be defined here
    Department.belongsTo(models.Faculty, {foreignKey: 'facultyId', as: 'faculty'});
    Department.hasMany(models.Course, {as: 'courses'});
    Department.hasMany(models.Student, {as: 'students'});
    Department.hasMany(models.Result, {as: 'results'});
  };
  return Department;
};
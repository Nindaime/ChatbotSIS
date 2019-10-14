'use strict';
module.exports = (sequelize, DataTypes) => {
  const TimeTable = sequelize.define('TimeTable', {
    timeTableId: DataTypes.INTEGER,
    courseId: DataTypes.INTEGER,
    weekday: DataTypes.ENUM('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'),
    startTime: DataTypes.DATE,
    endTime: DataTypes.DATE
  }, {});
  TimeTable.associate = function(models) {
    // associations can be defined here
    TimeTable.belongsTo(models.Course, {foreignKey: 'courseId', as: 'courses'});
  };
  TimeTable.removeAttribute('id');
  return TimeTable;
};
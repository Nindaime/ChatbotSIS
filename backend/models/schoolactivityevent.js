'use strict';
module.exports = (sequelize, DataTypes) => {
  const SchoolActivityEvent = sequelize.define('SchoolActivityEvent', {
    activityEventId: DataTypes.INTEGER,
    title: DataTypes.STRING,
    date: DataTypes.DATE,
    description: DataTypes.TEXT,
    type: DataTypes.ENUM('SchoolActivity','SchoolEvent'),
    venue: DataTypes.TEXT,
    departmentGroup: DataTypes.TEXT
  }, {});
  SchoolActivityEvent.associate = function(models) {
    // associations can be defined here
  };
  return SchoolActivityEvent;
};
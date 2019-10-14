'use strict';
module.exports = (sequelize, DataTypes) => {
  const Assignment = sequelize.define('Assignment', {
    assignmentId: DataTypes.INTEGER,
    courseId: DataTypes.INTEGER,
    deadline: DataTypes.DATE,
    modeOfSubmission: DataTypes.TEXT,
    assignmentFormat: DataTypes.TEXT,
    dateOfAssignment: DataTypes.DATEONLY
  }, {});
  Assignment.associate = function(models) {
    // associations can be defined here
    Assignment.belongsTo(models.Course, { foreignKey: 'courseId', as: 'courses'});
  };
  Assignment.removeAttribute('id');
  return Assignment;
};
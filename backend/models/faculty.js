'use strict';
module.exports = (sequelize, DataTypes) => {
  const Faculty = sequelize.define('Faculty', {
    facultyId: DataTypes.INTEGER,
    falcultyName: DataTypes.STRING(30)
  }, {});
  Faculty.associate = function(models) {
    // associations can be defined here
    Faculty.hasMany(models.Department, {as: 'departments'});
  };
  return Faculty;
};
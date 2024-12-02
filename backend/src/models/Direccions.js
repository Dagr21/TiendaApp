// src/models/Direccions.js
const { DataTypes } = require('sequelize');
const sequelize = require('../../database');
const Clientes = require('./Clientes');

const Direccions = sequelize.define('Direccions', {
  client_id: {
    type: DataTypes.INTEGER,
    allowNull: false,
    references: {
      model: Clientes,
      key: 'id',
    },
  },
  identifier: {
    type: DataTypes.STRING(50),
    allowNull: false,
  },
  direction: {
    type: DataTypes.STRING(255),
    allowNull: false,
  },
  created_at: {
    type: DataTypes.DATE,
    defaultValue: DataTypes.NOW,
  },
  updated_at: {
    type: DataTypes.DATE,
    defaultValue: DataTypes.NOW,
  },
}, {
  timestamps: false,
  tableName: 'Direccions',
});

Direccions.belongsTo(Clientes, { foreignKey: 'client_id' });

module.exports = Direccions;

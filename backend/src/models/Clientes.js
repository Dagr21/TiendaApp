// src/models/Clientes.js
const { DataTypes } = require('sequelize');
const sequelize = require('../database');
const Direccions = require('./Direccions');

const Clientes = sequelize.define('Clientes', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  // ... otros campos
}, {
  tableName: 'Clientes',
  timestamps: false
});

// Definir relación uno a muchos
Clientes.hasMany(Direccions, { foreignKey: 'client_id' });
Direccions.belongsTo(Clientes, { foreignKey: 'client_id' });

module.exports = Clientes;

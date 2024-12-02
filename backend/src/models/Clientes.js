// src/models/Clientes.js
const { DataTypes } = require('sequelize');
const sequelize = require('../database');

const Clientes = sequelize.define('Clientes', {
  name: {
    type: DataTypes.STRING(100),
    allowNull: false,
  },
  lastName: {
    type: DataTypes.STRING(100),
    allowNull: false,
  },
  identification: {
    type: DataTypes.STRING(50),
    unique: true,
    allowNull: false,
  },
  email: {
    type: DataTypes.STRING(100),
    unique: true,
    allowNull: false,
  },
  password: {
    type: DataTypes.STRING(255),
    allowNull: false,
  },
  image_profile: {
    type: DataTypes.STRING(255),
  },
  role: {
    type: DataTypes.STRING(50),
  },
  cantidad: {
    type: DataTypes.INTEGER,
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
  tableName: 'Clientes',
});

module.exports = Clientes;

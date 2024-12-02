// src/models/Pedidos.js
const { DataTypes } = require('sequelize');
const sequelize = require('../database');
const Clientes = require('./Clientes');
const Direccions = require('./Direccions');

const Pedidos = sequelize.define('Pedidos', {
  client_id: {
    type: DataTypes.INTEGER,
    references: {
      model: Clientes,
      key: 'id',
    },
  },
  direction_id: {
    type: DataTypes.INTEGER,
    references: {
      model: Direccions,
      key: 'id',
    },
  },
  trade_id: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  sub_total: {
    type: DataTypes.DECIMAL(10, 2),
    allowNull: false,
  },
  date: {
    type: DataTypes.DATEONLY,
    allowNull: false,
  },
  hour: {
    type: DataTypes.TIME,
    allowNull: false,
  },
  total: {
    type: DataTypes.DECIMAL(10, 2),
    allowNull: false,
  },
  status: {
    type: DataTypes.STRING(50),
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
  tableName: 'Pedidos',
});

Pedidos.belongsTo(Clientes, { foreignKey: 'client_id' });
Pedidos.belongsTo(Direccions, { foreignKey: 'direction_id' });

module.exports = Pedidos;

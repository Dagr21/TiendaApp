// src/models/Productos.js
const { DataTypes } = require('sequelize');
const sequelize = require('../../database');
const Categoria = require('./Categoria');

const Productos = sequelize.define('Productos', {
  name: {
    type: DataTypes.STRING(100),
    allowNull: false,
  },
  image: {
    type: DataTypes.STRING(255),
  },
  description: {
    type: DataTypes.STRING(255),
  },
  price: {
    type: DataTypes.DECIMAL(10, 2),
    allowNull: false,
  },
  trade_id: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  category_id: {
    type: DataTypes.INTEGER,
    references: {
      model: Categoria,
      key: 'id',
    },
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
  tableName: 'Productos',
});

Productos.belongsTo(Categoria, { foreignKey: 'category_id' });

module.exports = Productos;

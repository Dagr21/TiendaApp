const { Sequelize } = require('sequelize');

const sequelize = new Sequelize('tienda_appDB', 'username', 'password', {
  host: 'localhost',
  dialect: 'mssql',
  dialectOptions: {
    encrypt: true, // Configuración de encriptación si es necesario
  },
  logging: false, // Desactiva el logging si no lo necesitas
});

module.exports = sequelize;

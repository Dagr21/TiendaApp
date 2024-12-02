// src/database.js
const { Sequelize } = require('sequelize');
require('dotenv').config(); // Cargar variables de entorno

// Configuración de Sequelize
const sequelize = new Sequelize(
  process.env.DB_NAME,
  process.env.DB_USER,
  process.env.DB_PASSWORD,
  {
    host: process.env.DB_HOST,
    port: process.env.DB_PORT,
    dialect: process.env.DB_DIALECT,
    logging: false, // Puedes activar esto si necesitas ver las consultas SQL
  }
);

// Método para verificar la conexión
(async () => {
  try {
    await sequelize.authenticate();
    console.log('Conexión establecida con la base de datos.');
  } catch (error) {
    console.error('Error al conectar con la base de datos:', error);
  }
})();

module.exports = sequelize;

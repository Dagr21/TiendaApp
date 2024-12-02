const { Sequelize } = require('sequelize');
require('dotenv').config();

console.log(process.env.DB_NAME);  // Esto debería imprimir 'tiendaapp'
console.log(process.env.DB_USER);  // Esto debería imprimir 'root'
console.log(process.env.DB_PASSWORD);  // Esto debería imprimir '12351'

const sequelize = new Sequelize(
  process.env.DB_NAME,  
  process.env.DB_USER,  
  process.env.DB_PASSWORD,
  {
    host: process.env.DB_HOST,
    port: process.env.DB_PORT,
    dialect: process.env.DB_DIALECT || 'mysql',
    logging: false,
  }
);

module.exports = sequelize;

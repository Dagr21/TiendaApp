// src/app.js
const express = require('express');
const sequelize = require('./database'); // Importa la conexión a la base de datos
const productsRoute = require('./routes/productsRoute');


const app = express();
app.use(express.json()); // Para manejar solicitudes JSON
app.use('/api', productsRoute);


// Prueba de conexión con la base de datos y sincronización de modelos
sequelize.sync({ force: false }) // Si pones force: true, las tablas se eliminarán y recrearán cada vez
  .then(() => {
    console.log('Conexión exitosa a la base de datos');
  })
  .catch((error) => {
    console.error('Error al conectar con la base de datos', error);
  });

module.exports = app;

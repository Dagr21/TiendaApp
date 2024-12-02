// src/app.js
const express = require('express');
const productsRoute = require('./routes/productsRoute');

const app = express();

// Middlewares
app.use(express.json()); // Manejo de solicitudes JSON

// Rutas
app.use('/api', productsRoute);

// Manejador de rutas no encontradas
app.use((req, res, next) => {
  res.status(404).json({ message: 'Ruta no encontrada' });
});

module.exports = app;

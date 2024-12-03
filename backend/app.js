// src/app.js
const express = require('express');
const productosRoute = require('./src/routes/productsRoute');
const categoriaRoute = require('./src/routes/categoriaRoute');
const clientesRoute = require('./src/routes/clientesRoute');
const pedidosRoute = require('./src/routes/pedidosRoute');
const cors = require('cors');




const app = express();
app.use(express.json());
app.use(cors());


app.use('/api', productosRoute);
app.use('/api', categoriaRoute);
app.use('/api', clientesRoute);
app.use('/api', pedidosRoute);


module.exports = app;

// src/routes/pedidosRoute.js
const express = require('express');
const pedidosController = require('../controllers/pedidosController');
const validatePedidos = require('../middlewares/validatePedidos');
const authMiddleware = require('../middlewares/authMiddleware');

const router = express.Router();

// Rutas para pedidos
router.get('/pedidos',  pedidosController.getAll);
router.get('/pedidos/:id',  pedidosController.getById);
router.post('/pedidos',  validatePedidos, pedidosController.create);
router.put('/pedidos/:id',  validatePedidos, pedidosController.update);
router.delete('/pedidos/:id',  pedidosController.delete);

module.exports = router;

// src/routes/clientesRoute.js
const express = require('express');
const clientesController = require('../controllers/clientesController');
const validateClientes = require('../middlewares/validateClientes');
const authMiddleware = require('../middlewares/authMiddleware');

const router = express.Router();

// Rutas para clientes
router.get('/clientes',  clientesController.getAll);
router.get('/clientes/:id',  clientesController.getById);
router.post('/clientes', validateClientes, clientesController.create);
router.put('/clientes/:id',  validateClientes, clientesController.update);
router.delete('/clientes/:id',  clientesController.delete);

module.exports = router;

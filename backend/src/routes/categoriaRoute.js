// src/routes/categoriaRoute.js
const express = require('express');
const categoriaController = require('../controllers/categoriaController');
const validateCategoria = require('../middlewares/validateCategoria');
const authMiddleware = require('../middlewares/authMiddleware');

const router = express.Router();

// Rutas de categorías
router.get('/categorias',  categoriaController.getAll);
router.get('/categorias/:id',  categoriaController.getById);
router.post('/categorias',  validateCategoria, categoriaController.create);
router.put('/categorias/:id',  validateCategoria, categoriaController.update);
router.delete('/categorias/:id',  categoriaController.delete);

module.exports = router;

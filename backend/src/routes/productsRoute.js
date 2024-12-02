// src/routes/productsRoute.js
const express = require('express');
const productosController = require('../controllers/productosController.js');
const validateProduct = require('../middlewares/validateProduct');
const authMiddleware = require('../middlewares/authMiddleware');

const router = express.Router();

// Rutas de productos
router.get('/productos',  productosController.getAll);
router.get('/productos/:id',  productosController.getById);
router.post('/productos',  validateProduct, productosController.create);
router.put('/productos/:id',  validateProduct, productosController.update);
router.delete('/productos/:id',  productosController.delete);

module.exports = router;

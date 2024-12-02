// src/controllers/productsController.js
const Productos = require('../models/Productos');

exports.getProducts = async (req, res) => {
  try {
    const products = await Productos.findAll();
    res.json(products);
  } catch (error) {
    res.status(500).json({ message: 'Error al obtener productos', error });
  }
};

exports.createProduct = async (req, res) => {
  try {
    const { name, price, category_id, description } = req.body;
    const newProduct = await Productos.create({ name, price, category_id, description });
    res.status(201).json(newProduct);
  } catch (error) {
    res.status(500).json({ message: 'Error al crear producto', error });
  }
};

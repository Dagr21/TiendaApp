// src/controllers/productosController.js
const Productos = require('../models/Productos');

const productosController = {
  // Obtener todos los productos
  getAll: async (req, res) => {
    try {
      const productos = await Productos.findAll();
      res.status(200).json(productos);
    } catch (error) {
      res.status(500).json({ error: 'Error al obtener los productos', details: error.message });
    }
  },

  // Obtener un producto por ID
  getById: async (req, res) => {
    try {
      const producto = await Productos.findByPk(req.params.id);
      if (!producto) return res.status(404).json({ error: 'Producto no encontrado' });
      res.status(200).json(producto);
    } catch (error) {
      res.status(500).json({ error: 'Error al obtener el producto', details: error.message });
    }
  },

  // Crear un nuevo producto
  create: async (req, res) => {
    try {
      const producto = await Productos.create(req.body);
      res.status(201).json(producto);
    } catch (error) {
      res.status(400).json({ error: 'Error al crear el producto', details: error.message });
    }
  },

  // Actualizar un producto
  update: async (req, res) => {
    try {
      const producto = await Productos.findByPk(req.params.id);
      if (!producto) return res.status(404).json({ error: 'Producto no encontrado' });

      await producto.update(req.body);
      res.status(200).json(producto);
    } catch (error) {
      res.status(400).json({ error: 'Error al actualizar el producto', details: error.message });
    }
  },

  // Eliminar un producto
  delete: async (req, res) => {
    try {
      const producto = await Productos.findByPk(req.params.id);
      if (!producto) return res.status(404).json({ error: 'Producto no encontrado' });

      await producto.destroy();
      res.status(204).send();
    } catch (error) {
      res.status(500).json({ error: 'Error al eliminar el producto', details: error.message });
    }
  },
};

module.exports = productosController;

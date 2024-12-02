// src/controllers/categoriaController.js
const Categoria = require('../models/Categoria');

const categoriaController = {
  // Obtener todas las categorías
  getAll: async (req, res) => {
    try {
      const categorias = await Categoria.findAll();
      res.status(200).json(categorias);
    } catch (error) {
      res.status(500).json({ error: 'Error al obtener las categorías', details: error.message });
    }
  },

  // Obtener una categoría por ID
  getById: async (req, res) => {
    try {
      const categoria = await Categoria.findByPk(req.params.id);
      if (!categoria) return res.status(404).json({ error: 'Categoría no encontrada' });
      res.status(200).json(categoria);
    } catch (error) {
      res.status(500).json({ error: 'Error al obtener la categoría', details: error.message });
    }
  },

  // Crear una nueva categoría
  create: async (req, res) => {
    try {
      const categoria = await Categoria.create(req.body);
      res.status(201).json(categoria);
    } catch (error) {
      res.status(400).json({ error: 'Error al crear la categoría', details: error.message });
    }
  },

  // Actualizar una categoría
  update: async (req, res) => {
    try {
      const categoria = await Categoria.findByPk(req.params.id);
      if (!categoria) return res.status(404).json({ error: 'Categoría no encontrada' });

      await categoria.update(req.body);
      res.status(200).json(categoria);
    } catch (error) {
      res.status(400).json({ error: 'Error al actualizar la categoría', details: error.message });
    }
  },

  // Eliminar una categoría
  delete: async (req, res) => {
    try {
      const categoria = await Categoria.findByPk(req.params.id);
      if (!categoria) return res.status(404).json({ error: 'Categoría no encontrada' });

      await categoria.destroy();
      res.status(204).send();
    } catch (error) {
      res.status(500).json({ error: 'Error al eliminar la categoría', details: error.message });
    }
  },
};

module.exports = categoriaController;

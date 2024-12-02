// src/controllers/clientesController.js
const Clientes = require('../models/Clientes');

const clientesController = {
  // Obtener todos los clientes
  getAll: async (req, res) => {
    try {
      const clientes = await Clientes.findAll();
      res.status(200).json(clientes);
    } catch (error) {
      res.status(500).json({ error: 'Error al obtener los clientes', details: error.message });
    }
  },

  // Obtener un cliente por ID
  getById: async (req, res) => {
    try {
      const cliente = await Clientes.findByPk(req.params.id);
      if (!cliente) return res.status(404).json({ error: 'Cliente no encontrado' });
      res.status(200).json(cliente);
    } catch (error) {
      res.status(500).json({ error: 'Error al obtener el cliente', details: error.message });
    }
  },

  // Crear un nuevo cliente
  create: async (req, res) => {
    try {
      const cliente = await Clientes.create(req.body);
      res.status(201).json(cliente);
    } catch (error) {
      res.status(400).json({ error: 'Error al crear el cliente', details: error.message });
    }
  },

  // Actualizar un cliente
  update: async (req, res) => {
    try {
      const cliente = await Clientes.findByPk(req.params.id);
      if (!cliente) return res.status(404).json({ error: 'Cliente no encontrado' });

      await cliente.update(req.body);
      res.status(200).json(cliente);
    } catch (error) {
      res.status(400).json({ error: 'Error al actualizar el cliente', details: error.message });
    }
  },

  // Eliminar un cliente
  delete: async (req, res) => {
    try {
      const cliente = await Clientes.findByPk(req.params.id);
      if (!cliente) return res.status(404).json({ error: 'Cliente no encontrado' });

      await cliente.destroy();
      res.status(204).send();
    } catch (error) {
      res.status(500).json({ error: 'Error al eliminar el cliente', details: error.message });
    }
  },
};

module.exports = clientesController;

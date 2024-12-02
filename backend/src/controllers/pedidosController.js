// src/controllers/pedidosController.js
const Pedidos = require('../models/Pedidos');
const Clientes = require('../models/Clientes');
const Direccions = require('../models/Direccions');

const pedidosController = {
  // Obtener todos los pedidos
  getAll: async (req, res) => {
    try {
      const pedidos = await Pedidos.findAll({
        include: [
          { model: Clientes, attributes: ['name', 'lastName', 'email'] },
          { model: Direccions, attributes: ['direction'] },
        ],
      });
      res.status(200).json(pedidos);
    } catch (error) {
      res.status(500).json({ error: 'Error al obtener los pedidos', details: error.message });
    }
  },

  // Obtener un pedido por ID
  getById: async (req, res) => {
    try {
      const pedido = await Pedidos.findByPk(req.params.id, {
        include: [
          { model: Clientes, attributes: ['name', 'lastName', 'email'] },
          { model: Direccions, attributes: ['direction'] },
        ],
      });
      if (!pedido) return res.status(404).json({ error: 'Pedido no encontrado' });
      res.status(200).json(pedido);
    } catch (error) {
      res.status(500).json({ error: 'Error al obtener el pedido', details: error.message });
    }
  },

  // Crear un nuevo pedido
  create: async (req, res) => {
    try {
      const { client_id, direction_id, sub_total, date, hour, total, status } = req.body;
      const pedido = await Pedidos.create({
        client_id,
        direction_id,
        sub_total,
        date,
        hour,
        total,
        status,
      });
      res.status(201).json(pedido);
    } catch (error) {
      res.status(400).json({ error: 'Error al crear el pedido', details: error.message });
    }
  },

  // Actualizar un pedido
  update: async (req, res) => {
    try {
      const pedido = await Pedidos.findByPk(req.params.id);
      if (!pedido) return res.status(404).json({ error: 'Pedido no encontrado' });

      await pedido.update(req.body);
      res.status(200).json(pedido);
    } catch (error) {
      res.status(400).json({ error: 'Error al actualizar el pedido', details: error.message });
    }
  },

  // Eliminar un pedido
  delete: async (req, res) => {
    try {
      const pedido = await Pedidos.findByPk(req.params.id);
      if (!pedido) return res.status(404).json({ error: 'Pedido no encontrado' });

      await pedido.destroy();
      res.status(204).send();
    } catch (error) {
      res.status(500).json({ error: 'Error al eliminar el pedido', details: error.message });
    }
  },
};

module.exports = pedidosController;

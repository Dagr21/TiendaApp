// src/middlewares/validatePedidos.js
const { body, validationResult } = require('express-validator');

const validatePedidos = [
  body('client_id').notEmpty().withMessage('El ID del cliente es obligatorio').isInt().withMessage('Debe ser un número entero'),
  body('direction_id').notEmpty().withMessage('El ID de la dirección es obligatorio').isInt().withMessage('Debe ser un número entero'),
  body('sub_total').notEmpty().withMessage('El subtotal es obligatorio').isFloat({ min: 0 }).withMessage('Debe ser un número positivo'),
  body('date').notEmpty().withMessage('La fecha es obligatoria').isDate().withMessage('Debe ser una fecha válida'),
  body('hour').notEmpty().withMessage('La hora es obligatoria').matches(/^([0-1]?[0-9]|2[0-3]):[0-5][0-9]$/).withMessage('Debe ser una hora válida (HH:mm)'),
  body('total').notEmpty().withMessage('El total es obligatorio').isFloat({ min: 0 }).withMessage('Debe ser un número positivo'),
  body('status').notEmpty().withMessage('El estado es obligatorio'),

  (req, res, next) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ errors: errors.array() });
    }
    next();
  },
];

module.exports = validatePedidos;

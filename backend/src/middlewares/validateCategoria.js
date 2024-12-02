// src/middlewares/validateCategoria.js
const { body, validationResult } = require('express-validator');

const validateCategoria = [
  body('name').notEmpty().withMessage('El nombre es obligatorio'),
  body('trade_id').isInt().withMessage('El trade_id debe ser un número entero'),

  (req, res, next) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ errors: errors.array() });
    }
    next();
  },
];

module.exports = validateCategoria;

// src/middlewares/validateClientes.js
const { body, validationResult } = require('express-validator');

const validateClientes = [
  body('name').notEmpty().withMessage('El nombre es obligatorio'),
  body('lastName').notEmpty().withMessage('El apellido es obligatorio'),
  body('email').isEmail().withMessage('El email debe ser válido'),
  body('password').isLength({ min: 6 }).withMessage('La contraseña debe tener al menos 6 caracteres'),

  (req, res, next) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ errors: errors.array() });
    }
    next();
  },
];

module.exports = validateClientes;

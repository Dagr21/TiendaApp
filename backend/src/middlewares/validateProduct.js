// src/middlewares/validateProduct.js
const { body, validationResult } = require('express-validator');

const validateProduct = [
  body('name').notEmpty().withMessage('El nombre es obligatorio'),
  body('price').isDecimal().withMessage('El precio debe ser un número decimal'),
  body('category_id').isInt().withMessage('El ID de categoría debe ser un número entero'),

  (req, res, next) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ errors: errors.array() });
    }
    next();
  },
];

module.exports = validateProduct;

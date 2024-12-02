// src/server.js
const app = require('./app'); // Importamos el archivo app.js
const sequelize = require('./database'); // Conexión de Sequelize

require('dotenv').config(); // Carga de variables de entorno

// Conexión a la base de datos y sincronización de modelos
sequelize.authenticate() // Usamos authenticate para verificar la conexión
  .then(() => {
    console.log('Conexión exitosa a la base de datos');
    return sequelize.sync({ force: false }); // Sincronización sin eliminar tablas
  })
  .then(() => {
    console.log('Base de datos sincronizada');
  })
  .catch((error) => {
    console.error('Error al conectar/sincronizar la base de datos:', error);
  });

// Iniciar el servidor
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`Servidor corriendo en http://localhost:${PORT}`);
});

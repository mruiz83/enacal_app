const mysql = require('mysql2');

// Configura tu conexión
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'Admin123',
  database: 'enacal_app',
  port: 3306
});

// Conectar
db.connect((err) => {
  if (err) {
    console.error('❌ Error conectando a la base de datos:', err);
  } else {
    console.log('✅ Conexión exitosa a la base de datos MySQL!');
  }
});

module.exports = db;


const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const db = require('./db'); // conexión a MySQL
const path = require('path');


const app = express();
const PORT = 3000;

// Middlewares
app.use(cors());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// Servir archivos estáticos (HTML, CSS, JS, imágenes)
app.use(express.static(path.join(__dirname, 'public')));


// ✅ Ruta para obtener todos los usuarios
app.get('/usuarios', (req, res) => {
  db.query('SELECT * FROM usuarios', (err, results) => {
    if (err) {
      console.error('❌ Error al obtener usuarios:', err);
      return res.status(500).json({ message: 'Error en el servidor' });
    }
    res.json(results);
  });
});

// ✅ Ruta para registrar un nuevo usuario
app.post('/register', (req, res) => {
  console.log('Datos recibidos del formulario:', req.body); // Depuración

  const {
    nombre1,
    nombre2,
    apellido1,
    apellido2,
    telefono1,
    telefono2,
    direccion,
    correo,
    nic,
    tipoid,
    numeroid,
    contrasena
  } = req.body;

  // Validación simple: asegurarse que los campos obligatorios no estén vacíos
  if (!nombre1 || !apellido1 || !telefono1 || !direccion || !correo || !nic || !tipoid || !numeroid || !contrasena) {
    return res.status(400).json({ message: '❌ Faltan campos obligatorios' });
  }

  const query = `
    INSERT INTO usuarios 
    (nombre1, nombre2, apellido1, apellido2,
     telefono1, telefono2, direccion, correo, nic,
     tipoid, numeroid, contrasena, Fecha_Registro)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())
  `;

  const valores = [
    nombre1, nombre2, apellido1, apellido2,
    telefono1, telefono2, direccion, correo, nic,
    tipoid, numeroid, contrasena
  ];

  console.log('Query:', query);
  console.log('Valores a insertar:', valores);

  db.query(query, valores, (err, result) => {
    if (err) {
      console.error('❌ Error al registrar usuario:', err);
      return res.status(500).json({ message: 'Error en el servidor' });
    }

    console.log('✅ Usuario registrado con éxito. ID:', result.insertId);
    res.json({ message: '✅ Usuario registrado con éxito', userId: result.insertId });
  });
});


// Ruta para login
app.post('/login', (req, res) => {
  const { usuario, password } = req.body;

  // Buscar por correo o NIC
  const query = `
    SELECT * FROM usuarios 
    WHERE (correo = ? OR nic = ?) AND contrasena = ?
  `;
  db.query(query, [usuario, usuario, password], (err, results) => {
    if (err) {
      console.error('❌ Error en login:', err);
      return res.status(500).json({ success: false, message: 'Error en el servidor' });
    }

    if (results.length > 0) {
      res.json({ success: true, message: 'Login exitoso', user: results[0] });
    } else {
      res.json({ success: false, message: 'Usuario o contraseña incorrectos' });
    }
  });
});


// Obtener departamentos
app.get('/departamentos', (req, res) => {
  db.query('SELECT * FROM departamentos', (err, results) => {
    if (err) return res.status(500).json({ error: err });
    res.json(results);
  });
});

// Obtener municipios por departamento
app.get('/municipios/:id_departamento', (req, res) => {
  const { id_departamento } = req.params;
  db.query(
    'SELECT * FROM municipios WHERE id_departamento = ?',
    [id_departamento],
    (err, results) => {
      if (err) return res.status(500).json({ error: err });
      res.json(results);
    }
  );
});

// Obtener distritos por municipio (solo aplica a Managua)
app.get('/distritos/:id_municipio', (req, res) => {
  const { id_municipio } = req.params;
  db.query(
    'SELECT * FROM distritos WHERE id_municipio = ?',
    [id_municipio],
    (err, results) => {
      if (err) return res.status(500).json({ error: err });
      res.json(results);
    }
  );
});




// ✅ Ruta para registrar avería manual
app.post('/registro-averia-manual', (req, res) => {
  const {
    tipo_averia,
    id_departamento,
    id_municipio,
    id_distrito,   // solo si es Managua
    comarca,       // opcional si NO es Managua
    barrio,
    direccion
  } = req.body;

  // Validación básica
  if (!tipo_averia || !id_departamento || !id_municipio || !direccion) {
    return res.status(400).json({ success: false, message: '❌ Faltan campos obligatorios' });
  }

  const query = `
    INSERT INTO averias 
    (tipo_averia, id_departamento, id_municipio, id_distrito, comarca, barrio, direccion, fecha_registro)
    VALUES (?, ?, ?, ?, ?, ?, ?, NOW())
  `;

  const valores = [
    tipo_averia,
    id_departamento,
    id_municipio,
    id_distrito || null,
    comarca || null,
    barrio || null,
    direccion
  ];

  db.query(query, valores, (err, result) => {
    if (err) {
      console.error('❌ Error al registrar avería manual:', err);
      return res.status(500).json({ success: false, message: 'Error en el servidor' });
    }

    res.json({ success: true, message: '✅ Avería registrada con éxito', id_averia: result.insertId });
  });
});



// ✅ Iniciar servidor
app.listen(PORT, () => {
  console.log(`Servidor corriendo en http://localhost:${PORT}`);
});

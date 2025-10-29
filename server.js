const express = require('express');
const bodyParser = require('body-parser');
const db = require('./db'); // tu conexión a MySQL
const cors = require('cors');
const path = require('path');
const multer = require('multer');
const upload = multer({ dest: 'uploads/' }); // carpeta donde se guardan archivos


const app = express();
const PORT = 3000;

// Middleware
app.use(cors());
app.use(bodyParser.json());
app.use(express.static(path.join(__dirname, 'public')));

// Redirigir la raíz '/' a 'inicio.html'
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'inicio.html'));
});


// RUTA REGISTRO DE USUARIO
app.post('/register', (req, res) => {
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

  // Validar campos requeridos
  if (!nombre1 || !apellido1 || !correo || !nic || !numeroid || !contrasena) {
    return res.status(400).json({ message: "Faltan datos obligatorios" });
  }

  const sql = `
    INSERT INTO usuarios 
    (nombre1, nombre2, apellido1, apellido2, telefono1, telefono2, direccion, correo, nic, tipoid, numeroid, contrasena)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
  `;

  db.query(sql, [
    nombre1, nombre2, apellido1, apellido2,
    telefono1, telefono2, direccion,
    correo, nic, tipoid, numeroid, contrasena
  ], (err, result) => {
    if (err) {
      console.error('❌ Error al registrar usuario:', err);
      return res.status(500).json({ message: 'Error al registrar usuario' });
    }

    res.json({ message: '✅ Usuario registrado con éxito' });
  });
});



// RUTA LOGIN
app.post('/login', (req, res) => {
  const { usuario, contrasena } = req.body;

  const sql = 'SELECT * FROM usuarios WHERE (correo = ? OR nic = ?) AND contrasena = ?';
  db.query(sql, [usuario, usuario, contrasena], (err, result) => {
    if (err) {
      console.error('Error en consulta login:', err);
      return res.status(500).json({ success: false, message: 'Error en el servidor' });
    }

    if (result.length > 0) {
      const u = result[0];
      // Enviamos solo los datos necesarios
      res.json({
        success: true,
        message: 'Login exitoso',
        user: {
          id_usuario: u.id_usuario,
          nombre1: u.nombre1,
          apellido1: u.apellido1,
          correo: u.correo,
          nic: u.nic
        }
      });
    } else {
      res.json({ success: false, message: 'Correo/NIC o contraseña incorrectos' });
    }
  });
});




  // Reporte manual generado
app.post('/api/averias', upload.array('evidencias'), (req, res) => {
  const { departamento, municipio, distrito, barrio, comarca, direccion, id_usuario } = req.body;

  let evidencia = null;
  if (req.files && req.files.length > 0) {
    evidencia = req.files.map(file => file.filename).join(',');
  }

  const sql = `
    INSERT INTO averias (id_departamento, id_municipio, id_distrito, barrio, comarca, direccion, evidencia, id_usuario)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?)
  `;

  db.query(
    sql,
    [departamento || null, municipio || null, distrito || null, barrio, comarca, direccion, evidencia, id_usuario || null],
    (err, result) => {
      if (err) {
        console.error("Error al registrar avería:", err);
        return res.status(500).json({ error: "Error al registrar avería" });
      }

      const id_averia = result.insertId;
      const consecutivo = id_averia.toString().padStart(5, '0');

      const sqlInfo = `
        SELECT 
          d.nombre AS departamento_nombre,
          m.nombre AS municipio_nombre,
          di.nombre AS distrito_nombre,
          u.nombre1 AS usuario_nombre,
          u.apellido1 AS usuario_apellido
        FROM averias a
        LEFT JOIN departamentos d ON a.id_departamento = d.id_departamento
        LEFT JOIN municipios m ON a.id_municipio = m.id_municipio
        LEFT JOIN distritos di ON a.id_distrito = di.id_distrito
        LEFT JOIN usuarios u ON a.id_usuario = u.id_usuario
        WHERE a.id_averia = ?
      `;

      db.query(sqlInfo, [id_averia], (err2, rows) => {
        if (err2) {
          console.error("Error consultando nombres:", err2);
          return res.json({
            id: id_averia,
            id_formateado: consecutivo,
            message: "Avería registrada con éxito (sin detalles del usuario)"
          });
        }

        const info = rows[0] || {};
        res.json({
          id: id_averia,
          id_formateado: consecutivo,
          departamento_nombre: info.departamento_nombre,
          municipio_nombre: info.municipio_nombre,
          distrito_nombre: info.distrito_nombre,
          usuario_nombre: info.usuario_nombre,
          usuario_apellido: info.usuario_apellido,
          message: "Avería registrada con éxito"
        });
      });
    }
  );
});



// RUTA: Obtener todos los departamentos
app.get('/departamentos', (req, res) => {
  const sql = "SELECT id_departamento, nombre FROM departamentos ORDER BY nombre ASC";
  db.query(sql, (err, result) => {
    if (err) {
      console.error("Error obteniendo departamentos:", err);
      return res.status(500).json({ success: false, message: "Error en el servidor" });
    }
    res.json(result);
  });
});

// RUTA: Obtener municipios por departamento
app.get('/municipios/:idDepartamento', (req, res) => {
  const { idDepartamento } = req.params;
  const sql = "SELECT id_municipio, nombre FROM municipios WHERE id_departamento = ? ORDER BY nombre ASC";
  db.query(sql, [idDepartamento], (err, result) => {
    if (err) {
      console.error("Error obteniendo municipios:", err);
      return res.status(500).json({ success: false, message: "Error en el servidor" });
    }
    res.json(result);
  });
});

// RUTA: Obtener distritos por municipio
app.get('/distritos/:idMunicipio', (req, res) => {
  const { idMunicipio } = req.params;
  const sql = "SELECT id_distrito, nombre FROM distritos WHERE id_municipio = ? ORDER BY nombre ASC";
  db.query(sql, [idMunicipio], (err, result) => {
    if (err) {
      console.error("Error obteniendo distritos:", err);
      return res.status(500).json({ success: false, message: "Error en el servidor" });
    }
    res.json(result);
  });
});


// Guardar avería desde GPS
app.post("/api/averias/gps", upload.array("evidencias"), (req, res) => {
  const { latitud, longitud, direccion, tipo_averia, id_usuario } = req.body;

  const evidencia = req.files && req.files.length > 0
    ? req.files.map(f => f.filename).join(",")
    : null;

  const sql = `
    INSERT INTO averias 
    (tipo_averia, id_departamento, id_municipio, id_distrito, comarca, barrio, direccion, latitud, longitud, evidencia, fecha_registro, id_usuario)
    VALUES (?, NULL, NULL, NULL, NULL, NULL, ?, ?, ?, ?, NOW(), ?)
  `;

  db.query(sql, [tipo_averia, direccion, latitud, longitud, evidencia, id_usuario || null], (err, result) => {
    if (err) {
      console.error("❌ Error al registrar avería GPS:", err);
      return res.status(500).json({ error: "Error al registrar avería GPS" });
    }

    const id_averia = result.insertId;
    const id_formateado = id_averia.toString().padStart(5, "0");

    // Consultar detalles adicionales incluyendo usuario
    const sqlInfo = `
      SELECT 
        a.id_averia,
        a.tipo_averia,
        a.latitud,
        a.longitud,
        a.direccion,
        a.evidencia,
        u.nombre1 AS usuario_nombre,
        u.apellido1 AS usuario_apellido
      FROM averias a
      LEFT JOIN usuarios u ON a.id_usuario = u.id_usuario
      WHERE a.id_averia = ?
    `;

    db.query(sqlInfo, [id_averia], (err2, rows) => {
      if (err2) {
        console.error("⚠️ Error consultando información:", err2);
        return res.json({
          id_averia,
          id_formateado,
          tipo_averia,
          latitud,
          longitud,
          direccion,
          evidencia,
          message: "Avería registrada (sin datos del usuario)"
        });
      }

      const info = rows[0] || {};
      res.json({
        id_averia,
        id_formateado,
        tipo_averia: info.tipo_averia,
        latitud: info.latitud,
        longitud: info.longitud,
        direccion: info.direccion,
        evidencia: info.evidencia,
        usuario_nombre: info.usuario_nombre,
        usuario_apellido: info.usuario_apellido,
        message: "✅ Avería GPS registrada con éxito"
      });
    });
  });
});

// Obtener historial de averías de un usuario
app.get('/api/averias/usuario/:id', (req, res) => {
  const { id } = req.params;

  // Validar que sea un número entero
  if (!/^\d+$/.test(id)) {
    return res.status(400).json({ error: 'ID de usuario inválido' });
  }

  const sql = `
    SELECT 
      a.id_averia,
      LPAD(a.id_averia, 5, '0') AS id_formateado,
      a.tipo_averia,
      a.direccion,
      a.latitud,
      a.longitud,
      a.evidencia,
      a.fecha_registro,
      d.nombre AS departamento,
      m.nombre AS municipio,
      di.nombre AS distrito,
      a.barrio,
      a.comarca
    FROM averias a
    LEFT JOIN departamentos d ON a.id_departamento = d.id_departamento
    LEFT JOIN municipios m ON a.id_municipio = m.id_municipio
    LEFT JOIN distritos di ON a.id_distrito = di.id_distrito
    WHERE a.id_usuario = ?
    ORDER BY a.fecha_registro DESC
  `;

  db.query(sql, [id], (err, results) => {
    if (err) {
      console.error('Error al obtener historial:', err);
      return res.status(500).json({ error: 'Error en el servidor' });
    }
    res.json(results);
  });
});

// Nueva ruta: estadísticas del usuario
app.get('/api/estadisticas/:id', (req, res) => {
  const { id } = req.params;
  if (!/^\d+$/.test(id)) {
    return res.status(400).json({ error: 'ID inválido' });
  }

  // 1. Estadísticas por tipo
  const sqlTipo = `
    SELECT tipo_averia, COUNT(*) as total
    FROM averias 
    WHERE id_usuario = ?
    GROUP BY tipo_averia
  `;

  // 2. Estadísticas por mes
  const sqlMes = `
    SELECT 
      MONTH(fecha_registro) as mes_num,
      MONTHNAME(fecha_registro) as mes_nombre,
      COUNT(*) as total
    FROM averias 
    WHERE id_usuario = ?
    GROUP BY mes_num, mes_nombre
    ORDER BY mes_num
  `;

  db.query(sqlTipo, [id], (err1, tipoData) => {
    if (err1) {
      console.error('Error tipo:', err1);
      return res.status(500).json({ error: 'Error en estadísticas' });
    }

    db.query(sqlMes, [id], (err2, mesData) => {
      if (err2) {
        console.error('Error mes:', err2);
        return res.status(500).json({ error: 'Error en estadísticas' });
      }

      // Mapear nombres de mes a abreviaturas en español
      const meses = {
        1: 'Ene', 2: 'Feb', 3: 'Mar', 4: 'Abr',
        5: 'May', 6: 'Jun', 7: 'Jul', 8: 'Ago',
        9: 'Sep', 10: 'Oct', 11: 'Nov', 12: 'Dic'
      };

      const mesLabels = mesData.map(row => meses[row.mes_num] || row.mes_nombre.substring(0,3));
      const mesTotales = mesData.map(row => row.total);

      res.json({
        porTipo: tipoData,
        porMes: {
          labels: mesLabels,
          data: mesTotales
        }
      });
    });
  });
});


// Iniciar servidor
app.listen(PORT, () => {
  console.log(`🚀 Servidor corriendo en http://localhost:${PORT}`);
});

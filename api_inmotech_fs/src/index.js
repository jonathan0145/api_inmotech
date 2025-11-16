// const express = require('express');
// const cors = require('cors');
// const path = require('path');
// const sequelize = require('../config/database');
// const allRoutes = require('./routes/index');

// const app = express();

// // Configurar CORS para permitir peticiones desde el frontend
// app.use(cors({ origin: 'http://localhost:3001' }));

// app.use(express.json());

// app.use(
//   '/assets/images/inmuebles',
//   express.static(
//     path.resolve(__dirname, '../../plataforma/src/assets/images/inmuebles')
//   )
// );

// app.use(
//   '/assets/images/sobrenosotros',
//   express.static(
//     path.resolve(__dirname, '../../plataforma/src/assets/images/sobrenosotros')
//   )
// );

// app.use(
//   '/assets/images/carrusel',
//   express.static(
//     path.resolve(__dirname, '../../plataforma/src/assets/images/carrusel')
//   )
// );

// // console.log('Sirviendo imágenes desde:', path.resolve(__dirname, '../../plataforma/src/assets/images/sobrenosotros'));

// app.use('/', allRoutes);

// const PORT = process.env.PORT || 3000;
// app.listen(PORT, async () => {
//   try {
//     await sequelize.authenticate();
//     console.log('¡Conexión a la base de datos establecida!');
//     console.log(`Servidor ejecutándose en el puerto ${PORT}`);
//   } catch (error) {
//     console.error('No se pudo conectar a la base de datos:', error);
//   }
// });

const express = require('express');
const cors = require('cors');
const path = require('path');
const sequelize = require('../config/database');
const allRoutes = require('./routes/index');

const app = express();

// Detectar ambiente
const isDevelopment = process.env.NODE_ENV === 'development';

//? Configuración CORS para desarrollo (localhost)
if (isDevelopment) {
  app.use(
    cors({
      origin: ['http://localhost:3001', 'http://127.0.0.1:3001'],
      credentials: true,
      methods: ['GET', 'POST', 'PUT', 'DELETE', 'PATCH', 'OPTIONS'], // ← AGREGAR PATCH
      allowedHeaders: ['Content-Type', 'Authorization', 'X-Requested-With'],
    })
  );
  console.log('🔧 Modo desarrollo: CORS configurado para localhost');
} else {
  //? Configuración CORS para producción/red local (cualquier IP)
  app.use(
    cors({
      origin: true, // Permitir cualquier origen
      credentials: true,
      methods: ['GET', 'POST', 'PUT', 'DELETE', 'PATCH', 'OPTIONS'], // ← AGREGAR PATCH
      allowedHeaders: ['Content-Type', 'Authorization', 'X-Requested-With'],
    })
  );
  console.log('🌐 Modo producción: CORS configurado para red local');
}

app.use(express.json());

// Todas las rutas estáticas de imágenes que tenías originalmente
app.use(
  '/assets/images/inmuebles',
  express.static(
    path.resolve(__dirname, '../../plataforma/src/assets/images/inmuebles')
  )
);

app.use(
  '/assets/images/sobrenosotros',
  express.static(
    path.resolve(__dirname, '../../plataforma/src/assets/images/sobrenosotros')
  )
);

app.use(
  '/assets/images/carrusel',
  express.static(
    path.resolve(__dirname, '../../plataforma/src/assets/images/carrusel')
  )
);

// Todas las rutas de tu API
app.use('/', allRoutes);

// Ruta de prueba para verificar conectividad
app.get('/api/test', (req, res) => {
  res.json({
    message: 'API funcionando correctamente',
    timestamp: new Date().toISOString(),
    environment: process.env.NODE_ENV || 'production',
    mode: isDevelopment ? 'development' : 'production',
  });
});

const PORT = process.env.PORT || 3000;

//? Configuración de host para desarrollo (localhost)
if (isDevelopment) {
  app.listen(PORT, 'localhost', async () => {
    try {
      await sequelize.authenticate();
      console.log('✅ ¡Conexión a la base de datos establecida!');
      console.log(`🚀 Servidor ejecutándose en DESARROLLO:`);
      console.log(`   - URL: http://localhost:${PORT}`);
      console.log(`   - Ambiente: ${process.env.NODE_ENV}`);
      console.log('📁 Rutas estáticas configuradas para imágenes');
    } catch (error) {
      console.error('❌ No se pudo conectar a la base de datos:', error);
    }
  });
} else {
  //? Configuración de host para producción/red local (todas las IPs)
  app.listen(PORT, '0.0.0.0', async () => {
    try {
      await sequelize.authenticate();
      console.log('✅ ¡Conexión a la base de datos establecida!');
      console.log(`🚀 Servidor ejecutándose en RED LOCAL:`);
      console.log(`   - Local: http://localhost:${PORT}`);
      console.log(`   - Red: http://${process.env.HOST || '10.1.195.182'}:${PORT}`);
      console.log(`   - Ambiente: ${process.env.NODE_ENV || 'production'}`);
      console.log('📁 Rutas estáticas configuradas para imágenes');
    } catch (error) {
      console.error('❌ No se pudo conectar a la base de datos:', error);
    }
  });
}
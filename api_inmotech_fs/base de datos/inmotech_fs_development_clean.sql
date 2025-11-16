-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-11-2025 a las 20:18:28
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `inmotech_fs_development`
--
CREATE DATABASE IF NOT EXISTS `inmotech_fs_development` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `inmotech_fs_development`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acerca_edificacion`
--

DROP TABLE IF EXISTS `acerca_edificacion`;
CREATE TABLE `acerca_edificacion` (
  `Acerca_edificacion_id` int(11) NOT NULL,
  `AcercaDeLaEdificacion` varchar(100) NOT NULL,
  `Estrato` int(11) NOT NULL,
  `Tipo_construccion` varchar(50) DEFAULT NULL,
  `Anio_construccion` int(11) DEFAULT NULL,
  `Estado_conservacion` varchar(30) DEFAULT NULL,
  `Zona_comun` tinyint(1) DEFAULT 0,
  `Descripcion_adicional` varchar(255) DEFAULT NULL,
  `Created_at` datetime DEFAULT current_timestamp(),
  `Updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `acerca_edificacion`:
--

--
-- Truncar tablas antes de insertar `acerca_edificacion`
--

TRUNCATE TABLE `acerca_edificacion`;
--
-- Volcado de datos para la tabla `acerca_edificacion`
--

INSERT INTO `acerca_edificacion` (`Acerca_edificacion_id`, `AcercaDeLaEdificacion`, `Estrato`, `Tipo_construccion`, `Anio_construccion`, `Estado_conservacion`, `Zona_comun`, `Descripcion_adicional`, `Created_at`, `Updated_at`) VALUES
(1, 'Edificio de Apartamentos Residencial', 2, 'Residencial', 2025, 'Excelente', 1, 'Cuenta con piscina, gimnasio y salones sociales.', '2025-09-02 16:18:25', '2025-10-03 19:13:09'),
(5, 'Edificio moderno', 3, 'Concreto', 2020, 'Excelente', 0, 'Edificio nuevo', '2025-10-01 13:18:02', '2025-10-01 13:18:02'),
(6, 'edificatio', 4, 'dsad', 2024, '4', 1, 'asasfasfdf', '2025-10-01 18:37:17', '2025-10-03 12:46:17'),
(7, 'Edificio de Apartamentos Residencial', 2, 'dsad', 2024, '852', 3, '852', '2025-10-01 19:52:57', '2025-10-01 19:52:57'),
(8, '9999', 9, '999', 999, '9', 9, '9', '2025-10-02 20:06:20', '2025-10-02 20:06:20'),
(9, '888', 8, '888', 888, '888', 8, '888', '2025-10-02 20:42:59', '2025-10-02 20:42:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignacion`
--

DROP TABLE IF EXISTS `asignacion`;
CREATE TABLE `asignacion` (
  `Asignacion_id` int(11) NOT NULL,
  `Parqueaderos_asignados` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`Parqueaderos_asignados`)),
  `Organizacion_parqueadero_FK` int(11) NOT NULL,
  `Disponible` tinyint(1) DEFAULT 1,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Created_at` datetime DEFAULT current_timestamp(),
  `Updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `asignacion`:
--   `Organizacion_parqueadero_FK`
--       `organizacion_parqueadero` -> `Organizacion_parqueadero_id`
--

--
-- Truncar tablas antes de insertar `asignacion`
--

TRUNCATE TABLE `asignacion`;
--
-- Volcado de datos para la tabla `asignacion`
--

INSERT INTO `asignacion` (`Asignacion_id`, `Parqueaderos_asignados`, `Organizacion_parqueadero_FK`, `Disponible`, `Descripcion`, `Created_at`, `Updated_at`) VALUES
(1, '[\"A101\",\"A102\"]', 1, 1, 'Parqueaderos asignados al apto 101 y 102 en la Org. 1', '2025-09-02 16:18:25', '2025-10-03 19:13:09'),
(7, '[\"P-1\"]', 7, 0, 'Un parqueadero', '2025-10-01 13:18:01', '2025-10-01 13:18:01'),
(8, '\"[\\\"A101\\\",\\\"A102\\\"]\"', 8, 1, 'asxc', '2025-10-01 18:37:18', '2025-10-03 12:46:17'),
(9, '\"[\\\"A101\\\", \\\"A102\\\"]\"', 9, 1, 'asxc', '2025-10-01 19:52:57', '2025-10-01 19:52:57'),
(10, '\"[\\\"A101\\\", \\\"A102\\\"]\"', 8, 1, 'Parqueaderos asignados al apto 101 y 102 en la Org. 1', '2025-10-02 20:06:20', '2025-10-02 20:06:20'),
(11, '\"[\\\"A101\\\", \\\"A102\\\"]\"', 10, 1, '888', '2025-10-02 20:42:59', '2025-10-02 20:42:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `barrio`
--

DROP TABLE IF EXISTS `barrio`;
CREATE TABLE `barrio` (
  `Barrio_id` int(11) NOT NULL,
  `Nombre_barrio` varchar(100) DEFAULT NULL,
  `Created_at` datetime DEFAULT current_timestamp(),
  `Updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `barrio`:
--

--
-- Truncar tablas antes de insertar `barrio`
--

TRUNCATE TABLE `barrio`;
--
-- Volcado de datos para la tabla `barrio`
--

INSERT INTO `barrio` (`Barrio_id`, `Nombre_barrio`, `Created_at`, `Updated_at`) VALUES
(1, 'Autopista Norte', '2025-09-02 16:18:25', '2025-09-02 16:18:25'),
(3, '9999', '2025-10-02 20:06:20', '2025-10-02 20:06:20'),
(9, '888', '2025-10-02 20:42:58', '2025-10-02 20:42:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `barrio_ciudad_corregimiento_vereda`
--

DROP TABLE IF EXISTS `barrio_ciudad_corregimiento_vereda`;
CREATE TABLE `barrio_ciudad_corregimiento_vereda` (
  `Barrio_ciudad_corregimiento_vereda_id` int(11) NOT NULL,
  `Barrio_FK` int(11) DEFAULT NULL,
  `Ciudad_FK` int(11) DEFAULT NULL,
  `Corregimiento_FK` int(11) DEFAULT NULL,
  `Vereda_Fk` int(11) DEFAULT NULL,
  `Activo` tinyint(1) DEFAULT 1,
  `Created_at` datetime DEFAULT current_timestamp(),
  `Updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `barrio_ciudad_corregimiento_vereda`:
--   `Barrio_FK`
--       `barrio` -> `Barrio_id`
--   `Ciudad_FK`
--       `ciudad` -> `Ciudad_id`
--   `Corregimiento_FK`
--       `corregimiento` -> `Corregimiento_id`
--   `Vereda_Fk`
--       `vereda` -> `Vereda_id`
--

--
-- Truncar tablas antes de insertar `barrio_ciudad_corregimiento_vereda`
--

TRUNCATE TABLE `barrio_ciudad_corregimiento_vereda`;
--
-- Volcado de datos para la tabla `barrio_ciudad_corregimiento_vereda`
--

INSERT INTO `barrio_ciudad_corregimiento_vereda` (`Barrio_ciudad_corregimiento_vereda_id`, `Barrio_FK`, `Ciudad_FK`, `Corregimiento_FK`, `Vereda_Fk`, `Activo`, `Created_at`, `Updated_at`) VALUES
(1, 3, NULL, NULL, NULL, 1, '2025-10-02 20:06:20', '2025-10-02 20:06:20'),
(2, 9, 5, 4, 3, 1, '2025-10-02 20:42:58', '2025-10-02 20:42:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrusel`
--

DROP TABLE IF EXISTS `carrusel`;
CREATE TABLE `carrusel` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `imagen_url` varchar(500) NOT NULL,
  `orden` int(11) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `fecha_actualizacion` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `carrusel`:
--

--
-- Truncar tablas antes de insertar `carrusel`
--

TRUNCATE TABLE `carrusel`;
--
-- Volcado de datos para la tabla `carrusel`
--

INSERT INTO `carrusel` (`id`, `titulo`, `descripcion`, `imagen_url`, `orden`, `activo`, `fecha_creacion`, `fecha_actualizacion`) VALUES
(1, 'cualquiera', 'esto es una descripcion cualquiera', '/assets/images/carrusel/1758402833501-206877642.jpg', 1, 1, '2025-09-20 21:13:54', '2025-09-20 21:13:54'),
(2, 'otro cualquiera', 'con otra descripcion cualquiera', '/assets/images/carrusel/1758402871417-92197877.png', 2, 1, '2025-09-20 21:14:31', '2025-09-20 21:14:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
CREATE TABLE `ciudad` (
  `Ciudad_id` int(11) NOT NULL,
  `Ciudad` varchar(50) NOT NULL,
  `Municipio_FK` int(11) DEFAULT NULL,
  `Activo` tinyint(1) DEFAULT 1,
  `Created_at` datetime DEFAULT current_timestamp(),
  `Updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `ciudad`:
--   `Municipio_FK`
--       `municipio` -> `Municipio_id`
--

--
-- Truncar tablas antes de insertar `ciudad`
--

TRUNCATE TABLE `ciudad`;
--
-- Volcado de datos para la tabla `ciudad`
--

INSERT INTO `ciudad` (`Ciudad_id`, `Ciudad`, `Municipio_FK`, `Activo`, `Created_at`, `Updated_at`) VALUES
(1, '9999', NULL, 1, '2025-10-02 20:06:20', '2025-10-02 20:06:20'),
(5, '888', 7, 1, '2025-10-02 20:42:58', '2025-10-02 20:42:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacto`
--

DROP TABLE IF EXISTS `contacto`;
CREATE TABLE `contacto` (
  `id` int(11) NOT NULL,
  `platform_user_id` int(11) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `asunto` varchar(150) DEFAULT NULL,
  `mensaje` text NOT NULL,
  `rol_contacto` varchar(50) DEFAULT NULL,
  `leido` tinyint(1) DEFAULT 0,
  `respuesta` text DEFAULT NULL,
  `fecha_envio` datetime DEFAULT current_timestamp(),
  `fecha_respuesta` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `contacto`:
--   `platform_user_id`
--       `platform_user` -> `Platform_user_id`
--

--
-- Truncar tablas antes de insertar `contacto`
--

TRUNCATE TABLE `contacto`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `corregimiento`
--

DROP TABLE IF EXISTS `corregimiento`;
CREATE TABLE `corregimiento` (
  `Corregimiento_id` int(11) NOT NULL,
  `Corregimiento` varchar(50) NOT NULL,
  `Municipio_FK` int(11) DEFAULT NULL,
  `Activo` tinyint(1) DEFAULT 1,
  `Created_at` datetime DEFAULT current_timestamp(),
  `Updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `corregimiento`:
--   `Municipio_FK`
--       `municipio` -> `Municipio_id`
--

--
-- Truncar tablas antes de insertar `corregimiento`
--

TRUNCATE TABLE `corregimiento`;
--
-- Volcado de datos para la tabla `corregimiento`
--

INSERT INTO `corregimiento` (`Corregimiento_id`, `Corregimiento`, `Municipio_FK`, `Activo`, `Created_at`, `Updated_at`) VALUES
(1, '9999', NULL, 1, '2025-10-02 20:06:20', '2025-10-02 20:06:20'),
(4, '888', 7, 1, '2025-10-02 20:42:58', '2025-10-02 20:42:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `designador_cardinal`
--

DROP TABLE IF EXISTS `designador_cardinal`;
CREATE TABLE `designador_cardinal` (
  `Designador_cardinal_id` int(11) NOT NULL,
  `Cardinalidad` varchar(10) NOT NULL,
  `Abreviacion` varchar(10) NOT NULL,
  `Activo` tinyint(1) DEFAULT 1,
  `Created_at` datetime DEFAULT current_timestamp(),
  `Updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `designador_cardinal`:
--

--
-- Truncar tablas antes de insertar `designador_cardinal`
--

TRUNCATE TABLE `designador_cardinal`;
--
-- Volcado de datos para la tabla `designador_cardinal`
--

INSERT INTO `designador_cardinal` (`Designador_cardinal_id`, `Cardinalidad`, `Abreviacion`, `Activo`, `Created_at`, `Updated_at`) VALUES
(1, 'Norte', 'N', 1, '2025-09-02 16:18:25', '2025-09-02 16:18:25'),
(6, 'este', 'e', 1, '2025-10-02 20:06:20', '2025-10-02 20:06:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

DROP TABLE IF EXISTS `direccion`;
CREATE TABLE `direccion` (
  `Direccion_id` int(11) NOT NULL,
  `Direccion` varchar(255) NOT NULL,
  `Tipo_via` varchar(255) NOT NULL,
  `Numero_via_principal` int(11) NOT NULL,
  `Numero_calle_transversal` int(11) NOT NULL,
  `Numero_edificacion` int(11) NOT NULL,
  `Descripcion_adicional` varchar(50) NOT NULL,
  `Designador_cardinal_FK` int(11) DEFAULT NULL,
  `Localizacion_FK` int(11) DEFAULT NULL,
  `Barrio_ciudad_corregimiento_vereda_FK` int(11) DEFAULT NULL,
  `Activo` tinyint(1) DEFAULT 1,
  `Created_at` datetime DEFAULT current_timestamp(),
  `Updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `direccion`:
--   `Barrio_ciudad_corregimiento_vereda_FK`
--       `barrio_ciudad_corregimiento_vereda` -> `Barrio_ciudad_corregimiento_vereda_id`
--   `Designador_cardinal_FK`
--       `designador_cardinal` -> `Designador_cardinal_id`
--   `Localizacion_FK`
--       `localizacion` -> `Localizacion_id`
--

--
-- Truncar tablas antes de insertar `direccion`
--

TRUNCATE TABLE `direccion`;
--
-- Volcado de datos para la tabla `direccion`
--

INSERT INTO `direccion` (`Direccion_id`, `Direccion`, `Tipo_via`, `Numero_via_principal`, `Numero_calle_transversal`, `Numero_edificacion`, `Descripcion_adicional`, `Designador_cardinal_FK`, `Localizacion_FK`, `Barrio_ciudad_corregimiento_vereda_FK`, `Activo`, `Created_at`, `Updated_at`) VALUES
(1, 'Calle 123 #45-67', 'Calle', 123, 45, 67, 'Apto 101', 1, 1, NULL, 1, '2025-09-02 16:18:25', '2025-10-03 19:13:09'),
(9, 'Calle 50 # 20-10', 'Calle', 50, 20, 10, 'Edificio principal', NULL, 11, NULL, 1, '2025-10-01 13:18:01', '2025-10-01 13:18:01'),
(10, '123', '123', 123, 123, 121, '123', NULL, 12, NULL, 1, '2025-10-01 18:20:06', '2025-10-01 18:20:06'),
(11, '567', '567', 567, 567, 567, '567', NULL, 13, NULL, 1, '2025-10-01 18:28:49', '2025-10-01 18:28:49'),
(12, '890', '890', 890, 890, 890, '890', 1, 14, NULL, 1, '2025-10-01 18:37:17', '2025-10-03 12:46:17'),
(13, '852', '852', 852, 852, 852, '852', NULL, 15, NULL, 1, '2025-10-01 19:52:57', '2025-10-01 19:52:57'),
(14, '9999', '9999', 9999, 9999, 9999, '9999', 6, 17, NULL, 1, '2025-10-02 20:06:20', '2025-10-02 20:06:20'),
(15, '888', '888', 888, 888, 888, '888', 6, 18, 2, 1, '2025-10-02 20:42:59', '2025-10-02 20:42:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `division`
--

DROP TABLE IF EXISTS `division`;
CREATE TABLE `division` (
  `Division_id` int(11) NOT NULL,
  `Division` varchar(50) NOT NULL,
  `Balcon` varchar(2) NOT NULL DEFAULT 'No',
  `Baños` int(11) NOT NULL,
  `Terraza` int(11) NOT NULL,
  `Habitaciones` tinyint(4) NOT NULL,
  `Garaje` int(11) NOT NULL,
  `Ascensores` varchar(2) NOT NULL,
  `Area` varchar(10) NOT NULL,
  `Closets` int(11) DEFAULT NULL,
  `Estudio` tinyint(1) DEFAULT 0,
  `Sala` tinyint(1) DEFAULT 1,
  `Comedor` tinyint(1) DEFAULT 1,
  `Cocina` varchar(30) DEFAULT NULL,
  `Zona_lavanderia` tinyint(1) DEFAULT 0,
  `Deposito` tinyint(1) DEFAULT 0,
  `Descripcion_adicional` varchar(255) DEFAULT NULL,
  `Created_at` datetime DEFAULT current_timestamp(),
  `Updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `division`:
--

--
-- Truncar tablas antes de insertar `division`
--

TRUNCATE TABLE `division`;
--
-- Volcado de datos para la tabla `division`
--

INSERT INTO `division` (`Division_id`, `Division`, `Balcon`, `Baños`, `Terraza`, `Habitaciones`, `Garaje`, `Ascensores`, `Area`, `Closets`, `Estudio`, `Sala`, `Comedor`, `Cocina`, `Zona_lavanderia`, `Deposito`, `Descripcion_adicional`, `Created_at`, `Updated_at`) VALUES
(1, 'Apartamento Grande', 'Si', 3, 1, 3, 3, 'Si', '120', 5, 1, 1, 1, 'Integral', 1, 1, 'Amplio apartamento con vista a la ciudad', '2025-09-02 16:18:25', '2025-10-03 19:13:09'),
(6, 'Apartamento', 'Si', 2, 0, 3, 0, '1', '120', 2, 0, 0, 0, 'Si', 0, 0, 'Distribución moderna', '2025-10-01 13:18:01', '2025-10-01 13:18:01'),
(7, '1', '1', 1, 1, 1, 1, '1', '120', 1, 1, 1, 1, '1', 1, 1, 'asd', '2025-10-01 18:37:17', '2025-10-03 12:46:17'),
(8, '1', '1', 1, 1, 1, 1, '1', '121', 1, 1, 1, 1, '1', 1, 1, '123', '2025-10-01 19:52:57', '2025-10-01 19:52:57'),
(9, '9999', '1', 1, 1, 1, 1, '1', '999', 1, 1, 1, 1, '1', 1, 1, '9999', '2025-10-02 20:06:20', '2025-10-02 20:06:20'),
(10, '888', '1', 1, 1, 1, 1, '1', '888', 1, 1, 1, 1, '1', 1, 1, 'asasfasfdf', '2025-10-02 20:42:59', '2025-10-02 20:42:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_pago`
--

DROP TABLE IF EXISTS `estado_pago`;
CREATE TABLE `estado_pago` (
  `Estado_pago_id` int(10) NOT NULL,
  `Estado_pago` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `estado_pago`:
--

--
-- Truncar tablas antes de insertar `estado_pago`
--

TRUNCATE TABLE `estado_pago`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

DROP TABLE IF EXISTS `factura`;
CREATE TABLE `factura` (
  `Factura_id` int(10) NOT NULL,
  `Factura_NO` int(10) NOT NULL,
  `Nit_Vendedor` varchar(20) NOT NULL,
  `Nit_Adquiriente` varchar(20) NOT NULL,
  `FechaEmision` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Resolucion_factura_FK` int(10) NOT NULL,
  `Impuesto_valor_fk` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `factura`:
--   `Impuesto_valor_fk`
--       `impuesto_valor` -> `Impuesto_valor_id`
--   `Resolucion_factura_FK`
--       `resolucion_factura` -> `Resolucion_factura_id`
--

--
-- Truncar tablas antes de insertar `factura`
--

TRUNCATE TABLE `factura`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenes_inmueble`
--

DROP TABLE IF EXISTS `imagenes_inmueble`;
CREATE TABLE `imagenes_inmueble` (
  `Imagenes_inmueble_id` int(11) NOT NULL,
  `Imagenes` varchar(255) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `URL` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `imagenes_inmueble`:
--

--
-- Truncar tablas antes de insertar `imagenes_inmueble`
--

TRUNCATE TABLE `imagenes_inmueble`;
--
-- Volcado de datos para la tabla `imagenes_inmueble`
--

INSERT INTO `imagenes_inmueble` (`Imagenes_inmueble_id`, `Imagenes`, `Nombre`, `URL`) VALUES
(1, '1756829554683-wallpaperbetter12.jpg', 'wallpaperbetter12.jpg', 'http://localhost:3000/assets/images/inmuebles/1756829554683-wallpaperbetter12.jpg'),
(2, '1756829562330-wallpaperbetter.com_1920x1080 (1).jpg', 'wallpaperbetter.com_1920x1080 (1).jpg', 'http://localhost:3000/assets/images/inmuebles/1756829562330-wallpaperbetter.com_1920x1080 (1).jpg'),
(6, 'test_imagen.jpg', 'Imagen de prueba', 'http://localhost:3000/assets/images/inmuebles/test_imagen.jpg'),
(7, '1759327642915-pxfuel (2).jpg', 'pxfuel (2).jpg', 'http://192.168.20.21:3000/assets/images/inmuebles/1759327642915-pxfuel (2).jpg'),
(8, '1759327643262-pxfuel (3).jpg', 'pxfuel (3).jpg', 'http://192.168.20.21:3000/assets/images/inmuebles/1759327643262-pxfuel (3).jpg'),
(9, '1759343074151-pxfuel (3).jpg', 'pxfuel (3).jpg', 'http://192.168.20.21:3000/assets/images/inmuebles/1759343074151-pxfuel (3).jpg'),
(10, '1759343601603-pxfuel (1).jpg', 'pxfuel (1).jpg', 'http://192.168.20.21:3000/assets/images/inmuebles/1759343601603-pxfuel (1).jpg'),
(11, '1759348197796-caballo.jpg', 'caballo.jpg', 'http://192.168.20.21:3000/assets/images/inmuebles/1759348197796-caballo.jpg'),
(12, '1759348197784-Gemini_Generated_Image_7t1t7p7t1t7p7t1t (1).png', 'Gemini_Generated_Image_7t1t7p7t1t7p7t1t (1).png', 'http://192.168.20.21:3000/assets/images/inmuebles/1759348197784-Gemini_Generated_Image_7t1t7p7t1t7p7t1t (1).png'),
(13, '1759348197752-Gemini_Generated_Image_7t1t7p7t1t7p7t1t (2).png', 'Gemini_Generated_Image_7t1t7p7t1t7p7t1t (2).png', 'http://192.168.20.21:3000/assets/images/inmuebles/1759348197752-Gemini_Generated_Image_7t1t7p7t1t7p7t1t (2).png'),
(14, '1759348197806-Gemini_Generated_Image_7t1t7p7t1t7p7t1t.png', 'Gemini_Generated_Image_7t1t7p7t1t7p7t1t.png', 'http://192.168.20.21:3000/assets/images/inmuebles/1759348197806-Gemini_Generated_Image_7t1t7p7t1t7p7t1t.png'),
(15, '1759434891704-wallpaperbetter.com_1920x1080 (1).jpg', 'wallpaperbetter.com_1920x1080 (1).jpg', 'http://192.168.20.21:3000/assets/images/inmuebles/1759434891704-wallpaperbetter.com_1920x1080 (1).jpg'),
(16, '1759434891713-wallpaperbetter12.jpg', 'wallpaperbetter12.jpg', 'http://192.168.20.21:3000/assets/images/inmuebles/1759434891713-wallpaperbetter12.jpg'),
(17, '1759436322976-Gemini_Generated_Image_7t1t7p7t1t7p7t1t (1).png', 'Gemini_Generated_Image_7t1t7p7t1t7p7t1t (1).png', 'http://192.168.20.21:3000/assets/images/inmuebles/1759436322976-Gemini_Generated_Image_7t1t7p7t1t7p7t1t (1).png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `impuesto`
--

DROP TABLE IF EXISTS `impuesto`;
CREATE TABLE `impuesto` (
  `Impuesto_id` int(10) NOT NULL,
  `impuesto` varchar(20) NOT NULL,
  `TipodeImpuesto` int(10) DEFAULT NULL,
  `Porcentaje` int(10) DEFAULT NULL,
  `Column` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `impuesto`:
--

--
-- Truncar tablas antes de insertar `impuesto`
--

TRUNCATE TABLE `impuesto`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `impuesto_valor`
--

DROP TABLE IF EXISTS `impuesto_valor`;
CREATE TABLE `impuesto_valor` (
  `Impuesto_valor_id` int(10) NOT NULL,
  `Valor_FK` int(10) DEFAULT NULL,
  `Retenedor_iva_FK` int(10) DEFAULT NULL,
  `Impuesto_FK` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `impuesto_valor`:
--   `Impuesto_FK`
--       `impuesto` -> `Impuesto_id`
--   `Retenedor_iva_FK`
--       `retenedor_iva` -> `Retenedor_IVA_id`
--   `Valor_FK`
--       `valor` -> `Valor_id`
--

--
-- Truncar tablas antes de insertar `impuesto_valor`
--

TRUNCATE TABLE `impuesto_valor`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inmueble`
--

DROP TABLE IF EXISTS `inmueble`;
CREATE TABLE `inmueble` (
  `Inmueble_id` int(11) NOT NULL,
  `Valor` int(11) NOT NULL,
  `Area` int(11) NOT NULL,
  `Descripcion_General` varchar(255) NOT NULL,
  `Antiguedad` int(11) NOT NULL,
  `Motivo_VoA` varchar(100) NOT NULL,
  `Situacion_inmueble` varchar(50) NOT NULL,
  `Tipo_edificacion_FK` int(11) NOT NULL,
  `Otras_caracteristicas_FK` int(11) NOT NULL,
  `Acerca_edificacion_FK` int(11) NOT NULL,
  `Division_FK` int(11) NOT NULL,
  `Imagenes_inmueble_FK` int(11) NOT NULL,
  `Codigo_interno` varchar(30) DEFAULT NULL,
  `Estado` varchar(20) DEFAULT 'disponible',
  `Fecha_publicacion` datetime DEFAULT current_timestamp(),
  `Fecha_actualizacion` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Visitas` int(11) DEFAULT 0,
  `Observaciones` varchar(255) DEFAULT NULL,
  `Platform_user_FK` int(11) NOT NULL,
  `Direccion_FK` int(11) DEFAULT NULL,
  `favorito` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `inmueble`:
--   `Acerca_edificacion_FK`
--       `acerca_edificacion` -> `Acerca_edificacion_id`
--   `Direccion_FK`
--       `direccion` -> `Direccion_id`
--   `Division_FK`
--       `division` -> `Division_id`
--   `Imagenes_inmueble_FK`
--       `imagenes_inmueble` -> `Imagenes_inmueble_id`
--   `Otras_caracteristicas_FK`
--       `otras_caracteristicas` -> `Otras_caracteristicas_id`
--   `Platform_user_FK`
--       `platform_user` -> `Platform_user_id`
--   `Tipo_edificacion_FK`
--       `tipo_edificacion` -> `Tipo_edificacion_id`
--

--
-- Truncar tablas antes de insertar `inmueble`
--

TRUNCATE TABLE `inmueble`;
--
-- Volcado de datos para la tabla `inmueble`
--

INSERT INTO `inmueble` (`Inmueble_id`, `Valor`, `Area`, `Descripcion_General`, `Antiguedad`, `Motivo_VoA`, `Situacion_inmueble`, `Tipo_edificacion_FK`, `Otras_caracteristicas_FK`, `Acerca_edificacion_FK`, `Division_FK`, `Imagenes_inmueble_FK`, `Codigo_interno`, `Estado`, `Fecha_publicacion`, `Fecha_actualizacion`, `Visitas`, `Observaciones`, `Platform_user_FK`, `Direccion_FK`, `favorito`) VALUES
(1, 25000000, 120, 'Apartamento moderno en el centro', 5, 'Venta', 'Disponible', 1, 1, 1, 1, 1, 'APT-101', 'disponible', '2025-09-02 16:18:25', '2025-10-03 19:13:08', 0, 'Sin observaciones', 2, 1, NULL),
(4, 250000000, 120, 'Apartamento de prueba', 5, 'Venta', 'Disponible', 5, 7, 5, 6, 6, 'TEST001', 'disponible', '2025-10-01 13:18:02', '2025-10-01 08:33:20', 0, NULL, 2, 9, NULL),
(5, 890, 890, '890', 890, '890', '890', 6, 8, 6, 7, 10, '890', 'ss', '2025-10-01 18:37:18', '2025-10-03 12:46:17', 0, '890', 8, 12, NULL),
(6, 852, 852, '852', 851, '852', '852', 7, 9, 7, 8, 11, '852', 'disponible', '2025-10-01 19:52:57', '2025-10-01 19:52:57', 0, '852', 8, 13, NULL),
(7, 99999, 99999, '99999', 99, '99999', '99999', 8, 10, 8, 9, 15, '99999', 'disponible', '2025-10-02 20:06:21', '2025-10-02 20:06:21', 0, '9999', 2, 14, NULL),
(8, 888, 888, '888', 888, '888', '888', 9, 11, 9, 10, 17, '888', 'disponible', '2025-10-02 20:43:00', '2025-10-02 20:43:00', 0, '888', 2, 15, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localizacion`
--

DROP TABLE IF EXISTS `localizacion`;
CREATE TABLE `localizacion` (
  `Localizacion_id` int(11) NOT NULL,
  `Localizacion_descripcion` varchar(100) NOT NULL,
  `Latitud` decimal(10,8) DEFAULT NULL,
  `Longitud` decimal(11,8) DEFAULT NULL,
  `Activo` tinyint(1) DEFAULT 1,
  `Created_at` datetime DEFAULT current_timestamp(),
  `Updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `localizacion`:
--

--
-- Truncar tablas antes de insertar `localizacion`
--

TRUNCATE TABLE `localizacion`;
--
-- Volcado de datos para la tabla `localizacion`
--

INSERT INTO `localizacion` (`Localizacion_id`, `Localizacion_descripcion`, `Latitud`, `Longitud`, `Activo`, `Created_at`, `Updated_at`) VALUES
(1, 'Oficina Central Bogotás', 4.33600000, -74.05900000, 1, '2025-09-02 16:18:25', '2025-09-02 16:18:25'),
(11, 'Centro ciudad', 4.60000000, -74.00000000, 1, '2025-10-01 13:18:01', '2025-10-01 13:18:01'),
(12, '123', 99.99999999, 121.00000000, 1, '2025-10-01 18:20:06', '2025-10-01 18:20:06'),
(13, '567', 99.99999999, 567.00000000, 1, '2025-10-01 18:28:49', '2025-10-01 18:28:49'),
(14, '890', 99.99999999, 890.00000000, 1, '2025-10-01 18:37:17', '2025-10-01 18:37:17'),
(15, '852', 99.99999999, 852.00000000, 1, '2025-10-01 19:52:57', '2025-10-01 19:52:57'),
(17, '9999', 99.99999999, 999.99999999, 1, '2025-10-02 20:06:20', '2025-10-02 20:06:20'),
(18, '888', 99.99999999, 888.00000000, 1, '2025-10-02 20:42:59', '2025-10-02 20:42:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `module`
--

DROP TABLE IF EXISTS `module`;
CREATE TABLE `module` (
  `Module_id` int(11) NOT NULL,
  `Module_name` varchar(100) NOT NULL,
  `Module_route` varchar(255) NOT NULL,
  `Module_description` varchar(255) DEFAULT NULL,
  `Module_status` tinyint(1) DEFAULT 1,
  `Created_at` datetime DEFAULT current_timestamp(),
  `Updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `module`:
--

--
-- Truncar tablas antes de insertar `module`
--

TRUNCATE TABLE `module`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `module_role`
--

DROP TABLE IF EXISTS `module_role`;
CREATE TABLE `module_role` (
  `Module_role_id` int(11) NOT NULL,
  `Module_FK` int(11) NOT NULL,
  `Role_FK` int(11) NOT NULL,
  `Module_role_status` tinyint(1) DEFAULT 1,
  `Created_at` datetime DEFAULT current_timestamp(),
  `Updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `module_role`:
--   `Module_FK`
--       `module` -> `Module_id`
--   `Role_FK`
--       `role` -> `Role_id`
--

--
-- Truncar tablas antes de insertar `module_role`
--

TRUNCATE TABLE `module_role`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipio`
--

DROP TABLE IF EXISTS `municipio`;
CREATE TABLE `municipio` (
  `Municipio_id` int(11) NOT NULL,
  `Ndap_FK` int(11) DEFAULT NULL,
  `Municipio_nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Municipio_descripcion` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Activo` tinyint(1) DEFAULT 1,
  `Created_at` datetime DEFAULT current_timestamp(),
  `Updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `municipio`:
--   `Ndap_FK`
--       `ndap` -> `Ndap_id`
--

--
-- Truncar tablas antes de insertar `municipio`
--

TRUNCATE TABLE `municipio`;
--
-- Volcado de datos para la tabla `municipio`
--

INSERT INTO `municipio` (`Municipio_id`, `Ndap_FK`, `Municipio_nombre`, `Municipio_descripcion`, `Activo`, `Created_at`, `Updated_at`) VALUES
(1, 9, '9999', '9999', 1, '2025-10-02 20:06:20', '2025-10-02 20:06:20'),
(7, 16, '888', '888', 1, '2025-10-02 20:42:58', '2025-10-02 20:42:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ndap`
--

DROP TABLE IF EXISTS `ndap`;
CREATE TABLE `ndap` (
  `Ndap_id` int(11) NOT NULL,
  `Ndap_descripcion` varchar(50) NOT NULL,
  `Activo` tinyint(1) DEFAULT 1,
  `Created_at` datetime DEFAULT current_timestamp(),
  `Updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `ndap`:
--

--
-- Truncar tablas antes de insertar `ndap`
--

TRUNCATE TABLE `ndap`;
--
-- Volcado de datos para la tabla `ndap`
--

INSERT INTO `ndap` (`Ndap_id`, `Ndap_descripcion`, `Activo`, `Created_at`, `Updated_at`) VALUES
(1, 'bogota', 1, '2025-10-01 18:20:06', '2025-10-01 18:20:06'),
(2, 'pol', 1, '2025-10-01 18:28:49', '2025-10-01 18:28:49'),
(3, '890', 1, '2025-10-01 18:37:16', '2025-10-01 18:37:16'),
(4, '852', 1, '2025-10-01 19:52:57', '2025-10-01 19:52:57'),
(9, '9999', 1, '2025-10-02 20:06:19', '2025-10-02 20:06:19'),
(16, '888', 1, '2025-10-02 20:42:58', '2025-10-02 20:42:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `organizacion_parqueadero`
--

DROP TABLE IF EXISTS `organizacion_parqueadero`;
CREATE TABLE `organizacion_parqueadero` (
  `Organizacion_parqueadero_id` int(11) NOT NULL,
  `Tipo_parqueadero` varchar(30) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Cubierto` tinyint(1) DEFAULT 0,
  `Disponible` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `organizacion_parqueadero`:
--

--
-- Truncar tablas antes de insertar `organizacion_parqueadero`
--

TRUNCATE TABLE `organizacion_parqueadero`;
--
-- Volcado de datos para la tabla `organizacion_parqueadero`
--

INSERT INTO `organizacion_parqueadero` (`Organizacion_parqueadero_id`, `Tipo_parqueadero`, `Cantidad`, `Cubierto`, `Disponible`) VALUES
(1, 'Automovil', 150, 0, 20),
(7, 'Cubierto', 1, 0, 0),
(8, 'carro', 150, 1, 1),
(9, 'Automovil', 150, 1, 1),
(10, 'moto', 150, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `otras_caracteristicas`
--

DROP TABLE IF EXISTS `otras_caracteristicas`;
CREATE TABLE `otras_caracteristicas` (
  `Otras_caracteristicas_id` int(11) NOT NULL,
  `Caracteristicas_descripcion` varchar(30) NOT NULL,
  `Deposito` int(11) NOT NULL,
  `Lavanderia` tinyint(1) NOT NULL,
  `Gas` tinyint(1) NOT NULL,
  `Piso` int(11) DEFAULT NULL,
  `Mascotas_permitidas` tinyint(1) DEFAULT 0,
  `Tipo_inmueble` varchar(30) NOT NULL,
  `Amoblado` tinyint(1) DEFAULT 0,
  `Descripcion_adicional` varchar(255) DEFAULT NULL,
  `Created_at` datetime DEFAULT current_timestamp(),
  `Updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Asignacion_FK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `otras_caracteristicas`:
--   `Asignacion_FK`
--       `asignacion` -> `Asignacion_id`
--

--
-- Truncar tablas antes de insertar `otras_caracteristicas`
--

TRUNCATE TABLE `otras_caracteristicas`;
--
-- Volcado de datos para la tabla `otras_caracteristicas`
--

INSERT INTO `otras_caracteristicas` (`Otras_caracteristicas_id`, `Caracteristicas_descripcion`, `Deposito`, `Lavanderia`, `Gas`, `Piso`, `Mascotas_permitidas`, `Tipo_inmueble`, `Amoblado`, `Descripcion_adicional`, `Created_at`, `Updated_at`, `Asignacion_FK`) VALUES
(1, 'Apartamento con excelentes aca', 1, 1, 1, 5, 1, 'Apartamento', 1, 'Balcón amplio con vista a la ciudad.', '2025-09-02 16:18:25', '2025-10-03 19:13:09', 1),
(7, 'Apartamento básico', 0, 0, 0, 0, 0, 'Apartamento', 0, 'Sin muebles', '2025-10-01 13:18:01', '2025-10-01 13:18:01', 7),
(8, 'adadada', 1, 1, 1, 5, 1, 'Apartamento', 1, 'apto102', '2025-10-01 18:37:18', '2025-10-03 12:46:17', 8),
(9, '8552', 1, 1, 1, 1, 1, 'Apartamento', 1, 'asd', '2025-10-01 19:52:57', '2025-10-01 19:52:57', 9),
(10, '999', 1, 1, 1, 1, 1, 'Apartamento', 1, '999', '2025-10-02 20:06:20', '2025-10-02 20:06:20', 10),
(11, '888', 1, 1, 1, 1, 1, '1', 1, 'Sin características adicionales', '2025-10-02 20:43:00', '2025-10-02 20:43:00', 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

DROP TABLE IF EXISTS `pago`;
CREATE TABLE `pago` (
  `Pago_id` int(10) NOT NULL,
  `Referencia_transaccion` int(10) NOT NULL,
  `Fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `Fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Comentario` varchar(255) NOT NULL,
  `Fecha_pago` timestamp NOT NULL DEFAULT current_timestamp(),
  `Estado_pago_FK` int(10) DEFAULT NULL,
  `Factura_FK` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `pago`:
--   `Estado_pago_FK`
--       `estado_pago` -> `Estado_pago_id`
--   `Factura_FK`
--       `factura` -> `Factura_id`
--

--
-- Truncar tablas antes de insertar `pago`
--

TRUNCATE TABLE `pago`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permitions`
--

DROP TABLE IF EXISTS `permitions`;
CREATE TABLE `permitions` (
  `Permitions_id` int(11) NOT NULL,
  `Permitions_name` varchar(50) NOT NULL,
  `Permitions_description` varchar(255) DEFAULT NULL,
  `Permitions_status` tinyint(1) DEFAULT 1,
  `Created_at` datetime DEFAULT current_timestamp(),
  `Updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `permitions`:
--

--
-- Truncar tablas antes de insertar `permitions`
--

TRUNCATE TABLE `permitions`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permitions_module_role`
--

DROP TABLE IF EXISTS `permitions_module_role`;
CREATE TABLE `permitions_module_role` (
  `Permitions_module_role_id` int(11) NOT NULL,
  `Module_role_FK` int(11) NOT NULL,
  `Permitions_FK` int(11) NOT NULL,
  `Permitions_module_role_status` tinyint(1) DEFAULT 1,
  `Created_at` datetime DEFAULT current_timestamp(),
  `Updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `permitions_module_role`:
--   `Permitions_FK`
--       `permitions` -> `Permitions_id`
--   `Module_role_FK`
--       `module_role` -> `Module_role_id`
--

--
-- Truncar tablas antes de insertar `permitions_module_role`
--

TRUNCATE TABLE `permitions_module_role`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `platform_identity_document`
--

DROP TABLE IF EXISTS `platform_identity_document`;
CREATE TABLE `platform_identity_document` (
  `Identity_document_id` int(11) NOT NULL,
  `Document_number` varchar(30) NOT NULL,
  `Document_type` varchar(30) NOT NULL,
  `Issued_country` varchar(50) DEFAULT NULL,
  `Issued_date` date DEFAULT NULL,
  `Expiration_date` date DEFAULT NULL,
  `Platform_profile_FK` int(11) NOT NULL,
  `Created_at` datetime DEFAULT current_timestamp(),
  `Updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `platform_identity_document`:
--   `Platform_profile_FK`
--       `platform_profile` -> `Profile_id`
--

--
-- Truncar tablas antes de insertar `platform_identity_document`
--

TRUNCATE TABLE `platform_identity_document`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `platform_module`
--

DROP TABLE IF EXISTS `platform_module`;
CREATE TABLE `platform_module` (
  `Platform_module_id` int(11) NOT NULL,
  `Module_name` varchar(50) NOT NULL,
  `Module_route` varchar(100) DEFAULT NULL,
  `Module_description` varchar(255) DEFAULT NULL,
  `Module_icon` varchar(100) DEFAULT NULL,
  `Module_status` tinyint(1) DEFAULT 1,
  `Module_order` int(11) DEFAULT 0,
  `Created_at` datetime DEFAULT current_timestamp(),
  `Updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `platform_module`:
--

--
-- Truncar tablas antes de insertar `platform_module`
--

TRUNCATE TABLE `platform_module`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `platform_module_role`
--

DROP TABLE IF EXISTS `platform_module_role`;
CREATE TABLE `platform_module_role` (
  `Platform_module_role_id` int(11) NOT NULL,
  `Platform_module_FK` int(11) NOT NULL,
  `Platform_role_FK` int(11) NOT NULL,
  `Module_role_status` tinyint(1) DEFAULT 1,
  `Created_at` datetime DEFAULT current_timestamp(),
  `Updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `platform_module_role`:
--   `Platform_role_FK`
--       `platform_role` -> `Platform_role_id`
--   `Platform_module_FK`
--       `platform_module` -> `Platform_module_id`
--

--
-- Truncar tablas antes de insertar `platform_module_role`
--

TRUNCATE TABLE `platform_module_role`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `platform_permitions`
--

DROP TABLE IF EXISTS `platform_permitions`;
CREATE TABLE `platform_permitions` (
  `Platform_permitions_id` int(11) NOT NULL,
  `Permitions_name` varchar(50) NOT NULL,
  `Permitions_description` varchar(255) DEFAULT NULL,
  `Permitions_status` tinyint(1) DEFAULT 1,
  `Created_at` datetime DEFAULT current_timestamp(),
  `Updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `platform_permitions`:
--

--
-- Truncar tablas antes de insertar `platform_permitions`
--

TRUNCATE TABLE `platform_permitions`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `platform_permitions_module_role`
--

DROP TABLE IF EXISTS `platform_permitions_module_role`;
CREATE TABLE `platform_permitions_module_role` (
  `Platform_permitions_module_role_id` int(11) NOT NULL,
  `Platform_module_role_FK` int(11) NOT NULL,
  `Platform_permitions_FK` int(11) NOT NULL,
  `Permitions_module_role_status` tinyint(1) DEFAULT 1,
  `Created_at` datetime DEFAULT current_timestamp(),
  `Updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `platform_permitions_module_role`:
--   `Platform_permitions_FK`
--       `platform_permitions` -> `Platform_permitions_id`
--   `Platform_module_role_FK`
--       `platform_module_role` -> `Platform_module_role_id`
--

--
-- Truncar tablas antes de insertar `platform_permitions_module_role`
--

TRUNCATE TABLE `platform_permitions_module_role`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `platform_profile`
--

DROP TABLE IF EXISTS `platform_profile`;
CREATE TABLE `platform_profile` (
  `Profile_id` int(11) NOT NULL,
  `Profile_name` varchar(20) NOT NULL,
  `Profile_lastname` varchar(30) DEFAULT NULL,
  `Profile_phone` varchar(10) NOT NULL,
  `Profile_addres` varchar(30) NOT NULL,
  `Profile_email` varchar(30) NOT NULL,
  `Profile_photo` varchar(256) NOT NULL,
  `Profile_birthdate` date DEFAULT NULL,
  `Profile_gender` varchar(10) DEFAULT NULL,
  `Profile_national_id` varchar(20) DEFAULT NULL,
  `Profile_bio` text DEFAULT NULL,
  `Profile_website` varchar(100) DEFAULT NULL,
  `Profile_social` varchar(100) DEFAULT NULL,
  `Platform_user_FK` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `platform_profile`:
--   `Platform_user_FK`
--       `platform_user` -> `Platform_user_id`
--

--
-- Truncar tablas antes de insertar `platform_profile`
--

TRUNCATE TABLE `platform_profile`;
--
-- Volcado de datos para la tabla `platform_profile`
--

INSERT INTO `platform_profile` (`Profile_id`, `Profile_name`, `Profile_lastname`, `Profile_phone`, `Profile_addres`, `Profile_email`, `Profile_photo`, `Profile_birthdate`, `Profile_gender`, `Profile_national_id`, `Profile_bio`, `Profile_website`, `Profile_social`, `Platform_user_FK`, `createdAt`, `updatedAt`) VALUES
(1, 'jonathan ivan', 'rendon bermeo', '3216417337', 'acascac', 'jonathan_bermeo014@hotmail.com', 'https://storage.googleapis.com/inmotechalmacenamiento/1758906948844_wallpaperbetter.com_1920x1080.jpg', '1999-05-21', 'Masculino', 'Colombiano', 'sdadadadasdasd', 'https://storage.googleapis.com/inmotechalmacenamiento/1758871453008_caballo.jpg', 'https://storage.googleapis.com/inmotechalmacenamiento/1758871453008_caballo.jpg', 2, '2025-09-24 05:31:05', '2025-10-04 06:41:18'),
(2, 'asdf', 'asdasdas', '12321312', 'sadasdasd', 'asdasda@hotmail.com', 'asdsadas', '2025-09-16', 'asdsad', 'colombianos', 'asdasda', 'dsada', 'sdasdas', 3, '2025-09-24 16:11:29', '2025-09-24 16:11:36'),
(3, 'asdas', 'adasd', '234243', 'asdasd', 'asdasda@hotmail.com', 'https://storage.googleapis.com/inmotechalmacenamiento/1758901126473_pxfuel (3).jpg', '2025-09-26', 'masculino', 'colombiano', 'asdadasd', 'asdad', 'instagramer', 6, '2025-09-25 21:23:54', '2025-09-26 15:38:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `platform_role`
--

DROP TABLE IF EXISTS `platform_role`;
CREATE TABLE `platform_role` (
  `Platform_role_id` int(11) NOT NULL,
  `Role_name` varchar(50) NOT NULL,
  `Role_description` varchar(255) DEFAULT NULL,
  `Role_status` tinyint(1) DEFAULT 1,
  `Role_priority` int(11) DEFAULT 0,
  `Created_at` datetime DEFAULT current_timestamp(),
  `Updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `platform_role`:
--

--
-- Truncar tablas antes de insertar `platform_role`
--

TRUNCATE TABLE `platform_role`;
--
-- Volcado de datos para la tabla `platform_role`
--

INSERT INTO `platform_role` (`Platform_role_id`, `Role_name`, `Role_description`, `Role_status`, `Role_priority`, `Created_at`, `Updated_at`) VALUES
(1, 'administrador', 'acceso a todo', 1, 1, '2025-08-13 14:45:17', '2025-08-13 14:45:17'),
(2, 'usuario', 'puede navegar en la plataforma pero no tiene aseso a todas las funcionalidades', 1, 2, '2025-08-14 15:52:08', '2025-08-14 15:52:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `platform_user`
--

DROP TABLE IF EXISTS `platform_user`;
CREATE TABLE `platform_user` (
  `Platform_user_id` int(11) NOT NULL,
  `Username` varchar(100) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `Password` varchar(255) NOT NULL,
  `Platform_user_status_FK` int(11) NOT NULL,
  `Platform_role_FK` int(11) NOT NULL,
  `Created_at` datetime DEFAULT current_timestamp(),
  `Updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `platform_user`:
--   `Platform_user_status_FK`
--       `platform_user_status` -> `Platform_user_status_id`
--   `Platform_role_FK`
--       `platform_role` -> `Platform_role_id`
--

--
-- Truncar tablas antes de insertar `platform_user`
--

TRUNCATE TABLE `platform_user`;
--
-- Volcado de datos para la tabla `platform_user`
--

INSERT INTO `platform_user` (`Platform_user_id`, `Username`, `email`, `Password`, `Platform_user_status_FK`, `Platform_role_FK`, `Created_at`, `Updated_at`) VALUES
(2, 'jonathan0145', 'jonathan_bermeo014@hotmail.com', '$2b$10$qEQUf15CrkyGWGoDOdrorOYZ2ExfzMEIPz5M6DmgDIuEN2Yj2c6Dm', 1, 1, '2025-09-22 22:07:38', '2025-09-22 17:12:47'),
(3, 'jonathan0146', 'jonathan_bermeo0146@hotmail.com', '$2b$10$7JxhqLV/ks.vk7oRQaVC2OBi7EnssMqtN5CkwD/sVlYRX0lLUknuu', 1, 1, '2025-09-22 22:12:18', '2025-09-24 11:10:15'),
(6, 'jonathan0147', 'jonathan_bermeo026@hotmail.com', '$2b$10$bHT5fOGT1/BZcbXXpk5bYuUm3J2C9AXVfnSWCMuZo.sOdMIMamlCK', 1, 2, '2025-09-23 17:03:15', '2025-09-23 17:03:15'),
(7, 'jonathan rendon', 'jonathanivanrendonbermeo@gmail.com', '', 1, 2, '2025-09-25 17:06:05', '2025-09-25 17:06:05'),
(8, 'jonathan0123', 'jonathan_bermeo0123@hotmail.com', '$2a$10$ojRqYmSkGMGf7YXkBFJOa.5/FWLIuxsRNOdh3I5R0XITNT3f/k7yC', 1, 2, '2025-09-28 16:27:26', '2025-09-28 16:27:26'),
(9, 'jonathan0125', 'jonathan0125@hotmail.com', '$2a$10$lUDjfV8rgRrtOr4QYv8MtuXRgYlgl1/fssdy3KE8FgJkiWhLIzk7O', 1, 2, '2025-09-28 18:28:07', '2025-09-28 18:28:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `platform_user_status`
--

DROP TABLE IF EXISTS `platform_user_status`;
CREATE TABLE `platform_user_status` (
  `Platform_user_status_id` int(11) NOT NULL,
  `User_status_name` varchar(50) NOT NULL,
  `User_status_description` varchar(255) DEFAULT NULL,
  `Created_at` datetime DEFAULT current_timestamp(),
  `Updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `platform_user_status`:
--

--
-- Truncar tablas antes de insertar `platform_user_status`
--

TRUNCATE TABLE `platform_user_status`;
--
-- Volcado de datos para la tabla `platform_user_status`
--

INSERT INTO `platform_user_status` (`Platform_user_status_id`, `User_status_name`, `User_status_description`, `Created_at`, `Updated_at`) VALUES
(1, 'activo', 'esta activo', '2025-08-13 14:44:48', '2025-08-13 14:44:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `politica_de_privacidad`
--

DROP TABLE IF EXISTS `politica_de_privacidad`;
CREATE TABLE `politica_de_privacidad` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `version` varchar(20) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `fecha_actualizacion` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `activo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `politica_de_privacidad`:
--

--
-- Truncar tablas antes de insertar `politica_de_privacidad`
--

TRUNCATE TABLE `politica_de_privacidad`;
--
-- Volcado de datos para la tabla `politica_de_privacidad`
--

INSERT INTO `politica_de_privacidad` (`id`, `titulo`, `descripcion`, `version`, `fecha_creacion`, `fecha_actualizacion`, `activo`) VALUES
(1, 'ya tu sabes', 'ya tu sabe sabiendo bien sabido', '1.0', '2025-09-21 13:01:53', '2025-09-21 13:01:53', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `porque_elegirnos`
--

DROP TABLE IF EXISTS `porque_elegirnos`;
CREATE TABLE `porque_elegirnos` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `icono` varchar(255) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `fecha_actualizacion` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `porque_elegirnos`:
--

--
-- Truncar tablas antes de insertar `porque_elegirnos`
--

TRUNCATE TABLE `porque_elegirnos`;
--
-- Volcado de datos para la tabla `porque_elegirnos`
--

INSERT INTO `porque_elegirnos` (`id`, `titulo`, `descripcion`, `icono`, `orden`, `activo`, `fecha_creacion`, `fecha_actualizacion`) VALUES
(1, 'Experiencia Comprobada', 'Contamos con más de una década de trayectoria en el sector, lo que nos permite entender profundamente tus necesidades y ofrecer soluciones robustas y eficaces, avaladas por un historial de éxitos.', 'FaFacebookF', 1, 1, '2025-09-21 13:00:31', '2025-10-04 05:35:11'),
(2, 'Calidad Garantizada', 'Nuestro compromiso con la excelencia se refleja en cada detalle. Utilizamos los mejores materiales y procesos, asegurando que cada producto o servicio cumpla con los más altos estándares de calidad.', 'FaBan', 2, 1, '2025-09-30 13:26:33', '2025-10-04 05:35:57'),
(3, 'Soporte Personalizado', 'No eres solo un número para nosotros. Ofrecemos atención al cliente dedicada y personalizada, con un equipo listo para responder tus preguntas y resolver cualquier incidencia de forma rápida y eficiente.', 'FaAmazonPay', 3, 1, '2025-09-30 18:36:36', '2025-10-04 05:36:19'),
(4, 'Innovación Constante', 'Nos mantenemos a la vanguardia de las últimas tendencias y tecnologías. Invertimos continuamente en investigación y desarrollo para ofrecerte soluciones innovadoras que te mantengan un paso adelante.', 'FaBehanceSquare', 4, 1, '2025-09-30 18:36:54', '2025-10-04 05:36:42'),
(5, 'Precios Competitivos', 'Creemos que la calidad no tiene por qué ser inaccesible. Ofrecemos una excelente relación calidad-precio, asegurando que obtengas el mayor valor por tu inversión.', 'FaRegFileWord', 5, 1, '2025-09-30 18:37:26', '2025-10-04 05:38:00'),
(6, 'Equipo de Expertos', 'Nuestro equipo está compuesto por profesionales altamente cualificados y apasionados, cada uno con una especialización que contribuye a un enfoque integral y experto en cada proyecto.', 'FaBoxes', 6, 1, '2025-10-04 05:38:27', '2025-10-04 05:38:27'),
(7, 'Flexibilidad y Adaptabilidad', 'Entendemos que cada cliente es único. Nos adaptamos a tus requisitos específicos y ofrecemos soluciones flexibles y a medida para garantizar que se ajusten perfectamente a tus expectativas y necesidades.', 'FaBalanceScaleRight', 7, 1, '2025-10-04 05:39:00', '2025-10-04 05:39:00'),
(8, 'Compromiso Sostenible', 'Estamos dedicados a prácticas responsables y sostenibles. Nos esforzamos por minimizar nuestro impacto ambiental y contribuir positivamente a la comunidad en la que operamos.', 'FaLaravel', 8, 1, '2025-10-04 05:39:38', '2025-10-04 05:39:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas_frecuentes`
--

DROP TABLE IF EXISTS `preguntas_frecuentes`;
CREATE TABLE `preguntas_frecuentes` (
  `id` int(11) NOT NULL,
  `pregunta` varchar(255) NOT NULL,
  `respuesta` text NOT NULL,
  `categoria` varchar(100) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `fecha_actualizacion` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `preguntas_frecuentes`:
--

--
-- Truncar tablas antes de insertar `preguntas_frecuentes`
--

TRUNCATE TABLE `preguntas_frecuentes`;
--
-- Volcado de datos para la tabla `preguntas_frecuentes`
--

INSERT INTO `preguntas_frecuentes` (`id`, `pregunta`, `respuesta`, `categoria`, `orden`, `activo`, `fecha_creacion`, `fecha_actualizacion`) VALUES
(1, 'esto es una pregunta', 'si definitivamente es un a pregunta', 'tipo pregunta', 1, 1, '2025-09-20 21:17:02', '2025-09-20 21:17:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resolucion_factura`
--

DROP TABLE IF EXISTS `resolucion_factura`;
CREATE TABLE `resolucion_factura` (
  `Resolucion_factura_id` int(10) NOT NULL,
  `Resolucion_facturacion_NO` int(20) NOT NULL,
  `Fecha_resolucion` timestamp NOT NULL DEFAULT current_timestamp(),
  `Fecha_vencimiento` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `resolucion_factura`:
--

--
-- Truncar tablas antes de insertar `resolucion_factura`
--

TRUNCATE TABLE `resolucion_factura`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `retenedor_iva`
--

DROP TABLE IF EXISTS `retenedor_iva`;
CREATE TABLE `retenedor_iva` (
  `Retenedor_IVA_id` int(10) NOT NULL,
  `Porcentaje_retencion` decimal(5,2) NOT NULL,
  `Activo` tinyint(1) DEFAULT 1,
  `Created_at` datetime DEFAULT current_timestamp(),
  `Updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `retenedor_iva`:
--

--
-- Truncar tablas antes de insertar `retenedor_iva`
--

TRUNCATE TABLE `retenedor_iva`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `Role_id` int(11) NOT NULL,
  `Role_name` varchar(50) NOT NULL,
  `Role_description` varchar(255) DEFAULT NULL,
  `Role_status` tinyint(1) DEFAULT 1,
  `Role_priority` int(11) DEFAULT 0,
  `Created_at` datetime DEFAULT current_timestamp(),
  `Updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `role`:
--

--
-- Truncar tablas antes de insertar `role`
--

TRUNCATE TABLE `role`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sobre_nosotros`
--

DROP TABLE IF EXISTS `sobre_nosotros`;
CREATE TABLE `sobre_nosotros` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `imagen_url` varchar(500) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `fecha_actualizacion` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `activo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `sobre_nosotros`:
--

--
-- Truncar tablas antes de insertar `sobre_nosotros`
--

TRUNCATE TABLE `sobre_nosotros`;
--
-- Volcado de datos para la tabla `sobre_nosotros`
--

INSERT INTO `sobre_nosotros` (`id`, `titulo`, `descripcion`, `imagen_url`, `fecha_creacion`, `fecha_actualizacion`, `activo`) VALUES
(1, 'El Nacimiento de Inmotech: Una Solución al Desorden Inmobiliario', 'En 2018, Laura Vélez, una desarrolladora de software frustrada por la dificultad de encontrar un comprador genuino para el apartamento de su abuela, tuvo una idea. Se dio cuenta de que los grandes portales inmobiliarios estaban llenos de anuncios duplicados, propiedades que ya se habían vendido y precios desactualizados. La información era un caos, y los vendedores se sentían estafados pagando altas comisiones o suscripciones por servicios que no garantizaban una venta rápida.\n\nSu visión era simple: crear una plataforma que fuera la fuente de información inmobiliaria más limpia y actualizada del mercado. Así nació Inmotech.', '/assets/images/sobrenosotros/1758403072120-301510981.jpg', '2025-09-20 21:17:52', '2025-10-04 05:16:11', 1),
(2, 'El Modelo de Negocio Disruptivo', 'Inmotech se lanzó con un modelo de negocio audazmente sencillo, diseñado para incentivar la precisión:\n\n1. Pago por Publicación: El propietario o agente paga una tarifa plana única y muy competitiva (por ejemplo, $50 USD) para publicar su inmueble durante un período determinado (90 días o hasta que se venda).\n\n2. La Promesa de la Limpieza: El corazón del modelo era la eliminación inmediata. Cuando el inmueble se vende (o se arrienda, si eligen esa opción), el vendedor está obligado a marcar el anuncio como vendido. Si no lo hace, y Inmotech detecta que la propiedad ya no está disponible, el vendedor pierde la posibilidad de publicar otro anuncio en la plataforma. La publicación se borra de inmediato para mantener el catálogo \"fresco\".\n\nEste sistema creó un ecosistema de confianza y veracidad. Los compradores sabían que si veían un anuncio en Inmotech, era una propiedad genuinamente disponible, algo que no sucedía en la competencia.', '/assets/images/sobrenosotros/1759238706570-229568276.jpg', '2025-09-30 13:25:07', '2025-10-04 05:22:03', 1),
(3, 'Crecimiento y Desafíos', 'Los primeros años fueron difíciles. Los agentes inmobiliarios tradicionales se resistían al modelo de tarifa plana y preferían sus acuerdos de comisión. Sin embargo, los vendedores particulares y las pequeñas constructoras independientes adoptaron Inmotech rápidamente. Apreciaban el control total sobre su anuncio y el bajo costo frente a las comisiones de miles de dólares.\n\nEn 2020, la pandemia de COVID-19 resultó ser un catalizador inesperado. Con los recorridos físicos limitados, la gente se volcó a la búsqueda en línea. Laura y su equipo lanzaron una herramienta de \"Tour Virtual 3D\" integrada en la tarifa de publicación, posicionando a Inmotech como la plataforma más avanzada tecnológicamente para mostrar propiedades.\n\nEl Desafío de la Verificación\nEl mayor desafío fue asegurar que los vendedores cumplieran con la promesa de la eliminación. La solución de Inmotech fue un algoritmo llamado \"El Barredor\". Este sistema, asistido por IA, cruzaba datos de registros públicos, publicaciones en redes sociales y la actividad del propio usuario en la plataforma. Si un anuncio no recibía visitas o consultas en mucho tiempo, o si se detectaba una baja en la actividad de un vendedor después de una venta reportada, el sistema lo marcaba y un pequeño equipo humano contactaba al vendedor. Si se confirmaba la venta, el anuncio se eliminaba y el vendedor mantenía su buen score de veracidad. Si mentía, se enfrentaba a una suspensión.', '/assets/images/sobrenosotros/1759555533695-601608448.png', '2025-10-04 05:24:55', '2025-10-04 05:26:32', 1),
(4, 'Inmotech Hoy: Liderazgo en la Eficiencia', 'Hoy, Inmotech es el líder en varios mercados de América Latina, conocido por su eficiencia y su catálogo sin igual de \"inmuebles vendibles\".\n\nImpacto en el Mercado: Ha forzado a la competencia a limpiar sus propios catálogos.\n\nInnovación: Lanzaron InmoData, una herramienta que analiza los datos de los inmuebles vendidos (ya eliminados de la plataforma) para generar informes de valoración hiperprecisos para sus usuarios, cerrando el círculo de valor.\n\nLa Cultura de la Venta: Su lema es simple: \"Publica para vender, no para esperar.\"\n\nEl éxito de Inmotech no es solo tecnológico, sino un triunfo de la honestidad y la claridad en un sector a menudo opaco. Demostró que un modelo que beneficia directamente al consumidor (el comprador, al ver solo propiedades disponibles) puede ser el más rentable.\n\nLaura Vélez, aún al frente, lo resume así: \"No vendemos anuncios. Vendemos visibilidad de propiedades reales a compradores reales. Y cuando el trato se cierra, celebramos con la tecla \'Eliminar\'.\"', '/assets/images/sobrenosotros/1759555659075-522248665.png', '2025-10-04 05:27:40', '2025-10-04 05:27:40', 1),
(5, 'El Equipo y la Cultura de Inmotech', 'En Inmotech, creemos que la tecnología solo es tan buena como las personas que la crean y la mantienen. Somos un equipo apasionado por la transparencia y comprometido con hacer que encontrar (y vender) un hogar sea un proceso honesto y eficiente.\n\nLa Cultura: Más Allá del Código y los Ladrillos\nEn Inmotech, no solo construimos una plataforma; construimos una forma mejor de trabajar. Nuestra cultura se cimienta en tres pilares:\n\n1. Obsesión por la Verdad (El \"Modo Barredor\")\nLa transparencia no es solo nuestro modelo de negocio, es nuestra cultura interna. Fomentamos una comunicación abierta y la retroalimentación directa (el famoso feedback sin rodeos). Si algo no funciona o no está actualizado, lo decimos y lo arreglamos de inmediato. Esta honestidad se refleja en la limpieza de nuestro catálogo y nos obliga a mantenernos críticos y ágiles.\n\n2. Crecimiento por Proyectos, No por Horarios\nSomos una empresa orientada a resultados. Ofrecemos flexibilidad total en horarios y ubicación, confiando en que cada miembro del equipo cumplirá sus objetivos. Esto se traduce en un alto nivel de autonomía y responsabilidad, permitiendo que la gente trabaje cuando y donde sea más productiva. Promovemos el aprendizaje continuo a través de \"InmoTalks\", sesiones internas para compartir conocimientos de software, mercado o diseño.\n\n3. El Compromiso con el Primer Hogar\nExiste un profundo respeto por la misión en Inmotech: facilitar la compra de un hogar. Patrocinamos programas de educación financiera para millennials que compran su primera propiedad y dedicamos un día al mes a actividades de voluntariado centradas en el desarrollo de vivienda asequible. Nuestro objetivo no es solo eliminar anuncios; es facilitar sueños y recordamos a menudo el impacto social de nuestro trabajo.', '/assets/images/sobrenosotros/1759555858651-414099987.png', '2025-10-04 05:31:00', '2025-10-04 05:31:00', 1),
(6, 'El Diferenciador y la Confianza', 'Nuestra Propuesta de Valor Única (PVU): La Limpieza de Datos\nLo que realmente hace que Inmotech sea diferente es la Obsesión por la Verdad. Mientras otros portales ganan dinero por la cantidad de anuncios, nosotros ganamos confianza por la calidad y la precisión de la información.\n\nEl Vendedor nos elige porque:\n\nCosto-Efectividad: Pagan una tarifa plana y única muy baja, garantizando que su dinero se invierte en una audiencia de compradores serios que no están cansados de ver anuncios falsos o caducados.\n\nVisibilidad Genuina: Los compradores no tienen que \"filtrar\" la basura. Esto significa que los listados en Inmotech reciben una mayor atención de compradores con intención real de compra, acelerando la venta.\n\nEl Comprador nos elige porque:\n\nGarantía de Disponibilidad: Nuestro modelo de eliminación forzada por venta asegura que, si lo ves en Inmotech, está disponible. Esto elimina la frustración de contactar a un agente solo para descubrir que la propiedad se vendió hace seis meses.\n\nDatos de Precios Reales: Al obligar a la eliminación, nuestro sistema puede generar un índice de precios basado en las propiedades realmente vendidas (y no solo publicadas), ofreciendo a los compradores y vendedores los datos de valoración más precisos del mercado.\n\nSomos el único portal que premia a los vendedores por eliminar su anuncio rápidamente.', '/assets/images/sobrenosotros/1759555980156-21565666.jpg', '2025-10-04 05:33:02', '2025-10-04 05:33:02', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suscripcion`
--

DROP TABLE IF EXISTS `suscripcion`;
CREATE TABLE `suscripcion` (
  `Suscripcion_id` int(10) NOT NULL,
  `Platform_user_FK` int(11) NOT NULL,
  `Suscripcion_fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Suscripcion_tipo` varchar(20) NOT NULL,
  `Suscripcion_descripcion` varchar(200) NOT NULL,
  `Suscripcion_duracion` varchar(15) NOT NULL,
  `Factura_FK` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `suscripcion`:
--   `Platform_user_FK`
--       `platform_user` -> `Platform_user_id`
--   `Factura_FK`
--       `factura` -> `Factura_id`
--

--
-- Truncar tablas antes de insertar `suscripcion`
--

TRUNCATE TABLE `suscripcion`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `terminos_y_condiciones`
--

DROP TABLE IF EXISTS `terminos_y_condiciones`;
CREATE TABLE `terminos_y_condiciones` (
  `Terminos_id` int(11) NOT NULL,
  `Titulo` varchar(255) NOT NULL,
  `Descripcion` text NOT NULL,
  `Fecha_creacion` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `terminos_y_condiciones`:
--

--
-- Truncar tablas antes de insertar `terminos_y_condiciones`
--

TRUNCATE TABLE `terminos_y_condiciones`;
--
-- Volcado de datos para la tabla `terminos_y_condiciones`
--

INSERT INTO `terminos_y_condiciones` (`Terminos_id`, `Titulo`, `Descripcion`, `Fecha_creacion`) VALUES
(1, 'asdfh', 'asdfhasdasdfhasdfhasdfhasdfhasdfhasdfhasdfhasdfhasdfhasdfhasdfhasdfhasdfhasdfhasdfhasdfhasdfhasdfhasdfhasdfhasdfhfhasdfhasdfhasdfh', '2025-09-20 21:21:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_edificacion`
--

DROP TABLE IF EXISTS `tipo_edificacion`;
CREATE TABLE `tipo_edificacion` (
  `Tipo_edificacion_id` int(11) NOT NULL,
  `Tipo_edificacion_categoria` varchar(50) DEFAULT NULL,
  `Tipo_edificacion_descripcion` varchar(50) NOT NULL,
  `Tipo_edificacion_niveles` int(11) DEFAULT NULL,
  `Tipo_edificacion_activo` tinyint(1) DEFAULT 1,
  `Created_at` datetime DEFAULT current_timestamp(),
  `Updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `tipo_edificacion`:
--

--
-- Truncar tablas antes de insertar `tipo_edificacion`
--

TRUNCATE TABLE `tipo_edificacion`;
--
-- Volcado de datos para la tabla `tipo_edificacion`
--

INSERT INTO `tipo_edificacion` (`Tipo_edificacion_id`, `Tipo_edificacion_categoria`, `Tipo_edificacion_descripcion`, `Tipo_edificacion_niveles`, `Tipo_edificacion_activo`, `Created_at`, `Updated_at`) VALUES
(1, 'Residencial', 'Apartamento en edificio de propiedad horizontal', 15, 1, '2025-09-02 16:18:25', '2025-10-03 19:13:09'),
(5, 'Residencial', 'Apartamento', NULL, 1, '2025-10-01 13:18:02', '2025-10-01 13:18:02'),
(6, 'Residencial', 'Apartamento', 5, 1, '2025-10-01 18:37:17', '2025-10-03 12:46:17'),
(7, '1', 'Apartamento en edificio de propiedad horizontal', 8, 1, '2025-10-01 19:52:57', '2025-10-01 19:52:57'),
(8, '9', '9', 9, 1, '2025-10-02 20:06:20', '2025-10-02 20:06:20'),
(9, '888', '888', 8, 1, '2025-10-02 20:42:59', '2025-10-02 20:42:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `User_id` int(11) NOT NULL,
  `User_user` varchar(100) NOT NULL,
  `User_password` varchar(255) NOT NULL,
  `User_status_FK` int(11) NOT NULL,
  `Role_FK` int(11) NOT NULL,
  `Created_at` datetime DEFAULT current_timestamp(),
  `Updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `users`:
--   `User_status_FK`
--       `user_status` -> `User_status_id`
--   `Role_FK`
--       `role` -> `Role_id`
--

--
-- Truncar tablas antes de insertar `users`
--

TRUNCATE TABLE `users`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_favoritos`
--

DROP TABLE IF EXISTS `user_favoritos`;
CREATE TABLE `user_favoritos` (
  `User_favorito_id` int(11) NOT NULL,
  `Platform_user_FK` int(11) NOT NULL,
  `Inmueble_FK` int(11) NOT NULL,
  `Fecha_agregado` datetime DEFAULT current_timestamp(),
  `Activo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `user_favoritos`:
--   `Platform_user_FK`
--       `platform_user` -> `Platform_user_id`
--   `Inmueble_FK`
--       `inmueble` -> `Inmueble_id`
--

--
-- Truncar tablas antes de insertar `user_favoritos`
--

TRUNCATE TABLE `user_favoritos`;
--
-- Volcado de datos para la tabla `user_favoritos`
--

INSERT INTO `user_favoritos` (`User_favorito_id`, `Platform_user_FK`, `Inmueble_FK`, `Fecha_agregado`, `Activo`) VALUES
(1, 8, 8, '2025-10-03 18:47:24', 1),
(2, 8, 7, '2025-10-03 18:54:12', 1),
(3, 2, 4, '2025-10-03 20:28:57', 0),
(4, 2, 6, '2025-10-03 19:48:37', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_status`
--

DROP TABLE IF EXISTS `user_status`;
CREATE TABLE `user_status` (
  `User_status_id` int(11) NOT NULL,
  `User_status_name` varchar(50) NOT NULL,
  `User_status_description` varchar(255) DEFAULT NULL,
  `Created_at` datetime DEFAULT current_timestamp(),
  `Updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `user_status`:
--

--
-- Truncar tablas antes de insertar `user_status`
--

TRUNCATE TABLE `user_status`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `valor`
--

DROP TABLE IF EXISTS `valor`;
CREATE TABLE `valor` (
  `Valor_id` int(11) NOT NULL,
  `Monto_IVA` decimal(19,0) NOT NULL,
  `Valor_neto` decimal(19,0) NOT NULL,
  `Valor_Total` decimal(19,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `valor`:
--

--
-- Truncar tablas antes de insertar `valor`
--

TRUNCATE TABLE `valor`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vereda`
--

DROP TABLE IF EXISTS `vereda`;
CREATE TABLE `vereda` (
  `Vereda_id` int(11) NOT NULL,
  `Vereda_nombre` varchar(50) NOT NULL,
  `Municipio_FK` int(11) DEFAULT NULL,
  `Activo` tinyint(1) DEFAULT 1,
  `Created_at` datetime DEFAULT current_timestamp(),
  `Updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `vereda`:
--   `Municipio_FK`
--       `municipio` -> `Municipio_id`
--

--
-- Truncar tablas antes de insertar `vereda`
--

TRUNCATE TABLE `vereda`;
--
-- Volcado de datos para la tabla `vereda`
--

INSERT INTO `vereda` (`Vereda_id`, `Vereda_nombre`, `Municipio_FK`, `Activo`, `Created_at`, `Updated_at`) VALUES
(1, '9999', NULL, 1, '2025-10-02 20:06:20', '2025-10-02 20:06:20'),
(3, '888', 7, 1, '2025-10-02 20:42:58', '2025-10-02 20:42:58');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acerca_edificacion`
--
ALTER TABLE `acerca_edificacion`
  ADD PRIMARY KEY (`Acerca_edificacion_id`);

--
-- Indices de la tabla `asignacion`
--
ALTER TABLE `asignacion`
  ADD PRIMARY KEY (`Asignacion_id`),
  ADD KEY `Organizacion_parqueadero_FK_2` (`Organizacion_parqueadero_FK`);

--
-- Indices de la tabla `barrio`
--
ALTER TABLE `barrio`
  ADD PRIMARY KEY (`Barrio_id`);

--
-- Indices de la tabla `barrio_ciudad_corregimiento_vereda`
--
ALTER TABLE `barrio_ciudad_corregimiento_vereda`
  ADD PRIMARY KEY (`Barrio_ciudad_corregimiento_vereda_id`),
  ADD KEY `bccv_barrio_fk` (`Barrio_FK`),
  ADD KEY `bccv_ciudad_fk` (`Ciudad_FK`),
  ADD KEY `bccv_corregimiento_fk` (`Corregimiento_FK`),
  ADD KEY `bccv_vereda_fk` (`Vereda_Fk`);

--
-- Indices de la tabla `carrusel`
--
ALTER TABLE `carrusel`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`Ciudad_id`),
  ADD KEY `ciudad_municipio_fk` (`Municipio_FK`);

--
-- Indices de la tabla `contacto`
--
ALTER TABLE `contacto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `platform_user_id` (`platform_user_id`);

--
-- Indices de la tabla `corregimiento`
--
ALTER TABLE `corregimiento`
  ADD PRIMARY KEY (`Corregimiento_id`),
  ADD KEY `corregimiento_municipio_fk` (`Municipio_FK`);

--
-- Indices de la tabla `designador_cardinal`
--
ALTER TABLE `designador_cardinal`
  ADD PRIMARY KEY (`Designador_cardinal_id`);

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`Direccion_id`),
  ADD KEY `direccion_bccv_fk` (`Barrio_ciudad_corregimiento_vereda_FK`),
  ADD KEY `direccion_designador_cardinal_fk` (`Designador_cardinal_FK`),
  ADD KEY `direccion_localizacion_fk` (`Localizacion_FK`);

--
-- Indices de la tabla `division`
--
ALTER TABLE `division`
  ADD PRIMARY KEY (`Division_id`);

--
-- Indices de la tabla `estado_pago`
--
ALTER TABLE `estado_pago`
  ADD PRIMARY KEY (`Estado_pago_id`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`Factura_id`),
  ADD KEY `factura_resolucion_factura_fk` (`Resolucion_factura_FK`),
  ADD KEY `factura_impuesto_valor_fk` (`Impuesto_valor_fk`);

--
-- Indices de la tabla `imagenes_inmueble`
--
ALTER TABLE `imagenes_inmueble`
  ADD PRIMARY KEY (`Imagenes_inmueble_id`);

--
-- Indices de la tabla `impuesto`
--
ALTER TABLE `impuesto`
  ADD PRIMARY KEY (`Impuesto_id`);

--
-- Indices de la tabla `impuesto_valor`
--
ALTER TABLE `impuesto_valor`
  ADD PRIMARY KEY (`Impuesto_valor_id`),
  ADD KEY `impuesto_valor_valor_fk` (`Valor_FK`),
  ADD KEY `impuesto_valor_impuesto_fk` (`Impuesto_FK`),
  ADD KEY `impuesto_valor_retenedor_iva_fk` (`Retenedor_iva_FK`);

--
-- Indices de la tabla `inmueble`
--
ALTER TABLE `inmueble`
  ADD PRIMARY KEY (`Inmueble_id`),
  ADD UNIQUE KEY `Tipo_edificacion_FK` (`Tipo_edificacion_FK`),
  ADD UNIQUE KEY `Otras_caracteristicas_FK` (`Otras_caracteristicas_FK`),
  ADD UNIQUE KEY `Acerca_edificacion_FK` (`Acerca_edificacion_FK`),
  ADD UNIQUE KEY `Division_FK` (`Division_FK`),
  ADD UNIQUE KEY `Imagenes_inmueble_FK` (`Imagenes_inmueble_FK`),
  ADD KEY `inmueble_direccion_fk` (`Direccion_FK`),
  ADD KEY `inmueble_platform_user_fk` (`Platform_user_FK`);

--
-- Indices de la tabla `localizacion`
--
ALTER TABLE `localizacion`
  ADD PRIMARY KEY (`Localizacion_id`);

--
-- Indices de la tabla `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`Module_id`);

--
-- Indices de la tabla `module_role`
--
ALTER TABLE `module_role`
  ADD PRIMARY KEY (`Module_role_id`),
  ADD KEY `module_role_module_fk` (`Module_FK`),
  ADD KEY `module_role_role_fk` (`Role_FK`);

--
-- Indices de la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD PRIMARY KEY (`Municipio_id`),
  ADD KEY `municipio_ndap_fk` (`Ndap_FK`);

--
-- Indices de la tabla `ndap`
--
ALTER TABLE `ndap`
  ADD PRIMARY KEY (`Ndap_id`);

--
-- Indices de la tabla `organizacion_parqueadero`
--
ALTER TABLE `organizacion_parqueadero`
  ADD PRIMARY KEY (`Organizacion_parqueadero_id`);

--
-- Indices de la tabla `otras_caracteristicas`
--
ALTER TABLE `otras_caracteristicas`
  ADD PRIMARY KEY (`Otras_caracteristicas_id`),
  ADD UNIQUE KEY `Asignacion_FK` (`Asignacion_FK`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`Pago_id`),
  ADD KEY `pago_estado_pago_fk` (`Estado_pago_FK`),
  ADD KEY `pago_factura_fk` (`Factura_FK`);

--
-- Indices de la tabla `permitions`
--
ALTER TABLE `permitions`
  ADD PRIMARY KEY (`Permitions_id`);

--
-- Indices de la tabla `permitions_module_role`
--
ALTER TABLE `permitions_module_role`
  ADD PRIMARY KEY (`Permitions_module_role_id`),
  ADD KEY `permitions_module_role_module_role_fk` (`Module_role_FK`),
  ADD KEY `permitions_module_role_permitions_fk` (`Permitions_FK`);

--
-- Indices de la tabla `platform_identity_document`
--
ALTER TABLE `platform_identity_document`
  ADD PRIMARY KEY (`Identity_document_id`),
  ADD UNIQUE KEY `Platform_profile_FK` (`Platform_profile_FK`);

--
-- Indices de la tabla `platform_module`
--
ALTER TABLE `platform_module`
  ADD PRIMARY KEY (`Platform_module_id`);

--
-- Indices de la tabla `platform_module_role`
--
ALTER TABLE `platform_module_role`
  ADD PRIMARY KEY (`Platform_module_role_id`),
  ADD KEY `platform_module_role_module_fk` (`Platform_module_FK`),
  ADD KEY `platform_module_role_role_fk` (`Platform_role_FK`);

--
-- Indices de la tabla `platform_permitions`
--
ALTER TABLE `platform_permitions`
  ADD PRIMARY KEY (`Platform_permitions_id`);

--
-- Indices de la tabla `platform_permitions_module_role`
--
ALTER TABLE `platform_permitions_module_role`
  ADD PRIMARY KEY (`Platform_permitions_module_role_id`),
  ADD KEY `platform_permitions_module_role_module_role_fk` (`Platform_module_role_FK`),
  ADD KEY `platform_permitions_module_role_permitions_fk` (`Platform_permitions_FK`);

--
-- Indices de la tabla `platform_profile`
--
ALTER TABLE `platform_profile`
  ADD PRIMARY KEY (`Profile_id`),
  ADD UNIQUE KEY `Platform_user_FK` (`Platform_user_FK`);

--
-- Indices de la tabla `platform_role`
--
ALTER TABLE `platform_role`
  ADD PRIMARY KEY (`Platform_role_id`);

--
-- Indices de la tabla `platform_user`
--
ALTER TABLE `platform_user`
  ADD PRIMARY KEY (`Platform_user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `platform_user_status_fk` (`Platform_user_status_FK`),
  ADD KEY `platform_user_role_fk` (`Platform_role_FK`);

--
-- Indices de la tabla `platform_user_status`
--
ALTER TABLE `platform_user_status`
  ADD PRIMARY KEY (`Platform_user_status_id`);

--
-- Indices de la tabla `politica_de_privacidad`
--
ALTER TABLE `politica_de_privacidad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `porque_elegirnos`
--
ALTER TABLE `porque_elegirnos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `preguntas_frecuentes`
--
ALTER TABLE `preguntas_frecuentes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `resolucion_factura`
--
ALTER TABLE `resolucion_factura`
  ADD PRIMARY KEY (`Resolucion_factura_id`);

--
-- Indices de la tabla `retenedor_iva`
--
ALTER TABLE `retenedor_iva`
  ADD PRIMARY KEY (`Retenedor_IVA_id`);

--
-- Indices de la tabla `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`Role_id`);

--
-- Indices de la tabla `sobre_nosotros`
--
ALTER TABLE `sobre_nosotros`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `suscripcion`
--
ALTER TABLE `suscripcion`
  ADD PRIMARY KEY (`Suscripcion_id`),
  ADD KEY `suscripcion_factura_fk` (`Factura_FK`),
  ADD KEY `suscripcion_platform_user_fk` (`Platform_user_FK`);

--
-- Indices de la tabla `terminos_y_condiciones`
--
ALTER TABLE `terminos_y_condiciones`
  ADD PRIMARY KEY (`Terminos_id`);

--
-- Indices de la tabla `tipo_edificacion`
--
ALTER TABLE `tipo_edificacion`
  ADD PRIMARY KEY (`Tipo_edificacion_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`User_id`),
  ADD KEY `users_user_status_fk` (`User_status_FK`),
  ADD KEY `users_role_fk` (`Role_FK`);

--
-- Indices de la tabla `user_favoritos`
--
ALTER TABLE `user_favoritos`
  ADD PRIMARY KEY (`User_favorito_id`),
  ADD UNIQUE KEY `unique_user_inmueble` (`Platform_user_FK`,`Inmueble_FK`),
  ADD KEY `Inmueble_FK` (`Inmueble_FK`);

--
-- Indices de la tabla `user_status`
--
ALTER TABLE `user_status`
  ADD PRIMARY KEY (`User_status_id`);

--
-- Indices de la tabla `valor`
--
ALTER TABLE `valor`
  ADD PRIMARY KEY (`Valor_id`);

--
-- Indices de la tabla `vereda`
--
ALTER TABLE `vereda`
  ADD PRIMARY KEY (`Vereda_id`),
  ADD KEY `vereda_municipio_fk` (`Municipio_FK`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acerca_edificacion`
--
ALTER TABLE `acerca_edificacion`
  MODIFY `Acerca_edificacion_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `asignacion`
--
ALTER TABLE `asignacion`
  MODIFY `Asignacion_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `barrio`
--
ALTER TABLE `barrio`
  MODIFY `Barrio_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `barrio_ciudad_corregimiento_vereda`
--
ALTER TABLE `barrio_ciudad_corregimiento_vereda`
  MODIFY `Barrio_ciudad_corregimiento_vereda_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `carrusel`
--
ALTER TABLE `carrusel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  MODIFY `Ciudad_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `contacto`
--
ALTER TABLE `contacto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `corregimiento`
--
ALTER TABLE `corregimiento`
  MODIFY `Corregimiento_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `designador_cardinal`
--
ALTER TABLE `designador_cardinal`
  MODIFY `Designador_cardinal_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `direccion`
--
ALTER TABLE `direccion`
  MODIFY `Direccion_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `division`
--
ALTER TABLE `division`
  MODIFY `Division_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `imagenes_inmueble`
--
ALTER TABLE `imagenes_inmueble`
  MODIFY `Imagenes_inmueble_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `inmueble`
--
ALTER TABLE `inmueble`
  MODIFY `Inmueble_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `localizacion`
--
ALTER TABLE `localizacion`
  MODIFY `Localizacion_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `module`
--
ALTER TABLE `module`
  MODIFY `Module_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `module_role`
--
ALTER TABLE `module_role`
  MODIFY `Module_role_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `municipio`
--
ALTER TABLE `municipio`
  MODIFY `Municipio_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `ndap`
--
ALTER TABLE `ndap`
  MODIFY `Ndap_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `organizacion_parqueadero`
--
ALTER TABLE `organizacion_parqueadero`
  MODIFY `Organizacion_parqueadero_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `otras_caracteristicas`
--
ALTER TABLE `otras_caracteristicas`
  MODIFY `Otras_caracteristicas_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `permitions`
--
ALTER TABLE `permitions`
  MODIFY `Permitions_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `permitions_module_role`
--
ALTER TABLE `permitions_module_role`
  MODIFY `Permitions_module_role_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `platform_identity_document`
--
ALTER TABLE `platform_identity_document`
  MODIFY `Identity_document_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `platform_module`
--
ALTER TABLE `platform_module`
  MODIFY `Platform_module_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `platform_module_role`
--
ALTER TABLE `platform_module_role`
  MODIFY `Platform_module_role_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `platform_permitions`
--
ALTER TABLE `platform_permitions`
  MODIFY `Platform_permitions_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `platform_permitions_module_role`
--
ALTER TABLE `platform_permitions_module_role`
  MODIFY `Platform_permitions_module_role_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `platform_profile`
--
ALTER TABLE `platform_profile`
  MODIFY `Profile_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `platform_role`
--
ALTER TABLE `platform_role`
  MODIFY `Platform_role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `platform_user`
--
ALTER TABLE `platform_user`
  MODIFY `Platform_user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `platform_user_status`
--
ALTER TABLE `platform_user_status`
  MODIFY `Platform_user_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `politica_de_privacidad`
--
ALTER TABLE `politica_de_privacidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `porque_elegirnos`
--
ALTER TABLE `porque_elegirnos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `preguntas_frecuentes`
--
ALTER TABLE `preguntas_frecuentes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `role`
--
ALTER TABLE `role`
  MODIFY `Role_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sobre_nosotros`
--
ALTER TABLE `sobre_nosotros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `terminos_y_condiciones`
--
ALTER TABLE `terminos_y_condiciones`
  MODIFY `Terminos_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tipo_edificacion`
--
ALTER TABLE `tipo_edificacion`
  MODIFY `Tipo_edificacion_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `User_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `user_favoritos`
--
ALTER TABLE `user_favoritos`
  MODIFY `User_favorito_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `user_status`
--
ALTER TABLE `user_status`
  MODIFY `User_status_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `vereda`
--
ALTER TABLE `vereda`
  MODIFY `Vereda_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignacion`
--
ALTER TABLE `asignacion`
  ADD CONSTRAINT `asignacion_organizacion_parqueadero_fk` FOREIGN KEY (`Organizacion_parqueadero_FK`) REFERENCES `organizacion_parqueadero` (`Organizacion_parqueadero_id`);

--
-- Filtros para la tabla `barrio_ciudad_corregimiento_vereda`
--
ALTER TABLE `barrio_ciudad_corregimiento_vereda`
  ADD CONSTRAINT `bccv_barrio_fk` FOREIGN KEY (`Barrio_FK`) REFERENCES `barrio` (`Barrio_id`),
  ADD CONSTRAINT `bccv_ciudad_fk` FOREIGN KEY (`Ciudad_FK`) REFERENCES `ciudad` (`Ciudad_id`),
  ADD CONSTRAINT `bccv_corregimiento_fk` FOREIGN KEY (`Corregimiento_FK`) REFERENCES `corregimiento` (`Corregimiento_id`),
  ADD CONSTRAINT `bccv_vereda_fk` FOREIGN KEY (`Vereda_Fk`) REFERENCES `vereda` (`Vereda_id`);

--
-- Filtros para la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD CONSTRAINT `ciudad_municipio_fk` FOREIGN KEY (`Municipio_FK`) REFERENCES `municipio` (`Municipio_id`);

--
-- Filtros para la tabla `contacto`
--
ALTER TABLE `contacto`
  ADD CONSTRAINT `contacto_ibfk_1` FOREIGN KEY (`platform_user_id`) REFERENCES `platform_user` (`Platform_user_id`);

--
-- Filtros para la tabla `corregimiento`
--
ALTER TABLE `corregimiento`
  ADD CONSTRAINT `corregimiento_municipio_fk` FOREIGN KEY (`Municipio_FK`) REFERENCES `municipio` (`Municipio_id`);

--
-- Filtros para la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD CONSTRAINT `direccion_bccv_fk` FOREIGN KEY (`Barrio_ciudad_corregimiento_vereda_FK`) REFERENCES `barrio_ciudad_corregimiento_vereda` (`Barrio_ciudad_corregimiento_vereda_id`),
  ADD CONSTRAINT `direccion_designador_cardinal_fk` FOREIGN KEY (`Designador_cardinal_FK`) REFERENCES `designador_cardinal` (`Designador_cardinal_id`),
  ADD CONSTRAINT `direccion_localizacion_fk` FOREIGN KEY (`Localizacion_FK`) REFERENCES `localizacion` (`Localizacion_id`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_impuesto_valor_fk` FOREIGN KEY (`Impuesto_valor_fk`) REFERENCES `impuesto_valor` (`Impuesto_valor_id`),
  ADD CONSTRAINT `factura_resolucion_factura_fk` FOREIGN KEY (`Resolucion_factura_FK`) REFERENCES `resolucion_factura` (`Resolucion_factura_id`);

--
-- Filtros para la tabla `impuesto_valor`
--
ALTER TABLE `impuesto_valor`
  ADD CONSTRAINT `impuesto_valor_impuesto_fk` FOREIGN KEY (`Impuesto_FK`) REFERENCES `impuesto` (`Impuesto_id`),
  ADD CONSTRAINT `impuesto_valor_retenedor_iva_fk` FOREIGN KEY (`Retenedor_iva_FK`) REFERENCES `retenedor_iva` (`Retenedor_IVA_id`),
  ADD CONSTRAINT `impuesto_valor_valor_fk` FOREIGN KEY (`Valor_FK`) REFERENCES `valor` (`Valor_id`);

--
-- Filtros para la tabla `inmueble`
--
ALTER TABLE `inmueble`
  ADD CONSTRAINT `inmueble_acerca_edificacion_fk` FOREIGN KEY (`Acerca_edificacion_FK`) REFERENCES `acerca_edificacion` (`Acerca_edificacion_id`),
  ADD CONSTRAINT `inmueble_direccion_fk` FOREIGN KEY (`Direccion_FK`) REFERENCES `direccion` (`Direccion_id`),
  ADD CONSTRAINT `inmueble_division_fk` FOREIGN KEY (`Division_FK`) REFERENCES `division` (`Division_id`),
  ADD CONSTRAINT `inmueble_imagenes_inmueble_fk` FOREIGN KEY (`Imagenes_inmueble_FK`) REFERENCES `imagenes_inmueble` (`Imagenes_inmueble_id`),
  ADD CONSTRAINT `inmueble_otras_caracteristicas_fk` FOREIGN KEY (`Otras_caracteristicas_FK`) REFERENCES `otras_caracteristicas` (`Otras_caracteristicas_id`),
  ADD CONSTRAINT `inmueble_platform_user_fk` FOREIGN KEY (`Platform_user_FK`) REFERENCES `platform_user` (`Platform_user_id`),
  ADD CONSTRAINT `inmueble_tipo_edificacion_fk` FOREIGN KEY (`Tipo_edificacion_FK`) REFERENCES `tipo_edificacion` (`Tipo_edificacion_id`);

--
-- Filtros para la tabla `module_role`
--
ALTER TABLE `module_role`
  ADD CONSTRAINT `module_role_module_fk` FOREIGN KEY (`Module_FK`) REFERENCES `module` (`Module_id`),
  ADD CONSTRAINT `module_role_role_fk` FOREIGN KEY (`Role_FK`) REFERENCES `role` (`Role_id`);

--
-- Filtros para la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD CONSTRAINT `municipio_ndap_fk` FOREIGN KEY (`Ndap_FK`) REFERENCES `ndap` (`Ndap_id`);

--
-- Filtros para la tabla `otras_caracteristicas`
--
ALTER TABLE `otras_caracteristicas`
  ADD CONSTRAINT `otras_caracteristicas_asignacion_fk` FOREIGN KEY (`Asignacion_FK`) REFERENCES `asignacion` (`Asignacion_id`);

--
-- Filtros para la tabla `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `pago_estado_pago_fk` FOREIGN KEY (`Estado_pago_FK`) REFERENCES `estado_pago` (`Estado_pago_id`),
  ADD CONSTRAINT `pago_factura_fk` FOREIGN KEY (`Factura_FK`) REFERENCES `factura` (`Factura_id`);

--
-- Filtros para la tabla `permitions_module_role`
--
ALTER TABLE `permitions_module_role`
  ADD CONSTRAINT `permitions_module_role_ibfk_1` FOREIGN KEY (`Permitions_FK`) REFERENCES `permitions` (`Permitions_id`),
  ADD CONSTRAINT `permitions_module_role_ibfk_2` FOREIGN KEY (`Module_role_FK`) REFERENCES `module_role` (`Module_role_id`);

--
-- Filtros para la tabla `platform_identity_document`
--
ALTER TABLE `platform_identity_document`
  ADD CONSTRAINT `platform_identity_document_profile_fk` FOREIGN KEY (`Platform_profile_FK`) REFERENCES `platform_profile` (`Profile_id`);

--
-- Filtros para la tabla `platform_module_role`
--
ALTER TABLE `platform_module_role`
  ADD CONSTRAINT `platform_module_role_ibfk_1` FOREIGN KEY (`Platform_role_FK`) REFERENCES `platform_role` (`Platform_role_id`),
  ADD CONSTRAINT `platform_module_role_ibfk_2` FOREIGN KEY (`Platform_module_FK`) REFERENCES `platform_module` (`Platform_module_id`);

--
-- Filtros para la tabla `platform_permitions_module_role`
--
ALTER TABLE `platform_permitions_module_role`
  ADD CONSTRAINT `platform_permitions_module_role_ibfk_1` FOREIGN KEY (`Platform_permitions_FK`) REFERENCES `platform_permitions` (`Platform_permitions_id`),
  ADD CONSTRAINT `platform_permitions_module_role_ibfk_2` FOREIGN KEY (`Platform_module_role_FK`) REFERENCES `platform_module_role` (`Platform_module_role_id`);

--
-- Filtros para la tabla `platform_profile`
--
ALTER TABLE `platform_profile`
  ADD CONSTRAINT `platform_profile_ibfk_1` FOREIGN KEY (`Platform_user_FK`) REFERENCES `platform_user` (`Platform_user_id`);

--
-- Filtros para la tabla `platform_user`
--
ALTER TABLE `platform_user`
  ADD CONSTRAINT `platform_user_ibfk_1` FOREIGN KEY (`Platform_user_status_FK`) REFERENCES `platform_user_status` (`Platform_user_status_id`),
  ADD CONSTRAINT `platform_user_ibfk_2` FOREIGN KEY (`Platform_role_FK`) REFERENCES `platform_role` (`Platform_role_id`);

--
-- Filtros para la tabla `suscripcion`
--
ALTER TABLE `suscripcion`
  ADD CONSTRAINT `suscripcion_ibfk_1` FOREIGN KEY (`Platform_user_FK`) REFERENCES `platform_user` (`Platform_user_id`),
  ADD CONSTRAINT `suscripcion_ibfk_2` FOREIGN KEY (`Factura_FK`) REFERENCES `factura` (`Factura_id`);

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`User_status_FK`) REFERENCES `user_status` (`User_status_id`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`Role_FK`) REFERENCES `role` (`Role_id`);

--
-- Filtros para la tabla `user_favoritos`
--
ALTER TABLE `user_favoritos`
  ADD CONSTRAINT `user_favoritos_ibfk_1` FOREIGN KEY (`Platform_user_FK`) REFERENCES `platform_user` (`Platform_user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_favoritos_ibfk_2` FOREIGN KEY (`Inmueble_FK`) REFERENCES `inmueble` (`Inmueble_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `vereda`
--
ALTER TABLE `vereda`
  ADD CONSTRAINT `vereda_ibfk_1` FOREIGN KEY (`Municipio_FK`) REFERENCES `municipio` (`Municipio_id`);


--

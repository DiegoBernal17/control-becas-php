-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 28-05-2018 a las 20:52:23
-- Versión del servidor: 5.7.22
-- Versión de PHP: 7.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `becasdb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `num_control` varchar(20) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellido_paterno` varchar(60) NOT NULL,
  `apellido_materno` varchar(60) NOT NULL,
  `especialidad` varchar(20) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `correo` varchar(120) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `colonia` varchar(60) NOT NULL,
  `municipio` varchar(60) NOT NULL,
  `estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`num_control`, `nombres`, `apellido_paterno`, `apellido_materno`, `especialidad`, `fecha_nacimiento`, `correo`, `telefono`, `direccion`, `colonia`, `municipio`, `estado`) VALUES
('16050720', 'Roberto', 'Martinez', 'Rodriguez', 'ISIC 2010 - 224', '1997-02-02', 'micorreo@hotmail.com', '8441231234', 'Calle 12 #200', 'Ciudad Mirasierra', 'Saltillo', '05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `becas`
--

CREATE TABLE `becas` (
  `id_beca` int(6) NOT NULL,
  `num_control` varchar(20) NOT NULL,
  `clave_tipo_beca` varchar(20) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `estatus` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `becas`
--

INSERT INTO `becas` (`id_beca`, `num_control`, `clave_tipo_beca`, `fecha_inicio`, `fecha_vencimiento`, `estatus`) VALUES
(1, '16050720', '1234', '2018-05-15', '2018-05-29', 1),
(2, '16050720', '1234', '2018-05-09', '2018-05-27', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidades`
--

CREATE TABLE `especialidades` (
  `clave_especialidad` varchar(20) NOT NULL,
  `nombre` varchar(180) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `especialidades`
--

INSERT INTO `especialidades` (`clave_especialidad`, `nombre`) VALUES
('ISIC 2010 - 224', 'Ingeniería en Sistemas Computacionales');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `clave_estado` varchar(20) NOT NULL,
  `nombre` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`clave_estado`, `nombre`) VALUES
('05', 'Coahuila de Zaragoza');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `institucion`
--

CREATE TABLE `institucion` (
  `clave_institucion` varchar(30) NOT NULL,
  `nombre_institucion` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `colonia` varchar(60) NOT NULL,
  `municipio` varchar(60) NOT NULL,
  `estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `institucion`
--

INSERT INTO `institucion` (`clave_institucion`, `nombre_institucion`, `direccion`, `colonia`, `municipio`, `estado`) VALUES
('05DIT0003U', 'Instituto Tecnologico De Saltillo', 'Boulevard Venustiano Carranza Num. 2400', 'Tecnológico', 'Saltillo', '05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_becas`
--

CREATE TABLE `tipos_becas` (
  `clave_tipo_beca` varchar(20) NOT NULL,
  `nombre_beca` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `clave_institucion` varchar(30) NOT NULL,
  `fecha_creacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipos_becas`
--

INSERT INTO `tipos_becas` (`clave_tipo_beca`, `nombre_beca`, `descripcion`, `clave_institucion`, `fecha_creacion`) VALUES
('1234', 'Beca Universitaria', 'descripción', '05DIT0003U', '2018-05-28');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`num_control`),
  ADD KEY `alumnoBecaFK` (`num_control`),
  ADD KEY `alumnoEspecialidadFK` (`num_control`),
  ADD KEY `alumnosEspecialidadesFK` (`especialidad`),
  ADD KEY `alumnoEstadoFK` (`estado`) USING BTREE,
  ADD KEY `alumnosEstadosFK` (`telefono`);

--
-- Indices de la tabla `becas`
--
ALTER TABLE `becas`
  ADD PRIMARY KEY (`id_beca`),
  ADD KEY `becaAlumnoFK` (`num_control`) USING BTREE,
  ADD KEY `becaTiposFK` (`clave_tipo_beca`);

--
-- Indices de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  ADD PRIMARY KEY (`clave_especialidad`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`clave_estado`);

--
-- Indices de la tabla `institucion`
--
ALTER TABLE `institucion`
  ADD PRIMARY KEY (`clave_institucion`),
  ADD KEY `institucionEstadoFK` (`clave_institucion`) USING BTREE,
  ADD KEY `institucionesEstadosFK` (`estado`);

--
-- Indices de la tabla `tipos_becas`
--
ALTER TABLE `tipos_becas`
  ADD PRIMARY KEY (`clave_tipo_beca`) USING BTREE,
  ADD KEY `tiposInstitucionFK` (`clave_institucion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `becas`
--
ALTER TABLE `becas`
  MODIFY `id_beca` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD CONSTRAINT `alumnosEspecialidadesFK` FOREIGN KEY (`especialidad`) REFERENCES `especialidades` (`clave_especialidad`),
  ADD CONSTRAINT `alumnosEstadosFK` FOREIGN KEY (`estado`) REFERENCES `estados` (`clave_estado`);

--
-- Filtros para la tabla `becas`
--
ALTER TABLE `becas`
  ADD CONSTRAINT `becasAlumnosFK` FOREIGN KEY (`num_control`) REFERENCES `alumnos` (`num_control`),
  ADD CONSTRAINT `becasTiposFK` FOREIGN KEY (`clave_tipo_beca`) REFERENCES `tipos_becas` (`clave_tipo_beca`);

--
-- Filtros para la tabla `institucion`
--
ALTER TABLE `institucion`
  ADD CONSTRAINT `institucionesEstadosFK` FOREIGN KEY (`estado`) REFERENCES `estados` (`clave_estado`);

--
-- Filtros para la tabla `tipos_becas`
--
ALTER TABLE `tipos_becas`
  ADD CONSTRAINT `tiposInstitucionFK` FOREIGN KEY (`clave_institucion`) REFERENCES `institucion` (`clave_institucion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

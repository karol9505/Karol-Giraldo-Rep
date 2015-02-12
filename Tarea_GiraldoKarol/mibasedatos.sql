-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-02-2015 a las 05:15:35
-- Versión del servidor: 5.6.21
-- Versión de PHP: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `mibasedatos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE IF NOT EXISTS `cursos` (
`id_cursos` int(11) NOT NULL,
  `codigo_cursos` varchar(45) NOT NULL,
  `nombre_cursos` varchar(45) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`id_cursos`, `codigo_cursos`, `nombre_cursos`) VALUES
(1, '001', 'Diseñando con Algoritmos'),
(2, '002', 'Teoria del Color');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE IF NOT EXISTS `estudiantes` (
`id_estudiantes` int(11) NOT NULL,
  `nombre_estudiantes` varchar(45) NOT NULL,
  `codigo_estudiantes` varchar(45) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estudiantes`
--

INSERT INTO `estudiantes` (`id_estudiantes`, `nombre_estudiantes`, `codigo_estudiantes`) VALUES
(1, 'Alejandro Dominguez', '12212032'),
(2, 'Laura Obando', '12212035'),
(3, 'Margalida Vivas', '12212058');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes_cursos`
--

CREATE TABLE IF NOT EXISTS `estudiantes_cursos` (
`id_estudiantes_cursos` int(11) NOT NULL,
  `id_estudiantes` int(11) NOT NULL,
  `id_cursos` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estudiantes_cursos`
--

INSERT INTO `estudiantes_cursos` (`id_estudiantes_cursos`, `id_estudiantes`, `id_cursos`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE IF NOT EXISTS `notas` (
`id_notas` int(11) NOT NULL,
  `nombre_notas` varchar(45) NOT NULL,
  `id_cursos` int(11) NOT NULL,
  `porcentaje` float NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `notas`
--

INSERT INTO `notas` (`id_notas`, `nombre_notas`, `id_cursos`, `porcentaje`) VALUES
(1, 'Primer Taller', 1, 0.3),
(2, 'Segundo Taller', 1, 0.3),
(3, 'Parcial', 1, 0.4),
(4, 'Libro Ilustrado', 2, 0.5),
(5, 'Infografia', 2, 0.5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas_estudiantes`
--

CREATE TABLE IF NOT EXISTS `notas_estudiantes` (
`id_notas_estudiantes` int(11) NOT NULL,
  `id_estudiantes` int(11) NOT NULL,
  `id_cursos` int(11) NOT NULL,
  `id_notas` int(11) NOT NULL,
  `valor` float NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `notas_estudiantes`
--

INSERT INTO `notas_estudiantes` (`id_notas_estudiantes`, `id_estudiantes`, `id_cursos`, `id_notas`, `valor`) VALUES
(1, 1, 1, 1, 4.2),
(2, 1, 1, 2, 3.6),
(3, 1, 1, 3, 4.1),
(4, 2, 2, 4, 4.6),
(5, 2, 2, 5, 3.2),
(6, 3, 2, 4, 3.8),
(7, 3, 2, 5, 4.8);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
 ADD PRIMARY KEY (`id_cursos`);

--
-- Indices de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
 ADD PRIMARY KEY (`id_estudiantes`);

--
-- Indices de la tabla `estudiantes_cursos`
--
ALTER TABLE `estudiantes_cursos`
 ADD PRIMARY KEY (`id_estudiantes_cursos`), ADD KEY `id_estudiantes_idx` (`id_estudiantes`), ADD KEY `id_cursos_idx` (`id_cursos`);

--
-- Indices de la tabla `notas`
--
ALTER TABLE `notas`
 ADD PRIMARY KEY (`id_notas`), ADD KEY `id_cursos_idx` (`id_cursos`);

--
-- Indices de la tabla `notas_estudiantes`
--
ALTER TABLE `notas_estudiantes`
 ADD PRIMARY KEY (`id_notas_estudiantes`), ADD KEY `id_notas_idx` (`id_notas`), ADD KEY `id_estudiantes_idx` (`id_estudiantes`), ADD KEY `id_cursos_idx` (`id_cursos`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cursos`
--
ALTER TABLE `cursos`
MODIFY `id_cursos` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
MODIFY `id_estudiantes` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `estudiantes_cursos`
--
ALTER TABLE `estudiantes_cursos`
MODIFY `id_estudiantes_cursos` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `notas`
--
ALTER TABLE `notas`
MODIFY `id_notas` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `notas_estudiantes`
--
ALTER TABLE `notas_estudiantes`
MODIFY `id_notas_estudiantes` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `estudiantes_cursos`
--
ALTER TABLE `estudiantes_cursos`
ADD CONSTRAINT `id_cursos` FOREIGN KEY (`id_cursos`) REFERENCES `cursos` (`id_cursos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `id_estudiantes` FOREIGN KEY (`id_estudiantes`) REFERENCES `estudiantes` (`id_estudiantes`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `notas`
--
ALTER TABLE `notas`
ADD CONSTRAINT `cursos_cursos` FOREIGN KEY (`id_cursos`) REFERENCES `cursos` (`id_cursos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `notas_estudiantes`
--
ALTER TABLE `notas_estudiantes`
ADD CONSTRAINT `cursos_notas` FOREIGN KEY (`id_cursos`) REFERENCES `cursos` (`id_cursos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `estudiantes_estudiantes` FOREIGN KEY (`id_estudiantes`) REFERENCES `estudiantes` (`id_estudiantes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `id_notas` FOREIGN KEY (`id_notas`) REFERENCES `notas` (`id_notas`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

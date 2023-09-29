-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-08-2023 a las 22:53:06
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tecnano2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `id_administrador` int(10) NOT NULL,
  `contrase` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `telefono` int(12) NOT NULL,
  `id_usuario` int(10) DEFAULT NULL,
  `id_vehiculo` int(10) DEFAULT NULL,
  `id_conductor` int(10) DEFAULT NULL,
  `id_factura` int(10) DEFAULT NULL,
  `id_viaje` int(10) DEFAULT NULL,
  `id_detalle` int(10) DEFAULT NULL,
  `id_panel_control` int(10) DEFAULT NULL,
  `id_metodo_pago` int(10) DEFAULT NULL,
  `id_transporte` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conductor`
--

CREATE TABLE `conductor` (
  `id_conductor` int(10) NOT NULL,
  `contraseña` varchar(15) NOT NULL,
  `telefono` int(15) NOT NULL,
  `edad` int(2) NOT NULL,
  `email` varchar(30) NOT NULL,
  `direccion` varchar(40) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `id_factura` int(10) DEFAULT NULL,
  `id_viaje` int(10) DEFAULT NULL,
  `id_vehiculo` int(10) DEFAULT NULL,
  `id_detalle` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle`
--

CREATE TABLE `detalle` (
  `id_detalle` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id_factura` int(10) NOT NULL,
  `nombre_comprador` varchar(30) NOT NULL,
  `total` int(20) NOT NULL,
  `fecha` int(10) NOT NULL,
  `num_factura` int(20) NOT NULL,
  `id_detalle` int(10) DEFAULT NULL,
  `id_viaje` int(10) DEFAULT NULL,
  `id_metodo_pago` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodo_pago`
--

CREATE TABLE `metodo_pago` (
  `id_metodo_pago` int(10) NOT NULL,
  `num_cuenta` int(50) NOT NULL,
  `num_comprobante` int(50) NOT NULL,
  `num_tarjeta` int(50) NOT NULL,
  `efectivo` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `panel_control`
--

CREATE TABLE `panel_control` (
  `id_panel_control` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transporte`
--

CREATE TABLE `transporte` (
  `id_transporte` int(10) NOT NULL,
  `tipo_vehiculo` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefono` int(15) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `contraseña` int(50) NOT NULL,
  `id_viaje` int(10) DEFAULT NULL,
  `id_factura` int(10) DEFAULT NULL,
  `id_conductor` int(10) DEFAULT NULL,
  `id_vehiculo` int(10) DEFAULT NULL,
  `id_transporte` int(10) DEFAULT NULL,
  `id_detalle` int(10) DEFAULT NULL,
  `id_metodo_pago` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE `vehiculo` (
  `id_vehiculo` int(10) NOT NULL,
  `placa` varchar(6) NOT NULL,
  `aseguradora` varchar(20) NOT NULL,
  `propietario` varchar(40) NOT NULL,
  `modelo` int(4) NOT NULL,
  `color` varchar(15) NOT NULL,
  `marca` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `viaje`
--

CREATE TABLE `viaje` (
  `id_viaje` int(10) NOT NULL,
  `lugar_destino` varchar(30) NOT NULL,
  `lugar_partida` varchar(30) NOT NULL,
  `paradas` varchar(30) NOT NULL,
  `equipaje` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`id_administrador`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_vehiculo` (`id_vehiculo`),
  ADD KEY `id_conductor` (`id_conductor`),
  ADD KEY `id_viaje` (`id_viaje`),
  ADD KEY `id_factura` (`id_factura`),
  ADD KEY `id_detalle` (`id_detalle`),
  ADD KEY `id_panel_control` (`id_panel_control`),
  ADD KEY `id_metodo_pago` (`id_metodo_pago`),
  ADD KEY `id_transporte` (`id_transporte`);

--
-- Indices de la tabla `conductor`
--
ALTER TABLE `conductor`
  ADD PRIMARY KEY (`id_conductor`),
  ADD KEY `id_factura` (`id_factura`),
  ADD KEY `id_viaje` (`id_viaje`),
  ADD KEY `id_vehiculo` (`id_vehiculo`),
  ADD KEY `id_detalle` (`id_detalle`);

--
-- Indices de la tabla `detalle`
--
ALTER TABLE `detalle`
  ADD PRIMARY KEY (`id_detalle`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id_factura`),
  ADD KEY `id_detalle` (`id_detalle`),
  ADD KEY `id_viaje` (`id_viaje`),
  ADD KEY `id_metodo_pago` (`id_metodo_pago`);

--
-- Indices de la tabla `metodo_pago`
--
ALTER TABLE `metodo_pago`
  ADD PRIMARY KEY (`id_metodo_pago`);

--
-- Indices de la tabla `panel_control`
--
ALTER TABLE `panel_control`
  ADD PRIMARY KEY (`id_panel_control`);

--
-- Indices de la tabla `transporte`
--
ALTER TABLE `transporte`
  ADD PRIMARY KEY (`id_transporte`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_viaje` (`id_viaje`),
  ADD KEY `id_factura` (`id_factura`),
  ADD KEY `id_conductor` (`id_conductor`),
  ADD KEY `id_vehiculo` (`id_vehiculo`),
  ADD KEY `id_transporte` (`id_transporte`),
  ADD KEY `id_detalle` (`id_detalle`),
  ADD KEY `id_metodo_pago` (`id_metodo_pago`);

--
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`id_vehiculo`);

--
-- Indices de la tabla `viaje`
--
ALTER TABLE `viaje`
  ADD PRIMARY KEY (`id_viaje`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD CONSTRAINT `administrador_ibfk_1` FOREIGN KEY (`id_detalle`) REFERENCES `detalle` (`id_detalle`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administrador_ibfk_10` FOREIGN KEY (`id_transporte`) REFERENCES `transporte` (`id_transporte`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administrador_ibfk_2` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculo` (`id_vehiculo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administrador_ibfk_3` FOREIGN KEY (`id_panel_control`) REFERENCES `panel_control` (`id_panel_control`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administrador_ibfk_4` FOREIGN KEY (`id_panel_control`) REFERENCES `panel_control` (`id_panel_control`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administrador_ibfk_5` FOREIGN KEY (`id_viaje`) REFERENCES `viaje` (`id_viaje`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administrador_ibfk_6` FOREIGN KEY (`id_factura`) REFERENCES `factura` (`id_factura`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administrador_ibfk_7` FOREIGN KEY (`id_conductor`) REFERENCES `conductor` (`id_conductor`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administrador_ibfk_8` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administrador_ibfk_9` FOREIGN KEY (`id_metodo_pago`) REFERENCES `metodo_pago` (`id_metodo_pago`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `conductor`
--
ALTER TABLE `conductor`
  ADD CONSTRAINT `conductor_ibfk_1` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculo` (`id_vehiculo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `conductor_ibfk_2` FOREIGN KEY (`id_factura`) REFERENCES `factura` (`id_factura`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `conductor_ibfk_3` FOREIGN KEY (`id_viaje`) REFERENCES `viaje` (`id_viaje`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`id_metodo_pago`) REFERENCES `metodo_pago` (`id_metodo_pago`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculo` (`id_vehiculo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`id_detalle`) REFERENCES `detalle` (`id_detalle`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_ibfk_3` FOREIGN KEY (`id_viaje`) REFERENCES `viaje` (`id_viaje`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_ibfk_4` FOREIGN KEY (`id_factura`) REFERENCES `factura` (`id_factura`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_ibfk_5` FOREIGN KEY (`id_conductor`) REFERENCES `conductor` (`id_conductor`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_ibfk_6` FOREIGN KEY (`id_conductor`) REFERENCES `conductor` (`id_conductor`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

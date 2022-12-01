-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-11-2022 a las 22:27:39
-- Versión del servidor: 10.4.8-MariaDB
-- Versión de PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbo_paloaguao`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_adic_pers`
--

CREATE TABLE `tbl_adic_pers` (
  `Id_adic_pers` varchar(13) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `edad` varchar(3) NOT NULL,
  `genero` varchar(10) NOT NULL,
  `Fk_Id_pers` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_barrio`
--

CREATE TABLE `tbl_barrio` (
  `Id_barr` varchar(10) NOT NULL,
  `Nom_barr` varchar(15) NOT NULL,
  `Fk_Id_loc` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_categoria`
--

CREATE TABLE `tbl_categoria` (
  `Id_categ` varchar(3) NOT NULL,
  `Nom_categ` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_ciudad`
--

CREATE TABLE `tbl_ciudad` (
  `Id_ciud` varchar(10) NOT NULL,
  `Nom_ciud` varchar(15) NOT NULL,
  `Fk_Id_pais` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_compra`
--

CREATE TABLE `tbl_compra` (
  `id_comp` varchar(15) NOT NULL,
  `detall` varchar(15) NOT NULL,
  `Fk_Id_prod` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_comprobante_pago`
--

CREATE TABLE `tbl_comprobante_pago` (
  `Id_comprob` varchar(15) NOT NULL,
  `comprob_sis` varchar(15) NOT NULL,
  `comprob_fondo` varchar(15) NOT NULL,
  `Fk_Id_pag` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_detalle_factura`
--

CREATE TABLE `tbl_detalle_factura` (
  `Id_Det_Factura` varchar(15) NOT NULL,
  `Descript_Factura` varchar(255) NOT NULL,
  `Fk_Id_fact` varchar(15) NOT NULL,
  `Fk_Id_prod` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_envio`
--

CREATE TABLE `tbl_envio` (
  `id_envio` varchar(15) NOT NULL,
  `hora_llegada` datetime NOT NULL,
  `FK_id_comprob` varchar(15) NOT NULL,
  `FK_id_fact` varchar(15) NOT NULL,
  `FK_id_barr` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_factura`
--

CREATE TABLE `tbl_factura` (
  `Id_fact` varchar(15) NOT NULL,
  `Fk_id_comp` varchar(15) NOT NULL,
  `Fk_Id_comprob` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_inventario`
--

CREATE TABLE `tbl_inventario` (
  `Id_invent` varchar(15) NOT NULL,
  `cant_almace` varchar(10) NOT NULL,
  `dispo` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_localidad`
--

CREATE TABLE `tbl_localidad` (
  `Id_loc` varchar(10) NOT NULL,
  `Nom_loc` varchar(15) NOT NULL,
  `Fk_Id_ciud` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_metodo_pago`
--

CREATE TABLE `tbl_metodo_pago` (
  `Id_pag` varchar(15) NOT NULL,
  `metod_pag` varchar(15) NOT NULL,
  `Fk_Id_pers` varchar(13) NOT NULL,
  `Fk_Id_comp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_pais`
--

CREATE TABLE `tbl_pais` (
  `Id_Pais` varchar(10) NOT NULL,
  `Nom_pais` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_perfil`
--

CREATE TABLE `tbl_perfil` (
  `Id_perf` varchar(2) NOT NULL,
  `Nom_perf` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_persona`
--

CREATE TABLE `tbl_persona` (
  `Id_pers` varchar(13) NOT NULL,
  `Pri_nom` varchar(15) NOT NULL,
  `Seg_nom` varchar(15) DEFAULT NULL,
  `pri_apell` varchar(15) NOT NULL,
  `seg_apell` varchar(15) DEFAULT NULL,
  `fech_nac` date DEFAULT NULL,
  `Fk_Id_perf` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_productos`
--

CREATE TABLE `tbl_productos` (
  `Id_prod` varchar(15) NOT NULL,
  `nom_prod` varchar(15) NOT NULL,
  `prec_prod` varchar(255) NOT NULL,
  `Fk_Id_categ` varchar(3) NOT NULL,
  `Fk_Id_invent` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_adic_pers`
--
ALTER TABLE `tbl_adic_pers`
  ADD PRIMARY KEY (`Id_adic_pers`),
  ADD KEY `Fk_datos_pers` (`Fk_Id_pers`);

--
-- Indices de la tabla `tbl_barrio`
--
ALTER TABLE `tbl_barrio`
  ADD PRIMARY KEY (`Id_barr`),
  ADD KEY `Fk_Ciud_barr` (`Fk_Id_loc`);

--
-- Indices de la tabla `tbl_categoria`
--
ALTER TABLE `tbl_categoria`
  ADD PRIMARY KEY (`Id_categ`);

--
-- Indices de la tabla `tbl_ciudad`
--
ALTER TABLE `tbl_ciudad`
  ADD PRIMARY KEY (`Id_ciud`),
  ADD KEY `Fk_Ciud_Pais` (`Fk_Id_pais`);

--
-- Indices de la tabla `tbl_compra`
--
ALTER TABLE `tbl_compra`
  ADD PRIMARY KEY (`id_comp`),
  ADD KEY `Fk_Prod_compra` (`Fk_Id_prod`);

--
-- Indices de la tabla `tbl_comprobante_pago`
--
ALTER TABLE `tbl_comprobante_pago`
  ADD PRIMARY KEY (`Id_comprob`),
  ADD KEY `Fk_comprob_metod_pago` (`Fk_Id_pag`);

--
-- Indices de la tabla `tbl_detalle_factura`
--
ALTER TABLE `tbl_detalle_factura`
  ADD PRIMARY KEY (`Id_Det_Factura`),
  ADD KEY `Fk_Detalle_Factura` (`Fk_Id_fact`),
  ADD KEY `Fk_Det_Fact_Prod` (`Fk_Id_prod`);

--
-- Indices de la tabla `tbl_envio`
--
ALTER TABLE `tbl_envio`
  ADD PRIMARY KEY (`id_envio`),
  ADD KEY `Fk_Envio_Comprob_Pago` (`FK_id_comprob`),
  ADD KEY `Fk_Fact_Envio` (`FK_id_fact`),
  ADD KEY `Fk_Barrio_Envio` (`FK_id_barr`);

--
-- Indices de la tabla `tbl_factura`
--
ALTER TABLE `tbl_factura`
  ADD PRIMARY KEY (`Id_fact`),
  ADD KEY `Fk_fact_comp` (`Fk_id_comp`),
  ADD KEY `Fk_Comprob_Factura` (`Fk_Id_comprob`);

--
-- Indices de la tabla `tbl_inventario`
--
ALTER TABLE `tbl_inventario`
  ADD PRIMARY KEY (`Id_invent`);

--
-- Indices de la tabla `tbl_localidad`
--
ALTER TABLE `tbl_localidad`
  ADD PRIMARY KEY (`Id_loc`),
  ADD KEY `Fk_Ciud_loc` (`Fk_Id_ciud`);

--
-- Indices de la tabla `tbl_metodo_pago`
--
ALTER TABLE `tbl_metodo_pago`
  ADD PRIMARY KEY (`Id_pag`),
  ADD KEY `Fk_pers_pago` (`Fk_Id_pers`),
  ADD KEY `Fk_pago_compra` (`Fk_Id_comp`);

--
-- Indices de la tabla `tbl_pais`
--
ALTER TABLE `tbl_pais`
  ADD PRIMARY KEY (`Id_Pais`);

--
-- Indices de la tabla `tbl_perfil`
--
ALTER TABLE `tbl_perfil`
  ADD PRIMARY KEY (`Id_perf`);

--
-- Indices de la tabla `tbl_persona`
--
ALTER TABLE `tbl_persona`
  ADD PRIMARY KEY (`Id_pers`),
  ADD KEY `fk_perf_pers` (`Fk_Id_perf`);

--
-- Indices de la tabla `tbl_productos`
--
ALTER TABLE `tbl_productos`
  ADD PRIMARY KEY (`Id_prod`),
  ADD KEY `Fk_categ_prod` (`Fk_Id_categ`),
  ADD KEY `Fk_Id_invent` (`Fk_Id_invent`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_adic_pers`
--
ALTER TABLE `tbl_adic_pers`
  ADD CONSTRAINT `Fk_datos_pers` FOREIGN KEY (`Fk_Id_pers`) REFERENCES `tbl_persona` (`Id_pers`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_barrio`
--
ALTER TABLE `tbl_barrio`
  ADD CONSTRAINT `Fk_Ciud_barr` FOREIGN KEY (`Fk_Id_loc`) REFERENCES `tbl_localidad` (`Id_loc`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_ciudad`
--
ALTER TABLE `tbl_ciudad`
  ADD CONSTRAINT `Fk_Ciud_Pais` FOREIGN KEY (`Fk_Id_pais`) REFERENCES `tbl_pais` (`Id_Pais`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_compra`
--
ALTER TABLE `tbl_compra`
  ADD CONSTRAINT `Fk_Prod_compra` FOREIGN KEY (`Fk_Id_prod`) REFERENCES `tbl_productos` (`Id_prod`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_comprobante_pago`
--
ALTER TABLE `tbl_comprobante_pago`
  ADD CONSTRAINT `Fk_comprob_metod_pago` FOREIGN KEY (`Fk_Id_pag`) REFERENCES `tbl_metodo_pago` (`Id_pag`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_detalle_factura`
--
ALTER TABLE `tbl_detalle_factura`
  ADD CONSTRAINT `Fk_Det_Fact_Prod` FOREIGN KEY (`Fk_Id_prod`) REFERENCES `tbl_productos` (`Id_prod`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_Detalle_Factura` FOREIGN KEY (`Fk_Id_fact`) REFERENCES `tbl_factura` (`Id_fact`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_envio`
--
ALTER TABLE `tbl_envio`
  ADD CONSTRAINT `Fk_Barrio_Envio` FOREIGN KEY (`FK_id_barr`) REFERENCES `tbl_barrio` (`Id_barr`),
  ADD CONSTRAINT `Fk_Envio_Comprob_Pago` FOREIGN KEY (`FK_id_comprob`) REFERENCES `tbl_comprobante_pago` (`Id_comprob`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_Fact_Envio` FOREIGN KEY (`FK_id_fact`) REFERENCES `tbl_factura` (`Id_fact`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_factura`
--
ALTER TABLE `tbl_factura`
  ADD CONSTRAINT `Fk_Comprob_Factura` FOREIGN KEY (`Fk_Id_comprob`) REFERENCES `tbl_comprobante_pago` (`Id_comprob`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_fact_comp` FOREIGN KEY (`Fk_id_comp`) REFERENCES `tbl_compra` (`id_comp`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_localidad`
--
ALTER TABLE `tbl_localidad`
  ADD CONSTRAINT `Fk_Ciud_loc` FOREIGN KEY (`Fk_Id_ciud`) REFERENCES `tbl_ciudad` (`Id_ciud`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_metodo_pago`
--
ALTER TABLE `tbl_metodo_pago`
  ADD CONSTRAINT `Fk_pago_compra` FOREIGN KEY (`Fk_Id_comp`) REFERENCES `tbl_compra` (`id_comp`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_pers_pago` FOREIGN KEY (`Fk_Id_pers`) REFERENCES `tbl_persona` (`Id_pers`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_persona`
--
ALTER TABLE `tbl_persona`
  ADD CONSTRAINT `fk_perf_pers` FOREIGN KEY (`Fk_Id_perf`) REFERENCES `tbl_perfil` (`Id_perf`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_productos`
--
ALTER TABLE `tbl_productos`
  ADD CONSTRAINT `Fk_categ_prod` FOREIGN KEY (`Fk_Id_categ`) REFERENCES `tbl_categoria` (`Id_categ`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_productos_ibfk_1` FOREIGN KEY (`Fk_Id_invent`) REFERENCES `tbl_inventario` (`Id_invent`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

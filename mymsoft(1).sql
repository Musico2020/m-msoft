-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-02-2022 a las 16:11:24
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mymsoft`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `idADMINISTRADOR` int(11) NOT NULL,
  `idUSUARIO` varchar(45) NOT NULL,
  `NOMBRE` varchar(45) NOT NULL,
  `idENTRADA` varchar(45) NOT NULL,
  `idSALIDA` varchar(45) NOT NULL,
  `CARGO` varchar(45) NOT NULL,
  `SALIDA_idSALIDA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrada`
--

CREATE TABLE `entrada` (
  `idENTRADA` int(11) NOT NULL,
  `SUMINISTROS` varchar(45) NOT NULL,
  `ALMACEN` varchar(45) NOT NULL,
  `CANTIDAD` varchar(45) DEFAULT NULL,
  `ENTRADAcol` varchar(45) NOT NULL,
  `FECHA_HORA` varchar(45) NOT NULL,
  `idUSUARIO` varchar(45) NOT NULL,
  `USUARIO_idUSUARIO` int(11) NOT NULL,
  `MANTENIMIENTO_idTECNICO` int(11) NOT NULL,
  `ADMINISTRADOR_idADMINISTRADOR` int(11) NOT NULL,
  `SUMINISTROS_idSUMINISTROS` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mantenimiento`
--

CREATE TABLE `mantenimiento` (
  `idTECNICO` int(11) NOT NULL,
  `idUSUARIO` varchar(45) NOT NULL,
  `TIPO_MANTENIMIENTO` varchar(45) NOT NULL,
  `idADMINISTRADOR` varchar(45) NOT NULL,
  `idENTRADA` varchar(45) NOT NULL,
  `USUARIO_idUSUARIO` int(11) NOT NULL,
  `MAQUINAS_idMAQUINAS` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maquinas`
--

CREATE TABLE `maquinas` (
  `idMAQUINAS` int(11) NOT NULL,
  `NOMBRE` varchar(45) NOT NULL,
  `TIPO_MANTENIMIENTO` varchar(45) NOT NULL,
  `idUSUARIO` varchar(45) NOT NULL,
  `idENTRADA` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salida`
--

CREATE TABLE `salida` (
  `idSALIDA` int(11) NOT NULL,
  `idSUMINISTRO` varchar(45) NOT NULL,
  `idUSUARIO` varchar(45) NOT NULL,
  `CANTIDAD` varchar(45) NOT NULL,
  `FECHA_HORA` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suministros`
--

CREATE TABLE `suministros` (
  `idSUMINISTROS` int(11) NOT NULL,
  `TIPO_SUMINISTRO` varchar(45) NOT NULL,
  `idSALIDA` varchar(45) NOT NULL,
  `idENTRADA` varchar(45) NOT NULL,
  `SALIDA_idSALIDA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUSUARIO` int(11) NOT NULL,
  `NOMBRE` varchar(45) NOT NULL,
  `APELLIDOS` varchar(45) NOT NULL,
  `PROFECCION` varchar(45) NOT NULL,
  `CORREO` varchar(45) NOT NULL,
  `CONTRASEÑA` varchar(45) NOT NULL,
  `DIRECCION` varchar(45) NOT NULL,
  `ADMINISTRADOR_idADMINISTRADOR` int(11) NOT NULL,
  `MAQUINAS_idMAQUINAS` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`idADMINISTRADOR`),
  ADD KEY `fk_ADMINISTRADOR_SALIDA1_idx` (`SALIDA_idSALIDA`);

--
-- Indices de la tabla `entrada`
--
ALTER TABLE `entrada`
  ADD PRIMARY KEY (`idENTRADA`),
  ADD KEY `fk_ENTRADA_USUARIO_idx` (`USUARIO_idUSUARIO`),
  ADD KEY `fk_ENTRADA_MANTENIMIENTO1_idx` (`MANTENIMIENTO_idTECNICO`),
  ADD KEY `fk_ENTRADA_ADMINISTRADOR1_idx` (`ADMINISTRADOR_idADMINISTRADOR`),
  ADD KEY `fk_ENTRADA_SUMINISTROS1_idx` (`SUMINISTROS_idSUMINISTROS`);

--
-- Indices de la tabla `mantenimiento`
--
ALTER TABLE `mantenimiento`
  ADD PRIMARY KEY (`idTECNICO`),
  ADD KEY `fk_MANTENIMIENTO_USUARIO1_idx` (`USUARIO_idUSUARIO`),
  ADD KEY `fk_MANTENIMIENTO_MAQUINAS1_idx` (`MAQUINAS_idMAQUINAS`);

--
-- Indices de la tabla `maquinas`
--
ALTER TABLE `maquinas`
  ADD PRIMARY KEY (`idMAQUINAS`);

--
-- Indices de la tabla `salida`
--
ALTER TABLE `salida`
  ADD PRIMARY KEY (`idSALIDA`);

--
-- Indices de la tabla `suministros`
--
ALTER TABLE `suministros`
  ADD PRIMARY KEY (`idSUMINISTROS`),
  ADD KEY `fk_SUMINISTROS_SALIDA1_idx` (`SALIDA_idSALIDA`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUSUARIO`),
  ADD KEY `fk_USUARIO_ADMINISTRADOR1_idx` (`ADMINISTRADOR_idADMINISTRADOR`),
  ADD KEY `fk_USUARIO_MAQUINAS1_idx` (`MAQUINAS_idMAQUINAS`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD CONSTRAINT `fk_ADMINISTRADOR_SALIDA1` FOREIGN KEY (`SALIDA_idSALIDA`) REFERENCES `salida` (`idSALIDA`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `entrada`
--
ALTER TABLE `entrada`
  ADD CONSTRAINT `fk_ENTRADA_ADMINISTRADOR1` FOREIGN KEY (`ADMINISTRADOR_idADMINISTRADOR`) REFERENCES `administrador` (`idADMINISTRADOR`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ENTRADA_MANTENIMIENTO1` FOREIGN KEY (`MANTENIMIENTO_idTECNICO`) REFERENCES `mantenimiento` (`idTECNICO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ENTRADA_SUMINISTROS1` FOREIGN KEY (`SUMINISTROS_idSUMINISTROS`) REFERENCES `suministros` (`idSUMINISTROS`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ENTRADA_USUARIO` FOREIGN KEY (`USUARIO_idUSUARIO`) REFERENCES `usuario` (`idUSUARIO`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `mantenimiento`
--
ALTER TABLE `mantenimiento`
  ADD CONSTRAINT `fk_MANTENIMIENTO_MAQUINAS1` FOREIGN KEY (`MAQUINAS_idMAQUINAS`) REFERENCES `maquinas` (`idMAQUINAS`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_MANTENIMIENTO_USUARIO1` FOREIGN KEY (`USUARIO_idUSUARIO`) REFERENCES `usuario` (`idUSUARIO`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `suministros`
--
ALTER TABLE `suministros`
  ADD CONSTRAINT `fk_SUMINISTROS_SALIDA1` FOREIGN KEY (`SALIDA_idSALIDA`) REFERENCES `salida` (`idSALIDA`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_USUARIO_ADMINISTRADOR1` FOREIGN KEY (`ADMINISTRADOR_idADMINISTRADOR`) REFERENCES `administrador` (`idADMINISTRADOR`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_USUARIO_MAQUINAS1` FOREIGN KEY (`MAQUINAS_idMAQUINAS`) REFERENCES `maquinas` (`idMAQUINAS`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

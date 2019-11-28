-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-11-2019 a las 17:19:07
-- Versión del servidor: 10.1.39-MariaDB
-- Versión de PHP: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_rotify`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentario`
--

CREATE TABLE `comentario` (
  `id_comentario` int(60) NOT NULL,
  `comentario` varchar(300) NOT NULL,
  `puntaje` tinyint(1) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_usuario` int(60) NOT NULL,
  `id_variedad` int(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `comentario`
--

INSERT INTO `comentario` (`id_comentario`, `comentario`, `puntaje`, `fecha`, `id_usuario`, `id_variedad`) VALUES
(1, 'De la re puta madre!!!', 5, '2019-11-25 04:33:28', 1, 1),
(2, 'Una cagada', 1, '2019-11-25 04:34:28', 4, 1),
(3, 'Más ricas que Bill Gates', 5, '2019-11-26 14:35:29', 2, 2),
(5, 'Lis impinidis di pilli tinin qui sir kin silsi di timiti', 3, '2019-11-26 14:36:48', 4, 2),
(6, 'Zafan', 3, '2019-11-28 14:13:23', 1, 1),
(7, 'Les entro como a las rubias de 20 a 25', 5, '2019-11-28 14:14:48', 3, 5),
(8, 'El sueño de todo veggie', 5, '2019-11-28 14:17:21', 2, 3),
(9, 'Muy buenas', 4, '2019-11-28 14:17:21', 4, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comida`
--

CREATE TABLE `comida` (
  `id_comida` int(11) NOT NULL,
  `nombre` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `comida`
--

INSERT INTO `comida` (`id_comida`, `nombre`) VALUES
(0, 'Pizzas'),
(1, 'Empanadas'),
(2, 'Tartas'),
(3, 'Milanesas'),
(4, 'Hamburguesas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(30) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `email` varchar(60) NOT NULL,
  `contraseña` varchar(150) NOT NULL,
  `admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `email`, `contraseña`, `admin`) VALUES
(1, 'admin', '', '$2y$10$mU4V3JYGNL5D90ZE4iAcYOovduu9lTww7Dl3LNk3CuoFW8mNlwBWe', 1),
(2, 'user2', '', '$2y$10$RjiPeIftYXiQ9QM9INz5RuteTgpslfA0fFUWpLlyEGc/KQZeI1Nf2', 0),
(3, 'user3', '', '$2y$10$P8ZfX0V9znEZAvoQFje1DO3gE.FqaNs5DWCpH5z98pkJKfD4KVChG', 0),
(4, 'user4', '', '$2y$10$MRTR5rm2sWutSXIELrMnkOjMyJC8iY.j.g2F7eNJkfrmRz1BmJ5OC', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `variedad`
--

CREATE TABLE `variedad` (
  `id_variedad` int(11) NOT NULL,
  `id_comida` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `ingredientes` varchar(400) NOT NULL,
  `imagen` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `variedad`
--

INSERT INTO `variedad` (`id_variedad`, `id_comida`, `nombre`, `ingredientes`, `imagen`) VALUES
(1, 0, 'Muzza', 'Mozzarella, salsa de tomate, aceitunas', 'src/images/5dd9729124e7b.png'),
(2, 1, 'Pollo a la crema', 'Pollo, crema, ciboulette.', 'src/images/5dd97272dac23.png'),
(3, 1, 'Capresse', 'Albahaca, tomate, mozzarella.', 'src/images/5dd9725451a5a.png'),
(4, 2, 'Verdura', 'Acelga, huevo, mozzarella.', 'src/images/5dd972ab626ec.png'),
(5, 3, 'Carne', 'Bola de lomo, condimentos, pan rallado.', 'src/images/5dd9723322b70.png'),
(6, 4, 'Carne', 'Carne picada, condimentos', 'src/images/5ddd6c09a9f40.png');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`id_comentario`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_variedad` (`id_variedad`);

--
-- Indices de la tabla `comida`
--
ALTER TABLE `comida`
  ADD PRIMARY KEY (`id_comida`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `variedad`
--
ALTER TABLE `variedad`
  ADD PRIMARY KEY (`id_variedad`),
  ADD KEY `id_comida` (`id_comida`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comentario`
--
ALTER TABLE `comentario`
  MODIFY `id_comentario` int(60) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `comida`
--
ALTER TABLE `comida`
  MODIFY `id_comida` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `variedad`
--
ALTER TABLE `variedad`
  MODIFY `id_variedad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `comentario_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `comentario_ibfk_2` FOREIGN KEY (`id_variedad`) REFERENCES `variedad` (`id_variedad`);

--
-- Filtros para la tabla `variedad`
--
ALTER TABLE `variedad`
  ADD CONSTRAINT `variedad_ibfk_1` FOREIGN KEY (`id_comida`) REFERENCES `comida` (`id_comida`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

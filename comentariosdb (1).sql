-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-07-2024 a las 21:44:49
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `comentariosdb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `comentario` text NOT NULL,
  `estrellas` int(11) DEFAULT NULL CHECK (`estrellas` >= 0 and `estrellas` <= 5),
  `filtro` int(11) DEFAULT 0 CHECK (`filtro` in (0,1))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`id`, `usuario`, `comentario`, `estrellas`, `filtro`) VALUES
(1, 'usuario1', 'Este es un comentario de prueba.', 5, 1),
(2, 'usuario2', 'Otro comentario de prueba.', 3, 1),
(28, 'usuario1', 'Me encanta este producto', 5, 1),
(29, 'usuario2', 'Excelente servicio, muy recomendable.', 5, 1),
(30, 'usuario3', 'El producto está bien, nada especial.', 3, 0),
(43, 'Casero', 'Puta mierda que comen', 5, 1),
(44, 'sda', 'Puta mierda que comen', 1, 1),
(45, 'admin', 'putos de mierda que son', 3, 0),
(46, 'admin', 'puta mierda', 3, 0),
(47, 'admin', 'puta mierda comen', 3, 1),
(48, 'Cami', 'jajajaja', 3, 1),
(49, 'Cami', 'puta mierda', 3, 0),
(50, 'Cami', 'puta mierda comen', 3, 1),
(51, 'Cami', 'puta', 3, 0),
(52, 'Cami', 'mierda', 3, 1),
(53, 'Cami', 'comen', 3, 1),
(54, 'admin', 'Puta Mierda Comen', 2, 0),
(55, 'admin', 'Puta', 2, 0),
(56, 'admin', 'holi', 2, 1),
(57, 'admin', 'holi mierda', 2, 0),
(58, 'admin', 'holi comen', 2, 1),
(59, 'admin', 'holi puta ', 2, 0),
(60, 'admin', 'El producto está bien, nada especial.', 2, 0),
(61, 'admin', 'El producto está bien', 2, 1),
(62, 'admin', 'El producto está bien, nada .', 2, 0),
(63, 'admin', 'El producto está bien, .', 2, 1),
(64, 'admin', 'nada', 2, 0),
(65, 'admin', 'especial', 2, 1),
(66, 'admin', 'nada especial', 2, 0),
(67, 'admin', 'especial', 2, 1),
(68, 'Tara', 'hola', 2, 1),
(69, 'Tara', 'nada', 2, 0),
(70, 'Tara', 'Me encanta este producto', 2, 1),
(71, 'Tara', '¡Me encanta este producto!', 2, 1),
(72, '12345', 'bien echo', 3, 1),
(73, '12345', 'puta mierda comes', 3, 0),
(74, '12345', 'Mayner Basura', 3, 1),
(75, '12345', 'Basura Mayner', 3, 1),
(76, '12345', 'Basura', 3, 1),
(77, '12345', 'Pitp puta mierda', 3, 0),
(78, '12345', 'Hola', 3, 1),
(79, '12345', 'Subnormal', 1, 0),
(80, '12345', 'imbecil', 1, 0),
(81, 'tania', 'buena', 2, 1),
(82, '111111111111111', 'tan buena', 5, 1),
(83, 'Crow', 'el crack', 5, 1),
(84, 'sdas', '123', 3, 1),
(85, 'Aaron', 'hola', 2, 1),
(86, 'Sushi', 'maestro', 3, 1),
(87, 'daf', 'asd', 3, 0),
(88, 'admin', 'gqgq', 3, 1),
(89, 'Paco', 'Hola mundo', 3, 1),
(90, 'Salamander', 'tara', 3, 1),
(91, 'Kaori', 'Tomates', 4, 1),
(92, 'Tamales', 'baraja', 3, 1),
(93, '123', 'imbecil', 3, 0),
(94, '15415', 'carajo', 3, 1),
(95, '12314', 'carajo', 4, 0),
(96, 'asdasd', 'estupido', 3, 1),
(97, '12', 'estúpido', 3, 1),
(98, '12', 'crow', 3, 0),
(99, '12', 'Crow', 2, 0),
(100, '123', 'crow', 3, 0),
(101, 'dasd', 'hola', 2, 1),
(102, 'ewq', 'crow', 4, 0),
(103, 'Admins', 'hola como estan', 3, 1),
(104, 'asdasdasd', 'Puta mierda que comen', 3, 0),
(105, 'adsasd', 'Crow', 3, 0),
(106, '123123', 'messi', 4, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

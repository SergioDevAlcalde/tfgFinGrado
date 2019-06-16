-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 16-06-2019 a las 21:52:43
-- Versión del servidor: 5.7.19-log
-- Versión de PHP: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_tfg2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `authorities`
--

DROP TABLE IF EXISTS `authorities`;
CREATE TABLE IF NOT EXISTS `authorities` (
  `EMAIL` varchar(50) NOT NULL,
  `AUTHORITY` varchar(50) NOT NULL,
  `ID` bigint(20) DEFAULT NULL,
  KEY `FK_AUTHORITIES_USERS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `authorities`
--

INSERT INTO `authorities` (`EMAIL`, `AUTHORITY`, `ID`) VALUES
('adrianr@mail.com', 'ROLE_USER', 1),
('adrianc@mail.com', 'ROLE_USER', 2),
('sergioa@mail.com', 'ROLE_USER', 3),
('ivanperez@mail.com', 'ROLE_USER', 4),
('juanp@mail.com', 'ROLE_USER', 5),
('juanperez@mail.com', 'ROLE_USER', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `nombre`) VALUES
(1, 'Procesadores'),
(2, 'Perifericos'),
(3, 'Televisores'),
(4, 'Telefonia'),
(5, 'Placas Base'),
(6, 'Discos Duros'),
(7, 'Tarjetas Graficas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `apellido2` varchar(255) NOT NULL,
  `contrasenya` varchar(255) NOT NULL,
  `correo_electronico` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `nombre`, `apellido`, `apellido2`, `contrasenya`, `correo_electronico`, `enabled`) VALUES
(1, 'Adrian', 'Diaz', '', 'admin', 'adrianr@mail.com', 1),
(2, 'Adrian', 'Campos', '', 'admin', 'adrianc@mail.com', 1),
(3, 'Sergio', 'Alcalde', '', 'admin', 'sergioa@mail.com', 1),
(4, 'Ivan', 'Rodriguez', '', 'admin', 'ivanperez@mail.com', 1),
(5, 'Juan', 'Prueba', '', 'admin', 'juanp@mail.com', 1),
(6, 'Juan', 'Perez', 'Gomez', 'admin', 'juanperez@mail.com', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden`
--

DROP TABLE IF EXISTS `orden`;
CREATE TABLE IF NOT EXISTS `orden` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `total` double NOT NULL,
  `Direccion` varchar(255) DEFAULT NULL,
  `CPostal` int(5) DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `id_cliente` bigint(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Id_cliente_fk` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `orden`
--

INSERT INTO `orden` (`id`, `total`, `Direccion`, `CPostal`, `fecha`, `id_cliente`) VALUES
(1, 2532.47, 'Calle Felix Rodriguez de la fuente 6', 28670, '2019-06-11 00:00:00', 1),
(2, 2532.47, 'asdad', 124565, '2019-06-11 00:00:00', 1),
(3, 136.79, 'asdawdw', 12356, '2019-06-12 00:00:00', 1),
(4, 339.29, 'asdad', 12345, '2019-06-12 00:00:00', 1),
(5, 440.91, 'Calle Felix Rodriguez de la fuente 6', 12345, '2019-06-12 00:00:00', 1),
(6, 848.32, 'Calle Felix Rodriguez de la fuente 6', 28670, '2019-06-12 00:00:00', 1),
(7, 2201.27, 'Calle Felix Rodriguez de la fuente 6', 28670, '2019-06-12 00:00:00', 1),
(8, 873.68, 'Calle Felix Rodriguez de la fuente 6', 28670, '2019-06-12 00:00:00', 1),
(9, 2830.71, 'Calle Felix Rodriguez de la fuente 6', 28670, '2019-06-15 00:00:00', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_detalles`
--

DROP TABLE IF EXISTS `orden_detalles`;
CREATE TABLE IF NOT EXISTS `orden_detalles` (
  `ID` bigint(255) NOT NULL AUTO_INCREMENT,
  `CLIENTE_ID` bigint(255) NOT NULL,
  `PRODUCT_ID` bigint(255) NOT NULL,
  `PRODUCT_IMG` varchar(255) DEFAULT NULL,
  `PRODUCT_NOMBRE` varchar(255) DEFAULT NULL,
  `CANTIDAD` int(11) NOT NULL,
  `PRECIO_PROD` double NOT NULL,
  `TOTAL` double NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ORDEN_CLIENTE_FK` (`CLIENTE_ID`),
  KEY `ORDEN_DETALLE_PROD_FK` (`PRODUCT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1164 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `orden_detalles`
--

INSERT INTO `orden_detalles` (`ID`, `CLIENTE_ID`, `PRODUCT_ID`, `PRODUCT_IMG`, `PRODUCT_NOMBRE`, `CANTIDAD`, `PRECIO_PROD`, `TOTAL`) VALUES
(1158, 3, 10003, '10003.jpg', 'Intel Core i7-8700 3.2Ghz BOX', 1, 278.91, 278.91);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE IF NOT EXISTS `producto` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `id_categoria` bigint(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `precio` double NOT NULL,
  `descripcion` text CHARACTER SET utf8 COLLATE utf8_spanish_ci,
  `fotografia` varchar(255) DEFAULT NULL,
  `portada` tinyint(1) NOT NULL,
  `Stock` int(11) NOT NULL DEFAULT '150',
  `PrecioDescuento` double NOT NULL,
  `descuento` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `categoria` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=70008 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `id_categoria`, `nombre`, `precio`, `descripcion`, `fotografia`, `portada`, `Stock`, `PrecioDescuento`, `descuento`) VALUES
(10001, 1, 'Procesador AMD Ryzen 3.4 Ghz\r\n', 151.99, 'Te presentamos el AMD Ryzen 5 2600, un procesador que cuenta con 6 núcleos, socket AMD AM4 y arquitectura de 64 bits. Y es que la forma de contratacar de AMD ha sido contundente, lo nuevos Ryzen no solo demuestran mayor efectividad si no tambien un consumo mucho más contenido que sus predecesores. Los procesadores AMD Ryzen están diseñados para satisfacer las necesidades de los usuarios más avanzados y exigentes. Para minimizar la latencia de respuesta AMD lanza la tecnología Turbo Core que dará la mayor frecuencia del núcleo cuando lo necesita.\r\n', '10001.jpg', 1, 137, 136.79, 10),
(10002, 1, 'Intel Core i5-8400 2.8GHz BOX', 193.99, 'Te presentamos el Intel Core i5-8400, un procesador de 8va Generación y socket Intel 1151.', '10002.jpg', 0, 152, 164.89, 15),
(10003, 1, 'Intel Core i7-8700 3.2Ghz BOX', 309.9, 'Te presentamos el Intel Core i7-8700, un procesador de 8va Generación, con socket Intel 1151.', '10003.jpg', 1, 154, 278.91, 10),
(10004, 1, 'Intel Core i5-9600K 3.7Ghz BOX', 250.99, 'Sólo compatible con sus placas base basadas en chipset de la serie 300, el procesador Intel Core i5-9600K 3.7 GHz Six-Core LGA 1151 está diseñado para juegos, creación y productividad.\r\nTiene una velocidad de reloj base de 3.7 GHz y viene con características como la compatibilidad con Intel Optane Memory, el cifrado AES-NI, la tecnología Intel vPro, Intel TXT, la Protección de dispositivos Intel con Boot Guard, la tecnología de virtualización Intel VT-d para E / S.\r\nCon la tecnología Intel Turbo Boost Max 3.0, la frecuencia máxima de turbo que este procesador puede alcanzar es de 4.6 GHz. Además, este procesador cuenta con 6 núcleos con 6 subprocesos en un zócalo LGA 1151, tiene 9 MB de memoria caché y 24 líneas PCIe. Tener 6 núcleos permite que el procesador ejecute varios programas simultáneamente sin ralentizar el sistema, mientras que los 6 subprocesos permiten que una secuencia de instrucciones ordenada básica pase o sea procesada por un solo núcleo de CPU. Este procesador también admite memoria RAM DDR4-2666 de doble canal y utiliza tecnología de novena generación.', '10004.jpg', 0, 155, 213.34, 15),
(10005, 1, 'Procesador AMD Ryzen 7 4.1Ghz', 230.99, 'Te presentamos el AMD Ryzen 7 2700, un procesador que cuenta con 8 núcleos, socket AMD AM4 y arquitectura de 64 bits. Y es que la forma de contratacar de AMD ha sido contundente, lo nuevos Ryzen no solo demuestran mayor efectividad si no tambien un consumo mucho más contenido que sus predecesores. Los procesadores AMD Ryzen están diseñados para satisfacer las necesidades de los usuarios más avanzados y exigentes. Para minimizar la latencia de respuesta AMD lanza la tecnología Turbo Core que dará la mayor frecuencia del núcleo cuando lo necesita', '10005.jpg', 0, 150, 207.89, 10),
(10006, 1, 'Intel Core i3-8100 3.6GHz BOX', 120.99, 'Te presentamos el Intel Core i3-8100, un procesador Intel de 8va Generación con socket Intel 1151.', '10006.jpg', 0, 150, 96.79, 20),
(10007, 1, 'Intel Core i9-9900K 3.6Ghz BOX', 489.9, 'Sólo compatible con sus placas base basadas en chipset de la serie 300, el procesador Intel Core i9-9900K 3.6 GHz Eight-Core LGA 1151 está diseñado para juegos, creación y productividad.\r\nTiene una velocidad de reloj base de 3.6 GHz y viene con características como la compatibilidad con Intel Optane Memory, el cifrado AES-NI, la tecnología Intel vPro, Intel TXT, la Protección de dispositivos Intel con Boot Guard, la tecnología de virtualización Intel VT-d para E / S dirigida y la tecnología Intel Hyper-Threading para tareas múltiples de 16 vías.\r\nCon la tecnología Intel Turbo Boost Max 3.0, la frecuencia máxima de turbo que este procesador puede alcanzar es de 5.0 GHz. Además, este procesador cuenta con 8 núcleos con 16 subprocesos en un zócalo LGA 1151, tiene 16 MB de memoria caché y 24 líneas PCIe. Tener 8 núcleos permite que el procesador ejecute varios programas simultáneamente sin ralentizar el sistema, mientras que los 16 subprocesos permiten que una secuencia de instrucciones ordenada básica pase o sea procesada por un solo núcleo de CPU. Este procesador también admite memoria RAM DDR4-2666 de doble canal y utiliza tecnología de novena generación.', '10007.jpg', 1, 144, 440.91, 10),
(20001, 2, 'AOC 22B1H 21.5\" LCD FullHD', 79.99, 'Te presentamos el monitor LED FullHD de 21.5 pulgadas 22B1H de AOC.', '20001.jpg', 0, 150, 71.99, 10),
(20002, 2, 'LG 24MP59G-P 24\"\" LED Full HD IPS', 119, 'El monitor LG 24MP59G-P 24 pulgadas Full HD con 1 ms Motion Blur Reduction permite a los jugadores disfrutar de la precisión necesaria para jugar a un nivel muy alto. Con un tiempo de respuesta que es prácticamente de 1 ms, la acción es más suave y los juegos más precisos.\r\n\r\nAdemás, el monitor LG 24MP59G-P 24 pulgadas cuenta con FreeSync, que reduce el roce y el parpadeo que se producen entre la velocidad de fotogramas de una tarjeta gráfica y la frecuencia de actualización de un monitor. Con FreeSync, los jugadores pueden experimentar un movimiento sin fisuras y fluido a lo largo de sus juegos.', '20002.jpg', 0, 148, 95.2, 20),
(20003, 2, 'Tempest K9 Backlit Gaming RGB', 14.25, 'Con un diseño gaming, ligero y súper compacto, el K9 RGB Backlit Gaming Keyboard es un increíble teclado con retroiluminación RGB, conexión USB y 105 teclas con disposición en español. Elige entre sus nueve modos de retroiluminación, diviértete con los siete colores diferentes integrados y ajusta el brillo de las teclas de acuerdo con tus necesidades.', '20003.jpg', 0, 150, 12.83, 10),
(20004, 2, 'Logitech Wireless Combo MK270', 25.63, 'Tecnología inalámbrica de gran alcance. Conexión rápida y fiable a una distancia de hasta 10 metros sin apenas retrasos ni interferencias gracias a la tecnología inalámbrica avanzada de 2,4 GHz de Logitech.* * El radio de acción inalámbrico depende de las condiciones ambientales y del ordenador.', '20004.jpg', 0, 150, 21.79, 15),
(20005, 2, 'Logitech K400+ Wireless Keyboard', 29.99, 'Las utilidades de un teclado inalámbrico son tantas que no podemos si no alabar al Logitech K400. Un teclado compatible con cualquier dispositivo con conexión USB para el receptor Unifying.\r\nDisfruta conectado a tu smartTV cómodamente desde tu sofá gracias a la tecnología inalámbrica Unifying con la que puedes conectar hasta seis dispositivos Logitech en un radio de acción de 10 metros.\r\nEl teclado Logitech K400 tiene un diseño enfocado al uso multimedia tanto en PC como TV. Ya no tiene que ser complicado navegar por los menús de tu SmartTV gracias a su intuitivo touchpad.\r\nEste teclado Logitech funciona con dos pilas AA y tiene unas dimensiones de 13,9 x 35,4 cm y es compatible con Windows 7, 8 y 10, además de Android y ChromeOS.', '20005.jpg', 0, 150, 25.49, 15),
(20006, 2, 'Tempest Gaming M8 2.0 Speaker', 13.99, 'El Gaming M8 2.0 Speaker System de Tempest es un compacto sistema de altavoces USB con control de volumen integrado y una gran potencia de 10W RMS, repartida entre los dos satélites, para que puedas disfrutar al máximo de toda tu música, vídeos y juegos.', '20006.jpg', 0, 150, 9.79, 30),
(20007, 2, 'Logitech G430 Surround Sound 7.1', 35.99, 'Te acaban de dar una paliza por que no podías comunicarte con tus compañeros de equipo. Eso no te habría pasado si tuvieras unos Logitech G430, los auriculares gaming con el sonido más avanzado del mercado.', '20007.jpg', 0, 150, 32.39, 10),
(30001, 3, 'Samsung UE50NU7092 50\" LED UltraHD 4K', 369, 'Resolución 4K UHD real.Disfruta de imágenes nítidas y brillantes con el televisor 4K UHD, con una resolución cuatro veces superior a la del Full HD. Prepárate para percibir hasta el más mínimo detalle en todas tus escenas.', '30001.jpg', 0, -10, 313.65, 15),
(30002, 3, 'LG 43UK6400PLF 43\" LED UltraHD 4K', 415, 'El primer TV con Inteligencia Artificial gracias a la tecnología LG TV AI ThinQ. y con Procesador Quad Core de 10 Bits', '30002.jpg', 1, 149, 290.5, 30),
(30003, 3, 'LG 43UK6200PLA 43\" LED IPS UltraHD 4KLG', 305, 'Descubre del primer Smart TV con inteligencia artificial (google assistant). Con el sistema Smart TV webOS 4.0, disfruta de contenidos para toda la familia de la manera más fácil y segura. Mando Magic control no incluido (necesario para utilizar el sistema de inteligencia Artificial).', '30003.jpg', 1, 148, 259.25, 15),
(30004, 3, 'LG 43UK6950PLB 43\" LED UltraHD 4K', 389, 'LG Ultra HD TV 4K con Inteligencia Artificial, Procesador Quad Core, 3xHDR, Sonido Virtual: X.', '30004.jpg', 0, 150, 350.1, 10),
(30005, 3, 'LG 55UK6200PLA 55\" LED IPS UltraHD 4K', 419, 'LED Ultra HD TV 4K con pantalla IPS, 139 cm (55 pulgadas), Inteligencia Artificial, Procesador Quad Core, 3xHDR, Sonido Ultra Surround.', '30005.jpg', 0, 147, 335.2, 20),
(30006, 3, 'Samsung UE50NU7025 50\" LED UltraHD 4K', 410, 'Disfruta de imágenes nítidas y brillantes con el televisor 4K UHD, con una resolución cuatro veces superior a la del Full HD. Prepárate para percibir hasta el más mínimo detalle en todas tus escenas.', '30006.jpg', 1, 149, 348.5, 15),
(30007, 3, 'LG 32LK6200PLA 32\" LED FullHD Blanca', 259, 'El corazón de la auténtica imagen. El procesador Quad Core trabaja incansablemente para reducir el ruido que distrae, mejorar la nitidez incluso en las imágenes con resolución más baja y aumentarla hasta obtener una calidad de imagen cercana a 4K.', '30007.jpg', 0, 150, 181.3, 30),
(40001, 4, 'Huawei P30 Lite 4/128GB Negro Libre', 329, 'Huawei P30 Lite, el tamaño importa con triple cámara de 48MP. Vea, haga y cree más con el nuevo Huawei P30 lite. Su pantalla de 6,15 pulgadas es un lienzo magnífico para que vivas tu vida en colores brillantes. Además, cabe cómodamente en la palma de su mano. El diseño delgado está pensado para un fácil agarre y uso con una sola mano.', '40001.jpg', 1, 150, 296.1, 10),
(40002, 4, 'Xiaomi Mi A2 4GB/64GB 4G Dual Sim', 180.9, 'El Xiaomi Mi A2 ya ha llegado. Después del éxito conseguido por Xiaomi con el Mi A1, el fabricante chino acaba de presentar a su sucesor: el Xiaomi Mi A2.', '40002.jpg', 0, 150, 153.77, 15),
(40003, 4, 'OnePlus 6T 8GB/128GB Mirror Black', 549, 'Desbloquea tu futuro. Desbloquea tu OnePlus 6T con el sensor de huella dactilar en pantalla más rápido del mercado. Estamos estableciendo un nuevo estándar con nuestra avanzada tecnología de desbloqueo de pantalla.\r\nEl OnePlus 6T ha sido cuidadosamente diseñado: cuenta con nuestra pantalla más grande hasta la fecha y una parte trasera resistente hecha de cristal. Disfruta de una pantalla Optic AMOLED de 6,41 pulgadas y consigue una auténtica inmersión gracias a un 86 % de ocupación de pantalla, una silueta fina y mucho más.', '40003.jpg', 0, 150, 466.65, 15),
(40004, 4, 'Apple iPhone XR 64Gb Negro Libre', 769, 'Nueva pantalla Liquid Retina con la tecnología LCD más avanzada del sector. Face ID aún más rápido. El chip más inteligente y con mayor potencia en un smart­phone. Y un revolucio­nario sistema de cámara. Da igual por dónde lo mires: el iPhone XR es sencillamente asombroso.', '40004.jpg', 1, 146, 692.1, 10),
(40005, 4, 'Samsung Galaxy A40 4/64GB Negro', 225, 'Cambia a la nuevo generación de Galaxy A, todo lo que amas ahora con más innovación. Una línea completa de modelos especialmente diseñada para ti. La revolucionaria cámara te permitirá capturar el mundo como lo ves. La impresionante pantalla te dará una experiencia increíble. Además, su potente batería será la clave para liberarse de las tomas de corriente y abrirá un mar de posibilidades.', '40005.jpg', 1, 148, 202.5, 10),
(40006, 4, 'Alcatel 1 OneTouch 4G Azul Libre', 55, 'Alcatel 1 es un smartphone que ofrece todo lo que necesitas: una pantalla de gran tamaño en un dispositivo compacto y ligero, un diseño distintivo y una cámara con amplias funciones para compartir contenido en redes sociales.', '40006.jpg', 0, 150, 44, 20),
(40007, 4, 'Xiaomi Redmi S2 4/64GB Dual Sim', 154.99, 'El Xiami Redmi S2 es lo último en smartphones de la compañía China, el Redmi S2 se presenta como un firme rival para terminales cómo el P Smart de Huawei.Su cuerpo de aluminio, incorpora una pantalla de 5.99 pulgadas.  Bajo la carcasa encontramos un procesador Snapdragon 625, 4GB de RAM y 64GB de almacenamiento.', '40007.jpg', 0, 150, 139.49, 10),
(50001, 5, 'Gigabyte GA-B360M DS3H', 69.99, 'Te presentamos la GA-B360M DS3H de Gigabyte, una placa base con socket LGA 1151 y chipset B360.', '50001.jpg', 0, 150, 59.49, 15),
(50002, 5, 'MSI Z390-A PRO', 125.9, 'La placa gaming MSI Z390-A PRO tiene socket Intel 1151 y soporta procesadores Intel de 8va y 9na generación.', '50002.jpg', 0, 150, 113.31, 10),
(50003, 5, 'Gigabyte Z390 Gaming X', 135.99, 'La nueva placa base Gigabyte, Z390 Gaming X, que soporta procesadores de 8va y 9na generación gracias a su socket Intel 1151 y su chipset Z390.', '50003.jpg', 0, 150, 95.19, 30),
(50004, 5, 'Asus PRIME B450M-A', 65.99, 'Las placas base ASUS Prime B450 Series proporcionan la base sólida necesaria para su primera construcción, además de la flexibilidad para crecer con sus ambiciones. Hemos fusionado todo lo bueno que se empaqueta en los procesadores AMD Ryzen con el diseño e ingeniería esencial de ASUS, por lo que se beneficia de las tecnologías líderes en la industria, que incluyen el ajuste automático del sistema, controles integrales de refrigeración y audio inmersivo integrado. Cuando construye con una placa madre, desarrolla de forma inteligente, fácil y asequible.', '50004.jpg', 0, 150, 59.39, 10),
(50005, 5, 'Gigabyte GA-H110M-S2H', 49.99, 'GA-H110M-S2H es la nueva placa de Gigabyte que viene a cubrir la gama económica de esta marca. Un producto que nos ofrece una multitud de opciones y conexiones muy competitivas para el precio que tiene.', '50005.jpg', 0, 150, 42.49, 15),
(50006, 5, 'Gigabyte B450 AORUS M', 79.99, 'AMD presenta los últimos procesadores de la serie Ryzen 2000 para proporcionar la potencia de cómputo necesaria para los juegos. Las placas base de la serie 400 de GIGABYTE se ajustan perfectamente al rendimiento informático de los procesadores de la serie AMD Ryzen 2000 con más funciones y más control. Los usuarios pueden disfrutar los beneficios traídos por los procesadores de la serie AMD Ryzen 2000.', '50006.jpg', 0, 150, 71.99, 10),
(50007, 5, 'MSI B450M PRO-M2 V2', 65.99, 'Te presentamos la MSI B450M-PRO-M2 V2 Plus, una placa base con socket AMD AM4 y chipset B450.', '50007.jpg', 0, 150, 46.19, 30),
(60001, 6, 'Seagate BarraCuda 3.5\" 1TB SATA3', 39.99, 'Versátiles. Rápidos. Fiables. La unidad de disco duro más increíble que haya conocido. ', '60001.jpg', 0, 150, 35.99, 10),
(60002, 6, 'Kingston A400 SSD 240GB SATA3', 30.99, 'La unidad A400 de estado sólido de Kingston ofrece enormes mejoras en la velocidad de respuesta, sin actualizaciones adicionales del hardware. Brinda lapsos de arranque, carga y de transferencia de archivos increíblemente más breves en comparación con las unidades de disco duro mecánico.', '60002.jpg', 0, 150, 26.34, 15),
(60003, 6, 'Seagate BarraCuda 3.5\" 2TB SATA 3', 62.9, 'Impresionante versatilidad. Fiabilidad inigualable. Seagate incorpora más de 20 años de rendimiento y fiabilidad dignos de confianza a las unidades de disco duro Seagate BarraCuda de 3,5 pulgadas. ahora disponibles en diferentes capacidades.', '60003.jpg', 0, 149, 56.61, 10),
(60004, 6, 'Toshiba OCZ TR200 SSD 240GB SATA3', 36.99, 'Actualizar desde una unidad de disco duro (HDD) debería ser fácil y asequible y es ahí donde entran las SSD OCZ TR200. Diseñada para aumentar la velocidad de su computadora portátil o PC en discos duros convencionales, la Serie TR200 aprovecha la avanzada tecnología 3D BiCS FLASH de 64 capas de Toshiba , para ofrecer un rendimiento equilibrado, fiabilidad y valor que transformará su sistema móvil o de escritorio.', '60004.jpg', 0, 150, 33.29, 10),
(60005, 6, 'Samsung 860 EVO Basic SSD 500GB SATA3', 69.99, 'Descubra la nueva edición de la gama Samsung SATA SSD, la gama Samsung 860 EVO. Especialmente diseñadas para el uso diario de PC, con tecnología V-NAND y un controlador robusto basado en algoritmos, estas SSD rápidas y confiables están disponibles en una variedad de formatos y capacidades. El 860 EVO ofrece el mejor rendimiento de lectura y escritura, incluso en multitareas. El 860 EVO puede entregar velocidades de escritura de hasta 520 MB/s con tecnología inteligente TurboWrite, y velocidades de lectura de hasta 550 MB/s.', '60005.jpg', 0, 150, 48.99, 30),
(60006, 6, 'WD Blue 3D Nand SSD SATA 500GB', 55.99, 'Preparado para sus necesidades informáticas de alto rendimiento, el SSD WD Blue 3D NAND SATA ofrece alta capacidad, fiabilidad mejorada y una velocidad increíblemente rápida.', '60006.jpg', 0, 150, 50.39, 10),
(70001, 7, 'Gigabyte Radeon RX 570 Gaming 8G MI 8GB GDDR5', 169.99, 'Te presentamos la tarjeta gráfica Gigabyte Radeon RX 570 Gaming 8G MI con 8 GB GDDR5.\r\nLa Radeon RX 570 Gaming 8G MI te hará contar con el mayor rendimiento gracias a su efectiva capacidad de disipación del calor. ¿La clave? Un ventilador de hoja de 90mm, ventilador activo 3D y una elegante placa de metal exterior. Además, la Gigabyte Radeon cuenta con materiales ultra-duraderos: condensadores e alta calidad para una mayor vida útil del sistema.', '70001.jpg', 0, 150, 135.99, 20),
(70002, 7, 'Gigabyte GeForce RTX 2070 WindForce 8G 8GB GDDR6', 529.99, 'El nuevo buque insignia de NVIDIA, GeForce RTX 2070, es la GPU para juegos más avanzada del planeta, impulsada por la arquitectura NVIDIA Turing de alto rendimiento, con 8GB GDDR6 y sistema ded ventilación WindForce exclusivo de Gigabyte.', '70002.jpg', 0, 150, 476.99, 10),
(70003, 7, 'Zotac Gaming GeForce RTX 2060 Twin Fan 6GB GDDR6', 329.99, 'La nueva generación de tarjetas gráficas ZOTAC GAMING GeForce está aquí. La nueva y poderosa GeForce RTX 2060 aprovecha la vanguardista arquitectura NVIDIA Turing para sumergirte en un increíble realismo y rendimiento en los últimos juegos. El futuro de los juegos comienza aquí.', '70003.jpg', 0, 150, 296.99, 10),
(70004, 7, 'ASUS Gaming GeForce GTX 1050Ti 4GB GDDR5', 159.9, 'ASUS Cerberus GeForce GTX 1050 Ti es la tarjeta gráfica de alto rendimiento diseñada con mayor confiabilidad y rendimiento para una acción de juego sin límites. Probamos la tarjeta al máximo con los juegos más recientes y llevamos a cabo pruebas exhaustivas durante 15 veces más que los estándares de la industria.', '70004.jpg', 0, 150, 143.91, 10),
(70005, 7, 'Gigabyte GeForce GTX 1070 G1 Gaming 8GB GDDR5', 369.99, 'Con hasta un 100% más de rendimiento que las tarjetas de la serie anterior y un espectacular desempeño gráfico en videojuegos y realidad virtual, llegan a nosotros las GTX 1070, las joyas de la corona de las tarjetas gráficas. La serie 70 es tradicionalmente la mejor serie en cuanto a relación calidad/precio.', '70005.jpg', 0, 150, 258.99, 30),
(70006, 7, 'MSI GeForce RTX 2060 Ventus OC 6GB GDDR6', 379, 'Te presentamos la tarjeta gráfica Ventus de Msi. Con un nuevo diseño de doble ventilador, VENTUS muestra con orgullo sus formas industriales en colores neutros para adaptarse a cualquier construcción.', '70006.jpg', 0, 150, 265.3, 30),
(70007, 7, 'Sapphire Nitro+ Radeon RX 590 8GB GDDR5 UEFI', 239.99, 'La serie SAPPHIRE NITRO+ cuenta con las últimas tecnologías de alto rendimiento: núcleos de edición limitada, Tri-XX, las mejores tecnologías de refrigeración y mucho más. Con contornos elegantes y un estilo único, se adaptan fácilmente a cualquier ordenador que quieras ensamblar. Con la última arquitectura de gráficos AMD, con NITRO+ tendrás una experiencia de juego rápida y confiable, sea cual sea tu juego.', '70007.jpg', 0, 150, 215.99, 10);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `authorities`
--
ALTER TABLE `authorities`
  ADD CONSTRAINT `FK_AUTHORITIES_USERS` FOREIGN KEY (`ID`) REFERENCES `cliente` (`id`);

--
-- Filtros para la tabla `orden`
--
ALTER TABLE `orden`
  ADD CONSTRAINT `Id_cliente_fk` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `orden_detalles`
--
ALTER TABLE `orden_detalles`
  ADD CONSTRAINT `ORDEN_CLIENTE_FK` FOREIGN KEY (`CLIENTE_ID`) REFERENCES `cliente` (`id`),
  ADD CONSTRAINT `ORDEN_DETALLE_PROD_FK` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `producto` (`id`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
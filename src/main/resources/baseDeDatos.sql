-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 02-06-2019 a las 20:02:49
-- Versión del servidor: 10.1.37-MariaDB
-- Versión de PHP: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_tfg`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `authorities`
--

CREATE TABLE `authorities` (
  `NOMBRE` varchar(50) NOT NULL,
  `AUTHORITY` varchar(50) NOT NULL,
  `ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `authorities`
--

INSERT INTO `authorities` (`NOMBRE`, `AUTHORITY`, `ID`) VALUES
('andres', 'ROLE', 1),
('Andres', 'ROLE_USER', 1),
('paquito', 'ROLE_USER', 41),
('adrian', 'ROLE_USER', 43);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id` bigint(255) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `nombre`) VALUES
(1, 'procesadores'),
(2, 'perifericos'),
(3, 'Televisores'),
(4, 'Telefonia'),
(5, 'placas_base'),
(6, 'discos_duros'),
(7, 'tarjetas_graficas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` bigint(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `contrasenya` varchar(255) NOT NULL,
  `correo_electronico` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `nombre`, `apellido`, `contrasenya`, `correo_electronico`, `enabled`) VALUES
(1, 'Andres', 'Guzman', 'admin', 'profesor@bolsadeideas.com', 1),
(2, 'John', 'Doe', 'admin', 'john.doe@gmail.com', 0),
(3, 'Linus', 'Torvalds', 'admin', 'linus.torvalds@gmail.com', 0),
(4, 'Jane', 'Doe', 'admin', 'jane.doe@gmail.com', 0),
(5, 'Rasmus', 'Lerdorf', 'admin', 'rasmus.lerdorf@gmail.com', 0),
(6, 'Erich', 'Gamma', 'admin', 'erich.gamma@gmail.com', 0),
(7, 'Richard', 'Helm', 'admin', 'richard.helm@gmail.com', 0),
(8, 'Ralph', 'Johnson', 'admin', 'ralph.johnson@gmail.com', 0),
(9, 'John', 'Vlissides', 'admin', 'john.vlissides@gmail.com', 0),
(10, 'James', 'Gosling', 'admin', 'james.gosling@gmail.com', 0),
(11, 'Bruce', 'Lee', 'admin', 'bruce.lee@gmail.com', 0),
(12, 'Johnny', 'Doe', 'admin', 'johnny.doe@gmail.com', 0),
(13, 'John', 'Roe', 'admin', 'john.roe@gmail.com', 0),
(14, 'Jane', 'Roe', 'admin', 'jane.roe@gmail.com', 0),
(15, 'Richard', 'Doe', 'admin', 'richard.doe@gmail.com', 0),
(16, 'Andres', 'Guzman', 'admin', 'profesor@bolsadeideas.com', 0),
(17, 'John', 'Doe', 'admin', 'john.doe@gmail.com', 0),
(18, 'Linus', 'Torvalds', 'admin', 'linus.torvalds@gmail.com', 0),
(19, 'Jane', 'Doe', 'admin', 'jane.doe@gmail.com', 0),
(20, 'Rasmus', 'Lerdorf', 'admin', 'rasmus.lerdorf@gmail.com', 0),
(21, 'Erich', 'Gamma', 'admin', 'erich.gamma@gmail.com', 0),
(22, 'Richard', 'Helm', 'admin', 'richard.helm@gmail.com', 0),
(23, 'Ralph', 'Johnson', 'admin', 'ralph.johnson@gmail.com', 0),
(24, 'John', 'Vlissides', 'admin', 'john.vlissides@gmail.com', 0),
(25, 'James', 'Gosling', 'admin', 'james.gosling@gmail.com', 0),
(26, 'Bruce', 'Lee', 'admin', 'bruce.lee@gmail.com', 0),
(27, 'Johnny', 'Doe', 'admin', 'johnny.doe@gmail.com', 0),
(28, 'John', 'Roe', 'admin', 'john.roe@gmail.com', 0),
(29, 'Jane', 'Roe', 'admin', 'jane.roe@gmail.com', 0),
(30, 'Richard', 'Doe', 'admin', 'richard.doe@gmail.com', 0),
(31, 'Janie', 'Doe', 'admin', 'janie.doe@gmail.com', 0),
(32, 'Phillip', 'Webb', 'admin', 'phillip.webb@gmail.com', 0),
(33, 'Stephane', 'Nicoll', 'admin', 'stephane.nicoll@gmail.com', 0),
(34, 'Sam', 'Brannen', 'admin', 'sam.brannen@gmail.com', 0),
(35, 'Juergen', 'Hoeller', 'admin', 'juergen.Hoeller@gmail.com', 0),
(36, 'Janie', 'Roe', 'admin', 'correo_electronico@correo_electronico.com', 0),
(37, 'John', 'Smith', 'admin', 'john.smith@gmail.com', 0),
(38, 'Joe', 'Bloggs', 'admin', 'joe.bloggs@gmail.com', 0),
(39, 'John', 'Stiles', 'admin', 'john.stiles@gmail.com', 0),
(40, 'Richard', 'Roe', 'admin', 'stiles.roe@gmail.com', 0),
(41, 'paquito', 'franquito', 'hola', 'elpaquito@email.com', 0),
(43, 'adrian', 'adrian', 'adrian', 'adrian@mail.com', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id` bigint(255) NOT NULL,
  `id_pedido` int(255) NOT NULL,
  `id_forma_pago` bigint(255) NOT NULL,
  `fecha` date NOT NULL,
  `total` bigint(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `forma_pago`
--

CREATE TABLE `forma_pago` (
  `id` bigint(20) NOT NULL,
  `tipo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `forma_pago`
--

INSERT INTO `forma_pago` (`id`, `tipo`) VALUES
(1, 'tarjeta'),
(2, 'efectivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id` bigint(255) NOT NULL,
  `id_cliente` bigint(255) NOT NULL,
  `id_pedido_prod` bigint(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_producto`
--

CREATE TABLE `pedido_producto` (
  `id` bigint(255) NOT NULL,
  `id_pedido` bigint(255) NOT NULL,
  `id_producto` bigint(255) NOT NULL,
  `cantidad` bigint(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` bigint(255) NOT NULL,
  `id_categoria` bigint(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `precio` double NOT NULL,
  `descripcion` text CHARACTER SET utf8 COLLATE utf8_spanish_ci,
  `fotografia` varchar(255) DEFAULT NULL,
  `portada` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `id_categoria`, `nombre`, `precio`, `descripcion`, `fotografia`, `portada`) VALUES
(10001, 1, 'Procesador AMD Ryzen 5 2600 3.4 Ghz\r\n', 151.99, 'Te presentamos el AMD Ryzen 5 2600, un procesador que cuenta con 6 núcleos, socket AMD AM4 y arquitectura de 64 bits. Y es que la forma de contratacar de AMD ha sido contundente, lo nuevos Ryzen no solo demuestran mayor efectividad si no tambien un consumo mucho más contenido que sus predecesores. Los procesadores AMD Ryzen están diseñados para satisfacer las necesidades de los usuarios más avanzados y exigentes. Para minimizar la latencia de respuesta AMD lanza la tecnología Turbo Core que dará la mayor frecuencia del núcleo cuando lo necesita.\r\n', '10001.jpg', 1),
(10002, 1, 'Intel Core i5-8400 2.8GHz BOX', 193.99, 'Te presentamos el Intel Core i5-8400, un procesador de 8va Generación y socket Intel 1151.', '10002.jpg', 0),
(10003, 1, 'Intel Core i7-8700 3.2Ghz BOX', 309.9, 'Te presentamos el Intel Core i7-8700, un procesador de 8va Generación, con socket Intel 1151.', '10003.jpg', 1),
(10004, 1, 'Intel Core i5-9600K 3.7Ghz', 250.99, 'Sólo compatible con sus placas base basadas en chipset de la serie 300, el procesador Intel Core i5-9600K 3.7 GHz Six-Core LGA 1151 está diseñado para juegos, creación y productividad.\r\nTiene una velocidad de reloj base de 3.7 GHz y viene con características como la compatibilidad con Intel Optane Memory, el cifrado AES-NI, la tecnología Intel vPro, Intel TXT, la Protección de dispositivos Intel con Boot Guard, la tecnología de virtualización Intel VT-d para E / S.\r\nCon la tecnología Intel Turbo Boost Max 3.0, la frecuencia máxima de turbo que este procesador puede alcanzar es de 4.6 GHz. Además, este procesador cuenta con 6 núcleos con 6 subprocesos en un zócalo LGA 1151, tiene 9 MB de memoria caché y 24 líneas PCIe. Tener 6 núcleos permite que el procesador ejecute varios programas simultáneamente sin ralentizar el sistema, mientras que los 6 subprocesos permiten que una secuencia de instrucciones ordenada básica pase o sea procesada por un solo núcleo de CPU. Este procesador también admite memoria RAM DDR4-2666 de doble canal y utiliza tecnología de novena generación.', '10004.jpg', 0),
(10005, 1, 'Procesador AMD Ryzen 7 2700 4.1 Ghz', 230.99, 'Te presentamos el AMD Ryzen 7 2700, un procesador que cuenta con 8 núcleos, socket AMD AM4 y arquitectura de 64 bits. Y es que la forma de contratacar de AMD ha sido contundente, lo nuevos Ryzen no solo demuestran mayor efectividad si no tambien un consumo mucho más contenido que sus predecesores. Los procesadores AMD Ryzen están diseñados para satisfacer las necesidades de los usuarios más avanzados y exigentes. Para minimizar la latencia de respuesta AMD lanza la tecnología Turbo Core que dará la mayor frecuencia del núcleo cuando lo necesita', '10005.jpg', 0),
(10006, 1, 'Intel Core i3-8100 3.6GHz BOX', 120.99, 'Te presentamos el Intel Core i3-8100, un procesador Intel de 8va Generación con socket Intel 1151.', '10006.jpg', 0),
(10007, 1, 'Intel Core i9-9900K 3.6Ghz', 489.9, 'Sólo compatible con sus placas base basadas en chipset de la serie 300, el procesador Intel Core i9-9900K 3.6 GHz Eight-Core LGA 1151 está diseñado para juegos, creación y productividad.\r\nTiene una velocidad de reloj base de 3.6 GHz y viene con características como la compatibilidad con Intel Optane Memory, el cifrado AES-NI, la tecnología Intel vPro, Intel TXT, la Protección de dispositivos Intel con Boot Guard, la tecnología de virtualización Intel VT-d para E / S dirigida y la tecnología Intel Hyper-Threading para tareas múltiples de 16 vías.\r\nCon la tecnología Intel Turbo Boost Max 3.0, la frecuencia máxima de turbo que este procesador puede alcanzar es de 5.0 GHz. Además, este procesador cuenta con 8 núcleos con 16 subprocesos en un zócalo LGA 1151, tiene 16 MB de memoria caché y 24 líneas PCIe. Tener 8 núcleos permite que el procesador ejecute varios programas simultáneamente sin ralentizar el sistema, mientras que los 16 subprocesos permiten que una secuencia de instrucciones ordenada básica pase o sea procesada por un solo núcleo de CPU. Este procesador también admite memoria RAM DDR4-2666 de doble canal y utiliza tecnología de novena generación.', '10007.jpg', 1),
(20001, 2, 'AOC 22B1H 21.5\" LCD FullHD', 79.99, 'Te presentamos el monitor LED FullHD de 21.5 pulgadas 22B1H de AOC.', '20001.jpg', 0),
(20002, 2, 'LG 24MP59G-P 24\"\" LED Full HD IPS', 119, 'El monitor LG 24MP59G-P 24 pulgadas Full HD con 1 ms Motion Blur Reduction permite a los jugadores disfrutar de la precisión necesaria para jugar a un nivel muy alto. Con un tiempo de respuesta que es prácticamente de 1 ms, la acción es más suave y los juegos más precisos.\r\n\r\nAdemás, el monitor LG 24MP59G-P 24 pulgadas cuenta con FreeSync, que reduce el roce y el parpadeo que se producen entre la velocidad de fotogramas de una tarjeta gráfica y la frecuencia de actualización de un monitor. Con FreeSync, los jugadores pueden experimentar un movimiento sin fisuras y fluido a lo largo de sus juegos.', '20002.jpg', 0),
(20003, 2, 'Tempest K9 RGB Backlit Teclado Gaming RGB', 14.25, 'Con un diseño gaming, ligero y súper compacto, el K9 RGB Backlit Gaming Keyboard es un increíble teclado con retroiluminación RGB, conexión USB y 105 teclas con disposición en español. Elige entre sus nueve modos de retroiluminación, diviértete con los siete colores diferentes integrados y ajusta el brillo de las teclas de acuerdo con tus necesidades.', '20003.jpg', 0),
(20004, 2, 'Logitech Wireless Combo MK270 Teclado Inalámbrico', 25.63, 'Tecnología inalámbrica de gran alcance. Conexión rápida y fiable a una distancia de hasta 10 metros sin apenas retrasos ni interferencias gracias a la tecnología inalámbrica avanzada de 2,4 GHz de Logitech.* * El radio de acción inalámbrico depende de las condiciones ambientales y del ordenador.', '20004.jpg', 0),
(20005, 2, 'Logitech K400+ Wireless Touch Keyboard Negro', 29.99, 'Las utilidades de un teclado inalámbrico son tantas que no podemos si no alabar al Logitech K400. Un teclado compatible con cualquier dispositivo con conexión USB para el receptor Unifying.\r\nDisfruta conectado a tu smartTV cómodamente desde tu sofá gracias a la tecnología inalámbrica Unifying con la que puedes conectar hasta seis dispositivos Logitech en un radio de acción de 10 metros.\r\nEl teclado Logitech K400 tiene un diseño enfocado al uso multimedia tanto en PC como TV. Ya no tiene que ser complicado navegar por los menús de tu SmartTV gracias a su intuitivo touchpad.\r\nEste teclado Logitech funciona con dos pilas AA y tiene unas dimensiones de 13,9 x 35,4 cm y es compatible con Windows 7, 8 y 10, además de Android y ChromeOS.', '20005.jpg', 0),
(20006, 2, 'Tempest Gaming M8 2.0 Speaker System Altavoces 10W RMS', 13.99, 'El Gaming M8 2.0 Speaker System de Tempest es un compacto sistema de altavoces USB con control de volumen integrado y una gran potencia de 10W RMS, repartida entre los dos satélites, para que puedas disfrutar al máximo de toda tu música, vídeos y juegos.', '20006.jpg', 0),
(20007, 2, 'Logitech G430 Gaming Surround Sound 7.1', 35.99, 'Te acaban de dar una paliza por que no podías comunicarte con tus compañeros de equipo. Eso no te habría pasado si tuvieras unos Logitech G430, los auriculares gaming con el sonido más avanzado del mercado.', '20007.jpg', 0),
(30001, 3, 'Samsung UE50NU7092 50\" LED UltraHD 4K', 369, 'Resolución 4K UHD real.Disfruta de imágenes nítidas y brillantes con el televisor 4K UHD, con una resolución cuatro veces superior a la del Full HD. Prepárate para percibir hasta el más mínimo detalle en todas tus escenas.', '30001.jpg', 0),
(30002, 3, 'LG 43UK6400PLF 43\" LED UltraHD 4K', 415, 'El primer TV con Inteligencia Artificial gracias a la tecnología LG TV AI ThinQ. y con Procesador Quad Core de 10 Bits', '30002.jpg', 1),
(30003, 3, 'LG 43UK6200PLA 43\" LED IPS UltraHD 4KLG 43UK6950PLB 43\" LED UltraHD 4K', 305, 'Descubre del primer Smart TV con inteligencia artificial (google assistant). Con el sistema Smart TV webOS 4.0, disfruta de contenidos para toda la familia de la manera más fácil y segura. Mando Magic control no incluido (necesario para utilizar el sistema de inteligencia Artificial).', '30003.jpg', 1),
(30004, 3, 'LG 43UK6950PLB 43\" LED UltraHD 4K', 389, 'LG Ultra HD TV 4K con Inteligencia Artificial, Procesador Quad Core, 3xHDR, Sonido Virtual: X.', '30004.jpg', 0),
(30005, 3, 'LG 55UK6200PLA 55\" LED IPS UltraHD 4K', 419, 'LED Ultra HD TV 4K con pantalla IPS, 139 cm (55 pulgadas), Inteligencia Artificial, Procesador Quad Core, 3xHDR, Sonido Ultra Surround.', '30005.jpg', 0),
(30006, 3, 'Samsung UE50NU7025 50\" LED UltraHD 4K', 410, 'Disfruta de imágenes nítidas y brillantes con el televisor 4K UHD, con una resolución cuatro veces superior a la del Full HD. Prepárate para percibir hasta el más mínimo detalle en todas tus escenas.', '30006.jpg', 1),
(30007, 3, 'LG 32LK6200PLA 32\" LED FullHD Blanca', 259, 'El corazón de la auténtica imagen. El procesador Quad Core trabaja incansablemente para reducir el ruido que distrae, mejorar la nitidez incluso en las imágenes con resolución más baja y aumentarla hasta obtener una calidad de imagen cercana a 4K.', '30007.jpg', 0),
(40001, 4, 'Huawei P30 Lite 4/128GB Negro Libre', 329, 'Huawei P30 Lite, el tamaño importa con triple cámara de 48MP. Vea, haga y cree más con el nuevo Huawei P30 lite. Su pantalla de 6,15 pulgadas es un lienzo magnífico para que vivas tu vida en colores brillantes. Además, cabe cómodamente en la palma de su mano. El diseño delgado está pensado para un fácil agarre y uso con una sola mano.', '40001.jpg', 1),
(40002, 4, 'Xiaomi Mi A2 4GB/64GB 4G Dual Sim Azul Libre', 180.9, 'El Xiaomi Mi A2 ya ha llegado. Después del éxito conseguido por Xiaomi con el Mi A1, el fabricante chino acaba de presentar a su sucesor: el Xiaomi Mi A2.', '40002.jpg', 0),
(40003, 4, 'OnePlus 6T 8GB/128GB Mirror Black Libre', 549, 'Desbloquea tu futuro. Desbloquea tu OnePlus 6T con el sensor de huella dactilar en pantalla más rápido del mercado. Estamos estableciendo un nuevo estándar con nuestra avanzada tecnología de desbloqueo de pantalla.\r\nEl OnePlus 6T ha sido cuidadosamente diseñado: cuenta con nuestra pantalla más grande hasta la fecha y una parte trasera resistente hecha de cristal. Disfruta de una pantalla Optic AMOLED de 6,41 pulgadas y consigue una auténtica inmersión gracias a un 86 % de ocupación de pantalla, una silueta fina y mucho más.', '40003.jpg', 0),
(40004, 4, 'Apple iPhone XR 64Gb Negro Libre', 769, 'Nueva pantalla Liquid Retina con la tecnología LCD más avanzada del sector. Face ID aún más rápido. El chip más inteligente y con mayor potencia en un smart­phone. Y un revolucio­nario sistema de cámara. Da igual por dónde lo mires: el iPhone XR es sencillamente asombroso.', '40004.jpg', 1),
(40005, 4, 'Samsung Galaxy A40 4/64GB Negro Libre', 225, 'Cambia a la nuevo generación de Galaxy A, todo lo que amas ahora con más innovación. Una línea completa de modelos especialmente diseñada para ti. La revolucionaria cámara te permitirá capturar el mundo como lo ves. La impresionante pantalla te dará una experiencia increíble. Además, su potente batería será la clave para liberarse de las tomas de corriente y abrirá un mar de posibilidades.', '40005.jpg', 1),
(40006, 4, 'Alcatel 1 4G Azul Libre', 55, 'Alcatel 1 es un smartphone que ofrece todo lo que necesitas: una pantalla de gran tamaño en un dispositivo compacto y ligero, un diseño distintivo y una cámara con amplias funciones para compartir contenido en redes sociales.', '40006.jpg', 0),
(40007, 4, 'Xiaomi Redmi S2 4/64GB Dual Sim Gris Libre', 154.99, 'El Xiami Redmi S2 es lo último en smartphones de la compañía China, el Redmi S2 se presenta como un firme rival para terminales cómo el P Smart de Huawei.Su cuerpo de aluminio, incorpora una pantalla de 5.99 pulgadas.  Bajo la carcasa encontramos un procesador Snapdragon 625, 4GB de RAM y 64GB de almacenamiento.', '40007.jpg', 0),
(50001, 5, 'Gigabyte GA-B360M DS3H', 69.99, 'Te presentamos la GA-B360M DS3H de Gigabyte, una placa base con socket LGA 1151 y chipset B360.', '50001.jpg', 0),
(50002, 5, 'MSI Z390-A PRO', 125.9, 'La placa gaming MSI Z390-A PRO tiene socket Intel 1151 y soporta procesadores Intel de 8va y 9na generación.', '50002.jpg', 0),
(50003, 5, 'Gigabyte Z390 Gaming X', 135.99, 'La nueva placa base Gigabyte, Z390 Gaming X, que soporta procesadores de 8va y 9na generación gracias a su socket Intel 1151 y su chipset Z390.', '50003.jpg', 0),
(50004, 5, 'Asus PRIME B450M-A', 65.99, 'Las placas base ASUS Prime B450 Series proporcionan la base sólida necesaria para su primera construcción, además de la flexibilidad para crecer con sus ambiciones. Hemos fusionado todo lo bueno que se empaqueta en los procesadores AMD Ryzen con el diseño e ingeniería esencial de ASUS, por lo que se beneficia de las tecnologías líderes en la industria, que incluyen el ajuste automático del sistema, controles integrales de refrigeración y audio inmersivo integrado. Cuando construye con una placa madre, desarrolla de forma inteligente, fácil y asequible.', '50004.jpg', 0),
(50005, 5, 'Gigabyte GA-H110M-S2H', 49.99, 'GA-H110M-S2H es la nueva placa de Gigabyte que viene a cubrir la gama económica de esta marca. Un producto que nos ofrece una multitud de opciones y conexiones muy competitivas para el precio que tiene.', '50005.jpg', 0),
(50006, 5, 'Gigabyte B450 AORUS M', 79.99, 'AMD presenta los últimos procesadores de la serie Ryzen 2000 para proporcionar la potencia de cómputo necesaria para los juegos. Las placas base de la serie 400 de GIGABYTE se ajustan perfectamente al rendimiento informático de los procesadores de la serie AMD Ryzen 2000 con más funciones y más control. Los usuarios pueden disfrutar los beneficios traídos por los procesadores de la serie AMD Ryzen 2000.', '50006.jpg', 0),
(50007, 5, 'MSI B450M PRO-M2 V2', 65.99, 'Te presentamos la MSI B450M-PRO-M2 V2 Plus, una placa base con socket AMD AM4 y chipset B450.', '50007.jpg', 0),
(60001, 6, 'Seagate BarraCuda 3.5\" 1TB SATA3', 39.99, 'Versátiles. Rápidos. Fiables. La unidad de disco duro más increíble que haya conocido. ', '60001.jpg', 0),
(60002, 6, 'Kingston A400 SSD 240GB', 30.99, 'La unidad A400 de estado sólido de Kingston ofrece enormes mejoras en la velocidad de respuesta, sin actualizaciones adicionales del hardware. Brinda lapsos de arranque, carga y de transferencia de archivos increíblemente más breves en comparación con las unidades de disco duro mecánico.', '60002.jpg', 0),
(60003, 6, 'Seagate BarraCuda 3.5\" 2TB SATA 3', 62.9, 'Impresionante versatilidad. Fiabilidad inigualable. Seagate incorpora más de 20 años de rendimiento y fiabilidad dignos de confianza a las unidades de disco duro Seagate BarraCuda de 3,5 pulgadas. ahora disponibles en diferentes capacidades.', '60003.jpg', 0),
(60004, 6, 'Toshiba OCZ TR200 SSD 240GB SATA3', 36.99, 'Actualizar desde una unidad de disco duro (HDD) debería ser fácil y asequible y es ahí donde entran las SSD OCZ TR200. Diseñada para aumentar la velocidad de su computadora portátil o PC en discos duros convencionales, la Serie TR200 aprovecha la avanzada tecnología 3D BiCS FLASH de 64 capas de Toshiba , para ofrecer un rendimiento equilibrado, fiabilidad y valor que transformará su sistema móvil o de escritorio.', '60004.jpg', 0),
(60005, 6, 'Samsung 860 EVO Basic SSD 500GB SATA3', 69.99, 'Descubra la nueva edición de la gama Samsung SATA SSD, la gama Samsung 860 EVO. Especialmente diseñadas para el uso diario de PC, con tecnología V-NAND y un controlador robusto basado en algoritmos, estas SSD rápidas y confiables están disponibles en una variedad de formatos y capacidades. El 860 EVO ofrece el mejor rendimiento de lectura y escritura, incluso en multitareas. El 860 EVO puede entregar velocidades de escritura de hasta 520 MB/s con tecnología inteligente TurboWrite, y velocidades de lectura de hasta 550 MB/s.', '60005.jpg', 0),
(60006, 6, 'WD Blue 3D Nand SSD SATA 500GB', 55.99, 'Preparado para sus necesidades informáticas de alto rendimiento, el SSD WD Blue 3D NAND SATA ofrece alta capacidad, fiabilidad mejorada y una velocidad increíblemente rápida.', '60006.jpg', 0),
(70001, 7, 'Gigabyte Radeon RX 570 Gaming 8G MI 8GB GDDR5', 169.99, 'Te presentamos la tarjeta gráfica Gigabyte Radeon RX 570 Gaming 8G MI con 8 GB GDDR5.\r\nLa Radeon RX 570 Gaming 8G MI te hará contar con el mayor rendimiento gracias a su efectiva capacidad de disipación del calor. ¿La clave? Un ventilador de hoja de 90mm, ventilador activo 3D y una elegante placa de metal exterior. Además, la Gigabyte Radeon cuenta con materiales ultra-duraderos: condensadores e alta calidad para una mayor vida útil del sistema.', '70001.jpg', 0),
(70002, 7, 'Gigabyte GeForce RTX 2070 WindForce 8G 8GB GDDR6', 529.99, 'El nuevo buque insignia de NVIDIA, GeForce RTX 2070, es la GPU para juegos más avanzada del planeta, impulsada por la arquitectura NVIDIA Turing de alto rendimiento, con 8GB GDDR6 y sistema ded ventilación WindForce exclusivo de Gigabyte.', '70002.jpg', 0),
(70003, 7, 'Zotac Gaming GeForce RTX 2060 Twin Fan 6GB GDDR6', 329.99, 'La nueva generación de tarjetas gráficas ZOTAC GAMING GeForce está aquí. La nueva y poderosa GeForce RTX 2060 aprovecha la vanguardista arquitectura NVIDIA Turing para sumergirte en un increíble realismo y rendimiento en los últimos juegos. El futuro de los juegos comienza aquí.', '70003.jpg', 0),
(70004, 7, 'ASUS Cerberus GeForce GTX 1050 Ti OC Edition 4GB GDDR5', 159.9, 'ASUS Cerberus GeForce GTX 1050 Ti es la tarjeta gráfica de alto rendimiento diseñada con mayor confiabilidad y rendimiento para una acción de juego sin límites. Probamos la tarjeta al máximo con los juegos más recientes y llevamos a cabo pruebas exhaustivas durante 15 veces más que los estándares de la industria.', '70004.jpg', 0),
(70005, 7, 'Gigabyte GeForce GTX 1070 G1 Gaming 8GB GDDR5', 369.99, 'Con hasta un 100% más de rendimiento que las tarjetas de la serie anterior y un espectacular desempeño gráfico en videojuegos y realidad virtual, llegan a nosotros las GTX 1070, las joyas de la corona de las tarjetas gráficas. La serie 70 es tradicionalmente la mejor serie en cuanto a relación calidad/precio.', '70005.jpg', 0),
(70006, 7, 'MSI GeForce RTX 2060 Ventus OC 6GB GDDR6', 379, 'Te presentamos la tarjeta gráfica Ventus de Msi. Con un nuevo diseño de doble ventilador, VENTUS muestra con orgullo sus formas industriales en colores neutros para adaptarse a cualquier construcción.', '70006.jpg', 0),
(70007, 7, 'Sapphire Nitro+ Radeon RX 590 8GB GDDR5 UEFI', 239.99, 'La serie SAPPHIRE NITRO+ cuenta con las últimas tecnologías de alto rendimiento: núcleos de edición limitada, Tri-XX, las mejores tecnologías de refrigeración y mucho más. Con contornos elegantes y un estilo único, se adaptan fácilmente a cualquier ordenador que quieras ensamblar. Con la última arquitectura de gráficos AMD, con NITRO+ tendrás una experiencia de juego rápida y confiable, sea cual sea tu juego.', '70007.jpg', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `authorities`
--
ALTER TABLE `authorities`
  ADD KEY `FK_AUTHORITIES_USERS` (`ID`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `forma_pago` (`id_forma_pago`);

--
-- Indices de la tabla `forma_pago`
--
ALTER TABLE `forma_pago`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente` (`id_cliente`),
  ADD KEY `pedido_producto` (`id_pedido_prod`);

--
-- Indices de la tabla `pedido_producto`
--
ALTER TABLE `pedido_producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producto` (`id_producto`),
  ADD KEY `pedido` (`id_pedido`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoria` (`id_categoria`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedido_producto`
--
ALTER TABLE `pedido_producto`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70008;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `authorities`
--
ALTER TABLE `authorities`
  ADD CONSTRAINT `FK_AUTHORITIES_USERS` FOREIGN KEY (`ID`) REFERENCES `cliente` (`id`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `forma_pago` FOREIGN KEY (`id_forma_pago`) REFERENCES `forma_pago` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pedido_producto` FOREIGN KEY (`id_pedido_prod`) REFERENCES `pedido_producto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedido_producto`
--
ALTER TABLE `pedido_producto`
  ADD CONSTRAINT `pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
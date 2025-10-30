-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-10-2025 a las 04:33:45
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
-- Base de datos: `lis`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add paciente', 7, 'add_paciente'),
(26, 'Can change paciente', 7, 'change_paciente'),
(27, 'Can delete paciente', 7, 'delete_paciente'),
(28, 'Can view paciente', 7, 'view_paciente'),
(29, 'Can add resultado', 8, 'add_resultado'),
(30, 'Can change resultado', 8, 'change_resultado'),
(31, 'Can delete resultado', 8, 'delete_resultado'),
(32, 'Can view resultado', 8, 'view_resultado'),
(33, 'Can add laboratorista', 9, 'add_laboratorista'),
(34, 'Can change laboratorista', 9, 'change_laboratorista'),
(35, 'Can delete laboratorista', 9, 'delete_laboratorista'),
(36, 'Can view laboratorista', 9, 'view_laboratorista'),
(37, 'Can add usuario', 10, 'add_usuario'),
(38, 'Can change usuario', 10, 'change_usuario'),
(39, 'Can delete usuario', 10, 'delete_usuario'),
(40, 'Can view usuario', 10, 'view_usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(9, 'laboratoristas', 'laboratorista'),
(7, 'pacientes', 'paciente'),
(8, 'resultados', 'resultado'),
(6, 'sessions', 'session'),
(10, 'usuarios', 'usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-10-27 05:27:12.080818'),
(2, 'auth', '0001_initial', '2025-10-27 05:27:12.290544'),
(3, 'admin', '0001_initial', '2025-10-27 05:27:12.340962'),
(4, 'admin', '0002_logentry_remove_auto_add', '2025-10-27 05:27:12.346977'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-10-27 05:27:12.352516'),
(6, 'contenttypes', '0002_remove_content_type_name', '2025-10-27 05:27:12.383087'),
(7, 'auth', '0002_alter_permission_name_max_length', '2025-10-27 05:27:12.407662'),
(8, 'auth', '0003_alter_user_email_max_length', '2025-10-27 05:27:12.418404'),
(9, 'auth', '0004_alter_user_username_opts', '2025-10-27 05:27:12.424415'),
(10, 'auth', '0005_alter_user_last_login_null', '2025-10-27 05:27:12.444275'),
(11, 'auth', '0006_require_contenttypes_0002', '2025-10-27 05:27:12.446284'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2025-10-27 05:27:12.453108'),
(13, 'auth', '0008_alter_user_username_max_length', '2025-10-27 05:27:12.463666'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2025-10-27 05:27:12.475120'),
(15, 'auth', '0010_alter_group_name_max_length', '2025-10-27 05:27:12.484771'),
(16, 'auth', '0011_update_proxy_permissions', '2025-10-27 05:27:12.491064'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2025-10-27 05:27:12.500581'),
(18, 'laboratoristas', '0001_initial', '2025-10-27 05:27:12.509678'),
(19, 'pacientes', '0001_initial', '2025-10-27 05:27:12.519765'),
(20, 'resultados', '0001_initial', '2025-10-27 05:27:12.570450'),
(21, 'sessions', '0001_initial', '2025-10-27 05:27:12.606118'),
(22, 'pacientes', '0002_alter_paciente_direccion', '2025-10-30 03:18:44.746105'),
(23, 'usuarios', '0001_initial', '2025-10-30 03:28:46.325673');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `laboratoristas_laboratorista`
--

CREATE TABLE `laboratoristas_laboratorista` (
  `codigo_interno` varchar(10) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `telefono` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `laboratoristas_laboratorista`
--

INSERT INTO `laboratoristas_laboratorista` (`codigo_interno`, `nombre`, `titulo`, `telefono`) VALUES
('LAB021', 'Julián Areiza', 'Técnico en Patología', '3001234567'),
('LAB022', 'Valeria Cárdenas', 'Bacterióloga Clínica', '3012345678'),
('LAB023', 'Sebastián Restrepo', 'Químico Analista', '3023456789'),
('LAB024', 'Camila Ortiz', 'Especialista en Inmunología', '3034567890'),
('LAB025', 'Mario Quintero', 'Microscopista', '3045678901'),
('LAB026', 'Isabella Gómez', 'Licenciada en Bioquímica', '3056789012'),
('LAB027', 'Alejandro Pino', 'Técnico de Bioensayos', '3067890123'),
('LAB028', 'Silvia Rojas', 'Bióloga Molecular', '3078901234'),
('LAB029', 'Esteban Duque', 'Asistente de Laboratorio', '3089012345'),
('LAB030', 'Catalina Vélez', 'Citogenetista', '3090123456'),
('LAB031', 'Fabián Ríos', 'Técnico en Genética', '3101122334'),
('LAB032', 'Natalia Parra', 'Especialista en Toxicología', '3112233445'),
('LAB033', 'Daniel Ochoa', 'Biólogo Sanitario', '3123344556'),
('LAB034', 'Andrea Valencia', 'Técnica en Control de Calidad', '3134455667'),
('LAB035', 'Jorge Mesa', 'Químico Farmacéutico', '3145566778'),
('LAB036', 'Lorena Serna', 'Especialista en Virología', '3156677889'),
('LAB037', 'David Torres', 'Técnico en Biología Celular', '3167788990'),
('LAB038', 'Paola Herrera', 'Licenciada en Hematología', '3178899001'),
('LAB039', 'Manuel Castro', 'Auxiliar de Muestras', '3189900112'),
('LAB040', 'Viviana Duque', 'Patóloga Forense', '3190011223');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes_paciente`
--

CREATE TABLE `pacientes_paciente` (
  `documento` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `codigo_ingreso` int(11) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `telefono` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pacientes_paciente`
--

INSERT INTO `pacientes_paciente` (`documento`, `nombre`, `apellidos`, `codigo_ingreso`, `direccion`, `telefono`) VALUES
('3000345678', 'Carlos', 'Rodríguez Sánchez', 3, 'Avenida Principal 12-40', '3003456789'),
('4000456789', 'María', 'Gómez Torres', 4, 'Transversal 3A # 1-15', '3014567890'),
('5000567890', 'Pedro', 'Díaz Castro', 5, 'Vía Central Km 5', '3115678901'),
('6000678901', 'Laura', 'Hernández Vargas', 6, 'Callejón del Sol', '3216789012'),
('7000789012', 'Andrés', 'Silva Rojas', 7, 'Barrio La Esperanza', '3047890123'),
('8000890123', 'Sofía', 'Vega Morales', 8, 'Urbanización Los Álamos', '3158901234'),
('9000901234', 'Daniel', 'Mendoza Pardo', 9, 'Manzana C Casa 15', '3229012345'),
('1001012345', 'Elena', 'Ramírez Cárdenas', 10, 'Diagonal 25 # 50-60', '3050123456'),
('1101123456', 'Javier', 'Gutiérrez Rivera', 11, 'Calle 50 Sur # 3-10', '3161234567'),
('1201234567', 'Paula', 'Molina Herrera', 12, 'Carrera 15 Este', '3232345678'),
('1301345678', 'Ricardo', 'Valencia Duque', 13, 'Apartamento 402 Torre B', '3063456789'),
('1401456789', 'Isabel', 'Castaño Marín', 14, 'Localidad Central', '3174567890'),
('1501567890', 'Felipe', 'Guerrero Ortiz', 15, 'Vereda El Porvenir', '3245678901'),
('1601678901', 'Mónica', 'Sierra Nieto', 16, 'Conjunto Residencial', '3076789012'),
('1701789012', 'Diego', 'Pacheco Londoño', 17, 'Sector Industrial', '3187890123'),
('1801890123', 'Natalia', 'Cano Alzate', 18, 'Centro Comercial Of. 101', '3258901234'),
('1901901234', 'Gabriel', 'Ríos Quintero', 19, 'Plaza Mayor', '3089012345'),
('2002012345', 'Viviana', 'Mora Jiménez', 20, 'Carrera 4 # 9-99', '3190123456');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resultados_resultado`
--

CREATE TABLE `resultados_resultado` (
  `id` bigint(20) NOT NULL,
  `colesterol_total` double NOT NULL,
  `colesterol_hdl` double NOT NULL,
  `colesterol_ldl` double NOT NULL,
  `trigliceridos` double NOT NULL,
  `laboratorista_id` varchar(10) DEFAULT NULL,
  `paciente_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `resultados_resultado`
--

INSERT INTO `resultados_resultado` (`id`, `colesterol_total`, `colesterol_hdl`, `colesterol_ldl`, `trigliceridos`, `laboratorista_id`, `paciente_id`) VALUES
(4, 245.8, 36.5, 178.9, 275.2, 'LAB024', 4),
(5, 192.1, 49, 122.5, 160, 'LAB025', 5),
(6, 172.3, 51.5, 102, 135.1, NULL, 6),
(7, 218, 43.5, 142.5, 202.9, 'LAB022', 7),
(8, 158.5, 71, 78, 90.5, 'LAB023', 8),
(9, 238.1, 39.5, 162, 255, 'LAB024', 9),
(10, 187.5, 53, 117.5, 152.5, 'LAB025', 10),
(13, 232, 40, 153.5, 240, 'LAB023', 3),
(14, 195, 47.5, 120, 160.5, 'LAB024', 4),
(15, 178.5, 62, 100, 128, 'LAB025', 5),
(16, 212, 44, 135.5, 198, NULL, 6),
(17, 152.5, 74, 72.5, 80, 'LAB022', 7),
(18, 228, 38, 152, 220, 'LAB023', 8),
(19, 191.5, 54, 114.5, 147, 'LAB024', 9),
(20, 208, 42, 132.5, 187, 'LAB025', 10),
(22, 180, 55, 100, 120, 'LAB025', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_usuario`
--

CREATE TABLE `usuarios_usuario` (
  `id` bigint(20) NOT NULL,
  `usuario` varchar(150) NOT NULL,
  `contrasena` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios_usuario`
--

INSERT INTO `usuarios_usuario` (`id`, `usuario`, `contrasena`) VALUES
(1, 'kevin.garciaj', '7731cb1f1f1ea27a86f9c0b0a75a6f4dbdf55686'),
(2, 'isabella.vasquezg', 'feaf742c96608939ee992013061039ab12855195'),
(3, 'dairon.montes', 'f247c4cf275f973f9c785444f67bf7d0eafb68f9');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `laboratoristas_laboratorista`
--
ALTER TABLE `laboratoristas_laboratorista`
  ADD PRIMARY KEY (`codigo_interno`);

--
-- Indices de la tabla `pacientes_paciente`
--
ALTER TABLE `pacientes_paciente`
  ADD PRIMARY KEY (`codigo_ingreso`),
  ADD UNIQUE KEY `documento` (`documento`);

--
-- Indices de la tabla `resultados_resultado`
--
ALTER TABLE `resultados_resultado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resultados_resultado_laboratorista_id_d3fb85f0_fk_laborator` (`laboratorista_id`),
  ADD KEY `resultados_resultado_paciente_id_242d39d7_fk_pacientes` (`paciente_id`);

--
-- Indices de la tabla `usuarios_usuario`
--
ALTER TABLE `usuarios_usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario` (`usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `pacientes_paciente`
--
ALTER TABLE `pacientes_paciente`
  MODIFY `codigo_ingreso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `resultados_resultado`
--
ALTER TABLE `resultados_resultado`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `usuarios_usuario`
--
ALTER TABLE `usuarios_usuario`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `resultados_resultado`
--
ALTER TABLE `resultados_resultado`
  ADD CONSTRAINT `resultados_resultado_laboratorista_id_d3fb85f0_fk_laborator` FOREIGN KEY (`laboratorista_id`) REFERENCES `laboratoristas_laboratorista` (`codigo_interno`),
  ADD CONSTRAINT `resultados_resultado_paciente_id_242d39d7_fk_pacientes` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes_paciente` (`codigo_ingreso`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

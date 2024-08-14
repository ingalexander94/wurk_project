# ************************************************************
# Sequel Ace SQL dump
# Versión 20064
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Equipo: localhost (MySQL 11.2.3-MariaDB-1:11.2.3+maria~ubu2204)
# Base de datos: kruw_db
# Tiempo de generación: 2024-08-13 04:06:13 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Volcado de tabla device
# ------------------------------------------------------------

DROP TABLE IF EXISTS `device`;

CREATE TABLE `device` (
  `id_device` int(11) NOT NULL AUTO_INCREMENT,
  `number_device` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_device`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `device` WRITE;
/*!40000 ALTER TABLE `device` DISABLE KEYS */;

INSERT INTO `device` (`id_device`, `number_device`)
VALUES
	(1,'C8:C9:A3:35:E4:EF'),
	(2,'C8:C9:A3:35:E4:EF');

/*!40000 ALTER TABLE `device` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla device_gate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `device_gate`;

CREATE TABLE `device_gate` (
  `id_device_gate` int(11) NOT NULL AUTO_INCREMENT,
  `id_gate` int(11) NOT NULL,
  `id_type_gate` int(11) NOT NULL,
  `id_device` int(11) NOT NULL,
  PRIMARY KEY (`id_device_gate`),
  UNIQUE KEY `un_device_gate` (`id_gate`,`id_type_gate`,`id_device`),
  KEY `fk_id_gate_g_idx` (`id_gate`),
  KEY `fk_id_type_gt_idx` (`id_type_gate`),
  KEY `fk_device_dg_idx` (`id_device`),
  CONSTRAINT `fk_device_gate_device1` FOREIGN KEY (`id_device`) REFERENCES `device` (`id_device`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_gate` FOREIGN KEY (`id_gate`) REFERENCES `gate` (`id_gate`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_type_gate` FOREIGN KEY (`id_type_gate`) REFERENCES `type_gate` (`id_type_gate`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `device_gate` WRITE;
/*!40000 ALTER TABLE `device_gate` DISABLE KEYS */;

INSERT INTO `device_gate` (`id_device_gate`, `id_gate`, `id_type_gate`, `id_device`)
VALUES
	(1,1,1,1),
	(2,2,1,2);

/*!40000 ALTER TABLE `device_gate` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla gate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gate`;

CREATE TABLE `gate` (
  `id_gate` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id_gate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `gate` WRITE;
/*!40000 ALTER TABLE `gate` DISABLE KEYS */;

INSERT INTO `gate` (`id_gate`, `description`)
VALUES
	(1,'Puerta 1 Piso1'),
	(2,'Puerta1 Piso2');

/*!40000 ALTER TABLE `gate` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla log_access
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_access`;

CREATE TABLE `log_access` (
  `id_log` int(11) NOT NULL AUTO_INCREMENT,
  `id_device` int(11) NOT NULL,
  `id_user_tag` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `grant` bit(1) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_log`),
  KEY `fk_device_d_idx` (`id_device`),
  KEY `fk_log_access_user_tag1_idx` (`id_user_tag`),
  CONSTRAINT `fk_device1` FOREIGN KEY (`id_device`) REFERENCES `device_gate` (`id_device`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_log_access_user_tag` FOREIGN KEY (`id_user_tag`) REFERENCES `user_tag` (`id_user_tag`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `log_access` WRITE;
/*!40000 ALTER TABLE `log_access` DISABLE KEYS */;

INSERT INTO `log_access` (`id_log`, `id_device`, `id_user_tag`, `date`, `grant`, `description`)
VALUES
	(1,1,1,'2024-07-08 15:58:09',b'1','SUCCESSFUL'),
	(2,1,1,'2024-07-08 16:01:38',b'1','SUCCESSFUL'),
	(3,1,1,'2024-07-08 16:02:12',b'1','SUCCESSFUL'),
	(4,1,1,'2024-07-08 16:02:22',b'1','SUCCESSFUL'),
	(5,1,1,'2024-07-08 16:02:41',b'1','SUCCESSFUL'),
	(6,1,1,'2024-07-08 16:02:48',b'1','SUCCESSFUL'),
	(7,1,1,'2024-07-08 16:03:08',b'1','SUCCESSFUL'),
	(8,1,1,'2024-07-08 16:04:50',b'1','SUCCESSFUL'),
	(9,1,1,'2024-07-08 16:10:19',b'1','SUCCESSFUL'),
	(10,1,1,'2024-07-08 16:24:41',b'1','SUCCESSFUL'),
	(11,1,1,'2024-07-08 16:53:33',b'1','SUCCESSFUL'),
	(12,1,1,'2024-07-08 16:53:40',b'1','SUCCESSFUL'),
	(13,1,1,'2024-07-08 15:58:09',b'1','SUCCESSFUL'),
	(14,1,1,'2024-07-08 16:54:02',b'1','SUCCESSFUL'),
	(15,1,1,'2024-07-08 16:54:13',b'1','SUCCESSFUL'),
	(16,1,1,'2024-07-08 16:58:48',b'1','SUCCESSFUL'),
	(17,1,1,'2024-07-08 16:58:58',b'1','SUCCESSFUL'),
	(18,1,1,'2024-07-08 17:01:26',b'1','SUCCESSFUL'),
	(19,1,1,'2024-07-08 17:05:08',b'1','SUCCESSFUL'),
	(20,1,1,'2024-07-08 17:05:20',b'1','SUCCESSFUL'),
	(21,1,1,'2024-07-08 17:07:29',b'1','SUCCESSFUL'),
	(22,1,1,'2024-07-08 17:10:14',b'1','SUCCESSFUL'),
	(23,1,1,'2024-07-08 18:28:15',b'1','SUCCESSFUL'),
	(24,1,1,'2024-07-08 18:33:02',b'1','SUCCESSFUL'),
	(25,1,1,'2024-07-08 18:37:54',b'1','SUCCESSFUL'),
	(26,1,1,'2024-07-08 18:38:16',b'1','SUCCESSFUL'),
	(27,1,1,'2024-07-08 18:38:58',b'1','SUCCESSFUL'),
	(28,1,1,'2024-07-08 18:47:06',b'1','SUCCESSFUL'),
	(29,1,1,'2024-07-08 18:54:28',b'1','SUCCESSFUL'),
	(30,1,1,'2024-07-08 18:56:00',b'1','SUCCESSFUL'),
	(31,1,1,'2024-07-08 19:23:14',b'1','SUCCESSFUL'),
	(32,1,1,'2024-07-09 16:37:35',b'1','SUCCESSFUL'),
	(33,1,1,'2024-07-09 16:37:52',b'1','SUCCESSFUL'),
	(34,1,1,'2024-07-09 16:37:59',b'1','SUCCESSFUL'),
	(35,1,1,'2024-07-09 16:38:14',b'1','SUCCESSFUL'),
	(36,1,1,'2024-07-09 16:38:27',b'1','SUCCESSFUL'),
	(37,1,1,'2024-07-09 16:41:10',b'1','SUCCESSFUL'),
	(38,1,1,'2024-07-09 16:41:19',b'1','SUCCESSFUL'),
	(39,1,1,'2024-07-09 16:47:14',b'1','SUCCESSFUL'),
	(40,1,1,'2024-07-09 16:47:30',b'1','SUCCESSFUL'),
	(41,1,1,'2024-07-09 16:47:38',b'1','SUCCESSFUL'),
	(42,1,1,'2024-07-09 16:47:45',b'1','SUCCESSFUL');

/*!40000 ALTER TABLE `log_access` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla modules
# ------------------------------------------------------------

DROP TABLE IF EXISTS `modules`;

CREATE TABLE `modules` (
  `id_module` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(100) NOT NULL,
  `module_state` bit(1) NOT NULL DEFAULT b'1' COMMENT '0: Inactivo, 1: Activo',
  PRIMARY KEY (`id_module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;

INSERT INTO `modules` (`id_module`, `module_name`, `module_state`)
VALUES
	(1,'Usuarios',b'1'),
	(2,'Roles y permisos',b'1'),
	(3,'Tarjetas y dispositivos',b'1'),
	(4,'Control de accesos',b'1'),
	(5,'Registros',b'1');

/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `id_permission` int(11) NOT NULL AUTO_INCREMENT,
  `profile` int(11) NOT NULL,
  `module` int(11) NOT NULL,
  PRIMARY KEY (`id_permission`),
  KEY `profile` (`profile`),
  KEY `module` (`module`),
  CONSTRAINT `permissions_ibfk_1` FOREIGN KEY (`profile`) REFERENCES `profile` (`id_profile`) ON DELETE CASCADE,
  CONSTRAINT `permissions_ibfk_2` FOREIGN KEY (`module`) REFERENCES `modules` (`id_module`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;

INSERT INTO `permissions` (`id_permission`, `profile`, `module`)
VALUES
	(7,3,1),
	(8,3,2),
	(9,3,3),
	(10,2,1),
	(11,2,2),
	(12,2,3),
	(13,2,4),
	(14,2,5);

/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla profile
# ------------------------------------------------------------

DROP TABLE IF EXISTS `profile`;

CREATE TABLE `profile` (
  `id_profile` int(11) NOT NULL AUTO_INCREMENT,
  `profile_name` varchar(100) NOT NULL,
  `profile_description` varchar(100) NOT NULL,
  `profile_state` bit(1) NOT NULL DEFAULT b'1' COMMENT '0: Inactivo, 1: Activo',
  PRIMARY KEY (`id_profile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;

INSERT INTO `profile` (`id_profile`, `profile_name`, `profile_description`, `profile_state`)
VALUES
	(1,'Visitante','Usuario que es cliente externo',b'1'),
	(2,'Super Administrador','Usuario con permisos globales',b'1'),
	(3,'Administrador','Usuario con permisos específicos',b'1'),
	(4,'Wieders','Usuario empleados de Wiedii',b'1');

/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla tag
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tag`;

CREATE TABLE `tag` (
  `id_tag` int(11) NOT NULL,
  `tag_number` varchar(45) NOT NULL,
  PRIMARY KEY (`id_tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;

INSERT INTO `tag` (`id_tag`, `tag_number`)
VALUES
	(1,'21113822615'),
	(2,'195253132245');

/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla transactional_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `transactional_log`;

CREATE TABLE `transactional_log` (
  `id_log` int(11) NOT NULL AUTO_INCREMENT,
  `device_number` varchar(45) NOT NULL,
  `tag_number` varchar(45) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `description` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `transactional_log` WRITE;
/*!40000 ALTER TABLE `transactional_log` DISABLE KEYS */;

INSERT INTO `transactional_log` (`id_log`, `device_number`, `tag_number`, `date`, `description`)
VALUES
	(1,'C8:C9:A3:35:E4:EF','21113822615','2024-07-02 19:55:27','access denied.'),
	(2,'C8:C9:A3:35:E4:EF','21113822615','2024-07-02 19:55:34','access denied.'),
	(3,'C8:C9:A3:35:E4:EF','21113822615','2024-07-02 20:08:31','access denied.'),
	(4,'C8:C9:A3:35:E4:EF','21113822615','2024-07-03 03:09:15','access denied.'),
	(5,'C8:C9:A3:35:E4:EF','21113822615','2024-07-03 03:09:20','access denied.'),
	(6,'C8:C9:A3:35:E4:EF','21113822615','2024-07-03 03:09:22','access denied.'),
	(7,'C8:C9:A3:35:E4:EF','21113822615','2024-07-03 03:09:24','access denied.'),
	(8,'C8:C9:A3:35:E4:EF','21113822615','2024-07-03 03:10:29','access denied.'),
	(9,'C8:C9:A3:35:E4:EF','21113822615','2024-07-03 03:11:36','access denied.'),
	(10,'C8:C9:A3:35:E4:EF','21113822615','2024-07-03 03:11:39','access denied.'),
	(11,'C8:C9:A3:35:E4:EF','21113822615','2024-07-03 03:11:40','access denied.'),
	(12,'C8:C9:A3:35:E4:EF','21113822615','2024-07-03 03:11:43','access denied.'),
	(13,'C8:C9:A3:35:E4:EF','21113822615','2024-07-03 03:12:03','access denied.'),
	(14,'C8:C9:A3:35:E4:EF','21113822615','2024-07-03 03:12:05','access denied.'),
	(15,'C8:C9:A3:35:E4:EF','21113822615','2024-07-03 03:12:08','access denied.'),
	(16,'C8:C9:A3:35:E4:EF','21113822615','2024-07-03 03:12:11','access denied.'),
	(17,'C8:C9:A3:35:E4:EF','21113822615','2024-07-03 03:12:13','access denied.'),
	(18,'C8:C9:A3:35:E4:EF','21113822615','2024-07-03 03:12:16','access denied.'),
	(19,'C8:C9:A3:35:E4:EF','21113822615','2024-07-03 03:12:18','access denied.'),
	(20,'C8:C9:A3:35:E4:EF','21113822615','2024-07-03 03:12:20','access denied.'),
	(21,'C8:C9:A3:35:E4:EF','21113822615','2024-07-03 03:12:22','access denied.'),
	(22,'C8:C9:A3:35:E4:EF','21113822615','2024-07-03 03:12:24','access denied.'),
	(23,'C8:C9:A3:35:E4:EF','21113822615','2024-07-03 03:12:26','access denied.'),
	(24,'C8:C9:A3:35:E4:EF','21113822615','2024-07-03 03:12:35','access denied.'),
	(25,'C8:C9:A3:35:E4:EF','21113822615','2024-07-03 03:12:57','access denied.'),
	(26,'C8:C9:A3:35:E4:EF','21113822615','2024-07-03 03:12:59','access denied.'),
	(27,'C8:C9:A3:35:E4:EF','21113822615','2024-07-03 03:13:04','access denied.'),
	(28,'C8:C9:A3:35:E4:EF','21113822615','2024-07-03 03:13:06','access denied.'),
	(29,'C8:C9:A3:35:E4:EF','21113822615','2024-07-03 03:13:10','access denied.'),
	(30,'C8:C9:A3:35:E4:EF','21113822615','2024-07-03 03:13:12','access denied.'),
	(31,'C8:C9:A3:35:E4:EF','21113822615','2024-07-03 03:13:13','access denied.'),
	(32,'C8:C9:A3:35:E4:EF','21113822615','2024-07-03 03:13:15','access denied.'),
	(33,'C8:C9:A3:35:E4:EF','21113822615','2024-07-03 03:13:17','access denied.'),
	(34,'C8:C9:A3:35:E4:EF','21113822615','2024-07-03 03:14:31','access denied.'),
	(35,'C8:C9:A3:35:E4:EF','21113822615','2024-07-03 03:14:32','access denied.'),
	(36,'C8:C9:A3:35:E4:EF','21113822615','2024-07-03 04:56:50','access denied.'),
	(37,'C8:C9:A3:35:E4:EF','21113822615','2024-07-03 05:18:01','access denied.'),
	(38,'C8:C9:A3:35:E4:EF','420312214624518149','2024-07-08 18:37:07','tag number not exist.'),
	(39,'C8:C9:A3:35:E4:EF','420312214624518149','2024-07-08 18:37:10','tag number not exist.'),
	(40,'C8:C9:A3:35:E4:EF','420312214624518149','2024-07-08 18:37:12','tag number not exist.'),
	(41,'48:3F:DA:57:72:A0','21113822615','2024-07-10 21:29:39','device number not exist.'),
	(42,'48:3F:DA:57:72:A0','21113822615','2024-07-12 16:18:17','device number not exist.'),
	(43,'C8:C9:A3:35:E4:EF','11516716240','2024-08-02 18:07:22','tag number not exist.'),
	(44,'C8:C9:A3:35:E4:EF','11516716240','2024-08-02 18:07:24','tag number not exist.'),
	(45,'C8:C9:A3:35:E4:EF','11516716240','2024-08-02 18:07:26','tag number not exist.'),
	(46,'C8:C9:A3:35:E4:EF','11516716240','2024-08-02 18:07:28','tag number not exist.'),
	(47,'C8:C9:A3:35:E4:EF','11516716240','2024-08-02 18:08:49','tag number not exist.'),
	(48,'C8:C9:A3:35:E4:EF','11516716240','2024-08-02 18:11:39','tag number not exist.'),
	(49,'C8:C9:A3:35:E4:EF','11516716240','2024-08-02 19:03:58','tag number not exist.'),
	(50,'C8:C9:A3:35:E4:EF','11516716240','2024-08-02 19:04:11','tag number not exist.'),
	(51,'C8:C9:A3:35:E4:EF','11516716240','2024-08-02 19:04:17','tag number not exist.'),
	(52,'C8:C9:A3:35:E4:EF','11516716240','2024-08-02 19:05:11','tag number not exist.'),
	(53,'C8:C9:A3:35:E4:EF','11516716240','2024-08-02 19:06:09','tag number not exist.'),
	(54,'C8:C9:A3:35:E4:EF','11516716240','2024-08-02 19:06:11','tag number not exist.'),
	(55,'C8:C9:A3:35:E4:EF','11516716240','2024-08-02 19:06:12','tag number not exist.'),
	(56,'C8:C9:A3:35:E4:EF','11516716240','2024-08-02 19:10:11','tag number not exist.'),
	(57,'C8:C9:A3:35:E4:EF','11516716240','2024-08-02 19:10:35','tag number not exist.'),
	(58,'C8:C9:A3:35:E4:EF','11516716240','2024-08-02 19:12:31','tag number not exist.'),
	(59,'C8:C9:A3:35:E4:EF','85213592','2024-08-08 14:45:35','tag number not exist.'),
	(60,'C8:C9:A3:35:E4:EF','85213592','2024-08-08 14:45:38','tag number not exist.'),
	(61,'C8:C9:A3:35:E4:EF','85213592','2024-08-08 14:45:41','tag number not exist.'),
	(62,'C8:C9:A3:35:E4:EF','85213592','2024-08-08 14:45:45','tag number not exist.');

/*!40000 ALTER TABLE `transactional_log` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla type_gate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `type_gate`;

CREATE TABLE `type_gate` (
  `id_type_gate` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_type_gate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `type_gate` WRITE;
/*!40000 ALTER TABLE `type_gate` DISABLE KEYS */;

INSERT INTO `type_gate` (`id_type_gate`, `description`)
VALUES
	(1,'IN'),
	(2,'OUT');

/*!40000 ALTER TABLE `type_gate` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `id_profile` int(11) NOT NULL,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `identifier` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(64) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `code` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id_user`,`id_profile`),
  KEY `fk_user_profile_p_idx` (`id_profile`),
  CONSTRAINT `fk_user_profile` FOREIGN KEY (`id_profile`) REFERENCES `profile` (`id_profile`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`id_user`, `id_profile`, `firstname`, `lastname`, `identifier`, `phone`, `email`, `password`, `active`, `code`)
VALUES
	(1,1,'Javier Eduardo','Carvajal Escobar','881588888','3186502186','jaedcar74@gmail.com','a33e6c581ec1d4ac3818807eae92c2fd95dcbd3567b2a17b88eface13a831bcc',b'1',NULL),
	(2,1,'Andres M.','Gutierrez','888888888','3186502186','andres.gutierrez@wiedii.co','a33e6c581ec1d4ac3818807eae92c2fd95dcbd3567b2a17b88eface13a831bcc',b'1',NULL),
	(3,2,'Yorluis','Vega','1093803754','3144095806','yorluis.vega@wiedii.co','a33e6c581ec1d4ac3818807eae92c2fd95dcbd3567b2a17b88eface13a831bcc',b'1',NULL);

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla user_tag
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_tag`;

CREATE TABLE `user_tag` (
  `id_user_tag` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_tag` int(11) NOT NULL,
  `id_gate` int(11) NOT NULL,
  PRIMARY KEY (`id_user_tag`),
  UNIQUE KEY `user_tag_unique` (`id_user`,`id_tag`,`id_gate`),
  KEY `fk_user_tag_tag1_idx` (`id_tag`),
  KEY `index_user` (`id_user`),
  KEY `fk_user_tag_gate1_idx` (`id_gate`),
  CONSTRAINT `fk_tag` FOREIGN KEY (`id_tag`) REFERENCES `tag` (`id_tag`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_user_tag_gate` FOREIGN KEY (`id_gate`) REFERENCES `gate` (`id_gate`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `user_tag` WRITE;
/*!40000 ALTER TABLE `user_tag` DISABLE KEYS */;

INSERT INTO `user_tag` (`id_user_tag`, `id_user`, `id_tag`, `id_gate`)
VALUES
	(1,1,2,1),
	(2,2,1,2);

/*!40000 ALTER TABLE `user_tag` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

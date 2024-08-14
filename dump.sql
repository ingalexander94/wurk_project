# ************************************************************
# Sequel Ace SQL dump
# Versión 20062
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Equipo: 52.9.135.10 (MySQL 11.3.2-MariaDB-1:11.3.2+maria~ubu2204)
# Base de datos: attendance
# Tiempo de generación: 2024-08-14 21:38:45 +0000
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
	(4,'Wieders','Usuario empleado de Wiedii',b'1');

/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla tag
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tag`;

CREATE TABLE `tag` (
  `id_tag` int(11) NOT NULL AUTO_INCREMENT,
  `tag_number` varchar(45) NOT NULL,
  `code` varchar(10) NOT NULL,
  PRIMARY KEY (`id_tag`),
  UNIQUE KEY `code` (`code`),
  KEY `tag_number` (`tag_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;

INSERT INTO `tag` (`id_tag`, `tag_number`, `code`)
VALUES
	(1,'21113822615','ADM-0001'),
	(2,'195253132245','ADM-0002'),
	(3,'83101492','B-0003'),
	(4,'1399482','B-0004'),
	(5,'17851642','B-0005'),
	(6,'5918602','B-0006'),
	(7,'226205582','B-0007'),
	(8,'25299482','B-0008'),
	(9,'5059622','B-0009'),
	(10,'55107472','B-0010'),
	(11,'58100482','B-0011'),
	(12,'7175602','B-0012'),
	(13,'11722482','B-0013'),
	(14,'7810482','B-0014'),
	(15,'14947482','B-0015'),
	(16,'165117482','B-0016'),
	(17,'52136472','B-0017'),
	(18,'22836592','B-0018'),
	(19,'4244472','B-0019'),
	(20,'26206482','B-0021'),
	(21,'10974612','B-0022'),
	(22,'193210582','B-0023'),
	(23,'238104492','B-0024'),
	(24,'974472','B-0025'),
	(25,'25125622','B-0026'),
	(26,'18075592','B-0027'),
	(27,'252251602','B-0028'),
	(28,'5244492','B-0029'),
	(29,'23573602','B-0030'),
	(30,'17766472','B-0031'),
	(31,'3976472','B-0032'),
	(32,'204227472','B-0033'),
	(33,'254214602','B-0034'),
	(34,'81179482','B-0035'),
	(35,'221122482','B-0036'),
	(36,'25235582','B-0038'),
	(37,'134206582','B-0039'),
	(38,'16310592','B-0040'),
	(39,'213193472','B-0041'),
	(40,'85213592','B-0001'),
	(41,'22124472','B-0042'),
	(42,'3663602','B-0043'),
	(43,'9338612','B-0044'),
	(44,'193122602','B-0045'),
	(45,'235239472','B-0046'),
	(46,'197186482','B-0047'),
	(47,'189244602','B-0048'),
	(48,'28244482','B-0049'),
	(49,'193122482','B-0050'),
	(50,'122221482','B-0051'),
	(51,'22842642','B-0052'),
	(52,'77125492','B-0053'),
	(53,'6162472','B-0054'),
	(54,'19812612','B-0055'),
	(55,'15616472','B-0056'),
	(56,'17394592','B-0057'),
	(57,'3926612','B-0058'),
	(58,'198246582','B-0059'),
	(59,'14236472','B-0060'),
	(60,'199235582','B-0061'),
	(61,'35113472','B-0062'),
	(62,'33137472','B-0063'),
	(63,'23568602','B-0064'),
	(64,'209106492','B-0065'),
	(65,'44106472','B-0066'),
	(66,'9115482','B-0067'),
	(67,'12381592','B-0068'),
	(68,'5913492','B-0069'),
	(69,'3814492','B-0070'),
	(70,'16673622','B-0071'),
	(71,'16544622','B-0072'),
	(72,'8692482','B-0073'),
	(73,'193192472','B-0074'),
	(74,'22170482','B-0075'),
	(75,'22573472','B-0076'),
	(76,'1077492','B-0077'),
	(77,'2882612','B-0078'),
	(78,'23637592','B-0079'),
	(79,'26101622','B-0080'),
	(80,'178252582','B-0081'),
	(81,'8465622','B-0082'),
	(82,'106225582','B-0083'),
	(83,'15028472','B-0084'),
	(84,'225244472','B-0085'),
	(85,'2673492','B-0086'),
	(86,'23782472','B-0087'),
	(87,'13423492','B-0088'),
	(88,'4164492','B-0089'),
	(89,'131187582','B-0090'),
	(90,'235234582','B-0091'),
	(91,'7855592','B-0092'),
	(92,'24238622','B-0093'),
	(93,'69252582','B-0094'),
	(94,'190235482','B-0095'),
	(95,'122237582','B-0096'),
	(96,'146123482','B-0097'),
	(97,'117165482','B-0098'),
	(98,'5928612','B-0099'),
	(99,'15425492','B-0100'),
	(100,'18725592','B-0101'),
	(101,'13999492','B-0102'),
	(102,'8333592','B-0103'),
	(103,'219223472','B-0104'),
	(104,'3588492','B-0105'),
	(105,'153219472','B-0106'),
	(106,'148238582','B-0107'),
	(107,'4678482','B-0108'),
	(108,'11948482','B-0109'),
	(109,'28215482','B-0110'),
	(110,'10352612','B-0111'),
	(111,'94113492','B-0112'),
	(112,'9768482','B-0113'),
	(113,'25280472','B-0114'),
	(114,'28249582','B-0115'),
	(115,'106184592','B-0116'),
	(116,'15377482','B-0117'),
	(117,'219220582','B-0118'),
	(118,'60233482','B-0119'),
	(119,'196160472','B-0120'),
	(120,'39126592','B-0121'),
	(121,'14991602','B-0122'),
	(122,'6264612','B-0123'),
	(123,'54233472','B-0124'),
	(124,'201254592','B-0125'),
	(125,'130243482','B-0126'),
	(126,'33125472','B-0127'),
	(127,'16126492','B-0128'),
	(128,'25399472','B-0129'),
	(129,'12136482','B-0130'),
	(130,'20521592','B-0131'),
	(131,'23653482','B-0132'),
	(132,'4343592','B-0133'),
	(133,'148212602','B-0134'),
	(134,'24732592','B-0135'),
	(135,'19623472','B-0136'),
	(136,'7895592','B-0137'),
	(137,'188227482','B-0138'),
	(138,'206156472','B-0139'),
	(139,'66179482','B-0140'),
	(140,'23549472','B-0141'),
	(141,'21394482','B-0142'),
	(142,'6139482','B-0143'),
	(143,'82113472','B-0144'),
	(144,'11738612','B-0145'),
	(145,'174223582','B-0146'),
	(146,'51199582','B-0147'),
	(147,'221233582','B-0148'),
	(148,'5242642','B-0149'),
	(149,'126237582','B-0150'),
	(150,'114184472','B-0151'),
	(151,'14228492','B-0152'),
	(152,'34218582','B-0153'),
	(153,'71244472','B-0154'),
	(154,'76217582','B-0155'),
	(155,'10833472','B-0156'),
	(156,'24672472','B-0157'),
	(157,'11513612','B-0158'),
	(158,'20235622','B-0159'),
	(159,'42105492','B-0160'),
	(160,'113201482','B-0161'),
	(161,'5974602','B-0162'),
	(162,'147238582','B-0163'),
	(163,'129212582','B-0164'),
	(164,'4618592','B-0165'),
	(165,'13365622','B-0166'),
	(166,'150117482','B-0167'),
	(167,'132198582','B-0168'),
	(168,'246103492','B-0169'),
	(169,'131236472','B-0171'),
	(170,'22844592','B-0172'),
	(171,'3139592','B-0173'),
	(172,'13837622','B-0174'),
	(173,'226244482','B-0175'),
	(174,'205118482','B-0176'),
	(175,'51145472','B-0177'),
	(176,'13980482','B-0178'),
	(177,'14275482','B-0179'),
	(178,'16573622','B-0180'),
	(179,'20170472','B-0181'),
	(180,'116231582','B-0182'),
	(181,'1471622','B-0183'),
	(182,'222210482','B-0184'),
	(183,'20646472','B-0185'),
	(184,'24394602','B-0186'),
	(185,'12116592','B-0187'),
	(186,'5398622','B-0188'),
	(187,'141198582','B-0189'),
	(188,'14136472','B-0190'),
	(189,'233153602','B-0191'),
	(190,'7018592','B-0192'),
	(191,'217253472','B-0193'),
	(192,'20149472','B-0194'),
	(193,'5525472','B-0195'),
	(194,'87193472','B-0196'),
	(195,'9833592','B-0197'),
	(196,'217254482','B-0198'),
	(197,'10128622','B-0199'),
	(198,'73100482','B-0200');

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
	(62,'C8:C9:A3:35:E4:EF','85213592','2024-08-08 14:45:45','tag number not exist.'),
	(63,'C8:C9:A3:35:E4:EF','83101492','2024-08-12 15:32:43','tag number not exist.'),
	(64,'C8:C9:A3:35:E4:EF','1399482','2024-08-12 15:33:00','tag number not exist.'),
	(65,'C8:C9:A3:35:E4:EF','83101492','2024-08-12 15:33:18','tag number not exist.'),
	(66,'C8:C9:A3:35:E4:EF','83101492','2024-08-12 15:33:20','tag number not exist.'),
	(67,'C8:C9:A3:35:E4:EF','83101492','2024-08-12 15:33:25','tag number not exist.'),
	(68,'C8:C9:A3:35:E4:EF','1399482','2024-08-12 15:33:32','tag number not exist.'),
	(69,'C8:C9:A3:35:E4:EF','17851642','2024-08-12 15:33:47','tag number not exist.'),
	(70,'C8:C9:A3:35:E4:EF','17851642','2024-08-12 15:33:53','tag number not exist.'),
	(71,'C8:C9:A3:35:E4:EF','83101492','2024-08-12 15:34:41','tag number not exist.'),
	(72,'C8:C9:A3:35:E4:EF','1399482','2024-08-12 15:35:09','tag number not exist.'),
	(73,'C8:C9:A3:35:E4:EF','17851642','2024-08-12 15:35:20','tag number not exist.'),
	(74,'C8:C9:A3:35:E4:EF','5918602','2024-08-12 15:35:52','tag number not exist.'),
	(75,'C8:C9:A3:35:E4:EF','5918602','2024-08-12 15:36:06','tag number not exist.'),
	(76,'C8:C9:A3:35:E4:EF','5918602','2024-08-12 15:36:15','tag number not exist.'),
	(77,'C8:C9:A3:35:E4:EF','226205582','2024-08-12 15:36:29','tag number not exist.'),
	(78,'C8:C9:A3:35:E4:EF','226205582','2024-08-12 15:36:47','tag number not exist.'),
	(79,'C8:C9:A3:35:E4:EF','25299482','2024-08-12 15:37:06','tag number not exist.'),
	(80,'C8:C9:A3:35:E4:EF','25299482','2024-08-12 15:37:21','tag number not exist.'),
	(81,'C8:C9:A3:35:E4:EF','5059622','2024-08-12 15:37:32','tag number not exist.'),
	(82,'C8:C9:A3:35:E4:EF','5059622','2024-08-12 15:37:50','tag number not exist.'),
	(83,'C8:C9:A3:35:E4:EF','55107472','2024-08-12 15:37:57','tag number not exist.'),
	(84,'C8:C9:A3:35:E4:EF','55107472','2024-08-12 15:38:11','tag number not exist.'),
	(85,'C8:C9:A3:35:E4:EF','58100482','2024-08-12 15:38:24','tag number not exist.'),
	(86,'C8:C9:A3:35:E4:EF','58100482','2024-08-12 15:38:40','tag number not exist.'),
	(87,'C8:C9:A3:35:E4:EF','7175602','2024-08-12 15:38:49','tag number not exist.'),
	(88,'C8:C9:A3:35:E4:EF','7175602','2024-08-12 15:39:04','tag number not exist.'),
	(89,'C8:C9:A3:35:E4:EF','7175602','2024-08-12 15:39:07','tag number not exist.'),
	(90,'C8:C9:A3:35:E4:EF','11722482','2024-08-12 15:39:34','tag number not exist.'),
	(91,'C8:C9:A3:35:E4:EF','11722482','2024-08-12 15:39:48','tag number not exist.'),
	(92,'C8:C9:A3:35:E4:EF','11722482','2024-08-12 15:39:50','tag number not exist.'),
	(93,'C8:C9:A3:35:E4:EF','7810482','2024-08-12 15:39:57','tag number not exist.'),
	(94,'C8:C9:A3:35:E4:EF','14947482','2024-08-12 15:40:11','tag number not exist.'),
	(95,'C8:C9:A3:35:E4:EF','165117482','2024-08-12 15:40:27','tag number not exist.'),
	(96,'C8:C9:A3:35:E4:EF','52136472','2024-08-12 15:40:40','tag number not exist.'),
	(97,'C8:C9:A3:35:E4:EF','52136472','2024-08-12 15:40:41','tag number not exist.'),
	(98,'C8:C9:A3:35:E4:EF','52136472','2024-08-12 15:40:44','tag number not exist.'),
	(99,'C8:C9:A3:35:E4:EF','22836592','2024-08-12 15:40:58','tag number not exist.'),
	(100,'C8:C9:A3:35:E4:EF','4244472','2024-08-12 15:41:11','tag number not exist.'),
	(101,'C8:C9:A3:35:E4:EF','26206482','2024-08-12 15:42:19','tag number not exist.'),
	(102,'C8:C9:A3:35:E4:EF','26206482','2024-08-12 15:42:30','tag number not exist.'),
	(103,'C8:C9:A3:35:E4:EF','10974612','2024-08-12 15:42:36','tag number not exist.'),
	(104,'C8:C9:A3:35:E4:EF','193210582','2024-08-12 15:42:48','tag number not exist.'),
	(105,'C8:C9:A3:35:E4:EF','238104492','2024-08-12 15:43:23','tag number not exist.'),
	(106,'C8:C9:A3:35:E4:EF','974472','2024-08-12 15:43:51','tag number not exist.'),
	(107,'C8:C9:A3:35:E4:EF','25125622','2024-08-12 15:44:02','tag number not exist.'),
	(108,'C8:C9:A3:35:E4:EF','25125622','2024-08-12 15:44:05','tag number not exist.'),
	(109,'C8:C9:A3:35:E4:EF','25125622','2024-08-12 15:44:17','tag number not exist.'),
	(110,'C8:C9:A3:35:E4:EF','974472','2024-08-12 15:44:23','tag number not exist.'),
	(111,'C8:C9:A3:35:E4:EF','238104492','2024-08-12 15:44:55','tag number not exist.'),
	(112,'C8:C9:A3:35:E4:EF','974472','2024-08-12 15:45:13','tag number not exist.'),
	(113,'C8:C9:A3:35:E4:EF','25125622','2024-08-12 15:45:24','tag number not exist.'),
	(114,'C8:C9:A3:35:E4:EF','18075592','2024-08-12 15:45:42','tag number not exist.'),
	(115,'C8:C9:A3:35:E4:EF','18075592','2024-08-12 15:45:44','tag number not exist.'),
	(116,'C8:C9:A3:35:E4:EF','252251602','2024-08-12 15:45:54','tag number not exist.'),
	(117,'C8:C9:A3:35:E4:EF','5244492','2024-08-12 15:46:42','tag number not exist.'),
	(118,'C8:C9:A3:35:E4:EF','5244492','2024-08-12 15:46:46','tag number not exist.'),
	(119,'C8:C9:A3:35:E4:EF','23573602','2024-08-12 15:47:02','tag number not exist.'),
	(120,'C8:C9:A3:35:E4:EF','17766472','2024-08-12 15:47:14','tag number not exist.'),
	(121,'C8:C9:A3:35:E4:EF','3976472','2024-08-12 15:47:37','tag number not exist.'),
	(122,'C8:C9:A3:35:E4:EF','204227472','2024-08-12 15:47:48','tag number not exist.'),
	(123,'C8:C9:A3:35:E4:EF','254214602','2024-08-12 15:48:09','tag number not exist.'),
	(124,'C8:C9:A3:35:E4:EF','254214602','2024-08-12 15:48:29','tag number not exist.'),
	(125,'C8:C9:A3:35:E4:EF','81179482','2024-08-12 15:48:35','tag number not exist.'),
	(126,'C8:C9:A3:35:E4:EF','221122482','2024-08-12 15:48:47','tag number not exist.'),
	(127,'C8:C9:A3:35:E4:EF','25235582','2024-08-12 15:49:02','tag number not exist.'),
	(128,'C8:C9:A3:35:E4:EF','25235582','2024-08-12 15:49:10','tag number not exist.'),
	(129,'C8:C9:A3:35:E4:EF','134206582','2024-08-12 15:49:15','tag number not exist.'),
	(130,'C8:C9:A3:35:E4:EF','16310592','2024-08-12 15:49:27','tag number not exist.'),
	(131,'C8:C9:A3:35:E4:EF','213193472','2024-08-12 15:49:37','tag number not exist.'),
	(132,'C8:C9:A3:35:E4:EF','85213592','2024-08-12 16:05:32','tag number not exist.'),
	(133,'C8:C9:A3:35:E4:EF','243220244235','2024-08-12 17:43:41','tag number not exist.'),
	(134,'C8:C9:A3:35:E4:EF','243220244235','2024-08-12 17:43:43','tag number not exist.'),
	(135,'C8:C9:A3:35:E4:EF','243220244235','2024-08-12 17:43:48','tag number not exist.'),
	(136,'C8:C9:A3:35:E4:EF','243220244235','2024-08-12 17:43:51','tag number not exist.'),
	(137,'C8:C9:A3:35:E4:EF','243220244235','2024-08-12 17:43:53','tag number not exist.'),
	(138,'C8:C9:A3:35:E4:EF','243220244235','2024-08-12 17:45:10','tag number not exist.'),
	(139,'C8:C9:A3:35:E4:EF','243220244235','2024-08-12 17:45:13','tag number not exist.'),
	(140,'C8:C9:A3:35:E4:EF','243220244235','2024-08-12 17:45:21','tag number not exist.'),
	(141,'C8:C9:A3:35:E4:EF','243220244235','2024-08-12 17:45:23','tag number not exist.'),
	(142,'C8:C9:A3:35:E4:EF','243220244235','2024-08-12 17:45:25','tag number not exist.'),
	(143,'C8:C9:A3:35:E4:EF','243220244235','2024-08-12 17:45:28','tag number not exist.'),
	(144,'C8:C9:A3:35:E4:EF','243220244235','2024-08-12 17:46:13','tag number not exist.'),
	(145,'C8:C9:A3:35:E4:EF','243220244235','2024-08-12 17:57:16','tag number not exist.'),
	(146,'C8:C9:A3:35:E4:EF','243220244235','2024-08-12 17:57:19','tag number not exist.'),
	(147,'C8:C9:A3:35:E4:EF','243220244235','2024-08-12 17:57:31','tag number not exist.'),
	(148,'C8:C9:A3:35:E4:EF','243220244235','2024-08-12 20:38:56','tag number not exist.'),
	(149,'C8:C9:A3:35:E4:EF','243220244235','2024-08-12 20:40:31','tag number not exist.'),
	(150,'C8:C9:A3:35:E4:EF','243220244235','2024-08-12 20:40:32','tag number not exist.'),
	(151,'C8:C9:A3:35:E4:EF','243220244235','2024-08-12 20:40:42','tag number not exist.'),
	(152,'C8:C9:A3:35:E4:EF','243220244235','2024-08-12 20:41:14','tag number not exist.'),
	(153,'C8:C9:A3:35:E4:EF','243220244235','2024-08-12 20:41:16','tag number not exist.'),
	(154,'C8:C9:A3:35:E4:EF','243220244235','2024-08-12 20:41:21','tag number not exist.'),
	(155,'C8:C9:A3:35:E4:EF','243220244235','2024-08-12 20:45:41','tag number not exist.'),
	(156,'C8:C9:A3:35:E4:EF','243220244235','2024-08-12 20:45:51','tag number not exist.'),
	(157,'C8:C9:A3:35:E4:EF','243220244235','2024-08-12 20:45:52','tag number not exist.'),
	(158,'C8:C9:A3:35:E4:EF','22124472','2024-08-12 22:02:09','tag number not exist.'),
	(159,'C8:C9:A3:35:E4:EF','22124472','2024-08-12 22:02:15','tag number not exist.'),
	(160,'C8:C9:A3:35:E4:EF','22124472','2024-08-12 22:02:23','tag number not exist.'),
	(161,'C8:C9:A3:35:E4:EF','22124472','2024-08-12 22:02:25','tag number not exist.'),
	(162,'C8:C9:A3:35:E4:EF','22124472','2024-08-12 22:06:41','tag number not exist.'),
	(163,'C8:C9:A3:35:E4:EF','3663602','2024-08-12 22:07:02','tag number not exist.'),
	(164,'C8:C9:A3:35:E4:EF','3663602','2024-08-12 22:07:04','tag number not exist.'),
	(165,'C8:C9:A3:35:E4:EF','3663602','2024-08-12 22:07:08','tag number not exist.'),
	(166,'C8:C9:A3:35:E4:EF','3663602','2024-08-12 22:07:21','tag number not exist.'),
	(167,'C8:C9:A3:35:E4:EF','3663602','2024-08-12 22:07:34','tag number not exist.'),
	(168,'C8:C9:A3:35:E4:EF','3663602','2024-08-12 22:07:36','tag number not exist.'),
	(169,'C8:C9:A3:35:E4:EF','3663602','2024-08-12 22:07:39','tag number not exist.'),
	(170,'C8:C9:A3:35:E4:EF','3663602','2024-08-12 22:07:57','tag number not exist.'),
	(171,'C8:C9:A3:35:E4:EF','3663602','2024-08-12 22:08:41','tag number not exist.'),
	(172,'C8:C9:A3:35:E4:EF','22124472','2024-08-12 22:08:44','tag number not exist.'),
	(173,'C8:C9:A3:35:E4:EF','3663602','2024-08-12 22:08:54','tag number not exist.'),
	(174,'C8:C9:A3:35:E4:EF','9338612','2024-08-12 22:09:09','tag number not exist.'),
	(175,'C8:C9:A3:35:E4:EF','9338612','2024-08-12 22:09:15','tag number not exist.'),
	(176,'C8:C9:A3:35:E4:EF','9338612','2024-08-12 22:09:31','tag number not exist.'),
	(177,'C8:C9:A3:35:E4:EF','193122602','2024-08-12 22:09:36','tag number not exist.'),
	(178,'C8:C9:A3:35:E4:EF','193122602','2024-08-12 22:09:46','tag number not exist.'),
	(179,'C8:C9:A3:35:E4:EF','235239472','2024-08-12 22:09:54','tag number not exist.'),
	(180,'C8:C9:A3:35:E4:EF','235239472','2024-08-12 22:10:05','tag number not exist.'),
	(181,'C8:C9:A3:35:E4:EF','197186482','2024-08-12 22:10:19','tag number not exist.'),
	(182,'C8:C9:A3:35:E4:EF','197186482','2024-08-12 22:10:42','tag number not exist.'),
	(183,'C8:C9:A3:35:E4:EF','189244602','2024-08-12 22:10:48','tag number not exist.'),
	(184,'C8:C9:A3:35:E4:EF','189244602','2024-08-12 22:11:00','tag number not exist.'),
	(185,'C8:C9:A3:35:E4:EF','28244482','2024-08-12 22:11:03','tag number not exist.'),
	(186,'C8:C9:A3:35:E4:EF','193122482','2024-08-12 22:11:14','tag number not exist.'),
	(187,'C8:C9:A3:35:E4:EF','193122482','2024-08-12 22:11:16','tag number not exist.'),
	(188,'C8:C9:A3:35:E4:EF','122221482','2024-08-12 22:11:28','tag number not exist.'),
	(189,'C8:C9:A3:35:E4:EF','22842642','2024-08-12 22:11:41','tag number not exist.'),
	(190,'C8:C9:A3:35:E4:EF','77125492','2024-08-12 22:11:52','tag number not exist.'),
	(191,'C8:C9:A3:35:E4:EF','77125492','2024-08-12 22:12:09','tag number not exist.'),
	(192,'C8:C9:A3:35:E4:EF','6162472','2024-08-12 22:12:15','tag number not exist.'),
	(193,'C8:C9:A3:35:E4:EF','19812612','2024-08-12 22:12:24','tag number not exist.'),
	(194,'C8:C9:A3:35:E4:EF','15616472','2024-08-12 22:12:36','tag number not exist.'),
	(195,'C8:C9:A3:35:E4:EF','17394592','2024-08-12 22:12:45','tag number not exist.'),
	(196,'C8:C9:A3:35:E4:EF','3926612','2024-08-12 22:13:09','tag number not exist.'),
	(197,'C8:C9:A3:35:E4:EF','198246582','2024-08-12 22:13:22','tag number not exist.'),
	(198,'C8:C9:A3:35:E4:EF','14236472','2024-08-12 22:13:36','tag number not exist.'),
	(199,'C8:C9:A3:35:E4:EF','199235582','2024-08-12 22:13:48','tag number not exist.'),
	(200,'C8:C9:A3:35:E4:EF','35113472','2024-08-12 22:13:59','tag number not exist.'),
	(201,'C8:C9:A3:35:E4:EF','33137472','2024-08-12 22:14:12','tag number not exist.'),
	(202,'C8:C9:A3:35:E4:EF','23568602','2024-08-12 22:14:25','tag number not exist.'),
	(203,'C8:C9:A3:35:E4:EF','209106492','2024-08-12 22:14:36','tag number not exist.'),
	(204,'C8:C9:A3:35:E4:EF','44106472','2024-08-12 22:14:48','tag number not exist.'),
	(205,'C8:C9:A3:35:E4:EF','9115482','2024-08-12 22:15:02','tag number not exist.'),
	(206,'C8:C9:A3:35:E4:EF','12381592','2024-08-12 22:15:28','tag number not exist.'),
	(207,'C8:C9:A3:35:E4:EF','5913492','2024-08-12 22:15:40','tag number not exist.'),
	(208,'C8:C9:A3:35:E4:EF','3814492','2024-08-12 22:15:51','tag number not exist.'),
	(209,'C8:C9:A3:35:E4:EF','16673622','2024-08-12 22:16:06','tag number not exist.'),
	(210,'C8:C9:A3:35:E4:EF','16544622','2024-08-12 22:16:19','tag number not exist.'),
	(211,'C8:C9:A3:35:E4:EF','8692482','2024-08-12 22:16:36','tag number not exist.'),
	(212,'C8:C9:A3:35:E4:EF','193192472','2024-08-12 22:16:45','tag number not exist.'),
	(213,'C8:C9:A3:35:E4:EF','22170482','2024-08-13 13:29:10','tag number not exist.'),
	(214,'C8:C9:A3:35:E4:EF','22573472','2024-08-13 13:29:24','tag number not exist.'),
	(215,'C8:C9:A3:35:E4:EF','1077492','2024-08-13 13:29:36','tag number not exist.'),
	(216,'C8:C9:A3:35:E4:EF','2882612','2024-08-13 13:29:54','tag number not exist.'),
	(217,'C8:C9:A3:35:E4:EF','23637592','2024-08-13 13:30:16','tag number not exist.'),
	(218,'C8:C9:A3:35:E4:EF','23637592','2024-08-13 13:30:18','tag number not exist.'),
	(219,'C8:C9:A3:35:E4:EF','26101622','2024-08-13 13:30:30','tag number not exist.'),
	(220,'C8:C9:A3:35:E4:EF','178252582','2024-08-13 13:30:40','tag number not exist.'),
	(221,'C8:C9:A3:35:E4:EF','8465622','2024-08-13 13:30:56','tag number not exist.'),
	(222,'C8:C9:A3:35:E4:EF','106225582','2024-08-13 13:31:12','tag number not exist.'),
	(223,'C8:C9:A3:35:E4:EF','15028472','2024-08-13 13:31:23','tag number not exist.'),
	(224,'C8:C9:A3:35:E4:EF','225244472','2024-08-13 13:31:34','tag number not exist.'),
	(225,'C8:C9:A3:35:E4:EF','2673492','2024-08-13 13:31:45','tag number not exist.'),
	(226,'C8:C9:A3:35:E4:EF','23782472','2024-08-13 13:32:03','tag number not exist.'),
	(227,'C8:C9:A3:35:E4:EF','13423492','2024-08-13 13:32:21','tag number not exist.'),
	(228,'C8:C9:A3:35:E4:EF','4164492','2024-08-13 13:32:35','tag number not exist.'),
	(229,'C8:C9:A3:35:E4:EF','131187582','2024-08-13 13:32:45','tag number not exist.'),
	(230,'C8:C9:A3:35:E4:EF','235234582','2024-08-13 13:32:57','tag number not exist.'),
	(231,'C8:C9:A3:35:E4:EF','7855592','2024-08-13 13:33:08','tag number not exist.'),
	(232,'C8:C9:A3:35:E4:EF','24238622','2024-08-13 13:33:19','tag number not exist.'),
	(233,'C8:C9:A3:35:E4:EF','69252582','2024-08-13 13:33:31','tag number not exist.'),
	(234,'C8:C9:A3:35:E4:EF','190235482','2024-08-13 13:36:34','tag number not exist.'),
	(235,'C8:C9:A3:35:E4:EF','122237582','2024-08-13 13:36:47','tag number not exist.'),
	(236,'C8:C9:A3:35:E4:EF','122237582','2024-08-13 13:36:49','tag number not exist.'),
	(237,'C8:C9:A3:35:E4:EF','146123482','2024-08-13 13:36:59','tag number not exist.'),
	(238,'C8:C9:A3:35:E4:EF','117165482','2024-08-13 13:37:10','tag number not exist.'),
	(239,'C8:C9:A3:35:E4:EF','5928612','2024-08-13 13:37:21','tag number not exist.'),
	(240,'C8:C9:A3:35:E4:EF','15425492','2024-08-13 13:37:48','tag number not exist.'),
	(241,'C8:C9:A3:35:E4:EF','18725592','2024-08-13 13:38:04','tag number not exist.'),
	(242,'C8:C9:A3:35:E4:EF','13999492','2024-08-13 13:38:20','tag number not exist.'),
	(243,'C8:C9:A3:35:E4:EF','13999492','2024-08-13 13:38:23','tag number not exist.'),
	(244,'C8:C9:A3:35:E4:EF','8333592','2024-08-13 13:38:33','tag number not exist.'),
	(245,'C8:C9:A3:35:E4:EF','8333592','2024-08-13 13:38:35','tag number not exist.'),
	(246,'C8:C9:A3:35:E4:EF','219223472','2024-08-13 13:38:45','tag number not exist.'),
	(247,'C8:C9:A3:35:E4:EF','3588492','2024-08-13 13:39:00','tag number not exist.'),
	(248,'C8:C9:A3:35:E4:EF','153219472','2024-08-13 13:39:08','tag number not exist.'),
	(249,'C8:C9:A3:35:E4:EF','148238582','2024-08-13 13:39:18','tag number not exist.'),
	(250,'C8:C9:A3:35:E4:EF','4678482','2024-08-13 13:39:27','tag number not exist.'),
	(251,'C8:C9:A3:35:E4:EF','11948482','2024-08-13 13:39:38','tag number not exist.'),
	(252,'C8:C9:A3:35:E4:EF','28215482','2024-08-13 13:39:47','tag number not exist.'),
	(253,'C8:C9:A3:35:E4:EF','10352612','2024-08-13 13:39:57','tag number not exist.'),
	(254,'C8:C9:A3:35:E4:EF','94113492','2024-08-13 13:40:09','tag number not exist.'),
	(255,'C8:C9:A3:35:E4:EF','9768482','2024-08-13 13:40:19','tag number not exist.'),
	(256,'C8:C9:A3:35:E4:EF','25280472','2024-08-13 13:40:28','tag number not exist.'),
	(257,'C8:C9:A3:35:E4:EF','28249582','2024-08-13 13:40:39','tag number not exist.'),
	(258,'C8:C9:A3:35:E4:EF','106184592','2024-08-13 13:40:48','tag number not exist.'),
	(259,'C8:C9:A3:35:E4:EF','15377482','2024-08-13 13:40:57','tag number not exist.'),
	(260,'C8:C9:A3:35:E4:EF','219220582','2024-08-13 13:41:07','tag number not exist.'),
	(261,'C8:C9:A3:35:E4:EF','60233482','2024-08-13 13:41:20','tag number not exist.'),
	(262,'C8:C9:A3:35:E4:EF','196160472','2024-08-13 13:41:31','tag number not exist.'),
	(263,'C8:C9:A3:35:E4:EF','39126592','2024-08-13 13:41:41','tag number not exist.'),
	(264,'C8:C9:A3:35:E4:EF','14991602','2024-08-13 13:41:50','tag number not exist.'),
	(265,'C8:C9:A3:35:E4:EF','6264612','2024-08-13 13:42:00','tag number not exist.'),
	(266,'C8:C9:A3:35:E4:EF','54233472','2024-08-13 13:42:09','tag number not exist.'),
	(267,'C8:C9:A3:35:E4:EF','201254592','2024-08-13 13:42:20','tag number not exist.'),
	(268,'C8:C9:A3:35:E4:EF','130243482','2024-08-13 13:42:31','tag number not exist.'),
	(269,'C8:C9:A3:35:E4:EF','33125472','2024-08-13 13:42:40','tag number not exist.'),
	(270,'C8:C9:A3:35:E4:EF','16126492','2024-08-13 13:42:48','tag number not exist.'),
	(271,'C8:C9:A3:35:E4:EF','25399472','2024-08-13 13:42:59','tag number not exist.'),
	(272,'C8:C9:A3:35:E4:EF','12136482','2024-08-13 13:43:31','tag number not exist.'),
	(273,'C8:C9:A3:35:E4:EF','20521592','2024-08-13 13:46:03','tag number not exist.'),
	(274,'C8:C9:A3:35:E4:EF','23653482','2024-08-13 13:46:14','tag number not exist.'),
	(275,'C8:C9:A3:35:E4:EF','4343592','2024-08-13 13:46:24','tag number not exist.'),
	(276,'C8:C9:A3:35:E4:EF','4343592','2024-08-13 13:46:26','tag number not exist.'),
	(277,'C8:C9:A3:35:E4:EF','4343592','2024-08-13 13:46:28','tag number not exist.'),
	(278,'C8:C9:A3:35:E4:EF','4343592','2024-08-13 13:46:29','tag number not exist.'),
	(279,'C8:C9:A3:35:E4:EF','4343592','2024-08-13 13:46:30','tag number not exist.'),
	(280,'C8:C9:A3:35:E4:EF','4343592','2024-08-13 13:46:32','tag number not exist.'),
	(281,'C8:C9:A3:35:E4:EF','4343592','2024-08-13 13:46:37','tag number not exist.'),
	(282,'C8:C9:A3:35:E4:EF','4343592','2024-08-13 13:46:42','tag number not exist.'),
	(283,'C8:C9:A3:35:E4:EF','4343592','2024-08-13 13:46:49','tag number not exist.'),
	(284,'C8:C9:A3:35:E4:EF','4343592','2024-08-13 13:46:52','tag number not exist.'),
	(285,'C8:C9:A3:35:E4:EF','4343592','2024-08-13 13:46:57','tag number not exist.'),
	(286,'C8:C9:A3:35:E4:EF','4343592','2024-08-13 13:47:00','tag number not exist.'),
	(287,'C8:C9:A3:35:E4:EF','4343592','2024-08-13 13:47:01','tag number not exist.'),
	(288,'C8:C9:A3:35:E4:EF','4343592','2024-08-13 13:47:02','tag number not exist.'),
	(289,'C8:C9:A3:35:E4:EF','4343592','2024-08-13 13:47:18','tag number not exist.'),
	(290,'C8:C9:A3:35:E4:EF','4343592','2024-08-13 13:48:19','tag number not exist.'),
	(291,'C8:C9:A3:35:E4:EF','4343592','2024-08-13 13:57:45','tag number not exist.'),
	(292,'C8:C9:A3:35:E4:EF','148212602','2024-08-13 13:57:58','tag number not exist.'),
	(293,'C8:C9:A3:35:E4:EF','24732592','2024-08-13 13:58:11','tag number not exist.'),
	(294,'C8:C9:A3:35:E4:EF','19623472','2024-08-13 13:58:20','tag number not exist.'),
	(295,'C8:C9:A3:35:E4:EF','7895592','2024-08-13 13:58:35','tag number not exist.'),
	(296,'C8:C9:A3:35:E4:EF','188227482','2024-08-13 13:58:46','tag number not exist.'),
	(297,'C8:C9:A3:35:E4:EF','206156472','2024-08-13 13:58:56','tag number not exist.'),
	(298,'C8:C9:A3:35:E4:EF','66179482','2024-08-13 13:59:05','tag number not exist.'),
	(299,'C8:C9:A3:35:E4:EF','23549472','2024-08-13 13:59:15','tag number not exist.'),
	(300,'C8:C9:A3:35:E4:EF','21394482','2024-08-13 13:59:23','tag number not exist.'),
	(301,'C8:C9:A3:35:E4:EF','6139482','2024-08-13 13:59:33','tag number not exist.'),
	(302,'C8:C9:A3:35:E4:EF','82113472','2024-08-13 13:59:47','tag number not exist.'),
	(303,'C8:C9:A3:35:E4:EF','11738612','2024-08-13 13:59:57','tag number not exist.'),
	(304,'C8:C9:A3:35:E4:EF','11738612','2024-08-13 14:00:05','tag number not exist.'),
	(305,'C8:C9:A3:35:E4:EF','174223582','2024-08-13 14:00:09','tag number not exist.'),
	(306,'C8:C9:A3:35:E4:EF','174223582','2024-08-13 14:00:11','tag number not exist.'),
	(307,'C8:C9:A3:35:E4:EF','174223582','2024-08-13 14:00:35','tag number not exist.'),
	(308,'C8:C9:A3:35:E4:EF','51199582','2024-08-13 14:00:42','tag number not exist.'),
	(309,'C8:C9:A3:35:E4:EF','221233582','2024-08-13 14:00:51','tag number not exist.'),
	(310,'C8:C9:A3:35:E4:EF','5242642','2024-08-13 14:01:01','tag number not exist.'),
	(311,'C8:C9:A3:35:E4:EF','126237582','2024-08-13 14:01:10','tag number not exist.'),
	(312,'C8:C9:A3:35:E4:EF','114184472','2024-08-13 14:01:18','tag number not exist.'),
	(313,'C8:C9:A3:35:E4:EF','14228492','2024-08-13 14:01:34','tag number not exist.'),
	(314,'C8:C9:A3:35:E4:EF','34218582','2024-08-13 14:01:43','tag number not exist.'),
	(315,'C8:C9:A3:35:E4:EF','71244472','2024-08-13 14:01:53','tag number not exist.'),
	(316,'C8:C9:A3:35:E4:EF','76217582','2024-08-13 14:02:03','tag number not exist.'),
	(317,'C8:C9:A3:35:E4:EF','10833472','2024-08-13 14:02:11','tag number not exist.'),
	(318,'C8:C9:A3:35:E4:EF','10833472','2024-08-13 15:06:36','tag number not exist.'),
	(319,'C8:C9:A3:35:E4:EF','10833472','2024-08-13 15:06:38','tag number not exist.'),
	(320,'C8:C9:A3:35:E4:EF','10833472','2024-08-13 15:06:42','tag number not exist.'),
	(321,'C8:C9:A3:35:E4:EF','10833472','2024-08-13 15:09:20','tag number not exist.'),
	(322,'C8:C9:A3:35:E4:EF','24672472','2024-08-13 15:09:33','tag number not exist.'),
	(323,'C8:C9:A3:35:E4:EF','11513612','2024-08-13 15:09:45','tag number not exist.'),
	(324,'C8:C9:A3:35:E4:EF','20235622','2024-08-13 15:09:55','tag number not exist.'),
	(325,'C8:C9:A3:35:E4:EF','42105492','2024-08-13 15:10:54','tag number not exist.'),
	(326,'C8:C9:A3:35:E4:EF','113201482','2024-08-13 15:11:41','tag number not exist.'),
	(327,'C8:C9:A3:35:E4:EF','5974602','2024-08-13 15:12:01','tag number not exist.'),
	(328,'C8:C9:A3:35:E4:EF','147238582','2024-08-13 15:12:10','tag number not exist.'),
	(329,'C8:C9:A3:35:E4:EF','147238582','2024-08-13 15:12:12','tag number not exist.'),
	(330,'C8:C9:A3:35:E4:EF','129212582','2024-08-13 15:12:21','tag number not exist.'),
	(331,'C8:C9:A3:35:E4:EF','4618592','2024-08-13 15:12:31','tag number not exist.'),
	(332,'C8:C9:A3:35:E4:EF','13365622','2024-08-13 15:12:46','tag number not exist.'),
	(333,'C8:C9:A3:35:E4:EF','150117482','2024-08-13 15:12:56','tag number not exist.'),
	(334,'C8:C9:A3:35:E4:EF','132198582','2024-08-13 15:15:21','tag number not exist.'),
	(335,'C8:C9:A3:35:E4:EF','246103492','2024-08-13 15:15:33','tag number not exist.'),
	(336,'C8:C9:A3:35:E4:EF','246103492','2024-08-13 15:38:18','tag number not exist.'),
	(337,'C8:C9:A3:35:E4:EF','246103492','2024-08-13 15:40:53','tag number not exist.'),
	(338,'C8:C9:A3:35:E4:EF','131236472','2024-08-13 15:41:11','tag number not exist.'),
	(339,'C8:C9:A3:35:E4:EF','131236472','2024-08-13 15:41:14','tag number not exist.'),
	(340,'C8:C9:A3:35:E4:EF','131236472','2024-08-13 15:41:31','tag number not exist.'),
	(341,'C8:C9:A3:35:E4:EF','22844592','2024-08-13 15:41:48','tag number not exist.'),
	(342,'C8:C9:A3:35:E4:EF','3139592','2024-08-13 15:42:00','tag number not exist.'),
	(343,'C8:C9:A3:35:E4:EF','13837622','2024-08-13 15:42:09','tag number not exist.'),
	(344,'C8:C9:A3:35:E4:EF','226244482','2024-08-13 15:42:23','tag number not exist.'),
	(345,'C8:C9:A3:35:E4:EF','205118482','2024-08-13 15:42:34','tag number not exist.'),
	(346,'C8:C9:A3:35:E4:EF','51145472','2024-08-13 15:42:45','tag number not exist.'),
	(347,'C8:C9:A3:35:E4:EF','13980482','2024-08-13 15:42:58','tag number not exist.'),
	(348,'C8:C9:A3:35:E4:EF','14275482','2024-08-13 15:43:08','tag number not exist.'),
	(349,'C8:C9:A3:35:E4:EF','16573622','2024-08-13 15:43:19','tag number not exist.'),
	(350,'C8:C9:A3:35:E4:EF','20170472','2024-08-13 15:43:28','tag number not exist.'),
	(351,'C8:C9:A3:35:E4:EF','116231582','2024-08-13 15:43:36','tag number not exist.'),
	(352,'C8:C9:A3:35:E4:EF','1471622','2024-08-13 15:43:46','tag number not exist.'),
	(353,'C8:C9:A3:35:E4:EF','222210482','2024-08-13 15:43:57','tag number not exist.'),
	(354,'C8:C9:A3:35:E4:EF','20646472','2024-08-13 15:44:07','tag number not exist.'),
	(355,'C8:C9:A3:35:E4:EF','20646472','2024-08-13 15:44:20','tag number not exist.'),
	(356,'C8:C9:A3:35:E4:EF','222210482','2024-08-13 15:44:39','tag number not exist.'),
	(357,'C8:C9:A3:35:E4:EF','13837622','2024-08-13 15:45:32','tag number not exist.'),
	(358,'C8:C9:A3:35:E4:EF','226244482','2024-08-13 15:45:56','tag number not exist.'),
	(359,'C8:C9:A3:35:E4:EF','205118482','2024-08-13 15:46:31','tag number not exist.'),
	(360,'C8:C9:A3:35:E4:EF','205118482','2024-08-13 15:46:33','tag number not exist.'),
	(361,'C8:C9:A3:35:E4:EF','205118482','2024-08-13 15:46:36','tag number not exist.'),
	(362,'C8:C9:A3:35:E4:EF','51145472','2024-08-13 15:46:40','tag number not exist.'),
	(363,'C8:C9:A3:35:E4:EF','51145472','2024-08-13 15:46:42','tag number not exist.'),
	(364,'C8:C9:A3:35:E4:EF','51145472','2024-08-13 15:46:43','tag number not exist.'),
	(365,'C8:C9:A3:35:E4:EF','226244482','2024-08-13 15:46:50','tag number not exist.'),
	(366,'C8:C9:A3:35:E4:EF','226244482','2024-08-13 15:46:58','tag number not exist.'),
	(367,'C8:C9:A3:35:E4:EF','226244482','2024-08-13 15:47:59','tag number not exist.'),
	(368,'C8:C9:A3:35:E4:EF','205118482','2024-08-13 15:48:19','tag number not exist.'),
	(369,'C8:C9:A3:35:E4:EF','226244482','2024-08-13 15:48:25','tag number not exist.'),
	(370,'C8:C9:A3:35:E4:EF','226244482','2024-08-13 15:48:29','tag number not exist.'),
	(371,'C8:C9:A3:35:E4:EF','226244482','2024-08-13 15:48:33','tag number not exist.'),
	(372,'C8:C9:A3:35:E4:EF','226244482','2024-08-13 15:48:38','tag number not exist.'),
	(373,'C8:C9:A3:35:E4:EF','226244482','2024-08-13 15:48:49','tag number not exist.'),
	(374,'C8:C9:A3:35:E4:EF','51145472','2024-08-13 15:48:53','tag number not exist.'),
	(375,'C8:C9:A3:35:E4:EF','51145472','2024-08-13 15:48:55','tag number not exist.'),
	(376,'C8:C9:A3:35:E4:EF','13980482','2024-08-13 15:49:00','tag number not exist.'),
	(377,'C8:C9:A3:35:E4:EF','226244482','2024-08-13 15:49:18','tag number not exist.'),
	(378,'C8:C9:A3:35:E4:EF','226244482','2024-08-13 15:49:26','tag number not exist.'),
	(379,'C8:C9:A3:35:E4:EF','226244482','2024-08-13 15:49:27','tag number not exist.'),
	(380,'C8:C9:A3:35:E4:EF','226244482','2024-08-13 15:49:42','tag number not exist.'),
	(381,'C8:C9:A3:35:E4:EF','226244482','2024-08-13 15:49:44','tag number not exist.'),
	(382,'C8:C9:A3:35:E4:EF','226244482','2024-08-13 15:50:16','tag number not exist.'),
	(383,'C8:C9:A3:35:E4:EF','226244482','2024-08-13 16:13:58','tag number not exist.'),
	(384,'C8:C9:A3:35:E4:EF','226244482','2024-08-13 16:15:26','tag number not exist.'),
	(385,'C8:C9:A3:35:E4:EF','226244482','2024-08-13 16:15:39','tag number not exist.'),
	(386,'C8:C9:A3:35:E4:EF','226244482','2024-08-13 16:17:02','tag number not exist.'),
	(387,'C8:C9:A3:35:E4:EF','205118482','2024-08-13 16:17:32','tag number not exist.'),
	(388,'C8:C9:A3:35:E4:EF','51145472','2024-08-13 16:17:50','tag number not exist.'),
	(389,'C8:C9:A3:35:E4:EF','13980482','2024-08-13 16:18:02','tag number not exist.'),
	(390,'C8:C9:A3:35:E4:EF','14275482','2024-08-13 16:18:12','tag number not exist.'),
	(391,'C8:C9:A3:35:E4:EF','16573622','2024-08-13 16:18:25','tag number not exist.'),
	(392,'C8:C9:A3:35:E4:EF','20170472','2024-08-13 16:18:37','tag number not exist.'),
	(393,'C8:C9:A3:35:E4:EF','116231582','2024-08-13 16:18:49','tag number not exist.'),
	(394,'C8:C9:A3:35:E4:EF','1471622','2024-08-13 16:18:59','tag number not exist.'),
	(395,'C8:C9:A3:35:E4:EF','222210482','2024-08-13 16:19:09','tag number not exist.'),
	(396,'C8:C9:A3:35:E4:EF','20646472','2024-08-13 16:19:20','tag number not exist.'),
	(397,'C8:C9:A3:35:E4:EF','24394602','2024-08-13 16:19:31','tag number not exist.'),
	(398,'C8:C9:A3:35:E4:EF','12116592','2024-08-13 16:19:41','tag number not exist.'),
	(399,'C8:C9:A3:35:E4:EF','5398622','2024-08-13 16:19:54','tag number not exist.'),
	(400,'C8:C9:A3:35:E4:EF','141198582','2024-08-13 16:20:06','tag number not exist.'),
	(401,'C8:C9:A3:35:E4:EF','14136472','2024-08-13 16:20:15','tag number not exist.'),
	(402,'C8:C9:A3:35:E4:EF','233153602','2024-08-13 16:20:24','tag number not exist.'),
	(403,'C8:C9:A3:35:E4:EF','7018592','2024-08-13 16:20:35','tag number not exist.'),
	(404,'C8:C9:A3:35:E4:EF','217253472','2024-08-13 16:20:44','tag number not exist.'),
	(405,'C8:C9:A3:35:E4:EF','20149472','2024-08-13 16:20:54','tag number not exist.'),
	(406,'C8:C9:A3:35:E4:EF','5525472','2024-08-13 16:21:03','tag number not exist.'),
	(407,'C8:C9:A3:35:E4:EF','87193472','2024-08-13 16:21:13','tag number not exist.'),
	(408,'C8:C9:A3:35:E4:EF','9833592','2024-08-13 16:21:23','tag number not exist.'),
	(409,'C8:C9:A3:35:E4:EF','217254482','2024-08-13 16:21:33','tag number not exist.'),
	(410,'C8:C9:A3:35:E4:EF','217254482','2024-08-13 16:21:35','tag number not exist.'),
	(411,'C8:C9:A3:35:E4:EF','10128622','2024-08-13 16:21:44','tag number not exist.'),
	(412,'C8:C9:A3:35:E4:EF','73100482','2024-08-13 16:21:54','tag number not exist.'),
	(413,'C8:C9:A3:35:E4:EF','73100482','2024-08-13 16:21:57','tag number not exist.'),
	(414,'C8:C9:A3:35:E4:EF','243220244235','2024-08-13 16:30:32','tag number not exist.'),
	(415,'C8:C9:A3:35:E4:EF','243220244235','2024-08-13 16:33:54','tag number not exist.'),
	(416,'C8:C9:A3:35:E4:EF','243220244235','2024-08-13 16:33:55','tag number not exist.'),
	(417,'C8:C9:A3:35:E4:EF','243220244235','2024-08-13 16:33:56','tag number not exist.'),
	(418,'C8:C9:A3:35:E4:EF','243220244235','2024-08-13 16:33:57','tag number not exist.'),
	(419,'C8:C9:A3:35:E4:EF','8366104245','2024-08-13 16:36:22','tag number not exist.'),
	(420,'C8:C9:A3:35:E4:EF','21113822615','2024-08-13 16:36:55','access denied.'),
	(421,'C8:C9:A3:35:E4:EF','243220244235','2024-08-13 17:52:00','tag number not exist.'),
	(422,'C8:C9:A3:35:E4:EF','243220244235','2024-08-13 17:53:42','tag number not exist.'),
	(423,'C8:C9:A3:35:E4:EF','243220244235','2024-08-13 17:53:50','tag number not exist.'),
	(424,'C8:C9:A3:35:E4:EF','243220244235','2024-08-13 17:53:54','tag number not exist.'),
	(425,'C8:C9:A3:35:E4:EF','243220244235','2024-08-13 17:54:19','tag number not exist.'),
	(426,'C8:C9:A3:35:E4:EF','243220244235','2024-08-13 17:54:22','tag number not exist.'),
	(427,'C8:C9:A3:35:E4:EF','243220244235','2024-08-13 17:54:25','tag number not exist.'),
	(428,'C8:C9:A3:35:E4:EF','243220244235','2024-08-13 18:01:31','tag number not exist.');

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
	(1,2,'Javier Eduardo','Carvajal Escobar','881588888','3186502186','jaedcar74@gmail.com','a33e6c581ec1d4ac3818807eae92c2fd95dcbd3567b2a17b88eface13a831bcc',b'1',NULL),
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

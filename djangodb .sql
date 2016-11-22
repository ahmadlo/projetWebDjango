-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mar 10 Mai 2016 à 20:24
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `djangodb`
--

-- --------------------------------------------------------

--
-- Structure de la table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=61 ;

--
-- Contenu de la table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add entreprise', 7, 'add_entreprise'),
(20, 'Can change entreprise', 7, 'change_entreprise'),
(21, 'Can delete entreprise', 7, 'delete_entreprise'),
(22, 'Can add type', 8, 'add_type'),
(23, 'Can change type', 8, 'change_type'),
(24, 'Can delete type', 8, 'delete_type'),
(25, 'Can add zone', 9, 'add_zone'),
(26, 'Can change zone', 9, 'change_zone'),
(27, 'Can delete zone', 9, 'delete_zone'),
(28, 'Can add commercial', 10, 'add_commercial'),
(29, 'Can change commercial', 10, 'change_commercial'),
(30, 'Can delete commercial', 10, 'delete_commercial'),
(31, 'Can add agent', 11, 'add_agent'),
(32, 'Can change agent', 11, 'change_agent'),
(33, 'Can delete agent', 11, 'delete_agent'),
(34, 'Can add client', 12, 'add_client'),
(35, 'Can change client', 12, 'change_client'),
(36, 'Can delete client', 12, 'delete_client'),
(37, 'Can add programme', 13, 'add_programme'),
(38, 'Can change programme', 13, 'change_programme'),
(39, 'Can delete programme', 13, 'delete_programme'),
(40, 'Can add mission', 14, 'add_mission'),
(41, 'Can change mission', 14, 'change_mission'),
(42, 'Can delete mission', 14, 'delete_mission'),
(43, 'Can add profil', 15, 'add_profil'),
(44, 'Can change profil', 15, 'change_profil'),
(45, 'Can delete profil', 15, 'delete_profil'),
(46, 'Can add utilisateur', 16, 'add_utilisateur'),
(47, 'Can change utilisateur', 16, 'change_utilisateur'),
(48, 'Can delete utilisateur', 16, 'delete_utilisateur'),
(52, 'Can add cors model', 18, 'add_corsmodel'),
(53, 'Can change cors model', 18, 'change_corsmodel'),
(54, 'Can delete cors model', 18, 'delete_corsmodel'),
(55, 'Can add categorie', 19, 'add_categorie'),
(56, 'Can change categorie', 19, 'change_categorie'),
(57, 'Can delete categorie', 19, 'delete_categorie'),
(58, 'Can add type mission', 20, 'add_typemission'),
(59, 'Can change type mission', 20, 'change_typemission'),
(60, 'Can delete type mission', 20, 'delete_typemission');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$24000$ksF4CJDmsAmf$DmdLdcezYZpSSHbZ/rsWDVeuZB4NyRRawSOB+DEPsrk=', '2016-05-03 10:57:04.607108', 1, 'ahmad', '', '', '', 1, 1, '2016-03-10 11:55:21.711793');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=125 ;

--
-- Contenu de la table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2016-03-10 11:56:25.468666', '1', 'Emc2', 1, 'Ajout.', 7, 1),
(2, '2016-03-10 11:57:02.568142', '1', 'djibril diop', 1, 'Ajout.', 11, 1),
(3, '2016-03-10 11:57:25.324091', '1', 'sydi', 1, 'Ajout.', 10, 1),
(4, '2016-03-10 11:57:43.893821', '1', 'entreprise', 1, 'Ajout.', 8, 1),
(5, '2016-03-10 11:57:53.822194', '1', 'parcelles assainies', 1, 'Ajout.', 9, 1),
(6, '2016-03-10 11:58:21.030716', '1', 'boutique dior', 1, 'Ajout.', 12, 1),
(7, '2016-03-10 11:58:38.154620', '2', 'marche', 1, 'Ajout.', 12, 1),
(8, '2016-03-10 11:59:14.509855', '1', 'livraison banane', 1, 'Ajout.', 14, 1),
(9, '2016-03-10 12:10:59.146713', '1', 'agent', 1, 'Ajout.', 15, 1),
(10, '2016-03-10 12:11:06.387150', '2', 'commercial', 1, 'Ajout.', 15, 1),
(11, '2016-03-10 12:11:32.990828', '1', 'ahmadou lo', 1, 'Ajout.', 16, 1),
(12, '2016-03-14 11:27:10.064989', '2', 'livraison pizza', 1, 'Ajout.', 14, 1),
(13, '2016-03-14 13:04:57.183891', '3', 'emc2', 1, 'Ajout.', 12, 1),
(14, '2016-03-14 13:05:29.867908', '3', 'livraison djeune', 1, 'Ajout.', 14, 1),
(15, '2016-03-14 13:14:26.061293', '4', 'achat', 1, 'Ajout.', 14, 1),
(16, '2016-03-14 13:14:43.606420', '5', 'chargement', 1, 'Ajout.', 14, 1),
(17, '2016-03-14 13:15:25.311533', '6', 'vente', 1, 'Ajout.', 14, 1),
(18, '2016-03-14 13:16:05.659421', '7', 'test', 1, 'Ajout.', 14, 1),
(19, '2016-03-14 13:36:02.123280', '3', 'emc2', 2, 'Modification de cl_long.', 12, 1),
(20, '2016-03-14 13:36:08.497548', '2', 'marche', 2, 'Modification de cl_long.', 12, 1),
(21, '2016-03-14 13:36:15.294079', '1', 'boutique dior', 2, 'Modification de cl_long.', 12, 1),
(22, '2016-03-14 14:30:08.761002', '3', 'emc2', 2, 'Modification de cl_long.', 12, 1),
(23, '2016-03-14 14:30:17.183479', '2', 'marche', 2, 'Modification de cl_long.', 12, 1),
(24, '2016-03-14 14:30:24.264204', '1', 'boutique dior', 2, 'Modification de cl_long.', 12, 1),
(25, '2016-03-16 12:06:52.164876', '3', 'cices', 2, 'Modification de cl_name, cl_email, cl_lat et cl_long.', 12, 1),
(26, '2016-03-16 12:07:40.232816', '1', 'livraison banane', 2, 'Modification de lieu.', 14, 1),
(27, '2016-03-16 12:10:18.175649', '3', 'cices', 2, 'Modification de cl_lat.', 12, 1),
(28, '2016-03-16 12:15:19.698643', '2', 'marche', 2, 'Aucun champ modifié.', 12, 1),
(29, '2016-03-16 12:15:34.744659', '3', 'cices', 2, 'Modification de cl_lat.', 12, 1),
(30, '2016-03-16 12:15:47.612612', '3', 'cices', 2, 'Modification de cl_long.', 12, 1),
(31, '2016-03-16 13:54:56.150088', '3', 'cices', 2, 'Modification de cl_lat et cl_long.', 12, 1),
(32, '2016-03-16 14:43:38.590330', '3', 'cices', 2, 'Modification de cl_lat et cl_long.', 12, 1),
(33, '2016-03-16 15:59:42.251828', '3', 'cices', 2, 'Modification de cl_lat.', 12, 1),
(34, '2016-03-16 16:00:02.236581', '3', 'cices', 2, 'Modification de cl_long.', 12, 1),
(35, '2016-03-16 16:00:52.721934', '3', 'cices', 2, 'Modification de cl_lat.', 12, 1),
(36, '2016-03-16 16:01:15.367987', '3', 'cices', 2, 'Modification de cl_long.', 12, 1),
(37, '2016-03-16 16:09:23.367791', '3', 'cices', 2, 'Modification de cl_lat et cl_long.', 12, 1),
(38, '2016-03-16 16:22:23.934309', '3', 'cices', 2, 'Aucun champ modifié.', 12, 1),
(39, '2016-03-16 16:26:49.510080', '3', 'cices', 2, 'Modification de cl_lat.', 12, 1),
(40, '2016-03-16 16:51:32.830907', '3', 'cices', 2, 'Modification de cl_long.', 12, 1),
(41, '2016-03-16 16:52:38.596435', '3', 'cices', 2, 'Modification de cl_long.', 12, 1),
(42, '2016-03-16 16:53:58.517439', '3', 'cices', 2, 'Modification de cl_long.', 12, 1),
(43, '2016-03-16 16:54:18.305666', '3', 'cices', 2, 'Modification de cl_long.', 12, 1),
(44, '2016-03-16 16:54:39.028771', '3', 'cices', 2, 'Modification de cl_lat.', 12, 1),
(45, '2016-03-16 16:55:02.091457', '3', 'cices', 2, 'Modification de cl_lat.', 12, 1),
(46, '2016-03-16 16:55:41.201170', '3', 'cices', 2, 'Modification de cl_lat.', 12, 1),
(47, '2016-03-16 16:57:22.735515', '3', 'cices', 2, 'Modification de cl_lat et cl_long.', 12, 1),
(48, '2016-03-17 11:44:29.153631', '3', 'cices', 2, 'Modification de cl_lat et cl_long.', 12, 1),
(49, '2016-03-21 11:37:57.572028', '3', 'golf sud', 1, 'Ajout.', 9, 1),
(50, '2016-03-21 11:38:13.305716', '2', '', 3, '', 9, 1),
(51, '2016-03-21 11:38:25.975668', '1', 'boutique dior', 2, 'Modification de cl_zone.', 12, 1),
(52, '2016-03-21 16:11:23.435452', '7', 'test', 2, 'Modification de etat.', 14, 1),
(53, '2016-03-21 16:11:35.583138', '7', 'test', 2, 'Aucun champ modifié.', 14, 1),
(54, '2016-03-21 16:11:46.292638', '6', 'vente', 2, 'Modification de etat.', 14, 1),
(55, '2016-03-21 16:19:35.828129', '6', 'vente', 2, 'Modification de etat.', 14, 1),
(56, '2016-03-21 16:33:35.776366', '7', 'test', 2, 'Aucun champ modifié.', 14, 1),
(57, '2016-03-21 16:33:40.783650', '6', 'vente', 2, 'Modification de etat.', 14, 1),
(58, '2016-03-21 16:33:46.614244', '5', 'chargement', 2, 'Modification de etat.', 14, 1),
(59, '2016-03-21 16:37:03.701166', '5', 'chargement', 2, 'Modification de etat.', 14, 1),
(60, '2016-03-21 16:57:21.182425', '7', 'test', 2, 'Modification de etat.', 14, 1),
(61, '2016-03-21 16:57:29.056313', '6', 'vente', 2, 'Modification de etat.', 14, 1),
(62, '2016-03-21 16:57:34.771936', '5', 'chargement', 2, 'Modification de etat.', 14, 1),
(63, '2016-03-30 12:00:00.145005', '1', 'ahmadou lo', 2, 'Modification de pwd.', 16, 1),
(64, '2016-03-30 13:03:17.988319', '7', 'test', 2, 'Modification de etat.', 14, 1),
(65, '2016-03-30 13:03:26.442918', '6', 'vente', 2, 'Modification de etat.', 14, 1),
(66, '2016-03-30 13:03:33.144109', '5', 'chargement', 2, 'Modification de etat.', 14, 1),
(67, '2016-03-30 15:59:55.719044', '12', 'boutique dior', 2, 'Modification de cl_name, cl_lat et cl_long.', 12, 1),
(68, '2016-03-30 16:00:30.170612', '1', '''matay''', 2, 'Modification de cl_lat et cl_long.', 12, 1),
(69, '2016-03-30 16:07:59.452137', '1', 'matay', 2, 'Modification de cl_name.', 12, 1),
(70, '2016-03-30 16:10:00.915850', '10', 'boutique dio', 3, '', 12, 1),
(71, '2016-03-30 16:10:00.918996', '9', 'marche grand yoff', 3, '', 12, 1),
(72, '2016-03-30 16:10:00.962039', '8', 'marche', 3, '', 12, 1),
(73, '2016-03-30 16:10:00.967042', '1', 'matay', 3, '', 12, 1),
(74, '2016-03-30 16:16:30.753842', '12', 'boutique dior', 2, 'Modification de cl_long.', 12, 1),
(75, '2016-03-31 16:21:11.764448', '2', 'diof sarr', 1, 'Ajout.', 10, 1),
(76, '2016-03-31 16:22:39.602304', '8', 'achat', 1, 'Ajout.', 14, 1),
(77, '2016-03-31 16:23:00.518693', '9', 'chargement', 1, 'Ajout.', 14, 1),
(78, '2016-03-31 16:23:19.134081', '10', 'chargement', 1, 'Ajout.', 14, 1),
(79, '2016-04-01 17:41:19.896476', '2', 'pharmacie', 1, 'Ajout.', 8, 1),
(80, '2016-04-03 23:48:02.084429', '1', 'entreprise', 2, 'Modification de icone.', 8, 1),
(81, '2016-04-03 23:48:35.643071', '2', 'pharmacie', 2, 'Modification de icone.', 8, 1),
(82, '2016-04-05 09:25:41.776448', '3', 'uv', 2, 'Modification de cl_lat et cl_long.', 12, 1),
(83, '2016-04-08 11:51:37.182341', '13', 'rufisque', 3, '', 9, 1),
(84, '2016-04-08 11:51:37.201072', '12', 'rufisque', 3, '', 9, 1),
(85, '2016-04-08 11:51:37.205383', '8', 'plage', 3, '', 9, 1),
(86, '2016-04-08 11:51:37.207381', '7', 'virage', 3, '', 9, 1),
(87, '2016-04-08 11:51:37.210381', '6', 'rufisque', 3, '', 9, 1),
(88, '2016-04-08 11:51:37.213383', '5', 'rufisque', 3, '', 9, 1),
(89, '2016-04-08 12:13:07.296498', '16', 'rufisque', 3, '', 9, 1),
(90, '2016-04-08 12:13:07.302502', '15', 'rufisque', 3, '', 9, 1),
(91, '2016-04-08 12:13:07.305521', '14', 'rufisque', 3, '', 9, 1),
(92, '2016-04-08 12:16:01.349244', '17', 'rufisque', 3, '', 9, 1),
(93, '2016-04-08 12:21:39.732458', '18', 'rufisque', 3, '', 9, 1),
(94, '2016-04-08 12:40:19.392464', '20', 'rufisque', 3, '', 9, 1),
(95, '2016-04-08 12:40:19.396467', '19', 'rufisque', 3, '', 9, 1),
(96, '2016-04-08 12:49:35.806205', '22', 'rufisque', 3, '', 9, 1),
(97, '2016-04-08 12:49:35.810206', '21', 'rufisque', 3, '', 9, 1),
(98, '2016-04-08 12:59:56.910835', '24', 'rufisque', 3, '', 9, 1),
(99, '2016-04-08 12:59:56.914834', '23', 'rufisque', 3, '', 9, 1),
(100, '2016-04-11 12:50:45.452944', '28', 'rufisque', 3, '', 9, 1),
(101, '2016-04-11 12:50:45.488969', '27', 'rufisque', 3, '', 9, 1),
(102, '2016-04-11 12:50:45.491969', '26', 'rufisque', 3, '', 9, 1),
(103, '2016-04-15 17:45:19.159612', '10', 'chargement', 2, 'Modification de lieu.', 14, 1),
(104, '2016-04-15 17:45:27.226348', '9', 'chargement', 2, 'Modification de lieu.', 14, 1),
(105, '2016-04-20 09:45:50.545969', '3', 'boutique', 1, 'Ajout.', 8, 1),
(106, '2016-04-20 11:32:28.798183', '3', 'parcell', 3, '', 9, 1),
(107, '2016-04-20 11:32:28.802185', '2', 'parcell', 3, '', 9, 1),
(108, '2016-04-20 11:58:41.763643', '3', 'region', 1, 'Ajout.', 19, 1),
(109, '2016-04-20 11:58:43.996820', '4', 'parcell', 2, 'Modification de categorie.', 9, 1),
(110, '2016-04-20 15:02:56.670371', '5', 'pikine', 2, 'Modification de name.', 9, 1),
(111, '2016-04-20 15:03:07.056789', '4', 'Mermoz', 2, 'Modification de name.', 9, 1),
(112, '2016-05-03 10:57:33.732496', '10', 'chargement', 2, 'Modification de time_do.', 14, 1),
(113, '2016-05-03 11:10:39.532904', '10', 'chargement', 2, 'Modification de date_do.', 14, 1),
(114, '2016-05-03 11:13:42.994369', '9', 'chargement', 2, 'Modification de date_do et time_do.', 14, 1),
(115, '2016-05-03 11:13:57.711380', '8', 'achat', 2, 'Modification de date_do et time_do.', 14, 1),
(116, '2016-05-03 11:14:14.469981', '7', 'test', 2, 'Modification de date_do et time_do.', 14, 1),
(117, '2016-05-03 11:14:24.153072', '6', 'vente', 2, 'Modification de date_do et time_do.', 14, 1),
(118, '2016-05-03 11:25:09.137174', '1', 'TypeMission object', 1, 'Ajout.', 20, 1),
(119, '2016-05-03 11:25:18.407467', '2', 'TypeMission object', 1, 'Ajout.', 20, 1),
(120, '2016-05-03 11:25:29.923204', '3', 'TypeMission object', 1, 'Ajout.', 20, 1),
(121, '2016-05-03 11:25:43.759038', '4', 'TypeMission object', 1, 'Ajout.', 20, 1),
(122, '2016-05-03 11:39:06.452108', '10', 'chargement', 2, 'Modification de time_do.', 14, 1),
(123, '2016-05-03 13:16:32.262098', '2', 'test', 1, 'Ajout.', 13, 1),
(124, '2016-05-03 13:16:44.384546', '1', 'opopo', 2, 'Modification de lieux et typemission.', 13, 1);

-- --------------------------------------------------------

--
-- Structure de la table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Contenu de la table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(18, 'corsheaders', 'corsmodel'),
(11, 'projet', 'agent'),
(19, 'projet', 'categorie'),
(12, 'projet', 'client'),
(10, 'projet', 'commercial'),
(7, 'projet', 'entreprise'),
(14, 'projet', 'mission'),
(15, 'projet', 'profil'),
(13, 'projet', 'programme'),
(8, 'projet', 'type'),
(20, 'projet', 'typemission'),
(16, 'projet', 'utilisateur'),
(9, 'projet', 'zone'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Structure de la table `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=38 ;

--
-- Contenu de la table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2016-03-10 11:51:52.690777'),
(2, 'auth', '0001_initial', '2016-03-10 11:51:56.510000'),
(3, 'admin', '0001_initial', '2016-03-10 11:51:58.119508'),
(4, 'admin', '0002_logentry_remove_auto_add', '2016-03-10 11:51:58.166381'),
(5, 'contenttypes', '0002_remove_content_type_name', '2016-03-10 11:51:58.629623'),
(6, 'auth', '0002_alter_permission_name_max_length', '2016-03-10 11:51:59.090461'),
(7, 'auth', '0003_alter_user_email_max_length', '2016-03-10 11:51:59.496731'),
(8, 'auth', '0004_alter_user_username_opts', '2016-03-10 11:51:59.527998'),
(9, 'auth', '0005_alter_user_last_login_null', '2016-03-10 11:51:59.762370'),
(10, 'auth', '0006_require_contenttypes_0002', '2016-03-10 11:51:59.762370'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2016-03-10 11:51:59.793625'),
(12, 'sessions', '0001_initial', '2016-03-10 11:52:00.028022'),
(13, 'projet', '0001_initial', '2016-03-10 11:54:37.083353'),
(14, 'projet', '0002_auto_20160316_2303', '2016-03-16 23:03:38.675432'),
(15, 'projet', '0003_auto_20160321_1151', '2016-03-21 11:52:02.556300'),
(16, 'projet', '0004_auto_20160401_1137', '2016-04-01 11:37:18.468488'),
(17, 'projet', '0005_type_icone', '2016-04-03 23:36:18.577234'),
(18, 'projet', '0006_auto_20160407_1044', '2016-04-07 10:44:47.929227'),
(19, 'projet', '0007_auto_20160407_1823', '2016-04-07 18:23:28.715115'),
(20, 'projet', '0008_auto_20160411_1053', '2016-04-11 10:53:34.689858'),
(21, 'projet', '0009_zone_categorie', '2016-04-11 12:52:10.944007'),
(22, 'projet', '0010_auto_20160414_1058', '2016-04-14 10:58:29.273105'),
(23, 'projet', '0009_categorie', '2016-04-14 11:17:15.901834'),
(24, 'projet', '0010_zone_categorie', '2016-04-14 11:33:03.205280'),
(25, 'projet', '0011_auto_20160414_1136', '2016-04-14 11:36:10.041118'),
(26, 'projet', '0012_remove_zone_couleur', '2016-04-14 11:52:26.295907'),
(27, 'projet', '0013_auto_20160415_1709', '2016-04-15 17:09:57.000943'),
(28, 'projet', '0014_auto_20160418_1655', '2016-04-18 16:55:54.356913'),
(29, 'projet', '0015_auto_20160419_0912', '2016-04-19 09:12:51.921320'),
(30, 'projet', '0016_mission_date_exe', '2016-05-03 10:39:09.547582'),
(31, 'projet', '0017_auto_20160503_1053', '2016-05-03 10:53:30.077406'),
(32, 'projet', '0018_auto_20160503_1242', '2016-05-03 12:42:30.754858'),
(33, 'projet', '0019_auto_20160503_1314', '2016-05-03 13:14:11.424898'),
(34, 'projet', '0020_auto_20160503_1431', '2016-05-03 14:31:35.093967'),
(35, 'projet', '0021_auto_20160503_1546', '2016-05-03 15:46:40.759944'),
(36, 'projet', '0022_auto_20160510_1153', '2016-05-10 11:53:47.489182'),
(37, 'projet', '0023_auto_20160510_1159', '2016-05-10 11:59:52.257960');

-- --------------------------------------------------------

--
-- Structure de la table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0g5r4xm26mvaqjuggpst2k68gaig6m0a', 'YzM4ODdiN2FjMDA1OTAxODc5ZmI4Y2EyNzFlYmZmY2UzNzM2ZWQyNDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJmNjBmY2YxY2Q5OWQ0ODkyYTBiZWIyMjMwMjMzZmViNGRlODM0MDI3In0=', '2016-03-30 13:53:57.346510'),
('2b84w4qwasb9tty7sdxst08xrcaxn2x8', 'ZmE5MzRiYmJhY2YwMGQyZTViNDhiM2U3MDM0YmY2MDJlNTljNTg0ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImY2MGZjZjFjZDk5ZDQ4OTJhMGJlYjIyMzAyMzNmZWI0ZGU4MzQwMjciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-04-13 11:59:38.796922'),
('2fl8k1n7rthnjis29asu1yp8w3tlrjdv', 'YjQyYzUyZjY4Njg0YTczZDE0YzYzNzJhMDA3MmNmMjM4MjdmOGIyMjp7Il9hdXRoX3VzZXJfaGFzaCI6ImY2MGZjZjFjZDk5ZDQ4OTJhMGJlYjIyMzAyMzNmZWI0ZGU4MzQwMjciLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2016-05-04 09:44:51.753672'),
('4kxdnm9jk4o06fwldwvlhy3vcr7fsaby', 'ZmE5MzRiYmJhY2YwMGQyZTViNDhiM2U3MDM0YmY2MDJlNTljNTg0ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImY2MGZjZjFjZDk5ZDQ4OTJhMGJlYjIyMzAyMzNmZWI0ZGU4MzQwMjciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-04-04 10:35:07.045918'),
('6kelv7eb74qgnsx5n4d895k4gi9udh6e', 'NzRmNTIzNDk2MDdkMTU1MWY2YmViY2E3NzU2ZjMxYTFlNzFlNzJmZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjYwZmNmMWNkOTlkNDg5MmEwYmViMjIzMDIzM2ZlYjRkZTgzNDAyNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2016-03-28 11:26:19.186469'),
('7czox32nizqn8i3ghebqn28l9vd54j43', 'YzZlYjFjMTI5NDJjZTlmNTUxOWJkY2EzZjYxMTM1MTBiYTBjYjM0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmNjBmY2YxY2Q5OWQ0ODkyYTBiZWIyMjMwMjMzZmViNGRlODM0MDI3In0=', '2016-03-28 13:04:04.762854'),
('891x89qlz59hcdpqu4k3p9nwbtkh3zq2', 'MzhiY2IyYjNhMTc1MWQ0OGVjNjAzZmFlMzg4YjYxZWU4MDcwMjhmYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjYwZmNmMWNkOTlkNDg5MmEwYmViMjIzMDIzM2ZlYjRkZTgzNDAyNyIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-05-11 22:08:44.673407'),
('bkziypllsqzjsk3o1obdhxjih84vj1pk', 'YjQyYzUyZjY4Njg0YTczZDE0YzYzNzJhMDA3MmNmMjM4MjdmOGIyMjp7Il9hdXRoX3VzZXJfaGFzaCI6ImY2MGZjZjFjZDk5ZDQ4OTJhMGJlYjIyMzAyMzNmZWI0ZGU4MzQwMjciLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2016-04-22 11:45:54.986552'),
('btzs61sw4i5l7vsnh2zconwfm57koiap', 'YzM4ODdiN2FjMDA1OTAxODc5ZmI4Y2EyNzFlYmZmY2UzNzM2ZWQyNDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJmNjBmY2YxY2Q5OWQ0ODkyYTBiZWIyMjMwMjMzZmViNGRlODM0MDI3In0=', '2016-03-30 12:13:52.305338'),
('el891x947v973nvc8gzup1llxjnol6n7', 'YzM4ODdiN2FjMDA1OTAxODc5ZmI4Y2EyNzFlYmZmY2UzNzM2ZWQyNDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJmNjBmY2YxY2Q5OWQ0ODkyYTBiZWIyMjMwMjMzZmViNGRlODM0MDI3In0=', '2016-03-24 11:56:07.475121'),
('gnmyh64nzt0q7a4o3dwcvnu3kesjlmx5', 'ZmE5MzRiYmJhY2YwMGQyZTViNDhiM2U3MDM0YmY2MDJlNTljNTg0ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImY2MGZjZjFjZDk5ZDQ4OTJhMGJlYjIyMzAyMzNmZWI0ZGU4MzQwMjciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-03-30 12:05:45.006928'),
('grv9s31w3ni5jcr1yptmdiviuu47fry5', 'MzhiY2IyYjNhMTc1MWQ0OGVjNjAzZmFlMzg4YjYxZWU4MDcwMjhmYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjYwZmNmMWNkOTlkNDg5MmEwYmViMjIzMDIzM2ZlYjRkZTgzNDAyNyIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-04-13 18:39:39.720039'),
('i7iwkrw2brnedx18c6mdx7ger9d4c4sq', 'YzZlYjFjMTI5NDJjZTlmNTUxOWJkY2EzZjYxMTM1MTBiYTBjYjM0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmNjBmY2YxY2Q5OWQ0ODkyYTBiZWIyMjMwMjMzZmViNGRlODM0MDI3In0=', '2016-05-17 10:57:04.611111'),
('je0h38krtkgi4d5rtii3tyb5eh10iuvv', 'YzZlYjFjMTI5NDJjZTlmNTUxOWJkY2EzZjYxMTM1MTBiYTBjYjM0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmNjBmY2YxY2Q5OWQ0ODkyYTBiZWIyMjMwMjMzZmViNGRlODM0MDI3In0=', '2016-05-04 11:58:27.126446'),
('n6bw6evdw1vsaoipqwfvtb7lrulyj5ay', 'YzM4ODdiN2FjMDA1OTAxODc5ZmI4Y2EyNzFlYmZmY2UzNzM2ZWQyNDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJmNjBmY2YxY2Q5OWQ0ODkyYTBiZWIyMjMwMjMzZmViNGRlODM0MDI3In0=', '2016-05-16 16:42:44.250703'),
('nfjmronrejw9k3g0gm01r1rlwgj6fmcn', 'YjQyYzUyZjY4Njg0YTczZDE0YzYzNzJhMDA3MmNmMjM4MjdmOGIyMjp7Il9hdXRoX3VzZXJfaGFzaCI6ImY2MGZjZjFjZDk5ZDQ4OTJhMGJlYjIyMzAyMzNmZWI0ZGU4MzQwMjciLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2016-04-29 16:47:54.903724'),
('oa9g2ugngh9dqzjz2ygcfivg7gwpten6', 'MzhiY2IyYjNhMTc1MWQ0OGVjNjAzZmFlMzg4YjYxZWU4MDcwMjhmYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjYwZmNmMWNkOTlkNDg5MmEwYmViMjIzMDIzM2ZlYjRkZTgzNDAyNyIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-04-19 09:25:13.120399'),
('tgx2755tcgse4q5cppga79egsx225sgv', 'ZmE5MzRiYmJhY2YwMGQyZTViNDhiM2U3MDM0YmY2MDJlNTljNTg0ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImY2MGZjZjFjZDk5ZDQ4OTJhMGJlYjIyMzAyMzNmZWI0ZGU4MzQwMjciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-05-17 09:43:34.635571'),
('v5w2tfz03g3g3uvwj8cbeeslkdivtjml', 'YzM4ODdiN2FjMDA1OTAxODc5ZmI4Y2EyNzFlYmZmY2UzNzM2ZWQyNDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJmNjBmY2YxY2Q5OWQ0ODkyYTBiZWIyMjMwMjMzZmViNGRlODM0MDI3In0=', '2016-04-17 23:47:05.469135'),
('vx8qzdj5ltmylmtkahwdz96qbck7hwm7', 'NzRmNTIzNDk2MDdkMTU1MWY2YmViY2E3NzU2ZjMxYTFlNzFlNzJmZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjYwZmNmMWNkOTlkNDg5MmEwYmViMjIzMDIzM2ZlYjRkZTgzNDAyNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2016-04-04 22:14:35.609102'),
('whonfpp3n5x5d803jrbw747wv1h9ypz3', 'ZmE5MzRiYmJhY2YwMGQyZTViNDhiM2U3MDM0YmY2MDJlNTljNTg0ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImY2MGZjZjFjZDk5ZDQ4OTJhMGJlYjIyMzAyMzNmZWI0ZGU4MzQwMjciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-03-30 23:05:20.434047'),
('xoy65hzl9zowpfoleb5af36sz4a305xt', 'YjQyYzUyZjY4Njg0YTczZDE0YzYzNzJhMDA3MmNmMjM4MjdmOGIyMjp7Il9hdXRoX3VzZXJfaGFzaCI6ImY2MGZjZjFjZDk5ZDQ4OTJhMGJlYjIyMzAyMzNmZWI0ZGU4MzQwMjciLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2016-05-03 09:01:58.807861'),
('y9q0xumti8t8nuwy44e1xp394imxee66', 'NzRmNTIzNDk2MDdkMTU1MWY2YmViY2E3NzU2ZjMxYTFlNzFlNzJmZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjYwZmNmMWNkOTlkNDg5MmEwYmViMjIzMDIzM2ZlYjRkZTgzNDAyNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2016-05-04 15:02:46.224747');

-- --------------------------------------------------------

--
-- Structure de la table `projet_agent`
--

CREATE TABLE IF NOT EXISTS `projet_agent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `adr` varchar(50) NOT NULL,
  `tel` varchar(50) NOT NULL,
  `login` varchar(50) NOT NULL,
  `pwd` varchar(50) NOT NULL,
  `entreprise_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `projet_agent_0eff2676` (`entreprise_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `projet_agent`
--

INSERT INTO `projet_agent` (`id`, `name`, `email`, `adr`, `tel`, `login`, `pwd`, `entreprise_id`) VALUES
(1, 'djibril diop', 'djo@dj.com', 'pikine', '77 403 43 14', 'djoo', 'djii', 1);

-- --------------------------------------------------------

--
-- Structure de la table `projet_categorie`
--

CREATE TABLE IF NOT EXISTS `projet_categorie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `couleur` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `projet_categorie`
--

INSERT INTO `projet_categorie` (`id`, `name`, `couleur`) VALUES
(1, 'quartier', 'green'),
(2, 'ville', 'yellow'),
(3, 'region', 'red');

-- --------------------------------------------------------

--
-- Structure de la table `projet_client`
--

CREATE TABLE IF NOT EXISTS `projet_client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cl_name` varchar(100) NOT NULL,
  `cl_email` varchar(200) NOT NULL,
  `cl_lat` varchar(200) NOT NULL,
  `cl_long` varchar(200) NOT NULL,
  `cl_type_id` int(11) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `projet_client_c5d71aad` (`cl_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Contenu de la table `projet_client`
--

INSERT INTO `projet_client` (`id`, `cl_name`, `cl_email`, `cl_lat`, `cl_long`, `cl_type_id`, `description`) VALUES
(2, 'emc2 bis', 'lui@gmail.fr', '14.818208277205029', '-17.243574345898423', 1, 'entreprise informatique'),
(3, 'uvs', 'cices-group@emc.com', '14.748901154379624', '-17.412805018066365', 2, 'université virtuelle du Sénégal'),
(12, 'cices bis', 'dior@gmail.fr', '14.73322406623168', '-17.431001124023396', 3, 'cices foire'),
(18, 'yoff ndar', 'yoyo@yi.tr', '14.695527000649049', '-17.462425231933594', 1, 'yoff boulangerie'),
(20, 'yoff shop', 'yoffshop@gmail.com', '14.809072814625306', '-17.2650146484375', 3, 'shop detaill'),
(22, 'rufisque', 'ahmadou19@outlook.fr', '14.718108077356955', '-17.254371643066406', 1, 'zone de captage'),
(23, 'rufisque', 'ahmadou19@gmail.com', '14.725081172910235', '-17.268447875976562', 2, 'zone de captage');

-- --------------------------------------------------------

--
-- Structure de la table `projet_commercial`
--

CREATE TABLE IF NOT EXISTS `projet_commercial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `adr` varchar(50) NOT NULL,
  `tel` varchar(50) NOT NULL,
  `email` varchar(200) NOT NULL,
  `entreprise_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `projet_commercial_0eff2676` (`entreprise_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `projet_commercial`
--

INSERT INTO `projet_commercial` (`id`, `name`, `adr`, `tel`, `email`, `entreprise_id`) VALUES
(1, 'sydi', 'je sais po', '77', 'ff@f.fr', 1),
(2, 'diof sarr', 'je sais po', '77', 'ff@f.fr', 1);

-- --------------------------------------------------------

--
-- Structure de la table `projet_entreprise`
--

CREATE TABLE IF NOT EXISTS `projet_entreprise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entr_name` varchar(200) NOT NULL,
  `entr_lat` varchar(200) NOT NULL,
  `entr_long` varchar(200) NOT NULL,
  `ag_email` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `projet_entreprise`
--

INSERT INTO `projet_entreprise` (`id`, `entr_name`, `entr_lat`, `entr_long`, `ag_email`) VALUES
(1, 'Emc2', '14.7343707', '17.4729679,16z', 'emc2-group@emc2group.com');

-- --------------------------------------------------------

--
-- Structure de la table `projet_mission`
--

CREATE TABLE IF NOT EXISTS `projet_mission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(200) NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `modified_on` datetime(6) NOT NULL,
  `date_do` date NOT NULL,
  `agent_id` int(11) NOT NULL,
  `com_id` int(11) NOT NULL,
  `lieu_id` int(11) NOT NULL,
  `etat` tinyint(1) NOT NULL,
  `observation` longtext NOT NULL,
  `programme_id` int(11),
  `TypeMission_id` int(11),
  `date_exe` date DEFAULT NULL,
  `time_do` time(6),
  `time_exe` time(6),
  PRIMARY KEY (`id`),
  KEY `projet_mission_agent_id_946d6f88_fk_projet_agent_id` (`agent_id`),
  KEY `projet_mission_com_id_a6628ee5_fk_projet_commercial_id` (`com_id`),
  KEY `projet_mission_lieu_id_04fa7d57_fk_projet_client_id` (`lieu_id`),
  KEY `projet_mission_82558bcc` (`programme_id`),
  KEY `projet_mission_a09cf29f` (`TypeMission_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Contenu de la table `projet_mission`
--

INSERT INTO `projet_mission` (`id`, `libelle`, `created_on`, `modified_on`, `date_do`, `agent_id`, `com_id`, `lieu_id`, `etat`, `observation`, `programme_id`, `TypeMission_id`, `date_exe`, `time_do`, `time_exe`) VALUES
(1, 'livraison banane', '2016-03-10 11:59:08.000000', '2016-03-10 11:59:09.000000', '2016-03-10', 1, 1, 3, 0, 'fjgidfgoidfg', NULL, NULL, NULL, NULL, NULL),
(2, 'livraison pizza', '2016-03-14 11:27:02.000000', '2016-03-14 11:27:04.000000', '2016-03-14', 1, 1, 2, 0, 'etrter', NULL, NULL, NULL, NULL, NULL),
(3, 'livraison djeune', '2016-03-14 13:05:21.000000', '2016-03-14 13:05:23.000000', '2016-03-14', 1, 1, 2, 0, 'yrtytrhghg', NULL, NULL, NULL, NULL, NULL),
(5, 'chargement', '2016-03-14 13:14:37.000000', '2016-03-14 13:14:38.000000', '2016-03-14', 1, 1, 2, 0, 'ffff', NULL, NULL, NULL, NULL, NULL),
(6, 'vente', '2016-03-14 13:15:10.000000', '2016-03-14 13:15:12.000000', '2016-05-03', 1, 1, 3, 0, 'ok', NULL, NULL, NULL, '11:14:22.000000', NULL),
(7, 'test', '2016-03-14 13:15:57.000000', '2016-03-14 13:15:58.000000', '2016-05-03', 1, 1, 2, 0, 'ok', NULL, NULL, NULL, '11:18:05.000000', NULL),
(8, 'achat', '2016-03-31 16:21:16.000000', '2016-03-31 16:21:18.000000', '2016-05-03', 1, 2, 2, 0, 'a', NULL, NULL, NULL, '11:13:59.000000', NULL),
(9, 'chargement', '2016-03-31 16:22:48.000000', '2016-03-31 16:22:49.000000', '2016-05-03', 1, 2, 20, 0, 'a', NULL, NULL, NULL, '11:13:40.000000', NULL),
(10, 'chargement', '2016-03-31 16:23:12.000000', '2016-03-31 16:23:15.000000', '2016-05-03', 1, 1, 23, 0, 'a', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `projet_profil`
--

CREATE TABLE IF NOT EXISTS `projet_profil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profil` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `projet_profil`
--

INSERT INTO `projet_profil` (`id`, `profil`) VALUES
(1, 'agent'),
(2, 'commercial');

-- --------------------------------------------------------

--
-- Structure de la table `projet_programme`
--

CREATE TABLE IF NOT EXISTS `projet_programme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_on` datetime(6) NOT NULL,
  `modified_on` datetime(6) NOT NULL,
  `timing` longtext NOT NULL,
  `libelle` varchar(200) NOT NULL,
  `agent_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `projet_programme_agent_id_a4bb8954_fk_projet_agent_id` (`agent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Contenu de la table `projet_programme`
--

INSERT INTO `projet_programme` (`id`, `created_on`, `modified_on`, `timing`, `libelle`, `agent_id`) VALUES
(5, '2016-05-03 15:59:03.148000', '2016-05-03 15:59:03.148000', '[{''mois'': ''Janvier,Fevrier'', ''jour'': ''1,2''}]', 'livraison banane', 1),
(6, '2016-05-03 15:59:56.278000', '2016-05-03 15:59:56.278000', '[{''mois'': ''Janvier,Fevrier'', ''jour'': ''1,2''}]', 'livraison onduleur', 1),
(7, '2016-05-03 16:25:33.343000', '2016-05-03 16:25:33.343000', '[{''mois'': ''Janvier,Fevrier,Mars'', ''jour'': ''1''}, {''mois'': ''Janvier'', ''jour'': ''1,2,3''}]', 'livraison pizza', 1),
(8, '2016-05-10 12:25:10.827000', '2016-05-10 12:25:10.827000', '[{''jours'': ''2,3,4'', ''mois'': ''Tous''}]', 'livraison imprimante', 1),
(10, '2016-05-10 13:00:09.500000', '2016-05-10 13:00:09.500000', '[{''jours'': ''1,2'', ''mois'': ''Tous''}]', 'livraison pizza,livraison banane', 1);

-- --------------------------------------------------------

--
-- Structure de la table `projet_programme_com`
--

CREATE TABLE IF NOT EXISTS `projet_programme_com` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `programme_id` int(11) NOT NULL,
  `commercial_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `projet_programme_com_programme_id_f9858c42_uniq` (`programme_id`,`commercial_id`),
  KEY `projet_programme__commercial_id_583d12a0_fk_projet_commercial_id` (`commercial_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Contenu de la table `projet_programme_com`
--

INSERT INTO `projet_programme_com` (`id`, `programme_id`, `commercial_id`) VALUES
(1, 5, 1),
(2, 6, 1),
(3, 6, 2),
(4, 7, 1),
(5, 7, 2),
(10, 8, 2),
(8, 10, 1);

-- --------------------------------------------------------

--
-- Structure de la table `projet_programme_lieux`
--

CREATE TABLE IF NOT EXISTS `projet_programme_lieux` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `programme_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `projet_programme_lieux_programme_id_5e275d23_uniq` (`programme_id`,`client_id`),
  KEY `projet_programme_lieux_client_id_0ef1afdb_fk_projet_client_id` (`client_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Contenu de la table `projet_programme_lieux`
--

INSERT INTO `projet_programme_lieux` (`id`, `programme_id`, `client_id`) VALUES
(26, 5, 12),
(25, 5, 18),
(8, 6, 22),
(17, 7, 2),
(18, 7, 3),
(20, 8, 20),
(15, 10, 22),
(16, 10, 23);

-- --------------------------------------------------------

--
-- Structure de la table `projet_programme_typemission`
--

CREATE TABLE IF NOT EXISTS `projet_programme_typemission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `programme_id` int(11) NOT NULL,
  `typemission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `projet_programme_typemission_programme_id_55b71b48_uniq` (`programme_id`,`typemission_id`),
  KEY `projet_programm_typemission_id_39b60bd5_fk_projet_typemission_id` (`typemission_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Contenu de la table `projet_programme_typemission`
--

INSERT INTO `projet_programme_typemission` (`id`, `programme_id`, `typemission_id`) VALUES
(5, 5, 1),
(6, 5, 2),
(18, 6, 4),
(16, 7, 4),
(17, 8, 3),
(14, 10, 1),
(15, 10, 2);

-- --------------------------------------------------------

--
-- Structure de la table `projet_type`
--

CREATE TABLE IF NOT EXISTS `projet_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(50) NOT NULL,
  `icone` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `projet_type`
--

INSERT INTO `projet_type` (`id`, `type_name`, `icone`) VALUES
(1, 'entreprise', 'images/icones/blue_MarkerE.png'),
(2, 'pharmacie', 'images/icones/blue_MarkerP.png'),
(3, 'boutique', 'images/icones/brown_MarkerB.png');

-- --------------------------------------------------------

--
-- Structure de la table `projet_typemission`
--

CREATE TABLE IF NOT EXISTS `projet_typemission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `projet_typemission`
--

INSERT INTO `projet_typemission` (`id`, `name`) VALUES
(1, 'livraison pizza'),
(2, 'livraison banane'),
(3, 'livraison imprimante'),
(4, 'changer onduleur');

-- --------------------------------------------------------

--
-- Structure de la table `projet_utilisateur`
--

CREATE TABLE IF NOT EXISTS `projet_utilisateur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `tel` varchar(50) NOT NULL,
  `login` varchar(50) NOT NULL,
  `pwd` varchar(50) NOT NULL,
  `profil_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `projet_utilisateur_profil_id_1bdf0ebb_fk_projet_profil_id` (`profil_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `projet_utilisateur`
--

INSERT INTO `projet_utilisateur` (`id`, `nom`, `tel`, `login`, `pwd`, `profil_id`) VALUES
(1, 'ahmadou lo', '77687', 'ahmad', '776872251', 2);

-- --------------------------------------------------------

--
-- Structure de la table `projet_zone`
--

CREATE TABLE IF NOT EXISTS `projet_zone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `paths` longtext NOT NULL,
  `categorie_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `projet_zone_0a1d6b76` (`categorie_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `projet_zone`
--

INSERT INTO `projet_zone` (`id`, `name`, `description`, `paths`, `categorie_id`) VALUES
(4, 'Mermoz', 'zone des pa', '[{''lat'': 14.745003073798612, ''lng'': -17.221755981445312}, {''lat'': 14.735706413429252, ''lng'': -17.28973388671875}, {''lat'': 14.697187453483892, ''lng'': -17.250595092773438}]', 3),
(5, 'pikine', 'zone des pa', '[{''lng'': -17.221755981445312, ''lat'': 14.8299826756915}, {''lng'': -17.28973388671875, ''lat'': 14.82068965336819}, {''lng'': -17.250595092773438, ''lat'': 14.782185743153992}]', 3),
(6, 'parcell', 'zone des pa', '[{''lng'': -17.490234375, ''lat'': 14.740354793222743}, {''lng'': -17.381057739257812, ''lat'': 14.768906948455562}, {''lng'': -17.464141845703125, ''lat'': 14.679918127300654}]', 2);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Contraintes pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Contraintes pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Contraintes pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Contraintes pour la table `projet_agent`
--
ALTER TABLE `projet_agent`
  ADD CONSTRAINT `projet_agent_entreprise_id_93332d4c_fk_projet_entreprise_id` FOREIGN KEY (`entreprise_id`) REFERENCES `projet_entreprise` (`id`);

--
-- Contraintes pour la table `projet_client`
--
ALTER TABLE `projet_client`
  ADD CONSTRAINT `projet_client_cl_type_id_8daf63c7_fk_projet_type_id` FOREIGN KEY (`cl_type_id`) REFERENCES `projet_type` (`id`);

--
-- Contraintes pour la table `projet_commercial`
--
ALTER TABLE `projet_commercial`
  ADD CONSTRAINT `projet_commercial_entreprise_id_804cf385_fk_projet_entreprise_id` FOREIGN KEY (`entreprise_id`) REFERENCES `projet_entreprise` (`id`);

--
-- Contraintes pour la table `projet_mission`
--
ALTER TABLE `projet_mission`
  ADD CONSTRAINT `projet_mission_agent_id_946d6f88_fk_projet_agent_id` FOREIGN KEY (`agent_id`) REFERENCES `projet_agent` (`id`),
  ADD CONSTRAINT `projet_mission_com_id_a6628ee5_fk_projet_commercial_id` FOREIGN KEY (`com_id`) REFERENCES `projet_commercial` (`id`),
  ADD CONSTRAINT `projet_mission_lieu_id_04fa7d57_fk_projet_client_id` FOREIGN KEY (`lieu_id`) REFERENCES `projet_client` (`id`),
  ADD CONSTRAINT `projet_mission_programme_id_e4b22839_fk_projet_programme_id` FOREIGN KEY (`programme_id`) REFERENCES `projet_programme` (`id`),
  ADD CONSTRAINT `projet_mission_TypeMission_id_0ae59704_fk_projet_typemission_id` FOREIGN KEY (`TypeMission_id`) REFERENCES `projet_typemission` (`id`);

--
-- Contraintes pour la table `projet_programme`
--
ALTER TABLE `projet_programme`
  ADD CONSTRAINT `projet_programme_agent_id_a4bb8954_fk_projet_agent_id` FOREIGN KEY (`agent_id`) REFERENCES `projet_agent` (`id`);

--
-- Contraintes pour la table `projet_programme_com`
--
ALTER TABLE `projet_programme_com`
  ADD CONSTRAINT `projet_programme_co_programme_id_79aa29de_fk_projet_programme_id` FOREIGN KEY (`programme_id`) REFERENCES `projet_programme` (`id`),
  ADD CONSTRAINT `projet_programme__commercial_id_583d12a0_fk_projet_commercial_id` FOREIGN KEY (`commercial_id`) REFERENCES `projet_commercial` (`id`);

--
-- Contraintes pour la table `projet_programme_lieux`
--
ALTER TABLE `projet_programme_lieux`
  ADD CONSTRAINT `projet_programme_lieux_client_id_0ef1afdb_fk_projet_client_id` FOREIGN KEY (`client_id`) REFERENCES `projet_client` (`id`),
  ADD CONSTRAINT `projet_programme_li_programme_id_034d0fe2_fk_projet_programme_id` FOREIGN KEY (`programme_id`) REFERENCES `projet_programme` (`id`);

--
-- Contraintes pour la table `projet_programme_typemission`
--
ALTER TABLE `projet_programme_typemission`
  ADD CONSTRAINT `projet_programme_ty_programme_id_a5990549_fk_projet_programme_id` FOREIGN KEY (`programme_id`) REFERENCES `projet_programme` (`id`),
  ADD CONSTRAINT `projet_programm_typemission_id_39b60bd5_fk_projet_typemission_id` FOREIGN KEY (`typemission_id`) REFERENCES `projet_typemission` (`id`);

--
-- Contraintes pour la table `projet_utilisateur`
--
ALTER TABLE `projet_utilisateur`
  ADD CONSTRAINT `projet_utilisateur_profil_id_1bdf0ebb_fk_projet_profil_id` FOREIGN KEY (`profil_id`) REFERENCES `projet_profil` (`id`);

--
-- Contraintes pour la table `projet_zone`
--
ALTER TABLE `projet_zone`
  ADD CONSTRAINT `projet_zone_categorie_id_e12f14b8_fk_projet_categorie_id` FOREIGN KEY (`categorie_id`) REFERENCES `projet_categorie` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

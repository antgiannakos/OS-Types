-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: fdb21.awardspace.net
-- Generation Time: Jul 05, 2018 at 03:43 AM
-- Server version: 5.7.20-log
-- PHP Version: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `2769021_joomlacomputing`
--

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_assets`
--

CREATE TABLE `uoj7s_assets` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Primary Key',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set parent.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `level` int(10) UNSIGNED NOT NULL COMMENT 'The cached level in the nested tree.',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The unique name for the asset.\n',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The descriptive title for the asset.',
  `rules` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded access control.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uoj7s_assets`
--

INSERT INTO `uoj7s_assets` (`id`, `parent_id`, `lft`, `rgt`, `level`, `name`, `title`, `rules`) VALUES
(1, 0, 0, 269, 0, 'root.1', 'Root Asset', '{"core.login.site":{"6":1,"2":1},"core.login.admin":{"6":1},"core.login.offline":{"6":1},"core.admin":{"8":1},"core.manage":{"7":1},"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(2, 1, 1, 2, 1, 'com_admin', 'com_admin', '{}'),
(3, 1, 3, 8, 1, 'com_banners', 'com_banners', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
(4, 1, 9, 10, 1, 'com_cache', 'com_cache', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(5, 1, 11, 12, 1, 'com_checkin', 'com_checkin', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(6, 1, 13, 14, 1, 'com_config', 'com_config', '{}'),
(7, 1, 15, 18, 1, 'com_contact', 'com_contact', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
(8, 1, 19, 112, 1, 'com_content', 'com_content', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.edit":{"4":1},"core.edit.state":{"5":1}}'),
(9, 1, 113, 114, 1, 'com_cpanel', 'com_cpanel', '{}'),
(10, 1, 115, 116, 1, 'com_installer', 'com_installer', '{"core.manage":{"7":0},"core.delete":{"7":0},"core.edit.state":{"7":0}}'),
(11, 1, 117, 120, 1, 'com_languages', 'com_languages', '{"core.admin":{"7":1}}'),
(12, 1, 121, 122, 1, 'com_login', 'com_login', '{}'),
(13, 1, 123, 124, 1, 'com_mailto', 'com_mailto', '{}'),
(14, 1, 125, 126, 1, 'com_massmail', 'com_massmail', '{}'),
(15, 1, 127, 128, 1, 'com_media', 'com_media', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":{"5":1}}'),
(16, 1, 129, 140, 1, 'com_menus', 'com_menus', '{"core.admin":{"7":1}}'),
(17, 1, 141, 142, 1, 'com_messages', 'com_messages', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(18, 1, 143, 234, 1, 'com_modules', 'com_modules', '{"core.admin":{"7":1}}'),
(19, 1, 235, 238, 1, 'com_newsfeeds', 'com_newsfeeds', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
(20, 1, 239, 240, 1, 'com_plugins', 'com_plugins', '{"core.admin":{"7":1}}'),
(21, 1, 241, 242, 1, 'com_redirect', 'com_redirect', '{"core.admin":{"7":1}}'),
(22, 1, 243, 244, 1, 'com_search', 'com_search', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
(23, 1, 245, 246, 1, 'com_templates', 'com_templates', '{"core.admin":{"7":1}}'),
(24, 1, 247, 250, 1, 'com_users', 'com_users', '{"core.admin":{"7":1}}'),
(26, 1, 251, 252, 1, 'com_wrapper', 'com_wrapper', '{}'),
(27, 8, 20, 25, 2, 'com_content.category.2', 'Uncategorised', '{}'),
(28, 3, 4, 5, 2, 'com_banners.category.3', 'Uncategorised', '{}'),
(29, 7, 16, 17, 2, 'com_contact.category.4', 'Uncategorised', '{}'),
(30, 19, 236, 237, 2, 'com_newsfeeds.category.5', 'Uncategorised', '{}'),
(32, 24, 248, 249, 2, 'com_users.category.7', 'Uncategorised', '{}'),
(33, 1, 253, 254, 1, 'com_finder', 'com_finder', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
(34, 1, 255, 256, 1, 'com_joomlaupdate', 'com_joomlaupdate', '{}'),
(35, 1, 257, 258, 1, 'com_tags', 'com_tags', '{}'),
(36, 1, 259, 260, 1, 'com_contenthistory', 'com_contenthistory', '{}'),
(37, 1, 261, 262, 1, 'com_ajax', 'com_ajax', '{}'),
(38, 1, 263, 264, 1, 'com_postinstall', 'com_postinstall', '{}'),
(39, 18, 144, 145, 2, 'com_modules.module.1', 'Main Menu', '{}'),
(40, 18, 146, 147, 2, 'com_modules.module.2', 'Login', '{}'),
(41, 18, 148, 149, 2, 'com_modules.module.3', 'Popular Articles', '{}'),
(42, 18, 150, 151, 2, 'com_modules.module.4', 'Recently Added Articles', '{}'),
(43, 18, 152, 153, 2, 'com_modules.module.8', 'Toolbar', '{}'),
(44, 18, 154, 155, 2, 'com_modules.module.9', 'Quick Icons', '{}'),
(45, 18, 156, 157, 2, 'com_modules.module.10', 'Logged-in Users', '{}'),
(46, 18, 158, 159, 2, 'com_modules.module.12', 'Admin Menu', '{}'),
(47, 18, 160, 161, 2, 'com_modules.module.13', 'Admin Submenu', '{}'),
(48, 18, 162, 163, 2, 'com_modules.module.14', 'User Status', '{}'),
(49, 18, 164, 165, 2, 'com_modules.module.15', 'Title', '{}'),
(50, 18, 166, 167, 2, 'com_modules.module.16', 'Login Form', '{}'),
(51, 18, 168, 169, 2, 'com_modules.module.17', 'Breadcrumbs', '{}'),
(52, 18, 170, 171, 2, 'com_modules.module.79', 'Multilanguage status', '{}'),
(53, 18, 172, 173, 2, 'com_modules.module.86', 'Joomla Version', '{}'),
(54, 16, 130, 131, 2, 'com_menus.menu.1', 'Main Menu', '{}'),
(55, 18, 174, 175, 2, 'com_modules.module.87', 'Sample Data', '{}'),
(56, 18, 176, 177, 2, 'com_modules.module.88', 'OS for Computer', '{}'),
(57, 18, 178, 179, 2, 'com_modules.module.89', 'Login Form', '{}'),
(58, 8, 26, 43, 2, 'com_content.category.8', 'OS for Computer', '{}'),
(59, 58, 27, 28, 3, 'com_content.article.1', 'Linux', '{}'),
(60, 58, 29, 30, 3, 'com_content.article.2', 'Windows', '{}'),
(61, 58, 31, 32, 3, 'com_content.article.3', 'Windows XP', '{}'),
(62, 1, 265, 266, 1, '#__ucm_content.1', '#__ucm_content.1', '{}'),
(63, 58, 33, 34, 3, 'com_content.article.4', 'Windows ', '{}'),
(64, 58, 35, 36, 3, 'com_content.article.5', 'Linux', '{}'),
(65, 58, 37, 38, 3, 'com_content.article.6', 'MacOS', '{}'),
(66, 1, 267, 268, 1, 'com_jce', 'COM_JCE', '{}'),
(67, 18, 180, 181, 2, 'com_modules.module.90', 'OS for Mobile', '{}'),
(68, 71, 49, 50, 3, 'com_content.article.7', 'Android', '{}'),
(69, 71, 47, 48, 3, 'com_content.article.8', 'Windows', '{}'),
(70, 71, 45, 46, 3, 'com_content.article.9', 'iOS', '{}'),
(71, 8, 44, 51, 2, 'com_content.category.9', 'OS for Mobile', '{}'),
(72, 18, 182, 183, 2, 'com_modules.module.91', 'Latest Articles', '{}'),
(73, 18, 184, 185, 2, 'com_modules.module.92', 'Most Read Articles', '{}'),
(74, 18, 186, 187, 2, 'com_modules.module.93', 'Articles - Categories', '{}'),
(75, 18, 188, 189, 2, 'com_modules.module.94', 'Footer', '{}'),
(76, 27, 21, 22, 3, 'com_content.article.10', 'Operating System (OS)', '{}'),
(77, 3, 6, 7, 2, 'com_banners.category.10', 'Computing', '{}'),
(78, 18, 190, 191, 2, 'com_modules.module.95', 'Computing', '{}'),
(79, 18, 192, 193, 2, 'com_modules.module.96', 'Footer', '{}'),
(80, 18, 194, 195, 2, 'com_modules.module.97', 'Footer', '{}'),
(81, 18, 196, 197, 2, 'com_modules.module.98', 'Home2', '{}'),
(82, 83, 53, 54, 3, 'com_content.article.11', 'Home', '{}'),
(83, 8, 52, 59, 2, 'com_content.category.11', 'Home', '{}'),
(84, 83, 55, 58, 3, 'com_content.category.12', 'PhotoPosition', '{}'),
(85, 84, 56, 57, 4, 'com_content.article.12', 'Photo for Windows', '{}'),
(86, 18, 198, 199, 2, 'com_modules.module.99', 'Photo Position', '{}'),
(88, 18, 200, 201, 2, 'com_modules.module.100', 'PhotoOS', '{}'),
(89, 18, 202, 203, 2, 'com_modules.module.101', 'PhotoOS', '{}'),
(90, 18, 204, 205, 2, 'com_modules.module.102', 'Search', '{}'),
(91, 11, 118, 119, 2, 'com_languages.language.2', 'Greek', '{}'),
(92, 27, 23, 24, 3, 'com_content.article.13', 'Home', '{}'),
(93, 16, 132, 133, 2, 'com_menus.menu.3', 'OS for Computer', '{}'),
(94, 18, 206, 207, 2, 'com_modules.module.103', 'ComputerOS', '{}'),
(95, 16, 134, 135, 2, 'com_menus.menu.4', 'OS for Mobile', '{}'),
(96, 18, 208, 209, 2, 'com_modules.module.104', 'MobileOS', '{}'),
(97, 8, 60, 67, 2, 'com_content.category.13', 'Versions for Linux', '{}'),
(98, 97, 61, 62, 3, 'com_content.article.14', 'Ubuntu Version', '{}'),
(99, 97, 63, 64, 3, 'com_content.article.15', 'Fedora Version', '{}'),
(100, 97, 65, 66, 3, 'com_content.article.16', 'Arch Version', '{}'),
(101, 16, 136, 137, 2, 'com_menus.menu.5', 'Versions for Computer', '{}'),
(102, 18, 210, 211, 2, 'com_modules.module.105', 'Versions', '{}'),
(103, 8, 68, 75, 2, 'com_content.category.14', 'Version for Windows', '{}'),
(104, 103, 69, 70, 3, 'com_content.article.17', 'Windows 10 Version', '{}'),
(105, 103, 71, 72, 3, 'com_content.article.18', 'Windows 7', '{}'),
(106, 103, 73, 74, 3, 'com_content.article.19', 'Windows XP Version', '{}'),
(107, 8, 76, 83, 2, 'com_content.category.15', 'Version for MacOS', '{}'),
(108, 107, 77, 78, 3, 'com_content.article.20', 'Version 10.11 MacOS', '{}'),
(109, 107, 79, 80, 3, 'com_content.article.21', 'Version 10.12 MacOS', '{}'),
(110, 107, 81, 82, 3, 'com_content.article.22', 'Version 10.13 MacOS', '{}'),
(111, 8, 84, 91, 2, 'com_content.category.16', 'Version for Android', '{}'),
(112, 111, 85, 86, 3, 'com_content.article.23', 'Android 9.0 P(API 28)', '{}'),
(113, 111, 87, 88, 3, 'com_content.article.24', 'Android 8.1 Oreo(API 27)', '{}'),
(114, 111, 89, 90, 3, 'com_content.article.25', 'Android 8.0 Oreo(API 26)', '{}'),
(115, 16, 138, 139, 2, 'com_menus.menu.6', 'Versions for Mobile', '{}'),
(116, 18, 212, 213, 2, 'com_modules.module.106', 'Versions', '{}'),
(117, 8, 92, 99, 2, 'com_content.category.17', 'Versions for iOS', '{}'),
(118, 117, 93, 94, 3, 'com_content.article.26', 'iOS 11 Version', '{}'),
(119, 117, 95, 96, 3, 'com_content.article.27', 'iOS 10 Version', '{}'),
(120, 117, 97, 98, 3, 'com_content.article.28', 'iOS 9 Version', '{}'),
(121, 18, 214, 215, 2, 'com_modules.module.107', 'menu', '{}'),
(122, 18, 216, 217, 2, 'com_modules.module.108', 'Language', '{}'),
(123, 8, 100, 111, 2, 'com_content.category.18', 'PhotoOS', '{}'),
(124, 123, 101, 102, 3, 'com_content.article.29', 'Windows Photo', '{}'),
(125, 123, 103, 104, 3, 'com_content.article.30', 'Linux Photo', '{}'),
(126, 123, 105, 106, 3, 'com_content.article.31', 'MacOS Photo', '{}'),
(127, 123, 107, 108, 3, 'com_content.article.32', 'Android Photo', '{}'),
(128, 123, 109, 110, 3, 'com_content.article.33', 'iOS Photo', '{}'),
(129, 18, 218, 219, 2, 'com_modules.module.109', 'Linux logo', '{}'),
(130, 18, 220, 221, 2, 'com_modules.module.110', 'Windows Logo', '{}'),
(131, 18, 222, 223, 2, 'com_modules.module.111', 'MacOS Logo', '{}'),
(132, 18, 224, 225, 2, 'com_modules.module.112', 'Android Logo', '{}'),
(133, 18, 226, 227, 2, 'com_modules.module.113', 'iOS Logo', '{}'),
(134, 18, 228, 229, 2, 'com_modules.module.114', 'Just a line', '{}'),
(135, 18, 230, 231, 2, 'com_modules.module.115', 'FunctionOS', '{}'),
(136, 18, 232, 233, 2, 'com_modules.module.116', 'Communication', '{}'),
(137, 58, 39, 40, 3, 'com_content.article.34', 'MacOS', '{}'),
(138, 58, 41, 42, 3, 'com_content.article.35', 'TEST', '{}');

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_associations`
--

CREATE TABLE `uoj7s_associations` (
  `id` int(11) NOT NULL COMMENT 'A reference to the associated item.',
  `context` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The context of the associated item.',
  `key` char(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The key for the association computed from an md5 on associated ids.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_banners`
--

CREATE TABLE `uoj7s_banners` (
  `id` int(11) NOT NULL,
  `cid` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT '0',
  `impmade` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `clickurl` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `custombannercode` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sticky` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `own_prefix` tinyint(1) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reset` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `version` int(10) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uoj7s_banners`
--

INSERT INTO `uoj7s_banners` (`id`, `cid`, `type`, `name`, `alias`, `imptotal`, `impmade`, `clicks`, `clickurl`, `state`, `catid`, `description`, `custombannercode`, `sticky`, `ordering`, `metakey`, `params`, `own_prefix`, `metakey_prefix`, `purchase_type`, `track_clicks`, `track_impressions`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `reset`, `created`, `language`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `version`) VALUES
(1, 0, 0, 'Computing', 'computing', 0, 1255, 0, '', 1, 10, '', '', 1, 1, '', '{"imageurl":"images\\/banner_\\/OperatingSystems.jpg","width":"","height":"","alt":"Banner"}', 0, '', -1, 1, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2018-08-01 00:00:00', '2018-07-01 19:11:32', '*', 291, '', '2018-07-01 23:59:34', 291, 7);

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_banner_clients`
--

CREATE TABLE `uoj7s_banner_clients` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extrainfo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `own_prefix` tinyint(4) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_banner_tracks`
--

CREATE TABLE `uoj7s_banner_tracks` (
  `track_date` datetime NOT NULL,
  `track_type` int(10) UNSIGNED NOT NULL,
  `banner_id` int(10) UNSIGNED NOT NULL,
  `count` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uoj7s_banner_tracks`
--

INSERT INTO `uoj7s_banner_tracks` (`track_date`, `track_type`, `banner_id`, `count`) VALUES
('2018-07-01 19:00:00', 1, 1, 40),
('2018-07-01 20:00:00', 1, 1, 57),
('2018-07-01 21:00:00', 1, 1, 3),
('2018-07-01 22:00:00', 1, 1, 6),
('2018-07-01 23:00:00', 1, 1, 34),
('2018-07-02 00:00:00', 1, 1, 18),
('2018-07-02 01:00:00', 1, 1, 34),
('2018-07-02 02:00:00', 1, 1, 7),
('2018-07-02 10:00:00', 1, 1, 16),
('2018-07-02 11:00:00', 1, 1, 21),
('2018-07-02 12:00:00', 1, 1, 1),
('2018-07-02 13:00:00', 1, 1, 48),
('2018-07-02 14:00:00', 1, 1, 136),
('2018-07-02 15:00:00', 1, 1, 65),
('2018-07-02 16:00:00', 1, 1, 105),
('2018-07-02 23:00:00', 1, 1, 8),
('2018-07-03 00:00:00', 1, 1, 97),
('2018-07-03 02:00:00', 1, 1, 6),
('2018-07-03 03:00:00', 1, 1, 1),
('2018-07-03 22:00:00', 1, 1, 8),
('2018-07-04 00:00:00', 1, 1, 1),
('2018-07-04 02:00:00', 1, 1, 1),
('2018-07-04 14:00:00', 1, 1, 50),
('2018-07-04 15:00:00', 1, 1, 71),
('2018-07-04 16:00:00', 1, 1, 27),
('2018-07-04 22:00:00', 1, 1, 20),
('2018-07-04 23:00:00', 1, 1, 46),
('2018-07-05 00:00:00', 1, 1, 49),
('2018-07-05 01:00:00', 1, 1, 149),
('2018-07-05 02:00:00', 1, 1, 125),
('2018-07-05 03:00:00', 1, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_categories`
--

CREATE TABLE `uoj7s_categories` (
  `id` int(11) NOT NULL,
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `path` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extension` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `version` int(10) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uoj7s_categories`
--

INSERT INTO `uoj7s_categories` (`id`, `asset_id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `extension`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `modified_user_id`, `modified_time`, `hits`, `language`, `version`) VALUES
(1, 0, 0, 0, 33, 0, '', 'system', 'ROOT', 'root', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{}', '', '', '{}', 291, '2018-06-29 21:04:19', 0, '0000-00-00 00:00:00', 0, '*', 1),
(2, 27, 1, 1, 2, 1, 'uncategorised', 'com_content', 'Uncategorised', 'uncategorised', '', '', 1, 291, '2018-07-04 22:36:53', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 291, '2018-06-29 21:04:19', 291, '2018-07-04 15:25:51', 0, '*', 1),
(3, 28, 1, 3, 4, 1, 'uncategorised', 'com_banners', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 291, '2018-06-29 21:04:19', 0, '0000-00-00 00:00:00', 0, '*', 1),
(4, 29, 1, 5, 6, 1, 'uncategorised', 'com_contact', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 291, '2018-06-29 21:04:19', 0, '0000-00-00 00:00:00', 0, '*', 1),
(5, 30, 1, 7, 8, 1, 'uncategorised', 'com_newsfeeds', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 291, '2018-06-29 21:04:19', 0, '0000-00-00 00:00:00', 0, '*', 1),
(7, 32, 1, 9, 10, 1, 'uncategorised', 'com_users', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 291, '2018-06-29 21:04:19', 0, '0000-00-00 00:00:00', 0, '*', 1),
(8, 58, 1, 11, 12, 1, 'operating-systems', 'com_content', 'OS for Computer', 'operating-systems', '', '<p>operating system operating system operating system operating system operating system operating system operating system operating system operating system operating system operating system operating system operating system operating system operating system operating system operating system operating system operating system operating system operating system operating system operating system operating system operating system operating system operating system operating system operating system operating system operating system operating system operating system operating system operating system operating </p>', 1, 291, '2018-07-05 01:04:45', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 291, '2018-06-30 17:18:24', 291, '2018-06-30 19:10:58', 0, '*', 1),
(9, 71, 1, 13, 14, 1, 'os-for-mobile', 'com_content', 'OS for Mobile', 'os-for-mobile', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 291, '2018-06-30 18:46:09', 0, '2018-06-30 18:46:09', 0, '*', 1),
(10, 77, 1, 15, 16, 1, 'computing', 'com_banners', 'Computing', 'computing', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 291, '2018-07-01 19:07:58', 291, '2018-07-01 23:58:20', 0, '*', 1),
(11, 83, 1, 17, 20, 1, 'home', 'com_content', 'Home', 'home', '', '', 1, 291, '2018-07-04 22:36:41', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 291, '2018-07-01 19:49:29', 291, '2018-07-01 19:49:37', 0, '*', 1),
(12, 84, 11, 18, 19, 2, 'home/photoposition', 'com_content', 'PhotoPosition', 'photoposition', '', '<p>....</p>', -2, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 291, '2018-07-01 23:07:27', 291, '2018-07-02 01:04:22', 0, '*', 1),
(13, 97, 1, 21, 22, 1, 'version', 'com_content', 'Versions for Linux', 'version', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 291, '2018-07-02 13:06:01', 291, '2018-07-02 13:08:27', 0, '*', 1),
(14, 103, 1, 23, 24, 1, 'version-for-windows', 'com_content', 'Version for Windows', 'version-for-windows', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 291, '2018-07-02 13:19:20', 0, '2018-07-02 13:19:20', 0, '*', 1),
(15, 107, 1, 25, 26, 1, 'version-for-macos', 'com_content', 'Version for MacOS', 'version-for-macos', '', '', 1, 291, '2018-07-05 02:11:59', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 291, '2018-07-02 13:25:46', 0, '2018-07-02 13:25:46', 0, '*', 1),
(16, 111, 1, 27, 28, 1, 'version-for-android', 'com_content', 'Version for Android', 'version-for-android', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 291, '2018-07-02 13:39:13', 0, '2018-07-02 13:39:13', 0, '*', 1),
(17, 117, 1, 29, 30, 1, 'versions-for-ios', 'com_content', 'Versions for iOS', 'versions-for-ios', '', '', 1, 291, '2018-07-05 02:03:45', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 291, '2018-07-02 13:47:58', 0, '2018-07-02 13:47:58', 0, '*', 1),
(18, 123, 1, 31, 32, 1, 'photoos', 'com_content', 'PhotoOS', 'photoos', '', '', -2, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 291, '2018-07-02 15:09:59', 0, '2018-07-02 15:09:59', 0, '*', 1);

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_contact_details`
--

CREATE TABLE `uoj7s_contact_details` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `con_position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `suburb` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `misc` mediumtext COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_con` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `access` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `webpage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortname1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortname2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortname3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `language` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Set if contact is featured.',
  `xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `hits` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uoj7s_contact_details`
--

INSERT INTO `uoj7s_contact_details` (`id`, `name`, `alias`, `con_position`, `address`, `suburb`, `state`, `country`, `postcode`, `telephone`, `fax`, `misc`, `image`, `email_to`, `default_con`, `published`, `checked_out`, `checked_out_time`, `ordering`, `params`, `user_id`, `catid`, `access`, `mobile`, `webpage`, `sortname1`, `sortname2`, `sortname3`, `language`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `metakey`, `metadesc`, `metadata`, `featured`, `xreference`, `publish_up`, `publish_down`, `version`, `hits`) VALUES
(1, 'Darren Booker', 'darren-booker', '', '', '', 'Attiki', 'Greece', '45665', '555-555-5555', '', '', 'images/General_/person.jpg', 'test@yahoo.gr', 0, 1, 291, '2018-07-02 01:44:18', 1, '{"show_contact_category":"","show_contact_list":"","presentation_style":"","show_tags":"","show_info":"","show_name":"","show_position":"","show_email":"","add_mailto_link":"","show_street_address":"","show_suburb":"","show_state":"","show_postcode":"","show_country":"","show_telephone":"","show_mobile":"","show_fax":"","show_webpage":"","show_image":"","show_misc":"","allow_vcard":"","show_articles":"","articles_display_num":"","show_profile":"","show_links":"","linka_name":"","linka":false,"linkb_name":"","linkb":false,"linkc_name":"","linkc":false,"linkd_name":"","linkd":false,"linke_name":"","linke":false,"contact_layout":"","show_email_form":"","show_email_copy":"","banned_email":"","banned_subject":"","banned_text":"","validate_session":"","custom_reply":"","redirect":""}', 291, 4, 1, '555-555-5555', '', '', '', '', '*', '2018-07-02 01:44:18', 291, '', '2018-07-02 01:44:18', 0, '', '', '{"robots":"","rights":""}', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(2, 'Giannakos Anthonis', 'giannakos-antonis', '', '', '', '', '', '', '', '', '', '', 'antgiannakos@outlook.com.gr', 0, 1, 0, '0000-00-00 00:00:00', 2, '{"show_contact_category":"","show_contact_list":"","presentation_style":"","show_tags":"","show_info":"","show_name":"","show_position":"","show_email":"","add_mailto_link":"","show_street_address":"","show_suburb":"","show_state":"","show_postcode":"","show_country":"","show_telephone":"","show_mobile":"","show_fax":"","show_webpage":"","show_image":"","show_misc":"","allow_vcard":"","show_articles":"","articles_display_num":"","show_profile":"","show_links":"","linka_name":"","linka":false,"linkb_name":"","linkb":false,"linkc_name":"","linkc":false,"linkd_name":"","linkd":false,"linke_name":"","linke":false,"contact_layout":"","show_email_form":"","show_email_copy":"","banned_email":"","banned_subject":"","banned_text":"","validate_session":"","custom_reply":"","redirect":""}', 0, 4, 1, '', '', '', '', '', '*', '2018-07-02 10:47:56', 291, '', '2018-07-05 02:53:03', 291, '', '', '{"robots":"","rights":""}', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 11, 38);

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_content`
--

CREATE TABLE `uoj7s_content` (
  `id` int(10) UNSIGNED NOT NULL,
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `introtext` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `fulltext` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `urls` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribs` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `access` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `hits` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `metadata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The language code for the article.',
  `xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'A reference to enable linkages to external data sets.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uoj7s_content`
--

INSERT INTO `uoj7s_content` (`id`, `asset_id`, `title`, `alias`, `introtext`, `fulltext`, `state`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`, `featured`, `language`, `xreference`) VALUES
(1, 59, 'Linux', 'linux', '<p>Linux (/ˈlɪnəks/ (About this sound listen) LIN-əks)[9][10] is a family of free and open-source software operating systems built around the Linux kernel. Typically, Linux is packaged in a form known as a Linux distribution (or distro for short) for both desktop and server use. The defining component of a Linux distribution is the Linux kernel,[11] an operating system kernel first released on September 17, 1991, by Linus Torvalds.[12][13][14] Many Linux distributions use the word "Linux" in their name. The Free Software Foundation uses the name GNU/Linux to refer to the operating system family, as well as specific distributions, to emphasize that most Linux distributions are not just the Linux kernel, and that they have in common not only the kernel, but also numerous utilities and libraries, a large proportion of which are from the GNU project. This has led to some controversy.[15][16]</p>\r\n<p>Linux was originally developed for personal computers based on the Intel x86 architecture, but has since been ported to more platforms than any other operating system.[17] Because of the dominance of the Linux kernel-based Android OS on smartphones, Linux has the largest installed base of all general-purpose operating systems.[18] Linux is also the leading operating system on servers and other big iron systems such as mainframe computers, and the only OS used on TOP500 supercomputers (since November 2017, having before gradually eliminated all competitors).[19][20] It is used by around 2.3% of desktop computers.[21][22] The Chromebook, which runs the Linux kernel-based Chrome OS, dominates the US K–12 education market and represents nearly 20% of the sub-$300 notebook sales in the US.[23] Linux also runs on embedded systems—devices whose operating system is typically built into the firmware and is highly tailored to the system. This includes TiVo and similar DVR devices, network routers, facility automation controls, televisions,[24][25] video game consoles and smartwatches.[26] Many smartphones and tablet computers run Android and other Linux derivatives.[27]</p>\r\n<p>The development of Linux is one of the most prominent examples of free and open-source software collaboration. The underlying source code may be used, modified and distributed—commercially or non-commercially—by anyone under the terms of its respective licenses, such as the GNU General Public License.</p>\r\n<p>Some of the most popular and mainstream Linux distributions[28][29][30] are Arch Linux, CentOS, Debian, Fedora, Gentoo Linux, Linux Mint, Mageia, openSUSE and Ubuntu, together with commercial distributions such as Red Hat Enterprise Linux and SUSE Linux Enterprise Server. Distributions include the Linux kernel, supporting utilities and libraries, many of which are provided by the GNU Project, and usually a large amount of application software to fulfil the distribution\'s intended use. Desktop Linux distributions include a windowing system, such as X11, Mir or a Wayland implementation, and an accompanying desktop environment such as GNOME or KDE Plasma; some distributions may also include a less resource-intensive desktop, such as LXDE or Xfce. Distributions intended to run on servers may omit all graphical environments from the standard install, and instead include other software to set up and operate a solution stack such as LAMP. Because Linux is freely redistributable, anyone may create a distribution for any intended use.</p>\r\n<p>https://en.wikipedia.org/wiki/Linux</p>', '', -2, 8, '2018-06-30 17:23:58', 291, '', '2018-06-30 17:24:23', 291, 0, '0000-00-00 00:00:00', '2018-06-30 17:23:58', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"article_layout":"","show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_page_title":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 2, 1, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(2, 60, 'Windows', 'windows', '<p>Microsoft Windows is a group of several graphical operating system families, all of which are developed, marketed, and sold by Microsoft. Each family caters to a certain sector of the computing industry. Active Windows families include Windows NT and Windows Embedded; these may encompass subfamilies, e.g. Windows Embedded Compact (Windows CE) or Windows Server. Defunct Windows families include Windows 9x, Windows Mobile and Windows Phone.</p>\r\n<p>Microsoft introduced an operating environment named Windows on November 20, 1985, as a graphical operating system shell for MS-DOS in response to the growing interest in graphical user interfaces (GUIs).[5] Microsoft Windows came to dominate the world\'s personal computer (PC) market with over 90% market share, overtaking Mac OS, which had been introduced in 1984. Apple came to see Windows as an unfair encroachment on their innovation in GUI development as implemented on products such as the Lisa and Macintosh (eventually settled in court in Microsoft\'s favor in 1993). On PCs, Windows is still the most popular operating system. However, in 2014, Microsoft admitted losing the majority of the overall operating system market to Android,[6] because of the massive growth in sales of Android smartphones. In 2014, the number of Windows devices sold was less than 25% that of Android devices sold. This comparison however may not be fully relevant, as the two operating systems traditionally target different platforms. Still, numbers for server use of Windows (that are comparable to competitors) show one third market share, similar to for end user use.</p>\r\n<p>As of December 2017, the most recent version of Windows for PCs, tablets, smartphones and embedded devices is Windows 10. The most recent versions for server computers is Windows Server 2016. A specialized version of Windows runs on the Xbox One video game console.[7]</p>\r\n<p>https://en.wikipedia.org/wiki/Microsoft_Windows</p>', '', -2, 8, '2018-06-30 17:27:01', 291, '', '2018-06-30 17:27:01', 0, 0, '0000-00-00 00:00:00', '2018-06-30 17:27:01', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"article_layout":"","show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_page_title":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(3, 61, 'Windows XP', 'windows-xp', '<p>Windows XP (codenamed Whistler) is a personal computer operating system that was produced by Microsoft as part of the Windows NT family of operating systems. It was released to manufacturing on August 24, 2001, and broadly released for retail sale on October 25, 2001.</p>\r\n<p>Development of Windows XP began in the late 1990s as "Neptune", an operating system built on the Windows NT kernel which was intended specifically for mainstream consumer use. An updated version of Windows 2000 was also originally planned for the business market; however, in January 2000, both projects were shelved in favor of a single OS codenamed "Whistler", which would serve as a single OS platform for both consumer and business markets. As such, Windows XP was the first consumer edition of Windows not to be based on MS-DOS.[5]</p>\r\n<p>Upon its release, Windows XP received generally positive reviews, with critics noting increased performance and stability (especially in comparison to Windows ME), a more intuitive user interface, improved hardware support, and expanded multimedia capabilities. However, some industry reviewers were concerned by the new licensing model and product activation system.[6]</p>\r\n<p>Extended support for Windows XP ended on April 8, 2014, after which the operating system ceased receiving further support or security updates to most users. As of May 2018, 2.98% of Windows PCs run Windows XP,[7] and therefore XP represents 2.5% of the overall desktop operating system market share.</p>\r\n<p>https://en.wikipedia.org/wiki/Windows_XP</p>', '', -2, 8, '2018-06-30 17:35:17', 291, '', '2018-06-30 17:35:17', 0, 0, '0000-00-00 00:00:00', '2018-06-30 17:35:17', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"article_layout":"","show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_page_title":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 6, '', '', 1, 7, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(4, 63, 'Windows ', 'windows-10', '<p><strong>Microsoft Windows</strong> is a group of several graphical operating system families, all of which are developed, marketed, and sold&nbsp;by&nbsp;Microsoft. Each family caters to a certain sector of the computing industry. Active Windows families include Windows NT and Windows Embedded; these may encompass subfamilies, e.g. Windows Embedded Compact (Windows CE) or Windows Server. Defunct Windows families include Windows 9x, Windows Mobile and Windows Phone.</p>\r\n<p>Microsoft introduced an operating environment named Windows on November 20, 1985, as a graphical operating system shell for MS-DOS in response to the growing interest in graphical user interfaces (GUIs). Microsoft Windows came to dominate the world\'s personal computer (PC) market with over 90% market share, overtaking Mac OS, which had been introduced in 1984. Apple came to see Windows as an unfair encroachment on their innovation in GUI development as implemented on products such as the Lisa and Macintosh (eventually settled in court in Microsoft\'s favor in 1993). On PCs, Windows is still the most popular operating system. However, in 2014, Microsoft admitted losing the majority of the overall operating system market to Android, because of the massive growth in sales of Android smartphones. In 2014, the number of Windows devices sold was less than 25% that of Android devices sold. This comparison however may not be fully relevant, as the two operating systems traditionally target different platforms. Still, numbers for server use of Windows (that are comparable to competitors) show one third market share, similar to for end user use.</p>\r\n<p><a href="https://en.wikipedia.org/wiki/Microsoft_Windows">https://en.wikipedia.org/wiki/Microsoft_Windows</a></p>\r\n<p>&nbsp;</p>', '', 1, 8, '2018-06-30 17:37:26', 291, '', '2018-07-02 14:35:15', 291, 0, '0000-00-00 00:00:00', '2018-06-30 17:37:26', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"article_layout":"","show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_page_title":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 15, 4, '', '', 1, 156, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(5, 64, 'Linux', 'ubuntu', '<p><strong>Linux</strong> is a family of free and open-source software operating systems built around the Linux kernel. Typically, Linux is packaged in a form known as a Linux distribution (or distro for short) for both desktop and server use. The defining component of a Linux distribution is the Linux kernel, an operating system kernel first released on September 17, 1991, by Linus Torvalds. Many Linux distributions use the word "Linux" in their name. The Free Software Foundation uses the name GNU/Linux to refer to the operating system family, as well as specific distributions, to emphasize that most Linux distributions are not just the Linux kernel, and that they have in common not only the kernel, but also numerous utilities and libraries, a large proportion of which are from the GNU project. This has led to some controversy.</p>\r\n<p>Linux was originally developed for personal computers based on the Intel x86 architecture, but has since been ported to more platforms than any other operating system. Because of the dominance of the Linux kernel-based Android OS on smartphones, Linux has the largest installed base of all general-purpose operating systems. Linux is also the leading operating system on servers and other big iron systems such as mainframe computers, and the only OS used on TOP500 supercomputers (since November 2017, having before gradually eliminated all competitors). It is used by around 2.3% of desktop computers.&nbsp;<br /><br /></p>\r\n<p><a href="https://en.wikipedia.org/wiki/Linux">https://en.wikipedia.org/wiki/Linux</a></p>\r\n<p>&nbsp;</p>', '', 1, 8, '2018-06-30 17:39:55', 291, '', '2018-07-02 14:35:45', 291, 291, '2018-07-04 22:59:57', '2018-06-30 17:39:55', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"article_layout":"","show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_page_title":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 11, 3, '', '', 1, 146, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(6, 65, 'MacOS', 'fedora', '<p><strong>macOS</strong> is a series of graphical operating systems developed and marketed by Apple Inc. since 2001. It is the primary operating system for Apple\'s Mac family of computers. Within the market of desktop, laptop and home computers, and by web usage, it is the second most widely used desktop OS, after Microsoft Windows. <br />macOS is the second major series of Macintosh operating systems. The first is colloquially called the "classic" Mac OS, which was introduced in 1984, and the final release of which was Mac OS 9 in 1999. The first desktop version, Mac OS X 10.0, was released in March 2001, with its first update, 10.1, arriving later that year. After this, Apple began naming its releases after big cats, which lasted until OS X 10.8 Mountain Lion. Since OS X 10.9 Mavericks, releases have been named after landmarks in California. Apple shortened the name to "OS X" in 2012 and then changed it to "macOS" in 2016, adopting the nomenclature that they were using for their other operating systems, iOS, watchOS, and tvOS. The latest version is macOS High Sierra, which was publicly released in September 2017.<br />Between 1999 and 2009, Apple sold a separate series of operating systems called Mac OS X Server. The initial version, Mac&nbsp;OS&nbsp;X Server 1.0, was released in 1999 with a user interface similar to Mac OS 8.5. After this, new versions were introduced concurrently with the desktop version of Mac OS X. Beginning with Mac OS X 10.7 Lion, the server functions were made available as a separate package on the Mac App Store.</p>\r\n<p><a href="https://en.wikipedia.org/wiki/MacOS">https://en.wikipedia.org/wiki/MacOS</a></p>\r\n<p>&nbsp;</p>', '', 0, 8, '2018-06-30 17:56:36', 291, '', '2018-07-05 01:17:48', 291, 0, '0000-00-00 00:00:00', '2018-06-30 17:56:36', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"article_layout":"","show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_page_title":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 9, 2, '', '', 1, 83, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(7, 68, 'Android', 'android', '<p><strong>Android</strong> is a mobile operating system developed by Google, based on a modified version of the Linux kernel and other open source software and designed primarily for touchscreen mobile devices such as smartphones and tablets. In addition, Google has further developed Android TV for televisions, Android Auto for cars, and Wear OS for wrist watches, each with a specialized user interface. Variants of Android are also used on game consoles, digital cameras, PCs and other electronics.<br />Initially developed by Android Inc., which Google bought in 2005, Android was unveiled in 2007, with the first commercial Android device launched in September 2008. The operating system has since gone through multiple major releases, with the current version being 8.1 "Oreo", released in December 2017. The core Android source code is known as Android Open Source Project (AOSP), and is primarily licensed under the Apache License.<br />Android is also associated with a suite of proprietary software developed by Google, including core apps for services such as Gmail and Google Search, as well as the application store and digital distribution platform Google Play, and associated development platform. These apps are licensed by manufacturers of Android devices certified under standards imposed by Google, but AOSP has been used as the basis of competing Android ecosystems, such as Amazon.com\'s Fire OS, which utilize their own equivalents to the Google Mobile Services.</p>\r\n<p><span style="color: #444444; font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 13px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; float: none;"><a href="https://goo.gl/5qr3f5">https://goo.gl/5qr3f5</a></span></p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>', '', 1, 9, '2018-06-30 18:42:22', 291, '', '2018-07-02 14:37:13', 291, 0, '0000-00-00 00:00:00', '2018-06-30 18:42:22', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"article_layout":"","show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_page_title":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 5, 2, '', '', 1, 79, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(8, 69, 'Windows', 'windows-2', '<p>Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;</p>', '', -2, 9, '2018-06-30 18:42:56', 291, '', '2018-06-30 21:24:24', 291, 0, '0000-00-00 00:00:00', '2018-06-30 18:42:56', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"article_layout":"","show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_page_title":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 2, 1, '', '', 1, 4, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(9, 70, 'iOS', 'ios', '<p><strong>iOS (formerly iPhone OS).&nbsp;&nbsp;</strong>The iOS user interface is based upon direct manipulation, using multi-touch gestures. Interface control elements consist of sliders, switches, and buttons. Interaction with the OS includes gestures such as swipe, tap, pinch, and reverse pinch, all of which have specific definitions within the context of the iOS operating system and its multi-touch interface. Internal accelerometers are used by some applications to respond to shaking the device (one common result is the undo command) or rotating it in three dimensions (one common result is switching between portrait and landscape mode). Apple has been significantly praised for incorporating thorough accessibility functions into iOS, enabling users with vision and hearing disabilities to properly use its products.<br />Major versions of iOS are released annually. The current version, iOS 11, was released on September 19, 2017.</p>\r\n<p></p>\r\n<p><a href="https://en.wikipedia.org/wiki/IOS">https://en.wikipedia.org/wiki/IOS</a></p>\r\n<p>&nbsp;</p>', '', 1, 9, '2018-06-30 18:43:42', 291, '', '2018-07-05 01:42:09', 291, 0, '0000-00-00 00:00:00', '2018-06-30 18:43:42', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"article_layout":"","show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_page_title":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 10, 0, '', '', 1, 63, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(10, 76, 'Operating System (OS)', 'operating-system-os', '<p style="margin: 0.5em 0px; line-height: inherit; color: #222222; font-family: sans-serif; font-size: 14px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: #ffffff;">An&nbsp;<b>operating system</b>&nbsp;(<b>OS</b>) is&nbsp;<a style="text-decoration: none; color: #0b0080; background: none;" title="System software" href="https://en.wikipedia.org/wiki/System_software">system software</a>&nbsp;that manages&nbsp;<a style="text-decoration: none; color: #0b0080; background: none;" title="Computer hardware" href="https://en.wikipedia.org/wiki/Computer_hardware">computer hardware</a>&nbsp;and&nbsp;<a class="mw-redirect" style="text-decoration: none; color: #0b0080; background: none;" title="Computer software" href="https://en.wikipedia.org/wiki/Computer_software">software</a>resources and provides common&nbsp;<a style="text-decoration: none; color: #0b0080; background: none;" title="Daemon (computing)" href="https://en.wikipedia.org/wiki/Daemon_(computing)">services</a>&nbsp;for&nbsp;<a style="text-decoration: none; color: #0b0080; background: none;" title="Computer program" href="https://en.wikipedia.org/wiki/Computer_program">computer programs</a>.</p>\r\n<p style="margin: 0.5em 0px; line-height: inherit; color: #222222; font-family: sans-serif; font-size: 14px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: #ffffff;"><a style="text-decoration: none; color: #0b0080; background: none;" title="Time-sharing" href="https://en.wikipedia.org/wiki/Time-sharing">Time-sharing</a>&nbsp;operating systems&nbsp;<a class="mw-redirect" style="text-decoration: none; color: #0b0080; background: none;" title="Scheduler (computing)" href="https://en.wikipedia.org/wiki/Scheduler_(computing)">schedule tasks</a>&nbsp;for efficient use of the system and may also include accounting software for cost allocation of&nbsp;<a style="text-decoration: none; color: #0b0080; background: none;" title="Scheduling (computing)" href="https://en.wikipedia.org/wiki/Scheduling_(computing)">processor time</a>,&nbsp;<a style="text-decoration: none; color: #0b0080; background: none;" title="Mass storage" href="https://en.wikipedia.org/wiki/Mass_storage">mass storage</a>,&nbsp;<a style="text-decoration: none; color: #0b0080; background: none;" title="Printer (computing)" href="https://en.wikipedia.org/wiki/Printer_(computing)">printing</a>, and other resources.</p>\r\n<p style="margin: 0.5em 0px; line-height: inherit; color: #222222; font-family: sans-serif; font-size: 14px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: #ffffff;">For hardware functions such as&nbsp;<a class="mw-redirect" style="text-decoration: none; color: #0b0080; background: none;" title="Input and output" href="https://en.wikipedia.org/wiki/Input_and_output">input and output</a>&nbsp;and&nbsp;<a class="mw-redirect" style="text-decoration: none; color: #0b0080; background: none;" title="Memory allocation" href="https://en.wikipedia.org/wiki/Memory_allocation">memory allocation</a>, the operating system acts as an intermediary between programs and the computer hardware,<sup id="cite_ref-1" class="reference" style="line-height: 1; unicode-bidi: isolate; white-space: nowrap; font-size: 11.2px; font-weight: normal; font-style: normal;"><a style="text-decoration: none; color: #0b0080; background: none;" href="https://en.wikipedia.org/wiki/Operating_system#cite_note-1">[1]</a></sup><sup id="cite_ref-2" class="reference" style="line-height: 1; unicode-bidi: isolate; white-space: nowrap; font-size: 11.2px; font-weight: normal; font-style: normal;"><a style="text-decoration: none; color: #0b0080; background: none;" href="https://en.wikipedia.org/wiki/Operating_system#cite_note-2">[2]</a></sup>&nbsp;although the application code is usually executed directly by the hardware and frequently makes&nbsp;<a style="text-decoration: none; color: #0b0080; background: none;" title="System call" href="https://en.wikipedia.org/wiki/System_call">system calls</a>&nbsp;to an OS function or is interrupted by it. Operating systems are found on many devices that contain a computer&nbsp;– from&nbsp;<a class="mw-redirect" style="text-decoration: none; color: #0b0080; background: none;" title="Cellular phone" href="https://en.wikipedia.org/wiki/Cellular_phone">cellular phones</a>&nbsp;and&nbsp;<a style="text-decoration: none; color: #0b0080; background: none;" title="Video game console" href="https://en.wikipedia.org/wiki/Video_game_console">video game consoles</a>&nbsp;to&nbsp;<a style="text-decoration: none; color: #0b0080; background: none;" title="Web server" href="https://en.wikipedia.org/wiki/Web_server">web servers</a>&nbsp;and&nbsp;<a style="text-decoration: none; color: #0b0080; background: none;" title="Supercomputer" href="https://en.wikipedia.org/wiki/Supercomputer">supercomputers</a>.</p>\r\n<p style="margin: 0.5em 0px; line-height: inherit; color: #222222; font-family: sans-serif; font-size: 14px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: #ffffff;">The dominant desktop operating system is&nbsp;<a style="text-decoration: none; color: #0b0080; background: none;" title="Microsoft Windows" href="https://en.wikipedia.org/wiki/Microsoft_Windows">Microsoft Windows</a>&nbsp;with a market share of around 82.74%.&nbsp;<a style="text-decoration: none; color: #0b0080; background: none;" title="MacOS" href="https://en.wikipedia.org/wiki/MacOS">macOS</a>&nbsp;by&nbsp;<a style="text-decoration: none; color: #0b0080; background: none;" title="Apple Inc." href="https://en.wikipedia.org/wiki/Apple_Inc.">Apple Inc.</a>&nbsp;is in second place (13.23%), and the varieties of&nbsp;<a style="text-decoration: none; color: #0b0080; background: none;" title="Linux" href="https://en.wikipedia.org/wiki/Linux">Linux</a>&nbsp;are collectively in third place (1.57%).<sup id="cite_ref-3" class="reference" style="line-height: 1; unicode-bidi: isolate; white-space: nowrap; font-size: 11.2px; font-weight: normal; font-style: normal;"><a style="text-decoration: none; color: #0b0080; background: none;" href="https://en.wikipedia.org/wiki/Operating_system#cite_note-3">[3]</a></sup>&nbsp;In the&nbsp;<a style="text-decoration: none; color: #0b0080; background: none;" title="Mobile operating system" href="https://en.wikipedia.org/wiki/Mobile_operating_system">mobile</a>&nbsp;(<a style="text-decoration: none; color: #0b0080; background: none;" title="Smartphone" href="https://en.wikipedia.org/wiki/Smartphone">smartphone</a>&nbsp;and&nbsp;<a style="text-decoration: none; color: #0b0080; background: none;" title="Tablet computer" href="https://en.wikipedia.org/wiki/Tablet_computer">tablet</a>&nbsp;combined) sector, use in 2017 is up to 70% of&nbsp;<a style="text-decoration: none; color: #0b0080; background: none;" title="Google" href="https://en.wikipedia.org/wiki/Google">Google</a>\'s&nbsp;<a style="text-decoration: none; color: #0b0080; background: none;" title="Android (operating system)" href="https://en.wikipedia.org/wiki/Android_(operating_system)">Android</a><sup id="cite_ref-4" class="reference" style="line-height: 1; unicode-bidi: isolate; white-space: nowrap; font-size: 11.2px; font-weight: normal; font-style: normal;"><a style="text-decoration: none; color: #0b0080; background: none;" href="https://en.wikipedia.org/wiki/Operating_system#cite_note-4">[4]</a></sup>&nbsp;and according to third quarter 2016 data, Android on smartphones is dominant with 87.5 percent and a growth rate 10.3 percent per year, followed by&nbsp;<a style="text-decoration: none; color: #0b0080; background: none;" title="Apple Inc." href="https://en.wikipedia.org/wiki/Apple_Inc.">Apple</a>\'s&nbsp;<a style="text-decoration: none; color: #0b0080; background: none;" title="IOS" href="https://en.wikipedia.org/wiki/IOS">iOS</a>&nbsp;with 12.1 percent and a per year decrease in market share of 5.2 percent, while other operating systems amount to just 0.3 percent.<sup id="cite_ref-5" class="reference" style="line-height: 1; unicode-bidi: isolate; white-space: nowrap; font-size: 11.2px; font-weight: normal; font-style: normal;"><a style="text-decoration: none; color: #0b0080; background: none;" href="https://en.wikipedia.org/wiki/Operating_system#cite_note-5">[5]</a></sup>&nbsp;<a style="text-decoration: none; color: #0b0080; background: none;" title="Linux distribution" href="https://en.wikipedia.org/wiki/Linux_distribution">Linux distributions</a>&nbsp;are dominant in the server and supercomputing sectors. Other specialized classes of operating systems, such as embedded and real-time systems, exist for many applications.</p>', '', -2, 2, '2018-06-30 20:56:22', 291, '', '2018-06-30 21:07:32', 291, 0, '0000-00-00 00:00:00', '2018-06-30 20:56:22', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"article_layout":"","show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_page_title":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 3, 0, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 1, '*', ''),
(11, 82, 'Home', 'home', '', '', 1, 11, '2018-07-01 19:48:17', 291, '', '2018-07-05 00:38:12', 291, 0, '0000-00-00 00:00:00', '2018-07-01 19:48:17', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"article_layout":"","show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_page_title":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 8, 0, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(12, 85, 'Photo for Windows', 'photo-for-windows', '<p>phphphpphpghtgprbfdnvdnbvcdavcdsavasdvasdcasdasd</p>', '', 1, 12, '2018-07-01 23:08:40', 291, '', '2018-07-02 01:41:24', 291, 291, '2018-07-02 01:41:24', '2018-07-01 23:08:40', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"article_layout":"","show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_page_title":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 8, 0, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(13, 92, 'Home', 'home', '<p><span style="color: #4b4f56; font-family: Helvetica, Arial, sans-serif; font-size: 12px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: 2; word-spacing: 0px; background-color: #f1f0f0; float: none;">An operating system (OS) is system software that manages computer hardware and software resources and provides common services for computer programs. Time-sharing operating systems schedule tasks for efficient use of the system and may also include accounting software for cost allocation of processor time, mass storage, printing, and other resources. For hardware functions such as input and output and memory allocation, the operating system acts as an intermediary between programs and the computer hardware, although the application code is usually executed directly by the hardware and frequently makes system calls to an OS function or is interrupted by it. Operating systems are found on many devices that contain a computer – from cellular phones and video game consoles to web servers and supercomputers. The dominant desktop operating system is Microsoft Windows with a market share of around 82.74%. macOS by Apple Inc. is in second place (13.23%), and the varieties of Linux are collectively in third place (1.57%). In the mobile (smartphone and tablet combined) sector, use in 2017 is up to 70% of Google\'s Android[4] and according to third quarter 2016 data, Android on smartphones is dominant with 87.5 percent and a growth rate 10.3 percent per year, followed by Apple\'s iOS with 12.1 percent and a per year decrease in market share of 5.2 percent, while other operating systems amount to just 0.3 percent. Linux distributions are dominant in the server and supercomputing sectors. Other specialized classes of operating systems, such as embedded and real-time systems, exist for many applications.</span></p>', '', 1, 2, '2018-07-02 01:27:07', 291, '', '2018-07-02 01:27:07', 0, 0, '0000-00-00 00:00:00', '2018-07-02 01:27:07', '0000-00-00 00:00:00', '{}', '{}', '{}', 1, 0, '', '', 1, 1, '{}', 0, '*', ''),
(14, 98, 'Ubuntu Version', 'ubuntu', '<p><strong>Ubuntu</strong> is a&nbsp;free and open source&nbsp;operating systemand&nbsp;Linux distribution&nbsp;based on&nbsp;Debian.&nbsp;Ubuntu is offered in three official editions: Ubuntu Desktop&nbsp;for&nbsp;personal computers, Ubuntu Server for&nbsp;servers&nbsp;and the&nbsp;cloud,&nbsp;and Ubuntu Core&nbsp;for&nbsp;Internet of things&nbsp;devices. New releases of Ubuntu occur every six months, while&nbsp;long-term support&nbsp;(LTS) releases occur every two years.<br />Ubuntu is produced by&nbsp;Canonical&nbsp;and the community in a&nbsp;meritocratic&nbsp;governance model.&nbsp;Canonical provides free guaranteed security updates and support for each Ubuntu release, starting from the release date and until the release reaches its predesignated&nbsp;end-of-life&nbsp;(EOL) date.&nbsp;Canonical generates revenue through the sale of premium services related to Ubuntu.</p>\r\n<p><a href="https://en.wikipedia.org/wiki/Ubuntu_(operating_system)">https://en.wikipedia.org/wiki/Ubuntu_(operating_system)</a></p>\r\n<p>&nbsp;</p>', '', 1, 13, '2018-07-02 13:09:07', 291, '', '2018-07-02 14:00:32', 291, 0, '0000-00-00 00:00:00', '2018-07-02 13:09:07', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"article_layout":"","show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_page_title":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 5, 2, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 1, '*', ''),
(15, 99, 'Fedora Version', 'fedora', '<p><strong>Fedora</strong>&nbsp;is a&nbsp;Linux&nbsp;distribution&nbsp;developed by the community-supported&nbsp;Fedora Project&nbsp;and sponsored by&nbsp;Red Hat.&nbsp;Fedora contains software distributed under various&nbsp;free and open-source&nbsp;licenses and aims to be on the leading edge of such technologies.&nbsp;Fedora is the&nbsp;upstream&nbsp;source of the commercial&nbsp;Red Hat Enterprise Linux&nbsp;distribution.<br />Since the release of Fedora 21, three different editions are currently available:&nbsp;Workstation, focused on the&nbsp;personal computer,&nbsp;Server&nbsp;for&nbsp;servers, and&nbsp;Atomic&nbsp;focused on&nbsp;cloud computing.<br />As of February&nbsp;2016, Fedora has an estimated 1.2 million users,&nbsp;including&nbsp;Linus Torvalds, creator of the&nbsp;Linux kernel.</p>\r\n<p><a href="https://en.wikipedia.org/wiki/Fedora_(operating_system)">https://en.wikipedia.org/wiki/Fedora_(operating_system)</a></p>\r\n<p>&nbsp;</p>', '', 1, 13, '2018-07-02 13:09:32', 291, '', '2018-07-02 14:00:01', 291, 0, '0000-00-00 00:00:00', '2018-07-02 13:09:32', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"article_layout":"","show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_page_title":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 4, 1, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(16, 100, 'Arch Version', 'arch', '<p><strong>Arch Linux&nbsp;(or Arch)</strong>&nbsp;is a&nbsp;Linux distribution&nbsp;for computers based on&nbsp;x86-64architectures.<br />Arch Linux is composed predominantly of&nbsp;free and open-source software,&nbsp;and supports community involvement.<br />The design approach of the development team follows the&nbsp;KISS principle&nbsp;("keep it simple, stupid") as the general guideline, and focuses on elegance, code correctness,&nbsp;minimalism&nbsp;and simplicity, and expects the user to be willing to make some effort to understand the system\'s operation.&nbsp;A&nbsp;package manager&nbsp;written specifically for Arch Linux,&nbsp;pacman, is used to install, remove and update&nbsp;software packages.<br />Arch Linux uses a&nbsp;rolling release model, such that a regular system update is all that is needed to obtain the latest Arch software; the installation images released by the Arch team are simply up-to-date snapshots of the main system components.<br />Arch Linux has comprehensive documentation in the form of a community wiki, called the ArchWiki.</p>\r\n<p><a href="https://en.wikipedia.org/wiki/Arch_Linux">https://en.wikipedia.org/wiki/Arch_Linux</a></p>\r\n<p>&nbsp;</p>', '', 1, 13, '2018-07-02 13:10:01', 291, '', '2018-07-02 13:59:37', 291, 0, '0000-00-00 00:00:00', '2018-07-02 13:10:01', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"article_layout":"","show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_page_title":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 4, 0, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', '');
INSERT INTO `uoj7s_content` (`id`, `asset_id`, `title`, `alias`, `introtext`, `fulltext`, `state`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`, `featured`, `language`, `xreference`) VALUES
(17, 104, 'Windows 10 Version', 'windows-10-version', '<p><strong>Windows10</strong>&nbsp;(codenamed&nbsp;Redstone, formerly&nbsp;Threshold) is a&nbsp;personal computeroperating system&nbsp;developed and released by&nbsp;Microsoft, as part of the&nbsp;Windows NT&nbsp;family of operating systems. It was released on July 29, 2015.&nbsp;It is the first version of Windows that receives ongoing feature updates. Devices in enterprise environments can receive these updates at a slower pace, or use long-term support milestones that only receive critical updates, such as security patches, over their ten-year lifespan of extended support.</p>\r\n<p><a href="https://en.wikipedia.org/wiki/Windows_10">https://en.wikipedia.org/wiki/Windows_10</a></p>\r\n<p>&nbsp;</p>', '', 1, 14, '2018-07-02 13:20:30', 291, '', '2018-07-02 14:02:26', 291, 0, '0000-00-00 00:00:00', '2018-07-02 13:20:30', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"article_layout":"","show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_page_title":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 2, 2, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 1, '*', ''),
(18, 105, 'Windows 7', 'windows-7', '<p><strong>Windows7</strong>&nbsp;(codenamed&nbsp;Vienna, formerly&nbsp;Blackcomb) is a personal computer&nbsp;operating system&nbsp;developed by&nbsp;Microsoft. It is a part of the&nbsp;Windows NT&nbsp;family of operating systems. Windows 7 was&nbsp;released to manufacturing&nbsp;on July 22, 2009 and became generally available on October 22, 2009,&nbsp;less than three years after the release of its predecessor,&nbsp;Windows Vista. Windows 7\'s&nbsp;server&nbsp;counterpart,&nbsp;Windows Server 2008 R2, was released at the same time.</p>\r\n<p><a href="https://en.wikipedia.org/wiki/Windows_7">https://en.wikipedia.org/wiki/Windows_7</a></p>\r\n<p>&nbsp;</p>', '', 1, 14, '2018-07-02 13:21:13', 291, '', '2018-07-02 14:02:00', 291, 0, '0000-00-00 00:00:00', '2018-07-02 13:21:13', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"article_layout":"","show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_page_title":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 3, 1, '', '', 1, 2, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(19, 106, 'Windows XP Version', 'windows-xp', '<p><strong>Windows XP</strong>&nbsp;(codenamed&nbsp;Whistler) is a&nbsp;personal computer&nbsp;operating system&nbsp;that was produced by&nbsp;Microsoft&nbsp;as part of the&nbsp;Windows NT&nbsp;family of operating systems. It was released to manufacturing on August 24, 2001, and broadly released for retail sale on October 25, 2001.<br />Development of Windows XP began in the late 1990s as "Neptune", an operating system built on the&nbsp;Windows NT kernel&nbsp;which was intended specifically for mainstream consumer use. An updated version of&nbsp;Windows 2000&nbsp;was also originally planned for the business market; however, in January 2000, both projects were shelved in favor of a single OS codenamed "Whistler", which would serve as a single OS platform for both consumer and business markets. As such, Windows XP was the first consumer edition of Windows not to be based on&nbsp;MS-DOS.</p>\r\n<p><a href="https://en.wikipedia.org/wiki/Windows_XP">https://en.wikipedia.org/wiki/Windows_XP</a></p>\r\n<p>&nbsp;</p>', '', 1, 14, '2018-07-02 13:21:45', 291, '', '2018-07-02 14:01:07', 291, 0, '0000-00-00 00:00:00', '2018-07-02 13:21:45', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"article_layout":"","show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_page_title":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 3, 0, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(20, 108, 'Version 10.11 MacOS', 'version-10-11', '<p><strong>Mac OS X 10.11 El Capitan</strong> was released on September 30, 2015 after being announced on June 8, 2015. Similar to Mac OS X 10.6 Snow Leopard, Apple described this release as containing "refinements to the Mac experience" and "improvements to system performance" rather than new features. Refinements include public transport built into the Maps application, GUI improvements to the Notes application, adopting San Francisco as the system font for clearer legibility, and the introduction of System Integrity Protection. The Metal API, first introduced in iOS 8, was also included in this operating system for "all Macs since 2012". <br /><a href="https://simple.wikipedia.org/wiki/MacOS">https://simple.wikipedia.org/wiki/MacOS</a></p>\r\n<p>&nbsp;</p>', '', 1, 15, '2018-07-02 13:26:46', 291, '', '2018-07-02 14:04:14', 291, 291, '2018-07-05 01:23:18', '2018-07-02 13:26:46', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"article_layout":"","show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_page_title":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 3, 2, '', '', 1, 4, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(21, 109, 'Version 10.12 MacOS', 'version-10-12', '<p><strong>macOS Sierra (version 10.12)</strong>.&nbsp; The successor to OS X El Capitan, it was the first version of the operating system issued under the June 2016 rebranding as macOS. Sierra is named after California\'s Sierra Nevada mountain range. Its major new features concern Continuity, iCloud, and windowing, as well as support for Apple Pay and Siri.</p>\r\n<p>The first beta of macOS Sierra was released to developers shortly following the 2016 WWDC keynote on June 13, 2016. The first public-beta release followed on July 7, 2016. It was released to end users on September 20, 2016, as a free upgrade through the Mac App Store.</p>\r\n<p><a href="https://simple.wikipedia.org/wiki/MacOS">https://simple.wikipedia.org/wiki/MacOS</a></p>\r\n<p>&nbsp;</p>', '', 1, 15, '2018-07-02 13:27:22', 291, '', '2018-07-05 02:12:26', 291, 0, '0000-00-00 00:00:00', '2018-07-02 13:27:22', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"article_layout":"","show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_page_title":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 10, 1, '', '', 1, 8, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(22, 110, 'Version 10.13 MacOS', 'version-10-13', '<p>The fall release of <strong>macOS 10.13 High Sierra</strong> was announced on June 5, 2017 at Apple\'s WWDC event. On September 12, 2017 at Apple\'s iPhone event, they announced its release to be September 25, 2017. Like OS X El Capitan and OS X Mountain Lion, High Sierra is a refinement-based update having very few new features. High Sierra uses the new Apple File System and includes enhancements to Safari, Photos, and Mail, among other changes. <br /><a href="https://simple.wikipedia.org/wiki/MacOS">https://simple.wikipedia.org/wiki/MacOS</a></p>\r\n<p>&nbsp;</p>', '', 1, 15, '2018-07-02 13:27:41', 291, '', '2018-07-05 01:26:18', 291, 0, '0000-00-00 00:00:00', '2018-07-02 13:27:41', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"article_layout":"","show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_page_title":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 4, 0, '', '', 1, 3, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(23, 112, 'Android 9.0 P(API 28)', 'android-9-0-p-api-28', '<p><strong><span style="background-color: #ffffff;"><span style="color: #222222; font-family: sans-serif; font-size: 12.6px; font-style: normal; font-weight: bold; letter-spacing: normal; orphans: 2; text-align: center; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; float: none;">Android 9.0 P (API 28)&nbsp;</span></span></strong>is the upcoming ninth major version of the Android operating system. It was first announced by Google on March 7, 2018, and the first developer preview was released on the same day. Second preview, considered beta quality, was released on May 8, 2018. <br /><a href="https://en.wikipedia.org/wiki/Android_version_history">https://en.wikipedia.org/wiki/Android_version_history</a></p>\r\n<p>&nbsp;</p>', '', 1, 16, '2018-07-02 13:39:48', 291, '', '2018-07-03 00:04:13', 291, 0, '0000-00-00 00:00:00', '2018-07-02 13:39:48', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"article_layout":"","show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_page_title":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 3, 2, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 1, '*', ''),
(24, 113, 'Android 8.1 Oreo(API 27)', 'android-8-1-oreo-api-27', '<p><span style="color: #222222; font-family: sans-serif; font-size: 12.6px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: #ffffff; float: none;"><strong>Android 8.1 Oreo (API 27)</strong> is the 8th major release of the Android operating system. It was first released as a developer preview on October 25, 2017, with factory images for current Nexus and Pixel devices. A second developer preview was made available on November 27, 2017 for Nexus and Pixel devices, before the stable version was released on December 5, 2017.</span></p>\r\n<p><a href="https://en.wikipedia.org/wiki/Android_version_history">https://en.wikipedia.org/wiki/Android_version_history</a></p>\r\n<p>&nbsp;</p>', '', 1, 16, '2018-07-02 13:40:06', 291, '', '2018-07-03 00:10:27', 291, 0, '0000-00-00 00:00:00', '2018-07-02 13:40:06', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"article_layout":"","show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_page_title":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 5, 1, '', '', 1, 1, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(25, 114, 'Android 8.0 Oreo(API 26)', 'android-8-0-oreo-api-26', '<p><strong>Android Oreo 8.0 Oreo (API 26)</strong> is the 8th major release of the Android operating system. It was first released as a developer preview on March 21, 2017, with factory images for current Nexus and Pixel devices. The final developer preview was released on July 24, 2017, with the stable version released in August 2017. <br /><a href="https://en.wikipedia.org/wiki/Android_version_history">https://en.wikipedia.org/wiki/Android_version_history</a></p>\r\n<p>&nbsp;</p>', '', 1, 16, '2018-07-02 13:40:25', 291, '', '2018-07-03 00:06:29', 291, 0, '0000-00-00 00:00:00', '2018-07-02 13:40:25', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"article_layout":"","show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_page_title":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 4, 0, '', '', 1, 4, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(26, 118, 'iOS 11 Version', 'ios-11-version', '<p><strong>iOS 11</strong>&nbsp;was announced at the company\'s Worldwide Developers Conference on June 5, 2017, and released on September 19, 2017.</p>\r\n<p>Among iOS 11\'s changes: the lock screen and Notification Center are combined, allowing all notifications to be displayed directly on the lock screen.&nbsp;</p>\r\n<p><a href="https://en.wikipedia.org/wiki/IOS_11">https://en.wikipedia.org/wiki/IOS_11</a></p>\r\n<p>&nbsp;</p>', '', 1, 17, '2018-07-02 13:49:04', 291, '', '2018-07-05 02:05:15', 291, 0, '0000-00-00 00:00:00', '2018-07-02 13:49:04', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"article_layout":"","show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_page_title":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 7, 1, '', '', 1, 5, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(27, 119, 'iOS 10 Version', 'ios-10-version', '<p><strong>iOS 10&nbsp;</strong>&nbsp;incorporates changes to 3D Touch and the lock screen. There are new features to some apps: Messages has additional emojis and third-party apps can extend functionality in iMessage, Maps has a redesigned interface and additional third-party functions, the Home app manages "HomeKit"-enabled accessories,&nbsp;</p>\r\n<p><a href="https://en.wikipedia.org/wiki/IOS_10">https://en.wikipedia.org/wiki/IOS_10</a></p>\r\n<p>&nbsp;</p>', '', 1, 17, '2018-07-02 13:49:36', 291, '', '2018-07-05 02:04:08', 291, 0, '0000-00-00 00:00:00', '2018-07-02 13:49:36', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"article_layout":"","show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_page_title":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 5, 3, '', '', 1, 22, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(28, 120, 'iOS 9 Version', 'ios-9', '<p><strong>iOS 9</strong>&nbsp;was announced at the company\'s Worldwide Developers Conference on June 8, 2015, and was released on September 16, 2015. It was succeeded by iOS 10 on September 13, 2016.</p>\r\n<p><a href="https://en.wikipedia.org/wiki/IOS_9">https://en.wikipedia.org/wiki/IOS_9</a></p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>', '', 1, 17, '2018-07-02 13:50:07', 291, '', '2018-07-05 02:04:08', 291, 0, '0000-00-00 00:00:00', '2018-07-02 13:50:07', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"article_layout":"","show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_page_title":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 6, 2, '', '', 1, 5, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(29, 124, 'Windows Photo', 'windows', '<p><img src="images/OS_for_Computer/windows.png" alt="windows" width="400" height="225" /></p>', '', -2, 18, '2018-07-02 15:13:33', 291, '', '2018-07-02 15:26:27', 291, 0, '0000-00-00 00:00:00', '2018-07-02 15:13:33', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"article_layout":"","show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_page_title":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 2, 4, '', '', 1, 4, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(30, 125, 'Linux Photo', 'linux', '<p><img src="images/OS_for_Computer/linux.jpg" alt="linux" width="400" height="313" /></p>', '', -2, 18, '2018-07-02 15:15:05', 291, '', '2018-07-02 15:26:11', 291, 0, '0000-00-00 00:00:00', '2018-07-02 15:15:05', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"article_layout":"","show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_page_title":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 2, 3, '', '', 1, 3, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(31, 126, 'MacOS Photo', 'macos', '<p><img src="images/OS_for_Computer/macOS.jpg" alt="macOS" width="400" height="267" /></p>', '', -2, 18, '2018-07-02 15:16:36', 291, '', '2018-07-02 15:25:55', 291, 0, '0000-00-00 00:00:00', '2018-07-02 15:16:36', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"article_layout":"","show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_page_title":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 2, 2, '', '', 1, 2, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(32, 127, 'Android Photo', 'android', '<p><img src="images/OS_for_Computer/android.jpg" alt="android" width="400" height="300" /></p>', '', -2, 18, '2018-07-02 15:18:29', 291, '', '2018-07-02 15:25:40', 291, 0, '0000-00-00 00:00:00', '2018-07-02 15:18:29', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"article_layout":"","show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_page_title":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 2, 1, '', '', 1, 3, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(33, 128, 'iOS Photo', 'ios', '<p><img src="images/OS_for_Computer/ios.jpg" alt="ios" /></p>', '', -2, 18, '2018-07-02 15:19:25', 291, '', '2018-07-02 15:25:25', 291, 0, '0000-00-00 00:00:00', '2018-07-02 15:19:25', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"article_layout":"","show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_page_title":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 2, 0, '', '', 1, 3, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(34, 137, 'MacOS', 'copy-macos', '<p><strong>macOS</strong> is the second major series of Macintosh operating systems. The first is colloquially called the "classic" Mac OS, which was introduced in 1984, and the final release of which was Mac OS 9 in 1999. The first desktop version, Mac OS X 10.0, was released in March 2001, with its first update, 10.1, arriving later that year. After this, Apple began naming its releases after big cats, which lasted until OS X 10.8 Mountain Lion. Since OS X 10.9 Mavericks, releases have been named after landmarks in California. Apple shortened the name to "OS X" in 2012 and then changed it to "macOS" in 2016, adopting the nomenclature that they were using for their other operating systems, iOS, watchOS, and tvOS. The latest version is macOS High Sierra, which was publicly released in September 2017.</p>\r\n<p><a href="https://en.wikipedia.org/wiki/MacOS">https://en.wikipedia.org/wiki/MacOS</a></p>\r\n<p>&nbsp;</p>', '', 1, 8, '2018-07-05 01:05:44', 291, '', '2018-07-05 01:16:46', 291, 0, '0000-00-00 00:00:00', '2018-07-05 01:05:44', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"article_layout":"","show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_page_title":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 5, 1, '', '', 1, 16, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(35, 138, 'TEST', 'test', '<p><strong>macOS</strong> is the second major series of Macintosh operating systems. The first is colloquially called the "classic" Mac OS, which was introduced in 1984, and the final release of which was Mac OS 9 in 1999. The first desktop version, Mac OS X 10.0, was released in March 2001, with its first update, 10.1, arriving later that year. After this, Apple began naming its releases after big cats, which lasted until OS X 10.8 Mountain Lion. Since OS X 10.9 Mavericks, releases have been named after landmarks in California. Apple shortened the name to "OS X" in 2012 and then changed it to "macOS" in 2016, adopting the nomenclature that they were using for their other operating systems, iOS, watchOS, and tvOS. The latest version is macOS High Sierra, which was publicly released in September 2017.</p>\r\n<p><a href="https://en.wikipedia.org/wiki/MacOS">https://en.wikipedia.org/wiki/MacOS</a></p>\r\n<p>&nbsp;</p>', '', 0, 8, '2018-07-05 01:10:21', 291, '', '2018-07-05 01:16:19', 291, 0, '0000-00-00 00:00:00', '2018-07-05 01:10:21', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"article_layout":"","show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_page_title":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 11, 0, '', '', 1, 10, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', '');

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_contentitem_tag_map`
--

CREATE TABLE `uoj7s_contentitem_tag_map` (
  `type_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_content_id` int(10) UNSIGNED NOT NULL COMMENT 'PK from the core content table',
  `content_item_id` int(11) NOT NULL COMMENT 'PK from the content type table',
  `tag_id` int(10) UNSIGNED NOT NULL COMMENT 'PK from the tag table',
  `tag_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of most recent save for this tag-item',
  `type_id` mediumint(8) NOT NULL COMMENT 'PK from the content_type table'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Maps items from content tables to tags';

--
-- Dumping data for table `uoj7s_contentitem_tag_map`
--

INSERT INTO `uoj7s_contentitem_tag_map` (`type_alias`, `core_content_id`, `content_item_id`, `tag_id`, `tag_date`, `type_id`) VALUES
('com_content.article', 1, 3, 2, '2018-06-30 17:35:18', 1);

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_content_frontpage`
--

CREATE TABLE `uoj7s_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uoj7s_content_frontpage`
--

INSERT INTO `uoj7s_content_frontpage` (`content_id`, `ordering`) VALUES
(10, 4),
(14, 2),
(17, 3),
(23, 1);

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_content_rating`
--

CREATE TABLE `uoj7s_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `rating_count` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lastip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_content_types`
--

CREATE TABLE `uoj7s_content_types` (
  `type_id` int(10) UNSIGNED NOT NULL,
  `type_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type_alias` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `table` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `rules` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_mappings` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `router` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content_history_options` varchar(5120) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JSON string for com_contenthistory options'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uoj7s_content_types`
--

INSERT INTO `uoj7s_content_types` (`type_id`, `type_title`, `type_alias`, `table`, `rules`, `field_mappings`, `router`, `content_history_options`) VALUES
(1, 'Article', 'com_content.article', '{"special":{"dbtable":"#__content","key":"id","type":"Content","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"state","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"introtext", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"attribs", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"urls", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"xreference", "asset_id":"asset_id"}, "special":{"fulltext":"fulltext"}}', 'ContentHelperRoute::getArticleRoute', '{"formFile":"administrator\\/components\\/com_content\\/models\\/forms\\/article.xml", "hideFields":["asset_id","checked_out","checked_out_time","version"],"ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "hits"],"convertToInt":["publish_up", "publish_down", "featured", "ordering"],"displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"} ]}'),
(2, 'Contact', 'com_contact.contact', '{"special":{"dbtable":"#__contact_details","key":"id","type":"Contact","prefix":"ContactTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"published","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"address", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"params", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"image", "core_urls":"webpage", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"xreference", "asset_id":"null"}, "special":{"con_position":"con_position","suburb":"suburb","state":"state","country":"country","postcode":"postcode","telephone":"telephone","fax":"fax","misc":"misc","email_to":"email_to","default_con":"default_con","user_id":"user_id","mobile":"mobile","sortname1":"sortname1","sortname2":"sortname2","sortname3":"sortname3"}}', 'ContactHelperRoute::getContactRoute', '{"formFile":"administrator\\/components\\/com_contact\\/models\\/forms\\/contact.xml","hideFields":["default_con","checked_out","checked_out_time","version","xreference"],"ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "hits"],"convertToInt":["publish_up", "publish_down", "featured", "ordering"], "displayLookup":[ {"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"} ] }'),
(3, 'Newsfeed', 'com_newsfeeds.newsfeed', '{"special":{"dbtable":"#__newsfeeds","key":"id","type":"Newsfeed","prefix":"NewsfeedsTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"published","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"description", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"params", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"link", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"xreference", "asset_id":"null"}, "special":{"numarticles":"numarticles","cache_time":"cache_time","rtl":"rtl"}}', 'NewsfeedsHelperRoute::getNewsfeedRoute', '{"formFile":"administrator\\/components\\/com_newsfeeds\\/models\\/forms\\/newsfeed.xml","hideFields":["asset_id","checked_out","checked_out_time","version"],"ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "hits"],"convertToInt":["publish_up", "publish_down", "featured", "ordering"],"displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"} ]}'),
(4, 'User', 'com_users.user', '{"special":{"dbtable":"#__users","key":"id","type":"User","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"null","core_alias":"username","core_created_time":"registerdate","core_modified_time":"lastvisitDate","core_body":"null", "core_hits":"null","core_publish_up":"null","core_publish_down":"null","access":"null", "core_params":"params", "core_featured":"null", "core_metadata":"null", "core_language":"null", "core_images":"null", "core_urls":"null", "core_version":"null", "core_ordering":"null", "core_metakey":"null", "core_metadesc":"null", "core_catid":"null", "core_xreference":"null", "asset_id":"null"}, "special":{}}', 'UsersHelperRoute::getUserRoute', ''),
(5, 'Article Category', 'com_content.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', 'ContentHelperRoute::getCategoryRoute', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}]}'),
(6, 'Contact Category', 'com_contact.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', 'ContactHelperRoute::getCategoryRoute', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}]}'),
(7, 'Newsfeeds Category', 'com_newsfeeds.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', 'NewsfeedsHelperRoute::getCategoryRoute', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}]}'),
(8, 'Tag', 'com_tags.tag', '{"special":{"dbtable":"#__tags","key":"tag_id","type":"Tag","prefix":"TagsTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"urls", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"null", "core_xreference":"null", "asset_id":"null"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path"}}', 'TagsHelperRoute::getTagRoute', '{"formFile":"administrator\\/components\\/com_tags\\/models\\/forms\\/tag.xml", "hideFields":["checked_out","checked_out_time","version", "lft", "rgt", "level", "path", "urls", "publish_up", "publish_down"],"ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"}, {"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}]}'),
(9, 'Banner', 'com_banners.banner', '{"special":{"dbtable":"#__banners","key":"id","type":"Banner","prefix":"BannersTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"published","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"description", "core_hits":"null","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"link", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"null", "asset_id":"null"}, "special":{"imptotal":"imptotal", "impmade":"impmade", "clicks":"clicks", "clickurl":"clickurl", "custombannercode":"custombannercode", "cid":"cid", "purchase_type":"purchase_type", "track_impressions":"track_impressions", "track_clicks":"track_clicks"}}', '', '{"formFile":"administrator\\/components\\/com_banners\\/models\\/forms\\/banner.xml", "hideFields":["checked_out","checked_out_time","version", "reset"],"ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "imptotal", "impmade", "reset"], "convertToInt":["publish_up", "publish_down", "ordering"], "displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}, {"sourceColumn":"cid","targetTable":"#__banner_clients","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"} ]}'),
(10, 'Banners Category', 'com_banners.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special": {"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', '', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"], "convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}]}'),
(11, 'Banner Client', 'com_banners.client', '{"special":{"dbtable":"#__banner_clients","key":"id","type":"Client","prefix":"BannersTable"}}', '', '', '', '{"formFile":"administrator\\/components\\/com_banners\\/models\\/forms\\/client.xml", "hideFields":["checked_out","checked_out_time"], "ignoreChanges":["checked_out", "checked_out_time"], "convertToInt":[], "displayLookup":[]}'),
(12, 'User Notes', 'com_users.note', '{"special":{"dbtable":"#__user_notes","key":"id","type":"Note","prefix":"UsersTable"}}', '', '', '', '{"formFile":"administrator\\/components\\/com_users\\/models\\/forms\\/note.xml", "hideFields":["checked_out","checked_out_time", "publish_up", "publish_down"],"ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time"], "convertToInt":["publish_up", "publish_down"],"displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}, {"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}]}'),
(13, 'User Notes Category', 'com_users.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', '', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"], "convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}]}');

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_core_log_searches`
--

CREATE TABLE `uoj7s_core_log_searches` (
  `search_term` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hits` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_extensions`
--

CREATE TABLE `uoj7s_extensions` (
  `extension_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Parent package ID for extensions installed as a package.',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `element` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `folder` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` tinyint(3) NOT NULL,
  `enabled` tinyint(3) NOT NULL DEFAULT '0',
  `access` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `protected` tinyint(3) NOT NULL DEFAULT '0',
  `manifest_cache` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `system_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) DEFAULT '0',
  `state` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uoj7s_extensions`
--

INSERT INTO `uoj7s_extensions` (`extension_id`, `package_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(1, 0, 'com_mailto', 'component', 'com_mailto', '', 0, 1, 1, 1, '{"name":"com_mailto","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MAILTO_XML_DESCRIPTION","group":"","filename":"mailto"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(2, 0, 'com_wrapper', 'component', 'com_wrapper', '', 0, 1, 1, 1, '{"name":"com_wrapper","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_WRAPPER_XML_DESCRIPTION","group":"","filename":"wrapper"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(3, 0, 'com_admin', 'component', 'com_admin', '', 1, 1, 1, 1, '{"name":"com_admin","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_ADMIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(4, 0, 'com_banners', 'component', 'com_banners', '', 1, 1, 1, 0, '{"name":"com_banners","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_BANNERS_XML_DESCRIPTION","group":"","filename":"banners"}', '{"purchase_type":"3","track_impressions":"0","track_clicks":"0","metakey_prefix":"","save_history":"1","history_limit":10}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(5, 0, 'com_cache', 'component', 'com_cache', '', 1, 1, 1, 1, '{"name":"com_cache","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CACHE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(6, 0, 'com_categories', 'component', 'com_categories', '', 1, 1, 1, 1, '{"name":"com_categories","type":"component","creationDate":"December 2007","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CATEGORIES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(7, 0, 'com_checkin', 'component', 'com_checkin', '', 1, 1, 1, 1, '{"name":"com_checkin","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CHECKIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(8, 0, 'com_contact', 'component', 'com_contact', '', 1, 1, 1, 0, '{"name":"com_contact","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CONTACT_XML_DESCRIPTION","group":"","filename":"contact"}', '{"contact_layout":"_:default","show_contact_category":"hide","save_history":"1","history_limit":10,"show_contact_list":"0","presentation_style":"sliders","show_tags":"1","show_info":"1","show_name":"1","show_position":"1","show_email":"0","show_street_address":"1","show_suburb":"1","show_state":"1","show_postcode":"1","show_country":"1","show_telephone":"1","show_mobile":"1","show_fax":"1","show_webpage":"1","show_image":"1","show_misc":"1","image":"","allow_vcard":"0","show_articles":"0","articles_display_num":"10","show_profile":"0","show_user_custom_fields":["-1"],"show_links":"0","linka_name":"","linkb_name":"","linkc_name":"","linkd_name":"","linke_name":"","contact_icons":"0","icon_address":"","icon_email":"","icon_telephone":"","icon_mobile":"","icon_fax":"","icon_misc":"","category_layout":"_:default","show_category_title":"1","show_description":"1","show_description_image":"0","maxLevel":"-1","show_subcat_desc":"1","show_empty_categories":"0","show_cat_items":"1","show_cat_tags":"1","show_base_description":"1","maxLevelcat":"-1","show_subcat_desc_cat":"1","show_empty_categories_cat":"0","show_cat_items_cat":"1","filter_field":"0","show_pagination_limit":"0","show_headings":"1","show_image_heading":"0","show_position_headings":"1","show_email_headings":"0","show_telephone_headings":"1","show_mobile_headings":"0","show_fax_headings":"0","show_suburb_headings":"1","show_state_headings":"1","show_country_headings":"1","show_pagination":"2","show_pagination_results":"1","initial_sort":"ordering","captcha":"","show_email_form":"1","show_email_copy":"0","banned_email":"","banned_subject":"","banned_text":"","validate_session":"1","custom_reply":"0","redirect":"","show_feed_link":"1","sef_advanced":0,"sef_ids":0,"custom_fields_enable":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(9, 0, 'com_cpanel', 'component', 'com_cpanel', '', 1, 1, 1, 1, '{"name":"com_cpanel","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CPANEL_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10, 0, 'com_installer', 'component', 'com_installer', '', 1, 1, 1, 1, '{"name":"com_installer","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_INSTALLER_XML_DESCRIPTION","group":""}', '{"show_jed_info":"1","cachetimeout":"6","minimum_stability":"4"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(11, 0, 'com_languages', 'component', 'com_languages', '', 1, 1, 1, 1, '{"name":"com_languages","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_LANGUAGES_XML_DESCRIPTION","group":""}', '{"administrator":"en-GB","site":"en-GB"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(12, 0, 'com_login', 'component', 'com_login', '', 1, 1, 1, 1, '{"name":"com_login","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_LOGIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(13, 0, 'com_media', 'component', 'com_media', '', 1, 1, 0, 1, '{"name":"com_media","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MEDIA_XML_DESCRIPTION","group":"","filename":"media"}', '{"upload_extensions":"bmp,csv,doc,gif,ico,jpg,jpeg,odg,odp,ods,odt,pdf,png,ppt,txt,xcf,xls,BMP,CSV,DOC,GIF,ICO,JPG,JPEG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,TXT,XCF,XLS","upload_maxsize":"116","file_path":"images","image_path":"images","restrict_uploads":"0","check_mime":"1","image_extensions":"bmp,gif,jpg,png","ignore_extensions":"","upload_mime":"image\\/jpeg,image\\/gif,image\\/png,image\\/bmp,application\\/msword,application\\/excel,application\\/pdf,application\\/powerpoint,text\\/plain,application\\/x-zip","upload_mime_illegal":"text\\/html"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(14, 0, 'com_menus', 'component', 'com_menus', '', 1, 1, 1, 1, '{"name":"com_menus","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MENUS_XML_DESCRIPTION","group":""}', '{"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(15, 0, 'com_messages', 'component', 'com_messages', '', 1, 1, 1, 1, '{"name":"com_messages","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MESSAGES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(16, 0, 'com_modules', 'component', 'com_modules', '', 1, 1, 1, 1, '{"name":"com_modules","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MODULES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(17, 0, 'com_newsfeeds', 'component', 'com_newsfeeds', '', 1, 1, 1, 0, '{"name":"com_newsfeeds","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_NEWSFEEDS_XML_DESCRIPTION","group":"","filename":"newsfeeds"}', '{"newsfeed_layout":"_:default","save_history":"1","history_limit":5,"show_feed_image":"1","show_feed_description":"1","show_item_description":"1","feed_character_count":"0","feed_display_order":"des","float_first":"right","float_second":"right","show_tags":"1","category_layout":"_:default","show_category_title":"1","show_description":"1","show_description_image":"1","maxLevel":"-1","show_empty_categories":"0","show_subcat_desc":"1","show_cat_items":"1","show_cat_tags":"1","show_base_description":"1","maxLevelcat":"-1","show_empty_categories_cat":"0","show_subcat_desc_cat":"1","show_cat_items_cat":"1","filter_field":"1","show_pagination_limit":"1","show_headings":"1","show_articles":"0","show_link":"1","show_pagination":"1","show_pagination_results":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(18, 0, 'com_plugins', 'component', 'com_plugins', '', 1, 1, 1, 1, '{"name":"com_plugins","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_PLUGINS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(19, 0, 'com_search', 'component', 'com_search', '', 1, 1, 1, 0, '{"name":"com_search","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_SEARCH_XML_DESCRIPTION","group":"","filename":"search"}', '{"enabled":"0","search_phrases":"1","search_areas":"1","show_date":"1","opensearch_name":"","opensearch_description":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(20, 0, 'com_templates', 'component', 'com_templates', '', 1, 1, 1, 1, '{"name":"com_templates","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_TEMPLATES_XML_DESCRIPTION","group":""}', '{"template_positions_display":"1","upload_limit":"10","image_formats":"gif,bmp,jpg,jpeg,png","source_formats":"txt,less,ini,xml,js,php,css,scss,sass","font_formats":"woff,ttf,otf","compressed_formats":"zip"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(22, 0, 'com_content', 'component', 'com_content', '', 1, 1, 0, 1, '{"name":"com_content","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CONTENT_XML_DESCRIPTION","group":"","filename":"content"}', '{"article_layout":"_:default","show_title":"0","link_titles":"1","show_intro":"1","info_block_position":"0","info_block_show_title":"0","show_category":"0","link_category":"1","show_parent_category":"0","link_parent_category":"0","show_associations":"0","flags":"1","show_author":"0","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"1","show_vote":"0","show_readmore":"1","show_readmore_title":"1","readmore_limit":"100","show_tags":"0","show_icons":"1","show_print_icon":"1","show_email_icon":"0","show_hits":"0","show_noauth":"0","urls_position":"0","captcha":"","show_publishing_options":"1","show_article_options":"1","save_history":"0","history_limit":10,"show_urls_images_frontend":"0","show_urls_images_backend":"1","targeta":0,"targetb":0,"targetc":0,"float_intro":"left","float_fulltext":"left","category_layout":"_:blog","show_category_heading_title_text":"1","show_category_title":"0","show_description":"0","show_description_image":"0","maxLevel":"1","show_empty_categories":"0","show_no_articles":"1","show_subcat_desc":"1","show_cat_num_articles":"0","show_cat_tags":"1","show_base_description":"1","maxLevelcat":"-1","show_empty_categories_cat":"0","show_subcat_desc_cat":"1","show_cat_num_articles_cat":"1","num_leading_articles":"1","num_intro_articles":"4","num_columns":"2","num_links":"4","multi_column_order":"0","show_subcategory_content":"0","show_pagination_limit":"1","filter_field":"hide","show_headings":"1","list_show_date":"0","date_format":"","list_show_hits":"1","list_show_author":"1","orderby_pri":"order","orderby_sec":"rdate","order_date":"published","show_pagination":"2","show_pagination_results":"1","show_featured":"show","show_feed_link":"1","feed_summary":"0","feed_show_readmore":"0","sef_advanced":0,"sef_ids":0,"custom_fields_enable":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(23, 0, 'com_config', 'component', 'com_config', '', 1, 1, 0, 1, '{"name":"com_config","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CONFIG_XML_DESCRIPTION","group":""}', '{"filters":{"1":{"filter_type":"NH","filter_tags":"","filter_attributes":""},"9":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"6":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"7":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"2":{"filter_type":"NH","filter_tags":"","filter_attributes":""},"3":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"4":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"5":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"8":{"filter_type":"NONE","filter_tags":"","filter_attributes":""}}}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(24, 0, 'com_redirect', 'component', 'com_redirect', '', 1, 1, 0, 1, '{"name":"com_redirect","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_REDIRECT_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(25, 0, 'com_users', 'component', 'com_users', '', 1, 1, 0, 1, '{"name":"com_users","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_USERS_XML_DESCRIPTION","group":"","filename":"users"}', '{"allowUserRegistration":"0","new_usertype":"2","guest_usergroup":"9","sendpassword":"0","useractivation":"2","mail_to_admin":"1","captcha":"","frontend_userparams":"1","site_language":"0","change_login_name":"0","reset_count":"10","reset_time":"1","minimum_length":"4","minimum_integers":"0","minimum_symbols":"0","minimum_uppercase":"0","save_history":"1","history_limit":5,"mailSubjectPrefix":"","mailBodySuffix":"","debugUsers":"1","debugGroups":"1","sef_advanced":0,"custom_fields_enable":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(27, 0, 'com_finder', 'component', 'com_finder', '', 1, 1, 0, 0, '{"name":"com_finder","type":"component","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_FINDER_XML_DESCRIPTION","group":"","filename":"finder"}', '{"enabled":"0","show_description":"1","description_length":255,"allow_empty_query":"0","show_url":"1","show_autosuggest":"1","show_suggested_query":"1","show_explained_query":"1","show_advanced":"1","show_advanced_tips":"1","expand_advanced":"0","show_date_filters":"0","sort_order":"relevance","sort_direction":"desc","highlight_terms":"1","opensearch_name":"","opensearch_description":"","batch_size":"50","memory_table_limit":30000,"title_multiplier":"1.7","text_multiplier":"0.7","meta_multiplier":"1.2","path_multiplier":"2.0","misc_multiplier":"0.3","stem":"1","stemmer":"snowball","enable_logging":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(28, 0, 'com_joomlaupdate', 'component', 'com_joomlaupdate', '', 1, 1, 0, 1, '{"name":"com_joomlaupdate","type":"component","creationDate":"February 2012","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.6.2","description":"COM_JOOMLAUPDATE_XML_DESCRIPTION","group":""}', '{"updatesource":"default","customurl":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(29, 0, 'com_tags', 'component', 'com_tags', '', 1, 1, 1, 1, '{"name":"com_tags","type":"component","creationDate":"December 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.0","description":"COM_TAGS_XML_DESCRIPTION","group":"","filename":"tags"}', '{"tag_layout":"_:default","save_history":"1","history_limit":5,"show_tag_title":"0","tag_list_show_tag_image":"0","tag_list_show_tag_description":"0","tag_list_image":"","tag_list_orderby":"title","tag_list_orderby_direction":"ASC","show_headings":"0","tag_list_show_date":"0","tag_list_show_item_image":"0","tag_list_show_item_description":"0","tag_list_item_maximum_characters":0,"return_any_or_all":"1","include_children":"0","maximum":200,"tag_list_language_filter":"all","tags_layout":"_:default","all_tags_orderby":"title","all_tags_orderby_direction":"ASC","all_tags_show_tag_image":"0","all_tags_show_tag_descripion":"0","all_tags_tag_maximum_characters":20,"all_tags_show_tag_hits":"0","filter_field":"1","show_pagination_limit":"1","show_pagination":"2","show_pagination_results":"1","tag_field_ajax_mode":"1","show_feed_link":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(30, 0, 'com_contenthistory', 'component', 'com_contenthistory', '', 1, 1, 1, 0, '{"name":"com_contenthistory","type":"component","creationDate":"May 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"COM_CONTENTHISTORY_XML_DESCRIPTION","group":"","filename":"contenthistory"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(31, 0, 'com_ajax', 'component', 'com_ajax', '', 1, 1, 1, 1, '{"name":"com_ajax","type":"component","creationDate":"August 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"COM_AJAX_XML_DESCRIPTION","group":"","filename":"ajax"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(32, 0, 'com_postinstall', 'component', 'com_postinstall', '', 1, 1, 1, 1, '{"name":"com_postinstall","type":"component","creationDate":"September 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"COM_POSTINSTALL_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(33, 0, 'com_fields', 'component', 'com_fields', '', 1, 1, 1, 0, '{"name":"com_fields","type":"component","creationDate":"March 2016","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"COM_FIELDS_XML_DESCRIPTION","group":"","filename":"fields"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(34, 0, 'com_associations', 'component', 'com_associations', '', 1, 1, 1, 0, '{"name":"com_associations","type":"component","creationDate":"Januar 2017","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"COM_ASSOCIATIONS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(102, 0, 'LIB_PHPUTF8', 'library', 'phputf8', '', 0, 1, 1, 1, '{"name":"LIB_PHPUTF8","type":"library","creationDate":"2006","author":"Harry Fuecks","copyright":"Copyright various authors","authorEmail":"hfuecks@gmail.com","authorUrl":"http:\\/\\/sourceforge.net\\/projects\\/phputf8","version":"0.5","description":"LIB_PHPUTF8_XML_DESCRIPTION","group":"","filename":"phputf8"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(103, 0, 'LIB_JOOMLA', 'library', 'joomla', '', 0, 1, 1, 1, '{"name":"LIB_JOOMLA","type":"library","creationDate":"2008","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"https:\\/\\/www.joomla.org","version":"13.1","description":"LIB_JOOMLA_XML_DESCRIPTION","group":"","filename":"joomla"}', '{"mediaversion":"d2826086cd1d761ac6f79d55109934f2"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(104, 0, 'LIB_IDNA', 'library', 'idna_convert', '', 0, 1, 1, 1, '{"name":"LIB_IDNA","type":"library","creationDate":"2004","author":"phlyLabs","copyright":"2004-2011 phlyLabs Berlin, http:\\/\\/phlylabs.de","authorEmail":"phlymail@phlylabs.de","authorUrl":"http:\\/\\/phlylabs.de","version":"0.8.0","description":"LIB_IDNA_XML_DESCRIPTION","group":"","filename":"idna_convert"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(105, 0, 'FOF', 'library', 'fof', '', 0, 1, 1, 1, '{"name":"FOF","type":"library","creationDate":"2015-04-22 13:15:32","author":"Nicholas K. Dionysopoulos \\/ Akeeba Ltd","copyright":"(C)2011-2015 Nicholas K. Dionysopoulos","authorEmail":"nicholas@akeebabackup.com","authorUrl":"https:\\/\\/www.akeebabackup.com","version":"2.4.3","description":"LIB_FOF_XML_DESCRIPTION","group":"","filename":"fof"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(106, 0, 'LIB_PHPASS', 'library', 'phpass', '', 0, 1, 1, 1, '{"name":"LIB_PHPASS","type":"library","creationDate":"2004-2006","author":"Solar Designer","copyright":"","authorEmail":"solar@openwall.com","authorUrl":"http:\\/\\/www.openwall.com\\/phpass\\/","version":"0.3","description":"LIB_PHPASS_XML_DESCRIPTION","group":"","filename":"phpass"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(200, 0, 'mod_articles_archive', 'module', 'mod_articles_archive', '', 0, 1, 1, 0, '{"name":"mod_articles_archive","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_ARCHIVE_XML_DESCRIPTION","group":"","filename":"mod_articles_archive"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(201, 0, 'mod_articles_latest', 'module', 'mod_articles_latest', '', 0, 1, 1, 0, '{"name":"mod_articles_latest","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LATEST_NEWS_XML_DESCRIPTION","group":"","filename":"mod_articles_latest"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(202, 0, 'mod_articles_popular', 'module', 'mod_articles_popular', '', 0, 1, 1, 0, '{"name":"mod_articles_popular","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_POPULAR_XML_DESCRIPTION","group":"","filename":"mod_articles_popular"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(203, 0, 'mod_banners', 'module', 'mod_banners', '', 0, 1, 1, 0, '{"name":"mod_banners","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_BANNERS_XML_DESCRIPTION","group":"","filename":"mod_banners"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(204, 0, 'mod_breadcrumbs', 'module', 'mod_breadcrumbs', '', 0, 1, 1, 1, '{"name":"mod_breadcrumbs","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_BREADCRUMBS_XML_DESCRIPTION","group":"","filename":"mod_breadcrumbs"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(205, 0, 'mod_custom', 'module', 'mod_custom', '', 0, 1, 1, 1, '{"name":"mod_custom","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_CUSTOM_XML_DESCRIPTION","group":"","filename":"mod_custom"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(206, 0, 'mod_feed', 'module', 'mod_feed', '', 0, 1, 1, 0, '{"name":"mod_feed","type":"module","creationDate":"July 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FEED_XML_DESCRIPTION","group":"","filename":"mod_feed"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(207, 0, 'mod_footer', 'module', 'mod_footer', '', 0, 1, 1, 0, '{"name":"mod_footer","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FOOTER_XML_DESCRIPTION","group":"","filename":"mod_footer"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(208, 0, 'mod_login', 'module', 'mod_login', '', 0, 1, 1, 1, '{"name":"mod_login","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LOGIN_XML_DESCRIPTION","group":"","filename":"mod_login"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(209, 0, 'mod_menu', 'module', 'mod_menu', '', 0, 1, 1, 1, '{"name":"mod_menu","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_MENU_XML_DESCRIPTION","group":"","filename":"mod_menu"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(210, 0, 'mod_articles_news', 'module', 'mod_articles_news', '', 0, 1, 1, 0, '{"name":"mod_articles_news","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_NEWS_XML_DESCRIPTION","group":"","filename":"mod_articles_news"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(211, 0, 'mod_random_image', 'module', 'mod_random_image', '', 0, 1, 1, 0, '{"name":"mod_random_image","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_RANDOM_IMAGE_XML_DESCRIPTION","group":"","filename":"mod_random_image"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(212, 0, 'mod_related_items', 'module', 'mod_related_items', '', 0, 1, 1, 0, '{"name":"mod_related_items","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_RELATED_XML_DESCRIPTION","group":"","filename":"mod_related_items"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(213, 0, 'mod_search', 'module', 'mod_search', '', 0, 1, 1, 0, '{"name":"mod_search","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_SEARCH_XML_DESCRIPTION","group":"","filename":"mod_search"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(214, 0, 'mod_stats', 'module', 'mod_stats', '', 0, 1, 1, 0, '{"name":"mod_stats","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_STATS_XML_DESCRIPTION","group":"","filename":"mod_stats"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(215, 0, 'mod_syndicate', 'module', 'mod_syndicate', '', 0, 1, 1, 1, '{"name":"mod_syndicate","type":"module","creationDate":"May 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_SYNDICATE_XML_DESCRIPTION","group":"","filename":"mod_syndicate"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(216, 0, 'mod_users_latest', 'module', 'mod_users_latest', '', 0, 1, 1, 0, '{"name":"mod_users_latest","type":"module","creationDate":"December 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_USERS_LATEST_XML_DESCRIPTION","group":"","filename":"mod_users_latest"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(218, 0, 'mod_whosonline', 'module', 'mod_whosonline', '', 0, 1, 1, 0, '{"name":"mod_whosonline","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_WHOSONLINE_XML_DESCRIPTION","group":"","filename":"mod_whosonline"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(219, 0, 'mod_wrapper', 'module', 'mod_wrapper', '', 0, 1, 1, 0, '{"name":"mod_wrapper","type":"module","creationDate":"October 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_WRAPPER_XML_DESCRIPTION","group":"","filename":"mod_wrapper"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(220, 0, 'mod_articles_category', 'module', 'mod_articles_category', '', 0, 1, 1, 0, '{"name":"mod_articles_category","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_CATEGORY_XML_DESCRIPTION","group":"","filename":"mod_articles_category"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(221, 0, 'mod_articles_categories', 'module', 'mod_articles_categories', '', 0, 1, 1, 0, '{"name":"mod_articles_categories","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_CATEGORIES_XML_DESCRIPTION","group":"","filename":"mod_articles_categories"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(222, 0, 'mod_languages', 'module', 'mod_languages', '', 0, 1, 1, 1, '{"name":"mod_languages","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.5.0","description":"MOD_LANGUAGES_XML_DESCRIPTION","group":"","filename":"mod_languages"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(223, 0, 'mod_finder', 'module', 'mod_finder', '', 0, 1, 0, 0, '{"name":"mod_finder","type":"module","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FINDER_XML_DESCRIPTION","group":"","filename":"mod_finder"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(300, 0, 'mod_custom', 'module', 'mod_custom', '', 1, 1, 1, 1, '{"name":"mod_custom","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_CUSTOM_XML_DESCRIPTION","group":"","filename":"mod_custom"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(301, 0, 'mod_feed', 'module', 'mod_feed', '', 1, 1, 1, 0, '{"name":"mod_feed","type":"module","creationDate":"July 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FEED_XML_DESCRIPTION","group":"","filename":"mod_feed"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(302, 0, 'mod_latest', 'module', 'mod_latest', '', 1, 1, 1, 0, '{"name":"mod_latest","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LATEST_XML_DESCRIPTION","group":"","filename":"mod_latest"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(303, 0, 'mod_logged', 'module', 'mod_logged', '', 1, 1, 1, 0, '{"name":"mod_logged","type":"module","creationDate":"January 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LOGGED_XML_DESCRIPTION","group":"","filename":"mod_logged"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(304, 0, 'mod_login', 'module', 'mod_login', '', 1, 1, 1, 1, '{"name":"mod_login","type":"module","creationDate":"March 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LOGIN_XML_DESCRIPTION","group":"","filename":"mod_login"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(305, 0, 'mod_menu', 'module', 'mod_menu', '', 1, 1, 1, 0, '{"name":"mod_menu","type":"module","creationDate":"March 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_MENU_XML_DESCRIPTION","group":"","filename":"mod_menu"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(307, 0, 'mod_popular', 'module', 'mod_popular', '', 1, 1, 1, 0, '{"name":"mod_popular","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_POPULAR_XML_DESCRIPTION","group":"","filename":"mod_popular"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(308, 0, 'mod_quickicon', 'module', 'mod_quickicon', '', 1, 1, 1, 1, '{"name":"mod_quickicon","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_QUICKICON_XML_DESCRIPTION","group":"","filename":"mod_quickicon"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(309, 0, 'mod_status', 'module', 'mod_status', '', 1, 1, 1, 0, '{"name":"mod_status","type":"module","creationDate":"Feb 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_STATUS_XML_DESCRIPTION","group":"","filename":"mod_status"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(310, 0, 'mod_submenu', 'module', 'mod_submenu', '', 1, 1, 1, 0, '{"name":"mod_submenu","type":"module","creationDate":"Feb 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_SUBMENU_XML_DESCRIPTION","group":"","filename":"mod_submenu"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(311, 0, 'mod_title', 'module', 'mod_title', '', 1, 1, 1, 0, '{"name":"mod_title","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_TITLE_XML_DESCRIPTION","group":"","filename":"mod_title"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(312, 0, 'mod_toolbar', 'module', 'mod_toolbar', '', 1, 1, 1, 1, '{"name":"mod_toolbar","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_TOOLBAR_XML_DESCRIPTION","group":"","filename":"mod_toolbar"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(313, 0, 'mod_multilangstatus', 'module', 'mod_multilangstatus', '', 1, 1, 1, 0, '{"name":"mod_multilangstatus","type":"module","creationDate":"September 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_MULTILANGSTATUS_XML_DESCRIPTION","group":"","filename":"mod_multilangstatus"}', '{"cache":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(314, 0, 'mod_version', 'module', 'mod_version', '', 1, 1, 1, 0, '{"name":"mod_version","type":"module","creationDate":"January 2012","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_VERSION_XML_DESCRIPTION","group":"","filename":"mod_version"}', '{"format":"short","product":"1","cache":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(315, 0, 'mod_stats_admin', 'module', 'mod_stats_admin', '', 1, 1, 1, 0, '{"name":"mod_stats_admin","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_STATS_XML_DESCRIPTION","group":"","filename":"mod_stats_admin"}', '{"serverinfo":"0","siteinfo":"0","counter":"0","increase":"0","cache":"1","cache_time":"900","cachemode":"static"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(316, 0, 'mod_tags_popular', 'module', 'mod_tags_popular', '', 0, 1, 1, 0, '{"name":"mod_tags_popular","type":"module","creationDate":"January 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.0","description":"MOD_TAGS_POPULAR_XML_DESCRIPTION","group":"","filename":"mod_tags_popular"}', '{"maximum":"5","timeframe":"alltime","owncache":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(317, 0, 'mod_tags_similar', 'module', 'mod_tags_similar', '', 0, 1, 1, 0, '{"name":"mod_tags_similar","type":"module","creationDate":"January 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.0","description":"MOD_TAGS_SIMILAR_XML_DESCRIPTION","group":"","filename":"mod_tags_similar"}', '{"maximum":"5","matchtype":"any","owncache":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(318, 0, 'mod_sampledata', 'module', 'mod_sampledata', '', 1, 1, 1, 0, '{"name":"mod_sampledata","type":"module","creationDate":"July 2017","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.8.0","description":"MOD_SAMPLEDATA_XML_DESCRIPTION","group":"","filename":"mod_sampledata"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(400, 0, 'plg_authentication_gmail', 'plugin', 'gmail', 'authentication', 0, 0, 1, 0, '{"name":"plg_authentication_gmail","type":"plugin","creationDate":"February 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_GMAIL_XML_DESCRIPTION","group":"","filename":"gmail"}', '{"applysuffix":"0","suffix":"","verifypeer":"1","user_blacklist":""}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(401, 0, 'plg_authentication_joomla', 'plugin', 'joomla', 'authentication', 0, 1, 1, 1, '{"name":"plg_authentication_joomla","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_AUTH_JOOMLA_XML_DESCRIPTION","group":"","filename":"joomla"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(402, 0, 'plg_authentication_ldap', 'plugin', 'ldap', 'authentication', 0, 0, 1, 0, '{"name":"plg_authentication_ldap","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_LDAP_XML_DESCRIPTION","group":"","filename":"ldap"}', '{"host":"","port":"389","use_ldapV3":"0","negotiate_tls":"0","no_referrals":"0","auth_method":"bind","base_dn":"","search_string":"","users_dn":"","username":"admin","password":"bobby7","ldap_fullname":"fullName","ldap_email":"mail","ldap_uid":"uid"}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(403, 0, 'plg_content_contact', 'plugin', 'contact', 'content', 0, 1, 1, 0, '{"name":"plg_content_contact","type":"plugin","creationDate":"January 2014","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.2","description":"PLG_CONTENT_CONTACT_XML_DESCRIPTION","group":"","filename":"contact"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(404, 0, 'plg_content_emailcloak', 'plugin', 'emailcloak', 'content', 0, 1, 1, 0, '{"name":"plg_content_emailcloak","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_EMAILCLOAK_XML_DESCRIPTION","group":"","filename":"emailcloak"}', '{"mode":"1"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(406, 0, 'plg_content_loadmodule', 'plugin', 'loadmodule', 'content', 0, 1, 1, 0, '{"name":"plg_content_loadmodule","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_LOADMODULE_XML_DESCRIPTION","group":"","filename":"loadmodule"}', '{"style":"xhtml"}', '', '', 0, '2011-09-18 15:22:50', 0, 0),
(407, 0, 'plg_content_pagebreak', 'plugin', 'pagebreak', 'content', 0, 1, 1, 0, '{"name":"plg_content_pagebreak","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_PAGEBREAK_XML_DESCRIPTION","group":"","filename":"pagebreak"}', '{"title":"1","multipage_toc":"1","showall":"1"}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(408, 0, 'plg_content_pagenavigation', 'plugin', 'pagenavigation', 'content', 0, 1, 1, 0, '{"name":"plg_content_pagenavigation","type":"plugin","creationDate":"January 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_PAGENAVIGATION_XML_DESCRIPTION","group":"","filename":"pagenavigation"}', '{"position":"1"}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(409, 0, 'plg_content_vote', 'plugin', 'vote', 'content', 0, 0, 1, 0, '{"name":"plg_content_vote","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_VOTE_XML_DESCRIPTION","group":"","filename":"vote"}', '', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(410, 0, 'plg_editors_codemirror', 'plugin', 'codemirror', 'editors', 0, 1, 1, 1, '{"name":"plg_editors_codemirror","type":"plugin","creationDate":"28 March 2011","author":"Marijn Haverbeke","copyright":"Copyright (C) 2014 - 2017 by Marijn Haverbeke <marijnh@gmail.com> and others","authorEmail":"marijnh@gmail.com","authorUrl":"http:\\/\\/codemirror.net\\/","version":"5.38.0","description":"PLG_CODEMIRROR_XML_DESCRIPTION","group":"","filename":"codemirror"}', '{"lineNumbers":"1","lineWrapping":"1","matchTags":"1","matchBrackets":"1","marker-gutter":"1","autoCloseTags":"1","autoCloseBrackets":"1","autoFocus":"1","theme":"default","tabmode":"indent"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(411, 0, 'plg_editors_none', 'plugin', 'none', 'editors', 0, 1, 1, 1, '{"name":"plg_editors_none","type":"plugin","creationDate":"September 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_NONE_XML_DESCRIPTION","group":"","filename":"none"}', '', '', '', 0, '0000-00-00 00:00:00', 2, 0);
INSERT INTO `uoj7s_extensions` (`extension_id`, `package_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(412, 0, 'plg_editors_tinymce', 'plugin', 'tinymce', 'editors', 0, 1, 1, 0, '{"name":"plg_editors_tinymce","type":"plugin","creationDate":"2005-2017","author":"Ephox Corporation","copyright":"Ephox Corporation","authorEmail":"N\\/A","authorUrl":"http:\\/\\/www.tinymce.com","version":"4.5.8","description":"PLG_TINY_XML_DESCRIPTION","group":"","filename":"tinymce"}', '{"configuration":{"toolbars":{"2":{"toolbar1":["bold","underline","strikethrough","|","undo","redo","|","bullist","numlist","|","pastetext"]},"1":{"menu":["edit","insert","view","format","table","tools"],"toolbar1":["bold","italic","underline","strikethrough","|","alignleft","aligncenter","alignright","alignjustify","|","formatselect","|","bullist","numlist","|","outdent","indent","|","undo","redo","|","link","unlink","anchor","code","|","hr","table","|","subscript","superscript","|","charmap","pastetext","preview"]},"0":{"menu":["edit","insert","view","format","table","tools"],"toolbar1":["bold","italic","underline","strikethrough","|","alignleft","aligncenter","alignright","alignjustify","|","styleselect","|","formatselect","fontselect","fontsizeselect","|","searchreplace","|","bullist","numlist","|","outdent","indent","|","undo","redo","|","link","unlink","anchor","image","|","code","|","forecolor","backcolor","|","fullscreen","|","table","|","subscript","superscript","|","charmap","emoticons","media","hr","ltr","rtl","|","cut","copy","paste","pastetext","|","visualchars","visualblocks","nonbreaking","blockquote","template","|","print","preview","codesample","insertdatetime","removeformat"]}},"setoptions":{"2":{"access":["1"],"skin":"0","skin_admin":"0","mobile":"0","drag_drop":"1","path":"","entity_encoding":"raw","lang_mode":"1","text_direction":"ltr","content_css":"1","content_css_custom":"","relative_urls":"1","newlines":"0","use_config_textfilters":"0","invalid_elements":"script,applet,iframe","valid_elements":"","extended_elements":"","resizing":"1","resize_horizontal":"1","element_path":"1","wordcount":"1","image_advtab":"0","advlist":"1","autosave":"1","contextmenu":"1","custom_plugin":"","custom_button":""},"1":{"access":["6","2"],"skin":"0","skin_admin":"0","mobile":"0","drag_drop":"1","path":"","entity_encoding":"raw","lang_mode":"1","text_direction":"ltr","content_css":"1","content_css_custom":"","relative_urls":"1","newlines":"0","use_config_textfilters":"0","invalid_elements":"script,applet,iframe","valid_elements":"","extended_elements":"","resizing":"1","resize_horizontal":"1","element_path":"1","wordcount":"1","image_advtab":"0","advlist":"1","autosave":"1","contextmenu":"1","custom_plugin":"","custom_button":""},"0":{"access":["7","4","8"],"skin":"0","skin_admin":"0","mobile":"0","drag_drop":"1","path":"","entity_encoding":"raw","lang_mode":"1","text_direction":"ltr","content_css":"1","content_css_custom":"","relative_urls":"1","newlines":"0","use_config_textfilters":"0","invalid_elements":"script,applet,iframe","valid_elements":"","extended_elements":"","resizing":"1","resize_horizontal":"1","element_path":"1","wordcount":"1","image_advtab":"1","advlist":"1","autosave":"1","contextmenu":"1","custom_plugin":"","custom_button":""}}},"sets_amount":3,"html_height":"550","html_width":"750"}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(413, 0, 'plg_editors-xtd_article', 'plugin', 'article', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_article","type":"plugin","creationDate":"October 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_ARTICLE_XML_DESCRIPTION","group":"","filename":"article"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(414, 0, 'plg_editors-xtd_image', 'plugin', 'image', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_image","type":"plugin","creationDate":"August 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_IMAGE_XML_DESCRIPTION","group":"","filename":"image"}', '', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(415, 0, 'plg_editors-xtd_pagebreak', 'plugin', 'pagebreak', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_pagebreak","type":"plugin","creationDate":"August 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_EDITORSXTD_PAGEBREAK_XML_DESCRIPTION","group":"","filename":"pagebreak"}', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(416, 0, 'plg_editors-xtd_readmore', 'plugin', 'readmore', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_readmore","type":"plugin","creationDate":"March 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_READMORE_XML_DESCRIPTION","group":"","filename":"readmore"}', '', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(417, 0, 'plg_search_categories', 'plugin', 'categories', 'search', 0, 1, 1, 0, '{"name":"plg_search_categories","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_CATEGORIES_XML_DESCRIPTION","group":"","filename":"categories"}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(418, 0, 'plg_search_contacts', 'plugin', 'contacts', 'search', 0, 1, 1, 0, '{"name":"plg_search_contacts","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_CONTACTS_XML_DESCRIPTION","group":"","filename":"contacts"}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(419, 0, 'plg_search_content', 'plugin', 'content', 'search', 0, 1, 1, 0, '{"name":"plg_search_content","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_CONTENT_XML_DESCRIPTION","group":"","filename":"content"}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(420, 0, 'plg_search_newsfeeds', 'plugin', 'newsfeeds', 'search', 0, 1, 1, 0, '{"name":"plg_search_newsfeeds","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_NEWSFEEDS_XML_DESCRIPTION","group":"","filename":"newsfeeds"}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(422, 0, 'plg_system_languagefilter', 'plugin', 'languagefilter', 'system', 0, 0, 1, 1, '{"name":"plg_system_languagefilter","type":"plugin","creationDate":"July 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_LANGUAGEFILTER_XML_DESCRIPTION","group":"","filename":"languagefilter"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(423, 0, 'plg_system_p3p', 'plugin', 'p3p', 'system', 0, 0, 1, 0, '{"name":"plg_system_p3p","type":"plugin","creationDate":"September 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_P3P_XML_DESCRIPTION","group":"","filename":"p3p"}', '{"headers":"NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(424, 0, 'plg_system_cache', 'plugin', 'cache', 'system', 0, 0, 1, 1, '{"name":"plg_system_cache","type":"plugin","creationDate":"February 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CACHE_XML_DESCRIPTION","group":"","filename":"cache"}', '{"browsercache":"0","cachetime":"15"}', '', '', 0, '0000-00-00 00:00:00', 9, 0),
(425, 0, 'plg_system_debug', 'plugin', 'debug', 'system', 0, 1, 1, 0, '{"name":"plg_system_debug","type":"plugin","creationDate":"December 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_DEBUG_XML_DESCRIPTION","group":"","filename":"debug"}', '{"profile":"1","queries":"1","memory":"1","language_files":"1","language_strings":"1","strip-first":"1","strip-prefix":"","strip-suffix":""}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(426, 0, 'plg_system_log', 'plugin', 'log', 'system', 0, 1, 1, 1, '{"name":"plg_system_log","type":"plugin","creationDate":"April 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_LOG_XML_DESCRIPTION","group":"","filename":"log"}', '', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(427, 0, 'plg_system_redirect', 'plugin', 'redirect', 'system', 0, 0, 1, 1, '{"name":"plg_system_redirect","type":"plugin","creationDate":"April 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_REDIRECT_XML_DESCRIPTION","group":"","filename":"redirect"}', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(428, 0, 'plg_system_remember', 'plugin', 'remember', 'system', 0, 1, 1, 1, '{"name":"plg_system_remember","type":"plugin","creationDate":"April 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_REMEMBER_XML_DESCRIPTION","group":"","filename":"remember"}', '', '', '', 0, '0000-00-00 00:00:00', 7, 0),
(429, 0, 'plg_system_sef', 'plugin', 'sef', 'system', 0, 1, 1, 0, '{"name":"plg_system_sef","type":"plugin","creationDate":"December 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEF_XML_DESCRIPTION","group":"","filename":"sef"}', '', '', '', 0, '0000-00-00 00:00:00', 8, 0),
(430, 0, 'plg_system_logout', 'plugin', 'logout', 'system', 0, 1, 1, 1, '{"name":"plg_system_logout","type":"plugin","creationDate":"April 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_LOGOUT_XML_DESCRIPTION","group":"","filename":"logout"}', '', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(431, 0, 'plg_user_contactcreator', 'plugin', 'contactcreator', 'user', 0, 0, 1, 0, '{"name":"plg_user_contactcreator","type":"plugin","creationDate":"August 2009","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTACTCREATOR_XML_DESCRIPTION","group":"","filename":"contactcreator"}', '{"autowebpage":"","category":"34","autopublish":"0"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(432, 0, 'plg_user_joomla', 'plugin', 'joomla', 'user', 0, 1, 1, 0, '{"name":"plg_user_joomla","type":"plugin","creationDate":"December 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_USER_JOOMLA_XML_DESCRIPTION","group":"","filename":"joomla"}', '{"autoregister":"1","mail_to_user":"1","forceLogout":"1"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(433, 0, 'plg_user_profile', 'plugin', 'profile', 'user', 0, 0, 1, 0, '{"name":"plg_user_profile","type":"plugin","creationDate":"January 2008","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_USER_PROFILE_XML_DESCRIPTION","group":"","filename":"profile"}', '{"register-require_address1":"1","register-require_address2":"1","register-require_city":"1","register-require_region":"1","register-require_country":"1","register-require_postal_code":"1","register-require_phone":"1","register-require_website":"1","register-require_favoritebook":"1","register-require_aboutme":"1","register-require_tos":"1","register-require_dob":"1","profile-require_address1":"1","profile-require_address2":"1","profile-require_city":"1","profile-require_region":"1","profile-require_country":"1","profile-require_postal_code":"1","profile-require_phone":"1","profile-require_website":"1","profile-require_favoritebook":"1","profile-require_aboutme":"1","profile-require_tos":"1","profile-require_dob":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(434, 0, 'plg_extension_joomla', 'plugin', 'joomla', 'extension', 0, 1, 1, 1, '{"name":"plg_extension_joomla","type":"plugin","creationDate":"May 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_EXTENSION_JOOMLA_XML_DESCRIPTION","group":"","filename":"joomla"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(435, 0, 'plg_content_joomla', 'plugin', 'joomla', 'content', 0, 1, 1, 0, '{"name":"plg_content_joomla","type":"plugin","creationDate":"November 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_JOOMLA_XML_DESCRIPTION","group":"","filename":"joomla"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(436, 0, 'plg_system_languagecode', 'plugin', 'languagecode', 'system', 0, 0, 1, 0, '{"name":"plg_system_languagecode","type":"plugin","creationDate":"November 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_LANGUAGECODE_XML_DESCRIPTION","group":"","filename":"languagecode"}', '', '', '', 0, '0000-00-00 00:00:00', 10, 0),
(437, 0, 'plg_quickicon_joomlaupdate', 'plugin', 'joomlaupdate', 'quickicon', 0, 1, 1, 1, '{"name":"plg_quickicon_joomlaupdate","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_QUICKICON_JOOMLAUPDATE_XML_DESCRIPTION","group":"","filename":"joomlaupdate"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(438, 0, 'plg_quickicon_extensionupdate', 'plugin', 'extensionupdate', 'quickicon', 0, 1, 1, 1, '{"name":"plg_quickicon_extensionupdate","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_QUICKICON_EXTENSIONUPDATE_XML_DESCRIPTION","group":"","filename":"extensionupdate"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(439, 0, 'plg_captcha_recaptcha', 'plugin', 'recaptcha', 'captcha', 0, 0, 1, 0, '{"name":"plg_captcha_recaptcha","type":"plugin","creationDate":"December 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.4.0","description":"PLG_CAPTCHA_RECAPTCHA_XML_DESCRIPTION","group":"","filename":"recaptcha"}', '{"public_key":"","private_key":"","theme":"clean"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(440, 0, 'plg_system_highlight', 'plugin', 'highlight', 'system', 0, 1, 1, 0, '{"name":"plg_system_highlight","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_HIGHLIGHT_XML_DESCRIPTION","group":"","filename":"highlight"}', '', '', '', 0, '0000-00-00 00:00:00', 7, 0),
(441, 0, 'plg_content_finder', 'plugin', 'finder', 'content', 0, 0, 1, 0, '{"name":"plg_content_finder","type":"plugin","creationDate":"December 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_FINDER_XML_DESCRIPTION","group":"","filename":"finder"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(442, 0, 'plg_finder_categories', 'plugin', 'categories', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_categories","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_CATEGORIES_XML_DESCRIPTION","group":"","filename":"categories"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(443, 0, 'plg_finder_contacts', 'plugin', 'contacts', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_contacts","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_CONTACTS_XML_DESCRIPTION","group":"","filename":"contacts"}', '', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(444, 0, 'plg_finder_content', 'plugin', 'content', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_content","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_CONTENT_XML_DESCRIPTION","group":"","filename":"content"}', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(445, 0, 'plg_finder_newsfeeds', 'plugin', 'newsfeeds', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_newsfeeds","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_NEWSFEEDS_XML_DESCRIPTION","group":"","filename":"newsfeeds"}', '', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(447, 0, 'plg_finder_tags', 'plugin', 'tags', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_tags","type":"plugin","creationDate":"February 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_TAGS_XML_DESCRIPTION","group":"","filename":"tags"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(448, 0, 'plg_twofactorauth_totp', 'plugin', 'totp', 'twofactorauth', 0, 0, 1, 0, '{"name":"plg_twofactorauth_totp","type":"plugin","creationDate":"August 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"PLG_TWOFACTORAUTH_TOTP_XML_DESCRIPTION","group":"","filename":"totp"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(449, 0, 'plg_authentication_cookie', 'plugin', 'cookie', 'authentication', 0, 1, 1, 0, '{"name":"plg_authentication_cookie","type":"plugin","creationDate":"July 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_AUTH_COOKIE_XML_DESCRIPTION","group":"","filename":"cookie"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(450, 0, 'plg_twofactorauth_yubikey', 'plugin', 'yubikey', 'twofactorauth', 0, 0, 1, 0, '{"name":"plg_twofactorauth_yubikey","type":"plugin","creationDate":"September 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"PLG_TWOFACTORAUTH_YUBIKEY_XML_DESCRIPTION","group":"","filename":"yubikey"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(451, 0, 'plg_search_tags', 'plugin', 'tags', 'search', 0, 1, 1, 0, '{"name":"plg_search_tags","type":"plugin","creationDate":"March 2014","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_TAGS_XML_DESCRIPTION","group":"","filename":"tags"}', '{"search_limit":"50","show_tagged_items":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(452, 0, 'plg_system_updatenotification', 'plugin', 'updatenotification', 'system', 0, 1, 1, 0, '{"name":"plg_system_updatenotification","type":"plugin","creationDate":"May 2015","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.5.0","description":"PLG_SYSTEM_UPDATENOTIFICATION_XML_DESCRIPTION","group":"","filename":"updatenotification"}', '{"lastrun":1530742984}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(453, 0, 'plg_editors-xtd_module', 'plugin', 'module', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_module","type":"plugin","creationDate":"October 2015","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.5.0","description":"PLG_MODULE_XML_DESCRIPTION","group":"","filename":"module"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(454, 0, 'plg_system_stats', 'plugin', 'stats', 'system', 0, 1, 1, 0, '{"name":"plg_system_stats","type":"plugin","creationDate":"November 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.5.0","description":"PLG_SYSTEM_STATS_XML_DESCRIPTION","group":"","filename":"stats"}', '{"mode":1,"lastrun":1530759726,"unique_id":"b62c44126c5fe897eea56bf87536aa3ad86deac4","interval":12}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(455, 0, 'plg_installer_packageinstaller', 'plugin', 'packageinstaller', 'installer', 0, 1, 1, 1, '{"name":"plg_installer_packageinstaller","type":"plugin","creationDate":"May 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.6.0","description":"PLG_INSTALLER_PACKAGEINSTALLER_PLUGIN_XML_DESCRIPTION","group":"","filename":"packageinstaller"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(456, 0, 'PLG_INSTALLER_FOLDERINSTALLER', 'plugin', 'folderinstaller', 'installer', 0, 1, 1, 1, '{"name":"PLG_INSTALLER_FOLDERINSTALLER","type":"plugin","creationDate":"May 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.6.0","description":"PLG_INSTALLER_FOLDERINSTALLER_PLUGIN_XML_DESCRIPTION","group":"","filename":"folderinstaller"}', '', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(457, 0, 'PLG_INSTALLER_URLINSTALLER', 'plugin', 'urlinstaller', 'installer', 0, 1, 1, 1, '{"name":"PLG_INSTALLER_URLINSTALLER","type":"plugin","creationDate":"May 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.6.0","description":"PLG_INSTALLER_URLINSTALLER_PLUGIN_XML_DESCRIPTION","group":"","filename":"urlinstaller"}', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(458, 0, 'plg_quickicon_phpversioncheck', 'plugin', 'phpversioncheck', 'quickicon', 0, 1, 1, 1, '{"name":"plg_quickicon_phpversioncheck","type":"plugin","creationDate":"August 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_QUICKICON_PHPVERSIONCHECK_XML_DESCRIPTION","group":"","filename":"phpversioncheck"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(459, 0, 'plg_editors-xtd_menu', 'plugin', 'menu', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_menu","type":"plugin","creationDate":"August 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_EDITORS-XTD_MENU_XML_DESCRIPTION","group":"","filename":"menu"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(460, 0, 'plg_editors-xtd_contact', 'plugin', 'contact', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_contact","type":"plugin","creationDate":"October 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_EDITORS-XTD_CONTACT_XML_DESCRIPTION","group":"","filename":"contact"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(461, 0, 'plg_system_fields', 'plugin', 'fields', 'system', 0, 1, 1, 0, '{"name":"plg_system_fields","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_SYSTEM_FIELDS_XML_DESCRIPTION","group":"","filename":"fields"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(462, 0, 'plg_fields_calendar', 'plugin', 'calendar', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_calendar","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_CALENDAR_XML_DESCRIPTION","group":"","filename":"calendar"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(463, 0, 'plg_fields_checkboxes', 'plugin', 'checkboxes', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_checkboxes","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_CHECKBOXES_XML_DESCRIPTION","group":"","filename":"checkboxes"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(464, 0, 'plg_fields_color', 'plugin', 'color', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_color","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_COLOR_XML_DESCRIPTION","group":"","filename":"color"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(465, 0, 'plg_fields_editor', 'plugin', 'editor', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_editor","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_EDITOR_XML_DESCRIPTION","group":"","filename":"editor"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(466, 0, 'plg_fields_imagelist', 'plugin', 'imagelist', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_imagelist","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_IMAGELIST_XML_DESCRIPTION","group":"","filename":"imagelist"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(467, 0, 'plg_fields_integer', 'plugin', 'integer', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_integer","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_INTEGER_XML_DESCRIPTION","group":"","filename":"integer"}', '{"multiple":"0","first":"1","last":"100","step":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(468, 0, 'plg_fields_list', 'plugin', 'list', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_list","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_LIST_XML_DESCRIPTION","group":"","filename":"list"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(469, 0, 'plg_fields_media', 'plugin', 'media', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_media","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_MEDIA_XML_DESCRIPTION","group":"","filename":"media"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(470, 0, 'plg_fields_radio', 'plugin', 'radio', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_radio","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_RADIO_XML_DESCRIPTION","group":"","filename":"radio"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(471, 0, 'plg_fields_sql', 'plugin', 'sql', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_sql","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_SQL_XML_DESCRIPTION","group":"","filename":"sql"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(472, 0, 'plg_fields_text', 'plugin', 'text', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_text","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_TEXT_XML_DESCRIPTION","group":"","filename":"text"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(473, 0, 'plg_fields_textarea', 'plugin', 'textarea', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_textarea","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_TEXTAREA_XML_DESCRIPTION","group":"","filename":"textarea"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(474, 0, 'plg_fields_url', 'plugin', 'url', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_url","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_URL_XML_DESCRIPTION","group":"","filename":"url"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(475, 0, 'plg_fields_user', 'plugin', 'user', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_user","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_USER_XML_DESCRIPTION","group":"","filename":"user"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(476, 0, 'plg_fields_usergrouplist', 'plugin', 'usergrouplist', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_usergrouplist","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_USERGROUPLIST_XML_DESCRIPTION","group":"","filename":"usergrouplist"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(477, 0, 'plg_content_fields', 'plugin', 'fields', 'content', 0, 1, 1, 0, '{"name":"plg_content_fields","type":"plugin","creationDate":"February 2017","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_CONTENT_FIELDS_XML_DESCRIPTION","group":"","filename":"fields"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(478, 0, 'plg_editors-xtd_fields', 'plugin', 'fields', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_fields","type":"plugin","creationDate":"February 2017","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_EDITORS-XTD_FIELDS_XML_DESCRIPTION","group":"","filename":"fields"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(479, 0, 'plg_sampledata_blog', 'plugin', 'blog', 'sampledata', 0, 1, 1, 0, '{"name":"plg_sampledata_blog","type":"plugin","creationDate":"July 2017","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.8.0","description":"PLG_SAMPLEDATA_BLOG_XML_DESCRIPTION","group":"","filename":"blog"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(480, 0, 'plg_system_sessiongc', 'plugin', 'sessiongc', 'system', 0, 1, 1, 0, '{"name":"plg_system_sessiongc","type":"plugin","creationDate":"February 2018","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.8.6","description":"PLG_SYSTEM_SESSIONGC_XML_DESCRIPTION","group":"","filename":"sessiongc"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(503, 0, 'beez3', 'template', 'beez3', '', 0, 1, 1, 0, '{"name":"beez3","type":"template","creationDate":"25 November 2009","author":"Angie Radtke","copyright":"Copyright (C) 2005 - 2018 Open Source Matters, Inc. All rights reserved.","authorEmail":"a.radtke@derauftritt.de","authorUrl":"http:\\/\\/www.der-auftritt.de","version":"3.1.0","description":"TPL_BEEZ3_XML_DESCRIPTION","group":"","filename":"templateDetails"}', '{"wrapperSmall":"53","wrapperLarge":"72","sitetitle":"","sitedescription":"","navposition":"center","templatecolor":"nature"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(504, 0, 'hathor', 'template', 'hathor', '', 1, 1, 1, 0, '{"name":"hathor","type":"template","creationDate":"May 2010","author":"Andrea Tarr","copyright":"Copyright (C) 2005 - 2018 Open Source Matters, Inc. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"","version":"3.0.0","description":"TPL_HATHOR_XML_DESCRIPTION","group":"","filename":"templateDetails"}', '{"showSiteName":"0","colourChoice":"0","boldText":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(506, 0, 'protostar', 'template', 'protostar', '', 0, 1, 1, 0, '{"name":"protostar","type":"template","creationDate":"4\\/30\\/2012","author":"Kyle Ledbetter","copyright":"Copyright (C) 2005 - 2018 Open Source Matters, Inc. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"","version":"1.0","description":"TPL_PROTOSTAR_XML_DESCRIPTION","group":"","filename":"templateDetails"}', '{"templateColor":"","logoFile":"","googleFont":"1","googleFontName":"Open+Sans","fluidContainer":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(507, 0, 'isis', 'template', 'isis', '', 1, 1, 1, 0, '{"name":"isis","type":"template","creationDate":"3\\/30\\/2012","author":"Kyle Ledbetter","copyright":"Copyright (C) 2005 - 2018 Open Source Matters, Inc. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"","version":"1.0","description":"TPL_ISIS_XML_DESCRIPTION","group":"","filename":"templateDetails"}', '{"templateColor":"","logoFile":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(600, 802, 'English (en-GB)', 'language', 'en-GB', '', 0, 1, 1, 1, '{"name":"English (en-GB)","type":"language","creationDate":"June 2018","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.8.10","description":"en-GB site language","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(601, 802, 'English (en-GB)', 'language', 'en-GB', '', 1, 1, 1, 1, '{"name":"English (en-GB)","type":"language","creationDate":"June 2018","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.8.10","description":"en-GB administrator language","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(700, 0, 'files_joomla', 'file', 'joomla', '', 0, 1, 1, 1, '{"name":"files_joomla","type":"file","creationDate":"June 2018","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.8.10","description":"FILES_JOOMLA_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(802, 0, 'English (en-GB) Language Pack', 'package', 'pkg_en-GB', '', 0, 1, 1, 1, '{"name":"English (en-GB) Language Pack","type":"package","creationDate":"June 2018","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters, Inc. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.8.10.1","description":"en-GB language pack","group":"","filename":"pkg_en-GB"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10000, 0, 'plg_installer_webinstaller', 'plugin', 'webinstaller', 'installer', 0, 1, 1, 0, '{"name":"plg_installer_webinstaller","type":"plugin","creationDate":"28 April 2017","author":"Joomla! Project","copyright":"Copyright (C) 2013-2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.1.1","description":"PLG_INSTALLER_WEBINSTALLER_XML_DESCRIPTION","group":"","filename":"webinstaller"}', '{"tab_position":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10001, 10009, 'COM_JCE', 'component', 'com_jce', '', 1, 1, 0, 0, '{"name":"COM_JCE","type":"component","creationDate":"21-06-2018","author":"Ryan Demmer","copyright":"Copyright (C) 2006 - 2018 Ryan Demmer. All rights reserved","authorEmail":"info@joomlacontenteditor.net","authorUrl":"www.joomlacontenteditor.net","version":"2.6.31","description":"COM_JCE_XML_DESCRIPTION","group":"","filename":"jce"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10002, 10009, 'plg_editors_jce', 'plugin', 'jce', 'editors', 0, 1, 1, 0, '{"name":"plg_editors_jce","type":"plugin","creationDate":"21-06-2018","author":"Ryan Demmer","copyright":"Copyright (C) 2006 - 2018 Ryan Demmer. All rights reserved","authorEmail":"info@joomlacontenteditor.net","authorUrl":"http:\\/\\/www.joomlacontenteditor.net","version":"2.6.31","description":"WF_EDITOR_PLUGIN_DESC","group":"","filename":"jce"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10003, 10009, 'plg_content_jce', 'plugin', 'jce', 'content', 0, 1, 1, 0, '{"name":"plg_content_jce","type":"plugin","creationDate":"21-06-2018","author":"Ryan Demmer","copyright":"Copyright (C) 2006 - 2018 Ryan Demmer. All rights reserved","authorEmail":"info@joomlacontenteditor.net","authorUrl":"http:\\/\\/www.joomlacontenteditor.net","version":"2.6.31","description":"PLG_CONTENT_JCE_XML_DESCRIPTION","group":"","filename":"jce"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10004, 10009, 'plg_extension_jce', 'plugin', 'jce', 'extension', 0, 1, 1, 0, '{"name":"plg_extension_jce","type":"plugin","creationDate":"21-06-2018","author":"Ryan Demmer","copyright":"Copyright (C) 2006 - 2018 Ryan Demmer. All rights reserved","authorEmail":"info@joomlacontenteditor.net","authorUrl":"http:\\/\\/www.joomlacontenteditor.net","version":"2.6.31","description":"PLG_EXTENSION_JCE_XML_DESCRIPTION","group":"","filename":"jce"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10005, 10009, 'plg_fields_mediajce', 'plugin', 'mediajce', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_mediajce","type":"plugin","creationDate":"21-06-2018","author":"Ryan Demmer","copyright":"Copyright (C) 2006 - 2018 Ryan Demmer. All rights reserved","authorEmail":"info@joomlacontenteditor.net","authorUrl":"https:\\/\\/www.joomlacontenteditor.net","version":"2.6.31","description":"PLG_FIELDS_MEDIAJCE_XML_DESCRIPTION","group":"","filename":"mediajce"}', '[]', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10006, 10009, 'plg_installer_jce', 'plugin', 'jce', 'installer', 0, 1, 1, 0, '{"name":"plg_installer_jce","type":"plugin","creationDate":"21-06-2018","author":"Ryan Demmer","copyright":"Copyright (C) 2006 - 2018 Ryan Demmer. All rights reserved","authorEmail":"info@joomlacontenteditor.net","authorUrl":"http:\\/\\/www.joomlacontenteditor.net","version":"2.6.31","description":"PLG_INSTALLER_JCE_XML_DESCRIPTION","group":"","filename":"jce"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10007, 10009, 'plg_quickicon_jce', 'plugin', 'jce', 'quickicon', 0, 1, 1, 0, '{"name":"plg_quickicon_jce","type":"plugin","creationDate":"21-06-2018","author":"Ryan Demmer","copyright":"Copyright (C) 2006 - 2018 Ryan Demmer. All rights reserved","authorEmail":"info@joomlacontenteditor.net","authorUrl":"http:\\/\\/www.joomlacontenteditor.net","version":"2.6.31","description":"PLG_QUICKICON_JCE_XML_DESCRIPTION","group":"","filename":"jce"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10008, 10009, 'plg_system_jce', 'plugin', 'jce', 'system', 0, 1, 1, 0, '{"name":"plg_system_jce","type":"plugin","creationDate":"21-06-2018","author":"Ryan Demmer","copyright":"Copyright (C) 2006 - 2018 Ryan Demmer. All rights reserved","authorEmail":"info@joomlacontenteditor.net","authorUrl":"http:\\/\\/www.joomlacontenteditor.net","version":"2.6.31","description":"PLG_SYSTEM_JCE_XML_DESCRIPTION","group":"","filename":"jce"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10009, 0, 'PKG_JCE', 'package', 'pkg_jce', '', 0, 1, 1, 0, '{"name":"PKG_JCE","type":"package","creationDate":"21-06-2018","author":"Ryan Demmer","copyright":"","authorEmail":"","authorUrl":"","version":"2.6.31","description":"PKG_JCE_XML_DESCRIPTION","group":"","filename":"pkg_jce"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10010, 0, 'plg_system_sunfw', 'plugin', 'sunfw', 'system', 0, 1, 1, 1, '{"name":"plg_system_sunfw","type":"plugin","creationDate":"10\\/19\\/2017","author":"JoomlaShine.com","copyright":"Copyright (C) 2016 JoomlaShine.com. All Rights Reserved.","authorEmail":"admin@joomlashine.com","authorUrl":"www.joomlashine.com","version":"2.2.2","description":"","group":"","filename":"sunfw"}', '{"branding-link":"Template by JoomlaShine","allow_tracking":"1"}', '', '', 0, '0000-00-00 00:00:00', 9999, 0),
(10011, 0, 'jsn_teki2_pro', 'template', 'jsn_teki2_pro', '', 0, 1, 1, 0, '{"name":"jsn_teki2_pro","type":"template","creationDate":"10\\/19\\/2017","author":"JoomlaShine.com","copyright":"Copyright (C) 2018-2016 JoomlaShine.com. All Rights Reserved.","authorEmail":"admin@joomlashine.com","authorUrl":"www.joomlashine.com","version":"1.0.1","description":"TPL_TEKI2_PRO_XML_DESCRIPTION","group":"sunfw","filename":"templateDetails"}', '{"customCSSFileChecksum":"33cc73f5d59dcb5081d1d875c9f7c10e","username":"runnwalk","token":"23ba047029bf98fcf5cfbf9fd6df1418"}', 'sunfw', '', 0, '0000-00-00 00:00:00', 0, 0),
(10012, 10014, 'Greek', 'language', 'el-GR', '', 0, 1, 0, 0, '{"name":"Greek","type":"language","creationDate":"\\u0399\\u03bf\\u03cd\\u03bd\\u03b9\\u03bf\\u03c2 2018","author":"Greek translation team : joomla.gr","copyright":"Copyright (C) 2005 - 2018 joomla. gr \\u03ba\\u03b1\\u03b9 Open Source Matters. All rights reserved.","authorEmail":"contact@joomla.gr","authorUrl":"http:\\/\\/www.joomla.gr","version":"3.8.10.1","description":"greek language pack for Joomla! 3.8.10","group":"","filename":"install"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10013, 10014, 'Greek', 'language', 'el-GR', '', 1, 1, 0, 0, '{"name":"Greek","type":"language","creationDate":"\\u0399\\u03bf\\u03cd\\u03bd\\u03b9\\u03bf\\u03c2 2018","author":"\\u039f\\u03bc\\u03ac\\u03b4\\u03b1 \\u03b5\\u03bb\\u03bb\\u03b7\\u03bd\\u03b9\\u03ba\\u03ae\\u03c2 \\u03bc\\u03b5\\u03c4\\u03ac\\u03c6\\u03c1\\u03b1\\u03c3\\u03b7\\u03c2 : joomla.gr","copyright":"Copyright (C) 2005 - 2018 joomla. gr \\u03ba\\u03b1\\u03b9 Open Source Matters. All rights reserved.","authorEmail":"contact@joomla.gr","authorUrl":"http:\\/\\/www.joomla.gr","version":"3.8.10.1","description":"greek administrator language pack for Joomla! 3.8.8","group":"","filename":"install"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10014, 0, 'Πακέτο ελληνικής (el-GR) γλώσσας', 'package', 'pkg_el-GR', '', 0, 1, 1, 0, '{"name":"\\u03a0\\u03b1\\u03ba\\u03ad\\u03c4\\u03bf \\u03b5\\u03bb\\u03bb\\u03b7\\u03bd\\u03b9\\u03ba\\u03ae\\u03c2 (el-GR) \\u03b3\\u03bb\\u03ce\\u03c3\\u03c3\\u03b1\\u03c2","type":"package","creationDate":"\\u0399\\u03bf\\u03cd\\u03bd\\u03b9\\u03bf\\u03c2 2018","author":"\\u039f\\u03bc\\u03ac\\u03b4\\u03b1 \\u03b5\\u03bb\\u03bb\\u03b7\\u03bd\\u03b9\\u03ba\\u03ae\\u03c2 \\u03bc\\u03b5\\u03c4\\u03ac\\u03c6\\u03c1\\u03b1\\u03c3\\u03b7\\u03c2: joomla. gr","copyright":"Copyright (C) 2005 - 2018 Open Source Matters, Inc. All rights reserved.","authorEmail":"contact@joomla.gr","authorUrl":"www.joomla.gr","version":"3.8.10.1","description":"el-GR language pack","group":"","filename":"pkg_el-GR"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_fields`
--

CREATE TABLE `uoj7s_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `context` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `group_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `default_value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fieldparams` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_fields_categories`
--

CREATE TABLE `uoj7s_fields_categories` (
  `field_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_fields_groups`
--

CREATE TABLE `uoj7s_fields_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `context` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_fields_values`
--

CREATE TABLE `uoj7s_fields_values` (
  `field_id` int(10) UNSIGNED NOT NULL,
  `item_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Allow references to items which have strings as ids, eg. none db systems.',
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_finder_filters`
--

CREATE TABLE `uoj7s_finder_filters` (
  `filter_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_by_alias` varchar(255) NOT NULL,
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `map_count` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `params` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_finder_links`
--

CREATE TABLE `uoj7s_finder_links` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `url` varchar(255) NOT NULL,
  `route` varchar(255) NOT NULL,
  `title` varchar(400) DEFAULT NULL,
  `description` text,
  `indexdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `md5sum` varchar(32) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `state` int(5) DEFAULT '1',
  `access` int(5) DEFAULT '0',
  `language` varchar(8) NOT NULL,
  `publish_start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `list_price` double UNSIGNED NOT NULL DEFAULT '0',
  `sale_price` double UNSIGNED NOT NULL DEFAULT '0',
  `type_id` int(11) NOT NULL,
  `object` mediumblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_finder_links_terms0`
--

CREATE TABLE `uoj7s_finder_links_terms0` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_finder_links_terms1`
--

CREATE TABLE `uoj7s_finder_links_terms1` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_finder_links_terms2`
--

CREATE TABLE `uoj7s_finder_links_terms2` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_finder_links_terms3`
--

CREATE TABLE `uoj7s_finder_links_terms3` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_finder_links_terms4`
--

CREATE TABLE `uoj7s_finder_links_terms4` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_finder_links_terms5`
--

CREATE TABLE `uoj7s_finder_links_terms5` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_finder_links_terms6`
--

CREATE TABLE `uoj7s_finder_links_terms6` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_finder_links_terms7`
--

CREATE TABLE `uoj7s_finder_links_terms7` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_finder_links_terms8`
--

CREATE TABLE `uoj7s_finder_links_terms8` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_finder_links_terms9`
--

CREATE TABLE `uoj7s_finder_links_terms9` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_finder_links_termsa`
--

CREATE TABLE `uoj7s_finder_links_termsa` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_finder_links_termsb`
--

CREATE TABLE `uoj7s_finder_links_termsb` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_finder_links_termsc`
--

CREATE TABLE `uoj7s_finder_links_termsc` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_finder_links_termsd`
--

CREATE TABLE `uoj7s_finder_links_termsd` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_finder_links_termse`
--

CREATE TABLE `uoj7s_finder_links_termse` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_finder_links_termsf`
--

CREATE TABLE `uoj7s_finder_links_termsf` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_finder_taxonomy`
--

CREATE TABLE `uoj7s_finder_taxonomy` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `state` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `access` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `ordering` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `uoj7s_finder_taxonomy`
--

INSERT INTO `uoj7s_finder_taxonomy` (`id`, `parent_id`, `title`, `state`, `access`, `ordering`) VALUES
(1, 0, 'ROOT', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_finder_taxonomy_map`
--

CREATE TABLE `uoj7s_finder_taxonomy_map` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `node_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_finder_terms`
--

CREATE TABLE `uoj7s_finder_terms` (
  `term_id` int(10) UNSIGNED NOT NULL,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `phrase` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `weight` float UNSIGNED NOT NULL DEFAULT '0',
  `soundex` varchar(75) NOT NULL,
  `links` int(10) NOT NULL DEFAULT '0',
  `language` char(3) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_finder_terms_common`
--

CREATE TABLE `uoj7s_finder_terms_common` (
  `term` varchar(75) NOT NULL,
  `language` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `uoj7s_finder_terms_common`
--

INSERT INTO `uoj7s_finder_terms_common` (`term`, `language`) VALUES
('a', 'en'),
('about', 'en'),
('after', 'en'),
('ago', 'en'),
('all', 'en'),
('am', 'en'),
('an', 'en'),
('and', 'en'),
('any', 'en'),
('are', 'en'),
('aren\'t', 'en'),
('as', 'en'),
('at', 'en'),
('be', 'en'),
('but', 'en'),
('by', 'en'),
('for', 'en'),
('from', 'en'),
('get', 'en'),
('go', 'en'),
('how', 'en'),
('if', 'en'),
('in', 'en'),
('into', 'en'),
('is', 'en'),
('isn\'t', 'en'),
('it', 'en'),
('its', 'en'),
('me', 'en'),
('more', 'en'),
('most', 'en'),
('must', 'en'),
('my', 'en'),
('new', 'en'),
('no', 'en'),
('none', 'en'),
('not', 'en'),
('nothing', 'en'),
('of', 'en'),
('off', 'en'),
('often', 'en'),
('old', 'en'),
('on', 'en'),
('onc', 'en'),
('once', 'en'),
('only', 'en'),
('or', 'en'),
('other', 'en'),
('our', 'en'),
('ours', 'en'),
('out', 'en'),
('over', 'en'),
('page', 'en'),
('she', 'en'),
('should', 'en'),
('small', 'en'),
('so', 'en'),
('some', 'en'),
('than', 'en'),
('thank', 'en'),
('that', 'en'),
('the', 'en'),
('their', 'en'),
('theirs', 'en'),
('them', 'en'),
('then', 'en'),
('there', 'en'),
('these', 'en'),
('they', 'en'),
('this', 'en'),
('those', 'en'),
('thus', 'en'),
('time', 'en'),
('times', 'en'),
('to', 'en'),
('too', 'en'),
('true', 'en'),
('under', 'en'),
('until', 'en'),
('up', 'en'),
('upon', 'en'),
('use', 'en'),
('user', 'en'),
('users', 'en'),
('version', 'en'),
('very', 'en'),
('via', 'en'),
('want', 'en'),
('was', 'en'),
('way', 'en'),
('were', 'en'),
('what', 'en'),
('when', 'en'),
('where', 'en'),
('which', 'en'),
('who', 'en'),
('whom', 'en'),
('whose', 'en'),
('why', 'en'),
('wide', 'en'),
('will', 'en'),
('with', 'en'),
('within', 'en'),
('without', 'en'),
('would', 'en'),
('yes', 'en'),
('yet', 'en'),
('you', 'en'),
('your', 'en'),
('yours', 'en');

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_finder_tokens`
--

CREATE TABLE `uoj7s_finder_tokens` (
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `phrase` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `weight` float UNSIGNED NOT NULL DEFAULT '1',
  `context` tinyint(1) UNSIGNED NOT NULL DEFAULT '2',
  `language` char(3) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_finder_tokens_aggregate`
--

CREATE TABLE `uoj7s_finder_tokens_aggregate` (
  `term_id` int(10) UNSIGNED NOT NULL,
  `map_suffix` char(1) NOT NULL,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `phrase` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `term_weight` float UNSIGNED NOT NULL,
  `context` tinyint(1) UNSIGNED NOT NULL DEFAULT '2',
  `context_weight` float UNSIGNED NOT NULL,
  `total_weight` float UNSIGNED NOT NULL,
  `language` char(3) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_finder_types`
--

CREATE TABLE `uoj7s_finder_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `mime` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_languages`
--

CREATE TABLE `uoj7s_languages` (
  `lang_id` int(11) UNSIGNED NOT NULL,
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lang_code` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_native` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sef` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sitename` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `published` int(11) NOT NULL DEFAULT '0',
  `access` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uoj7s_languages`
--

INSERT INTO `uoj7s_languages` (`lang_id`, `asset_id`, `lang_code`, `title`, `title_native`, `sef`, `image`, `description`, `metakey`, `metadesc`, `sitename`, `published`, `access`, `ordering`) VALUES
(1, 0, 'en-GB', 'English (en-GB)', 'English (United Kingdom)', 'en', 'en_gb', '', '', '', '', 1, 1, 2),
(2, 91, 'el-GR', 'Greek', 'Greek (Greece)', 'el', 'el_gr', '', '', '', '', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_menu`
--

CREATE TABLE `uoj7s_menu` (
  `id` int(11) NOT NULL,
  `menutype` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The type of menu this item belongs to. FK to #__menu_types.menutype',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The display title of the menu item.',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The SEF alias of the menu item.',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The computed path of the menu item based on the alias field.',
  `link` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The actually link the menu item refers to.',
  `type` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The type of link: Component, URL, Alias, Separator',
  `published` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The published state of the menu link.',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'The parent menu item in the menu tree.',
  `level` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The relative level in the tree.',
  `component_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'FK to #__extensions.id',
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'FK to #__users.id',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The time the menu item was checked out.',
  `browserNav` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The click behaviour of the link.',
  `access` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The access level required to view the menu item.',
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The image of the menu item.',
  `template_style_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded data for the menu item.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `home` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Indicates if this menu item is the home or default page.',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uoj7s_menu`
--

INSERT INTO `uoj7s_menu` (`id`, `menutype`, `title`, `alias`, `note`, `path`, `link`, `type`, `published`, `parent_id`, `level`, `component_id`, `checked_out`, `checked_out_time`, `browserNav`, `access`, `img`, `template_style_id`, `params`, `lft`, `rgt`, `home`, `language`, `client_id`) VALUES
(1, '', 'Menu_Item_Root', 'root', '', '', '', '', 1, 0, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '', 0, '', 0, 83, 0, '*', 0),
(2, 'main', 'com_banners', 'Banners', '', 'Banners', 'index.php?option=com_banners', 'component', 1, 1, 1, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 1, 10, 0, '*', 1),
(3, 'main', 'com_banners', 'Banners', '', 'Banners/Banners', 'index.php?option=com_banners', 'component', 1, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 2, 3, 0, '*', 1),
(4, 'main', 'com_banners_categories', 'Categories', '', 'Banners/Categories', 'index.php?option=com_categories&extension=com_banners', 'component', 1, 2, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-cat', 0, '', 4, 5, 0, '*', 1),
(5, 'main', 'com_banners_clients', 'Clients', '', 'Banners/Clients', 'index.php?option=com_banners&view=clients', 'component', 1, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-clients', 0, '', 6, 7, 0, '*', 1),
(6, 'main', 'com_banners_tracks', 'Tracks', '', 'Banners/Tracks', 'index.php?option=com_banners&view=tracks', 'component', 1, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-tracks', 0, '', 8, 9, 0, '*', 1),
(7, 'main', 'com_contact', 'Contacts', '', 'Contacts', 'index.php?option=com_contact', 'component', 1, 1, 1, 8, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 11, 16, 0, '*', 1),
(8, 'main', 'com_contact_contacts', 'Contacts', '', 'Contacts/Contacts', 'index.php?option=com_contact', 'component', 1, 7, 2, 8, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 12, 13, 0, '*', 1),
(9, 'main', 'com_contact_categories', 'Categories', '', 'Contacts/Categories', 'index.php?option=com_categories&extension=com_contact', 'component', 1, 7, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact-cat', 0, '', 14, 15, 0, '*', 1),
(10, 'main', 'com_messages', 'Messaging', '', 'Messaging', 'index.php?option=com_messages', 'component', 1, 1, 1, 15, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages', 0, '', 17, 20, 0, '*', 1),
(11, 'main', 'com_messages_add', 'New Private Message', '', 'Messaging/New Private Message', 'index.php?option=com_messages&task=message.add', 'component', 1, 10, 2, 15, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages-add', 0, '', 18, 19, 0, '*', 1),
(13, 'main', 'com_newsfeeds', 'News Feeds', '', 'News Feeds', 'index.php?option=com_newsfeeds', 'component', 1, 1, 1, 17, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 21, 26, 0, '*', 1),
(14, 'main', 'com_newsfeeds_feeds', 'Feeds', '', 'News Feeds/Feeds', 'index.php?option=com_newsfeeds', 'component', 1, 13, 2, 17, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 22, 23, 0, '*', 1),
(15, 'main', 'com_newsfeeds_categories', 'Categories', '', 'News Feeds/Categories', 'index.php?option=com_categories&extension=com_newsfeeds', 'component', 1, 13, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds-cat', 0, '', 24, 25, 0, '*', 1),
(16, 'main', 'com_redirect', 'Redirect', '', 'Redirect', 'index.php?option=com_redirect', 'component', 1, 1, 1, 24, 0, '0000-00-00 00:00:00', 0, 0, 'class:redirect', 0, '', 27, 28, 0, '*', 1),
(17, 'main', 'com_search', 'Basic Search', '', 'Basic Search', 'index.php?option=com_search', 'component', 1, 1, 1, 19, 0, '0000-00-00 00:00:00', 0, 0, 'class:search', 0, '', 29, 30, 0, '*', 1),
(18, 'main', 'com_finder', 'Smart Search', '', 'Smart Search', 'index.php?option=com_finder', 'component', 1, 1, 1, 27, 0, '0000-00-00 00:00:00', 0, 0, 'class:finder', 0, '', 31, 32, 0, '*', 1),
(19, 'main', 'com_joomlaupdate', 'Joomla! Update', '', 'Joomla! Update', 'index.php?option=com_joomlaupdate', 'component', 1, 1, 1, 28, 0, '0000-00-00 00:00:00', 0, 0, 'class:joomlaupdate', 0, '', 33, 34, 0, '*', 1),
(20, 'main', 'com_tags', 'Tags', '', 'Tags', 'index.php?option=com_tags', 'component', 1, 1, 1, 29, 0, '0000-00-00 00:00:00', 0, 1, 'class:tags', 0, '', 35, 36, 0, '', 1),
(21, 'main', 'com_postinstall', 'Post-installation messages', '', 'Post-installation messages', 'index.php?option=com_postinstall', 'component', 1, 1, 1, 32, 0, '0000-00-00 00:00:00', 0, 1, 'class:postinstall', 0, '', 37, 38, 0, '*', 1),
(22, 'main', 'com_associations', 'Multilingual Associations', '', 'Multilingual Associations', 'index.php?option=com_associations', 'component', 1, 1, 1, 34, 0, '0000-00-00 00:00:00', 0, 0, 'class:associations', 0, '', 39, 40, 0, '*', 1),
(101, 'mainmenu', 'Home', 'home', '', 'home', 'index.php?option=com_content&view=featured', 'component', -2, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"featured_categories":[""],"layout_type":"blog","num_leading_articles":"1","num_intro_articles":"3","num_columns":"3","num_links":"0","multi_column_order":"1","orderby_pri":"","orderby_sec":"front","order_date":"","show_pagination":"2","show_pagination_results":"1","show_title":"0","link_titles":"","show_intro":"1","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_tags":"","show_noauth":"","show_feed_link":"1","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_image_css":"","menu_text":1,"menu_show":1,"page_title":"","show_page_heading":"1","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 41, 42, 0, '*', 0),
(102, 'mainmenu', 'Login Form', 'login-form', '', 'login-form', 'index.php?option=com_users&view=login', 'component', -2, 1, 1, 25, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"loginredirectchoice":"1","login_redirect_url":"","login_redirect_menuitem":"","logindescription_show":"1","login_description":"","login_image":"","logoutredirectchoice":"1","logout_redirect_url":"","logout_redirect_menuitem":"","logoutdescription_show":"1","logout_description":"","logout_image":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_image_css":"","menu_text":1,"menu_show":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 43, 44, 0, '*', 0),
(103, 'main', 'COM_JCE', 'com-jce', '', 'com-jce', 'index.php?option=com_jce', 'component', 1, 1, 1, 10001, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_jce/media/img/menu/logo.png', 0, '{}', 45, 52, 0, '', 1),
(104, 'main', 'COM_JCE_MENU_CPANEL', 'com-jce-menu-cpanel', '', 'com-jce/com-jce-menu-cpanel', 'index.php?option=com_jce', 'component', 1, 103, 2, 10001, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 46, 47, 0, '', 1),
(105, 'main', 'COM_JCE_MENU_CONFIG', 'com-jce-menu-config', '', 'com-jce/com-jce-menu-config', 'index.php?option=com_jce&view=config', 'component', 1, 103, 2, 10001, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 48, 49, 0, '', 1),
(106, 'main', 'COM_JCE_MENU_PROFILES', 'com-jce-menu-profiles', '', 'com-jce/com-jce-menu-profiles', 'index.php?option=com_jce&view=profiles', 'component', 1, 103, 2, 10001, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 50, 51, 0, '', 1),
(108, 'mainmenu', 'Home', 'main-menu', '', 'main-menu', 'index.php?option=com_content&view=featured', 'component', 1, 1, 1, 22, 291, '2018-07-05 02:11:00', 0, 1, ' ', 0, '{"featured_categories":[""],"layout_type":"blog","num_leading_articles":"","num_intro_articles":"","num_columns":"","num_links":"","multi_column_order":"","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","show_title":"0","link_titles":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_tags":"","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_image_css":"","menu_text":1,"menu_show":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 53, 54, 1, '*', 0),
(109, 'mainmenu', 'Contact Us', 'contact-us', '', 'contact-us', 'index.php?option=com_contact&view=contact&id=2', 'component', 1, 1, 1, 8, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"presentation_style":"tabs","show_contact_category":"","show_contact_list":"","show_tags":"","show_info":"","show_name":"","show_position":"","show_email":"","add_mailto_link":"","show_street_address":"","show_suburb":"","show_state":"","show_postcode":"","show_country":"","show_telephone":"","show_mobile":"","show_fax":"","show_webpage":"","show_image":"","allow_vcard":"","show_misc":"","show_articles":"","articles_display_num":"","show_links":"","linka_name":"","linkb_name":"","linkc_name":"","linkd_name":"","linke_name":"","show_email_form":"","show_email_copy":"","banned_email":"","banned_subject":"","banned_text":"","validate_session":"","custom_reply":"","redirect":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_image_css":"","menu_text":1,"menu_show":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 55, 56, 0, '*', 0),
(110, 'os-for-computer', 'Windows', 'windows', '', 'windows', 'index.php?option=com_content&view=article&id=4', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"show_title":"","link_titles":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_tags":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_image_css":"","menu_text":1,"menu_show":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 57, 58, 0, '*', 0),
(111, 'os-for-computer', 'Linux', 'linux', '', 'linux', 'index.php?option=com_content&view=article&id=5', 'component', 1, 1, 1, 22, 291, '2018-07-05 00:59:26', 0, 1, ' ', 0, '{"show_title":"","link_titles":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_tags":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_image_css":"","menu_text":1,"menu_show":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 59, 60, 0, '*', 0),
(112, 'os-for-computer', 'MacOS', 'macos', '', 'macos', 'index.php?option=com_content&view=article&id=34', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"show_title":"","link_titles":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_tags":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_image_css":"","menu_text":1,"menu_show":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 61, 62, 0, '*', 0),
(113, 'os-for-mobile', 'Android', 'android', '', 'android', 'index.php?option=com_content&view=article&id=7', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"show_title":"","link_titles":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_tags":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_image_css":"","menu_text":1,"menu_show":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 63, 64, 0, '*', 0),
(114, 'os-for-mobile', 'iOS', 'ios', '', 'ios', 'index.php?option=com_content&view=article&id=9', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"show_title":"","link_titles":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_tags":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_image_css":"","menu_text":1,"menu_show":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 65, 66, 0, '*', 0),
(115, 'versions', 'Linux Releases', 'linux1', '', 'linux1', 'index.php?option=com_content&view=category&layout=blog&id=13', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"layout_type":"blog","show_category_heading_title_text":"","show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_no_articles":"","show_subcat_desc":"","show_cat_num_articles":"","show_cat_tags":"","page_subheading":"","num_leading_articles":"","num_intro_articles":"","num_columns":"","num_links":"","multi_column_order":"","show_subcategory_content":"","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","show_featured":"","article_layout":"_:default","show_title":"","link_titles":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_tags":"","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_image_css":"","menu_text":1,"menu_show":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 67, 68, 0, '*', 0),
(116, 'versions', 'Windows Releases', 'windowsversions', '', 'windowsversions', 'index.php?option=com_content&view=category&layout=blog&id=14', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"layout_type":"blog","show_category_heading_title_text":"","show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_no_articles":"","show_subcat_desc":"","show_cat_num_articles":"","show_cat_tags":"","page_subheading":"","num_leading_articles":"","num_intro_articles":"","num_columns":"","num_links":"","multi_column_order":"","show_subcategory_content":"","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","show_featured":"","article_layout":"_:default","show_title":"","link_titles":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_tags":"","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_image_css":"","menu_text":1,"menu_show":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 69, 70, 0, '*', 0),
(117, 'versions', 'MacOS Releases', 'macosversions', '', 'macosversions', 'index.php?option=com_content&view=category&layout=blog&id=15', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"layout_type":"blog","show_category_heading_title_text":"","show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_no_articles":"","show_subcat_desc":"","show_cat_num_articles":"","show_cat_tags":"","page_subheading":"","num_leading_articles":"","num_intro_articles":"","num_columns":"","num_links":"","multi_column_order":"","show_subcategory_content":"","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","show_featured":"","article_layout":"_:default","show_title":"","link_titles":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_tags":"","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_image_css":"","menu_text":1,"menu_show":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 71, 72, 0, '*', 0),
(118, 'versions-for-mobile', 'Android Releases', 'android-releases', '', 'android-releases', 'index.php?option=com_content&view=category&layout=blog&id=16', 'component', 1, 1, 1, 22, 291, '2018-07-05 00:42:52', 0, 1, ' ', 0, '{"layout_type":"blog","show_category_heading_title_text":"","show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_no_articles":"","show_subcat_desc":"","show_cat_num_articles":"","show_cat_tags":"","page_subheading":"","num_leading_articles":"","num_intro_articles":"","num_columns":"","num_links":"","multi_column_order":"","show_subcategory_content":"","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","show_featured":"","article_layout":"_:default","show_title":"","link_titles":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_tags":"","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_image_css":"","menu_text":1,"menu_show":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 73, 74, 0, '*', 0),
(119, 'versions-for-mobile', 'iOS Releases', 'ios-releases', '', 'ios-releases', 'index.php?option=com_content&view=category&layout=blog&id=17', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"layout_type":"blog","show_category_heading_title_text":"","show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_no_articles":"","show_subcat_desc":"","show_cat_num_articles":"","show_cat_tags":"","page_subheading":"","num_leading_articles":"","num_intro_articles":"","num_columns":"","num_links":"","multi_column_order":"","show_subcategory_content":"","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","show_featured":"","article_layout":"_:default","show_title":"","link_titles":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_tags":"","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_image_css":"","menu_text":1,"menu_show":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 75, 76, 0, '*', 0),
(121, 'mainmenu', 'Main Links ', 'main-links', '', 'main-links', '', 'separator', -2, 1, 1, 0, 0, '0000-00-00 00:00:00', 1, 1, ' ', 0, '{"menu-anchor_css":"","menu_image":"","menu_image_css":"","menu_text":1,"menu_show":1}', 77, 78, 0, '*', 0),
(122, 'mainmenu', 'test', 'test', '', 'test', 'index.php?option=com_content&view=article&id=28', 'component', -2, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"show_title":"","link_titles":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_tags":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_image_css":"","menu_text":1,"menu_show":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 79, 80, 0, '*', 0),
(123, 'versions-for-mobile', 'MacOS Releases ', 'macos-versions', '', 'macos-versions', 'index.php?option=com_content&view=category&layout=blog&id=15', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"layout_type":"blog","show_category_heading_title_text":"","show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_no_articles":"","show_subcat_desc":"","show_cat_num_articles":"","show_cat_tags":"","page_subheading":"","num_leading_articles":"","num_intro_articles":"","num_columns":"","num_links":"","multi_column_order":"","show_subcategory_content":"","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","show_featured":"","article_layout":"_:default","show_title":"","link_titles":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_tags":"","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_image_css":"","menu_text":1,"menu_show":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 81, 82, 0, '*', 0);

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_menu_types`
--

CREATE TABLE `uoj7s_menu_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `menutype` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(48) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uoj7s_menu_types`
--

INSERT INTO `uoj7s_menu_types` (`id`, `asset_id`, `menutype`, `title`, `description`, `client_id`) VALUES
(1, 0, 'mainmenu', 'Main Menu', 'The main menu for the site', 0),
(3, 93, 'os-for-computer', 'OS for Computer', '', 0),
(4, 95, 'os-for-mobile', 'OS for Mobile', '', 0),
(5, 101, 'versions', 'Versions for Computer', '', 0),
(6, 115, 'versions-for-mobile', 'Versions for Mobile', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_messages`
--

CREATE TABLE `uoj7s_messages` (
  `message_id` int(10) UNSIGNED NOT NULL,
  `user_id_from` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `user_id_to` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `folder_id` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `priority` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_messages_cfg`
--

CREATE TABLE `uoj7s_messages_cfg` (
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cfg_value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_modules`
--

CREATE TABLE `uoj7s_modules` (
  `id` int(11) NOT NULL,
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `position` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `showtitle` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uoj7s_modules`
--

INSERT INTO `uoj7s_modules` (`id`, `asset_id`, `title`, `note`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `published`, `module`, `access`, `showtitle`, `params`, `client_id`, `language`) VALUES
(1, 39, 'Main Menu', '', '', 9, 'position-7', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 1, '{"menutype":"mainmenu","base":"","startLevel":"1","endLevel":"0","showAllChildren":"1","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"_menu","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(2, 40, 'Login', '', '', 1, 'login', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_login', 1, 1, '', 1, '*'),
(3, 41, 'Popular Articles', '', '', 3, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_popular', 3, 1, '{"count":"5","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(4, 42, 'Recently Added Articles', '', '', 4, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_latest', 3, 1, '{"count":"5","ordering":"c_dsc","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(8, 43, 'Toolbar', '', '', 1, 'toolbar', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_toolbar', 3, 1, '', 1, '*'),
(9, 44, 'Quick Icons', '', '', 1, 'icon', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_quickicon', 3, 1, '', 1, '*'),
(10, 45, 'Logged-in Users', '', '', 2, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_logged', 3, 1, '{"count":"5","name":"1","layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(12, 46, 'Admin Menu', '', '', 1, 'menu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 3, 1, '{"layout":"","moduleclass_sfx":"","shownew":"1","showhelp":"1","cache":"0"}', 1, '*'),
(13, 47, 'Admin Submenu', '', '', 1, 'submenu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_submenu', 3, 1, '', 1, '*'),
(14, 48, 'User Status', '', '', 2, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_status', 3, 1, '', 1, '*'),
(15, 49, 'Title', '', '', 1, 'title', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_title', 3, 1, '', 1, '*'),
(16, 50, 'Login Form', '', '', 8, 'position-8', 0, '0000-00-00 00:00:00', '2018-06-30 17:04:28', '0000-00-00 00:00:00', -2, 'mod_login', 1, 1, '{"pretext":"","posttext":"","login":"","logout":"","greeting":"1","name":"0","profilelink":"0","usesecure":"0","usetext":"0","layout":"_:default","moduleclass_sfx":"","cache":"0","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(17, 51, 'Breadcrumbs', '', '', 1, 'position-3', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_breadcrumbs', 1, 0, '{"showHere":"1","showHome":"1","homeText":"","showLast":"1","separator":"","layout":"_:default","moduleclass_sfx":"","cache":"0","cache_time":"0","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(79, 52, 'Multilanguage status', '', '', 1, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_multilangstatus', 3, 1, '{"layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(86, 53, 'Joomla Version', '', '', 1, 'footer', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_version', 3, 1, '{"format":"short","product":"1","layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(87, 55, 'Sample Data', '', '', 0, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_sampledata', 6, 1, '{}', 1, '*'),
(88, 56, 'OS for Computer', '', '', 9, 'position-8', 0, '0000-00-00 00:00:00', '2018-07-02 11:42:42', '0000-00-00 00:00:00', -2, 'mod_articles_category', 1, 1, '{"mode":"normal","show_on_article_page":"1","count":"0","show_front":"show","category_filtering_type":"1","catid":["8"],"show_child_category_articles":"0","levels":"1","author_filtering_type":"1","created_by":[""],"author_alias_filtering_type":"1","created_by_alias":[""],"excluded_articles":"","date_filtering":"off","date_field":"a.created","start_date_range":"","end_date_range":"","relative_date":"30","article_ordering":"a.title","article_ordering_direction":"ASC","article_grouping":"none","article_grouping_direction":"ksort","month_year_format":"F Y","link_titles":"1","show_date":"0","show_date_field":"created","show_date_format":"Y-m-d H:i:s","show_category":"0","show_hits":"0","show_author":"0","show_introtext":"0","introtext_limit":"100","show_readmore":"0","show_readmore_title":"1","readmore_limit":"15","layout":"_:default","moduleclass_sfx":"","owncache":"1","cache_time":"900","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(89, 57, 'Login Form', '', '', 1, 'position-0', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_login', 1, 1, '{"pretext":"","posttext":"","login":"","logout":"","greeting":"1","name":"0","profilelink":"0","usesecure":"0","usetext":"0","layout":"_:default","moduleclass_sfx":"","cache":"0","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(90, 67, 'OS for Mobile', '', '', 10, 'position-8', 0, '0000-00-00 00:00:00', '2018-07-02 11:43:45', '0000-00-00 00:00:00', -2, 'mod_articles_category', 1, 1, '{"mode":"normal","show_on_article_page":"1","count":"0","show_front":"show","category_filtering_type":"1","catid":["9"],"show_child_category_articles":"0","levels":"1","author_filtering_type":"1","created_by":[""],"author_alias_filtering_type":"1","created_by_alias":[""],"excluded_articles":"","date_filtering":"off","date_field":"a.created","start_date_range":"","end_date_range":"","relative_date":"30","article_ordering":"a.title","article_ordering_direction":"ASC","article_grouping":"none","article_grouping_direction":"ksort","month_year_format":"F Y","link_titles":"1","show_date":"0","show_date_field":"created","show_date_format":"Y-m-d H:i:s","show_category":"0","show_hits":"0","show_author":"0","show_introtext":"0","introtext_limit":"100","show_readmore":"0","show_readmore_title":"1","readmore_limit":"15","layout":"_:default","moduleclass_sfx":"","owncache":"1","cache_time":"900","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(91, 72, 'Latest Articles', '', '', 11, 'position-7', 0, '0000-00-00 00:00:00', '2018-07-02 00:39:06', '0000-00-00 00:00:00', -2, 'mod_articles_latest', 1, 1, '{"catid":[""],"count":"5","show_featured":"","ordering":"c_dsc","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(92, 73, 'Most Read Articles', '', '', 8, 'position-7', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_articles_popular', 1, 1, '{"catid":[""],"count":"4","show_front":"1","date_filtering":"off","date_field":"a.created","start_date_range":"","end_date_range":"","relative_date":"30","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(93, 74, 'Articles - Categories', '', '', 10, 'position-7', 0, '0000-00-00 00:00:00', '2018-06-30 19:12:16', '0000-00-00 00:00:00', -2, 'mod_articles_categories', 1, 1, '{"parent":"8","show_description":"0","numitems":"0","show_children":"0","count":"0","maxlevel":"0","layout":"_:default","item_heading":"4","moduleclass_sfx":"","owncache":"1","cache_time":"900","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(94, 75, 'Footer', '', '', 1, 'footer', 0, '0000-00-00 00:00:00', '2018-06-30 19:18:49', '0000-00-00 00:00:00', -2, 'mod_footer', 1, 1, '{"layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(95, 78, 'Computing', '', '', 1, 'banner', 291, '2018-07-04 15:01:24', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_banners', 1, 0, '{"target":"1","count":5,"cid":"0","catid":["10"],"tag_search":"0","ordering":"0","header_text":"","footer_text":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(96, 79, 'Footer', '', '', 1, 'footer', 0, '0000-00-00 00:00:00', '2018-07-01 19:37:56', '0000-00-00 00:00:00', -2, 'mod_footer', 1, 1, '{"layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(97, 80, 'Footer', '', '<p><img src="images/Footer_/Editor_ME.jpg" alt="Editor ME" /></p>', 1, 'footer', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 0, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(98, 81, 'Home2', '', '<p style="margin: 0.5em 0px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; line-height: inherit; color: #222222; font-family: sans-serif; font-size: 14px; background-color: #ffffff;">2An&nbsp;<b>operating system</b>&nbsp;(<b>OS</b>) is&nbsp;<a style="color: #0b0080; text-decoration: none; background: none;" title="System software" href="https://en.wikipedia.org/wiki/System_software">system software</a>&nbsp;that manages&nbsp;<a style="color: #0b0080; text-decoration: none; background: none;" title="Computer hardware" href="https://en.wikipedia.org/wiki/Computer_hardware">computer hardware</a>&nbsp;and&nbsp;<a class="mw-redirect" style="color: #0b0080; text-decoration: none; background: none;" title="Computer software" href="https://en.wikipedia.org/wiki/Computer_software">software</a>resources and provides common&nbsp;<a style="color: #0b0080; text-decoration: none; background: none;" title="Daemon (computing)" href="https://en.wikipedia.org/wiki/Daemon_(computing)">services</a>&nbsp;for&nbsp;<a style="color: #0b0080; text-decoration: none; background: none;" title="Computer program" href="https://en.wikipedia.org/wiki/Computer_program">computer programs</a>.</p>\r\n<p style="margin: 0.5em 0px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; line-height: inherit; color: #222222; font-family: sans-serif; font-size: 14px; background-color: #ffffff;"><a style="color: #0b0080; text-decoration: none; background: none;" title="Time-sharing" href="https://en.wikipedia.org/wiki/Time-sharing">Time-sharing</a>&nbsp;operating systems&nbsp;<a class="mw-redirect" style="color: #0b0080; text-decoration: none; background: none;" title="Scheduler (computing)" href="https://en.wikipedia.org/wiki/Scheduler_(computing)">schedule tasks</a>&nbsp;for efficient use of the system and may also include accounting software for cost allocation of&nbsp;<a style="color: #0b0080; text-decoration: none; background: none;" title="Scheduling (computing)" href="https://en.wikipedia.org/wiki/Scheduling_(computing)">processor time</a>,&nbsp;<a style="color: #0b0080; text-decoration: none; background: none;" title="Mass storage" href="https://en.wikipedia.org/wiki/Mass_storage">mass storage</a>,&nbsp;<a style="color: #0b0080; text-decoration: none; background: none;" title="Printer (computing)" href="https://en.wikipedia.org/wiki/Printer_(computing)">printing</a>, and other resources.</p>\r\n<p style="margin: 0.5em 0px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; line-height: inherit; color: #222222; font-family: sans-serif; font-size: 14px; background-color: #ffffff;">For hardware functions such as&nbsp;<a class="mw-redirect" style="color: #0b0080; text-decoration: none; background: none;" title="Input and output" href="https://en.wikipedia.org/wiki/Input_and_output">input and output</a>&nbsp;and&nbsp;<a class="mw-redirect" style="color: #0b0080; text-decoration: none; background: none;" title="Memory allocation" href="https://en.wikipedia.org/wiki/Memory_allocation">memory allocation</a>, the operating system acts as an intermediary between programs and the computer hardware,<sup id="cite_ref-1" class="reference" style="position: relative; font-size: 11.2px; line-height: 1; vertical-align: baseline; top: -0.5em; unicode-bidi: isolate; white-space: nowrap; font-weight: normal; font-style: normal;"><a style="color: #0b0080; text-decoration: none; background: none;" href="https://en.wikipedia.org/wiki/Operating_system#cite_note-1">[1]</a></sup><sup id="cite_ref-2" class="reference" style="position: relative; font-size: 11.2px; line-height: 1; vertical-align: baseline; top: -0.5em; unicode-bidi: isolate; white-space: nowrap; font-weight: normal; font-style: normal;"><a style="color: #0b0080; text-decoration: none; background: none;" href="https://en.wikipedia.org/wiki/Operating_system#cite_note-2">[2]</a></sup>&nbsp;although the application code is usually executed directly by the hardware and frequently makes&nbsp;<a style="color: #0b0080; text-decoration: none; background: none;" title="System call" href="https://en.wikipedia.org/wiki/System_call">system calls</a>&nbsp;to an OS function or is interrupted by it. Operating systems are found on many devices that contain a computer&nbsp;– from&nbsp;<a class="mw-redirect" style="color: #0b0080; text-decoration: none; background: none;" title="Cellular phone" href="https://en.wikipedia.org/wiki/Cellular_phone">cellular phones</a>&nbsp;and&nbsp;<a style="color: #0b0080; text-decoration: none; background: none;" title="Video game console" href="https://en.wikipedia.org/wiki/Video_game_console">video game consoles</a>&nbsp;to&nbsp;<a style="color: #0b0080; text-decoration: none; background: none;" title="Web server" href="https://en.wikipedia.org/wiki/Web_server">web servers</a>&nbsp;and&nbsp;<a style="color: #0b0080; text-decoration: none; background: none;" title="Supercomputer" href="https://en.wikipedia.org/wiki/Supercomputer">supercomputers</a>.</p>\r\n<p style="margin: 0.5em 0px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; line-height: inherit; color: #222222; font-family: sans-serif; font-size: 14px; background-color: #ffffff;">The dominant desktop operating system is&nbsp;<a style="color: #0b0080; text-decoration: none; background: none;" title="Microsoft Windows" href="https://en.wikipedia.org/wiki/Microsoft_Windows">Microsoft Windows</a>&nbsp;with a market share of around 82.74%.&nbsp;<a style="color: #0b0080; text-decoration: none; background: none;" title="MacOS" href="https://en.wikipedia.org/wiki/MacOS">macOS</a>&nbsp;by&nbsp;<a style="color: #0b0080; text-decoration: none; background: none;" title="Apple Inc." href="https://en.wikipedia.org/wiki/Apple_Inc.">Apple Inc.</a>&nbsp;is in second place (13.23%), and the varieties of&nbsp;<a style="color: #0b0080; text-decoration: none; background: none;" title="Linux" href="https://en.wikipedia.org/wiki/Linux">Linux</a>&nbsp;are collectively in third place (1.57%).<sup id="cite_ref-3" class="reference" style="position: relative; font-size: 11.2px; line-height: 1; vertical-align: baseline; top: -0.5em; unicode-bidi: isolate; white-space: nowrap; font-weight: normal; font-style: normal;"><a style="color: #0b0080; text-decoration: none; background: none;" href="https://en.wikipedia.org/wiki/Operating_system#cite_note-3">[3]</a></sup>&nbsp;In the&nbsp;<a style="color: #0b0080; text-decoration: none; background: none;" title="Mobile operating system" href="https://en.wikipedia.org/wiki/Mobile_operating_system">mobile</a>&nbsp;(<a style="color: #0b0080; text-decoration: none; background: none;" title="Smartphone" href="https://en.wikipedia.org/wiki/Smartphone">smartphone</a>&nbsp;and&nbsp;<a style="color: #0b0080; text-decoration: none; background: none;" title="Tablet computer" href="https://en.wikipedia.org/wiki/Tablet_computer">tablet</a>&nbsp;combined) sector, use in 2017 is up to 70% of&nbsp;<a style="color: #0b0080; text-decoration: none; background: none;" title="Google" href="https://en.wikipedia.org/wiki/Google">Google</a>\'s&nbsp;<a style="color: #0b0080; text-decoration: none; background: none;" title="Android (operating system)" href="https://en.wikipedia.org/wiki/Android_(operating_system)">Android</a><sup id="cite_ref-4" class="reference" style="position: relative; font-size: 11.2px; line-height: 1; vertical-align: baseline; top: -0.5em; unicode-bidi: isolate; white-space: nowrap; font-weight: normal; font-style: normal;"><a style="color: #0b0080; text-decoration: none; background: none;" href="https://en.wikipedia.org/wiki/Operating_system#cite_note-4">[4]</a></sup>&nbsp;and according to third quarter 2016 data, Android on smartphones is dominant with 87.5 percent and a growth rate 10.3 percent per year, followed by&nbsp;<a style="color: #0b0080; text-decoration: none; background: none;" title="Apple Inc." href="https://en.wikipedia.org/wiki/Apple_Inc.">Apple</a>\'s&nbsp;<a style="color: #0b0080; text-decoration: none; background: none;" title="IOS" href="https://en.wikipedia.org/wiki/IOS">iOS</a>&nbsp;with 12.1 percent and a per year decrease in market share of 5.2 percent, while other operating systems amount to just 0.3 percent.<sup id="cite_ref-5" class="reference" style="position: relative; font-size: 11.2px; line-height: 1; vertical-align: baseline; top: -0.5em; unicode-bidi: isolate; white-space: nowrap; font-weight: normal; font-style: normal;"><a style="color: #0b0080; text-decoration: none; background: none;" href="https://en.wikipedia.org/wiki/Operating_system#cite_note-5">[5]</a></sup>&nbsp;<a style="color: #0b0080; text-decoration: none; background: none;" title="Linux distribution" href="https://en.wikipedia.org/wiki/Linux_distribution">Linux distributions</a>&nbsp;are dominant in the server and supercomputing sectors. Other specialized classes of operating systems, such as embedded and real-time systems, exist for many applications.</p>', 1, 'position-3', 0, '0000-00-00 00:00:00', '2018-07-01 20:12:33', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 0, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(99, 86, 'Photo Position', '', '', 12, 'position-7', 291, '2018-07-01 23:23:33', '2018-07-01 23:21:47', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(101, 89, 'PhotoOS', '', '<p><img src="images/OS_for_Computer/windows.jpg" alt="windows" /></p>', 13, 'position-7', 0, '0000-00-00 00:00:00', '2018-07-02 01:03:39', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"0","backgroundimage":"images\\/OS_for_Computer\\/windows.jpg","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(102, 90, 'Search', '', '', 2, 'position-8', 291, '2018-07-02 14:51:18', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_search', 1, 1, '{"label":"","width":"","text":"","button":"0","button_pos":"left","imagebutton":"0","button_text":"","opensearch":"1","opensearch_title":"","set_itemid":"0","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(103, 94, 'ComputerOS', '', '', 3, 'position-8', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 1, '{"menutype":"os-for-computer","base":"","startLevel":"1","endLevel":"0","showAllChildren":"1","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(104, 96, 'MobileOS', '', '', 6, 'position-8', 291, '2018-07-05 02:09:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 1, '{"menutype":"os-for-mobile","base":"","startLevel":"1","endLevel":"0","showAllChildren":"1","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(105, 102, 'Versions', '', '', 4, 'position-8', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 1, '{"menutype":"versions","base":"","startLevel":"1","endLevel":"0","showAllChildren":"1","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(106, 116, 'Versions', '', '', 7, 'position-8', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 1, '{"menutype":"versions-for-mobile","base":"","startLevel":"1","endLevel":"0","showAllChildren":"1","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(107, 121, 'menu', '', '', 1, 'position-1', 0, '0000-00-00 00:00:00', '2018-07-02 15:02:20', '0000-00-00 00:00:00', -2, 'mod_menu', 1, 1, '{"menutype":"os-for-computer","base":"","startLevel":"1","endLevel":"0","showAllChildren":"1","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(108, 122, 'Language', '', '', 1, 'position-8', 0, '0000-00-00 00:00:00', '2018-07-02 15:05:04', '0000-00-00 00:00:00', -2, 'mod_languages', 1, 1, '{"header_text":"","footer_text":"","dropdown":"0","dropdownimage":"1","lineheight":"0","image":"1","show_active":"1","full_name":"1","inline":"1","layout":"_:default","moduleclass_sfx":"","cache":"0","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(109, 129, 'Linux logo', '', '<p><img src="images/OS_for_Computer/linux.jpg" alt="linux" /></p>', 7, 'position-7', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(110, 130, 'Windows Logo', '', '<p><img src="images/OS_for_Computer/windows.png" alt="windows" /></p>', 6, 'position-7', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(111, 131, 'MacOS Logo', '', '<p><img src="images/OS_for_Computer/macOS.jpg" alt="macOS" /></p>', 5, 'position-7', 0, '0000-00-00 00:00:00', '2018-07-05 01:47:44', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(112, 132, 'Android Logo', '', '<p><img src="images/OS_for_Computer/android.jpg" alt="android" /></p>', 4, 'position-7', 291, '2018-07-04 23:14:17', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(113, 133, 'iOS Logo', '', '<p><img src="images/OS_for_Computer/ios.jpg" alt="ios" /></p>', 3, 'position-7', 0, '0000-00-00 00:00:00', '2018-07-04 23:16:42', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(114, 134, 'Just a line', '', '<hr />\r\n<p>&nbsp;</p>', 5, 'position-8', 291, '2018-07-02 16:06:47', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 0, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(115, 135, 'FunctionOS', '', '<p><img src="images/OS_for_Computer/General_OS.PNG" alt="General OS" /></p>', 2, 'position-7', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(116, 136, 'Communication', '', '<p><img src="images/OS_for_Computer/communication.jpg" alt="communication" /></p>', 1, 'position-7', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*');

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_modules_menu`
--

CREATE TABLE `uoj7s_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uoj7s_modules_menu`
--

INSERT INTO `uoj7s_modules_menu` (`moduleid`, `menuid`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(12, 0),
(13, 0),
(14, 0),
(15, 0),
(16, 0),
(17, 0),
(79, 0),
(86, 0),
(87, 0),
(88, 0),
(89, 0),
(90, 0),
(91, 0),
(92, 0),
(93, 0),
(94, 0),
(95, 0),
(96, 0),
(97, 0),
(98, 0),
(99, -101),
(100, 0),
(101, -107),
(101, -101),
(102, 0),
(103, 108),
(103, 109),
(103, 110),
(103, 111),
(103, 112),
(103, 113),
(103, 114),
(103, 115),
(103, 116),
(103, 117),
(103, 118),
(103, 119),
(103, 123),
(104, 0),
(105, 108),
(105, 109),
(105, 110),
(105, 111),
(105, 112),
(105, 113),
(105, 114),
(105, 115),
(105, 116),
(105, 117),
(105, 118),
(105, 119),
(105, 123),
(106, 108),
(106, 109),
(106, 110),
(106, 111),
(106, 112),
(106, 113),
(106, 114),
(106, 115),
(106, 116),
(106, 117),
(106, 118),
(106, 119),
(106, 123),
(107, 0),
(108, 0),
(109, 111),
(109, 115),
(110, 110),
(110, 116),
(111, 112),
(111, 117),
(111, 123),
(112, 113),
(112, 118),
(113, 114),
(113, 119),
(114, 0),
(115, 108),
(116, 109);

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_newsfeeds`
--

CREATE TABLE `uoj7s_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT '0',
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `link` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `numarticles` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `cache_time` int(10) UNSIGNED NOT NULL DEFAULT '3600',
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rtl` tinyint(4) NOT NULL DEFAULT '0',
  `access` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `hits` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_overrider`
--

CREATE TABLE `uoj7s_overrider` (
  `id` int(10) NOT NULL COMMENT 'Primary Key',
  `constant` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `string` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_postinstall_messages`
--

CREATE TABLE `uoj7s_postinstall_messages` (
  `postinstall_message_id` bigint(20) UNSIGNED NOT NULL,
  `extension_id` bigint(20) NOT NULL DEFAULT '700' COMMENT 'FK to #__extensions',
  `title_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Lang key for the title',
  `description_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Lang key for description',
  `action_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `language_extension` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'com_postinstall' COMMENT 'Extension holding lang keys',
  `language_client_id` tinyint(3) NOT NULL DEFAULT '1',
  `type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'link' COMMENT 'Message type - message, link, action',
  `action_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'RAD URI to the PHP file containing action method',
  `action` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'Action method name or URL',
  `condition_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'RAD URI to file holding display condition method',
  `condition_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Display condition method, must return boolean',
  `version_introduced` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '3.2.0' COMMENT 'Version when this message was introduced',
  `enabled` tinyint(3) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uoj7s_postinstall_messages`
--

INSERT INTO `uoj7s_postinstall_messages` (`postinstall_message_id`, `extension_id`, `title_key`, `description_key`, `action_key`, `language_extension`, `language_client_id`, `type`, `action_file`, `action`, `condition_file`, `condition_method`, `version_introduced`, `enabled`) VALUES
(1, 700, 'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_TITLE', 'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_BODY', 'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_ACTION', 'plg_twofactorauth_totp', 1, 'action', 'site://plugins/twofactorauth/totp/postinstall/actions.php', 'twofactorauth_postinstall_action', 'site://plugins/twofactorauth/totp/postinstall/actions.php', 'twofactorauth_postinstall_condition', '3.2.0', 1),
(2, 700, 'COM_CPANEL_WELCOME_BEGINNERS_TITLE', 'COM_CPANEL_WELCOME_BEGINNERS_MESSAGE', '', 'com_cpanel', 1, 'message', '', '', '', '', '3.2.0', 1),
(3, 700, 'COM_CPANEL_MSG_STATS_COLLECTION_TITLE', 'COM_CPANEL_MSG_STATS_COLLECTION_BODY', '', 'com_cpanel', 1, 'message', '', '', 'admin://components/com_admin/postinstall/statscollection.php', 'admin_postinstall_statscollection_condition', '3.5.0', 1),
(4, 700, 'PLG_SYSTEM_UPDATENOTIFICATION_POSTINSTALL_UPDATECACHETIME', 'PLG_SYSTEM_UPDATENOTIFICATION_POSTINSTALL_UPDATECACHETIME_BODY', 'PLG_SYSTEM_UPDATENOTIFICATION_POSTINSTALL_UPDATECACHETIME_ACTION', 'plg_system_updatenotification', 1, 'action', 'site://plugins/system/updatenotification/postinstall/updatecachetime.php', 'updatecachetime_postinstall_action', 'site://plugins/system/updatenotification/postinstall/updatecachetime.php', 'updatecachetime_postinstall_condition', '3.6.3', 1),
(5, 700, 'COM_CPANEL_MSG_JOOMLA40_PRE_CHECKS_TITLE', 'COM_CPANEL_MSG_JOOMLA40_PRE_CHECKS_BODY', '', 'com_cpanel', 1, 'message', '', '', 'admin://components/com_admin/postinstall/joomla40checks.php', 'admin_postinstall_joomla40checks_condition', '3.7.0', 1),
(6, 700, 'TPL_HATHOR_MESSAGE_POSTINSTALL_TITLE', 'TPL_HATHOR_MESSAGE_POSTINSTALL_BODY', 'TPL_HATHOR_MESSAGE_POSTINSTALL_ACTION', 'tpl_hathor', 1, 'action', 'admin://templates/hathor/postinstall/hathormessage.php', 'hathormessage_postinstall_action', 'admin://templates/hathor/postinstall/hathormessage.php', 'hathormessage_postinstall_condition', '3.7.0', 1),
(7, 700, 'PLG_PLG_RECAPTCHA_VERSION_1_POSTINSTALL_TITLE', 'PLG_PLG_RECAPTCHA_VERSION_1_POSTINSTALL_BODY', 'PLG_PLG_RECAPTCHA_VERSION_1_POSTINSTALL_ACTION', 'plg_captcha_recaptcha', 1, 'action', 'site://plugins/captcha/recaptcha/postinstall/actions.php', 'recaptcha_postinstall_action', 'site://plugins/captcha/recaptcha/postinstall/actions.php', 'recaptcha_postinstall_condition', '3.8.6', 1);

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_redirect_links`
--

CREATE TABLE `uoj7s_redirect_links` (
  `id` int(10) UNSIGNED NOT NULL,
  `old_url` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `new_url` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hits` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `published` tinyint(4) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `header` smallint(3) NOT NULL DEFAULT '301'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_schemas`
--

CREATE TABLE `uoj7s_schemas` (
  `extension_id` int(11) NOT NULL,
  `version_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uoj7s_schemas`
--

INSERT INTO `uoj7s_schemas` (`extension_id`, `version_id`) VALUES
(700, '3.8.9-2018-06-19'),
(10010, '1.0.0');

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_session`
--

CREATE TABLE `uoj7s_session` (
  `session_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint(3) UNSIGNED DEFAULT NULL,
  `guest` tinyint(4) UNSIGNED DEFAULT '1',
  `time` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `data` mediumtext COLLATE utf8mb4_unicode_ci,
  `userid` int(11) DEFAULT '0',
  `username` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uoj7s_session`
--

INSERT INTO `uoj7s_session` (`session_id`, `client_id`, `guest`, `time`, `data`, `userid`, `username`) VALUES
('1d0c44136d922fbfc02cfbab6a10a653', 0, 1, '1530758590', 'joomla|s:664:"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NzoiY291bnRlciI7aToxO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTUzMDc1ODU5MDtzOjQ6Imxhc3QiO2k6MTUzMDc1ODU5MDtzOjM6Im5vdyI7aToxNTMwNzU4NTkwO319czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086MjA6Ikpvb21sYVxDTVNcVXNlclxVc2VyIjoxOntzOjI6ImlkIjtpOjA7fX19czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjk6InNlcGFyYXRvciI7czoxOiIuIjt9";', 0, ''),
('20409610ed7e48291520647a73d39c63', 1, 0, '1530761504', 'joomla|s:4428:"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjo0OntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiY291bnRlciI7aTo4NDc7czo1OiJ0b2tlbiI7czozMjoieVlIREl1aXlFMzNKUzN6V094WDdET3d0eHVlczJkTGciO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTUzMDc1MDAzOTtzOjQ6Imxhc3QiO2k6MTUzMDc2MDc0MTtzOjM6Im5vdyI7aToxNTMwNzYxNTA0O319czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjk6e3M6OToiY29tX3VzZXJzIjtPOjg6InN0ZENsYXNzIjoxOntzOjQ6ImVkaXQiO086ODoic3RkQ2xhc3MiOjE6e3M6NDoidXNlciI7Tzo4OiJzdGRDbGFzcyI6Mjp7czoyOiJpZCI7YTowOnt9czo0OiJkYXRhIjtOO319fXM6MTA6ImNvbV9jb25maWciO086ODoic3RkQ2xhc3MiOjE6e3M6NjoiY29uZmlnIjtPOjg6InN0ZENsYXNzIjoxOntzOjY6Imdsb2JhbCI7Tzo4OiJzdGRDbGFzcyI6MTp7czo0OiJkYXRhIjtOO319fXM6OToiY29tX21lbnVzIjtPOjg6InN0ZENsYXNzIjoyOntzOjU6Iml0ZW1zIjtPOjg6InN0ZENsYXNzIjo2OntzOjg6Im1lbnV0eXBlIjtzOjg6Im1haW5tZW51IjtzOjQ6Imxpc3QiO2E6NDp7czo5OiJkaXJlY3Rpb24iO3M6MzoiYXNjIjtzOjU6ImxpbWl0IjtzOjI6IjIwIjtzOjg6Im9yZGVyaW5nIjtzOjU6ImEubGZ0IjtzOjU6InN0YXJ0IjtkOjA7fXM6OToiY2xpZW50X2lkIjtpOjA7czoxMDoibGltaXRzdGFydCI7aTowO3M6OToicHVibGlzaGVkIjtzOjE6IjEiO3M6NjoiZmlsdGVyIjthOjE6e3M6OToicHVibGlzaGVkIjtzOjE6IjEiO319czo0OiJlZGl0IjtPOjg6InN0ZENsYXNzIjoyOntzOjQ6Iml0ZW0iO086ODoic3RkQ2xhc3MiOjQ6e3M6MjoiaWQiO2E6Mzp7aTowO2k6MTE4O2k6MjtpOjExMTtpOjM7aToxMDg7fXM6NDoiZGF0YSI7TjtzOjQ6InR5cGUiO047czo0OiJsaW5rIjtOO31zOjQ6Im1lbnUiO086ODoic3RkQ2xhc3MiOjE6e3M6NDoiZGF0YSI7Tjt9fX1zOjE0OiJjb21fY2F0ZWdvcmllcyI7Tzo4OiJzdGRDbGFzcyI6Mjp7czoxMDoiY2F0ZWdvcmllcyI7Tzo4OiJzdGRDbGFzcyI6MTp7czo3OiJjb250ZW50IjtPOjg6InN0ZENsYXNzIjozOntzOjY6ImZpbHRlciI7Tzo4OiJzdGRDbGFzcyI6MTp7czo5OiJleHRlbnNpb24iO3M6MTE6ImNvbV9jb250ZW50Ijt9czo0OiJsaXN0IjthOjQ6e3M6OToiZGlyZWN0aW9uIjtzOjM6ImFzYyI7czo1OiJsaW1pdCI7czoyOiIyMCI7czo4OiJvcmRlcmluZyI7czo1OiJhLmxmdCI7czo1OiJzdGFydCI7ZDowO31zOjU6Im1vZGFsIjtPOjg6InN0ZENsYXNzIjoyOntzOjY6ImZpbHRlciI7Tzo4OiJzdGRDbGFzcyI6MTp7czo5OiJleHRlbnNpb24iO3M6MTE6ImNvbV9jb250ZW50Ijt9czo0OiJsaXN0IjthOjQ6e3M6OToiZGlyZWN0aW9uIjtzOjM6ImFzYyI7czo1OiJsaW1pdCI7czoyOiIyMCI7czo4OiJvcmRlcmluZyI7czo1OiJhLmxmdCI7czo1OiJzdGFydCI7ZDowO319fX1zOjQ6ImVkaXQiO086ODoic3RkQ2xhc3MiOjE6e3M6ODoiY2F0ZWdvcnkiO086ODoic3RkQ2xhc3MiOjI6e3M6MjoiaWQiO2E6Mzp7aTowO2k6ODtpOjE7aToxNTtpOjI7aToxNzt9czo0OiJkYXRhIjtOO319fXM6MTA6ImNvbV9maWVsZHMiO086ODoic3RkQ2xhc3MiOjI6e3M6NjoiZmllbGRzIjtPOjg6InN0ZENsYXNzIjoyOntzOjc6ImNvbnRleHQiO3M6MTk6ImNvbV9jb250ZW50LmFydGljbGUiO3M6NDoibGlzdCI7YTo0OntzOjk6ImRpcmVjdGlvbiI7czozOiJhc2MiO3M6NToibGltaXQiO3M6MjoiMjAiO3M6ODoib3JkZXJpbmciO3M6MTA6ImEub3JkZXJpbmciO3M6NToic3RhcnQiO2Q6MDt9fXM6NjoiZ3JvdXBzIjtPOjg6InN0ZENsYXNzIjoxOntzOjc6ImNvbnRleHQiO3M6MTk6ImNvbV9jb250ZW50LmFydGljbGUiO319czoxMToiY29tX2NvbnRlbnQiO086ODoic3RkQ2xhc3MiOjI6e3M6NDoiZWRpdCI7Tzo4OiJzdGRDbGFzcyI6MTp7czo3OiJhcnRpY2xlIjtPOjg6InN0ZENsYXNzIjoyOntzOjI6ImlkIjthOjI6e2k6MTtpOjM1O2k6MjtpOjIwO31zOjQ6ImRhdGEiO047fX1zOjg6ImFydGljbGVzIjtPOjg6InN0ZENsYXNzIjo0OntzOjY6ImZpbHRlciI7YTozOntzOjExOiJjYXRlZ29yeV9pZCI7czoyOiIxNSI7czo5OiJwdWJsaXNoZWQiO3M6MToiMSI7czo1OiJsZXZlbCI7czoxOiIxIjt9czo0OiJsaXN0IjthOjI6e3M6MTI6ImZ1bGxvcmRlcmluZyI7czoxNDoiYS5vcmRlcmluZyBBU0MiO3M6NToibGltaXQiO3M6MjoiMjAiO31zOjEwOiJsaW1pdHN0YXJ0IjtpOjA7czo1OiJtb2RhbCI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo2OiJmaWx0ZXIiO2E6NDp7czo2OiJzZWFyY2giO3M6MzoiaW9zIjtzOjk6InB1Ymxpc2hlZCI7czowOiIiO3M6ODoibGFuZ3VhZ2UiO3M6MDoiIjtzOjU6ImxldmVsIjtzOjA6IiI7fXM6NDoibGlzdCI7YToyOntzOjEyOiJmdWxsb3JkZXJpbmciO3M6OToiYS5pZCBERVNDIjtzOjU6ImxpbWl0IjtzOjI6IjIwIjt9czoxMDoibGltaXRzdGFydCI7aTowO319fXM6MTE6ImNvbV9tb2R1bGVzIjtPOjg6InN0ZENsYXNzIjoyOntzOjQ6ImVkaXQiO086ODoic3RkQ2xhc3MiOjE6e3M6NjoibW9kdWxlIjtPOjg6InN0ZENsYXNzIjoyOntzOjI6ImlkIjthOjE6e2k6MDtpOjEwNDt9czo0OiJkYXRhIjtOO319czozOiJhZGQiO086ODoic3RkQ2xhc3MiOjE6e3M6NjoibW9kdWxlIjtPOjg6InN0ZENsYXNzIjoyOntzOjEyOiJleHRlbnNpb25faWQiO047czo2OiJwYXJhbXMiO047fX19czoxMzoiY29tX2luc3RhbGxlciI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo3OiJtZXNzYWdlIjtzOjA6IiI7czoxNzoiZXh0ZW5zaW9uX21lc3NhZ2UiO3M6MDoiIjt9czoxMToiY29tX2NvbnRhY3QiO086ODoic3RkQ2xhc3MiOjE6e3M6NDoiZWRpdCI7Tzo4OiJzdGRDbGFzcyI6MTp7czo3OiJjb250YWN0IjtPOjg6InN0ZENsYXNzIjoyOntzOjI6ImlkIjthOjA6e31zOjQ6ImRhdGEiO047fX19fXM6MTQ6IgAqAGluaXRpYWxpemVkIjtiOjA7czo5OiJzZXBhcmF0b3IiO3M6MToiLiI7fXM6NDoidXNlciI7TzoyMDoiSm9vbWxhXENNU1xVc2VyXFVzZXIiOjE6e3M6MjoiaWQiO3M6MzoiMjkxIjt9czoxMToiYXBwbGljYXRpb24iO086ODoic3RkQ2xhc3MiOjE6e3M6NToicXVldWUiO2E6MDp7fX19fXM6MTQ6IgAqAGluaXRpYWxpemVkIjtiOjA7czo5OiJzZXBhcmF0b3IiO3M6MToiLiI7fQ==";', 291, 'admin'),
('2b65eb0fec92d4b42f90ab9777d0a568', 1, 1, '1530759790', 'joomla|s:736:"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiY291bnRlciI7aToyO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTUzMDc1OTc3ODtzOjQ6Imxhc3QiO2k6MTUzMDc1OTc3ODtzOjM6Im5vdyI7aToxNTMwNzU5Nzg3O31zOjU6InRva2VuIjtzOjMyOiJ2YUl2cFhQTmFiR05RZ1gwVzJhZ2NEcjF3UHRuWUVvYyI7fXM6ODoicmVnaXN0cnkiO086MjQ6Ikpvb21sYVxSZWdpc3RyeVxSZWdpc3RyeSI6Mzp7czo3OiIAKgBkYXRhIjtPOjg6InN0ZENsYXNzIjowOnt9czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjk6InNlcGFyYXRvciI7czoxOiIuIjt9czo0OiJ1c2VyIjtPOjIwOiJKb29tbGFcQ01TXFVzZXJcVXNlciI6MTp7czoyOiJpZCI7aTowO319fXM6MTQ6IgAqAGluaXRpYWxpemVkIjtiOjA7czo5OiJzZXBhcmF0b3IiO3M6MToiLiI7fQ==";', 0, ''),
('42a23960fd822ee1fd3051205884f314', 0, 1, '1530759368', 'joomla|s:664:"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NzoiY291bnRlciI7aToxO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTUzMDc1OTM2ODtzOjQ6Imxhc3QiO2k6MTUzMDc1OTM2ODtzOjM6Im5vdyI7aToxNTMwNzU5MzY4O319czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086MjA6Ikpvb21sYVxDTVNcVXNlclxVc2VyIjoxOntzOjI6ImlkIjtpOjA7fX19czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjk6InNlcGFyYXRvciI7czoxOiIuIjt9";', 0, ''),
('4518091989dc8d047a9c386eb61d649e', 0, 1, '1530760628', 'joomla|s:880:"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiY291bnRlciI7aTozMzA7czo1OiJ0aW1lciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo1OiJzdGFydCI7aToxNTMwNzUwMDExO3M6NDoibGFzdCI7aToxNTMwNzYwMTYwO3M6Mzoibm93IjtpOjE1MzA3NjA2Mjc7fXM6NToidG9rZW4iO3M6MzI6IkdTaUFJZzh3RGdHSE04ZFJWNW1rUEZuTFhSSVRVRFFWIjt9czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6MTE6ImNvbV9jb250YWN0IjtPOjg6InN0ZENsYXNzIjoxOntzOjc6ImNvbnRhY3QiO086ODoic3RkQ2xhc3MiOjE6e3M6NDoiZGF0YSI7YToxOntzOjU6ImNhdGlkIjtzOjE6IjQiO319fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086MjA6Ikpvb21sYVxDTVNcVXNlclxVc2VyIjoxOntzOjI6ImlkIjtpOjA7fX19czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjk6InNlcGFyYXRvciI7czoxOiIuIjt9";', 0, ''),
('7517cb674922fd8ce15587ec0ef4e2b3', 0, 1, '1530760629', 'joomla|s:664:"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NzoiY291bnRlciI7aToxO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTUzMDc2MDYyOTtzOjQ6Imxhc3QiO2k6MTUzMDc2MDYyOTtzOjM6Im5vdyI7aToxNTMwNzYwNjI5O319czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086MjA6Ikpvb21sYVxDTVNcVXNlclxVc2VyIjoxOntzOjI6ImlkIjtpOjA7fX19czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjk6InNlcGFyYXRvciI7czoxOiIuIjt9";', 0, ''),
('75dfb115dff1a0242fb59c4f67662bd4', 0, 1, '1530760162', 'joomla|s:664:"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NzoiY291bnRlciI7aToxO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTUzMDc2MDE2MTtzOjQ6Imxhc3QiO2k6MTUzMDc2MDE2MTtzOjM6Im5vdyI7aToxNTMwNzYwMTYxO319czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086MjA6Ikpvb21sYVxDTVNcVXNlclxVc2VyIjoxOntzOjI6ImlkIjtpOjA7fX19czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjk6InNlcGFyYXRvciI7czoxOiIuIjt9";', 0, ''),
('9fca93a8fed77bf0307ec7bc256c2b11', 1, 1, '1530759778', 'joomla|s:736:"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiY291bnRlciI7aToxO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTUzMDc1OTc3NztzOjQ6Imxhc3QiO2k6MTUzMDc1OTc3NztzOjM6Im5vdyI7aToxNTMwNzU5Nzc3O31zOjU6InRva2VuIjtzOjMyOiJpbk9XU0kzMUY2clVPdzVLZVNBWTNFR0xtWU1BUEJ4cyI7fXM6ODoicmVnaXN0cnkiO086MjQ6Ikpvb21sYVxSZWdpc3RyeVxSZWdpc3RyeSI6Mzp7czo3OiIAKgBkYXRhIjtPOjg6InN0ZENsYXNzIjowOnt9czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjk6InNlcGFyYXRvciI7czoxOiIuIjt9czo0OiJ1c2VyIjtPOjIwOiJKb29tbGFcQ01TXFVzZXJcVXNlciI6MTp7czoyOiJpZCI7aTowO319fXM6MTQ6IgAqAGluaXRpYWxpemVkIjtiOjA7czo5OiJzZXBhcmF0b3IiO3M6MToiLiI7fQ==";', 0, ''),
('bb8e00013dd7f00a979bd235f1ad5ae1', 0, 1, '1530759773', 'joomla|s:664:"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NzoiY291bnRlciI7aToxO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTUzMDc1OTc3MjtzOjQ6Imxhc3QiO2k6MTUzMDc1OTc3MjtzOjM6Im5vdyI7aToxNTMwNzU5NzcyO319czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086MjA6Ikpvb21sYVxDTVNcVXNlclxVc2VyIjoxOntzOjI6ImlkIjtpOjA7fX19czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjk6InNlcGFyYXRvciI7czoxOiIuIjt9";', 0, ''),
('e1a58d3273bb48a1029936b0f33f587c', 0, 1, '1530759739', 'joomla|s:664:"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NzoiY291bnRlciI7aToxO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTUzMDc1OTczODtzOjQ6Imxhc3QiO2k6MTUzMDc1OTczODtzOjM6Im5vdyI7aToxNTMwNzU5NzM4O319czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086MjA6Ikpvb21sYVxDTVNcVXNlclxVc2VyIjoxOntzOjI6ImlkIjtpOjA7fX19czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjk6InNlcGFyYXRvciI7czoxOiIuIjt9";', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_sunfw_styles`
--

CREATE TABLE `uoj7s_sunfw_styles` (
  `id` int(11) NOT NULL,
  `style_id` int(11) DEFAULT NULL,
  `template` varchar(250) DEFAULT '',
  `layout_builder_data` longtext,
  `mega_menu_data` longtext,
  `appearance_data` longtext,
  `system_data` longtext,
  `cookie_law_data` longtext,
  `social_share_data` longtext,
  `commenting_data` longtext,
  `custom_404_data` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `uoj7s_sunfw_styles`
--

INSERT INTO `uoj7s_sunfw_styles` (`id`, `style_id`, `template`, `layout_builder_data`, `mega_menu_data`, `appearance_data`, `system_data`, `cookie_law_data`, `social_share_data`, `commenting_data`, `custom_404_data`) VALUES
(1, 9, 'jsn_teki2_pro', '{"appliedLayout":"Default","settings":{"enable_responsive":0,"show_desktop_switcher":0,"enable_boxed_layout":null,"width_boxed_layout":"960","margin":"","go_to_top":"1","icon_go_to_top":"fa-ban","text_go_to_top":"Go to top","color_go_to_top":"#dddddd","bg_go_to_top":"#566769","ps_go_to_top":"center"},"sections":[{"id":"section_header","settings":{"name":"Header","identification_code":"item_85438747237","full_width":null,"enable_sticky":null,"margin":"","padding":"","class":""},"rows":[0,12],"label":"Header"},{"id":"section_main-body","settings":{"name":"Main Body","identification_code":"item_837851092455","full_width":null,"enable_sticky":0,"margin":"","padding":{"top":"20","left":"","right":"","bottom":"20"},"class":""},"rows":[1],"label":"Main Body"},{"id":"section_promo","settings":{"name":"Promo","identification_code":"item_244033034752","full_width":null,"enable_sticky":0,"margin":{"top":"20","bottom":"","left":"","right":""},"padding":"","class":""},"rows":[2],"label":"Promo"},null,{"id":"section_content-top","settings":{"name":"Content-top","identification_code":"item_716072535188","full_width":null,"enable_sticky":0,"margin":{"top":"20","bottom":"","left":"","right":""},"padding":"","class":""},"rows":[5],"label":"Content-top"},null,{"id":"section_content-bottom","settings":{"name":"Content-bottom","identification_code":"item_533774759645","full_width":null,"enable_sticky":0,"margin":{"top":"","left":"","right":"","bottom":"20"},"padding":"","class":""},"rows":[7],"label":"Content-bottom"},null,{"id":"section_footer","settings":{"name":"Footer","identification_code":"item_170798028878","full_width":null,"enable_sticky":0,"margin":"","padding":{"top":"20","left":"","right":"","bottom":"20"},"class":""},"rows":[9],"label":"Footer"}],"rows":[{"id":"row_row-0","settings":{"name":"Row #0","identification_code":"item_1328992780517","margin":"","padding":{"top":"5","bottom":"5","left":"","right":""},"class":"sunfw-flex flex-items-middle"},"columns":[17,0,16]},{"id":"row_row-1","settings":{"name":"Row #1"},"columns":[7,1,8]},{"id":"row_row-2","settings":{"name":"Row #2"},"columns":[2]},null,null,{"id":"row_row-5","settings":{"name":"Row #5"},"columns":[5]},null,{"id":"row_row-7","settings":{"name":"Row #7"},"columns":[9]},null,{"id":"row_row-9","settings":{"name":"Row #9"},"columns":[11,12]},null,null,{"id":"row_row-12","settings":{"name":"Row #12"},"columns":[15]}],"columns":[{"id":"column_column-0","width":{"lg":4,"md":4,"sm":4,"xs":12},"settings":{"name":"Column #0"},"items":[2]},{"id":"column_column-1","width":{"lg":6,"md":4,"sm":6,"xs":12},"settings":{"name":"Column #1","identification_code":"item_385334350976","margin":"","padding":"","visible_in":["lg","md","sm","xs"],"class":"teki-mainbody"},"items":[18,1]},{"id":"column_column-2","width":{"lg":12,"md":12,"sm":12,"xs":12},"settings":{"name":"Column #2"},"items":[3]},null,null,{"id":"column_column-5","width":{"lg":12,"md":12,"sm":12,"xs":12},"settings":{"name":"Column #5"},"items":[7]},null,{"id":"column_column-7","settings":{"name":"Column #7"},"items":[9],"width":{"lg":3,"md":4,"sm":3,"xs":12}},{"id":"column_column-8","settings":{"name":"Column #8"},"items":[10],"width":{"lg":3,"md":4,"sm":3,"xs":12}},{"id":"column_column-9","width":{"lg":12,"md":12,"sm":12,"xs":12},"settings":{"name":"Column #9"},"items":[11]},null,{"id":"column_column-11","width":{"lg":6,"md":6,"sm":6,"xs":12},"settings":{"name":"Column #11"},"items":[13]},{"id":"column_column-12","settings":{"name":"Column #12"},"items":[14],"width":{"lg":6,"md":6,"sm":6,"xs":12}},null,null,{"id":"column_column-15","width":{"lg":12,"md":12,"sm":12,"xs":12},"settings":{"name":"Column #15"},"items":[4]},{"id":"column_column-16","settings":{"name":"Column #16","identification_code":"item_847484726867","margin":"","padding":"","visible_in":["lg","md","sm","xs"],"class":"sunfw-flex flex-items-right flex-items-middle"},"items":[17],"width":{"lg":4,"md":4,"sm":4,"xs":12}},{"id":"column_column-17","settings":{"name":"Column #17"},"items":[16],"width":{"lg":4,"md":4,"sm":4,"xs":12}}],"items":[null,{"id":"item_main-body","type":"page-content","settings":{"name":"Main Body"}},{"id":"item_logo","type":"logo","settings":{"name":"Logo","identification_code":"item_384333124087","logo":"templates\\/jsn_teki2_pro\\/images\\/logo\\/logo_blue.png","mobile-logo":"","alt":"","link":"","visible_in":["lg","md","sm","xs"],"class":""}},{"id":"item_position-promo","type":"module-position","settings":{"name":"Position: Promo","identification_code":"item_946776786385","module-position":"promo","visible_in":["lg","md","sm","xs"],"class":""}},{"id":"item_menu","type":"menu","settings":{"name":"Menu","identification_code":"item_1001529872525","menu-type":"mainmenu","menu-item":"","menu-start-level":"1","menu-end-level":"0","menu-show-icon":"1","menu-show-description":null,"menu-show-submenu":"1","menu-sub-effect":"1","menu-mobile-target":1,"visible_in":["lg","md","sm","xs"],"class":"mainmenu"}},null,null,{"id":"item_position-content-top","type":"module-position","settings":{"name":"Position: Content-top","identification_code":"item_667299037647","module-position":"content-top","visible_in":["lg","md","sm","xs"],"class":""}},null,{"id":"item_position-left","type":"module-position","settings":{"name":"Position: Left","identification_code":"item_310340451797","module-position":"left","visible_in":["lg","md","sm","xs"],"class":""}},{"id":"item_position-right","type":"module-position","settings":{"name":"Position: Right","identification_code":"item_1104246053823","module-position":"right","visible_in":["lg","md","sm","xs"],"class":""}},{"id":"item_position-content-bottom","type":"module-position","settings":{"name":"Position: Content-bottom","identification_code":"item_153740805484","module-position":"content-bottom","visible_in":["lg","md","sm","xs"],"class":""}},null,{"id":"item_custom-html_1503487859833","type":"custom-html","settings":{"name":"Custom HTML","identification_code":"item_661193677556","html":"The Joomla! name is used under a limited license from Open Source Matters in the United States and other countries. JoomlaShine.com is not affiliated with or endorsed by Open Source Matters or the Joomla! Project.","visible_in":["lg","md","sm","xs"],"class":""}},{"id":"item_custom-html","type":"custom-html","settings":{"name":"Custom HTML","identification_code":"item_674711838637","html":"<p>Copyright \\u00a9 2008 - 2015 JoomlaShine.com. All rights reserved. Many features demonstrated on this website are available only in JSN Gruve PRO Edition.<\\/p>\\n<p>All stock photos used on this JSN Gruve demo site are only for demo purposes and not included in the template package.<\\/p>","visible_in":["lg","md","sm","xs"],"class":"text-right"}},null,{"id":"item_position-top","type":"module-position","settings":{"name":"Position: Top","identification_code":"item_1260163553282","module-position":"top","visible_in":["lg","md","sm","xs"],"class":""}},{"id":"item_social-icons","type":"social-icon","settings":{"name":"Social Icons","identification_code":"item_590359651650","items":[{"icon":"fa fa-facebook","text":"Facebook","title":"","link":"https:\\/\\/www.facebook.com\\/groups\\/364929833588485\\/"},{"icon":"fa fa-twitter","text":"Twitter","title":"","link":""},{"icon":"fa fa-twitter","text":"Twitter","link":"","title":"Twitter (copy)"},{"icon":"fa fa-youtube","text":"YouTube","title":"","link":""}],"color":"#F86201","size":14,"target":"","visible_in":["lg","md","sm","xs"],"class":"gruve-social"}},{"id":"item_position-breadcrumbs","type":"module-position","settings":{"name":"Position: Breadcrumbs","identification_code":"item_68979313229","module-position":"breadcrumbs","visible_in":["lg","md","sm","xs"],"class":"aaaaa"}}],"views":{"main":{"sections":[0,2,4,1,6,8]},"top":{"rows":[],"settings":{"show-toggle":1,"anchor-position":"center"}},"right":{"rows":[],"settings":{"show-toggle":1,"anchor-position":"middle"}},"bottom":{"rows":[],"settings":{"show-toggle":1,"anchor-position":"center"}},"left":{"rows":[],"settings":{"show-toggle":1,"anchor-position":"middle"}}},"screen":"lg","editing":"item_17"}', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_tags`
--

CREATE TABLE `uoj7s_tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `path` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `urls` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `hits` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uoj7s_tags`
--

INSERT INTO `uoj7s_tags` (`id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `created_by_alias`, `modified_user_id`, `modified_time`, `images`, `urls`, `hits`, `language`, `version`, `publish_up`, `publish_down`) VALUES
(1, 0, 0, 3, 0, '', 'ROOT', 'root', '', '', 1, 0, '0000-00-00 00:00:00', 1, '', '', '', '', 291, '2018-06-29 21:04:19', '', 0, '0000-00-00 00:00:00', '', '', 0, '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 1, 1, 2, 1, 'os', 'OS ', 'os', '', '', 1, 0, '2018-06-30 17:35:17', 1, '{}', '', '', '{}', 291, '2018-06-30 17:35:17', '', 0, '2018-06-30 17:35:17', '{}', '{}', 0, '*', 1, '2018-06-30 17:35:17', '2018-06-30 17:35:17');

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_template_styles`
--

CREATE TABLE `uoj7s_template_styles` (
  `id` int(10) UNSIGNED NOT NULL,
  `template` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `home` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uoj7s_template_styles`
--

INSERT INTO `uoj7s_template_styles` (`id`, `template`, `client_id`, `home`, `title`, `params`) VALUES
(4, 'beez3', 0, '0', 'Beez3 - Default', '{"wrapperSmall":"53","wrapperLarge":"72","logo":"images\\/joomla_black.png","sitetitle":"Joomla!","sitedescription":"Open Source Content Management","navposition":"left","templatecolor":"personal","html5":"0"}'),
(5, 'hathor', 1, '0', 'Hathor - Default', '{"showSiteName":"0","colourChoice":"","boldText":"0"}'),
(7, 'protostar', 0, '1', 'protostar - Default', '{"templateColor":"","logoFile":"","googleFont":"1","googleFontName":"Open+Sans","fluidContainer":"0"}'),
(8, 'isis', 1, '1', 'isis - Default', '{"templateColor":"","logoFile":""}'),
(9, 'jsn_teki2_pro', 0, '0', 'JSN Teki 2 - Default', '{}');

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_ucm_base`
--

CREATE TABLE `uoj7s_ucm_base` (
  `ucm_id` int(10) UNSIGNED NOT NULL,
  `ucm_item_id` int(10) NOT NULL,
  `ucm_type_id` int(11) NOT NULL,
  `ucm_language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uoj7s_ucm_base`
--

INSERT INTO `uoj7s_ucm_base` (`ucm_id`, `ucm_item_id`, `ucm_type_id`, `ucm_language_id`) VALUES
(1, 3, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_ucm_content`
--

CREATE TABLE `uoj7s_ucm_content` (
  `core_content_id` int(10) UNSIGNED NOT NULL,
  `core_type_alias` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'FK to the content types table',
  `core_title` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `core_body` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_state` tinyint(1) NOT NULL DEFAULT '0',
  `core_checked_out_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_checked_out_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `core_access` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `core_params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_featured` tinyint(4) UNSIGNED NOT NULL DEFAULT '0',
  `core_metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'JSON encoded metadata properties.',
  `core_created_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `core_created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_modified_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Most recent user that modified',
  `core_modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_content_item_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'ID from the individual type table',
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `core_images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_urls` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_hits` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `core_version` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `core_ordering` int(11) NOT NULL DEFAULT '0',
  `core_metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_catid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `core_xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'A reference to enable linkages to external data sets.',
  `core_type_id` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Contains core content data in name spaced fields';

--
-- Dumping data for table `uoj7s_ucm_content`
--

INSERT INTO `uoj7s_ucm_content` (`core_content_id`, `core_type_alias`, `core_title`, `core_alias`, `core_body`, `core_state`, `core_checked_out_time`, `core_checked_out_user_id`, `core_access`, `core_params`, `core_featured`, `core_metadata`, `core_created_user_id`, `core_created_by_alias`, `core_created_time`, `core_modified_user_id`, `core_modified_time`, `core_language`, `core_publish_up`, `core_publish_down`, `core_content_item_id`, `asset_id`, `core_images`, `core_urls`, `core_hits`, `core_version`, `core_ordering`, `core_metakey`, `core_metadesc`, `core_catid`, `core_xreference`, `core_type_id`) VALUES
(1, 'com_content.article', 'Windows XP', 'windows-xp', '<p>Windows XP (codenamed Whistler) is a personal computer operating system that was produced by Microsoft as part of the Windows NT family of operating systems. It was released to manufacturing on August 24, 2001, and broadly released for retail sale on October 25, 2001.</p>\r\n<p>Development of Windows XP began in the late 1990s as "Neptune", an operating system built on the Windows NT kernel which was intended specifically for mainstream consumer use. An updated version of Windows 2000 was also originally planned for the business market; however, in January 2000, both projects were shelved in favor of a single OS codenamed "Whistler", which would serve as a single OS platform for both consumer and business markets. As such, Windows XP was the first consumer edition of Windows not to be based on MS-DOS.[5]</p>\r\n<p>Upon its release, Windows XP received generally positive reviews, with critics noting increased performance and stability (especially in comparison to Windows ME), a more intuitive user interface, improved hardware support, and expanded multimedia capabilities. However, some industry reviewers were concerned by the new licensing model and product activation system.[6]</p>\r\n<p>Extended support for Windows XP ended on April 8, 2014, after which the operating system ceased receiving further support or security updates to most users. As of May 2018, 2.98% of Windows PCs run Windows XP,[7] and therefore XP represents 2.5% of the overall desktop operating system market share.</p>\r\n<p>https://en.wikipedia.org/wiki/Windows_XP</p>', -2, '0000-00-00 00:00:00', 0, 1, '{"article_layout":"","show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_page_title":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 0, '{"robots":"","author":"","rights":"","xreference":""}', 291, '', '2018-06-30 17:35:17', 291, '2018-06-30 17:35:17', '*', '2018-06-30 17:35:17', '0000-00-00 00:00:00', 3, 62, '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', 0, 1, 0, '', '', 8, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_ucm_history`
--

CREATE TABLE `uoj7s_ucm_history` (
  `version_id` int(10) UNSIGNED NOT NULL,
  `ucm_item_id` int(10) UNSIGNED NOT NULL,
  `ucm_type_id` int(10) UNSIGNED NOT NULL,
  `version_note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Optional version name',
  `save_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `character_count` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Number of characters in this version.',
  `sha1_hash` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'SHA1 hash of the version_data column.',
  `version_data` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'json-encoded string of version data',
  `keep_forever` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=auto delete; 1=keep'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uoj7s_ucm_history`
--

INSERT INTO `uoj7s_ucm_history` (`version_id`, `ucm_item_id`, `ucm_type_id`, `version_note`, `save_date`, `editor_user_id`, `character_count`, `sha1_hash`, `version_data`, `keep_forever`) VALUES
(1, 8, 5, '', '2018-06-30 17:18:24', 291, 1364, '8f0ee6ac34eecc9883806aa845cdeddef747b111', '{"id":8,"asset_id":58,"parent_id":"1","lft":"11","rgt":12,"level":1,"path":null,"extension":"com_content","title":"Operating Systems","alias":"operating-systems","note":"","description":"<p>operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating\\u00a0<\\/p>","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"291","created_time":"2018-06-30 17:18:24","modified_user_id":null,"modified_time":"2018-06-30 17:18:24","hits":"0","language":"*","version":null}', 0),
(2, 1, 1, '', '2018-06-30 17:23:58', 291, 5294, 'acf450493e618178447af518b0f92b8f01819e52', '{"id":1,"asset_id":59,"title":"Linux","alias":"linux","introtext":"<p>Linux (\\/\\u02c8l\\u026an\\u0259ks\\/ (About this sound listen) LIN-\\u0259ks)[9][10] is a family of free and open-source software operating systems built around the Linux kernel. Typically, Linux is packaged in a form known as a Linux distribution (or distro for short) for both desktop and server use. The defining component of a Linux distribution is the Linux kernel,[11] an operating system kernel first released on September 17, 1991, by Linus Torvalds.[12][13][14] Many Linux distributions use the word \\"Linux\\" in their name. The Free Software Foundation uses the name GNU\\/Linux to refer to the operating system family, as well as specific distributions, to emphasize that most Linux distributions are not just the Linux kernel, and that they have in common not only the kernel, but also numerous utilities and libraries, a large proportion of which are from the GNU project. This has led to some controversy.[15][16]<\\/p>\\r\\n<p>Linux was originally developed for personal computers based on the Intel x86 architecture, but has since been ported to more platforms than any other operating system.[17] Because of the dominance of the Linux kernel-based Android OS on smartphones, Linux has the largest installed base of all general-purpose operating systems.[18] Linux is also the leading operating system on servers and other big iron systems such as mainframe computers, and the only OS used on TOP500 supercomputers (since November 2017, having before gradually eliminated all competitors).[19][20] It is used by around 2.3% of desktop computers.[21][22] The Chromebook, which runs the Linux kernel-based Chrome OS, dominates the US K\\u201312 education market and represents nearly 20% of the sub-$300 notebook sales in the US.[23] Linux also runs on embedded systems\\u2014devices whose operating system is typically built into the firmware and is highly tailored to the system. This includes TiVo and similar DVR devices, network routers, facility automation controls, televisions,[24][25] video game consoles and smartwatches.[26] Many smartphones and tablet computers run Android and other Linux derivatives.[27]<\\/p>\\r\\n<p>The development of Linux is one of the most prominent examples of free and open-source software collaboration. The underlying source code may be used, modified and distributed\\u2014commercially or non-commercially\\u2014by anyone under the terms of its respective licenses, such as the GNU General Public License.<\\/p>\\r\\n<p>Some of the most popular and mainstream Linux distributions[28][29][30] are Arch Linux, CentOS, Debian, Fedora, Gentoo Linux, Linux Mint, Mageia, openSUSE and Ubuntu, together with commercial distributions such as Red Hat Enterprise Linux and SUSE Linux Enterprise Server. Distributions include the Linux kernel, supporting utilities and libraries, many of which are provided by the GNU Project, and usually a large amount of application software to fulfil the distribution\'s intended use. Desktop Linux distributions include a windowing system, such as X11, Mir or a Wayland implementation, and an accompanying desktop environment such as GNOME or KDE Plasma; some distributions may also include a less resource-intensive desktop, such as LXDE or Xfce. Distributions intended to run on servers may omit all graphical environments from the standard install, and instead include other software to set up and operate a solution stack such as LAMP. Because Linux is freely redistributable, anyone may create a distribution for any intended use.<\\/p>\\r\\n<p>https:\\/\\/en.wikipedia.org\\/wiki\\/Linux<\\/p>","fulltext":"","state":1,"catid":"8","created":"2018-06-30 17:23:58","created_by":"291","created_by_alias":"","modified":"2018-06-30 17:23:58","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2018-06-30 17:23:58","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"article_layout\\":\\"\\",\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"info_block_show_title\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_associations\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_page_title\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(3, 2, 1, '', '2018-06-30 17:27:01', 291, 3703, 'e5946f88a1598792359f7326caee3481c258270f', '{"id":2,"asset_id":60,"title":"Windows","alias":"windows","introtext":"<p>Microsoft Windows is a group of several graphical operating system families, all of which are developed, marketed, and sold by Microsoft. Each family caters to a certain sector of the computing industry. Active Windows families include Windows NT and Windows Embedded; these may encompass subfamilies, e.g. Windows Embedded Compact (Windows CE) or Windows Server. Defunct Windows families include Windows 9x, Windows Mobile and Windows Phone.<\\/p>\\r\\n<p>Microsoft introduced an operating environment named Windows on November 20, 1985, as a graphical operating system shell for MS-DOS in response to the growing interest in graphical user interfaces (GUIs).[5] Microsoft Windows came to dominate the world\'s personal computer (PC) market with over 90% market share, overtaking Mac OS, which had been introduced in 1984. Apple came to see Windows as an unfair encroachment on their innovation in GUI development as implemented on products such as the Lisa and Macintosh (eventually settled in court in Microsoft\'s favor in 1993). On PCs, Windows is still the most popular operating system. However, in 2014, Microsoft admitted losing the majority of the overall operating system market to Android,[6] because of the massive growth in sales of Android smartphones. In 2014, the number of Windows devices sold was less than 25% that of Android devices sold. This comparison however may not be fully relevant, as the two operating systems traditionally target different platforms. Still, numbers for server use of Windows (that are comparable to competitors) show one third market share, similar to for end user use.<\\/p>\\r\\n<p>As of December 2017, the most recent version of Windows for PCs, tablets, smartphones and embedded devices is Windows 10. The most recent versions for server computers is Windows Server 2016. A specialized version of Windows runs on the Xbox One video game console.[7]<\\/p>\\r\\n<p>https:\\/\\/en.wikipedia.org\\/wiki\\/Microsoft_Windows<\\/p>","fulltext":"","state":1,"catid":"8","created":"2018-06-30 17:27:01","created_by":"291","created_by_alias":"","modified":"2018-06-30 17:27:01","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2018-06-30 17:27:01","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"article_layout\\":\\"\\",\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"info_block_show_title\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_associations\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_page_title\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(4, 2, 8, '', '2018-06-30 17:35:17', 291, 543, '83dec17a1eca6652a2533c9fd2e7b62dfad57a6e', '{"id":2,"parent_id":"1","lft":"1","rgt":2,"level":1,"path":"os","title":"OS ","alias":"os","note":"","description":null,"published":1,"checked_out":"0","checked_out_time":"2018-06-30 17:35:17","access":1,"params":"{}","metadesc":"","metakey":"","metadata":"{}","created_user_id":"291","created_time":"2018-06-30 17:35:17","created_by_alias":"","modified_user_id":"0","modified_time":"2018-06-30 17:35:17","images":"{}","urls":"{}","hits":"0","language":"*","version":"1","publish_up":"2018-06-30 17:35:17","publish_down":"2018-06-30 17:35:17"}', 0),
(5, 3, 1, '', '2018-06-30 17:35:17', 291, 3323, '5108624b02e37d4ebcb114579706e754696108be', '{"id":3,"asset_id":61,"title":"Windows XP","alias":"windows-xp","introtext":"<p>Windows XP (codenamed Whistler) is a personal computer operating system that was produced by Microsoft as part of the Windows NT family of operating systems. It was released to manufacturing on August 24, 2001, and broadly released for retail sale on October 25, 2001.<\\/p>\\r\\n<p>Development of Windows XP began in the late 1990s as \\"Neptune\\", an operating system built on the Windows NT kernel which was intended specifically for mainstream consumer use. An updated version of Windows 2000 was also originally planned for the business market; however, in January 2000, both projects were shelved in favor of a single OS codenamed \\"Whistler\\", which would serve as a single OS platform for both consumer and business markets. As such, Windows XP was the first consumer edition of Windows not to be based on MS-DOS.[5]<\\/p>\\r\\n<p>Upon its release, Windows XP received generally positive reviews, with critics noting increased performance and stability (especially in comparison to Windows ME), a more intuitive user interface, improved hardware support, and expanded multimedia capabilities. However, some industry reviewers were concerned by the new licensing model and product activation system.[6]<\\/p>\\r\\n<p>Extended support for Windows XP ended on April 8, 2014, after which the operating system ceased receiving further support or security updates to most users. As of May 2018, 2.98% of Windows PCs run Windows XP,[7] and therefore XP represents 2.5% of the overall desktop operating system market share.<\\/p>\\r\\n<p>https:\\/\\/en.wikipedia.org\\/wiki\\/Windows_XP<\\/p>","fulltext":"","state":1,"catid":"8","created":"2018-06-30 17:35:17","created_by":"291","created_by_alias":"","modified":"2018-06-30 17:35:17","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2018-06-30 17:35:17","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"article_layout\\":\\"\\",\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"info_block_show_title\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_associations\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_page_title\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(6, 4, 1, '', '2018-06-30 17:37:26', 291, 5103, '1ba0cd36d85aa863b710a017964c6f632ff7d5ba', '{"id":4,"asset_id":63,"title":"Windows 10","alias":"windows-10","introtext":"<p>Windows 10 (codenamed Redstone, formerly Threshold) is a personal computer operating system developed and released by Microsoft, as part of the Windows NT family of operating systems. It was released on July 29, 2015.[9] It is the first version of Windows that receives ongoing feature updates. Devices in enterprise environments can receive these updates at a slower pace, or use long-term support milestones that only receive critical updates, such as security patches, over their ten-year lifespan of extended support.[10][11]<\\/p>\\r\\n<p>Windows 10 introduces what Microsoft described as \\"universal apps\\"; expanding on Metro-style apps, these apps can be designed to run across multiple Microsoft product families with nearly identical code\\u200d\\u2014\\u200cincluding PCs, tablets, smartphones, embedded systems, Xbox One, Surface Hub and Mixed Reality. The Windows user interface was revised to handle transitions between a mouse-oriented interface and a touchscreen-optimized interface based on available input devices\\u200d\\u2014\\u200cparticularly on 2-in-1 PCs; both interfaces include an updated Start menu which incorporates elements of Windows 7\'s traditional Start menu with the tiles of Windows 8. The first release of Windows 10 also introduces a virtual desktop system, a window and desktop management feature called Task View, the Microsoft Edge web browser, support for fingerprint and face recognition login, new security features for enterprise environments, and DirectX 12 and WDDM 2.0 to improve the operating system\'s graphics capabilities for games.<\\/p>\\r\\n<p>Windows 10 received mostly positive reviews upon its original release in July 2015; critics praised Microsoft\'s decision to provide a desktop-oriented interface in line with previous versions of Windows, contrasting the tablet-oriented approach of 8, although Windows 10\'s touch-oriented user interface mode was panned for containing regressions upon the touch-oriented interface of Windows 8. Critics also praised the improvements to Windows 10\'s bundled software over Windows 8.1, Xbox Live integration, as well as the functionality and capabilities of Cortana personal assistant and the replacement of Internet Explorer with Microsoft Edge. However, media outlets have been critical of changes to operating system behaviors, including mandatory update installation, privacy concerns over data collection performed by the OS for Microsoft and its partners, and the adware-like tactics used to promote the operating system on its release.[12][13][14][15][16]<\\/p>\\r\\n<p>Microsoft aimed to have Windows 10 installed on at least one billion devices in the two to three years following its release.[10] Up to August 2016, Windows 10 usage was increasing, with it then plateauing,[17][18] while eventually in 2018, it became more popular than Windows 7 (though that is still more used in most countries in Asia and Africa[19]), and thus the single most used Windows version overall (at 46.07%, thus the other more used overall),[20] though not on some continents as measured by web traffic. As of November 2017, the operating system is running on more than 600 million devices[21] and has an estimated usage share of 32% on traditional PCs[22][23] and 15% across all platforms (PC, mobile, tablet, and console).<\\/p>\\r\\n<p>https:\\/\\/en.wikipedia.org\\/wiki\\/Windows_10<\\/p>","fulltext":"","state":1,"catid":"8","created":"2018-06-30 17:37:26","created_by":"291","created_by_alias":"","modified":"2018-06-30 17:37:26","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2018-06-30 17:37:26","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"article_layout\\":\\"\\",\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"info_block_show_title\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_associations\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_page_title\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(7, 5, 1, '', '2018-06-30 17:39:55', 291, 3061, '7de6d8237345ef7c7bbf76e9fd3e6d8305d935eb', '{"id":5,"asset_id":64,"title":"Ubuntu","alias":"ubuntu","introtext":"<p>Ubuntu (\\/\\u028a\\u02c8b\\u028antu\\u02d0\\/;[5] stylized as ubuntu) is a free and open source[6][7] operating system and Linux distribution based on Debian.[8] Ubuntu is offered in three official editions: Ubuntu Desktop[9] for personal computers, Ubuntu Server for servers[10] and the cloud,[11] and Ubuntu Core[12] for Internet of things[13] devices. New releases of Ubuntu occur every six months, while long-term support (LTS) releases occur every two years.[5][14][15]<\\/p>\\r\\n<p>Ubuntu is produced by Canonical[16] and the community in a meritocratic governance model.[5][17] Canonical provides free guaranteed security updates and support for each Ubuntu release, starting from the release date and until the release reaches its predesignated end-of-life (EOL) date.[5][18][19] Canonical generates revenue through the sale of premium services related to Ubuntu.[20][21]<\\/p>\\r\\n<p>Ubuntu is named after the Southern African philosophy of ubuntu (literally, \'human-ness\'), which Canonical suggests can be loosely translated as \\"humanity to others\\" or \\"I am what I am because of who we all are\\".[5]<\\/p>\\r\\n<p>Ubuntu is the most popular operating system for the cloud, and is the reference operating system for OpenStack.<\\/p>\\r\\n<p>https:\\/\\/en.wikipedia.org\\/wiki\\/Ubuntu_(operating_system)<\\/p>\\r\\n<p>\\u00a0<\\/p>","fulltext":"","state":1,"catid":"8","created":"2018-06-30 17:39:55","created_by":"291","created_by_alias":"","modified":"2018-06-30 17:39:55","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2018-06-30 17:39:55","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"article_layout\\":\\"\\",\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"info_block_show_title\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_associations\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_page_title\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(8, 6, 1, '', '2018-06-30 17:56:36', 291, 2504, 'f050cb990bcfda06b54b16874d34713274fd52fa', '{"id":6,"asset_id":65,"title":"Fedora","alias":"fedora","introtext":"<p>Fedora is a Linux distribution developed by the community-supported Fedora Project and sponsored by Red Hat.[7] Fedora contains software distributed under various free and open-source licenses and aims to be on the leading edge of such technologies.[8][9][10] Fedora is the upstream source of the commercial Red Hat Enterprise Linux distribution.[11]<\\/p>\\r\\n<p>Since the release of Fedora 21, three different editions are currently available: Workstation, focused on the personal computer, Server for servers, and Atomic focused on cloud computing.[12]<\\/p>\\r\\n<p>As of February 2016, Fedora has an estimated 1.2 million users,[13] including Linus Torvalds, creator of the Linux kernel.<\\/p>\\r\\n<p>https:\\/\\/en.wikipedia.org\\/wiki\\/Fedora_(operating_system)<\\/p>","fulltext":"","state":1,"catid":"8","created":"2018-06-30 17:56:36","created_by":"291","created_by_alias":"","modified":"2018-06-30 17:56:36","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2018-06-30 17:56:36","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"article_layout\\":\\"\\",\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"info_block_show_title\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_associations\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_page_title\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(9, 8, 5, '', '2018-06-30 18:37:39', 291, 1401, 'f8a94073feb8aa94f3cd54ebab0ed10b5d044af8', '{"id":8,"asset_id":"58","parent_id":"1","lft":"11","rgt":"12","level":"1","path":"operating-systems","extension":"com_content","title":"OS for Computer","alias":"operating-systems","note":"","description":"<p>operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating system\\u00a0operating\\u00a0<\\/p>","published":"1","checked_out":"291","checked_out_time":"2018-06-30 18:36:27","access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"291","created_time":"2018-06-30 17:18:24","modified_user_id":"291","modified_time":"2018-06-30 18:37:39","hits":"0","language":"*","version":"1"}', 0),
(10, 7, 1, '', '2018-06-30 18:42:22', 291, 2484, 'f75f47e48c1b42efeda73cb119d58166e20c99c3', '{"id":7,"asset_id":68,"title":"Android","alias":"android","introtext":"<p>Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0<\\/p>","fulltext":"","state":1,"catid":"8","created":"2018-06-30 18:42:22","created_by":"291","created_by_alias":"","modified":"2018-06-30 18:42:22","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2018-06-30 18:42:22","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"article_layout\\":\\"\\",\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"info_block_show_title\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_associations\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_page_title\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(11, 8, 1, '', '2018-06-30 18:42:56', 291, 2422, '84368e2e8c5d255d6591388d2c6d51f475159efb', '{"id":8,"asset_id":69,"title":"Windows","alias":"windows-2","introtext":"<p>Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0<\\/p>","fulltext":"","state":1,"catid":"8","created":"2018-06-30 18:42:56","created_by":"291","created_by_alias":"","modified":"2018-06-30 18:42:56","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2018-06-30 18:42:56","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"article_layout\\":\\"\\",\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"info_block_show_title\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_associations\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_page_title\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(12, 9, 1, '', '2018-06-30 18:43:42', 291, 4512, '034c852ddac2ed5aeee70ed3da1ab36ee74cdc26', '{"id":9,"asset_id":70,"title":"iOS","alias":"ios","introtext":"<p>iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0<\\/p>","fulltext":"","state":1,"catid":"8","created":"2018-06-30 18:43:42","created_by":"291","created_by_alias":"","modified":"2018-06-30 18:43:42","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2018-06-30 18:43:42","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"article_layout\\":\\"\\",\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"info_block_show_title\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_associations\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_page_title\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(13, 9, 5, '', '2018-06-30 18:46:09', 291, 563, 'cd12333206b655420f44f4b6d135845613238d28', '{"id":9,"asset_id":71,"parent_id":"1","lft":"13","rgt":14,"level":1,"path":null,"extension":"com_content","title":"OS for Mobile","alias":"os-for-mobile","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"291","created_time":"2018-06-30 18:46:09","modified_user_id":null,"modified_time":"2018-06-30 18:46:09","hits":"0","language":"*","version":null}', 0),
(14, 9, 1, '', '2018-06-30 18:46:45', 291, 4533, 'ab30ccdc811524029229f98141f6010bd40e957e', '{"id":"9","asset_id":"70","title":"iOS","alias":"ios","introtext":"<p>iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0iOS..\\u00a0<\\/p>","fulltext":"","state":"1","catid":9,"created":"2018-06-30 18:43:42","created_by":"291","created_by_alias":"","modified":"2018-06-30 18:46:45","modified_by":"291","checked_out":"0","checked_out_time":"0000-00-00 00:00:00","publish_up":"2018-06-30 18:43:42","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"article_layout\\":\\"\\",\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"info_block_show_title\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_associations\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_page_title\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":"2","ordering":"0","metakey":"","metadesc":"","access":"1","hits":"0","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(15, 8, 1, '', '2018-06-30 18:46:45', 291, 2443, 'a450d1a074d1f0a3f53616d320bc971d5999d646', '{"id":"8","asset_id":"69","title":"Windows","alias":"windows-2","introtext":"<p>Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0Windows...\\u00a0<\\/p>","fulltext":"","state":"1","catid":9,"created":"2018-06-30 18:42:56","created_by":"291","created_by_alias":"","modified":"2018-06-30 18:46:45","modified_by":"291","checked_out":"0","checked_out_time":"0000-00-00 00:00:00","publish_up":"2018-06-30 18:42:56","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"article_layout\\":\\"\\",\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"info_block_show_title\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_associations\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_page_title\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":"1","ordering":"1","metakey":"","metadesc":"","access":"1","hits":"0","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0);
INSERT INTO `uoj7s_ucm_history` (`version_id`, `ucm_item_id`, `ucm_type_id`, `version_note`, `save_date`, `editor_user_id`, `character_count`, `sha1_hash`, `version_data`, `keep_forever`) VALUES
(16, 7, 1, '', '2018-06-30 18:46:45', 291, 2505, '20905c029d8df682ca34aee58d406370b57d46cf', '{"id":"7","asset_id":"68","title":"Android","alias":"android","introtext":"<p>Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0Android...\\u00a0<\\/p>","fulltext":"","state":"1","catid":9,"created":"2018-06-30 18:42:22","created_by":"291","created_by_alias":"","modified":"2018-06-30 18:46:45","modified_by":"291","checked_out":"0","checked_out_time":"0000-00-00 00:00:00","publish_up":"2018-06-30 18:42:22","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"article_layout\\":\\"\\",\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"info_block_show_title\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_associations\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_page_title\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":"1","ordering":"2","metakey":"","metadesc":"","access":"1","hits":"0","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(17, 10, 1, '', '2018-06-30 20:56:22', 291, 11347, '5407ea773be6ed6480810cb7fa2929d096edd2c2', '{"id":10,"asset_id":76,"title":"Operating System\\u00a0(OS)","alias":"operating-system-os","introtext":"<p style=\\"margin: 0.5em 0px; line-height: inherit; color: #222222; font-family: sans-serif; font-size: 14px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: #ffffff;\\">An&nbsp;<b>operating system<\\/b>&nbsp;(<b>OS<\\/b>) is&nbsp;<a style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"System software\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/System_software\\">system software<\\/a>&nbsp;that manages&nbsp;<a style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"Computer hardware\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Computer_hardware\\">computer hardware<\\/a>&nbsp;and&nbsp;<a class=\\"mw-redirect\\" style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"Computer software\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Computer_software\\">software<\\/a>resources and provides common&nbsp;<a style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"Daemon (computing)\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Daemon_(computing)\\">services<\\/a>&nbsp;for&nbsp;<a style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"Computer program\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Computer_program\\">computer programs<\\/a>.<\\/p>\\r\\n<p style=\\"margin: 0.5em 0px; line-height: inherit; color: #222222; font-family: sans-serif; font-size: 14px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: #ffffff;\\"><a style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"Time-sharing\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Time-sharing\\">Time-sharing<\\/a>&nbsp;operating systems&nbsp;<a class=\\"mw-redirect\\" style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"Scheduler (computing)\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Scheduler_(computing)\\">schedule tasks<\\/a>&nbsp;for efficient use of the system and may also include accounting software for cost allocation of&nbsp;<a style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"Scheduling (computing)\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Scheduling_(computing)\\">processor time<\\/a>,&nbsp;<a style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"Mass storage\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Mass_storage\\">mass storage<\\/a>,&nbsp;<a style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"Printer (computing)\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Printer_(computing)\\">printing<\\/a>, and other resources.<\\/p>\\r\\n<p style=\\"margin: 0.5em 0px; line-height: inherit; color: #222222; font-family: sans-serif; font-size: 14px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: #ffffff;\\">For hardware functions such as&nbsp;<a class=\\"mw-redirect\\" style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"Input and output\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Input_and_output\\">input and output<\\/a>&nbsp;and&nbsp;<a class=\\"mw-redirect\\" style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"Memory allocation\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Memory_allocation\\">memory allocation<\\/a>, the operating system acts as an intermediary between programs and the computer hardware,<sup id=\\"cite_ref-1\\" class=\\"reference\\" style=\\"line-height: 1; unicode-bidi: isolate; white-space: nowrap; font-size: 11.2px; font-weight: normal; font-style: normal;\\"><a style=\\"text-decoration: none; color: #0b0080; background: none;\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Operating_system#cite_note-1\\">[1]<\\/a><\\/sup><sup id=\\"cite_ref-2\\" class=\\"reference\\" style=\\"line-height: 1; unicode-bidi: isolate; white-space: nowrap; font-size: 11.2px; font-weight: normal; font-style: normal;\\"><a style=\\"text-decoration: none; color: #0b0080; background: none;\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Operating_system#cite_note-2\\">[2]<\\/a><\\/sup>&nbsp;although the application code is usually executed directly by the hardware and frequently makes&nbsp;<a style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"System call\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/System_call\\">system calls<\\/a>&nbsp;to an OS function or is interrupted by it. Operating systems are found on many devices that contain a computer&nbsp;\\u2013 from&nbsp;<a class=\\"mw-redirect\\" style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"Cellular phone\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Cellular_phone\\">cellular phones<\\/a>&nbsp;and&nbsp;<a style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"Video game console\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Video_game_console\\">video game consoles<\\/a>&nbsp;to&nbsp;<a style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"Web server\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Web_server\\">web servers<\\/a>&nbsp;and&nbsp;<a style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"Supercomputer\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Supercomputer\\">supercomputers<\\/a>.<\\/p>\\r\\n<p style=\\"margin: 0.5em 0px; line-height: inherit; color: #222222; font-family: sans-serif; font-size: 14px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: #ffffff;\\">The dominant desktop operating system is&nbsp;<a style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"Microsoft Windows\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Microsoft_Windows\\">Microsoft Windows<\\/a>&nbsp;with a market share of around 82.74%.&nbsp;<a style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"MacOS\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/MacOS\\">macOS<\\/a>&nbsp;by&nbsp;<a style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"Apple Inc.\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Apple_Inc.\\">Apple Inc.<\\/a>&nbsp;is in second place (13.23%), and the varieties of&nbsp;<a style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"Linux\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Linux\\">Linux<\\/a>&nbsp;are collectively in third place (1.57%).<sup id=\\"cite_ref-3\\" class=\\"reference\\" style=\\"line-height: 1; unicode-bidi: isolate; white-space: nowrap; font-size: 11.2px; font-weight: normal; font-style: normal;\\"><a style=\\"text-decoration: none; color: #0b0080; background: none;\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Operating_system#cite_note-3\\">[3]<\\/a><\\/sup>&nbsp;In the&nbsp;<a style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"Mobile operating system\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Mobile_operating_system\\">mobile<\\/a>&nbsp;(<a style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"Smartphone\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Smartphone\\">smartphone<\\/a>&nbsp;and&nbsp;<a style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"Tablet computer\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Tablet_computer\\">tablet<\\/a>&nbsp;combined) sector, use in 2017 is up to 70% of&nbsp;<a style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"Google\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Google\\">Google<\\/a>\'s&nbsp;<a style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"Android (operating system)\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Android_(operating_system)\\">Android<\\/a><sup id=\\"cite_ref-4\\" class=\\"reference\\" style=\\"line-height: 1; unicode-bidi: isolate; white-space: nowrap; font-size: 11.2px; font-weight: normal; font-style: normal;\\"><a style=\\"text-decoration: none; color: #0b0080; background: none;\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Operating_system#cite_note-4\\">[4]<\\/a><\\/sup>&nbsp;and according to third quarter 2016 data, Android on smartphones is dominant with 87.5 percent and a growth rate 10.3 percent per year, followed by&nbsp;<a style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"Apple Inc.\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Apple_Inc.\\">Apple<\\/a>\'s&nbsp;<a style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"IOS\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/IOS\\">iOS<\\/a>&nbsp;with 12.1 percent and a per year decrease in market share of 5.2 percent, while other operating systems amount to just 0.3 percent.<sup id=\\"cite_ref-5\\" class=\\"reference\\" style=\\"line-height: 1; unicode-bidi: isolate; white-space: nowrap; font-size: 11.2px; font-weight: normal; font-style: normal;\\"><a style=\\"text-decoration: none; color: #0b0080; background: none;\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Operating_system#cite_note-5\\">[5]<\\/a><\\/sup>&nbsp;<a style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"Linux distribution\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Linux_distribution\\">Linux distributions<\\/a>&nbsp;are dominant in the server and supercomputing sectors. Other specialized classes of operating systems, such as embedded and real-time systems, exist for many applications.<\\/p>","fulltext":"","state":1,"catid":"2","created":"2018-06-30 20:56:22","created_by":"291","created_by_alias":"","modified":"2018-06-30 20:56:22","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2018-06-30 20:56:22","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"article_layout\\":\\"\\",\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"info_block_show_title\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_associations\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_page_title\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(18, 10, 1, '', '2018-06-30 20:56:56', 291, 11366, '4a7da78b1e7596ff400ed9eef1087ce1312439d0', '{"id":10,"asset_id":"76","title":"Operating System\\u00a0(OS)","alias":"operating-system-os","introtext":"<p style=\\"margin: 0.5em 0px; line-height: inherit; color: #222222; font-family: sans-serif; font-size: 14px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: #ffffff;\\">An&nbsp;<b>operating system<\\/b>&nbsp;(<b>OS<\\/b>) is&nbsp;<a style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"System software\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/System_software\\">system software<\\/a>&nbsp;that manages&nbsp;<a style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"Computer hardware\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Computer_hardware\\">computer hardware<\\/a>&nbsp;and&nbsp;<a class=\\"mw-redirect\\" style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"Computer software\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Computer_software\\">software<\\/a>resources and provides common&nbsp;<a style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"Daemon (computing)\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Daemon_(computing)\\">services<\\/a>&nbsp;for&nbsp;<a style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"Computer program\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Computer_program\\">computer programs<\\/a>.<\\/p>\\r\\n<p style=\\"margin: 0.5em 0px; line-height: inherit; color: #222222; font-family: sans-serif; font-size: 14px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: #ffffff;\\"><a style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"Time-sharing\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Time-sharing\\">Time-sharing<\\/a>&nbsp;operating systems&nbsp;<a class=\\"mw-redirect\\" style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"Scheduler (computing)\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Scheduler_(computing)\\">schedule tasks<\\/a>&nbsp;for efficient use of the system and may also include accounting software for cost allocation of&nbsp;<a style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"Scheduling (computing)\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Scheduling_(computing)\\">processor time<\\/a>,&nbsp;<a style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"Mass storage\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Mass_storage\\">mass storage<\\/a>,&nbsp;<a style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"Printer (computing)\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Printer_(computing)\\">printing<\\/a>, and other resources.<\\/p>\\r\\n<p style=\\"margin: 0.5em 0px; line-height: inherit; color: #222222; font-family: sans-serif; font-size: 14px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: #ffffff;\\">For hardware functions such as&nbsp;<a class=\\"mw-redirect\\" style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"Input and output\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Input_and_output\\">input and output<\\/a>&nbsp;and&nbsp;<a class=\\"mw-redirect\\" style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"Memory allocation\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Memory_allocation\\">memory allocation<\\/a>, the operating system acts as an intermediary between programs and the computer hardware,<sup id=\\"cite_ref-1\\" class=\\"reference\\" style=\\"line-height: 1; unicode-bidi: isolate; white-space: nowrap; font-size: 11.2px; font-weight: normal; font-style: normal;\\"><a style=\\"text-decoration: none; color: #0b0080; background: none;\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Operating_system#cite_note-1\\">[1]<\\/a><\\/sup><sup id=\\"cite_ref-2\\" class=\\"reference\\" style=\\"line-height: 1; unicode-bidi: isolate; white-space: nowrap; font-size: 11.2px; font-weight: normal; font-style: normal;\\"><a style=\\"text-decoration: none; color: #0b0080; background: none;\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Operating_system#cite_note-2\\">[2]<\\/a><\\/sup>&nbsp;although the application code is usually executed directly by the hardware and frequently makes&nbsp;<a style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"System call\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/System_call\\">system calls<\\/a>&nbsp;to an OS function or is interrupted by it. Operating systems are found on many devices that contain a computer&nbsp;\\u2013 from&nbsp;<a class=\\"mw-redirect\\" style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"Cellular phone\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Cellular_phone\\">cellular phones<\\/a>&nbsp;and&nbsp;<a style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"Video game console\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Video_game_console\\">video game consoles<\\/a>&nbsp;to&nbsp;<a style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"Web server\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Web_server\\">web servers<\\/a>&nbsp;and&nbsp;<a style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"Supercomputer\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Supercomputer\\">supercomputers<\\/a>.<\\/p>\\r\\n<p style=\\"margin: 0.5em 0px; line-height: inherit; color: #222222; font-family: sans-serif; font-size: 14px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: #ffffff;\\">The dominant desktop operating system is&nbsp;<a style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"Microsoft Windows\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Microsoft_Windows\\">Microsoft Windows<\\/a>&nbsp;with a market share of around 82.74%.&nbsp;<a style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"MacOS\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/MacOS\\">macOS<\\/a>&nbsp;by&nbsp;<a style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"Apple Inc.\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Apple_Inc.\\">Apple Inc.<\\/a>&nbsp;is in second place (13.23%), and the varieties of&nbsp;<a style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"Linux\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Linux\\">Linux<\\/a>&nbsp;are collectively in third place (1.57%).<sup id=\\"cite_ref-3\\" class=\\"reference\\" style=\\"line-height: 1; unicode-bidi: isolate; white-space: nowrap; font-size: 11.2px; font-weight: normal; font-style: normal;\\"><a style=\\"text-decoration: none; color: #0b0080; background: none;\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Operating_system#cite_note-3\\">[3]<\\/a><\\/sup>&nbsp;In the&nbsp;<a style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"Mobile operating system\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Mobile_operating_system\\">mobile<\\/a>&nbsp;(<a style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"Smartphone\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Smartphone\\">smartphone<\\/a>&nbsp;and&nbsp;<a style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"Tablet computer\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Tablet_computer\\">tablet<\\/a>&nbsp;combined) sector, use in 2017 is up to 70% of&nbsp;<a style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"Google\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Google\\">Google<\\/a>\'s&nbsp;<a style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"Android (operating system)\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Android_(operating_system)\\">Android<\\/a><sup id=\\"cite_ref-4\\" class=\\"reference\\" style=\\"line-height: 1; unicode-bidi: isolate; white-space: nowrap; font-size: 11.2px; font-weight: normal; font-style: normal;\\"><a style=\\"text-decoration: none; color: #0b0080; background: none;\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Operating_system#cite_note-4\\">[4]<\\/a><\\/sup>&nbsp;and according to third quarter 2016 data, Android on smartphones is dominant with 87.5 percent and a growth rate 10.3 percent per year, followed by&nbsp;<a style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"Apple Inc.\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Apple_Inc.\\">Apple<\\/a>\'s&nbsp;<a style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"IOS\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/IOS\\">iOS<\\/a>&nbsp;with 12.1 percent and a per year decrease in market share of 5.2 percent, while other operating systems amount to just 0.3 percent.<sup id=\\"cite_ref-5\\" class=\\"reference\\" style=\\"line-height: 1; unicode-bidi: isolate; white-space: nowrap; font-size: 11.2px; font-weight: normal; font-style: normal;\\"><a style=\\"text-decoration: none; color: #0b0080; background: none;\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Operating_system#cite_note-5\\">[5]<\\/a><\\/sup>&nbsp;<a style=\\"text-decoration: none; color: #0b0080; background: none;\\" title=\\"Linux distribution\\" href=\\"https:\\/\\/en.wikipedia.org\\/wiki\\/Linux_distribution\\">Linux distributions<\\/a>&nbsp;are dominant in the server and supercomputing sectors. Other specialized classes of operating systems, such as embedded and real-time systems, exist for many applications.<\\/p>","fulltext":"","state":1,"catid":"2","created":"2018-06-30 20:56:22","created_by":"291","created_by_alias":"","modified":"2018-06-30 20:56:56","modified_by":"291","checked_out":"291","checked_out_time":"2018-06-30 20:56:22","publish_up":"2018-06-30 20:56:22","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"article_layout\\":\\"\\",\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"info_block_show_title\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_associations\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_page_title\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":2,"ordering":"0","metakey":"","metadesc":"","access":"1","hits":"0","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"1","language":"*","xreference":""}', 0),
(19, 8, 1, '', '2018-06-30 21:24:24', 291, 2441, '875a42bf1cb0048f5cd49340749096791864bdb1', '{"id":8,"asset_id":"69","title":"Windows","alias":"windows-2","introtext":"<p>Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;Windows...&nbsp;<\\/p>","fulltext":"","state":1,"catid":"9","created":"2018-06-30 18:42:56","created_by":"291","created_by_alias":"","modified":"2018-06-30 21:24:24","modified_by":"291","checked_out":"291","checked_out_time":"2018-06-30 21:23:48","publish_up":"2018-06-30 18:42:56","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"article_layout\\":\\"\\",\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"info_block_show_title\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_associations\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_page_title\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":2,"ordering":"1","metakey":"","metadesc":"","access":"1","hits":"1","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(20, 5, 1, '', '2018-07-01 18:16:12', 291, 3063, '45168db69eeb69b96dca55f8ac488d992095e4d0', '{"id":5,"asset_id":"64","title":"Ubuntu","alias":"ubuntu","introtext":"<p>Ubuntu (\\/\\u028a\\u02c8b\\u028antu\\u02d0\\/;[5] stylized as ubuntu) is a free and open source[6][7] operating system and Linux distribution based on Debian.[8] Ubuntu is offered in three official editions: Ubuntu Desktop[9] for personal computers, Ubuntu Server for servers[10] and the cloud,[11] and Ubuntu Core[12] for Internet of things[13] devices. New releases of Ubuntu occur every six months, while long-term support (LTS) releases occur every two years.[5][14][15]<\\/p>\\r\\n<p>Ubuntu is produced by Canonical[16] and the community in a meritocratic governance model.[5][17] Canonical provides free guaranteed security updates and support for each Ubuntu release, starting from the release date and until the release reaches its predesignated end-of-life (EOL) date.[5][18][19] Canonical generates revenue through the sale of premium services related to Ubuntu.[20][21]<\\/p>\\r\\n<p>Ubuntu is named after the Southern African philosophy of ubuntu (literally, \'human-ness\'), which Canonical suggests can be loosely translated as \\"humanity to others\\" or \\"I am what I am because of who we all are\\".[5]<\\/p>\\r\\n<p>Ubuntu is the most popular operating system for the cloud, and is the reference operating system for OpenStack.<\\/p>\\r\\n<p>https:\\/\\/en.wikipedia.org\\/wiki\\/Ubuntu_(operating_system)<\\/p>\\r\\n<p>&nbsp;<\\/p>","fulltext":"","state":"0","catid":"8","created":"2018-06-30 17:39:55","created_by":"291","created_by_alias":"","modified":"2018-07-01 18:16:12","modified_by":"291","checked_out":"291","checked_out_time":"2018-07-01 18:15:31","publish_up":"2018-06-30 17:39:55","publish_down":"","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"article_layout\\":\\"\\",\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"info_block_show_title\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_associations\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_page_title\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":2,"ordering":"4","metakey":"","metadesc":"","access":"1","hits":"9","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(21, 10, 10, '', '2018-07-01 19:07:58', 291, 556, '32f02c43393fc3cdcc2fe09136a12db624bef093', '{"id":10,"asset_id":77,"parent_id":"1","lft":"15","rgt":16,"level":1,"path":null,"extension":"com_banners","title":"Computing","alias":"computing","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"291","created_time":"2018-07-01 19:07:58","modified_user_id":null,"modified_time":"2018-07-01 19:07:58","hits":"0","language":"*","version":null}', 0),
(22, 1, 9, '', '2018-07-01 19:11:32', 291, 745, '6df03340cdd0d0cf8c11d563a1d6c977ac2d5b77', '{"id":1,"cid":"0","type":"0","name":"Computing","alias":"computing","imptotal":0,"impmade":"0","clicks":"0","clickurl":false,"state":"1","catid":"10","description":"","custombannercode":"","sticky":"0","ordering":1,"metakey":"","params":"{\\"imageurl\\":\\"images\\\\\\/banners\\\\\\/shop-ad-books.jpg\\",\\"width\\":\\"\\",\\"height\\":\\"\\",\\"alt\\":\\"Banner\\"}","own_prefix":"0","metakey_prefix":"","purchase_type":"-1","track_clicks":"1","track_impressions":"1","checked_out":null,"checked_out_time":null,"publish_up":"0000-00-00 00:00:00","publish_down":"0000-00-00 00:00:00","reset":"2018-08-01 00:00:00","created":"2018-07-01 19:11:32","language":"*","created_by":"291","created_by_alias":"","modified":"0000-00-00 00:00:00","modified_by":null,"version":1}', 0),
(23, 1, 9, '', '2018-07-01 19:11:51', 291, 759, '8bbfcbe4357684b95a7d9f557d5eef9af61b2c7e', '{"id":"1","cid":"0","type":"0","name":"Computing","alias":"computing","imptotal":0,"impmade":"0","clicks":"0","clickurl":"","state":"1","catid":"10","description":"","custombannercode":"","sticky":1,"ordering":"1","metakey":"","params":"{\\"imageurl\\":\\"images\\\\\\/banners\\\\\\/shop-ad-books.jpg\\",\\"width\\":\\"\\",\\"height\\":\\"\\",\\"alt\\":\\"Banner\\"}","own_prefix":"0","metakey_prefix":"","purchase_type":"-1","track_clicks":"1","track_impressions":"1","checked_out":0,"checked_out_time":"0000-00-00 00:00:00","publish_up":"0000-00-00 00:00:00","publish_down":"0000-00-00 00:00:00","reset":"2018-08-01 00:00:00","created":"2018-07-01 19:11:32","language":"*","created_by":"291","created_by_alias":"","modified":"0000-00-00 00:00:00","modified_by":"0","version":"1"}', 0),
(24, 1, 9, '', '2018-07-01 19:18:14', 291, 763, '3576c0ce6d1b2f99d81f52b74dc023ab54777e7b', '{"id":1,"cid":"0","type":"0","name":"Computing","alias":"computing","imptotal":0,"impmade":"0","clicks":"0","clickurl":false,"state":"1","catid":"10","description":"","custombannercode":"","sticky":"1","ordering":"1","metakey":"","params":"{\\"imageurl\\":\\"images\\\\\\/banners\\\\\\/osmbanner2.png\\",\\"width\\":\\"\\",\\"height\\":\\"\\",\\"alt\\":\\"Banner\\"}","own_prefix":"0","metakey_prefix":"","purchase_type":"-1","track_clicks":"1","track_impressions":"1","checked_out":"291","checked_out_time":"2018-07-01 19:17:52","publish_up":"0000-00-00 00:00:00","publish_down":"0000-00-00 00:00:00","reset":"2018-08-01 00:00:00","created":"2018-07-01 19:11:32","language":"*","created_by":"291","created_by_alias":"","modified":"2018-07-01 19:18:14","modified_by":"291","version":2}', 0),
(25, 1, 9, '', '2018-07-01 23:39:31', 291, 771, '95ea2d37500523b344f0062e2b1e591e0582719e', '{"id":1,"cid":"0","type":"0","name":"Computing","alias":"computing","imptotal":0,"impmade":"132","clicks":"0","clickurl":false,"state":"1","catid":"10","description":"","custombannercode":"","sticky":"1","ordering":"1","metakey":"","params":"{\\"imageurl\\":\\"images\\\\\\/banner_\\\\\\/OperatingSystems.jpg\\",\\"width\\":\\"\\",\\"height\\":\\"\\",\\"alt\\":\\"Banner\\"}","own_prefix":"0","metakey_prefix":"","purchase_type":"-1","track_clicks":"1","track_impressions":"1","checked_out":"291","checked_out_time":"2018-07-01 23:37:16","publish_up":"0000-00-00 00:00:00","publish_down":"0000-00-00 00:00:00","reset":"2018-08-01 00:00:00","created":"2018-07-01 19:11:32","language":"*","created_by":"291","created_by_alias":"","modified":"2018-07-01 23:39:31","modified_by":"291","version":4}', 0),
(26, 1, 2, '', '2018-07-02 01:44:18', 291, 1786, 'd69e0f91b40e2c0af06e090272b1d39ec8407a89', '{"id":1,"name":"Darren Booker","alias":"darren-booker","con_position":"","address":"","suburb":"","state":"Attiki","country":"Greece","postcode":"45665","telephone":"555-555-5555","fax":"","misc":"","image":"images\\/General_\\/person.jpg","email_to":"test@yahoo.gr","default_con":0,"published":"1","checked_out":null,"checked_out_time":null,"ordering":1,"params":"{\\"show_contact_category\\":\\"\\",\\"show_contact_list\\":\\"\\",\\"presentation_style\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_info\\":\\"\\",\\"show_name\\":\\"\\",\\"show_position\\":\\"\\",\\"show_email\\":\\"\\",\\"add_mailto_link\\":\\"\\",\\"show_street_address\\":\\"\\",\\"show_suburb\\":\\"\\",\\"show_state\\":\\"\\",\\"show_postcode\\":\\"\\",\\"show_country\\":\\"\\",\\"show_telephone\\":\\"\\",\\"show_mobile\\":\\"\\",\\"show_fax\\":\\"\\",\\"show_webpage\\":\\"\\",\\"show_image\\":\\"\\",\\"show_misc\\":\\"\\",\\"allow_vcard\\":\\"\\",\\"show_articles\\":\\"\\",\\"articles_display_num\\":\\"\\",\\"show_profile\\":\\"\\",\\"show_links\\":\\"\\",\\"linka_name\\":\\"\\",\\"linka\\":false,\\"linkb_name\\":\\"\\",\\"linkb\\":false,\\"linkc_name\\":\\"\\",\\"linkc\\":false,\\"linkd_name\\":\\"\\",\\"linkd\\":false,\\"linke_name\\":\\"\\",\\"linke\\":false,\\"contact_layout\\":\\"\\",\\"show_email_form\\":\\"\\",\\"show_email_copy\\":\\"\\",\\"banned_email\\":\\"\\",\\"banned_subject\\":\\"\\",\\"banned_text\\":\\"\\",\\"validate_session\\":\\"\\",\\"custom_reply\\":\\"\\",\\"redirect\\":\\"\\"}","user_id":"291","catid":"4","access":"1","mobile":"555-555-5555","webpage":false,"sortname1":"","sortname2":"","sortname3":"","language":"*","created":"2018-07-02 01:44:18","created_by":"291","created_by_alias":"","modified":"2018-07-02 01:44:18","modified_by":null,"metakey":"","metadesc":"","metadata":"{\\"robots\\":\\"\\",\\"rights\\":\\"\\"}","featured":"0","xreference":"","publish_up":"0000-00-00 00:00:00","publish_down":"0000-00-00 00:00:00","version":1,"hits":null}', 0),
(27, 2, 2, '', '2018-07-02 10:47:56', 291, 1702, 'dbcf4c2ecfa8491840fd42d1cd57b42f61cb9858', '{"id":2,"name":"George Cunanan","alias":"george-cunanan","con_position":"","address":"","suburb":"","state":"","country":"","postcode":"","telephone":"","fax":"","misc":"","image":"","email_to":"","default_con":0,"published":"1","checked_out":null,"checked_out_time":null,"ordering":2,"params":"{\\"show_contact_category\\":\\"\\",\\"show_contact_list\\":\\"\\",\\"presentation_style\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_info\\":\\"\\",\\"show_name\\":\\"\\",\\"show_position\\":\\"\\",\\"show_email\\":\\"\\",\\"add_mailto_link\\":\\"\\",\\"show_street_address\\":\\"\\",\\"show_suburb\\":\\"\\",\\"show_state\\":\\"\\",\\"show_postcode\\":\\"\\",\\"show_country\\":\\"\\",\\"show_telephone\\":\\"\\",\\"show_mobile\\":\\"\\",\\"show_fax\\":\\"\\",\\"show_webpage\\":\\"\\",\\"show_image\\":\\"\\",\\"show_misc\\":\\"\\",\\"allow_vcard\\":\\"\\",\\"show_articles\\":\\"\\",\\"articles_display_num\\":\\"\\",\\"show_profile\\":\\"\\",\\"show_links\\":\\"\\",\\"linka_name\\":\\"\\",\\"linka\\":false,\\"linkb_name\\":\\"\\",\\"linkb\\":false,\\"linkc_name\\":\\"\\",\\"linkc\\":false,\\"linkd_name\\":\\"\\",\\"linkd\\":false,\\"linke_name\\":\\"\\",\\"linke\\":false,\\"contact_layout\\":\\"\\",\\"show_email_form\\":\\"\\",\\"show_email_copy\\":\\"\\",\\"banned_email\\":\\"\\",\\"banned_subject\\":\\"\\",\\"banned_text\\":\\"\\",\\"validate_session\\":\\"\\",\\"custom_reply\\":\\"\\",\\"redirect\\":\\"\\"}","user_id":0,"catid":"4","access":"1","mobile":"","webpage":false,"sortname1":"","sortname2":"","sortname3":"","language":"*","created":"2018-07-02 10:47:56","created_by":"291","created_by_alias":"","modified":"2018-07-02 10:47:56","modified_by":null,"metakey":"","metadesc":"","metadata":"{\\"robots\\":\\"\\",\\"rights\\":\\"\\"}","featured":"0","xreference":"","publish_up":"0000-00-00 00:00:00","publish_down":"0000-00-00 00:00:00","version":1,"hits":null}', 0),
(28, 2, 2, '', '2018-07-02 10:49:45', 291, 1779, '6e5c482046058ae92fee85491a56dca663b80b2a', '{"id":2,"name":"George Cunanan","alias":"george-cunanan","con_position":"","address":"","suburb":"","state":"","country":"","postcode":"","telephone":"555-555-5555","fax":"","misc":"<p>He give the best answers!<\\/p>","image":"","email_to":"","default_con":0,"published":"1","checked_out":"291","checked_out_time":"2018-07-02 10:47:56","ordering":"2","params":"{\\"show_contact_category\\":\\"\\",\\"show_contact_list\\":\\"\\",\\"presentation_style\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_info\\":\\"\\",\\"show_name\\":\\"\\",\\"show_position\\":\\"\\",\\"show_email\\":\\"\\",\\"add_mailto_link\\":\\"\\",\\"show_street_address\\":\\"\\",\\"show_suburb\\":\\"\\",\\"show_state\\":\\"\\",\\"show_postcode\\":\\"\\",\\"show_country\\":\\"\\",\\"show_telephone\\":\\"\\",\\"show_mobile\\":\\"\\",\\"show_fax\\":\\"\\",\\"show_webpage\\":\\"\\",\\"show_image\\":\\"\\",\\"show_misc\\":\\"\\",\\"allow_vcard\\":\\"\\",\\"show_articles\\":\\"\\",\\"articles_display_num\\":\\"\\",\\"show_profile\\":\\"\\",\\"show_links\\":\\"\\",\\"linka_name\\":\\"\\",\\"linka\\":false,\\"linkb_name\\":\\"\\",\\"linkb\\":false,\\"linkc_name\\":\\"\\",\\"linkc\\":false,\\"linkd_name\\":\\"\\",\\"linkd\\":false,\\"linke_name\\":\\"\\",\\"linke\\":false,\\"contact_layout\\":\\"\\",\\"show_email_form\\":\\"\\",\\"show_email_copy\\":\\"\\",\\"banned_email\\":\\"\\",\\"banned_subject\\":\\"\\",\\"banned_text\\":\\"\\",\\"validate_session\\":\\"\\",\\"custom_reply\\":\\"\\",\\"redirect\\":\\"\\"}","user_id":0,"catid":"4","access":"1","mobile":"555-555-5555","webpage":false,"sortname1":"","sortname2":"","sortname3":"","language":"*","created":"2018-07-02 10:47:56","created_by":"291","created_by_alias":"","modified":"2018-07-02 10:49:45","modified_by":"291","metakey":"","metadesc":"","metadata":"{\\"robots\\":\\"\\",\\"rights\\":\\"\\"}","featured":"0","xreference":"","publish_up":"0000-00-00 00:00:00","publish_down":"0000-00-00 00:00:00","version":2,"hits":"0"}', 0),
(29, 2, 2, '', '2018-07-02 10:52:19', 291, 1803, '053fcb4b9d8338726b63a37be4bf39df2bc737c0', '{"id":2,"name":"George Cunanan","alias":"george-cunanan","con_position":"","address":"","suburb":"","state":"","country":"","postcode":"","telephone":"555-555-5555","fax":"","misc":"<p>He give the best answers!<\\/p>","image":"","email_to":"Georgecunanan@helpOS.com","default_con":0,"published":"1","checked_out":"291","checked_out_time":"2018-07-02 10:50:57","ordering":"2","params":"{\\"show_contact_category\\":\\"\\",\\"show_contact_list\\":\\"\\",\\"presentation_style\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_info\\":\\"\\",\\"show_name\\":\\"\\",\\"show_position\\":\\"\\",\\"show_email\\":\\"\\",\\"add_mailto_link\\":\\"\\",\\"show_street_address\\":\\"\\",\\"show_suburb\\":\\"\\",\\"show_state\\":\\"\\",\\"show_postcode\\":\\"\\",\\"show_country\\":\\"\\",\\"show_telephone\\":\\"\\",\\"show_mobile\\":\\"\\",\\"show_fax\\":\\"\\",\\"show_webpage\\":\\"\\",\\"show_image\\":\\"\\",\\"show_misc\\":\\"\\",\\"allow_vcard\\":\\"\\",\\"show_articles\\":\\"\\",\\"articles_display_num\\":\\"\\",\\"show_profile\\":\\"\\",\\"show_links\\":\\"\\",\\"linka_name\\":\\"\\",\\"linka\\":false,\\"linkb_name\\":\\"\\",\\"linkb\\":false,\\"linkc_name\\":\\"\\",\\"linkc\\":false,\\"linkd_name\\":\\"\\",\\"linkd\\":false,\\"linke_name\\":\\"\\",\\"linke\\":false,\\"contact_layout\\":\\"\\",\\"show_email_form\\":\\"\\",\\"show_email_copy\\":\\"\\",\\"banned_email\\":\\"\\",\\"banned_subject\\":\\"\\",\\"banned_text\\":\\"\\",\\"validate_session\\":\\"\\",\\"custom_reply\\":\\"\\",\\"redirect\\":\\"\\"}","user_id":0,"catid":"4","access":"1","mobile":"555-555-5555","webpage":false,"sortname1":"","sortname2":"","sortname3":"","language":"*","created":"2018-07-02 10:47:56","created_by":"291","created_by_alias":"","modified":"2018-07-02 10:52:19","modified_by":"291","metakey":"","metadesc":"","metadata":"{\\"robots\\":\\"\\",\\"rights\\":\\"\\"}","featured":"0","xreference":"","publish_up":"0000-00-00 00:00:00","publish_down":"0000-00-00 00:00:00","version":3,"hits":"2"}', 0),
(30, 2, 2, '', '2018-07-05 02:48:29', 291, 1747, 'ce8770fba345b2b2b18af241bf0e4202f90dd8f4', '{"id":2,"name":"George Cunanan","alias":"george-cunanan","con_position":"","address":"","suburb":"","state":"","country":"","postcode":"","telephone":"","fax":"","misc":"","image":"","email_to":"Georgecunanan@helpOS.com","default_con":0,"published":"1","checked_out":"291","checked_out_time":"2018-07-05 02:48:15","ordering":"2","params":"{\\"show_contact_category\\":\\"\\",\\"show_contact_list\\":\\"\\",\\"presentation_style\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_info\\":\\"\\",\\"show_name\\":\\"\\",\\"show_position\\":\\"\\",\\"show_email\\":\\"\\",\\"add_mailto_link\\":\\"\\",\\"show_street_address\\":\\"\\",\\"show_suburb\\":\\"\\",\\"show_state\\":\\"\\",\\"show_postcode\\":\\"\\",\\"show_country\\":\\"\\",\\"show_telephone\\":\\"\\",\\"show_mobile\\":\\"\\",\\"show_fax\\":\\"\\",\\"show_webpage\\":\\"\\",\\"show_image\\":\\"\\",\\"show_misc\\":\\"\\",\\"allow_vcard\\":\\"\\",\\"show_articles\\":\\"\\",\\"articles_display_num\\":\\"\\",\\"show_profile\\":\\"\\",\\"show_links\\":\\"\\",\\"linka_name\\":\\"\\",\\"linka\\":false,\\"linkb_name\\":\\"\\",\\"linkb\\":false,\\"linkc_name\\":\\"\\",\\"linkc\\":false,\\"linkd_name\\":\\"\\",\\"linkd\\":false,\\"linke_name\\":\\"\\",\\"linke\\":false,\\"contact_layout\\":\\"\\",\\"show_email_form\\":\\"\\",\\"show_email_copy\\":\\"\\",\\"banned_email\\":\\"\\",\\"banned_subject\\":\\"\\",\\"banned_text\\":\\"\\",\\"validate_session\\":\\"\\",\\"custom_reply\\":\\"\\",\\"redirect\\":\\"\\"}","user_id":0,"catid":"4","access":"1","mobile":"","webpage":false,"sortname1":"","sortname2":"","sortname3":"","language":"*","created":"2018-07-02 10:47:56","created_by":"291","created_by_alias":"","modified":"2018-07-05 02:48:29","modified_by":"291","metakey":"","metadesc":"","metadata":"{\\"robots\\":\\"\\",\\"rights\\":\\"\\"}","featured":"0","xreference":"","publish_up":"0000-00-00 00:00:00","publish_down":"0000-00-00 00:00:00","version":4,"hits":"32"}', 0),
(31, 2, 2, '', '2018-07-05 02:48:57', 291, 1757, 'b0f932baab99bb0f24001b7e4ce5b9629de6b530', '{"id":2,"name":"Giannakos Anthonis","alias":"giannakos-antonis","con_position":"","address":"","suburb":"","state":"","country":"","postcode":"","telephone":"","fax":"","misc":"","image":"","email_to":"antgiannakos@outlook.com.gr","default_con":0,"published":"1","checked_out":"291","checked_out_time":"2018-07-05 02:48:29","ordering":"2","params":"{\\"show_contact_category\\":\\"\\",\\"show_contact_list\\":\\"\\",\\"presentation_style\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_info\\":\\"\\",\\"show_name\\":\\"\\",\\"show_position\\":\\"\\",\\"show_email\\":\\"\\",\\"add_mailto_link\\":\\"\\",\\"show_street_address\\":\\"\\",\\"show_suburb\\":\\"\\",\\"show_state\\":\\"\\",\\"show_postcode\\":\\"\\",\\"show_country\\":\\"\\",\\"show_telephone\\":\\"\\",\\"show_mobile\\":\\"\\",\\"show_fax\\":\\"\\",\\"show_webpage\\":\\"\\",\\"show_image\\":\\"\\",\\"show_misc\\":\\"\\",\\"allow_vcard\\":\\"\\",\\"show_articles\\":\\"\\",\\"articles_display_num\\":\\"\\",\\"show_profile\\":\\"\\",\\"show_links\\":\\"\\",\\"linka_name\\":\\"\\",\\"linka\\":false,\\"linkb_name\\":\\"\\",\\"linkb\\":false,\\"linkc_name\\":\\"\\",\\"linkc\\":false,\\"linkd_name\\":\\"\\",\\"linkd\\":false,\\"linke_name\\":\\"\\",\\"linke\\":false,\\"contact_layout\\":\\"\\",\\"show_email_form\\":\\"\\",\\"show_email_copy\\":\\"\\",\\"banned_email\\":\\"\\",\\"banned_subject\\":\\"\\",\\"banned_text\\":\\"\\",\\"validate_session\\":\\"\\",\\"custom_reply\\":\\"\\",\\"redirect\\":\\"\\"}","user_id":0,"catid":"4","access":"1","mobile":"","webpage":false,"sortname1":"","sortname2":"","sortname3":"","language":"*","created":"2018-07-02 10:47:56","created_by":"291","created_by_alias":"","modified":"2018-07-05 02:48:57","modified_by":"291","metakey":"","metadesc":"","metadata":"{\\"robots\\":\\"\\",\\"rights\\":\\"\\"}","featured":"0","xreference":"","publish_up":"0000-00-00 00:00:00","publish_down":"0000-00-00 00:00:00","version":5,"hits":"32"}', 0);
INSERT INTO `uoj7s_ucm_history` (`version_id`, `ucm_item_id`, `ucm_type_id`, `version_note`, `save_date`, `editor_user_id`, `character_count`, `sha1_hash`, `version_data`, `keep_forever`) VALUES
(32, 2, 2, '', '2018-07-05 02:50:10', 291, 1757, 'af6ad32118a9354ce0a6aee9e24cd854afb62eab', '{"id":2,"name":"Giannakos Anthonis","alias":"giannakos-antonis","con_position":"","address":"","suburb":"","state":"","country":"","postcode":"","telephone":"","fax":"","misc":"","image":"","email_to":"antgiannakos@outlook.com.gr","default_con":0,"published":"0","checked_out":"291","checked_out_time":"2018-07-05 02:49:41","ordering":"2","params":"{\\"show_contact_category\\":\\"\\",\\"show_contact_list\\":\\"\\",\\"presentation_style\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_info\\":\\"\\",\\"show_name\\":\\"\\",\\"show_position\\":\\"\\",\\"show_email\\":\\"\\",\\"add_mailto_link\\":\\"\\",\\"show_street_address\\":\\"\\",\\"show_suburb\\":\\"\\",\\"show_state\\":\\"\\",\\"show_postcode\\":\\"\\",\\"show_country\\":\\"\\",\\"show_telephone\\":\\"\\",\\"show_mobile\\":\\"\\",\\"show_fax\\":\\"\\",\\"show_webpage\\":\\"\\",\\"show_image\\":\\"\\",\\"show_misc\\":\\"\\",\\"allow_vcard\\":\\"\\",\\"show_articles\\":\\"\\",\\"articles_display_num\\":\\"\\",\\"show_profile\\":\\"\\",\\"show_links\\":\\"\\",\\"linka_name\\":\\"\\",\\"linka\\":false,\\"linkb_name\\":\\"\\",\\"linkb\\":false,\\"linkc_name\\":\\"\\",\\"linkc\\":false,\\"linkd_name\\":\\"\\",\\"linkd\\":false,\\"linke_name\\":\\"\\",\\"linke\\":false,\\"contact_layout\\":\\"\\",\\"show_email_form\\":\\"\\",\\"show_email_copy\\":\\"\\",\\"banned_email\\":\\"\\",\\"banned_subject\\":\\"\\",\\"banned_text\\":\\"\\",\\"validate_session\\":\\"\\",\\"custom_reply\\":\\"\\",\\"redirect\\":\\"\\"}","user_id":0,"catid":"4","access":"1","mobile":"","webpage":false,"sortname1":"","sortname2":"","sortname3":"","language":"*","created":"2018-07-02 10:47:56","created_by":"291","created_by_alias":"","modified":"2018-07-05 02:50:10","modified_by":"291","metakey":"","metadesc":"","metadata":"{\\"robots\\":\\"\\",\\"rights\\":\\"\\"}","featured":"0","xreference":"","publish_up":"0000-00-00 00:00:00","publish_down":"0000-00-00 00:00:00","version":7,"hits":"33"}', 0),
(33, 2, 2, '', '2018-07-05 02:52:16', 291, 1785, '212fb04ab6ec4a2c804a53aef2cd78da08cf9ed6', '{"id":2,"name":"Giannakos Anthonis","alias":"giannakos-antonis","con_position":"","address":"","suburb":"","state":"","country":"","postcode":"","telephone":"","fax":"","misc":"","image":"images\\/General_\\/person.jpg","email_to":"antgiannakos@outlook.com.gr","default_con":0,"published":"1","checked_out":"291","checked_out_time":"2018-07-05 02:50:22","ordering":"2","params":"{\\"show_contact_category\\":\\"\\",\\"show_contact_list\\":\\"\\",\\"presentation_style\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_info\\":\\"\\",\\"show_name\\":\\"\\",\\"show_position\\":\\"\\",\\"show_email\\":\\"\\",\\"add_mailto_link\\":\\"\\",\\"show_street_address\\":\\"\\",\\"show_suburb\\":\\"\\",\\"show_state\\":\\"\\",\\"show_postcode\\":\\"\\",\\"show_country\\":\\"\\",\\"show_telephone\\":\\"\\",\\"show_mobile\\":\\"\\",\\"show_fax\\":\\"\\",\\"show_webpage\\":\\"\\",\\"show_image\\":\\"\\",\\"show_misc\\":\\"\\",\\"allow_vcard\\":\\"\\",\\"show_articles\\":\\"\\",\\"articles_display_num\\":\\"\\",\\"show_profile\\":\\"\\",\\"show_links\\":\\"\\",\\"linka_name\\":\\"\\",\\"linka\\":false,\\"linkb_name\\":\\"\\",\\"linkb\\":false,\\"linkc_name\\":\\"\\",\\"linkc\\":false,\\"linkd_name\\":\\"\\",\\"linkd\\":false,\\"linke_name\\":\\"\\",\\"linke\\":false,\\"contact_layout\\":\\"\\",\\"show_email_form\\":\\"\\",\\"show_email_copy\\":\\"\\",\\"banned_email\\":\\"\\",\\"banned_subject\\":\\"\\",\\"banned_text\\":\\"\\",\\"validate_session\\":\\"\\",\\"custom_reply\\":\\"\\",\\"redirect\\":\\"\\"}","user_id":0,"catid":"4","access":"1","mobile":"","webpage":false,"sortname1":"","sortname2":"","sortname3":"","language":"*","created":"2018-07-02 10:47:56","created_by":"291","created_by_alias":"","modified":"2018-07-05 02:52:16","modified_by":"291","metakey":"","metadesc":"","metadata":"{\\"robots\\":\\"\\",\\"rights\\":\\"\\"}","featured":"0","xreference":"","publish_up":"0000-00-00 00:00:00","publish_down":"0000-00-00 00:00:00","version":9,"hits":"34"}', 0);

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_updates`
--

CREATE TABLE `uoj7s_updates` (
  `update_id` int(11) NOT NULL,
  `update_site_id` int(11) DEFAULT '0',
  `extension_id` int(11) DEFAULT '0',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `element` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `folder` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `client_id` tinyint(3) DEFAULT '0',
  `version` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `detailsurl` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `infourl` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `extra_query` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Available Updates';

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_update_sites`
--

CREATE TABLE `uoj7s_update_sites` (
  `update_site_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `location` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` int(11) DEFAULT '0',
  `last_check_timestamp` bigint(20) DEFAULT '0',
  `extra_query` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Update Sites';

--
-- Dumping data for table `uoj7s_update_sites`
--

INSERT INTO `uoj7s_update_sites` (`update_site_id`, `name`, `type`, `location`, `enabled`, `last_check_timestamp`, `extra_query`) VALUES
(1, 'Joomla! Core', 'collection', 'https://update.joomla.org/core/list.xml', 1, 1530759469, ''),
(2, 'Accredited Joomla! Translations', 'collection', 'https://update.joomla.org/language/translationlist_3.xml', 1, 0, ''),
(3, 'Joomla! Update Component Update Site', 'extension', 'https://update.joomla.org/core/extensions/com_joomlaupdate.xml', 1, 0, ''),
(4, 'WebInstaller Update Site', 'extension', 'https://appscdn.joomla.org/webapps/jedapps/webinstaller.xml', 1, 0, ''),
(5, 'JCE Editor Package', 'collection', 'https://cdn.joomlacontenteditor.net/updates/xml/pkg_jce.xml', 1, 0, ''),
(6, 'SunFw FrameWork Updates', 'extension', 'http://www.joomlashine.com/versioning/extensions/sunfwframework.xml', 1, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_update_sites_extensions`
--

CREATE TABLE `uoj7s_update_sites_extensions` (
  `update_site_id` int(11) NOT NULL DEFAULT '0',
  `extension_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Links extensions to update sites';

--
-- Dumping data for table `uoj7s_update_sites_extensions`
--

INSERT INTO `uoj7s_update_sites_extensions` (`update_site_id`, `extension_id`) VALUES
(1, 700),
(2, 802),
(2, 10014),
(3, 28),
(4, 10000),
(5, 10009),
(6, 10010);

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_usergroups`
--

CREATE TABLE `uoj7s_usergroups` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Primary Key',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Adjacency List Reference Id',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uoj7s_usergroups`
--

INSERT INTO `uoj7s_usergroups` (`id`, `parent_id`, `lft`, `rgt`, `title`) VALUES
(1, 0, 1, 18, 'Public'),
(2, 1, 8, 15, 'Registered'),
(3, 2, 9, 14, 'Author'),
(4, 3, 10, 13, 'Editor'),
(5, 4, 11, 12, 'Publisher'),
(6, 1, 4, 7, 'Manager'),
(7, 6, 5, 6, 'Administrator'),
(8, 1, 16, 17, 'Super Users'),
(9, 1, 2, 3, 'Guest');

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_users`
--

CREATE TABLE `uoj7s_users` (
  `id` int(11) NOT NULL,
  `name` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastResetTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date of last password reset',
  `resetCount` int(11) NOT NULL DEFAULT '0' COMMENT 'Count of password resets since lastResetTime',
  `otpKey` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Two factor authentication encrypted keys',
  `otep` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'One time emergency passwords',
  `requireReset` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Require user to reset password on next login'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uoj7s_users`
--

INSERT INTO `uoj7s_users` (`id`, `name`, `username`, `email`, `password`, `block`, `sendEmail`, `registerDate`, `lastvisitDate`, `activation`, `params`, `lastResetTime`, `resetCount`, `otpKey`, `otep`, `requireReset`) VALUES
(291, 'Super User', 'eipo$$3gg', 'test@test.com', '$2y$10$wSmriDrLry77iKcFmjgxKu0HZ24yihuOVPQy2l9bto7cqjlZlGcpm', 0, 0, '2018-06-29 21:04:20', '2018-07-05 00:20:39', '0', '{"admin_style":"","admin_language":"","language":"","editor":"","helpsite":"","timezone":""}', '0000-00-00 00:00:00', 0, '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_user_keys`
--

CREATE TABLE `uoj7s_user_keys` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `series` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invalid` tinyint(4) NOT NULL,
  `time` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uastring` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_user_notes`
--

CREATE TABLE `uoj7s_user_notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `catid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `subject` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) UNSIGNED NOT NULL,
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_user_profiles`
--

CREATE TABLE `uoj7s_user_profiles` (
  `user_id` int(11) NOT NULL,
  `profile_key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Simple user profile storage table';

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_user_usergroup_map`
--

CREATE TABLE `uoj7s_user_usergroup_map` (
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__users.id',
  `group_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__usergroups.id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uoj7s_user_usergroup_map`
--

INSERT INTO `uoj7s_user_usergroup_map` (`user_id`, `group_id`) VALUES
(291, 8);

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_utf8_conversion`
--

CREATE TABLE `uoj7s_utf8_conversion` (
  `converted` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uoj7s_utf8_conversion`
--

INSERT INTO `uoj7s_utf8_conversion` (`converted`) VALUES
(2);

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_viewlevels`
--

CREATE TABLE `uoj7s_viewlevels` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Primary Key',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rules` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded access control.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uoj7s_viewlevels`
--

INSERT INTO `uoj7s_viewlevels` (`id`, `title`, `ordering`, `rules`) VALUES
(1, 'Public', 0, '[1]'),
(2, 'Registered', 2, '[6,2,8]'),
(3, 'Special', 3, '[6,3,8]'),
(5, 'Guest', 1, '[9]'),
(6, 'Super Users', 4, '[8]');

-- --------------------------------------------------------

--
-- Table structure for table `uoj7s_wf_profiles`
--

CREATE TABLE `uoj7s_wf_profiles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `users` text NOT NULL,
  `types` text NOT NULL,
  `components` text NOT NULL,
  `area` tinyint(3) NOT NULL,
  `device` varchar(255) NOT NULL,
  `rows` text NOT NULL,
  `plugins` text NOT NULL,
  `published` tinyint(3) NOT NULL,
  `ordering` int(11) NOT NULL,
  `checked_out` tinyint(3) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `params` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `uoj7s_wf_profiles`
--

INSERT INTO `uoj7s_wf_profiles` (`id`, `name`, `description`, `users`, `types`, `components`, `area`, `device`, `rows`, `plugins`, `published`, `ordering`, `checked_out`, `checked_out_time`, `params`) VALUES
(1, 'Default', 'Default Profile for all users', '', '3,4,5,6,8,7', '', 0, 'desktop,tablet,phone', 'help,newdocument,undo,redo,spacer,bold,italic,underline,strikethrough,justifyfull,justifycenter,justifyleft,justifyright,spacer,blockquote,formatselect,styleselect,removeformat,cleanup;fontselect,fontsizeselect,fontcolor,spacer,clipboard,indent,outdent,lists,sub,sup,textcase,charmap,hr;directionality,fullscreen,print,searchreplace,spacer,table,style,xhtmlxtras;visualaid,visualchars,visualblocks,nonbreaking,anchor,unlink,link,imgmanager,spellchecker,article', 'formatselect,styleselect,cleanup,fontselect,fontsizeselect,fontcolor,clipboard,lists,textcase,charmap,hr,directionality,fullscreen,print,searchreplace,table,style,xhtmlxtras,visualchars,visualblocks,nonbreaking,anchor,link,imgmanager,spellchecker,article,spellchecker,article,browser,contextmenu,inlinepopups,media,preview,source', 1, 1, 0, '0000-00-00 00:00:00', ''),
(2, 'Front End', 'Sample Front-end Profile', '', '3,4,5', '', 1, 'desktop,tablet,phone', 'help,newdocument,undo,redo,spacer,bold,italic,underline,strikethrough,justifyfull,justifycenter,justifyleft,justifyright,spacer,formatselect,styleselect;clipboard,searchreplace,indent,outdent,lists,cleanup,charmap,removeformat,hr,sub,sup,textcase,nonbreaking,visualchars,visualblocks;fullscreen,print,visualaid,style,xhtmlxtras,anchor,unlink,link,imgmanager,spellchecker,article', 'charmap,contextmenu,inlinepopups,help,clipboard,searchreplace,fullscreen,preview,print,style,textcase,nonbreaking,visualchars,visualblocks,xhtmlxtras,imgmanager,anchor,link,spellchecker,article,lists,formatselect,styleselect,hr', 0, 2, 0, '0000-00-00 00:00:00', ''),
(3, 'Blogger', 'Simple Blogging Profile', '', '3,4,5,6,8,7', '', 0, 'desktop,tablet,phone', 'bold,italic,strikethrough,lists,blockquote,spacer,justifyleft,justifycenter,justifyright,spacer,link,unlink,imgmanager,article,spellchecker,fullscreen,kitchensink;formatselect,styleselect,underline,justifyfull,clipboard,removeformat,charmap,indent,outdent,undo,redo,help', 'link,imgmanager,article,spellchecker,fullscreen,kitchensink,clipboard,contextmenu,inlinepopups,lists,formatselect,styleselect,textpattern', 0, 3, 0, '0000-00-00 00:00:00', '{"editor":{"toggle":"0"}}'),
(4, 'Mobile', 'Sample Mobile Profile', '', '3,4,5,6,8,7', '', 0, 'tablet,phone', 'undo,redo,spacer,bold,italic,underline,formatselect,spacer,justifyleft,justifycenter,justifyfull,justifyright,spacer,fullscreen,kitchensink;styleselect,lists,spellchecker,article,link,unlink', 'fullscreen,kitchensink,spellchecker,article,link,inlinepopups,lists,formatselect,styleselect,textpattern', 0, 4, 0, '0000-00-00 00:00:00', '{"editor":{"toolbar_theme":"mobile","resizing":"0","resize_horizontal":"0","resizing_use_cookie":"0","toggle":"0","links":{"popups":{"default":"","jcemediabox":{"enable":"0"},"window":{"enable":"0"}}}}}'),
(5, 'Markdown', 'Sample Markdown Profile', '', '6,7,3,4,5,8', '', 0, 'desktop,tablet,phone', 'fullscreen,justifyleft,justifycenter,justifyfull,justifyright,link,unlink,imgmanager,styleselect', 'fullscreen,link,imgmanager,styleselect,inlinepopups,media,textpattern', 0, 5, 0, '0000-00-00 00:00:00', '{"editor":{"toolbar_theme":"mobile"}}');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `uoj7s_assets`
--
ALTER TABLE `uoj7s_assets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_asset_name` (`name`),
  ADD KEY `idx_lft_rgt` (`lft`,`rgt`),
  ADD KEY `idx_parent_id` (`parent_id`);

--
-- Indexes for table `uoj7s_associations`
--
ALTER TABLE `uoj7s_associations`
  ADD PRIMARY KEY (`context`,`id`),
  ADD KEY `idx_key` (`key`);

--
-- Indexes for table `uoj7s_banners`
--
ALTER TABLE `uoj7s_banners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_state` (`state`),
  ADD KEY `idx_own_prefix` (`own_prefix`),
  ADD KEY `idx_metakey_prefix` (`metakey_prefix`(100)),
  ADD KEY `idx_banner_catid` (`catid`),
  ADD KEY `idx_language` (`language`);

--
-- Indexes for table `uoj7s_banner_clients`
--
ALTER TABLE `uoj7s_banner_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_own_prefix` (`own_prefix`),
  ADD KEY `idx_metakey_prefix` (`metakey_prefix`(100));

--
-- Indexes for table `uoj7s_banner_tracks`
--
ALTER TABLE `uoj7s_banner_tracks`
  ADD PRIMARY KEY (`track_date`,`track_type`,`banner_id`),
  ADD KEY `idx_track_date` (`track_date`),
  ADD KEY `idx_track_type` (`track_type`),
  ADD KEY `idx_banner_id` (`banner_id`);

--
-- Indexes for table `uoj7s_categories`
--
ALTER TABLE `uoj7s_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_idx` (`extension`,`published`,`access`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_path` (`path`(100)),
  ADD KEY `idx_left_right` (`lft`,`rgt`),
  ADD KEY `idx_alias` (`alias`(100)),
  ADD KEY `idx_language` (`language`);

--
-- Indexes for table `uoj7s_contact_details`
--
ALTER TABLE `uoj7s_contact_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_state` (`published`),
  ADD KEY `idx_catid` (`catid`),
  ADD KEY `idx_createdby` (`created_by`),
  ADD KEY `idx_featured_catid` (`featured`,`catid`),
  ADD KEY `idx_language` (`language`),
  ADD KEY `idx_xreference` (`xreference`);

--
-- Indexes for table `uoj7s_content`
--
ALTER TABLE `uoj7s_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_state` (`state`),
  ADD KEY `idx_catid` (`catid`),
  ADD KEY `idx_createdby` (`created_by`),
  ADD KEY `idx_featured_catid` (`featured`,`catid`),
  ADD KEY `idx_language` (`language`),
  ADD KEY `idx_xreference` (`xreference`),
  ADD KEY `idx_alias` (`alias`(191));

--
-- Indexes for table `uoj7s_contentitem_tag_map`
--
ALTER TABLE `uoj7s_contentitem_tag_map`
  ADD UNIQUE KEY `uc_ItemnameTagid` (`type_id`,`content_item_id`,`tag_id`),
  ADD KEY `idx_tag_type` (`tag_id`,`type_id`),
  ADD KEY `idx_date_id` (`tag_date`,`tag_id`),
  ADD KEY `idx_core_content_id` (`core_content_id`);

--
-- Indexes for table `uoj7s_content_frontpage`
--
ALTER TABLE `uoj7s_content_frontpage`
  ADD PRIMARY KEY (`content_id`);

--
-- Indexes for table `uoj7s_content_rating`
--
ALTER TABLE `uoj7s_content_rating`
  ADD PRIMARY KEY (`content_id`);

--
-- Indexes for table `uoj7s_content_types`
--
ALTER TABLE `uoj7s_content_types`
  ADD PRIMARY KEY (`type_id`),
  ADD KEY `idx_alias` (`type_alias`(100));

--
-- Indexes for table `uoj7s_extensions`
--
ALTER TABLE `uoj7s_extensions`
  ADD PRIMARY KEY (`extension_id`),
  ADD KEY `element_clientid` (`element`,`client_id`),
  ADD KEY `element_folder_clientid` (`element`,`folder`,`client_id`),
  ADD KEY `extension` (`type`,`element`,`folder`,`client_id`);

--
-- Indexes for table `uoj7s_fields`
--
ALTER TABLE `uoj7s_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_state` (`state`),
  ADD KEY `idx_created_user_id` (`created_user_id`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_context` (`context`(191)),
  ADD KEY `idx_language` (`language`);

--
-- Indexes for table `uoj7s_fields_categories`
--
ALTER TABLE `uoj7s_fields_categories`
  ADD PRIMARY KEY (`field_id`,`category_id`);

--
-- Indexes for table `uoj7s_fields_groups`
--
ALTER TABLE `uoj7s_fields_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_state` (`state`),
  ADD KEY `idx_created_by` (`created_by`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_context` (`context`(191)),
  ADD KEY `idx_language` (`language`);

--
-- Indexes for table `uoj7s_fields_values`
--
ALTER TABLE `uoj7s_fields_values`
  ADD KEY `idx_field_id` (`field_id`),
  ADD KEY `idx_item_id` (`item_id`(191));

--
-- Indexes for table `uoj7s_finder_filters`
--
ALTER TABLE `uoj7s_finder_filters`
  ADD PRIMARY KEY (`filter_id`);

--
-- Indexes for table `uoj7s_finder_links`
--
ALTER TABLE `uoj7s_finder_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `idx_type` (`type_id`),
  ADD KEY `idx_title` (`title`(100)),
  ADD KEY `idx_md5` (`md5sum`),
  ADD KEY `idx_url` (`url`(75)),
  ADD KEY `idx_published_list` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`list_price`),
  ADD KEY `idx_published_sale` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`sale_price`);

--
-- Indexes for table `uoj7s_finder_links_terms0`
--
ALTER TABLE `uoj7s_finder_links_terms0`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `uoj7s_finder_links_terms1`
--
ALTER TABLE `uoj7s_finder_links_terms1`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `uoj7s_finder_links_terms2`
--
ALTER TABLE `uoj7s_finder_links_terms2`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `uoj7s_finder_links_terms3`
--
ALTER TABLE `uoj7s_finder_links_terms3`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `uoj7s_finder_links_terms4`
--
ALTER TABLE `uoj7s_finder_links_terms4`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `uoj7s_finder_links_terms5`
--
ALTER TABLE `uoj7s_finder_links_terms5`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `uoj7s_finder_links_terms6`
--
ALTER TABLE `uoj7s_finder_links_terms6`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `uoj7s_finder_links_terms7`
--
ALTER TABLE `uoj7s_finder_links_terms7`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `uoj7s_finder_links_terms8`
--
ALTER TABLE `uoj7s_finder_links_terms8`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `uoj7s_finder_links_terms9`
--
ALTER TABLE `uoj7s_finder_links_terms9`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `uoj7s_finder_links_termsa`
--
ALTER TABLE `uoj7s_finder_links_termsa`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `uoj7s_finder_links_termsb`
--
ALTER TABLE `uoj7s_finder_links_termsb`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `uoj7s_finder_links_termsc`
--
ALTER TABLE `uoj7s_finder_links_termsc`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `uoj7s_finder_links_termsd`
--
ALTER TABLE `uoj7s_finder_links_termsd`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `uoj7s_finder_links_termse`
--
ALTER TABLE `uoj7s_finder_links_termse`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `uoj7s_finder_links_termsf`
--
ALTER TABLE `uoj7s_finder_links_termsf`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `uoj7s_finder_taxonomy`
--
ALTER TABLE `uoj7s_finder_taxonomy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `state` (`state`),
  ADD KEY `ordering` (`ordering`),
  ADD KEY `access` (`access`),
  ADD KEY `idx_parent_published` (`parent_id`,`state`,`access`);

--
-- Indexes for table `uoj7s_finder_taxonomy_map`
--
ALTER TABLE `uoj7s_finder_taxonomy_map`
  ADD PRIMARY KEY (`link_id`,`node_id`),
  ADD KEY `link_id` (`link_id`),
  ADD KEY `node_id` (`node_id`);

--
-- Indexes for table `uoj7s_finder_terms`
--
ALTER TABLE `uoj7s_finder_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD UNIQUE KEY `idx_term` (`term`),
  ADD KEY `idx_term_phrase` (`term`,`phrase`),
  ADD KEY `idx_stem_phrase` (`stem`,`phrase`),
  ADD KEY `idx_soundex_phrase` (`soundex`,`phrase`);

--
-- Indexes for table `uoj7s_finder_terms_common`
--
ALTER TABLE `uoj7s_finder_terms_common`
  ADD KEY `idx_word_lang` (`term`,`language`),
  ADD KEY `idx_lang` (`language`);

--
-- Indexes for table `uoj7s_finder_tokens`
--
ALTER TABLE `uoj7s_finder_tokens`
  ADD KEY `idx_word` (`term`),
  ADD KEY `idx_context` (`context`);

--
-- Indexes for table `uoj7s_finder_tokens_aggregate`
--
ALTER TABLE `uoj7s_finder_tokens_aggregate`
  ADD KEY `token` (`term`),
  ADD KEY `keyword_id` (`term_id`);

--
-- Indexes for table `uoj7s_finder_types`
--
ALTER TABLE `uoj7s_finder_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`);

--
-- Indexes for table `uoj7s_languages`
--
ALTER TABLE `uoj7s_languages`
  ADD PRIMARY KEY (`lang_id`),
  ADD UNIQUE KEY `idx_sef` (`sef`),
  ADD UNIQUE KEY `idx_langcode` (`lang_code`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_ordering` (`ordering`);

--
-- Indexes for table `uoj7s_menu`
--
ALTER TABLE `uoj7s_menu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_client_id_parent_id_alias_language` (`client_id`,`parent_id`,`alias`(100),`language`),
  ADD KEY `idx_componentid` (`component_id`,`menutype`,`published`,`access`),
  ADD KEY `idx_menutype` (`menutype`),
  ADD KEY `idx_left_right` (`lft`,`rgt`),
  ADD KEY `idx_alias` (`alias`(100)),
  ADD KEY `idx_path` (`path`(100)),
  ADD KEY `idx_language` (`language`);

--
-- Indexes for table `uoj7s_menu_types`
--
ALTER TABLE `uoj7s_menu_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_menutype` (`menutype`);

--
-- Indexes for table `uoj7s_messages`
--
ALTER TABLE `uoj7s_messages`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `useridto_state` (`user_id_to`,`state`);

--
-- Indexes for table `uoj7s_messages_cfg`
--
ALTER TABLE `uoj7s_messages_cfg`
  ADD UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`);

--
-- Indexes for table `uoj7s_modules`
--
ALTER TABLE `uoj7s_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `published` (`published`,`access`),
  ADD KEY `newsfeeds` (`module`,`published`),
  ADD KEY `idx_language` (`language`);

--
-- Indexes for table `uoj7s_modules_menu`
--
ALTER TABLE `uoj7s_modules_menu`
  ADD PRIMARY KEY (`moduleid`,`menuid`);

--
-- Indexes for table `uoj7s_newsfeeds`
--
ALTER TABLE `uoj7s_newsfeeds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_state` (`published`),
  ADD KEY `idx_catid` (`catid`),
  ADD KEY `idx_createdby` (`created_by`),
  ADD KEY `idx_language` (`language`),
  ADD KEY `idx_xreference` (`xreference`);

--
-- Indexes for table `uoj7s_overrider`
--
ALTER TABLE `uoj7s_overrider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uoj7s_postinstall_messages`
--
ALTER TABLE `uoj7s_postinstall_messages`
  ADD PRIMARY KEY (`postinstall_message_id`);

--
-- Indexes for table `uoj7s_redirect_links`
--
ALTER TABLE `uoj7s_redirect_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_old_url` (`old_url`(100)),
  ADD KEY `idx_link_modifed` (`modified_date`);

--
-- Indexes for table `uoj7s_schemas`
--
ALTER TABLE `uoj7s_schemas`
  ADD PRIMARY KEY (`extension_id`,`version_id`);

--
-- Indexes for table `uoj7s_session`
--
ALTER TABLE `uoj7s_session`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `time` (`time`);

--
-- Indexes for table `uoj7s_sunfw_styles`
--
ALTER TABLE `uoj7s_sunfw_styles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uoj7s_tags`
--
ALTER TABLE `uoj7s_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tag_idx` (`published`,`access`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_path` (`path`(100)),
  ADD KEY `idx_left_right` (`lft`,`rgt`),
  ADD KEY `idx_alias` (`alias`(100)),
  ADD KEY `idx_language` (`language`);

--
-- Indexes for table `uoj7s_template_styles`
--
ALTER TABLE `uoj7s_template_styles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_template` (`template`),
  ADD KEY `idx_home` (`home`);

--
-- Indexes for table `uoj7s_ucm_base`
--
ALTER TABLE `uoj7s_ucm_base`
  ADD PRIMARY KEY (`ucm_id`),
  ADD KEY `idx_ucm_item_id` (`ucm_item_id`),
  ADD KEY `idx_ucm_type_id` (`ucm_type_id`),
  ADD KEY `idx_ucm_language_id` (`ucm_language_id`);

--
-- Indexes for table `uoj7s_ucm_content`
--
ALTER TABLE `uoj7s_ucm_content`
  ADD PRIMARY KEY (`core_content_id`),
  ADD KEY `tag_idx` (`core_state`,`core_access`),
  ADD KEY `idx_access` (`core_access`),
  ADD KEY `idx_alias` (`core_alias`(100)),
  ADD KEY `idx_language` (`core_language`),
  ADD KEY `idx_title` (`core_title`(100)),
  ADD KEY `idx_modified_time` (`core_modified_time`),
  ADD KEY `idx_created_time` (`core_created_time`),
  ADD KEY `idx_content_type` (`core_type_alias`(100)),
  ADD KEY `idx_core_modified_user_id` (`core_modified_user_id`),
  ADD KEY `idx_core_checked_out_user_id` (`core_checked_out_user_id`),
  ADD KEY `idx_core_created_user_id` (`core_created_user_id`),
  ADD KEY `idx_core_type_id` (`core_type_id`);

--
-- Indexes for table `uoj7s_ucm_history`
--
ALTER TABLE `uoj7s_ucm_history`
  ADD PRIMARY KEY (`version_id`),
  ADD KEY `idx_ucm_item_id` (`ucm_type_id`,`ucm_item_id`),
  ADD KEY `idx_save_date` (`save_date`);

--
-- Indexes for table `uoj7s_updates`
--
ALTER TABLE `uoj7s_updates`
  ADD PRIMARY KEY (`update_id`);

--
-- Indexes for table `uoj7s_update_sites`
--
ALTER TABLE `uoj7s_update_sites`
  ADD PRIMARY KEY (`update_site_id`);

--
-- Indexes for table `uoj7s_update_sites_extensions`
--
ALTER TABLE `uoj7s_update_sites_extensions`
  ADD PRIMARY KEY (`update_site_id`,`extension_id`);

--
-- Indexes for table `uoj7s_usergroups`
--
ALTER TABLE `uoj7s_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_usergroup_parent_title_lookup` (`parent_id`,`title`),
  ADD KEY `idx_usergroup_title_lookup` (`title`),
  ADD KEY `idx_usergroup_adjacency_lookup` (`parent_id`),
  ADD KEY `idx_usergroup_nested_set_lookup` (`lft`,`rgt`) USING BTREE;

--
-- Indexes for table `uoj7s_users`
--
ALTER TABLE `uoj7s_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_name` (`name`(100)),
  ADD KEY `idx_block` (`block`),
  ADD KEY `username` (`username`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `uoj7s_user_keys`
--
ALTER TABLE `uoj7s_user_keys`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `series` (`series`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `uoj7s_user_notes`
--
ALTER TABLE `uoj7s_user_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_category_id` (`catid`);

--
-- Indexes for table `uoj7s_user_profiles`
--
ALTER TABLE `uoj7s_user_profiles`
  ADD UNIQUE KEY `idx_user_id_profile_key` (`user_id`,`profile_key`);

--
-- Indexes for table `uoj7s_user_usergroup_map`
--
ALTER TABLE `uoj7s_user_usergroup_map`
  ADD PRIMARY KEY (`user_id`,`group_id`);

--
-- Indexes for table `uoj7s_viewlevels`
--
ALTER TABLE `uoj7s_viewlevels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_assetgroup_title_lookup` (`title`);

--
-- Indexes for table `uoj7s_wf_profiles`
--
ALTER TABLE `uoj7s_wf_profiles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `uoj7s_assets`
--
ALTER TABLE `uoj7s_assets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=139;
--
-- AUTO_INCREMENT for table `uoj7s_banners`
--
ALTER TABLE `uoj7s_banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `uoj7s_banner_clients`
--
ALTER TABLE `uoj7s_banner_clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `uoj7s_categories`
--
ALTER TABLE `uoj7s_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `uoj7s_contact_details`
--
ALTER TABLE `uoj7s_contact_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `uoj7s_content`
--
ALTER TABLE `uoj7s_content`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `uoj7s_content_types`
--
ALTER TABLE `uoj7s_content_types`
  MODIFY `type_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10000;
--
-- AUTO_INCREMENT for table `uoj7s_extensions`
--
ALTER TABLE `uoj7s_extensions`
  MODIFY `extension_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10015;
--
-- AUTO_INCREMENT for table `uoj7s_fields`
--
ALTER TABLE `uoj7s_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `uoj7s_fields_groups`
--
ALTER TABLE `uoj7s_fields_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `uoj7s_finder_filters`
--
ALTER TABLE `uoj7s_finder_filters`
  MODIFY `filter_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `uoj7s_finder_links`
--
ALTER TABLE `uoj7s_finder_links`
  MODIFY `link_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `uoj7s_finder_taxonomy`
--
ALTER TABLE `uoj7s_finder_taxonomy`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `uoj7s_finder_terms`
--
ALTER TABLE `uoj7s_finder_terms`
  MODIFY `term_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `uoj7s_finder_types`
--
ALTER TABLE `uoj7s_finder_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `uoj7s_languages`
--
ALTER TABLE `uoj7s_languages`
  MODIFY `lang_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `uoj7s_menu`
--
ALTER TABLE `uoj7s_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;
--
-- AUTO_INCREMENT for table `uoj7s_menu_types`
--
ALTER TABLE `uoj7s_menu_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `uoj7s_messages`
--
ALTER TABLE `uoj7s_messages`
  MODIFY `message_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `uoj7s_modules`
--
ALTER TABLE `uoj7s_modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;
--
-- AUTO_INCREMENT for table `uoj7s_newsfeeds`
--
ALTER TABLE `uoj7s_newsfeeds`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `uoj7s_overrider`
--
ALTER TABLE `uoj7s_overrider`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';
--
-- AUTO_INCREMENT for table `uoj7s_postinstall_messages`
--
ALTER TABLE `uoj7s_postinstall_messages`
  MODIFY `postinstall_message_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `uoj7s_redirect_links`
--
ALTER TABLE `uoj7s_redirect_links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `uoj7s_sunfw_styles`
--
ALTER TABLE `uoj7s_sunfw_styles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `uoj7s_tags`
--
ALTER TABLE `uoj7s_tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `uoj7s_template_styles`
--
ALTER TABLE `uoj7s_template_styles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `uoj7s_ucm_content`
--
ALTER TABLE `uoj7s_ucm_content`
  MODIFY `core_content_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `uoj7s_ucm_history`
--
ALTER TABLE `uoj7s_ucm_history`
  MODIFY `version_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `uoj7s_updates`
--
ALTER TABLE `uoj7s_updates`
  MODIFY `update_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `uoj7s_update_sites`
--
ALTER TABLE `uoj7s_update_sites`
  MODIFY `update_site_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `uoj7s_usergroups`
--
ALTER TABLE `uoj7s_usergroups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `uoj7s_users`
--
ALTER TABLE `uoj7s_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=292;
--
-- AUTO_INCREMENT for table `uoj7s_user_keys`
--
ALTER TABLE `uoj7s_user_keys`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `uoj7s_user_notes`
--
ALTER TABLE `uoj7s_user_notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `uoj7s_viewlevels`
--
ALTER TABLE `uoj7s_viewlevels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `uoj7s_wf_profiles`
--
ALTER TABLE `uoj7s_wf_profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

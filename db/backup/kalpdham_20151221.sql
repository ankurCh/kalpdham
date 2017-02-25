-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 21, 2015 at 03:19 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `kalpdham`
--

-- --------------------------------------------------------

--
-- Table structure for table `kalp_exp_beneficiary`
--

CREATE TABLE IF NOT EXISTS `kalp_exp_beneficiary` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `beneficiary_name` varchar(1000) NOT NULL,
  `beneficiary_desc` varchar(4000) DEFAULT NULL,
  `beneficiary_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=39 ;

--
-- Dumping data for table `kalp_exp_beneficiary`
--

INSERT INTO `kalp_exp_beneficiary` (`id`, `beneficiary_name`, `beneficiary_desc`, `beneficiary_type`) VALUES
(1, 'weekly labour', 'labours deployed in field.', 'Group of Person'),
(2, 'Kamlesh', 'Kamlesh bricks suppier', 'Person'),
(3, 'Mehraaj bhaijaan', 'welding work tilli', 'Person'),
(4, 'sunil vishvkarma', 'welding work', 'Person'),
(5, 'Jeet enterprise', 'Kailash chourasia', 'Firm or company'),
(6, 'Mukesh plumber', 'plumbing, water supply, drainage etc.', 'Person'),
(7, 'Ravi ', 'gaddha , foundation work', 'Person'),
(8, 'akarshan tiles house', '', 'Firm or company'),
(9, 'anil', 'putty and painting contractor', 'Person'),
(10, 'security guards.', 'night and daytime security of colony and houses.', 'Person'),
(11, 'jagdeesh chourasia', 'jaggu salary, daily exp., advances etc.', 'Person'),
(12, 'Santosh Chourasia', 'salary, daily exp., advances etc.', 'Person'),
(13, 'Narendra Chourasia', 'Nandu salary, daily exp., advances etc.', 'Person'),
(14, 'Raju bhaiya', 'with material', 'Person'),
(15, 'SDM office', 'for diversion and other related', 'Govt department'),
(16, 'utility company', 'like electricity, water, telephone bills etc.', 'Govt department'),
(17, 'rakesh panday', '', 'Person'),
(18, 'misc or others or unknown', 'Its just a placeholder. Not specific. It can be anyone and can be used in any category or expense.', 'Person'),
(19, 'bhupendra', '', 'Person'),
(20, 'manoj sharma', '', 'Person'),
(21, 'Maheshwari sales', '', 'Firm or company'),
(22, 'Jain tiles', '', 'Firm or company'),
(23, 'rajeev agrawal', '', 'Firm or company'),
(24, 'jagdeesh loha', '', 'Person'),
(25, 'Vhibhoom hardware', '', 'Firm or company'),
(26, 'Ridit sales', 'Virendrs chacha and sons', 'Firm or company'),
(27, 'lachchu', '', 'Group of Person'),
(28, 'Bhanu rana', '', 'Firm or company'),
(29, 'jaipur marval', '', 'Firm or company'),
(30, 'Raamji plywood', '', 'Firm or company'),
(31, 'ratiraam', '', 'Person'),
(32, 'Famous tools', '', 'Firm or company'),
(33, 'Mukesh alumenium', '', 'Firm or company'),
(34, 'T&CP office', '', 'Group of Person'),
(35, 'Er. Sanjeev chourasia', 'Ashirvaad constructions', 'Firm or company'),
(36, 'ashok', '', 'Person'),
(37, 'shakuntala traders', 'ajju bhai', 'Firm or company'),
(38, 'sanj shakti iron trader', '', 'Firm or company');

-- --------------------------------------------------------

--
-- Table structure for table `kalp_exp_benef_subcat_map`
--

CREATE TABLE IF NOT EXISTS `kalp_exp_benef_subcat_map` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `beneficiary_id` int(10) unsigned NOT NULL,
  `subcategory_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_kalp_exp_beneficiary` (`beneficiary_id`,`subcategory_id`),
  KEY `kalp_exp_benef_subcat_map_fk2` (`subcategory_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=498 ;

--
-- Dumping data for table `kalp_exp_benef_subcat_map`
--

INSERT INTO `kalp_exp_benef_subcat_map` (`id`, `beneficiary_id`, `subcategory_id`) VALUES
(225, 1, 1),
(226, 1, 2),
(227, 1, 3),
(228, 1, 65),
(4, 2, 45),
(5, 3, 51),
(6, 4, 51),
(191, 5, 48),
(192, 5, 61),
(8, 6, 12),
(9, 7, 8),
(10, 8, 55),
(11, 9, 16),
(12, 10, 5),
(13, 11, 4),
(194, 12, 4),
(195, 12, 23),
(15, 13, 4),
(16, 14, 11),
(17, 15, 25),
(18, 15, 41),
(19, 16, 56),
(20, 17, 30),
(434, 18, 1),
(435, 18, 2),
(436, 18, 3),
(437, 18, 4),
(438, 18, 5),
(439, 18, 6),
(440, 18, 7),
(442, 18, 8),
(443, 18, 9),
(444, 18, 10),
(445, 18, 11),
(446, 18, 12),
(447, 18, 13),
(448, 18, 14),
(449, 18, 15),
(450, 18, 16),
(451, 18, 17),
(454, 18, 23),
(457, 18, 24),
(458, 18, 25),
(464, 18, 26),
(465, 18, 27),
(469, 18, 28),
(470, 18, 29),
(471, 18, 30),
(472, 18, 31),
(486, 18, 32),
(459, 18, 33),
(473, 18, 34),
(466, 18, 35),
(487, 18, 36),
(474, 18, 37),
(475, 18, 38),
(476, 18, 39),
(488, 18, 40),
(460, 18, 41),
(452, 18, 42),
(489, 18, 43),
(477, 18, 44),
(478, 18, 45),
(479, 18, 46),
(467, 18, 47),
(480, 18, 48),
(481, 18, 49),
(468, 18, 50),
(482, 18, 51),
(483, 18, 52),
(453, 18, 53),
(484, 18, 54),
(491, 18, 55),
(461, 18, 56),
(455, 18, 57),
(492, 18, 58),
(493, 18, 59),
(494, 18, 60),
(495, 18, 61),
(497, 18, 63),
(496, 18, 64),
(441, 18, 65),
(462, 18, 66),
(463, 18, 67),
(456, 18, 68),
(485, 18, 69),
(490, 18, 70),
(73, 19, 13),
(74, 20, 17),
(82, 21, 23),
(79, 21, 37),
(78, 21, 39),
(80, 21, 49),
(81, 21, 52),
(75, 21, 58),
(76, 21, 59),
(77, 21, 60),
(193, 22, 55),
(196, 23, 49),
(197, 24, 14),
(206, 25, 23),
(203, 25, 37),
(201, 25, 39),
(202, 25, 46),
(204, 25, 49),
(205, 25, 52),
(200, 25, 58),
(198, 25, 60),
(199, 25, 61),
(207, 26, 46),
(208, 27, 9),
(209, 28, 31),
(212, 29, 39),
(210, 29, 55),
(211, 29, 60),
(214, 30, 23),
(213, 30, 59),
(215, 31, 53),
(223, 32, 23),
(221, 32, 37),
(222, 32, 52),
(216, 32, 55),
(220, 32, 58),
(217, 32, 59),
(218, 32, 60),
(219, 32, 61),
(224, 33, 64),
(229, 34, 25),
(230, 34, 41),
(231, 34, 66),
(294, 35, 23),
(293, 35, 42),
(427, 36, 28),
(424, 36, 34),
(420, 36, 35),
(425, 36, 38),
(423, 36, 39),
(426, 36, 44),
(421, 36, 47),
(422, 36, 50),
(428, 36, 54),
(431, 37, 23),
(429, 37, 39),
(430, 37, 48),
(432, 38, 39),
(433, 38, 46);

-- --------------------------------------------------------

--
-- Table structure for table `kalp_exp_category`
--

CREATE TABLE IF NOT EXISTS `kalp_exp_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(1000) NOT NULL,
  `category_desc` varchar(4000) DEFAULT NULL,
  `color_name` varchar(100) DEFAULT NULL,
  `color_code` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `kalp_exp_category`
--

INSERT INTO `kalp_exp_category` (`id`, `category_name`, `category_desc`, `color_name`, `color_code`) VALUES
(1, 'labour - internal', NULL, 'red', '#ff0000'),
(2, 'labour - contractors', NULL, 'green', '#00ff00'),
(3, 'others', NULL, NULL, '#ffff00'),
(4, 'Govt', 'Govt', NULL, '#ff00ff'),
(5, 'Loan and interest', 'expenses on all type of loan -- secured or unsecured.', NULL, '#fff44f'),
(6, 'Equipments', 'Purchase and maintenance of construction related equipments. ', NULL, '#00ffff'),
(7, 'Material -- Structure', 'Material used in structure construction like sand, bricks etc.', 'blue', '#0000ff'),
(8, 'Land related.', 'Expenses done in order to purchase, lease, rent, use permission, registry, agreement etc.', NULL, '#7700ff'),
(9, 'labour -- others', '', NULL, '#ff77ff'),
(10, 'Office and stationery ', 'office, stationery item, photo copy, printouts etc.', NULL, '#0068ff'),
(11, 'Material -- Finishing', 'things like tiles, putty, paint, doors etc.', NULL, '#d6d6c2'),
(12, 'advertising and marketing', 'expenses on advertising, marketing, branding, promotion etc.', NULL, '#400000');

-- --------------------------------------------------------

--
-- Table structure for table `kalp_exp_category_stats`
--

CREATE TABLE IF NOT EXISTS `kalp_exp_category_stats` (
  `category_id` int(10) unsigned NOT NULL,
  `category_name` varchar(1000) NOT NULL,
  `category_usage` bigint(20) unsigned DEFAULT NULL,
  `last_use_date` datetime DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kalp_exp_category_stats`
--

INSERT INTO `kalp_exp_category_stats` (`category_id`, `category_name`, `category_usage`, `last_use_date`) VALUES
(1, 'labour - internal', 112, '2015-12-21 00:00:00'),
(2, 'labour - contractors', 81, '2015-12-21 00:00:00'),
(3, 'others', 47, '2015-12-21 00:00:00'),
(4, 'Govt', 79, '2015-12-21 00:00:00'),
(5, 'Loan and interest', 2, '2015-11-26 00:00:00'),
(6, 'Equipments', 47, '2015-12-21 00:00:00'),
(7, 'Material -- Structure', 159, '2015-12-21 00:00:00'),
(8, 'Land related.', 3, '2015-11-26 00:00:00'),
(9, 'labour -- others', 1, '2015-11-26 00:00:00'),
(10, 'Office and stationery ', 6, '2015-12-21 00:00:00'),
(11, 'Material -- Finishing', 14, '2015-12-16 00:00:00'),
(12, 'advertising and marketing', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kalp_exp_subcategory`
--

CREATE TABLE IF NOT EXISTS `kalp_exp_subcategory` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `subcategory_name` varchar(1000) NOT NULL,
  `subcategory_desc` varchar(4000) DEFAULT NULL,
  `color_name` varchar(100) DEFAULT NULL,
  `color_code` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kalp_exp_subcategory_fk1` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=71 ;

--
-- Dumping data for table `kalp_exp_subcategory`
--

INSERT INTO `kalp_exp_subcategory` (`id`, `category_id`, `subcategory_name`, `subcategory_desc`, `color_name`, `color_code`) VALUES
(1, 1, 'only labours', NULL, NULL, NULL),
(2, 1, 'only mistri', NULL, NULL, NULL),
(3, 1, 'labour and mistri', NULL, NULL, NULL),
(4, 1, 'field supervisor', NULL, NULL, NULL),
(5, 1, 'security guard', NULL, NULL, NULL),
(6, 1, 'office employee', NULL, NULL, NULL),
(7, 1, 'firm partners', NULL, NULL, NULL),
(8, 2, 'fundation', NULL, NULL, NULL),
(9, 2, 'structure', NULL, NULL, NULL),
(10, 2, 'plaster', NULL, NULL, NULL),
(11, 2, 'electricity', NULL, NULL, NULL),
(12, 2, 'plumbing', NULL, NULL, NULL),
(13, 2, 'senting', NULL, NULL, NULL),
(14, 2, 'loha bandhai', NULL, NULL, NULL),
(15, 2, 'slab dhalai', NULL, NULL, NULL),
(16, 2, 'putty paints', NULL, NULL, NULL),
(17, 2, 'tiles stone work', NULL, NULL, NULL),
(23, 3, 'others', NULL, NULL, NULL),
(24, 4, 'Pollution and Environment related', 'Pollution and Environment related fees.', NULL, NULL),
(25, 4, 'Others', 'Misc govt expenses.', NULL, NULL),
(26, 5, 'Bank loan -- mortgage', 'Secured loan related expenses. This will include processing and other fees, interest, principle payment etc.', NULL, NULL),
(27, 6, 'Gardening and digging equipments', 'Things like grass cutter, hatch cutter, fawda, khurpi etc.', NULL, NULL),
(28, 7, 'Dust', 'Its unit will be trally or dumphar.', NULL, NULL),
(29, 7, 'Sand -- Natural Black', '', NULL, NULL),
(30, 7, 'Sand -- Natural Red', '', NULL, NULL),
(31, 7, 'Sand -- Artificial Black', '', NULL, NULL),
(32, 8, 'Land agreement.', 'expenses to arrange an agreement for Land b/w two or more parties. This agreement can be converted into purchase or registry of land later.', NULL, NULL),
(33, 4, 'Stamp duty', 'Stamp duty and related expenses. Govt is beneficiary. ', NULL, NULL),
(34, 7, 'Murum -- Dumphar', '', NULL, NULL),
(35, 6, 'JCB -- rented', 'JCB work on rent. Hourly charged.', NULL, NULL),
(36, 8, 'Land purchase. ', 'expenses while buying land.', NULL, NULL),
(37, 7, 'Drainage material', 'Things like pipes etc.', NULL, NULL),
(38, 7, 'Fata -- trally', '', NULL, NULL),
(39, 7, 'misc', 'misc or other non specific material.', NULL, NULL),
(40, 9, 'others', 'misc or other non specific labour charges.', NULL, NULL),
(41, 4, 'application fees and challan', 'Application fees, challan, duty, consent fees etc.', NULL, NULL),
(42, 2, 'map and planning', 'Fees given to engineers, architects for map and planning.', NULL, NULL),
(43, 10, 'office and stationery main', 'office and stationery main', NULL, NULL),
(44, 7, 'Gitty -- aadha pona', '', NULL, NULL),
(45, 7, 'Bricks -- gitta', '', NULL, NULL),
(46, 7, 'iron', '', NULL, NULL),
(47, 6, 'misc and others', 'misc small items', NULL, NULL),
(48, 7, 'Cement', '', NULL, NULL),
(49, 7, 'wood', 'wood used in structure for chocket etc.', NULL, NULL),
(50, 6, 'Trackter -- Rented', '', NULL, NULL),
(51, 7, 'iron -- welding', 'things like grill, main gate, window frame etc.', NULL, NULL),
(52, 7, 'PVC, UPVC, CPVC', 'material for water supply.', NULL, NULL),
(53, 2, 'carpenter', '', NULL, NULL),
(54, 7, 'stone', 'stone used in structure, not including tiles etc.', NULL, NULL),
(55, 11, 'Tiles', 'tiles used in floor, kitchen, bathroom, front elevation, stairs etc.', NULL, NULL),
(56, 4, 'utility bills', 'electricity, water etc. bills', NULL, NULL),
(57, 3, 'Gardening and beautification', 'trees, plants, landscaping etc. ', NULL, NULL),
(58, 11, 'Bath fitting', '', NULL, NULL),
(59, 11, 'wood and related', 'doors, ply, sunmica etc.', NULL, NULL),
(60, 11, 'paint and putty', 'wall putty, external and internal paint', NULL, NULL),
(61, 11, 'water tank', '500, 1000 lt water tank for water storage.', NULL, NULL),
(63, 12, 'advertising expenses', '', NULL, '#408080'),
(64, 11, 'windows and aluminium work.', '', NULL, '#ffff00'),
(65, 1, 'misc', '', NULL, '#ffaaff'),
(66, 4, 'T&CP', 'all expenses related to T&CP', NULL, '#00ff80'),
(67, 4, 'offices', 'patwari, tehseeldaar, RI, collector office etc.', NULL, '#8000ff'),
(68, 3, 'boring', 'boring machine, pipes, water machine and labour', NULL, '#ff8000'),
(69, 7, 'electric material', 'cables, wire etc.', NULL, '#2dbbff'),
(70, 10, 'duplicate copy, photocopy etc.', 'copy of maps, documents, khasra, agreements, registry etc.', NULL, '#ba7474');

-- --------------------------------------------------------

--
-- Table structure for table `kalp_exp_subcategory_stats`
--

CREATE TABLE IF NOT EXISTS `kalp_exp_subcategory_stats` (
  `subcategory_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `subcategory_name` varchar(1000) NOT NULL,
  `subcategory_usage` bigint(20) unsigned DEFAULT NULL,
  `last_use_date` datetime DEFAULT NULL,
  PRIMARY KEY (`subcategory_id`),
  KEY `kalp_exp_subcategory_stats_fk1` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kalp_exp_subcategory_stats`
--

INSERT INTO `kalp_exp_subcategory_stats` (`subcategory_id`, `category_id`, `subcategory_name`, `subcategory_usage`, `last_use_date`) VALUES
(1, 1, 'only labours', 9, '2015-12-16 00:00:00'),
(2, 1, 'only mistri', 0, NULL),
(3, 1, 'labour and mistri', 55, '2015-12-21 00:00:00'),
(4, 1, 'field supervisor', 29, '2015-12-21 00:00:00'),
(5, 1, 'security guard', 13, '2015-12-19 00:00:00'),
(6, 1, 'office employee', 0, NULL),
(7, 1, 'firm partners', 1, '2015-11-22 00:00:00'),
(8, 2, 'fundation', 10, '2015-12-16 00:00:00'),
(9, 2, 'structure', 7, '2015-12-16 00:00:00'),
(10, 2, 'plaster', 1, '2015-11-22 00:00:00'),
(11, 2, 'electricity', 7, '2015-12-15 00:00:00'),
(12, 2, 'plumbing', 7, '2015-12-19 00:00:00'),
(13, 2, 'senting', 12, '2015-12-19 00:00:00'),
(14, 2, 'loha bandhai', 18, '2015-12-21 00:00:00'),
(15, 2, 'slab dhalai', 4, '2015-12-05 00:00:00'),
(16, 2, 'putty paints', 3, '2015-12-15 00:00:00'),
(17, 2, 'tiles stone work', 8, '2015-12-15 00:00:00'),
(23, 3, 'others', 36, '2015-12-21 00:00:00'),
(24, 4, 'Pollution and Environment related', 0, NULL),
(25, 4, 'Others', 53, '2015-12-21 00:00:00'),
(26, 5, 'Bank loan -- mortgage', 2, '2015-11-26 00:00:00'),
(27, 6, 'Gardening and digging equipments', 2, '2015-11-27 00:00:00'),
(28, 7, 'Dust', 0, NULL),
(29, 7, 'Sand -- Natural Black', 0, NULL),
(30, 7, 'Sand -- Natural Red', 26, '2015-12-21 00:00:00'),
(31, 7, 'Sand -- Artificial Black', 3, '2015-12-16 00:00:00'),
(32, 8, 'Land agreement.', 2, '2015-11-26 00:00:00'),
(33, 4, 'Stamp duty', 6, '2015-12-19 00:00:00'),
(34, 7, 'Murum -- Dumphar', 5, '2015-12-19 00:00:00'),
(35, 6, 'JCB -- rented', 24, '2015-12-21 00:00:00'),
(36, 8, 'Land purchase. ', 1, '2015-11-26 00:00:00'),
(37, 7, 'Drainage material', 3, '2015-12-05 00:00:00'),
(38, 7, 'Fata -- trally', 2, '2015-12-16 00:00:00'),
(39, 7, 'misc', 21, '2015-12-19 00:00:00'),
(40, 9, 'others', 1, '2015-11-26 00:00:00'),
(41, 4, 'application fees and challan', 13, '2015-12-19 00:00:00'),
(42, 2, 'map and planning', 7, '2015-12-16 00:00:00'),
(43, 10, 'office and stationery main', 5, '2015-12-19 00:00:00'),
(44, 7, 'Gitty -- aadha pona', 11, '2015-12-21 00:00:00'),
(45, 7, 'Bricks -- gitta', 30, '2015-12-19 00:00:00'),
(46, 7, 'iron', 18, '2015-12-19 00:00:00'),
(47, 6, 'misc and others', 9, '2015-12-19 00:00:00'),
(48, 7, 'Cement', 15, '2015-12-19 00:00:00'),
(49, 7, 'wood', 7, '2015-12-19 00:00:00'),
(50, 6, 'Trackter -- Rented', 12, '2015-12-19 00:00:00'),
(51, 7, 'iron -- welding', 14, '2015-12-18 00:00:00'),
(52, 7, 'PVC, UPVC, CPVC', 3, '2015-12-16 00:00:00'),
(53, 2, 'carpenter', 2, '2015-12-15 00:00:00'),
(54, 7, 'stone', 0, NULL),
(55, 11, 'Tiles', 7, '2015-12-16 00:00:00'),
(56, 4, 'utility bills', 5, '2015-12-15 00:00:00'),
(57, 3, 'Gardening and beautification', 1, '2015-12-13 00:00:00'),
(58, 11, 'Bath fitting', 0, NULL),
(59, 11, 'wood and related', 3, '2015-12-15 00:00:00'),
(60, 11, 'paint and putty', 1, '2015-12-14 00:00:00'),
(61, 11, 'water tank', 1, '2015-12-14 00:00:00'),
(63, 12, 'advertising expenses', 0, NULL),
(64, 11, 'windows and aluminium work.', 2, '2015-12-16 00:00:00'),
(65, 1, 'misc', 6, '2015-12-19 00:00:00'),
(66, 4, 'T&CP', 1, '2015-12-16 00:00:00'),
(67, 4, 'offices', 2, '2015-12-16 00:00:00'),
(68, 3, 'boring', 2, '2015-12-16 00:00:00'),
(69, 7, 'electric material', 1, '2015-12-16 00:00:00'),
(70, 10, 'duplicate copy, photocopy etc.', 1, '2015-12-21 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `kalp_kb_file`
--

CREATE TABLE IF NOT EXISTS `kalp_kb_file` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `file_name` varchar(1000) NOT NULL,
  `when_created` datetime DEFAULT NULL,
  `is_folder` tinyint(4) DEFAULT NULL,
  `content_type` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kalp_kb_file_fk1` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `kalp_kb_file`
--

INSERT INTO `kalp_kb_file` (`id`, `parent_id`, `file_name`, `when_created`, `is_folder`, `content_type`) VALUES
(1, NULL, 'kalp kb', '2015-12-18 18:50:41', 1, 'LINK'),
(2, 1, 'personal', '2015-12-18 18:56:44', 1, 'LINK'),
(3, 1, 'business', '2015-12-18 18:57:07', 1, 'LINK'),
(4, 1, 'common', '2015-12-18 18:57:07', 1, 'LINK'),
(5, 2, 'ankur', '2015-12-18 19:09:03', 1, 'LINK'),
(6, 5, 'education', '2015-12-18 19:11:29', 1, 'LINK'),
(7, 5, 'finance', '2015-12-18 19:11:29', 1, 'LINK'),
(8, 5, 'health', '2015-12-18 19:11:29', 1, 'LINK');

-- --------------------------------------------------------

--
-- Table structure for table `kalp_kb_file_child`
--

CREATE TABLE IF NOT EXISTS `kalp_kb_file_child` (
  `file_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `child_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`file_id`,`child_id`),
  KEY `kalp_kb_file_child_fk2` (`child_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kalp_kb_file_child`
--

INSERT INTO `kalp_kb_file_child` (`file_id`, `child_id`) VALUES
(1, 2),
(1, 3),
(1, 4),
(2, 5),
(5, 6),
(5, 7),
(5, 8);

-- --------------------------------------------------------

--
-- Table structure for table `kalp_kb_file_content`
--

CREATE TABLE IF NOT EXISTS `kalp_kb_file_content` (
  `file_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `content_desc` text,
  `content_blob` blob,
  `content_text` text,
  `content_keywords` text,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kalp_kb_linked_files`
--

CREATE TABLE IF NOT EXISTS `kalp_kb_linked_files` (
  `file_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `linked_file_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`file_id`,`linked_file_id`),
  KEY `kalp_kb_linked_files_fk2` (`linked_file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kalp_projects`
--

CREATE TABLE IF NOT EXISTS `kalp_projects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_name` varchar(100) NOT NULL,
  `project_url` varchar(1000) DEFAULT NULL,
  `project_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `kalp_projects`
--

INSERT INTO `kalp_projects` (`id`, `project_name`, `project_url`, `project_type`) VALUES
(1, 'Girdhari Puram', NULL, 'colony'),
(2, 'Desai Residency', NULL, 'colony'),
(3, 'Parijaat', NULL, 'colony'),
(5, 'Other', NULL, NULL),
(6, 'Kalpdham', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `kalp_project_exp_details`
--

CREATE TABLE IF NOT EXISTS `kalp_project_exp_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `when_created` datetime DEFAULT NULL,
  `project_id` int(10) unsigned NOT NULL,
  `subproject_id` int(10) unsigned NOT NULL,
  `expense_date` datetime DEFAULT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `subcategory_id` int(10) unsigned NOT NULL,
  `amount` bigint(20) unsigned DEFAULT NULL,
  `remark` varchar(4000) DEFAULT NULL,
  `per_unit_cost` int(11) DEFAULT NULL,
  `beneficiary_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kalp_project_exp_details_fk1` (`project_id`),
  KEY `kalp_project_exp_details_fk2` (`subproject_id`),
  KEY `kalp_project_exp_details_fk3` (`category_id`),
  KEY `kalp_project_exp_details_fk4` (`subcategory_id`),
  KEY `kalp_project_exp_details_fk5` (`beneficiary_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=548 ;

--
-- Dumping data for table `kalp_project_exp_details`
--

INSERT INTO `kalp_project_exp_details` (`id`, `when_created`, `project_id`, `subproject_id`, `expense_date`, `category_id`, `subcategory_id`, `amount`, `remark`, `per_unit_cost`, `beneficiary_id`) VALUES
(1, '0000-00-00 00:00:00', 5, 5, '0000-00-00 00:00:00', 3, 23, 1, 'testing123', 1, NULL),
(2, '2015-11-22 00:00:00', 5, 5, '2015-11-22 00:00:00', 3, 23, 2, 'testing123', 2, NULL),
(3, '2015-11-22 00:00:00', 5, 5, '2015-11-07 00:00:00', 3, 23, 3, 'test3', 3, NULL),
(4, '2015-11-22 00:00:00', 5, 5, '2015-11-08 00:00:00', 3, 23, 4, 'testing4', 4, NULL),
(5, '2015-11-22 00:00:00', 5, 5, '2015-11-22 00:00:00', 3, 11, 5, '5', 5, NULL),
(6, '2015-11-22 00:00:00', 5, 5, '2015-11-22 00:00:00', 3, 11, 6, '6', 6, NULL),
(7, '2015-11-22 00:00:00', 5, 5, '2015-11-22 00:00:00', 3, 10, 7, '7', 7, NULL),
(8, '2015-11-22 00:00:00', 5, 5, '2015-11-22 00:00:00', 3, 12, 8, '8', 8, NULL),
(9, '2015-11-22 00:00:00', 5, 5, '2015-11-22 00:00:00', 3, 17, 9, '9', 9, NULL),
(10, '2015-11-22 00:00:00', 5, 5, '2015-11-22 00:00:00', 3, 7, 10, '10', 10, NULL),
(11, '2015-11-24 00:00:00', 2, 6, '2014-07-01 00:00:00', 4, 25, 50000, 'T&CP expenses in the month of July Aug 2014', 1, NULL),
(12, '2015-11-25 00:00:00', 1, 1, '2014-09-07 00:00:00', 6, 27, 4500, 'Gardening equipments.', -1, NULL),
(13, '2015-11-26 00:00:00', 2, 6, '2015-08-02 00:00:00', 4, 25, 55000, 'Patwari naksha batank', -1, NULL),
(14, '2015-11-26 00:00:00', 2, 6, '2015-09-18 00:00:00', 4, 25, 50000, 'T&CP for old work done in 2014', -1, NULL),
(15, '2015-11-26 00:00:00', 2, 6, '2015-09-26 00:00:00', 5, 26, 428000, 'KCC settlement. Amount as well as date is not confirm.', -1, NULL),
(16, '2015-11-26 00:00:00', 2, 2, '2015-07-31 00:00:00', 8, 32, 1600000, 'Given to Purshottam patel and brothers. For road development.', -1, NULL),
(17, '2015-11-26 00:00:00', 2, 2, '2015-07-31 00:00:00', 4, 33, 3000, 'Stamps for agreement with Patel brothers.', -1, NULL),
(18, '2015-11-26 00:00:00', 2, 2, '2015-08-05 00:00:00', 7, 34, 18000, '9 dumphar murum for entry road foundation.', 2000, NULL),
(19, '2015-11-26 00:00:00', 2, 2, '2015-08-06 00:00:00', 1, 1, 1400, 'for 5 and 6 august', 200, NULL),
(20, '2015-11-26 00:00:00', 2, 2, '2015-08-08 00:00:00', 6, 35, 5000, 'Patkar JCB 5 hour', 1000, NULL),
(21, '2015-11-26 00:00:00', 2, 2, '2015-08-06 00:00:00', 8, 36, 470000, 'Road side plot registry of rajkumar patel. 390 sq feet', 1200, NULL),
(22, '2015-11-26 00:00:00', 2, 2, '2015-08-10 00:00:00', 7, 37, 11000, 'NP4 pipes. six pipes. Total bill is 51000', 8500, NULL),
(23, '2015-11-26 00:00:00', 2, 2, '2015-08-12 00:00:00', 7, 34, 76000, '38 dumphar murum', 2000, NULL),
(24, '2015-11-26 00:00:00', 2, 2, '2015-08-20 00:00:00', 7, 34, 20000, 'Ashok murum + fata', 2000, NULL),
(25, '2015-11-26 00:00:00', 2, 2, '2015-08-20 00:00:00', 7, 38, 3500, 'Ashok murum + fata', 700, NULL),
(26, '2015-11-26 00:00:00', 2, 2, '2015-08-22 00:00:00', 1, 1, 600, '', 200, NULL),
(27, '2015-11-26 00:00:00', 2, 2, '2015-09-03 00:00:00', 6, 35, 5000, 'JCB richariya', 1000, NULL),
(28, '2015-11-26 00:00:00', 2, 2, '2015-09-03 00:00:00', 4, 33, 41000, 'Duty on 390 sq feet road side rajkumar patel plot registry.', -1, NULL),
(29, '2015-11-26 00:00:00', 2, 2, '2015-08-11 00:00:00', 7, 37, 40000, '6 pipes', 8500, NULL),
(30, '2015-11-26 00:00:00', 2, 2, '2015-09-12 00:00:00', 7, 34, 90000, 'Ashok murum + fata', -1, NULL),
(31, '2015-11-26 00:00:00', 2, 2, '2015-09-18 00:00:00', 6, 35, 14000, 'Ashok JCB', 900, NULL),
(32, '2015-11-26 00:00:00', 2, 2, '2015-09-18 00:00:00', 3, 25, 200, 'Patwari map', -1, NULL),
(33, '2015-11-26 00:00:00', 2, 2, '2015-09-30 00:00:00', 8, 32, 975000, 'Dhaniram chacha 27x30 sq feet plot for entry road.', 1200, NULL),
(34, '2015-11-26 00:00:00', 2, 2, '2015-09-30 00:00:00', 1, 4, 7500, 'Nandu/Jaggu monthly alary', 7500, NULL),
(35, '2015-11-26 00:00:00', 2, 2, '2015-10-04 00:00:00', 1, 3, 600, 'Road side fensing', -1, NULL),
(36, '2015-11-26 00:00:00', 2, 2, '2015-10-04 00:00:00', 7, 39, 1500, 'Road side fencing material.', -1, NULL),
(37, '2015-11-26 00:00:00', 2, 2, '2015-10-11 00:00:00', 1, 1, 800, '', -1, NULL),
(38, '2015-11-26 00:00:00', 2, 2, '2015-10-15 00:00:00', 9, 40, 350, 'flex installation.', -1, NULL),
(39, '2015-11-26 00:00:00', 2, 2, '2015-10-16 00:00:00', 7, 39, 4700, 'Ashok murum 2 dumphar + fata 1 trally', -1, NULL),
(40, '2015-11-26 00:00:00', 2, 2, '2015-10-28 00:00:00', 7, 39, 1400, 'entry gate flex', -1, NULL),
(41, '2015-11-26 00:00:00', 2, 2, '2015-10-28 00:00:00', 6, 35, 1700, 'Date not confirmed.', 900, NULL),
(42, '2015-11-26 00:00:00', 2, 2, '2015-07-27 00:00:00', 4, 25, 6000, 'patwari seemankan', -1, NULL),
(43, '2015-11-27 00:00:00', 2, 1, '2015-09-15 00:00:00', 6, 27, 1414, 'kulhadi, flower cutter', -1, NULL),
(44, '2015-11-27 00:00:00', 2, 1, '2015-09-18 00:00:00', 1, 1, 4800, 'Labour provided by Desai. Field cleaning.', 200, NULL),
(45, '2015-11-27 00:00:00', 2, 1, '2015-09-20 00:00:00', 1, 1, 5800, 'Labour provided by US. Field cleaning.', 200, NULL),
(46, '2015-11-27 00:00:00', 2, 1, '2015-09-26 00:00:00', 1, 1, 1000, '', 200, NULL),
(47, '2015-11-27 00:00:00', 2, 1, '2015-10-01 00:00:00', 1, 4, 7000, 'Nandu salary', 7000, NULL),
(48, '2015-11-27 00:00:00', 2, 1, '2015-10-01 00:00:00', 4, 33, 1169000, 'Desai residency agreement stamp duty and receipts.', -1, NULL),
(49, '2015-11-27 00:00:00', 2, 1, '2015-10-01 00:00:00', 4, 25, 20000, 'Gupta medam and nigam fee', -1, NULL),
(50, '2015-11-27 00:00:00', 2, 1, '2015-10-03 00:00:00', 4, 41, 50000, 'T&CP challan. 25000 per hectare. ', 25000, NULL),
(51, '2015-11-27 00:00:00', 2, 1, '2015-10-08 00:00:00', 2, 42, 10000, 'Adv. fee of Er. Sanjeev Chourasia for map.', 35000, NULL),
(52, '2015-11-27 00:00:00', 2, 1, '2015-10-08 00:00:00', 4, 25, 405000, 'T&CP map approval.', -1, NULL),
(53, '2015-11-27 00:00:00', 2, 1, '2015-10-08 00:00:00', 10, 43, 2000, 'map photocopy and misc.', -1, NULL),
(54, '2015-11-27 00:00:00', 2, 1, '2015-10-19 00:00:00', 4, 25, 5000, 'Patwari NOC for diversion', -1, NULL),
(55, '2015-11-27 00:00:00', 2, 1, '2015-10-19 00:00:00', 10, 43, 2000, 'Copy of B1, naksha, khasra etc.', -1, NULL),
(56, '2015-11-27 00:00:00', 2, 1, '2015-10-19 00:00:00', 1, 1, 2255, 'installation of gate at entry road.', -1, NULL),
(57, '2015-11-27 00:00:00', 2, 1, '2015-10-19 00:00:00', 7, 39, 3500, 'material (cement, sand, gitty etc.) for installation of gate at entry road.', -1, NULL),
(58, '2015-11-27 00:00:00', 2, 1, '2015-09-10 00:00:00', 2, 42, 25000, 'Er. sanjeev chourasia for map prepration.', 35000, NULL),
(59, '2015-11-27 00:00:00', 2, 1, '2015-09-10 00:00:00', 4, 41, 10000, 'T&CP application fee for colony approval.', 10000, NULL),
(60, '2015-11-27 00:00:00', 2, 1, '2015-09-10 00:00:00', 4, 25, 1000, 'Deshraaj patel patwari', -1, NULL),
(61, '2015-11-27 00:00:00', 2, 1, '2015-09-10 00:00:00', 4, 25, 200, 'Patwari naksha, B1', -1, NULL),
(62, '2015-11-27 00:00:00', 2, 1, '2015-09-30 00:00:00', 2, 42, 6000, 'Ad. sanjeev jain for agreement draft. Date is not confirm', -1, NULL),
(63, '2015-11-27 00:00:00', 2, 1, '2015-09-05 00:00:00', 2, 42, 7000, 'Jyoti Gupta for kalpdhaam partnership deed', -1, NULL),
(64, '2015-11-27 00:00:00', 2, 1, '2015-11-06 00:00:00', 4, 25, 20000, 'Patwari, RI diversion visit', -1, NULL),
(65, '2015-11-27 00:00:00', 2, 1, '2015-11-06 00:00:00', 1, 4, 7000, 'jaggu oct 2015 salary', 7000, NULL),
(66, '2015-11-27 00:00:00', 2, 1, '2015-11-17 00:00:00', 4, 41, 414730, 'Diversion challan', -1, NULL),
(67, '2015-11-27 00:00:00', 2, 1, '2015-11-17 00:00:00', 4, 25, 225000, 'SDM office', -1, NULL),
(68, '2015-12-04 00:00:00', 1, 3, '2014-09-05 00:00:00', 7, 30, 4000, '1 trally', 4000, NULL),
(69, '2015-12-04 00:00:00', 1, 3, '2014-10-01 00:00:00', 7, 44, 6000, '1 dumphar from ashok', 6000, NULL),
(70, '2015-12-04 00:00:00', 1, 3, '2014-10-03 00:00:00', 7, 39, 300, 'lime stone 25KG', 12, NULL),
(71, '2015-12-04 00:00:00', 1, 3, '2014-10-03 00:00:00', 7, 45, 5600, 'raaju bhatnagar 1 trally', 5600, NULL),
(72, '2015-12-04 00:00:00', 1, 3, '2014-10-05 00:00:00', 7, 45, 5600, '1 trally raju bhatnagar', 5600, NULL),
(73, '2015-12-04 00:00:00', 1, 3, '2014-10-10 00:00:00', 7, 30, 24625, '1 truck', -1, NULL),
(74, '2015-12-04 00:00:00', 1, 3, '2014-10-17 00:00:00', 7, 46, 55604, '-1', -1, NULL),
(75, '2015-12-04 00:00:00', 1, 3, '2014-10-19 00:00:00', 2, 8, 15000, 'babu gaddha -- 43 holes', 350, NULL),
(76, '2015-12-04 00:00:00', 1, 3, '2014-10-19 00:00:00', 1, 3, 1990, '2 days', -1, NULL),
(77, '2015-12-04 00:00:00', 1, 3, '2014-10-19 00:00:00', 7, 30, 39000, '980 cubic ft', 39, NULL),
(78, '2015-12-04 00:00:00', 1, 3, '2014-10-19 00:00:00', 2, 14, 2000, 'jagdeesh', 4, NULL),
(79, '2015-12-04 00:00:00', 1, 3, '2014-10-29 00:00:00', 7, 39, 2000, 'chaddar 10', 200, NULL),
(80, '2015-12-04 00:00:00', 1, 3, '2014-10-31 00:00:00', 1, 3, 12680, '12 to 31 oct', -1, NULL),
(81, '2015-12-04 00:00:00', 1, 3, '2014-10-31 00:00:00', 2, 14, 3000, 'jagdeesh', 4, NULL),
(82, '2015-12-05 00:00:00', 1, 3, '2014-11-03 00:00:00', 7, 39, 10000, 'lakdi patiya', -1, NULL),
(83, '2015-12-05 00:00:00', 1, 3, '2014-11-03 00:00:00', 1, 4, 6500, 'Jaggu oct salary', 6500, NULL),
(84, '2015-12-05 00:00:00', 1, 3, '2014-11-03 00:00:00', 1, 5, 2000, 'parmanand salary', 2000, NULL),
(85, '2015-12-05 00:00:00', 1, 3, '2014-11-03 00:00:00', 7, 46, 42339, 'date is not confirm. payment out of 98000', -1, NULL),
(86, '2015-12-05 00:00:00', 1, 3, '2014-11-08 00:00:00', 7, 45, 5600, 'raju', 5600, NULL),
(87, '2015-12-05 00:00:00', 1, 3, '2014-11-09 00:00:00', 7, 45, 5600, 'raaju bhatnagar 1 trally', 5600, NULL),
(88, '2015-12-05 00:00:00', 1, 3, '2014-11-09 00:00:00', 1, 3, 18525, 'b/w 1 to 9 Nov.', -1, NULL),
(89, '2015-12-05 00:00:00', 1, 3, '2014-11-11 00:00:00', 7, 45, 5600, 'raaju bhatnagar 1 trally', 5600, NULL),
(90, '2015-12-05 00:00:00', 1, 3, '2014-11-13 00:00:00', 7, 45, 5600, 'raaju bhatnagar 1 trally', 5600, NULL),
(91, '2015-12-05 00:00:00', 1, 3, '2014-11-21 00:00:00', 1, 3, 36680, 'b/w 10 to 21 Nov', -1, NULL),
(92, '2015-12-05 00:00:00', 1, 3, '2014-11-21 00:00:00', 2, 14, 500, 'jagdeesh', -1, NULL),
(93, '2015-12-05 00:00:00', 1, 3, '2014-12-07 00:00:00', 6, 47, 150, 'hand trally', -1, NULL),
(94, '2015-12-05 00:00:00', 1, 3, '2014-12-08 00:00:00', 7, 45, 5600, 'raaju bhatnagar 1 trally', 5600, NULL),
(95, '2015-12-05 00:00:00', 1, 3, '2014-12-03 00:00:00', 1, 3, 19500, 'b/w 22.11 to 3.12', -1, NULL),
(96, '2015-12-05 00:00:00', 1, 3, '2014-12-03 00:00:00', 2, 14, 500, 'jagdeesh', -1, NULL),
(97, '2015-12-05 00:00:00', 1, 3, '2014-12-08 00:00:00', 7, 46, 34304, 'sanj shakti iron', -1, NULL),
(99, '2015-12-05 00:00:00', 1, 3, '2014-12-12 00:00:00', 1, 3, 18280, 'b/w 6.12 to 12.12', -1, NULL),
(100, '2015-12-05 00:00:00', 1, 3, '2014-12-12 00:00:00', 2, 14, 500, 'jagdeesh', -1, NULL),
(101, '2015-12-05 00:00:00', 1, 3, '2014-12-13 00:00:00', 7, 48, 46400, 'kailash chacha total bill was 75000', -1, NULL),
(102, '2015-12-05 00:00:00', 1, 3, '2014-12-13 00:00:00', 7, 49, 26300, 'chokat made by ratiraam + labour', -1, NULL),
(103, '2015-12-05 00:00:00', 1, 3, '2014-12-19 00:00:00', 7, 39, 1700, 'hole pass, nut bolt etc.', -1, NULL),
(104, '2015-12-05 00:00:00', 1, 3, '2014-12-20 00:00:00', 1, 3, 17275, '13 to 20 dec 14', -1, NULL),
(105, '2015-12-05 00:00:00', 1, 3, '2014-12-26 00:00:00', 7, 30, 15500, '1 dumphar', -1, NULL),
(106, '2015-12-05 00:00:00', 1, 3, '2014-12-26 00:00:00', 7, 30, 20500, 'one truck', -1, NULL),
(107, '2015-12-05 00:00:00', 1, 3, '2014-12-28 00:00:00', 1, 3, 12650, '21 to 28 dec', -1, NULL),
(108, '2015-12-05 00:00:00', 1, 3, '2014-12-28 00:00:00', 6, 47, 100, 'excel', -1, NULL),
(109, '2015-12-05 00:00:00', 1, 3, '2014-12-28 00:00:00', 6, 50, 3000, 'khilan', -1, NULL),
(110, '2015-12-05 00:00:00', 1, 3, '2015-01-05 00:00:00', 7, 45, 39200, 'kamlesh 7 trally', 5600, NULL),
(111, '2015-12-05 00:00:00', 1, 3, '2015-01-07 00:00:00', 3, 23, 17400, 'Nirbhay -- what is this?', -1, NULL),
(112, '2015-12-05 00:00:00', 1, 3, '2015-01-07 00:00:00', 7, 46, 64000, 'sanj shakti iron', -1, NULL),
(113, '2015-12-05 00:00:00', 1, 3, '2015-01-07 00:00:00', 2, 8, 3000, 'rajkumar gaddha', -1, NULL),
(114, '2015-12-05 00:00:00', 1, 3, '2015-01-07 00:00:00', 1, 4, 6500, 'Nandu salary', 6500, NULL),
(115, '2015-12-05 00:00:00', 1, 3, '2015-01-07 00:00:00', 1, 4, 6500, 'santosh salary', 6500, NULL),
(116, '2015-12-05 00:00:00', 1, 3, '2015-01-07 00:00:00', 1, 3, 14630, 'b/w 29.12 to 7.1', -1, NULL),
(117, '2015-12-05 00:00:00', 1, 3, '2014-12-27 00:00:00', 7, 48, 100000, 'kailash chacha advance payment', -1, NULL),
(118, '2015-12-05 00:00:00', 1, 3, '2014-12-27 00:00:00', 7, 45, 5600, 'raju -- date is not confirm.', 5600, NULL),
(119, '2015-12-05 00:00:00', 1, 3, '2015-02-13 00:00:00', 7, 51, 28800, 'mehraaj bhaijaan', -1, NULL),
(120, '2015-12-05 00:00:00', 1, 3, '2015-02-13 00:00:00', 7, 52, 14200, 'Vibhum ', -1, NULL),
(121, '2015-12-05 00:00:00', 1, 3, '2015-01-20 00:00:00', 2, 13, 20000, 'bhupendra', 15, NULL),
(122, '2015-12-05 00:00:00', 1, 3, '2015-01-21 00:00:00', 7, 37, 10500, 'rajkumar saptik tank', -1, NULL),
(123, '2015-12-05 00:00:00', 1, 3, '2015-01-21 00:00:00', 2, 12, 1000, 'mukesh', 3500, NULL),
(124, '2015-12-05 00:00:00', 1, 3, '2015-01-28 00:00:00', 7, 45, 15000, '4 trally', 5600, NULL),
(125, '2015-12-05 00:00:00', 1, 3, '2015-01-31 00:00:00', 7, 30, 29500, '2 dumphar', 15000, NULL),
(126, '2015-12-05 00:00:00', 1, 3, '2015-02-02 00:00:00', 2, 15, 12000, 'balraam visvkarma ', -1, NULL),
(127, '2015-12-05 00:00:00', 1, 3, '2015-02-02 00:00:00', 2, 13, 15000, 'bhupendra', 15, NULL),
(128, '2015-12-05 00:00:00', 1, 3, '2015-02-02 00:00:00', 2, 15, 9000, 'slab', -1, NULL),
(129, '2015-12-05 00:00:00', 1, 3, '2015-02-03 00:00:00', 2, 14, 10000, 'jagdeesh', -1, NULL),
(130, '2015-12-05 00:00:00', 1, 3, '2015-02-03 00:00:00', 7, 45, 7400, 'kamlesh remaining from 4 trally', 5600, NULL),
(131, '2015-12-05 00:00:00', 1, 3, '2015-02-04 00:00:00', 2, 13, 9000, 'ballu', -1, NULL),
(132, '2015-12-05 00:00:00', 1, 3, '2015-02-04 00:00:00', 2, 13, 12000, 'bhupendra', -1, NULL),
(133, '2015-12-05 00:00:00', 1, 3, '2015-02-05 00:00:00', 2, 13, 45000, 'bhupendra', -1, NULL),
(134, '2015-12-05 00:00:00', 1, 3, '2015-02-05 00:00:00', 1, 3, 5280, '2-2 to 5-2', -1, NULL),
(135, '2015-12-05 00:00:00', 1, 3, '2015-02-05 00:00:00', 1, 5, 2000, 'parmanand salary', 2000, NULL),
(136, '2015-12-05 00:00:00', 1, 3, '2015-02-06 00:00:00', 7, 49, 19400, '12 pair of chokhat', -1, NULL),
(137, '2015-12-05 00:00:00', 1, 3, '2015-02-11 00:00:00', 7, 51, 28800, 'mehraaj bhaijaan', -1, NULL),
(138, '2015-12-05 00:00:00', 1, 3, '2015-02-13 00:00:00', 1, 3, 12480, '6-2 to 13-2', -1, NULL),
(139, '2015-12-05 00:00:00', 1, 3, '2015-02-13 00:00:00', 1, 4, 6500, 'Jaggu jan salary', 6500, NULL),
(140, '2015-12-05 00:00:00', 1, 3, '2015-02-15 00:00:00', 7, 45, 33600, 'kamlesh 12000 gitta', 5600, NULL),
(141, '2015-12-05 00:00:00', 1, 3, '2015-02-18 00:00:00', 7, 45, 11200, '2 trally', 5600, NULL),
(142, '2015-12-05 00:00:00', 1, 3, '2015-02-18 00:00:00', 7, 46, 200000, 'ridit sales', -1, NULL),
(143, '2015-12-05 00:00:00', 1, 3, '2015-02-19 00:00:00', 2, 53, 3800, 'misc work', -1, NULL),
(144, '2015-12-05 00:00:00', 1, 3, '2015-02-24 00:00:00', 7, 45, 22400, 'kamlesh -- 4 trally', 5600, NULL),
(145, '2015-12-05 00:00:00', 1, 3, '2015-02-24 00:00:00', 2, 11, 15000, 'raju light', 36, NULL),
(146, '2015-12-05 00:00:00', 1, 3, '2015-02-28 00:00:00', 7, 51, 17000, 'bhaijaan', -1, NULL),
(147, '2015-12-05 00:00:00', 1, 3, '2015-03-03 00:00:00', 7, 45, 11200, 'raju ', 5600, NULL),
(148, '2015-12-05 00:00:00', 1, 3, '2015-03-04 00:00:00', 2, 13, 40000, 'bhupendra', 15, NULL),
(149, '2015-12-05 00:00:00', 1, 3, '2015-03-04 00:00:00', 1, 3, 2500, 'dibbu and pooran', -1, NULL),
(150, '2015-12-05 00:00:00', 1, 3, '2015-03-04 00:00:00', 1, 4, 8500, 'jaggu salary plus advance', 6500, NULL),
(151, '2015-12-05 00:00:00', 1, 3, '2015-03-14 00:00:00', 2, 15, 13000, 'ballu', -1, NULL),
(152, '2015-12-05 00:00:00', 1, 3, '2015-03-19 00:00:00', 7, 45, 22400, 'kamlest 4 trally', 5600, NULL),
(153, '2015-12-05 00:00:00', 1, 3, '2015-03-18 00:00:00', 7, 52, 36000, 'mohsin bhaijaan', -1, NULL),
(154, '2015-12-05 00:00:00', 1, 3, '2015-03-18 00:00:00', 2, 11, 26049, 'raju light', 36, NULL),
(155, '2015-12-05 00:00:00', 1, 3, '2015-03-21 00:00:00', 2, 12, 12000, 'mukesh', 3500, NULL),
(156, '2015-12-05 00:00:00', 1, 3, '2015-03-20 00:00:00', 7, 30, 14500, '1 dumphar', -1, NULL),
(157, '2015-12-05 00:00:00', 1, 3, '2015-03-16 00:00:00', 1, 3, 21540, 'b/w 3.3 and 16.3', -1, NULL),
(158, '2015-12-05 00:00:00', 1, 3, '2015-03-16 00:00:00', 2, 14, 5000, 'jagdeesh', -1, NULL),
(159, '2015-12-05 00:00:00', 1, 3, '2015-03-16 00:00:00', 1, 5, 2000, 'parmanand salary', 2000, NULL),
(160, '2015-12-05 00:00:00', 1, 3, '2015-03-16 00:00:00', 7, 51, 10902, 'mehraaj bhaijaan', -1, NULL),
(161, '2015-12-05 00:00:00', 1, 3, '2015-03-23 00:00:00', 1, 3, 27150, 'b/w 17.3 and 23.3', -1, NULL),
(162, '2015-12-05 00:00:00', 1, 3, '2015-03-23 00:00:00', 7, 46, 29800, 'ridit sales', -1, NULL),
(163, '2015-12-05 00:00:00', 1, 3, '2015-03-23 00:00:00', 7, 48, 161000, 'jeet enterprises', -1, NULL),
(164, '2015-12-05 00:00:00', 1, 3, '2015-03-23 00:00:00', 3, 23, 3500, 'misc', -1, NULL),
(165, '2015-12-05 00:00:00', 1, 3, '2015-03-24 00:00:00', 7, 51, 30000, 'sunil visvkarma', -1, NULL),
(166, '2015-12-05 00:00:00', 1, 3, '2015-03-23 00:00:00', 7, 30, 14500, '1 dumphar', -1, NULL),
(167, '2015-12-05 00:00:00', 1, 3, '2015-03-27 00:00:00', 2, 14, 5000, 'jagdeesh', -1, NULL),
(168, '2015-12-05 00:00:00', 1, 3, '2015-03-29 00:00:00', 7, 30, 35500, '1100 cubic feet', -1, NULL),
(169, '2015-12-05 00:00:00', 1, 3, '2015-03-30 00:00:00', 2, 15, 11000, 'balraam visvkarma ', -1, NULL),
(170, '2015-12-05 00:00:00', 1, 3, '2015-04-02 00:00:00', 1, 3, 21305, 'b/w 24-3 to 2-4', -1, NULL),
(171, '2015-12-05 00:00:00', 1, 3, '2015-04-03 00:00:00', 2, 13, 35000, 'bhupendra', -1, NULL),
(172, '2015-12-06 00:00:00', 1, 3, '2015-04-15 00:00:00', 2, 12, 5000, 'rajendra', -1, NULL),
(173, '2015-12-06 00:00:00', 1, 3, '2015-04-15 00:00:00', 1, 1, 5000, 'raamu labour advance', -1, NULL),
(174, '2015-12-06 00:00:00', 1, 3, '2015-04-10 00:00:00', 1, 3, 24720, 'b/w 3.4 to 10.4', -1, NULL),
(175, '2015-12-06 00:00:00', 1, 3, '2015-04-10 00:00:00', 1, 4, 6500, 'jaggu march salary', 6500, NULL),
(176, '2015-12-06 00:00:00', 1, 3, '2015-04-10 00:00:00', 1, 5, 2000, 'parmanand salary', -1, NULL),
(177, '2015-12-06 00:00:00', 1, 3, '2015-04-17 00:00:00', 1, 3, 21630, 'b/w 11.4 to 17.4', -1, 1),
(178, '2015-12-06 00:00:00', 1, 3, '2015-04-18 00:00:00', 7, 45, 11200, '', 5600, 2),
(179, '2015-12-06 00:00:00', 1, 3, '2015-04-18 00:00:00', 7, 51, 18512, '', -1, 3),
(180, '2015-12-06 00:00:00', 1, 3, '2015-04-23 00:00:00', 7, 51, 65284, 'railing and gate', -1, 4),
(181, '2015-12-06 00:00:00', 1, 3, '2015-04-26 00:00:00', 1, 3, 20550, '', -1, 1),
(182, '2015-12-06 00:00:00', 1, 3, '2015-05-01 00:00:00', 7, 51, 7000, '', -1, 4),
(183, '2015-12-06 00:00:00', 1, 3, '2015-05-02 00:00:00', 1, 3, 16314, '26.4 to 2.5', -1, 1),
(184, '2015-12-06 00:00:00', 1, 3, '2015-05-04 00:00:00', 7, 48, 34762, '', -1, 5),
(185, '2015-12-06 00:00:00', 1, 3, '2015-05-05 00:00:00', 2, 12, 5000, '', -1, 6),
(186, '2015-12-06 00:00:00', 1, 3, '2015-05-09 00:00:00', 1, 3, 16440, '3.5 to 9.5', -1, 1),
(187, '2015-12-06 00:00:00', 1, 3, '2015-05-09 00:00:00', 2, 8, 3000, 'ravi', -1, 7),
(188, '2015-12-06 00:00:00', 1, 3, '2015-05-09 00:00:00', 11, 55, 200000, '', -1, 8),
(189, '2015-12-06 00:00:00', 1, 3, '2015-05-13 00:00:00', 2, 16, 10000, '', -1, 9),
(190, '2015-12-06 00:00:00', 1, 3, '2015-05-09 00:00:00', 1, 5, 2000, 'parmanand salary', -1, 10),
(191, '2015-12-06 00:00:00', 1, 3, '2015-05-09 00:00:00', 1, 4, 7000, '', -1, 11),
(192, '2015-12-06 00:00:00', 1, 3, '2015-05-13 00:00:00', 2, 8, 18800, '', -1, 7),
(193, '2015-12-13 00:00:00', 1, 3, '2015-05-15 00:00:00', 2, 11, 6595, 'raju light equipment ', -1, 14),
(194, '2015-12-13 00:00:00', 1, 3, '2015-05-15 00:00:00', 2, 11, 15000, 'raju light labour payment', -1, 14),
(195, '2015-12-13 00:00:00', 1, 3, '2015-05-15 00:00:00', 7, 30, 29000, '2 dumphar', 14500, 17),
(196, '2015-12-13 00:00:00', 1, 3, '2015-05-16 00:00:00', 1, 3, 17130, 'b/w 10 to 16/5', -1, 1),
(197, '2015-12-13 00:00:00', 1, 3, '2015-05-18 00:00:00', 4, 56, 6000, 'mobile and light bills', -1, 16),
(198, '2015-12-13 00:00:00', 1, 3, '2015-05-19 00:00:00', 2, 8, 1500, 'adv for 33,34,35', -1, 7),
(199, '2015-12-13 00:00:00', 1, 3, '2015-05-18 00:00:00', 3, 57, 6800, 'plants', -1, 18),
(200, '2015-12-13 00:00:00', 1, 3, '2015-05-20 00:00:00', 2, 13, 14000, '', -1, 19),
(201, '2015-12-13 00:00:00', 1, 3, '2015-05-20 00:00:00', 1, 3, 1600, 'shivprasad and anil ', -1, 18),
(202, '2015-12-13 00:00:00', 1, 3, '2015-05-21 00:00:00', 7, 30, 29000, '2 dumphar', 14500, 18),
(203, '2015-12-13 00:00:00', 1, 3, '2015-05-21 00:00:00', 2, 17, 15000, '', -1, 20),
(204, '2015-12-13 00:00:00', 1, 3, '2015-05-23 00:00:00', 4, 56, 8410, 'electricity distribution company', -1, 16),
(205, '2015-12-13 00:00:00', 1, 3, '2015-05-23 00:00:00', 1, 3, 20070, '17 to 23', -1, 1),
(206, '2015-12-13 00:00:00', 1, 3, '2015-05-23 00:00:00', 2, 16, 10000, '', -1, 9),
(207, '2015-12-13 00:00:00', 1, 3, '2015-05-27 00:00:00', 3, 23, 4500, '4 pair satak', -1, 21),
(208, '2015-12-14 00:00:00', 1, 3, '2015-05-28 00:00:00', 11, 60, 8550, 'birla white putty', 855, 18),
(209, '2015-12-14 00:00:00', 1, 3, '2015-05-28 00:00:00', 7, 51, 12600, 'bhaijaan', -1, 3),
(210, '2015-12-14 00:00:00', 1, 3, '2015-05-29 00:00:00', 11, 61, 23500, '5 pair for 1000 lt water tank', 4700, 5),
(211, '2015-12-14 00:00:00', 1, 3, '2015-05-30 00:00:00', 7, 51, 14030, '221 KG railing', 63, 18),
(212, '2015-12-14 00:00:00', 1, 3, '2015-05-30 00:00:00', 1, 3, 26620, '24 to 30', -1, 1),
(213, '2015-12-14 00:00:00', 1, 3, '2015-05-30 00:00:00', 11, 55, 33000, '', -1, 22),
(214, '2015-12-14 00:00:00', 1, 3, '2015-05-30 00:00:00', 3, 23, 1360, 'transpotation etc', -1, 12),
(215, '2015-12-14 00:00:00', 1, 3, '2015-05-31 00:00:00', 7, 39, 1900, '2 pair sink', 950, 21),
(216, '2015-12-15 00:00:00', 1, 3, '2015-05-31 00:00:00', 2, 17, 15000, '', -1, 20),
(217, '2015-12-15 00:00:00', 1, 3, '2015-06-02 00:00:00', 7, 45, 39200, '7 trally', 5600, 2),
(218, '2015-12-15 00:00:00', 1, 3, '2015-06-03 00:00:00', 2, 8, 3000, 'for 33-35', -1, 7),
(219, '2015-12-15 00:00:00', 1, 3, '2015-06-06 00:00:00', 7, 49, 40000, '', -1, 23),
(220, '2015-12-15 00:00:00', 1, 3, '2015-06-06 00:00:00', 2, 8, 1000, '', -1, 7),
(221, '2015-12-15 00:00:00', 1, 3, '2015-06-07 00:00:00', 2, 17, 15000, '', -1, 20),
(222, '2015-12-15 00:00:00', 1, 3, '2015-06-07 00:00:00', 7, 30, 15000, '', 15000, 18),
(223, '2015-12-15 00:00:00', 1, 3, '2015-06-07 00:00:00', 1, 3, 34640, '31.5 to 7.6', -1, 1),
(224, '2015-12-15 00:00:00', 1, 3, '2015-06-07 00:00:00', 1, 5, 2000, 'parmanand salary', -1, 10),
(225, '2015-12-15 00:00:00', 1, 3, '2015-06-07 00:00:00', 2, 14, 6000, '', -1, 24),
(226, '2015-12-15 00:00:00', 1, 3, '2015-06-10 00:00:00', 3, 23, 10427, '', -1, 25),
(227, '2015-12-15 00:00:00', 1, 3, '2015-06-11 00:00:00', 2, 13, 20000, 'plinth of 43-48', -1, 19),
(228, '2015-12-15 00:00:00', 1, 3, '2015-06-13 00:00:00', 11, 55, 4260, 'kitchen tiles', -1, 18),
(229, '2015-12-15 00:00:00', 1, 3, '2015-06-14 00:00:00', 7, 46, 100000, '', -1, 26),
(230, '2015-12-15 00:00:00', 1, 3, '2015-06-14 00:00:00', 2, 8, 2000, '', -1, 18),
(231, '2015-12-15 00:00:00', 1, 3, '2015-06-14 00:00:00', 1, 3, 33350, '8 to 14 jun', -1, 1),
(232, '2015-12-15 00:00:00', 1, 3, '2015-06-15 00:00:00', 7, 30, 20500, 'truck', -1, 18),
(233, '2015-12-15 00:00:00', 1, 3, '2015-06-15 00:00:00', 2, 16, 10000, '', -1, 9),
(234, '2015-12-15 00:00:00', 1, 3, '2015-06-16 00:00:00', 7, 45, 61600, '11 trally', -1, 2),
(235, '2015-12-15 00:00:00', 1, 3, '2015-06-19 00:00:00', 7, 30, 39500, '1 truck', -1, 18),
(236, '2015-12-15 00:00:00', 1, 3, '2015-06-19 00:00:00', 7, 48, 8100, 'virendra', -1, 18),
(237, '2015-12-15 00:00:00', 1, 3, '2015-06-19 00:00:00', 4, 56, 4257, '', -1, 16),
(238, '2015-12-15 00:00:00', 1, 3, '2015-06-19 00:00:00', 3, 23, 41260, 'misc items', -1, 21),
(239, '2015-12-15 00:00:00', 1, 3, '2015-06-20 00:00:00', 2, 17, 10000, '', -1, 20),
(240, '2015-12-15 00:00:00', 1, 3, '2015-06-22 00:00:00', 7, 46, 135000, '', -1, 26),
(241, '2015-12-15 00:00:00', 1, 3, '2015-06-22 00:00:00', 11, 55, 328500, 'to be verified', -1, 8),
(242, '2015-12-15 00:00:00', 1, 3, '2015-06-22 00:00:00', 1, 3, 31105, '', -1, 1),
(243, '2015-12-15 00:00:00', 1, 3, '2015-06-22 00:00:00', 2, 14, 3000, '', -1, 24),
(244, '2015-12-15 00:00:00', 1, 3, '2015-06-22 00:00:00', 6, 50, 1725, 'khilan', -1, 18),
(245, '2015-12-15 00:00:00', 1, 3, '2015-06-22 00:00:00', 2, 9, 30000, '76', -1, 27),
(246, '2015-12-15 00:00:00', 1, 3, '2015-06-23 00:00:00', 7, 30, 45000, '2 truck', 22500, 18),
(247, '2015-12-15 00:00:00', 1, 3, '2015-06-23 00:00:00', 2, 9, 30000, '', -1, 27),
(248, '2015-12-15 00:00:00', 1, 3, '2015-06-24 00:00:00', 2, 17, 17000, '', -1, 20),
(249, '2015-12-15 00:00:00', 1, 3, '2015-06-24 00:00:00', 2, 9, 7000, '', -1, 27),
(250, '2015-12-15 00:00:00', 1, 3, '2015-06-29 00:00:00', 2, 12, 5000, '', -1, 6),
(251, '2015-12-15 00:00:00', 1, 3, '2015-06-29 00:00:00', 7, 45, 22000, 'raja 4+ trally', 5600, 18),
(252, '2015-12-15 00:00:00', 1, 3, '2015-06-30 00:00:00', 7, 48, 13500, 'mycem cement', -1, 18),
(253, '2015-12-15 00:00:00', 1, 3, '2015-06-30 00:00:00', 1, 3, 26860, '23 to 30', -1, 1),
(254, '2015-12-15 00:00:00', 1, 3, '2015-06-30 00:00:00', 3, 23, 3640, '', -1, 12),
(255, '2015-12-15 00:00:00', 1, 3, '2015-07-01 00:00:00', 7, 49, 50000, 'chokhat', -1, 23),
(256, '2015-12-15 00:00:00', 1, 3, '2015-06-30 00:00:00', 11, 59, 14400, 'sagoon doors', -1, 18),
(257, '2015-12-15 00:00:00', 1, 3, '2015-07-01 00:00:00', 2, 9, 8000, '', -1, 27),
(258, '2015-12-15 00:00:00', 1, 3, '2015-07-01 00:00:00', 2, 17, 15000, '', -1, 20),
(259, '2015-12-15 00:00:00', 1, 3, '2015-07-01 00:00:00', 3, 23, 41500, 'putty and others', -1, 21),
(260, '2015-12-15 00:00:00', 1, 3, '2015-07-01 00:00:00', 11, 59, 7500, 'door fiting', -1, 21),
(261, '2015-12-15 00:00:00', 1, 3, '2015-07-07 00:00:00', 7, 51, 43000, '', -1, 3),
(262, '2015-12-15 00:00:00', 1, 3, '2015-07-07 00:00:00', 7, 45, 56000, '10 trally', 5600, 2),
(263, '2015-12-15 00:00:00', 1, 3, '2015-07-07 00:00:00', 2, 14, 6000, '', -1, 24),
(264, '2015-12-15 00:00:00', 1, 3, '2015-07-07 00:00:00', 2, 8, 5250, 'ramu 15 gaddha', 350, 18),
(265, '2015-12-15 00:00:00', 1, 3, '2015-07-07 00:00:00', 1, 3, 26980, '', -1, 1),
(266, '2015-12-15 00:00:00', 1, 3, '2015-07-07 00:00:00', 6, 47, 750, 'tasla', -1, 18),
(267, '2015-12-15 00:00:00', 1, 3, '2015-07-08 00:00:00', 7, 31, 17000, '', 17000, 28),
(268, '2015-12-15 00:00:00', 1, 3, '2015-07-08 00:00:00', 11, 55, 40000, '20500 reamining', -1, 29),
(269, '2015-12-15 00:00:00', 1, 3, '2015-07-07 00:00:00', 1, 4, 7000, '', -1, 12),
(270, '2015-12-15 00:00:00', 1, 3, '2015-07-07 00:00:00', 1, 4, 7000, '', -1, 11),
(271, '2015-12-15 00:00:00', 1, 3, '2015-07-08 00:00:00', 2, 9, 5000, '', -1, 27),
(272, '2015-12-15 00:00:00', 1, 3, '2015-07-08 00:00:00', 2, 13, 15000, 'plinth of 33-35', -1, 19),
(273, '2015-12-15 00:00:00', 1, 3, '2015-07-11 00:00:00', 11, 59, 31500, 'doors', -1, 30),
(274, '2015-12-15 00:00:00', 1, 3, '2015-07-12 00:00:00', 2, 17, 12000, '', -1, 20),
(275, '2015-12-15 00:00:00', 1, 3, '2015-07-12 00:00:00', 2, 53, 2000, '', -1, 31),
(276, '2015-12-15 00:00:00', 1, 3, '2015-07-14 00:00:00', 3, 23, 5850, '', -1, 32),
(277, '2015-12-15 00:00:00', 1, 3, '2015-07-14 00:00:00', 1, 3, 28770, '8 to 14 jul', -1, 1),
(278, '2015-12-15 00:00:00', 1, 3, '2015-07-14 00:00:00', 2, 14, 1000, '', -1, 24),
(279, '2015-12-15 00:00:00', 1, 3, '2015-07-14 00:00:00', 3, 23, 3230, 'transpotation etc', -1, 12),
(280, '2015-12-15 00:00:00', 1, 3, '2015-07-15 00:00:00', 7, 30, 17600, '1 dumphar', -1, 18),
(281, '2015-12-15 00:00:00', 1, 3, '2015-07-16 00:00:00', 7, 30, 41500, '1 trala', -1, 18),
(282, '2015-12-15 00:00:00', 1, 3, '2015-07-16 00:00:00', 7, 31, 15000, '', -1, 18),
(283, '2015-12-15 00:00:00', 1, 3, '2015-07-17 00:00:00', 4, 56, 1700, '', -1, 16),
(284, '2015-12-15 00:00:00', 1, 3, '2015-07-17 00:00:00', 4, 56, 4043, 'electricity distribution company', -1, 16),
(285, '2015-12-15 00:00:00', 1, 3, '2015-07-17 00:00:00', 7, 48, 300, 'KJS cement', -1, 18),
(286, '2015-12-15 00:00:00', 1, 3, '2015-07-20 00:00:00', 7, 30, 15000, 'via kailash chacha', -1, 18),
(287, '2015-12-15 00:00:00', 1, 3, '2015-07-20 00:00:00', 7, 46, 450000, '', -1, 26),
(288, '2015-12-15 00:00:00', 1, 3, '2015-07-20 00:00:00', 3, 23, 500, 'to nandu for jaali', -1, 18),
(289, '2015-12-15 00:00:00', 1, 3, '2015-07-20 00:00:00', 2, 11, 50000, 'Atul jain and Narendra jain', -1, 14),
(290, '2015-12-15 00:00:00', 1, 3, '2015-07-20 00:00:00', 11, 55, 16500, '', -1, 22),
(291, '2015-12-16 00:00:00', 1, 3, '2015-07-21 00:00:00', 7, 46, 70000, 'total bill was 115050', -1, 26),
(292, '2015-12-16 00:00:00', 1, 3, '2015-07-21 00:00:00', 11, 64, 25000, '', -1, 33),
(293, '2015-12-16 00:00:00', 1, 3, '2015-07-21 00:00:00', 7, 48, 52000, '190 packet', 275, 5),
(294, '2015-12-16 00:00:00', 1, 3, '2015-07-21 00:00:00', 7, 45, 38920, 'pappu 7 trally', 5600, 18),
(295, '2015-12-16 00:00:00', 1, 3, '2015-07-21 00:00:00', 1, 3, 35270, '14 to 21 jul', -1, 1),
(296, '2015-12-16 00:00:00', 1, 3, '2015-07-21 00:00:00', 3, 23, 1810, 'misc', -1, 12),
(297, '2015-12-16 00:00:00', 1, 3, '2015-07-21 00:00:00', 7, 38, 500, '1 trally', 500, 18),
(298, '2015-12-16 00:00:00', 1, 3, '2015-07-21 00:00:00', 3, 23, 7500, 'cloths for nandu, jaggu etc.', -1, 18),
(299, '2015-12-16 00:00:00', 1, 3, '2015-07-22 00:00:00', 7, 49, 27500, '44 pairs of chokhat', 1800, 23),
(300, '2015-12-16 00:00:00', 1, 3, '2015-07-22 00:00:00', 2, 9, 15000, '', -1, 27),
(301, '2015-12-16 00:00:00', 1, 3, '2015-07-23 00:00:00', 2, 9, 20000, '', -1, 27),
(302, '2015-12-16 00:00:00', 1, 3, '2015-07-23 00:00:00', 2, 8, 7000, 'raajkumar', -1, 18),
(303, '2015-12-16 00:00:00', 1, 3, '2015-07-24 00:00:00', 1, 65, 800, '', -1, 1),
(304, '2015-12-16 00:00:00', 1, 3, '2015-07-22 00:00:00', 7, 52, 55000, '', -1, 25),
(305, '2015-12-16 00:00:00', 1, 3, '2015-07-29 00:00:00', 7, 45, 117600, '21 trally', 5600, 2),
(306, '2015-12-16 00:00:00', 1, 3, '2015-07-30 00:00:00', 11, 55, 20000, '', -1, 29),
(307, '2015-12-16 00:00:00', 1, 3, '2015-07-30 00:00:00', 1, 3, 40000, '', -1, 1),
(308, '2015-12-16 00:00:00', 1, 3, '2015-07-30 00:00:00', 2, 13, 150000, '', -1, 19),
(309, '2015-12-16 00:00:00', 1, 3, '2015-08-01 00:00:00', 2, 14, 1000, '', -1, 24),
(310, '2015-12-16 00:00:00', 1, 3, '2015-08-02 00:00:00', 11, 64, 35000, '', -1, 33),
(311, '2015-12-16 00:00:00', 1, 3, '2015-08-03 00:00:00', 7, 31, 126000, '9 dumphar', 14000, 28),
(312, '2015-12-16 00:00:00', 1, 3, '2015-08-05 00:00:00', 1, 3, 33485, '22 to 29 jul', -1, 1),
(313, '2015-12-16 00:00:00', 1, 3, '2015-08-06 00:00:00', 1, 4, 7000, '', -1, 11),
(314, '2015-12-16 00:00:00', 1, 3, '2015-08-06 00:00:00', 1, 4, 7000, '', -1, 13),
(315, '2015-12-16 00:00:00', 1, 3, '2015-08-06 00:00:00', 1, 3, 41423, '30 jul to 6 aug', -1, 1),
(316, '2015-12-16 00:00:00', 1, 3, '2015-08-06 00:00:00', 3, 23, 3745, '', -1, 12),
(317, '2015-12-16 00:00:00', 1, 3, '2015-08-06 00:00:00', 6, 50, 1250, '10 round -- khilan', 125, 18),
(318, '2015-12-16 00:00:00', 1, 3, '2015-08-10 00:00:00', 7, 45, 22400, '4 trally', 5600, 2),
(319, '2015-12-16 00:00:00', 1, 1, '2012-12-31 00:00:00', 1, 5, 22500, 'for the year of 2012 and other labour ', -1, 10),
(320, '2015-12-16 00:00:00', 1, 1, '2012-12-31 00:00:00', 1, 4, 60000, 'nandu and santosh salary for year', -1, 12),
(321, '2015-12-16 00:00:00', 1, 1, '2012-12-31 00:00:00', 1, 4, 60000, 'nandu and santosh salary for year', -1, 13),
(322, '2015-12-16 00:00:00', 1, 1, '2012-12-31 00:00:00', 4, 41, 35000, 'map, T&CP and application', -1, 18),
(323, '2015-12-16 00:00:00', 1, 1, '2013-01-13 00:00:00', 1, 3, 620, '', -1, 1),
(324, '2015-12-16 00:00:00', 1, 1, '2013-01-25 00:00:00', 4, 66, 3000, 'T&CP land use', -1, 34),
(325, '2015-12-16 00:00:00', 1, 1, '2013-02-03 00:00:00', 4, 67, 6000, 'patwari ', -1, 18),
(326, '2015-12-16 00:00:00', 1, 1, '2013-02-06 00:00:00', 4, 67, 18000, 'nagar nigam', -1, 18),
(327, '2015-12-16 00:00:00', 1, 1, '2013-02-10 00:00:00', 4, 25, 1500, 'during measurement', -1, 18),
(328, '2015-12-16 00:00:00', 1, 1, '2013-02-13 00:00:00', 4, 25, 1000, 'RI order', -1, 18),
(329, '2015-12-16 00:00:00', 1, 1, '2013-02-16 00:00:00', 4, 25, 10000, 'patwari measurement', -1, 18),
(330, '2015-12-16 00:00:00', 1, 1, '2013-02-17 00:00:00', 6, 35, 3260, '3 hour and 45 mins', 900, 18),
(331, '2015-12-16 00:00:00', 1, 1, '2013-02-17 00:00:00', 1, 1, 6000, 'cleaning and labour in Jna and Feb', -1, 18),
(332, '2015-12-16 00:00:00', 1, 1, '2013-02-17 00:00:00', 4, 41, 5000, 'diversion application and photocopy', -1, 15),
(333, '2015-12-16 00:00:00', 1, 1, '2013-02-18 00:00:00', 4, 25, 3000, 'nagar nigam', -1, 18),
(334, '2015-12-16 00:00:00', 1, 1, '2013-02-18 00:00:00', 4, 25, 10000, 'sagar mahotsav receipt', -1, 15),
(335, '2015-12-16 00:00:00', 1, 1, '2013-02-23 00:00:00', 4, 25, 5000, 'RI for measurement', -1, 18),
(336, '2015-12-16 00:00:00', 1, 1, '2013-02-23 00:00:00', 4, 25, 20000, 'patwari and RI', -1, 18),
(337, '2015-12-16 00:00:00', 1, 1, '2013-02-24 00:00:00', 7, 39, 5500, 'pillers and transportation', -1, 18),
(338, '2015-12-16 00:00:00', 1, 1, '2013-02-26 00:00:00', 1, 3, 3500, '', -1, 1),
(339, '2015-12-16 00:00:00', 1, 1, '2013-02-26 00:00:00', 3, 23, 600, 'misc', -1, 12),
(340, '2015-12-16 00:00:00', 1, 1, '2013-02-26 00:00:00', 1, 65, 28400, 'santosh, nandu, security for jan and feb', -1, 18),
(341, '2015-12-16 00:00:00', 1, 1, '2013-03-27 00:00:00', 1, 65, 2480, '', -1, 1),
(342, '2015-12-16 00:00:00', 1, 1, '2013-03-27 00:00:00', 4, 25, 5000, 'patwari diversion NOC', -1, 18),
(343, '2015-12-16 00:00:00', 1, 1, '2013-03-27 00:00:00', 4, 25, 20000, 'diversion RI', -1, 18),
(344, '2015-12-16 00:00:00', 1, 1, '2013-03-27 00:00:00', 4, 25, 18000, 'diversion SLR', -1, 18),
(345, '2015-12-16 00:00:00', 1, 1, '2013-03-27 00:00:00', 4, 41, 1300, 'khasra B1 ', -1, 18),
(346, '2015-12-16 00:00:00', 1, 1, '2015-04-04 00:00:00', 2, 42, 20000, '', -1, 35),
(347, '2015-12-16 00:00:00', 1, 1, '2015-04-04 00:00:00', 4, 25, 105000, 'T&CP napit and kaul', -1, 18),
(348, '2015-12-16 00:00:00', 1, 1, '2015-04-04 00:00:00', 4, 25, 5000, 'map, najool, photocopy etc.', -1, 18),
(349, '2015-12-16 00:00:00', 1, 1, '2015-04-06 00:00:00', 4, 25, 5000, 'kalu', -1, 18),
(350, '2015-12-16 00:00:00', 1, 1, '2015-04-07 00:00:00', 4, 25, 10000, 'najool RI NOC', -1, 18),
(351, '2015-12-16 00:00:00', 1, 1, '2015-04-07 00:00:00', 4, 41, 10000, 'T&CP challan', -1, 34),
(352, '2015-12-16 00:00:00', 1, 1, '2013-04-07 00:00:00', 4, 41, 50000, 'challan map', -1, 18),
(353, '2015-12-16 00:00:00', 1, 1, '2013-04-07 00:00:00', 4, 25, 50000, 'naksha anugaya', -1, 18),
(354, '2015-12-16 00:00:00', 1, 1, '2013-04-07 00:00:00', 4, 25, 1000, '', -1, 18),
(355, '2015-12-16 00:00:00', 1, 1, '2013-04-08 00:00:00', 2, 42, 5000, '', -1, 35),
(356, '2015-12-16 00:00:00', 1, 1, '2013-05-08 00:00:00', 2, 42, 10000, '', -1, 35),
(357, '2015-12-16 00:00:00', 1, 1, '2013-05-08 00:00:00', 4, 25, 350000, 'T&CP', -1, 18),
(358, '2015-12-16 00:00:00', 1, 1, '2013-05-08 00:00:00', 4, 33, 3500, 'stamp etc.', -1, 18),
(359, '2015-12-16 00:00:00', 1, 1, '2013-05-03 00:00:00', 4, 41, 5000, 'surendra lamberdaad for meter', -1, 18),
(360, '2015-12-16 00:00:00', 1, 1, '2013-05-26 00:00:00', 4, 25, 1000, 'remaining area diversion', -1, 18),
(361, '2015-12-16 00:00:00', 1, 1, '2013-05-26 00:00:00', 4, 25, 10000, 'nigam NOC', -1, 18),
(362, '2015-12-16 00:00:00', 1, 1, '2013-05-29 00:00:00', 7, 46, 750, 'wire', -1, 18),
(363, '2015-12-16 00:00:00', 1, 1, '2013-05-29 00:00:00', 3, 23, 220, '', -1, 18),
(364, '2015-12-16 00:00:00', 1, 1, '2013-05-29 00:00:00', 1, 4, 13500, 'two supervisor', -1, 18),
(365, '2015-12-16 00:00:00', 1, 1, '2013-05-29 00:00:00', 1, 4, 27000, 'two supervisor for two month april and may', -1, 18),
(366, '2015-12-16 00:00:00', 1, 1, '2013-05-30 00:00:00', 3, 68, 45000, '', -1, 18),
(367, '2015-12-16 00:00:00', 1, 1, '2013-05-30 00:00:00', 7, 45, 18000, '4 trally', -1, 18),
(368, '2015-12-16 00:00:00', 1, 1, '2013-05-30 00:00:00', 7, 46, 8040, '7 chaddar', -1, 18),
(369, '2015-12-16 00:00:00', 1, 1, '2013-05-30 00:00:00', 3, 23, 1235, 'T&P item', -1, 18),
(370, '2015-12-16 00:00:00', 1, 1, '2013-05-31 00:00:00', 3, 68, 95000, '2 tubewell with casing', -1, 18),
(371, '2015-12-16 00:00:00', 1, 1, '2013-05-31 00:00:00', 3, 23, 200, 'casing pipe tx', -1, 18),
(372, '2015-12-16 00:00:00', 1, 1, '2013-05-31 00:00:00', 3, 23, 150, 'pipe casing tx', -1, 18),
(373, '2015-12-16 00:00:00', 1, 1, '2013-06-04 00:00:00', 3, 23, 33100, 'DK machine texsamo', -1, 18),
(374, '2015-12-16 00:00:00', 1, 1, '2013-06-04 00:00:00', 3, 23, 70, 'qwil', -1, 18),
(375, '2015-12-16 00:00:00', 1, 1, '2013-06-04 00:00:00', 3, 23, 200, '1" pipe', -1, 18),
(376, '2015-12-16 00:00:00', 1, 1, '2013-06-04 00:00:00', 7, 48, 270, '1', -1, 18),
(377, '2015-12-16 00:00:00', 1, 1, '2013-06-04 00:00:00', 3, 23, 100, '3 lock', -1, 18),
(378, '2015-12-16 00:00:00', 1, 1, '2013-06-05 00:00:00', 7, 45, 18000, '4 trally', -1, 18),
(379, '2015-12-16 00:00:00', 1, 1, '2013-06-06 00:00:00', 7, 39, 200, 'light holder and wire', -1, 18),
(380, '2015-12-16 00:00:00', 1, 1, '2013-06-06 00:00:00', 7, 39, 27000, 'guard cabin and store room construction', -1, 18),
(381, '2015-12-16 00:00:00', 1, 1, '2013-06-06 00:00:00', 7, 69, 11690, '11500 + 190 , cable etc.', -1, 18),
(382, '2015-12-16 00:00:00', 1, 1, '2013-06-07 00:00:00', 7, 39, 1050, '', -1, 25),
(383, '2015-12-16 00:00:00', 1, 1, '2013-06-08 00:00:00', 6, 35, 95000, '10K + 25K + 60K', -1, 18),
(384, '2015-12-16 00:00:00', 1, 1, '2013-06-08 00:00:00', 4, 25, 5000, '', -1, 18),
(385, '2015-12-16 00:00:00', 1, 1, '2013-06-08 00:00:00', 4, 25, 500, '', -1, 18),
(386, '2015-12-17 00:00:00', 1, 1, '2013-12-06 00:00:00', 3, 23, 320, 'casing pipe return', -1, 18),
(387, '2015-12-17 00:00:00', 1, 1, '2013-06-13 00:00:00', 1, 3, 3570, '29.5 to 13.6', -1, 1),
(388, '2015-12-17 00:00:00', 1, 1, '2013-06-13 00:00:00', 4, 25, 1850, 'nagar nigam, environment, electricity dept file', -1, 18),
(389, '2015-12-17 00:00:00', 1, 1, '2013-06-17 00:00:00', 7, 51, 16980, '302 kg angle', -1, 3),
(390, '2015-12-17 00:00:00', 1, 1, '2013-06-17 00:00:00', 10, 43, 1335, 'photocopy', -1, 18),
(391, '2015-12-17 00:00:00', 1, 1, '2013-06-20 00:00:00', 4, 25, 5000, 'nagar nigam', -1, 18),
(392, '2015-12-17 00:00:00', 1, 1, '2013-06-20 00:00:00', 4, 25, 500, 'diversion', -1, 18),
(393, '2015-12-17 00:00:00', 1, 1, '2013-06-23 00:00:00', 7, 39, 1720, 'misc item', -1, 18),
(394, '2015-12-17 00:00:00', 1, 1, '2013-06-24 00:00:00', 4, 25, 650, 'najool NOC', -1, 18),
(395, '2015-12-17 00:00:00', 1, 1, '2013-06-25 00:00:00', 7, 44, 1700, '1 trally', -1, 36),
(396, '2015-12-17 00:00:00', 1, 1, '2013-06-28 00:00:00', 1, 3, 2825, '21 to 28', -1, 1),
(397, '2015-12-17 00:00:00', 1, 1, '2013-06-28 00:00:00', 1, 4, 15200, 'june payment', -1, 18),
(398, '2015-12-17 00:00:00', 1, 1, '2013-07-04 00:00:00', 7, 44, 1600, 'from ravi', -1, 18),
(399, '2015-12-17 00:00:00', 1, 1, '2013-07-04 00:00:00', 7, 30, 8000, '2 trally vibhum and ashok', -1, 18),
(400, '2015-12-17 00:00:00', 1, 1, '2013-07-04 00:00:00', 10, 43, 1300, 'office seal and misc', -1, 18),
(401, '2015-12-17 00:00:00', 1, 1, '2013-07-04 00:00:00', 3, 23, 5000, 'ravi visvkarma', -1, 18),
(402, '2015-12-17 00:00:00', 1, 1, '2013-07-05 00:00:00', 7, 46, 20229, '', -1, 25),
(403, '2015-12-18 00:00:00', 1, 1, '2013-07-06 00:00:00', 3, 23, 10000, 'ravi visvkarma', -1, 18),
(404, '2015-12-18 00:00:00', 1, 1, '2013-07-06 00:00:00', 7, 48, 2600, '10 bori', 260, 18),
(405, '2015-12-18 00:00:00', 1, 1, '2013-07-06 00:00:00', 7, 49, 2600, '10 bori', 260, 18),
(406, '2015-12-18 00:00:00', 1, 1, '2013-07-06 00:00:00', 7, 45, 13500, '3 trally', 4500, 18),
(407, '2015-12-18 00:00:00', 1, 1, '2013-07-07 00:00:00', 3, 23, 1500, 'ravi visvkarma', -1, 18),
(408, '2015-12-18 00:00:00', 1, 1, '2013-07-07 00:00:00', 4, 25, 15000, 'SLR RI ', -1, 18),
(409, '2015-12-18 00:00:00', 1, 1, '2013-07-06 00:00:00', 4, 25, 500000, 'external road', -1, 18),
(410, '2015-12-18 00:00:00', 1, 1, '2013-07-06 00:00:00', 6, 35, 10000, 'JCB subash', -1, 18),
(411, '2015-12-18 00:00:00', 1, 1, '2013-07-08 00:00:00', 7, 39, 2200, '4 pair chaddar', -1, 18),
(412, '2015-12-18 00:00:00', 1, 1, '2013-07-08 00:00:00', 4, 25, 680, 'T&CP items', -1, 18),
(413, '2015-12-18 00:00:00', 1, 1, '2013-07-08 00:00:00', 7, 39, 2060, '2 pair satak', -1, 18),
(414, '2015-12-18 00:00:00', 1, 1, '2013-07-08 00:00:00', 7, 46, 10000, '500 ft jaali', -1, 18),
(415, '2015-12-18 00:00:00', 1, 1, '2013-07-08 00:00:00', 7, 39, 2000, '2 pair TNP plastic', -1, 18),
(416, '2015-12-18 00:00:00', 1, 1, '2013-07-08 00:00:00', 7, 39, 1200, 'misc item', -1, 18),
(417, '2015-12-18 00:00:00', 1, 1, '2013-07-08 00:00:00', 3, 23, 2000, 'ravi visvkarma', -1, 18),
(418, '2015-12-18 00:00:00', 1, 1, '2013-07-08 00:00:00', 7, 30, 4000, '1 trally from neelkanth', -1, 18),
(419, '2015-12-18 00:00:00', 1, 1, '2013-07-10 00:00:00', 1, 3, 1530, '29.6 to 10.7', -1, 1),
(420, '2015-12-18 00:00:00', 1, 1, '2013-07-10 00:00:00', 7, 48, 1300, '5 bori', -1, 5),
(421, '2015-12-18 00:00:00', 1, 1, '2013-07-12 00:00:00', 7, 44, 3400, '2 trally', -1, 36),
(422, '2015-12-18 00:00:00', 1, 1, '2013-07-15 00:00:00', 7, 48, 1300, '5 bori', 260, 5),
(423, '2015-12-18 00:00:00', 1, 1, '2013-07-20 00:00:00', 7, 46, 27390, 'jaali and unloading', -1, 18),
(424, '2015-12-18 00:00:00', 1, 1, '2013-07-20 00:00:00', 7, 51, 10000, 'angle pole', -1, 18),
(425, '2015-12-18 00:00:00', 1, 1, '2013-07-25 00:00:00', 1, 3, 340, '', -1, 1),
(426, '2015-12-18 00:00:00', 1, 1, '2013-08-02 00:00:00', 4, 25, 118000, 'diversion', -1, 18),
(427, '2015-12-18 00:00:00', 1, 1, '2013-08-02 00:00:00', 4, 25, 800, '', -1, 18),
(428, '2015-12-18 00:00:00', 1, 1, '2013-08-10 00:00:00', 4, 41, 172821, 'diversion', -1, 15),
(429, '2015-12-18 00:00:00', 1, 1, '2013-08-10 00:00:00', 4, 25, 132000, 'diversion', -1, 18),
(430, '2015-12-18 00:00:00', 1, 1, '2013-08-10 00:00:00', 4, 25, 5000, '', -1, 18),
(431, '2015-12-18 00:00:00', 1, 1, '2013-08-10 00:00:00', 4, 25, 50000, 'diversion', -1, 18),
(432, '2015-12-18 00:00:00', 1, 1, '2013-08-16 00:00:00', 7, 51, 21334, 'angle', -1, 18),
(433, '2015-12-18 00:00:00', 1, 1, '2013-08-16 00:00:00', 1, 3, 2550, '6.8 to 16.8', -1, 1),
(434, '2015-12-18 00:00:00', 1, 1, '2013-08-16 00:00:00', 7, 46, 25682, 'jaali and unloading', -1, 18),
(435, '2015-12-18 00:00:00', 1, 1, '2013-08-28 00:00:00', 1, 3, 11020, '23 to 28', -1, 1),
(436, '2015-12-18 00:00:00', 1, 1, '2013-09-03 00:00:00', 7, 48, 1300, '', 260, 5),
(437, '2015-12-18 00:00:00', 1, 1, '2013-09-04 00:00:00', 1, 3, 3740, '29.8 to 4.9', -1, 1),
(438, '2015-12-18 00:00:00', 1, 1, '2013-09-04 00:00:00', 1, 4, 30400, 'july and aug salary all', -1, 18),
(439, '2015-12-19 00:00:00', 1, 1, '2015-09-25 00:00:00', 4, 25, 400000, 'nagar nigam', -1, 18),
(440, '2015-12-19 00:00:00', 1, 1, '2015-09-26 00:00:00', 4, 41, 267500, 'nagar nigam', -1, 18),
(441, '2015-12-19 00:00:00', 1, 1, '2015-09-02 00:00:00', 4, 41, 11000, 'nagar nigam', -1, 18),
(442, '2015-12-19 00:00:00', 1, 1, '2015-09-30 00:00:00', 4, 41, 1617818, 'nagar nigam', -1, 18),
(443, '2015-12-19 00:00:00', 1, 1, '2015-09-26 00:00:00', 6, 35, 25000, 'subash', -1, 18),
(444, '2015-12-19 00:00:00', 1, 1, '2015-09-26 00:00:00', 4, 33, 1500, 'bandhan patra', -1, 18),
(445, '2015-12-19 00:00:00', 1, 1, '2015-10-01 00:00:00', 1, 3, 6210, '20.9 to 1.10', -1, 1),
(446, '2015-12-19 00:00:00', 1, 1, '2015-10-04 00:00:00', 6, 35, 3000, 'subash', -1, 18),
(447, '2015-12-19 00:00:00', 1, 1, '2015-10-07 00:00:00', 1, 5, 2000, 'parmanand salary', -1, 10),
(448, '2015-12-19 00:00:00', 1, 1, '2015-10-07 00:00:00', 7, 39, 500, 'lime stone', -1, 18),
(449, '2015-12-19 00:00:00', 1, 1, '2015-10-16 00:00:00', 6, 35, 3100, 'subash', -1, 18),
(450, '2015-12-19 00:00:00', 1, 1, '2015-10-17 00:00:00', 7, 39, 1380, 'misc', -1, 25),
(451, '2015-12-19 00:00:00', 1, 1, '2015-10-18 00:00:00', 6, 35, 2900, 'diesal', -1, 18),
(452, '2015-12-19 00:00:00', 1, 1, '2015-10-19 00:00:00', 6, 35, 10000, 'subash', -1, 18),
(453, '2015-12-19 00:00:00', 1, 1, '2015-10-21 00:00:00', 6, 35, 2900, 'diesal', -1, 18),
(454, '2015-12-19 00:00:00', 1, 1, '2015-10-21 00:00:00', 3, 23, 6500, 'wood', -1, 12),
(455, '2015-12-19 00:00:00', 1, 1, '2015-10-21 00:00:00', 6, 50, 2400, '24 round kilan', -1, 18),
(456, '2015-12-19 00:00:00', 1, 1, '2015-10-21 00:00:00', 6, 35, 600, 'driver', -1, 18),
(457, '2015-12-19 00:00:00', 1, 1, '2015-10-22 00:00:00', 6, 35, 31300, 'subash', -1, 18),
(458, '2015-12-19 00:00:00', 1, 1, '2015-10-24 00:00:00', 6, 50, 2400, 'khilan', -1, 18),
(459, '2015-12-19 00:00:00', 1, 1, '2015-10-24 00:00:00', 1, 4, 15200, 'sept and oct salary', -1, 18),
(460, '2015-12-19 00:00:00', 1, 1, '2015-11-01 00:00:00', 1, 4, 7000, 'santosh oct and gift', -1, 12),
(461, '2015-12-19 00:00:00', 1, 1, '2015-11-01 00:00:00', 1, 4, 7000, 'Nandu oct and diwali gift', -1, 13),
(462, '2015-12-19 00:00:00', 1, 1, '2015-11-02 00:00:00', 1, 5, 1200, '', -1, 10),
(463, '2015-12-19 00:00:00', 1, 1, '2015-11-02 00:00:00', 1, 3, 2250, '', -1, 1),
(464, '2015-12-19 00:00:00', 1, 1, '2015-11-02 00:00:00', 1, 5, 2000, 'parmanand salary', -1, 10),
(465, '2015-12-19 00:00:00', 1, 1, '2015-11-03 00:00:00', 6, 50, 1000, 'khilan', -1, 18),
(466, '2015-12-19 00:00:00', 1, 1, '2015-11-04 00:00:00', 1, 5, 2000, 'parmanand advance', -1, 10),
(467, '2015-12-19 00:00:00', 1, 1, '2015-11-11 00:00:00', 6, 35, 10000, 'subash', -1, 18),
(468, '2015-12-19 00:00:00', 1, 1, '2015-11-13 00:00:00', 7, 30, 16000, '', -1, 18),
(469, '2015-12-19 00:00:00', 1, 1, '2015-11-13 00:00:00', 6, 35, 50000, 'subash', -1, 18),
(470, '2015-12-19 00:00:00', 1, 1, '2015-11-18 00:00:00', 6, 35, 4000, 'diesal', -1, 18),
(471, '2015-12-19 00:00:00', 1, 1, '2015-11-18 00:00:00', 6, 35, 7000, 'subash', -1, 18),
(472, '2015-12-19 00:00:00', 1, 1, '2015-11-18 00:00:00', 6, 47, 3000, 'dumphar diesal', -1, 18),
(473, '2015-12-19 00:00:00', 1, 1, '2015-11-19 00:00:00', 1, 65, 2000, 'night shift', -1, 1),
(474, '2015-12-19 00:00:00', 1, 1, '2015-11-19 00:00:00', 6, 50, 1350, 'khilan', -1, 18),
(475, '2015-12-19 00:00:00', 1, 1, '2015-11-20 00:00:00', 7, 44, 12000, '2 dumphar', 6000, 36),
(476, '2015-12-19 00:00:00', 1, 1, '2015-11-20 00:00:00', 7, 34, 1800, '', -1, 36),
(477, '2015-12-19 00:00:00', 1, 1, '2015-11-21 00:00:00', 1, 3, 5760, '1 to 21', -1, 1),
(478, '2015-12-19 00:00:00', 1, 1, '2015-11-21 00:00:00', 2, 12, 600, 'submersible', -1, 6),
(479, '2015-12-19 00:00:00', 1, 1, '2015-11-19 00:00:00', 6, 47, 600, 'driver', -1, 18),
(480, '2015-12-19 00:00:00', 1, 1, '2013-11-22 00:00:00', 6, 35, 10000, 'subash', -1, 18),
(481, '2015-12-19 00:00:00', 1, 1, '2013-11-21 00:00:00', 6, 47, 1000, 'diesal', -1, 18),
(482, '2015-12-19 00:00:00', 1, 1, '2013-11-21 00:00:00', 7, 49, 5700, 'patiya chirai', -1, 18),
(483, '2015-12-19 00:00:00', 1, 1, '2013-11-25 00:00:00', 1, 5, 1000, 'parmanand advance', -1, 10),
(484, '2015-12-19 00:00:00', 1, 1, '2013-11-27 00:00:00', 6, 35, 10000, 'subash', -1, 18),
(485, '2015-12-19 00:00:00', 1, 1, '2013-11-27 00:00:00', 6, 35, 500, 'driver', -1, 18),
(486, '2015-12-19 00:00:00', 1, 1, '2013-11-27 00:00:00', 3, 23, 450, 'lylone string 4 pair', -1, 18),
(487, '2015-12-19 00:00:00', 1, 1, '2013-11-28 00:00:00', 7, 44, 6000, '', -1, 36),
(488, '2015-12-19 00:00:00', 1, 1, '2013-11-28 00:00:00', 1, 3, 11510, '22 to 28', -1, 1),
(489, '2015-12-19 00:00:00', 1, 1, '2013-11-28 00:00:00', 2, 13, 300, '', -1, 18),
(490, '2015-12-19 00:00:00', 1, 1, '2013-11-28 00:00:00', 1, 4, 700, '', -1, 13),
(491, '2015-12-19 00:00:00', 1, 1, '2013-11-28 00:00:00', 7, 48, 100000, '', -1, 37),
(492, '2015-12-19 00:00:00', 1, 1, '2013-11-30 00:00:00', 7, 48, 100000, '', -1, 37),
(493, '2015-12-19 00:00:00', 1, 1, '2013-11-30 00:00:00', 7, 44, 6000, '', -1, 36),
(494, '2015-12-19 00:00:00', 1, 1, '2013-11-30 00:00:00', 1, 4, 15200, '', -1, 18),
(495, '2015-12-19 00:00:00', 1, 1, '2013-12-06 00:00:00', 1, 3, 17200, '30.11 to 6.12', -1, 1),
(496, '2015-12-19 00:00:00', 1, 1, '2013-12-06 00:00:00', 3, 23, 210, '', -1, 12),
(497, '2015-12-19 00:00:00', 1, 1, '2013-12-06 00:00:00', 6, 50, 300, 'khilan', -1, 18),
(498, '2015-12-19 00:00:00', 1, 1, '2013-12-09 00:00:00', 6, 35, 40000, 'subash', -1, 18),
(499, '2015-12-19 00:00:00', 1, 1, '2013-12-09 00:00:00', 1, 5, 10500, 'parmanand advance', -1, 10),
(500, '2015-12-19 00:00:00', 1, 1, '2013-12-10 00:00:00', 7, 30, 32000, '2 dumphar shankar lambardar', -1, 18),
(501, '2015-12-19 00:00:00', 1, 1, '2013-12-11 00:00:00', 7, 30, 15800, '', -1, 18),
(502, '2015-12-19 00:00:00', 1, 1, '2013-12-11 00:00:00', 6, 47, 680, 'thela repair', -1, 18),
(503, '2015-12-19 00:00:00', 1, 1, '2013-12-11 00:00:00', 7, 44, 13750, '', -1, 36),
(504, '2015-12-19 00:00:00', 1, 1, '2013-12-12 00:00:00', 6, 47, 1235, 'tasla, fawda etc', -1, 18),
(505, '2015-12-19 00:00:00', 1, 1, '2013-12-13 00:00:00', 2, 14, 4725, '', -1, 24),
(506, '2015-12-19 00:00:00', 1, 1, '2013-12-13 00:00:00', 1, 3, 23230, '7.12 to 13.12', -1, 1),
(507, '2015-12-19 00:00:00', 1, 1, '2013-12-13 00:00:00', 6, 50, 1500, 'khilan', -1, 18),
(508, '2015-12-19 00:00:00', 1, 1, '2013-12-20 00:00:00', 7, 44, 12000, '', -1, 36),
(509, '2015-12-19 00:00:00', 1, 1, '2013-12-20 00:00:00', 7, 45, 10000, 'nirbhay', -1, 18),
(510, '2015-12-19 00:00:00', 1, 1, '2013-12-21 00:00:00', 1, 3, 20930, '15 to 21', -1, 1),
(511, '2015-12-19 00:00:00', 1, 1, '2013-12-21 00:00:00', 6, 50, 375, '', -1, 18),
(512, '2015-12-19 00:00:00', 1, 1, '2013-12-21 00:00:00', 2, 14, 1800, '', -1, 24),
(513, '2015-12-19 00:00:00', 1, 1, '2013-12-21 00:00:00', 6, 47, 400, '', -1, 18),
(514, '2015-12-19 00:00:00', 1, 1, '2013-12-23 00:00:00', 7, 46, 37300, '', -1, 38),
(515, '2015-12-19 00:00:00', 1, 1, '2013-12-24 00:00:00', 7, 39, 25200, '1 truck sand, 1 truck gitty and other', -1, 18),
(516, '2015-12-19 00:00:00', 1, 1, '2013-12-30 00:00:00', 10, 43, 720, 'CFL, stationary etc.', -1, 18),
(517, '2015-12-19 00:00:00', 1, 1, '2013-12-31 00:00:00', 7, 44, 12000, '', -1, 36),
(518, '2015-12-19 00:00:00', 1, 1, '2013-12-31 00:00:00', 1, 3, 42090, '22 to 31 Dec', -1, 1),
(519, '2015-12-19 00:00:00', 1, 1, '2013-12-31 00:00:00', 6, 50, 2625, 'khilan', -1, 18),
(520, '2015-12-19 00:00:00', 1, 1, '2013-12-31 00:00:00', 1, 65, 11000, 'lakhan patel', -1, 18),
(521, '2015-12-19 00:00:00', 1, 1, '2013-12-31 00:00:00', 2, 14, 1500, '', -1, 24),
(522, '2015-12-19 00:00:00', 1, 1, '2013-12-31 00:00:00', 1, 65, 14000, 'supervisor and security for Dec ', -1, 18),
(523, '2015-12-19 00:00:00', 1, 1, '2014-01-03 00:00:00', 4, 33, 250000, 'registration of bandhak patra', -1, 18),
(524, '2015-12-19 00:00:00', 1, 1, '2014-01-08 00:00:00', 1, 3, 31035, '2 to 8', -1, 1);
INSERT INTO `kalp_project_exp_details` (`id`, `when_created`, `project_id`, `subproject_id`, `expense_date`, `category_id`, `subcategory_id`, `amount`, `remark`, `per_unit_cost`, `beneficiary_id`) VALUES
(525, '2015-12-19 00:00:00', 1, 1, '2014-01-08 00:00:00', 4, 25, 10000, 'registration of bandhak patra', -1, 18),
(526, '2015-12-19 00:00:00', 1, 1, '2014-01-08 00:00:00', 1, 4, 6000, '', -1, 12),
(527, '2015-12-19 00:00:00', 1, 1, '2014-01-08 00:00:00', 1, 4, 6000, '', -1, 13),
(528, '2015-12-19 00:00:00', 1, 1, '2014-01-08 00:00:00', 6, 50, 3750, 'khilan', -1, 18),
(529, '2015-12-19 00:00:00', 1, 1, '2014-01-08 00:00:00', 2, 14, 500, '', -1, 24),
(530, '2015-12-19 00:00:00', 1, 1, '2014-01-09 00:00:00', 7, 30, 26500, '', -1, 18),
(531, '2015-12-19 00:00:00', 1, 1, '2014-01-09 00:00:00', 7, 30, 16000, 'shankar uncle', -1, 18),
(532, '2015-12-19 00:00:00', 1, 1, '2014-01-10 00:00:00', 7, 45, 9200, 'shankar uncle', -1, 18),
(533, '2015-12-19 00:00:00', 1, 1, '2014-01-11 00:00:00', 7, 45, 5000, '', -1, 18),
(534, '2015-12-19 00:00:00', 1, 1, '2014-01-10 00:00:00', 3, 23, 1900, 'misc', -1, 12),
(535, '2015-12-21 00:00:00', 1, 1, '2014-01-13 00:00:00', 1, 3, 19925, '9 to 13', -1, 1),
(536, '2015-12-21 00:00:00', 1, 1, '2014-01-14 00:00:00', 7, 30, 32000, 'tralla', -1, 18),
(537, '2015-12-21 00:00:00', 1, 1, '2014-01-16 00:00:00', 10, 70, 2125, '', -1, 18),
(538, '2015-12-21 00:00:00', 1, 1, '2014-01-16 00:00:00', 4, 25, 1000, 'patwari prativedan', -1, 18),
(539, '2015-12-21 00:00:00', 1, 1, '2014-01-16 00:00:00', 1, 4, 580, 'petrol', -1, 13),
(540, '2015-12-21 00:00:00', 1, 1, '2014-01-19 00:00:00', 3, 23, 2000, '', -1, 18),
(541, '2015-12-21 00:00:00', 1, 1, '2014-01-21 00:00:00', 6, 35, 8400, 'diesal, driver etc.', -1, 18),
(542, '2015-12-21 00:00:00', 1, 1, '2014-01-21 00:00:00', 4, 25, 1000, '', -1, 18),
(543, '2015-12-21 00:00:00', 1, 1, '2014-01-21 00:00:00', 4, 25, 2500, '', -1, 18),
(544, '2015-12-21 00:00:00', 1, 1, '2014-01-22 00:00:00', 7, 44, 6000, '', -1, 36),
(545, '2015-12-21 00:00:00', 1, 1, '2014-01-23 00:00:00', 1, 3, 22240, '16 to 22', -1, 1),
(546, '2015-12-21 00:00:00', 1, 1, '2014-01-23 00:00:00', 2, 14, 2550, '', -1, 24),
(547, '2015-12-21 00:00:00', 1, 1, '2014-01-23 00:00:00', 1, 4, 500, '', -1, 12);

-- --------------------------------------------------------

--
-- Table structure for table `kalp_subprojects`
--

CREATE TABLE IF NOT EXISTS `kalp_subprojects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subproject_name` varchar(100) NOT NULL,
  `subproject_desc` varchar(4000) DEFAULT NULL,
  `color_name` varchar(100) DEFAULT NULL,
  `color_code` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `kalp_subprojects`
--

INSERT INTO `kalp_subprojects` (`id`, `subproject_name`, `subproject_desc`, `color_name`, `color_code`) VALUES
(1, 'Colony -- Internal', NULL, 'red', '#ff0000'),
(2, 'Colony -- External', NULL, 'green', '#00ff00'),
(3, 'Houses', NULL, NULL, NULL),
(5, 'Others', NULL, NULL, NULL),
(6, 'Desai -- Personal', 'Expenses on behalf of Desai Brothers.', 'blue', '#0000ff'),
(7, 'Kalpdham internal work', 'Work related to firm.', NULL, NULL),
(8, 'kalpdham -- Employee', 'Work related to employees and partners of firm.', NULL, NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kalp_exp_benef_subcat_map`
--
ALTER TABLE `kalp_exp_benef_subcat_map`
  ADD CONSTRAINT `kalp_exp_benef_subcat_map_fk1` FOREIGN KEY (`beneficiary_id`) REFERENCES `kalp_exp_beneficiary` (`id`),
  ADD CONSTRAINT `kalp_exp_benef_subcat_map_fk2` FOREIGN KEY (`subcategory_id`) REFERENCES `kalp_exp_subcategory` (`id`);

--
-- Constraints for table `kalp_exp_category_stats`
--
ALTER TABLE `kalp_exp_category_stats`
  ADD CONSTRAINT `kalp_exp_category_stats_fk1` FOREIGN KEY (`category_id`) REFERENCES `kalp_exp_category` (`id`);

--
-- Constraints for table `kalp_exp_subcategory`
--
ALTER TABLE `kalp_exp_subcategory`
  ADD CONSTRAINT `kalp_exp_subcategory_fk1` FOREIGN KEY (`category_id`) REFERENCES `kalp_exp_category` (`id`);

--
-- Constraints for table `kalp_exp_subcategory_stats`
--
ALTER TABLE `kalp_exp_subcategory_stats`
  ADD CONSTRAINT `kalp_exp_subcategory_stats_fk1` FOREIGN KEY (`category_id`) REFERENCES `kalp_exp_category` (`id`),
  ADD CONSTRAINT `kalp_exp_subcategory_stats_fk2` FOREIGN KEY (`subcategory_id`) REFERENCES `kalp_exp_subcategory` (`id`);

--
-- Constraints for table `kalp_kb_file`
--
ALTER TABLE `kalp_kb_file`
  ADD CONSTRAINT `kalp_kb_file_fk1` FOREIGN KEY (`parent_id`) REFERENCES `kalp_kb_file` (`id`);

--
-- Constraints for table `kalp_kb_file_child`
--
ALTER TABLE `kalp_kb_file_child`
  ADD CONSTRAINT `kalp_kb_file_child_fk1` FOREIGN KEY (`file_id`) REFERENCES `kalp_kb_file` (`id`),
  ADD CONSTRAINT `kalp_kb_file_child_fk2` FOREIGN KEY (`child_id`) REFERENCES `kalp_kb_file` (`id`);

--
-- Constraints for table `kalp_kb_file_content`
--
ALTER TABLE `kalp_kb_file_content`
  ADD CONSTRAINT `kalp_kb_file_content_fk1` FOREIGN KEY (`file_id`) REFERENCES `kalp_kb_file` (`id`);

--
-- Constraints for table `kalp_kb_linked_files`
--
ALTER TABLE `kalp_kb_linked_files`
  ADD CONSTRAINT `kalp_kb_linked_files_fk1` FOREIGN KEY (`file_id`) REFERENCES `kalp_kb_file` (`id`),
  ADD CONSTRAINT `kalp_kb_linked_files_fk2` FOREIGN KEY (`linked_file_id`) REFERENCES `kalp_kb_file` (`id`);

--
-- Constraints for table `kalp_project_exp_details`
--
ALTER TABLE `kalp_project_exp_details`
  ADD CONSTRAINT `kalp_project_exp_details_fk1` FOREIGN KEY (`project_id`) REFERENCES `kalp_projects` (`id`),
  ADD CONSTRAINT `kalp_project_exp_details_fk2` FOREIGN KEY (`subproject_id`) REFERENCES `kalp_subprojects` (`id`),
  ADD CONSTRAINT `kalp_project_exp_details_fk3` FOREIGN KEY (`category_id`) REFERENCES `kalp_exp_category` (`id`),
  ADD CONSTRAINT `kalp_project_exp_details_fk4` FOREIGN KEY (`subcategory_id`) REFERENCES `kalp_exp_subcategory` (`id`),
  ADD CONSTRAINT `kalp_project_exp_details_fk5` FOREIGN KEY (`beneficiary_id`) REFERENCES `kalp_exp_beneficiary` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

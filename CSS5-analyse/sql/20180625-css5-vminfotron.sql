-- phpMyAdmin SQL Dump
-- version 3.5.2
-- http://www.phpmyadmin.net
--
-- Client: vminfotron-dev.ird.fr
-- Généré le: Lun 25 Juin 2018 à 09:53
-- Version du serveur: 5.0.77
-- Version de PHP: 5.3.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `20171004-css5`
--

-- --------------------------------------------------------

--
-- Structure de la table `information`
--

CREATE TABLE IF NOT EXISTS `information` (
  `idInformation` int(11) NOT NULL auto_increment,
  `uniqueTag` varchar(20) default '',
  `idRef_Dimension` int(11) default NULL,
  `title` varchar(200) NOT NULL default '',
  `subtitle` varchar(200) default '',
  `idRef_Source` int(11) default NULL,
  `idRef_Author` int(11) default NULL,
  `entryDate` date default NULL,
  `shortDescription` longtext,
  `idRef_Misc1` int(11) default NULL,
  PRIMARY KEY  (`idInformation`),
  UNIQUE KEY `idInformation_2` (`uniqueTag`),
  KEY `numsource` (`idRef_Source`),
  KEY `numauteur` (`idRef_Author`),
  KEY `numdimension` (`idRef_Dimension`),
  KEY `idRef_Misc1` (`idRef_Misc1`),
  KEY `idInformation` (`uniqueTag`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Contenu de la table `information`
--

INSERT INTO `information` (`idInformation`, `uniqueTag`, `idRef_Dimension`, `title`, `subtitle`, `idRef_Source`, `idRef_Author`, `entryDate`, `shortDescription`, `idRef_Misc1`) VALUES
(1, 'XP-01', 3, 'Integrative approaches combining genomics, transcriptomics and epigenomics', 'study of adaptation mechanisms of tropical trees/forests to environmental variations', 1, 2, '2018-01-19', 'More specifically, design and calibrate empirically the models of evolution to explain and\r\npredict the future of tropical species to global changes.\r\nThe Link to UMR DIADE is provided for any convenience.', NULL),
(2, 'XP-02', 3, 'Reconciling exploitation and conservation of tropical pelagic ecosystems', 'Derivation of alternative abundance indicators coupling operational models with fishery independant data', 2, 3, '2017-12-29', 'The current research is entitled: \r\n"Reconciling exploitation and conservation of tropical pelagic ecosystems:\r\nDerivation of alternative abundance indicators coupling operational\r\nmodels and data independent of the fishery\r\n\r\n(Concilier exploitation et conservation des écosystèmes pélagiques tropicaux : \r\nDérivation d’indicateurs d’abondance alternatifs couplant modèles opérationnels \r\net données indépendantes de la pêche)', NULL),
(3, 'XP-03', 3, 'Evolution of the water cycle within the intertropical band', ' using hyper-resolved modeling of the critical zone', 3, 4, '2017-10-27', 'Software link : PyGrav  (processing of micro-gravity data)', NULL),
(4, 'XP-04', 4, 'Integrated modelling of marine socio-ecosystems', 'and scenarios of adaptation to climate change', 2, 5, '2017-11-24', 'doi: APECOSM model description\r\nweb-link: Globec-Cliotop program home page', NULL),
(5, 'XP-05', 3, 'Accelerating malaria eradication in West Africa', 'identification, characterization and treatment of persistence foci', 4, 6, '2018-01-18', 'Links below are provided for any convenience :\r\n\r\n- institution: UMR SESSTIM\r\n- web-link: UN Sustainable Development Goal 3: Ensure healthy lives and promote well-being for all at all ages', NULL),
(6, 'XP-06', 3, 'Applied meta-acoustics for biological conservation within southern countries', 'ecological study and conservation tool based on sound environments collections (soundscape ecology)', 5, 7, '2017-11-12', '- institution: access to UMR IMBE\r\n- DOI article: soundscape ecology in an insular biodiversity hot spot', NULL),
(7, 'XP-07', 3, 'Spatial agro-hydrology; satellite data mining and assimilation', 'modeling and predicting interactions between agriculture and water resources', 6, 8, '2018-02-06', 'web-link: the CNES European Copernicus satellites program.', NULL),
(8, 'XP-08', 4, 'Screening, prevention and control of major endemics in developing countries', 'Direction in Tropical Health Research / Herpetologist', 7, 9, '2018-05-14', 'Personal home page from Futura-Sciences.com\r\nBooks from the Amazon.com library', NULL),
(9, 'XP-09', 4, 'Geostatistics for Ecosystem Approach to Fisheries', 'A study of movements and trajectories', 2, 10, '2018-06-07', 'Web-link AFH: Association Française d''Halieutique / French Association for fisheries Sciences\r\nWeb-link SFDS: Société Française de Statistique / French Society for Statistics', NULL),
(10, 'XP-10', 3, 'Hydrosystems and water resources modelling', 'Integrated approach to vulnerable water resources  under changes and uncertainty', 8, 11, '2018-06-13', 'Web-link: the GICC program (Management and impact of climate change)', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `info_access`
--

CREATE TABLE IF NOT EXISTS `info_access` (
  `id` int(11) NOT NULL auto_increment,
  `idInformation` int(11) NOT NULL,
  `nbAccess` int(11) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `idInformation` (`idInformation`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Contenu de la table `info_access`
--

INSERT INTO `info_access` (`id`, `idInformation`, `nbAccess`) VALUES
(1, 1, 52),
(2, 2, 36),
(3, 3, 44),
(4, 4, 35),
(5, 5, 38),
(6, 6, 28),
(7, 7, 54),
(8, 8, 123),
(9, 9, 26),
(10, 10, 17);

-- --------------------------------------------------------

--
-- Structure de la table `info_keyword`
--

CREATE TABLE IF NOT EXISTS `info_keyword` (
  `id` int(11) NOT NULL auto_increment,
  `idInformation` int(11) NOT NULL,
  `idRef_Keyword` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `idInformation_2` (`idInformation`,`idRef_Keyword`),
  KEY `idInformation` (`idInformation`,`idRef_Keyword`),
  KEY `idRef_Keyword` (`idRef_Keyword`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=266 ;

--
-- Contenu de la table `info_keyword`
--

INSERT INTO `info_keyword` (`id`, `idInformation`, `idRef_Keyword`) VALUES
(6, 1, 1),
(4, 1, 2),
(2, 1, 3),
(1, 1, 4),
(10, 1, 5),
(8, 1, 6),
(5, 1, 7),
(7, 1, 8),
(9, 1, 9),
(11, 1, 10),
(12, 1, 11),
(14, 1, 12),
(3, 1, 13),
(13, 1, 14),
(31, 1, 31),
(32, 1, 32),
(33, 1, 33),
(22, 2, 15),
(15, 2, 16),
(17, 2, 17),
(23, 2, 18),
(16, 2, 19),
(63, 2, 20),
(19, 2, 21),
(20, 2, 22),
(25, 2, 25),
(27, 2, 26),
(26, 2, 27),
(28, 2, 28),
(29, 2, 29),
(37, 2, 35),
(36, 2, 36),
(62, 2, 37),
(40, 2, 38),
(39, 2, 39),
(61, 2, 57),
(64, 2, 58),
(132, 2, 113),
(194, 2, 150),
(50, 3, 18),
(57, 3, 40),
(52, 3, 41),
(41, 3, 42),
(55, 3, 43),
(47, 3, 44),
(54, 3, 45),
(45, 3, 46),
(51, 3, 47),
(49, 3, 48),
(53, 3, 49),
(43, 3, 50),
(42, 3, 51),
(56, 3, 52),
(44, 3, 53),
(46, 3, 54),
(48, 3, 55),
(60, 3, 56),
(65, 3, 59),
(68, 4, 8),
(66, 4, 15),
(70, 4, 18),
(71, 4, 20),
(73, 4, 25),
(155, 4, 31),
(72, 4, 38),
(67, 4, 48),
(81, 4, 52),
(69, 4, 57),
(74, 4, 60),
(75, 4, 61),
(76, 4, 62),
(77, 4, 63),
(78, 4, 64),
(79, 4, 65),
(80, 4, 67),
(82, 4, 68),
(83, 4, 69),
(84, 4, 70),
(85, 4, 71),
(86, 4, 72),
(95, 4, 73),
(87, 4, 74),
(88, 4, 75),
(136, 4, 76),
(91, 4, 77),
(89, 4, 78),
(90, 4, 79),
(135, 4, 80),
(92, 4, 81),
(93, 4, 82),
(94, 4, 83),
(195, 4, 150),
(114, 5, 36),
(96, 5, 45),
(97, 5, 85),
(99, 5, 86),
(100, 5, 87),
(104, 5, 88),
(102, 5, 89),
(105, 5, 90),
(103, 5, 91),
(101, 5, 92),
(106, 5, 93),
(107, 5, 94),
(108, 5, 95),
(109, 5, 96),
(110, 5, 97),
(111, 5, 98),
(112, 5, 99),
(115, 5, 100),
(113, 5, 101),
(116, 5, 102),
(117, 5, 103),
(158, 5, 127),
(119, 6, 2),
(118, 6, 16),
(120, 6, 104),
(121, 6, 105),
(122, 6, 106),
(123, 6, 107),
(124, 6, 108),
(130, 6, 109),
(125, 6, 110),
(133, 6, 111),
(127, 6, 112),
(126, 6, 113),
(128, 6, 114),
(129, 6, 115),
(131, 6, 116),
(134, 6, 117),
(159, 7, 8),
(141, 7, 18),
(148, 7, 44),
(160, 7, 48),
(145, 7, 49),
(143, 7, 52),
(137, 7, 53),
(139, 7, 54),
(140, 7, 55),
(142, 7, 78),
(147, 7, 82),
(138, 7, 102),
(144, 7, 115),
(146, 7, 118),
(154, 7, 119),
(150, 7, 120),
(151, 7, 121),
(149, 7, 122),
(152, 7, 123),
(153, 7, 124),
(156, 7, 125),
(157, 7, 126),
(196, 7, 151),
(192, 8, 8),
(180, 8, 31),
(168, 8, 42),
(182, 8, 45),
(164, 8, 89),
(171, 8, 90),
(184, 8, 92),
(170, 8, 94),
(161, 8, 98),
(183, 8, 99),
(162, 8, 128),
(165, 8, 130),
(166, 8, 131),
(167, 8, 132),
(190, 8, 133),
(179, 8, 134),
(173, 8, 136),
(174, 8, 137),
(175, 8, 138),
(176, 8, 139),
(177, 8, 140),
(178, 8, 141),
(185, 8, 143),
(188, 8, 144),
(186, 8, 145),
(191, 8, 146),
(187, 8, 147),
(189, 8, 148),
(193, 8, 149),
(200, 9, 3),
(199, 9, 4),
(206, 9, 15),
(211, 9, 18),
(231, 9, 19),
(213, 9, 20),
(221, 9, 25),
(201, 9, 27),
(212, 9, 31),
(219, 9, 38),
(202, 9, 57),
(216, 9, 60),
(214, 9, 61),
(209, 9, 62),
(203, 9, 63),
(204, 9, 64),
(217, 9, 67),
(220, 9, 70),
(205, 9, 71),
(208, 9, 73),
(218, 9, 76),
(210, 9, 78),
(207, 9, 83),
(215, 9, 115),
(198, 9, 116),
(197, 9, 127),
(234, 9, 150),
(222, 9, 151),
(223, 9, 152),
(224, 9, 153),
(225, 9, 154),
(226, 9, 155),
(227, 9, 156),
(228, 9, 157),
(229, 9, 158),
(230, 9, 159),
(232, 9, 160),
(233, 9, 161),
(241, 10, 8),
(245, 10, 18),
(246, 10, 31),
(242, 10, 36),
(248, 10, 39),
(262, 10, 41),
(238, 10, 44),
(254, 10, 45),
(240, 10, 48),
(253, 10, 49),
(247, 10, 52),
(239, 10, 54),
(236, 10, 68),
(251, 10, 72),
(244, 10, 82),
(243, 10, 100),
(235, 10, 101),
(250, 10, 115),
(237, 10, 121),
(252, 10, 124),
(263, 10, 138),
(255, 10, 162),
(256, 10, 163),
(257, 10, 164),
(258, 10, 165),
(259, 10, 166),
(260, 10, 167),
(261, 10, 168),
(264, 10, 169),
(265, 10, 170);

-- --------------------------------------------------------

--
-- Structure de la table `info_link`
--

CREATE TABLE IF NOT EXISTS `info_link` (
  `id` int(11) NOT NULL auto_increment,
  `idInformation1` int(11) NOT NULL,
  `idInformation2` int(11) NOT NULL,
  `linkWeight` int(11) default NULL,
  `initialWeight` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `idInformation1` (`idInformation1`,`idInformation2`),
  KEY `infolinktoinformation2` (`idInformation2`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=119 ;

--
-- Contenu de la table `info_link`
--

INSERT INTO `info_link` (`id`, `idInformation1`, `idInformation2`, `linkWeight`, `initialWeight`) VALUES
(14, 2, 4, 17, 10),
(22, 5, 2, 5, 3),
(28, 6, 2, 10, 6),
(37, 4, 7, 12, 10),
(40, 3, 7, 23, 10),
(45, 7, 5, 10, 5),
(47, 1, 7, 14, 5),
(48, 5, 1, 3, 0),
(49, 7, 2, 7, 0),
(50, 2, 1, 8, 0),
(51, 1, 4, 8, 0),
(52, 4, 3, 3, 0),
(53, 7, 1, 6, 0),
(54, 1, 1, 8, 0),
(55, 7, 7, 11, 0),
(56, 4, 6, 3, 0),
(57, 4, 2, 4, 0),
(58, 2, 5, 3, 0),
(59, 6, 3, 4, 0),
(60, 3, 5, 3, 0),
(61, 5, 3, 3, 0),
(62, 3, 3, 14, 0),
(63, 7, 3, 5, 0),
(64, 4, 5, 3, 0),
(65, 5, 6, 4, 0),
(66, 6, 6, 3, 0),
(67, 6, 1, 5, 0),
(68, 1, 5, 3, 0),
(69, 3, 1, 4, 0),
(70, 7, 4, 3, 0),
(71, 2, 2, 4, 0),
(72, 5, 7, 2, 0),
(73, 4, 8, 4, 0),
(74, 8, 8, 73, 0),
(75, 8, 5, 15, 0),
(76, 5, 8, 17, 0),
(77, 5, 5, 1, 0),
(78, 8, 6, 3, 0),
(79, 6, 8, 4, 0),
(80, 8, 7, 7, 0),
(81, 2, 8, 5, 0),
(82, 7, 8, 5, 0),
(83, 8, 4, 5, 0),
(84, 8, 2, 4, 0),
(85, 1, 2, 5, 0),
(86, 1, 8, 2, 0),
(87, 8, 1, 6, 0),
(88, 1, 6, 5, 0),
(89, 4, 1, 6, 0),
(90, 2, 7, 2, 0),
(91, 7, 6, 2, 0),
(92, 3, 2, 2, 0),
(93, 8, 3, 1, 0),
(94, 3, 6, 3, 0),
(95, 6, 7, 2, 0),
(96, 1, 3, 3, 0),
(97, 6, 5, 1, 0),
(98, 5, 4, 3, 0),
(99, 2, 3, 2, 0),
(100, 2, 6, 2, 0),
(101, 3, 4, 1, 0),
(102, 4, 4, 3, 0),
(103, 4, 9, 1, 0),
(104, 9, 9, 17, 0),
(105, 9, 8, 2, 0),
(106, 8, 9, 1, 0),
(107, 9, 1, 1, 0),
(108, 5, 9, 1, 0),
(109, 6, 9, 1, 0),
(110, 1, 9, 1, 0),
(111, 9, 4, 1, 0),
(112, 6, 10, 1, 0),
(113, 10, 10, 10, 0),
(114, 10, 3, 15, 0),
(115, 7, 10, 14, 0),
(116, 3, 10, 1, 0),
(117, 10, 1, 1, 0),
(118, 1, 10, 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `info_medium`
--

CREATE TABLE IF NOT EXISTS `info_medium` (
  `id` int(11) NOT NULL auto_increment,
  `idInformation` int(11) NOT NULL,
  `idRef_Medium` int(11) NOT NULL,
  `fileName` varchar(200) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `idInformation` (`idInformation`,`idRef_Medium`,`fileName`),
  KEY `idinfo` (`idInformation`),
  KEY `idsupport` (`idRef_Medium`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=61 ;

--
-- Contenu de la table `info_medium`
--

INSERT INTO `info_medium` (`id`, `idInformation`, `idRef_Medium`, `fileName`) VALUES
(1, 1, 1, 'http://louisebrousseau.wixsite.com/louisebrousseau'),
(2, 1, 2, 'https://www.researchgate.net/profile/Louise_Brousseau'),
(3, 1, 5, 'http://orcid.org/0000-0003-2769-2767'),
(5, 1, 6, 'mailto:louise.brousseau@ird.fr'),
(6, 1, 7, 'http://www.diade-research.fr/en/'),
(8, 2, 2, 'https://www.researchgate.net/profile/Manuela_Capello'),
(7, 2, 4, 'http://apps.webofknowledge.com/Search.do?product=WOS&SID=D6E8WO7bEWwwMQnJSzr&search_mode=GeneralSearch&prID=0a99be0d-4505-4524-907a-0b58e3d340fa'),
(10, 2, 6, 'mailto:manuela.capello@ird.fr'),
(9, 2, 7, 'http://www.umr-marbec.fr/en/?lang=en'),
(11, 3, 1, 'https://basilehector.jimdo.com/'),
(15, 3, 2, 'https://www.researchgate.net/profile/Basile_Hector'),
(12, 3, 5, 'http://orcid.org/0000-0003-2619-5435'),
(14, 3, 6, 'mailto:hector.basile@ird.fr'),
(13, 3, 8, 'http://basileh.github.io/pyGrav/'),
(16, 4, 2, 'https://www.researchgate.net/profile/Olivier_Maury2'),
(19, 4, 4, 'http://apps.webofknowledge.com/Search.do?product=WOS&SID=D6E8WO7bEWwwMQnJSzr&search_mode=GeneralSearch&prID=f9dd203b-2058-4835-a275-9c44f37c689d'),
(20, 4, 5, 'http://orcid.org/0000-0002-7999-9982'),
(17, 4, 6, 'mailto:olivier.maury@ird.fr'),
(21, 4, 9, 'http://www.sciencedirect.com/science/article/pii/S0079661109001463'),
(22, 4, 10, 'http://www.globec.org/index.php?id=62'),
(25, 5, 2, 'https://www.researchgate.net/profile/Jordi_Landier2'),
(24, 5, 5, 'https://orcid.org/0000-0001-8619-9775'),
(26, 5, 6, 'mailto:jordi.landier@ird.fr'),
(38, 5, 7, 'https://sesstim.univ-amu.fr/page/sesstim'),
(23, 5, 10, 'http://www.un.org/sustainabledevelopment/health/'),
(28, 6, 2, 'https://www.researchgate.net/profile/Amandine_Gasc'),
(29, 6, 6, 'mailto:amandine.gasc@ird.fr'),
(31, 6, 7, 'https://www.imbe.fr/l-institut.html?lang=en'),
(30, 6, 9, 'https://link.springer.com/article/10.1007%2Fs10530-017-1612-0'),
(35, 7, 2, 'https://www.researchgate.net/profile/Sylvain_Ferrant'),
(33, 7, 5, 'http://orcid.org/0000-0002-3478-2624'),
(34, 7, 6, 'mailto:sylvain.ferrant@ird.fr'),
(32, 7, 7, 'http://www.cesbio.ups-tlse.fr/index_us.htm'),
(37, 7, 10, 'https://copernicus.cnes.fr/en/copernicus-0'),
(41, 8, 1, 'https://www.futura-sciences.com/sante/personnalites/vie-jean-philippe-chippaux-267/'),
(40, 8, 3, 'http://www.documentation.ird.fr/hor/CHIPPAUX,JEAN-PHILIPPE/tout?pres=TY'),
(39, 8, 7, 'http://www.umr216.fr/'),
(44, 8, 11, 'https://www.amazon.fr/Livres-Jean-Philippe-Chippaux/s?ie=UTF8&page=1&rh=n%3A301061%2Cp_27%3AJean-Philippe%20Chippaux'),
(45, 9, 1, 'http://www.umr-marbec.fr/bez-nicolas.html'),
(46, 9, 3, 'http://www.documentation.ird.fr/hor/BEZ,NICOLAS/tout?pres=TY'),
(47, 9, 6, 'mailto:nicolas.bez@ird.fr'),
(51, 9, 7, 'http://www.umr-marbec.fr/en/?lang=en'),
(49, 9, 12, 'https://www.association-francaise-halieutique.fr/'),
(50, 9, 13, 'https://www.sfds.asso.fr/'),
(59, 10, 2, 'https://www.researchgate.net/profile/Alain_Dezetter'),
(53, 10, 4, 'http://www.researcherid.com/ProfileView.action?returnCode=ROUTER.Success&Init=Yes&SrcApp=CR&queryString=KG0UuZjN5WnwT1uZoHspzSuZFdOpPqbNSNY8PRPSpyk%253D&SID=D1rR3vEtqlzWc7xbkhY'),
(60, 10, 5, 'https://orcid.org/0000-0003-3728-0467'),
(56, 10, 6, 'mailto:alain.dezetter@ird.fr'),
(58, 10, 10, 'http://www.gip-ecofor.org/gicc/?q=en');

-- --------------------------------------------------------

--
-- Structure de la table `info_misc2`
--

CREATE TABLE IF NOT EXISTS `info_misc2` (
  `id` int(11) NOT NULL auto_increment,
  `idInformation` int(11) NOT NULL,
  `idRef_Misc2` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `idInformation_2` (`idInformation`,`idRef_Misc2`),
  KEY `idRef_Misc2` (`idRef_Misc2`),
  KEY `idInformation` (`idInformation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `ref_author`
--

CREATE TABLE IF NOT EXISTS `ref_author` (
  `idRef_Author` int(11) NOT NULL auto_increment,
  `initials` varchar(50) NOT NULL,
  `fullName` varchar(80) NOT NULL,
  PRIMARY KEY  (`idRef_Author`),
  UNIQUE KEY `initials` (`initials`),
  UNIQUE KEY `fullName` (`fullName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Contenu de la table `ref_author`
--

INSERT INTO `ref_author` (`idRef_Author`, `initials`, `fullName`) VALUES
(2, 'L.Brousseau', 'BROUSSEAU, Louise'),
(3, 'M.Capello', 'CAPELLO, Manuela'),
(4, 'B.Hector', 'HECTOR, Basile'),
(5, 'O.Maury', 'MAURY, Olivier'),
(6, 'J.Landier', 'LANDIER, Jordi'),
(7, 'A.Gasc', 'GASC, Amandine'),
(8, 'S.Ferrant', 'FERRANT, Sylvain'),
(9, 'J.-P. Chippaux', 'CHIPPAUX, Jean-Philippe'),
(10, 'N. Bez', 'BEZ, Nicolas'),
(11, 'A. Dezetter', 'DEZETTER, Alain');

-- --------------------------------------------------------

--
-- Structure de la table `ref_dimension`
--

CREATE TABLE IF NOT EXISTS `ref_dimension` (
  `idRef_Dimension` int(11) NOT NULL auto_increment,
  `dimensionName` varchar(50) NOT NULL,
  PRIMARY KEY  (`idRef_Dimension`),
  UNIQUE KEY `dimension` (`dimensionName`),
  KEY `id` (`idRef_Dimension`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `ref_dimension`
--

INSERT INTO `ref_dimension` (`idRef_Dimension`, `dimensionName`) VALUES
(3, 'PhD scientist'),
(4, 'senior scientist');

-- --------------------------------------------------------

--
-- Structure de la table `ref_keyword`
--

CREATE TABLE IF NOT EXISTS `ref_keyword` (
  `idRef_Keyword` int(11) NOT NULL auto_increment,
  `keywordName` varchar(80) NOT NULL,
  `idRef_MetaKeyword` int(11) NOT NULL,
  `optionalDescription` varchar(250) default NULL,
  PRIMARY KEY  (`idRef_Keyword`),
  UNIQUE KEY `groupe` (`keywordName`),
  KEY `idcomposant` (`idRef_MetaKeyword`),
  KEY `id` (`idRef_Keyword`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=171 ;

--
-- Contenu de la table `ref_keyword`
--

INSERT INTO `ref_keyword` (`idRef_Keyword`, `keywordName`, `idRef_MetaKeyword`, `optionalDescription`) VALUES
(1, 'genomics', 1, ''),
(2, 'Ecology (evolutionary)', 12, ''),
(3, 'biostatistics', 1, ''),
(4, 'bayesian modelling', 2, ''),
(5, 'NGS (Next Generation Sequencing)', 2, ''),
(6, 'local adaptation', 3, ''),
(7, 'tropical rain forest', 4, ''),
(8, 'integrative approach', 5, ''),
(9, 'natural selection', 3, ''),
(10, 'phenotype', 9, ''),
(11, 'plasticity', 3, ''),
(12, 'UMR Diade (plant DIversity Adapt. & DEv.)', 6, ''),
(13, 'Coffea_mauritiana', 7, ''),
(14, 'The Reunion Island', 8, ''),
(15, 'Fisheries science', 12, ''),
(16, 'Ecology (behavioural)', 12, ''),
(17, 'complex system', 9, ''),
(18, 'MODELLING', 1, ''),
(19, 'EAF (Ecosystem Approach to Fisheries)', 5, ''),
(20, 'pelagic fishes', 4, ''),
(21, 'FAD (Fish Aggregating Device)', 10, ''),
(22, 'Monte-Carlo simulation', 11, ''),
(25, 'UMR MARBEC (MARine Biodiversity, Exploitation and Conservation)', 6, ''),
(26, 'electronic tagging', 2, ''),
(27, 'collective behaviour', 3, ''),
(28, 'statistical mechanics', 1, ''),
(29, 'Quantum mechanics', 12, ''),
(31, 'MULTIDISCIPLINARY', 1, ''),
(32, 'transcriptomics', 1, ''),
(33, 'epigenomics', 1, ''),
(35, 'Maldives', 8, ''),
(36, 'Ivory Coast', 8, ''),
(37, 'Brazil', 8, ''),
(38, 'tropical pelagic ecosystem', 9, ''),
(39, 'operational model', 16, ''),
(40, 'non linear dynamics', 11, ''),
(41, 'SDG 06 (Sust. Devel. Goal - Water and sanitation)', 14, 'UN Sustainable Development Goal'),
(42, 'Benin', 8, ''),
(43, 'geophysics', 1, 'see https://www.sciencedirect.com/science/article/pii/S1355219800000186'),
(44, 'Hydrology', 12, ''),
(45, 'West Africa', 8, ''),
(46, 'hydro-gravimetry', 1, ''),
(47, 'PyGrav (processing of micro-gravity data)', 15, 'http://basileh.github.io/pyGrav/'),
(48, 'integrated modelling', 5, ''),
(49, 'water resources', 4, ''),
(50, 'gravimetric data', 16, ''),
(51, 'critical zone', 4, 'Earth''s outer skin'),
(52, 'numerical model', 16, ''),
(53, 'data mining', 11, ''),
(54, 'hydro-system', 4, ''),
(55, 'hyper-resolved modelling', 11, ''),
(56, 'UMR IGE (Inst. Geosci. Environ. res.)', 6, ''),
(57, 'Ecology (marine)', 12, ''),
(58, 'South Western Indian ocean', 8, ''),
(59, 'Sahel', 8, ''),
(60, 'spatial dynamics', 9, ''),
(61, 'population dynamics', 5, ''),
(62, 'marine ecosystem', 9, ''),
(63, 'ecosystem dynamics', 9, ''),
(64, 'ecosystem processes', 3, ''),
(65, 'functional biodiversity', 9, ''),
(67, 'statistical modelling', 5, ''),
(68, 'climate change impacts', 3, ''),
(69, 'RFMO (Regional fisheries management organisation)', 6, ''),
(70, 'tuna fisheries', 4, ''),
(71, 'fisheries management', 3, ''),
(72, 'socio-ecological scenarios', 16, ''),
(73, 'Indian ocean', 8, ''),
(74, 'South Africa', 8, ''),
(75, 'Seychelles', 8, ''),
(76, 'stock assessment', 2, ''),
(77, 'APECOSM (Apex Predators ECOSystem Model)', 18, ''),
(78, 'multi-scale (spatial)', 5, ''),
(79, 'GLOBEC (Global Ocean Ecosystem Dynamics program)', 6, 'International program'),
(80, 'end-to-end model', 18, ''),
(81, 'marine biodiversity', 3, ''),
(82, 'model coupling', 2, ''),
(83, 'global ocean', 8, ''),
(85, 'Plasmodium_falsiparum', 7, ''),
(86, 'epidemic focus', 4, 'FR: foyer de prévalence'),
(87, 'UMR SESSTIM (Sci. Econ. Soc. Santé  & Traitement Inform. Médic.)', 6, ''),
(88, 'Buruli ulcer', 19, ''),
(89, 'Epidemiology', 12, ''),
(90, 'Cameroon', 8, ''),
(91, 'Myobacterium_ulcerans (bacteria)', 7, ''),
(92, 'SDG 03 (Sust. Devel. Goal - Healthy lives and well-being)', 14, 'UN Sustainable Development Goal'),
(93, 'information system (epidemiologic)', 11, ''),
(94, 'malaria', 19, ''),
(95, 'disease incidence (epidemiology)', 3, ''),
(96, 'prevalence focus (epidemiology)', 3, ''),
(97, 'asymptomatic infection', 9, ''),
(98, 'public health', 9, ''),
(99, 'monitoring and screening (health)', 5, ''),
(100, 'Mali', 8, ''),
(101, 'Burkina-Faso', 8, ''),
(102, 'geomatics', 1, ''),
(103, 'functional regression', 11, ''),
(104, 'SDG 15 (Sust. Devel. Goal - Continental ecosystems)', 14, 'UN Sustainable Development Goal'),
(105, 'UMR IMBE (Medit. Inst. mar. terrestr. Biodiv. Ecol.)', 6, 'Mediterranean Institute of marine and terrestrial Biodiversity and Ecology'),
(106, 'phylogeny', 1, ''),
(107, 'biogeography', 1, ''),
(108, 'acoustic niche hypothesis', 9, ''),
(109, 'acoustic diversity', 9, ''),
(110, 'sound library (fr: sonothèque)', 16, ''),
(111, 'Ecology (soundscape)', 12, ''),
(112, 'biodiversity', 3, ''),
(113, 'biological indicator', 16, ''),
(114, 'big data', 13, ''),
(115, 'remote sensing', 11, ''),
(116, 'animal community', 4, ''),
(117, 'disturbance analysis', 2, ''),
(118, 'UMR CESBIO (Center for the Study of the Biosphere from Space)', 6, ''),
(119, 'spatial agro-hydrology', 1, ''),
(120, 'data assimilation', 11, ''),
(121, 'forecasting', 5, ''),
(122, 'agriculture', 4, ''),
(123, 'South India', 8, ''),
(124, 'water management', 9, ''),
(125, 'environmental monitoring', 5, 'observatoire environnementaux'),
(126, 'agro-hydrological model', 18, ''),
(127, 'aggregation (spatial)', 3, ''),
(128, 'venom', 4, ''),
(130, 'clinical research', 5, ''),
(131, 'tropical endemics', 9, ''),
(132, 'prevention (health)', 5, ''),
(133, 'dracunculiasis (guinea worm disease)', 19, ''),
(134, 'ivermectine (medication)', 16, ''),
(136, 'onchocerciasis (river blindness disease)', 19, ''),
(137, 'Niger country', 8, ''),
(138, 'Senegal', 8, ''),
(139, 'Bolivia', 8, ''),
(140, 'tropical medicine', 1, ''),
(141, 'UMR MERIT (Mother and child face tropical infections)', 6, ''),
(143, 'Serpentes (snakes)', 7, ''),
(144, 'Meningitis', 19, ''),
(145, 'Schistosomiasis (snail fever, bilharzia)', 19, ''),
(146, 'filariasis (parasitic disease)', 19, ''),
(147, 'Medical Entomology', 12, ''),
(148, 'envenoming', 3, ''),
(149, 'IRD-CSS2 (sci. comm. Biol. Medic. Sci.)', 6, ''),
(150, 'SDG 14 (Sust. Devel. Goal - Oceans)', 14, ''),
(151, 'SDG 02 (Sust. Devel. Goal - Alimentation)', 14, ''),
(152, 'echo-integration', 2, 'Acoustic remote sensing'),
(153, 'Atlantic ocean', 8, ''),
(154, 'demersal fish species', 4, ''),
(155, 'forage tracking', 2, ''),
(156, 'geostatistics', 1, ''),
(157, 'mackerel (Scrombidae)', 7, ''),
(158, 'Mediterranean sea', 8, ''),
(159, 'plankton', 4, ''),
(160, 'Ecology (quantitative)', 12, ''),
(161, 'statistics (spatial)', 1, ''),
(162, 'environment', 9, ''),
(163, 'environmental impact assesment', 5, ''),
(164, 'Guadeloupe', 8, ''),
(165, 'image processing', 2, ''),
(166, 'Morocco', 8, ''),
(167, 'parallel and distributed computing', 2, ''),
(168, 'river', 4, ''),
(169, 'simulation', 2, ''),
(170, 'UMR HSM (HydroSciences Montpellier)', 6, '');

-- --------------------------------------------------------

--
-- Structure de la table `ref_medium`
--

CREATE TABLE IF NOT EXISTS `ref_medium` (
  `idRef_Medium` int(11) NOT NULL auto_increment,
  `mediumName` varchar(20) NOT NULL,
  `optionalDescription` varchar(1000) default NULL,
  `iconFileName` varchar(100) NOT NULL,
  PRIMARY KEY  (`idRef_Medium`),
  KEY `type` (`mediumName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Contenu de la table `ref_medium`
--

INSERT INTO `ref_medium` (`idRef_Medium`, `mediumName`, `optionalDescription`, `iconFileName`) VALUES
(1, 'Personal home page', '', 'personne.gif'),
(2, 'Research gate access', '', 'researchgate3.png'),
(3, 'Known production set', '', 'horizons.gif'),
(4, 'Indexed publications', '', 'wos.gif'),
(5, 'ORCID access', '', 'orcid.gif'),
(6, 'email contact', '', 'bmail.gif'),
(7, 'institution', '', 'labo.gif'),
(8, 'software', '', 'software.gif'),
(9, 'article', '', 'doi.gif'),
(10, 'web-link', '', 'webPage.gif'),
(11, 'books', '', 'books.gif'),
(12, 'web-link AFH', 'French Association for fisheries Sciences', 'logo_afh.jpg'),
(13, 'web-link SFDS', 'French Society  for Statistics', 'sfds_logo.png');

-- --------------------------------------------------------

--
-- Structure de la table `ref_metakeyword`
--

CREATE TABLE IF NOT EXISTS `ref_metakeyword` (
  `idRef_MetaKeyword` int(11) NOT NULL auto_increment,
  `metaKeywordName` varchar(50) NOT NULL,
  `optionaldescription` varchar(150) default NULL,
  PRIMARY KEY  (`idRef_MetaKeyword`),
  UNIQUE KEY `composant` (`metaKeywordName`),
  KEY `id` (`idRef_MetaKeyword`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Contenu de la table `ref_metakeyword`
--

INSERT INTO `ref_metakeyword` (`idRef_MetaKeyword`, `metaKeywordName`, `optionaldescription`) VALUES
(1, 'Discipline', ''),
(2, 'Method', ''),
(3, 'Natural Process', ''),
(4, 'Natural Item', ''),
(5, 'Approach', ''),
(6, 'Institution', ''),
(7, 'Taxon', ''),
(8, 'Field Location', ''),
(9, 'Concept', ''),
(10, 'Device', ''),
(11, 'Technique', ''),
(12, 'Science', ''),
(13, '?', ''),
(14, 'SDG (Sust. Dev. Goal) Theme', ''),
(15, 'Software', ''),
(16, 'Tool', ''),
(18, 'Model', ''),
(19, 'illness- disease', '');

-- --------------------------------------------------------

--
-- Structure de la table `ref_misc1`
--

CREATE TABLE IF NOT EXISTS `ref_misc1` (
  `idRef_Misc1` int(11) NOT NULL auto_increment,
  `misc1Name` varchar(255) NOT NULL,
  PRIMARY KEY  (`idRef_Misc1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `ref_misc2`
--

CREATE TABLE IF NOT EXISTS `ref_misc2` (
  `idRef_Misc2` int(11) NOT NULL auto_increment,
  `misc2Name` varchar(255) NOT NULL,
  `optionalDescription` varchar(255) default NULL,
  PRIMARY KEY  (`idRef_Misc2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `ref_source`
--

CREATE TABLE IF NOT EXISTS `ref_source` (
  `idRef_Source` int(11) NOT NULL auto_increment,
  `header` varchar(150) NOT NULL,
  `detail` text,
  PRIMARY KEY  (`idRef_Source`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Contenu de la table `ref_source`
--

INSERT INTO `ref_source` (`idRef_Source`, `header`, `detail`) VALUES
(1, 'UMR DIADE', 'plant DIversity Adaptation and DEvelopment'),
(2, 'UMR MARBEC', 'MARine Biodiversity, Exploitation and Conservation'),
(3, 'UMR IGE', 'Institute for Geosciences and Environmental research'),
(4, 'UMR SESSTIM', 'Sciences Economiques et Sociales de la Santé et Traitement des Informations Médicales'),
(5, 'UMR IMBE', 'Institut  Méditerranéen de la  Biodiversité et d’Ecologie  marine et continentale'),
(6, 'UMR CESBIO', 'Center for the Study of the Biosphere from Space'),
(7, 'UMR MERIT', 'Mère et enfant face aux infections tropicales / Mother and child face tropical infections'),
(8, 'UMR HSM', ' HydroSciences Montpellier');

-- --------------------------------------------------------

--
-- Structure de la table `tempo`
--

CREATE TABLE IF NOT EXISTS `tempo` (
  `id` int(11) NOT NULL auto_increment,
  `idInformation` int(11) NOT NULL,
  `ipNumber` varchar(50) default NULL,
  `dateStamp` varchar(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `idInformation` (`idInformation`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=40 ;

--
-- Contenu de la table `tempo`
--

INSERT INTO `tempo` (`id`, `idInformation`, `ipNumber`, `dateStamp`) VALUES
(1, 8, '127.0.0.1', '5 oct. 2017'),
(2, 2, '147.99.65.12', '6 févr. 2018'),
(3, 1, '147.99.65.5', '9 févr. 2018'),
(4, 5, '2.4.165.155', '10 févr. 2018'),
(5, 7, '194.254.211.129', '12 févr. 2018'),
(6, 3, '82.229.198.103', '2 mars 2018'),
(7, 5, '110.77.148.10', '13 mars 2018'),
(8, 4, '2.4.153.70', '13 mai 2018'),
(9, 8, '92.167.102.148', '14 mai 2018'),
(10, 9, '90.51.40.147', '21 mai 2018'),
(11, 8, '220.156.174.33', '22 mai 2018'),
(12, 8, '117.211.161.54', '22 mai 2018'),
(13, 8, '162.38.237.197', '22 mai 2018'),
(14, 6, '162.38.236.59', '22 mai 2018'),
(15, 7, '193.49.41.254', '22 mai 2018'),
(16, 7, '134.246.159.169', '22 mai 2018'),
(17, 8, '157.99.174.214', '23 mai 2018'),
(18, 3, '147.99.64.14', '25 mai 2018'),
(19, 1, '192.134.152.178', '31 mai 2018'),
(20, 7, '10.97.56.254', '4 juin 2018'),
(21, 1, '93.158.26.144', '4 juin 2018'),
(22, 4, '10.97.58.19', '5 juin 2018'),
(23, 7, '10.97.58.20', '5 juin 2018'),
(24, 4, '10.97.58.12', '5 juin 2018'),
(25, 4, '10.97.56.250', '5 juin 2018'),
(26, 4, '10.97.58.15', '5 juin 2018'),
(27, 1, '10.97.58.23', '5 juin 2018'),
(28, 1, '10.97.58.14', '5 juin 2018'),
(29, 1, '10.97.58.21', '5 juin 2018'),
(30, 8, '10.97.58.11', '5 juin 2018'),
(31, 2, '10.97.56.255', '5 juin 2018'),
(32, 8, '93.158.25.147', '5 juin 2018'),
(33, 6, '93.158.28.58', '6 juin 2018'),
(34, 9, '93.158.28.36', '7 juin 2018'),
(35, 9, '93.158.30.0', '7 juin 2018'),
(36, 9, '93.158.24.193', '8 juin 2018'),
(37, 9, '157.99.110.83', '8 juin 2018'),
(38, 5, '10.97.56.9', '8 juin 2018'),
(39, 10, '0:0:0:0:0:0:0:1', '13 juin 2018');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `information`
--
ALTER TABLE `information`
  ADD CONSTRAINT `Information_refauthor` FOREIGN KEY (`idRef_Author`) REFERENCES `ref_author` (`idRef_Author`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Information_refdimension` FOREIGN KEY (`idRef_Dimension`) REFERENCES `ref_dimension` (`idRef_Dimension`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Information_refmisc1` FOREIGN KEY (`idRef_Misc1`) REFERENCES `ref_misc1` (`idRef_Misc1`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Information_refsource` FOREIGN KEY (`idRef_Source`) REFERENCES `ref_source` (`idRef_Source`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `info_access`
--
ALTER TABLE `info_access`
  ADD CONSTRAINT `infoaccesstoinformation` FOREIGN KEY (`idInformation`) REFERENCES `information` (`idInformation`);

--
-- Contraintes pour la table `info_keyword`
--
ALTER TABLE `info_keyword`
  ADD CONSTRAINT `infokeywordtoinformation` FOREIGN KEY (`idInformation`) REFERENCES `information` (`idInformation`),
  ADD CONSTRAINT `infokeywordtorefkeyword` FOREIGN KEY (`idRef_Keyword`) REFERENCES `ref_keyword` (`idRef_Keyword`);

--
-- Contraintes pour la table `info_link`
--
ALTER TABLE `info_link`
  ADD CONSTRAINT `infolinktoinformation1` FOREIGN KEY (`idInformation1`) REFERENCES `information` (`idInformation`),
  ADD CONSTRAINT `infolinktoinformation2` FOREIGN KEY (`idInformation2`) REFERENCES `information` (`idInformation`);

--
-- Contraintes pour la table `info_medium`
--
ALTER TABLE `info_medium`
  ADD CONSTRAINT `infomediumtoinformation` FOREIGN KEY (`idInformation`) REFERENCES `information` (`idInformation`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `infomediumtorefmedium` FOREIGN KEY (`idRef_Medium`) REFERENCES `ref_medium` (`idRef_Medium`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `info_misc2`
--
ALTER TABLE `info_misc2`
  ADD CONSTRAINT `infomisc2toinformation` FOREIGN KEY (`idInformation`) REFERENCES `information` (`idInformation`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `info_misc2_ibfk_2` FOREIGN KEY (`idRef_Misc2`) REFERENCES `ref_misc2` (`idRef_Misc2`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `ref_keyword`
--
ALTER TABLE `ref_keyword`
  ADD CONSTRAINT `refkeywordtorefmetakeyword` FOREIGN KEY (`idRef_MetaKeyword`) REFERENCES `ref_metakeyword` (`idRef_MetaKeyword`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `tempo`
--
ALTER TABLE `tempo`
  ADD CONSTRAINT `tempotoinformation` FOREIGN KEY (`idInformation`) REFERENCES `information` (`idInformation`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

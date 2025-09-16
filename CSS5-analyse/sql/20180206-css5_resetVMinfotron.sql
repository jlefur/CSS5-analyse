-- phpMyAdmin SQL Dump
-- version 3.5.2
-- http://www.phpmyadmin.net
--
-- Client: vminfotron-dev.ird.fr
-- Généré le: Mar 06 Février 2018 à 16:02
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Contenu de la table `information`
--

INSERT INTO `information` (`idInformation`, `uniqueTag`, `idRef_Dimension`, `title`, `subtitle`, `idRef_Source`, `idRef_Author`, `entryDate`, `shortDescription`, `idRef_Misc1`) VALUES
(1, 'XP-01', 3, 'Development of integrative approaches combining genomics, transcriptomics and epigenomics', 'study of adaptation mechanisms of tropical trees/forests to environmental variations', 1, 2, '2018-01-19', 'More specifically, design and calibrate empirically the models of evolution to explain and\r\npredict the future of tropical species to global changes.\r\nThe Link to UMR DIADE is provided for any convenience.', NULL),
(2, 'XP-02', 3, 'Reconciling exploitation and conservation of tropical pelagic ecosystems', 'Derivation of alternative abundance indicators coupling operational models with fishery independant data', 2, 3, '2017-12-29', 'The current research is entitled: \r\n"Reconciling exploitation and conservation of tropical pelagic ecosystems:\r\nDerivation of alternative abundance indicators coupling operational\r\nmodels and data independent of the fishery\r\n\r\n(Concilier exploitation et conservation des écosystèmes pélagiques tropicaux : \r\nDérivation d’indicateurs d’abondance alternatifs couplant modèles opérationnels \r\net données indépendantes de la pêche)', NULL),
(3, 'XP-03', 3, 'Evolution of the water cycle within the intertropical band using hyper-resolved modeling of the critical zone', 'FR: Evolution du cycle de l’eau dans la bande intertropicale par modélisation hyper-résolue de la zone critique', 3, 4, '2017-10-27', 'Software link to PyGrav  (processing of micro-gravity data) is provided for any convenience', NULL),
(4, 'XP-04', 4, 'Integrated modelling of marine socio-ecosystems and scenarios of adaptation to climate change', 'FR: Modélisation intégrée des socio-écosystèmes marins et scenarios d’adaptation aux changements climatiques', 2, 5, '2017-11-24', 'doi: APECOSM model description\r\nweb-link: Globec-Cliotop program home page', NULL),
(5, 'XP-05', 3, 'Accelerating malaria eradication in West Africa', 'identification, characterization and treatment of persistence foci', 4, 6, '2018-01-18', 'Links below are provided for any convenience :\r\n\r\n- institution: UMR SESSTIM\r\n- web-link: UN Sustainable Development Goal 3: Ensure healthy lives and promote well-being for all at all ages', NULL),
(6, 'XP-06', 3, 'Applied perspective of meta-acoustics for biological conservation within southern countries', 'ecological study and conservation tool based on sound environments collections (soundscape ecology)', 5, 7, '2017-11-12', 'Links below are provided for any convenience :\r\n\r\n- institution: access to UMR IMBE\r\n- DOI article: soundscape ecology in an insular biodiversity hot spot', NULL),
(7, 'XP-07', 3, 'Spatial agro-hydrology; satellite data mining and assimilation', 'modeling and predicting interactions between agriculture and water resources', 6, 8, '2018-02-06', 'Links below are provided for any convenience\r\nweb-link: the CNES European Copernicus satellites program.', NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Contenu de la table `info_access`
--

INSERT INTO `info_access` (`id`, `idInformation`, `nbAccess`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=161 ;

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
(157, 7, 126);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=51 ;

--
-- Contenu de la table `info_link`
--

INSERT INTO `info_link` (`id`, `idInformation1`, `idInformation2`, `linkWeight`, `initialWeight`) VALUES
(14, 2, 4, 10, 10),
(22, 5, 2, 3, 3),
(28, 6, 2, 6, 6),
(37, 4, 7, 10, 10),
(40, 3, 7, 10, 10),
(45, 7, 5, 5, 5),
(47, 1, 7, 5, 5);

-- --------------------------------------------------------

--
-- Structure de la table `info_medium`
--

CREATE TABLE IF NOT EXISTS `info_medium` (
  `id` int(11) NOT NULL auto_increment,
  `idInformation` int(11) NOT NULL,
  `idRef_Medium` int(11) NOT NULL,
  `fileName` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `idInformation` (`idInformation`,`idRef_Medium`,`fileName`),
  KEY `idinfo` (`idInformation`),
  KEY `idsupport` (`idRef_Medium`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

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
(7, 2, 4, 'http://apps.webofknowledge.com/Search.do?product=WOS&SID=Z2C8uQmmpSIwDUIm7gX&search_mode=GeneralSear'),
(10, 2, 6, 'mailto:manuela.capello@ird.fr'),
(9, 2, 7, 'http://www.umr-marbec.fr/en/?lang=en'),
(11, 3, 1, 'https://basilehector.jimdo.com/'),
(15, 3, 2, 'https://www.researchgate.net/profile/Basile_Hector'),
(12, 3, 5, 'http://orcid.org/0000-0003-2619-5435'),
(14, 3, 6, 'mailto:hector.basile@ird.fr'),
(13, 3, 8, 'http://basileh.github.io/pyGrav/'),
(16, 4, 2, 'https://www.researchgate.net/profile/Olivier_Maury2'),
(19, 4, 4, 'http://www.researcherid.com/rid/I-4513-2013'),
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
(37, 7, 10, 'https://copernicus.cnes.fr/en/copernicus-0');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

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
(8, 'S.Ferrant', 'FERRANT, Sylvain');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=128 ;

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
(15, 'fisheries science', 12, ''),
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
(29, 'quantum physics', 12, ''),
(31, 'MULTIDISCIPLINARY', 1, ''),
(32, 'transcriptomics', 1, ''),
(33, 'epigenomics', 1, ''),
(35, 'Maldives', 8, ''),
(36, 'Ivory Coast', 8, ''),
(37, 'Brazil', 8, ''),
(38, 'tropical pelagic ecosystem', 9, ''),
(39, 'operational model', 16, ''),
(40, 'non linear dynamics', 13, ''),
(41, 'SDG 06 (Sust. Devel. Goal - Water and sanitation)', 14, 'UN Sustainable Development Goal'),
(42, 'Benin', 8, ''),
(43, 'geophysics', 12, ''),
(44, 'hydrology', 12, ''),
(45, 'West Africa', 8, ''),
(46, 'hydro-gravimetry', 1, ''),
(47, 'PyGrav (processing of micro-gravity data)', 15, 'http://basileh.github.io/pyGrav/'),
(48, 'integrated modelling', 5, ''),
(49, 'water resources', 4, ''),
(50, 'gravimetric data', 13, ''),
(51, 'critical zone', 4, 'Earth''s outer skin'),
(52, 'numerical model', 16, ''),
(53, 'data mining', 11, ''),
(54, 'hydro-system', 4, ''),
(55, 'hyper-resolved modelling', 11, ''),
(56, 'UMR IGE (Inst. Geosci. Environ. res.)', 6, ''),
(57, 'Ecology (marine)', 12, ''),
(58, 'South Western Indian ocean', 8, ''),
(59, 'Sahel', 8, ''),
(60, 'spatial dynamics', 13, ''),
(61, 'population dynamics', 5, ''),
(62, 'marine ecosystem', 9, ''),
(63, 'ecosystem dynamics', 13, ''),
(64, 'ecosystem processes', 3, ''),
(65, 'functional biodiversity', 9, ''),
(67, 'statistical modelling', 5, ''),
(68, 'climate change impacts', 17, ''),
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
(88, 'Buruli ulcer', 3, ''),
(89, 'Epidemiology', 12, ''),
(90, 'Cameroon', 8, ''),
(91, 'Myobacterium_ulcerans', 7, ''),
(92, 'SDG 03 (Sust. Devel. Goal - Healthy lives and well-being)', 14, 'UN Sustainable Development Goal'),
(93, 'information system (epidemiologic)', 11, ''),
(94, 'malaria', 3, ''),
(95, 'disease incidence (epidemiology)', 3, ''),
(96, 'prevalence focus (epidemiology)', 3, ''),
(97, 'asymptomatic infection', 9, ''),
(98, 'public health', 9, ''),
(99, 'monitoring and screening (health)', 5, ''),
(100, 'Mali', 8, ''),
(101, 'Burkina-Faso', 8, ''),
(102, 'geomatics', 1, ''),
(103, 'functional regression', 11, ''),
(104, 'SDG 15 (Sust. Devel. Goal - Terrestrial ecosystems)', 14, 'UN Sustainable Development Goal'),
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
(117, 'disturbance analysis', 14, ''),
(118, 'UMR CESBIO (Center for the Study of the Biosphere from Space)', 6, ''),
(119, 'spatial agro-hydrology', 1, ''),
(120, 'data assimilation', 11, ''),
(121, 'forecasting', 5, ''),
(122, 'agriculture', 4, ''),
(123, 'South India', 8, ''),
(124, 'water management', 9, ''),
(125, 'environmental monitoring', 16, 'observatoire environnementaux'),
(126, 'agro-hydrological model', 18, ''),
(127, 'aggregation (spatial)', 3, '');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Contenu de la table `ref_medium`
--

INSERT INTO `ref_medium` (`idRef_Medium`, `mediumName`, `optionalDescription`, `iconFileName`) VALUES
(1, 'Personal home page', '', 'personne.gif'),
(2, 'Research gate access', '', 'researchgate3.png'),
(3, 'Known production set', '', 'horizons.png'),
(4, 'Indexed publications', '', 'wos.gif'),
(5, 'ORCID access', '', 'orcid.gif'),
(6, 'email contact', '', 'bmail.gif'),
(7, 'institution', '', 'labo.gif'),
(8, 'software', '', 'software.gif'),
(9, 'article', '', 'doi.gif'),
(10, 'web-link', '', 'webPage.gif');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

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
(14, 'Research Theme', ''),
(15, 'Software', ''),
(16, 'Tool', ''),
(17, 'Question', ''),
(18, 'Model', '');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `ref_source`
--

INSERT INTO `ref_source` (`idRef_Source`, `header`, `detail`) VALUES
(1, 'UMR DIADE', 'plant DIversity Adaptation and DEvelopment'),
(2, 'UMR MARBEC', 'MARine Biodiversity, Exploitation and Conservation'),
(3, 'UMR IGE', 'Institute for Geosciences and Environmental research'),
(4, 'UMR SESSTIM', 'Sciences Economiques et Sociales de la Santé et Traitement des Informations Médicales'),
(5, 'UMR IMBE', 'Institut  Méditerranéen de la  Biodiversité et d’Ecologie  marine et continentale'),
(6, 'UMR CESBIO', 'Center for the Study of the Biosphere from Space');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `tempo`
--

INSERT INTO `tempo` (`id`, `idInformation`, `ipNumber`, `dateStamp`) VALUES
(1, 5, '127.0.0.1', '5 oct. 2017'),
(2, 5, '147.99.65.12', '6 févr. 2018');

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

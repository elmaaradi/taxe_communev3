-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mar 21 Février 2017 à 16:28
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `tax_commune`
--

-- --------------------------------------------------------

--
-- Structure de la table `annexeadministratif`
--

CREATE TABLE IF NOT EXISTS `annexeadministratif` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ABREVIATION` varchar(255) DEFAULT NULL,
  `NOM` varchar(255) DEFAULT NULL,
  `SECTEUR_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_ANNEXEADMINISTRATIF_SECTEUR_ID` (`SECTEUR_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `annexeadministratif`
--

INSERT INTO `annexeadministratif` (`ID`, `ABREVIATION`, `NOM`, `SECTEUR_ID`) VALUES
(1, 'Gz', 'Gueliz', 1),
(2, 'CT', 'Centre', 1),
(3, 'E3', 'Elbadi3', 2),
(4, 'AMCH', 'Amerchich', 2),
(5, 'BDK', 'Bab Dekkala', 3),
(6, 'EMH', 'Elmlah', 3);

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE IF NOT EXISTS `categorie` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NOM` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Contenu de la table `categorie`
--

INSERT INTO `categorie` (`ID`, `NOM`) VALUES
(1, '1Etoile'),
(2, '2Etoile'),
(3, '3Etoile'),
(4, '4Etoile'),
(5, '5Etoile'),
(6, 'LUXE'),
(7, 'MAISON HOTE'),
(8, 'RYIAD'),
(9, 'VILLAGES VACANCES');

-- --------------------------------------------------------

--
-- Structure de la table `locale`
--

CREATE TABLE IF NOT EXISTS `locale` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ACTIVITE` varchar(255) DEFAULT NULL,
  `COMPLEMENTADRESSE` varchar(255) DEFAULT NULL,
  `DERNIERANNEEPAIEMENT` int(11) DEFAULT NULL,
  `DERNIERTRIMESTREPAIEMENT` int(11) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `REFERENCE` varchar(255) DEFAULT NULL,
  `CATEGORIE_ID` bigint(20) DEFAULT NULL,
  `PROPRIETAIRE_ID` bigint(20) DEFAULT NULL,
  `RUE_ID` bigint(20) DEFAULT NULL,
  `GERANT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_LOCALE_GERANT_ID` (`GERANT_ID`),
  KEY `FK_LOCALE_CATEGORIE_ID` (`CATEGORIE_ID`),
  KEY `FK_LOCALE_PROPRIETAIRE_ID` (`PROPRIETAIRE_ID`),
  KEY `FK_LOCALE_RUE_ID` (`RUE_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `locale`
--

INSERT INTO `locale` (`ID`, `ACTIVITE`, `COMPLEMENTADRESSE`, `DERNIERANNEEPAIEMENT`, `DERNIERTRIMESTREPAIEMENT`, `DESCRIPTION`, `REFERENCE`, `CATEGORIE_ID`, `PROPRIETAIRE_ID`, `RUE_ID`, `GERANT_ID`) VALUES
(1, 'hhhhh', 'n11', 0, 0, 'ggghhh', 'ee12', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `quartier`
--

CREATE TABLE IF NOT EXISTS `quartier` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NOM` varchar(255) DEFAULT NULL,
  `NUMABREVIATION` int(11) DEFAULT NULL,
  `ANNEXEADMINISTRATIF_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_QUARTIER_ANNEXEADMINISTRATIF_ID` (`ANNEXEADMINISTRATIF_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Contenu de la table `quartier`
--

INSERT INTO `quartier` (`ID`, `NOM`, `NUMABREVIATION`, `ANNEXEADMINISTRATIF_ID`) VALUES
(1, 'gueliz', 1, 1),
(2, 'elkodia', 2, 1),
(3, 'plasa', 3, 2),
(4, 'centre', 4, 2),
(5, 'elbadi3', 5, 3),
(6, 'amerchich', 6, 4),
(7, 'bab dekkala', 7, 5),
(8, 'elmlah', 8, 6),
(9, 'saada1', 9, 4),
(10, 'assif', 10, 3),
(11, 'boukar', 11, 5);

-- --------------------------------------------------------

--
-- Structure de la table `redevable`
--

CREATE TABLE IF NOT EXISTS `redevable` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PATTENTE` varchar(255) DEFAULT NULL,
  `ADRESSE` varchar(255) DEFAULT NULL,
  `CIN` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `FAX` varchar(255) DEFAULT NULL,
  `NATURE` int(11) DEFAULT NULL,
  `NOM` varchar(255) DEFAULT NULL,
  `PRENOM` varchar(255) DEFAULT NULL,
  `RC` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `redevable`
--

INSERT INTO `redevable` (`ID`, `PATTENTE`, `ADRESSE`, `CIN`, `EMAIL`, `FAX`, `NATURE`, `NOM`, `PRENOM`, `RC`) VALUES
(1, 'AB1234', 'MARRAKECH-SAADA', 'PB229582', 'aitbassouali@gmail.com', '067576254223', 1, 'AIT BASSOU', 'ALI', ''),
(2, '77es72', 'DAKHLA', 'OD97723', 'souhailxelfahimi@gmail.com', '78678578', 2, 'EL FAHIMI', 'SOUHAIL', '');

-- --------------------------------------------------------

--
-- Structure de la table `rue`
--

CREATE TABLE IF NOT EXISTS `rue` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NOM` varchar(255) DEFAULT NULL,
  `NUMABREVIATION` int(11) DEFAULT NULL,
  `QUARTIER_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RUE_QUARTIER_ID` (`QUARTIER_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Contenu de la table `rue`
--

INSERT INTO `rue` (`ID`, `NOM`, `NUMABREVIATION`, `QUARTIER_ID`) VALUES
(1, 'abd elkarim el khatabi', 1, 1),
(2, 'mohamed6', 2, 1),
(3, 'france', 3, 1),
(4, 'elkodia', 4, 2),
(5, 'mohamed5', 5, 3),
(6, 'allal el fasi', 6, 5),
(7, 'malizia', 7, 6),
(8, 'atalaba', 8, 6),
(9, 'asfi', 9, 7),
(10, 'marjane', 10, 9),
(11, 'casa', 11, 9);

-- --------------------------------------------------------

--
-- Structure de la table `secteur`
--

CREATE TABLE IF NOT EXISTS `secteur` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ABREVIATION` varchar(255) DEFAULT NULL,
  `NOMSECTEUR` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `secteur`
--

INSERT INTO `secteur` (`ID`, `ABREVIATION`, `NOMSECTEUR`) VALUES
(1, 'GZ', 'Gueliz'),
(2, 'DT', 'Daoudiat'),
(3, 'MN', 'Madina');

-- --------------------------------------------------------

--
-- Structure de la table `tauxtaxe`
--

CREATE TABLE IF NOT EXISTS `tauxtaxe` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TAUX` double DEFAULT NULL,
  `CATEGORIE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_TAUXTAXE_CATEGORIE_ID` (`CATEGORIE_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Contenu de la table `tauxtaxe`
--

INSERT INTO `tauxtaxe` (`ID`, `TAUX`, `CATEGORIE_ID`) VALUES
(1, 5, 1),
(2, 5, 2),
(3, 5, 3),
(4, 8, 4),
(5, 10, 5),
(6, 20, 6),
(7, 15, 7),
(8, 10, 8),
(9, 15, 9);

-- --------------------------------------------------------

--
-- Structure de la table `tauxtaxeretard`
--

CREATE TABLE IF NOT EXISTS `tauxtaxeretard` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TAUXAUTRERETARD` double DEFAULT NULL,
  `TAUXPREMIERRETARD` double DEFAULT NULL,
  `CATEGORIE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_TAUXTAXERETARD_CATEGORIE_ID` (`CATEGORIE_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Contenu de la table `tauxtaxeretard`
--

INSERT INTO `tauxtaxeretard` (`ID`, `TAUXAUTRERETARD`, `TAUXPREMIERRETARD`, `CATEGORIE_ID`) VALUES
(1, 2, 5, 1),
(2, 2, 5, 2),
(3, 2, 5, 3),
(4, 5, 8, 4),
(5, 5, 8, 1),
(6, 8, 10, 6),
(7, 5, 8, 7),
(8, 2, 5, 8),
(9, 5, 10, 9);

-- --------------------------------------------------------

--
-- Structure de la table `taxeannuel`
--

CREATE TABLE IF NOT EXISTS `taxeannuel` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TAXETOTALE` double DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `taxetrim`
--

CREATE TABLE IF NOT EXISTS `taxetrim` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DATEPAIEMENT` date DEFAULT NULL,
  `MONTANT` double DEFAULT NULL,
  `MONTANTRETARD` double DEFAULT NULL,
  `MONTANTTOTAL` double DEFAULT NULL,
  `NOMBRECLIENTS` int(11) DEFAULT NULL,
  `NOMBRENUIT` int(11) DEFAULT NULL,
  `LOCALE_ID` bigint(20) DEFAULT NULL,
  `REDEVABLE_ID` bigint(20) DEFAULT NULL,
  `TAXEANNUEL_ID` bigint(20) DEFAULT NULL,
  `USER_LOGIN` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_TAXETRIM_REDEVABLE_ID` (`REDEVABLE_ID`),
  KEY `FK_TAXETRIM_USER_LOGIN` (`USER_LOGIN`),
  KEY `FK_TAXETRIM_LOCALE_ID` (`LOCALE_ID`),
  KEY `FK_TAXETRIM_TAXEANNUEL_ID` (`TAXEANNUEL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `LOGIN` varchar(255) NOT NULL,
  `BLOCKED` int(11) DEFAULT NULL,
  `NOM` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `PRENOM` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`LOGIN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `annexeadministratif`
--
ALTER TABLE `annexeadministratif`
  ADD CONSTRAINT `FK_ANNEXEADMINISTRATIF_SECTEUR_ID` FOREIGN KEY (`SECTEUR_ID`) REFERENCES `secteur` (`ID`);

--
-- Contraintes pour la table `locale`
--
ALTER TABLE `locale`
  ADD CONSTRAINT `FK_LOCALE_CATEGORIE_ID` FOREIGN KEY (`CATEGORIE_ID`) REFERENCES `categorie` (`ID`),
  ADD CONSTRAINT `FK_LOCALE_GERANT_ID` FOREIGN KEY (`GERANT_ID`) REFERENCES `redevable` (`ID`),
  ADD CONSTRAINT `FK_LOCALE_PROPRIETAIRE_ID` FOREIGN KEY (`PROPRIETAIRE_ID`) REFERENCES `redevable` (`ID`),
  ADD CONSTRAINT `FK_LOCALE_RUE_ID` FOREIGN KEY (`RUE_ID`) REFERENCES `rue` (`ID`);

--
-- Contraintes pour la table `quartier`
--
ALTER TABLE `quartier`
  ADD CONSTRAINT `FK_QUARTIER_ANNEXEADMINISTRATIF_ID` FOREIGN KEY (`ANNEXEADMINISTRATIF_ID`) REFERENCES `annexeadministratif` (`ID`);

--
-- Contraintes pour la table `rue`
--
ALTER TABLE `rue`
  ADD CONSTRAINT `FK_RUE_QUARTIER_ID` FOREIGN KEY (`QUARTIER_ID`) REFERENCES `quartier` (`ID`);

--
-- Contraintes pour la table `tauxtaxe`
--
ALTER TABLE `tauxtaxe`
  ADD CONSTRAINT `FK_TAUXTAXE_CATEGORIE_ID` FOREIGN KEY (`CATEGORIE_ID`) REFERENCES `categorie` (`ID`);

--
-- Contraintes pour la table `tauxtaxeretard`
--
ALTER TABLE `tauxtaxeretard`
  ADD CONSTRAINT `FK_TAUXTAXERETARD_CATEGORIE_ID` FOREIGN KEY (`CATEGORIE_ID`) REFERENCES `categorie` (`ID`);

--
-- Contraintes pour la table `taxetrim`
--
ALTER TABLE `taxetrim`
  ADD CONSTRAINT `FK_TAXETRIM_LOCALE_ID` FOREIGN KEY (`LOCALE_ID`) REFERENCES `locale` (`ID`),
  ADD CONSTRAINT `FK_TAXETRIM_REDEVABLE_ID` FOREIGN KEY (`REDEVABLE_ID`) REFERENCES `redevable` (`ID`),
  ADD CONSTRAINT `FK_TAXETRIM_TAXEANNUEL_ID` FOREIGN KEY (`TAXEANNUEL_ID`) REFERENCES `taxeannuel` (`ID`),
  ADD CONSTRAINT `FK_TAXETRIM_USER_LOGIN` FOREIGN KEY (`USER_LOGIN`) REFERENCES `user` (`LOGIN`);
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

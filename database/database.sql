-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 07, 2025 at 10:08 AM
-- Server version: 8.2.0
-- PHP Version: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `recettes`
--

-- --------------------------------------------------------

--
-- Table structure for table `etape`
--

DROP TABLE IF EXISTS `etape`;
CREATE TABLE IF NOT EXISTS `etape` (
  `id_etape` mediumint NOT NULL AUTO_INCREMENT,
  `numero` tinyint UNSIGNED NOT NULL,
  `description` varchar(255) NOT NULL,
  `id_recette` smallint NOT NULL,
  PRIMARY KEY (`id_etape`),
  KEY `id_recette` (`id_recette`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
CREATE TABLE IF NOT EXISTS `ingredient` (
  `id_ingredient` smallint NOT NULL AUTO_INCREMENT,
  `nom` varchar(40) NOT NULL,
  `mesure` varchar(20) NOT NULL,
  PRIMARY KEY (`id_ingredient`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ingredient_recette`
--

DROP TABLE IF EXISTS `ingredient_recette`;
CREATE TABLE IF NOT EXISTS `ingredient_recette` (
  `id_ingredient` smallint NOT NULL,
  `id_recette` smallint NOT NULL,
  `quantite` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id_ingredient`,`id_recette`),
  KEY `id_recette` (`id_recette`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
CREATE TABLE IF NOT EXISTS `rating` (
  `id_rating` int NOT NULL AUTO_INCREMENT,
  `note` decimal(3,2) NOT NULL,
  `commentaire` varchar(255) DEFAULT NULL,
  `id_user` smallint NOT NULL,
  `id_recette` smallint NOT NULL,
  PRIMARY KEY (`id_rating`),
  KEY `id_user` (`id_user`),
  KEY `id_recette` (`id_recette`)
) ;

-- --------------------------------------------------------

--
-- Table structure for table `recette`
--

DROP TABLE IF EXISTS `recette`;
CREATE TABLE IF NOT EXISTS `recette` (
  `id_recette` smallint NOT NULL AUTO_INCREMENT,
  `nom` varchar(60) NOT NULL,
  `tmp_preparation` tinyint UNSIGNED NOT NULL,
  `tmp_cuisson` tinyint UNSIGNED DEFAULT NULL,
  `nbr_personne` tinyint UNSIGNED NOT NULL,
  `origine` varchar(40) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_recette`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_recette`
--

DROP TABLE IF EXISTS `user_recette`;
CREATE TABLE IF NOT EXISTS `user_recette` (
  `id_user` smallint NOT NULL,
  `id_recette` smallint NOT NULL,
  PRIMARY KEY (`id_user`,`id_recette`),
  KEY `id_recette` (`id_recette`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ustensil`
--

DROP TABLE IF EXISTS `ustensil`;
CREATE TABLE IF NOT EXISTS `ustensil` (
  `id_ustensil` tinyint NOT NULL AUTO_INCREMENT,
  `nom` varchar(40) NOT NULL,
  PRIMARY KEY (`id_ustensil`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ustensil_recette`
--

DROP TABLE IF EXISTS `ustensil_recette`;
CREATE TABLE IF NOT EXISTS `ustensil_recette` (
  `id_recette` smallint NOT NULL,
  `id_ustensil` tinyint NOT NULL,
  PRIMARY KEY (`id_recette`,`id_ustensil`),
  KEY `id_ustensil` (`id_ustensil`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id_user` smallint NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `role` enum('user','admin') NOT NULL,
  `password` char(60) NOT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 28, 2018 at 10:13 PM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `planning`
--

-- --------------------------------------------------------

--
-- Table structure for table `classe`
--

CREATE TABLE `classe` (
  `NOM_CLA` char(32) NOT NULL,
  `NUM_CLA` int(4) NOT NULL,
  `NOM_NIV` char(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `classe`
--

INSERT INTO `classe` (`NOM_CLA`, `NUM_CLA`, `NOM_NIV`) VALUES
('F21', 1, 'F2'),
('F22', 2, 'F2'),
('F11', 3, 'F1'),
('F12', 4, 'F1'),
('F13', 5, 'F1'),
('F14', 6, 'F1'),
('F31', 7, 'F3'),
('F32', 8, 'F3'),
('M1', 9, 'M'),
('M2', 10, 'M');

-- --------------------------------------------------------

--
-- Table structure for table `cours`
--

CREATE TABLE `cours` (
  `HEUREDEBUT` time(6) NOT NULL,
  `HEUREFIN` time(6) NOT NULL,
  `JOUR` enum('Lundi','Mardi','Mercredi','Jeudi','Vendredi') NOT NULL,
  `NOM_CLA` char(32) NOT NULL,
  `NOM_TYPE` char(32) NOT NULL,
  `NOM_SAL` char(32) NOT NULL,
  `NOM_MAT` char(32) NOT NULL,
  `MAIL_ENS` char(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cours`
--

INSERT INTO `cours` (`HEUREDEBUT`, `HEUREFIN`, `JOUR`, `NOM_CLA`, `NOM_TYPE`, `NOM_SAL`, `NOM_MAT`, `MAIL_ENS`) VALUES
('14:00:00.000000', '16:00:00.000000', 'Mardi', 'F32', 'TP', 'Mario', 'IA', 't.couilles@ludus-academie.com'),
('13:00:00.000000', '15:00:00.000000', 'Vendredi', 'F11', 'TP', 'VR', 'Anglais', 'c.muller@ludus-academie.com'),
('15:00:00.000000', '17:00:00.000000', 'Mardi', 'F12', 'TP', 'VR', 'Anglais', 'e.dentinger@ludus-academie.com'),
('13:00:00.000000', '15:00:00.000000', 'Mardi', 'F21', 'TP', 'Pokemon', 'C', 'n.lehmann@ludus-academie.com'),
('09:00:00.000000', '11:00:00.000000', 'Mercredi', 'M2', 'TP', 'Croft', 'IA', 't.couilles@ludus-academie.com'),
('09:00:00.000000', '11:00:00.000000', 'Mardi', 'F31', 'TP', 'Sonic', 'Anglais', 'e.dentinger@ludus-academie.com'),
('11:00:00.000000', '13:00:00.000000', 'Jeudi', 'F21', 'TP', 'Sonic', 'IA', 't.couilles@ludus-academie.com'),
('10:00:00.000000', '12:00:00.000000', 'Lundi', 'F21', 'TP', 'Pokemon', 'C', 'n.lehmann@ludus-academie.com'),
('09:00:00.000000', '11:00:00.000000', 'Jeudi', 'F22', 'TP', 'Pokemon', 'Anglais', 'c.muller@ludus-academie.com'),
('10:00:00.000000', '12:00:00.000000', 'Lundi', 'F21', 'TP', 'Pokemon', 'C', 'n.lehmann@ludus-academie.com'),
('09:00:00.000000', '11:00:00.000000', 'Jeudi', 'F22', 'TP', 'Pokemon', 'Anglais', 'c.muller@ludus-academie.com'),
('10:00:00.000000', '12:00:00.000000', 'Lundi', 'F21', 'TP', 'Pokemon', 'C', 'n.lehmann@ludus-academie.com'),
('09:00:00.000000', '11:00:00.000000', 'Jeudi', 'F22', 'TP', 'Pokemon', 'Anglais', 'c.muller@ludus-academie.com'),
('10:00:00.000000', '12:00:00.000000', 'Lundi', 'F21', 'TP', 'Pokemon', 'C', 'n.lehmann@ludus-academie.com'),
('09:00:00.000000', '11:00:00.000000', 'Jeudi', 'F22', 'TP', 'Pokemon', 'Anglais', 'c.muller@ludus-academie.com'),
('11:00:00.000000', '13:00:00.000000', 'Lundi', 'M2', 'TP', 'Kirby', 'IA', 't.couilles@ludus-academie.com'),
('16:00:00.000000', '18:00:00.000000', 'Lundi', 'F21', 'TP', 'Mario', 'Anglais', 'e.dentinger@ludus-academie.com'),
('12:00:00.000000', '14:00:00.000000', 'Lundi', 'F12', 'CM', 'Kirby', 'Anglais', 'e.dentinger@ludus-academie.com'),
('13:00:00.000000', '15:00:00.000000', 'Mercredi', 'F32', 'CM', 'Mario', 'C', 'n.lehmann@ludus-academie.com'),
('15:00:00.000000', '17:00:00.000000', 'Mercredi', 'F32', 'TP', 'Mario', 'Japonais', 'm.besmond@ludus-academie.com'),
('15:00:00.000000', '17:00:00.000000', 'Mercredi', 'F31', 'TP', 'VR', 'Japonais', 'm.besmond@ludus-academie.com'),
('13:00:00.000000', '15:00:00.000000', 'Vendredi', 'M1', 'TP', 'Sonic', 'Japonais', 'm.besmond@ludus-academie.com'),
('13:00:00.000000', '15:00:00.000000', 'Lundi', 'F21', 'TP', 'Croft', 'Anglais', 'e.dentinger@ludus-academie.com'),
('13:00:00.000000', '15:00:00.000000', 'Vendredi', 'F13', 'TP', 'VR', 'IA', 't.couilles@ludus-academie.com'),
('13:00:00.000000', '15:00:00.000000', 'Jeudi', 'F31', 'TP', 'Mario', 'Web', 'g.madembo@ludus-academie.com'),
('11:00:00.000000', '13:00:00.000000', 'Mercredi', 'F32', 'TP', 'Mario', 'IA', 't.couilles@ludus-academie.com'),
('09:00:00.000000', '11:00:00.000000', 'Lundi', 'F11', 'TP', 'Kirby', 'Japonais', 'm.besmond@ludus-academie.com'),
('15:00:00.000000', '17:00:00.000000', 'Lundi', 'M1', 'TP', 'Sonic', 'Anglais', 'e.dentinger@ludus-academie.com'),
('16:00:00.000000', '18:00:00.000000', 'Mardi', 'F14', 'TP', 'Mario', 'Anglais', 'e.dentinger@ludus-academie.com'),
('16:00:00.000000', '18:00:00.000000', 'Mercredi', 'F21', 'TP', 'Sonic', 'C', 'n.lehmann@ludus-academie.com'),
('10:00:00.000000', '12:00:00.000000', 'Mercredi', 'F14', 'TP', 'VR', 'C', 'n.lehmann@ludus-academie.com'),
('10:00:00.000000', '12:00:00.000000', 'Mardi', 'F32', 'CM', 'Croft', 'Anglais', 'c.muller@ludus-academie.com'),
('11:00:00.000000', '13:00:00.000000', 'Mardi', 'F14', 'TP', 'Pokemon', 'Web', 'g.madembo@ludus-academie.com'),
('13:00:00.000000', '15:00:00.000000', 'Lundi', 'M1', 'CM', 'Mario', 'C', 'n.lehmann@ludus-academie.com'),
('16:00:00.000000', '18:00:00.000000', 'Mercredi', 'F13', 'TP', 'VR', 'Web', 'g.madembo@ludus-academie.com'),
('14:00:00.000000', '16:00:00.000000', 'Jeudi', 'F11', 'TP', 'Mario', 'IA', 't.couilles@ludus-academie.com'),
('14:00:00.000000', '16:00:00.000000', 'Jeudi', 'F21', 'TP', 'Sonic', 'Anglais', 'c.muller@ludus-academie.com'),
('14:00:00.000000', '16:00:00.000000', 'Mercredi', 'F14', 'TP', 'Kirby', 'Web', 'g.madembo@ludus-academie.com'),
('09:00:00.000000', '11:00:00.000000', 'Vendredi', 'F21', 'CM', 'Croft', 'C', 'n.lehmann@ludus-academie.com'),
('12:00:00.000000', '14:00:00.000000', 'Lundi', 'M2', 'TP', 'Croft', 'C', 'n.lehmann@ludus-academie.com'),
('15:00:00.000000', '17:00:00.000000', 'Vendredi', 'M2', 'TP', 'Kirby', 'IA', 't.couilles@ludus-academie.com'),
('12:00:00.000000', '14:00:00.000000', 'Jeudi', 'F13', 'TP', 'Croft', 'Anglais', 'e.dentinger@ludus-academie.com'),
('13:00:00.000000', '15:00:00.000000', 'Mardi', 'M2', 'CM', 'Kirby', 'Japonais', 'm.besmond@ludus-academie.com'),
('10:00:00.000000', '12:00:00.000000', 'Jeudi', 'M1', 'TP', 'Croft', 'Anglais', 'e.dentinger@ludus-academie.com'),
('15:00:00.000000', '17:00:00.000000', 'Jeudi', 'M1', 'CM', 'Croft', 'Japonais', 'm.besmond@ludus-academie.com'),
('10:00:00.000000', '12:00:00.000000', 'Jeudi', 'F12', 'TP', 'VR', 'C', 'n.lehmann@ludus-academie.com'),
('13:00:00.000000', '15:00:00.000000', 'Mardi', 'F32', 'TP', 'Kirby', 'Japonais', 'm.besmond@ludus-academie.com'),
('12:00:00.000000', '14:00:00.000000', 'Vendredi', 'M2', 'TP', 'Croft', 'Web', 'g.madembo@ludus-academie.com'),
('15:00:00.000000', '17:00:00.000000', 'Jeudi', 'F31', 'CM', 'Croft', 'Japonais', 'm.besmond@ludus-academie.com'),
('15:00:00.000000', '17:00:00.000000', 'Mardi', 'F22', 'TP', 'Sonic', 'Web', 'g.madembo@ludus-academie.com'),
('10:00:00.000000', '12:00:00.000000', 'Mercredi', 'F21', 'TP', 'Kirby', 'C', 'n.lehmann@ludus-academie.com'),
('14:00:00.000000', '16:00:00.000000', 'Mercredi', 'F13', 'TP', 'VR', 'Web', 'g.madembo@ludus-academie.com'),
('15:00:00.000000', '17:00:00.000000', 'Lundi', 'F12', 'CM', 'Mario', 'Anglais', 'e.dentinger@ludus-academie.com'),
('14:00:00.000000', '16:00:00.000000', 'Lundi', 'F32', 'TP', 'Pokemon', 'Web', 'g.madembo@ludus-academie.com'),
('16:00:00.000000', '18:00:00.000000', 'Lundi', 'F21', 'CM', 'VR', 'Anglais', 'c.muller@ludus-academie.com'),
('09:00:00.000000', '11:00:00.000000', 'Lundi', 'F13', 'TP', 'Pokemon', 'IA', 't.couilles@ludus-academie.com'),
('10:00:00.000000', '12:00:00.000000', 'Mardi', 'M2', 'CM', 'Pokemon', 'IA', 't.couilles@ludus-academie.com'),
('11:00:00.000000', '13:00:00.000000', 'Lundi', 'M2', 'TP', 'Mario', 'C', 'n.lehmann@ludus-academie.com'),
('15:00:00.000000', '17:00:00.000000', 'Jeudi', 'F11', 'CM', 'Sonic', 'Japonais', 'm.besmond@ludus-academie.com'),
('09:00:00.000000', '11:00:00.000000', 'Jeudi', 'F11', 'CM', 'Kirby', 'Web', 'g.madembo@ludus-academie.com'),
('14:00:00.000000', '16:00:00.000000', 'Vendredi', 'F14', 'CM', 'Croft', 'C', 'n.lehmann@ludus-academie.com'),
('16:00:00.000000', '18:00:00.000000', 'Jeudi', 'F32', 'TP', 'Mario', 'Anglais', 'c.muller@ludus-academie.com'),
('14:00:00.000000', '16:00:00.000000', 'Jeudi', 'F22', 'TP', 'Croft', 'Anglais', 'c.muller@ludus-academie.com'),
('10:00:00.000000', '12:00:00.000000', 'Jeudi', 'F11', 'TP', 'VR', 'Anglais', 'e.dentinger@ludus-academie.com'),
('16:00:00.000000', '18:00:00.000000', 'Mardi', 'F13', 'TP', 'Pokemon', 'Japonais', 'm.besmond@ludus-academie.com'),
('12:00:00.000000', '14:00:00.000000', 'Lundi', 'F32', 'TP', 'VR', 'C', 'n.lehmann@ludus-academie.com'),
('14:00:00.000000', '16:00:00.000000', 'Mardi', 'F22', 'TP', 'Pokemon', 'C', 'n.lehmann@ludus-academie.com'),
('10:00:00.000000', '12:00:00.000000', 'Jeudi', 'F12', 'CM', 'Sonic', 'IA', 't.couilles@ludus-academie.com'),
('15:00:00.000000', '17:00:00.000000', 'Vendredi', 'F22', 'TP', 'Kirby', 'IA', 't.couilles@ludus-academie.com'),
('14:00:00.000000', '16:00:00.000000', 'Lundi', 'F22', 'TP', 'Pokemon', 'Japonais', 'm.besmond@ludus-academie.com'),
('13:00:00.000000', '15:00:00.000000', 'Mercredi', 'M1', 'TP', 'Croft', 'Japonais', 'm.besmond@ludus-academie.com'),
('15:00:00.000000', '17:00:00.000000', 'Vendredi', 'F31', 'TP', 'Pokemon', 'Anglais', 'c.muller@ludus-academie.com'),
('12:00:00.000000', '14:00:00.000000', 'Vendredi', 'F32', 'CM', 'Mario', 'Anglais', 'c.muller@ludus-academie.com'),
('11:00:00.000000', '13:00:00.000000', 'Jeudi', 'F13', 'TP', 'Sonic', 'Japonais', 'm.besmond@ludus-academie.com'),
('13:00:00.000000', '15:00:00.000000', 'Vendredi', 'F22', 'CM', 'Croft', 'IA', 't.couilles@ludus-academie.com'),
('15:00:00.000000', '17:00:00.000000', 'Mercredi', 'F11', 'TP', 'Mario', 'IA', 't.couilles@ludus-academie.com'),
('13:00:00.000000', '15:00:00.000000', 'Vendredi', 'F32', 'TP', 'Croft', 'Anglais', 'c.muller@ludus-academie.com'),
('16:00:00.000000', '18:00:00.000000', 'Mardi', 'F13', 'TP', 'Croft', 'Japonais', 'm.besmond@ludus-academie.com'),
('11:00:00.000000', '13:00:00.000000', 'Mardi', 'F14', 'TP', 'Mario', 'Anglais', 'e.dentinger@ludus-academie.com'),
('11:00:00.000000', '13:00:00.000000', 'Vendredi', 'F14', 'TP', 'Mario', 'C', 'n.lehmann@ludus-academie.com'),
('09:00:00.000000', '11:00:00.000000', 'Mardi', 'F32', 'CM', 'Sonic', 'C', 'n.lehmann@ludus-academie.com'),
('16:00:00.000000', '18:00:00.000000', 'Vendredi', 'M2', 'TP', 'Sonic', 'Anglais', 'c.muller@ludus-academie.com'),
('09:00:00.000000', '11:00:00.000000', 'Jeudi', 'F21', 'TP', 'VR', 'Japonais', 'm.besmond@ludus-academie.com'),
('12:00:00.000000', '14:00:00.000000', 'Mardi', 'M2', 'TP', 'Mario', 'IA', 't.couilles@ludus-academie.com'),
('13:00:00.000000', '15:00:00.000000', 'Mardi', 'F22', 'CM', 'Kirby', 'C', 'n.lehmann@ludus-academie.com'),
('14:00:00.000000', '16:00:00.000000', 'Mercredi', 'M2', 'TP', 'VR', 'IA', 't.couilles@ludus-academie.com'),
('10:00:00.000000', '12:00:00.000000', 'Jeudi', 'F11', 'TP', 'Kirby', 'IA', 't.couilles@ludus-academie.com'),
('10:00:00.000000', '12:00:00.000000', 'Lundi', 'F32', 'TP', 'Pokemon', 'Anglais', 'e.dentinger@ludus-academie.com'),
('14:00:00.000000', '16:00:00.000000', 'Vendredi', 'F12', 'TP', 'Mario', 'Web', 'g.madembo@ludus-academie.com'),
('12:00:00.000000', '14:00:00.000000', 'Vendredi', 'F31', 'CM', 'Kirby', 'C', 'n.lehmann@ludus-academie.com'),
('11:00:00.000000', '13:00:00.000000', 'Vendredi', 'F12', 'TP', 'Sonic', 'C', 'n.lehmann@ludus-academie.com'),
('11:00:00.000000', '13:00:00.000000', 'Lundi', 'F21', 'TP', 'Kirby', 'C', 'n.lehmann@ludus-academie.com'),
('10:00:00.000000', '12:00:00.000000', 'Lundi', 'F31', 'TP', 'Kirby', 'IA', 't.couilles@ludus-academie.com'),
('15:00:00.000000', '17:00:00.000000', 'Vendredi', 'F11', 'CM', 'Mario', 'Anglais', 'e.dentinger@ludus-academie.com'),
('10:00:00.000000', '12:00:00.000000', 'Vendredi', 'F31', 'TP', 'Mario', 'C', 'n.lehmann@ludus-academie.com'),
('09:00:00.000000', '11:00:00.000000', 'Vendredi', 'M2', 'TP', 'Pokemon', 'IA', 't.couilles@ludus-academie.com'),
('10:00:00.000000', '12:00:00.000000', 'Lundi', 'F22', 'CM', 'Pokemon', 'C', 'n.lehmann@ludus-academie.com'),
('10:00:00.000000', '12:00:00.000000', 'Jeudi', 'F21', 'TP', 'Croft', 'Anglais', 'e.dentinger@ludus-academie.com'),
('09:00:00.000000', '11:00:00.000000', 'Mardi', 'F22', 'TP', 'Sonic', 'Anglais', 'e.dentinger@ludus-academie.com'),
('11:00:00.000000', '13:00:00.000000', 'Lundi', 'F21', 'TP', 'Mario', 'IA', 't.couilles@ludus-academie.com'),
('14:00:00.000000', '16:00:00.000000', 'Vendredi', 'M1', 'TP', 'Kirby', 'Anglais', 'e.dentinger@ludus-academie.com'),
('13:00:00.000000', '15:00:00.000000', 'Lundi', 'F21', 'CM', 'Kirby', 'Web', 'g.madembo@ludus-academie.com'),
('09:00:00.000000', '11:00:00.000000', 'Jeudi', 'F12', 'TP', 'Mario', 'C', 'n.lehmann@ludus-academie.com'),
('11:00:00.000000', '13:00:00.000000', 'Mercredi', 'F31', 'TP', 'Croft', 'Web', 'g.madembo@ludus-academie.com'),
('09:00:00.000000', '11:00:00.000000', 'Vendredi', 'F32', 'TP', 'Croft', 'Web', 'g.madembo@ludus-academie.com'),
('14:00:00.000000', '16:00:00.000000', 'Mardi', 'F13', 'CM', 'VR', 'IA', 't.couilles@ludus-academie.com'),
('09:00:00.000000', '11:00:00.000000', 'Vendredi', 'F22', 'TP', 'Pokemon', 'C', 'n.lehmann@ludus-academie.com'),
('09:00:00.000000', '11:00:00.000000', 'Jeudi', 'M2', 'TP', 'Croft', 'C', 'n.lehmann@ludus-academie.com'),
('14:00:00.000000', '16:00:00.000000', 'Jeudi', 'F31', 'CM', 'VR', 'Japonais', 'm.besmond@ludus-academie.com'),
('15:00:00.000000', '17:00:00.000000', 'Vendredi', 'M1', 'CM', 'VR', 'Anglais', 'c.muller@ludus-academie.com'),
('09:00:00.000000', '11:00:00.000000', 'Mercredi', 'F31', 'TP', 'Kirby', 'Anglais', 'e.dentinger@ludus-academie.com'),
('11:00:00.000000', '13:00:00.000000', 'Mardi', 'M1', 'TP', 'VR', 'Anglais', 'c.muller@ludus-academie.com'),
('13:00:00.000000', '15:00:00.000000', 'Mardi', 'F32', 'CM', 'Croft', 'Web', 'g.madembo@ludus-academie.com'),
('10:00:00.000000', '12:00:00.000000', 'Lundi', 'F31', 'TP', 'Croft', 'C', 'n.lehmann@ludus-academie.com'),
('12:00:00.000000', '14:00:00.000000', 'Mardi', 'M2', 'CM', 'VR', 'Anglais', 'e.dentinger@ludus-academie.com'),
('14:00:00.000000', '16:00:00.000000', 'Lundi', 'M1', 'TP', 'Sonic', 'Anglais', 'e.dentinger@ludus-academie.com'),
('16:00:00.000000', '18:00:00.000000', 'Lundi', 'F22', 'TP', 'Kirby', 'C', 'n.lehmann@ludus-academie.com'),
('09:00:00.000000', '11:00:00.000000', 'Jeudi', 'M1', 'TP', 'Pokemon', 'Japonais', 'm.besmond@ludus-academie.com'),
('12:00:00.000000', '14:00:00.000000', 'Mercredi', 'M1', 'TP', 'VR', 'Anglais', 'e.dentinger@ludus-academie.com'),
('09:00:00.000000', '11:00:00.000000', 'Mercredi', 'F31', 'TP', 'Pokemon', 'Anglais', 'c.muller@ludus-academie.com'),
('09:00:00.000000', '11:00:00.000000', 'Mardi', 'M2', 'TP', 'Croft', 'Japonais', 'm.besmond@ludus-academie.com'),
('11:00:00.000000', '13:00:00.000000', 'Mardi', 'F21', 'TP', 'Pokemon', 'C', 'n.lehmann@ludus-academie.com');

-- --------------------------------------------------------

--
-- Table structure for table `enseignant`
--

CREATE TABLE `enseignant` (
  `MAIL_ENS` char(64) NOT NULL,
  `NOM_ENS` char(32) NOT NULL,
  `PRENOM_ENS` char(32) NOT NULL,
  `DATENAISS_ENS` datetime(6) NOT NULL,
  `SEXE_ENS` char(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enseignant`
--

INSERT INTO `enseignant` (`MAIL_ENS`, `NOM_ENS`, `PRENOM_ENS`, `DATENAISS_ENS`, `SEXE_ENS`) VALUES
('n.lehmann@ludus-academie.com', 'Lehmann', 'Nicolas', '1995-02-17 00:00:00.000000', 'H'),
('n.loth@ludus-academie.com', 'Loth', 'Nicolas', '1994-10-05 00:00:00.000000', 'H'),
('m.besmond@ludus-academie.com', 'Besmond', 'Marine', '1997-06-20 00:00:00.000000', 'H'),
('g.madembo@ludus-academie.com', 'Madembo', 'Grace', '1996-12-10 00:00:00.000000', 'H'),
('c.muller@ludus-academie.com', 'Muller', 'Charley', '1999-06-23 00:00:00.000000', 'H'),
('e.dentinger@ludus-academie.com', 'Dentinger', 'Emelyne', '1992-06-27 00:00:00.000000', 'H'),
('t.couilles@ludus-academie.com', 'Couilles', 'Thomas', '1993-05-22 00:00:00.000000', 'H'),
('a.jack@ludus-academie.com', 'Alterman', 'Jack', '1985-04-18 00:00:00.000000', 'H'),
('b.orlando@holcorp.com', 'Bloom', 'Orlando', '1987-03-04 00:00:00.000000', 'H'),
('g.alexis@ludus-world.com', 'Giovinazzo', 'Alexis', '2020-04-22 00:00:00.000000', 'H');

-- --------------------------------------------------------

--
-- Table structure for table `enseignement`
--

CREATE TABLE `enseignement` (
  `NOM_MAT` char(32) NOT NULL,
  `MAIL_ENS` char(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enseignement`
--

INSERT INTO `enseignement` (`NOM_MAT`, `MAIL_ENS`) VALUES
('Anglais', 'c.muller@ludus-academie.com'),
('Anglais', 'e.dentinger@ludus-academie.com'),
('Web', 'g.madembo@ludus-academie.com'),
('Japonais', 'm.besmond@ludus-academie.com'),
('C', 'n.lehmann@ludus-academie.com');

-- --------------------------------------------------------

--
-- Table structure for table `etudiant`
--

CREATE TABLE `etudiant` (
  `MAIL_ETU` char(64) NOT NULL,
  `NOM_CLA` char(32) NOT NULL,
  `NOM` char(32) NOT NULL,
  `PRENOM` char(32) NOT NULL,
  `SEXE` char(1) NOT NULL,
  `DATENAISS` datetime(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `etudiant`
--

INSERT INTO `etudiant` (`MAIL_ETU`, `NOM_CLA`, `NOM`, `PRENOM`, `SEXE`, `DATENAISS`) VALUES
('a.boula@ludus-academie.com', 'F31', 'Atrophia', 'Boula', 'H', '1996-04-10 00:00:00.000000'),
('u.ubrig@ludus-academie.com', 'F13', 'UBRIG', 'Joric', 'H', '1996-11-06 00:00:00.000000'),
('s.simon@ludus-academie.com', 'F14', 'SIMON', 'Pierre-Andre', 'H', '1998-08-22 00:00:00.000000'),
('s.schnee@ludus-academie.com', 'F13', 'SCHNEE', 'Louis', 'H', '1994-05-07 00:00:00.000000'),
('s.scheer-alm@ludus-academie.com', 'F12', 'SCHEER-ALM', 'Benjamin Claude', 'H', '1998-01-14 00:00:00.000000'),
('s.saint julien@ludus-academie.com', 'F12', 'SAINT JULIEN', 'Joffrey', 'H', '1995-02-15 00:00:00.000000'),
('r.roux@ludus-academie.com', 'F13', 'ROUX', 'Anthony', 'H', '2000-04-24 00:00:00.000000'),
('r.rochas@ludus-academie.com', 'F14', 'ROCHAS', 'Valentin', 'H', '1990-03-14 00:00:00.000000'),
('q.quenet@ludus-academie.com', 'F11', 'QUENET', 'Raphael', 'H', '1994-06-14 00:00:00.000000'),
('p.prob@ludus-academie.com', 'F11', 'PROB', 'Bastien', 'H', '1992-04-08 00:00:00.000000'),
('n.noyon@ludus-academie.com', 'F12', 'NOYON', 'Nathan', 'H', '1999-08-15 00:00:00.000000'),
('n.noiret-lemaire@ludus-academie.com', 'F12', 'NOIRET-LEMAIRE', 'Lenny', 'H', '1998-07-20 00:00:00.000000'),
('m.mock@ludus-academie.com', 'F12', 'MOCK', 'Romain', 'H', '1997-10-24 00:00:00.000000'),
('m.mathieu@ludus-academie.com', 'F13', 'MATHIEU', 'Tristan', 'H', '1994-01-02 00:00:00.000000'),
('m.maggay@ludus-academie.com', 'F12', 'MAGGAY', 'Cedric', 'H', '1993-03-28 00:00:00.000000'),
('m.mader@ludus-academie.com', 'F12', 'MADER', 'Maxime', 'H', '1995-10-01 00:00:00.000000'),
('l.lorange@ludus-academie.com', 'F11', 'LORANGE', 'Pauline', 'H', '1990-03-01 00:00:00.000000'),
('l.laskowski@ludus-academie.com', 'F14', 'LASKOWSKI', 'Axel', 'H', '1992-10-18 00:00:00.000000'),
('l.lamarre@ludus-academie.com', 'F13', 'LAMARRE', 'Benoit', 'H', '1997-07-25 00:00:00.000000'),
('k.kayser@ludus-academie.com', 'F13', 'KAYSER', 'Matthieu', 'H', '1991-02-03 00:00:00.000000'),
('i.iss@ludus-academie.com', 'F14', 'ISS', 'Fiona', 'F', '1993-04-19 00:00:00.000000'),
('h.hossann@ludus-academie.com', 'F11', 'HOSSANN', 'Vincent', 'H', '1991-01-05 00:00:00.000000'),
('h.hoel@ludus-academie.com', 'F14', 'HOEL', 'Julien', 'H', '1991-07-19 00:00:00.000000'),
('h.helfer@ludus-academie.com', 'F13', 'HELFER', 'Antoine', 'H', '1992-08-23 00:00:00.000000'),
('h.hajnal@ludus-academie.com', 'F12', 'HAJNAL', 'Florian', 'H', '1991-10-16 00:00:00.000000'),
('h.haas@ludus-academie.com', 'F12', 'HAAS', 'Mathieu', 'H', '1990-10-28 00:00:00.000000'),
('g.grimaz@ludus-academie.com', 'F14', 'GRIMAZ', 'Jeremie', 'H', '1993-07-02 00:00:00.000000'),
('g.goetz@ludus-academie.com', 'F12', 'GOETZ', 'Thibaud', 'H', '1992-09-18 00:00:00.000000'),
('g.gerges@ludus-academie.com', 'F14', 'GERGES', 'Celine', 'F', '1994-11-30 00:00:00.000000'),
('g.gawlik@ludus-academie.com', 'F14', 'GAWLIK', 'Alexis', 'H', '1998-06-21 00:00:00.000000'),
('g.gau@ludus-academie.com', 'F13', 'GAU', 'Pierre-Alain', 'H', '2000-07-05 00:00:00.000000'),
('g.galati@ludus-academie.com', 'F13', 'GALATI', 'Gaetan', 'H', '1992-12-03 00:00:00.000000'),
('f.fuchs@ludus-academie.com', 'F11', 'FUCHS', 'Emilien', 'H', '1997-09-18 00:00:00.000000'),
('f.freymann@ludus-academie.com', 'F11', 'FREYMANN', 'Ludwig', 'H', '1993-03-21 00:00:00.000000'),
('f.fernandes@ludus-academie.com', 'F14', 'FERNANDES', 'Yoann', 'H', '1996-11-14 00:00:00.000000'),
('f.fache@ludus-academie.com', 'F11', 'FACHE', 'Bruno', 'H', '1990-05-11 00:00:00.000000'),
('e.eschke@ludus-academie.com', 'F12', 'ESCHKE', 'Thomas', 'H', '1990-10-09 00:00:00.000000'),
('d.dietschin@ludus-academie.com', 'F12', 'DIETSCHIN', 'Valentin', 'H', '1991-11-22 00:00:00.000000'),
('d.deveze@ludus-academie.com', 'F14', 'DEVEZE', 'Killian', 'H', '1992-02-06 00:00:00.000000'),
('d.de chenerilles@ludus-academie.com', 'F11', 'DE CHENERILLES', 'Pablo', 'H', '2000-03-23 00:00:00.000000'),
('c.cragnolini@ludus-academie.com', 'F14', 'CRAGNOLINI', 'Julien', 'H', '1991-07-23 00:00:00.000000'),
('c.claude@ludus-academie.com', 'F12', 'CLAUDE', 'Leo', 'H', '1993-10-17 00:00:00.000000'),
('b.buttani@ludus-academie.com', 'F13', 'BUTTANI', 'Justine', 'F', '1995-06-09 00:00:00.000000'),
('b.boulaajoul@ludus-academie.com', 'F14', 'BOULAAJOUL', 'Badr', 'H', '1997-01-16 00:00:00.000000'),
('b.borgondo@ludus-academie.com', 'F11', 'BORGONDO', 'David', 'H', '1996-09-19 00:00:00.000000'),
('b.biton@ludus-academie.com', 'F11', 'BITON', 'Jocelyn', 'H', '1994-09-26 00:00:00.000000'),
('b.balson@ludus-academie.com', 'F11', 'BALSON', 'Yann', 'H', '1997-11-03 00:00:00.000000'),
('a.aulen@ludus-academie.com', 'F11', 'AULEN', 'Lucas', 'H', '1991-01-23 00:00:00.000000'),
('a.andriolo@ludus-academie.com', 'F12', 'ANDRIOLO', 'Caroline', 'F', '2000-05-03 00:00:00.000000'),
('a.andriamiandrarivo@ludus-academie.com', 'F11', 'ANDRIAMIANDRARIVO', 'Hubert Brayan', 'H', '1993-11-26 00:00:00.000000'),
('a.acker@ludus-academie.com', 'F11', 'ACKER', 'Arnaud', 'H', '1990-02-19 00:00:00.000000'),
('b.wendling@ludus-academie.com', 'F21', 'WENDLING', 'Bruno', 'H', '1993-10-16 00:00:00.000000'),
('w.weiler@ludus-academie.com', 'F21', 'WEILER', 'William', 'H', '1991-02-21 00:00:00.000000'),
('a.wahler@ludus-academie.com', 'F22', 'WAHLER', 'Adrian', 'H', '1990-02-18 00:00:00.000000'),
('g.unalan@ludus-academie.com', 'F21', 'UNALAN', 'Gokhan', 'H', '1990-04-22 00:00:00.000000'),
('f.trichet@ludus-academie.com', 'F22', 'TRICHET', 'Florentin', 'H', '1996-02-26 00:00:00.000000'),
('c.roche@ludus-academie.com', 'F21', 'ROCHE', 'Charles', 'H', '1997-01-09 00:00:00.000000'),
('a.rinck@ludus-academie.com', 'F22', 'RINCK', 'Adrien', 'H', '1992-01-14 00:00:00.000000'),
('k.pin@ludus-academie.com', 'F22', 'PIN', 'Killian', 'H', '1994-09-11 00:00:00.000000'),
('l.moriconi@ludus-academie.com', 'F22', 'MORICONI', 'Lenny', 'H', '1999-04-29 00:00:00.000000'),
('l.monnier@ludus-academie.com', 'F22', 'MONNIER', 'Laetitia', 'F', '1992-03-22 00:00:00.000000'),
('a.martin@ludus-academie.com', 'F21', 'MARTIN', 'Alexandre', 'H', '2000-07-01 00:00:00.000000'),
('a.lamour@ludus-academie.com', 'F21', 'LAMOUR', 'Anthony', 'H', '1997-11-20 00:00:00.000000'),
('p.kergrohen@ludus-academie.com', 'F21', 'KERGROHEN', 'Pierre-Yves', 'H', '1994-03-23 00:00:00.000000'),
('f.herrmann@ludus-academie.com', 'F21', 'HERRMANN', 'Florian', 'H', '1991-06-03 00:00:00.000000'),
('a.hernandez@ludus-academie.com', 'F22', 'HERNANDEZ', 'Alexis', 'H', '1997-05-29 00:00:00.000000'),
('m.guerrero@ludus-academie.com', 'F21', 'GUERRERO', 'Maxime', 'H', '1990-04-30 00:00:00.000000'),
('a.giovinazzo@ludus-academie.com', 'F21', 'GIOVINAZZO', 'Alexis', 'H', '1999-01-09 00:00:00.000000'),
('a.elbertse@ludus-academie.com', 'F22', 'ELBERTSE', 'Alexy', 'H', '1990-09-13 00:00:00.000000'),
('t.denny@ludus-academie.com', 'F22', 'DENNY', 'Thibaut', 'H', '1993-05-19 00:00:00.000000'),
('m.bazin@ludus-academie.com', 'F21', 'BAZIN', 'Maxime', 'H', '1992-07-24 00:00:00.000000'),
('a.barthlen@ludus-academie.com', 'F22', 'BARTHLEN', 'Arthur', 'H', '1996-09-12 00:00:00.000000'),
('g.alves@ludus-academie.com', 'F22', 'ALVES', 'Guillaume', 'H', '1990-07-21 00:00:00.000000'),
('a.bouboule@ludus-acabouboule.com', 'M2', 'Alexis', 'Bouboule', 'F', '1993-05-19 00:00:00.000000');

-- --------------------------------------------------------

--
-- Table structure for table `matiere`
--

CREATE TABLE `matiere` (
  `NOM_MAT` char(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `matiere`
--

INSERT INTO `matiere` (`NOM_MAT`) VALUES
('Algo'),
('Anglais'),
('BDD'),
('C'),
('GD'),
('IA'),
('Japonais'),
('Web');

-- --------------------------------------------------------

--
-- Table structure for table `niveau`
--

CREATE TABLE `niveau` (
  `NOM_NIV` char(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `niveau`
--

INSERT INTO `niveau` (`NOM_NIV`) VALUES
('F1'),
('F2'),
('F3'),
('M');

-- --------------------------------------------------------

--
-- Table structure for table `salle`
--

CREATE TABLE `salle` (
  `NOM_SAL` char(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `salle`
--

INSERT INTO `salle` (`NOM_SAL`) VALUES
('Croft'),
('Kirby'),
('Pokemon'),
('Sonic'),
('VR');

-- --------------------------------------------------------

--
-- Table structure for table `type_cours`
--

CREATE TABLE `type_cours` (
  `NOM_TYPE` char(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `type_cours`
--

INSERT INTO `type_cours` (`NOM_TYPE`) VALUES
('CM'),
('TP');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `classe`
--
ALTER TABLE `classe`
  ADD PRIMARY KEY (`NOM_CLA`),
  ADD KEY `NOM_NIV` (`NOM_NIV`);

--
-- Indexes for table `cours`
--
ALTER TABLE `cours`
  ADD KEY `NOM_CLA` (`NOM_CLA`),
  ADD KEY `NOM_TYPE` (`NOM_TYPE`),
  ADD KEY `NOM_SAL` (`NOM_SAL`),
  ADD KEY `NOM_MAT` (`NOM_MAT`),
  ADD KEY `MAIL_ENS` (`MAIL_ENS`);

--
-- Indexes for table `enseignant`
--
ALTER TABLE `enseignant`
  ADD PRIMARY KEY (`MAIL_ENS`);

--
-- Indexes for table `enseignement`
--
ALTER TABLE `enseignement`
  ADD PRIMARY KEY (`MAIL_ENS`,`NOM_MAT`),
  ADD KEY `NOM_MAT` (`NOM_MAT`);

--
-- Indexes for table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`MAIL_ETU`),
  ADD KEY `NOM_CLA` (`NOM_CLA`);

--
-- Indexes for table `matiere`
--
ALTER TABLE `matiere`
  ADD PRIMARY KEY (`NOM_MAT`);

--
-- Indexes for table `niveau`
--
ALTER TABLE `niveau`
  ADD PRIMARY KEY (`NOM_NIV`);

--
-- Indexes for table `salle`
--
ALTER TABLE `salle`
  ADD PRIMARY KEY (`NOM_SAL`);

--
-- Indexes for table `type_cours`
--
ALTER TABLE `type_cours`
  ADD PRIMARY KEY (`NOM_TYPE`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 12, 2018 at 03:45 AM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aerodrom`
--

-- --------------------------------------------------------

--
-- Table structure for table `korisnici`
--

CREATE TABLE `korisnici` (
  `ime` varchar(20) NOT NULL,
  `prezime` varchar(20) NOT NULL,
  `imeK` varchar(20) NOT NULL,
  `sifra_korisnika` varchar(20) NOT NULL,
  `email` char(30) NOT NULL,
  `datumRodjenja` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `korisnici`
--

INSERT INTO `korisnici` (`ime`, `prezime`, `imeK`, `sifra_korisnika`, `email`, `datumRodjenja`) VALUES
('Dusan', 'Dusovic', 'Dule', '1111', 'd@gmail.com', '1992-06-10'),
('Miki', 'Mikic', 'Mikikg', '1111', 'm@gmail.com', '1985-03-20'),
('Milos', 'Milosevic', 'Milos', '1111', 'milos@gmail.com', '1984-09-03'),
('Nikola', 'Nikolic', 'Nikola', '1111', 'n@gmail.com', '1991-11-04'),
('Petar', 'Petrovic', 'Peki', '1234', 'p@gmail.com', '1990-10-01'),
('Petar', 'Petrovic', 'Petarkg', '1111', 'petar@gmail.com', '1985-10-19'),
('Sava', 'Simic', 'Savakg', '0505', 'sava@gmail.com', '1988-05-05'),
('Sladjana', 'Simic', 'Sladja', '2003', 'sladja@g.com', '1963-03-20'),
('Srdjan', 'Simic', 'Srki', '2505', 's@gmail.com', '1994-05-25');

-- --------------------------------------------------------

--
-- Table structure for table `letovi`
--

CREATE TABLE `letovi` (
  `id_letovi` int(11) NOT NULL,
  `avion` varchar(20) NOT NULL,
  `polaziste` varchar(20) NOT NULL,
  `odrediste` varchar(20) NOT NULL,
  `datumPolaska` date NOT NULL,
  `vremePolaska` time NOT NULL,
  `vremeDolaska` time NOT NULL,
  `slobMesta` int(10) NOT NULL,
  `cena` float(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `letovi`
--

INSERT INTO `letovi` (`id_letovi`, `avion`, `polaziste`, `odrediste`, `datumPolaska`, `vremePolaska`, `vremeDolaska`, `slobMesta`, `cena`) VALUES
(3, 'Jat', 'Dubai', 'Rim', '2017-10-24', '01:00:00', '04:34:00', 100, 19500.00),
(4, 'Jat', 'Beograd', 'Pariz', '2017-10-27', '09:45:00', '11:19:00', 99, 13000.00),
(5, 'Jat', 'Pariz', 'Beograd', '2017-10-22', '17:28:00', '19:05:00', 100, 12000.00),
(6, 'Jat', 'Pariz', 'Beograd', '2017-10-31', '10:10:00', '12:00:00', 99, 13200.00),
(10, 'Jat', 'Beograd', 'Dubai', '2017-10-28', '10:10:00', '15:20:00', 99, 20000.00),
(11, 'Jat', 'Beograd', 'Madrid', '2017-10-31', '19:20:00', '22:04:00', 98, 17000.00),
(12, 'Jat', 'Beograd', 'Rim', '2017-10-30', '16:15:00', '18:00:00', 97, 14000.00),
(13, 'Jat', 'Beograd', 'Dubai', '2017-10-28', '17:15:00', '22:05:00', 100, 21000.00),
(14, 'Jat', 'Dubai', 'Beograd', '2017-11-10', '17:15:00', '22:05:00', 100, 21000.00),
(15, 'Jat', 'Beograd', 'Madrid', '2017-10-29', '17:15:00', '20:20:00', 100, 16000.00),
(16, 'Jat', 'Madrid', 'Beograd', '2017-11-08', '10:15:00', '13:10:00', 100, 16000.00),
(19, 'Jat', 'Pariz', 'Beograd', '2017-11-05', '10:15:00', '12:10:00', 100, 13500.00),
(20, 'Jat', 'Beograd', 'Pariz', '2017-11-05', '18:45:00', '20:50:00', 100, 13000.00),
(21, 'Jat', 'Beograd', 'Pariz', '2017-11-05', '14:45:00', '16:52:00', 100, 13800.00),
(22, 'Jat', 'Beograd', 'Pariz', '2017-11-05', '09:25:00', '11:30:00', 100, 13000.00),
(24, 'Jat', 'Pariz', 'Beograd', '2017-11-15', '17:55:00', '20:05:00', 100, 14000.00),
(26, 'Jat', 'Pariz', 'Beograd', '2017-11-15', '20:10:00', '22:10:00', 100, 13300.00),
(27, 'Jat', 'Beograd', 'Dubai', '2017-10-07', '08:23:00', '13:12:00', 100, 21000.00),
(28, 'Jat', 'Beograd', 'Dubai', '2017-11-29', '05:10:00', '10:50:00', 166, 21000.00),
(29, 'Jat', 'Dubai', 'Beograd', '2017-12-12', '15:35:00', '21:10:00', 166, 20400.00),
(30, 'Jat', 'Beograd', 'Dubai', '2017-12-27', '09:30:00', '13:45:00', 90, 23000.00),
(31, 'Jat', 'Beograd', 'Pariz', '2018-01-25', '11:10:00', '12:46:00', 95, 13000.00),
(32, 'Jat', 'Pariz', 'Beograd', '2018-01-31', '15:05:00', '16:50:00', 97, 14000.00);

-- --------------------------------------------------------

--
-- Table structure for table `rezervacije`
--

CREATE TABLE `rezervacije` (
  `id_rezervacije` int(11) NOT NULL,
  `korisnik` varchar(15) NOT NULL,
  `let` int(15) NOT NULL,
  `povratniLet` int(11) DEFAULT NULL,
  `brojPutnika` int(10) NOT NULL,
  `brojDece` int(11) NOT NULL,
  `Klasa` varchar(15) NOT NULL,
  `Cena` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rezervacije`
--

INSERT INTO `rezervacije` (`id_rezervacije`, `korisnik`, `let`, `povratniLet`, `brojPutnika`, `brojDece`, `Klasa`, `Cena`) VALUES
(16, 'Savakg', 11, NULL, 2, 0, 'Ekonomska', 34000),
(20, 'Peki', 12, NULL, 2, 1, 'Ekonomska', 35000),
(28, 'Peki', 4, 6, 1, 0, 'Biznis', 36680),
(34, 'Nikola', 10, NULL, 1, 0, 'Biznis', 40000),
(39, 'Savakg', 21, NULL, 2, 0, 'Biznis', 55200),
(40, 'Dule', 28, 29, 2, 0, 'Ekonomska', 57960),
(41, 'Milos', 28, 29, 2, 1, 'Prva', 217350),
(45, 'Mikikg', 30, NULL, 5, 5, 'Ekonomska', 172500),
(46, 'Srki', 31, 32, 2, 1, 'Ekonomska', 47250),
(48, 'Dule', 31, NULL, 1, 1, 'Ekonomska', 19500);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `korisnici`
--
ALTER TABLE `korisnici`
  ADD PRIMARY KEY (`imeK`);

--
-- Indexes for table `letovi`
--
ALTER TABLE `letovi`
  ADD PRIMARY KEY (`id_letovi`);

--
-- Indexes for table `rezervacije`
--
ALTER TABLE `rezervacije`
  ADD PRIMARY KEY (`id_rezervacije`),
  ADD KEY `let` (`let`),
  ADD KEY `korisnik` (`korisnik`),
  ADD KEY `rezervacije_ibfk_3` (`povratniLet`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `letovi`
--
ALTER TABLE `letovi`
  MODIFY `id_letovi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `rezervacije`
--
ALTER TABLE `rezervacije`
  MODIFY `id_rezervacije` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `rezervacije`
--
ALTER TABLE `rezervacije`
  ADD CONSTRAINT `rezervacije_ibfk_1` FOREIGN KEY (`let`) REFERENCES `letovi` (`id_letovi`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rezervacije_ibfk_2` FOREIGN KEY (`korisnik`) REFERENCES `korisnici` (`imeK`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rezervacije_ibfk_3` FOREIGN KEY (`povratniLet`) REFERENCES `letovi` (`id_letovi`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

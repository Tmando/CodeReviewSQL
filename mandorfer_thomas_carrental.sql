-- phpMyAdmin SQL Dump
-- version 4.7.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 01. Sep 2017 um 16:15
-- Server-Version: 10.1.26-MariaDB
-- PHP-Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `mandorfer_thomas_carrental`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Car`
--

CREATE TABLE `Car` (
  `carId` int(11) NOT NULL,
  `carname` varchar(100) DEFAULT NULL,
  `producer` varchar(100) DEFAULT NULL,
  `fuel` varchar(100) DEFAULT NULL,
  `yearofmanufacture` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `Car`
--

INSERT INTO `Car` (`carId`, `carname`, `producer`, `fuel`, `yearofmanufacture`) VALUES
(1, 'Audi A3', 'Audi', 'Benzin', '2011'),
(2, 'BMW X3', 'BMW', 'Benzin', '2011'),
(3, 'BMW X4', 'BMW', 'Benzin', '2013'),
(4, 'BMW X3', 'BMW', 'Benzin', '2014'),
(5, 'VW Golf', 'VW', 'Diesel', '2016');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Customer`
--

CREATE TABLE `Customer` (
  `customerId` int(11) NOT NULL,
  `firstName` varchar(120) DEFAULT NULL,
  `lastName` varchar(120) DEFAULT NULL,
  `password` varchar(120) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `Customer`
--

INSERT INTO `Customer` (`customerId`, `firstName`, `lastName`, `password`, `email`) VALUES
(1, 'Thomas', 'Mandorfer', 'aösdlfjafdöjkl', 't.mandorfer@gmail.com'),
(2, 'Max', 'Mustermann', 'afdöjkl', 'max.mustermann@gmail.com'),
(3, 'Herbert', 'Blau', 'öasdfljkadfjl', 'herbert.blau@gmail.com'),
(4, 'Karl', 'Yellow', 'adfafd', 'karl.yellow@gmail.com'),
(5, 'Robin', 'Grün', 'sdsdas', 'robin.grün@gmail.com');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Invoice`
--

CREATE TABLE `Invoice` (
  `InvoiceId` int(11) NOT NULL,
  `sumPayment` int(11) DEFAULT NULL,
  `paymentMethod` varchar(120) DEFAULT NULL,
  `creditCardNum` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `Invoice`
--

INSERT INTO `Invoice` (`InvoiceId`, `sumPayment`, `paymentMethod`, `creditCardNum`) VALUES
(1, 2334, 'Credit Card', 980808),
(2, 3000, 'Credit Card', 780067),
(3, 5000, 'Credit Card', 980808),
(4, 6000, 'Credit Card', 2147483647),
(5, 8000, 'CreditCard', 78679867);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Location`
--

CREATE TABLE `Location` (
  `locationID` int(11) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `Location`
--

INSERT INTO `Location` (`locationID`, `Name`, `Address`, `City`) VALUES
(1, 'Rent Linz 1', 'Harbachsiedlung 1', 'Linz'),
(2, 'Rent Wien 1', 'Kärtnerstraße 12', 'Wien'),
(3, 'Rent Linz 2', 'Salzburgerstraße 12', 'Linz'),
(4, 'Rent Graz 1', 'Grazer Straße', 'Graz'),
(5, 'Rent Salzburg 1', 'Tegetthoffstraße', 'Salzburg');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Model`
--

CREATE TABLE `Model` (
  `modelID` int(11) NOT NULL,
  `carId` int(11) DEFAULT NULL,
  `locationID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `Model`
--

INSERT INTO `Model` (`modelID`, `carId`, `locationID`) VALUES
(1, 1, 2),
(2, 3, 1),
(3, 2, 2),
(4, 4, 3),
(5, 4, 4),
(6, 2, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Rent`
--

CREATE TABLE `Rent` (
  `rentid` int(11) NOT NULL,
  `customerid` int(11) DEFAULT NULL,
  `idReservation` int(11) DEFAULT NULL,
  `modelID` int(11) DEFAULT NULL,
  `pickUPDate` date DEFAULT NULL,
  `returnCarDate` date DEFAULT NULL,
  `sumofCharge` int(11) DEFAULT NULL,
  `pickUpLocationID` int(11) DEFAULT NULL,
  `returnCarLocationID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `Rent`
--

INSERT INTO `Rent` (`rentid`, `customerid`, `idReservation`, `modelID`, `pickUPDate`, `returnCarDate`, `sumofCharge`, `pickUpLocationID`, `returnCarLocationID`) VALUES
(1, 1, 1, 1, '2016-02-03', '2016-02-06', 3000, 2, 2),
(2, 2, 2, 2, '2016-02-03', '2016-01-05', 5000, 1, 2),
(3, 3, 3, 3, '2015-01-03', '2015-02-02', 8000, 2, 1),
(4, 4, 4, 4, '2016-01-03', '2016-02-02', 9000, 4, 4),
(5, 5, 5, 5, '2017-01-01', '2017-02-01', 9000, 1, 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Reservation`
--

CREATE TABLE `Reservation` (
  `idReservation` int(11) NOT NULL,
  `fromDate` date DEFAULT NULL,
  `toDate` date DEFAULT NULL,
  `reservationDate` date DEFAULT NULL,
  `InvoiceId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `Reservation`
--

INSERT INTO `Reservation` (`idReservation`, `fromDate`, `toDate`, `reservationDate`, `InvoiceId`) VALUES
(1, '2016-02-03', '2016-02-06', '2016-01-31', 1),
(2, '2016-02-03', '2016-01-05', '0000-00-00', 2),
(3, '2015-01-03', '2015-02-02', '2016-03-03', 3),
(4, '2016-01-03', '2016-02-02', '2016-03-03', 4),
(5, '2017-01-01', '2017-02-01', '2017-02-01', 5);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `Car`
--
ALTER TABLE `Car`
  ADD PRIMARY KEY (`carId`);

--
-- Indizes für die Tabelle `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`customerId`);

--
-- Indizes für die Tabelle `Invoice`
--
ALTER TABLE `Invoice`
  ADD PRIMARY KEY (`InvoiceId`);

--
-- Indizes für die Tabelle `Location`
--
ALTER TABLE `Location`
  ADD PRIMARY KEY (`locationID`);

--
-- Indizes für die Tabelle `Model`
--
ALTER TABLE `Model`
  ADD PRIMARY KEY (`modelID`),
  ADD KEY `carId` (`carId`),
  ADD KEY `locationID` (`locationID`);

--
-- Indizes für die Tabelle `Rent`
--
ALTER TABLE `Rent`
  ADD PRIMARY KEY (`rentid`),
  ADD KEY `customerid` (`customerid`),
  ADD KEY `idReservation` (`idReservation`),
  ADD KEY `modelID` (`modelID`),
  ADD KEY `pickUpLocationID` (`pickUpLocationID`),
  ADD KEY `returnCarLocationID` (`returnCarLocationID`);

--
-- Indizes für die Tabelle `Reservation`
--
ALTER TABLE `Reservation`
  ADD PRIMARY KEY (`idReservation`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `Model`
--
ALTER TABLE `Model`
  ADD CONSTRAINT `Model_ibfk_1` FOREIGN KEY (`carId`) REFERENCES `Car` (`carId`),
  ADD CONSTRAINT `Model_ibfk_2` FOREIGN KEY (`locationID`) REFERENCES `Location` (`locationID`);

--
-- Constraints der Tabelle `Rent`
--
ALTER TABLE `Rent`
  ADD CONSTRAINT `Rent_ibfk_1` FOREIGN KEY (`customerid`) REFERENCES `Customer` (`customerId`),
  ADD CONSTRAINT `Rent_ibfk_2` FOREIGN KEY (`idReservation`) REFERENCES `Reservation` (`idReservation`),
  ADD CONSTRAINT `Rent_ibfk_3` FOREIGN KEY (`modelID`) REFERENCES `Model` (`modelID`),
  ADD CONSTRAINT `Rent_ibfk_4` FOREIGN KEY (`pickUpLocationID`) REFERENCES `Location` (`locationID`),
  ADD CONSTRAINT `Rent_ibfk_5` FOREIGN KEY (`returnCarLocationID`) REFERENCES `Location` (`locationID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

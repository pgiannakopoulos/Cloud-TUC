-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Φιλοξενητής: mysql
-- Χρόνος δημιουργίας: 26 Νοε 2019 στις 09:41:47
-- Έκδοση διακομιστή: 5.7.28
-- Έκδοση PHP: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Βάση δεδομένων: `mydb`
--

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `Students`
--

CREATE TABLE `Students` (
  `ID` varchar(255) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `SURNAME` varchar(255) DEFAULT NULL,
  `FATHERNAME` varchar(255) DEFAULT NULL,
  `GRADE` double DEFAULT NULL,
  `MOBILENUMBER` varchar(255) DEFAULT NULL,
  `Birthday` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `Students`
--

INSERT INTO `Students` (`ID`, `NAME`, `SURNAME`, `FATHERNAME`, `GRADE`, `MOBILENUMBER`, `Birthday`) VALUES
('1', 'Nikos', 'Nikolopoulos', 'Kostas', 8, '6975555555', '2019-11-19'),
('2', 'Kostas', 'Kostopoulos', 'Giannis', 6.5, '6982222222', '2019-11-22');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `Teachers`
--

CREATE TABLE `Teachers` (
  `ID` varchar(255) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `SURNAME` varchar(255) DEFAULT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `Teachers`
--

INSERT INTO `Teachers` (`ID`, `NAME`, `SURNAME`, `USERNAME`, `PASSWORD`, `EMAIL`) VALUES
('1234', 'Giannis', 'Giannopoulos', 'admin', 'password', 'admin@email.com');

--
-- Ευρετήρια για άχρηστους πίνακες
--

--
-- Ευρετήρια για πίνακα `Students`
--
ALTER TABLE `Students`
  ADD PRIMARY KEY (`ID`);

--
-- Ευρετήρια για πίνακα `Teachers`
--
ALTER TABLE `Teachers`
  ADD PRIMARY KEY (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

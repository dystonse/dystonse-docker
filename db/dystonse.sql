-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Erstellungszeit: 07. Mai 2020 um 18:36
-- Server-Version: 8.0.19
-- PHP-Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `dystonse`
--
CREATE DATABASE IF NOT EXISTS `dystonse` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `dystonse`;

-- --------------------------------------------------------
-- Von Hand exportiert und hierher kopiert, da Rechte sonst nicht vergeben wurden:
GRANT USAGE ON *.* TO `dystonse`@`%`;

GRANT ALL PRIVILEGES ON `dystonse`.* TO `dystonse`@`%`;
-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `records`
--

CREATE TABLE `records` (
  `source` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `route_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `route_variant` bigint UNSIGNED NOT NULL,
  `trip_id` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `date` date NOT NULL,
  `stop_sequence` tinyint NOT NULL,
  `stop_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `time_of_recording` timestamp NOT NULL,
  `delay_arrival` int DEFAULT NULL,
  `delay_departure` int DEFAULT NULL,
  `schedule_file_name` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indizes für die Tabelle `records`
--
ALTER TABLE `records`
  ADD PRIMARY KEY (`source`(5),`route_id`(10),`route_variant`,`trip_id`(10),`date`,`stop_sequence`);
COMMIT;



-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `predictions`
--

CREATE TABLE `predictions` (
  `source` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `event_type` tinyint NOT NULL,
  `stop_id` char(15) NOT NULL,
  `prediction_min` timestamp NOT NULL,
  `prediction_max` timestamp NOT NULL,
  `route_id` char(15) NOT NULL,
  `trip_id` char(15) NOT NULL,
  `trip_start_date` date NOT NULL,
  `trip_start_time` time NOT NULL,
  `stop_sequence` tinyint UNSIGNED NOT NULL,
  `prediction_type` tinyint UNSIGNED NOT NULL,
  `prediction_curve` binary(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indizes für die Tabelle `predictions`
--
ALTER TABLE `predictions`
  ADD PRIMARY KEY (`source`, `event_type`,`stop_sequence`,`trip_start_date`,`route_id`,`trip_id`,`trip_start_time`) USING BTREE,
  ADD KEY `timespan` (`source`, `prediction_min`,`prediction_max`,`stop_id`,`trip_start_date`) USING BTREE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

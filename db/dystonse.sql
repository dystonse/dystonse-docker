-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Erstellungszeit: 22. Mrz 2020 um 22:44
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
-- Tabellenstruktur für Tabelle `realtime`
--

CREATE TABLE `realtime` (
  `id` int NOT NULL,
  `trip_id` varchar(60) NOT NULL,
  `stop_id` varchar(80) NOT NULL,
  `route_id` varchar(80) NOT NULL,
  `stop_sequence` tinyint NOT NULL,
  `time_of_recording` timestamp NOT NULL,
  `time_arrival_schedule` timestamp NULL DEFAULT NULL,
  `time_arrival_estimate` timestamp NULL DEFAULT NULL,
  `time_departure_schedule` timestamp NULL DEFAULT NULL,
  `time_departure_estimate` timestamp NULL DEFAULT NULL,
  `mode` tinyint NOT NULL,
  `delay_arrival` int DEFAULT NULL,
  `delay_departure` int DEFAULT NULL,
  `source` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `realtime`
--
ALTER TABLE `realtime`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `realtime`
--
ALTER TABLE `realtime`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 31. Jul 2021 um 13:29
-- Server-Version: 10.1.30-MariaDB
-- PHP-Version: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `onlinecampus`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `adresse`
--

CREATE TABLE `adresse` (
  `id_adresse` int(11) NOT NULL,
  `strasse` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `hausnummer` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `ort` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `plz` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `klausur`
--

CREATE TABLE `klausur` (
  `id_klausur` int(11) NOT NULL,
  `id_modul` int(11) NOT NULL,
  `versuch` int(11) NOT NULL,
  `note` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `lehrende`
--

CREATE TABLE `lehrende` (
  `id_lehrender` int(11) NOT NULL,
  `vorname` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `nachname` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(40) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `modul`
--

CREATE TABLE `modul` (
  `id_modul` int(11) NOT NULL,
  `modul` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `bescheibung` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `modul_standort`
--

CREATE TABLE `modul_standort` (
  `id_modul` int(11) NOT NULL,
  `id_standort` int(11) NOT NULL,
  `semester` date NOT NULL,
  `id_modul_standort` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `modul_standort_studierende`
--

CREATE TABLE `modul_standort_studierende` (
  `id_studierende` int(11) NOT NULL,
  `id_modul_standort` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `modul_studiengang`
--

CREATE TABLE `modul_studiengang` (
  `id_modul` int(11) NOT NULL,
  `id_studiengang` int(11) NOT NULL,
  `semster` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `modul_termin`
--

CREATE TABLE `modul_termin` (
  `id_modul_standort` int(11) NOT NULL,
  `id_termin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `standort`
--

CREATE TABLE `standort` (
  `id_standort` int(11) NOT NULL,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `ort` varchar(40) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `studiengang`
--

CREATE TABLE `studiengang` (
  `id_studiengang` int(11) NOT NULL,
  `studiengang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `studierender`
--

CREATE TABLE `studierender` (
  `id_studierender` int(11) NOT NULL,
  `studienbegin` date NOT NULL,
  `vorname` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `nachname` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `geburtsdatum` date NOT NULL,
  `studiengang_id` int(11) NOT NULL,
  `email` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `matrikelnummer` int(11) NOT NULL,
  `image_path` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `studierender`
--

INSERT INTO `studierender` (`id_studierender`, `studienbegin`, `vorname`, `nachname`, `geburtsdatum`, `studiengang_id`, `email`, `matrikelnummer`, `image_path`) VALUES
(1, '2019-09-01', 'Marc', 'Wiemann', '1999-09-20', 1, 'marc-wiemann@gmx.net', 532455, ''),
(2, '2019-09-01', 'Jayachandran', 'Arhsuthdan', '0000-00-00', 2, '', 0, '');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `studierender_adresse`
--

CREATE TABLE `studierender_adresse` (
  `id_studierender` int(11) NOT NULL,
  `id_adresse` int(11) NOT NULL,
  `art` varchar(40) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `studierender_klausur`
--

CREATE TABLE `studierender_klausur` (
  `id_studierender` int(11) NOT NULL,
  `id_klausur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `termin`
--

CREATE TABLE `termin` (
  `id_termin` int(11) NOT NULL,
  `id_standort` int(11) NOT NULL,
  `id_lehrender` int(11) NOT NULL,
  `termin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `adresse`
--
ALTER TABLE `adresse`
  ADD PRIMARY KEY (`id_adresse`);

--
-- Indizes für die Tabelle `klausur`
--
ALTER TABLE `klausur`
  ADD PRIMARY KEY (`id_klausur`),
  ADD UNIQUE KEY `id_modul` (`id_modul`);

--
-- Indizes für die Tabelle `lehrende`
--
ALTER TABLE `lehrende`
  ADD PRIMARY KEY (`id_lehrender`);

--
-- Indizes für die Tabelle `modul`
--
ALTER TABLE `modul`
  ADD PRIMARY KEY (`id_modul`);

--
-- Indizes für die Tabelle `modul_standort`
--
ALTER TABLE `modul_standort`
  ADD PRIMARY KEY (`id_modul_standort`),
  ADD UNIQUE KEY `id_modul` (`id_modul`),
  ADD UNIQUE KEY `id_standort` (`id_standort`);

--
-- Indizes für die Tabelle `modul_standort_studierende`
--
ALTER TABLE `modul_standort_studierende`
  ADD UNIQUE KEY `id_studierende` (`id_studierende`),
  ADD UNIQUE KEY `id_modul_standort` (`id_modul_standort`);

--
-- Indizes für die Tabelle `modul_studiengang`
--
ALTER TABLE `modul_studiengang`
  ADD UNIQUE KEY `id_modul` (`id_modul`),
  ADD UNIQUE KEY `id_studiengang` (`id_studiengang`);

--
-- Indizes für die Tabelle `modul_termin`
--
ALTER TABLE `modul_termin`
  ADD UNIQUE KEY `id_modul_standort` (`id_modul_standort`),
  ADD UNIQUE KEY `id_termin` (`id_termin`);

--
-- Indizes für die Tabelle `standort`
--
ALTER TABLE `standort`
  ADD PRIMARY KEY (`id_standort`);

--
-- Indizes für die Tabelle `studiengang`
--
ALTER TABLE `studiengang`
  ADD PRIMARY KEY (`id_studiengang`);

--
-- Indizes für die Tabelle `studierender`
--
ALTER TABLE `studierender`
  ADD PRIMARY KEY (`id_studierender`),
  ADD UNIQUE KEY `studiengang_id` (`studiengang_id`);

--
-- Indizes für die Tabelle `studierender_adresse`
--
ALTER TABLE `studierender_adresse`
  ADD UNIQUE KEY `id_user` (`id_studierender`),
  ADD UNIQUE KEY `id_adresse` (`id_adresse`);

--
-- Indizes für die Tabelle `studierender_klausur`
--
ALTER TABLE `studierender_klausur`
  ADD UNIQUE KEY `id_studierender` (`id_studierender`),
  ADD UNIQUE KEY `id_klausur` (`id_klausur`);

--
-- Indizes für die Tabelle `termin`
--
ALTER TABLE `termin`
  ADD PRIMARY KEY (`id_termin`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `adresse`
--
ALTER TABLE `adresse`
  MODIFY `id_adresse` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `klausur`
--
ALTER TABLE `klausur`
  MODIFY `id_klausur` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `lehrende`
--
ALTER TABLE `lehrende`
  MODIFY `id_lehrender` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `modul`
--
ALTER TABLE `modul`
  MODIFY `id_modul` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `modul_standort`
--
ALTER TABLE `modul_standort`
  MODIFY `id_modul_standort` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `studiengang`
--
ALTER TABLE `studiengang`
  MODIFY `id_studiengang` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `studierender`
--
ALTER TABLE `studierender`
  MODIFY `id_studierender` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `termin`
--
ALTER TABLE `termin`
  MODIFY `id_termin` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `klausur`
--
ALTER TABLE `klausur`
  ADD CONSTRAINT `klausur_ibfk_1` FOREIGN KEY (`id_klausur`) REFERENCES `studierender` (`id_studierender`);

--
-- Constraints der Tabelle `modul_studiengang`
--
ALTER TABLE `modul_studiengang`
  ADD CONSTRAINT `modul_studiengang_ibfk_1` FOREIGN KEY (`id_modul`) REFERENCES `modul` (`id_modul`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

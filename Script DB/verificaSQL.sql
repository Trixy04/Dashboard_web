-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Creato il: Gen 20, 2023 alle 23:24
-- Versione del server: 5.7.34
-- Versione PHP: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `verificaSQL`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `Auto`
--

CREATE TABLE `Auto` (
  `Targa` varchar(255) NOT NULL,
  `Marca` varchar(255) DEFAULT NULL,
  `Modello` varchar(255) DEFAULT NULL,
  `Cilindrata` float DEFAULT NULL,
  `Potenza` float DEFAULT NULL,
  `CodFiscaleProprietario` varchar(255) DEFAULT NULL,
  `CodicePolizza` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `Auto`
--

INSERT INTO `Auto` (`Targa`, `Marca`, `Modello`, `Cilindrata`, `Potenza`, `CodFiscaleProprietario`, `CodicePolizza`) VALUES
('DS701AS', 'Lancia', 'Ypsilon', 1000, 35, 'CTRKDJ39T01B150R', '23456'),
('EA665LD', 'Renault', 'Scenic XMOD', 1600, 75, 'TRCMTT04P13D612R', '12345');

-- --------------------------------------------------------

--
-- Struttura della tabella `Citta`
--

CREATE TABLE `Citta` (
  `Codice` varchar(255) NOT NULL,
  `NomeCitta` varchar(255) DEFAULT NULL,
  `Provincia` varchar(255) DEFAULT NULL,
  `Regione` varchar(255) DEFAULT NULL,
  `Nazione` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `Citta`
--

INSERT INTO `Citta` (`Codice`, `NomeCitta`, `Provincia`, `Regione`, `Nazione`) VALUES
('fir', 'Firenze', 'FI', 'Toscana', 'Italia'),
('mil', 'Milano', 'MI', 'Lombardia', 'Italia');

-- --------------------------------------------------------

--
-- Struttura della tabella `CompagniaAssicurativa`
--

CREATE TABLE `CompagniaAssicurativa` (
  `Codice` varchar(255) NOT NULL,
  `Nome` varchar(255) DEFAULT NULL,
  `CittaSedeLegale` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `CompagniaAssicurativa`
--

INSERT INTO `CompagniaAssicurativa` (`Codice`, `Nome`, `CittaSedeLegale`) VALUES
('as-194', 'sicurAuto', 'fir'),
('gen-01', 'Generali', 'mil'),
('vit-02', 'Ass. Vittoria', 'fir');

-- --------------------------------------------------------

--
-- Struttura stand-in per le viste `nomecf`
-- (Vedi sotto per la vista effettiva)
--
CREATE TABLE `nomecf` (
`CodFiscale` varchar(255)
,`Cognome` varchar(255)
,`Nome` varchar(255)
,`CittaResidenza` varchar(255)
,`Via` varchar(255)
,`Cap` varchar(255)
,`NumCivico` varchar(255)
,`Targa` varchar(255)
,`Marca` varchar(255)
,`Modello` varchar(255)
,`Cilindrata` float
,`Potenza` float
,`CodFiscaleProprietario` varchar(255)
,`CodicePolizza` varchar(255)
,`Codice` varchar(255)
,`NomeCitta` varchar(255)
,`Provincia` varchar(255)
,`Regione` varchar(255)
,`Nazione` varchar(255)
);

-- --------------------------------------------------------

--
-- Struttura della tabella `Polizza`
--

CREATE TABLE `Polizza` (
  `Codice` varchar(255) NOT NULL,
  `DataScadenza` date DEFAULT NULL,
  `CodiceCompagniaAssicurativa` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `Polizza`
--

INSERT INTO `Polizza` (`Codice`, `DataScadenza`, `CodiceCompagniaAssicurativa`) VALUES
('12345', '2024-04-30', 'gen-01'),
('23456', '2023-12-31', 'vit-02');

-- --------------------------------------------------------

--
-- Struttura della tabella `Proprietario`
--

CREATE TABLE `Proprietario` (
  `CodFiscale` varchar(255) NOT NULL,
  `Cognome` varchar(255) DEFAULT NULL,
  `Nome` varchar(255) DEFAULT NULL,
  `CittaResidenza` varchar(255) DEFAULT NULL,
  `Via` varchar(255) DEFAULT NULL,
  `Cap` varchar(255) DEFAULT NULL,
  `NumCivico` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `Proprietario`
--

INSERT INTO `Proprietario` (`CodFiscale`, `Cognome`, `Nome`, `CittaResidenza`, `Via`, `Cap`, `NumCivico`) VALUES
('CTRKDJ39T01B150R', 'CATARINELLA', 'KLAUDJAN', 'mil', 'via romana', '45678', '14'),
('TRCMTT04P13D612R', 'Teriaca', 'Mattia', 'fir', 'Via Alfredo Contini', '50019', '7');

-- --------------------------------------------------------

--
-- Struttura della tabella `userData`
--

CREATE TABLE `userData` (
  `nome` varchar(255) DEFAULT NULL,
  `cognome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `userData`
--

INSERT INTO `userData` (`nome`, `cognome`, `email`, `pass`) VALUES
('Rigers', 'Gjinaj', 'pippo@example.com', 'OttriaBuco!'),
('Mirko', 'Ragusa', 'ragusamirko@gmail.com', 'ProvaMirko!'),
('Alessia', 'Rocchini', 'rocchinialessia@gmail.com', 'AlessiaNonsaInformatica!'),
('Mattia', 'Teriaca', 'teriaca.mattia@gmail.com', 'ProvaMattia!');

-- --------------------------------------------------------

--
-- Struttura per vista `nomecf`
--
DROP TABLE IF EXISTS `nomecf`;

CREATE ALGORITHM=UNDEFINED DEFINER=`mamp`@`localhost` SQL SECURITY DEFINER VIEW `nomecf`  AS SELECT `proprietario`.`CodFiscale` AS `CodFiscale`, `proprietario`.`Cognome` AS `Cognome`, `proprietario`.`Nome` AS `Nome`, `proprietario`.`CittaResidenza` AS `CittaResidenza`, `proprietario`.`Via` AS `Via`, `proprietario`.`Cap` AS `Cap`, `proprietario`.`NumCivico` AS `NumCivico`, `auto`.`Targa` AS `Targa`, `auto`.`Marca` AS `Marca`, `auto`.`Modello` AS `Modello`, `auto`.`Cilindrata` AS `Cilindrata`, `auto`.`Potenza` AS `Potenza`, `auto`.`CodFiscaleProprietario` AS `CodFiscaleProprietario`, `auto`.`CodicePolizza` AS `CodicePolizza`, `citta`.`Codice` AS `Codice`, `citta`.`NomeCitta` AS `NomeCitta`, `citta`.`Provincia` AS `Provincia`, `citta`.`Regione` AS `Regione`, `citta`.`Nazione` AS `Nazione` FROM ((`proprietario` join `auto` on((`proprietario`.`CodFiscale` = `auto`.`CodFiscaleProprietario`))) join `citta` on((`proprietario`.`CittaResidenza` = `citta`.`Codice`))) WHERE ((`citta`.`Regione` = 'Lombardia') AND (`auto`.`Cilindrata` > 1000)) ;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `Auto`
--
ALTER TABLE `Auto`
  ADD PRIMARY KEY (`Targa`),
  ADD KEY `CodFiscaleProprietario` (`CodFiscaleProprietario`),
  ADD KEY `CodicePolizza` (`CodicePolizza`);

--
-- Indici per le tabelle `Citta`
--
ALTER TABLE `Citta`
  ADD PRIMARY KEY (`Codice`);

--
-- Indici per le tabelle `CompagniaAssicurativa`
--
ALTER TABLE `CompagniaAssicurativa`
  ADD PRIMARY KEY (`Codice`),
  ADD KEY `CittaSedeLegale` (`CittaSedeLegale`);

--
-- Indici per le tabelle `Polizza`
--
ALTER TABLE `Polizza`
  ADD PRIMARY KEY (`Codice`),
  ADD KEY `CodiceCompagniaAssicurativa` (`CodiceCompagniaAssicurativa`);

--
-- Indici per le tabelle `Proprietario`
--
ALTER TABLE `Proprietario`
  ADD PRIMARY KEY (`CodFiscale`),
  ADD KEY `CittaResidenza` (`CittaResidenza`);

--
-- Indici per le tabelle `userData`
--
ALTER TABLE `userData`
  ADD PRIMARY KEY (`email`);

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `Auto`
--
ALTER TABLE `Auto`
  ADD CONSTRAINT `auto_ibfk_1` FOREIGN KEY (`CodFiscaleProprietario`) REFERENCES `Proprietario` (`CodFiscale`),
  ADD CONSTRAINT `auto_ibfk_2` FOREIGN KEY (`CodicePolizza`) REFERENCES `Polizza` (`Codice`);

--
-- Limiti per la tabella `CompagniaAssicurativa`
--
ALTER TABLE `CompagniaAssicurativa`
  ADD CONSTRAINT `compagniaassicurativa_ibfk_1` FOREIGN KEY (`CittaSedeLegale`) REFERENCES `Citta` (`Codice`);

--
-- Limiti per la tabella `Polizza`
--
ALTER TABLE `Polizza`
  ADD CONSTRAINT `polizza_ibfk_1` FOREIGN KEY (`CodiceCompagniaAssicurativa`) REFERENCES `CompagniaAssicurativa` (`Codice`);

--
-- Limiti per la tabella `Proprietario`
--
ALTER TABLE `Proprietario`
  ADD CONSTRAINT `proprietario_ibfk_1` FOREIGN KEY (`CittaResidenza`) REFERENCES `Citta` (`Codice`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

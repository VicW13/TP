-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 13 oct. 2021 à 14:44
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bddrh`
--

-- --------------------------------------------------------

--
-- Structure de la table `contrat`
--

DROP TABLE IF EXISTS `contrat`;
CREATE TABLE IF NOT EXISTS `contrat` (
  `id` int(9) NOT NULL,
  `dateDebut` date DEFAULT NULL,
  `dateFin` date DEFAULT NULL,
  `idSal` varchar(6) NOT NULL,
  `idPoste` int(2) NOT NULL,
  `idService` varchar(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idPoste` (`idPoste`),
  KEY `idSal` (`idSal`),
  KEY `idService` (`idService`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `contrat`
--

INSERT INTO `contrat` (`id`, `dateDebut`, `dateFin`, `idSal`, `idPoste`, `idService`) VALUES
(1977102, '1977-03-15', '1985-03-01', '148A12', 1, 'B01'),
(1985076, '1985-03-01', '2002-09-15', '148A12', 3, 'F01'),
(2000098, '2000-09-01', '2010-10-10', '156A12', 4, 'G01'),
(2002181, '2002-09-15', NULL, '148A12', 2, 'F01'),
(2008045, '2008-05-05', '2008-10-17', '196A12', 1, 'E21'),
(2008111, '2008-10-17', NULL, '196A12', 6, 'F01'),
(2010065, '2010-10-10', NULL, '156A12', 5, 'G01');

-- --------------------------------------------------------

--
-- Structure de la table `poste`
--

DROP TABLE IF EXISTS `poste`;
CREATE TABLE IF NOT EXISTS `poste` (
  `id` int(11) NOT NULL,
  `libelle` varchar(100) NOT NULL,
  `caracteristique` varchar(500) NOT NULL,
  `indice` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `poste`
--

INSERT INTO `poste` (`id`, `libelle`, `caracteristique`, `indice`) VALUES
(1, 'Magasinier(e)', 'Magasinier(e) en réserve', 358),
(2, 'Responsable informatique', 'Gestion équipe de 2 à 3 personnes', 455),
(3, 'Informaticien(ne)', 'Maintenance technique', 395),
(4, 'Hôte(sse) de caisse', 'Rotation horaire et week-end', 365),
(5, 'Chargé(e) d\'équipe', 'Rotation horaire et week-end', 430),
(6, 'Commercial(e)', 'Poste en rayon', 400);

-- --------------------------------------------------------

--
-- Structure de la table `salarie`
--

DROP TABLE IF EXISTS `salarie`;
CREATE TABLE IF NOT EXISTS `salarie` (
  `id` varchar(6) NOT NULL,
  `numSecu` varchar(15) NOT NULL,
  `nom` varchar(40) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `dateNaiss` date NOT NULL,
  `dateEmbauche` date NOT NULL,
  `tel` varchar(10) NOT NULL,
  `mail` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `salarie`
--

INSERT INTO `salarie` (`id`, `numSecu`, `nom`, `prenom`, `dateNaiss`, `dateEmbauche`, `tel`, `mail`) VALUES
('148A12', '1520814168026', 'MARTIN', 'Pierre', '1952-08-05', '1977-03-15', '038312XXXX', 'pierre.martin@proxim.fr'),
('156A12', '2671154395023', 'ESTEN', 'Solène', '1967-11-18', '1967-11-18', '038347XXXX', 'solene.esten@proxim.fr'),
('196A12', '2820388485089', 'BENARBIA', 'Samia', '1982-03-28', '2008-05-05', '066746XXXX', 'saia.benarbia@proxim.fr');

-- --------------------------------------------------------

--
-- Structure de la table `service`
--

DROP TABLE IF EXISTS `service`;
CREATE TABLE IF NOT EXISTS `service` (
  `id` varchar(4) NOT NULL,
  `libelle` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `service`
--

INSERT INTO `service` (`id`, `libelle`) VALUES
('A00', 'Direction gnérale'),
('B01', 'Approvisionnement'),
('C01', 'Comptabilité'),
('D01', 'Service après vente'),
('D11', 'Boucherie'),
('D21', 'Boulangerie'),
('E01', 'Epicerie'),
('E11', 'Produits frais'),
('E21', 'Electroménager'),
('E31', 'Animalerie et jardin'),
('F01', 'Informatique'),
('F02', 'Ressources humaines'),
('G01', 'Caisse');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `contrat`
--
ALTER TABLE `contrat`
  ADD CONSTRAINT `contrat_ibfk_1` FOREIGN KEY (`idPoste`) REFERENCES `poste` (`id`),
  ADD CONSTRAINT `contrat_ibfk_2` FOREIGN KEY (`idSal`) REFERENCES `salarie` (`id`),
  ADD CONSTRAINT `contrat_ibfk_3` FOREIGN KEY (`idService`) REFERENCES `service` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

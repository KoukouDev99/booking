-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 18 août 2026 à 00:26
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `booking`
--

-- --------------------------------------------------------

--
-- Structure de la table `booking`
--

CREATE TABLE `booking` (
  `id_booking` int(11) NOT NULL,
  `id_client` int(11) DEFAULT NULL,
  `id_hotel` int(11) DEFAULT NULL,
  `id_chambre` int(11) DEFAULT NULL,
  `dateD` date NOT NULL,
  `dateF` date NOT NULL,
  `date_booking` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `booking`
--

INSERT INTO `booking` (`id_booking`, `id_client`, `id_hotel`, `id_chambre`, `dateD`, `dateF`, `date_booking`) VALUES
(1, 18, 1, 1, '2026-08-17', '2026-08-18', '2026-08-17 23:18:52'),
(2, 19, 3, 10, '2026-08-21', '2026-08-27', '2026-08-17 23:26:10'),
(3, 20, 3, 11, '2026-08-21', '2026-08-27', '2026-08-17 23:26:29'),
(4, 21, 1, 1, '2026-08-19', '2026-08-21', '2026-08-18 00:02:11');

-- --------------------------------------------------------

--
-- Structure de la table `chambres`
--

CREATE TABLE `chambres` (
  `id_chambre` int(11) NOT NULL,
  `id_hotel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `chambres`
--

INSERT INTO `chambres` (`id_chambre`, `id_hotel`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 3),
(11, 3),
(12, 3),
(13, 4),
(14, 4),
(15, 4),
(16, 5),
(17, 5),
(18, 5),
(19, 5),
(20, 5);

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE `clients` (
  `id_client` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`id_client`, `nom`, `email`) VALUES
(18, 'aaa', 'aaa@gmail.com'),
(19, 'vvvv', 'vvv@gmail.com'),
(20, 'vvvv', 'vvv@gmail.com'),
(21, 'aaazzzz', 'zzzz@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `hotels`
--

CREATE TABLE `hotels` (
  `id_hotel` int(11) NOT NULL,
  `nom_hotel` varchar(250) NOT NULL,
  `address_hotel` varchar(50) NOT NULL,
  `description_hotel` text DEFAULT NULL,
  `prix` decimal(8,2) DEFAULT NULL,
  `etoile` int(11) DEFAULT NULL,
  `image_hotel` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `hotels`
--

INSERT INTO `hotels` (`id_hotel`, `nom_hotel`, `address_hotel`, `description_hotel`, `prix`, `etoile`, `image_hotel`) VALUES
(1, 'Hôtel Eiffel Horizon Paris', '12 Rue de Grenelle, 75007 Paris', 'Hôtel élégant situé au cœur de Paris, proche de la Tour Eiffel.', 220.00, 4, 'paris.jpg'),
(2, 'Barcelona Mar Hotel', '25 Carrer de Mallorca, 08008 Barcelona', 'Hôtel moderne situé au centre de Barcelone.', 180.00, 3, 'barcelone.jpg'),
(3, 'Roma Palace Hotel', '18 Via Nazionale, 00184 Roma', 'Hôtel confortable permettant de découvrir facilement le Colisée.', 160.00, 4, 'rome.jpg'),
(4, 'Marrakech Garden Resort', '45 Avenue Mohammed VI, 40000 Marrakech', 'Hôtel luxueux avec jardin, piscine et spa.', 190.00, 5, 'marrakech.jpg'),
(5, 'Dubai Marina Hotel', '8 Marina Walk, Dubai', 'Hôtel haut de gamme situé près de la marina, avec piscine.', 350.00, 4, 'dubai.jpg');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id_booking`),
  ADD KEY `id_client` (`id_client`),
  ADD KEY `id_hotel` (`id_hotel`),
  ADD KEY `id_chambre` (`id_chambre`);

--
-- Index pour la table `chambres`
--
ALTER TABLE `chambres`
  ADD PRIMARY KEY (`id_chambre`),
  ADD KEY `id_hotel` (`id_hotel`);

--
-- Index pour la table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id_client`);

--
-- Index pour la table `hotels`
--
ALTER TABLE `hotels`
  ADD PRIMARY KEY (`id_hotel`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `booking`
--
ALTER TABLE `booking`
  MODIFY `id_booking` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `chambres`
--
ALTER TABLE `chambres`
  MODIFY `id_chambre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `clients`
--
ALTER TABLE `clients`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pour la table `hotels`
--
ALTER TABLE `hotels`
  MODIFY `id_hotel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_client`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`id_hotel`) REFERENCES `hotels` (`id_hotel`),
  ADD CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`id_chambre`) REFERENCES `chambres` (`id_chambre`);

--
-- Contraintes pour la table `chambres`
--
ALTER TABLE `chambres`
  ADD CONSTRAINT `chambres_ibfk_1` FOREIGN KEY (`id_hotel`) REFERENCES `hotels` (`id_hotel`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

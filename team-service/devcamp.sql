-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : lun. 26 mai 2025 à 19:23
-- Version du serveur : 10.6.22-MariaDB-0ubuntu0.22.04.1
-- Version de PHP : 8.1.2-1ubuntu2.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `devcamp`
--

-- --------------------------------------------------------

--
-- Structure de la table `Equipe`
--

CREATE TABLE `Equipe` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `nationalite` varchar(100) DEFAULT NULL,
  `mot_cle` varchar(100) DEFAULT NULL,
  `points` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `Equipe`
--

INSERT INTO `Equipe` (`id`, `nom`, `nationalite`, `mot_cle`, `points`) VALUES
(1, 'Explorateurs', 'Canada', 'nature', 0),
(2, 'Chasseurs de trésors', 'France', 'or', 0),
(3, 'Team Nord', 'Suède', 'arctique', 0);

-- --------------------------------------------------------

--
-- Structure de la table `Geocache`
--

CREATE TABLE `Geocache` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `ville` varchar(100) NOT NULL,
  `longitude` int(11) NOT NULL,
  `latitude` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `Geocache`
--

INSERT INTO `Geocache` (`id`, `nom`, `ville`, `longitude`, `latitude`) VALUES
(1, 'matane-centreville-1', 'Matane', 35, 37),
(2, 'matane-cegep-1', 'Matane', 35, 36),
(3, 'rimouski-marina-1', 'Rimouski', 33, 36);

-- --------------------------------------------------------

--
-- Structure de la table `Joueur`
--

CREATE TABLE `Joueur` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `equipe_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `Joueur`
--

INSERT INTO `Joueur` (`id`, `nom`, `equipe_id`) VALUES
(1, 'Alice', 1),
(2, 'Bob', 1),
(3, 'Charlie', 3),
(4, 'Denis', 2),
(5, 'Emma', 2);

-- --------------------------------------------------------

--
-- Structure de la table `Visite`
--

CREATE TABLE `Visite` (
  `id` int(11) NOT NULL,
  `joueur_id` int(11) NOT NULL,
  `geocache_id` int(11) NOT NULL,
  `moment` datetime NOT NULL,
  `commentaire` text DEFAULT NULL,
  `comptabilisee` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `Visite`
--

INSERT INTO `Visite` (`id`, `joueur_id`, `geocache_id`, `moment`, `commentaire`, `comptabilisee`) VALUES
(1, 1, 1, '2025-05-20 10:00:00', 'Trouvée sous une roche', 0),
(2, 2, 2, '2025-05-20 11:00:00', 'Près du Cégep', 0),
(3, 3, 1, '2025-05-21 09:30:00', 'Cachée derrière un arbre', 0),
(4, 4, 3, '2025-05-21 14:45:00', 'Facile à trouver', 0),
(5, 5, 2, '2025-05-22 16:10:00', 'Juste sous un banc', 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Equipe`
--
ALTER TABLE `Equipe`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Geocache`
--
ALTER TABLE `Geocache`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Joueur`
--
ALTER TABLE `Joueur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_joueur_equipe` (`equipe_id`);

--
-- Index pour la table `Visite`
--
ALTER TABLE `Visite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `joueur_id` (`joueur_id`),
  ADD KEY `geocache_id` (`geocache_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Equipe`
--
ALTER TABLE `Equipe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `Geocache`
--
ALTER TABLE `Geocache`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `Joueur`
--
ALTER TABLE `Joueur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `Visite`
--
ALTER TABLE `Visite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Joueur`
--
ALTER TABLE `Joueur`
  ADD CONSTRAINT `fk_joueur_equipe` FOREIGN KEY (`equipe_id`) REFERENCES `Equipe` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `Visite`
--
ALTER TABLE `Visite`
  ADD CONSTRAINT `Visite_ibfk_1` FOREIGN KEY (`joueur_id`) REFERENCES `Joueur` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `Visite_ibfk_2` FOREIGN KEY (`geocache_id`) REFERENCES `Geocache` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

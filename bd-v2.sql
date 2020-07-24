-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jul 24, 2020 at 08:14 AM
-- Server version: 5.7.26
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `jm-p4`
--

-- --------------------------------------------------------

--
-- Table structure for table `adresse_client`
--

CREATE TABLE `adresse_client` (
  `id` int(11) NOT NULL,
  `numero_rue` int(11) NOT NULL,
  `nom_rue` varchar(255) NOT NULL,
  `code_immeuble` varchar(255) NOT NULL,
  `code_postal` varchar(255) NOT NULL,
  `ville` varchar(255) NOT NULL,
  `longitude` float NOT NULL,
  `latitude` float NOT NULL,
  `telephone` varchar(255) NOT NULL,
  `indications` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `avis_client`
--

CREATE TABLE `avis_client` (
  `id` int(11) NOT NULL,
  `note` int(11) NOT NULL,
  `contenu` text NOT NULL,
  `commande_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `telephone` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `commande`
--

CREATE TABLE `commande` (
  `id` int(11) NOT NULL,
  `commande_en_cours` tinyint(1) NOT NULL,
  `date_commande` datetime NOT NULL,
  `client_id` int(11) NOT NULL,
  `livreur_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `community_manager`
--

CREATE TABLE `community_manager` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `telephone` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cuisinier`
--

CREATE TABLE `cuisinier` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telephone` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `directeur`
--

CREATE TABLE `directeur` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `telephone` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `facturation`
--

CREATE TABLE `facturation` (
  `id` int(11) NOT NULL,
  `paiement_en_ligne` tinyint(1) NOT NULL,
  `paiement_effectue` tinyint(1) NOT NULL,
  `commande_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `livreur`
--

CREATE TABLE `livreur` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `telephone` varchar(255) NOT NULL,
  `longitude` float NOT NULL,
  `latitude` float NOT NULL,
  `est_disponible` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `plat`
--

CREATE TABLE `plat` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `quantite` int(11) NOT NULL,
  `date` date NOT NULL,
  `prix` float NOT NULL,
  `community_manager_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `plat_commande`
--

CREATE TABLE `plat_commande` (
  `plat_id` int(11) NOT NULL,
  `commande_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `probleme_recette`
--

CREATE TABLE `probleme_recette` (
  `id` int(11) NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `contenu` text NOT NULL,
  `reponse` text NOT NULL,
  `community_manager_id` int(11) NOT NULL,
  `cuisinier_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `recette`
--

CREATE TABLE `recette` (
  `id` int(11) NOT NULL,
  `etapes_preparation` int(11) NOT NULL,
  `date_debut_recette` date NOT NULL,
  `date_fin_recette` date NOT NULL,
  `cuisinier_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `technicien`
--

CREATE TABLE `technicien` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `telephone` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adresse_client`
--
ALTER TABLE `adresse_client`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `avis_client`
--
ALTER TABLE `avis_client`
  ADD PRIMARY KEY (`id`),
  ADD KEY `commande_id` (`commande_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `livreur_id` (`livreur_id`);

--
-- Indexes for table `community_manager`
--
ALTER TABLE `community_manager`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cuisinier`
--
ALTER TABLE `cuisinier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `directeur`
--
ALTER TABLE `directeur`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `facturation`
--
ALTER TABLE `facturation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `commande_id` (`commande_id`);

--
-- Indexes for table `livreur`
--
ALTER TABLE `livreur`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plat`
--
ALTER TABLE `plat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `community_manager_id` (`community_manager_id`);

--
-- Indexes for table `plat_commande`
--
ALTER TABLE `plat_commande`
  ADD PRIMARY KEY (`plat_id`,`commande_id`),
  ADD KEY `commande_id` (`commande_id`);

--
-- Indexes for table `probleme_recette`
--
ALTER TABLE `probleme_recette`
  ADD PRIMARY KEY (`id`),
  ADD KEY `community_manager_id` (`community_manager_id`),
  ADD KEY `cuisinier_id` (`cuisinier_id`);

--
-- Indexes for table `recette`
--
ALTER TABLE `recette`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cuisinier_id` (`cuisinier_id`);

--
-- Indexes for table `technicien`
--
ALTER TABLE `technicien`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adresse_client`
--
ALTER TABLE `adresse_client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `avis_client`
--
ALTER TABLE `avis_client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `commande`
--
ALTER TABLE `commande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `community_manager`
--
ALTER TABLE `community_manager`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cuisinier`
--
ALTER TABLE `cuisinier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `directeur`
--
ALTER TABLE `directeur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `facturation`
--
ALTER TABLE `facturation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `livreur`
--
ALTER TABLE `livreur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plat`
--
ALTER TABLE `plat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `probleme_recette`
--
ALTER TABLE `probleme_recette`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recette`
--
ALTER TABLE `recette`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `technicien`
--
ALTER TABLE `technicien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `avis_client`
--
ALTER TABLE `avis_client`
  ADD CONSTRAINT `avis_client_ibfk_1` FOREIGN KEY (`commande_id`) REFERENCES `commande` (`id`),
  ADD CONSTRAINT `avis_client_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`);

--
-- Constraints for table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `commande_ibfk_2` FOREIGN KEY (`livreur_id`) REFERENCES `livreur` (`id`);

--
-- Constraints for table `facturation`
--
ALTER TABLE `facturation`
  ADD CONSTRAINT `facturation_ibfk_1` FOREIGN KEY (`commande_id`) REFERENCES `commande` (`id`);

--
-- Constraints for table `plat`
--
ALTER TABLE `plat`
  ADD CONSTRAINT `plat_ibfk_1` FOREIGN KEY (`community_manager_id`) REFERENCES `community_manager` (`id`);

--
-- Constraints for table `plat_commande`
--
ALTER TABLE `plat_commande`
  ADD CONSTRAINT `plat_commande_ibfk_1` FOREIGN KEY (`commande_id`) REFERENCES `commande` (`id`),
  ADD CONSTRAINT `plat_commande_ibfk_2` FOREIGN KEY (`plat_id`) REFERENCES `plat` (`id`);

--
-- Constraints for table `probleme_recette`
--
ALTER TABLE `probleme_recette`
  ADD CONSTRAINT `probleme_recette_ibfk_1` FOREIGN KEY (`community_manager_id`) REFERENCES `community_manager` (`id`),
  ADD CONSTRAINT `probleme_recette_ibfk_2` FOREIGN KEY (`cuisinier_id`) REFERENCES `cuisinier` (`id`);

--
-- Constraints for table `recette`
--
ALTER TABLE `recette`
  ADD CONSTRAINT `recette_ibfk_1` FOREIGN KEY (`cuisinier_id`) REFERENCES `cuisinier` (`id`);


-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 18 nov. 2024 à 12:19
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
-- Base de données : `child_welfare`
--

-- --------------------------------------------------------

--
-- Structure de la table `abuse_reports`
--

CREATE TABLE `abuse_reports` (
  `report_id` int(11) NOT NULL,
  `child_name` varchar(255) NOT NULL,
  `date_of_report` date NOT NULL,
  `status` varchar(50) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `abuse_reports`
--

INSERT INTO `abuse_reports` (`report_id`, `child_name`, `date_of_report`, `status`, `last_update`, `created_at`) VALUES
(1, 'kenn', '2024-11-08', 'admin', '2024-11-16 20:17:32', '2024-11-16 20:17:32'),
(2, 'kenn', '2024-11-13', 'admin', '2024-11-16 20:18:01', '2024-11-16 20:18:01'),
(3, 'kenn', '2024-11-13', 'admin', '2024-11-16 20:18:03', '2024-11-16 20:18:03'),
(4, 'kenn', '2024-11-13', 'admin', '2024-11-16 20:23:01', '2024-11-16 20:23:01'),
(5, 'kenn', '2024-11-22', 'admin', '2024-11-16 20:23:09', '2024-11-16 20:23:09');

-- --------------------------------------------------------

--
-- Structure de la table `cases`
--

CREATE TABLE `cases` (
  `id` int(11) NOT NULL,
  `child_name` varchar(100) NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `case_status` varchar(50) NOT NULL,
  `case_start_date` date NOT NULL,
  `case_end_date` date DEFAULT NULL,
  `assigned_worker` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `cases`
--

INSERT INTO `cases` (`id`, `child_name`, `date_of_birth`, `gender`, `case_status`, `case_start_date`, `case_end_date`, `assigned_worker`, `created_at`, `updated_at`) VALUES
(1, 'hozanas', '2024-11-14', 'Female', 'Open', '2024-11-14', '2024-11-14', 'hozanad', '2024-11-14 20:13:39', '2024-11-15 07:15:51'),
(4, 'hozana', '2024-11-16', 'Male', 'Open', '2024-11-16', NULL, 'wer', '2024-11-16 18:16:19', '2024-11-16 18:16:19');

-- --------------------------------------------------------

--
-- Structure de la table `case_to_schools`
--

CREATE TABLE `case_to_schools` (
  `id` int(11) NOT NULL,
  `child_name` varchar(255) NOT NULL,
  `case_status` varchar(100) NOT NULL,
  `assigned_school_worker` varchar(255) NOT NULL,
  `assigned_worker` varchar(255) NOT NULL,
  `investigation_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `documents`
--

CREATE TABLE `documents` (
  `document_id` int(11) NOT NULL,
  `document_type` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `access_level` enum('Public','Private','Restricted') NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `file_path` varchar(255) NOT NULL,
  `document` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `documents`
--

INSERT INTO `documents` (`document_id`, `document_type`, `description`, `access_level`, `last_modified`, `file_path`, `document`) VALUES
(1, 'word document', 'not contents', 'Private', '2024-11-17 21:14:48', '', 'documents/1731878019916_approval page.pdf');

-- --------------------------------------------------------

--
-- Structure de la table `fosterfamilies`
--

CREATE TABLE `fosterfamilies` (
  `id` int(11) NOT NULL,
  `family_name` varchar(255) NOT NULL,
  `contact_number` varchar(15) NOT NULL,
  `address` varchar(255) NOT NULL,
  `capacity` int(11) NOT NULL,
  `current_placements` int(11) NOT NULL,
  `background_check_status` varchar(50) NOT NULL,
  `training_completed` varchar(10) NOT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `fosterfamilies`
--

INSERT INTO `fosterfamilies` (`id`, `family_name`, `contact_number`, `address`, `capacity`, `current_placements`, `background_check_status`, `training_completed`, `created_at`) VALUES
(3, 'wwwEEgg', '086647', 'Burera', 2, 2, 'gffr', '0', '2024-11-18');

-- --------------------------------------------------------

--
-- Structure de la table `investigations`
--

CREATE TABLE `investigations` (
  `id` int(11) NOT NULL,
  `investigation_type` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `outcome` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `investigations`
--

INSERT INTO `investigations` (`id`, `investigation_type`, `date`, `outcome`) VALUES
(1, 'content', '2024-11-16', 'not yet done today');

-- --------------------------------------------------------

--
-- Structure de la table `legal_support`
--

CREATE TABLE `legal_support` (
  `case_id` int(11) NOT NULL,
  `case_type` varchar(255) NOT NULL,
  `child_name` varchar(255) NOT NULL,
  `date_of_birth` date NOT NULL,
  `court_name` varchar(255) NOT NULL,
  `judge_name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `legal_support`
--

INSERT INTO `legal_support` (`case_id`, `case_type`, `child_name`, `date_of_birth`, `court_name`, `judge_name`, `created_at`) VALUES
(1, 'SDFGH', 'ERTYUI', '2024-11-05', '2345670', '45678', '2024-11-18 00:18:30');

-- --------------------------------------------------------

--
-- Structure de la table `support_requests`
--

CREATE TABLE `support_requests` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `email_address` varchar(100) DEFAULT NULL,
  `preferred_communication` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `medical_history` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `support_requests`
--

INSERT INTO `support_requests` (`id`, `first_name`, `last_name`, `date_of_birth`, `phone_number`, `email_address`, `preferred_communication`, `location`, `medical_history`, `description`, `created_at`, `updated_at`) VALUES
(1, 'DUSABIMANA', 'Hozana', '2024-11-06', '23456789', 'ertyuiuytd@gmail.com', 'hgdydgg', 'Rulindo', 'ytrfgytrfdsrtrf', 'ytresdtyutred', '2024-11-17 23:38:32', '2024-11-17 23:38:32'),
(2, 'DUSABIMANA', 'Hozana', '2024-11-06', '23456789', 'ertyuiuytd@gmail.com', 'hgdydgg', 'Rulindo', 'ytrfgytrfdsrtrf', 'ytresdtyutred', '2024-11-17 23:38:35', '2024-11-17 23:38:35');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `gender` varchar(12) NOT NULL DEFAULT 'Male',
  `status` varchar(23) NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password_hash`, `role`, `email`, `phone`, `gender`, `status`, `created_at`) VALUES
(1, 'client@gmail.com', '1234', 'admin', 'hozana@gmail.com', '0791724884', 'male', 'active', '2024-11-16 17:17:49'),
(2, 'client@gmail.com', '1234', 'admin', 'hozana@gmail.com', '0791724884', 'male', 'active', '2024-11-16 19:54:52'),
(3, 'client@gmail.com', '1234', 'admin', 'hozana@gmail.com', '0791724884', 'male', 'active', '2024-11-18 08:45:06');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `abuse_reports`
--
ALTER TABLE `abuse_reports`
  ADD PRIMARY KEY (`report_id`);

--
-- Index pour la table `cases`
--
ALTER TABLE `cases`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `case_to_schools`
--
ALTER TABLE `case_to_schools`
  ADD PRIMARY KEY (`id`),
  ADD KEY `investigation_id` (`investigation_id`);

--
-- Index pour la table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`document_id`);

--
-- Index pour la table `fosterfamilies`
--
ALTER TABLE `fosterfamilies`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `investigations`
--
ALTER TABLE `investigations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `legal_support`
--
ALTER TABLE `legal_support`
  ADD PRIMARY KEY (`case_id`);

--
-- Index pour la table `support_requests`
--
ALTER TABLE `support_requests`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `abuse_reports`
--
ALTER TABLE `abuse_reports`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `cases`
--
ALTER TABLE `cases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `case_to_schools`
--
ALTER TABLE `case_to_schools`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `documents`
--
ALTER TABLE `documents`
  MODIFY `document_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `fosterfamilies`
--
ALTER TABLE `fosterfamilies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `investigations`
--
ALTER TABLE `investigations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `legal_support`
--
ALTER TABLE `legal_support`
  MODIFY `case_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `support_requests`
--
ALTER TABLE `support_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `case_to_schools`
--
ALTER TABLE `case_to_schools`
  ADD CONSTRAINT `case_to_schools_ibfk_1` FOREIGN KEY (`investigation_id`) REFERENCES `investigations` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

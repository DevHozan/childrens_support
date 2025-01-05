-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 05, 2025 at 03:37 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `child_welfare`
--

-- --------------------------------------------------------

--
-- Table structure for table `abuse_reports`
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
-- Dumping data for table `abuse_reports`
--

INSERT INTO `abuse_reports` (`report_id`, `child_name`, `date_of_report`, `status`, `last_update`, `created_at`) VALUES
(1, 'kenn', '2024-11-08', 'Pending', '2025-01-05 08:42:31', '2024-11-16 20:17:32'),
(3, 'kenn', '2024-11-13', 'Closed', '2025-01-05 08:42:10', '2024-11-16 20:18:03'),
(4, 'kenn', '2024-11-13', 'Open', '2025-01-05 08:42:36', '2024-11-16 20:23:01'),
(10, 'kenn', '2025-01-14', 'Closed', '2025-01-05 08:42:21', '2025-01-05 08:42:21');

-- --------------------------------------------------------

--
-- Table structure for table `cases`
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
-- Dumping data for table `cases`
--

INSERT INTO `cases` (`id`, `child_name`, `date_of_birth`, `gender`, `case_status`, `case_start_date`, `case_end_date`, `assigned_worker`, `created_at`, `updated_at`) VALUES
(1, 'hozanas', '2024-11-14', 'Female', 'Open', '2024-11-14', '2024-11-14', 'hozanad', '2024-11-14 20:13:39', '2024-11-15 07:15:51'),
(4, 'hozana', '2024-11-16', 'Male', 'Open', '2024-11-16', '2025-01-19', 'wer', '2024-11-16 18:16:19', '2025-01-05 07:20:43'),
(5, 'Edissa', '2000-01-01', 'Male', 'Open', '2025-01-05', '2025-01-08', 'Uwera', '2025-01-05 07:20:19', '2025-01-05 07:20:52');

-- --------------------------------------------------------

--
-- Table structure for table `case_to_schools`
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
-- Table structure for table `children`
--

CREATE TABLE `children` (
  `child_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` enum('Male','Female','Other') NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `risk_level` enum('Low','Moderate','High') NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `children`
--

INSERT INTO `children` (`child_id`, `first_name`, `last_name`, `date_of_birth`, `gender`, `address`, `risk_level`, `status`, `created_at`, `updated_at`) VALUES
(1, 'DUSABIMANA', 'Hozana', '2025-01-08', 'Male', 'musazes', 'Moderate', 'Active', '2025-01-05 13:01:54', '2025-01-05 13:18:46'),
(2, 'DUSABIMANA', 'Hozana', '2025-01-08', 'Female', 'musaze', 'High', 'Active', '2025-01-05 13:03:49', '2025-01-05 13:04:10');

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `document_id` int(11) NOT NULL,
  `document_type` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `access_level` enum('Public','Private','Restricted') NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `file_path` varchar(255) DEFAULT NULL,
  `document` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`document_id`, `document_type`, `description`, `access_level`, `last_modified`, `file_path`, `document`) VALUES
(14, 'word documents', 'jytfd', 'Public', '2025-01-05 10:00:03', NULL, 'documents/1736071514057_AMASEZERANO UMUKORESHA.pdf'),
(27, 'word documents', 'jhgtf', 'Public', '2025-01-05 10:19:47', NULL, 'documents/1736072493973_2024_EMPLOYEE CONTRACT.pdf'),
(28, 'word documents', 'erfiuh', 'Public', '2025-01-05 14:36:43', NULL, 'documents/1736087811214_AMASEZERANO UMUKORESHA.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `fosterfamilies`
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
-- Dumping data for table `fosterfamilies`
--

INSERT INTO `fosterfamilies` (`id`, `family_name`, `contact_number`, `address`, `capacity`, `current_placements`, `background_check_status`, `training_completed`, `created_at`) VALUES
(3, 'wwwEEgg', '086647', 'Burera', 3, 2, 'gffr', '0', '2024-11-18');

-- --------------------------------------------------------

--
-- Table structure for table `investigations`
--

CREATE TABLE `investigations` (
  `id` int(11) NOT NULL,
  `case_id` int(11) NOT NULL,
  `investigation_type` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `outcome` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `investigations`
--

INSERT INTO `investigations` (`id`, `case_id`, `investigation_type`, `date`, `outcome`, `created_at`) VALUES
(1, 0, 'content', '2024-11-16', 'not yet done today', '2025-01-05 08:19:55'),
(2, 0, 'content', '2003-01-01', 'something need to be cleared', '2025-01-05 08:19:55'),
(4, 2, 'content', '2002-02-02', 'boid', '2025-01-05 08:34:38');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `salary_range` varchar(255) NOT NULL,
  `date_posted` date NOT NULL,
  `employement_status` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `updated_at` date NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `requirements` text NOT NULL,
  `application_deadline` date NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_applications`
--

CREATE TABLE `job_applications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `legal_support`
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
-- Dumping data for table `legal_support`
--

INSERT INTO `legal_support` (`case_id`, `case_type`, `child_name`, `date_of_birth`, `court_name`, `judge_name`, `created_at`) VALUES
(1, 'SDFGH', 'ERTYUI', '2024-11-05', '2345670', '45678', '2024-11-18 00:18:30');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role` varchar(20) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `schools`
--

CREATE TABLE `schools` (
  `school_id` int(11) NOT NULL,
  `school_name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact_number` varchar(20) NOT NULL,
  `principal_name` varchar(255) NOT NULL,
  `level` varchar(220) NOT NULL DEFAULT 'primary',
  `total_students` int(11) NOT NULL,
  `notes` text DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schools`
--

INSERT INTO `schools` (`school_id`, `school_name`, `address`, `contact_number`, `principal_name`, `level`, `total_students`, `notes`, `website`, `created_at`, `updated_at`) VALUES
(1, 'Musanze Tech', 'Burera', '0786647647', 'jan', 'primary', 120, NULL, NULL, '2025-01-05 13:25:20', '2025-01-05 13:25:36'),
(2, 'Musanze', 'Burera', '0786647647', 'jan', 'secondary', 12, NULL, NULL, '2025-01-05 13:28:16', '2025-01-05 13:36:28'),
(3, 'Musanze', 'Burera', '0786647647', 'jan', 'primary', 12, NULL, NULL, '2025-01-05 13:28:38', '2025-01-05 13:28:38'),
(4, 'Musanze', 'Burera', '0786647647', 'jan', 'primary', 12, NULL, NULL, '2025-01-05 13:29:29', '2025-01-05 13:29:29'),
(5, 'Musanze', 'Burera', '0786647647', 'jan', 'secondary', 12, NULL, NULL, '2025-01-05 13:39:32', '2025-01-05 13:39:32');

-- --------------------------------------------------------

--
-- Table structure for table `support_requests`
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
  `status` varchar(13) NOT NULL DEFAULT 'opened',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `support_requests`
--

INSERT INTO `support_requests` (`id`, `first_name`, `last_name`, `date_of_birth`, `phone_number`, `email_address`, `preferred_communication`, `location`, `medical_history`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'DUSABIMANA', 'Hozana', '2024-11-06', '23456789', 'ertyuiuytd@gmail.com', 'hgdydgg', 'Rulindo', 'ytrfgytrfdsrtrf', 'ytresdtyutred', 'opened', '2024-11-17 23:38:32', '2024-11-17 23:38:32'),
(3, 'DUSABIMANA', 'Dusabimana', '2025-01-07', '0795983610', 'ishimwe@gmail.com', 'hgdydgg', 'Musanze', 'juytr', '098765r', 'opened', '2025-01-05 12:07:27', '2025-01-05 12:07:27');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL DEFAULT 'childrens',
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `gender` varchar(12) NOT NULL DEFAULT 'Male',
  `status` varchar(23) NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password_hash`, `role`, `email`, `phone`, `gender`, `status`, `created_at`) VALUES
(3, 'client@gmail.com', '1234', 'admin', 'hozana@gmail.com', '0791724884', 'male', 'active', '2024-11-18 08:45:06'),
(4, 'Child', '1234', 'admin', 'hozana@gmail.com', '0791724884', 'Male', 'active', '2025-01-05 07:27:59'),
(6, 'doe Henly', '1234', 'admin', 'doe2@gmail.com', '0791724884', 'Female', 'active', '2025-01-05 07:39:18'),
(8, 'client2@gmail.com', '1234', 'admin', 'ishimwe@gmail.com', '0795983610', 'Female', 'active', '2025-01-05 07:46:29'),
(11, 'Child Doe', '123', 'student', 'child@gmail.com', '0791724884', 'Male', 'active', '2025-01-05 13:57:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abuse_reports`
--
ALTER TABLE `abuse_reports`
  ADD PRIMARY KEY (`report_id`);

--
-- Indexes for table `cases`
--
ALTER TABLE `cases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `case_to_schools`
--
ALTER TABLE `case_to_schools`
  ADD PRIMARY KEY (`id`),
  ADD KEY `investigation_id` (`investigation_id`);

--
-- Indexes for table `children`
--
ALTER TABLE `children`
  ADD PRIMARY KEY (`child_id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`document_id`);

--
-- Indexes for table `fosterfamilies`
--
ALTER TABLE `fosterfamilies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `investigations`
--
ALTER TABLE `investigations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `legal_support`
--
ALTER TABLE `legal_support`
  ADD PRIMARY KEY (`case_id`);

--
-- Indexes for table `schools`
--
ALTER TABLE `schools`
  ADD PRIMARY KEY (`school_id`);

--
-- Indexes for table `support_requests`
--
ALTER TABLE `support_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `abuse_reports`
--
ALTER TABLE `abuse_reports`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cases`
--
ALTER TABLE `cases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `case_to_schools`
--
ALTER TABLE `case_to_schools`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `children`
--
ALTER TABLE `children`
  MODIFY `child_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `document_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `fosterfamilies`
--
ALTER TABLE `fosterfamilies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `investigations`
--
ALTER TABLE `investigations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `legal_support`
--
ALTER TABLE `legal_support`
  MODIFY `case_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `schools`
--
ALTER TABLE `schools`
  MODIFY `school_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `support_requests`
--
ALTER TABLE `support_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `case_to_schools`
--
ALTER TABLE `case_to_schools`
  ADD CONSTRAINT `case_to_schools_ibfk_1` FOREIGN KEY (`investigation_id`) REFERENCES `investigations` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

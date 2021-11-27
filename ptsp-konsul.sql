/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `ch_favorites` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `favorite_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `ch_messages` (
  `id` bigint(20) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_id` bigint(20) NOT NULL,
  `to_id` bigint(20) NOT NULL,
  `body` varchar(5000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'avatar.png',
  `messenger_color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#2180f3',
  `dark_mode` tinyint(1) NOT NULL DEFAULT 0,
  `active_status` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=1317 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



INSERT INTO `ch_messages` (`id`, `type`, `from_id`, `to_id`, `body`, `attachment`, `seen`, `created_at`, `updated_at`) VALUES
(1705364375, 'user', 6, 1252, 'Saya ingin konsultasi mengenai daerah yang tertera pada http://localhost:8000/pdf_file/105633.pdf', NULL, 1, '2021-11-27 10:32:17', '2021-11-27 11:47:13');
INSERT INTO `ch_messages` (`id`, `type`, `from_id`, `to_id`, `body`, `attachment`, `seen`, `created_at`, `updated_at`) VALUES
(1745320578, 'user', 1252, 6, 'halo', NULL, 1, '2021-11-27 12:06:07', '2021-11-27 12:06:07');
INSERT INTO `ch_messages` (`id`, `type`, `from_id`, `to_id`, `body`, `attachment`, `seen`, `created_at`, `updated_at`) VALUES
(1820552935, 'user', 6, 1252, 'oke', NULL, 1, '2021-11-27 12:03:46', '2021-11-27 12:03:47');
INSERT INTO `ch_messages` (`id`, `type`, `from_id`, `to_id`, `body`, `attachment`, `seen`, `created_at`, `updated_at`) VALUES
(1917219938, 'user', 1252, 6, 'apa kabar', NULL, 1, '2021-11-27 12:06:15', '2021-11-27 12:06:15'),
(1923777157, 'user', 1252, 6, 'abogo boga', NULL, 1, '2021-11-27 12:03:33', '2021-11-27 12:03:34'),
(2048258788, 'user', 6, 1252, 'hello', NULL, 1, '2021-11-27 12:06:22', '2021-11-27 12:06:23'),
(2079571207, 'user', 6, 1252, 'Saya ingin konsultasi mengenai daerah yang tertera pada http://localhost:8000/pdf_file/109474.pdf', NULL, 1, '2021-11-27 11:44:10', '2021-11-27 11:47:13'),
(2231559549, 'user', 6, 1240, 'Saya ingin konsultasi mengenai daerah yang tertera pada http://localhost:8000/pdf_file/111027.pdf', NULL, 1, '2021-11-27 10:27:44', '2021-11-27 12:13:10'),
(2256389690, 'user', 1240, 1292, 'halo', NULL, 0, '2021-11-27 12:14:23', '2021-11-27 12:14:23'),
(2583866404, 'user', 6, 1240, 'Saya ingin konsultasi mengenai daerah yang tertera pada http://localhost:8000/pdf_file/108267.pdf', NULL, 1, '2021-11-27 12:12:33', '2021-11-27 12:13:10');



INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(9, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(10, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(11, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(12, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(13, '2019_09_22_192348_create_messages_table', 2),
(14, '2019_10_16_211433_create_favorites_table', 2),
(15, '2019_10_18_223259_add_avatar_to_users', 2),
(16, '2019_10_20_211056_add_messenger_color_to_users', 2),
(17, '2019_10_22_000539_add_dark_mode_to_users', 2),
(18, '2019_10_25_214038_add_active_status_to_users', 2),
(19, '2021_11_23_082345_create_permission_tables', 3);















INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `provider`, `provider_id`, `remember_token`, `created_at`, `updated_at`, `avatar`, `messenger_color`, `dark_mode`, `active_status`) VALUES
(6, 'Muhammad Asnur Ramdhani', 'asnurramdhani12@gmail.com', NULL, NULL, 'google', '103278198484299944310', 'x2bpGvqXO3qm3gumLL56ZdVXKWRGaPCnuF0uJADe9xlddnnCTzXWuJRVlYta', '2021-11-19 07:06:30', '2021-11-27 12:15:23', '9fe5e3e0-476b-4703-ad9b-621f8e5a2c95.jpg', '#2180f3', 0, 1);
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `provider`, `provider_id`, `remember_token`, `created_at`, `updated_at`, `avatar`, `messenger_color`, `dark_mode`, `active_status`) VALUES
(7, 'asnur games', 'asnurgames12@gmail.com', NULL, NULL, 'google', '117665063307614773384', 'S6g8H9dSZqzWotLL4MTzkPotKFTIeE3zr6CQNDLgccFxF0uSyHGtRejkhSYq', '2021-11-19 07:08:58', '2021-11-27 11:46:10', 'd4370ebc-6a94-4e41-aff9-cffcb5ff1fcc.png', '#2180f3', 0, 0);
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `provider`, `provider_id`, `remember_token`, `created_at`, `updated_at`, `avatar`, `messenger_color`, `dark_mode`, `active_status`) VALUES
(8, 'dani', 'test@gmail.com', NULL, '$2y$10$nnuEsrzABGSdtZelpFDNquVaB6oDWKb/DnqEaOT14ruIa2u4u6gyq', NULL, NULL, NULL, '2021-11-22 04:05:18', '2021-11-22 04:05:18', 'avatar.png', '#2180f3', 0, 0);
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `provider`, `provider_id`, `remember_token`, `created_at`, `updated_at`, `avatar`, `messenger_color`, `dark_mode`, `active_status`) VALUES
(9, 'Admin Jakpintas', 'adminjakpintas@dpmptsp-dki.com', NULL, '$2y$10$2MCg3JyLTf58Bye/unfcQOytfTP9KPtMzuE2.Ef1aVNnLH6PAn/D6', NULL, NULL, NULL, '2021-11-22 07:32:03', '2021-11-22 09:40:52', 'eb379934-2170-4ad8-a735-a4cd54080685.png', '#2180f3', 0, 0),
(1056, 'ADMIN-BANGKA', 'adminbangka@dpmptsp-dki.com', NULL, '$2y$10$9stvg/kbJUhik8HDwmFUfeOlGe6RqgCX0moLAkDHjjpBHuW4VDfRC', NULL, NULL, NULL, '2021-11-24 04:43:22', '2021-11-24 04:43:22', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1057, 'ADMIN-BARU', 'adminbaru@dpmptsp-dki.com', NULL, '$2y$10$PuCLKWy6rML7kErPXqL.luAlb7kHgIy3E7G4BRl1A5YHBbB82i8Zi', NULL, NULL, NULL, '2021-11-24 04:43:22', '2021-11-24 04:43:22', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1058, 'ADMIN-ANGKE', 'adminangke@dpmptsp-dki.com', NULL, '$2y$10$r8o0m0gGebWJxVRteqKFyuOjPvYp0iQVTqe5MZ93.v5AD1QqcpNri', NULL, NULL, NULL, '2021-11-24 04:43:22', '2021-11-24 04:43:22', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1059, 'ADMIN-BATU AMPAR', 'adminbatuampar@dpmptsp-dki.com', NULL, '$2y$10$9pI5IFsrM07LVU4IFtc.pev8cuZz52RnBRMCUWhehqNoigyQIOzva', NULL, NULL, NULL, '2021-11-24 04:43:22', '2021-11-24 04:43:22', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1060, 'ADMIN-BALEKAMBANG', 'adminbalekambang@dpmptsp-dki.com', NULL, '$2y$10$h0KufKLCs.pKGHEx85MyvuPLU23wYkPRQahpqu.3Db.drwtqBHnTe', NULL, NULL, NULL, '2021-11-24 04:43:22', '2021-11-24 04:43:22', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1061, 'ADMIN-BALI MESTER', 'adminbalimester@dpmptsp-dki.com', NULL, '$2y$10$7dllrRrFNsBHrospHcKBfOCnVw6rhj7KIJw3BcH.doBahoDFecZ2m', NULL, NULL, NULL, '2021-11-24 04:43:22', '2021-11-24 04:43:22', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1062, 'ADMIN-BAMBU APUS', 'adminbambuapus@dpmptsp-dki.com', NULL, '$2y$10$3GL1omrDmPg5JBeYd35xFOcy9BJG12Zm5e2Uvo1Bo2Lic2Mg/jeay', NULL, NULL, NULL, '2021-11-24 04:43:22', '2021-11-24 04:43:22', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1063, 'ADMIN-WIJAYA KUSUMA', 'adminwijayakusuma@dpmptsp-dki.com', NULL, '$2y$10$87Ibi6a91Un.Ucm8VEYs/uXOdJvBwT6Qvg3oxtwWw9hddjEkho1Lm', NULL, NULL, NULL, '2021-11-24 04:43:22', '2021-11-24 04:43:22', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1064, 'ADMIN-CIPINANG BESAR SELATAN', 'admincipinangbesarselatan@dpmptsp-dki.com', NULL, '$2y$10$1TX1aeP/C8I1N19NLxugn.zTF6gpjady7Ade4zO4tspJlrLYY2AeS', NULL, NULL, NULL, '2021-11-24 04:43:22', '2021-11-24 04:43:22', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1065, 'ADMIN-CIPINANG BESAR UTARA', 'admincipinangbesarutara@dpmptsp-dki.com', NULL, '$2y$10$rNxVZMl9wY7BErpD7VnG0eUXz3v6/fcHMNyMmnqGqxGZ0msuETZMu', NULL, NULL, NULL, '2021-11-24 04:43:23', '2021-11-24 04:43:23', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1066, 'ADMIN-CIPINANG CEMPEDAK', 'admincipinangcempedak@dpmptsp-dki.com', NULL, '$2y$10$sLHEeXf1d.W.JPH/GNMy4eaiz2LH99LOOPgQ3CCFnTLiNh8kbSROG', NULL, NULL, NULL, '2021-11-24 04:43:23', '2021-11-24 04:43:23', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1067, 'ADMIN-ANCOL', 'adminancol@dpmptsp-dki.com', NULL, '$2y$10$FB4mHubtzrp8cmT2BmR6Be1D9/4oYbiUYNQWpx7..LwyF/Pq6fV5i', NULL, NULL, NULL, '2021-11-24 04:43:23', '2021-11-24 04:43:23', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1068, 'ADMIN-CIPINANG MUARA', 'admincipinangmuara@dpmptsp-dki.com', NULL, '$2y$10$rb/uAOFM5G10m6GQeiJWeOnV.V1thTuaN.gqvNxcKQ2Jei/pRcpx2', NULL, NULL, NULL, '2021-11-24 04:43:23', '2021-11-24 04:43:23', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1069, 'ADMIN-CIPULIR', 'admincipulir@dpmptsp-dki.com', NULL, '$2y$10$HEGcogah6pN4knqcrXxR5emgFKld.t8QSBc/OxAse2mF5e5yrtMkq', NULL, NULL, NULL, '2021-11-24 04:43:23', '2021-11-24 04:43:23', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1070, 'ADMIN-BIDARA CINA', 'adminbidaracina@dpmptsp-dki.com', NULL, '$2y$10$Ehuag7eUoHGcF966lMWYIe2BM9l0tvKHhHOnlNoU1qKPDg5zQYYb2', NULL, NULL, NULL, '2021-11-24 04:43:23', '2021-11-24 04:43:23', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1071, 'ADMIN-GEDONG', 'admingedong@dpmptsp-dki.com', NULL, '$2y$10$BM8XbSRd1GiSSRV5r1.DqO4f/o41znea.tcGW6r/wiNMAtOY/CRaW', NULL, NULL, NULL, '2021-11-24 04:43:23', '2021-11-24 04:43:23', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1072, 'ADMIN-GELORA', 'admingelora@dpmptsp-dki.com', NULL, '$2y$10$b6dvavkJfzT.KEy2yXF5ue.YpCHqnOIPgimBckMqEloJIlGTAOAba', NULL, NULL, NULL, '2021-11-24 04:43:23', '2021-11-24 04:43:23', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1073, 'ADMIN-GLODOK', 'adminglodok@dpmptsp-dki.com', NULL, '$2y$10$TimX94HkvsHYV/eN8hpzbOvSHFY/IQ3KOMxUK4f9Zi5HnMAe0YyEq', NULL, NULL, NULL, '2021-11-24 04:43:23', '2021-11-24 04:43:23', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1074, 'ADMIN-JOHAR BARU', 'adminjoharbaru@dpmptsp-dki.com', NULL, '$2y$10$T07KdpJyyxWn48eQR8Qj..ag2gksa.2paf02Hb/B4dGBzlEBFE1Le', NULL, NULL, NULL, '2021-11-24 04:43:23', '2021-11-24 04:43:23', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1075, 'ADMIN-GONDANGDIA', 'admingondangdia@dpmptsp-dki.com', NULL, '$2y$10$3uRRzKoE3JakVSH2s9wPS.DThH.TTm9mcb.UoEax6R79D5oz6uITu', NULL, NULL, NULL, '2021-11-24 04:43:23', '2021-11-24 04:43:23', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1076, 'ADMIN-DURI UTARA', 'adminduriutara@dpmptsp-dki.com', NULL, '$2y$10$tQ5N414/OlBT7mI/YbjtdeyyFMr5HnDooHrUUuqkghzFEJylXYA2q', NULL, NULL, NULL, '2021-11-24 04:43:23', '2021-11-24 04:43:23', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1077, 'ADMIN-GROGOL', 'admingrogol@dpmptsp-dki.com', NULL, '$2y$10$vvsotJ4juUxX3N7uip6H/en0.3v3ie6jHlluBQ642EqMCBLsfIb2e', NULL, NULL, NULL, '2021-11-24 04:43:24', '2021-11-24 04:43:24', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1078, 'ADMIN-KEBON SIRIH', 'adminkebonsirih@dpmptsp-dki.com', NULL, '$2y$10$.5./W/QlkAiydxLllnfvw.f51qRnh.BsSFpCe1/lhGrS3ADaWG0Ze', NULL, NULL, NULL, '2021-11-24 04:43:24', '2021-11-24 04:43:24', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1079, 'ADMIN-GROGOL UTARA', 'admingrogolutara@dpmptsp-dki.com', NULL, '$2y$10$G4B6wc6B3/0JqHZseFPNgejXbx0OUsfSs6fZTjihUxbvicCaZLm8W', NULL, NULL, NULL, '2021-11-24 04:43:24', '2021-11-24 04:43:24', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1080, 'ADMIN-CIBUBUR', 'admincibubur@dpmptsp-dki.com', NULL, '$2y$10$/hGx5iPKEtyq5WZvhhh4sesycYyxHzu2Zv8wsF7cHHhHklCvQX5QG', NULL, NULL, NULL, '2021-11-24 04:43:24', '2021-11-24 04:43:24', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1081, 'ADMIN-KRENDANG', 'adminkrendang@dpmptsp-dki.com', NULL, '$2y$10$ICpV28HgYfkLZLscQBBOAOr.ieB35npWOOAVNTcDhpGCYYlp30vcC', NULL, NULL, NULL, '2021-11-24 04:43:24', '2021-11-24 04:43:24', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1082, 'ADMIN-PINANGRANTI', 'adminpinangranti@dpmptsp-dki.com', NULL, '$2y$10$gIYrOVyNPKuWM5weoLnQO./8iWoKNxsAvh6F4pwHrIhZ4JMeSj2qG', NULL, NULL, NULL, '2021-11-24 04:43:24', '2021-11-24 04:43:24', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1083, 'ADMIN-GROGOL SELATAN', 'admingrogolselatan@dpmptsp-dki.com', NULL, '$2y$10$dGCQ7N5ICJF/v75OTmdckeRpAzOFqJL8g9HulDFpTmYv/ePR8qDOK', NULL, NULL, NULL, '2021-11-24 04:43:24', '2021-11-24 04:43:24', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1084, 'ADMIN-GUNTUR', 'adminguntur@dpmptsp-dki.com', NULL, '$2y$10$VID6f6gqQF9pToxvlHSNR.ZmhZvzyDCFqSQTy35Is8hiRCZfxS/G2', NULL, NULL, NULL, '2021-11-24 04:43:24', '2021-11-24 04:43:24', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1085, 'ADMIN-PONDOK RANGGON', 'adminpondokranggon@dpmptsp-dki.com', NULL, '$2y$10$9hvbja8uilf4sX.X2O85ruu7GYlDXmN/tO2bmXjWnfdoWOkukowdS', NULL, NULL, NULL, '2021-11-24 04:43:24', '2021-11-24 04:43:24', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1086, 'ADMIN-PULO', 'adminpulo@dpmptsp-dki.com', NULL, '$2y$10$YJfJEAVMfRWtetrTgBOuPeWfzFeDQ6E3DM91ZZ/Si3.TWZRjAM7ua', NULL, NULL, NULL, '2021-11-24 04:43:24', '2021-11-24 04:43:24', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1087, 'ADMIN-PULO GADUNG', 'adminpulogadung@dpmptsp-dki.com', NULL, '$2y$10$jMnCDxITG6RqdxcVOQzvKufDMGtQjyRvYzUClygF7S17.eVCLmXRq', NULL, NULL, NULL, '2021-11-24 04:43:24', '2021-11-24 04:43:24', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1088, 'ADMIN-RAWA BARAT', 'adminrawabarat@dpmptsp-dki.com', NULL, '$2y$10$X4rCDqGLfq368bU/IBf.iuKHAQ9Ty616aA80HI3.xmeTaUxaiXbXK', NULL, NULL, NULL, '2021-11-24 04:43:24', '2021-11-24 04:43:24', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1089, 'ADMIN-BENDUNGAN HILIR', 'adminbendunganhilir@dpmptsp-dki.com', NULL, '$2y$10$fcxMe3tIuL/RKm79fQEKFuQUzxJyYVaMHCyNnb4OldBXNKdWFMyNe', NULL, NULL, NULL, '2021-11-24 04:43:25', '2021-11-24 04:43:25', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1090, 'ADMIN-BINTARO', 'adminbintaro@dpmptsp-dki.com', NULL, '$2y$10$cQG5WcFVAE98c6t8lxUBZuM1H8G5II60pGMAAhWYMOfx/EzU5w3sa', NULL, NULL, NULL, '2021-11-24 04:43:25', '2021-11-24 04:43:25', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1091, 'ADMIN-SUNTER AGUNG', 'adminsunteragung@dpmptsp-dki.com', NULL, '$2y$10$iwVDAoIMV2bfJe70y6gqyerbBGQXRCeqpTKJJwMSv1mAP7ZY0qmHu', NULL, NULL, NULL, '2021-11-24 04:43:25', '2021-11-24 04:43:25', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1092, 'ADMIN-SUNTER JAYA', 'adminsunterjaya@dpmptsp-dki.com', NULL, '$2y$10$JvdTaYiSWxWJ10yG3dvW3OQpQWQn6SJxKqk/5HhtxoITJZ2v4jdR.', NULL, NULL, NULL, '2021-11-24 04:43:25', '2021-11-24 04:43:25', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1093, 'ADMIN-SUSUKAN', 'adminsusukan@dpmptsp-dki.com', NULL, '$2y$10$09cOatH2eKeSBXcePJhJl.S3q2NoLl8173Edrq9ZGhmKbN3OHP8xq', NULL, NULL, NULL, '2021-11-24 04:43:25', '2021-11-24 04:43:25', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1094, 'ADMIN-BUKIT DURI', 'adminbukitduri@dpmptsp-dki.com', NULL, '$2y$10$ZYUuhq3AsVMYqW7/IRvZ5.iAot5llZBuMbRowsFCuCiQM10k9GXmS', NULL, NULL, NULL, '2021-11-24 04:43:25', '2021-11-24 04:43:25', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1095, 'ADMIN-BUNGUR', 'adminbungur@dpmptsp-dki.com', NULL, '$2y$10$oHz0CWo1heDRd4Mo/TIdC.PowhpA6BHW1upfWYhyM6RIbwXPHNdTu', NULL, NULL, NULL, '2021-11-24 04:43:25', '2021-11-24 04:43:25', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1096, 'ADMIN-CAKUNG BARAT', 'admincakungbarat@dpmptsp-dki.com', NULL, '$2y$10$9LjGLL2.6M1dQ2dlVZWrUuNj19kjuJeLkSlVt1kBiUDjBsmaG/SLW', NULL, NULL, NULL, '2021-11-24 04:43:25', '2021-11-24 04:43:25', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1097, 'ADMIN-CAKUNG TIMUR', 'admincakungtimur@dpmptsp-dki.com', NULL, '$2y$10$je3dujPYhAJnCH6OyVzQ7uGkFzRFlbVNkhIL1vib9wMWjP9V/QZtO', NULL, NULL, NULL, '2021-11-24 04:43:25', '2021-11-24 04:43:25', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1098, 'ADMIN-CAWANG', 'admincawang@dpmptsp-dki.com', NULL, '$2y$10$AhWk6tYLr.NhVJaLzrjFW.ud2O9982WrsLMm3GitgFAPtzR8GY1JW', NULL, NULL, NULL, '2021-11-24 04:43:25', '2021-11-24 04:43:25', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1099, 'ADMIN-CEGER', 'adminceger@dpmptsp-dki.com', NULL, '$2y$10$zNhNLeqo5IvstoCmM4lRGuekeXX4pcYc5q2aV3Y56tu64gj93unue', NULL, NULL, NULL, '2021-11-24 04:43:25', '2021-11-24 04:43:25', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1100, 'ADMIN-CEMPAKA BARU', 'admincempakabaru@dpmptsp-dki.com', NULL, '$2y$10$sm2yefe1edg7DNPffLsHK.SyLtWiv60u45WsNPdGXyd.SCq9sninu', NULL, NULL, NULL, '2021-11-24 04:43:25', '2021-11-24 04:43:25', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1101, 'ADMIN-CEMPAKA PUTIH BARAT', 'admincempakaputihbarat@dpmptsp-dki.com', NULL, '$2y$10$sWso9fM.RtoPzackyTP/cutuL/xptZJtBI6hdUmtAEqWWLogqyikS', NULL, NULL, NULL, '2021-11-24 04:43:25', '2021-11-24 04:43:25', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1102, 'ADMIN-CEMPAKA PUTIH TIMUR', 'admincempakaputihtimur@dpmptsp-dki.com', NULL, '$2y$10$RU0IRj6e8/XafcwdluMsjeR5M7q3Ss3HIgLRuUAtETKJ253Ri5.Om', NULL, NULL, NULL, '2021-11-24 04:43:26', '2021-11-24 04:43:26', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1103, 'ADMIN-CENGKARENG BARAT', 'admincengkarengbarat@dpmptsp-dki.com', NULL, '$2y$10$uCsRnX1uxAu8TMvjyH4rNutK/xN5tGGyZvlM4reLZ1dESZu1XuRqS', NULL, NULL, NULL, '2021-11-24 04:43:26', '2021-11-24 04:43:26', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1104, 'ADMIN-CENGKARENG TIMUR', 'admincengkarengtimur@dpmptsp-dki.com', NULL, '$2y$10$nqVylMlzClq/fYXyFbBpG.mj9peYeVAq6YR9TIz4NVwUgz4C7OnJq', NULL, NULL, NULL, '2021-11-24 04:43:26', '2021-11-24 04:43:26', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1105, 'ADMIN-TAMAN SARI', 'admintamansari@dpmptsp-dki.com', NULL, '$2y$10$carnG4/B2qu4H5.4GEAZweRCBy90.MCgmGu6abW8O0vJ1X1EsGPG2', NULL, NULL, NULL, '2021-11-24 04:43:26', '2021-11-24 04:43:26', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1106, 'ADMIN-TAMBORA', 'admintambora@dpmptsp-dki.com', NULL, '$2y$10$oV0H9rhC5lsRbR3hPBWr6O8l.1nLCh2/SWZxJdskg0.lEPVMeVrfy', NULL, NULL, NULL, '2021-11-24 04:43:26', '2021-11-24 04:43:26', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1107, 'ADMIN-TANAH SEREAL', 'admintanahsereal@dpmptsp-dki.com', NULL, '$2y$10$WZ8VqxefWh6jcJegbUU2uugAUyOVqs5Qu18nCviEfol.n1OsjXVAS', NULL, NULL, NULL, '2021-11-24 04:43:26', '2021-11-24 04:43:26', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1108, 'ADMIN-TUGU SELATAN', 'admintuguselatan@dpmptsp-dki.com', NULL, '$2y$10$8fSwSh4A3uydF/HAxnfkuOX3U4cq0g0Ue1NFH/NEuXeXMe20PxoXK', NULL, NULL, NULL, '2021-11-24 04:43:26', '2021-11-24 04:43:26', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1109, 'ADMIN-TUGU UTARA', 'admintuguutara@dpmptsp-dki.com', NULL, '$2y$10$u2iGU/p6e9KSkFQImUMI4e5dFQZOMhFnVFQ.zhOrnjwd.mO7vud9.', NULL, NULL, NULL, '2021-11-24 04:43:26', '2021-11-24 04:43:26', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1110, 'ADMIN-UJUNG MENTENG', 'adminujungmenteng@dpmptsp-dki.com', NULL, '$2y$10$6l9pTjWDFp5oYTVqey2mxu482dOYZE9wQdea8ZIM0puDuDTsU4Iq.', NULL, NULL, NULL, '2021-11-24 04:43:26', '2021-11-24 04:43:26', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1111, 'ADMIN-UTAN PANJANG', 'adminutanpanjang@dpmptsp-dki.com', NULL, '$2y$10$rIz5T0u4I20o4ynlg6x70ecZQrPLXwwWfHcpAx/t3i0oS9TgqJnty', NULL, NULL, NULL, '2021-11-24 04:43:26', '2021-11-24 04:43:26', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1112, 'ADMIN-CIDENG', 'admincideng@dpmptsp-dki.com', NULL, '$2y$10$HEfueTo4YXogIs7nsbdnNOAR/e882i2rJWpQo4lUdi1zK6zHRUPzm', NULL, NULL, NULL, '2021-11-24 04:43:26', '2021-11-24 04:43:26', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1113, 'ADMIN-CIGANJUR', 'adminciganjur@dpmptsp-dki.com', NULL, '$2y$10$NoVLY44tBHR31U7rVKrFEOzsanMBPL6j5eXsc4VaEAZslY2I.Yrny', NULL, NULL, NULL, '2021-11-24 04:43:26', '2021-11-24 04:43:26', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1114, 'ADMIN-CIJANTUNG', 'admincijantung@dpmptsp-dki.com', NULL, '$2y$10$mA5Q77ZlkOi03Ct3bOliJuy7LfHhiPbpx.KlQIFDlu2N0rYWKoqVy', NULL, NULL, NULL, '2021-11-24 04:43:27', '2021-11-24 04:43:27', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1115, 'ADMIN-CIKINI', 'admincikini@dpmptsp-dki.com', NULL, '$2y$10$m1esRo.1uRR4lu3leI5b4OxXIR78c6mCLn1A6nLvuBGlv3fvSFfRy', NULL, NULL, NULL, '2021-11-24 04:43:27', '2021-11-24 04:43:27', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1116, 'ADMIN-CIKOKO', 'admincikoko@dpmptsp-dki.com', NULL, '$2y$10$ce8B2Cfw.anYXKn2wkm1LeO4aZv8LMydRJ3SyFO1AH8rlq5h2Tj36', NULL, NULL, NULL, '2021-11-24 04:43:27', '2021-11-24 04:43:27', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1117, 'ADMIN-CILANDAK BARAT', 'admincilandakbarat@dpmptsp-dki.com', NULL, '$2y$10$X3qBP1q0nKDhXKwehX2DceKNgsh4B64tz1N7dVj5q6Rn8bdBZQVj2', NULL, NULL, NULL, '2021-11-24 04:43:27', '2021-11-24 04:43:27', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1118, 'ADMIN-CILANDAK TIMUR', 'admincilandaktimur@dpmptsp-dki.com', NULL, '$2y$10$tfWNMLV8SMdOavRyQnwNcuO2Wuf7A//YJdxpkBeZIf.f7v/J1Ad2a', NULL, NULL, NULL, '2021-11-24 04:43:27', '2021-11-24 04:43:27', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1119, 'ADMIN-CILANGKAP', 'admincilangkap@dpmptsp-dki.com', NULL, '$2y$10$4U7.UVW.70O0T1hPDYVsx.kRxUy6GSeVwm4zPVXJfm2tPygkNVd8G', NULL, NULL, NULL, '2021-11-24 04:43:27', '2021-11-24 04:43:27', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1120, 'ADMIN-CILILITAN', 'admincililitan@dpmptsp-dki.com', NULL, '$2y$10$6E2spsT4D7RmmHxsxUaoxOHFaaiaSMjBFrCW9b2ApIm3yUI/5FLuu', NULL, NULL, NULL, '2021-11-24 04:43:27', '2021-11-24 04:43:27', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1121, 'ADMIN-CILINCING', 'admincilincing@dpmptsp-dki.com', NULL, '$2y$10$GaS8MHzWCVVDHRt7ePRwK.olIKmUHI4rYxzNZv0a//bVihRlDbcoG', NULL, NULL, NULL, '2021-11-24 04:43:27', '2021-11-24 04:43:27', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1122, 'ADMIN-CIPAYUNG', 'admincipayung@dpmptsp-dki.com', NULL, '$2y$10$CDk2Z8z4R75fz37Re2BmZOysTDc4RDVnng2skOOCQVGFvxvgrXgOC', NULL, NULL, NULL, '2021-11-24 04:43:27', '2021-11-24 04:43:27', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1123, 'ADMIN-CIPEDAK', 'admincipedak@dpmptsp-dki.com', NULL, '$2y$10$i4CFr6.FSZsUiHIBlFJceOhVZRsT8OwFw5LhS/K5T6TAf58YYIy9y', NULL, NULL, NULL, '2021-11-24 04:43:27', '2021-11-24 04:43:27', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1124, 'ADMIN-CIPETE SELATAN', 'admincipeteselatan@dpmptsp-dki.com', NULL, '$2y$10$Fgx6Y/yYonSKUI.YlXtZxeCrxzyNQApkOisqSgXzhbBaMVyYwBavm', NULL, NULL, NULL, '2021-11-24 04:43:27', '2021-11-24 04:43:27', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1125, 'ADMIN-CIPETE UTARA', 'admincipeteutara@dpmptsp-dki.com', NULL, '$2y$10$AKNOrLe18rrA3RzP2.rGVeTvLkxcnGCeOa6EpePcO.zwznuS7pC.6', NULL, NULL, NULL, '2021-11-24 04:43:27', '2021-11-24 04:43:27', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1126, 'ADMIN-CIPINANG', 'admincipinang@dpmptsp-dki.com', NULL, '$2y$10$XOrWOeXUOIUwHisdiYKnrObm8qB4dBV6gX/w4snnXNqbyFZ9/GjTe', NULL, NULL, NULL, '2021-11-24 04:43:28', '2021-11-24 04:43:28', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1127, 'ADMIN-CIPINANG MELAYU', 'admincipinangmelayu@dpmptsp-dki.com', NULL, '$2y$10$4h.YtJKPKUWs5RrcTcDLhOEuowGmczhlJwQzO7k2nvS2TQwuC7fS2', NULL, NULL, NULL, '2021-11-24 04:43:28', '2021-11-24 04:43:28', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1128, 'ADMIN-CIRACAS', 'adminciracas@dpmptsp-dki.com', NULL, '$2y$10$/LnaM2sf4sBHCOirtJ2HCOcpu7AICswSIMZLEezj41iT7Slqx80nS', NULL, NULL, NULL, '2021-11-24 04:43:28', '2021-11-24 04:43:28', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1129, 'ADMIN-DUKUH', 'admindukuh@dpmptsp-dki.com', NULL, '$2y$10$B.3p.9ZmEu95MZ2pNZ2mxu4R4bjvMhpQCkQUjUV0bNxrtPCiO3H1W', NULL, NULL, NULL, '2021-11-24 04:43:28', '2021-11-24 04:43:28', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1130, 'ADMIN-DUREN SAWIT', 'admindurensawit@dpmptsp-dki.com', NULL, '$2y$10$BBwrzmXZQrgxmZGo57.CBO9Kv16xuDKSJRwZuilMHM0mb7mSQMLaG', NULL, NULL, NULL, '2021-11-24 04:43:28', '2021-11-24 04:43:28', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1131, 'ADMIN-DUREN TIGA', 'admindurentiga@dpmptsp-dki.com', NULL, '$2y$10$hzf6C7tKp8N6Ws3MPNV6Tu1sr2z76feTfvJsLup4h3VM4VVmXPjmu', NULL, NULL, NULL, '2021-11-24 04:43:28', '2021-11-24 04:43:28', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1132, 'ADMIN-DURI KEPA', 'admindurikepa@dpmptsp-dki.com', NULL, '$2y$10$DPbeXqjYBQLUj2ctOgUWBuEqvrBWxmcqLVtBt1MxTdVvGsaRRryly', NULL, NULL, NULL, '2021-11-24 04:43:28', '2021-11-24 04:43:28', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1133, 'ADMIN-DURI KOSAMBI', 'admindurikosambi@dpmptsp-dki.com', NULL, '$2y$10$6XJv2EE/c.ELPJ0Ta4K4qO94E8R88ypX6CQmb5LGnvTps/syhfDHW', NULL, NULL, NULL, '2021-11-24 04:43:28', '2021-11-24 04:43:28', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1134, 'ADMIN-DURI PULO', 'adminduripulo@dpmptsp-dki.com', NULL, '$2y$10$G5OJB2MjAhmjTcJ/kyoE1uqZWGoqBSgFA55pd8cd8uyC1858u8Sb2', NULL, NULL, NULL, '2021-11-24 04:43:28', '2021-11-24 04:43:28', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1135, 'ADMIN-DURI SELATAN', 'adminduriselatan@dpmptsp-dki.com', NULL, '$2y$10$.pUGsjL78qS1r1I9FKCrqewNC7gwNO7/RbxtKziNL3nJpw8qu8di.', NULL, NULL, NULL, '2021-11-24 04:43:28', '2021-11-24 04:43:28', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1136, 'ADMIN-GALUR', 'admingalur@dpmptsp-dki.com', NULL, '$2y$10$iY/h1tg/575owjQ8YkPV8.GieOHMQQGa4aNGFeMLWCX/6sUnEuVNC', NULL, NULL, NULL, '2021-11-24 04:43:28', '2021-11-24 04:43:28', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1137, 'ADMIN-GAMBIR', 'admingambir@dpmptsp-dki.com', NULL, '$2y$10$ofRt1lj2CLK9/TsnWSQsxOeKibHG55wWclCTimGxTSH0KV3KVi4HW', NULL, NULL, NULL, '2021-11-24 04:43:28', '2021-11-24 05:06:13', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 1),
(1138, 'ADMIN-GANDARIA SELATAN', 'admingandariaselatan@dpmptsp-dki.com', NULL, '$2y$10$qcMIhUGWEZJuCAAO1mKZ/uz/BApVkDkrMEuBNfrCqxBlFsKQQY8Uu', NULL, NULL, NULL, '2021-11-24 04:43:28', '2021-11-24 04:43:28', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1139, 'ADMIN-GANDARIA UTARA', 'admingandariautara@dpmptsp-dki.com', NULL, '$2y$10$NthL.ejC2sKKKrnEJ3Z12eVGSnI.lL/KSpjCgsgKj2qI35P2Scdgq', NULL, NULL, NULL, '2021-11-24 04:43:29', '2021-11-24 04:43:29', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1140, 'ADMIN-GUNUNG', 'admingunung@dpmptsp-dki.com', NULL, '$2y$10$4AG3581esZxrKE6MwA39HOX5dGfATCjKQby7r/JqBsNY3hLP8KtGW', NULL, NULL, NULL, '2021-11-24 04:43:29', '2021-11-24 04:43:29', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1141, 'ADMIN-GUNUNG SAHARI SELATAN', 'admingunungsahariselatan@dpmptsp-dki.com', NULL, '$2y$10$0lGBVL5kG0DEEU7B.TuwgO4ITX8EvYakFkIBzMHrE9VTvPmAAup4i', NULL, NULL, NULL, '2021-11-24 04:43:29', '2021-11-24 04:43:29', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1142, 'ADMIN-GUNUNG SAHARI UTARA', 'admingunungsahariutara@dpmptsp-dki.com', NULL, '$2y$10$yIwd6Cp2dSdgTbZ0rIbl9urVCoML80xTquaLdjC/WchU0ERveYSre', NULL, NULL, NULL, '2021-11-24 04:43:29', '2021-11-24 04:43:29', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1143, 'ADMIN-HALIM PERDANA KUSUMA', 'adminhalimperdanakusuma@dpmptsp-dki.com', NULL, '$2y$10$rizYhDuP8m4u8fhIqMu4yOGZud1826IIH7UqCvr4cC972zJIk8hEG', NULL, NULL, NULL, '2021-11-24 04:43:29', '2021-11-24 04:43:29', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1144, 'ADMIN-HARAPAN MULYA', 'adminharapanmulya@dpmptsp-dki.com', NULL, '$2y$10$at4qCM56cqtli0oDokBVZuaBXRP9asvWI7kmSCvXAdfLH4z5cTHQi', NULL, NULL, NULL, '2021-11-24 04:43:29', '2021-11-24 04:43:29', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1145, 'ADMIN-JAGAKARSA', 'adminjagakarsa@dpmptsp-dki.com', NULL, '$2y$10$5PVDSAbu6hs1X9.juBWmg.9WvGz6/gkAwdIIpZeLi7JolapFcRCnG', NULL, NULL, NULL, '2021-11-24 04:43:29', '2021-11-24 04:43:29', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1146, 'ADMIN-JATI', 'adminjati@dpmptsp-dki.com', NULL, '$2y$10$f59GsyzHSuyLICWKdTvrduy6eUc.Q4waJQ7t8VVD7kww/3qEC9ebi', NULL, NULL, NULL, '2021-11-24 04:43:29', '2021-11-24 04:43:29', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1147, 'ADMIN-JATI PADANG', 'adminjatipadang@dpmptsp-dki.com', NULL, '$2y$10$ysQwzD7VJXjzFfyrH83CLu21UG1E3Y0jzV0XDSB2kWEuZPuqYHlcK', NULL, NULL, NULL, '2021-11-24 04:43:29', '2021-11-24 04:43:29', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1148, 'ADMIN-JATIPULO', 'adminjatipulo@dpmptsp-dki.com', NULL, '$2y$10$sA4i.TwkzxaGDsfskpcFV.HYWjUg99DjyuruRv2DBqg2kv9muo8AC', NULL, NULL, NULL, '2021-11-24 04:43:29', '2021-11-24 04:43:29', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1149, 'ADMIN-JATINEGARA', 'adminjatinegara@dpmptsp-dki.com', NULL, '$2y$10$9NUpfSqGOczGQeta44mYvOVykx5OgsH8u3PCBaUt9.DkiEvtthHSC', NULL, NULL, NULL, '2021-11-24 04:43:29', '2021-11-24 04:43:29', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1150, 'ADMIN-JATINEGARA KAUM', 'adminjatinegarakaum@dpmptsp-dki.com', NULL, '$2y$10$2if0XQGKKe53zx/DgsQXqe0/AU8tgYjeflqMYX4lG139dS7Tsp/su', NULL, NULL, NULL, '2021-11-24 04:43:29', '2021-11-24 04:43:29', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1151, 'ADMIN-JELAMBAR', 'adminjelambar@dpmptsp-dki.com', NULL, '$2y$10$E42a650GtJ7whA1PULQ2o.8gXL9DId0C3YImq9cFONlrqz2U968t6', NULL, NULL, NULL, '2021-11-24 04:43:30', '2021-11-24 04:43:30', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1152, 'ADMIN-JELAMBAR BARU', 'adminjelambarbaru@dpmptsp-dki.com', NULL, '$2y$10$85BcdTAvS/diwz15VYwTIOtGehSQSE6ujp5RllEqEajq4Chl/7Qr2', NULL, NULL, NULL, '2021-11-24 04:43:30', '2021-11-24 04:43:30', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1153, 'ADMIN-JEMBATAN BESI', 'adminjembatanbesi@dpmptsp-dki.com', NULL, '$2y$10$AZauC/NSZ0XFJuaGj1Zgau7e1SQKeU1DRe/UNJhQfJlppphRnJoXS', NULL, NULL, NULL, '2021-11-24 04:43:30', '2021-11-24 04:43:30', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1154, 'ADMIN-JEMBATAN LIMA', 'adminjembatanlima@dpmptsp-dki.com', NULL, '$2y$10$8EzRH/PI6Oa1qYjKt5uhyOpF0JJyN1qrF51IVIbXRQq2w644A50Ou', NULL, NULL, NULL, '2021-11-24 04:43:30', '2021-11-24 04:43:30', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1155, 'ADMIN-JOGLO', 'adminjoglo@dpmptsp-dki.com', NULL, '$2y$10$0.FH8J7AjQRrt7iug68eoO3uVDk4LFX3bUx9mA6OO4P1CCsRunkTC', NULL, NULL, NULL, '2021-11-24 04:43:30', '2021-11-24 04:43:30', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1156, 'ADMIN-KALI ANYAR', 'adminkalianyar@dpmptsp-dki.com', NULL, '$2y$10$ZDvXW9UKOY1LwAuT/F9f8uZ8zz5WX2M8An0UjyaoF1h0coCHFnRKS', NULL, NULL, NULL, '2021-11-24 04:43:30', '2021-11-24 04:43:30', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1157, 'ADMIN-KALIBARU', 'adminkalibaru@dpmptsp-dki.com', NULL, '$2y$10$.IH5eBGrl4ut1a3Y5hZHM.FY9NNT1WRyHiiYBzPvGv1Il964PGKWK', NULL, NULL, NULL, '2021-11-24 04:43:30', '2021-11-24 04:43:30', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1158, 'ADMIN-KALIBATA', 'adminkalibata@dpmptsp-dki.com', NULL, '$2y$10$U3/aORDGBa5orwsqZ9vnquFmKvAH2cn2y1PgzwZbZNjnJkdoY4Cca', NULL, NULL, NULL, '2021-11-24 04:43:30', '2021-11-24 04:43:30', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1159, 'ADMIN-KALIDERES', 'adminkalideres@dpmptsp-dki.com', NULL, '$2y$10$CSxiVtsX4OlujHSk0pZxfOTHiKNvV1Uk7ET0xrcWVMhAAndQGoYZC', NULL, NULL, NULL, '2021-11-24 04:43:30', '2021-11-24 04:43:30', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1160, 'ADMIN-KALISARI', 'adminkalisari@dpmptsp-dki.com', NULL, '$2y$10$TctufGmKX1zpLs1wdz68jegKiR8pd9.LTKGhUWGHL70OHKUxqrp1m', NULL, NULL, NULL, '2021-11-24 04:43:30', '2021-11-24 04:43:30', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0);
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `provider`, `provider_id`, `remember_token`, `created_at`, `updated_at`, `avatar`, `messenger_color`, `dark_mode`, `active_status`) VALUES
(1161, 'ADMIN-KAMAL', 'adminkamal@dpmptsp-dki.com', NULL, '$2y$10$tyhOda1qNBDj4TSPOaKtYOSqqjc.1S1p8XSqa.6q88wkyXTOWte8W', NULL, NULL, NULL, '2021-11-24 04:43:30', '2021-11-24 04:43:30', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1162, 'ADMIN-KAMAL MUARA', 'adminkamalmuara@dpmptsp-dki.com', NULL, '$2y$10$fJrFo6sc.2mbVm5jdVNuwuks.AX//nNdWR08mWfgvX08gTj1yuWoa', NULL, NULL, NULL, '2021-11-24 04:43:30', '2021-11-24 04:43:30', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1163, 'ADMIN-KAMPUNG BALI', 'adminkampungbali@dpmptsp-dki.com', NULL, '$2y$10$FcLBm9ZeSegh1WwDPDpDc.OoZTyCfG8DSTSoeulIGnwO3I4KxN3re', NULL, NULL, NULL, '2021-11-24 04:43:31', '2021-11-24 04:43:31', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1164, 'ADMIN-KAMPUNG MELAYU', 'adminkampungmelayu@dpmptsp-dki.com', NULL, '$2y$10$eFxZkJDxOSHn6BrL.svYpOzhnic5T4a.2b4/ELfM/6TXYkL2Exm2O', NULL, NULL, NULL, '2021-11-24 04:43:31', '2021-11-24 04:43:31', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1165, 'ADMIN-KAMPUNG RAWA', 'adminkampungrawa@dpmptsp-dki.com', NULL, '$2y$10$COYxMyazZQgZe0Zt/Zw5BO3LOEwYCxmVxkqBDhzpzYPZS3oe6cyeG', NULL, NULL, NULL, '2021-11-24 04:43:31', '2021-11-24 04:43:31', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1166, 'ADMIN-TENGAH', 'admintengah@dpmptsp-dki.com', NULL, '$2y$10$DOMI99IpjXTALg0iDVjkLeS1YMWAlTD31AN5.2UO2WwL2GUbFe0AO', NULL, NULL, NULL, '2021-11-24 04:43:31', '2021-11-24 04:43:31', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1167, 'ADMIN-KAPUK', 'adminkapuk@dpmptsp-dki.com', NULL, '$2y$10$3229g2zmkF9GvN0K..cgFOJJEZ8gKBDAEJvAbIJVWkZW8jaZk4yui', NULL, NULL, NULL, '2021-11-24 04:43:31', '2021-11-24 04:43:31', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1168, 'ADMIN-KAPUK MUARA', 'adminkapukmuara@dpmptsp-dki.com', NULL, '$2y$10$umIlTkj8.YRPdeUa7eOP/e1gT6Xfjan1XWJNvnXcryYE0QY8PjaUW', NULL, NULL, NULL, '2021-11-24 04:43:31', '2021-11-24 04:43:31', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1169, 'ADMIN-KARANG ANYAR', 'adminkaranganyar@dpmptsp-dki.com', NULL, '$2y$10$ysCek/rpWdNAhdehllgEgOtSsCAGo3XdupQGKJI8Wl0w.F6ZnVx5y', NULL, NULL, NULL, '2021-11-24 04:43:31', '2021-11-24 04:43:31', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1170, 'ADMIN-KARET', 'adminkaret@dpmptsp-dki.com', NULL, '$2y$10$DvdLYA92GnwFmpbkPD62U.h0v3jJQkvT5lkc1ZxACZe1LVzFKPtBO', NULL, NULL, NULL, '2021-11-24 04:43:31', '2021-11-24 04:43:31', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1171, 'ADMIN-KARET KUNINGAN', 'adminkaretkuningan@dpmptsp-dki.com', NULL, '$2y$10$we6CuaiKSryxPSO5ntpeG.7.0ACgafqbfNwwZ/6eqG61B48.nLtEa', NULL, NULL, NULL, '2021-11-24 04:43:31', '2021-11-24 04:43:31', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1172, 'ADMIN-KARET SEMANGGI', 'adminkaretsemanggi@dpmptsp-dki.com', NULL, '$2y$10$zVy6WDupursd0JP56kJHM.3I.I.cA2ZDmI9eqn.K6Nxhc88BO9Y3y', NULL, NULL, NULL, '2021-11-24 04:43:31', '2021-11-24 04:43:31', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1173, 'ADMIN-KARET TENGSIN', 'adminkarettengsin@dpmptsp-dki.com', NULL, '$2y$10$vhicCgtf8w8QKBVEEOB5yOOu1yU./gh69W/jGs.n0YbywTVZGXc5u', NULL, NULL, NULL, '2021-11-24 04:43:31', '2021-11-24 04:43:31', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1174, 'ADMIN-KARTINI', 'adminkartini@dpmptsp-dki.com', NULL, '$2y$10$q/PV5zYiSEEQWxhxdzBvd.xF8BuHVZXl.n6Bd0AN.VWYYlnmkBGFe', NULL, NULL, NULL, '2021-11-24 04:43:31', '2021-11-24 04:43:31', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1175, 'ADMIN-KAYU MANIS', 'adminkayumanis@dpmptsp-dki.com', NULL, '$2y$10$D.BNqfbf7wFuLMKKYlmAieTdpUbb7ZEO0m2CJEqjBMz7qrUBQrxL.', NULL, NULL, NULL, '2021-11-24 04:43:31', '2021-11-24 04:43:31', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1176, 'ADMIN-KAYU PUTIH', 'adminkayuputih@dpmptsp-dki.com', NULL, '$2y$10$J.mCW0IinlCF1uBOINnLee.Phj1gt9TweaBNy8B90OSkCb9ZaVCZm', NULL, NULL, NULL, '2021-11-24 04:43:32', '2021-11-24 04:43:32', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1177, 'ADMIN-KEAGUNGAN', 'adminkeagungan@dpmptsp-dki.com', NULL, '$2y$10$s90OYNQLeUDCqC2FvFBfyOm3TCyLI5xy7VE2kx4.qGaytHTM6FXV6', NULL, NULL, NULL, '2021-11-24 04:43:32', '2021-11-24 04:43:32', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1178, 'ADMIN-KEBAGUSAN', 'adminkebagusan@dpmptsp-dki.com', NULL, '$2y$10$yxIM8og4KwTTyVS.OqLX8OQEY9l8kU4zU//vEvTrSjLEZgJO/qULi', NULL, NULL, NULL, '2021-11-24 04:43:32', '2021-11-24 04:43:32', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1179, 'ADMIN-KEBAYORAN LAMA SELATAN', 'adminkebayoranlamaselatan@dpmptsp-dki.com', NULL, '$2y$10$D61NHuNE8zUC6QQTnxiE7uUc/hxB5ad2ic0ZSvfcfu6ZFypLmUki2', NULL, NULL, NULL, '2021-11-24 04:43:32', '2021-11-24 04:43:32', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1180, 'ADMIN-KEBAYORAN LAMA UTARA', 'adminkebayoranlamautara@dpmptsp-dki.com', NULL, '$2y$10$jtQiLP/0j0CXKYGRmTt93eV.Y2SYJrL3igEa5d0ki0RXiSS5s6EWe', NULL, NULL, NULL, '2021-11-24 04:43:32', '2021-11-24 04:43:32', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1181, 'ADMIN-KEBON BARU', 'adminkebonbaru@dpmptsp-dki.com', NULL, '$2y$10$guIVrzaVe3cduBODyC1oW.AaY6XPANMRe5wlMhKxaovyTMNNv7a4y', NULL, NULL, NULL, '2021-11-24 04:43:32', '2021-11-24 04:43:32', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1182, 'ADMIN-KEBON BAWANG', 'adminkebonbawang@dpmptsp-dki.com', NULL, '$2y$10$DmO2F8EIbSlVTX2S7YItKeOcRRXbG/SazkSQLEU/kjUktZBW86RhK', NULL, NULL, NULL, '2021-11-24 04:43:32', '2021-11-24 04:43:32', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1183, 'ADMIN-KEBON JERUK', 'adminkebonjeruk@dpmptsp-dki.com', NULL, '$2y$10$nbalbHR7hL9DBvP18VrEGepr.G0Kfm2aMs8.1ztV8AYX.Az.1g9rW', NULL, NULL, NULL, '2021-11-24 04:43:32', '2021-11-24 04:43:32', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1184, 'ADMIN-KEBON KACANG', 'adminkebonkacang@dpmptsp-dki.com', NULL, '$2y$10$Xy5jmvSYQFsY/t30GynDle4B5JZUHpM75LC0KelzpcPwmTQ6gc9B.', NULL, NULL, NULL, '2021-11-24 04:43:32', '2021-11-24 04:43:32', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1185, 'ADMIN-KEBON KELAPA', 'adminkebonkelapa@dpmptsp-dki.com', NULL, '$2y$10$5//DYZdJbeV0ApTa3I2asu/fZ8YC9ppl4hZ3jiXYMAgbRVVuGgYvu', NULL, NULL, NULL, '2021-11-24 04:43:32', '2021-11-24 04:43:32', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1186, 'ADMIN-KEBON KOSONG', 'adminkebonkosong@dpmptsp-dki.com', NULL, '$2y$10$cPzXOh13nCXV/LTZnO.pl.BwV/PbxYiuYjU/uxcVOWgE0qLCStLby', NULL, NULL, NULL, '2021-11-24 04:43:32', '2021-11-24 04:43:32', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1187, 'ADMIN-KEBON MANGGIS', 'adminkebonmanggis@dpmptsp-dki.com', NULL, '$2y$10$gI3b9iHTb324npIpolSl/.TXBkaID.O7fm.LigzKpio1PXE7sIaJi', NULL, NULL, NULL, '2021-11-24 04:43:32', '2021-11-24 04:43:32', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1188, 'ADMIN-KEBON MELATI', 'adminkebonmelati@dpmptsp-dki.com', NULL, '$2y$10$ErfkKQQ86JsQf.C.5ryeiuBlJaH6/2eKA4WySpmtbO6WUy6Ps8.Rm', NULL, NULL, NULL, '2021-11-24 04:43:33', '2021-11-24 04:43:33', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1189, 'ADMIN-KEBON PALA', 'adminkebonpala@dpmptsp-dki.com', NULL, '$2y$10$MmMpZxF1AMyfNAfpbT9nyupA3eJZDbO1LZgYVbmoI87e7dPVDPk66', NULL, NULL, NULL, '2021-11-24 04:43:33', '2021-11-24 04:43:33', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1190, 'ADMIN-KEDAUNG KALI ANGKE', 'adminkedaungkaliangke@dpmptsp-dki.com', NULL, '$2y$10$.BoBbxWqU5sXgeg303t/duR33JU.9yIlKtIdyWMwj8fifcIscJNja', NULL, NULL, NULL, '2021-11-24 04:43:33', '2021-11-24 04:43:33', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1191, 'ADMIN-KEDOYA SELATAN', 'adminkedoyaselatan@dpmptsp-dki.com', NULL, '$2y$10$EuQ/Bj2uLnVl/TXmy4vqouFPJ1ZgkgWNLFz7KmJEJ5bbU6jUMCm7e', NULL, NULL, NULL, '2021-11-24 04:43:33', '2021-11-24 04:43:33', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1192, 'ADMIN-KEDOYA UTARA', 'adminkedoyautara@dpmptsp-dki.com', NULL, '$2y$10$aze/KHtUAFXbN2mOpgeFSOwjqZ49rNuXD9PJRPoTr5TqmpbxmRkyy', NULL, NULL, NULL, '2021-11-24 04:43:33', '2021-11-24 04:43:33', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1193, 'ADMIN-KELAPA DUA', 'adminkelapadua@dpmptsp-dki.com', NULL, '$2y$10$ktH7zaaLkTV6ccQOHlvA.uod6oKoUcwcw5eRooJumtWCYAzdb8vPm', NULL, NULL, NULL, '2021-11-24 04:43:33', '2021-11-24 04:43:33', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1194, 'ADMIN-KELAPA DUA WETAN', 'adminkelapaduawetan@dpmptsp-dki.com', NULL, '$2y$10$HV1nTIfFFHvsif6EOHsbSuDblB178M305.xYvd8/sNSZT8zcerrEW', NULL, NULL, NULL, '2021-11-24 04:43:33', '2021-11-24 04:43:33', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1195, 'ADMIN-KELAPA GADING BARAT', 'adminkelapagadingbarat@dpmptsp-dki.com', NULL, '$2y$10$1pyNq9/Ew5PjuFcWz5zMmONeeDfn7cvjse.qSupdF2qzYyxJbJCxa', NULL, NULL, NULL, '2021-11-24 04:43:33', '2021-11-24 04:43:33', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1196, 'ADMIN-KELAPA GADING TIMUR', 'adminkelapagadingtimur@dpmptsp-dki.com', NULL, '$2y$10$WemvvbXJ9hZwaEZcjZRUeOJORzrh8o1Uy1NshalZSmCo4aLpNO.8O', NULL, NULL, NULL, '2021-11-24 04:43:33', '2021-11-24 04:43:33', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1197, 'ADMIN-KEMANGGISAN', 'adminkemanggisan@dpmptsp-dki.com', NULL, '$2y$10$hjX0L0oo82XumAiyXHM27uViwG0UpkjJU1STqlF2vbC/2VYt/XCuO', NULL, NULL, NULL, '2021-11-24 04:43:33', '2021-11-24 04:43:33', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1198, 'ADMIN-KEMAYORAN', 'adminkemayoran@dpmptsp-dki.com', NULL, '$2y$10$xmJAwj.p6wY8wkbfmyKZquFGWcvRNAiZSGRf0GFbf0qRs.07NjPX2', NULL, NULL, NULL, '2021-11-24 04:43:33', '2021-11-24 04:43:33', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1199, 'ADMIN-KEMBANGAN SELATAN', 'adminkembanganselatan@dpmptsp-dki.com', NULL, '$2y$10$6v94FuybRvVgtlIkikvpFO6qIT.Coiykv6XVV1L.zpweDRf92jd2y', NULL, NULL, NULL, '2021-11-24 04:43:33', '2021-11-24 04:43:33', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1200, 'ADMIN-KEMBANGAN UTARA', 'adminkembanganutara@dpmptsp-dki.com', NULL, '$2y$10$6jZpZnuojBpy6TsVEEqYTeUpb9kzSRoZlWK4a286yxYSrKq844JEO', NULL, NULL, NULL, '2021-11-24 04:43:34', '2021-11-24 04:43:34', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1201, 'ADMIN-KENARI', 'adminkenari@dpmptsp-dki.com', NULL, '$2y$10$3RHm23H0csf/CcqL0E0y2.Gz0xPyZZQZmhgl0jcHbOn.i.HmziUMe', NULL, NULL, NULL, '2021-11-24 04:43:34', '2021-11-24 04:43:34', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1202, 'ADMIN-KLENDER', 'adminklender@dpmptsp-dki.com', NULL, '$2y$10$k68cgevapvVVg5Zmt9R09OFKPXit6EDX2iZIMPy/i6tU1JolNjOyK', NULL, NULL, NULL, '2021-11-24 04:43:34', '2021-11-24 04:43:34', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1203, 'ADMIN-KOJA', 'adminkoja@dpmptsp-dki.com', NULL, '$2y$10$hBy.c8X2Zhi/O5Q9CUkIO.CYdpMaaRETZSWFBgQ9a9htKlWAP4q6S', NULL, NULL, NULL, '2021-11-24 04:43:34', '2021-11-24 04:43:34', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1204, 'ADMIN-KOTA BAMBU SELATAN', 'adminkotabambuselatan@dpmptsp-dki.com', NULL, '$2y$10$w94SS6GDJpp.f8iLwPTwJOzJxYzOmSB2xmBLxG/vfPYgDTC297wmu', NULL, NULL, NULL, '2021-11-24 04:43:34', '2021-11-24 04:43:34', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1205, 'ADMIN-KOTA BAMBU UTARA', 'adminkotabambuutara@dpmptsp-dki.com', NULL, '$2y$10$62FBR1aC88bW7KP77QSpqufCo/4gta.HwhyF6eo2Lx2dCet1ysjRC', NULL, NULL, NULL, '2021-11-24 04:43:34', '2021-11-24 04:43:34', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1206, 'ADMIN-KRAMAT', 'adminkramat@dpmptsp-dki.com', NULL, '$2y$10$i8SpjugStKbrkim.bWUNBuKv1..wSWCh8.fLKTJ78/URJbyqZBaSa', NULL, NULL, NULL, '2021-11-24 04:43:34', '2021-11-24 04:43:34', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1207, 'ADMIN-KRAMATJATI', 'adminkramatjati@dpmptsp-dki.com', NULL, '$2y$10$WZSd7v1gcIqX9vUMT0BKROXj8a2wZ.mbh2a5XlzYFfOmQvE3fKm8S', NULL, NULL, NULL, '2021-11-24 04:43:34', '2021-11-24 04:43:34', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1208, 'ADMIN-KRAMAT PELA', 'adminkramatpela@dpmptsp-dki.com', NULL, '$2y$10$Y7TybNZczc4pS80lnLRB4OHRIr2H7hcRmKVYp6pw8I8K5aPrQ9L/y', NULL, NULL, NULL, '2021-11-24 04:43:34', '2021-11-24 04:43:34', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1209, 'ADMIN-KRUKUT', 'adminkrukut@dpmptsp-dki.com', NULL, '$2y$10$7iBNZWtA8HhdZuThE2gNU.jT2F/o1Alql.Gc7bZNql6J0IhkQiJFG', NULL, NULL, NULL, '2021-11-24 04:43:34', '2021-11-24 04:43:34', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1210, 'ADMIN-KUNINGAN BARAT', 'adminkuninganbarat@dpmptsp-dki.com', NULL, '$2y$10$JNJPUdzeZQrju9ibQVIWtORld32KxAAKEqyZkOf1rOrXgENCRbGBm', NULL, NULL, NULL, '2021-11-24 04:43:34', '2021-11-24 04:43:34', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1211, 'ADMIN-KUNINGAN TIMUR', 'adminkuningantimur@dpmptsp-dki.com', NULL, '$2y$10$BBVq62Qdhjuz77gGyOeG6unyNwO.0IaIdOlAm.zPmr8LYBSnB2HJi', NULL, NULL, NULL, '2021-11-24 04:43:34', '2021-11-24 04:43:34', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1212, 'ADMIN-KWITANG', 'adminkwitang@dpmptsp-dki.com', NULL, '$2y$10$httTn2x0rQQ/Gwn.mkxnveOXKMeSiycTtX2Ne/G.5qzCELdeqs4ta', NULL, NULL, NULL, '2021-11-24 04:43:34', '2021-11-24 04:43:34', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1213, 'ADMIN-LAGOA', 'adminlagoa@dpmptsp-dki.com', NULL, '$2y$10$KnP.Gre4lGnGEeILerelPuI3YxrTp3dvX/rNfXxd4swbQrqsGJJqG', NULL, NULL, NULL, '2021-11-24 04:43:35', '2021-11-24 04:43:35', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1214, 'ADMIN-LEBAK BULUS', 'adminlebakbulus@dpmptsp-dki.com', NULL, '$2y$10$kzLnCw3nXwyCAtQlRYK7pOiWY8OtJ04fGtqW9gBbpu2f3Fdk0Jb.K', NULL, NULL, NULL, '2021-11-24 04:43:35', '2021-11-24 04:43:35', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1215, 'ADMIN-LENTENG AGUNG', 'adminlentengagung@dpmptsp-dki.com', NULL, '$2y$10$951LJCOx/LRxSGV4ch9IT.BusQ8J0l18Ox7eyzXLVsC0r/FiOpXDW', NULL, NULL, NULL, '2021-11-24 04:43:35', '2021-11-24 04:43:35', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1216, 'ADMIN-LUBANG BUAYA', 'adminlubangbuaya@dpmptsp-dki.com', NULL, '$2y$10$EPWGKiO6xjPm6i0TyRa81eonO8UeVG7AvofuBqjheN2CwpkYnYMmG', NULL, NULL, NULL, '2021-11-24 04:43:35', '2021-11-24 04:43:35', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1217, 'ADMIN-MAKASAR', 'adminmakasar@dpmptsp-dki.com', NULL, '$2y$10$re4QdpvgB5iRYkqcY6t3w.cYA7UAYmjC/z3U3BmsnBVTNozkUt0JC', NULL, NULL, NULL, '2021-11-24 04:43:35', '2021-11-24 04:43:35', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1218, 'ADMIN-MALAKA JAYA', 'adminmalakajaya@dpmptsp-dki.com', NULL, '$2y$10$wCsXWR2OfZ3KDBZrlhFhh.n2iF9saR8zmzmgi.VbCUNr6ig110izm', NULL, NULL, NULL, '2021-11-24 04:43:35', '2021-11-24 04:43:35', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1219, 'ADMIN-MALAKA SARI', 'adminmalakasari@dpmptsp-dki.com', NULL, '$2y$10$zJhUbxkQdyRLdeH25bMLg.EPr2lTsXH4eufoS4POkz6MVJhQU7IB6', NULL, NULL, NULL, '2021-11-24 04:43:35', '2021-11-24 04:43:35', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1220, 'ADMIN-MAMPANG PRAPATAN', 'adminmampangprapatan@dpmptsp-dki.com', NULL, '$2y$10$XwwaMP/sAJECFjuYvOPymuFRYikcdBP9B1ZhvAcK4dgxGubuJOMsa', NULL, NULL, NULL, '2021-11-24 04:43:35', '2021-11-24 04:43:35', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1221, 'ADMIN-MANGGA BESAR', 'adminmanggabesar@dpmptsp-dki.com', NULL, '$2y$10$Oo3slRNDPiptxb1UfY/Wa.tooVb3FyJxVVJopZEcoLn2FmvUKkjJO', NULL, NULL, NULL, '2021-11-24 04:43:35', '2021-11-24 04:43:35', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1222, 'ADMIN-MANGGA DUA SELATAN', 'adminmanggaduaselatan@dpmptsp-dki.com', NULL, '$2y$10$XwZzNHj5Wg5kTh73/mm8UO8QI.bCojuNV1EZ55s9Qt0ooPtlx.Hpi', NULL, NULL, NULL, '2021-11-24 04:43:35', '2021-11-24 04:43:35', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1223, 'ADMIN-MANGGARAI', 'adminmanggarai@dpmptsp-dki.com', NULL, '$2y$10$kt1F9biUMMWx0hxBxpOkvuTxVKIo9SWlW7v21rcprAw43sTx0TSrO', NULL, NULL, NULL, '2021-11-24 04:43:35', '2021-11-24 04:43:35', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1224, 'ADMIN-MANGGARAI SELATAN', 'adminmanggaraiselatan@dpmptsp-dki.com', NULL, '$2y$10$FkVy5MXARLGKTrwV5sF/3OoC9xMejNvPQH3sYcqXFBh2t5kxussVW', NULL, NULL, NULL, '2021-11-24 04:43:35', '2021-11-24 04:43:35', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1225, 'ADMIN-MAPHAR', 'adminmaphar@dpmptsp-dki.com', NULL, '$2y$10$goqSVrWY4kNTlhaLq2NwwuKB.9BaRnX8Vsz5c9A6OzoONyMqhIqp2', NULL, NULL, NULL, '2021-11-24 04:43:36', '2021-11-24 04:43:36', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1226, 'ADMIN-MARUNDA', 'adminmarunda@dpmptsp-dki.com', NULL, '$2y$10$HL5Y6/wOqHQGK26mUjoW9.vtv.u2vHU44uYo3KmWBH/EU/fEMIyPi', NULL, NULL, NULL, '2021-11-24 04:43:36', '2021-11-24 04:43:36', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1227, 'ADMIN-MELAWAI', 'adminmelawai@dpmptsp-dki.com', NULL, '$2y$10$ZP/OcnzhR88ZAwlIdmJPBO6FLsORp0oidB1FqxxZHoHPytrIJ5jHC', NULL, NULL, NULL, '2021-11-24 04:43:36', '2021-11-24 04:43:36', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1228, 'ADMIN-MENTENG', 'adminmenteng@dpmptsp-dki.com', NULL, '$2y$10$EDM.JH42eUdLtiqpiI4SsuIZMKUJYQ/ZFJ1Vt0a/o/uvM0GhrVCIS', NULL, NULL, NULL, '2021-11-24 04:43:36', '2021-11-24 04:43:36', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1229, 'ADMIN-MENTENG ATAS', 'adminmentengatas@dpmptsp-dki.com', NULL, '$2y$10$/7SD.Sy4bmRmmOpeog1WRebb/DUf65//V48vksZFkXk0vwX9E.HKO', NULL, NULL, NULL, '2021-11-24 04:43:36', '2021-11-24 04:43:36', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1230, 'ADMIN-MENTENG DALAM', 'adminmentengdalam@dpmptsp-dki.com', NULL, '$2y$10$cGBjzTjcztRw2JxryCwMQuD5uCdNG7HMyRvIA7euw/3hz2ZgzB/Vy', NULL, NULL, NULL, '2021-11-24 04:43:36', '2021-11-24 04:43:36', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1231, 'ADMIN-MERUYA SELATAN', 'adminmeruyaselatan@dpmptsp-dki.com', NULL, '$2y$10$E4ad4L4lP69lXb8nmsI2aenvLfRENZHd.yBImEIAf88AaSKQB4A1S', NULL, NULL, NULL, '2021-11-24 04:43:36', '2021-11-24 04:43:36', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1232, 'ADMIN-MERUYA UTARA', 'adminmeruyautara@dpmptsp-dki.com', NULL, '$2y$10$ES3Diid7182V.2bL9Z.q..6DOy4lm3C2oxuos.LiFz8n9feFa8zRa', NULL, NULL, NULL, '2021-11-24 04:43:36', '2021-11-24 04:43:36', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1233, 'ADMIN-MUNJUL', 'adminmunjul@dpmptsp-dki.com', NULL, '$2y$10$/8i1waOuGj/5827Ru8ovR.XF5uV9QBOQuVshcqbPEfmuAIMIHkwIC', NULL, NULL, NULL, '2021-11-24 04:43:36', '2021-11-24 04:43:36', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1234, 'ADMIN-PADEMANGAN BARAT', 'adminpademanganbarat@dpmptsp-dki.com', NULL, '$2y$10$iyIEtNFA.UWlIZwgavjwp.CZ6yQvg46K5hRCVhxQU2OgSIkb0gX86', NULL, NULL, NULL, '2021-11-24 04:43:36', '2021-11-24 04:43:36', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1235, 'ADMIN-PADEMANGAN TIMUR', 'adminpademangantimur@dpmptsp-dki.com', NULL, '$2y$10$QFXy7xITFuhnMRMiXnmaF.VJQdjlF9xoDwg.BjQRaMLTXgNL8o5DW', NULL, NULL, NULL, '2021-11-24 04:43:36', '2021-11-24 04:43:36', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1236, 'ADMIN-PALMERIAM', 'adminpalmeriam@dpmptsp-dki.com', NULL, '$2y$10$cm8AxRCOIib5tdjcnskKh.VEo8Y33a.j3l9px4t6rU9/4CO1HH7om', NULL, NULL, NULL, '2021-11-24 04:43:36', '2021-11-24 04:43:36', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1237, 'ADMIN-PALMERAH', 'adminpalmerah@dpmptsp-dki.com', NULL, '$2y$10$4syM9nAm6.CuQDMyqheaMeBu4xFvK6L97404z6pIYP07TcU0gsxY6', NULL, NULL, NULL, '2021-11-24 04:43:36', '2021-11-24 04:43:36', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1238, 'ADMIN-PANCORAN', 'adminpancoran@dpmptsp-dki.com', NULL, '$2y$10$a73vZwplTrPR0Jbm0n3rwuJCmlZzCxK7tpqpGGcJIDWG6kv639krS', NULL, NULL, NULL, '2021-11-24 04:43:37', '2021-11-24 04:43:37', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1239, 'ADMIN-PAPANGGO', 'adminpapanggo@dpmptsp-dki.com', NULL, '$2y$10$kGTsvG10ilVyYAJxOMruduqgYxwcDIA.eazvId4fwxP0J1v8yqJlS', NULL, NULL, NULL, '2021-11-24 04:43:37', '2021-11-24 04:43:37', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1240, 'ADMIN-PASAR BARU', 'adminpasarbaru@dpmptsp-dki.com', NULL, '$2y$10$1MUX000LNTcwP71GpP.nm.cM2xr0kC1LclCAN4MvKUi.Ry3aJlHJe', NULL, NULL, NULL, '2021-11-24 04:43:37', '2021-11-27 12:13:08', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 1),
(1241, 'ADMIN-PASAR MANGGIS', 'adminpasarmanggis@dpmptsp-dki.com', NULL, '$2y$10$K8X8pBBqQ3wn9/gkYv/Lh.bKIdcV6a1cub4wlsQ3xllYY0DkN7vZW', NULL, NULL, NULL, '2021-11-24 04:43:37', '2021-11-24 04:43:37', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1242, 'ADMIN-PASAR MINGGU', 'adminpasarminggu@dpmptsp-dki.com', NULL, '$2y$10$2Mp8pV12iRnLL0x8zIvhoONdd6kvRv.bi7b4CVZzU317ebWdjKzZu', NULL, NULL, NULL, '2021-11-24 04:43:37', '2021-11-24 04:43:37', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1243, 'ADMIN-PASEBAN', 'adminpaseban@dpmptsp-dki.com', NULL, '$2y$10$CIhPyCo4xiJlO1hqmHBFcuQn2H9xO5.rmdF4pT0Lq1DDprwg/Aj1W', NULL, NULL, NULL, '2021-11-24 04:43:37', '2021-11-24 04:43:37', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1244, 'ADMIN-PEGADUNGAN', 'adminpegadungan@dpmptsp-dki.com', NULL, '$2y$10$9JimK1ykXDGYzk1GBq48i.VK0ia7ROe45YFDYtGZfe.zbm7k7P0QO', NULL, NULL, NULL, '2021-11-24 04:43:37', '2021-11-24 04:43:37', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1245, 'ADMIN-PEGANGSAAN', 'adminpegangsaan@dpmptsp-dki.com', NULL, '$2y$10$DGF79JyBIYG597ObO/gXeOB98X6es/yiWnhX1xhl7hZkLI46dFMli', NULL, NULL, NULL, '2021-11-24 04:43:37', '2021-11-24 04:43:37', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1246, 'ADMIN-PEGANGSAAN DUA', 'adminpegangsaandua@dpmptsp-dki.com', NULL, '$2y$10$nFxICXGxs.8p3HPkWepcR.YP6iKlRS4JoWFdOHyfgm9NsVQDnfZQO', NULL, NULL, NULL, '2021-11-24 04:43:37', '2021-11-24 04:43:37', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1247, 'ADMIN-PEJAGALAN', 'adminpejagalan@dpmptsp-dki.com', NULL, '$2y$10$M0BHVqXKNBoHhwJIf64eVelbV7FSJNYVHdy.Ic8jyqpOgLjThxrbS', NULL, NULL, NULL, '2021-11-24 04:43:37', '2021-11-24 04:43:37', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1248, 'ADMIN-PEJATEN BARAT', 'adminpejatenbarat@dpmptsp-dki.com', NULL, '$2y$10$0tyOMgRhWi.AcIFmA6TzAeGxxlrgL2OvU6Y891IWucr88PBTjHhn.', NULL, NULL, NULL, '2021-11-24 04:43:37', '2021-11-24 04:43:37', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1249, 'ADMIN-PEJATEN TIMUR', 'adminpejatentimur@dpmptsp-dki.com', NULL, '$2y$10$i2oMC3c3HvhxyalmgVXssOzCX.FzfJLwxmlVzBlV7Qux0A0SSKBTu', NULL, NULL, NULL, '2021-11-24 04:43:37', '2021-11-24 04:43:37', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1250, 'ADMIN-PEKAYON', 'adminpekayon@dpmptsp-dki.com', NULL, '$2y$10$MlE90iNTEF4f5zXfZhu6u.oFS0Z8oOCwMB9RZ3K0LKL4sSmvlgXca', NULL, NULL, NULL, '2021-11-24 04:43:38', '2021-11-24 04:43:38', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1251, 'ADMIN-PEKOJAN', 'adminpekojan@dpmptsp-dki.com', NULL, '$2y$10$cfEgWWSmkooVtpg.bGMQOuBYgPwjyYy0yC1yTQ4Flns.wkU89EoIO', NULL, NULL, NULL, '2021-11-24 04:43:38', '2021-11-24 04:43:38', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1252, 'ADMIN-PELA MAMPANG', 'adminpelamampang@dpmptsp-dki.com', NULL, '$2y$10$AC1NiDSlbbLYUJKapSDuw.bolAQm9f3VHP2SNzPxF1GB5oClG6bmC', NULL, NULL, NULL, '2021-11-24 04:43:38', '2021-11-27 12:12:43', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1253, 'ADMIN-PENGADEGAN', 'adminpengadegan@dpmptsp-dki.com', NULL, '$2y$10$3XZOpvhLuStPMnopYIZA..0jJ9Txb4RciRY5c3X.p8iIdUrE0WtP2', NULL, NULL, NULL, '2021-11-24 04:43:38', '2021-11-24 04:43:38', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1254, 'ADMIN-PENGGILINGAN', 'adminpenggilingan@dpmptsp-dki.com', NULL, '$2y$10$g8sIyNeumSZQbRf8Z5ami./zAysiSpApubGTesuc5GnMdnfJT5RuC', NULL, NULL, NULL, '2021-11-24 04:43:38', '2021-11-24 04:43:38', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1255, 'ADMIN-PENJARINGAN', 'adminpenjaringan@dpmptsp-dki.com', NULL, '$2y$10$Jgn3kRBKCEfB1VjnnraVmOq3ShvFoGcqclvDSi9ysM.chWDh5nPhm', NULL, NULL, NULL, '2021-11-24 04:43:38', '2021-11-24 04:43:38', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1256, 'ADMIN-PESANGGRAHAN', 'adminpesanggrahan@dpmptsp-dki.com', NULL, '$2y$10$ho3QVg/37LbV0G.vA2dbS.oTkTf4deAlRKn38z42RRE3laYP5nBzK', NULL, NULL, NULL, '2021-11-24 04:43:38', '2021-11-24 04:43:38', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1257, 'ADMIN-PETAMBURAN', 'adminpetamburan@dpmptsp-dki.com', NULL, '$2y$10$gttuFLdoCkpy7q6Atja3H.HvymlM.491D8xRtfct0Kr4fysC5Y57S', NULL, NULL, NULL, '2021-11-24 04:43:38', '2021-11-24 04:43:38', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1258, 'ADMIN-PETOGOGAN', 'adminpetogogan@dpmptsp-dki.com', NULL, '$2y$10$p4Ldz3jCnDQrOu51o8FJg.xbIlV78dJ1sS10nzH33p7FiAXE2KOSi', NULL, NULL, NULL, '2021-11-24 04:43:38', '2021-11-24 04:43:38', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1259, 'ADMIN-PETOJO SELATAN', 'adminpetojoselatan@dpmptsp-dki.com', NULL, '$2y$10$UjdUnFs/uVaqLCOKgYtWLuyaQQZxPcDo4BM/jy3hDrl5SatLukSXO', NULL, NULL, NULL, '2021-11-24 04:43:38', '2021-11-24 04:43:38', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1260, 'ADMIN-PETOJO UTARA', 'adminpetojoutara@dpmptsp-dki.com', NULL, '$2y$10$DjNhK4Tj942EJ0YYIiiEge6AmoEn1oc2fz2g5cMVZyRXSQxaNsW4W', NULL, NULL, NULL, '2021-11-24 04:43:38', '2021-11-24 04:43:38', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1261, 'ADMIN-PLUIT', 'adminpluit@dpmptsp-dki.com', NULL, '$2y$10$gbVbZJo6s4ChxDwxErXrpuoQM48fp5yAbwL13tILIOlsK/GknQd7u', NULL, NULL, NULL, '2021-11-24 04:43:38', '2021-11-24 04:43:38', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1262, 'ADMIN-PONDOK BAMBU', 'adminpondokbambu@dpmptsp-dki.com', NULL, '$2y$10$GoojHdiwHn8SS36YDWeYJ.G9ULJBAozxevcQax3VImBrTA1RMRmcW', NULL, NULL, NULL, '2021-11-24 04:43:38', '2021-11-24 04:43:38', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1263, 'ADMIN-PONDOK KELAPA', 'adminpondokkelapa@dpmptsp-dki.com', NULL, '$2y$10$GCr7pIyr6.TLX4I6bEmOcOT.9eMOA/bbhbM0AfSRT9.E/s/4n.pUq', NULL, NULL, NULL, '2021-11-24 04:43:39', '2021-11-24 04:43:39', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1264, 'ADMIN-PONDOK KOPI', 'adminpondokkopi@dpmptsp-dki.com', NULL, '$2y$10$dFGOmv4w7B95gwSDNtdB2OOfAd0N0CzD7Jmk/xp6cK5P5u6whZxH.', NULL, NULL, NULL, '2021-11-24 04:43:39', '2021-11-24 04:43:39', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1265, 'ADMIN-PONDOK LABU', 'adminpondoklabu@dpmptsp-dki.com', NULL, '$2y$10$e9DXOGxAMckBhTFXG49VAeQxO07eEy0dm70HOTUIdx6FWkhXSC4S2', NULL, NULL, NULL, '2021-11-24 04:43:39', '2021-11-24 04:43:39', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1266, 'ADMIN-PONDOK PINANG', 'adminpondokpinang@dpmptsp-dki.com', NULL, '$2y$10$h8GulLqBf1GlG2yhooLyfu7nD00sHqZbIu9nhLOqfI7uVOmi0l0a2', NULL, NULL, NULL, '2021-11-24 04:43:39', '2021-11-24 04:43:39', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1267, 'ADMIN-PULO GEBANG', 'adminpulogebang@dpmptsp-dki.com', NULL, '$2y$10$3EM5vDWGQBBGQHx2tA2RsOImhloJq/7GDSYHk3.pmpPvrFVMk6FbC', NULL, NULL, NULL, '2021-11-24 04:43:39', '2021-11-24 04:43:39', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1268, 'ADMIN-RAGUNAN', 'adminragunan@dpmptsp-dki.com', NULL, '$2y$10$YOw/wfXTPtIx3TSMdxQi/.s27ezRMs7oSrZfMB04YevM8F7GxWc.C', NULL, NULL, NULL, '2021-11-24 04:43:39', '2021-11-24 04:43:39', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1269, 'ADMIN-RAMBUTAN', 'adminrambutan@dpmptsp-dki.com', NULL, '$2y$10$mdDs7mLamLp/l7mllcnJjuu1iSJH4g7ooxPCftJ3Pjxud3JTkUk/y', NULL, NULL, NULL, '2021-11-24 04:43:39', '2021-11-24 04:43:39', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1270, 'ADMIN-RAWA BADAK SELATAN', 'adminrawabadakselatan@dpmptsp-dki.com', NULL, '$2y$10$g2h3j9qYDo0vl52XNe4sAOpQAz89fIfKqn29qvGW70WqlHm9.P7Sa', NULL, NULL, NULL, '2021-11-24 04:43:39', '2021-11-24 04:43:39', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1271, 'ADMIN-PETUKANGAN UTARA', 'adminpetukanganutara@dpmptsp-dki.com', NULL, '$2y$10$hEVcIbuJMoeK4TGPv3V1aO4xvQ0YjNc7Uv0rJbX2qeBtMk7HZg3p2', NULL, NULL, NULL, '2021-11-24 04:43:39', '2021-11-24 04:43:39', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1272, 'ADMIN-PINANGSIA', 'adminpinangsia@dpmptsp-dki.com', NULL, '$2y$10$psINx1sKzr5e8npuXzqnU.MyBsWoKIok6fokgtl0QThWzZgG11sg2', NULL, NULL, NULL, '2021-11-24 04:43:39', '2021-11-24 04:43:39', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1273, 'ADMIN-PETUKANGAN SELATAN', 'adminpetukanganselatan@dpmptsp-dki.com', NULL, '$2y$10$EzH3KZQKjqC296udTehCXOp/B/HK3hHLaa.wmdUqCYd0ERGeGPeJq', NULL, NULL, NULL, '2021-11-24 04:43:39', '2021-11-24 04:43:39', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1274, 'ADMIN-PISANGAN BARU', 'adminpisanganbaru@dpmptsp-dki.com', NULL, '$2y$10$iZEUJ3f2Hf4zT3cSYUupU.09QFUMkQG/L7SxkCxEiOuD2LOzBK7ce', NULL, NULL, NULL, '2021-11-24 04:43:39', '2021-11-24 04:43:39', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1275, 'ADMIN-PISANGAN TIMUR', 'adminpisangantimur@dpmptsp-dki.com', NULL, '$2y$10$o06wd3SuRRFME2RZ0jC/R.DYkBTNHv7r2YgLpnTP3Y9m82wO78GXe', NULL, NULL, NULL, '2021-11-24 04:43:40', '2021-11-24 04:43:40', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1276, 'ADMIN-RAWA BADAK UTARA', 'adminrawabadakutara@dpmptsp-dki.com', NULL, '$2y$10$YR6Boas0cXplXcl0VcEL0O7T9pv3VMr4bfhwmPb5Gz5iEC8VK5epq', NULL, NULL, NULL, '2021-11-24 04:43:40', '2021-11-24 04:43:40', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1277, 'ADMIN-UTAN KAYU SELATAN', 'adminutankayuselatan@dpmptsp-dki.com', NULL, '$2y$10$833oFw3Zunf/bIZQhsLXB.rxv/J3H/hITXyxHyS6WiaYq77gO2syO', NULL, NULL, NULL, '2021-11-24 04:43:40', '2021-11-24 04:43:40', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1278, 'ADMIN-UTAN KAYU UTARA', 'adminutankayuutara@dpmptsp-dki.com', NULL, '$2y$10$XDzbR/O.AerssqZ0ixktl.hw3jMYiYsKFo1uIvZ4NIYCLsITFFbXa', NULL, NULL, NULL, '2021-11-24 04:43:40', '2021-11-24 04:43:40', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1279, 'ADMIN-RAWA BUAYA', 'adminrawabuaya@dpmptsp-dki.com', NULL, '$2y$10$XFXnLk87kgS6cfNP096.2eVmDziz/wmI0qLV2WBWQcrEBKKXdozku', NULL, NULL, NULL, '2021-11-24 04:43:40', '2021-11-24 04:43:40', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1280, 'ADMIN-RAWA BUNGA', 'adminrawabunga@dpmptsp-dki.com', NULL, '$2y$10$EhulX95QJuEfrOaRIyvyKe21K4TFNWuFntc3/Dy0sPTWfkzr7SnK2', NULL, NULL, NULL, '2021-11-24 04:43:40', '2021-11-24 04:43:40', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1281, 'ADMIN-RAWAJATI', 'adminrawajati@dpmptsp-dki.com', NULL, '$2y$10$5VEP.ui3S95t1uIBEBK4F.yjqJwXmc7pex/1oiICHL/n.i5N9iVNa', NULL, NULL, NULL, '2021-11-24 04:43:40', '2021-11-24 04:43:40', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1282, 'ADMIN-RAWA TERATE', 'adminrawaterate@dpmptsp-dki.com', NULL, '$2y$10$kdgNU2fd8xpJ/XivyDOHz.TmWeoLGgOQplEEfOGMY2RV862mPf0na', NULL, NULL, NULL, '2021-11-24 04:43:40', '2021-11-24 04:43:40', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1283, 'ADMIN-RAWAMANGUN', 'adminrawamangun@dpmptsp-dki.com', NULL, '$2y$10$iWFZmIf6RHnPuezxQh6fxOp4GWVeLNvbruDPeNTAc0dkcrAc8njIG', NULL, NULL, NULL, '2021-11-24 04:43:40', '2021-11-24 04:43:40', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1284, 'ADMIN-RAWASARI', 'adminrawasari@dpmptsp-dki.com', NULL, '$2y$10$BUoyBrOJkPAZzyJAX15q1Ohpco2WB8.K4uuigaH4KyjhzO65FORQO', NULL, NULL, NULL, '2021-11-24 04:43:40', '2021-11-24 04:43:40', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1285, 'ADMIN-ROA MALAKA', 'adminroamalaka@dpmptsp-dki.com', NULL, '$2y$10$CrHk.pzxe5y9VVRwt3b1pOjfl1Pee6Uk8yFlYeemusyTAY4qrra3i', NULL, NULL, NULL, '2021-11-24 04:43:40', '2021-11-24 04:43:40', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1286, 'ADMIN-ROROTAN', 'adminrorotan@dpmptsp-dki.com', NULL, '$2y$10$JgQuNSush7InJ2mAqmcCmusJXz81e.DIEHI9Ud6QUx8WyID2bRHAa', NULL, NULL, NULL, '2021-11-24 04:43:40', '2021-11-24 04:43:40', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1287, 'ADMIN-SELONG', 'adminselong@dpmptsp-dki.com', NULL, '$2y$10$bS9UePrvPNBGq55N3LhkWuHtUfg2l4sb0sd989.I9U7NzMRzX5iM.', NULL, NULL, NULL, '2021-11-24 04:43:40', '2021-11-24 04:43:40', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1288, 'ADMIN-SEMANAN', 'adminsemanan@dpmptsp-dki.com', NULL, '$2y$10$HA0rdQKGnPCYzmymcBIjZuiy1M6PeU2dsKtYMtqbsVo/UvPVDckbG', NULL, NULL, NULL, '2021-11-24 04:43:41', '2021-11-24 04:43:41', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1289, 'ADMIN-SEMPER BARAT', 'adminsemperbarat@dpmptsp-dki.com', NULL, '$2y$10$1cNzptkX9WDlVh4sh.1FeOdh4wmK6kQGvgy8DuVJEJA5Tr511awqG', NULL, NULL, NULL, '2021-11-24 04:43:41', '2021-11-24 04:43:41', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1290, 'ADMIN-SEMPER TIMUR', 'adminsempertimur@dpmptsp-dki.com', NULL, '$2y$10$tSwjrh5gcAJPEwW2Qz9jX.fmok10beBHO5hRM7weO5Mx0U0A6sMz2', NULL, NULL, NULL, '2021-11-24 04:43:41', '2021-11-24 04:43:41', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1291, 'ADMIN-SENAYAN', 'adminsenayan@dpmptsp-dki.com', NULL, '$2y$10$EVIICFSJqHhK6EI0s1x46eYY/5ECR7G5kOjdV3TjBagoHyNeI61vy', NULL, NULL, NULL, '2021-11-24 04:43:41', '2021-11-24 04:43:41', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1292, 'ADMIN-SENEN', 'adminsenen@dpmptsp-dki.com', NULL, '$2y$10$.bUxkl82uycV6XX0NF1ih.X6tgr87o5YIMJiItS0rFcuXkiGBETk2', NULL, NULL, NULL, '2021-11-24 04:43:41', '2021-11-24 04:43:41', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1293, 'ADMIN-SERDANG', 'adminserdang@dpmptsp-dki.com', NULL, '$2y$10$O7yl6onjXqg2IEVwyqNuv.XoGav/YBiYvptnep4JCWYZ6FhIK7xjq', NULL, NULL, NULL, '2021-11-24 04:43:41', '2021-11-24 04:43:41', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1294, 'ADMIN-SETIA BUDI', 'adminsetiabudi@dpmptsp-dki.com', NULL, '$2y$10$wNL/LpS6O678sG5elRW7D.bjElCUtlIFPN580G/HxvDU7HC/f0Tni', NULL, NULL, NULL, '2021-11-24 04:43:41', '2021-11-24 04:43:41', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1295, 'ADMIN-SETU', 'adminsetu@dpmptsp-dki.com', NULL, '$2y$10$ZuEY3NZcE6LeMZhA2MidqeLO6gVKOqaCHXhI7lo7tcr3wgq6avPd2', NULL, NULL, NULL, '2021-11-24 04:43:41', '2021-11-24 04:43:41', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1296, 'ADMIN-SLIPI', 'adminslipi@dpmptsp-dki.com', NULL, '$2y$10$cVCOsragUS4AVFCiQL.HFu4UK6bA18RU.wAp/z0OgzARrTV/0cwmm', NULL, NULL, NULL, '2021-11-24 04:43:41', '2021-11-24 04:43:41', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1297, 'ADMIN-SRENGSENG', 'adminsrengseng@dpmptsp-dki.com', NULL, '$2y$10$nfH5THmP2Pg1XveSZWglGeLlHf0n/wzlWGLpcq4k8ZFshNtF.gU02', NULL, NULL, NULL, '2021-11-24 04:43:41', '2021-11-24 04:43:41', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1298, 'ADMIN-SRENGSENG SAWAH', 'adminsrengsengsawah@dpmptsp-dki.com', NULL, '$2y$10$fQ0YyZVXaDTGy6horP23eeRL7kYIZpvib7lxICKkbXa7jB6b.B9je', NULL, NULL, NULL, '2021-11-24 04:43:41', '2021-11-24 04:43:41', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1299, 'ADMIN-SUKABUMI SELATAN', 'adminsukabumiselatan@dpmptsp-dki.com', NULL, '$2y$10$Y9b1/DPm.4VXyLmLRlOz1eWyc6PmLBKC.Zy9osM5TfPoNPZ23DAoi', NULL, NULL, NULL, '2021-11-24 04:43:41', '2021-11-24 04:43:41', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1300, 'ADMIN-SUKABUMI UTARA', 'adminsukabumiutara@dpmptsp-dki.com', NULL, '$2y$10$RmCnoIKULyxVE/dtjaSnCeDbl4eQBszqAmNnoIehwQpLQTgjLH.5C', NULL, NULL, NULL, '2021-11-24 04:43:42', '2021-11-24 04:43:42', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1301, 'ADMIN-SUKAPURA', 'adminsukapura@dpmptsp-dki.com', NULL, '$2y$10$8kC8jFvMJK99qZvEa8CLtO3ewTkxHBXb8Z.zz6Um/hsN0wTxe/WTm', NULL, NULL, NULL, '2021-11-24 04:43:42', '2021-11-24 04:43:42', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1302, 'ADMIN-SUMUR BATU', 'adminsumurbatu@dpmptsp-dki.com', NULL, '$2y$10$yEmXCIuV6S9yJgA1nG/8JOikSg4UCmQ9LXrQtOsnqIr5q5ZYb35Fq', NULL, NULL, NULL, '2021-11-24 04:43:42', '2021-11-24 04:43:42', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1303, 'ADMIN-SUNGAI BAMBU', 'adminsungaibambu@dpmptsp-dki.com', NULL, '$2y$10$w/7wd/SkxMWqpy4pOrDXqOGNzJ.o1BNQRV47VZQJhRp1XvqVrz3zi', NULL, NULL, NULL, '2021-11-24 04:43:42', '2021-11-24 04:43:42', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1304, 'ADMIN-TANAH TINGGI', 'admintanahtinggi@dpmptsp-dki.com', NULL, '$2y$10$.g17154bfOmgVUqz00WF9.LfokrBTKmggE2tq4IAfuCz/18M5ArCO', NULL, NULL, NULL, '2021-11-24 04:43:42', '2021-11-24 04:43:42', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1305, 'ADMIN-TANGKI', 'admintangki@dpmptsp-dki.com', NULL, '$2y$10$ZdGIckAPbzWU.wqRONV5/.SfQkqX/VMkfDpPYpAYL5lGiENWui50q', NULL, NULL, NULL, '2021-11-24 04:43:42', '2021-11-24 04:43:42', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1306, 'ADMIN-ULUJAMI', 'adminulujami@dpmptsp-dki.com', NULL, '$2y$10$QKS/0GCLso4Ue8koFebHOuFZs.SVgyIuX1qipYScR.lBl4hV1A7xq', NULL, NULL, NULL, '2021-11-24 04:43:42', '2021-11-24 04:43:42', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1307, 'ADMIN-TANJUNG BARAT', 'admintanjungbarat@dpmptsp-dki.com', NULL, '$2y$10$Kz2iW0G5OLVuBxK6usSJmumjutPyx0DOyxKwlNlKT8VnSIrsKa9eu', NULL, NULL, NULL, '2021-11-24 04:43:42', '2021-11-24 04:43:42', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1308, 'ADMIN-TANJUNG DUREN SELATAN', 'admintanjungdurenselatan@dpmptsp-dki.com', NULL, '$2y$10$8JmN2.dH92n/Dxl3pmIemO/sRa8RqrTUX4OkdLYmjw2St9vatnTRy', NULL, NULL, NULL, '2021-11-24 04:43:42', '2021-11-24 04:43:42', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1309, 'ADMIN-TANJUNG DUREN UTARA', 'admintanjungdurenutara@dpmptsp-dki.com', NULL, '$2y$10$PP.UqjtEPf6f2KQ0epKhjuAIicr.HJ6VSfbrXNXSQpFcEKkHY/5Ze', NULL, NULL, NULL, '2021-11-24 04:43:42', '2021-11-24 04:43:42', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1310, 'ADMIN-TANJUNG PRIOK', 'admintanjungpriok@dpmptsp-dki.com', NULL, '$2y$10$8UJR.Afo9g0tSXiDognfRerhDugNNUxcCMa8CXBcGZjfGpkOXUsvq', NULL, NULL, NULL, '2021-11-24 04:43:42', '2021-11-24 04:43:42', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1311, 'ADMIN-TEBET BARAT', 'admintebetbarat@dpmptsp-dki.com', NULL, '$2y$10$HQi1.TB499yxNjlZj9b...UFQ.2Q19Om97DdN4nHUK1uuC6sv72Cm', NULL, NULL, NULL, '2021-11-24 04:43:42', '2021-11-24 04:43:42', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1312, 'ADMIN-TEBET TIMUR', 'admintebettimur@dpmptsp-dki.com', NULL, '$2y$10$tRW2fiSQxR3CeC.tL7HuUeqUH8cdxeMOIGSqwcW0bVdexuRxbEc7q', NULL, NULL, NULL, '2021-11-24 04:43:43', '2021-11-24 04:43:43', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1313, 'ADMIN-TEGAL ALUR', 'admintegalalur@dpmptsp-dki.com', NULL, '$2y$10$hwNUve3YCRPd4YwPLMqnkOiw/2.yjF2BQPKryRWkTQdhmZDPtgF/G', NULL, NULL, NULL, '2021-11-24 04:43:43', '2021-11-24 04:43:43', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1314, 'ADMIN-TEGAL PARANG', 'admintegalparang@dpmptsp-dki.com', NULL, '$2y$10$meLYPhB6Br7/wfXHzIPHpeoa2wGYS6Nx/pl1mYJHM.GkZ7aHLpMZO', NULL, NULL, NULL, '2021-11-24 04:43:43', '2021-11-24 04:43:43', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1315, 'ADMIN-TOMANG', 'admintomang@dpmptsp-dki.com', NULL, '$2y$10$tJdSrbeCIhDgpbHalTR7VecXkR8ZKUpeZbO4pvY9va9dB9eqxSlhC', NULL, NULL, NULL, '2021-11-24 04:43:43', '2021-11-24 04:43:43', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0),
(1316, 'ADMIN-WARAKAS', 'adminwarakas@dpmptsp-dki.com', NULL, '$2y$10$ST.WihI2S53wy4tWT/xwl.PILhx0h2AeASJ5OpGBTCLzjva8lIFEW', NULL, NULL, NULL, '2021-11-24 04:43:43', '2021-11-24 04:43:43', 'e7f8ef25-cb57-4d04-a1f8-ef993afb2147.png', '#2180f3', 0, 0);


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
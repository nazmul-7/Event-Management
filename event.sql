# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.23)
# Database: event
# Generation Time: 2019-03-16 12:56:18 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table applications
# ------------------------------------------------------------

DROP TABLE IF EXISTS `applications`;

CREATE TABLE `applications` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `totalHoursApplied` double(8,2) NOT NULL DEFAULT '0.00',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'runningWeek',
  `isApproved` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;

INSERT INTO `applications` (`id`, `event_id`, `user_id`, `totalHoursApplied`, `status`, `isApproved`, `created_at`, `updated_at`)
VALUES
	(10,1,1,3.00,'runningWeek','Yes','2019-03-14 20:14:09','2019-03-14 20:14:09'),
	(11,2,1,3.00,'runningWeek','Yes','2019-03-14 20:14:10','2019-03-14 20:14:10'),
	(12,4,1,4.00,'runningWeek','Yes','2019-03-14 20:14:11','2019-03-14 20:14:11'),
	(13,2,4,6.15,'runningWeek','Yes','2019-03-15 19:07:42','2019-03-15 19:07:42');

/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table events
# ------------------------------------------------------------

DROP TABLE IF EXISTS `events`;

CREATE TABLE `events` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `eventName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `eventDesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `eventLocation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timeSlot` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalHours` double(8,2) NOT NULL,
  `eventDate` date NOT NULL,
  `numberOfGuests` int(11) NOT NULL,
  `numberOfValetsNeeded` int(11) NOT NULL,
  `visibleAfter` int(11) NOT NULL DEFAULT '0',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'runningWeek',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;

INSERT INTO `events` (`id`, `user_id`, `eventName`, `eventDesc`, `eventLocation`, `timeSlot`, `totalHours`, `eventDate`, `numberOfGuests`, `numberOfValetsNeeded`, `visibleAfter`, `status`, `created_at`, `updated_at`)
VALUES
	(1,1,'a','a','a','02:00 AM - 06:00 AM',4.00,'2019-03-14',50,5,1,'runningWeek','2019-03-14 01:14:11','2019-03-14 11:56:29'),
	(2,1,'This is Frist Event','This is Some Description.This is Some Description.This is Some Description.This is Some Description.This is Some Description.','Sylhet,Bangladesh','08:00 AM - 02:09 PM',6.15,'2019-03-14',50,5,1,'runningWeek','2019-03-14 05:15:26','2019-03-14 16:55:04'),
	(3,1,'Zx','aZXZ','ZXZX','02:00 AM - 03:00 AM',3.00,'2019-04-09',23,23,1,'runningWeek','2019-03-14 12:55:44','2019-03-14 12:57:50'),
	(4,1,'SA','as','AS','03:02 AM - 03:05 AM',0.05,'2019-03-15',232,23,23,'runningWeek','2019-03-14 16:55:25','2019-03-14 16:55:25');

/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2014_10_12_100000_create_password_resets_table',1),
	(3,'2019_03_13_143120_create_events_table',2),
	(4,'2019_03_13_144844_create_applications_table',3);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `firstName`, `lastName`, `email`, `phone`, `position`, `image`, `email_verified_at`, `password`, `isActive`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,'Nazmul editedf','Chowdhury editedf','nazmulchowdhury4@gmail.com','01681189844','super','/uploads/SO6EFo15fq1bEqe4Luy4A9mguSNj44fnmetNg5Dy.png',NULL,'$2y$10$LYrX6kFIf91jwNo1CfIcauM/njL4v6VyRmwRMz4ENfOJGrc2PmXh2',1,NULL,'2019-03-13 09:20:47','2019-03-14 17:34:12'),
	(3,'Kamran','Ahmed','admin@admin.com',NULL,'admin','/uploads/UOBqqjMdOUDz8GwS7RfmkixICZfuMyJWWDUGnsbm.png',NULL,'$2y$10$LYrX6kFIf91jwNo1CfIcauM/njL4v6VyRmwRMz4ENfOJGrc2PmXh2',1,NULL,'2019-03-14 06:32:51','2019-03-15 18:35:31'),
	(4,'Shipu','Numan 1','sade1k.hkm@gmail.com','0192323','super',NULL,NULL,'$2y$10$G59zn5REXVWKG3DXemPOjeeAx32MWf.sbrOY0dH4TnC5f1or86RZy',1,NULL,'2019-03-15 10:59:59','2019-03-16 11:22:44');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

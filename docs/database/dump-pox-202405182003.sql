-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 192.168.1.213    Database: pox
-- ------------------------------------------------------
-- Server version	8.4.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_groups`
--

DROP TABLE IF EXISTS `auth_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL,
  `created_by` int unsigned NOT NULL,
  `updated_at` timestamp NOT NULL,
  `updated_by` int unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_groups_name_IDX` (`name`) USING BTREE,
  KEY `auth_groups_deleted_at_IDX` (`deleted_at`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_groups`
--

LOCK TABLES `auth_groups` WRITE;
/*!40000 ALTER TABLE `auth_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permissions`
--

DROP TABLE IF EXISTS `auth_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `org_organization_id` int unsigned NOT NULL,
  `auth_user_id` int unsigned DEFAULT NULL,
  `auth_group_id` int unsigned DEFAULT NULL,
  `auth_role_id` int unsigned DEFAULT NULL,
  `res_resource_id` int unsigned NOT NULL,
  `create` tinyint unsigned NOT NULL DEFAULT '0',
  `read` tinyint unsigned NOT NULL DEFAULT '0',
  `update` tinyint unsigned NOT NULL DEFAULT '0',
  `delete` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL,
  `created_by` int unsigned NOT NULL,
  `updated_at` timestamp NOT NULL,
  `updated_by` int unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permissions_org_organization_id_IDX` (`org_organization_id`,`auth_group_id`,`auth_role_id`,`res_resource_id`) USING BTREE,
  KEY `auth_permissions_deleted_at_IDX` (`deleted_at`) USING BTREE,
  KEY `auth_permissions_users_FK` (`auth_user_id`),
  KEY `auth_permissions_auth_groups_FK` (`auth_group_id`),
  KEY `auth_permissions_auth_roles_FK` (`auth_role_id`),
  KEY `auth_permissions_res_resources_FK` (`res_resource_id`),
  CONSTRAINT `auth_permissions_auth_groups_FK` FOREIGN KEY (`auth_group_id`) REFERENCES `auth_groups` (`id`),
  CONSTRAINT `auth_permissions_auth_roles_FK` FOREIGN KEY (`auth_role_id`) REFERENCES `auth_roles` (`id`),
  CONSTRAINT `auth_permissions_org_organizations_FK` FOREIGN KEY (`org_organization_id`) REFERENCES `org_organizations` (`id`),
  CONSTRAINT `auth_permissions_res_resources_FK` FOREIGN KEY (`res_resource_id`) REFERENCES `res_resources` (`id`),
  CONSTRAINT `auth_permissions_users_FK` FOREIGN KEY (`auth_user_id`) REFERENCES `auth_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permissions`
--

LOCK TABLES `auth_permissions` WRITE;
/*!40000 ALTER TABLE `auth_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_roles`
--

DROP TABLE IF EXISTS `auth_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL,
  `created_by` int unsigned NOT NULL,
  `updated_at` timestamp NOT NULL,
  `updated_by` int unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_roles_name_IDX` (`name`) USING BTREE,
  KEY `auth_roles_deleted_at_IDX` (`deleted_at`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_roles`
--

LOCK TABLES `auth_roles` WRITE;
/*!40000 ALTER TABLE `auth_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_sessions`
--

DROP TABLE IF EXISTS `auth_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_sessions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `auth_user_id` int unsigned NOT NULL,
  `code` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL,
  `created_by` int unsigned NOT NULL,
  `updated_at` timestamp NOT NULL,
  `updated_by` int unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_sessions_code_IDX` (`code`) USING BTREE,
  KEY `user_sessions_deleted_at_IDX` (`deleted_at`) USING BTREE,
  KEY `user_sessions_users_FK` (`auth_user_id`),
  CONSTRAINT `user_sessions_users_FK` FOREIGN KEY (`auth_user_id`) REFERENCES `auth_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_sessions`
--

LOCK TABLES `auth_sessions` WRITE;
/*!40000 ALTER TABLE `auth_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `auth_group_id` int unsigned NOT NULL,
  `auth_user_id` int unsigned NOT NULL,
  `created_at` timestamp NOT NULL,
  `created_by` int unsigned NOT NULL,
  `updated_at` timestamp NOT NULL,
  `updated_by` int unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_auth_group_id_IDX` (`auth_group_id`,`auth_user_id`) USING BTREE,
  KEY `auth_user_groups_users_FK` (`auth_user_id`),
  KEY `auth_user_groups_deleted_at_IDX` (`deleted_at`) USING BTREE,
  CONSTRAINT `auth_user_groups_auth_groups_FK` FOREIGN KEY (`auth_group_id`) REFERENCES `auth_groups` (`id`),
  CONSTRAINT `auth_user_groups_users_FK` FOREIGN KEY (`auth_user_id`) REFERENCES `auth_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_users`
--

DROP TABLE IF EXISTS `auth_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `surename` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `accepted_terms` timestamp NULL DEFAULT NULL,
  `avatar_url` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL,
  `created_by` int unsigned NOT NULL,
  `updated_at` varchar(100) NOT NULL,
  `updated_by` int unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_IDX` (`email`) USING BTREE,
  KEY `users_deleted_at_IDX` (`deleted_at`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_users`
--

LOCK TABLES `auth_users` WRITE;
/*!40000 ALTER TABLE `auth_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geo_addresses`
--

DROP TABLE IF EXISTS `geo_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `geo_addresses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `org_organization_id` int unsigned DEFAULT NULL,
  `auth_user_id` int unsigned DEFAULT NULL,
  `geo_country_id` int unsigned NOT NULL,
  `geo_state_id` int unsigned DEFAULT NULL,
  `geo_city_id` int unsigned NOT NULL,
  `geo_zip_id` int unsigned DEFAULT NULL,
  `geo_neighbourhood_id` int unsigned DEFAULT NULL,
  `geo_street_id` int unsigned DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `door_number` varchar(100) DEFAULT NULL,
  `extra` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  `created_by` int unsigned NOT NULL,
  `updated_at` timestamp NOT NULL,
  `updated_by` int unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geo_addresses`
--

LOCK TABLES `geo_addresses` WRITE;
/*!40000 ALTER TABLE `geo_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `geo_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geo_cities`
--

DROP TABLE IF EXISTS `geo_cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `geo_cities` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `geo_country_id` int unsigned NOT NULL,
  `geo_state_id` int unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL,
  `created_by` int unsigned NOT NULL,
  `updated_at` timestamp NOT NULL,
  `updated_by` int unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `geo_cities_geo_states_FK` (`geo_state_id`),
  KEY `geo_cities_deleted_at_IDX` (`deleted_at`) USING BTREE,
  KEY `geo_cities_geo_countries_FK` (`geo_country_id`),
  CONSTRAINT `geo_cities_geo_countries_FK` FOREIGN KEY (`geo_country_id`) REFERENCES `geo_countries` (`id`),
  CONSTRAINT `geo_cities_geo_states_FK` FOREIGN KEY (`geo_state_id`) REFERENCES `geo_states` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geo_cities`
--

LOCK TABLES `geo_cities` WRITE;
/*!40000 ALTER TABLE `geo_cities` DISABLE KEYS */;
/*!40000 ALTER TABLE `geo_cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geo_countries`
--

DROP TABLE IF EXISTS `geo_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `geo_countries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `iso3166` varchar(2) NOT NULL,
  `parent_id` int unsigned DEFAULT NULL,
  `state_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  `created_by` int unsigned NOT NULL,
  `updated_at` timestamp NOT NULL,
  `updated_by` int unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `geo_countries_name_IDX` (`name`) USING BTREE,
  KEY `geo_countries_updated_at_IDX` (`updated_at`) USING BTREE,
  KEY `geo_countries_iso3166_IDX` (`iso3166`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geo_countries`
--

LOCK TABLES `geo_countries` WRITE;
/*!40000 ALTER TABLE `geo_countries` DISABLE KEYS */;
/*!40000 ALTER TABLE `geo_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geo_country_languages`
--

DROP TABLE IF EXISTS `geo_country_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `geo_country_languages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int unsigned NOT NULL,
  `language_id` int unsigned NOT NULL,
  `created_at` timestamp NOT NULL,
  `created_by` int unsigned NOT NULL,
  `updated_at` timestamp NOT NULL,
  `updated_by` int unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `geo_country_languages_country_id_IDX` (`country_id`,`language_id`) USING BTREE,
  KEY `geo_country_languages_geo_languages_FK` (`language_id`),
  KEY `geo_country_languages_deleted_at_IDX` (`deleted_at`) USING BTREE,
  CONSTRAINT `geo_country_languages_geo_countries_FK` FOREIGN KEY (`country_id`) REFERENCES `geo_countries` (`id`),
  CONSTRAINT `geo_country_languages_geo_languages_FK` FOREIGN KEY (`language_id`) REFERENCES `geo_languages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geo_country_languages`
--

LOCK TABLES `geo_country_languages` WRITE;
/*!40000 ALTER TABLE `geo_country_languages` DISABLE KEYS */;
/*!40000 ALTER TABLE `geo_country_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geo_languages`
--

DROP TABLE IF EXISTS `geo_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `geo_languages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `iso639` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL,
  `created_by` int unsigned NOT NULL,
  `updated_at` timestamp NOT NULL,
  `updated_by` int unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `geo_languages_name_IDX` (`name`) USING BTREE,
  UNIQUE KEY `geo_languages_iso639_IDX` (`iso639`) USING BTREE,
  KEY `geo_languages_deleted_at_IDX` (`deleted_at`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geo_languages`
--

LOCK TABLES `geo_languages` WRITE;
/*!40000 ALTER TABLE `geo_languages` DISABLE KEYS */;
/*!40000 ALTER TABLE `geo_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geo_neighbourhoods`
--

DROP TABLE IF EXISTS `geo_neighbourhoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `geo_neighbourhoods` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `geo_country_id` int unsigned NOT NULL,
  `geo_state_id` int unsigned DEFAULT NULL,
  `geo_city_id` int unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL,
  `created_by` int unsigned NOT NULL,
  `updated_at` timestamp NOT NULL,
  `updated_by` int unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `geo_neighbourhoods_geo_countries_FK` (`geo_country_id`),
  KEY `geo_neighbourhoods_geo_states_FK` (`geo_state_id`),
  KEY `geo_neighbourhoods_geo_cities_FK` (`geo_city_id`),
  KEY `geo_neighbourhoods_deleted_at_IDX` (`deleted_at`) USING BTREE,
  CONSTRAINT `geo_neighbourhoods_geo_cities_FK` FOREIGN KEY (`geo_city_id`) REFERENCES `geo_cities` (`id`),
  CONSTRAINT `geo_neighbourhoods_geo_countries_FK` FOREIGN KEY (`geo_country_id`) REFERENCES `geo_countries` (`id`),
  CONSTRAINT `geo_neighbourhoods_geo_states_FK` FOREIGN KEY (`geo_state_id`) REFERENCES `geo_states` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geo_neighbourhoods`
--

LOCK TABLES `geo_neighbourhoods` WRITE;
/*!40000 ALTER TABLE `geo_neighbourhoods` DISABLE KEYS */;
/*!40000 ALTER TABLE `geo_neighbourhoods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geo_states`
--

DROP TABLE IF EXISTS `geo_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `geo_states` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `abbreviation` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` timestamp NOT NULL,
  `created_by` int unsigned NOT NULL,
  `updated_at` timestamp NOT NULL,
  `updated_by` int unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `delete_by` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `geo_states_deleted_at_IDX` (`deleted_at`) USING BTREE,
  KEY `geo_states_country_id_IDX` (`country_id`,`name`) USING BTREE,
  CONSTRAINT `geo_states_geo_countries_FK` FOREIGN KEY (`country_id`) REFERENCES `geo_countries` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geo_states`
--

LOCK TABLES `geo_states` WRITE;
/*!40000 ALTER TABLE `geo_states` DISABLE KEYS */;
/*!40000 ALTER TABLE `geo_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geo_street_types`
--

DROP TABLE IF EXISTS `geo_street_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `geo_street_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL,
  `created_by` int unsigned NOT NULL,
  `updated_at` timestamp NOT NULL,
  `updated_by` int unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `geo_street_types_name_IDX` (`name`) USING BTREE,
  KEY `geo_street_types_deleted_at_IDX` (`deleted_at`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geo_street_types`
--

LOCK TABLES `geo_street_types` WRITE;
/*!40000 ALTER TABLE `geo_street_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `geo_street_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geo_streets`
--

DROP TABLE IF EXISTS `geo_streets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `geo_streets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `geo_country_id` int unsigned NOT NULL,
  `geo_state_id` int unsigned DEFAULT NULL,
  `geo_city_id` int unsigned NOT NULL,
  `geo_neighbourhood_id` int unsigned DEFAULT NULL,
  `geo_street_type_id` int unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL,
  `created_by` int unsigned NOT NULL,
  `updated_at` timestamp NOT NULL,
  `updated_by` int unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `geo_streets_geo_countries_FK` (`geo_country_id`),
  KEY `geo_streets_geo_states_FK` (`geo_state_id`),
  KEY `geo_streets_geo_cities_FK` (`geo_city_id`),
  KEY `geo_streets_geo_neighbourhoods_FK` (`geo_neighbourhood_id`),
  KEY `geo_streets_geo_street_types_FK` (`geo_street_type_id`),
  KEY `geo_streets_deleted_at_IDX` (`deleted_at`) USING BTREE,
  CONSTRAINT `geo_streets_geo_cities_FK` FOREIGN KEY (`geo_city_id`) REFERENCES `geo_cities` (`id`),
  CONSTRAINT `geo_streets_geo_countries_FK` FOREIGN KEY (`geo_country_id`) REFERENCES `geo_countries` (`id`),
  CONSTRAINT `geo_streets_geo_neighbourhoods_FK` FOREIGN KEY (`geo_neighbourhood_id`) REFERENCES `geo_neighbourhoods` (`id`),
  CONSTRAINT `geo_streets_geo_states_FK` FOREIGN KEY (`geo_state_id`) REFERENCES `geo_states` (`id`),
  CONSTRAINT `geo_streets_geo_street_types_FK` FOREIGN KEY (`geo_street_type_id`) REFERENCES `geo_street_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geo_streets`
--

LOCK TABLES `geo_streets` WRITE;
/*!40000 ALTER TABLE `geo_streets` DISABLE KEYS */;
/*!40000 ALTER TABLE `geo_streets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geo_zip_codes`
--

DROP TABLE IF EXISTS `geo_zip_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `geo_zip_codes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `geo_country_id` int unsigned NOT NULL,
  `geo_state_id` int unsigned DEFAULT NULL,
  `geo_city_id` int unsigned NOT NULL,
  `geo_neightbourhood_id` int unsigned DEFAULT NULL,
  `geo_street_id` int unsigned DEFAULT NULL,
  `code` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL,
  `created_by` int unsigned NOT NULL,
  `updated_at` timestamp NOT NULL,
  `updated_by` int unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `geo_zip_codes_geo_states_FK` (`geo_state_id`),
  KEY `geo_zip_codes_geo_cities_FK` (`geo_city_id`),
  KEY `geo_zip_codes_geo_neighbourhoods_FK` (`geo_neightbourhood_id`),
  KEY `geo_zip_codes_geo_country_id_IDX` (`geo_country_id`,`code`) USING BTREE,
  KEY `geo_zip_codes_deleted_at_IDX` (`deleted_at`) USING BTREE,
  CONSTRAINT `geo_zip_codes_geo_cities_FK` FOREIGN KEY (`geo_city_id`) REFERENCES `geo_cities` (`id`),
  CONSTRAINT `geo_zip_codes_geo_countries_FK` FOREIGN KEY (`geo_country_id`) REFERENCES `geo_countries` (`id`),
  CONSTRAINT `geo_zip_codes_geo_neighbourhoods_FK` FOREIGN KEY (`geo_neightbourhood_id`) REFERENCES `geo_neighbourhoods` (`id`),
  CONSTRAINT `geo_zip_codes_geo_states_FK` FOREIGN KEY (`geo_state_id`) REFERENCES `geo_states` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geo_zip_codes`
--

LOCK TABLES `geo_zip_codes` WRITE;
/*!40000 ALTER TABLE `geo_zip_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `geo_zip_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hist_histories`
--

DROP TABLE IF EXISTS `hist_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hist_histories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `original_id` int unsigned NOT NULL,
  `auth_user_id` int unsigned NOT NULL,
  `table_name` varchar(255) NOT NULL,
  `data` mediumtext NOT NULL,
  `created_at` timestamp NOT NULL,
  `created_by` int unsigned NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `histories_deleted_at_IDX` (`deleted_at`) USING BTREE,
  KEY `histories_original_id_IDX` (`original_id`,`table_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hist_histories`
--

LOCK TABLES `hist_histories` WRITE;
/*!40000 ALTER TABLE `hist_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `hist_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_organizations`
--

DROP TABLE IF EXISTS `org_organizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `org_organizations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned DEFAULT NULL,
  `org_type_id` int unsigned NOT NULL,
  `auth_user_id` int unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `tax_number` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  `created_by` int unsigned NOT NULL,
  `updated_at` timestamp NOT NULL,
  `updated_by` int unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `org_organizations_org_types_FK` (`org_type_id`),
  KEY `org_organizations_org_organizations_FK` (`parent_id`),
  KEY `org_organizations_users_FK` (`auth_user_id`),
  CONSTRAINT `org_organizations_org_organizations_FK` FOREIGN KEY (`parent_id`) REFERENCES `org_organizations` (`id`),
  CONSTRAINT `org_organizations_org_types_FK` FOREIGN KEY (`org_type_id`) REFERENCES `org_types` (`id`),
  CONSTRAINT `org_organizations_users_FK` FOREIGN KEY (`auth_user_id`) REFERENCES `auth_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_organizations`
--

LOCK TABLES `org_organizations` WRITE;
/*!40000 ALTER TABLE `org_organizations` DISABLE KEYS */;
/*!40000 ALTER TABLE `org_organizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_types`
--

DROP TABLE IF EXISTS `org_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `org_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL,
  `created_by` int unsigned NOT NULL,
  `updated_at` timestamp NOT NULL,
  `updated_by` int unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `org_types_name_IDX` (`name`) USING BTREE,
  KEY `org_types_deleted_at_IDX` (`deleted_at`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_types`
--

LOCK TABLES `org_types` WRITE;
/*!40000 ALTER TABLE `org_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `org_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `res_resources`
--

DROP TABLE IF EXISTS `res_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `res_resources` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned NOT NULL,
  `res_type_id` int unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` mediumtext,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `res_resources_res_types_FK` (`res_type_id`),
  KEY `res_resources_parent_id_IDX` (`parent_id`,`res_type_id`,`name`) USING BTREE,
  CONSTRAINT `res_resources_res_resources_FK` FOREIGN KEY (`parent_id`) REFERENCES `res_resources` (`id`),
  CONSTRAINT `res_resources_res_types_FK` FOREIGN KEY (`res_type_id`) REFERENCES `res_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `res_resources`
--

LOCK TABLES `res_resources` WRITE;
/*!40000 ALTER TABLE `res_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `res_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `res_types`
--

DROP TABLE IF EXISTS `res_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `res_types` (
  `id` int unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `res_types_name_IDX` (`name`) USING BTREE,
  KEY `res_types_deleted_at_IDX` (`deleted_at`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `res_types`
--

LOCK TABLES `res_types` WRITE;
/*!40000 ALTER TABLE `res_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `res_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'pox'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-18 20:03:13

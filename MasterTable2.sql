CREATE DATABASE  IF NOT EXISTS `dnd_campaign` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dnd_campaign`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: dnd_campaign
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `character`
--

DROP TABLE IF EXISTS `character`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character` (
  `id` int NOT NULL AUTO_INCREMENT,
  `character_name` varchar(100) NOT NULL,
  `race` varchar(50) DEFAULT NULL,
  `class` varchar(50) DEFAULT NULL,
  `level` int DEFAULT NULL,
  `xp` int DEFAULT NULL,
  `hp_current` int DEFAULT NULL,
  `hp_max` int DEFAULT NULL,
  `strength` int DEFAULT NULL,
  `dexterity` int DEFAULT NULL,
  `constitution` int DEFAULT NULL,
  `intelligence` int DEFAULT NULL,
  `wisdom` int DEFAULT NULL,
  `charisma` int DEFAULT NULL,
  `alignment` varchar(20) DEFAULT NULL,
  `background` text,
  `inventory` text,
  `location_id` int DEFAULT NULL,
  `history_id` int DEFAULT NULL,
  `inventory_id` int DEFAULT NULL,
  `world_id` int DEFAULT NULL,
  `political_faction_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_character_geography` (`location_id`),
  KEY `fk_character_history` (`history_id`),
  KEY `fk_character_inventory` (`inventory_id`),
  KEY `fk_character_world` (`world_id`),
  KEY `fk_character_political_faction` (`political_faction_id`),
  CONSTRAINT `fk_character_geography` FOREIGN KEY (`location_id`) REFERENCES `geography` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_character_history` FOREIGN KEY (`history_id`) REFERENCES `history` (`history_id`) ON DELETE SET NULL,
  CONSTRAINT `fk_character_inventory` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_character_political_faction` FOREIGN KEY (`political_faction_id`) REFERENCES `political_factions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_character_world` FOREIGN KEY (`world_id`) REFERENCES `world` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character`
--

LOCK TABLES `character` WRITE;
/*!40000 ALTER TABLE `character` DISABLE KEYS */;
/*!40000 ALTER TABLE `character` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geography`
--

DROP TABLE IF EXISTS `geography`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `geography` (
  `id` int NOT NULL AUTO_INCREMENT,
  `region_name` varchar(100) NOT NULL,
  `landmark_name` varchar(100) DEFAULT NULL,
  `terrain_type` varchar(50) DEFAULT NULL,
  `climate` varchar(50) DEFAULT NULL,
  `description` text,
  `strategic_importance` text,
  `history_id` int DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `population` int DEFAULT NULL,
  `culture` varchar(255) DEFAULT NULL,
  `relative_distance` varchar(255) DEFAULT NULL,
  `world_id` int DEFAULT NULL,
  `political_faction_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_geography_history` (`history_id`),
  KEY `fk_geography_world` (`world_id`),
  KEY `fk_geography_political_faction` (`political_faction_id`),
  CONSTRAINT `fk_geography_history` FOREIGN KEY (`history_id`) REFERENCES `history` (`history_id`) ON DELETE SET NULL,
  CONSTRAINT `fk_geography_political_faction` FOREIGN KEY (`political_faction_id`) REFERENCES `political_factions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_geography_world` FOREIGN KEY (`world_id`) REFERENCES `world` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geography`
--

LOCK TABLES `geography` WRITE;
/*!40000 ALTER TABLE `geography` DISABLE KEYS */;
/*!40000 ALTER TABLE `geography` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `history` (
  `history_id` int NOT NULL AUTO_INCREMENT,
  `event_name` varchar(150) NOT NULL,
  `event_date` date DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `key_figures` varchar(200) DEFAULT NULL,
  `description` text,
  `impact` text,
  `lineage` text,
  PRIMARY KEY (`history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `character_id` int DEFAULT NULL,
  `item_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `character_id` (`character_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`character_id`) REFERENCES `character` (`id`),
  CONSTRAINT `inventory_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_name` varchar(100) NOT NULL,
  `description` text,
  `value_gp` decimal(10,2) DEFAULT NULL,
  `weight_lb` decimal(5,2) DEFAULT NULL,
  `rarity` varchar(50) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `npc`
--

DROP TABLE IF EXISTS `npc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `npc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `npc_name` varchar(100) NOT NULL,
  `race` varchar(50) DEFAULT NULL,
  `role` varchar(100) DEFAULT NULL,
  `affiliation` varchar(100) DEFAULT NULL,
  `hp_current` int DEFAULT NULL,
  `hp_max` int DEFAULT NULL,
  `strength` int DEFAULT NULL,
  `dexterity` int DEFAULT NULL,
  `constitution` int DEFAULT NULL,
  `intelligence` int DEFAULT NULL,
  `wisdom` int DEFAULT NULL,
  `charisma` int DEFAULT NULL,
  `alignment` varchar(20) DEFAULT NULL,
  `background` text,
  `inventory` text,
  `location_id` int DEFAULT NULL,
  `history_id` int DEFAULT NULL,
  `inventory_id` int DEFAULT NULL,
  `world_id` int DEFAULT NULL,
  `political_faction_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_npc_geography` (`location_id`),
  KEY `fk_npc_history` (`history_id`),
  KEY `fk_npc_inventory` (`inventory_id`),
  KEY `fk_npc_world` (`world_id`),
  KEY `fk_npc_political_faction` (`political_faction_id`),
  CONSTRAINT `fk_npc_geography` FOREIGN KEY (`location_id`) REFERENCES `geography` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_npc_history` FOREIGN KEY (`history_id`) REFERENCES `history` (`history_id`) ON DELETE SET NULL,
  CONSTRAINT `fk_npc_inventory` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_npc_political_faction` FOREIGN KEY (`political_faction_id`) REFERENCES `political_factions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_npc_world` FOREIGN KEY (`world_id`) REFERENCES `world` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `npc`
--

LOCK TABLES `npc` WRITE;
/*!40000 ALTER TABLE `npc` DISABLE KEYS */;
/*!40000 ALTER TABLE `npc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plotline`
--

DROP TABLE IF EXISTS `plotline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plotline` (
  `id` int NOT NULL AUTO_INCREMENT,
  `plotline_name` varchar(150) NOT NULL,
  `key_events` text,
  `involved_characters` varchar(200) DEFAULT NULL,
  `description` text,
  `status` enum('Not Started','In Progress','Completed') DEFAULT 'Not Started',
  `date_started` date DEFAULT NULL,
  `date_completed` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plotline`
--

LOCK TABLES `plotline` WRITE;
/*!40000 ALTER TABLE `plotline` DISABLE KEYS */;
/*!40000 ALTER TABLE `plotline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `political_factions`
--

DROP TABLE IF EXISTS `political_factions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `political_factions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ruling_house` varchar(255) DEFAULT NULL,
  `controlled_regions` text,
  `current_military_forces` text,
  `diplomacy` text,
  `wars` text,
  `economy` text,
  `major_events` text,
  `current_agenda` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `political_factions`
--

LOCK TABLES `political_factions` WRITE;
/*!40000 ALTER TABLE `political_factions` DISABLE KEYS */;
/*!40000 ALTER TABLE `political_factions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quest`
--

DROP TABLE IF EXISTS `quest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quest` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quest_name` varchar(150) NOT NULL,
  `quest_giver` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `description` text,
  `status` enum('Not Started','In Progress','Completed','Failed') DEFAULT 'Not Started',
  `reward` varchar(200) DEFAULT NULL,
  `date_started` date DEFAULT NULL,
  `date_completed` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quest`
--

LOCK TABLES `quest` WRITE;
/*!40000 ALTER TABLE `quest` DISABLE KEYS */;
/*!40000 ALTER TABLE `quest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `world`
--

DROP TABLE IF EXISTS `world`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `world` (
  `id` int NOT NULL AUTO_INCREMENT,
  `weather` varchar(255) DEFAULT NULL,
  `season` varchar(255) DEFAULT NULL,
  `drought_famine` varchar(255) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `active_statuses` text,
  `wars` text,
  `controlling_factions` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `world`
--

LOCK TABLES `world` WRITE;
/*!40000 ALTER TABLE `world` DISABLE KEYS */;
/*!40000 ALTER TABLE `world` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dnd_campaign'
--

--
-- Dumping routines for database 'dnd_campaign'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-10 13:59:57

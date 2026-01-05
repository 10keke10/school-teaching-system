-- MySQL dump 10.13  Distrib 8.4.5, for Win64 (x86_64)
--
-- Host: localhost    Database: ry-vue
-- ------------------------------------------------------
-- Server version	8.4.5

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
-- Table structure for table `class_time_slot`
--

DROP TABLE IF EXISTS `class_time_slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_time_slot` (
  `slot_id` bigint NOT NULL AUTO_INCREMENT COMMENT '鏃堕棿妲絀D',
  `class_id` int NOT NULL COMMENT '鏁欏?鐝璉D',
  `week_day` tinyint DEFAULT NULL COMMENT '鏄熸湡鍑狅紙1-7锛?=鍛ㄤ竴锛',
  `start_slot` tinyint DEFAULT NULL COMMENT '寮??鑺傛?锛?-12锛',
  `end_slot` tinyint DEFAULT NULL COMMENT '缁撴潫鑺傛?',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  PRIMARY KEY (`slot_id`),
  UNIQUE KEY `uk_class_time` (`class_id`,`week_day`,`start_slot`),
  KEY `idx_class` (`class_id`),
  KEY `idx_week_day` (`week_day`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='涓婅?鏃堕棿妲借〃';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_time_slot`
--

LOCK TABLES `class_time_slot` WRITE;
/*!40000 ALTER TABLE `class_time_slot` DISABLE KEYS */;
INSERT INTO `class_time_slot` VALUES (62,1,2,1,2,'2026-01-06 01:06:41','2026-01-06 01:06:41'),(63,1,4,3,4,'2026-01-06 01:06:41','2026-01-06 01:06:41'),(64,2,1,1,2,'2026-01-06 01:06:41','2026-01-06 01:06:41'),(65,3,1,3,4,'2026-01-06 01:06:41','2026-01-06 01:06:41'),(66,3,4,1,2,'2026-01-06 01:06:41','2026-01-06 01:06:41'),(67,15,1,1,2,'2026-01-06 01:06:41','2026-01-06 01:06:41'),(68,15,3,3,4,'2026-01-06 01:06:41','2026-01-06 01:06:41'),(69,16,2,1,2,'2026-01-06 01:06:41','2026-01-06 01:06:41'),(70,16,4,3,4,'2026-01-06 01:06:41','2026-01-06 01:06:41'),(71,17,3,1,2,'2026-01-06 01:06:41','2026-01-06 01:06:41'),(72,17,5,3,4,'2026-01-06 01:06:41','2026-01-06 01:06:41'),(73,18,1,3,4,'2026-01-06 01:06:41','2026-01-06 01:06:41'),(74,18,4,1,2,'2026-01-06 01:06:41','2026-01-06 01:06:41'),(75,19,2,3,4,'2026-01-06 01:06:41','2026-01-06 01:06:41'),(76,19,5,1,2,'2026-01-06 01:06:41','2026-01-06 01:06:41'),(77,20,1,1,2,'2026-01-06 01:06:42','2026-01-06 01:06:42'),(78,20,3,3,4,'2026-01-06 01:06:42','2026-01-06 01:06:42'),(79,21,2,1,2,'2026-01-06 01:06:42','2026-01-06 01:06:42'),(80,21,4,3,4,'2026-01-06 01:06:42','2026-01-06 01:06:42'),(81,22,3,1,2,'2026-01-06 01:06:42','2026-01-06 01:06:42'),(82,22,5,3,4,'2026-01-06 01:06:42','2026-01-06 01:06:42'),(83,23,1,3,4,'2026-01-06 01:06:42','2026-01-06 01:06:42'),(84,23,4,1,2,'2026-01-06 01:06:42','2026-01-06 01:06:42'),(85,24,2,3,4,'2026-01-06 01:06:42','2026-01-06 01:06:42'),(86,24,5,1,2,'2026-01-06 01:06:42','2026-01-06 01:06:42'),(87,25,1,1,2,'2026-01-06 01:06:42','2026-01-06 01:06:42'),(88,25,3,3,4,'2026-01-06 01:06:42','2026-01-06 01:06:42'),(89,26,2,1,2,'2026-01-06 01:06:42','2026-01-06 01:06:42'),(90,26,4,3,4,'2026-01-06 01:06:42','2026-01-06 01:06:42'),(91,27,3,1,2,'2026-01-06 01:06:42','2026-01-06 01:06:42'),(92,27,5,3,4,'2026-01-06 01:06:42','2026-01-06 01:06:42'),(93,28,1,3,4,'2026-01-06 01:06:42','2026-01-06 01:06:42'),(94,29,3,5,6,'2026-01-06 01:06:42','2026-01-06 01:06:42'),(95,30,5,7,8,'2026-01-06 01:06:42','2026-01-06 01:06:42'),(96,31,4,1,2,'2026-01-06 01:06:42','2026-01-06 01:06:42'),(97,32,1,5,6,'2026-01-06 01:06:42','2026-01-06 01:06:42'),(98,33,2,3,4,'2026-01-06 01:06:42','2026-01-06 01:06:42'),(99,34,4,1,2,'2026-01-06 01:06:42','2026-01-06 01:06:42'),(100,35,3,7,8,'2026-01-06 01:06:42','2026-01-06 01:06:42'),(101,36,5,5,6,'2026-01-06 01:06:42','2026-01-06 01:06:42'),(102,39,5,1,2,'2026-01-06 01:06:42','2026-01-06 01:06:42'),(103,40,5,3,4,'2026-01-06 01:06:42','2026-01-06 01:06:42'),(104,42,2,1,2,'2026-01-06 01:17:52','2026-01-06 01:17:52');
/*!40000 ALTER TABLE `class_time_slot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `course_id` int NOT NULL AUTO_INCREMENT COMMENT '璇剧▼ID',
  `course_code` varchar(20) NOT NULL COMMENT '璇剧▼浠ｇ爜',
  `course_name` varchar(100) NOT NULL COMMENT '璇剧▼鍚嶇О',
  `credit_hours` int DEFAULT '2' COMMENT '瀛﹀垎',
  `dept_id` bigint DEFAULT NULL COMMENT '寮??闄㈢郴ID锛堝叧鑱攕ys_dept.dept_id锛',
  `course_type` varchar(20) DEFAULT '蹇呬慨' COMMENT '璇剧▼绫诲瀷锛氬繀淇?閫変慨',
  `description` text COMMENT '璇剧▼鎻忚堪',
  `create_by` varchar(64) DEFAULT '' COMMENT '鍒涘缓鑰',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `update_by` varchar(64) DEFAULT '' COMMENT '鏇存柊鑰',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  `remark` varchar(500) DEFAULT '' COMMENT '澶囨敞',
  PRIMARY KEY (`course_id`),
  UNIQUE KEY `course_code` (`course_code`),
  UNIQUE KEY `uk_course_code` (`course_code`),
  KEY `idx_dept` (`dept_id`),
  KEY `idx_course_code` (`course_code`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='璇剧▼淇℃伅琛';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (2,'MA201','线性代数',4,103,'必修','向量、矩阵、线性变换与特征值','admin','2026-01-04 09:25:12','','2026-01-04 09:25:12',''),(16,'MA101','高等数学',4,NULL,'必修','微积分基础与应用','','2026-01-04 20:28:56','','2026-01-04 20:28:56',''),(17,'ENG201','大学英语',2,NULL,'选修','大学英语综合能力','','2026-01-04 20:28:56','','2026-01-04 20:28:56',''),(18,'PHY101','物理学',3,NULL,'必修','力学热学电磁学基础','','2026-01-04 20:28:56','','2026-01-04 20:28:56',''),(19,'CS201','计算机网络',3,NULL,'必修','计算机网络原理与协议','','2026-01-04 22:51:50','','2026-01-04 22:51:50',''),(20,'CS203','数据库系统',3,NULL,'必修','数据库原理与实践','','2026-01-04 22:51:50','','2026-01-04 22:51:50',''),(21,'ENG301','学术英语',2,NULL,'选修','学术英语综合训练','','2026-01-04 22:51:50','','2026-01-04 22:51:50',''),(22,'PHY201','电磁学',3,NULL,'必修','电磁学基础与应用','','2026-01-04 22:51:50','','2026-01-04 22:51:50',''),(23,'CS202','数据结构',3,NULL,'必修','数据结构与算法基础','','2026-01-04 22:55:36','','2026-01-04 22:55:36',''),(24,'CS204','操作系统',3,NULL,'必修','操作系统原理与实践','','2026-01-04 22:55:36','','2026-01-04 22:55:36',''),(25,'MA202','概率论与数理统计',3,NULL,'必修','概率与统计基础','','2026-01-04 22:55:36','','2026-01-04 22:55:36',''),(26,'PHY202','大学物理B',3,NULL,'必修','大学物理基础（B类）','','2026-01-04 22:55:36','','2026-01-04 22:55:36',''),(27,'INN301','创新创业',2,NULL,'选修','创新创业基础与实践','','2026-01-04 22:55:36','','2026-01-04 22:55:36',''),(28,'DEMO101','触发器演示-满员课',2,NULL,'选修','用于展示已满员状态，验证UI拦截','admin','2026-01-05 22:23:07','','2026-01-05 22:23:07','Demo data'),(29,'DEMO102','触发器演示-边界课',2,NULL,'选修','用于展示并发选课触发器拦截','admin','2026-01-05 22:23:07','','2026-01-05 22:23:07','Demo data'),(32,'wuli','大学物理',2,NULL,'选修',NULL,'','2026-01-06 00:42:57','','2026-01-06 00:45:06','');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_class`
--

DROP TABLE IF EXISTS `course_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_class` (
  `class_id` int NOT NULL AUTO_INCREMENT COMMENT '鏁欏?鐝璉D',
  `course_id` int NOT NULL COMMENT '璇剧▼ID',
  `teacher_id` bigint NOT NULL COMMENT '鏁欏笀ID锛堝叧鑱攕ys_user.user_id锛',
  `term_id` varchar(20) NOT NULL COMMENT '瀛︽湡ID',
  `class_time` varchar(100) DEFAULT NULL COMMENT '涓婅?鏃堕棿锛屽?锛氬懆涓?-2鑺傦紝鍛ㄤ笁3-4鑺',
  `location` varchar(100) DEFAULT NULL COMMENT '涓婅?鍦扮偣',
  `capacity` int DEFAULT '60' COMMENT '璇剧▼瀹归噺',
  `selected_count` int DEFAULT '0' COMMENT '宸查?浜烘暟',
  `status` tinyint DEFAULT '1' COMMENT '鐘舵?锛?寮?斁閫夎?锛?鍏抽棴',
  `create_by` varchar(64) DEFAULT '' COMMENT '鍒涘缓鑰',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `update_by` varchar(64) DEFAULT '' COMMENT '鏇存柊鑰',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  `remark` varchar(500) DEFAULT '' COMMENT '澶囨敞',
  PRIMARY KEY (`class_id`),
  KEY `idx_term` (`term_id`),
  KEY `idx_teacher` (`teacher_id`),
  KEY `idx_course` (`course_id`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='鏁欏?鐝?〃';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_class`
--

LOCK TABLES `course_class` WRITE;
/*!40000 ALTER TABLE `course_class` DISABLE KEYS */;
INSERT INTO `course_class` VALUES (1,23,1002,'2025-2026-fall','周二1-2节, 周四3-4节','教学楼B-102',60,6,1,'admin','2026-01-04 09:25:12','','2026-01-04 23:29:56',''),(2,2,1001,'2025-2026-fall','周一1-2节','教学楼C-103',80,10,1,'admin','2026-01-04 09:25:12','','2026-01-05 00:12:00',''),(3,24,1003,'2025-2026-fall','周一3-4节, 周四1-2节','教学楼D-104',60,6,1,'','2026-01-04 12:12:52','','2026-01-05 23:48:39',''),(15,23,3001,'2025-2026-spring','周一1-2节, 周三3-4节','教学楼A-104',60,2,1,'','2026-01-04 20:29:17','','2026-01-05 02:09:42',''),(16,23,3002,'2025-2026-spring','周二1-2节, 周四3-4节','教学楼B-105',60,0,1,'','2026-01-04 20:29:17','','2026-01-04 23:29:56',''),(17,23,3003,'2025-2026-fall','周三1-2节, 周五3-4节','教学楼C-106',70,0,1,'','2026-01-04 20:29:17','','2026-01-05 23:48:41',''),(18,23,3001,'2025-2026-spring','周一3-4节, 周四1-2节','教学楼D-107',70,0,1,'','2026-01-04 20:29:17','','2026-01-05 01:44:16',''),(19,24,3002,'2025-2026-spring','周二3-4节, 周五1-2节','教学楼E-108',50,1,1,'','2026-01-04 20:29:17','','2026-01-05 01:50:40',''),(20,24,3004,'2025-2026-fall','周一1-2节, 周三3-4节','教学楼A-109',55,0,1,'','2026-01-04 20:29:17','','2026-01-04 23:29:56',''),(21,24,3005,'2025-2026-spring','周二1-2节, 周四3-4节','教学楼B-110',55,0,1,'','2026-01-04 20:29:17','','2026-01-04 23:29:56',''),(22,16,3003,'2025-2026-spring','周三1-2节, 周五3-4节','教学楼C-111',100,1,1,'','2026-01-04 20:29:17','','2026-01-05 02:10:26',''),(23,16,3004,'2025-2026-fall','周一3-4节, 周四1-2节','教学楼D-112',100,0,1,'','2026-01-04 20:29:17','','2026-01-05 01:41:13',''),(24,17,3005,'2025-2026-fall','周二3-4节, 周五1-2节','教学楼E-101',40,1,1,'','2026-01-04 20:29:17','','2026-01-06 00:25:38',''),(25,17,3002,'2025-2026-spring','周一1-2节, 周三3-4节','教学楼A-102',40,1,1,'','2026-01-04 20:29:17','','2026-01-05 02:09:48',''),(26,18,3001,'2025-2026-spring','周二1-2节, 周四3-4节','教学楼B-103',80,3,1,'','2026-01-04 20:29:17','','2026-01-05 02:09:23',''),(27,18,3003,'2025-2026-spring','周三1-2节, 周五3-4节','教学楼C-104',80,0,1,'','2026-01-04 20:29:17','','2026-01-05 01:44:18',''),(28,19,1002,'2025-2026-fall','周一3-4节','科教楼-310',60,0,1,'','2026-01-04 22:51:50','','2026-01-04 23:13:13',''),(29,20,1003,'2025-2026-fall','周三5-6节','科教楼-311',60,4,1,'','2026-01-04 22:51:50','','2026-01-05 23:48:42',''),(30,21,1004,'2025-2026-fall','周五7-8节','外语楼-520',40,2,1,'','2026-01-04 22:51:50','','2026-01-05 23:48:44',''),(31,22,1005,'2025-2026-fall','周四1-2节','物理楼-620',80,0,1,'','2026-01-04 22:51:50','','2026-01-04 23:13:13',''),(32,23,1001,'2025-2026-spring','周一5-6节','一教-205',60,0,1,'','2026-01-04 22:55:36','','2026-01-04 23:50:45',''),(33,24,1002,'2025-2026-spring','周二3-4节','一教-206',60,2,1,'','2026-01-04 22:55:36','','2026-01-04 23:51:17',''),(34,25,1003,'2025-2026-spring','周四1-2节','数理楼-412',80,3,1,'','2026-01-04 22:55:36','','2026-01-05 01:45:44',''),(35,26,1004,'2025-2026-spring','周三7-8节','物理楼-622',80,2,1,'','2026-01-04 22:55:36','','2026-01-05 01:45:45',''),(36,27,1005,'2025-2026-spring','周五5-6节','创新中心-301',2,2,1,'','2026-01-04 22:55:36','','2026-01-05 02:05:48',''),(39,28,1002,'2025-2026-fall','周五1-2节','DemoBldg-101',10,10,1,'','2026-01-05 22:23:07','','2026-01-06 00:38:06','Demo data: Full class (10/10)'),(40,29,1003,'2025-2026-fall','周五3-4节','DemoBldg-102',10,10,1,'','2026-01-05 22:23:07','','2026-01-06 00:40:40','Demo data: Boundary class (9/10)'),(42,32,1004,'2025-2026-fall','周二1-2节',NULL,60,1,1,'','2026-01-06 00:44:04','','2026-01-06 01:24:34','');
/*!40000 ALTER TABLE `course_class` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_sync_slots_insert` AFTER INSERT ON `course_class` FOR EACH ROW BEGIN
    CALL sp_refresh_class_slots(NEW.class_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_sync_slots_update` AFTER UPDATE ON `course_class` FOR EACH ROW BEGIN
    -- 仅当 class_time 发生变化时才执行
    IF OLD.class_time != NEW.class_time OR (OLD.class_time IS NULL AND NEW.class_time IS NOT NULL) OR (OLD.class_time IS NOT NULL AND NEW.class_time IS NULL) THEN
        CALL sp_refresh_class_slots(NEW.class_id);
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `credit_rule`
--

DROP TABLE IF EXISTS `credit_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credit_rule` (
  `rule_id` int NOT NULL AUTO_INCREMENT,
  `rule_name` varchar(50) DEFAULT NULL COMMENT '瑙勫垯鍚嶇О',
  `term_id` varchar(20) DEFAULT NULL COMMENT '閫傜敤瀛︽湡',
  `max_credits` int DEFAULT '20' COMMENT '鏈?ぇ瀛﹀垎',
  `min_credits` int DEFAULT '0' COMMENT '鏈?皬瀛﹀垎',
  `is_active` tinyint(1) DEFAULT '1' COMMENT '鏄?惁鐢熸晥锛?鏄?紝0鍚︼級',
  `create_by` varchar(64) DEFAULT '' COMMENT '鍒涘缓鑰',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `update_by` varchar(64) DEFAULT '' COMMENT '鏇存柊鑰',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  `remark` varchar(500) DEFAULT '' COMMENT '澶囨敞',
  PRIMARY KEY (`rule_id`),
  KEY `idx_term` (`term_id`),
  KEY `idx_is_active` (`is_active`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='瀛﹀垎瑙勫垯琛';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_rule`
--

LOCK TABLES `credit_rule` WRITE;
/*!40000 ALTER TABLE `credit_rule` DISABLE KEYS */;
INSERT INTO `credit_rule` VALUES (1,'秋季学分上限','2025-2026-fall',20,0,1,'admin','2026-01-04 09:25:12','','2026-01-04 20:54:20',''),(3,'春季学分上限','2025-2026-spring',20,0,1,'','2026-01-04 13:56:59','','2026-01-04 23:42:41','');
/*!40000 ALTER TABLE `credit_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollment`
--

DROP TABLE IF EXISTS `enrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrollment` (
  `enrollment_id` int NOT NULL AUTO_INCREMENT COMMENT '閫夎?璁板綍ID',
  `student_id` bigint NOT NULL COMMENT '瀛︾敓ID锛堝叧鑱攕ys_user.user_id锛',
  `class_id` int NOT NULL COMMENT '鏁欏?鐝璉D',
  `term_id` varchar(20) NOT NULL COMMENT '瀛︽湡ID',
  `status` varchar(20) DEFAULT 'ENROLLED' COMMENT '鐘舵?锛欵NROLLED宸查?璇撅紝DROPPED宸查?璇',
  `grade` decimal(5,2) DEFAULT NULL COMMENT '鎴愮哗锛?-100锛屾敮鎸佸皬鏁帮級',
  `grade_status` varchar(20) DEFAULT 'DRAFT' COMMENT '鎴愮哗鐘舵?锛欴RAFT鑽夌?锛孭UBLISHED宸插彂甯',
  `enroll_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '閫夎?鏃堕棿',
  `drop_time` datetime DEFAULT NULL COMMENT '閫??鏃堕棿',
  `create_by` varchar(64) DEFAULT '' COMMENT '鍒涘缓鑰',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `update_by` varchar(64) DEFAULT '' COMMENT '鏇存柊鑰',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  `remark` varchar(500) DEFAULT '' COMMENT '澶囨敞',
  PRIMARY KEY (`enrollment_id`),
  UNIQUE KEY `uk_student_class` (`student_id`,`class_id`) COMMENT '闃叉?閲嶅?閫夎?',
  KEY `idx_student_term` (`student_id`,`term_id`),
  KEY `idx_class` (`class_id`),
  KEY `idx_grade_status` (`grade_status`),
  KEY `idx_status` (`status`),
  KEY `idx_enroll_time` (`enroll_time`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='閫夎?璁板綍琛';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollment`
--

LOCK TABLES `enrollment` WRITE;
/*!40000 ALTER TABLE `enrollment` DISABLE KEYS */;
INSERT INTO `enrollment` VALUES (1,2001,1,'2025-2026-fall','ENROLLED',85.50,'PUBLISHED','2026-01-04 09:25:12',NULL,'admin','2026-01-04 09:25:12','','2026-01-04 20:51:49',''),(2,2002,1,'2025-2026-fall','ENROLLED',100.00,'PUBLISHED','2026-01-04 09:25:12',NULL,'admin','2026-01-04 09:25:12','','2026-01-05 00:34:00',''),(3,2003,1,'2025-2026-fall','ENROLLED',92.00,'PUBLISHED','2026-01-04 09:25:12',NULL,'admin','2026-01-04 09:25:12','','2026-01-04 20:51:49',''),(4,2004,2,'2025-2026-fall','ENROLLED',100.00,'PUBLISHED','2026-01-04 09:25:12',NULL,'admin','2026-01-04 09:25:12','','2026-01-05 00:32:32',''),(5,2005,2,'2025-2026-fall','ENROLLED',62.00,'PUBLISHED','2026-01-04 09:25:12',NULL,'admin','2026-01-04 09:25:12','','2026-01-05 00:32:32',''),(6,1,1,'2025-2026-fall','DROPPED',NULL,'PUBLISHED','2026-01-04 09:38:03','2026-01-04 09:38:59',NULL,'2026-01-04 09:38:03',NULL,'2026-01-04 20:51:49',NULL),(9,2001,2,'2025-2026-fall','ENROLLED',6.00,'PUBLISHED','2026-01-05 00:12:00','2026-01-05 00:11:52',NULL,'2026-01-04 11:49:13',NULL,'2026-01-05 00:32:32',NULL),(15,2001,3,'2025-2026-fall','ENROLLED',100.00,'PUBLISHED','2026-01-05 00:11:59','2026-01-05 00:11:50',NULL,'2026-01-04 15:26:39',NULL,'2026-01-05 01:10:26',NULL),(70,2002,2,'2025-2026-fall','ENROLLED',9.00,'PUBLISHED','2026-01-04 19:56:44',NULL,NULL,'2026-01-04 19:56:44',NULL,'2026-01-05 00:32:32',NULL),(71,2001,15,'2025-2026-spring','DROPPED',NULL,'DRAFT','2026-01-05 01:33:19','2026-01-05 02:09:42',NULL,'2026-01-04 21:50:17',NULL,'2026-01-05 01:33:19',NULL),(72,2001,21,'2025-2026-spring','DROPPED',NULL,'DRAFT','2026-01-04 22:03:27','2026-01-04 22:03:29',NULL,'2026-01-04 21:50:23',NULL,'2026-01-04 22:03:27',NULL),(73,2001,19,'2025-2026-spring','DROPPED',NULL,'DRAFT','2026-01-04 23:50:52','2026-01-04 23:51:16',NULL,'2026-01-04 21:50:26',NULL,'2026-01-04 23:50:52',NULL),(74,2001,22,'2025-2026-spring','DROPPED',NULL,'DRAFT','2026-01-05 02:10:19','2026-01-05 02:10:27',NULL,'2026-01-04 21:58:04',NULL,'2026-01-05 02:10:19',NULL),(75,2001,25,'2025-2026-spring','ENROLLED',NULL,'DRAFT','2026-01-05 02:09:48','2026-01-04 23:50:40',NULL,'2026-01-04 21:58:06',NULL,'2026-01-05 02:09:48',NULL),(76,2001,16,'2025-2026-spring','DROPPED',NULL,'DRAFT','2026-01-04 21:59:31','2026-01-04 22:00:09',NULL,'2026-01-04 21:59:31',NULL,'2026-01-04 22:00:08',NULL),(77,2001,26,'2025-2026-spring','ENROLLED',NULL,'DRAFT','2026-01-05 02:09:23','2026-01-05 01:32:31',NULL,'2026-01-04 22:07:26',NULL,'2026-01-05 02:09:23',NULL),(78,2001,18,'2025-2026-spring','DROPPED',NULL,'DRAFT','2026-01-04 22:11:51','2026-01-04 22:36:05',NULL,'2026-01-04 22:11:51',NULL,'2026-01-04 22:36:05',NULL),(79,2001,32,'2025-2026-spring','DROPPED',NULL,'DRAFT','2026-01-04 23:50:02','2026-01-04 23:50:45',NULL,'2026-01-04 22:56:06',NULL,'2026-01-04 23:50:02',NULL),(80,2001,33,'2025-2026-spring','ENROLLED',70.00,'PUBLISHED','2026-01-04 23:51:17','2026-01-04 23:50:47',NULL,'2026-01-04 22:56:07',NULL,'2026-01-05 00:33:45',NULL),(81,2001,34,'2025-2026-spring','ENROLLED',90.00,'PUBLISHED','2026-01-04 23:51:02','2026-01-04 23:50:48',NULL,'2026-01-04 22:56:07',NULL,'2026-01-05 01:10:07',NULL),(82,2001,35,'2025-2026-spring','ENROLLED',NULL,'DRAFT','2026-01-05 01:33:30','2026-01-05 01:33:26',NULL,'2026-01-04 22:56:08',NULL,'2026-01-05 01:33:30',NULL),(83,2001,36,'2025-2026-spring','DROPPED',NULL,'DRAFT','2026-01-05 01:42:16','2026-01-05 02:05:25',NULL,'2026-01-04 22:56:09',NULL,'2026-01-05 01:42:16',NULL),(84,2001,27,'2025-2026-spring','DROPPED',NULL,'DRAFT','2026-01-04 23:50:03','2026-01-04 23:50:42',NULL,'2026-01-04 23:50:03',NULL,'2026-01-04 23:50:41',NULL),(85,2001,24,'2025-2026-fall','DROPPED',NULL,'DRAFT','2026-01-04 23:52:41','2026-01-05 01:55:28',NULL,'2026-01-04 23:52:41',NULL,'2026-01-05 01:55:28',NULL),(86,2001,29,'2025-2026-fall','DROPPED',NULL,'PUBLISHED','2026-01-04 23:52:43','2026-01-05 01:55:31',NULL,'2026-01-04 23:52:43',NULL,'2026-01-05 01:55:31',NULL),(87,2001,30,'2025-2026-fall','ENROLLED',NULL,'DRAFT','2026-01-04 23:52:46',NULL,NULL,'2026-01-04 23:52:46',NULL,NULL,NULL),(88,2002,3,'2025-2026-fall','ENROLLED',50.00,'PUBLISHED','2026-01-05 00:06:56',NULL,NULL,'2026-01-05 00:06:56',NULL,'2026-01-05 01:10:26',NULL),(89,2002,29,'2025-2026-fall','ENROLLED',50.00,'PUBLISHED','2026-01-05 00:06:59',NULL,NULL,'2026-01-05 00:06:59',NULL,'2026-01-05 02:01:05',NULL),(90,2003,2,'2025-2026-fall','ENROLLED',0.00,'PUBLISHED','2026-01-05 00:07:52',NULL,NULL,'2026-01-05 00:07:52',NULL,'2026-01-05 17:32:44',NULL),(91,2003,3,'2025-2026-fall','ENROLLED',90.00,'PUBLISHED','2026-01-05 00:07:55',NULL,NULL,'2026-01-05 00:07:55',NULL,'2026-01-05 02:00:49',NULL),(92,2002,36,'2025-2026-spring','DROPPED',NULL,'DRAFT','2026-01-05 01:42:41','2026-01-05 01:43:48',NULL,'2026-01-05 01:42:35',NULL,'2026-01-05 01:42:41',NULL),(93,2003,27,'2025-2026-spring','DROPPED',NULL,'DRAFT','2026-01-05 01:43:12','2026-01-05 01:44:18',NULL,'2026-01-05 01:43:12',NULL,'2026-01-05 01:44:18',NULL),(94,2003,25,'2025-2026-spring','DROPPED',NULL,'DRAFT','2026-01-05 01:43:14','2026-01-05 01:44:18',NULL,'2026-01-05 01:43:14',NULL,'2026-01-05 01:44:17',NULL),(95,2003,18,'2025-2026-spring','DROPPED',NULL,'DRAFT','2026-01-05 01:43:16','2026-01-05 01:44:17',NULL,'2026-01-05 01:43:16',NULL,'2026-01-05 01:44:16',NULL),(96,2003,36,'2025-2026-spring','DROPPED',NULL,'DRAFT','2026-01-05 01:44:03','2026-01-05 01:44:21',NULL,'2026-01-05 01:44:03',NULL,'2026-01-05 01:44:20',NULL),(97,2003,15,'2025-2026-spring','ENROLLED',NULL,'DRAFT','2026-01-05 01:50:07','2026-01-05 01:49:43',NULL,'2026-01-05 01:45:19',NULL,'2026-01-05 01:50:07',NULL),(98,2003,19,'2025-2026-spring','ENROLLED',NULL,'DRAFT','2026-01-05 01:50:41','2026-01-05 01:50:30',NULL,'2026-01-05 01:45:23',NULL,'2026-01-05 01:50:41',NULL),(99,2003,22,'2025-2026-spring','ENROLLED',NULL,'DRAFT','2026-01-05 01:45:27',NULL,NULL,'2026-01-05 01:45:27',NULL,NULL,NULL),(100,2003,26,'2025-2026-spring','ENROLLED',NULL,'DRAFT','2026-01-05 01:45:33',NULL,NULL,'2026-01-05 01:45:33',NULL,NULL,NULL),(101,2003,34,'2025-2026-spring','ENROLLED',100.00,'PUBLISHED','2026-01-05 01:45:44',NULL,NULL,'2026-01-05 01:45:44',NULL,'2026-01-05 02:00:14',NULL),(102,2003,35,'2025-2026-spring','ENROLLED',NULL,'DRAFT','2026-01-05 01:45:45',NULL,NULL,'2026-01-05 01:45:45',NULL,NULL,NULL),(103,2003,24,'2025-2026-fall','DROPPED',NULL,'DRAFT','2026-01-05 01:57:35','2026-01-05 02:03:09',NULL,'2026-01-05 01:57:35',NULL,'2026-01-05 02:03:08',NULL),(104,2003,29,'2025-2026-fall','ENROLLED',NULL,'PUBLISHED','2026-01-05 01:57:45',NULL,NULL,'2026-01-05 01:57:45',NULL,'2026-01-05 02:01:05',NULL),(105,2003,30,'2025-2026-fall','DROPPED',NULL,'DRAFT','2026-01-05 01:57:47','2026-01-05 02:03:02',NULL,'2026-01-05 01:57:47',NULL,'2026-01-05 02:03:01',NULL),(106,2004,36,'2025-2026-spring','ENROLLED',NULL,'DRAFT','2026-01-05 02:04:38',NULL,NULL,'2026-01-05 02:04:38',NULL,NULL,NULL),(107,2005,36,'2025-2026-spring','ENROLLED',NULL,'DRAFT','2026-01-05 02:05:49',NULL,NULL,'2026-01-05 02:05:49',NULL,NULL,NULL),(108,2004,40,'2025-2026-fall','ENROLLED',NULL,'DRAFT','2026-01-06 00:40:40','2026-01-06 00:40:39',NULL,'2026-01-05 22:26:46',NULL,'2026-01-06 00:40:40',NULL),(109,2005,40,'2025-2026-fall','DROPPED',NULL,'DRAFT','2026-01-05 22:42:11','2026-01-05 22:42:41',NULL,'2026-01-05 22:27:33',NULL,'2026-01-05 22:42:11',NULL),(110,2002,40,'2025-2026-fall','DROPPED',NULL,'DRAFT','2026-01-05 23:47:40','2026-01-06 00:16:46',NULL,'2026-01-05 22:42:50',NULL,'2026-01-05 23:47:40',NULL),(111,2004,3,'2025-2026-fall','DROPPED',NULL,'DRAFT','2026-01-05 23:42:14','2026-01-05 23:48:39',NULL,'2026-01-05 23:42:14',NULL,'2026-01-05 23:48:39',NULL),(112,2004,17,'2025-2026-fall','DROPPED',NULL,'DRAFT','2026-01-05 23:42:17','2026-01-05 23:48:41',NULL,'2026-01-05 23:42:17',NULL,'2026-01-05 23:48:41',NULL),(113,2004,24,'2025-2026-fall','DROPPED',NULL,'DRAFT','2026-01-06 00:20:47','2026-01-06 00:25:39',NULL,'2026-01-05 23:42:23',NULL,'2026-01-06 00:20:47',NULL),(114,2004,29,'2025-2026-fall','DROPPED',NULL,'DRAFT','2026-01-05 23:42:26','2026-01-05 23:48:43',NULL,'2026-01-05 23:42:26',NULL,'2026-01-05 23:48:42',NULL),(115,2004,30,'2025-2026-fall','DROPPED',NULL,'DRAFT','2026-01-05 23:42:27','2026-01-05 23:48:44',NULL,'2026-01-05 23:42:27',NULL,'2026-01-05 23:48:44',NULL),(118,2002,42,'2025-2026-fall','ENROLLED',NULL,'DRAFT','2026-01-06 01:09:00','2026-01-06 01:08:59',NULL,'2026-01-06 00:47:39',NULL,'2026-01-06 01:09:00',NULL);
/*!40000 ALTER TABLE `enrollment` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_check_capacity_insert` BEFORE INSERT ON `enrollment` FOR EACH ROW BEGIN
    DECLARE v_capacity INT;
    DECLARE v_selected INT;
    
    -- 获取当前容量和已选人数
    SELECT capacity, selected_count INTO v_capacity, v_selected
    FROM course_class
    WHERE class_id = NEW.class_id;
    
    -- 检查是否已满
    IF v_selected >= v_capacity THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '选课失败：该教学班已满员';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_update_selected_count_insert` AFTER INSERT ON `enrollment` FOR EACH ROW BEGIN
    IF NEW.status = 'ENROLLED' THEN
        UPDATE course_class
        SET selected_count = selected_count + 1
        WHERE class_id = NEW.class_id;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_update_selected_count_update` AFTER UPDATE ON `enrollment` FOR EACH ROW BEGIN
    -- 情况1：从 ENROLLED 变为 DROPPED (退课) -> 人数-1
    IF OLD.status = 'ENROLLED' AND NEW.status = 'DROPPED' THEN
        UPDATE course_class
        SET selected_count = selected_count - 1
        WHERE class_id = NEW.class_id;
    
    -- 情况2：从 DROPPED 变为 ENROLLED (重新选课) -> 人数+1
    ELSEIF OLD.status = 'DROPPED' AND NEW.status = 'ENROLLED' THEN
        -- 这里也可以再次检查容量，但通常UPDATE不触发BEFORE INSERT，可能需要额外的逻辑
        -- 简单起见，直接更新
        UPDATE course_class
        SET selected_count = selected_count + 1
        WHERE class_id = NEW.class_id;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_update_selected_count_delete` AFTER DELETE ON `enrollment` FOR EACH ROW BEGIN
    IF OLD.status = 'ENROLLED' THEN
        UPDATE course_class
        SET selected_count = selected_count - 1
        WHERE class_id = OLD.class_id;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_blob_triggers`
--

DROP TABLE IF EXISTS `qrtz_blob_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '璋冨害鍚嶇О',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers琛╰rigger_name鐨勫?閿',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers琛╰rigger_group鐨勫?閿',
  `blob_data` blob COMMENT '瀛樻斁鎸佷箙鍖朤rigger瀵硅薄',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Blob绫诲瀷鐨勮Е鍙戝櫒琛';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_blob_triggers`
--

LOCK TABLES `qrtz_blob_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_blob_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_blob_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_calendars`
--

DROP TABLE IF EXISTS `qrtz_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) NOT NULL COMMENT '璋冨害鍚嶇О',
  `calendar_name` varchar(200) NOT NULL COMMENT '鏃ュ巻鍚嶇О',
  `calendar` blob NOT NULL COMMENT '瀛樻斁鎸佷箙鍖朿alendar瀵硅薄',
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='鏃ュ巻淇℃伅琛';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_calendars`
--

LOCK TABLES `qrtz_calendars` WRITE;
/*!40000 ALTER TABLE `qrtz_calendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_cron_triggers`
--

DROP TABLE IF EXISTS `qrtz_cron_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '璋冨害鍚嶇О',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers琛╰rigger_name鐨勫?閿',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers琛╰rigger_group鐨勫?閿',
  `cron_expression` varchar(200) NOT NULL COMMENT 'cron琛ㄨ揪寮',
  `time_zone_id` varchar(80) DEFAULT NULL COMMENT '鏃跺尯',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Cron绫诲瀷鐨勮Е鍙戝櫒琛';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_cron_triggers`
--

LOCK TABLES `qrtz_cron_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_cron_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_cron_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_fired_triggers`
--

DROP TABLE IF EXISTS `qrtz_fired_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '璋冨害鍚嶇О',
  `entry_id` varchar(95) NOT NULL COMMENT '璋冨害鍣ㄥ疄渚媔d',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers琛╰rigger_name鐨勫?閿',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers琛╰rigger_group鐨勫?閿',
  `instance_name` varchar(200) NOT NULL COMMENT '璋冨害鍣ㄥ疄渚嬪悕',
  `fired_time` bigint NOT NULL COMMENT '瑙﹀彂鐨勬椂闂',
  `sched_time` bigint NOT NULL COMMENT '瀹氭椂鍣ㄥ埗瀹氱殑鏃堕棿',
  `priority` int NOT NULL COMMENT '浼樺厛绾',
  `state` varchar(16) NOT NULL COMMENT '鐘舵?',
  `job_name` varchar(200) DEFAULT NULL COMMENT '浠诲姟鍚嶇О',
  `job_group` varchar(200) DEFAULT NULL COMMENT '浠诲姟缁勫悕',
  `is_nonconcurrent` varchar(1) DEFAULT NULL COMMENT '鏄?惁骞跺彂',
  `requests_recovery` varchar(1) DEFAULT NULL COMMENT '鏄?惁鎺ュ彈鎭㈠?鎵ц?',
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='宸茶Е鍙戠殑瑙﹀彂鍣ㄨ〃';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_fired_triggers`
--

LOCK TABLES `qrtz_fired_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_fired_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_fired_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_job_details`
--

DROP TABLE IF EXISTS `qrtz_job_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) NOT NULL COMMENT '璋冨害鍚嶇О',
  `job_name` varchar(200) NOT NULL COMMENT '浠诲姟鍚嶇О',
  `job_group` varchar(200) NOT NULL COMMENT '浠诲姟缁勫悕',
  `description` varchar(250) DEFAULT NULL COMMENT '鐩稿叧浠嬬粛',
  `job_class_name` varchar(250) NOT NULL COMMENT '鎵ц?浠诲姟绫诲悕绉',
  `is_durable` varchar(1) NOT NULL COMMENT '鏄?惁鎸佷箙鍖',
  `is_nonconcurrent` varchar(1) NOT NULL COMMENT '鏄?惁骞跺彂',
  `is_update_data` varchar(1) NOT NULL COMMENT '鏄?惁鏇存柊鏁版嵁',
  `requests_recovery` varchar(1) NOT NULL COMMENT '鏄?惁鎺ュ彈鎭㈠?鎵ц?',
  `job_data` blob COMMENT '瀛樻斁鎸佷箙鍖杍ob瀵硅薄',
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='浠诲姟璇︾粏淇℃伅琛';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_job_details`
--

LOCK TABLES `qrtz_job_details` WRITE;
/*!40000 ALTER TABLE `qrtz_job_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_job_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_locks`
--

DROP TABLE IF EXISTS `qrtz_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) NOT NULL COMMENT '璋冨害鍚嶇О',
  `lock_name` varchar(40) NOT NULL COMMENT '鎮茶?閿佸悕绉',
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='瀛樺偍鐨勬偛瑙傞攣淇℃伅琛';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_locks`
--

LOCK TABLES `qrtz_locks` WRITE;
/*!40000 ALTER TABLE `qrtz_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_paused_trigger_grps`
--

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) NOT NULL COMMENT '璋冨害鍚嶇О',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers琛╰rigger_group鐨勫?閿',
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='鏆傚仠鐨勮Е鍙戝櫒琛';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_paused_trigger_grps`
--

LOCK TABLES `qrtz_paused_trigger_grps` WRITE;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_scheduler_state`
--

DROP TABLE IF EXISTS `qrtz_scheduler_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) NOT NULL COMMENT '璋冨害鍚嶇О',
  `instance_name` varchar(200) NOT NULL COMMENT '瀹炰緥鍚嶇О',
  `last_checkin_time` bigint NOT NULL COMMENT '涓婃?妫?煡鏃堕棿',
  `checkin_interval` bigint NOT NULL COMMENT '妫?煡闂撮殧鏃堕棿',
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='璋冨害鍣ㄧ姸鎬佽〃';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_scheduler_state`
--

LOCK TABLES `qrtz_scheduler_state` WRITE;
/*!40000 ALTER TABLE `qrtz_scheduler_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_scheduler_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_simple_triggers`
--

DROP TABLE IF EXISTS `qrtz_simple_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '璋冨害鍚嶇О',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers琛╰rigger_name鐨勫?閿',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers琛╰rigger_group鐨勫?閿',
  `repeat_count` bigint NOT NULL COMMENT '閲嶅?鐨勬?鏁扮粺璁',
  `repeat_interval` bigint NOT NULL COMMENT '閲嶅?鐨勯棿闅旀椂闂',
  `times_triggered` bigint NOT NULL COMMENT '宸茬粡瑙﹀彂鐨勬?鏁',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='绠?崟瑙﹀彂鍣ㄧ殑淇℃伅琛';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simple_triggers`
--

LOCK TABLES `qrtz_simple_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_simple_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simple_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_simprop_triggers`
--

DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '璋冨害鍚嶇О',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers琛╰rigger_name鐨勫?閿',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers琛╰rigger_group鐨勫?閿',
  `str_prop_1` varchar(512) DEFAULT NULL COMMENT 'String绫诲瀷鐨則rigger鐨勭?涓?釜鍙傛暟',
  `str_prop_2` varchar(512) DEFAULT NULL COMMENT 'String绫诲瀷鐨則rigger鐨勭?浜屼釜鍙傛暟',
  `str_prop_3` varchar(512) DEFAULT NULL COMMENT 'String绫诲瀷鐨則rigger鐨勭?涓変釜鍙傛暟',
  `int_prop_1` int DEFAULT NULL COMMENT 'int绫诲瀷鐨則rigger鐨勭?涓?釜鍙傛暟',
  `int_prop_2` int DEFAULT NULL COMMENT 'int绫诲瀷鐨則rigger鐨勭?浜屼釜鍙傛暟',
  `long_prop_1` bigint DEFAULT NULL COMMENT 'long绫诲瀷鐨則rigger鐨勭?涓?釜鍙傛暟',
  `long_prop_2` bigint DEFAULT NULL COMMENT 'long绫诲瀷鐨則rigger鐨勭?浜屼釜鍙傛暟',
  `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal绫诲瀷鐨則rigger鐨勭?涓?釜鍙傛暟',
  `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal绫诲瀷鐨則rigger鐨勭?浜屼釜鍙傛暟',
  `bool_prop_1` varchar(1) DEFAULT NULL COMMENT 'Boolean绫诲瀷鐨則rigger鐨勭?涓?釜鍙傛暟',
  `bool_prop_2` varchar(1) DEFAULT NULL COMMENT 'Boolean绫诲瀷鐨則rigger鐨勭?浜屼釜鍙傛暟',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='鍚屾?鏈哄埗鐨勮?閿佽〃';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simprop_triggers`
--

LOCK TABLES `qrtz_simprop_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_triggers`
--

DROP TABLE IF EXISTS `qrtz_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '璋冨害鍚嶇О',
  `trigger_name` varchar(200) NOT NULL COMMENT '瑙﹀彂鍣ㄧ殑鍚嶅瓧',
  `trigger_group` varchar(200) NOT NULL COMMENT '瑙﹀彂鍣ㄦ墍灞炵粍鐨勫悕瀛',
  `job_name` varchar(200) NOT NULL COMMENT 'qrtz_job_details琛╦ob_name鐨勫?閿',
  `job_group` varchar(200) NOT NULL COMMENT 'qrtz_job_details琛╦ob_group鐨勫?閿',
  `description` varchar(250) DEFAULT NULL COMMENT '鐩稿叧浠嬬粛',
  `next_fire_time` bigint DEFAULT NULL COMMENT '涓婁竴娆¤Е鍙戞椂闂达紙姣??锛',
  `prev_fire_time` bigint DEFAULT NULL COMMENT '涓嬩竴娆¤Е鍙戞椂闂达紙榛樿?涓?1琛ㄧず涓嶈Е鍙戯級',
  `priority` int DEFAULT NULL COMMENT '浼樺厛绾',
  `trigger_state` varchar(16) NOT NULL COMMENT '瑙﹀彂鍣ㄧ姸鎬',
  `trigger_type` varchar(8) NOT NULL COMMENT '瑙﹀彂鍣ㄧ殑绫诲瀷',
  `start_time` bigint NOT NULL COMMENT '寮??鏃堕棿',
  `end_time` bigint DEFAULT NULL COMMENT '缁撴潫鏃堕棿',
  `calendar_name` varchar(200) DEFAULT NULL COMMENT '鏃ョ▼琛ㄥ悕绉',
  `misfire_instr` smallint DEFAULT NULL COMMENT '琛ュ伩鎵ц?鐨勭瓥鐣',
  `job_data` blob COMMENT '瀛樻斁鎸佷箙鍖杍ob瀵硅薄',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='瑙﹀彂鍣ㄨ?缁嗕俊鎭?〃';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_triggers`
--

LOCK TABLES `qrtz_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2025-12-24 19:30:47','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2025-12-24 19:30:47','',NULL,'初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2025-12-24 19:30:47','',NULL,'深色主题theme-dark，浅色主题theme-light'),(4,'账号自助-验证码开关','sys.account.captchaEnabled','true','Y','admin','2025-12-24 19:30:47','',NULL,'是否开启验证码功能（true开启，false关闭）'),(5,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2025-12-24 19:30:47','',NULL,'是否开启注册用户功能（true开启，false关闭）'),(6,'用户登录-黑名单列表','sys.login.blackIPList','','Y','admin','2025-12-24 19:30:47','',NULL,'设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）'),(7,'用户管理-初始密码修改策略','sys.account.initPasswordModify','1','Y','admin','2025-12-24 19:30:47','',NULL,'0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框'),(8,'用户管理-账号密码更新周期','sys.account.passwordValidateDays','0','Y','admin','2025-12-24 19:30:47','',NULL,'密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (100,0,'0','若依科技',0,'若依','15888888888','ry@qq.com','0','0','admin','2025-12-24 19:30:46','',NULL),(101,100,'0,100','深圳总公司',1,'若依','15888888888','ry@qq.com','0','0','admin','2025-12-24 19:30:46','',NULL),(102,100,'0,100','长沙分公司',2,'若依','15888888888','ry@qq.com','0','0','admin','2025-12-24 19:30:46','',NULL),(103,101,'0,100,101','研发部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2025-12-24 19:30:46','',NULL),(104,101,'0,100,101','市场部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2025-12-24 19:30:46','',NULL),(105,101,'0,100,101','测试部门',3,'若依','15888888888','ry@qq.com','0','0','admin','2025-12-24 19:30:46','',NULL),(106,101,'0,100,101','财务部门',4,'若依','15888888888','ry@qq.com','0','0','admin','2025-12-24 19:30:46','',NULL),(107,101,'0,100,101','运维部门',5,'若依','15888888888','ry@qq.com','0','0','admin','2025-12-24 19:30:46','',NULL),(108,102,'0,100,102','市场部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2025-12-24 19:30:46','',NULL),(109,102,'0,100,102','财务部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2025-12-24 19:30:46','',NULL);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,1,'男','0','sys_user_sex','','','Y','0','admin','2025-12-24 19:30:47','',NULL,'性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2025-12-24 19:30:47','',NULL,'性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2025-12-24 19:30:47','',NULL,'性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2025-12-24 19:30:47','',NULL,'显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2025-12-24 19:30:47','',NULL,'隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2025-12-24 19:30:47','',NULL,'正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2025-12-24 19:30:47','',NULL,'停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2025-12-24 19:30:47','',NULL,'正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2025-12-24 19:30:47','',NULL,'停用状态'),(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2025-12-24 19:30:47','',NULL,'默认分组'),(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2025-12-24 19:30:47','',NULL,'系统分组'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2025-12-24 19:30:47','',NULL,'系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2025-12-24 19:30:47','',NULL,'系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2025-12-24 19:30:47','',NULL,'通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2025-12-24 19:30:47','',NULL,'公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2025-12-24 19:30:47','',NULL,'正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2025-12-24 19:30:47','',NULL,'关闭状态'),(18,99,'其他','0','sys_oper_type','','info','N','0','admin','2025-12-24 19:30:47','',NULL,'其他操作'),(19,1,'新增','1','sys_oper_type','','info','N','0','admin','2025-12-24 19:30:47','',NULL,'新增操作'),(20,2,'修改','2','sys_oper_type','','info','N','0','admin','2025-12-24 19:30:47','',NULL,'修改操作'),(21,3,'删除','3','sys_oper_type','','danger','N','0','admin','2025-12-24 19:30:47','',NULL,'删除操作'),(22,4,'授权','4','sys_oper_type','','primary','N','0','admin','2025-12-24 19:30:47','',NULL,'授权操作'),(23,5,'导出','5','sys_oper_type','','warning','N','0','admin','2025-12-24 19:30:47','',NULL,'导出操作'),(24,6,'导入','6','sys_oper_type','','warning','N','0','admin','2025-12-24 19:30:47','',NULL,'导入操作'),(25,7,'强退','7','sys_oper_type','','danger','N','0','admin','2025-12-24 19:30:47','',NULL,'强退操作'),(26,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2025-12-24 19:30:47','',NULL,'生成操作'),(27,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2025-12-24 19:30:47','',NULL,'清空操作'),(28,1,'成功','0','sys_common_status','','primary','N','0','admin','2025-12-24 19:30:47','',NULL,'正常状态'),(29,2,'失败','1','sys_common_status','','danger','N','0','admin','2025-12-24 19:30:47','',NULL,'停用状态');
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex','0','admin','2025-12-24 19:30:47','',NULL,'用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2025-12-24 19:30:47','',NULL,'菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2025-12-24 19:30:47','',NULL,'系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2025-12-24 19:30:47','',NULL,'任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2025-12-24 19:30:47','',NULL,'任务分组列表'),(6,'系统是否','sys_yes_no','0','admin','2025-12-24 19:30:47','',NULL,'系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2025-12-24 19:30:47','',NULL,'通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2025-12-24 19:30:47','',NULL,'通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2025-12-24 19:30:47','',NULL,'操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2025-12-24 19:30:47','',NULL,'登录状态列表');
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job`
--

DROP TABLE IF EXISTS `sys_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
INSERT INTO `sys_job` VALUES (1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2025-12-24 19:30:48','',NULL,''),(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2025-12-24 19:30:48','',NULL,''),(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2025-12-24 19:30:48','',NULL,'');
/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job_log`
--

DROP TABLE IF EXISTS `sys_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job_log`
--

LOCK TABLES `sys_job_log` WRITE;
/*!40000 ALTER TABLE `sys_job_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_logininfor`
--

DROP TABLE IF EXISTS `sys_logininfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB AUTO_INCREMENT=381 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;
INSERT INTO `sys_logininfor` VALUES (100,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2025-12-24 19:36:46'),(101,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-04 00:00:51'),(102,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-04 08:32:57'),(103,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-04 09:13:54'),(104,'student','127.0.0.1','内网IP','Edge 143','Windows >=10','1','用户不存在/密码错误','2026-01-04 09:14:10'),(105,'student1','127.0.0.1','内网IP','Edge 143','Windows >=10','1','验证码错误','2026-01-04 09:15:48'),(106,'student1','127.0.0.1','内网IP','Edge 143','Windows >=10','1','用户不存在/密码错误','2026-01-04 09:15:51'),(107,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-04 09:15:59'),(108,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-04 09:35:32'),(109,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-04 09:35:36'),(110,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-04 09:52:26'),(111,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-04 09:52:26'),(112,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-04 10:25:43'),(113,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-04 10:33:58'),(114,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-04 10:33:58'),(115,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-04 11:00:58'),(116,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-04 11:01:01'),(117,'admin','127.0.0.1','内网IP','WindowsPowerShell 5.1.26100.7462','Windows 10.0','1','验证码已失效','2026-01-04 11:08:51'),(118,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-04 11:12:15'),(119,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-04 11:13:14'),(120,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-04 11:14:06'),(121,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-04 11:16:29'),(122,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-04 11:18:19'),(123,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-04 11:19:27'),(124,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-04 11:40:26'),(125,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-04 11:45:42'),(126,'student','127.0.0.1','内网IP','Edge 143','Windows >=10','1','用户不存在/密码错误','2026-01-04 11:45:49'),(127,'student2001','127.0.0.1','内网IP','Edge 143','Windows >=10','1','验证码错误','2026-01-04 11:46:34'),(128,'student2001','127.0.0.1','内网IP','Edge 143','Windows >=10','1','用户不存在/密码错误','2026-01-04 11:46:36'),(129,'student','127.0.0.1','内网IP','Edge 143','Windows >=10','1','用户不存在/密码错误','2026-01-04 11:46:42'),(130,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-04 11:47:03'),(131,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-04 11:48:08'),(132,'b_student2001','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-04 11:48:14'),(133,'b_student2001','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-04 11:49:26'),(134,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-04 11:49:34'),(135,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-04 11:56:00'),(136,'admin_edu','127.0.0.1','内网IP','Edge 143','Windows >=10','1','用户不存在/密码错误','2026-01-04 11:56:11'),(137,'admin_edu','127.0.0.1','内网IP','Edge 143','Windows >=10','1','用户不存在/密码错误','2026-01-04 11:57:25'),(138,'admin_edu','127.0.0.1','内网IP','Edge 143','Windows >=10','1','用户不存在/密码错误','2026-01-04 11:57:25'),(139,'admin_edu','127.0.0.1','内网IP','Edge 143','Windows >=10','1','用户不存在/密码错误','2026-01-04 11:57:56'),(140,'admin_edu','127.0.0.1','内网IP','Edge 143','Windows >=10','1','用户不存在/密码错误','2026-01-04 11:58:12'),(141,'admin_edu','127.0.0.1','内网IP','Edge 143','Windows >=10','1','密码输入错误5次，帐户锁定10分钟','2026-01-04 12:02:42'),(142,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-04 12:02:46'),(143,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-04 12:02:51'),(144,'admin_edu','127.0.0.1','内网IP','Edge 143','Windows >=10','1','密码输入错误5次，帐户锁定10分钟','2026-01-04 12:02:58'),(145,'admin_edu','127.0.0.1','内网IP','Edge 143','Windows >=10','1','密码输入错误5次，帐户锁定10分钟','2026-01-04 12:03:19'),(146,'admin_edu','127.0.0.1','内网IP','Edge 143','Windows >=10','1','密码输入错误5次，帐户锁定10分钟','2026-01-04 12:04:01'),(147,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-04 12:05:02'),(148,'admin_edu','127.0.0.1','内网IP','Edge 143','Windows >=10','1','密码输入错误5次，帐户锁定10分钟','2026-01-04 12:05:24'),(149,'admin_edu','127.0.0.1','内网IP','Edge 143','Windows >=10','1','用户不存在/密码错误','2026-01-04 12:06:18'),(150,'admin_edu','127.0.0.1','内网IP','Edge 143','Windows >=10','1','用户不存在/密码错误','2026-01-04 12:06:33'),(151,'admin_edu','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-04 12:10:32'),(152,'admin_edu','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-04 12:20:03'),(153,'admin_edu','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-04 12:20:18'),(154,'admin_edu','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-04 12:20:25'),(155,'admin_edu','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-04 12:53:17'),(156,'b_teacher1001','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-04 12:53:18'),(157,'b_teacher1001','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-04 12:53:53'),(158,'admin_edu','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-04 12:54:04'),(159,'admin_edu','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-04 13:52:52'),(160,'admin_edu','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-04 15:24:03'),(161,'admin_edu','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-04 15:24:49'),(162,'student','127.0.0.1','内网IP','Edge 143','Windows >=10','1','用户不存在/密码错误','2026-01-04 15:25:05'),(163,'student','127.0.0.1','内网IP','Edge 143','Windows >=10','1','用户不存在/密码错误','2026-01-04 15:25:09'),(164,'b_student2001','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-04 15:26:13'),(165,'b_student2001','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-04 15:41:10'),(166,'b_student2002','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-04 15:41:17'),(167,'b_student2002','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-04 15:41:34'),(168,'b_teacher1001','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-04 15:41:56'),(169,'b_teacher1001','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-04 15:42:56'),(170,'b_teacher1002','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-04 15:43:04'),(171,'b_teacher1002','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-04 15:43:16'),(172,'admin_edu','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-04 15:43:28'),(173,'admin_edu','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-04 15:46:31'),(174,'b_teacher1001','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-04 15:46:45'),(175,'b_teacher1001','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-04 15:49:10'),(176,'admin_edu','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-04 15:50:25'),(177,'admin_edu','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-04 15:51:00'),(178,'student','127.0.0.1','内网IP','Edge 143','Windows >=10','1','用户不存在/密码错误','2026-01-04 15:51:14'),(179,'b_student2001','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-04 15:51:26'),(180,'b_student2001','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-04 15:54:06'),(181,'admin_edu','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-04 15:54:15'),(182,'b_student2001','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-04 16:19:05'),(183,'b_student2001','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-04 16:20:23'),(184,'b_teacher1001','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-04 16:20:33'),(185,'b_teacher1001','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-04 16:23:23'),(186,'b_student1001','127.0.0.1','内网IP','Edge 143','Windows >=10','1','用户不存在/密码错误','2026-01-04 16:23:30'),(187,'b_student2001','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-04 16:23:43'),(188,'b_student2001','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-04 16:24:43'),(189,'admin_edu','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-04 16:25:06'),(190,'admin_edu','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-04 16:29:52'),(191,'b_student2001','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-04 16:30:03'),(268,'admin_edu','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2026-01-04 19:54:32'),(269,'b_teacher1001','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-04 19:54:44'),(270,'b_teacher1001','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2026-01-04 19:54:55'),(271,'b_teacher1001','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-04 19:55:06'),(272,'b_teacher1001','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2026-01-04 19:55:32'),(273,'b_student2001','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-04 19:55:58'),(274,'b_student2001','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2026-01-04 19:56:26'),(275,'b_student2002','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-04 19:56:32'),(276,'b_student2002','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2026-01-04 19:59:38'),(277,'b_student2001','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-04 19:59:51'),(278,'b_student2001','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2026-01-04 20:01:47'),(279,'admin_edu','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-04 20:01:57'),(280,'admin_edu','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2026-01-04 20:02:45'),(281,'b_student2001','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-04 20:02:51'),(282,'b_student2001','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2026-01-04 20:13:13'),(283,'b_teacher1001','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-04 20:13:32'),(284,'b_teacher1001','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2026-01-04 20:13:45'),(285,'admin_edu','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-04 20:13:51'),(286,'admin_edu','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2026-01-04 20:14:20'),(287,'student','127.0.0.1','内网IP','Chrome 143','Windows10','1','用户不存在/密码错误','2026-01-04 20:14:28'),(288,'b_student2001','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-04 20:14:46'),(289,'b_student2001','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2026-01-04 21:01:17'),(290,'admin_edu','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-04 21:01:27'),(291,'b_teacher1001','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2026-01-05 00:42:34'),(292,'b_student2001','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-05 00:42:47'),(293,'b_student2001','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2026-01-05 00:53:04'),(294,'admin','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-05 00:53:04'),(295,'admin','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2026-01-05 00:55:27'),(296,'b_student2001','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-05 00:55:52'),(297,'b_student2001','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2026-01-05 00:56:44'),(298,'b_teacher1001','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-05 00:56:54'),(299,'b_teacher1001','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2026-01-05 01:09:31'),(300,'b_teacher1003','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-05 01:09:56'),(301,'b_teacher1003','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2026-01-05 01:10:36'),(302,'admin_edu','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-05 01:10:46'),(303,'admin_edu','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2026-01-05 01:11:26'),(304,'b_student2001','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-05 01:11:35'),(305,'admin_edu','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-05 17:30:52'),(306,'b_student2001','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-05 17:31:07'),(307,'b_student2001','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-05 17:32:06'),(308,'b_teacher1001','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-05 17:32:22'),(309,'b_teacher1001','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-05 17:33:04'),(310,'b_teacher1001','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-05 22:05:38'),(311,'b_teacher1001','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-05 22:05:58'),(312,'admin_edu','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-05 22:06:11'),(313,'admin_edu','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-05 22:07:15'),(314,'b_student2001','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-05 22:07:50'),(315,'b_student2001','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-05 22:08:29'),(316,'admin_edu','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-05 22:08:39'),(317,'admin_edu','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-05 22:10:26'),(318,'b_student2001','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-05 22:10:37'),(319,'b_student2001','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-05 22:10:51'),(320,'admin_edu','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-05 22:10:59'),(321,'admin_edu','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-05 22:11:47'),(322,'b_student2001','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-05 22:11:54'),(323,'b_student2001','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-05 22:12:38'),(324,'b_teacher1003','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-05 22:12:50'),(325,'b_teacher1003','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-05 22:13:18'),(326,'b_student2002','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-05 22:13:31'),(327,'b_student2002','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-05 22:14:01'),(328,'admin_edu','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-05 22:14:11'),(329,'admin_edu','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-05 22:17:29'),(330,'b_student2001','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-05 22:17:42'),(331,'b_student2001','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-05 22:19:19'),(332,'admin_edu','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-05 22:19:32'),(333,'admin_edu','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-05 22:20:20'),(334,'b_student2001','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-05 22:20:34'),(335,'b_student2001','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-05 22:24:52'),(336,'admin_edu','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-05 22:26:01'),(337,'admin_edu','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-05 22:26:26'),(338,'b_student2004','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-05 22:26:37'),(339,'b_student2004','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-05 22:26:57'),(340,'b_student2005','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-05 22:27:02'),(341,'b_student2005','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-05 22:42:28'),(342,'b_student2002','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-05 22:42:36'),(343,'b_student2002','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-05 23:20:12'),(344,'b_student2002','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-05 23:22:19'),(345,'b_student2004','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-05 23:22:28'),(346,'b_student2004','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-05 23:29:38'),(347,'b_student2004','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-05 23:37:59'),(348,'b_student2002','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-05 23:37:59'),(349,'admin_edu','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-05 23:38:08'),(350,'admin_edu','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-05 23:38:34'),(351,'b_student2002','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-05 23:38:52'),(352,'b_student2002','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-05 23:39:06'),(353,'b_student2006','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-05 23:39:12'),(354,'b_student2006','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-05 23:39:22'),(355,'b_student2004','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-05 23:39:27'),(356,'b_student2004','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-05 23:40:58'),(357,'b_student2004','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2026-01-05 23:41:04'),(358,'b_student2002','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-05 23:41:11'),(359,'b_student2001','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-06 00:15:41'),(360,'b_student2001','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2026-01-06 00:15:57'),(361,'b_student2002','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-06 00:16:05'),(362,'b_student2004','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-06 00:16:21'),(363,'b_student2004','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-06 00:21:23'),(364,'b_teacher1001','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-06 00:21:33'),(365,'b_teacher1001','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-06 00:24:34'),(366,'b_student2001','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-06 00:25:10'),(367,'b_student2001','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-06 00:25:18'),(368,'b_student2002','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-06 00:25:22'),(369,'b_student2002','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-06 00:25:28'),(370,'b_student2004','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-06 00:25:31'),(371,'b_student2004','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-06 00:41:59'),(372,'admin_edu','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-06 00:42:06'),(373,'admin_edu','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-06 01:11:56'),(374,'b_teacher1004','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-06 01:12:47'),(375,'b_student2002','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2026-01-06 01:23:10'),(376,'b_student2004','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-06 01:23:23'),(377,'b_teacher1004','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-06 01:24:05'),(378,'admin_edu','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-06 01:24:17'),(379,'admin_edu','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-06 01:24:41'),(380,'b_student2001','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-06 01:24:54');
/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) DEFAULT '' COMMENT '路由名称',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2339 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',0,1,'system',NULL,'','',1,0,'M','0','0','','system','admin','2025-12-24 19:30:46','',NULL,'系统管理目录'),(2,'系统监控',0,2,'monitor',NULL,'','',1,0,'M','0','0','','monitor','admin','2025-12-24 19:30:46','',NULL,'系统监控目录'),(3,'系统工具',0,3,'tool',NULL,'','',1,0,'M','0','0','','tool','admin','2025-12-24 19:30:46','',NULL,'系统工具目录'),(4,'若依官网',0,4,'http://ruoyi.vip',NULL,'','',0,0,'M','0','0','','guide','admin','2025-12-24 19:30:46','admin','2026-01-04 11:15:44','若依官网地址'),(100,'用户管理',1,1,'user','system/user/index','','',1,0,'C','0','0','system:user:list','user','admin','2025-12-24 19:30:46','',NULL,'用户管理菜单'),(101,'角色管理',1,2,'role','system/role/index','','',1,0,'C','0','0','system:role:list','peoples','admin','2025-12-24 19:30:46','',NULL,'角色管理菜单'),(102,'菜单管理',1,3,'menu','system/menu/index','','',1,0,'C','0','0','system:menu:list','tree-table','admin','2025-12-24 19:30:46','',NULL,'菜单管理菜单'),(103,'部门管理',1,4,'dept','system/dept/index','','',1,0,'C','0','0','system:dept:list','tree','admin','2025-12-24 19:30:46','',NULL,'部门管理菜单'),(104,'岗位管理',1,5,'post','system/post/index','','',1,0,'C','0','0','system:post:list','post','admin','2025-12-24 19:30:46','',NULL,'岗位管理菜单'),(105,'字典管理',1,6,'dict','system/dict/index','','',1,0,'C','0','0','system:dict:list','dict','admin','2025-12-24 19:30:46','',NULL,'字典管理菜单'),(106,'参数设置',1,7,'config','system/config/index','','',1,0,'C','0','0','system:config:list','edit','admin','2025-12-24 19:30:46','',NULL,'参数设置菜单'),(107,'通知公告',1,8,'notice','system/notice/index','','',1,0,'C','0','0','system:notice:list','message','admin','2025-12-24 19:30:46','',NULL,'通知公告菜单'),(108,'日志管理',1,9,'log','','','',1,0,'M','0','0','','log','admin','2025-12-24 19:30:46','',NULL,'日志管理菜单'),(109,'在线用户',2,1,'online','monitor/online/index','','',1,0,'C','0','0','monitor:online:list','online','admin','2025-12-24 19:30:46','',NULL,'在线用户菜单'),(110,'定时任务',2,2,'job','monitor/job/index','','',1,0,'C','0','0','monitor:job:list','job','admin','2025-12-24 19:30:46','',NULL,'定时任务菜单'),(111,'数据监控',2,3,'druid','monitor/druid/index','','',1,0,'C','0','0','monitor:druid:list','druid','admin','2025-12-24 19:30:46','',NULL,'数据监控菜单'),(112,'服务监控',2,4,'server','monitor/server/index','','',1,0,'C','0','0','monitor:server:list','server','admin','2025-12-24 19:30:46','',NULL,'服务监控菜单'),(113,'缓存监控',2,5,'cache','monitor/cache/index','','',1,0,'C','0','0','monitor:cache:list','redis','admin','2025-12-24 19:30:46','',NULL,'缓存监控菜单'),(114,'缓存列表',2,6,'cacheList','monitor/cache/list','','',1,0,'C','0','0','monitor:cache:list','redis-list','admin','2025-12-24 19:30:46','',NULL,'缓存列表菜单'),(115,'表单构建',3,1,'build','tool/build/index','','',1,0,'C','0','0','tool:build:list','build','admin','2025-12-24 19:30:46','',NULL,'表单构建菜单'),(116,'代码生成',3,2,'gen','tool/gen/index','','',1,0,'C','0','0','tool:gen:list','code','admin','2025-12-24 19:30:46','',NULL,'代码生成菜单'),(117,'系统接口',3,3,'swagger','tool/swagger/index','','',1,0,'C','0','0','tool:swagger:list','swagger','admin','2025-12-24 19:30:46','',NULL,'系统接口菜单'),(500,'操作日志',108,1,'operlog','monitor/operlog/index','','',1,0,'C','0','0','monitor:operlog:list','form','admin','2025-12-24 19:30:46','',NULL,'操作日志菜单'),(501,'登录日志',108,2,'logininfor','monitor/logininfor/index','','',1,0,'C','0','0','monitor:logininfor:list','logininfor','admin','2025-12-24 19:30:46','',NULL,'登录日志菜单'),(1000,'用户查询',100,1,'','','','',1,0,'F','0','0','system:user:query','#','admin','2025-12-24 19:30:46','',NULL,''),(1001,'用户新增',100,2,'','','','',1,0,'F','0','0','system:user:add','#','admin','2025-12-24 19:30:46','',NULL,''),(1002,'用户修改',100,3,'','','','',1,0,'F','0','0','system:user:edit','#','admin','2025-12-24 19:30:46','',NULL,''),(1003,'用户删除',100,4,'','','','',1,0,'F','0','0','system:user:remove','#','admin','2025-12-24 19:30:46','',NULL,''),(1004,'用户导出',100,5,'','','','',1,0,'F','0','0','system:user:export','#','admin','2025-12-24 19:30:46','',NULL,''),(1005,'用户导入',100,6,'','','','',1,0,'F','0','0','system:user:import','#','admin','2025-12-24 19:30:46','',NULL,''),(1006,'重置密码',100,7,'','','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2025-12-24 19:30:46','',NULL,''),(1007,'角色查询',101,1,'','','','',1,0,'F','0','0','system:role:query','#','admin','2025-12-24 19:30:46','',NULL,''),(1008,'角色新增',101,2,'','','','',1,0,'F','0','0','system:role:add','#','admin','2025-12-24 19:30:46','',NULL,''),(1009,'角色修改',101,3,'','','','',1,0,'F','0','0','system:role:edit','#','admin','2025-12-24 19:30:46','',NULL,''),(1010,'角色删除',101,4,'','','','',1,0,'F','0','0','system:role:remove','#','admin','2025-12-24 19:30:46','',NULL,''),(1011,'角色导出',101,5,'','','','',1,0,'F','0','0','system:role:export','#','admin','2025-12-24 19:30:46','',NULL,''),(1012,'菜单查询',102,1,'','','','',1,0,'F','0','0','system:menu:query','#','admin','2025-12-24 19:30:46','',NULL,''),(1013,'菜单新增',102,2,'','','','',1,0,'F','0','0','system:menu:add','#','admin','2025-12-24 19:30:46','',NULL,''),(1014,'菜单修改',102,3,'','','','',1,0,'F','0','0','system:menu:edit','#','admin','2025-12-24 19:30:46','',NULL,''),(1015,'菜单删除',102,4,'','','','',1,0,'F','0','0','system:menu:remove','#','admin','2025-12-24 19:30:46','',NULL,''),(1016,'部门查询',103,1,'','','','',1,0,'F','0','0','system:dept:query','#','admin','2025-12-24 19:30:47','',NULL,''),(1017,'部门新增',103,2,'','','','',1,0,'F','0','0','system:dept:add','#','admin','2025-12-24 19:30:47','',NULL,''),(1018,'部门修改',103,3,'','','','',1,0,'F','0','0','system:dept:edit','#','admin','2025-12-24 19:30:47','',NULL,''),(1019,'部门删除',103,4,'','','','',1,0,'F','0','0','system:dept:remove','#','admin','2025-12-24 19:30:47','',NULL,''),(1020,'岗位查询',104,1,'','','','',1,0,'F','0','0','system:post:query','#','admin','2025-12-24 19:30:47','',NULL,''),(1021,'岗位新增',104,2,'','','','',1,0,'F','0','0','system:post:add','#','admin','2025-12-24 19:30:47','',NULL,''),(1022,'岗位修改',104,3,'','','','',1,0,'F','0','0','system:post:edit','#','admin','2025-12-24 19:30:47','',NULL,''),(1023,'岗位删除',104,4,'','','','',1,0,'F','0','0','system:post:remove','#','admin','2025-12-24 19:30:47','',NULL,''),(1024,'岗位导出',104,5,'','','','',1,0,'F','0','0','system:post:export','#','admin','2025-12-24 19:30:47','',NULL,''),(1025,'字典查询',105,1,'#','','','',1,0,'F','0','0','system:dict:query','#','admin','2025-12-24 19:30:47','',NULL,''),(1026,'字典新增',105,2,'#','','','',1,0,'F','0','0','system:dict:add','#','admin','2025-12-24 19:30:47','',NULL,''),(1027,'字典修改',105,3,'#','','','',1,0,'F','0','0','system:dict:edit','#','admin','2025-12-24 19:30:47','',NULL,''),(1028,'字典删除',105,4,'#','','','',1,0,'F','0','0','system:dict:remove','#','admin','2025-12-24 19:30:47','',NULL,''),(1029,'字典导出',105,5,'#','','','',1,0,'F','0','0','system:dict:export','#','admin','2025-12-24 19:30:47','',NULL,''),(1030,'参数查询',106,1,'#','','','',1,0,'F','0','0','system:config:query','#','admin','2025-12-24 19:30:47','',NULL,''),(1031,'参数新增',106,2,'#','','','',1,0,'F','0','0','system:config:add','#','admin','2025-12-24 19:30:47','',NULL,''),(1032,'参数修改',106,3,'#','','','',1,0,'F','0','0','system:config:edit','#','admin','2025-12-24 19:30:47','',NULL,''),(1033,'参数删除',106,4,'#','','','',1,0,'F','0','0','system:config:remove','#','admin','2025-12-24 19:30:47','',NULL,''),(1034,'参数导出',106,5,'#','','','',1,0,'F','0','0','system:config:export','#','admin','2025-12-24 19:30:47','',NULL,''),(1035,'公告查询',107,1,'#','','','',1,0,'F','0','0','system:notice:query','#','admin','2025-12-24 19:30:47','',NULL,''),(1036,'公告新增',107,2,'#','','','',1,0,'F','0','0','system:notice:add','#','admin','2025-12-24 19:30:47','',NULL,''),(1037,'公告修改',107,3,'#','','','',1,0,'F','0','0','system:notice:edit','#','admin','2025-12-24 19:30:47','',NULL,''),(1038,'公告删除',107,4,'#','','','',1,0,'F','0','0','system:notice:remove','#','admin','2025-12-24 19:30:47','',NULL,''),(1039,'操作查询',500,1,'#','','','',1,0,'F','0','0','monitor:operlog:query','#','admin','2025-12-24 19:30:47','',NULL,''),(1040,'操作删除',500,2,'#','','','',1,0,'F','0','0','monitor:operlog:remove','#','admin','2025-12-24 19:30:47','',NULL,''),(1041,'日志导出',500,3,'#','','','',1,0,'F','0','0','monitor:operlog:export','#','admin','2025-12-24 19:30:47','',NULL,''),(1042,'登录查询',501,1,'#','','','',1,0,'F','0','0','monitor:logininfor:query','#','admin','2025-12-24 19:30:47','',NULL,''),(1043,'登录删除',501,2,'#','','','',1,0,'F','0','0','monitor:logininfor:remove','#','admin','2025-12-24 19:30:47','',NULL,''),(1044,'日志导出',501,3,'#','','','',1,0,'F','0','0','monitor:logininfor:export','#','admin','2025-12-24 19:30:47','',NULL,''),(1045,'账户解锁',501,4,'#','','','',1,0,'F','0','0','monitor:logininfor:unlock','#','admin','2025-12-24 19:30:47','',NULL,''),(1046,'在线查询',109,1,'#','','','',1,0,'F','0','0','monitor:online:query','#','admin','2025-12-24 19:30:47','',NULL,''),(1047,'批量强退',109,2,'#','','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2025-12-24 19:30:47','',NULL,''),(1048,'单条强退',109,3,'#','','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2025-12-24 19:30:47','',NULL,''),(1049,'任务查询',110,1,'#','','','',1,0,'F','0','0','monitor:job:query','#','admin','2025-12-24 19:30:47','',NULL,''),(1050,'任务新增',110,2,'#','','','',1,0,'F','0','0','monitor:job:add','#','admin','2025-12-24 19:30:47','',NULL,''),(1051,'任务修改',110,3,'#','','','',1,0,'F','0','0','monitor:job:edit','#','admin','2025-12-24 19:30:47','',NULL,''),(1052,'任务删除',110,4,'#','','','',1,0,'F','0','0','monitor:job:remove','#','admin','2025-12-24 19:30:47','',NULL,''),(1053,'状态修改',110,5,'#','','','',1,0,'F','0','0','monitor:job:changeStatus','#','admin','2025-12-24 19:30:47','',NULL,''),(1054,'任务导出',110,6,'#','','','',1,0,'F','0','0','monitor:job:export','#','admin','2025-12-24 19:30:47','',NULL,''),(1055,'生成查询',116,1,'#','','','',1,0,'F','0','0','tool:gen:query','#','admin','2025-12-24 19:30:47','',NULL,''),(1056,'生成修改',116,2,'#','','','',1,0,'F','0','0','tool:gen:edit','#','admin','2025-12-24 19:30:47','',NULL,''),(1057,'生成删除',116,3,'#','','','',1,0,'F','0','0','tool:gen:remove','#','admin','2025-12-24 19:30:47','',NULL,''),(1058,'导入代码',116,4,'#','','','',1,0,'F','0','0','tool:gen:import','#','admin','2025-12-24 19:30:47','',NULL,''),(1059,'预览代码',116,5,'#','','','',1,0,'F','0','0','tool:gen:preview','#','admin','2025-12-24 19:30:47','',NULL,''),(1060,'生成代码',116,6,'#','','','',1,0,'F','0','0','tool:gen:code','#','admin','2025-12-24 19:30:47','',NULL,''),(2001,'可选课程',0,1,'student/course','edu/student/course/index','','StudentCourse',1,0,'C','0','0','edu:student:course','excel','b_admin','2026-01-04 00:06:37','admin','2026-01-05 00:53:53','[B]学生选课页面'),(2002,'我的课表',0,2,'student/timetable','edu/student/timetable/index','','StudentTimetable',1,0,'C','0','0','edu:student:timetable','form','b_admin','2026-01-04 00:06:37','admin','2026-01-05 00:54:06','[B]学生课表查询'),(2003,'成绩查询',0,3,'student/grades','edu/student/grades/index','','StudentGrades',1,0,'C','0','0','edu:student:grades','star','b_admin','2026-01-04 00:06:37','admin','2026-01-05 00:54:23','[B]学生成绩查询'),(2004,'学分统计',0,4,'student/credits','edu/student/credits/index','','StudentCredits',1,0,'C','0','0','edu:statistics:credits','chart','b_admin','2026-01-04 00:06:37','',NULL,'[B]学生学分统计'),(2005,'我的班级',0,5,'teacher/classes','edu/teacher/classes/index','','TeacherClasses',1,0,'C','0','0','edu:teacher:classes','more-up','b_admin','2026-01-04 00:06:37','admin','2026-01-05 00:54:34','[B]教师查看所教班级'),(2006,'成绩管理',0,6,'teacher/grades','edu/teacher/grades/index','','TeacherGrades',1,0,'C','0','0','edu:teacher:grades','edit','b_admin','2026-01-04 00:06:37','',NULL,'[B]教师成绩录入和发布'),(2101,'选课',2001,1,'','','','',1,0,'F','0','0','edu:student:enroll','#','b_admin','2026-01-04 00:06:37','',NULL,'[B]学生选课按钮'),(2102,'退课',2001,2,'','','','',1,0,'F','0','0','edu:student:drop','#','b_admin','2026-01-04 00:06:37','',NULL,'[B]学生退课按钮'),(2103,'查询课表',2002,1,'','','','',1,0,'F','0','0','edu:student:timetable','#','b_admin','2026-01-04 00:06:37','',NULL,'[B]查询课表按钮'),(2104,'查询成绩',2003,1,'','','','',1,0,'F','0','0','edu:student:grades','#','b_admin','2026-01-04 00:06:37','',NULL,'[B]查询成绩按钮'),(2105,'查询学分',2004,1,'','','','',1,0,'F','0','0','edu:statistics:credits','#','b_admin','2026-01-04 00:06:37','',NULL,'[B]查询学分统计按钮'),(2201,'查看学生',2005,1,'','','','',1,0,'F','0','0','edu:teacher:students','#','b_admin','2026-01-04 00:06:37','',NULL,'[B]查看班级学生按钮'),(2202,'录入成绩',2006,1,'','','','',1,0,'F','0','0','edu:teacher:grades:edit','#','b_admin','2026-01-04 00:06:37','',NULL,'[B]录入成绩按钮'),(2203,'发布成绩',2006,2,'','','','',1,0,'F','0','0','edu:teacher:grades:publish','#','b_admin','2026-01-04 00:06:37','',NULL,'[B]发布成绩按钮'),(2204,'班级统计',2005,2,'','','','',1,0,'F','0','0','edu:teacher:statistics','#','b_admin','2026-01-04 00:06:37','',NULL,'[B]班级成绩统计按钮'),(2205,'学期管理',0,7,'admin/term','edu/admin/term/index',NULL,'',1,0,'C','0','0','edu:admin:term:list','dict','admin','2026-01-04 08:48:25','admin','2026-01-05 00:54:49',''),(2206,'课程管理',0,8,'admin/course','edu/admin/course/index',NULL,'',1,0,'C','0','0','edu:admin:course:list','date','admin','2026-01-04 08:49:58','admin','2026-01-05 00:54:58',''),(2207,'教学班管理',0,9,'admin/courseClass','edu/admin/courseClass/index',NULL,'',1,0,'C','0','0','edu:admin:courseClass:list','documentation','admin','2026-01-04 08:50:37','admin','2026-01-05 00:55:04',''),(2208,'学分规则',0,10,'admin/creditRule','edu/admin/creditRule/index',NULL,'',1,0,'C','0','0','edu:admin:creditRule:list','edit','admin','2026-01-04 08:51:13','admin','2026-01-05 00:55:14',''),(2300,'????',2205,1,'#','',NULL,'',1,0,'F','0','0','edu:admin:term:query','#','admin','2026-01-04 11:55:15','',NULL,''),(2301,'????',2205,2,'#','',NULL,'',1,0,'F','0','0','edu:admin:term:add','#','admin','2026-01-04 11:55:15','',NULL,''),(2302,'????',2205,3,'#','',NULL,'',1,0,'F','0','0','edu:admin:term:edit','#','admin','2026-01-04 11:55:15','',NULL,''),(2303,'????',2205,4,'#','',NULL,'',1,0,'F','0','0','edu:admin:term:remove','#','admin','2026-01-04 11:55:15','',NULL,''),(2304,'????',2205,5,'#','',NULL,'',1,0,'F','0','0','edu:admin:term:export','#','admin','2026-01-04 11:55:15','',NULL,''),(2310,'????',2206,1,'#','',NULL,'',1,0,'F','0','0','edu:admin:course:query','#','admin','2026-01-04 11:55:15','',NULL,''),(2311,'????',2206,2,'#','',NULL,'',1,0,'F','0','0','edu:admin:course:add','#','admin','2026-01-04 11:55:15','',NULL,''),(2312,'????',2206,3,'#','',NULL,'',1,0,'F','0','0','edu:admin:course:edit','#','admin','2026-01-04 11:55:15','',NULL,''),(2313,'????',2206,4,'#','',NULL,'',1,0,'F','0','0','edu:admin:course:remove','#','admin','2026-01-04 11:55:15','',NULL,''),(2314,'????',2206,5,'#','',NULL,'',1,0,'F','0','0','edu:admin:course:export','#','admin','2026-01-04 11:55:15','',NULL,''),(2320,'?????',2207,1,'#','',NULL,'',1,0,'F','0','0','edu:admin:courseClass:query','#','admin','2026-01-04 11:55:15','',NULL,''),(2321,'?????',2207,2,'#','',NULL,'',1,0,'F','0','0','edu:admin:courseClass:add','#','admin','2026-01-04 11:55:15','',NULL,''),(2322,'?????',2207,3,'#','',NULL,'',1,0,'F','0','0','edu:admin:courseClass:edit','#','admin','2026-01-04 11:55:15','',NULL,''),(2323,'?????',2207,4,'#','',NULL,'',1,0,'F','0','0','edu:admin:courseClass:remove','#','admin','2026-01-04 11:55:15','',NULL,''),(2324,'?????',2207,5,'#','',NULL,'',1,0,'F','0','0','edu:admin:courseClass:export','#','admin','2026-01-04 11:55:15','',NULL,''),(2330,'????',2208,1,'#','',NULL,'',1,0,'F','0','0','edu:admin:creditRule:query','#','admin','2026-01-04 11:55:15','',NULL,''),(2331,'????',2208,2,'#','',NULL,'',1,0,'F','0','0','edu:admin:creditRule:add','#','admin','2026-01-04 11:55:15','',NULL,''),(2332,'????',2208,3,'#','',NULL,'',1,0,'F','0','0','edu:admin:creditRule:edit','#','admin','2026-01-04 11:55:15','',NULL,''),(2333,'????',2208,4,'#','',NULL,'',1,0,'F','0','0','edu:admin:creditRule:remove','#','admin','2026-01-04 11:55:15','',NULL,''),(2334,'????',2208,5,'#','',NULL,'',1,0,'F','0','0','edu:admin:creditRule:export','#','admin','2026-01-04 11:55:15','',NULL,'');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES (1,'温馨提醒：2018-07-01 若依新版本发布啦','2',_binary '新版本内容','0','admin','2025-12-24 19:30:48','',NULL,'管理员'),(2,'维护通知：2018-07-01 若依系统凌晨维护','1',_binary '维护内容','0','admin','2025-12-24 19:30:48','',NULL,'管理员');
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB AUTO_INCREMENT=336 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` VALUES (100,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/admin/term/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"学期管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"admin/term\",\"perms\":\"edu:admin:term:list\",\"status\":\"0\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-04 08:48:25',84),(101,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/admin/term/index\",\"createTime\":\"2026-01-04 08:48:25\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2205,\"menuName\":\"学期管理\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":2000,\"path\":\"admin/term\",\"perms\":\"edu:admin:term:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-04 08:49:07',55),(102,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/admin/term/index\",\"createTime\":\"2026-01-04 08:48:25\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2205,\"menuName\":\"学期管理\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":2000,\"path\":\"admin/term\",\"perms\":\"edu:admin:term:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-04 08:49:13',32),(103,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/admin/course/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"课程管理\",\"menuType\":\"C\",\"orderNum\":8,\"params\":{},\"parentId\":2000,\"path\":\"admin/course\",\"perms\":\"edu:admin:course:list\",\"status\":\"0\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-04 08:49:58',29),(104,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/admin/courseClass/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"教学班管理\",\"menuType\":\"C\",\"orderNum\":9,\"params\":{},\"parentId\":2000,\"path\":\"admin/courseClass\",\"perms\":\"edu:admin:courseClass:list\",\"status\":\"0\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-04 08:50:37',28),(105,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/admin/creditRule/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"学分规则\",\"menuType\":\"C\",\"orderNum\":10,\"params\":{},\"parentId\":2000,\"path\":\"admin/creditRule\",\"perms\":\"edu:admin:creditRule:list\",\"status\":\"0\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-04 08:51:13',37),(106,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'admin','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":1} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-04 09:38:03',289),(107,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'admin','研发部门','/edu/student/drop/6','127.0.0.1','内网IP','6 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-04 09:38:58',95),(108,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2026-01-04 00:06:37\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"教务管理\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"edu\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-04 11:14:30',106),(109,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2026-01-04 00:06:37\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"教务管理\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"edu\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-04 11:15:24',54),(110,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2026-01-04 00:06:37\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"教务管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"edu\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-04 11:15:37',60),(111,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2025-12-24 19:30:46\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-04 11:15:44',53),(112,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2026-01-04 00:06:37\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"教务管理\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"edu\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-04 11:16:50',52),(113,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2026-01-04 00:06:37\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"教务管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"edu\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-04 11:16:53',47),(114,'在线用户',7,'com.ruoyi.web.controller.monitor.SysUserOnlineController.forceLogout()','DELETE',1,'admin','研发部门','/monitor/online/5f2949e4-2729-421c-9a44-a28d8ea79c55','127.0.0.1','内网IP','\"5f2949e4-2729-421c-9a44-a28d8ea79c55\" ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-04 11:19:20',9),(115,'在线用户',7,'com.ruoyi.web.controller.monitor.SysUserOnlineController.forceLogout()','DELETE',1,'admin','研发部门','/monitor/online/d1ca60b7-d697-42df-8cb8-db2c475ecbe1','127.0.0.1','内网IP','\"d1ca60b7-d697-42df-8cb8-db2c475ecbe1\" ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-04 11:19:23',3),(116,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2026-01-04 00:06:37\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"教务管理\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"edu\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-04 11:19:49',135),(117,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2026-01-04 00:06:37\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"教务管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"edu\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-04 11:20:13',64),(118,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2026-01-04 00:06:37\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"教务管理\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"edu\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-04 11:20:29',65),(119,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'admin','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":1} ','{\"msg\":\"选课失败：\\r\\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1-1\' for key \'enrollment.uk_student_class\'\\r\\n### The error may exist in URL [jar:file:/D:/code/school-teaching-system/backend/RuoYi-Vue/ruoyi-admin/target/ruoyi-admin.jar!/BOOT-INF/classes!/mapper/edu/student/EnrollmentMapper.xml]\\r\\n### The error may involve com.ruoyi.edu.student.mapper.EnrollmentMapper.insertEnrollment-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: insert into enrollment (         student_id, class_id, term_id, status,         grade, grade_status, enroll_time, drop_time,         create_by, create_time, update_by, update_time, remark         ) values (         ?, ?, ?, ?,         ?, ?, ?, ?,         ?, ?, ?, ?, ?         )\\r\\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1-1\' for key \'enrollment.uk_student_class\'\\n; Duplicate entry \'1-1\' for key \'enrollment.uk_student_class\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1-1\' for key \'enrollment.uk_student_class\'\",\"code\":500}',0,NULL,'2026-01-04 11:43:51',355),(120,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'admin','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":1} ','{\"msg\":\"选课失败：\\r\\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1-1\' for key \'enrollment.uk_student_class\'\\r\\n### The error may exist in URL [jar:file:/D:/code/school-teaching-system/backend/RuoYi-Vue/ruoyi-admin/target/ruoyi-admin.jar!/BOOT-INF/classes!/mapper/edu/student/EnrollmentMapper.xml]\\r\\n### The error may involve com.ruoyi.edu.student.mapper.EnrollmentMapper.insertEnrollment-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: insert into enrollment (         student_id, class_id, term_id, status,         grade, grade_status, enroll_time, drop_time,         create_by, create_time, update_by, update_time, remark         ) values (         ?, ?, ?, ?,         ?, ?, ?, ?,         ?, ?, ?, ?, ?         )\\r\\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1-1\' for key \'enrollment.uk_student_class\'\\n; Duplicate entry \'1-1\' for key \'enrollment.uk_student_class\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1-1\' for key \'enrollment.uk_student_class\'\",\"code\":500}',0,NULL,'2026-01-04 11:43:54',100),(121,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2001','研发部门','/edu/student/drop/1','127.0.0.1','内网IP','1 ','{\"msg\":\"成绩已发布，不能退课\",\"code\":500}',0,NULL,'2026-01-04 11:49:10',64),(122,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2001','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":2} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-04 11:49:12',139),(123,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2001','研发部门','/edu/student/drop/9','127.0.0.1','内网IP','9 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-04 11:49:14',75),(124,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2001','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":2} ','{\"msg\":\"选课失败：\\r\\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2001-2\' for key \'enrollment.uk_student_class\'\\r\\n### The error may exist in URL [jar:file:/D:/code/school-teaching-system/backend/RuoYi-Vue/ruoyi-admin/target/ruoyi-admin.jar!/BOOT-INF/classes!/mapper/edu/student/EnrollmentMapper.xml]\\r\\n### The error may involve com.ruoyi.edu.student.mapper.EnrollmentMapper.insertEnrollment-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: insert into enrollment (         student_id, class_id, term_id, status,         grade, grade_status, enroll_time, drop_time,         create_by, create_time, update_by, update_time, remark         ) values (         ?, ?, ?, ?,         ?, ?, ?, ?,         ?, ?, ?, ?, ?         )\\r\\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2001-2\' for key \'enrollment.uk_student_class\'\\n; Duplicate entry \'2001-2\' for key \'enrollment.uk_student_class\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2001-2\' for key \'enrollment.uk_student_class\'\",\"code\":500}',0,NULL,'2026-01-04 11:49:16',292),(125,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2001','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":2} ','{\"msg\":\"选课失败：\\r\\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2001-2\' for key \'enrollment.uk_student_class\'\\r\\n### The error may exist in URL [jar:file:/D:/code/school-teaching-system/backend/RuoYi-Vue/ruoyi-admin/target/ruoyi-admin.jar!/BOOT-INF/classes!/mapper/edu/student/EnrollmentMapper.xml]\\r\\n### The error may involve com.ruoyi.edu.student.mapper.EnrollmentMapper.insertEnrollment-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: insert into enrollment (         student_id, class_id, term_id, status,         grade, grade_status, enroll_time, drop_time,         create_by, create_time, update_by, update_time, remark         ) values (         ?, ?, ?, ?,         ?, ?, ?, ?,         ?, ?, ?, ?, ?         )\\r\\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2001-2\' for key \'enrollment.uk_student_class\'\\n; Duplicate entry \'2001-2\' for key \'enrollment.uk_student_class\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2001-2\' for key \'enrollment.uk_student_class\'\",\"code\":500}',0,NULL,'2026-01-04 11:49:17',94),(126,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2001','研发部门','/edu/student/drop/1','127.0.0.1','内网IP','1 ','{\"msg\":\"成绩已发布，不能退课\",\"code\":500}',0,NULL,'2026-01-04 11:49:19',15),(127,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2001','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":2} ','{\"msg\":\"选课失败：\\r\\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2001-2\' for key \'enrollment.uk_student_class\'\\r\\n### The error may exist in URL [jar:file:/D:/code/school-teaching-system/backend/RuoYi-Vue/ruoyi-admin/target/ruoyi-admin.jar!/BOOT-INF/classes!/mapper/edu/student/EnrollmentMapper.xml]\\r\\n### The error may involve com.ruoyi.edu.student.mapper.EnrollmentMapper.insertEnrollment-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: insert into enrollment (         student_id, class_id, term_id, status,         grade, grade_status, enroll_time, drop_time,         create_by, create_time, update_by, update_time, remark         ) values (         ?, ?, ?, ?,         ?, ?, ?, ?,         ?, ?, ?, ?, ?         )\\r\\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2001-2\' for key \'enrollment.uk_student_class\'\\n; Duplicate entry \'2001-2\' for key \'enrollment.uk_student_class\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2001-2\' for key \'enrollment.uk_student_class\'\",\"code\":500}',0,NULL,'2026-01-04 11:49:20',91),(128,'教学班',1,'com.ruoyi.edu.admin.controller.EduCourseClassController.add()','POST',1,'admin_edu','研发部门','/edu/admin/courseClass','127.0.0.1','内网IP','','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-04 12:12:52',127),(129,'课程',1,'com.ruoyi.edu.admin.controller.EduCourseController.add()','POST',1,'admin_edu','研发部门','/edu/admin/course','127.0.0.1','内网IP','{\"courseCode\":\"CS102\",\"courseId\":3,\"courseName\":\"操作系统\",\"courseType\":\"必修\",\"createTime\":\"2026-01-04 12:54:49\",\"creditHours\":4,\"params\":{}} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-04 12:54:49',78),(130,'教学班',2,'com.ruoyi.edu.admin.controller.EduCourseClassController.edit()','PUT',1,'admin_edu','研发部门','/edu/admin/courseClass','127.0.0.1','内网IP','{\"capacity\":60,\"classId\":3,\"courseId\":3,\"createBy\":\"\",\"createTime\":\"2026-01-04 12:12:52\",\"params\":{},\"remainingSeats\":60,\"remark\":\"\",\"selectedCount\":0,\"status\":1,\"teacherId\":1003,\"termId\":\"a_2024-2025-1\",\"updateBy\":\"\",\"updateTime\":\"2026-01-04 12:56:11\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-04 12:56:11',37),(131,'教学班',2,'com.ruoyi.edu.admin.controller.EduCourseClassController.edit()','PUT',1,'admin_edu','研发部门','/edu/admin/courseClass','127.0.0.1','内网IP','{\"capacity\":60,\"classId\":3,\"classTime\":\"星期一\",\"courseId\":3,\"createBy\":\"\",\"createTime\":\"2026-01-04 12:12:52\",\"params\":{},\"remainingSeats\":60,\"remark\":\"\",\"selectedCount\":0,\"status\":1,\"teacherId\":1003,\"termId\":\"a_2024-2025-1\",\"updateBy\":\"\",\"updateTime\":\"2026-01-04 12:57:45\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-04 12:57:45',33),(132,'教学班',2,'com.ruoyi.edu.admin.controller.EduCourseClassController.edit()','PUT',1,'admin_edu','研发部门','/edu/admin/courseClass','127.0.0.1','内网IP','{\"capacity\":60,\"classId\":3,\"classTime\":\"周一1-2节\",\"courseId\":3,\"createBy\":\"\",\"createTime\":\"2026-01-04 12:12:52\",\"params\":{},\"remainingSeats\":60,\"remark\":\"\",\"selectedCount\":0,\"status\":1,\"teacherId\":1003,\"termId\":\"a_2024-2025-1\",\"updateBy\":\"\",\"updateTime\":\"2026-01-04 12:58:05\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-04 12:58:05',24),(133,'教学班',2,'com.ruoyi.edu.admin.controller.EduCourseClassController.edit()','PUT',1,'admin_edu','研发部门','/edu/admin/courseClass','127.0.0.1','内网IP','{\"capacity\":60,\"classId\":3,\"classTime\":\"周一1-2节，周三5-6节\",\"courseId\":3,\"createBy\":\"\",\"createTime\":\"2026-01-04 12:12:52\",\"params\":{},\"remainingSeats\":60,\"remark\":\"\",\"selectedCount\":0,\"status\":1,\"teacherId\":1003,\"termId\":\"a_2024-2025-1\",\"updateBy\":\"\",\"updateTime\":\"2026-01-04 12:58:18\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-04 12:58:18',28),(134,'教学班',2,'com.ruoyi.edu.admin.controller.EduCourseClassController.edit()','PUT',1,'admin_edu','研发部门','/edu/admin/courseClass','127.0.0.1','内网IP','{\"capacity\":60,\"classId\":3,\"classTime\":\"周一1-2节，周三5-6节\",\"courseId\":3,\"createBy\":\"\",\"createTime\":\"2026-01-04 12:12:52\",\"location\":\"教学楼B\",\"params\":{},\"remainingSeats\":60,\"remark\":\"\",\"selectedCount\":0,\"status\":1,\"teacherId\":1003,\"termId\":\"a_2024-2025-1\",\"updateBy\":\"\",\"updateTime\":\"2026-01-04 12:58:31\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-04 12:58:31',21),(135,'教学班',2,'com.ruoyi.edu.admin.controller.EduCourseClassController.edit()','PUT',1,'admin_edu','研发部门','/edu/admin/courseClass','127.0.0.1','内网IP','{\"capacity\":60,\"classId\":3,\"classTime\":\"周一1-2节，周三5-6节\",\"courseId\":3,\"createBy\":\"\",\"createTime\":\"2026-01-04 12:12:52\",\"location\":\"教学楼B-202\",\"params\":{},\"remainingSeats\":60,\"remark\":\"\",\"selectedCount\":0,\"status\":1,\"teacherId\":1003,\"termId\":\"a_2024-2025-1\",\"updateBy\":\"\",\"updateTime\":\"2026-01-04 12:58:40\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-04 12:58:40',25),(136,'学期',1,'com.ruoyi.edu.admin.controller.EduTermController.add()','POST',1,'admin_edu','研发部门','/edu/admin/term','127.0.0.1','内网IP','{\"createTime\":\"2026-01-04 13:54:18\",\"enrollEnd\":\"2026-07-01 00:00:00\",\"enrollStart\":\"2026-03-02 00:00:00\",\"isActive\":0,\"params\":{},\"termId\":\"a_2025-2026-1\",\"termName\":\"2025-2026秋季学期\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-04 13:54:19',69),(137,'学期',2,'com.ruoyi.edu.admin.controller.EduTermController.edit()','PUT',1,'admin_edu','研发部门','/edu/admin/term','127.0.0.1','内网IP','{\"createBy\":\"\",\"createTime\":\"2026-01-04 13:54:19\",\"enrollEnd\":\"2026-07-01 00:00:00\",\"enrollStart\":\"2026-03-02 00:00:00\",\"isActive\":0,\"params\":{},\"remark\":\"\",\"termId\":\"a_2025-2026-1\",\"termName\":\"2025-2026秋季\",\"updateBy\":\"\",\"updateTime\":\"2026-01-04 13:54:27\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-04 13:54:27',26),(138,'教学班',1,'com.ruoyi.edu.admin.controller.EduCourseClassController.add()','POST',1,'admin_edu','研发部门','/edu/admin/courseClass','127.0.0.1','内网IP','','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-04 13:55:10',97),(139,'学分规则',1,'com.ruoyi.edu.admin.controller.EduCreditRuleController.add()','POST',1,'admin_edu','研发部门','/edu/admin/creditRule','127.0.0.1','内网IP','{\"createTime\":\"2026-01-04 13:56:58\",\"isActive\":1,\"maxCredits\":25,\"minCredits\":0,\"params\":{},\"ruleId\":3,\"ruleName\":\"春季学期\",\"termId\":\"a_2025-2026\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-04 13:56:58',49),(140,'学分规则',2,'com.ruoyi.edu.admin.controller.EduCreditRuleController.edit()','PUT',1,'admin_edu','研发部门','/edu/admin/creditRule','127.0.0.1','内网IP','{\"createBy\":\"\",\"createTime\":\"2026-01-04 13:56:59\",\"isActive\":1,\"maxCredits\":25,\"minCredits\":0,\"params\":{},\"remark\":\"\",\"ruleId\":3,\"ruleName\":\"春季学期\",\"termId\":\"a_2024-2025-2\",\"updateBy\":\"\",\"updateTime\":\"2026-01-04 13:57:18\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-04 13:57:18',30),(141,'学分规则',2,'com.ruoyi.edu.admin.controller.EduCreditRuleController.edit()','PUT',1,'admin_edu','研发部门','/edu/admin/creditRule','127.0.0.1','内网IP','{\"createBy\":\"\",\"createTime\":\"2026-01-04 13:56:59\",\"isActive\":1,\"maxCredits\":25,\"minCredits\":0,\"params\":{},\"remark\":\"\",\"ruleId\":3,\"ruleName\":\"春季学分上限\",\"termId\":\"a_2024-2025-2\",\"updateBy\":\"\",\"updateTime\":\"2026-01-04 13:57:32\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-04 13:57:32',26),(142,'学期',2,'com.ruoyi.edu.admin.controller.EduTermController.edit()','PUT',1,'admin_edu','研发部门','/edu/admin/term','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2026-01-04 09:25:12\",\"dropDeadline\":\"2026-05-04 09:25:12\",\"enrollEnd\":\"2026-04-18 09:25:12\",\"enrollStart\":\"2026-04-04 09:25:12\",\"isActive\":1,\"params\":{},\"remark\":\"\",\"termId\":\"a_2024-2025-2\",\"termName\":\"2024-2025春季\",\"updateBy\":\"\",\"updateTime\":\"2026-01-04 14:07:44\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-04 14:07:44',30),(143,'学期',2,'com.ruoyi.edu.admin.controller.EduTermController.edit()','PUT',1,'admin_edu','研发部门','/edu/admin/term','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2026-01-04 09:25:12\",\"dropDeadline\":\"2026-05-04 09:25:12\",\"enrollEnd\":\"2026-04-18 09:25:12\",\"enrollStart\":\"2026-04-04 09:25:12\",\"isActive\":0,\"params\":{},\"remark\":\"\",\"termId\":\"a_2024-2025-2\",\"termName\":\"2024-2025春季\",\"updateBy\":\"\",\"updateTime\":\"2026-01-04 14:07:50\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-04 14:07:50',28),(144,'教学班',2,'com.ruoyi.edu.admin.controller.EduCourseClassController.edit()','PUT',1,'admin_edu','研发部门','/edu/admin/courseClass','127.0.0.1','内网IP','{\"capacity\":50,\"classId\":5,\"courseId\":4,\"createBy\":\"\",\"createTime\":\"2026-01-04 13:55:10\",\"params\":{},\"remainingSeats\":50,\"remark\":\"\",\"selectedCount\":0,\"status\":1,\"teacherId\":1001,\"termId\":\"a_2025-2026_1\",\"updateBy\":\"\",\"updateTime\":\"2026-01-04 14:11:29\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-04 14:11:30',32),(145,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2001','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":2} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-04 15:26:36',357),(146,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2001','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":3} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-04 15:26:39',252),(147,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2001','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":5} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-04 15:26:55',253),(148,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2001','研发部门','/edu/student/drop/16','127.0.0.1','内网IP','16 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-04 15:26:56',84),(149,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2001','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":5} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-04 15:40:24',234),(150,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2001','研发部门','/edu/student/drop/16','127.0.0.1','内网IP','16 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-04 15:40:34',86),(151,'教学班',2,'com.ruoyi.edu.admin.controller.EduCourseClassController.edit()','PUT',1,'admin_edu','研发部门','/edu/admin/courseClass','127.0.0.1','内网IP','{\"capacity\":50,\"classId\":5,\"courseId\":4,\"createBy\":\"\",\"createTime\":\"2026-01-04 13:55:10\",\"params\":{},\"remainingSeats\":50,\"remark\":\"\",\"selectedCount\":0,\"status\":1,\"teacherId\":1001,\"termId\":\"a_2025-2026-1\",\"updateBy\":\"\",\"updateTime\":\"2026-01-04 15:43:49\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-04 15:43:49',41),(152,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2001','研发部门','/edu/student/drop/15','127.0.0.1','内网IP','15 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-04 16:30:32',138),(153,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2001','研发部门','/edu/student/drop/9','127.0.0.1','内网IP','9 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-04 16:30:33',77),(154,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2001','研发部门','/edu/student/drop/1','127.0.0.1','内网IP','1 ','{\"msg\":\"成绩已发布，不能退课\",\"code\":500}',0,NULL,'2026-01-04 16:30:34',21),(155,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2001','研发部门','/edu/student/drop/1','127.0.0.1','内网IP','1 ','{\"msg\":\"成绩已发布，不能退课\",\"code\":500}',0,NULL,'2026-01-04 16:30:36',23),(156,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2001','研发部门','/edu/student/drop/1','127.0.0.1','内网IP','1 ','{\"msg\":\"成绩已发布，不能退课\",\"code\":500}',0,NULL,'2026-01-04 19:56:21',16),(157,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2002','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":2} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-04 19:56:44',51),(158,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2001','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":2} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-04 20:00:03',86),(159,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2001','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":3} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-04 20:00:05',82),(160,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2001','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":5} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-04 20:00:06',68),(161,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2001','研发部门','/edu/student/drop/15','127.0.0.1','内网IP','15 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-04 20:00:08',36),(162,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2001','研发部门','/edu/student/drop/1','127.0.0.1','内网IP','1 ','{\"msg\":\"成绩已发布，不能退课\",\"code\":500}',0,NULL,'2026-01-04 20:00:09',8),(163,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2001','研发部门','/edu/student/drop/9','127.0.0.1','内网IP','9 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-04 20:00:11',25),(164,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2001','研发部门','/edu/student/drop/16','127.0.0.1','内网IP','16 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-04 20:00:11',33),(165,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/student/course/index\",\"createTime\":\"2026-01-04 00:06:37\",\"icon\":\"excel\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"可选课程\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"student/course\",\"perms\":\"edu:student:course\",\"query\":\"\",\"routeName\":\"StudentCourse\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-05 00:53:53',82),(166,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/student/timetable/index\",\"createTime\":\"2026-01-04 00:06:37\",\"icon\":\"form\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"我的课表\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"student/timetable\",\"perms\":\"edu:student:timetable\",\"query\":\"\",\"routeName\":\"StudentTimetable\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-05 00:54:06',61),(167,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/student/grades/index\",\"createTime\":\"2026-01-04 00:06:37\",\"icon\":\"star\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"成绩查询\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"student/grades\",\"perms\":\"edu:student:grades\",\"query\":\"\",\"routeName\":\"StudentGrades\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-05 00:54:23',58),(168,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/teacher/classes/index\",\"createTime\":\"2026-01-04 00:06:37\",\"icon\":\"more-up\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"我的班级\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"teacher/classes\",\"perms\":\"edu:teacher:classes\",\"query\":\"\",\"routeName\":\"TeacherClasses\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-05 00:54:34',59),(169,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/admin/term/index\",\"createTime\":\"2026-01-04 08:48:25\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2205,\"menuName\":\"学期管理\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"admin/term\",\"perms\":\"edu:admin:term:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-05 00:54:49',59),(170,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/admin/course/index\",\"createTime\":\"2026-01-04 08:49:58\",\"icon\":\"date\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2206,\"menuName\":\"课程管理\",\"menuType\":\"C\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"admin/course\",\"perms\":\"edu:admin:course:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-05 00:54:58',58),(171,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/admin/courseClass/index\",\"createTime\":\"2026-01-04 08:50:37\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2207,\"menuName\":\"教学班管理\",\"menuType\":\"C\",\"orderNum\":9,\"params\":{},\"parentId\":0,\"path\":\"admin/courseClass\",\"perms\":\"edu:admin:courseClass:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-05 00:55:04',58),(172,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/admin/creditRule/index\",\"createTime\":\"2026-01-04 08:51:13\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2208,\"menuName\":\"学分规则\",\"menuType\":\"C\",\"orderNum\":10,\"params\":{},\"parentId\":0,\"path\":\"admin/creditRule\",\"perms\":\"edu:admin:creditRule:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-05 00:55:14',60),(173,'批量录入成绩',2,'com.ruoyi.edu.student.controller.EduTeacherController.batchUpdateGrades()','POST',1,'b_teacher1003','研发部门','/edu/teacher/grades/batch','127.0.0.1','内网IP','[{\"enrollmentId\":81,\"grade\":90,\"gradeStatus\":\"DRAFT\"}] ','{\"msg\":\"成绩更新成功（开发模式）\",\"code\":200}',0,NULL,'2026-01-05 01:10:07',51),(174,'发布成绩',2,'com.ruoyi.edu.student.controller.EduTeacherController.publishGrades()','POST',1,'b_teacher1003','研发部门','/edu/teacher/grades/publish','127.0.0.1','内网IP','{\"classId\":34} ','{\"msg\":\"成绩发布成功（开发模式）\",\"code\":200}',0,NULL,'2026-01-05 01:10:07',44),(175,'批量录入成绩',2,'com.ruoyi.edu.student.controller.EduTeacherController.batchUpdateGrades()','POST',1,'b_teacher1003','研发部门','/edu/teacher/grades/batch','127.0.0.1','内网IP','[{\"enrollmentId\":15,\"grade\":100,\"gradeStatus\":\"DRAFT\"},{\"enrollmentId\":88,\"grade\":50,\"gradeStatus\":\"DRAFT\"},{\"enrollmentId\":91,\"grade\":1,\"gradeStatus\":\"DRAFT\"}] ','{\"msg\":\"成绩更新成功（开发模式）\",\"code\":200}',0,NULL,'2026-01-05 01:10:26',103),(176,'发布成绩',2,'com.ruoyi.edu.student.controller.EduTeacherController.publishGrades()','POST',1,'b_teacher1003','研发部门','/edu/teacher/grades/publish','127.0.0.1','内网IP','{\"classId\":3} ','{\"msg\":\"成绩发布成功（开发模式）\",\"code\":200}',0,NULL,'2026-01-05 01:10:26',73),(177,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2001','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":36} ','{\"msg\":\"超过学分上限，无法选课\",\"code\":500}',0,NULL,'2026-01-05 01:23:18',41),(178,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2001','研发部门','/edu/student/drop/82','127.0.0.1','内网IP','82 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-05 01:23:20',37),(179,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2001','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":36} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-05 01:23:21',55),(180,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2001','研发部门','/edu/student/drop/83','127.0.0.1','内网IP','83 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-05 01:23:24',60),(181,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2001','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":36} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-05 01:23:25',145),(182,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2001','研发部门','/edu/student/drop/83','127.0.0.1','内网IP','83 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-05 01:23:27',69),(183,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2001','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":35} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-05 01:23:28',173),(184,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2001','研发部门','/edu/student/drop/82','127.0.0.1','内网IP','82 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-05 01:23:29',40),(185,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2001','研发部门','/edu/student/drop/80','127.0.0.1','内网IP','80 ','{\"msg\":\"成绩已发布，不能退课\",\"code\":500}',0,NULL,'2026-01-05 01:23:30',16),(186,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2001','研发部门','/edu/student/drop/81','127.0.0.1','内网IP','81 ','{\"msg\":\"成绩已发布，不能退课\",\"code\":500}',0,NULL,'2026-01-05 01:23:31',16),(187,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2001','研发部门','/edu/student/drop/74','127.0.0.1','内网IP','74 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-05 01:23:34',64),(188,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2001','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":15} ','{\"msg\":\"与已有课程时间冲突\",\"code\":500}',0,NULL,'2026-01-05 17:31:16',235),(189,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2001','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":16} ','{\"msg\":\"与已有课程时间冲突\",\"code\":500}',0,NULL,'2026-01-05 17:31:19',176),(190,'批量录入成绩',2,'com.ruoyi.edu.student.controller.EduTeacherController.batchUpdateGrades()','POST',1,'b_teacher1001','研发部门','/edu/teacher/grades/batch','127.0.0.1','内网IP','[] ','{\"msg\":\"成绩更新数据不能为空\",\"code\":500}',0,NULL,'2026-01-05 17:32:36',1),(191,'批量录入成绩',2,'com.ruoyi.edu.student.controller.EduTeacherController.batchUpdateGrades()','POST',1,'b_teacher1001','研发部门','/edu/teacher/grades/batch','127.0.0.1','内网IP','[{\"enrollmentId\":4,\"grade\":100,\"gradeStatus\":\"PUBLISHED\"},{\"enrollmentId\":5,\"grade\":62,\"gradeStatus\":\"PUBLISHED\"},{\"enrollmentId\":9,\"grade\":6,\"gradeStatus\":\"PUBLISHED\"},{\"enrollmentId\":70,\"grade\":9,\"gradeStatus\":\"PUBLISHED\"},{\"enrollmentId\":90,\"grade\":0,\"gradeStatus\":\"PUBLISHED\"}] ','{\"msg\":\"成绩更新成功（开发模式）\",\"code\":200}',0,NULL,'2026-01-05 17:32:44',248),(192,'发布成绩',2,'com.ruoyi.edu.student.controller.EduTeacherController.publishGrades()','POST',1,'b_teacher1001','研发部门','/edu/teacher/grades/publish','127.0.0.1','内网IP','{\"classId\":2} ','{\"msg\":\"成绩发布成功（开发模式）\",\"code\":200}',0,NULL,'2026-01-05 17:32:44',163),(193,'学期',2,'com.ruoyi.edu.admin.controller.EduTermController.edit()','PUT',1,'admin_edu','研发部门','/edu/admin/term','127.0.0.1','内网IP','{\"createBy\":\"\",\"createTime\":\"2026-01-04 20:51:49\",\"enrollEnd\":\"2026-07-01 00:00:00\",\"enrollStart\":\"2026-03-01 00:00:00\",\"isActive\":0,\"params\":{},\"remark\":\"\",\"termId\":\"2025-2026-spring\",\"termName\":\"2025-2026春季\",\"updateBy\":\"\",\"updateTime\":\"2026-01-05 22:11:25\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-05 22:11:25',133),(194,'学期',2,'com.ruoyi.edu.admin.controller.EduTermController.edit()','PUT',1,'admin_edu','研发部门','/edu/admin/term','127.0.0.1','内网IP','{\"createBy\":\"\",\"createTime\":\"2026-01-04 20:51:49\",\"enrollEnd\":\"2026-02-01 00:00:00\",\"enrollStart\":\"2025-09-01 00:00:00\",\"isActive\":1,\"params\":{},\"remark\":\"\",\"termId\":\"2025-2026-fall\",\"termName\":\"2025-2026秋季\",\"updateBy\":\"\",\"updateTime\":\"2026-01-05 22:11:30\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-05 22:11:30',63),(195,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2001','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":38} ','{\"msg\":\"同一学期不能选多个同一课程号的课程\",\"code\":500}',0,NULL,'2026-01-05 22:12:12',98),(196,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2001','研发部门','/edu/student/drop/15','127.0.0.1','内网IP','15 ','{\"msg\":\"成绩已发布，不能退课\",\"code\":500}',0,NULL,'2026-01-05 22:12:27',20),(197,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2001','研发部门','/edu/student/drop/15','127.0.0.1','内网IP','15 ','{\"msg\":\"成绩已发布，不能退课\",\"code\":500}',0,NULL,'2026-01-05 22:12:29',20),(198,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2001','研发部门','/edu/student/drop/9','127.0.0.1','内网IP','9 ','{\"msg\":\"成绩已发布，不能退课\",\"code\":500}',0,NULL,'2026-01-05 22:12:33',19),(199,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2001','研发部门','/edu/student/drop/15','127.0.0.1','内网IP','15 ','{\"msg\":\"成绩已发布，不能退课\",\"code\":500}',0,NULL,'2026-01-05 22:12:35',22),(200,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2002','研发部门','/edu/student/drop/88','127.0.0.1','内网IP','88 ','{\"msg\":\"成绩已发布，不能退课\",\"code\":500}',0,NULL,'2026-01-05 22:13:41',19),(201,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2002','研发部门','/edu/student/drop/89','127.0.0.1','内网IP','89 ','{\"msg\":\"成绩已发布，不能退课\",\"code\":500}',0,NULL,'2026-01-05 22:13:44',16),(202,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2002','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":38} ','{\"msg\":\"同一学期不能选多个同一课程号的课程\",\"code\":500}',0,NULL,'2026-01-05 22:13:53',105),(203,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2001','研发部门','/edu/student/drop/15','127.0.0.1','内网IP','15 ','{\"msg\":\"成绩已发布，不能退课\",\"code\":500}',0,NULL,'2026-01-05 22:17:47',19),(204,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2001','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":38} ','{\"msg\":\"同一学期不能选多个同一课程号的课程\",\"code\":500}',0,NULL,'2026-01-05 22:17:51',113),(205,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2001','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":38} ','{\"msg\":\"同一学期不能选多个同一课程号的课程\",\"code\":500}',0,NULL,'2026-01-05 22:17:56',93),(206,'学期',2,'com.ruoyi.edu.admin.controller.EduTermController.edit()','PUT',1,'admin_edu','研发部门','/edu/admin/term','127.0.0.1','内网IP','{\"createBy\":\"\",\"createTime\":\"2026-01-04 20:51:49\",\"enrollEnd\":\"2026-02-01 00:00:00\",\"enrollStart\":\"2025-09-01 00:00:00\",\"isActive\":0,\"params\":{},\"remark\":\"\",\"termId\":\"2025-2026-fall\",\"termName\":\"2025-2026秋季\",\"updateBy\":\"\",\"updateTime\":\"2026-01-05 22:19:38\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-05 22:19:38',30),(207,'学期',2,'com.ruoyi.edu.admin.controller.EduTermController.edit()','PUT',1,'admin_edu','研发部门','/edu/admin/term','127.0.0.1','内网IP','{\"createBy\":\"\",\"createTime\":\"2026-01-04 20:51:49\",\"enrollEnd\":\"2026-07-01 00:00:00\",\"enrollStart\":\"2026-03-01 00:00:00\",\"isActive\":1,\"params\":{},\"remark\":\"\",\"termId\":\"2025-2026-spring\",\"termName\":\"2025-2026春季\",\"updateBy\":\"\",\"updateTime\":\"2026-01-05 22:19:41\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-05 22:19:41',58),(208,'学期',2,'com.ruoyi.edu.admin.controller.EduTermController.edit()','PUT',1,'admin_edu','研发部门','/edu/admin/term','127.0.0.1','内网IP','{\"createBy\":\"\",\"createTime\":\"2026-01-04 20:51:49\",\"enrollEnd\":\"2026-02-01 00:00:00\",\"enrollStart\":\"2025-09-01 00:00:00\",\"isActive\":1,\"params\":{},\"remark\":\"\",\"termId\":\"2025-2026-fall\",\"termName\":\"2025-2026秋季\",\"updateBy\":\"\",\"updateTime\":\"2026-01-05 22:26:21\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-05 22:26:21',56),(209,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2004','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":40} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-05 22:26:46',263),(210,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2005','研发部门','/edu/student/drop/108','127.0.0.1','内网IP','108 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-05 22:27:26',43),(211,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2005','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":40} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-05 22:27:33',231),(212,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2005','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":40} ','{\"msg\":\"已选该课程，不能重复选课\",\"code\":500}',0,NULL,'2026-01-05 22:27:36',49),(213,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2005','研发部门','/edu/student/drop/109','127.0.0.1','内网IP','109 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-05 22:27:40',43),(214,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2005','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":40} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-05 22:27:42',260),(215,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2005','研发部门','/edu/student/drop/109','127.0.0.1','内网IP','109 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-05 22:27:42',35),(216,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2005','研发部门','/edu/student/drop/109','127.0.0.1','内网IP','109 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-05 22:27:49',46),(217,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2005','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":40} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-05 22:28:00',271),(218,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2005','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":40} ','{\"msg\":\"已选该课程，不能重复选课\",\"code\":500}',0,NULL,'2026-01-05 22:28:02',42),(219,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2005','研发部门','/edu/student/drop/109','127.0.0.1','内网IP','109 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-05 22:28:11',48),(220,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2005','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":40} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-05 22:28:12',223),(221,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2005','研发部门','/edu/student/drop/109','127.0.0.1','内网IP','109 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-05 22:28:18',41),(222,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2005','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":40} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-05 22:28:19',349),(223,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2005','研发部门','/edu/student/drop/109','127.0.0.1','内网IP','109 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-05 22:37:55',35),(224,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2005','研发部门','/edu/student/drop/109','127.0.0.1','内网IP','109 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-05 22:37:58',36),(225,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2005','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":40} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-05 22:38:09',260),(226,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2005','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":40} ','{\"msg\":\"已选该课程，不能重复选课\",\"code\":500}',0,NULL,'2026-01-05 22:38:12',32),(227,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2005','研发部门','/edu/student/drop/109','127.0.0.1','内网IP','109 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-05 22:38:14',36),(228,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2005','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":40} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-05 22:38:15',284),(229,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2005','研发部门','/edu/student/drop/109','127.0.0.1','内网IP','109 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-05 22:38:17',40),(230,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2005','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":39} ','{\"msg\":\"选课失败：\\r\\n### Error updating database.  Cause: java.sql.SQLException: 閫夎?澶辫触锛氳?鏁欏?鐝?凡婊″憳\\r\\n### The error may exist in file [D:\\\\code\\\\school-teaching-system\\\\backend\\\\RuoYi-Vue\\\\ruoyi-admin\\\\target\\\\classes\\\\mapper\\\\edu\\\\student\\\\EnrollmentMapper.xml]\\r\\n### The error may involve com.ruoyi.edu.student.mapper.EnrollmentMapper.insertEnrollment-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: insert into enrollment (         student_id, class_id, term_id, status,         grade, grade_status, enroll_time, drop_time,         create_by, create_time, update_by, update_time, remark         ) values (         ?, ?, ?, ?,         ?, ?, ?, ?,         ?, ?, ?, ?, ?         )\\r\\n### Cause: java.sql.SQLException: 閫夎?澶辫触锛氳?鏁欏?鐝?凡婊″憳\\n; uncategorized SQLException; SQL state [45000]; error code [1644]; 閫夎?澶辫触锛氳?鏁欏?鐝?凡婊″憳; nested exception is java.sql.SQLException: 閫夎?澶辫触锛氳?鏁欏?鐝?凡婊″憳\",\"code\":500}',0,NULL,'2026-01-05 22:39:24',1240),(231,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2005','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":40} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-05 22:40:07',387),(232,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2005','研发部门','/edu/student/drop/109','127.0.0.1','内网IP','109 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-05 22:40:11',48),(233,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2005','研发部门','/edu/student/drop/109','127.0.0.1','内网IP','109 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-05 22:40:14',86),(234,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2005','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":39} ','{\"msg\":\"选课失败：\\r\\n### Error updating database.  Cause: java.sql.SQLException: 閫夎?澶辫触锛氳?鏁欏?鐝?凡婊″憳\\r\\n### The error may exist in file [D:\\\\code\\\\school-teaching-system\\\\backend\\\\RuoYi-Vue\\\\ruoyi-admin\\\\target\\\\classes\\\\mapper\\\\edu\\\\student\\\\EnrollmentMapper.xml]\\r\\n### The error may involve com.ruoyi.edu.student.mapper.EnrollmentMapper.insertEnrollment-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: insert into enrollment (         student_id, class_id, term_id, status,         grade, grade_status, enroll_time, drop_time,         create_by, create_time, update_by, update_time, remark         ) values (         ?, ?, ?, ?,         ?, ?, ?, ?,         ?, ?, ?, ?, ?         )\\r\\n### Cause: java.sql.SQLException: 閫夎?澶辫触锛氳?鏁欏?鐝?凡婊″憳\\n; uncategorized SQLException; SQL state [45000]; error code [1644]; 閫夎?澶辫触锛氳?鏁欏?鐝?凡婊″憳; nested exception is java.sql.SQLException: 閫夎?澶辫触锛氳?鏁欏?鐝?凡婊″憳\",\"code\":500}',0,NULL,'2026-01-05 22:40:15',361),(235,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2005','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":39} ','{\"msg\":\"选课失败：\\r\\n### Error updating database.  Cause: java.sql.SQLException: 閫夎?澶辫触锛氳?鏁欏?鐝?凡婊″憳\\r\\n### The error may exist in file [D:\\\\code\\\\school-teaching-system\\\\backend\\\\RuoYi-Vue\\\\ruoyi-admin\\\\target\\\\classes\\\\mapper\\\\edu\\\\student\\\\EnrollmentMapper.xml]\\r\\n### The error may involve com.ruoyi.edu.student.mapper.EnrollmentMapper.insertEnrollment-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: insert into enrollment (         student_id, class_id, term_id, status,         grade, grade_status, enroll_time, drop_time,         create_by, create_time, update_by, update_time, remark         ) values (         ?, ?, ?, ?,         ?, ?, ?, ?,         ?, ?, ?, ?, ?         )\\r\\n### Cause: java.sql.SQLException: 閫夎?澶辫触锛氳?鏁欏?鐝?凡婊″憳\\n; uncategorized SQLException; SQL state [45000]; error code [1644]; 閫夎?澶辫触锛氳?鏁欏?鐝?凡婊″憳; nested exception is java.sql.SQLException: 閫夎?澶辫触锛氳?鏁欏?鐝?凡婊″憳\",\"code\":500}',0,NULL,'2026-01-05 22:40:21',286),(236,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2005','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":39} ','{\"msg\":\"选课失败：\\r\\n### Error updating database.  Cause: java.sql.SQLException: 閫夎?澶辫触锛氳?鏁欏?鐝?凡婊″憳\\r\\n### The error may exist in file [D:\\\\code\\\\school-teaching-system\\\\backend\\\\RuoYi-Vue\\\\ruoyi-admin\\\\target\\\\classes\\\\mapper\\\\edu\\\\student\\\\EnrollmentMapper.xml]\\r\\n### The error may involve com.ruoyi.edu.student.mapper.EnrollmentMapper.insertEnrollment-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: insert into enrollment (         student_id, class_id, term_id, status,         grade, grade_status, enroll_time, drop_time,         create_by, create_time, update_by, update_time, remark         ) values (         ?, ?, ?, ?,         ?, ?, ?, ?,         ?, ?, ?, ?, ?         )\\r\\n### Cause: java.sql.SQLException: 閫夎?澶辫触锛氳?鏁欏?鐝?凡婊″憳\\n; uncategorized SQLException; SQL state [45000]; error code [1644]; 閫夎?澶辫触锛氳?鏁欏?鐝?凡婊″憳; nested exception is java.sql.SQLException: 閫夎?澶辫触锛氳?鏁欏?鐝?凡婊″憳\",\"code\":500}',0,NULL,'2026-01-05 22:40:28',443),(237,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2005','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":40} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-05 22:41:27',410),(238,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2005','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":40} ','{\"msg\":\"已选该课程，不能重复选课\",\"code\":500}',0,NULL,'2026-01-05 22:41:31',61),(239,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2005','研发部门','/edu/student/drop/109','127.0.0.1','内网IP','109 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-05 22:41:36',40),(240,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2005','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":40} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-05 22:41:37',295),(241,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2005','研发部门','/edu/student/drop/109','127.0.0.1','内网IP','109 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-05 22:41:38',47),(242,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2005','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":40} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-05 22:41:44',322),(243,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2005','研发部门','/edu/student/drop/109','127.0.0.1','内网IP','109 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-05 22:41:46',47),(244,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2005','研发部门','/edu/student/drop/109','127.0.0.1','内网IP','109 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-05 22:41:49',78),(245,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2005','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":40} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-05 22:41:51',374),(246,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2005','研发部门','/edu/student/drop/109','127.0.0.1','内网IP','109 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-05 22:41:55',94),(247,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2005','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":40} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-05 22:41:56',342),(248,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2005','研发部门','/edu/student/drop/109','127.0.0.1','内网IP','109 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-05 22:42:02',40),(249,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2005','研发部门','/edu/student/drop/109','127.0.0.1','内网IP','109 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-05 22:42:04',255),(250,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2005','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":40} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-05 22:42:11',350),(251,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2002','研发部门','/edu/student/drop/109','127.0.0.1','内网IP','109 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-05 22:42:41',39),(252,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2002','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":39} ','{\"msg\":\"选课失败：\\r\\n### Error updating database.  Cause: java.sql.SQLException: 閫夎?澶辫触锛氳?鏁欏?鐝?凡婊″憳\\r\\n### The error may exist in file [D:\\\\code\\\\school-teaching-system\\\\backend\\\\RuoYi-Vue\\\\ruoyi-admin\\\\target\\\\classes\\\\mapper\\\\edu\\\\student\\\\EnrollmentMapper.xml]\\r\\n### The error may involve com.ruoyi.edu.student.mapper.EnrollmentMapper.insertEnrollment-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: insert into enrollment (         student_id, class_id, term_id, status,         grade, grade_status, enroll_time, drop_time,         create_by, create_time, update_by, update_time, remark         ) values (         ?, ?, ?, ?,         ?, ?, ?, ?,         ?, ?, ?, ?, ?         )\\r\\n### Cause: java.sql.SQLException: 閫夎?澶辫触锛氳?鏁欏?鐝?凡婊″憳\\n; uncategorized SQLException; SQL state [45000]; error code [1644]; 閫夎?澶辫触锛氳?鏁欏?鐝?凡婊″憳; nested exception is java.sql.SQLException: 閫夎?澶辫触锛氳?鏁欏?鐝?凡婊″憳\",\"code\":500}',0,NULL,'2026-01-05 22:42:48',309),(253,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2002','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":40} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-05 22:42:50',287),(254,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2002','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":40} ','{\"msg\":\"已选该课程，不能重复选课\",\"code\":500}',0,NULL,'2026-01-05 22:42:52',44),(255,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2002','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":39} ','{\"msg\":\"课程容量已满，无法选课\",\"code\":500}',0,NULL,'2026-01-05 23:20:19',776),(256,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2002','研发部门','/edu/student/drop/110','127.0.0.1','内网IP','110 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-05 23:20:21',53),(257,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2002','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":40} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-05 23:20:36',484),(258,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2002','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":40} ','{\"msg\":\"已选该课程，不能重复选课\",\"code\":500}',0,NULL,'2026-01-05 23:20:38',52),(259,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2002','研发部门','/edu/student/drop/110','127.0.0.1','内网IP','110 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-05 23:20:41',45),(260,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2002','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":40} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-05 23:20:43',313),(261,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2002','研发部门','/edu/student/drop/110','127.0.0.1','内网IP','110 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-05 23:20:44',42),(262,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2002','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":40} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-05 23:20:45',375),(263,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2004','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":40} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-05 23:22:33',308),(264,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2002','研发部门','/edu/student/drop/110','127.0.0.1','内网IP','110 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-05 23:38:56',97),(265,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2002','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":40} ','{\"msg\":\"课程容量已满，无法选课\",\"code\":500}',0,NULL,'2026-01-05 23:38:58',20),(266,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2006','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":40} ','{\"msg\":\"课程容量已满，无法选课\",\"code\":500}',0,NULL,'2026-01-05 23:39:19',19),(267,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2004','研发部门','/edu/student/drop/108','127.0.0.1','内网IP','108 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-05 23:39:32',50),(268,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2004','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":40} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-05 23:39:34',469),(269,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2004','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":39} ','{\"msg\":\"课程容量已满，无法选课\",\"code\":500}',0,NULL,'2026-01-05 23:39:38',20),(270,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2004','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":40} ','{\"msg\":\"课程容量已满，无法选课\",\"code\":500}',0,NULL,'2026-01-05 23:39:42',20),(271,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2004','研发部门','/edu/student/drop/108','127.0.0.1','内网IP','108 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-05 23:39:48',41),(272,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2004','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":40} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-05 23:39:50',390),(273,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2004','研发部门','/edu/student/drop/108','127.0.0.1','内网IP','108 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-05 23:39:51',40),(274,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2004','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":40} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-05 23:41:22',317),(275,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2002','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":40} ','{\"msg\":\"课程容量已满，无法选课\",\"code\":500}',0,NULL,'2026-01-05 23:41:26',18),(276,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2004','研发部门','/edu/student/drop/108','127.0.0.1','内网IP','108 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-05 23:41:30',42),(277,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2002','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":40} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-05 23:41:33',280),(278,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2002','研发部门','/edu/student/drop/110','127.0.0.1','内网IP','110 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-05 23:41:34',46),(279,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2002','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":40} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-05 23:41:36',232),(280,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2004','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":40} ','{\"msg\":\"课程容量已满，无法选课\",\"code\":500}',0,NULL,'2026-01-05 23:41:38',22),(281,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2004','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":3} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-05 23:42:14',384),(282,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2004','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":17} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-05 23:42:16',402),(283,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2004','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":20} ','{\"msg\":\"同一学期不能选多个同一课程号的课程\",\"code\":500}',0,NULL,'2026-01-05 23:42:18',129),(284,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2004','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":23} ','{\"msg\":\"与已有课程时间冲突\",\"code\":500}',0,NULL,'2026-01-05 23:42:21',252),(285,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2004','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":24} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-05 23:42:23',290),(286,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2004','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":28} ','{\"msg\":\"与已有课程时间冲突\",\"code\":500}',0,NULL,'2026-01-05 23:42:24',171),(287,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2004','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":29} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-05 23:42:25',306),(288,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2004','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":30} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-05 23:42:26',332),(289,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2004','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":31} ','{\"msg\":\"与已有课程时间冲突\",\"code\":500}',0,NULL,'2026-01-05 23:42:29',162),(290,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2004','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":39} ','{\"msg\":\"课程容量已满，无法选课\",\"code\":500}',0,NULL,'2026-01-05 23:42:31',18),(291,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2004','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":40} ','{\"msg\":\"课程容量已满，无法选课\",\"code\":500}',0,NULL,'2026-01-05 23:42:32',20),(292,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2004','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":1} ','{\"msg\":\"同一学期不能选多个同一课程号的课程\",\"code\":500}',0,NULL,'2026-01-05 23:42:34',81),(293,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2002','研发部门','/edu/student/drop/110','127.0.0.1','内网IP','110 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-05 23:46:39',40),(294,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2002','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":40} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-05 23:46:40',308),(295,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2002','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":39} ','{\"msg\":\"课程容量已满，无法选课\",\"code\":500}',0,NULL,'2026-01-05 23:46:41',18),(296,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2004','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":40} ','{\"msg\":\"课程容量已满，无法选课\",\"code\":500}',0,NULL,'2026-01-05 23:46:48',15),(297,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2002','研发部门','/edu/student/drop/110','127.0.0.1','内网IP','110 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-05 23:46:51',48),(298,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2004','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":40} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-05 23:46:54',281),(299,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2002','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":40} ','{\"msg\":\"课程容量已满，无法选课\",\"code\":500}',0,NULL,'2026-01-05 23:46:57',20),(300,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2002','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":40} ','{\"msg\":\"课程容量已满，无法选课\",\"code\":500}',0,NULL,'2026-01-05 23:47:06',16),(301,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2004','研发部门','/edu/student/drop/108','127.0.0.1','内网IP','108 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-05 23:47:11',37),(302,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2002','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":40} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-05 23:47:14',296),(303,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2002','研发部门','/edu/student/drop/110','127.0.0.1','内网IP','110 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-05 23:47:15',39),(304,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2004','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":40} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-05 23:47:20',289),(305,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2002','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":40} ','{\"msg\":\"课程容量已满，无法选课\",\"code\":500}',0,NULL,'2026-01-05 23:47:27',17),(306,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2004','研发部门','/edu/student/drop/108','127.0.0.1','内网IP','108 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-05 23:47:36',40),(307,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2002','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":40} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-05 23:47:40',273),(308,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2004','研发部门','/edu/student/drop/4','127.0.0.1','内网IP','4 ','{\"msg\":\"成绩已发布，不能退课\",\"code\":500}',0,NULL,'2026-01-05 23:48:38',17),(309,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2004','研发部门','/edu/student/drop/111','127.0.0.1','内网IP','111 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-05 23:48:39',35),(310,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2004','研发部门','/edu/student/drop/112','127.0.0.1','内网IP','112 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-05 23:48:41',35),(311,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2004','研发部门','/edu/student/drop/113','127.0.0.1','内网IP','113 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-05 23:48:42',35),(312,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2004','研发部门','/edu/student/drop/114','127.0.0.1','内网IP','114 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-05 23:48:42',37),(313,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2004','研发部门','/edu/student/drop/115','127.0.0.1','内网IP','115 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-05 23:48:44',32),(314,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2001','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":40} ','{\"msg\":\"课程容量已满，无法选课\",\"code\":500}',0,NULL,'2026-01-06 00:15:47',15),(315,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2001','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":39} ','{\"msg\":\"课程容量已满，无法选课\",\"code\":500}',0,NULL,'2026-01-06 00:15:52',18),(316,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2004','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":40} ','{\"msg\":\"课程容量已满，无法选课\",\"code\":500}',0,NULL,'2026-01-06 00:16:43',15),(317,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2002','研发部门','/edu/student/drop/110','127.0.0.1','内网IP','110 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-06 00:16:45',41),(318,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2004','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":40} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-06 00:16:49',366),(319,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2004','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":20} ','{\"msg\":\"与已有课程时间冲突\",\"code\":500}',0,NULL,'2026-01-06 00:20:44',177),(320,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2004','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":24} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-06 00:20:47',268),(321,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2004','研发部门','/edu/student/drop/113','127.0.0.1','内网IP','113 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-06 00:25:38',33),(322,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2004','研发部门','/edu/student/drop/108','127.0.0.1','内网IP','108 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-06 00:40:31',42),(323,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2004','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":40} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-06 00:40:33',337),(324,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2004','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":39} ','{\"msg\":\"课程容量已满，无法选课\",\"code\":500}',0,NULL,'2026-01-06 00:40:38',17),(325,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2004','研发部门','/edu/student/drop/108','127.0.0.1','内网IP','108 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-06 00:40:39',38),(326,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2004','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":40} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-06 00:40:40',304),(327,'课程',1,'com.ruoyi.edu.admin.controller.EduCourseController.add()','POST',1,'admin_edu','研发部门','/edu/admin/course','127.0.0.1','内网IP','{\"courseCode\":\"30\",\"courseId\":32,\"courseName\":\"大学物理\",\"courseType\":\"选修\",\"createTime\":\"2026-01-06 00:42:57\",\"creditHours\":2,\"params\":{}} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-06 00:42:57',79),(328,'教学班',1,'com.ruoyi.edu.admin.controller.EduCourseClassController.add()','POST',1,'admin_edu','研发部门','/edu/admin/courseClass','127.0.0.1','内网IP','','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-06 00:44:04',102),(329,'教学班',2,'com.ruoyi.edu.admin.controller.EduCourseClassController.edit()','PUT',1,'admin_edu','研发部门','/edu/admin/courseClass','127.0.0.1','内网IP','{\"capacity\":60,\"classId\":42,\"courseId\":31,\"createBy\":\"\",\"createTime\":\"2026-01-06 00:44:04\",\"params\":{},\"remainingSeats\":60,\"remark\":\"\",\"selectedCount\":0,\"status\":1,\"teacherId\":1004,\"termId\":\"2025-2026-fall\",\"updateBy\":\"\",\"updateTime\":\"2026-01-06 00:44:15\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-06 00:44:15',18),(330,'教学班',2,'com.ruoyi.edu.admin.controller.EduCourseClassController.edit()','PUT',1,'admin_edu','研发部门','/edu/admin/courseClass','127.0.0.1','内网IP','{\"capacity\":60,\"classId\":42,\"courseId\":32,\"createBy\":\"\",\"createTime\":\"2026-01-06 00:44:04\",\"params\":{},\"remainingSeats\":60,\"remark\":\"\",\"selectedCount\":0,\"status\":1,\"teacherId\":1004,\"termId\":\"2025-2026-fall\",\"updateBy\":\"\",\"updateTime\":\"2026-01-06 00:44:28\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-06 00:44:28',18),(331,'课程',2,'com.ruoyi.edu.admin.controller.EduCourseController.edit()','PUT',1,'admin_edu','研发部门','/edu/admin/course','127.0.0.1','内网IP','{\"courseCode\":\"wuli\",\"courseId\":32,\"courseName\":\"大学物理\",\"courseType\":\"选修\",\"createBy\":\"\",\"createTime\":\"2026-01-06 00:42:57\",\"creditHours\":2,\"params\":{},\"remark\":\"\",\"updateBy\":\"\",\"updateTime\":\"2026-01-06 00:45:06\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-06 00:45:06',24),(332,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2002','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":42} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-06 00:47:39',290),(333,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2002','研发部门','/edu/student/drop/118','127.0.0.1','内网IP','118 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-06 01:08:59',38),(334,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2002','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":42} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-06 01:09:00',305),(335,'教学班',2,'com.ruoyi.edu.admin.controller.EduCourseClassController.edit()','PUT',1,'admin_edu','研发部门','/edu/admin/courseClass','127.0.0.1','内网IP','{\"capacity\":60,\"classId\":42,\"classTime\":\"周二1-2节\",\"courseId\":32,\"createBy\":\"\",\"createTime\":\"2026-01-06 00:44:04\",\"params\":{},\"remainingSeats\":59,\"remark\":\"\",\"selectedCount\":1,\"status\":1,\"teacherId\":1004,\"termId\":\"2025-2026-fall\",\"updateBy\":\"\",\"updateTime\":\"2026-01-06 01:24:33\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-06 01:24:34',55);
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES (1,'ceo','董事长',1,'0','admin','2025-12-24 19:30:46','',NULL,''),(2,'se','项目经理',2,'0','admin','2025-12-24 19:30:46','',NULL,''),(3,'hr','人力资源',3,'0','admin','2025-12-24 19:30:46','',NULL,''),(4,'user','普通员工',4,'0','admin','2025-12-24 19:30:46','',NULL,'');
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员','admin',1,'1',1,1,'0','0','admin','2025-12-24 19:30:46','',NULL,'超级管理员'),(2,'普通角色','common',2,'2',1,1,'0','0','admin','2025-12-24 19:30:46','',NULL,'普通角色'),(3,'学生','student',3,'1',1,1,'0','0','b_admin','2026-01-04 00:06:37','',NULL,'[B]学生角色，只能访问学生功能模块'),(4,'教师','teacher',4,'1',1,1,'0','0','b_admin','2026-01-04 00:06:37','',NULL,'[B]教师角色，只能访问教师功能模块'),(100,'EnrollAdmin','enroll_admin',2,'1',1,1,'0','0','admin','2026-01-04 11:55:15','',NULL,'??????????????????');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
INSERT INTO `sys_role_dept` VALUES (2,100),(2,101),(2,105);
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (2,1),(2,2),(2,3),(2,4),(2,100),(2,101),(2,102),(2,103),(2,104),(2,105),(2,106),(2,107),(2,108),(2,109),(2,110),(2,111),(2,112),(2,113),(2,114),(2,115),(2,116),(2,117),(2,500),(2,501),(2,1000),(2,1001),(2,1002),(2,1003),(2,1004),(2,1005),(2,1006),(2,1007),(2,1008),(2,1009),(2,1010),(2,1011),(2,1012),(2,1013),(2,1014),(2,1015),(2,1016),(2,1017),(2,1018),(2,1019),(2,1020),(2,1021),(2,1022),(2,1023),(2,1024),(2,1025),(2,1026),(2,1027),(2,1028),(2,1029),(2,1030),(2,1031),(2,1032),(2,1033),(2,1034),(2,1035),(2,1036),(2,1037),(2,1038),(2,1039),(2,1040),(2,1041),(2,1042),(2,1043),(2,1044),(2,1045),(2,1046),(2,1047),(2,1048),(2,1049),(2,1050),(2,1051),(2,1052),(2,1053),(2,1054),(2,1055),(2,1056),(2,1057),(2,1058),(2,1059),(2,1060),(3,2001),(3,2002),(3,2003),(3,2004),(3,2101),(3,2102),(3,2103),(3,2104),(3,2105),(4,2005),(4,2006),(4,2201),(4,2202),(4,2203),(4,2204),(100,2205),(100,2206),(100,2207),(100,2208),(100,2300),(100,2301),(100,2302),(100,2303),(100,2304),(100,2310),(100,2311),(100,2312),(100,2313),(100,2314),(100,2320),(100,2321),(100,2322),(100,2323),(100,2324),(100,2330),(100,2331),(100,2332),(100,2333),(100,2334);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '账号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3006 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,103,'admin','若依','00','ry@163.com','15888888888','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2026-01-05 00:53:04','2025-12-24 19:30:46','admin','2025-12-24 19:30:46','',NULL,'管理员'),(2,105,'ry','若依','00','ry@qq.com','15666666666','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2025-12-24 19:30:46','2025-12-24 19:30:46','admin','2025-12-24 19:30:46','',NULL,'测试员'),(1001,103,'b_teacher1001','罗浩','00','b_teacher1001@test.com','13900001001','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2026-01-06 00:21:34',NULL,'b_admin','2026-01-04 00:06:37','',NULL,'[B]教师测试账号1（计算机基础）'),(1002,103,'b_teacher1002','宋亦','00','b_teacher1002@test.com','13900001002','0','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2026-01-05 00:33:10',NULL,'b_admin','2026-01-04 00:06:37','',NULL,'[B]教师测试账号2（数据结构）'),(1003,103,'b_teacher1003','林峰','00','b_teacher1003@test.com','13900001003','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2026-01-05 22:12:50',NULL,'b_admin','2026-01-04 00:06:37','',NULL,'[B]教师测试账号3（高等数学）'),(1004,103,'b_teacher1004','曹宁','00','b_teacher1004@test.com','13900001004','0','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2026-01-06 01:12:48',NULL,'b_admin','2026-01-04 00:06:37','',NULL,'[B]教师测试账号4（大学英语）'),(1005,103,'b_teacher1005','韩雪','00','b_teacher1005@test.com','13900001005','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2026-01-05 02:06:34',NULL,'b_admin','2026-01-04 00:06:37','',NULL,'[B]教师测试账号5（大学物理）'),(1006,103,'b_teacher1006','程越','00','b_teacher1006@test.com','13900001006','0','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','',NULL,NULL,'b_admin','2026-01-04 00:06:37','',NULL,'[B]教师测试账号6（大学化学）'),(1007,103,'b_teacher1007','吕倩','00','b_teacher1007@test.com','13900001007','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','',NULL,NULL,'b_admin','2026-01-04 00:06:37','',NULL,'[B]教师测试账号7（大学体育）'),(1008,103,'b_teacher1008','邱晨','00','b_teacher1008@test.com','13900001008','0','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','',NULL,NULL,'b_admin','2026-01-04 00:06:37','',NULL,'[B]教师测试账号8（艺术鉴赏）'),(2001,103,'b_student2001','张三','00','b_student2001@test.com','13800002001','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2026-01-06 01:24:54',NULL,'b_admin','2026-01-04 00:06:37','',NULL,'[B]学生测试账号1'),(2002,103,'b_student2002','李四','00','b_student2002@test.com','13800002002','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2026-01-06 00:25:23',NULL,'b_admin','2026-01-04 00:06:37','',NULL,'[B]学生测试账号2'),(2003,103,'b_student2003','王五','00','b_student2003@test.com','13800002003','0','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2026-01-05 02:04:12',NULL,'b_admin','2026-01-04 00:06:37','',NULL,'[B]学生测试账号3'),(2004,103,'b_student2004','赵六','00','b_student2004@test.com','13800002004','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2026-01-06 01:23:24',NULL,'b_admin','2026-01-04 00:06:37','',NULL,'[B]学生测试账号4'),(2005,103,'b_student2005','钱七','00','b_student2005@test.com','13800002005','0','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2026-01-05 22:27:03',NULL,'b_admin','2026-01-04 00:06:37','',NULL,'[B]学生测试账号5'),(2006,103,'b_student2006','孙八','00','b_student2006@test.com','13800002006','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2026-01-05 23:39:13',NULL,'b_admin','2026-01-04 00:06:37','',NULL,'[B]学生测试账号6'),(2007,103,'b_student2007','周九','00','b_student2007@test.com','13800002007','0','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','',NULL,NULL,'b_admin','2026-01-04 00:06:37','',NULL,'[B]学生测试账号7'),(2008,103,'b_student2008','吴十','00','b_student2008@test.com','13800002008','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','',NULL,NULL,'b_admin','2026-01-04 00:06:37','',NULL,'[B]学生测试账号8'),(2009,103,'b_student2009','郑十一','00','b_student2009@test.com','13800002009','0','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','',NULL,NULL,'b_admin','2026-01-04 00:06:37','',NULL,'[B]学生测试账号9'),(2010,103,'b_student2010','王十二','00','b_student2010@test.com','13800002010','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','',NULL,NULL,'b_admin','2026-01-04 00:06:37','',NULL,'[B]学生测试账号10'),(3000,103,'admin_edu','EduAdmin','00','edu@school.com','15888888888','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2026-01-06 01:24:17',NULL,'admin','2026-01-04 11:55:15','',NULL,'A??????'),(3001,NULL,'teacher1001','陈楠','00','','','0','','$2a$10$1eG8tKcYQ8zYjZV8yK0V2eZ8pW8D0u3Wm3Cw4b8JrZy3d5b0WvC9e','0','0','',NULL,NULL,'','2026-01-04 20:29:08','',NULL,NULL),(3002,NULL,'teacher1002','赵敏','00','','','0','','$2a$10$1eG8tKcYQ8zYjZV8yK0V2eZ8pW8D0u3Wm3Cw4b8JrZy3d5b0WvC9e','0','0','',NULL,NULL,'','2026-01-04 20:29:08','',NULL,NULL),(3003,NULL,'teacher1003','郑凯','00','','','0','','$2a$10$1eG8tKcYQ8zYjZV8yK0V2eZ8pW8D0u3Wm3Cw4b8JrZy3d5b0WvC9e','0','0','',NULL,NULL,'','2026-01-04 20:29:08','',NULL,NULL),(3004,NULL,'teacher1004','唐婧','00','','','0','','$2a$10$1eG8tKcYQ8zYjZV8yK0V2eZ8pW8D0u3Wm3Cw4b8JrZy3d5b0WvC9e','0','0','',NULL,NULL,'','2026-01-04 20:29:08','',NULL,NULL),(3005,NULL,'teacher1005','杜睿','00','','','0','','$2a$10$1eG8tKcYQ8zYjZV8yK0V2eZ8pW8D0u3Wm3Cw4b8JrZy3d5b0WvC9e','0','0','',NULL,NULL,'','2026-01-04 20:29:08','',NULL,NULL);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户与岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;
INSERT INTO `sys_user_post` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1),(2,2),(1001,4),(1002,4),(1003,4),(1004,4),(1005,4),(1006,4),(1007,4),(1008,4),(2001,3),(2002,3),(2003,3),(2004,3),(2005,3),(2006,3),(2007,3),(2008,3),(2009,3),(2010,3),(3000,100);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `term`
--

DROP TABLE IF EXISTS `term`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `term` (
  `term_id` varchar(20) NOT NULL COMMENT '瀛︽湡ID锛屾牸寮忥細2024-2025-1',
  `term_name` varchar(50) NOT NULL COMMENT '瀛︽湡鍚嶇О锛屽?锛?024-2025绉嬪?',
  `enroll_start` datetime DEFAULT NULL COMMENT '閫夎?寮??鏃堕棿',
  `enroll_end` datetime DEFAULT NULL COMMENT '閫夎?缁撴潫鏃堕棿',
  `drop_deadline` datetime DEFAULT NULL COMMENT '閫??鎴??鏃堕棿',
  `is_active` tinyint(1) DEFAULT '1' COMMENT '鏄?惁褰撳墠瀛︽湡锛?鏄?紝0鍚︼級',
  `create_by` varchar(64) DEFAULT '' COMMENT '鍒涘缓鑰',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `update_by` varchar(64) DEFAULT '' COMMENT '鏇存柊鑰',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  `remark` varchar(500) DEFAULT '' COMMENT '澶囨敞',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `uk_term_id` (`term_id`),
  KEY `idx_is_active` (`is_active`),
  KEY `idx_enroll_time` (`enroll_start`,`enroll_end`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='瀛︽湡琛';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `term`
--

LOCK TABLES `term` WRITE;
/*!40000 ALTER TABLE `term` DISABLE KEYS */;
INSERT INTO `term` VALUES ('2025-2026-fall','2025-2026秋季','2025-09-01 00:00:00','2026-02-01 00:00:00',NULL,1,'','2026-01-04 20:51:49','','2026-01-05 22:26:22',''),('2025-2026-spring','2025-2026春季','2026-03-01 00:00:00','2026-07-01 00:00:00',NULL,0,'','2026-01-04 20:51:49','','2026-01-05 22:26:21','');
/*!40000 ALTER TABLE `term` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ry-vue'
--

--
-- Dumping routines for database 'ry-vue'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_get_student_credits` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = gbk */ ;
/*!50003 SET character_set_results = gbk */ ;
/*!50003 SET collation_connection  = gbk_chinese_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_get_student_credits`(p_student_id BIGINT, p_term_id VARCHAR(20)) RETURNS int
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE v_credits INT;
    CALL sp_calc_student_credits(p_student_id, p_term_id, v_credits);
    RETURN v_credits;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_calc_student_credits` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = gbk */ ;
/*!50003 SET character_set_results = gbk */ ;
/*!50003 SET collation_connection  = gbk_chinese_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_calc_student_credits`(
    IN p_student_id BIGINT,
    IN p_term_id VARCHAR(20),
    OUT p_total_credits INT
)
BEGIN
    DECLARE v_total INT DEFAULT 0;
    
    -- 计算学生在该学期已选课程的总学分
    -- 注意：term_id可能需要处理前缀
    SELECT COALESCE(SUM(c.credit_hours), 0) INTO v_total
    FROM enrollment e
    JOIN course_class cc ON e.class_id = cc.class_id
    JOIN course c ON cc.course_id = c.course_id
    WHERE e.student_id = p_student_id
      AND e.term_id LIKE CONCAT('%', p_term_id, '%')  -- 模糊匹配，兼容前缀
      AND e.status = 'ENROLLED'
      AND cc.status = 1;  -- 只计算开放选课的课程
    
    SET p_total_credits = v_total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_check_enrollment_eligible` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = gbk */ ;
/*!50003 SET character_set_results = gbk */ ;
/*!50003 SET collation_connection  = gbk_chinese_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_check_enrollment_eligible`(
    IN p_student_id BIGINT,
    IN p_class_id INT,
    OUT p_is_eligible BOOLEAN,
    OUT p_error_message VARCHAR(200)
)
BEGIN
    DECLARE v_current_credits INT DEFAULT 0;
    DECLARE v_course_credits INT DEFAULT 0;
    DECLARE v_max_credits INT DEFAULT 20;
    DECLARE v_term_id VARCHAR(20);
    
    -- 获取课程信息和学期
    SELECT cc.term_id, c.credit_hours INTO v_term_id, v_course_credits
    FROM course_class cc
    JOIN course c ON cc.course_id = c.course_id
    WHERE cc.class_id = p_class_id;
    
    -- 计算当前已选学分
    CALL sp_calc_student_credits(p_student_id, v_term_id, v_current_credits);
    
    -- 获取学分上限
    SELECT COALESCE(MAX(max_credits), 20) INTO v_max_credits
    FROM credit_rule 
    WHERE term_id = v_term_id AND is_active = 1;
    
    -- 检查学分上限
    IF v_current_credits + v_course_credits > v_max_credits THEN
        SET p_is_eligible = FALSE;
        SET p_error_message = CONCAT('超过学分上限：当前', v_current_credits, '学分，本课程', v_course_credits, '学分，上限', v_max_credits, '学分');
    ELSE
        SET p_is_eligible = TRUE;
        SET p_error_message = NULL;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_refresh_class_slots` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_refresh_class_slots`(IN p_class_id BIGINT)
BEGIN
    DECLARE v_time_str VARCHAR(255);
    DECLARE v_segment VARCHAR(255);
    DECLARE v_week_day INT;
    DECLARE v_start INT;
    DECLARE v_end INT;
    DECLARE v_comma_pos INT;
    DECLARE v_dash_pos INT;
    DECLARE v_jie_pos INT;
    
    -- 1. 清理该班级旧的时间片
    DELETE FROM class_time_slot WHERE class_id = p_class_id;
    
    -- 2. 获取当前时间字符串
    SELECT class_time INTO v_time_str FROM course_class WHERE class_id = p_class_id;
    
    -- 3. 解析逻辑
    IF v_time_str IS NOT NULL AND v_time_str != '' THEN
        -- 追加逗号以便循环处理最后一个元素
        SET v_time_str = CONCAT(v_time_str, ',');
        
        parse_loop: WHILE CHAR_LENGTH(v_time_str) > 0 DO
            -- 提取逗号前的片段
            SET v_comma_pos = LOCATE(',', v_time_str);
            IF v_comma_pos = 0 THEN
                SET v_segment = v_time_str;
                SET v_time_str = '';
            ELSE
                SET v_segment = TRIM(SUBSTRING(v_time_str, 1, v_comma_pos - 1));
                SET v_time_str = SUBSTRING(v_time_str, v_comma_pos + 1);
            END IF;
            
            IF CHAR_LENGTH(v_segment) > 0 THEN
                -- 解析 "周x"
                SET v_week_day = 0;
                IF v_segment LIKE '%周一%' THEN SET v_week_day = 1;
                ELSEIF v_segment LIKE '%周二%' THEN SET v_week_day = 2;
                ELSEIF v_segment LIKE '%周三%' THEN SET v_week_day = 3;
                ELSEIF v_segment LIKE '%周四%' THEN SET v_week_day = 4;
                ELSEIF v_segment LIKE '%周五%' THEN SET v_week_day = 5;
                ELSEIF v_segment LIKE '%周六%' THEN SET v_week_day = 6;
                ELSEIF v_segment LIKE '%周日%' THEN SET v_week_day = 7;
                END IF;
                
                -- 解析 "Y-Z节"
                IF v_week_day > 0 THEN
                    SET v_dash_pos = LOCATE('-', v_segment);
                    SET v_jie_pos = LOCATE('节', v_segment);
                    
                    IF v_dash_pos > 0 AND v_jie_pos > v_dash_pos THEN
                        -- 提取开始节次：'周x' (2字符) 之后，'-' 之前
                        -- SUBSTRING(str, pos, len)
                        -- 假设 '周x' 占 2 个字符长度 (char_length)
                        SET v_start = CAST(SUBSTRING(v_segment, 3, v_dash_pos - 3) AS UNSIGNED);
                        -- 提取结束节次：'-' 之后，'节' 之前
                        SET v_end = CAST(SUBSTRING(v_segment, v_dash_pos + 1, v_jie_pos - v_dash_pos - 1) AS UNSIGNED);
                        
                        -- 插入 slot
                        IF v_start > 0 AND v_end >= v_start THEN
                            INSERT INTO class_time_slot (class_id, week_day, start_slot, end_slot, create_time, update_time)
                            VALUES (p_class_id, v_week_day, v_start, v_end, NOW(), NOW());
                        END IF;
                    END IF;
                END IF;
            END IF;
        END WHILE parse_loop;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-06  1:26:16

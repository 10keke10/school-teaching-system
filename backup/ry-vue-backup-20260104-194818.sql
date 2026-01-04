-- MySQL dump 10.13  Distrib 5.7.36, for Win64 (x86_64)
--
-- Host: localhost    Database: ry-vue
-- ------------------------------------------------------
-- Server version	5.7.36-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_time_slot` (
  `slot_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '鏃堕棿妲絀D',
  `class_id` int(11) NOT NULL COMMENT '鏁欏?鐝璉D',
  `week_day` tinyint(4) DEFAULT NULL COMMENT '鏄熸湡鍑狅紙1-7锛?=鍛ㄤ竴锛',
  `start_slot` tinyint(4) DEFAULT NULL COMMENT '寮??鑺傛?锛?-12锛',
  `end_slot` tinyint(4) DEFAULT NULL COMMENT '缁撴潫鑺傛?',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  PRIMARY KEY (`slot_id`),
  UNIQUE KEY `uk_class_time` (`class_id`,`week_day`,`start_slot`),
  KEY `idx_class` (`class_id`),
  KEY `idx_week_day` (`week_day`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COMMENT='涓婅?鏃堕棿妲借〃';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_time_slot`
--

LOCK TABLES `class_time_slot` WRITE;
/*!40000 ALTER TABLE `class_time_slot` DISABLE KEYS */;
INSERT INTO `class_time_slot` VALUES (5,6,1,1,2,'2025-12-29 16:02:08','2025-12-29 16:02:08'),(6,6,3,3,4,'2025-12-29 16:02:08','2025-12-29 16:02:08'),(7,7,2,1,2,'2025-12-29 16:02:08','2025-12-29 16:02:08'),(8,7,4,3,4,'2025-12-29 16:02:08','2025-12-29 16:02:08'),(9,8,1,3,4,'2025-12-29 16:02:08','2025-12-29 16:02:08'),(10,8,3,5,6,'2025-12-29 16:02:08','2025-12-29 16:02:08'),(11,9,1,3,4,'2025-12-29 16:02:08','2025-12-29 16:02:08'),(12,9,3,1,2,'2025-12-29 16:02:08','2025-12-29 16:02:08'),(13,10,3,7,8,'2025-12-29 16:02:08','2025-12-29 16:02:08'),(14,11,4,5,6,'2025-12-29 16:02:08','2025-12-29 16:02:08'),(15,12,5,3,4,'2025-12-29 16:02:08','2025-12-29 16:02:08'),(16,13,1,5,6,'2025-12-29 16:02:08','2025-12-29 16:02:08'),(17,13,3,7,8,'2025-12-29 16:02:08','2025-12-29 16:02:08'),(18,14,2,7,8,'2025-12-29 16:02:08','2025-12-29 16:02:08');
/*!40000 ALTER TABLE `class_time_slot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '璇剧▼ID',
  `course_code` varchar(20) NOT NULL COMMENT '璇剧▼浠ｇ爜',
  `course_name` varchar(100) NOT NULL COMMENT '璇剧▼鍚嶇О',
  `credit_hours` int(11) DEFAULT '2' COMMENT '瀛﹀垎',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '寮??闄㈢郴ID锛堝叧鑱攕ys_dept.dept_id锛',
  `course_type` varchar(20) DEFAULT '蹇呬慨' COMMENT '璇剧▼绫诲瀷锛氬繀淇?閫変慨',
  `description` text COMMENT '璇剧▼鎻忚堪',
  `create_by` varchar(64) DEFAULT '' COMMENT '鍒涘缓鑰',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `update_by` varchar(64) DEFAULT '' COMMENT '鏇存柊鑰',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  `remark` varchar(500) DEFAULT '' COMMENT '澶囨敞',
  PRIMARY KEY (`course_id`),
  UNIQUE KEY `course_code` (`course_code`),
  KEY `idx_dept` (`dept_id`),
  KEY `idx_course_code` (`course_code`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COMMENT='璇剧▼淇℃伅琛';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'B_CS101','计算机基础',3,NULL,'蹇呬慨',NULL,'','2025-12-26 22:17:55','','2026-01-04 13:04:53',''),(2,'B_MATH101','高等数学',4,NULL,'蹇呬慨',NULL,'','2025-12-26 22:17:55','','2026-01-04 13:04:53',''),(7,'B_CS201','数据结构',4,NULL,'必修','数据结构与算法','','2025-12-29 16:02:08','','2025-12-29 16:02:08',''),(9,'B_ENG101','大学英语',2,NULL,'选修','英语听说读写训练','','2025-12-29 16:02:08','','2025-12-29 16:02:08',''),(10,'B_PHY101','大学物理',3,NULL,'必修','物理学基础','','2025-12-29 16:02:08','','2025-12-29 16:02:08',''),(11,'B_CHEM101','大学化学',3,NULL,'选修','化学基础知识','','2025-12-29 16:02:08','','2025-12-29 16:02:08',''),(12,'B_PE101','大学体育',1,NULL,'选修','体育锻炼课程','','2025-12-29 16:02:08','','2025-12-29 16:02:08',''),(13,'B_ART101','艺术鉴赏',2,NULL,'选修','艺术欣赏与评论','','2025-12-29 16:02:08','','2025-12-29 16:02:08','');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_class`
--

DROP TABLE IF EXISTS `course_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_class` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '鏁欏?鐝璉D',
  `course_id` int(11) NOT NULL COMMENT '璇剧▼ID',
  `teacher_id` bigint(20) NOT NULL COMMENT '鏁欏笀ID锛堝叧鑱攕ys_user.user_id锛',
  `term_id` varchar(20) NOT NULL COMMENT '瀛︽湡ID',
  `class_time` varchar(100) DEFAULT NULL COMMENT '涓婅?鏃堕棿锛屽?锛氬懆涓?-2鑺傦紝鍛ㄤ笁3-4鑺',
  `location` varchar(100) DEFAULT NULL COMMENT '涓婅?鍦扮偣',
  `capacity` int(11) DEFAULT '60' COMMENT '璇剧▼瀹归噺',
  `selected_count` int(11) DEFAULT '0' COMMENT '宸查?浜烘暟',
  `status` tinyint(4) DEFAULT '1' COMMENT '鐘舵?锛?寮?斁閫夎?锛?鍏抽棴',
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COMMENT='鏁欏?鐝?〃';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_class`
--

LOCK TABLES `course_class` WRITE;
/*!40000 ALTER TABLE `course_class` DISABLE KEYS */;
INSERT INTO `course_class` VALUES (1,1,1001,'2024-2025-1',NULL,NULL,2,1,1,'','2025-12-26 22:17:55','','2026-01-04 13:05:15',''),(2,2,1002,'2024-2025-1',NULL,NULL,3,1,1,'','2025-12-26 22:17:55','','2026-01-04 13:59:27',''),(6,1,1006,'b_2024_fall','周一1-2节，周三3-4节','教学楼A201',60,59,1,'','2025-12-29 16:02:08','','2026-01-04 14:00:02',''),(7,1,1007,'b_2024_fall','周二1-2节，周四3-4节','教学楼A202',60,26,1,'','2025-12-29 16:02:08','','2026-01-04 13:59:59',''),(8,7,1008,'b_2024_fall','周一3-4节，周三5-6节','教学楼B301',50,50,1,'','2025-12-29 16:02:08','','2026-01-04 13:05:15',''),(9,2,1001,'b_2024_fall','周二3-4节，周五1-2节','教学楼C101',55,31,1,'','2025-12-29 16:02:08','','2026-01-04 13:59:49',''),(10,9,1002,'b_2024_fall','周三7-8节','外语楼D201',40,15,1,'','2025-12-29 16:02:08','','2026-01-04 13:27:52',''),(11,10,1003,'b_2024_spring','周四5-6节','实验楼E101',45,20,1,'','2025-12-29 16:02:08','','2026-01-04 13:05:15',''),(12,11,1004,'b_2024_spring','周五3-4节','化学楼F201',35,10,1,'','2025-12-29 16:02:08','','2026-01-04 13:05:15',''),(13,12,1005,'b_2024_summer','周一5-6节，周三7-8节','体育馆',100,80,1,'','2025-12-29 16:02:08','','2026-01-04 13:05:15',''),(14,13,1006,'b_2024_summer','周二7-8节','艺术楼G101',60,25,1,'','2025-12-29 16:02:08','','2026-01-04 13:05:15','');
/*!40000 ALTER TABLE `course_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_rule`
--

DROP TABLE IF EXISTS `credit_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_rule` (
  `rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_name` varchar(50) DEFAULT NULL COMMENT '瑙勫垯鍚嶇О',
  `term_id` varchar(20) DEFAULT NULL COMMENT '閫傜敤瀛︽湡',
  `max_credits` int(11) DEFAULT '20' COMMENT '鏈?ぇ瀛﹀垎',
  `min_credits` int(11) DEFAULT '0' COMMENT '鏈?皬瀛﹀垎',
  `is_active` tinyint(1) DEFAULT '1' COMMENT '鏄?惁鐢熸晥锛?鏄?紝0鍚︼級',
  `create_by` varchar(64) DEFAULT '' COMMENT '鍒涘缓鑰',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  `update_by` varchar(64) DEFAULT '' COMMENT '鏇存柊鑰',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏇存柊鏃堕棿',
  `remark` varchar(500) DEFAULT '' COMMENT '澶囨敞',
  PRIMARY KEY (`rule_id`),
  KEY `idx_term` (`term_id`),
  KEY `idx_is_active` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='瀛﹀垎瑙勫垯琛';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_rule`
--

LOCK TABLES `credit_rule` WRITE;
/*!40000 ALTER TABLE `credit_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `credit_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollment`
--

DROP TABLE IF EXISTS `enrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enrollment` (
  `enrollment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '閫夎?璁板綍ID',
  `student_id` bigint(20) NOT NULL COMMENT '瀛︾敓ID锛堝叧鑱攕ys_user.user_id锛',
  `class_id` int(11) NOT NULL COMMENT '鏁欏?鐝璉D',
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
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COMMENT='閫夎?璁板綍琛';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollment`
--

LOCK TABLES `enrollment` WRITE;
/*!40000 ALTER TABLE `enrollment` DISABLE KEYS */;
INSERT INTO `enrollment` VALUES (1,3,1,'2024-2025-1','ENROLLED',5.00,'PUBLISHED','2025-12-26 22:17:55',NULL,'','2025-12-26 22:17:55','','2025-12-29 16:14:33',''),(2,9999,3,'b_test_term_1','ENROLLED',NULL,'DRAFT','2025-12-28 23:46:04',NULL,'','2025-12-28 23:46:04','','2025-12-28 23:46:04',''),(7,2001,6,'b_2024_fall','ENROLLED',85.50,'PUBLISHED','2024-09-05 09:00:00',NULL,'','2025-12-29 16:02:08','','2025-12-29 16:02:08',''),(8,2001,9,'b_2024_fall','ENROLLED',92.00,'PUBLISHED','2024-09-06 10:00:00',NULL,'','2025-12-29 16:02:08','','2025-12-29 16:02:08',''),(9,2001,10,'b_2024_fall','DROPPED',78.00,'DRAFT','2024-09-07 11:00:00','2025-12-29 16:15:50','','2025-12-29 16:02:08','','2025-12-29 16:02:08',''),(10,2001,11,'b_2024_spring','ENROLLED',88.50,'PUBLISHED','2025-03-02 09:00:00',NULL,'','2025-12-29 16:02:08','','2025-12-29 16:02:08',''),(11,2001,13,'b_2024_summer','ENROLLED',95.00,'PUBLISHED','2025-07-03 14:00:00',NULL,'','2025-12-29 16:02:08','','2025-12-29 16:02:08',''),(12,2002,6,'b_2024_fall','DROPPED',NULL,NULL,'2024-09-05 09:30:00',NULL,'','2025-12-29 16:02:08','','2025-12-29 16:02:08',''),(13,2002,7,'b_2024_fall','ENROLLED',67.50,'PUBLISHED','2024-09-10 09:00:00',NULL,'','2025-12-29 16:02:08','','2025-12-29 16:02:08',''),(14,2002,8,'b_2024_fall','ENROLLED',73.00,'PUBLISHED','2024-09-08 10:00:00',NULL,'','2025-12-29 16:02:08','','2025-12-29 16:02:08',''),(15,2003,6,'b_2024_fall','ENROLLED',91.00,'DRAFT','2024-09-06 09:00:00',NULL,'','2025-12-29 16:02:08','','2025-12-29 16:02:08',''),(16,2003,9,'b_2024_fall','ENROLLED',82.50,'DRAFT','2024-09-07 10:00:00',NULL,'','2025-12-29 16:02:08','','2025-12-29 16:02:08',''),(17,2003,14,'b_2024_summer','ENROLLED',NULL,'DRAFT','2025-07-04 15:00:00',NULL,'','2025-12-29 16:02:08','','2025-12-29 16:02:08',''),(18,2004,7,'b_2024_fall','ENROLLED',88.00,'PUBLISHED','2024-09-12 09:00:00',NULL,'','2025-12-29 16:02:08','','2025-12-29 16:02:08',''),(19,2005,6,'b_2024_fall','ENROLLED',79.00,'PUBLISHED','2024-09-05 09:00:00',NULL,'','2025-12-29 16:02:08','','2025-12-29 16:02:08',''),(20,2005,9,'b_2024_fall','ENROLLED',84.50,'PUBLISHED','2024-09-06 10:00:00',NULL,'','2025-12-29 16:02:08','','2025-12-29 16:02:08',''),(21,2005,10,'b_2024_fall','ENROLLED',90.00,'PUBLISHED','2024-09-07 11:00:00',NULL,'','2025-12-29 16:02:08','','2025-12-29 16:02:08',''),(22,2005,12,'b_2024_spring','ENROLLED',81.50,'PUBLISHED','2025-03-03 10:00:00',NULL,'','2025-12-29 16:02:08','','2025-12-29 16:02:08',''),(23,2006,7,'b_2024_fall','ENROLLED',NULL,'DRAFT','2025-12-29 16:02:08',NULL,'','2025-12-29 16:02:08','','2025-12-29 16:02:08',''),(24,2007,8,'b_2024_fall','ENROLLED',76.00,'PUBLISHED','2024-09-01 09:00:00',NULL,'','2025-12-29 16:02:08','','2025-12-29 16:02:08',''),(25,2008,6,'b_2024_fall','ENROLLED',85.00,'PUBLISHED','2024-09-05 09:00:00',NULL,'','2025-12-29 16:02:08','','2025-12-29 16:02:08',''),(26,2009,6,'b_2024_fall','ENROLLED',96.50,'PUBLISHED','2024-09-05 09:00:00',NULL,'','2025-12-29 16:02:08','','2025-12-29 16:02:08',''),(27,2009,9,'b_2024_fall','ENROLLED',98.00,'PUBLISHED','2024-09-06 10:00:00',NULL,'','2025-12-29 16:02:08','','2025-12-29 16:02:08',''),(28,2009,11,'b_2024_spring','ENROLLED',94.50,'PUBLISHED','2025-03-02 09:00:00',NULL,'','2025-12-29 16:02:08','','2025-12-29 16:02:08',''),(29,2010,7,'b_2024_fall','ENROLLED',61.50,'PUBLISHED','2024-09-12 09:00:00',NULL,'','2025-12-29 16:02:08','','2025-12-29 16:02:08',''),(30,2010,9,'b_2024_fall','ENROLLED',58.00,'PUBLISHED','2024-09-07 10:00:00',NULL,'','2025-12-29 16:02:08','','2025-12-29 16:02:08',''),(31,2001,12,'b_2024_spring','DROPPED',NULL,'DRAFT','2025-12-29 16:14:49','2025-12-29 16:15:26',NULL,'2025-12-29 16:14:49',NULL,'2025-12-29 16:15:26',NULL),(32,2001,1,'2024-2025-1','DROPPED',NULL,'DRAFT','2025-12-29 16:15:19','2026-01-04 08:54:36',NULL,'2025-12-29 16:15:19',NULL,'2026-01-04 08:54:36',NULL),(35,2001,2,'2024-2025-1','DROPPED',NULL,'DRAFT','2025-12-29 16:15:38','2025-12-29 16:15:39',NULL,'2025-12-29 16:15:38',NULL,'2025-12-29 16:15:39',NULL),(36,2001,7,'b_2024_fall','DROPPED',NULL,'DRAFT','2025-12-29 16:15:43','2025-12-29 16:15:44',NULL,'2025-12-29 16:15:43',NULL,'2025-12-29 16:15:43',NULL),(37,2001,14,'b_2024_summer','DROPPED',NULL,'DRAFT','2025-12-29 16:15:46','2025-12-29 16:15:47',NULL,'2025-12-29 16:15:46',NULL,'2025-12-29 16:15:47',NULL),(38,1,1,'2024-2025-1','ENROLLED',NULL,'DRAFT','2025-12-30 16:05:42',NULL,NULL,'2025-12-30 16:05:42',NULL,NULL,NULL),(39,1,6,'b_2024_fall','DROPPED',NULL,'DRAFT','2025-12-30 16:05:46','2025-12-30 16:05:48',NULL,'2025-12-30 16:05:46',NULL,'2025-12-30 16:05:47',NULL),(40,1,9,'b_2024_fall','DROPPED',NULL,'DRAFT','2025-12-30 16:05:50','2025-12-30 16:05:51',NULL,'2025-12-30 16:05:50',NULL,'2025-12-30 16:05:50',NULL),(41,1,13,'b_2024_summer','DROPPED',NULL,'DRAFT','2025-12-30 16:05:53','2025-12-30 16:05:54',NULL,'2025-12-30 16:05:53',NULL,'2025-12-30 16:05:54',NULL),(44,1,2,'2024-2025-1','DROPPED',NULL,'DRAFT','2025-12-30 16:06:05','2025-12-30 16:06:07',NULL,'2025-12-30 16:06:05',NULL,'2025-12-30 16:06:06',NULL),(45,1,7,'b_2024_fall','ENROLLED',NULL,'DRAFT','2025-12-30 16:06:08',NULL,NULL,'2025-12-30 16:06:08',NULL,NULL,NULL),(46,3,2,'2024-2025-1','ENROLLED',NULL,'DRAFT','2026-01-04 13:59:27','2026-01-04 13:59:25',NULL,'2025-12-30 20:09:02',NULL,'2026-01-04 13:59:27',NULL),(47,3,14,'b_2024_summer','DROPPED',NULL,'DRAFT','2025-12-30 20:09:13','2026-01-04 12:54:11',NULL,'2025-12-30 20:09:13',NULL,'2026-01-04 12:54:11',NULL),(50,3,6,'b_2024_fall','ENROLLED',NULL,'DRAFT','2026-01-04 14:00:03','2026-01-04 14:00:01',NULL,'2025-12-30 20:09:22',NULL,'2026-01-04 14:00:03',NULL),(52,3,7,'b_2024_fall','DROPPED',NULL,'DRAFT','2026-01-04 13:59:58','2026-01-04 13:59:59',NULL,'2025-12-30 20:09:26',NULL,'2026-01-04 13:59:58',NULL),(53,3,9,'b_2024_fall','ENROLLED',NULL,'DRAFT','2026-01-04 13:59:50','2026-01-04 13:59:40',NULL,'2025-12-30 20:09:39',NULL,'2026-01-04 13:59:50',NULL),(54,3,12,'b_2024_spring','DROPPED',NULL,'DRAFT','2025-12-30 20:41:44','2025-12-30 20:41:58',NULL,'2025-12-30 20:41:44',NULL,'2025-12-30 20:41:57',NULL),(69,3,10,'b_2024_fall','ENROLLED',NULL,'DRAFT','2026-01-04 13:27:53',NULL,NULL,'2026-01-04 13:27:53',NULL,NULL,NULL);
/*!40000 ALTER TABLE `enrollment` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_check_capacity_insert
BEFORE INSERT ON enrollment
FOR EACH ROW
BEGIN
    DECLARE v_capacity INT;
    DECLARE v_selected INT;
    
    
    SELECT capacity, selected_count INTO v_capacity, v_selected
    FROM course_class
    WHERE class_id = NEW.class_id;
    
    
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_update_selected_count_insert
AFTER INSERT ON enrollment
FOR EACH ROW
BEGIN
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_update_selected_count_update
AFTER UPDATE ON enrollment
FOR EACH ROW
BEGIN
    
    IF OLD.status = 'ENROLLED' AND NEW.status = 'DROPPED' THEN
        UPDATE course_class
        SET selected_count = selected_count - 1
        WHERE class_id = NEW.class_id;
    
    
    ELSEIF OLD.status = 'DROPPED' AND NEW.status = 'ENROLLED' THEN
        
        
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_update_selected_count_delete
AFTER DELETE ON enrollment
FOR EACH ROW
BEGIN
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='代码生成业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
INSERT INTO `gen_table` VALUES (1,'enrollment','閫夎?璁板綍琛',NULL,NULL,'Enrollment','crud','element-plus','com.ruoyi.edu.student','enrollment','enrollment','选课管理','ruoyi','0','/','{\"parentMenuId\":1}','admin','2025-12-28 21:06:25','','2025-12-28 21:18:15',NULL);
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint(20) DEFAULT NULL COMMENT '归属表编号',
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
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COMMENT='代码生成业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
INSERT INTO `gen_table_column` VALUES (1,1,'enrollment_id','閫夎?璁板綍ID','int(11)','Long','enrollmentId','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-12-28 21:06:25','','2025-12-28 21:18:15'),(2,1,'student_id','瀛︾敓ID锛堝叧鑱攕ys_user.user_id锛','bigint(20)','Long','studentId','0','0','1','1','1','1','1','EQ','input','',2,'admin','2025-12-28 21:06:25','','2025-12-28 21:18:15'),(3,1,'class_id','鏁欏?鐝璉D','int(11)','Long','classId','0','0','1','1','1','1','1','EQ','input','',3,'admin','2025-12-28 21:06:25','','2025-12-28 21:18:15'),(4,1,'term_id','瀛︽湡ID','varchar(20)','String','termId','0','0','1','1','1','1','1','EQ','input','',4,'admin','2025-12-28 21:06:25','','2025-12-28 21:18:15'),(5,1,'status','鐘舵?锛欵NROLLED宸查?璇撅紝DROPPED宸查?璇','varchar(20)','String','status','0','0','0','1','1','1','1','EQ','radio','',5,'admin','2025-12-28 21:06:25','','2025-12-28 21:18:15'),(6,1,'grade','鎴愮哗锛?-100锛屾敮鎸佸皬鏁帮級','decimal(5,2)','BigDecimal','grade','0','0','0','1','1','1','1','EQ','input','',6,'admin','2025-12-28 21:06:25','','2025-12-28 21:18:15'),(7,1,'grade_status','鎴愮哗鐘舵?锛欴RAFT鑽夌?锛孭UBLISHED宸插彂甯','varchar(20)','String','gradeStatus','0','0','0','1','1','1','1','EQ','radio','',7,'admin','2025-12-28 21:06:25','','2025-12-28 21:18:15'),(8,1,'enroll_time','閫夎?鏃堕棿','datetime','Date','enrollTime','0','0','0','1','1','1','1','EQ','datetime','',8,'admin','2025-12-28 21:06:25','','2025-12-28 21:18:15'),(9,1,'drop_time','閫??鏃堕棿','datetime','Date','dropTime','0','0','0','1','1','1','1','EQ','datetime','',9,'admin','2025-12-28 21:06:25','','2025-12-28 21:18:15'),(10,1,'create_by','鍒涘缓鑰','varchar(64)','String','createBy','0','0','0','1',NULL,NULL,NULL,'EQ','input','',10,'admin','2025-12-28 21:06:25','','2025-12-28 21:18:15'),(11,1,'create_time','鍒涘缓鏃堕棿','datetime','Date','createTime','0','0','0','1',NULL,NULL,NULL,'EQ','datetime','',11,'admin','2025-12-28 21:06:25','','2025-12-28 21:18:15'),(12,1,'update_by','鏇存柊鑰','varchar(64)','String','updateBy','0','0','0','1','1',NULL,NULL,'EQ','input','',12,'admin','2025-12-28 21:06:25','','2025-12-28 21:18:15'),(13,1,'update_time','鏇存柊鏃堕棿','datetime','Date','updateTime','0','0','0','1','1',NULL,NULL,'EQ','datetime','',13,'admin','2025-12-28 21:06:25','','2025-12-28 21:18:15'),(14,1,'remark','澶囨敞','varchar(500)','String','remark','0','0','0','1','1','1',NULL,'EQ','textarea','',14,'admin','2025-12-28 21:06:25','','2025-12-28 21:18:15');
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_blob_triggers`
--

DROP TABLE IF EXISTS `qrtz_blob_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '璋冨害鍚嶇О',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers琛╰rigger_name鐨勫?閿',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers琛╰rigger_group鐨勫?閿',
  `blob_data` blob COMMENT '瀛樻斁鎸佷箙鍖朤rigger瀵硅薄',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Blob绫诲瀷鐨勮Е鍙戝櫒琛';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) NOT NULL COMMENT '璋冨害鍚嶇О',
  `calendar_name` varchar(200) NOT NULL COMMENT '鏃ュ巻鍚嶇О',
  `calendar` blob NOT NULL COMMENT '瀛樻斁鎸佷箙鍖朿alendar瀵硅薄',
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='鏃ュ巻淇℃伅琛';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '璋冨害鍚嶇О',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers琛╰rigger_name鐨勫?閿',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers琛╰rigger_group鐨勫?閿',
  `cron_expression` varchar(200) NOT NULL COMMENT 'cron琛ㄨ揪寮',
  `time_zone_id` varchar(80) DEFAULT NULL COMMENT '鏃跺尯',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Cron绫诲瀷鐨勮Е鍙戝櫒琛';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '璋冨害鍚嶇О',
  `entry_id` varchar(95) NOT NULL COMMENT '璋冨害鍣ㄥ疄渚媔d',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers琛╰rigger_name鐨勫?閿',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers琛╰rigger_group鐨勫?閿',
  `instance_name` varchar(200) NOT NULL COMMENT '璋冨害鍣ㄥ疄渚嬪悕',
  `fired_time` bigint(13) NOT NULL COMMENT '瑙﹀彂鐨勬椂闂',
  `sched_time` bigint(13) NOT NULL COMMENT '瀹氭椂鍣ㄥ埗瀹氱殑鏃堕棿',
  `priority` int(11) NOT NULL COMMENT '浼樺厛绾',
  `state` varchar(16) NOT NULL COMMENT '鐘舵?',
  `job_name` varchar(200) DEFAULT NULL COMMENT '浠诲姟鍚嶇О',
  `job_group` varchar(200) DEFAULT NULL COMMENT '浠诲姟缁勫悕',
  `is_nonconcurrent` varchar(1) DEFAULT NULL COMMENT '鏄?惁骞跺彂',
  `requests_recovery` varchar(1) DEFAULT NULL COMMENT '鏄?惁鎺ュ彈鎭㈠?鎵ц?',
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='宸茶Е鍙戠殑瑙﹀彂鍣ㄨ〃';
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
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='浠诲姟璇︾粏淇℃伅琛';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) NOT NULL COMMENT '璋冨害鍚嶇О',
  `lock_name` varchar(40) NOT NULL COMMENT '鎮茶?閿佸悕绉',
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='瀛樺偍鐨勬偛瑙傞攣淇℃伅琛';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) NOT NULL COMMENT '璋冨害鍚嶇О',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers琛╰rigger_group鐨勫?閿',
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='鏆傚仠鐨勮Е鍙戝櫒琛';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) NOT NULL COMMENT '璋冨害鍚嶇О',
  `instance_name` varchar(200) NOT NULL COMMENT '瀹炰緥鍚嶇О',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '涓婃?妫?煡鏃堕棿',
  `checkin_interval` bigint(13) NOT NULL COMMENT '妫?煡闂撮殧鏃堕棿',
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='璋冨害鍣ㄧ姸鎬佽〃';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '璋冨害鍚嶇О',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers琛╰rigger_name鐨勫?閿',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers琛╰rigger_group鐨勫?閿',
  `repeat_count` bigint(7) NOT NULL COMMENT '閲嶅?鐨勬?鏁扮粺璁',
  `repeat_interval` bigint(12) NOT NULL COMMENT '閲嶅?鐨勯棿闅旀椂闂',
  `times_triggered` bigint(10) NOT NULL COMMENT '宸茬粡瑙﹀彂鐨勬?鏁',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='绠?崟瑙﹀彂鍣ㄧ殑淇℃伅琛';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '璋冨害鍚嶇О',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers琛╰rigger_name鐨勫?閿',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers琛╰rigger_group鐨勫?閿',
  `str_prop_1` varchar(512) DEFAULT NULL COMMENT 'String绫诲瀷鐨則rigger鐨勭?涓?釜鍙傛暟',
  `str_prop_2` varchar(512) DEFAULT NULL COMMENT 'String绫诲瀷鐨則rigger鐨勭?浜屼釜鍙傛暟',
  `str_prop_3` varchar(512) DEFAULT NULL COMMENT 'String绫诲瀷鐨則rigger鐨勭?涓変釜鍙傛暟',
  `int_prop_1` int(11) DEFAULT NULL COMMENT 'int绫诲瀷鐨則rigger鐨勭?涓?釜鍙傛暟',
  `int_prop_2` int(11) DEFAULT NULL COMMENT 'int绫诲瀷鐨則rigger鐨勭?浜屼釜鍙傛暟',
  `long_prop_1` bigint(20) DEFAULT NULL COMMENT 'long绫诲瀷鐨則rigger鐨勭?涓?釜鍙傛暟',
  `long_prop_2` bigint(20) DEFAULT NULL COMMENT 'long绫诲瀷鐨則rigger鐨勭?浜屼釜鍙傛暟',
  `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal绫诲瀷鐨則rigger鐨勭?涓?釜鍙傛暟',
  `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal绫诲瀷鐨則rigger鐨勭?浜屼釜鍙傛暟',
  `bool_prop_1` varchar(1) DEFAULT NULL COMMENT 'Boolean绫诲瀷鐨則rigger鐨勭?涓?釜鍙傛暟',
  `bool_prop_2` varchar(1) DEFAULT NULL COMMENT 'Boolean绫诲瀷鐨則rigger鐨勭?浜屼釜鍙傛暟',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='鍚屾?鏈哄埗鐨勮?閿佽〃';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '璋冨害鍚嶇О',
  `trigger_name` varchar(200) NOT NULL COMMENT '瑙﹀彂鍣ㄧ殑鍚嶅瓧',
  `trigger_group` varchar(200) NOT NULL COMMENT '瑙﹀彂鍣ㄦ墍灞炵粍鐨勫悕瀛',
  `job_name` varchar(200) NOT NULL COMMENT 'qrtz_job_details琛╦ob_name鐨勫?閿',
  `job_group` varchar(200) NOT NULL COMMENT 'qrtz_job_details琛╦ob_group鐨勫?閿',
  `description` varchar(250) DEFAULT NULL COMMENT '鐩稿叧浠嬬粛',
  `next_fire_time` bigint(13) DEFAULT NULL COMMENT '涓婁竴娆¤Е鍙戞椂闂达紙姣??锛',
  `prev_fire_time` bigint(13) DEFAULT NULL COMMENT '涓嬩竴娆¤Е鍙戞椂闂达紙榛樿?涓?1琛ㄧず涓嶈Е鍙戯級',
  `priority` int(11) DEFAULT NULL COMMENT '浼樺厛绾',
  `trigger_state` varchar(16) NOT NULL COMMENT '瑙﹀彂鍣ㄧ姸鎬',
  `trigger_type` varchar(8) NOT NULL COMMENT '瑙﹀彂鍣ㄧ殑绫诲瀷',
  `start_time` bigint(13) NOT NULL COMMENT '寮??鏃堕棿',
  `end_time` bigint(13) DEFAULT NULL COMMENT '缁撴潫鏃堕棿',
  `calendar_name` varchar(200) DEFAULT NULL COMMENT '鏃ョ▼琛ㄥ悕绉',
  `misfire_instr` smallint(2) DEFAULT NULL COMMENT '琛ュ伩鎵ц?鐨勭瓥鐣',
  `job_data` blob COMMENT '瀛樻斁鎸佷箙鍖杍ob瀵硅薄',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='瑙﹀彂鍣ㄨ?缁嗕俊鎭?〃';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2025-12-26 15:15:34','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2025-12-26 15:15:34','',NULL,'初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2025-12-26 15:15:34','',NULL,'深色主题theme-dark，浅色主题theme-light'),(4,'账号自助-验证码开关','sys.account.captchaEnabled','true','Y','admin','2025-12-26 15:15:34','',NULL,'是否开启验证码功能（true开启，false关闭）'),(5,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2025-12-26 15:15:34','',NULL,'是否开启注册用户功能（true开启，false关闭）'),(6,'用户登录-黑名单列表','sys.login.blackIPList','','Y','admin','2025-12-26 15:15:34','',NULL,'设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）'),(7,'用户管理-初始密码修改策略','sys.account.initPasswordModify','1','Y','admin','2025-12-26 15:15:34','',NULL,'0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框'),(8,'用户管理-账号密码更新周期','sys.account.passwordValidateDays','0','Y','admin','2025-12-26 15:15:34','',NULL,'密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
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
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (100,0,'0','若依科技',0,'若依','15888888888','ry@qq.com','0','0','admin','2025-12-26 15:15:33','',NULL),(101,100,'0,100','深圳总公司',1,'若依','15888888888','ry@qq.com','0','0','admin','2025-12-26 15:15:33','',NULL),(102,100,'0,100','长沙分公司',2,'若依','15888888888','ry@qq.com','0','0','admin','2025-12-26 15:15:33','',NULL),(103,101,'0,100,101','研发部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2025-12-26 15:15:33','',NULL),(104,101,'0,100,101','市场部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2025-12-26 15:15:33','',NULL),(105,101,'0,100,101','测试部门',3,'若依','15888888888','ry@qq.com','0','0','admin','2025-12-26 15:15:33','',NULL),(106,101,'0,100,101','财务部门',4,'若依','15888888888','ry@qq.com','0','0','admin','2025-12-26 15:15:33','',NULL),(107,101,'0,100,101','运维部门',5,'若依','15888888888','ry@qq.com','0','0','admin','2025-12-26 15:15:33','',NULL),(108,102,'0,100,102','市场部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2025-12-26 15:15:33','',NULL),(109,102,'0,100,102','财务部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2025-12-26 15:15:33','',NULL);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,1,'男','0','sys_user_sex','','','Y','0','admin','2025-12-26 15:15:34','',NULL,'性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2025-12-26 15:15:34','',NULL,'性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2025-12-26 15:15:34','',NULL,'性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2025-12-26 15:15:34','',NULL,'显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2025-12-26 15:15:34','',NULL,'隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2025-12-26 15:15:34','',NULL,'正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2025-12-26 15:15:34','',NULL,'停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2025-12-26 15:15:34','',NULL,'正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2025-12-26 15:15:34','',NULL,'停用状态'),(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2025-12-26 15:15:34','',NULL,'默认分组'),(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2025-12-26 15:15:34','',NULL,'系统分组'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2025-12-26 15:15:34','',NULL,'系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2025-12-26 15:15:34','',NULL,'系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2025-12-26 15:15:34','',NULL,'通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2025-12-26 15:15:34','',NULL,'公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2025-12-26 15:15:34','',NULL,'正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2025-12-26 15:15:34','',NULL,'关闭状态'),(18,99,'其他','0','sys_oper_type','','info','N','0','admin','2025-12-26 15:15:34','',NULL,'其他操作'),(19,1,'新增','1','sys_oper_type','','info','N','0','admin','2025-12-26 15:15:34','',NULL,'新增操作'),(20,2,'修改','2','sys_oper_type','','info','N','0','admin','2025-12-26 15:15:34','',NULL,'修改操作'),(21,3,'删除','3','sys_oper_type','','danger','N','0','admin','2025-12-26 15:15:34','',NULL,'删除操作'),(22,4,'授权','4','sys_oper_type','','primary','N','0','admin','2025-12-26 15:15:34','',NULL,'授权操作'),(23,5,'导出','5','sys_oper_type','','warning','N','0','admin','2025-12-26 15:15:34','',NULL,'导出操作'),(24,6,'导入','6','sys_oper_type','','warning','N','0','admin','2025-12-26 15:15:34','',NULL,'导入操作'),(25,7,'强退','7','sys_oper_type','','danger','N','0','admin','2025-12-26 15:15:34','',NULL,'强退操作'),(26,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2025-12-26 15:15:34','',NULL,'生成操作'),(27,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2025-12-26 15:15:34','',NULL,'清空操作'),(28,1,'成功','0','sys_common_status','','primary','N','0','admin','2025-12-26 15:15:34','',NULL,'正常状态'),(29,2,'失败','1','sys_common_status','','danger','N','0','admin','2025-12-26 15:15:34','',NULL,'停用状态'),(30,1,'已选课','ENROLLED','11','primary','primary','Y','0','admin','2025-12-28 21:01:50','admin','2025-12-28 21:01:50',''),(31,2,'已退课','DROPPED','11','info','info','N','0','admin','2025-12-28 21:01:50','admin','2025-12-28 21:01:50',''),(32,1,'草稿','DRAFT','12','warning','warning','Y','0','admin','2025-12-28 21:01:50','admin','2025-12-28 21:01:50',''),(33,2,'已发布','PUBLISHED','12','success','success','N','0','admin','2025-12-28 21:01:50','admin','2025-12-28 21:01:50',''),(34,1,'未激活','0','13','info','info','Y','0','admin','2025-12-28 21:01:50','admin','2025-12-28 21:01:50',''),(35,2,'激活中','1','13','success','success','N','0','admin','2025-12-28 21:01:50','admin','2025-12-28 21:01:50','');
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex','0','admin','2025-12-26 15:15:34','admin','2025-12-28 20:55:35','用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2025-12-26 15:15:34','',NULL,'菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2025-12-26 15:15:34','',NULL,'系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2025-12-26 15:15:34','',NULL,'任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2025-12-26 15:15:34','',NULL,'任务分组列表'),(6,'系统是否','sys_yes_no','0','admin','2025-12-26 15:15:34','',NULL,'系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2025-12-26 15:15:34','',NULL,'通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2025-12-26 15:15:34','',NULL,'通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2025-12-26 15:15:34','',NULL,'操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2025-12-26 15:15:34','',NULL,'登录状态列表'),(11,'选课状态','edu_enrollment_status','0','admin','2025-12-28 20:54:26','',NULL,'学生选课状态：ENROLLED-已选课，DROPPED-已退课'),(12,'成绩状态','edu_grade_status','0','admin','2025-12-28 20:56:16','',NULL,'学生成绩状态：DRAFT-草稿（教师可编辑），PUBLISHED-已发布（学生可见）'),(13,'学期状态','edu_term_status','0','admin','2025-12-28 20:56:38','',NULL,'学期状态：0-未激活，1-激活中（可进行选课操作）');
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job`
--

DROP TABLE IF EXISTS `sys_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='定时任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
INSERT INTO `sys_job` VALUES (1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2025-12-26 15:15:34','',NULL,''),(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2025-12-26 15:15:34','',NULL,''),(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2025-12-26 15:15:34','',NULL,'');
/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job_log`
--

DROP TABLE IF EXISTS `sys_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='定时任务调度日志表';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
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
) ENGINE=InnoDB AUTO_INCREMENT=268 DEFAULT CHARSET=utf8mb4 COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;
INSERT INTO `sys_logininfor` VALUES (100,'admin','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2025-12-26 15:33:33'),(101,'admin','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2025-12-26 21:15:53'),(102,'admin','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2025-12-28 15:22:00'),(103,'admin','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2025-12-28 20:50:02'),(104,'admin','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2025-12-29 00:27:51'),(105,'admin','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2025-12-29 00:28:25'),(106,'student','127.0.0.1','内网IP','Chrome 143','Windows10','1','用户不存在/密码错误','2025-12-29 00:28:49'),(107,'student','127.0.0.1','内网IP','Chrome 143','Windows10','1','用户不存在/密码错误','2025-12-29 00:29:02'),(108,'teacher','127.0.0.1','内网IP','Chrome 143','Windows10','1','用户不存在/密码错误','2025-12-29 00:29:13'),(109,'1001','127.0.0.1','内网IP','Chrome 143','Windows10','1','验证码错误','2025-12-29 00:29:24'),(110,'1001','127.0.0.1','内网IP','Chrome 143','Windows10','1','用户不存在/密码错误','2025-12-29 00:29:29'),(111,'1001','127.0.0.1','内网IP','Chrome 143','Windows10','1','验证码错误','2025-12-29 00:29:54'),(112,'1001','127.0.0.1','内网IP','Chrome 143','Windows10','1','用户不存在/密码错误','2025-12-29 00:29:58'),(113,'student','127.0.0.1','内网IP','Chrome 143','Windows10','1','验证码已失效','2025-12-29 00:34:37'),(114,'student','127.0.0.1','内网IP','Chrome 143','Windows10','1','用户不存在/密码错误','2025-12-29 00:34:44'),(115,'student','127.0.0.1','内网IP','Chrome 143','Windows10','1','验证码错误','2025-12-29 00:35:00'),(116,'student','127.0.0.1','内网IP','Chrome 143','Windows10','1','用户不存在/密码错误','2025-12-29 00:35:09'),(117,'teacher','127.0.0.1','内网IP','Chrome 143','Windows10','1','用户不存在/密码错误','2025-12-29 00:35:22'),(118,'student','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2025-12-29 00:39:32'),(119,'student','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2025-12-29 00:43:20'),(120,'teacher','127.0.0.1','内网IP','Chrome 143','Windows10','1','验证码错误','2025-12-29 00:43:28'),(121,'teacher','127.0.0.1','内网IP','Chrome 143','Windows10','1','验证码错误','2025-12-29 00:43:33'),(122,'teacher','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2025-12-29 00:43:39'),(123,'student','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2025-12-29 08:09:46'),(124,'student','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2025-12-29 08:11:01'),(125,'admin','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2025-12-29 08:11:05'),(126,'admin','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2025-12-29 09:07:58'),(127,'admin','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2025-12-29 09:08:05'),(128,'admin','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2025-12-29 09:15:17'),(129,'admin','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2025-12-29 09:15:21'),(130,'admin','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2025-12-29 09:25:17'),(131,'student','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2025-12-29 09:25:19'),(132,'student','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2025-12-29 09:27:59'),(133,'teacher','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2025-12-29 09:28:06'),(134,'admin','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2025-12-29 10:16:39'),(135,'admin','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2025-12-29 10:41:58'),(136,'admin','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2025-12-29 11:29:22'),(137,'student','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2025-12-29 13:06:48'),(138,'admin','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2025-12-29 16:14:05'),(139,'admin','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2025-12-29 16:17:00'),(140,'student','127.0.0.1','内网IP','Chrome 143','Windows10','1','验证码错误','2025-12-29 16:17:07'),(141,'student','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2025-12-29 16:17:11'),(142,'student','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2025-12-29 16:17:49'),(143,'teacher','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2025-12-29 16:17:59'),(144,'admin','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2025-12-30 16:05:26'),(145,'admin','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2025-12-30 19:02:55'),(146,'admin','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2025-12-30 19:04:08'),(147,'student2001','127.0.0.1','内网IP','Chrome 143','Windows10','1','用户不存在/密码错误','2025-12-30 19:04:25'),(148,'student2001','127.0.0.1','内网IP','Chrome 143','Windows10','1','用户不存在/密码错误','2025-12-30 19:04:46'),(149,'student2002','127.0.0.1','内网IP','Chrome 143','Windows10','1','用户不存在/密码错误','2025-12-30 19:04:57'),(150,'student2003','127.0.0.1','内网IP','Chrome 143','Windows10','1','验证码错误','2025-12-30 19:05:05'),(151,'student2004','127.0.0.1','内网IP','Chrome 143','Windows10','1','用户不存在/密码错误','2025-12-30 19:05:10'),(152,'student2005','127.0.0.1','内网IP','Chrome 143','Windows10','1','用户不存在/密码错误','2025-12-30 19:05:17'),(153,'student1001','127.0.0.1','内网IP','Chrome 143','Windows10','1','用户不存在/密码错误','2025-12-30 19:05:35'),(154,'student1008','127.0.0.1','内网IP','Chrome 143','Windows10','1','用户不存在/密码错误','2025-12-30 19:05:45'),(155,'student1008','127.0.0.1','内网IP','Chrome 143','Windows10','1','验证码错误','2025-12-30 19:06:23'),(156,'student1008','127.0.0.1','内网IP','Chrome 143','Windows10','1','用户不存在/密码错误','2025-12-30 19:06:27'),(157,'admin','127.0.0.1','内网IP','Chrome 143','Windows10','1','验证码已失效','2025-12-30 19:08:40'),(158,'admin','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2025-12-30 19:08:43'),(159,'admin','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2025-12-30 19:10:27'),(160,'b_teacher1001','127.0.0.1','内网IP','Chrome 143','Windows10','1','用户不存在/密码错误','2025-12-30 19:11:16'),(161,'b_student2001','127.0.0.1','内网IP','Chrome 143','Windows10','1','验证码已失效','2025-12-30 19:14:21'),(162,'b_student2001','127.0.0.1','内网IP','Chrome 143','Windows10','1','用户不存在/密码错误','2025-12-30 19:14:25'),(163,'b_student2010','127.0.0.1','内网IP','Chrome 143','Windows10','1','用户不存在/密码错误','2025-12-30 19:14:41'),(164,'b_teacher1001','127.0.0.1','内网IP','Chrome 143','Windows10','1','用户不存在/密码错误','2025-12-30 19:14:58'),(165,'b_teacher1008','127.0.0.1','内网IP','Chrome 143','Windows10','1','用户不存在/密码错误','2025-12-30 19:15:07'),(166,'admin','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2025-12-30 20:05:56'),(167,'admin','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2025-12-30 20:06:16'),(168,'b_teacher1001','127.0.0.1','内网IP','Chrome 143','Windows10','1','用户不存在/密码错误','2025-12-30 20:06:32'),(169,'b_teacher1001','127.0.0.1','内网IP','Chrome 143','Windows10','1','验证码错误','2025-12-30 20:06:36'),(170,'b_teacher1001','127.0.0.1','内网IP','Chrome 143','Windows10','1','用户不存在/密码错误','2025-12-30 20:06:52'),(171,'b_teacher1001','127.0.0.1','内网IP','Chrome 143','Windows10','1','用户不存在/密码错误','2025-12-30 20:07:05'),(172,'student','127.0.0.1','内网IP','Chrome 143','Windows10','1','验证码错误','2025-12-30 20:08:14'),(173,'student','127.0.0.1','内网IP','Chrome 143','Windows10','1','验证码错误','2025-12-30 20:08:21'),(174,'student','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2025-12-30 20:08:24'),(175,'student','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2025-12-30 20:13:54'),(176,'student','127.0.0.1','内网IP','Chrome 143','Windows10','1','验证码已失效','2025-12-30 20:24:14'),(177,'student','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2025-12-30 20:24:18'),(178,'student','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2025-12-30 20:24:25'),(179,'b_teacher1001','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2025-12-30 20:24:50'),(180,'b_teacher1001','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2025-12-30 20:25:23'),(181,'b_student2001','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2025-12-30 20:26:39'),(182,'b_student2001','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2025-12-30 20:33:25'),(183,'student','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2025-12-30 20:33:36'),(184,'b_student2001','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-04 08:54:25'),(185,'student','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-04 11:59:15'),(186,'student','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2026-01-04 12:00:25'),(187,'teacher','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-04 12:00:33'),(188,'teacher','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-04 12:09:33'),(189,'teacher','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2026-01-04 12:12:27'),(190,'admin','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-04 12:12:31'),(191,'admin','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2026-01-04 12:13:13'),(192,'teacher','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-04 12:13:23'),(193,'teacher','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2026-01-04 12:13:32'),(194,'student','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-04 12:13:39'),(195,'student','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2026-01-04 12:14:16'),(196,'b_teacher1001','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-04 12:14:24'),(197,'b_teacher1001','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2026-01-04 12:18:30'),(198,'student','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-04 12:18:40'),(199,'student','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-04 12:28:26'),(200,'student','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2026-01-04 12:28:56'),(201,'student','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-04 12:29:04'),(202,'student','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2026-01-04 12:29:20'),(203,'student','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-04 12:29:29'),(204,'student','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2026-01-04 12:39:31'),(205,'student','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-04 12:39:39'),(206,'student','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2026-01-04 12:40:02'),(207,'teacher','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-04 12:40:09'),(208,'student','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-04 12:44:38'),(209,'student','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2026-01-04 12:44:49'),(210,'teacher','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-04 12:45:01'),(211,'student','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-04 12:49:09'),(212,'student','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2026-01-04 12:50:30'),(213,'teacher','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-04 12:50:37'),(214,'teacher','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2026-01-04 12:50:46'),(215,'b_teacher1001','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-04 12:50:54'),(216,'b_teacher1001','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2026-01-04 12:51:53'),(217,'teacher','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-04 12:51:59'),(218,'teacher','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2026-01-04 12:53:10'),(219,'student','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-04 12:53:16'),(220,'student','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-04 13:21:40'),(221,'student','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-04 13:58:37'),(222,'student','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2026-01-04 13:58:49'),(223,'teacher','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-04 13:58:56'),(224,'teacher','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2026-01-04 13:59:05'),(225,'student','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-04 13:59:12'),(226,'admin','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-04 15:12:54'),(227,'admin','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2026-01-04 15:14:11'),(228,'admin_edu','127.0.0.1','内网IP','Chrome 143','Windows10','1','用户不存在/密码错误','2026-01-04 15:14:25'),(229,'admin','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-04 15:24:35'),(230,'admin','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2026-01-04 15:27:11'),(231,'admin_edu','127.0.0.1','内网IP','Chrome 143','Windows10','1','用户不存在/密码错误','2026-01-04 15:27:28'),(232,'admin_edu','127.0.0.1','内网IP','Chrome 143','Windows10','1','验证码已失效','2026-01-04 15:34:17'),(233,'admin_edu','127.0.0.1','内网IP','Chrome 143','Windows10','1','验证码错误','2026-01-04 15:34:18'),(234,'admin_edu','127.0.0.1','内网IP','Chrome 143','Windows10','1','用户不存在/密码错误','2026-01-04 15:34:24'),(235,'admin_edu','127.0.0.1','内网IP','Chrome 143','Windows10','1','用户不存在/密码错误','2026-01-04 15:34:47'),(236,'admin_edu','127.0.0.1','内网IP','Chrome 143','Windows10','1','用户不存在/密码错误','2026-01-04 15:35:10'),(237,'admin_edu','127.0.0.1','内网IP','Chrome 143','Windows10','1','用户不存在/密码错误','2026-01-04 15:38:09'),(238,'admin_edu','127.0.0.1','内网IP','Chrome 143','Windows10','1','验证码已失效','2026-01-04 15:42:46'),(239,'admin_edu','127.0.0.1','内网IP','Chrome 143','Windows10','1','用户不存在/密码错误','2026-01-04 15:42:49'),(240,'admin_edu','127.0.0.1','内网IP','Chrome 143','Windows10','1','密码输入错误5次，帐户锁定10分钟','2026-01-04 15:43:13'),(241,'teacher','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-04 15:43:19'),(242,'teacher','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2026-01-04 15:52:17'),(243,'admin_edu','127.0.0.1','内网IP','Chrome 143','Windows10','1','密码输入错误5次，帐户锁定10分钟','2026-01-04 15:52:20'),(244,'admin_edu','127.0.0.1','内网IP','Chrome 143','Windows10','1','验证码错误','2026-01-04 15:52:37'),(245,'admin_edu','127.0.0.1','内网IP','Chrome 143','Windows10','1','密码输入错误5次，帐户锁定10分钟','2026-01-04 15:52:41'),(246,'admin_edu','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-04 15:53:16'),(247,'admin_edu','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-04 16:46:05'),(248,'admin_edu','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2026-01-04 16:47:12'),(249,'student','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-04 16:47:20'),(250,'student','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2026-01-04 16:49:04'),(251,'admin_edu','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-04 16:49:11'),(252,'admin_edu','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2026-01-04 16:58:17'),(253,'student','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-04 16:58:27'),(254,'student','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2026-01-04 16:59:18'),(255,'admin','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-04 16:59:22'),(256,'admin','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2026-01-04 16:59:37'),(257,'admin_edu','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-04 16:59:47'),(258,'admin_edu','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2026-01-04 17:00:43'),(259,'student','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-04 17:00:51'),(260,'student','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2026-01-04 17:04:32'),(261,'steacher','127.0.0.1','内网IP','Chrome 143','Windows10','1','用户不存在/密码错误','2026-01-04 17:04:44'),(262,'teacher','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-04 17:04:52'),(263,'student','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-04 19:42:22'),(264,'student','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2026-01-04 19:42:36'),(265,'student','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-04 19:42:44'),(266,'student','127.0.0.1','内网IP','Chrome 143','Windows10','0','退出成功','2026-01-04 19:42:49'),(267,'admin_edu','127.0.0.1','内网IP','Chrome 143','Windows10','0','登录成功','2026-01-04 19:43:03');
/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) DEFAULT '' COMMENT '路由名称',
  `is_frame` int(1) DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
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
) ENGINE=InnoDB AUTO_INCREMENT=2339 DEFAULT CHARSET=utf8mb4 COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',0,1,'system',NULL,'','',1,0,'M','0','0','','system','admin','2025-12-26 15:15:34','',NULL,'系统管理目录'),(2,'系统监控',0,2,'monitor',NULL,'','',1,0,'M','0','0','','monitor','admin','2025-12-26 15:15:34','',NULL,'系统监控目录'),(3,'系统工具',0,3,'tool',NULL,'','',1,0,'M','0','0','','tool','admin','2025-12-26 15:15:34','',NULL,'系统工具目录'),(4,'若依官网',0,4,'http://ruoyi.vip',NULL,'','',0,0,'M','0','0','','guide','admin','2025-12-26 15:15:34','',NULL,'若依官网地址'),(100,'用户管理',1,1,'user','system/user/index','','',1,0,'C','0','0','system:user:list','user','admin','2025-12-26 15:15:34','',NULL,'用户管理菜单'),(101,'角色管理',1,2,'role','system/role/index','','',1,0,'C','0','0','system:role:list','peoples','admin','2025-12-26 15:15:34','',NULL,'角色管理菜单'),(102,'菜单管理',1,3,'menu','system/menu/index','','',1,0,'C','0','0','system:menu:list','tree-table','admin','2025-12-26 15:15:34','',NULL,'菜单管理菜单'),(103,'部门管理',1,4,'dept','system/dept/index','','',1,0,'C','0','0','system:dept:list','tree','admin','2025-12-26 15:15:34','',NULL,'部门管理菜单'),(104,'岗位管理',1,5,'post','system/post/index','','',1,0,'C','0','0','system:post:list','post','admin','2025-12-26 15:15:34','',NULL,'岗位管理菜单'),(105,'字典管理',1,6,'dict','system/dict/index','','',1,0,'C','0','0','system:dict:list','dict','admin','2025-12-26 15:15:34','',NULL,'字典管理菜单'),(106,'参数设置',1,7,'config','system/config/index','','',1,0,'C','0','0','system:config:list','edit','admin','2025-12-26 15:15:34','',NULL,'参数设置菜单'),(107,'通知公告',1,8,'notice','system/notice/index','','',1,0,'C','0','0','system:notice:list','message','admin','2025-12-26 15:15:34','',NULL,'通知公告菜单'),(108,'日志管理',1,9,'log','','','',1,0,'M','0','0','','log','admin','2025-12-26 15:15:34','',NULL,'日志管理菜单'),(109,'在线用户',2,1,'online','monitor/online/index','','',1,0,'C','0','0','monitor:online:list','online','admin','2025-12-26 15:15:34','',NULL,'在线用户菜单'),(110,'定时任务',2,2,'job','monitor/job/index','','',1,0,'C','0','0','monitor:job:list','job','admin','2025-12-26 15:15:34','',NULL,'定时任务菜单'),(111,'数据监控',2,3,'druid','monitor/druid/index','','',1,0,'C','0','0','monitor:druid:list','druid','admin','2025-12-26 15:15:34','',NULL,'数据监控菜单'),(112,'服务监控',2,4,'server','monitor/server/index','','',1,0,'C','0','0','monitor:server:list','server','admin','2025-12-26 15:15:34','',NULL,'服务监控菜单'),(113,'缓存监控',2,5,'cache','monitor/cache/index','','',1,0,'C','0','0','monitor:cache:list','redis','admin','2025-12-26 15:15:34','',NULL,'缓存监控菜单'),(114,'缓存列表',2,6,'cacheList','monitor/cache/list','','',1,0,'C','0','0','monitor:cache:list','redis-list','admin','2025-12-26 15:15:34','',NULL,'缓存列表菜单'),(115,'表单构建',3,1,'build','tool/build/index','','',1,0,'C','0','0','tool:build:list','build','admin','2025-12-26 15:15:34','',NULL,'表单构建菜单'),(116,'代码生成',3,2,'gen','tool/gen/index','','',1,0,'C','0','0','tool:gen:list','code','admin','2025-12-26 15:15:34','',NULL,'代码生成菜单'),(117,'系统接口',3,3,'swagger','tool/swagger/index','','',1,0,'C','0','0','tool:swagger:list','swagger','admin','2025-12-26 15:15:34','',NULL,'系统接口菜单'),(500,'操作日志',108,1,'operlog','monitor/operlog/index','','',1,0,'C','0','0','monitor:operlog:list','form','admin','2025-12-26 15:15:34','',NULL,'操作日志菜单'),(501,'登录日志',108,2,'logininfor','monitor/logininfor/index','','',1,0,'C','0','0','monitor:logininfor:list','logininfor','admin','2025-12-26 15:15:34','',NULL,'登录日志菜单'),(1000,'用户查询',100,1,'','','','',1,0,'F','0','0','system:user:query','#','admin','2025-12-26 15:15:34','',NULL,''),(1001,'用户新增',100,2,'','','','',1,0,'F','0','0','system:user:add','#','admin','2025-12-26 15:15:34','',NULL,''),(1002,'用户修改',100,3,'','','','',1,0,'F','0','0','system:user:edit','#','admin','2025-12-26 15:15:34','',NULL,''),(1003,'用户删除',100,4,'','','','',1,0,'F','0','0','system:user:remove','#','admin','2025-12-26 15:15:34','',NULL,''),(1004,'用户导出',100,5,'','','','',1,0,'F','0','0','system:user:export','#','admin','2025-12-26 15:15:34','',NULL,''),(1005,'用户导入',100,6,'','','','',1,0,'F','0','0','system:user:import','#','admin','2025-12-26 15:15:34','',NULL,''),(1006,'重置密码',100,7,'','','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2025-12-26 15:15:34','',NULL,''),(1007,'角色查询',101,1,'','','','',1,0,'F','0','0','system:role:query','#','admin','2025-12-26 15:15:34','',NULL,''),(1008,'角色新增',101,2,'','','','',1,0,'F','0','0','system:role:add','#','admin','2025-12-26 15:15:34','',NULL,''),(1009,'角色修改',101,3,'','','','',1,0,'F','0','0','system:role:edit','#','admin','2025-12-26 15:15:34','',NULL,''),(1010,'角色删除',101,4,'','','','',1,0,'F','0','0','system:role:remove','#','admin','2025-12-26 15:15:34','',NULL,''),(1011,'角色导出',101,5,'','','','',1,0,'F','0','0','system:role:export','#','admin','2025-12-26 15:15:34','',NULL,''),(1012,'菜单查询',102,1,'','','','',1,0,'F','0','0','system:menu:query','#','admin','2025-12-26 15:15:34','',NULL,''),(1013,'菜单新增',102,2,'','','','',1,0,'F','0','0','system:menu:add','#','admin','2025-12-26 15:15:34','',NULL,''),(1014,'菜单修改',102,3,'','','','',1,0,'F','0','0','system:menu:edit','#','admin','2025-12-26 15:15:34','',NULL,''),(1015,'菜单删除',102,4,'','','','',1,0,'F','0','0','system:menu:remove','#','admin','2025-12-26 15:15:34','',NULL,''),(1016,'部门查询',103,1,'','','','',1,0,'F','0','0','system:dept:query','#','admin','2025-12-26 15:15:34','',NULL,''),(1017,'部门新增',103,2,'','','','',1,0,'F','0','0','system:dept:add','#','admin','2025-12-26 15:15:34','',NULL,''),(1018,'部门修改',103,3,'','','','',1,0,'F','0','0','system:dept:edit','#','admin','2025-12-26 15:15:34','',NULL,''),(1019,'部门删除',103,4,'','','','',1,0,'F','0','0','system:dept:remove','#','admin','2025-12-26 15:15:34','',NULL,''),(1020,'岗位查询',104,1,'','','','',1,0,'F','0','0','system:post:query','#','admin','2025-12-26 15:15:34','',NULL,''),(1021,'岗位新增',104,2,'','','','',1,0,'F','0','0','system:post:add','#','admin','2025-12-26 15:15:34','',NULL,''),(1022,'岗位修改',104,3,'','','','',1,0,'F','0','0','system:post:edit','#','admin','2025-12-26 15:15:34','',NULL,''),(1023,'岗位删除',104,4,'','','','',1,0,'F','0','0','system:post:remove','#','admin','2025-12-26 15:15:34','',NULL,''),(1024,'岗位导出',104,5,'','','','',1,0,'F','0','0','system:post:export','#','admin','2025-12-26 15:15:34','',NULL,''),(1025,'字典查询',105,1,'#','','','',1,0,'F','0','0','system:dict:query','#','admin','2025-12-26 15:15:34','',NULL,''),(1026,'字典新增',105,2,'#','','','',1,0,'F','0','0','system:dict:add','#','admin','2025-12-26 15:15:34','',NULL,''),(1027,'字典修改',105,3,'#','','','',1,0,'F','0','0','system:dict:edit','#','admin','2025-12-26 15:15:34','',NULL,''),(1028,'字典删除',105,4,'#','','','',1,0,'F','0','0','system:dict:remove','#','admin','2025-12-26 15:15:34','',NULL,''),(1029,'字典导出',105,5,'#','','','',1,0,'F','0','0','system:dict:export','#','admin','2025-12-26 15:15:34','',NULL,''),(1030,'参数查询',106,1,'#','','','',1,0,'F','0','0','system:config:query','#','admin','2025-12-26 15:15:34','',NULL,''),(1031,'参数新增',106,2,'#','','','',1,0,'F','0','0','system:config:add','#','admin','2025-12-26 15:15:34','',NULL,''),(1032,'参数修改',106,3,'#','','','',1,0,'F','0','0','system:config:edit','#','admin','2025-12-26 15:15:34','',NULL,''),(1033,'参数删除',106,4,'#','','','',1,0,'F','0','0','system:config:remove','#','admin','2025-12-26 15:15:34','',NULL,''),(1034,'参数导出',106,5,'#','','','',1,0,'F','0','0','system:config:export','#','admin','2025-12-26 15:15:34','',NULL,''),(1035,'公告查询',107,1,'#','','','',1,0,'F','0','0','system:notice:query','#','admin','2025-12-26 15:15:34','',NULL,''),(1036,'公告新增',107,2,'#','','','',1,0,'F','0','0','system:notice:add','#','admin','2025-12-26 15:15:34','',NULL,''),(1037,'公告修改',107,3,'#','','','',1,0,'F','0','0','system:notice:edit','#','admin','2025-12-26 15:15:34','',NULL,''),(1038,'公告删除',107,4,'#','','','',1,0,'F','0','0','system:notice:remove','#','admin','2025-12-26 15:15:34','',NULL,''),(1039,'操作查询',500,1,'#','','','',1,0,'F','0','0','monitor:operlog:query','#','admin','2025-12-26 15:15:34','',NULL,''),(1040,'操作删除',500,2,'#','','','',1,0,'F','0','0','monitor:operlog:remove','#','admin','2025-12-26 15:15:34','',NULL,''),(1041,'日志导出',500,3,'#','','','',1,0,'F','0','0','monitor:operlog:export','#','admin','2025-12-26 15:15:34','',NULL,''),(1042,'登录查询',501,1,'#','','','',1,0,'F','0','0','monitor:logininfor:query','#','admin','2025-12-26 15:15:34','',NULL,''),(1043,'登录删除',501,2,'#','','','',1,0,'F','0','0','monitor:logininfor:remove','#','admin','2025-12-26 15:15:34','',NULL,''),(1044,'日志导出',501,3,'#','','','',1,0,'F','0','0','monitor:logininfor:export','#','admin','2025-12-26 15:15:34','',NULL,''),(1045,'账户解锁',501,4,'#','','','',1,0,'F','0','0','monitor:logininfor:unlock','#','admin','2025-12-26 15:15:34','',NULL,''),(1046,'在线查询',109,1,'#','','','',1,0,'F','0','0','monitor:online:query','#','admin','2025-12-26 15:15:34','',NULL,''),(1047,'批量强退',109,2,'#','','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2025-12-26 15:15:34','',NULL,''),(1048,'单条强退',109,3,'#','','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2025-12-26 15:15:34','',NULL,''),(1049,'任务查询',110,1,'#','','','',1,0,'F','0','0','monitor:job:query','#','admin','2025-12-26 15:15:34','',NULL,''),(1050,'任务新增',110,2,'#','','','',1,0,'F','0','0','monitor:job:add','#','admin','2025-12-26 15:15:34','',NULL,''),(1051,'任务修改',110,3,'#','','','',1,0,'F','0','0','monitor:job:edit','#','admin','2025-12-26 15:15:34','',NULL,''),(1052,'任务删除',110,4,'#','','','',1,0,'F','0','0','monitor:job:remove','#','admin','2025-12-26 15:15:34','',NULL,''),(1053,'状态修改',110,5,'#','','','',1,0,'F','0','0','monitor:job:changeStatus','#','admin','2025-12-26 15:15:34','',NULL,''),(1054,'任务导出',110,6,'#','','','',1,0,'F','0','0','monitor:job:export','#','admin','2025-12-26 15:15:34','',NULL,''),(1055,'生成查询',116,1,'#','','','',1,0,'F','0','0','tool:gen:query','#','admin','2025-12-26 15:15:34','',NULL,''),(1056,'生成修改',116,2,'#','','','',1,0,'F','0','0','tool:gen:edit','#','admin','2025-12-26 15:15:34','',NULL,''),(1057,'生成删除',116,3,'#','','','',1,0,'F','0','0','tool:gen:remove','#','admin','2025-12-26 15:15:34','',NULL,''),(1058,'导入代码',116,4,'#','','','',1,0,'F','0','0','tool:gen:import','#','admin','2025-12-26 15:15:34','',NULL,''),(1059,'预览代码',116,5,'#','','','',1,0,'F','0','0','tool:gen:preview','#','admin','2025-12-26 15:15:34','',NULL,''),(1060,'生成代码',116,6,'#','','','',1,0,'F','0','0','tool:gen:code','#','admin','2025-12-26 15:15:34','',NULL,''),(1062,'学生课程管理',1061,1,'student/course','edu/student/course/index',NULL,'CourseManagement',1,0,'C','0','0','edu:student:course:list','post','admin','2025-12-29 08:20:49','admin','2025-12-29 11:29:50',''),(1063,'学生学分管理',1061,2,'student/credits','edu/student/credits/index',NULL,'CreditManagement',1,0,'C','0','0','edu:student:credits:list','bug','admin','2025-12-29 08:29:22','admin','2025-12-29 11:30:00',''),(1064,'学生成绩管理',1061,3,'student/grades','edu/student/grades/index',NULL,'StudentGradeQuery',1,0,'C','0','0','edu:student:grades:list','bug','admin','2025-12-29 08:30:34','admin','2025-12-29 11:30:07',''),(1065,'学生课表管理',1061,4,'student/timetable','edu/student/timetable/index',NULL,'TimetableManagement',1,0,'C','0','0','edu:student:timetable:list','#','admin','2025-12-29 08:31:59','admin','2025-12-29 11:30:13',''),(1066,'教师班级管理',1061,5,'teacher/classes','edu/teacher/classes/index',NULL,'ClassManagement',1,0,'C','0','0','edu:teacher:classes:list','#','admin','2025-12-29 08:32:56','admin','2025-12-29 11:30:20',''),(1067,' 教师成绩管理',1061,6,'teacher/grades','edu/teacher/grades/index',NULL,'GradeManagement',1,0,'C','0','0','edu:teacher:grades:list','#','admin','2025-12-29 08:35:32','admin','2025-12-29 11:30:28',''),(2000,'教务管理',0,1,'edu','Layout',NULL,'',1,0,'M','0','0','','education','admin','2026-01-04 16:17:06','',NULL,'管理员导航'),(2001,'可选课程',0,1,'/student/course','edu/student/course/index','','StudentCourse',1,0,'C','0','0','edu:student:course','course','b_admin','2026-01-04 12:17:42','',NULL,'[B]学生选课页面'),(2002,'我的课表',0,2,'/student/timetable','edu/student/timetable/index','','StudentTimetable',1,0,'C','0','0','edu:student:timetable','timetable','b_admin','2026-01-04 12:17:42','',NULL,'[B]学生课表查询'),(2003,'成绩查询',0,3,'/student/grades','edu/student/grades/index','','StudentGrades',1,0,'C','0','0','edu:student:grades','score','b_admin','2026-01-04 12:17:42','',NULL,'[B]学生成绩查询'),(2004,'学分统计',0,4,'/student/credits','edu/student/credits/index','','StudentCredits',1,0,'C','0','0','edu:statistics:credits','chart','b_admin','2026-01-04 12:17:42','',NULL,'[B]学生学分统计'),(2005,'我的班级',0,5,'/teacher/classes','edu/teacher/classes/index','','TeacherClasses',1,0,'C','0','0','edu:teacher:classes','class','b_admin','2026-01-04 12:17:42','',NULL,'[B]教师查看所教班级'),(2006,'成绩管理',0,6,'/teacher/grades','edu/teacher/grades/index','','TeacherGrades',1,0,'C','0','0','edu:teacher:grades','edit','b_admin','2026-01-04 12:17:42','',NULL,'[B]教师成绩录入和发布'),(2101,'选课',2001,1,'','','','',1,0,'F','0','0','edu:student:enroll','#','b_admin','2026-01-04 12:17:42','',NULL,'[B]学生选课按钮'),(2102,'退课',2001,2,'','','','',1,0,'F','0','0','edu:student:drop','#','b_admin','2026-01-04 12:17:42','',NULL,'[B]学生退课按钮'),(2103,'查询课表',2002,1,'','','','',1,0,'F','0','0','edu:student:timetable','#','b_admin','2026-01-04 12:17:42','',NULL,'[B]查询课表按钮'),(2104,'查询成绩',2003,1,'','','','',1,0,'F','0','0','edu:student:grades','#','b_admin','2026-01-04 12:17:42','',NULL,'[B]查询成绩按钮'),(2105,'查询学分',2004,1,'','','','',1,0,'F','0','0','edu:statistics:credits','#','b_admin','2026-01-04 12:17:42','',NULL,'[B]查询学分统计按钮'),(2201,'查看学生',2005,1,'','','','',1,0,'F','0','0','edu:teacher:students','#','b_admin','2026-01-04 12:17:42','',NULL,'[B]查看班级学生按钮'),(2202,'录入成绩',2006,1,'','','','',1,0,'F','0','0','edu:teacher:grades:edit','#','b_admin','2026-01-04 12:17:42','',NULL,'[B]录入成绩按钮'),(2203,'发布成绩',2006,2,'','','','',1,0,'F','0','0','edu:teacher:grades:publish','#','b_admin','2026-01-04 12:17:42','',NULL,'[B]发布成绩按钮'),(2204,'班级统计',2005,2,'','','','',1,0,'F','0','0','edu:teacher:statistics','#','b_admin','2026-01-04 12:17:42','',NULL,'[B]班级成绩统计按钮'),(2205,'学期管理',0,1,'/term','edu/admin/term/index',NULL,'',0,0,'C','0','0','','education','admin','2026-01-04 16:04:54','',NULL,''),(2206,'课程管理',0,2,'/course','edu/admin/course/index',NULL,'',0,0,'C','0','0','','education','admin','2026-01-04 16:04:54','',NULL,''),(2207,'教学班管理',0,3,'/courseClass','edu/admin/courseClass/index',NULL,'',0,0,'C','0','0','','education','admin','2026-01-04 16:04:54','',NULL,''),(2208,'学分规则',0,4,'/creditRule','edu/admin/creditRule/index',NULL,'',0,0,'C','0','0','','education','admin','2026-01-04 16:04:54','',NULL,''),(2300,'学期查询',2205,1,'#','',NULL,'',1,0,'F','0','0','edu:admin:term:query','#','admin','2026-01-04 15:33:24','',NULL,''),(2301,'学期新增',2205,2,'#','',NULL,'',1,0,'F','0','0','edu:admin:term:add','#','admin','2026-01-04 15:33:24','',NULL,''),(2302,'学期修改',2205,3,'#','',NULL,'',1,0,'F','0','0','edu:admin:term:edit','#','admin','2026-01-04 15:33:24','',NULL,''),(2303,'学期删除',2205,4,'#','',NULL,'',1,0,'F','0','0','edu:admin:term:remove','#','admin','2026-01-04 15:33:24','',NULL,''),(2304,'学期导出',2205,5,'#','',NULL,'',1,0,'F','0','0','edu:admin:term:export','#','admin','2026-01-04 15:33:24','',NULL,''),(2310,'课程查询',2206,1,'#','',NULL,'',1,0,'F','0','0','edu:admin:course:query','#','admin','2026-01-04 15:33:24','',NULL,''),(2311,'课程新增',2206,2,'#','',NULL,'',1,0,'F','0','0','edu:admin:course:add','#','admin','2026-01-04 15:33:24','',NULL,''),(2312,'课程修改',2206,3,'#','',NULL,'',1,0,'F','0','0','edu:admin:course:edit','#','admin','2026-01-04 15:33:24','',NULL,''),(2313,'课程删除',2206,4,'#','',NULL,'',1,0,'F','0','0','edu:admin:course:remove','#','admin','2026-01-04 15:33:24','',NULL,''),(2314,'课程导出',2206,5,'#','',NULL,'',1,0,'F','0','0','edu:admin:course:export','#','admin','2026-01-04 15:33:24','',NULL,''),(2320,'教学班查询',2207,1,'#','',NULL,'',1,0,'F','0','0','edu:admin:courseClass:query','#','admin','2026-01-04 15:33:24','',NULL,''),(2321,'教学班新增',2207,2,'#','',NULL,'',1,0,'F','0','0','edu:admin:courseClass:add','#','admin','2026-01-04 15:33:24','',NULL,''),(2322,'教学班修改',2207,3,'#','',NULL,'',1,0,'F','0','0','edu:admin:courseClass:edit','#','admin','2026-01-04 15:33:24','',NULL,''),(2323,'教学班删除',2207,4,'#','',NULL,'',1,0,'F','0','0','edu:admin:courseClass:remove','#','admin','2026-01-04 15:33:24','',NULL,''),(2324,'教学班导出',2207,5,'#','',NULL,'',1,0,'F','0','0','edu:admin:courseClass:export','#','admin','2026-01-04 15:33:24','',NULL,''),(2330,'规则查询',2208,1,'#','',NULL,'',1,0,'F','0','0','edu:admin:creditRule:query','#','admin','2026-01-04 15:33:24','',NULL,''),(2331,'规则新增',2208,2,'#','',NULL,'',1,0,'F','0','0','edu:admin:creditRule:add','#','admin','2026-01-04 15:33:24','',NULL,''),(2332,'规则修改',2208,3,'#','',NULL,'',1,0,'F','0','0','edu:admin:creditRule:edit','#','admin','2026-01-04 15:33:24','',NULL,''),(2333,'规则删除',2208,4,'#','',NULL,'',1,0,'F','0','0','edu:admin:creditRule:remove','#','admin','2026-01-04 15:33:24','',NULL,''),(2334,'规则导出',2208,5,'#','',NULL,'',1,0,'F','0','0','edu:admin:creditRule:export','#','admin','2026-01-04 15:33:24','',NULL,''),(2335,'学期列表',2205,1,'#','',NULL,'',1,0,'F','0','0','edu:admin:term:list','#','admin','2026-01-04 16:18:38','',NULL,'接口权限'),(2336,'课程列表',2206,1,'#','',NULL,'',1,0,'F','0','0','edu:admin:course:list','#','admin','2026-01-04 16:18:38','',NULL,'接口权限'),(2337,'教学班列表',2207,1,'#','',NULL,'',1,0,'F','0','0','edu:admin:courseClass:list','#','admin','2026-01-04 16:18:38','',NULL,'接口权限'),(2338,'学分规则列表',2208,1,'#','',NULL,'',1,0,'F','0','0','edu:admin:creditRule:list','#','admin','2026-01-04 16:18:38','',NULL,'接口权限');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES (1,'温馨提醒：2018-07-01 若依新版本发布啦','2',_binary '新版本内容','0','admin','2025-12-26 15:15:34','',NULL,'管理员'),(2,'维护通知：2018-07-01 若依系统凌晨维护','1',_binary '维护内容','0','admin','2025-12-26 15:15:34','',NULL,'管理员');
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20) DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8mb4 COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` VALUES (1,'字典类型',1,'com.ruoyi.web.controller.system.SysDictTypeController.add()','POST',1,'admin','研发部门','/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"选课状态\",\"dictType\":\"edu_enrollment_status\",\"params\":{},\"remark\":\"学生选课状态：ENROLLED-已选课，DROPPED-已退课\",\"status\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-28 20:54:26',36),(2,'字典类型',2,'com.ruoyi.web.controller.system.SysDictTypeController.edit()','PUT',1,'admin','研发部门','/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2025-12-26 15:15:34\",\"dictId\":1,\"dictName\":\"用户性别\",\"dictType\":\"sys_user_sex\",\"params\":{},\"remark\":\"用户性别列表\",\"status\":\"0\",\"updateBy\":\"admin\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-28 20:55:35',59),(3,'字典类型',1,'com.ruoyi.web.controller.system.SysDictTypeController.add()','POST',1,'admin','研发部门','/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"成绩状态\",\"dictType\":\"edu_grade_status\",\"params\":{},\"remark\":\"学生成绩状态：DRAFT-草稿（教师可编辑），PUBLISHED-已发布（学生可见）\",\"status\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-28 20:56:16',21),(4,'字典类型',1,'com.ruoyi.web.controller.system.SysDictTypeController.add()','POST',1,'admin','研发部门','/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"学期状态\",\"dictType\":\"edu_term_status\",\"params\":{},\"remark\":\"学期状态：0-未激活，1-激活中（可进行选课操作）\",\"status\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-28 20:56:38',22),(5,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"enrollment\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-28 21:06:25',123),(6,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"enrollment\"}',NULL,0,NULL,'2025-12-28 21:06:41',276),(7,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"enrollment\",\"className\":\"Enrollment\",\"columns\":[{\"capJavaField\":\"EnrollmentId\",\"columnComment\":\"閫夎?璁板綍ID\",\"columnId\":1,\"columnName\":\"enrollment_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-28 21:06:25\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"enrollmentId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"StudentId\",\"columnComment\":\"瀛︾敓ID锛堝叧鑱攕ys_user.user_id锛\",\"columnId\":2,\"columnName\":\"student_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-28 21:06:25\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"studentId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ClassId\",\"columnComment\":\"鏁欏?鐝璉D\",\"columnId\":3,\"columnName\":\"class_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-28 21:06:25\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"classId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TermId\",\"columnComment\":\"瀛︽湡ID\",\"columnId\":4,\"columnName\":\"term_id\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-28 21:06:25\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"i','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-28 21:16:53',81),(8,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"enrollment\",\"className\":\"Enrollment\",\"columns\":[{\"capJavaField\":\"EnrollmentId\",\"columnComment\":\"閫夎?璁板綍ID\",\"columnId\":1,\"columnName\":\"enrollment_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-28 21:06:25\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"enrollmentId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-12-28 21:16:53\",\"usableColumn\":false},{\"capJavaField\":\"StudentId\",\"columnComment\":\"瀛︾敓ID锛堝叧鑱攕ys_user.user_id锛\",\"columnId\":2,\"columnName\":\"student_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-28 21:06:25\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"studentId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-12-28 21:16:53\",\"usableColumn\":false},{\"capJavaField\":\"ClassId\",\"columnComment\":\"鏁欏?鐝璉D\",\"columnId\":3,\"columnName\":\"class_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-28 21:06:25\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"classId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-12-28 21:16:53\",\"usableColumn\":false},{\"capJavaField\":\"TermId\",\"columnComment\":\"瀛︽湡ID\",\"columnId\":4,\"columnName\":\"term_id\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-28 21:06:25\",\"dictType\":\"\",\"edit\":true,\"htmlTy','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-28 21:18:15',84),(9,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"enrollment\"}',NULL,0,NULL,'2025-12-28 21:18:23',30),(10,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"教务管理\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"/edu\",\"status\":\"0\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-29 08:16:25',54),(11,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"/edu/course/index\",\"createBy\":\"admin\",\"icon\":\"post\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"课程管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1061,\"path\":\"/edu/course\",\"perms\":\"edu:course:list\",\"routeName\":\"CourseManagement\",\"status\":\"0\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-29 08:20:49',42),(12,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2025-12-29 08:16:25\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1061,\"menuName\":\"教务管理\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"/edu\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-29 08:24:05',23),(13,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/student/course/index\",\"createTime\":\"2025-12-29 08:20:49\",\"icon\":\"post\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1062,\"menuName\":\"学生课程管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1061,\"path\":\"/edu/student/course\",\"perms\":\"edu/student/course/index\",\"routeName\":\"CourseManagement\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-29 08:27:58',22),(14,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/student/credits/index\",\"createBy\":\"admin\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"学生学分管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":1061,\"path\":\"/edu/student/credits\",\"perms\":\"edu:student:credits:list\",\"routeName\":\"CreditManagement\",\"status\":\"0\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-29 08:29:22',29),(15,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/student/grades/index\",\"createBy\":\"admin\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"学生成绩管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":1061,\"path\":\"/edu/student/grades\",\"perms\":\"edu:student:grades:list\",\"routeName\":\"GradeManagement\",\"status\":\"0\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-29 08:30:34',24),(16,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/student/timetable/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"学生课表管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":1061,\"path\":\"/edu/student/timetable\",\"perms\":\"edu:student:timetable:list\",\"routeName\":\"TimetableManagement\",\"status\":\"0\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-29 08:31:59',20),(17,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/teacher/classes/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"教师班级管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":1061,\"path\":\"/edu/teacher/classes\",\"perms\":\"edu:teacher:classes:list\",\"routeName\":\"ClassManagement\",\"status\":\"0\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-29 08:32:56',19),(18,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/teacher/grades/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\" 教师成绩管理\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":1061,\"path\":\"教师班级管理\",\"perms\":\"edu:teacher:grades:list\",\"routeName\":\"GradeManagement\",\"status\":\"0\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-29 08:35:32',37),(19,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/student/grades/index\",\"createTime\":\"2025-12-29 08:30:34\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1064,\"menuName\":\"学生成绩管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":1061,\"path\":\"/edu/student/grades\",\"perms\":\"edu:student:grades:list\",\"routeName\":\"StudentGradeQuery\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-29 08:36:15',32),(20,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/teacher/grades/index\",\"createTime\":\"2025-12-29 08:35:32\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1067,\"menuName\":\" 教师成绩管理\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":1061,\"path\":\"教师班级管理\",\"perms\":\"edu:teacher:grades:list\",\"routeName\":\"GradeManagement\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-29 08:40:03',33),(21,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2025-12-29 08:16:25\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1061,\"menuName\":\"教务管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"/edu\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-29 08:40:16',28),(22,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/student/course/index\",\"createTime\":\"2025-12-29 08:20:49\",\"icon\":\"post\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1062,\"menuName\":\"学生课程管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"/edu/student/course\",\"perms\":\"edu/student/course/index\",\"routeName\":\"CourseManagement\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-29 08:42:14',22),(23,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/student/credits/index\",\"createTime\":\"2025-12-29 08:29:22\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1063,\"menuName\":\"学生学分管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"/edu/student/credits\",\"perms\":\"edu:student:credits:list\",\"routeName\":\"CreditManagement\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-29 08:42:45',23),(24,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/student/grades/index\",\"createTime\":\"2025-12-29 08:30:34\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1064,\"menuName\":\"学生成绩管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"/edu/student/grades\",\"perms\":\"edu:student:grades:list\",\"routeName\":\"StudentGradeQuery\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-29 08:42:53',27),(25,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/student/timetable/index\",\"createTime\":\"2025-12-29 08:31:59\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1065,\"menuName\":\"学生课表管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"/edu/student/timetable\",\"perms\":\"edu:student:timetable:list\",\"routeName\":\"TimetableManagement\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-29 08:43:01',36),(26,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/student/grades/index\",\"createTime\":\"2025-12-29 08:30:34\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1064,\"menuName\":\"学生成绩管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":1061,\"path\":\"/edu/student/grades\",\"perms\":\"edu:student:grades:list\",\"routeName\":\"StudentGradeQuery\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-29 08:43:50',30),(27,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/student/credits/index\",\"createTime\":\"2025-12-29 08:29:22\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1063,\"menuName\":\"学生学分管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":1061,\"path\":\"/edu/student/credits\",\"perms\":\"edu:student:credits:list\",\"routeName\":\"CreditManagement\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-29 08:44:03',25),(28,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/student/course/index\",\"createTime\":\"2025-12-29 08:20:49\",\"icon\":\"post\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1062,\"menuName\":\"学生课程管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1061,\"path\":\"/edu/student/course\",\"perms\":\"edu/student/course/index\",\"routeName\":\"CourseManagement\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-29 08:44:12',36),(29,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/student/timetable/index\",\"createTime\":\"2025-12-29 08:31:59\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1065,\"menuName\":\"学生课表管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":1061,\"path\":\"/edu/student/timetable\",\"perms\":\"edu:student:timetable:list\",\"routeName\":\"TimetableManagement\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-29 08:44:21',30),(30,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/student/course/index\",\"createTime\":\"2025-12-29 08:20:49\",\"icon\":\"post\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1062,\"menuName\":\"学生课程管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1061,\"path\":\"/edu/student/course\",\"perms\":\"edu:student:course:list\",\"routeName\":\"CourseManagement\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-29 08:46:05',20),(31,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/student/course\",\"createTime\":\"2025-12-29 08:20:49\",\"icon\":\"post\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1062,\"menuName\":\"学生课程管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1061,\"path\":\"/edu/student/course\",\"perms\":\"edu:student:course:list\",\"routeName\":\"CourseManagement\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-29 08:55:09',25),(32,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/student/course/index\",\"createTime\":\"2025-12-29 08:20:49\",\"icon\":\"post\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1062,\"menuName\":\"学生课程管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1061,\"path\":\"/edu/student/course\",\"perms\":\"edu:student:course:list\",\"routeName\":\"CourseManagement\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-29 08:56:13',24),(33,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/student/course/index\",\"createTime\":\"2025-12-29 08:20:49\",\"icon\":\"post\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1062,\"menuName\":\"学生课程管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1061,\"path\":\"student/course\",\"perms\":\"edu:student:course:list\",\"routeName\":\"CourseManagement\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-29 09:01:04',13),(34,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2025-12-29 08:16:25\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1061,\"menuName\":\"教务管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"/edu\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-29 09:03:09',20),(35,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/student/course/index\",\"createTime\":\"2025-12-29 08:20:49\",\"icon\":\"post\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1062,\"menuName\":\"学生课程管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1061,\"path\":\"student/course\",\"perms\":\"edu:student:course:list\",\"routeName\":\"CourseManagement\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-29 09:03:46',22),(36,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/student/course/index\",\"createTime\":\"2025-12-29 08:20:49\",\"icon\":\"post\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1062,\"menuName\":\"学生课程管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1061,\"path\":\"student/course\",\"perms\":\"edu:student:course:list\",\"routeName\":\"CourseManagement\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-29 09:03:50',14),(37,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/student/course/index\",\"createTime\":\"2025-12-29 08:20:49\",\"icon\":\"post\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1062,\"menuName\":\"学生课程管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1061,\"path\":\"student/course\",\"perms\":\"edu:student:course:list\",\"routeName\":\"CourseManagement\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-29 09:04:48',19),(38,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/student/credits/index\",\"createTime\":\"2025-12-29 08:29:22\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1063,\"menuName\":\"学生学分管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":1061,\"path\":\"student/credits\",\"perms\":\"edu:student:credits:list\",\"routeName\":\"CreditManagement\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-29 09:04:56',23),(39,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/student/grades/index\",\"createTime\":\"2025-12-29 08:30:34\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1064,\"menuName\":\"学生成绩管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":1061,\"path\":\"student/grades\",\"perms\":\"edu:student:grades:list\",\"routeName\":\"StudentGradeQuery\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-29 09:05:13',24),(40,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/student/timetable/index\",\"createTime\":\"2025-12-29 08:31:59\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1065,\"menuName\":\"学生课表管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":1061,\"path\":\"student/timetable\",\"perms\":\"edu:student:timetable:list\",\"routeName\":\"TimetableManagement\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-29 09:05:18',27),(41,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/teacher/classes/index\",\"createTime\":\"2025-12-29 08:32:56\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1066,\"menuName\":\"教师班级管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":1061,\"path\":\"teacher/classes\",\"perms\":\"edu:teacher:classes:list\",\"routeName\":\"ClassManagement\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-29 09:05:22',21),(42,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/teacher/grades/index\",\"createTime\":\"2025-12-29 08:35:32\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1067,\"menuName\":\" 教师成绩管理\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":1061,\"path\":\"teacher/grades\",\"perms\":\"edu:teacher:grades:list\",\"routeName\":\"GradeManagement\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-29 09:05:43',23),(43,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/student/course/index\",\"createTime\":\"2025-12-29 08:20:49\",\"icon\":\"post\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1062,\"menuName\":\"学生课程管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1061,\"path\":\"/edu/student/course\",\"perms\":\"edu:student:course:list\",\"routeName\":\"CourseManagement\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-29 09:11:16',12),(44,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/student/course/index\",\"createTime\":\"2025-12-29 08:20:49\",\"icon\":\"post\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1062,\"menuName\":\"学生课程管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1061,\"path\":\"edu/student/course\",\"perms\":\"edu:student:course:list\",\"routeName\":\"CourseManagement\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-29 09:11:51',22),(45,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/student/course/index\",\"createTime\":\"2025-12-29 08:20:49\",\"icon\":\"post\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1062,\"menuName\":\"学生课程管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1061,\"path\":\"edu/student/course\",\"perms\":\"edu:student:course:list\",\"routeName\":\"CourseManagement\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-29 09:16:17',16),(46,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/student/credits/index\",\"createTime\":\"2025-12-29 08:29:22\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1063,\"menuName\":\"学生学分管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":1061,\"path\":\"edu/student/credits\",\"perms\":\"edu:student:credits:list\",\"routeName\":\"CreditManagement\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-29 09:22:10',56),(47,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/student/grades/index\",\"createTime\":\"2025-12-29 08:30:34\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1064,\"menuName\":\"学生成绩管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":1061,\"path\":\"edu/student/grades\",\"perms\":\"edu:student:grades:list\",\"routeName\":\"StudentGradeQuery\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-29 09:22:15',36),(48,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/student/timetable/index\",\"createTime\":\"2025-12-29 08:31:59\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1065,\"menuName\":\"学生课表管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":1061,\"path\":\"edu/student/timetable\",\"perms\":\"edu:student:timetable:list\",\"routeName\":\"TimetableManagement\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-29 09:22:21',29),(49,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/teacher/classes/index\",\"createTime\":\"2025-12-29 08:32:56\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1066,\"menuName\":\"教师班级管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":1061,\"path\":\"edu/teacher/classes\",\"perms\":\"edu:teacher:classes:list\",\"routeName\":\"ClassManagement\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-29 09:22:25',29),(50,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/teacher/grades/index\",\"createTime\":\"2025-12-29 08:35:32\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1067,\"menuName\":\" 教师成绩管理\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":1061,\"path\":\"edu/teacher/grades\",\"perms\":\"edu:teacher:grades:list\",\"routeName\":\"GradeManagement\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-29 09:22:30',28),(51,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/teacher/classes/index\",\"createTime\":\"2025-12-29 08:32:56\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1066,\"menuName\":\"教师班级管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":1061,\"path\":\"edu/teacher/classes\",\"perms\":\"edu:teacher:classes:list\",\"routeName\":\"ClassManagement\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-29 09:23:55',22),(52,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/student/course/index\",\"createTime\":\"2025-12-29 08:20:49\",\"icon\":\"post\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1062,\"menuName\":\"学生课程管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1061,\"path\":\"student/course\",\"perms\":\"edu:student:course:list\",\"routeName\":\"CourseManagement\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-29 10:43:49',20),(53,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/student/course/index\",\"createTime\":\"2025-12-29 08:20:49\",\"icon\":\"post\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1062,\"menuName\":\"学生课程管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1061,\"path\":\"student/course\",\"perms\":\"edu:student:course:list\",\"routeName\":\"CourseManagement\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-29 11:29:50',67),(54,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/student/credits/index\",\"createTime\":\"2025-12-29 08:29:22\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1063,\"menuName\":\"学生学分管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":1061,\"path\":\"student/credits\",\"perms\":\"edu:student:credits:list\",\"routeName\":\"CreditManagement\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-29 11:30:00',37),(55,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/student/grades/index\",\"createTime\":\"2025-12-29 08:30:34\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1064,\"menuName\":\"学生成绩管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":1061,\"path\":\"student/grades\",\"perms\":\"edu:student:grades:list\",\"routeName\":\"StudentGradeQuery\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-29 11:30:07',35),(56,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/student/timetable/index\",\"createTime\":\"2025-12-29 08:31:59\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1065,\"menuName\":\"学生课表管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":1061,\"path\":\"student/timetable\",\"perms\":\"edu:student:timetable:list\",\"routeName\":\"TimetableManagement\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-29 11:30:13',29),(57,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/teacher/classes/index\",\"createTime\":\"2025-12-29 08:32:56\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1066,\"menuName\":\"教师班级管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":1061,\"path\":\"teacher/classes\",\"perms\":\"edu:teacher:classes:list\",\"routeName\":\"ClassManagement\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-29 11:30:20',27),(58,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/teacher/grades/index\",\"createTime\":\"2025-12-29 08:35:32\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1067,\"menuName\":\" 教师成绩管理\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":1061,\"path\":\"teacher/grades\",\"perms\":\"edu:teacher:grades:list\",\"routeName\":\"GradeManagement\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-29 11:30:28',36),(59,'批量录入成绩',2,'com.ruoyi.edu.student.controller.EduTeacherController.batchUpdateGrades()','POST',1,'admin','研发部门','/edu/teacher/grades/batch','127.0.0.1','内网IP','[{\"enrollmentId\":1,\"grade\":5,\"gradeStatus\":\"DRAFT\"}] ','{\"msg\":\"成绩更新成功（开发模式）\",\"code\":200}',0,NULL,'2025-12-29 16:14:33',25),(60,'发布成绩',2,'com.ruoyi.edu.student.controller.EduTeacherController.publishGrades()','POST',1,'admin','研发部门','/edu/teacher/grades/publish','127.0.0.1','内网IP','{\"classId\":1} ','{\"msg\":\"成绩发布成功（开发模式）\",\"code\":200}',0,NULL,'2025-12-29 16:14:33',27),(61,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'admin','研发部门','/edu/student/drop/7','127.0.0.1','内网IP','7 ','{\"msg\":\"成绩已发布，不能退课\",\"code\":500}',0,NULL,'2025-12-29 16:14:41',19),(62,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'admin','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":12} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2025-12-29 16:14:49',165),(63,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'admin','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":1} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2025-12-29 16:15:19',96),(64,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'admin','研发部门','/edu/student/drop/11','127.0.0.1','内网IP','11 ','{\"msg\":\"成绩已发布，不能退课\",\"code\":500}',0,NULL,'2025-12-29 16:15:25',15),(65,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'admin','研发部门','/edu/student/drop/31','127.0.0.1','内网IP','31 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2025-12-29 16:15:26',52),(66,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'admin','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":12} ',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2001-12\' for key \'uk_student_class\'\r\n### The error may exist in file [D:\\coding\\project\\school-teaching-system\\backend\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\edu\\student\\EnrollmentMapper.xml]\r\n### The error may involve com.ruoyi.edu.student.mapper.EnrollmentMapper.insertEnrollment-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into enrollment (         student_id, class_id, term_id, status,         grade, grade_status, enroll_time, drop_time,         create_by, create_time, update_by, update_time, remark         ) values (         ?, ?, ?, ?,         ?, ?, ?, ?,         ?, ?, ?, ?, ?         )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2001-12\' for key \'uk_student_class\'\n; Duplicate entry \'2001-12\' for key \'uk_student_class\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2001-12\' for key \'uk_student_class\'','2025-12-29 16:15:29',83),(67,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'admin','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":12} ',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2001-12\' for key \'uk_student_class\'\r\n### The error may exist in file [D:\\coding\\project\\school-teaching-system\\backend\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\edu\\student\\EnrollmentMapper.xml]\r\n### The error may involve com.ruoyi.edu.student.mapper.EnrollmentMapper.insertEnrollment-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into enrollment (         student_id, class_id, term_id, status,         grade, grade_status, enroll_time, drop_time,         create_by, create_time, update_by, update_time, remark         ) values (         ?, ?, ?, ?,         ?, ?, ?, ?,         ?, ?, ?, ?, ?         )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2001-12\' for key \'uk_student_class\'\n; Duplicate entry \'2001-12\' for key \'uk_student_class\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2001-12\' for key \'uk_student_class\'','2025-12-29 16:15:31',88),(68,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'admin','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":2} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2025-12-29 16:15:38',89),(69,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'admin','研发部门','/edu/student/drop/35','127.0.0.1','内网IP','35 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2025-12-29 16:15:39',49),(70,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'admin','研发部门','/edu/student/drop/7','127.0.0.1','内网IP','7 ','{\"msg\":\"成绩已发布，不能退课\",\"code\":500}',0,NULL,'2025-12-29 16:15:40',12),(71,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'admin','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":7} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2025-12-29 16:15:43',98),(72,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'admin','研发部门','/edu/student/drop/36','127.0.0.1','内网IP','36 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2025-12-29 16:15:43',47),(73,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'admin','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":14} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2025-12-29 16:15:45',128),(74,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'admin','研发部门','/edu/student/drop/37','127.0.0.1','内网IP','37 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2025-12-29 16:15:47',38),(75,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'admin','研发部门','/edu/student/drop/10','127.0.0.1','内网IP','10 ','{\"msg\":\"成绩已发布，不能退课\",\"code\":500}',0,NULL,'2025-12-29 16:15:48',13),(76,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'admin','研发部门','/edu/student/drop/9','127.0.0.1','内网IP','9 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2025-12-29 16:15:49',39),(77,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'admin','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":10} ','{\"msg\":\"与已有课程时间冲突\",\"code\":500}',0,NULL,'2025-12-29 16:16:08',47),(78,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'admin','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":10} ','{\"msg\":\"与已有课程时间冲突\",\"code\":500}',0,NULL,'2025-12-29 16:16:12',51),(79,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'admin','研发部门','/edu/student/drop/8','127.0.0.1','内网IP','8 ','{\"msg\":\"成绩已发布，不能退课\",\"code\":500}',0,NULL,'2025-12-29 16:16:16',11),(80,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'admin','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":12} ',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2001-12\' for key \'uk_student_class\'\r\n### The error may exist in file [D:\\coding\\project\\school-teaching-system\\backend\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\edu\\student\\EnrollmentMapper.xml]\r\n### The error may involve com.ruoyi.edu.student.mapper.EnrollmentMapper.insertEnrollment-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into enrollment (         student_id, class_id, term_id, status,         grade, grade_status, enroll_time, drop_time,         create_by, create_time, update_by, update_time, remark         ) values (         ?, ?, ?, ?,         ?, ?, ?, ?,         ?, ?, ?, ?, ?         )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2001-12\' for key \'uk_student_class\'\n; Duplicate entry \'2001-12\' for key \'uk_student_class\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2001-12\' for key \'uk_student_class\'','2025-12-29 16:16:18',87),(81,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'admin','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":1} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2025-12-30 16:05:41',240),(82,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'admin','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":6} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2025-12-30 16:05:45',143),(83,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'admin','研发部门','/edu/student/drop/39','127.0.0.1','内网IP','39 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2025-12-30 16:05:47',61),(84,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'admin','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":9} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2025-12-30 16:05:50',131),(85,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'admin','研发部门','/edu/student/drop/40','127.0.0.1','内网IP','40 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2025-12-30 16:05:51',70),(86,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'admin','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":13} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2025-12-30 16:05:53',132),(87,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'admin','研发部门','/edu/student/drop/41','127.0.0.1','内网IP','41 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2025-12-30 16:05:54',74),(88,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'admin','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":6} ','{\"msg\":\"选课失败：\\r\\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1-6\' for key \'uk_student_class\'\\r\\n### The error may exist in file [D:\\\\coding\\\\project\\\\school-teaching-system\\\\backend\\\\RuoYi-Vue\\\\ruoyi-admin\\\\target\\\\classes\\\\mapper\\\\edu\\\\student\\\\EnrollmentMapper.xml]\\r\\n### The error may involve com.ruoyi.edu.student.mapper.EnrollmentMapper.insertEnrollment-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: insert into enrollment (         student_id, class_id, term_id, status,         grade, grade_status, enroll_time, drop_time,         create_by, create_time, update_by, update_time, remark         ) values (         ?, ?, ?, ?,         ?, ?, ?, ?,         ?, ?, ?, ?, ?         )\\r\\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1-6\' for key \'uk_student_class\'\\n; Duplicate entry \'1-6\' for key \'uk_student_class\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1-6\' for key \'uk_student_class\'\",\"code\":500}',0,NULL,'2025-12-30 16:05:58',142),(89,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'admin','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":6} ','{\"msg\":\"选课失败：\\r\\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1-6\' for key \'uk_student_class\'\\r\\n### The error may exist in file [D:\\\\coding\\\\project\\\\school-teaching-system\\\\backend\\\\RuoYi-Vue\\\\ruoyi-admin\\\\target\\\\classes\\\\mapper\\\\edu\\\\student\\\\EnrollmentMapper.xml]\\r\\n### The error may involve com.ruoyi.edu.student.mapper.EnrollmentMapper.insertEnrollment-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: insert into enrollment (         student_id, class_id, term_id, status,         grade, grade_status, enroll_time, drop_time,         create_by, create_time, update_by, update_time, remark         ) values (         ?, ?, ?, ?,         ?, ?, ?, ?,         ?, ?, ?, ?, ?         )\\r\\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1-6\' for key \'uk_student_class\'\\n; Duplicate entry \'1-6\' for key \'uk_student_class\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1-6\' for key \'uk_student_class\'\",\"code\":500}',0,NULL,'2025-12-30 16:06:00',121),(90,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'admin','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":2} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2025-12-30 16:06:05',99),(91,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'admin','研发部门','/edu/student/drop/44','127.0.0.1','内网IP','44 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2025-12-30 16:06:06',72),(92,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'admin','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":7} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2025-12-30 16:06:08',91),(93,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'admin','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":6} ','{\"msg\":\"选课失败：\\r\\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1-6\' for key \'uk_student_class\'\\r\\n### The error may exist in file [D:\\\\coding\\\\project\\\\school-teaching-system\\\\backend\\\\RuoYi-Vue\\\\ruoyi-admin\\\\target\\\\classes\\\\mapper\\\\edu\\\\student\\\\EnrollmentMapper.xml]\\r\\n### The error may involve com.ruoyi.edu.student.mapper.EnrollmentMapper.insertEnrollment-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: insert into enrollment (         student_id, class_id, term_id, status,         grade, grade_status, enroll_time, drop_time,         create_by, create_time, update_by, update_time, remark         ) values (         ?, ?, ?, ?,         ?, ?, ?, ?,         ?, ?, ?, ?, ?         )\\r\\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1-6\' for key \'uk_student_class\'\\n; Duplicate entry \'1-6\' for key \'uk_student_class\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1-6\' for key \'uk_student_class\'\",\"code\":500}',0,NULL,'2025-12-30 16:06:10',118),(94,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'student',NULL,'/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":2} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2025-12-30 20:09:02',58),(95,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'student',NULL,'/edu/student/drop/1','127.0.0.1','内网IP','1 ','{\"msg\":\"成绩已发布，不能退课\",\"code\":500}',0,NULL,'2025-12-30 20:09:04',9),(96,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'student',NULL,'/edu/student/drop/46','127.0.0.1','内网IP','46 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2025-12-30 20:09:06',24),(97,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'student',NULL,'/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":14} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2025-12-30 20:09:12',30),(98,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'student',NULL,'/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":2} ','{\"msg\":\"选课失败：\\r\\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-2\' for key \'uk_student_class\'\\r\\n### The error may exist in file [D:\\\\coding\\\\project\\\\school-teaching-system\\\\backend\\\\RuoYi-Vue\\\\ruoyi-admin\\\\target\\\\classes\\\\mapper\\\\edu\\\\student\\\\EnrollmentMapper.xml]\\r\\n### The error may involve com.ruoyi.edu.student.mapper.EnrollmentMapper.insertEnrollment-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: insert into enrollment (         student_id, class_id, term_id, status,         grade, grade_status, enroll_time, drop_time,         create_by, create_time, update_by, update_time, remark         ) values (         ?, ?, ?, ?,         ?, ?, ?, ?,         ?, ?, ?, ?, ?         )\\r\\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-2\' for key \'uk_student_class\'\\n; Duplicate entry \'3-2\' for key \'uk_student_class\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-2\' for key \'uk_student_class\'\",\"code\":500}',0,NULL,'2025-12-30 20:09:18',40),(99,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'student',NULL,'/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":2} ','{\"msg\":\"选课失败：\\r\\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-2\' for key \'uk_student_class\'\\r\\n### The error may exist in file [D:\\\\coding\\\\project\\\\school-teaching-system\\\\backend\\\\RuoYi-Vue\\\\ruoyi-admin\\\\target\\\\classes\\\\mapper\\\\edu\\\\student\\\\EnrollmentMapper.xml]\\r\\n### The error may involve com.ruoyi.edu.student.mapper.EnrollmentMapper.insertEnrollment-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: insert into enrollment (         student_id, class_id, term_id, status,         grade, grade_status, enroll_time, drop_time,         create_by, create_time, update_by, update_time, remark         ) values (         ?, ?, ?, ?,         ?, ?, ?, ?,         ?, ?, ?, ?, ?         )\\r\\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-2\' for key \'uk_student_class\'\\n; Duplicate entry \'3-2\' for key \'uk_student_class\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-2\' for key \'uk_student_class\'\",\"code\":500}',0,NULL,'2025-12-30 20:09:21',25),(100,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'student',NULL,'/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":6} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2025-12-30 20:09:21',46),(101,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'student',NULL,'/edu/student/drop/50','127.0.0.1','内网IP','50 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2025-12-30 20:09:22',25),(102,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'student',NULL,'/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":6} ','{\"msg\":\"选课失败：\\r\\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-6\' for key \'uk_student_class\'\\r\\n### The error may exist in file [D:\\\\coding\\\\project\\\\school-teaching-system\\\\backend\\\\RuoYi-Vue\\\\ruoyi-admin\\\\target\\\\classes\\\\mapper\\\\edu\\\\student\\\\EnrollmentMapper.xml]\\r\\n### The error may involve com.ruoyi.edu.student.mapper.EnrollmentMapper.insertEnrollment-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: insert into enrollment (         student_id, class_id, term_id, status,         grade, grade_status, enroll_time, drop_time,         create_by, create_time, update_by, update_time, remark         ) values (         ?, ?, ?, ?,         ?, ?, ?, ?,         ?, ?, ?, ?, ?         )\\r\\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-6\' for key \'uk_student_class\'\\n; Duplicate entry \'3-6\' for key \'uk_student_class\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-6\' for key \'uk_student_class\'\",\"code\":500}',0,NULL,'2025-12-30 20:09:23',25),(103,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'student',NULL,'/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":7} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2025-12-30 20:09:26',33),(104,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'student',NULL,'/edu/student/drop/52','127.0.0.1','内网IP','52 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2025-12-30 20:09:38',18),(105,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'student',NULL,'/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":9} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2025-12-30 20:09:39',32),(106,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'student',NULL,'/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":12} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2025-12-30 20:41:43',34),(107,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'student',NULL,'/edu/student/drop/54','127.0.0.1','内网IP','54 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2025-12-30 20:41:57',24),(108,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'student',NULL,'/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":12} ','{\"msg\":\"选课失败：\\r\\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-12\' for key \'uk_student_class\'\\r\\n### The error may exist in file [D:\\\\coding\\\\project\\\\school-teaching-system\\\\backend\\\\RuoYi-Vue\\\\ruoyi-admin\\\\target\\\\classes\\\\mapper\\\\edu\\\\student\\\\EnrollmentMapper.xml]\\r\\n### The error may involve com.ruoyi.edu.student.mapper.EnrollmentMapper.insertEnrollment-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: insert into enrollment (         student_id, class_id, term_id, status,         grade, grade_status, enroll_time, drop_time,         create_by, create_time, update_by, update_time, remark         ) values (         ?, ?, ?, ?,         ?, ?, ?, ?,         ?, ?, ?, ?, ?         )\\r\\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-12\' for key \'uk_student_class\'\\n; Duplicate entry \'3-12\' for key \'uk_student_class\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-12\' for key \'uk_student_class\'\",\"code\":500}',0,NULL,'2025-12-30 20:46:17',31),(109,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'student',NULL,'/edu/student/drop/53','127.0.0.1','内网IP','53 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2025-12-30 20:46:37',22),(110,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'student',NULL,'/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":9} ','{\"msg\":\"选课失败：\\r\\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-9\' for key \'uk_student_class\'\\r\\n### The error may exist in file [D:\\\\coding\\\\project\\\\school-teaching-system\\\\backend\\\\RuoYi-Vue\\\\ruoyi-admin\\\\target\\\\classes\\\\mapper\\\\edu\\\\student\\\\EnrollmentMapper.xml]\\r\\n### The error may involve com.ruoyi.edu.student.mapper.EnrollmentMapper.insertEnrollment-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: insert into enrollment (         student_id, class_id, term_id, status,         grade, grade_status, enroll_time, drop_time,         create_by, create_time, update_by, update_time, remark         ) values (         ?, ?, ?, ?,         ?, ?, ?, ?,         ?, ?, ?, ?, ?         )\\r\\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-9\' for key \'uk_student_class\'\\n; Duplicate entry \'3-9\' for key \'uk_student_class\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-9\' for key \'uk_student_class\'\",\"code\":500}',0,NULL,'2025-12-30 20:46:38',23),(111,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2001','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":2} ','{\"msg\":\"选课失败：\\r\\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2001-2\' for key \'uk_student_class\'\\r\\n### The error may exist in file [D:\\\\coding\\\\project\\\\school-teaching-system\\\\backend\\\\RuoYi-Vue\\\\ruoyi-admin\\\\target\\\\classes\\\\mapper\\\\edu\\\\student\\\\EnrollmentMapper.xml]\\r\\n### The error may involve com.ruoyi.edu.student.mapper.EnrollmentMapper.insertEnrollment-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: insert into enrollment (         student_id, class_id, term_id, status,         grade, grade_status, enroll_time, drop_time,         create_by, create_time, update_by, update_time, remark         ) values (         ?, ?, ?, ?,         ?, ?, ?, ?,         ?, ?, ?, ?, ?         )\\r\\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2001-2\' for key \'uk_student_class\'\\n; Duplicate entry \'2001-2\' for key \'uk_student_class\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2001-2\' for key \'uk_student_class\'\",\"code\":500}',0,NULL,'2026-01-04 08:54:33',260),(112,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2001','研发部门','/edu/student/drop/32','127.0.0.1','内网IP','32 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-04 08:54:36',60),(113,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2001','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":1} ','{\"msg\":\"选课失败：\\r\\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2001-1\' for key \'uk_student_class\'\\r\\n### The error may exist in file [D:\\\\coding\\\\project\\\\school-teaching-system\\\\backend\\\\RuoYi-Vue\\\\ruoyi-admin\\\\target\\\\classes\\\\mapper\\\\edu\\\\student\\\\EnrollmentMapper.xml]\\r\\n### The error may involve com.ruoyi.edu.student.mapper.EnrollmentMapper.insertEnrollment-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: insert into enrollment (         student_id, class_id, term_id, status,         grade, grade_status, enroll_time, drop_time,         create_by, create_time, update_by, update_time, remark         ) values (         ?, ?, ?, ?,         ?, ?, ?, ?,         ?, ?, ?, ?, ?         )\\r\\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2001-1\' for key \'uk_student_class\'\\n; Duplicate entry \'2001-1\' for key \'uk_student_class\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2001-1\' for key \'uk_student_class\'\",\"code\":500}',0,NULL,'2026-01-04 08:54:37',92),(114,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2001','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":7} ','{\"msg\":\"选课失败：\\r\\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2001-7\' for key \'uk_student_class\'\\r\\n### The error may exist in file [D:\\\\coding\\\\project\\\\school-teaching-system\\\\backend\\\\RuoYi-Vue\\\\ruoyi-admin\\\\target\\\\classes\\\\mapper\\\\edu\\\\student\\\\EnrollmentMapper.xml]\\r\\n### The error may involve com.ruoyi.edu.student.mapper.EnrollmentMapper.insertEnrollment-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: insert into enrollment (         student_id, class_id, term_id, status,         grade, grade_status, enroll_time, drop_time,         create_by, create_time, update_by, update_time, remark         ) values (         ?, ?, ?, ?,         ?, ?, ?, ?,         ?, ?, ?, ?, ?         )\\r\\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2001-7\' for key \'uk_student_class\'\\n; Duplicate entry \'2001-7\' for key \'uk_student_class\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2001-7\' for key \'uk_student_class\'\",\"code\":500}',0,NULL,'2026-01-04 08:54:39',106),(115,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2001','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":10} ','{\"msg\":\"与已有课程时间冲突\",\"code\":500}',0,NULL,'2026-01-04 08:54:42',58),(116,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2001','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":12} ','{\"msg\":\"选课失败：\\r\\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2001-12\' for key \'uk_student_class\'\\r\\n### The error may exist in file [D:\\\\coding\\\\project\\\\school-teaching-system\\\\backend\\\\RuoYi-Vue\\\\ruoyi-admin\\\\target\\\\classes\\\\mapper\\\\edu\\\\student\\\\EnrollmentMapper.xml]\\r\\n### The error may involve com.ruoyi.edu.student.mapper.EnrollmentMapper.insertEnrollment-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: insert into enrollment (         student_id, class_id, term_id, status,         grade, grade_status, enroll_time, drop_time,         create_by, create_time, update_by, update_time, remark         ) values (         ?, ?, ?, ?,         ?, ?, ?, ?,         ?, ?, ?, ?, ?         )\\r\\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2001-12\' for key \'uk_student_class\'\\n; Duplicate entry \'2001-12\' for key \'uk_student_class\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2001-12\' for key \'uk_student_class\'\",\"code\":500}',0,NULL,'2026-01-04 08:54:44',92),(117,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2001','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":14} ','{\"msg\":\"选课失败：\\r\\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2001-14\' for key \'uk_student_class\'\\r\\n### The error may exist in file [D:\\\\coding\\\\project\\\\school-teaching-system\\\\backend\\\\RuoYi-Vue\\\\ruoyi-admin\\\\target\\\\classes\\\\mapper\\\\edu\\\\student\\\\EnrollmentMapper.xml]\\r\\n### The error may involve com.ruoyi.edu.student.mapper.EnrollmentMapper.insertEnrollment-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: insert into enrollment (         student_id, class_id, term_id, status,         grade, grade_status, enroll_time, drop_time,         create_by, create_time, update_by, update_time, remark         ) values (         ?, ?, ?, ?,         ?, ?, ?, ?,         ?, ?, ?, ?, ?         )\\r\\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2001-14\' for key \'uk_student_class\'\\n; Duplicate entry \'2001-14\' for key \'uk_student_class\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2001-14\' for key \'uk_student_class\'\",\"code\":500}',0,NULL,'2026-01-04 08:54:49',122),(118,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2001','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":14} ','{\"msg\":\"选课失败：\\r\\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2001-14\' for key \'uk_student_class\'\\r\\n### The error may exist in file [D:\\\\coding\\\\project\\\\school-teaching-system\\\\backend\\\\RuoYi-Vue\\\\ruoyi-admin\\\\target\\\\classes\\\\mapper\\\\edu\\\\student\\\\EnrollmentMapper.xml]\\r\\n### The error may involve com.ruoyi.edu.student.mapper.EnrollmentMapper.insertEnrollment-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: insert into enrollment (         student_id, class_id, term_id, status,         grade, grade_status, enroll_time, drop_time,         create_by, create_time, update_by, update_time, remark         ) values (         ?, ?, ?, ?,         ?, ?, ?, ?,         ?, ?, ?, ?, ?         )\\r\\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2001-14\' for key \'uk_student_class\'\\n; Duplicate entry \'2001-14\' for key \'uk_student_class\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2001-14\' for key \'uk_student_class\'\",\"code\":500}',0,NULL,'2026-01-04 08:54:54',93),(119,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2001','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":12} ','{\"msg\":\"选课失败：\\r\\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2001-12\' for key \'uk_student_class\'\\r\\n### The error may exist in file [D:\\\\coding\\\\project\\\\school-teaching-system\\\\backend\\\\RuoYi-Vue\\\\ruoyi-admin\\\\target\\\\classes\\\\mapper\\\\edu\\\\student\\\\EnrollmentMapper.xml]\\r\\n### The error may involve com.ruoyi.edu.student.mapper.EnrollmentMapper.insertEnrollment-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: insert into enrollment (         student_id, class_id, term_id, status,         grade, grade_status, enroll_time, drop_time,         create_by, create_time, update_by, update_time, remark         ) values (         ?, ?, ?, ?,         ?, ?, ?, ?,         ?, ?, ?, ?, ?         )\\r\\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2001-12\' for key \'uk_student_class\'\\n; Duplicate entry \'2001-12\' for key \'uk_student_class\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2001-12\' for key \'uk_student_class\'\",\"code\":500}',0,NULL,'2026-01-04 08:55:00',102),(120,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'b_student2001','研发部门','/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":14} ','{\"msg\":\"选课失败：\\r\\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2001-14\' for key \'uk_student_class\'\\r\\n### The error may exist in file [D:\\\\coding\\\\project\\\\school-teaching-system\\\\backend\\\\RuoYi-Vue\\\\ruoyi-admin\\\\target\\\\classes\\\\mapper\\\\edu\\\\student\\\\EnrollmentMapper.xml]\\r\\n### The error may involve com.ruoyi.edu.student.mapper.EnrollmentMapper.insertEnrollment-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: insert into enrollment (         student_id, class_id, term_id, status,         grade, grade_status, enroll_time, drop_time,         create_by, create_time, update_by, update_time, remark         ) values (         ?, ?, ?, ?,         ?, ?, ?, ?,         ?, ?, ?, ?, ?         )\\r\\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2001-14\' for key \'uk_student_class\'\\n; Duplicate entry \'2001-14\' for key \'uk_student_class\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2001-14\' for key \'uk_student_class\'\",\"code\":500}',0,NULL,'2026-01-04 08:55:57',87),(121,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2001','研发部门','/edu/student/drop/7','127.0.0.1','内网IP','7 ','{\"msg\":\"成绩已发布，不能退课\",\"code\":500}',0,NULL,'2026-01-04 08:56:06',16),(122,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2001','研发部门','/edu/student/drop/8','127.0.0.1','内网IP','8 ','{\"msg\":\"成绩已发布，不能退课\",\"code\":500}',0,NULL,'2026-01-04 08:56:09',17),(123,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2001','研发部门','/edu/student/drop/10','127.0.0.1','内网IP','10 ','{\"msg\":\"成绩已发布，不能退课\",\"code\":500}',0,NULL,'2026-01-04 08:56:11',16),(124,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'b_student2001','研发部门','/edu/student/drop/11','127.0.0.1','内网IP','11 ','{\"msg\":\"成绩已发布，不能退课\",\"code\":500}',0,NULL,'2026-01-04 08:56:13',16),(125,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'student',NULL,'/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":2} ','{\"msg\":\"选课失败：\\r\\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-2\' for key \'uk_student_class\'\\r\\n### The error may exist in file [D:\\\\coding\\\\project\\\\school-teaching-system\\\\backend\\\\RuoYi-Vue\\\\ruoyi-admin\\\\target\\\\classes\\\\mapper\\\\edu\\\\student\\\\EnrollmentMapper.xml]\\r\\n### The error may involve com.ruoyi.edu.student.mapper.EnrollmentMapper.insertEnrollment-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: insert into enrollment (         student_id, class_id, term_id, status,         grade, grade_status, enroll_time, drop_time,         create_by, create_time, update_by, update_time, remark         ) values (         ?, ?, ?, ?,         ?, ?, ?, ?,         ?, ?, ?, ?, ?         )\\r\\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-2\' for key \'uk_student_class\'\\n; Duplicate entry \'3-2\' for key \'uk_student_class\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-2\' for key \'uk_student_class\'\",\"code\":500}',0,NULL,'2026-01-04 12:53:25',81),(126,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'student',NULL,'/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":2} ','{\"msg\":\"选课失败：\\r\\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-2\' for key \'uk_student_class\'\\r\\n### The error may exist in file [D:\\\\coding\\\\project\\\\school-teaching-system\\\\backend\\\\RuoYi-Vue\\\\ruoyi-admin\\\\target\\\\classes\\\\mapper\\\\edu\\\\student\\\\EnrollmentMapper.xml]\\r\\n### The error may involve com.ruoyi.edu.student.mapper.EnrollmentMapper.insertEnrollment-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: insert into enrollment (         student_id, class_id, term_id, status,         grade, grade_status, enroll_time, drop_time,         create_by, create_time, update_by, update_time, remark         ) values (         ?, ?, ?, ?,         ?, ?, ?, ?,         ?, ?, ?, ?, ?         )\\r\\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-2\' for key \'uk_student_class\'\\n; Duplicate entry \'3-2\' for key \'uk_student_class\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-2\' for key \'uk_student_class\'\",\"code\":500}',0,NULL,'2026-01-04 12:54:04',33),(127,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'student',NULL,'/edu/student/drop/1','127.0.0.1','内网IP','1 ','{\"msg\":\"成绩已发布，不能退课\",\"code\":500}',0,NULL,'2026-01-04 12:54:09',6),(128,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'student',NULL,'/edu/student/drop/47','127.0.0.1','内网IP','47 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-04 12:54:11',38),(129,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'student',NULL,'/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":14} ','{\"msg\":\"选课失败：\\r\\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-14\' for key \'uk_student_class\'\\r\\n### The error may exist in file [D:\\\\coding\\\\project\\\\school-teaching-system\\\\backend\\\\RuoYi-Vue\\\\ruoyi-admin\\\\target\\\\classes\\\\mapper\\\\edu\\\\student\\\\EnrollmentMapper.xml]\\r\\n### The error may involve com.ruoyi.edu.student.mapper.EnrollmentMapper.insertEnrollment-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: insert into enrollment (         student_id, class_id, term_id, status,         grade, grade_status, enroll_time, drop_time,         create_by, create_time, update_by, update_time, remark         ) values (         ?, ?, ?, ?,         ?, ?, ?, ?,         ?, ?, ?, ?, ?         )\\r\\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-14\' for key \'uk_student_class\'\\n; Duplicate entry \'3-14\' for key \'uk_student_class\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-14\' for key \'uk_student_class\'\",\"code\":500}',0,NULL,'2026-01-04 12:54:12',54),(130,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'student',NULL,'/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":2} ','{\"msg\":\"选课失败：\\r\\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-2\' for key \'uk_student_class\'\\r\\n### The error may exist in file [D:\\\\coding\\\\project\\\\school-teaching-system\\\\backend\\\\RuoYi-Vue\\\\ruoyi-admin\\\\target\\\\classes\\\\mapper\\\\edu\\\\student\\\\EnrollmentMapper.xml]\\r\\n### The error may involve com.ruoyi.edu.student.mapper.EnrollmentMapper.insertEnrollment-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: insert into enrollment (         student_id, class_id, term_id, status,         grade, grade_status, enroll_time, drop_time,         create_by, create_time, update_by, update_time, remark         ) values (         ?, ?, ?, ?,         ?, ?, ?, ?,         ?, ?, ?, ?, ?         )\\r\\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-2\' for key \'uk_student_class\'\\n; Duplicate entry \'3-2\' for key \'uk_student_class\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-2\' for key \'uk_student_class\'\",\"code\":500}',0,NULL,'2026-01-04 12:54:27',26),(131,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'student',NULL,'/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":2} ','{\"msg\":\"选课失败：\\r\\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-2\' for key \'uk_student_class\'\\r\\n### The error may exist in file [D:\\\\coding\\\\project\\\\school-teaching-system\\\\backend\\\\RuoYi-Vue\\\\ruoyi-admin\\\\target\\\\classes\\\\mapper\\\\edu\\\\student\\\\EnrollmentMapper.xml]\\r\\n### The error may involve com.ruoyi.edu.student.mapper.EnrollmentMapper.insertEnrollment-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: insert into enrollment (         student_id, class_id, term_id, status,         grade, grade_status, enroll_time, drop_time,         create_by, create_time, update_by, update_time, remark         ) values (         ?, ?, ?, ?,         ?, ?, ?, ?,         ?, ?, ?, ?, ?         )\\r\\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-2\' for key \'uk_student_class\'\\n; Duplicate entry \'3-2\' for key \'uk_student_class\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-2\' for key \'uk_student_class\'\",\"code\":500}',0,NULL,'2026-01-04 13:07:28',41),(132,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'student',NULL,'/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":6} ','{\"msg\":\"选课失败：\\r\\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-6\' for key \'uk_student_class\'\\r\\n### The error may exist in file [D:\\\\coding\\\\project\\\\school-teaching-system\\\\backend\\\\RuoYi-Vue\\\\ruoyi-admin\\\\target\\\\classes\\\\mapper\\\\edu\\\\student\\\\EnrollmentMapper.xml]\\r\\n### The error may involve com.ruoyi.edu.student.mapper.EnrollmentMapper.insertEnrollment-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: insert into enrollment (         student_id, class_id, term_id, status,         grade, grade_status, enroll_time, drop_time,         create_by, create_time, update_by, update_time, remark         ) values (         ?, ?, ?, ?,         ?, ?, ?, ?,         ?, ?, ?, ?, ?         )\\r\\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-6\' for key \'uk_student_class\'\\n; Duplicate entry \'3-6\' for key \'uk_student_class\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-6\' for key \'uk_student_class\'\",\"code\":500}',0,NULL,'2026-01-04 13:07:37',60),(133,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'student',NULL,'/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":7} ','{\"msg\":\"选课失败：\\r\\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-7\' for key \'uk_student_class\'\\r\\n### The error may exist in file [D:\\\\coding\\\\project\\\\school-teaching-system\\\\backend\\\\RuoYi-Vue\\\\ruoyi-admin\\\\target\\\\classes\\\\mapper\\\\edu\\\\student\\\\EnrollmentMapper.xml]\\r\\n### The error may involve com.ruoyi.edu.student.mapper.EnrollmentMapper.insertEnrollment-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: insert into enrollment (         student_id, class_id, term_id, status,         grade, grade_status, enroll_time, drop_time,         create_by, create_time, update_by, update_time, remark         ) values (         ?, ?, ?, ?,         ?, ?, ?, ?,         ?, ?, ?, ?, ?         )\\r\\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-7\' for key \'uk_student_class\'\\n; Duplicate entry \'3-7\' for key \'uk_student_class\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-7\' for key \'uk_student_class\'\",\"code\":500}',0,NULL,'2026-01-04 13:07:43',50),(134,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'student',NULL,'/edu/student/drop/1','127.0.0.1','内网IP','1 ','{\"msg\":\"成绩已发布，不能退课\",\"code\":500}',0,NULL,'2026-01-04 13:07:57',10),(135,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'student',NULL,'/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":2} ','{\"msg\":\"选课失败：\\r\\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-2\' for key \'uk_student_class\'\\r\\n### The error may exist in file [D:\\\\coding\\\\project\\\\school-teaching-system\\\\backend\\\\RuoYi-Vue\\\\ruoyi-admin\\\\target\\\\classes\\\\mapper\\\\edu\\\\student\\\\EnrollmentMapper.xml]\\r\\n### The error may involve com.ruoyi.edu.student.mapper.EnrollmentMapper.insertEnrollment-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: insert into enrollment (         student_id, class_id, term_id, status,         grade, grade_status, enroll_time, drop_time,         create_by, create_time, update_by, update_time, remark         ) values (         ?, ?, ?, ?,         ?, ?, ?, ?,         ?, ?, ?, ?, ?         )\\r\\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-2\' for key \'uk_student_class\'\\n; Duplicate entry \'3-2\' for key \'uk_student_class\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-2\' for key \'uk_student_class\'\",\"code\":500}',0,NULL,'2026-01-04 13:08:09',41),(136,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'student',NULL,'/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":2} ','{\"msg\":\"选课失败：\\r\\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-2\' for key \'uk_student_class\'\\r\\n### The error may exist in file [D:\\\\coding\\\\project\\\\school-teaching-system\\\\backend\\\\RuoYi-Vue\\\\ruoyi-admin\\\\target\\\\classes\\\\mapper\\\\edu\\\\student\\\\EnrollmentMapper.xml]\\r\\n### The error may involve com.ruoyi.edu.student.mapper.EnrollmentMapper.insertEnrollment-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: insert into enrollment (         student_id, class_id, term_id, status,         grade, grade_status, enroll_time, drop_time,         create_by, create_time, update_by, update_time, remark         ) values (         ?, ?, ?, ?,         ?, ?, ?, ?,         ?, ?, ?, ?, ?         )\\r\\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-2\' for key \'uk_student_class\'\\n; Duplicate entry \'3-2\' for key \'uk_student_class\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-2\' for key \'uk_student_class\'\",\"code\":500}',0,NULL,'2026-01-04 13:08:16',41),(137,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'student',NULL,'/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":2} ','{\"msg\":\"选课失败：\\r\\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-2\' for key \'uk_student_class\'\\r\\n### The error may exist in file [D:\\\\coding\\\\project\\\\school-teaching-system\\\\backend\\\\RuoYi-Vue\\\\ruoyi-admin\\\\target\\\\classes\\\\mapper\\\\edu\\\\student\\\\EnrollmentMapper.xml]\\r\\n### The error may involve com.ruoyi.edu.student.mapper.EnrollmentMapper.insertEnrollment-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: insert into enrollment (         student_id, class_id, term_id, status,         grade, grade_status, enroll_time, drop_time,         create_by, create_time, update_by, update_time, remark         ) values (         ?, ?, ?, ?,         ?, ?, ?, ?,         ?, ?, ?, ?, ?         )\\r\\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-2\' for key \'uk_student_class\'\\n; Duplicate entry \'3-2\' for key \'uk_student_class\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-2\' for key \'uk_student_class\'\",\"code\":500}',0,NULL,'2026-01-04 13:08:28',17),(138,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'student',NULL,'/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":2} ','{\"msg\":\"选课失败：\\r\\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-2\' for key \'uk_student_class\'\\r\\n### The error may exist in file [D:\\\\coding\\\\project\\\\school-teaching-system\\\\backend\\\\RuoYi-Vue\\\\ruoyi-admin\\\\target\\\\classes\\\\mapper\\\\edu\\\\student\\\\EnrollmentMapper.xml]\\r\\n### The error may involve com.ruoyi.edu.student.mapper.EnrollmentMapper.insertEnrollment-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: insert into enrollment (         student_id, class_id, term_id, status,         grade, grade_status, enroll_time, drop_time,         create_by, create_time, update_by, update_time, remark         ) values (         ?, ?, ?, ?,         ?, ?, ?, ?,         ?, ?, ?, ?, ?         )\\r\\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-2\' for key \'uk_student_class\'\\n; Duplicate entry \'3-2\' for key \'uk_student_class\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-2\' for key \'uk_student_class\'\",\"code\":500}',0,NULL,'2026-01-04 13:08:54',36),(139,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'student',NULL,'/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":2} ','{\"msg\":\"选课失败：\\r\\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-2\' for key \'uk_student_class\'\\r\\n### The error may exist in file [D:\\\\coding\\\\project\\\\school-teaching-system\\\\backend\\\\RuoYi-Vue\\\\ruoyi-admin\\\\target\\\\classes\\\\mapper\\\\edu\\\\student\\\\EnrollmentMapper.xml]\\r\\n### The error may involve com.ruoyi.edu.student.mapper.EnrollmentMapper.insertEnrollment-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: insert into enrollment (         student_id, class_id, term_id, status,         grade, grade_status, enroll_time, drop_time,         create_by, create_time, update_by, update_time, remark         ) values (         ?, ?, ?, ?,         ?, ?, ?, ?,         ?, ?, ?, ?, ?         )\\r\\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-2\' for key \'uk_student_class\'\\n; Duplicate entry \'3-2\' for key \'uk_student_class\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-2\' for key \'uk_student_class\'\",\"code\":500}',0,NULL,'2026-01-04 13:21:56',131),(140,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'student',NULL,'/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":6} ','{\"msg\":\"选课失败：\\r\\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-6\' for key \'uk_student_class\'\\r\\n### The error may exist in file [D:\\\\coding\\\\project\\\\school-teaching-system\\\\backend\\\\RuoYi-Vue\\\\ruoyi-admin\\\\target\\\\classes\\\\mapper\\\\edu\\\\student\\\\EnrollmentMapper.xml]\\r\\n### The error may involve com.ruoyi.edu.student.mapper.EnrollmentMapper.insertEnrollment-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: insert into enrollment (         student_id, class_id, term_id, status,         grade, grade_status, enroll_time, drop_time,         create_by, create_time, update_by, update_time, remark         ) values (         ?, ?, ?, ?,         ?, ?, ?, ?,         ?, ?, ?, ?, ?         )\\r\\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-6\' for key \'uk_student_class\'\\n; Duplicate entry \'3-6\' for key \'uk_student_class\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-6\' for key \'uk_student_class\'\",\"code\":500}',0,NULL,'2026-01-04 13:21:58',93),(141,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'student',NULL,'/edu/student/drop/1','127.0.0.1','内网IP','1 ','{\"msg\":\"成绩已发布，不能退课\",\"code\":500}',0,NULL,'2026-01-04 13:22:04',14),(142,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'student',NULL,'/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":2} ','{\"msg\":\"选课失败：\\r\\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-2\' for key \'uk_student_class\'\\r\\n### The error may exist in file [D:\\\\coding\\\\project\\\\school-teaching-system\\\\backend\\\\RuoYi-Vue\\\\ruoyi-admin\\\\target\\\\classes\\\\mapper\\\\edu\\\\student\\\\EnrollmentMapper.xml]\\r\\n### The error may involve com.ruoyi.edu.student.mapper.EnrollmentMapper.insertEnrollment-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: insert into enrollment (         student_id, class_id, term_id, status,         grade, grade_status, enroll_time, drop_time,         create_by, create_time, update_by, update_time, remark         ) values (         ?, ?, ?, ?,         ?, ?, ?, ?,         ?, ?, ?, ?, ?         )\\r\\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-2\' for key \'uk_student_class\'\\n; Duplicate entry \'3-2\' for key \'uk_student_class\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3-2\' for key \'uk_student_class\'\",\"code\":500}',0,NULL,'2026-01-04 13:22:14',27),(143,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'student',NULL,'/edu/student/drop/1','127.0.0.1','内网IP','1 ','{\"msg\":\"成绩已发布，不能退课\",\"code\":500}',0,NULL,'2026-01-04 13:59:23',34),(144,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'student',NULL,'/edu/student/drop/46','127.0.0.1','内网IP','46 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-04 13:59:25',37),(145,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'student',NULL,'/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":2} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-04 13:59:27',114),(146,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'student',NULL,'/edu/student/drop/53','127.0.0.1','内网IP','53 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-04 13:59:40',40),(147,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'student',NULL,'/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":9} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-04 13:59:49',89),(148,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'student',NULL,'/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":7} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-04 13:59:58',84),(149,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'student',NULL,'/edu/student/drop/52','127.0.0.1','内网IP','52 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-04 13:59:59',37),(150,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'student',NULL,'/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":6} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-04 14:00:00',97),(151,'学生退课',3,'com.ruoyi.edu.student.controller.EduStudentController.drop()','POST',1,'student',NULL,'/edu/student/drop/50','127.0.0.1','内网IP','50 ','{\"msg\":\"退课成功\",\"code\":200}',0,NULL,'2026-01-04 14:00:00',28),(152,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'student',NULL,'/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":6} ','{\"msg\":\"选课成功\",\"code\":200}',0,NULL,'2026-01-04 14:00:02',85),(153,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'student',NULL,'/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":7} ','{\"msg\":\"同一学期不能选多个同一课程号的课程\",\"code\":500}',0,NULL,'2026-01-04 14:00:03',30),(154,'学生选课',1,'com.ruoyi.edu.student.controller.EduStudentController.enroll()','POST',1,'student',NULL,'/edu/student/enroll','127.0.0.1','内网IP','{\"classId\":7} ','{\"msg\":\"同一学期不能选多个同一课程号的课程\",\"code\":500}',0,NULL,'2026-01-04 14:00:06',28);
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES (1,'ceo','董事长',1,'0','admin','2025-12-26 15:15:34','',NULL,''),(2,'se','项目经理',2,'0','admin','2025-12-26 15:15:34','',NULL,''),(3,'hr','人力资源',3,'0','admin','2025-12-26 15:15:34','',NULL,''),(4,'user','普通员工',4,'0','admin','2025-12-26 15:15:34','',NULL,'');
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
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
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员','admin',1,'1',1,1,'0','0','admin','2025-12-26 15:15:34','',NULL,'超级管理员'),(2,'普通角色','common',2,'2',1,1,'0','0','admin','2025-12-26 15:15:34','',NULL,'普通角色'),(3,'学生','student',3,'1',1,1,'0','0','b_admin','2026-01-04 12:17:42','',NULL,'[B]学生角色，只能访问学生功能模块'),(4,'教师','teacher',4,'1',1,1,'0','0','b_admin','2026-01-04 12:17:42','',NULL,'[B]教师角色，只能访问教师功能模块'),(100,'选课管理员','enroll_admin',2,'1',1,1,'0','0','admin','2026-01-04 15:33:24','',NULL,'负责学期、课程、教学班及学分规则管理');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色和部门关联表';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (2,1),(2,2),(2,3),(2,4),(2,100),(2,101),(2,102),(2,103),(2,104),(2,105),(2,106),(2,107),(2,108),(2,109),(2,110),(2,111),(2,112),(2,113),(2,114),(2,115),(2,116),(2,117),(2,500),(2,501),(2,1000),(2,1001),(2,1002),(2,1003),(2,1004),(2,1005),(2,1006),(2,1007),(2,1008),(2,1009),(2,1010),(2,1011),(2,1012),(2,1013),(2,1014),(2,1015),(2,1016),(2,1017),(2,1018),(2,1019),(2,1020),(2,1021),(2,1022),(2,1023),(2,1024),(2,1025),(2,1026),(2,1027),(2,1028),(2,1029),(2,1030),(2,1031),(2,1032),(2,1033),(2,1034),(2,1035),(2,1036),(2,1037),(2,1038),(2,1039),(2,1040),(2,1041),(2,1042),(2,1043),(2,1044),(2,1045),(2,1046),(2,1047),(2,1048),(2,1049),(2,1050),(2,1051),(2,1052),(2,1053),(2,1054),(2,1055),(2,1056),(2,1057),(2,1058),(2,1059),(2,1060),(3,2001),(3,2002),(3,2003),(3,2004),(3,2101),(3,2102),(3,2103),(3,2104),(3,2105),(4,2005),(4,2006),(4,2201),(4,2202),(4,2203),(4,2204),(100,2205),(100,2206),(100,2207),(100,2208),(100,2300),(100,2301),(100,2302),(100,2303),(100,2304),(100,2310),(100,2311),(100,2312),(100,2313),(100,2314),(100,2320),(100,2321),(100,2322),(100,2323),(100,2324),(100,2330),(100,2331),(100,2332),(100,2333),(100,2334),(100,2335),(100,2336),(100,2337),(100,2338);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
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
) ENGINE=InnoDB AUTO_INCREMENT=3001 DEFAULT CHARSET=utf8mb4 COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,103,'admin','若依','00','ry@163.com','15888888888','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2026-01-04 16:59:22','2025-12-26 15:15:33','admin','2025-12-26 15:15:33','',NULL,'管理员'),(2,105,'ry','若依','00','ry@qq.com','15666666666','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2025-12-26 15:15:33','2025-12-26 15:15:33','admin','2025-12-26 15:15:33','',NULL,'测试员'),(3,NULL,'student','测试学生','00','','13800000001','0','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2026-01-04 19:42:44',NULL,'','2025-12-29 00:32:22','',NULL,NULL),(4,NULL,'teacher','测试教师','00','','13800000002','0','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2026-01-04 17:04:52',NULL,'','2025-12-29 00:32:22','',NULL,NULL),(1001,103,'b_teacher1001','张老师','00','b_teacher1001@test.com','13900001001','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2026-01-04 12:50:54',NULL,'b_admin','2026-01-04 12:17:42','',NULL,'[B]教师测试账号1（计算机基础）'),(1002,103,'b_teacher1002','李老师','00','b_teacher1002@test.com','13900001002','0','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','',NULL,NULL,'b_admin','2026-01-04 12:17:42','',NULL,'[B]教师测试账号2（数据结构）'),(1003,103,'b_teacher1003','王老师','00','b_teacher1003@test.com','13900001003','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','',NULL,NULL,'b_admin','2026-01-04 12:17:42','',NULL,'[B]教师测试账号3（高等数学）'),(1004,103,'b_teacher1004','赵老师','00','b_teacher1004@test.com','13900001004','0','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','',NULL,NULL,'b_admin','2026-01-04 12:17:42','',NULL,'[B]教师测试账号4（大学英语）'),(1005,103,'b_teacher1005','钱老师','00','b_teacher1005@test.com','13900001005','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','',NULL,NULL,'b_admin','2026-01-04 12:17:42','',NULL,'[B]教师测试账号5（大学物理）'),(1006,103,'b_teacher1006','孙老师','00','b_teacher1006@test.com','13900001006','0','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','',NULL,NULL,'b_admin','2026-01-04 12:17:42','',NULL,'[B]教师测试账号6（大学化学）'),(1007,103,'b_teacher1007','周老师','00','b_teacher1007@test.com','13900001007','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','',NULL,NULL,'b_admin','2026-01-04 12:17:42','',NULL,'[B]教师测试账号7（大学体育）'),(1008,103,'b_teacher1008','吴老师','00','b_teacher1008@test.com','13900001008','0','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','',NULL,NULL,'b_admin','2026-01-04 12:17:42','',NULL,'[B]教师测试账号8（艺术鉴赏）'),(2001,103,'b_student2001','张三','00','b_student2001@test.com','13800002001','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','',NULL,NULL,'b_admin','2026-01-04 12:17:42','',NULL,'[B]学生测试账号1'),(2002,103,'b_student2002','李四','00','b_student2002@test.com','13800002002','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','',NULL,NULL,'b_admin','2026-01-04 12:17:42','',NULL,'[B]学生测试账号2'),(2003,103,'b_student2003','王五','00','b_student2003@test.com','13800002003','0','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','',NULL,NULL,'b_admin','2026-01-04 12:17:42','',NULL,'[B]学生测试账号3'),(2004,103,'b_student2004','赵六','00','b_student2004@test.com','13800002004','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','',NULL,NULL,'b_admin','2026-01-04 12:17:42','',NULL,'[B]学生测试账号4'),(2005,103,'b_student2005','钱七','00','b_student2005@test.com','13800002005','0','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','',NULL,NULL,'b_admin','2026-01-04 12:17:42','',NULL,'[B]学生测试账号5'),(2006,103,'b_student2006','孙八','00','b_student2006@test.com','13800002006','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','',NULL,NULL,'b_admin','2026-01-04 12:17:42','',NULL,'[B]学生测试账号6'),(2007,103,'b_student2007','周九','00','b_student2007@test.com','13800002007','0','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','',NULL,NULL,'b_admin','2026-01-04 12:17:42','',NULL,'[B]学生测试账号7'),(2008,103,'b_student2008','吴十','00','b_student2008@test.com','13800002008','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','',NULL,NULL,'b_admin','2026-01-04 12:17:42','',NULL,'[B]学生测试账号8'),(2009,103,'b_student2009','郑十一','00','b_student2009@test.com','13800002009','0','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','',NULL,NULL,'b_admin','2026-01-04 12:17:42','',NULL,'[B]学生测试账号9'),(2010,103,'b_student2010','王十二','00','b_student2010@test.com','13800002010','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','',NULL,NULL,'b_admin','2026-01-04 12:17:42','',NULL,'[B]学生测试账号10'),(3000,103,'admin_edu','教务管理员','00','edu@school.com','15888888888','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2026-01-04 19:43:03',NULL,'admin','2026-01-04 15:33:24','',NULL,'A角色测试账号');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户与岗位关联表';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1),(2,2),(3,3),(4,4),(1001,4),(1002,4),(1003,4),(1004,4),(1005,4),(1006,4),(1007,4),(1008,4),(2001,3),(2002,3),(2003,3),(2004,3),(2005,3),(2006,3),(2007,3),(2008,3),(2009,3),(2010,3),(3000,100);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `term`
--

DROP TABLE IF EXISTS `term`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  KEY `idx_is_active` (`is_active`),
  KEY `idx_enroll_time` (`enroll_start`,`enroll_end`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='瀛︽湡琛';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `term`
--

LOCK TABLES `term` WRITE;
/*!40000 ALTER TABLE `term` DISABLE KEYS */;
INSERT INTO `term` VALUES ('2024-2025-1','2025-2026秋季学期',NULL,NULL,NULL,1,'','2025-12-26 22:17:55','','2026-01-04 13:04:01',''),('2024-2025-2','2025-2026春季学期',NULL,NULL,NULL,0,'','2025-12-26 22:17:55','','2026-01-04 13:04:01',''),('b_2024_fall','2025-2026秋季学期','2024-09-01 00:00:00','2024-09-30 00:00:00','2024-10-15 00:00:00',1,'','2025-12-29 16:02:08','','2026-01-04 13:05:53',''),('b_2024_spring','2025-2026春季学期','2025-03-01 00:00:00','2025-03-31 00:00:00','2025-04-15 00:00:00',0,'','2025-12-29 16:02:08','','2026-01-04 13:05:53',''),('b_2024_summer','B测试夏季学期','2025-07-01 00:00:00','2025-07-31 00:00:00','2025-08-15 00:00:00',1,'','2025-12-29 16:02:08','','2025-12-29 16:02:08','');
/*!40000 ALTER TABLE `term` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'ry-vue'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_get_student_credits` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_get_student_credits`(p_student_id BIGINT, p_term_id VARCHAR(20)) RETURNS int(11)
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
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_calc_student_credits`(
    IN p_student_id BIGINT,
    IN p_term_id VARCHAR(20),
    OUT p_total_credits INT
)
BEGIN
    DECLARE v_total INT DEFAULT 0;
    
    
    
    SELECT COALESCE(SUM(c.credit_hours), 0) INTO v_total
    FROM enrollment e
    JOIN course_class cc ON e.class_id = cc.class_id
    JOIN course c ON cc.course_id = c.course_id
    WHERE e.student_id = p_student_id
      AND e.term_id LIKE CONCAT('%', p_term_id, '%')  
      AND e.status = 'ENROLLED'
      AND cc.status = 1;  
    
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
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
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
    
    
    SELECT cc.term_id, c.credit_hours INTO v_term_id, v_course_credits
    FROM course_class cc
    JOIN course c ON cc.course_id = c.course_id
    WHERE cc.class_id = p_class_id;
    
    
    CALL sp_calc_student_credits(p_student_id, v_term_id, v_current_credits);
    
    
    SELECT COALESCE(MAX(max_credits), 20) INTO v_max_credits
    FROM credit_rule 
    WHERE term_id = v_term_id AND is_active = 1;
    
    
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-04 19:48:20

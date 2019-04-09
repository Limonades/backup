# ************************************************************
# Sequel Pro SQL dump
# Version 5438
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: haircare-qa.cxa69kwp1jma.us-east-1.rds.amazonaws.com (MySQL 5.5.5-10.0.24-MariaDB)
# Database: haircare_qa
# Generation Time: 2019-04-08 23:44:24 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table craft_assetindexdata
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_assetindexdata`;

CREATE TABLE `craft_assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` varchar(36) NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text,
  `size` bigint(20) unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_assetindexdata_sessionId_volumeId_idx` (`sessionId`,`volumeId`),
  KEY `craft_assetindexdata_volumeId_idx` (`volumeId`),
  CONSTRAINT `craft_assetindexdata_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `craft_volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table craft_assets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_assets`;

CREATE TABLE `craft_assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_assets_filename_folderId_idx` (`filename`,`folderId`),
  KEY `craft_assets_folderId_idx` (`folderId`),
  KEY `craft_assets_volumeId_idx` (`volumeId`),
  CONSTRAINT `craft_assets_folderId_fk` FOREIGN KEY (`folderId`) REFERENCES `craft_volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_assets_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_assets_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `craft_volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_assets` WRITE;
/*!40000 ALTER TABLE `craft_assets` DISABLE KEYS */;

INSERT INTO `craft_assets` (`id`, `volumeId`, `folderId`, `filename`, `kind`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(6,1,1,'test-anchor-image.png','image',440,600,332248,NULL,NULL,NULL,'2019-03-06 23:57:46','2019-03-06 23:57:46','2019-03-13 14:43:01','cc63ca2a-6e09-47d5-9a7a-8eb8338994da'),
	(8,1,1,'test-bg-2.png','image',1960,1280,553743,NULL,NULL,NULL,'2019-03-07 00:11:00','2019-03-07 00:10:59','2019-03-13 14:43:02','0eb5a00d-bfc4-4f3d-9ee3-4023a257f931'),
	(9,1,1,'test-brushstroke.png','image',904,358,198240,NULL,NULL,NULL,'2019-03-07 00:13:12','2019-03-07 00:13:11','2019-03-13 14:43:03','ff638ed5-7a07-4c70-a3d1-0fb243ac88ae'),
	(11,1,1,'test-collections-1.png','image',600,480,489205,NULL,NULL,NULL,'2019-03-07 00:15:18','2019-03-07 00:15:18','2019-03-13 14:43:03','67017ede-3b47-4196-96be-769bce9300ba'),
	(12,1,1,'test-collections-2.png','image',600,480,480242,NULL,NULL,NULL,'2019-03-07 00:15:37','2019-03-07 00:15:36','2019-03-13 14:43:03','b3bdc610-aadb-4ff2-93b7-cd70b4ca6e84'),
	(13,1,1,'test-collections-3.png','image',600,480,463505,NULL,NULL,NULL,'2019-03-07 00:15:59','2019-03-07 00:15:58','2019-03-13 14:43:04','68c658bf-05c0-43f2-bb55-a474135744ce'),
	(19,1,1,'test-video-banner.png','image',1880,600,531268,NULL,NULL,NULL,'2019-03-07 00:17:41','2019-03-07 00:17:40','2019-03-13 14:43:06','df589552-583f-4beb-8e4e-9457a97b89c2'),
	(24,1,1,'test-vh-image.png','image',1320,1280,1451474,NULL,NULL,NULL,'2019-03-07 01:00:58','2019-03-07 01:00:57','2019-03-13 14:43:04','22bee7ac-407c-4247-9c96-766548048af9'),
	(28,1,1,'logo.jpeg','image',1600,1600,72614,NULL,NULL,NULL,'2019-03-06 01:05:25','2019-03-13 14:43:01','2019-03-13 14:43:01','2a940e1a-c995-4a1a-bb6e-a1dbb9a1c729'),
	(29,1,1,'1997_newgen_twothirds.png','image',1320,1280,1988351,NULL,NULL,NULL,'2019-03-14 17:21:38','2019-03-14 17:21:38','2019-03-14 17:21:38','fabe2e1d-9fa3-451a-b5f3-757ccb4ad7b7'),
	(30,1,1,'1997-newgen_bg.png','image',1960,1280,582396,NULL,NULL,NULL,'2019-03-14 17:21:45','2019-03-14 17:21:45','2019-03-14 17:21:45','28edcfe2-7114-4360-9bc1-e70d13494d84'),
	(31,1,1,'1997-newgen_parallax.png','image',480,1280,1029505,NULL,NULL,NULL,'2019-03-14 17:21:52','2019-03-14 17:21:52','2019-03-14 17:21:52','650f954c-6755-408c-83e0-ca13b5e3ecc2'),
	(32,1,1,'1999-antiaging_anchor.png','image',440,600,283763,NULL,NULL,NULL,'2019-03-14 17:21:56','2019-03-14 17:21:56','2019-03-14 17:21:56','aa320405-4d8e-45fe-8ff1-90c9a3913867'),
	(33,1,1,'1999-antiaging_bg.png','image',1960,1280,203945,NULL,NULL,NULL,'2019-03-14 17:22:00','2019-03-14 17:22:00','2019-03-14 17:22:00','d73a0612-8c0c-4a41-9dff-cf15114e03f0'),
	(34,1,1,'1999-antiaging_bg2.png','image',1960,1280,481055,NULL,NULL,NULL,'2019-03-14 17:22:07','2019-03-14 17:22:07','2019-03-14 17:22:07','fd4aa75f-524a-433c-b12d-df8cd305e52d'),
	(35,1,1,'1999-antiaging_parallax.png','image',480,1280,1029505,NULL,NULL,NULL,'2019-03-14 17:22:13','2019-03-14 17:22:13','2019-03-14 17:22:13','804a3fc2-1648-4b77-8ef3-50c67a043150'),
	(36,1,1,'1999-antiaging_parallax2.png','image',904,358,198240,NULL,NULL,NULL,'2019-03-14 17:22:15','2019-03-14 17:22:15','2019-03-14 17:22:15','a64b9669-2ccd-4f67-a34e-e58b9c47e14c'),
	(37,1,1,'1999-antiaging_twothirds-X.png','image',660,640,430724,NULL,NULL,NULL,'2019-03-14 17:22:19','2019-03-14 17:22:19','2019-03-14 17:22:19','820f6d6f-dfce-412c-8d6b-04c02dd7168c'),
	(38,1,1,'1999-antiaging_video.png','image',1880,600,531268,NULL,NULL,NULL,'2019-03-14 17:22:23','2019-03-14 17:22:23','2019-03-14 17:22:23','2646fd69-1632-4b60-b5c9-45c89f6aa285'),
	(39,1,1,'1999-lifeline_anchor.png','image',440,600,348302,NULL,NULL,NULL,'2019-03-14 17:22:27','2019-03-14 17:22:27','2019-03-14 17:22:27','2d9ec26a-9e4a-45d0-9a8b-f555338b602e'),
	(40,1,1,'1999-lifeline_bg.png','image',1960,1280,664533,NULL,NULL,NULL,'2019-03-14 17:22:33','2019-03-14 17:22:33','2019-03-14 17:22:33','0e5a14be-16b0-4311-bdf9-723e1454617a'),
	(41,1,1,'1999-lifeline_bg2.png','image',1960,1280,4457660,NULL,NULL,NULL,'2019-03-14 17:22:53','2019-03-14 17:22:53','2019-03-14 17:22:53','339b2cdd-302d-474e-a9de-f3baece34fbc'),
	(42,1,1,'1999-lifeline_parallax.png','image',480,1280,1008041,NULL,NULL,NULL,'2019-03-14 17:23:02','2019-03-14 17:23:02','2019-03-14 17:23:02','91aa78e1-4cfc-4bb7-9d63-f957811a28e1'),
	(43,1,1,'1999-lifeline_slide1.png','image',600,480,50734,NULL,NULL,NULL,'2019-03-14 17:23:03','2019-03-14 17:23:03','2019-03-14 17:23:03','2c6f5b49-5e40-4ac1-b45b-0ad64850bd4c'),
	(44,1,1,'1999-lifeline_slide2.png','image',600,480,55089,NULL,NULL,NULL,'2019-03-14 17:23:04','2019-03-14 17:23:04','2019-03-14 17:23:04','fb876ed2-58a9-4a38-8503-dfbfa14bcf89'),
	(45,1,1,'1999-lifeline_slide3.png','image',600,480,52856,NULL,NULL,NULL,'2019-03-14 17:23:05','2019-03-14 17:23:05','2019-03-14 17:23:05','278a3e13-91bc-477e-b7c2-f8d10061a1d2'),
	(46,1,1,'1999-lifeline_twothirds.png','image',1320,1280,2177929,NULL,NULL,NULL,'2019-03-14 17:23:24','2019-03-14 17:23:24','2019-03-14 17:23:24','637945e4-1c0c-4d14-a4fe-59f1b4b9bb39'),
	(47,1,1,'2005-caviar_anchor.png','image',440,600,336911,NULL,NULL,NULL,'2019-03-14 17:23:27','2019-03-14 17:23:27','2019-03-14 17:23:27','1b8ca05c-a110-4a9f-a67a-826f8672cccf'),
	(48,1,1,'2005-caviar_bg.png','image',1960,1280,1731782,NULL,NULL,NULL,'2019-03-14 17:23:43','2019-03-14 17:23:44','2019-03-14 17:23:44','d8a4e827-4de3-431b-a870-996085868abd'),
	(49,1,1,'2005-caviar_parallax.png','image',480,1280,811346,NULL,NULL,NULL,'2019-03-14 17:23:52','2019-03-14 17:23:52','2019-03-14 17:23:52','ba709912-1a7d-43dd-a3f5-197af26e28a5'),
	(50,1,1,'2005-caviar_twothirds.png','image',1320,1280,1834316,NULL,NULL,NULL,'2019-03-14 17:24:07','2019-03-14 17:24:07','2019-03-14 17:24:07','9139126b-b291-4dff-86ad-649d1c62249c'),
	(51,1,1,'2005-truffle_anchor.png','image',440,600,146097,NULL,NULL,NULL,'2019-03-14 17:24:10','2019-03-14 17:24:10','2019-03-14 17:24:10','9e83ed21-c815-4874-b4d7-2c4df5dde07c'),
	(52,1,1,'2005-truffle_bg.png','image',1960,1280,736427,NULL,NULL,NULL,'2019-03-14 17:24:17','2019-03-14 17:24:17','2019-03-14 17:24:17','1b9f6b78-ae66-4da1-b465-cb6a13e19a89'),
	(53,1,1,'2005-truffle_parallax.png','image',480,1280,889282,NULL,NULL,NULL,'2019-03-14 17:24:24','2019-03-14 17:24:24','2019-03-14 17:24:24','695a2795-078d-4115-abb7-d9147301be3a'),
	(54,1,1,'2005-truffle_twothirds.png','image',1320,1280,2562141,NULL,NULL,NULL,'2019-03-14 17:24:42','2019-03-14 17:24:42','2019-03-14 17:24:42','716caf09-1315-40fb-ab9f-be96fb639319'),
	(55,1,1,'2007-ten_anchor.png','image',440,600,175940,NULL,NULL,NULL,'2019-03-14 17:24:45','2019-03-14 17:24:45','2019-03-14 17:24:45','5e3e6507-9bac-4b81-96de-6ab18b257e47'),
	(56,1,1,'2007-ten_bg.png','image',1736,1280,896652,NULL,NULL,NULL,'2019-03-14 17:24:54','2019-03-14 17:24:54','2019-03-14 17:24:54','89302ae0-3d3c-48d5-b62a-78f3456eeda3'),
	(57,1,1,'2007-ten_parallax.png','image',480,1280,817619,NULL,NULL,NULL,'2019-03-14 17:25:00','2019-03-14 17:25:01','2019-03-14 17:25:01','cf488fca-d757-4759-b337-fc09e10ee297'),
	(58,1,1,'2007-ten_twothirds.png','image',1320,1280,2466685,NULL,NULL,NULL,'2019-03-14 17:25:20','2019-03-14 17:25:20','2019-03-14 17:25:20','78f61a9b-0f77-47c5-a454-fac212687911'),
	(59,1,1,'2008-hemp_anchor.png','image',440,600,210116,NULL,NULL,NULL,'2019-03-14 17:25:22','2019-03-14 17:25:22','2019-03-14 17:25:22','23850daa-3d3b-442e-950c-4db66a75eb64'),
	(60,1,1,'2008-hemp_bg.png','image',1960,1280,1124408,NULL,NULL,NULL,'2019-03-14 17:25:33','2019-03-14 17:25:33','2019-03-14 17:25:33','a350082f-9a30-4870-be0e-2ccf96bf999b'),
	(61,1,1,'2008-hemp_parallax.png','image',480,1280,650121,NULL,NULL,NULL,'2019-03-14 17:25:40','2019-03-14 17:25:40','2019-03-14 17:25:40','5e03f22c-5bff-4bb3-9f91-a0c4d1da4198'),
	(62,1,1,'2008-hemp_twothirds.png','image',1320,1280,1431769,NULL,NULL,NULL,'2019-03-14 17:25:53','2019-03-14 17:25:53','2019-03-14 17:25:53','2dbb3f77-cf6a-4e11-9f3e-5d3d6165420e'),
	(63,1,1,'2008-life_anchor.png','image',440,600,288707,NULL,NULL,NULL,'2019-03-14 17:25:56','2019-03-14 17:25:56','2019-03-14 17:25:56','58cf2610-18ee-47e6-a029-266a3aa7928a'),
	(64,1,1,'2008-life_bg.png','image',1960,1280,582396,NULL,NULL,NULL,'2019-03-14 17:26:03','2019-03-14 17:26:03','2019-03-14 17:26:03','1678825d-84b0-49aa-82c1-5782348d5c52'),
	(65,1,1,'2008-life_parallax.png','image',480,1280,808896,NULL,NULL,NULL,'2019-03-14 17:26:11','2019-03-14 17:26:11','2019-03-14 17:26:11','1207f89b-7f2a-4a02-ae15-9042933536e7'),
	(66,1,1,'2008-life_twothirds.png','image',1320,1280,2142293,NULL,NULL,NULL,'2019-03-14 17:26:29','2019-03-14 17:26:29','2019-03-14 17:26:29','0296babe-8bc1-445c-8897-65c4b9744076'),
	(67,1,1,'2008-seasilk_anchor.png','image',440,600,439380,NULL,NULL,NULL,'2019-03-14 17:26:34','2019-03-14 17:26:34','2019-03-14 17:26:34','d890f64f-5923-4316-9f58-3a0146b40c26'),
	(68,1,1,'2008-seasilk_bg.png','image',1960,1280,642017,NULL,NULL,NULL,'2019-03-14 17:26:42','2019-03-14 17:26:43','2019-03-14 17:26:43','9213e434-2c26-4e15-b8c8-469e3214fc61'),
	(69,1,1,'2008-seasilk_parallax.png','image',480,1280,552056,NULL,NULL,NULL,'2019-03-14 17:26:48','2019-03-14 17:26:48','2019-03-14 17:26:48','0081d4d6-9c06-4d96-8600-f2f3d0dce3fd'),
	(70,1,1,'2008-seasilk_twothirds.png','image',1320,1280,1822278,NULL,NULL,NULL,'2019-03-14 17:27:03','2019-03-14 17:27:03','2019-03-14 17:27:03','7a5a6d7a-3766-45fd-a44f-c092f7ee740c'),
	(71,1,1,'2010-bamboo_anchor.png','image',440,600,371985,NULL,NULL,NULL,'2019-03-14 17:27:07','2019-03-14 17:27:07','2019-03-14 17:27:07','95f74e6a-9829-4888-a95b-104d3b4a51d7'),
	(72,1,1,'2010-bamboo_bg.png','image',1960,1280,2410880,NULL,NULL,NULL,'2019-03-14 17:27:26','2019-03-14 17:27:26','2019-03-14 17:27:26','5722ee22-899d-4a39-a4f0-d59a16c43d9c'),
	(73,1,1,'2010-bamboo_parallax.png','image',480,1280,966555,NULL,NULL,NULL,'2019-03-14 17:27:35','2019-03-14 17:27:35','2019-03-14 17:27:35','78e02da4-485a-4305-9473-ff86c473a9e0'),
	(74,1,1,'2010-bamboo_twothirds.png','image',1320,1280,1154093,NULL,NULL,NULL,'2019-03-14 17:27:46','2019-03-14 17:27:46','2019-03-14 17:27:46','3085e078-dd62-4513-849d-582f4da72dbe'),
	(75,1,1,'2011-bamboo_anchor.png','image',440,600,321994,NULL,NULL,NULL,'2019-03-14 17:27:49','2019-03-14 17:27:49','2019-03-14 17:27:49','d47c1dfd-e0bf-434d-bfe8-ff0d189de61e'),
	(76,1,1,'2011-bamboo_bg.png','image',1960,1280,582396,NULL,NULL,NULL,'2019-03-14 17:27:55','2019-03-14 17:27:55','2019-03-14 17:27:55','dbb9124a-949c-4275-b0fa-602d73509a7f'),
	(77,1,1,'2011-bamboo_parallax_X.png','image',480,1280,966555,NULL,NULL,NULL,'2019-03-14 17:28:03','2019-03-14 17:28:03','2019-03-14 17:28:03','38bac9ea-db3a-445f-8e9f-bfc0e577ebea'),
	(78,1,1,'2011-bamboo_twothirds.png','image',1320,1280,1375799,NULL,NULL,NULL,'2019-03-14 17:28:15','2019-03-14 17:28:16','2019-03-14 17:28:16','12910fb0-1955-4701-b897-be826aeadaf6'),
	(79,1,1,'2012-bamboo_anchor.png','image',440,600,169396,NULL,NULL,NULL,'2019-03-14 17:28:17','2019-03-14 17:28:17','2019-03-14 17:28:17','83e65b42-feb4-415d-a9db-a5bd7c742424'),
	(80,1,1,'2012-bamboo_bg.png','image',1960,1280,582396,NULL,NULL,NULL,'2019-03-14 17:28:23','2019-03-14 17:28:23','2019-03-14 17:28:23','86b1930a-2c8a-401b-8522-20391a98f40b'),
	(81,1,1,'2012-bamboo_parallax.png','image',480,1280,718581,NULL,NULL,NULL,'2019-03-14 17:28:30','2019-03-14 17:28:31','2019-03-14 17:28:31','aa54fc51-8f6f-42a2-b90c-f1b6af89b950'),
	(82,1,1,'2012-bamboo_twothirds.png','image',1320,1280,2923618,NULL,NULL,NULL,'2019-03-14 17:28:46','2019-03-14 17:28:46','2019-03-14 17:28:46','15299a7d-0265-462a-8e8b-2d50a27dd08e'),
	(83,1,1,'2013-bamboo_anchor.png','image',440,600,369419,NULL,NULL,NULL,'2019-03-14 17:28:49','2019-03-14 17:28:49','2019-03-14 17:28:49','679abc05-7a97-4674-9272-1d2c38e97948'),
	(84,1,1,'2013-bamboo_bg.png','image',1960,1280,1766110,NULL,NULL,NULL,'2019-03-14 17:29:08','2019-03-14 17:29:08','2019-03-14 17:29:08','77ab07e5-7043-42c5-8e82-0a49ff10a186'),
	(85,1,1,'2013-bamboo_parallax.png','image',480,1280,1023540,NULL,NULL,NULL,'2019-03-14 17:29:15','2019-03-14 17:29:15','2019-03-14 17:29:15','cb143ecf-13ce-41ac-94db-781cc7b1ed57'),
	(86,1,1,'2013-bamboo_twothirds.png','image',660,640,799921,NULL,NULL,NULL,'2019-03-14 17:29:21','2019-03-14 17:29:21','2019-03-14 17:29:21','e53ed50e-56da-4207-98c8-0d857bd997cf'),
	(87,1,1,'2018-caviar_anchor.png','image',220,300,84057,NULL,NULL,NULL,'2019-03-14 17:29:22','2019-03-14 17:29:22','2019-03-14 17:29:22','06862fbb-24af-4786-9837-d085d8683ab4'),
	(88,1,1,'2018-caviar_bg.png','image',1960,1280,882780,NULL,NULL,NULL,'2019-03-14 17:29:31','2019-03-14 17:29:32','2019-03-14 17:29:32','70a96ed5-6aee-49ee-9fde-03a72c47d1cc'),
	(89,1,1,'2018-caviar_bg2.png','image',980,640,811827,NULL,NULL,NULL,'2019-03-14 17:29:38','2019-03-14 17:29:38','2019-03-14 17:29:38','2cdce335-c4ec-4e52-85f8-bbad1cf1094e'),
	(90,1,1,'2018-caviar_parallax.png','image',480,1280,994778,NULL,NULL,NULL,'2019-03-14 17:29:45','2019-03-14 17:29:45','2019-03-14 17:29:45','29648d4d-8307-4e12-b597-22a6340dcf16'),
	(91,1,1,'2018-caviar_slide1.png','image',600,480,463505,NULL,NULL,NULL,'2019-03-14 17:29:49','2019-03-14 17:29:50','2019-03-14 17:29:50','6d3691d0-fc02-47b5-af8f-e2418eca5727'),
	(92,1,1,'2018-caviar_slide2.png','image',600,480,480242,NULL,NULL,NULL,'2019-03-14 17:29:53','2019-03-14 17:29:54','2019-03-14 17:29:54','f4a030af-daaa-45f7-86ff-d83c84a07c61'),
	(93,1,1,'2018-caviar_slide3.png','image',600,480,489205,NULL,NULL,NULL,'2019-03-14 17:29:58','2019-03-14 17:29:58','2019-03-14 17:29:58','5c5e06a9-62fe-465f-b8ab-ee86867895ef'),
	(94,1,1,'2018-caviar_twothirds.png','image',1320,1280,1451474,NULL,NULL,NULL,'2019-03-14 17:30:09','2019-03-14 17:30:09','2019-03-14 17:30:09','dac50b13-8814-44bf-9c23-eb5a9117984b'),
	(136,1,1,'7df2a51137ec4b9c80ec4b082924bea7.jpg','image',747,500,102429,NULL,NULL,NULL,'2019-03-15 11:47:24','2019-03-15 11:47:24','2019-03-15 11:47:24','ab35ecd1-5c93-4f0f-81dd-51d048fb0dc0'),
	(137,1,1,'small.mp4','video',NULL,NULL,383631,NULL,NULL,NULL,'2019-03-15 11:47:43','2019-03-15 11:47:45','2019-03-15 11:47:45','373de655-5c54-433e-8f4f-6683e2822a88'),
	(145,1,1,'2018-Header-background.jpg','image',800,450,21975,NULL,NULL,NULL,'2019-03-28 23:24:02','2019-03-28 23:24:02','2019-03-28 23:24:02','6a38fc1f-0995-48f2-840e-64894b0e7499'),
	(146,1,1,'2018-B.jpg','image',597,800,95744,NULL,NULL,NULL,'2019-03-28 23:30:09','2019-03-28 23:28:44','2019-03-28 23:30:09','313714ba-2a0c-42f3-a3d1-0dcab694e479'),
	(147,1,1,'2018-B_190328_233005.jpg','image',597,800,95775,NULL,0,0,'2019-03-28 23:30:05','2019-03-28 23:30:05','2019-03-28 23:30:05','01ee42d3-7166-4837-ba44-98d912171a97'),
	(148,1,1,'2018-B-background.jpg','image',1213,1140,579647,NULL,NULL,NULL,'2019-04-05 19:21:04','2019-03-28 23:34:39','2019-04-05 19:21:04','dc512f12-ce18-49de-a3e5-66f0d5d56ed6'),
	(149,1,1,'2018-B-right.jpg','image',600,800,24517,NULL,NULL,NULL,'2019-03-28 23:37:14','2019-03-28 23:37:14','2019-03-28 23:37:14','9805a394-c3f8-4982-8bfe-91d9821ca4db'),
	(150,1,1,'2018-B-background_190328_234110.jpg','image',1600,1280,1422717,NULL,0,0,'2019-03-28 23:41:10','2019-03-28 23:41:10','2019-03-28 23:41:10','1839965f-cdfa-4af9-be48-5eb45ac143f7'),
	(152,1,1,'2018-B-background_190328_234537.jpg','image',1600,1280,1422717,NULL,0,0,'2019-03-28 23:45:37','2019-03-28 23:45:37','2019-03-28 23:45:37','98732861-2985-42ab-b20d-166bf1a4bd7c'),
	(153,1,1,'2018-C-background.jpg','image',799,600,111119,NULL,NULL,NULL,'2019-03-28 23:45:43','2019-03-28 23:45:43','2019-03-28 23:45:43','9e388718-d544-4272-ad9d-a563f38684cd'),
	(154,1,1,'Bond-5.png','image',650,511,330032,NULL,NULL,NULL,'2019-03-28 23:46:16','2019-03-28 23:46:17','2019-03-28 23:46:17','729655e1-b2eb-4a52-a11a-c601951db80e'),
	(156,1,1,'2018-B-background_190405_192055.jpg','image',1213,1140,574868,NULL,0,0,'2019-04-05 19:20:55','2019-04-05 19:20:56','2019-04-05 19:20:56','289877e6-1799-41f0-9ae9-2353dfffb783'),
	(157,1,1,'MOISTURE_MASQUE_2018-Header-B-Detail.png','image',288,386,64648,NULL,NULL,NULL,'2019-04-05 19:24:44','2019-04-05 19:24:44','2019-04-05 19:24:44','444d1aa4-3793-425e-8809-87ef52790214'),
	(158,1,1,'BOND-REPAIR_MASQUE_5.7OZ_030118.png','image',288,720,93527,NULL,NULL,NULL,'2019-04-05 19:49:19','2019-04-05 19:49:19','2019-04-05 19:49:19','d7a75246-a8d7-427d-951f-1b7fdaacd870'),
	(159,1,1,'Moisture-Family-New.png','image',1440,841,784756,NULL,NULL,NULL,'2019-04-05 19:57:33','2019-04-05 19:57:34','2019-04-05 19:57:34','726669c1-e4e4-4198-9572-eb2a2b597bf4'),
	(161,1,1,'AntiFrizz-Family.png','image',1245,856,548278,NULL,NULL,NULL,'2019-04-05 19:59:48','2019-04-05 19:59:49','2019-04-05 19:59:49','7a1b6c6b-7794-40f6-8e02-81bd35b5a561'),
	(162,1,1,'Stylers.png','image',1236,745,820781,NULL,NULL,NULL,'2019-04-05 20:00:17','2019-04-05 20:00:17','2019-04-05 20:00:17','8b1ed464-0766-4b74-85e7-4fe8a5dab30f'),
	(165,1,1,'Bond-Group.png','image',1117,767,828541,NULL,NULL,NULL,'2019-04-05 20:01:59','2019-04-05 20:01:59','2019-04-05 20:01:59','d4cb3f02-8cc4-476a-a7c3-73ee7e31b538'),
	(167,1,1,'Homepage_Alterna-CAVIAR-Brand-Video.mp4','video',NULL,NULL,12010792,NULL,NULL,NULL,'2019-04-05 20:10:21','2019-04-05 20:10:23','2019-04-05 20:10:23','2a9bc224-0247-4ae2-b1bd-b09b54e4e690');

/*!40000 ALTER TABLE `craft_assets` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_assettransformindex
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_assettransformindex`;

CREATE TABLE `craft_assettransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_assettransformindex_volumeId_assetId_location_idx` (`volumeId`,`assetId`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_assettransformindex` WRITE;
/*!40000 ALTER TABLE `craft_assettransformindex` DISABLE KEYS */;

INSERT INTO `craft_assettransformindex` (`id`, `assetId`, `filename`, `format`, `location`, `volumeId`, `fileExists`, `inProgress`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,8,'test-bg-2.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:38','2019-03-15 12:40:38','2019-03-15 17:39:01','9f7e3b07-30c0-4a4f-be50-0c97e0f9bd37'),
	(2,8,'test-bg-2.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:38','2019-03-15 12:40:38','2019-03-15 17:39:01','d151cbe5-6f7d-44eb-bfe6-0a31e470472d'),
	(3,8,'test-bg-2.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:38','2019-03-15 12:40:38','2019-03-15 17:39:01','ff059acf-f524-44d9-a964-2b5ee6600c59'),
	(4,19,'test-video-banner.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:38','2019-03-15 12:40:38','2019-03-15 17:39:01','80429b04-47ff-4312-8395-d4a26264700a'),
	(5,19,'test-video-banner.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:38','2019-03-15 12:40:38','2019-03-15 17:39:01','bc34dee2-e96d-49cc-880f-5fafda71f0df'),
	(6,19,'test-video-banner.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:38','2019-03-15 12:40:38','2019-03-15 17:39:01','9fefd79d-5977-4612-b223-c4bfafe29360'),
	(7,13,'test-collections-3.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:38','2019-03-15 12:40:38','2019-03-15 17:39:01','217c7d6d-f9cc-4f25-b020-783a99eb1ac4'),
	(8,13,'test-collections-3.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:38','2019-03-15 12:40:38','2019-03-15 17:39:01','069ed3a2-7e1b-4b41-987a-299d086d41aa'),
	(9,13,'test-collections-3.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:38','2019-03-15 12:40:38','2019-03-15 17:38:59','69d0b823-2a8f-4570-a11d-57afe3143b40'),
	(10,11,'test-collections-1.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:38','2019-03-15 12:40:38','2019-03-15 17:39:01','905048bc-653b-4136-baab-4ac26f032ac4'),
	(11,11,'test-collections-1.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:38','2019-03-15 12:40:38','2019-03-15 17:39:01','f7f71028-fb15-4fdf-804e-bc04ae167c22'),
	(12,11,'test-collections-1.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:38','2019-03-15 12:40:38','2019-03-15 17:39:00','d3054dc3-db51-4000-aa7e-336fefb1b373'),
	(13,12,'test-collections-2.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:38','2019-03-15 12:40:38','2019-03-15 17:39:01','6e3059c9-2d28-4623-83ce-5fa5fe989e98'),
	(14,12,'test-collections-2.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:38','2019-03-15 12:40:38','2019-03-15 17:39:01','2e981d45-7115-4aa0-be23-112cca6233e3'),
	(15,12,'test-collections-2.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:38','2019-03-15 12:40:38','2019-03-15 17:39:00','a753b9fa-fa62-4be9-986b-6f5dc1a316d9'),
	(16,87,'2018-caviar_anchor.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:38','2019-03-15 12:40:38','2019-03-15 17:39:01','998192b3-7594-40dd-8df8-2c7f84191733'),
	(17,87,'2018-caviar_anchor.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:38','2019-03-15 12:40:38','2019-03-15 17:39:01','687b45cb-00bd-4773-9bc7-75c49e38b666'),
	(18,87,'2018-caviar_anchor.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:38','2019-03-15 12:40:38','2019-03-15 17:39:00','e432adb4-7170-4258-89f1-7f215e588c31'),
	(19,24,'test-vh-image.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:38','2019-03-15 12:40:38','2019-03-15 17:39:01','3fed7e35-4997-4e2f-aa2c-af92def8c8cb'),
	(20,24,'test-vh-image.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:38','2019-03-15 12:40:38','2019-03-15 17:39:01','48de5393-cae3-42eb-8d1b-6ecc2e5a9b0e'),
	(21,24,'test-vh-image.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:38','2019-03-15 12:40:38','2019-03-15 17:39:02','1b39653f-2f8c-4840-8188-ea70a04b184b'),
	(22,84,'2013-bamboo_bg.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:38','2019-03-15 12:40:38','2019-03-15 17:39:02','734c3721-934e-457a-a67c-110151c7a088'),
	(23,84,'2013-bamboo_bg.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:38','2019-03-15 12:40:38','2019-03-15 17:39:02','a1accdbc-ec54-4b14-9165-a84deacedae9'),
	(24,84,'2013-bamboo_bg.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:38','2019-03-15 12:40:38','2019-03-15 17:39:02','aece7f73-f14d-4f16-bf5a-b93aa3f4e86b'),
	(25,83,'2013-bamboo_anchor.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:38','2019-03-15 12:40:38','2019-03-15 17:39:04','1309ad06-0d22-4cca-b460-b5818dd62272'),
	(26,83,'2013-bamboo_anchor.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:38','2019-03-15 12:40:38','2019-03-15 17:39:08','9f741e4f-f12d-45e0-b1db-3240f7041efe'),
	(27,83,'2013-bamboo_anchor.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:38','2019-03-15 12:40:38','2019-03-15 17:39:00','734e8e87-eeb0-4e31-adbd-f668ad659025'),
	(28,86,'2013-bamboo_twothirds.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:38','2019-03-15 12:40:38','2019-03-15 17:39:09','8cba68f9-e805-4012-ae35-65acaa9f710b'),
	(29,86,'2013-bamboo_twothirds.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:38','2019-03-15 12:40:38','2019-03-15 17:39:11','b9a5c171-0a42-48d8-96c8-3c490fc0700b'),
	(30,86,'2013-bamboo_twothirds.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:38','2019-03-15 12:40:38','2019-03-15 17:39:18','f3f844d6-a294-4f33-860e-5b5c7bc24e3e'),
	(31,85,'2013-bamboo_parallax.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:38','2019-03-15 12:40:38','2019-03-15 17:39:21','9fb7d07b-62ab-46b5-9475-081f7c3601a3'),
	(32,85,'2013-bamboo_parallax.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:38','2019-03-15 12:40:38','2019-03-15 17:39:29','f2da0042-73bf-4779-9f12-97c0e2e02bfd'),
	(33,85,'2013-bamboo_parallax.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:38','2019-03-15 12:40:38','2019-03-15 17:39:00','24b96f3b-4d0f-4448-8ee2-940da6596b35'),
	(34,80,'2012-bamboo_bg.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:38','2019-03-15 12:40:38','2019-03-15 17:39:29','4d826d18-90bc-4887-8645-3fc6d28e3486'),
	(35,80,'2012-bamboo_bg.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:38','2019-03-15 12:40:38','2019-03-15 17:39:29','aec830bc-84dc-4853-8d65-77e22816ff1e'),
	(36,80,'2012-bamboo_bg.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:38','2019-03-15 12:40:38','2019-03-15 17:39:29','e73d177b-5389-46d1-a215-f85b42087d33'),
	(37,79,'2012-bamboo_anchor.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:38','2019-03-15 12:40:38','2019-03-15 17:39:30','daacf7fb-3eab-440e-9ed3-7cc80a2d7b7d'),
	(38,79,'2012-bamboo_anchor.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:38','2019-03-15 12:40:38','2019-03-15 17:39:33','9d5da2bb-921a-4049-902d-f84e5239f250'),
	(39,79,'2012-bamboo_anchor.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:38','2019-03-15 12:40:38','2019-03-15 17:39:33','03d1e174-aa69-49b7-8d8e-be14c8c7f0e2'),
	(40,82,'2012-bamboo_twothirds.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:38','2019-03-15 12:40:38','2019-03-15 17:39:35','ee8f4a5b-71ac-4130-9a9c-f4addd303a1d'),
	(41,82,'2012-bamboo_twothirds.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:38','2019-03-15 12:40:38','2019-03-15 17:39:36','d13273f9-16e6-4206-9ab2-422d383c1ddc'),
	(42,82,'2012-bamboo_twothirds.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:38','2019-03-15 12:40:38','2019-03-15 17:39:39','eb6fb73e-b488-44b7-80b9-ad644eaaf4f8'),
	(43,81,'2012-bamboo_parallax.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:38','2019-03-15 12:40:38','2019-03-15 17:39:42','84340e97-afe7-47f8-bbe1-27272dd36f69'),
	(44,81,'2012-bamboo_parallax.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:38','2019-03-15 12:40:38','2019-03-15 17:39:52','bc40d0e9-ea7c-49a0-b6c5-ba00a0cc8b61'),
	(45,81,'2012-bamboo_parallax.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:38','2019-03-15 12:40:38','2019-03-15 17:39:52','b45089e1-8706-4d52-8e06-7df25a82401b'),
	(46,76,'2011-bamboo_bg.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:38','2019-03-15 12:40:38','2019-03-15 17:39:52','4245d61b-6240-4045-ac1e-115776334304'),
	(47,76,'2011-bamboo_bg.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:38','2019-03-15 12:40:38','2019-03-15 17:39:52','21c6298d-50e9-44aa-a9f3-ebb13d4eea8f'),
	(48,76,'2011-bamboo_bg.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:38','2019-03-15 12:40:38','2019-03-15 17:39:52','57810dcd-3305-4647-8f03-5f113eb0d3af'),
	(49,75,'2011-bamboo_anchor.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:38','2019-03-15 12:40:38','2019-03-15 17:39:54','91068622-4463-4234-bd68-e7915a9e35fd'),
	(50,75,'2011-bamboo_anchor.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:38','2019-03-15 12:40:38','2019-03-15 17:39:58','22374093-17e3-42ea-bfb5-5e4192a8c09e'),
	(51,75,'2011-bamboo_anchor.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:38','2019-03-15 12:40:38','2019-03-15 17:39:58','735c4049-0ce0-4f41-947f-0f75335ffc2d'),
	(52,78,'2011-bamboo_twothirds.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:40:01','24b402aa-69a0-4804-a14c-d35f57e1c9cd'),
	(53,78,'2011-bamboo_twothirds.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:40:03','b3ef8bc3-471d-44f2-9872-57b4def3cbaa'),
	(54,78,'2011-bamboo_twothirds.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:40:10','a7f55039-af8a-4b35-8003-f2c9c4e366ce'),
	(55,77,'2011-bamboo_parallax_X.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:40:12','fcfdf8ca-8588-416d-aca2-7220391e6aab'),
	(56,77,'2011-bamboo_parallax_X.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:40:23','2bb83caf-0bfb-4353-872c-80e9dd23b06d'),
	(57,77,'2011-bamboo_parallax_X.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:40:23','509f6648-3be0-42bc-ad7e-c00c206fb7b3'),
	(58,72,'2010-bamboo_bg.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:40:23','2afb25b3-1fbd-4729-8d98-0f6bb5bfd9c1'),
	(59,72,'2010-bamboo_bg.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:40:23','fffb686b-99a7-4a8e-894d-4ac8714ef9c1'),
	(60,72,'2010-bamboo_bg.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:40:23','a1f69f08-c8c6-4ba0-a530-76ba214cf456'),
	(61,71,'2010-bamboo_anchor.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:40:25','ded6dc8d-ba4c-4ea1-8ac1-1f8f0258b98c'),
	(62,71,'2010-bamboo_anchor.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:40:30','b2a757ec-92f3-49ee-ab9a-438446777455'),
	(63,71,'2010-bamboo_anchor.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:40:30','88c7a3d7-99fa-4cfe-8592-8d0d6e4e347d'),
	(64,74,'2010-bamboo_twothirds.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:40:30','26043534-ad53-4d14-b9a9-b0fa55a862c1'),
	(65,74,'2010-bamboo_twothirds.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:40:30','0a7922a5-7ae7-4f32-ad1f-f8f866e9b78e'),
	(66,74,'2010-bamboo_twothirds.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:40:30','41ea790d-1fde-4b69-85e8-b7a54c8ac4aa'),
	(67,73,'2010-bamboo_parallax.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:40:33','578104e2-fa0a-4760-b05e-ecaecb212dce'),
	(68,73,'2010-bamboo_parallax.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:40:43','ea97728b-7d54-443b-97ca-f58b341ab5ca'),
	(69,73,'2010-bamboo_parallax.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:40:43','e9b4f169-eb37-4a21-8862-4bda095cde06'),
	(70,68,'2008-seasilk_bg.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:40:43','a7f466f3-d80d-4089-95c7-298d735b2e98'),
	(71,68,'2008-seasilk_bg.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:40:43','b16bfab1-5268-4b60-8db3-9458305721cc'),
	(72,68,'2008-seasilk_bg.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:40:43','98d619c6-2bd6-48f8-9474-1a78eb422d21'),
	(73,67,'2008-seasilk_anchor.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:40:44','6cf19bb6-5975-49a6-8816-2c99da70408b'),
	(74,67,'2008-seasilk_anchor.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:40:48','b8b4458c-d3cc-4d40-b677-d620b1f23248'),
	(75,67,'2008-seasilk_anchor.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:40:48','4680fc0c-e3f4-4e71-b141-db19db626678'),
	(76,70,'2008-seasilk_twothirds.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:40:51','3a821987-8f4e-4474-ba8b-da5f9e4d3284'),
	(77,70,'2008-seasilk_twothirds.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:40:54','dcd16b2d-cd4d-4e77-ad91-1626185a9d53'),
	(78,70,'2008-seasilk_twothirds.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:41:04','b3f49071-ff01-4d6c-810c-b5ba51639712'),
	(79,69,'2008-seasilk_parallax.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:41:08','55dab842-a3ce-4a0d-bf46-35d0e0d8c983'),
	(80,69,'2008-seasilk_parallax.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:41:15','db92d7a4-2cac-4636-9303-c817e868366a'),
	(81,69,'2008-seasilk_parallax.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:41:28','6de8fc9c-fc52-4962-9f4b-ce806152ba18'),
	(82,60,'2008-hemp_bg.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:41:28','a381fa17-049f-4bfb-ba86-c0a1f05e7aa4'),
	(83,60,'2008-hemp_bg.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:41:28','ffe8db12-315c-487e-a62e-65d48d0da62d'),
	(84,60,'2008-hemp_bg.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:41:28','6cc1cb69-98fb-4a30-8610-0deeba9b5de9'),
	(85,59,'2008-hemp_anchor.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:41:30','331affbd-799a-4c95-8b83-0948eaf1e86d'),
	(86,59,'2008-hemp_anchor.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:41:32','aab1c8fd-778b-47ad-b7b2-518fccbc6ae6'),
	(87,59,'2008-hemp_anchor.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:41:38','65a65cf1-ff86-4417-b939-2f65298dba96'),
	(88,62,'2008-hemp_twothirds.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:41:41','4f1b11bc-774c-46c2-9c43-d53f68d93d45'),
	(89,62,'2008-hemp_twothirds.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:41:45','281faafe-b9ad-4ed6-87b4-65b7a9043cbd'),
	(90,62,'2008-hemp_twothirds.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:41:56','246d97a7-d18d-4e6d-b488-c9e97b4b4b75'),
	(91,61,'2008-hemp_parallax.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:42:00','32e097bb-599a-4c24-b5be-71f3621bf081'),
	(92,61,'2008-hemp_parallax.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:42:09','cdcd48f8-1a7e-4e13-acf1-c3b2d1fb69ed'),
	(93,61,'2008-hemp_parallax.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:42:29','4588d0a9-05f6-4aef-8975-8769a3858e11'),
	(94,64,'2008-life_bg.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:42:29','676bece1-99c3-4c37-8a38-51a9cd7c85af'),
	(95,64,'2008-life_bg.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:42:29','2eb4232c-ac37-47da-806f-7ed8a278e35a'),
	(96,64,'2008-life_bg.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:42:33','70d3416c-a9d8-4960-87a3-2d86bebaaf8a'),
	(97,63,'2008-life_anchor.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:42:35','35b80656-a23b-4d2a-8316-0e3fd7cbf85d'),
	(98,63,'2008-life_anchor.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:42:40','788da260-c242-427e-b9c3-d8f2cc0ff839'),
	(99,63,'2008-life_anchor.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:42:50','e42d77ef-9731-4efa-b8a5-e10778ed1835'),
	(100,66,'2008-life_twothirds.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:42:53','34a0253d-ed9d-4183-b9a3-91f57258ca51'),
	(101,66,'2008-life_twothirds.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:42:56','55c3435b-034c-4c79-af3a-c3441f9b0bd3'),
	(102,66,'2008-life_twothirds.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:43:05','d33519cb-382b-47d9-af3f-bd9095026aaf'),
	(103,65,'2008-life_parallax.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:43:09','bfcbd3a5-ab5c-446d-bfcb-b28ae68eca11'),
	(104,65,'2008-life_parallax.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:43:21','956cc03b-0455-4e89-9f3d-fea686d49b77'),
	(105,65,'2008-life_parallax.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:43:50','2988ede5-6d48-40e0-9864-71f818e1eee4'),
	(106,56,'2007-ten_bg.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:43:50','8b0dd233-a3c4-4cbe-bd25-68b59b9f06f4'),
	(107,56,'2007-ten_bg.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:43:50','e344746b-27a3-4594-915c-ba5ee8b4d427'),
	(108,56,'2007-ten_bg.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:43:50','6b050ace-fd51-49f6-95e4-8f4993268196'),
	(109,55,'2007-ten_anchor.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:43:51','87b810c0-737f-421f-8ee0-d4b7062c13b0'),
	(110,55,'2007-ten_anchor.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:43:53','3a2d511f-46c7-4d60-9552-bf7ee6942c88'),
	(111,55,'2007-ten_anchor.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:43:57','54cd0016-9721-483c-a137-642928f2dc97'),
	(112,58,'2007-ten_twothirds.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:44:00','737d989c-9806-439f-9ac1-9dd1671cacf4'),
	(113,58,'2007-ten_twothirds.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:44:02','37697979-67a2-4251-914e-cf0bf33ff706'),
	(114,58,'2007-ten_twothirds.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:44:08','d11a4d9f-173a-4a9d-900f-c7225395b5a3'),
	(115,57,'2007-ten_parallax.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:44:10','855d22d5-eedf-4c8e-8d5a-60f7f4ca7a1b'),
	(116,57,'2007-ten_parallax.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:44:20','9fbb0aec-779d-4cf2-848f-3ad152ef8aa4'),
	(117,57,'2007-ten_parallax.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:44:44','785973aa-076a-472f-bb67-063a61803ddd'),
	(118,52,'2005-truffle_bg.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:44:44','73fa37bd-eb55-4c20-9df3-76d1fe5863b4'),
	(119,52,'2005-truffle_bg.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:44:44','eba76bef-5626-4755-9dc4-a11f491432d8'),
	(120,52,'2005-truffle_bg.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:44:44','85311535-43b6-4cde-be0b-b171fa3c8d8c'),
	(121,51,'2005-truffle_anchor.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:44:45','57bd0761-8a25-425f-98f4-c3d0cbe81b01'),
	(122,51,'2005-truffle_anchor.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:44:47','d8c7f6ef-ce33-4c88-b886-a0fbbeff61e0'),
	(123,51,'2005-truffle_anchor.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:44:50','8cf3dc2d-a29f-499f-bbf9-cb676a346d3a'),
	(124,54,'2005-truffle_twothirds.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:44:54','bf73fc48-daab-44a6-8bdb-39bda41efd9d'),
	(125,54,'2005-truffle_twothirds.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:44:57','06cf1efd-b1de-4d94-9d6f-ce47253b01f3'),
	(126,54,'2005-truffle_twothirds.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:45:05','4d0612e8-5c29-4394-a250-f75d0cdc5d48'),
	(127,53,'2005-truffle_parallax.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:45:08','1e872fb3-085a-471d-962b-aab6d60f98d2'),
	(128,53,'2005-truffle_parallax.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:45:16','c33f0910-28d7-4396-a3c0-d91c56256995'),
	(129,53,'2005-truffle_parallax.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:39','2019-03-15 12:40:39','2019-03-15 17:45:37','d41d19e7-942e-4942-bbc2-7078e4b0b9cb'),
	(130,48,'2005-caviar_bg.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:45:37','c7aa7044-57fc-47cc-9ee1-5b0d4fdef993'),
	(131,48,'2005-caviar_bg.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:45:37','f0cff978-1f4b-404e-bf0c-128ef9186e3b'),
	(132,48,'2005-caviar_bg.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:45:37','b521f849-cd1e-442d-ae6c-0ae8197dbece'),
	(133,47,'2005-caviar_anchor.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:45:39','15b91f6b-fbc6-4198-8dab-3f64b2d7af43'),
	(134,47,'2005-caviar_anchor.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:45:43','112fdfd2-7a67-48c8-b49a-37f5bffba6fc'),
	(135,47,'2005-caviar_anchor.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:45:50','90c3253b-4ccb-4689-aef6-33606b93836d'),
	(136,50,'2005-caviar_twothirds.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:45:53','7987ced3-39ce-418f-aa08-731e5f9f1a35'),
	(137,50,'2005-caviar_twothirds.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:45:55','1b1492d1-2fba-4979-b6a9-2b7470f8e648'),
	(138,50,'2005-caviar_twothirds.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:46:02','e414830d-aa8b-4286-9000-ca03f39553de'),
	(139,49,'2005-caviar_parallax.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:46:05','967d3992-fb0b-4551-adb7-b82a587047a9'),
	(140,49,'2005-caviar_parallax.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:46:16','188059e3-f72a-4c72-982c-89cbce68d667'),
	(141,49,'2005-caviar_parallax.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:46:43','adb7908a-938f-438b-8280-5865a4cd2f92'),
	(142,33,'1999-antiaging_bg.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:46:43','fd19205b-7b6d-47bf-818b-ac364fe18722'),
	(143,33,'1999-antiaging_bg.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:46:43','e1542a54-e973-4542-9980-cee2619c4d25'),
	(144,33,'1999-antiaging_bg.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:46:43','440ead82-fe71-461c-9e9b-a307db3556b2'),
	(145,32,'1999-antiaging_anchor.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:46:45','87d1f96c-667a-421d-ad78-5a943114b8ee'),
	(146,32,'1999-antiaging_anchor.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:46:48','b6f47195-6e6b-4676-b235-81c5da0470b6'),
	(147,32,'1999-antiaging_anchor.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:46:56','eee7d617-4c22-43c1-b0f5-e80aec127ad3'),
	(148,37,'1999-antiaging_twothirds-X.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:46:58','be769586-c96f-4e9b-988f-cb095d513823'),
	(149,37,'1999-antiaging_twothirds-X.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:47:01','b9c9937c-4baa-4e27-b29c-3575e101919a'),
	(150,37,'1999-antiaging_twothirds-X.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:47:09','2a2552a1-7932-412c-8b77-03bef34e8edd'),
	(151,35,'1999-antiaging_parallax.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:47:11','0bd2fba6-5831-49bc-a48a-50d56c8a71a4'),
	(152,35,'1999-antiaging_parallax.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:47:17','8ad12442-ff8f-46ff-8615-9d28d940227f'),
	(153,35,'1999-antiaging_parallax.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:47:37','4e4e06f2-8d19-4e79-98fd-3c48274a6e52'),
	(154,36,'1999-antiaging_parallax2.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:47:38','911a1310-e3e2-44ba-a9b7-f79ab179b08e'),
	(155,36,'1999-antiaging_parallax2.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:47:38','bd714485-c610-4321-95d6-2e010ef31b8c'),
	(156,36,'1999-antiaging_parallax2.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:47:40','bc2f1de2-62fb-4375-afac-ee5c25f14f7e'),
	(157,40,'1999-lifeline_bg.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:47:40','a4162757-ed85-4c2f-b1e4-64b154608e0e'),
	(158,40,'1999-lifeline_bg.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:47:40','6a322276-f1ba-4c6b-9807-0c6774ebbf5c'),
	(159,40,'1999-lifeline_bg.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:47:40','7870ab2d-a197-49f7-ad78-90395fdd89b4'),
	(160,39,'1999-lifeline_anchor.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:47:42','19f04b48-9907-4e74-b2b8-de830c19fe44'),
	(161,39,'1999-lifeline_anchor.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:47:47','765bfd40-2d75-42ff-8785-42365b81cc5b'),
	(162,39,'1999-lifeline_anchor.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:47:56','64b535fa-ac34-4746-9e17-425e1d4e1284'),
	(163,46,'1999-lifeline_twothirds.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:48:00','6bb3a0dc-d63e-4169-a135-7887610ffca8'),
	(164,46,'1999-lifeline_twothirds.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:48:04','e968ce43-efae-460f-a30e-e115704aa4ea'),
	(165,46,'1999-lifeline_twothirds.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:48:14','dc414518-b472-46d9-a696-715b1177ccc5'),
	(166,42,'1999-lifeline_parallax.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:48:17','bf330ea1-f8b3-4918-862c-fc4f18717b85'),
	(167,42,'1999-lifeline_parallax.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:48:26','ec9fab54-6e5f-474b-8f31-300f2936f68a'),
	(168,42,'1999-lifeline_parallax.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:49:13','0d2d4209-7612-446b-8256-c9992ecaa6f5'),
	(169,43,'1999-lifeline_slide1.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:49:13','09f59f5d-5e28-4c8f-8cbb-0b31af330f24'),
	(170,43,'1999-lifeline_slide1.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:49:13','aa58a137-c0d7-4ef5-aad4-ef6ef87232d6'),
	(171,43,'1999-lifeline_slide1.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:49:14','013dc408-27b9-4aa8-a36e-691d770abadf'),
	(172,44,'1999-lifeline_slide2.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:49:14','bfdf198d-5239-4cfe-ab5f-be4386e97d84'),
	(173,44,'1999-lifeline_slide2.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:49:15','84ca331a-e2b6-476d-b2d5-a1e02590017c'),
	(174,44,'1999-lifeline_slide2.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:47:48','f92d944d-ea71-4364-af71-1e4710a58f42'),
	(175,45,'1999-lifeline_slide3.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:49:15','b778e21a-3968-47e1-8a67-bcae96f2d13f'),
	(176,45,'1999-lifeline_slide3.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:49:15','16bc0494-af58-4897-a5fe-e59aec812e41'),
	(177,45,'1999-lifeline_slide3.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:47:46','4e6125b0-319b-4b65-b5ba-c1fd9e3b560d'),
	(178,30,'1997-newgen_bg.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:49:15','5ca4b7da-fa51-414b-93c3-8081c222c94a'),
	(179,30,'1997-newgen_bg.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:49:15','d4c1bba2-35aa-43a3-83ee-7ce2196315ab'),
	(180,30,'1997-newgen_bg.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:49:15','580fb817-7ec9-47eb-842f-9900af03903d'),
	(181,29,'1997_newgen_twothirds.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:49:18','64a6ac62-4a4b-48fe-8e5f-cd8d82ad6d44'),
	(182,29,'1997_newgen_twothirds.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:49:20','9dc5711f-7fe3-4f5a-b5f0-660f8fc39496'),
	(183,29,'1997_newgen_twothirds.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:49:27','45f97798-0616-4502-b598-bd8ac2a2e380'),
	(184,31,'1997-newgen_parallax.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:49:30','987f1bab-79aa-4966-8ad0-59d130d74c72'),
	(185,31,'1997-newgen_parallax.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:49:36','6fb9995b-498c-437f-b881-8798c1bdbbf9'),
	(186,31,'1997-newgen_parallax.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-15 12:40:40','2019-03-15 12:40:40','2019-03-15 17:48:08','f9dfed68-bcf4-4304-a296-8900acdb2a1d'),
	(187,6,'test-anchor-image.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-28 21:14:17','2019-03-28 21:14:17','2019-03-28 21:14:29','2959a147-0521-48ae-b47b-49288596b7aa'),
	(188,6,'test-anchor-image.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-28 21:14:17','2019-03-28 21:14:17','2019-03-28 21:14:33','fe8fa5a8-dc6c-4cfd-b3ec-e118a70b6a3f'),
	(189,6,'test-anchor-image.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-28 21:14:17','2019-03-28 21:14:17','2019-03-28 21:14:27','b0b711a1-3a09-4bb0-ba2a-465e872124fd'),
	(190,91,'2018-caviar_slide1.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-28 21:30:16','2019-03-28 21:30:16','2019-03-28 21:30:26','26790685-560e-457f-abe7-7995b60e33a5'),
	(191,91,'2018-caviar_slide1.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-28 21:30:16','2019-03-28 21:30:16','2019-03-28 21:30:28','fe184427-95b0-443d-95fc-6328593a6cfa'),
	(192,91,'2018-caviar_slide1.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-28 21:30:16','2019-03-28 21:30:16','2019-03-28 21:30:25','f2833c90-30da-419b-965b-48bfc7f60642'),
	(193,145,'2018-Header-background.jpg','jpg','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-28 23:24:10','2019-03-28 23:24:10','2019-03-28 23:24:13','1ce18713-6716-4183-a808-af0e10aa13a8'),
	(194,145,'2018-Header-background.jpg','jpg','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-28 23:24:10','2019-03-28 23:24:10','2019-03-28 23:24:13','c2297bd9-7496-4044-b762-e99c23583cdb'),
	(195,145,'2018-Header-background.jpg','jpg','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-28 23:24:10','2019-03-28 23:24:10','2019-03-28 23:24:13','f233d0c9-592b-4f4f-8377-3996566148cf'),
	(199,146,'2018-B.jpg','jpg','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-28 23:30:14','2019-03-28 23:30:14','2019-03-28 23:30:17','0affa5ea-9456-48ea-8449-79b7e94d2fca'),
	(200,146,'2018-B.jpg','jpg','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-28 23:30:14','2019-03-28 23:30:14','2019-03-28 23:30:18','6e3630eb-f9c6-47b5-ac3e-64e86952d741'),
	(201,146,'2018-B.jpg','jpg','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-28 23:30:14','2019-03-28 23:30:14','2019-03-28 23:30:17','5e77a502-6862-4650-b0c8-581e94dd767e'),
	(205,149,'2018-B-right.jpg','jpg','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-28 23:37:21','2019-03-28 23:37:21','2019-03-28 23:37:24','b6e6a541-fa8b-4fd8-9b26-4a2a928d9c6a'),
	(206,149,'2018-B-right.jpg','jpg','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-28 23:37:21','2019-03-28 23:37:21','2019-03-28 23:37:25','8fe8ed1d-76e4-4ba9-8240-1ac6ae205571'),
	(207,149,'2018-B-right.jpg','jpg','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-28 23:37:21','2019-03-28 23:37:21','2019-03-28 23:37:24','7fb9f11b-5d8e-4702-9479-feb4df88bbaf'),
	(211,153,'2018-C-background.jpg','jpg','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-28 23:46:30','2019-03-28 23:46:30','2019-03-28 23:46:36','ef54a911-50bf-48dd-87fc-11c831b9ed9a'),
	(212,153,'2018-C-background.jpg','jpg','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-28 23:46:30','2019-03-28 23:46:30','2019-03-28 23:46:36','b4fc7c68-0a4e-4432-963e-96740f862c62'),
	(213,153,'2018-C-background.jpg','jpg','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-28 23:46:30','2019-03-28 23:46:30','2019-03-28 23:46:37','abbc97b6-eaf3-484d-ad79-4208980da99c'),
	(214,154,'Bond-5.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-03-28 23:46:30','2019-03-28 23:46:30','2019-03-28 23:46:37','203a0a38-ad76-4247-a510-e45b0892a1d2'),
	(215,154,'Bond-5.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-03-28 23:46:30','2019-03-28 23:46:30','2019-03-28 23:46:39','7720bf6e-0b47-42b5-ac86-802b65f6e736'),
	(216,154,'Bond-5.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-03-28 23:46:30','2019-03-28 23:46:30','2019-03-28 23:46:36','4df03fbe-859f-4b3a-906e-0c85f3e0140d'),
	(217,148,'2018-B-background.jpg','jpg','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-04-05 19:21:18','2019-04-05 19:21:18','2019-04-05 19:21:21','5ce850ff-9ef8-4641-a062-231c3eed5e49'),
	(218,148,'2018-B-background.jpg','jpg','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-04-05 19:21:18','2019-04-05 19:21:18','2019-04-05 19:21:21','2098add3-fccd-4cd2-80af-f3008e7c279f'),
	(219,148,'2018-B-background.jpg','jpg','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-04-05 19:21:18','2019-04-05 19:21:18','2019-04-05 19:21:22','00223f5c-b627-44bd-acda-641a6fa9e4fe'),
	(220,157,'MOISTURE_MASQUE_2018-Header-B-Detail.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-04-05 19:25:19','2019-04-05 19:25:19','2019-04-05 19:25:25','3e94875e-9bb3-4bc3-8dba-13108c9e34a2'),
	(221,157,'MOISTURE_MASQUE_2018-Header-B-Detail.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-04-05 19:25:19','2019-04-05 19:25:19','2019-04-05 19:25:27','057961bf-f338-46f7-a9b5-631518d226d5'),
	(222,157,'MOISTURE_MASQUE_2018-Header-B-Detail.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-04-05 19:25:19','2019-04-05 19:25:19','2019-04-05 19:25:24','210291ba-3a3c-4dc9-aeed-426584e47a93'),
	(223,158,'BOND-REPAIR_MASQUE_5.7OZ_030118.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-04-05 19:50:14','2019-04-05 19:50:14','2019-04-05 19:50:18','1d44176e-a7cd-4b5a-98bb-e872d7403122'),
	(224,158,'BOND-REPAIR_MASQUE_5.7OZ_030118.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-04-05 19:50:14','2019-04-05 19:50:14','2019-04-05 19:50:22','1d1bdb06-9218-44b2-bbff-bbc0fd815ce0'),
	(225,158,'BOND-REPAIR_MASQUE_5.7OZ_030118.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-04-05 19:50:14','2019-04-05 19:50:14','2019-04-05 19:50:22','439d80b6-a9e4-4484-806a-aad3fdfd4e38'),
	(226,159,'Moisture-Family-New.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-04-05 19:57:49','2019-04-05 19:57:49','2019-04-05 19:57:53','d2d1c454-6e09-4e0d-b413-ead5eaa1e5db'),
	(227,159,'Moisture-Family-New.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-04-05 19:57:49','2019-04-05 19:57:49','2019-04-05 19:57:55','6f825270-f234-46db-bbb7-110400c37647'),
	(228,159,'Moisture-Family-New.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-04-05 19:57:49','2019-04-05 19:57:49','2019-04-05 19:57:55','1e4e21e8-4a07-4187-9475-332362f26ab2'),
	(229,161,'AntiFrizz-Family.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-04-05 20:00:33','2019-04-05 20:00:33','2019-04-05 20:00:37','c21fd640-c9a3-423c-bba2-0ae55677c7a3'),
	(230,161,'AntiFrizz-Family.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-04-05 20:00:33','2019-04-05 20:00:33','2019-04-05 20:00:40','e34d292f-6503-4246-8c29-b6473d8df405'),
	(231,161,'AntiFrizz-Family.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-04-05 20:00:33','2019-04-05 20:00:33','2019-04-05 20:00:41','4196f509-0cf4-4f7e-bc97-a3f0670f21e7'),
	(232,162,'Stylers.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-04-05 20:00:33','2019-04-05 20:00:33','2019-04-05 20:00:41','b93e8b97-f9e7-4d3b-bd56-c622a57652ff'),
	(233,162,'Stylers.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-04-05 20:00:33','2019-04-05 20:00:33','2019-04-05 20:00:43','99edc844-6191-4e99-960c-fa69f79e7b68'),
	(234,162,'Stylers.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-04-05 20:00:33','2019-04-05 20:00:33','2019-04-05 20:00:42','f56bd2db-e326-45c4-89a1-45264c29e294'),
	(235,165,'Bond-Group.png','png','_480xAUTO_crop_center-center_90_none',1,1,0,'2019-04-05 20:02:27','2019-04-05 20:02:27','2019-04-05 20:02:31','6bb6ea31-0373-4420-8513-6c617f1522f4'),
	(236,165,'Bond-Group.png','png','_780xAUTO_crop_center-center_90_none',1,1,0,'2019-04-05 20:02:27','2019-04-05 20:02:27','2019-04-05 20:02:35','46f99306-3eb5-45bf-aa31-457f57b84432'),
	(237,165,'Bond-Group.png','png','_1280xAUTO_crop_center-center_90_none',1,1,0,'2019-04-05 20:02:27','2019-04-05 20:02:27','2019-04-05 20:02:36','6be3cd5d-b390-4dce-939a-d9e0ec89c66d');

/*!40000 ALTER TABLE `craft_assettransformindex` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_assettransforms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_assettransforms`;

CREATE TABLE `craft_assettransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assettransforms_name_unq_idx` (`name`),
  UNIQUE KEY `craft_assettransforms_handle_unq_idx` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table craft_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_categories`;

CREATE TABLE `craft_categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_categories_groupId_idx` (`groupId`),
  KEY `craft_categories_parentId_fk` (`parentId`),
  CONSTRAINT `craft_categories_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_categories_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_categories_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `craft_categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table craft_categorygroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_categorygroups`;

CREATE TABLE `craft_categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_categorygroups_name_idx` (`name`),
  KEY `craft_categorygroups_handle_idx` (`handle`),
  KEY `craft_categorygroups_structureId_idx` (`structureId`),
  KEY `craft_categorygroups_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `craft_categorygroups_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `craft_categorygroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_categorygroups_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table craft_categorygroups_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_categorygroups_sites`;

CREATE TABLE `craft_categorygroups_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_categorygroups_sites_groupId_siteId_unq_idx` (`groupId`,`siteId`),
  KEY `craft_categorygroups_sites_siteId_idx` (`siteId`),
  CONSTRAINT `craft_categorygroups_sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_categorygroups_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table craft_content
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_content`;

CREATE TABLE `craft_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_body` text,
  `field_bodyScript` text,
  `field_footerScripts` text,
  `field_headerScripts` text,
  `field_headerTitle` text,
  `field_anchorDescription` text,
  `field_detailSubHeader` text,
  `field_detailDescription` text,
  `field_slideshowTitle` text,
  `field_richTextContent` text,
  `field_seoTitle` text,
  `field_seoDescription` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_content_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `craft_content_siteId_idx` (`siteId`),
  KEY `craft_content_title_idx` (`title`),
  CONSTRAINT `craft_content_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_content_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_content` WRITE;
/*!40000 ALTER TABLE `craft_content` DISABLE KEYS */;

INSERT INTO `craft_content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_body`, `field_bodyScript`, `field_footerScripts`, `field_headerScripts`, `field_headerTitle`, `field_anchorDescription`, `field_detailSubHeader`, `field_detailDescription`, `field_slideshowTitle`, `field_richTextContent`, `field_seoTitle`, `field_seoDescription`)
VALUES
	(1,1,1,NULL,'2019-03-06 21:56:09','2019-03-06 21:56:09','c7b5309c-4883-4f28-bb60-ef6c40c2c351',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(2,2,1,'Home','2019-03-06 23:09:34','2019-03-07 00:42:29','4c84c3ba-2886-496d-8050-d1a7de90005f','Alterna Haircare',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(3,3,1,NULL,'2019-03-06 23:33:02','2019-03-16 00:05:44','87e6c6e1-ee74-41b5-9d13-4bf28ee017fd',NULL,'<!-- Google Tag Manager (noscript) -->\n<noscript><iframe src=\"https://www.googletagmanager.com/ns.html?id=GTM-KWHNH9X\"\nheight=\"0\" width=\"0\" style=\"display:none;visibility:hidden\"></iframe></noscript>\n<!-- End Google Tag Manager (noscript) -->',NULL,'<!-- Google Tag Manager -->\n<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({\'gtm.start\':\nnew Date().getTime(),event:\'gtm.js\'});var f=d.getElementsByTagName(s)[0],\nj=d.createElement(s),dl=l!=\'dataLayer\'?\'&l=\'+l:\'\';j.async=true;j.src=\n\'https://www.googletagmanager.com/gtm.js?id=\'+i+dl;f.parentNode.insertBefore(j,f);\n})(window,document,\'script\',\'dataLayer\',\'GTM-KWHNH9X\');</script>\n<!-- End Google Tag Manager -->',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(4,4,1,'2011','2019-03-06 23:40:23','2019-04-08 23:18:20','3f8be478-b3b6-472b-8c1e-05af2e8f2ac3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(5,5,1,'2018 Template A','2019-03-06 23:40:36','2019-03-06 23:41:18','fa651684-7e5f-4605-97da-ecb67ed00ae7','asdasd',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(6,6,1,'Test-anchor-image','2019-03-06 23:57:43','2019-03-13 14:43:01','3adcbad5-00e9-48be-8fd0-970661a79b48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(7,7,1,'2011 Component A - Header','2019-03-06 23:57:51','2019-04-08 23:18:20','3413f112-1df7-4f67-8b96-f3702ebe8a19',NULL,NULL,NULL,NULL,'Fast Bamboo\nGrowth',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(8,8,1,'Test-bg-2','2019-03-07 00:10:54','2019-03-13 14:43:02','a274c0e3-c712-4980-b85e-baf21c3b41b2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(9,9,1,'Test-brushstroke','2019-03-07 00:13:10','2019-03-13 14:43:03','a90bbad6-6dd8-4b75-bc59-a20a93f1bbb3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(10,10,1,'2011 Component B - Detail','2019-03-07 00:13:37','2019-04-08 23:18:20','d0e1c285-eb63-4fdb-b284-0250e67059b0',NULL,NULL,NULL,NULL,'Fast Bamboo Growth','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,NULL,NULL,NULL),
	(11,11,1,'Test-collections-1','2019-03-07 00:15:15','2019-03-13 14:43:03','fcda563f-15e7-4b79-95fe-f24237bf2140',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(12,12,1,'Test-collections-2','2019-03-07 00:15:34','2019-03-13 14:43:03','a4d26e66-c85d-45d0-9ce8-e4c6475be1b8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(13,13,1,'Test-collections-3','2019-03-07 00:15:56','2019-03-13 14:43:04','068d5472-d7ab-435b-bd23-e859fefb9d4d',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(14,14,1,'2011 Component B - Slideshow','2019-03-07 00:16:37','2019-04-08 23:18:21','394d835f-2ae9-4d44-958d-627f01ecaa0e',NULL,NULL,NULL,NULL,'Alterna Brand Launches',NULL,NULL,NULL,'Collection',NULL,NULL,NULL),
	(15,19,1,'Test-video-banner','2019-03-07 00:17:37','2019-03-13 14:43:06','26b7a113-d2b7-4375-8b65-2940f9082bf0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(16,20,1,'2011 Component B - Video','2019-03-07 00:17:52','2019-04-08 23:18:21','a0dd10fd-8e78-4949-bc7a-afd5ab40a206',NULL,NULL,NULL,NULL,'Alterna Brand Launches',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(17,21,1,'2018','2019-03-07 00:17:59','2019-04-08 23:18:21','5fe1fa51-570b-4cc1-9bfc-bd2623af6d31',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(18,22,1,'2018 Component A - Header','2019-03-07 00:18:46','2019-04-08 23:18:21','c1ef9947-eab8-4362-8aa9-5a97d1cea630',NULL,NULL,NULL,NULL,'Caviar\n Anti-Aging\nRestage',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(19,23,1,'2018 Component B - Detail','2019-03-07 00:19:56','2019-04-08 23:18:21','2a454e8a-5d79-41bf-adee-8560c94e1103',NULL,NULL,NULL,NULL,'Caviar Anti-Aging Restage','The most exclusive product demands a sophisticated packaging update to reflect its balanced nature. Old formula. New styles.',NULL,'Celebrating nearly 20 years of Caviar success, Alterna relaunched the collection with a new look and consistent color palette across all products. In addition, the company introduced a new Caviar Anti-Aging Restructuring Bond Repair product line, aimed at helping to reverse the hair damage from heat styling, free radicals, and excessive coloring.',NULL,NULL,NULL,NULL),
	(20,24,1,'Test-vh-image','2019-03-07 01:00:48','2019-03-13 14:43:04','1af0af9e-b43d-4396-8126-df481418fa9f',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(21,25,1,'Privacy Policy','2019-03-07 01:05:09','2019-03-07 01:05:23','2355120b-8e77-4592-b6a6-d5488c102049',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(22,26,1,'2019','2019-03-12 22:25:53','2019-04-08 23:18:21','391fbe2a-d8c5-4114-80c0-779876bf3590',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(23,27,1,'2019 - Component A - Header','2019-03-12 22:26:26','2019-04-08 23:18:21','a0241055-bbab-4c7d-90ec-e54ae8a4b2f0',NULL,NULL,NULL,NULL,'Alterna Brand Launches','An alternative vision born in salons: premium hair products free of additives or harsh ingredients. And a revolution in haircare was born...',NULL,NULL,NULL,NULL,NULL,NULL),
	(24,28,1,'Logo','2019-03-13 14:43:01','2019-03-13 14:43:01','a6793fe2-68c1-4122-8a4e-0760c3fb2910',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(25,29,1,'1997_newgen_twothirds','2019-03-14 17:21:27','2019-03-14 17:21:27','568b83ad-e694-405f-ab2f-661dbf1e1350',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(26,30,1,'1997-newgen_bg','2019-03-14 17:21:41','2019-03-14 17:21:41','031622f6-1790-4a9d-b811-e1377ce084ab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(27,31,1,'1997-newgen_parallax','2019-03-14 17:21:47','2019-03-14 17:21:47','a54484e5-a356-4863-b02e-863fe2f7de0e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(28,32,1,'1999-antiaging_anchor','2019-03-14 17:21:54','2019-03-14 17:21:54','a5d7b3ce-a5f9-481c-a08d-acfbc28eeff8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(29,33,1,'1999-antiaging_bg','2019-03-14 17:21:58','2019-03-14 17:21:58','03c2d2c9-b407-4ec4-a751-401cc8593c3d',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(30,34,1,'1999-antiaging_bg2','2019-03-14 17:22:03','2019-03-14 17:22:03','85293d2e-2431-49b9-a9cf-ea65b69b5e3b',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(31,35,1,'1999-antiaging_parallax','2019-03-14 17:22:08','2019-03-14 17:22:08','6d30077e-9701-41b1-85a4-9042cc4bf292',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(32,36,1,'1999-antiaging_parallax2','2019-03-14 17:22:14','2019-03-14 17:22:14','c7bc8501-12f1-4c41-b58c-6516746534cf',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(33,37,1,'1999-antiaging_twothirds-X','2019-03-14 17:22:16','2019-03-14 17:22:16','2fbe3d3c-9439-4600-8c28-118e2e615fb5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(34,38,1,'1999-antiaging_video','2019-03-14 17:22:20','2019-03-14 17:22:20','39e6e981-36e4-49d2-bee0-3bdce4c4bf59',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(35,39,1,'1999-lifeline_anchor','2019-03-14 17:22:25','2019-03-14 17:22:25','652c4ccb-7775-4d62-8568-58f435f1d79e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(36,40,1,'1999-lifeline_bg','2019-03-14 17:22:28','2019-03-14 17:22:28','4beee5fc-db18-4ee9-b569-f0bd42d0d866',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(37,41,1,'1999-lifeline_bg2','2019-03-14 17:22:35','2019-03-14 17:22:35','303e6b75-a052-4750-8b34-005b6b7e1974',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(38,42,1,'1999-lifeline_parallax','2019-03-14 17:22:55','2019-03-14 17:22:55','f5f160e5-ff6c-4d98-bd62-1dfc51786230',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(39,43,1,'1999-lifeline_slide1','2019-03-14 17:23:03','2019-03-14 17:23:03','15e3057d-e333-4b96-90e0-50102a022b74',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(40,44,1,'1999-lifeline_slide2','2019-03-14 17:23:04','2019-03-14 17:23:04','3526c73e-3ff7-4fbe-97c9-dc1392f5f09a',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(41,45,1,'1999-lifeline_slide3','2019-03-14 17:23:05','2019-03-14 17:23:05','75e387f6-ba75-43f1-906a-af8d47a06fce',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(42,46,1,'1999-lifeline_twothirds','2019-03-14 17:23:08','2019-03-14 17:23:08','10e0c4c0-6c7e-4bea-a598-1e6ec332dfa5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(43,47,1,'2005-caviar_anchor','2019-03-14 17:23:25','2019-03-14 17:23:25','4c6fe99b-0f6d-4429-973a-89b137d369e3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(44,48,1,'2005-caviar_bg','2019-03-14 17:23:29','2019-03-14 17:23:29','f6d93185-8700-4e3e-9b35-71504d4f1f49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(45,49,1,'2005-caviar_parallax','2019-03-14 17:23:47','2019-03-14 17:23:47','b4f34da1-cd74-49b9-9f38-0c35c34c1f65',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(46,50,1,'2005-caviar_twothirds','2019-03-14 17:23:55','2019-03-14 17:23:55','1407c7f0-13fb-4c7a-b67f-01235ca7d882',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(47,51,1,'2005-truffle_anchor','2019-03-14 17:24:09','2019-03-14 17:24:09','fc510e56-65b5-4180-af30-2d99aaa5c6d3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(48,52,1,'2005-truffle_bg','2019-03-14 17:24:11','2019-03-14 17:24:11','971104f6-ec52-4ca6-b1cc-9f830fd1b928',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(49,53,1,'2005-truffle_parallax','2019-03-14 17:24:19','2019-03-14 17:24:19','da0c0595-e1db-4a46-ad9c-21fb9f51bf64',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(50,54,1,'2005-truffle_twothirds','2019-03-14 17:24:26','2019-03-14 17:24:26','c0c8cdb8-cd10-481e-b34b-99a09c603eda',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(51,55,1,'2007-ten_anchor','2019-03-14 17:24:44','2019-03-14 17:24:44','ea1a33d3-e813-4199-a6f9-1a76c4c31aca',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(52,56,1,'2007-ten_bg','2019-03-14 17:24:47','2019-03-14 17:24:47','7a81dcaf-409f-4081-b10a-3037e14acdf2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(53,57,1,'2007-ten_parallax','2019-03-14 17:24:55','2019-03-14 17:24:55','994c5cbb-f814-45eb-a197-58f7aaf74dc0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(54,58,1,'2007-ten_twothirds','2019-03-14 17:25:04','2019-03-14 17:25:04','79ab358a-cd9c-42cb-966e-f07ee4cf3b99',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(55,59,1,'2008-hemp_anchor','2019-03-14 17:25:21','2019-03-14 17:25:21','ce301545-f722-4801-9b5d-a4d2fdf3fafe',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(56,60,1,'2008-hemp_bg','2019-03-14 17:25:24','2019-03-14 17:25:24','3177805f-ce05-4c2c-bea6-e6c035298645',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(57,61,1,'2008-hemp_parallax','2019-03-14 17:25:35','2019-03-14 17:25:35','ad56da77-8355-43fe-8fc2-306b8341ac5d',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(58,62,1,'2008-hemp_twothirds','2019-03-14 17:25:42','2019-03-14 17:25:42','a0307a01-8c7f-4a3a-be0b-b96131e6facc',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(59,63,1,'2008-life_anchor','2019-03-14 17:25:54','2019-03-14 17:25:54','6dd311d9-1854-4c43-b7e1-57e25ef943b4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(60,64,1,'2008-life_bg','2019-03-14 17:25:58','2019-03-14 17:25:58','20de6c1e-2c4d-4345-9da5-d00d3a6c7f20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(61,65,1,'2008-life_parallax','2019-03-14 17:26:05','2019-03-14 17:26:05','81387e98-7798-4f31-b9a1-ed4a3fa6533c',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(62,66,1,'2008-life_twothirds','2019-03-14 17:26:15','2019-03-14 17:26:15','ee073f57-452d-4afa-8e15-6cf3cacc630d',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(63,67,1,'2008-seasilk_anchor','2019-03-14 17:26:32','2019-03-14 17:26:32','97316bd7-faff-408f-8069-c36ac68420ea',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(64,68,1,'2008-seasilk_bg','2019-03-14 17:26:37','2019-03-14 17:26:37','47507cb1-1550-4742-bf98-ec138f1b02d1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(65,69,1,'2008-seasilk_parallax','2019-03-14 17:26:44','2019-03-14 17:26:44','903d97cd-9717-4ba2-bdbd-cbfd55d2e92e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(66,70,1,'2008-seasilk_twothirds','2019-03-14 17:26:51','2019-03-14 17:26:51','2db86f4b-d393-49ff-97c3-e5efa15c20f0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(67,71,1,'2010-bamboo_anchor','2019-03-14 17:27:04','2019-03-14 17:27:04','60282890-5a5d-49c2-8269-405842bf4dac',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(68,72,1,'2010-bamboo_bg','2019-03-14 17:27:08','2019-03-14 17:27:08','091bebf5-9f22-48ef-bb3f-b742d40891b2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(69,73,1,'2010-bamboo_parallax','2019-03-14 17:27:28','2019-03-14 17:27:28','b442c797-1f6e-4cb6-bb0a-76142111e2b4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(70,74,1,'2010-bamboo_twothirds','2019-03-14 17:27:37','2019-03-14 17:27:37','c8cd147d-5d84-45e0-86c4-bb85cd9e2c5e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(71,75,1,'2011-bamboo_anchor','2019-03-14 17:27:47','2019-03-14 17:27:47','8afe5a85-2569-42a5-9f59-e3d415c71850',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(72,76,1,'2011-bamboo_bg','2019-03-14 17:27:50','2019-03-14 17:27:50','88e8a6a0-c7df-4cc7-b135-5817e0132633',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(73,77,1,'2011-bamboo_parallax_X','2019-03-14 17:27:56','2019-03-14 17:27:56','42f4ed14-a584-47e2-ac4d-1436c741a795',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(74,78,1,'2011-bamboo_twothirds','2019-03-14 17:28:06','2019-03-14 17:28:06','1489bdd3-f62c-4f84-898b-c84c954c5ba4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(75,79,1,'2012-bamboo_anchor','2019-03-14 17:28:16','2019-03-14 17:28:16','920a061c-559a-4c2e-8d36-79be6eb59f98',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(76,80,1,'2012-bamboo_bg','2019-03-14 17:28:18','2019-03-14 17:28:18','045c4be5-8801-4229-ba2a-41960dafc44f',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(77,81,1,'2012-bamboo_parallax','2019-03-14 17:28:25','2019-03-14 17:28:25','6ced5ab1-1a96-48c0-ae5a-1e550b70a3f4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(78,82,1,'2012-bamboo_twothirds','2019-03-14 17:28:33','2019-03-14 17:28:33','5c3a45cb-1efa-4a53-b3a1-0394c8cca6ed',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(79,83,1,'2013-bamboo_anchor','2019-03-14 17:28:47','2019-03-14 17:28:47','58cb4533-f9c5-472c-80e0-037e1b6e469d',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(80,84,1,'2013-bamboo_bg','2019-03-14 17:28:52','2019-03-14 17:28:52','9066d49e-62c6-49b6-841f-08960914b968',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(81,85,1,'2013-bamboo_parallax','2019-03-14 17:29:11','2019-03-14 17:29:11','0343e1db-1d85-4f15-b877-746e07f46405',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(82,86,1,'2013-bamboo_twothirds','2019-03-14 17:29:17','2019-03-14 17:29:17','727f8c00-4bf0-4c6e-8670-07414eb88264',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(83,87,1,'2018-caviar_anchor','2019-03-14 17:29:22','2019-03-14 17:29:22','31644fcf-13b3-45be-9cd0-78a451920a7a',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(84,88,1,'2018-caviar_bg','2019-03-14 17:29:24','2019-03-14 17:29:24','e5cfb30a-1c49-48ec-9f8b-d4f757839458',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(85,89,1,'2018-caviar_bg2','2019-03-14 17:29:33','2019-03-14 17:29:33','4fb843e5-5412-44a7-9ec2-a21a0b217c2d',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(86,90,1,'2018-caviar_parallax','2019-03-14 17:29:40','2019-03-14 17:29:40','d5e225ff-04f3-440a-b475-2fce7fcbdf8c',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(87,91,1,'2018-caviar_slide1','2019-03-14 17:29:47','2019-03-14 17:29:47','2ec337bb-da4b-4319-83da-31d038b8a5f4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(88,92,1,'2018-caviar_slide2','2019-03-14 17:29:51','2019-03-14 17:29:51','1ab738bd-8ad2-4a5b-afa4-1c103bc76f04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(89,93,1,'2018-caviar_slide3','2019-03-14 17:29:55','2019-03-14 17:29:55','10a77304-348a-417d-a111-771eb18f15f8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(90,94,1,'2018-caviar_twothirds','2019-03-14 17:30:00','2019-03-14 17:30:00','665593c2-13eb-4767-922f-cac58f34e511',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(91,95,1,'2013','2019-03-14 17:51:13','2019-04-08 23:18:21','38f65953-1ced-492f-8467-17b180dee085',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(92,96,1,'2013 - Component A - Header','2019-03-14 19:12:07','2019-04-08 23:18:21','ec2a32c9-fff1-4631-a78e-1f9088c69e4c',NULL,NULL,NULL,NULL,'Bamboo On\nThe Beach',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(93,97,1,'2013 - Component B - Detail','2019-03-14 19:13:43','2019-04-08 23:18:21','f86647b3-e570-4b0c-ad94-5620382cfc08',NULL,NULL,NULL,NULL,'Bamboo On The Beach','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,NULL,NULL,NULL),
	(94,98,1,'2012','2019-03-14 19:13:55','2019-04-08 23:18:21','4e367519-f847-45bc-9a9a-870aca0112f5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(95,99,1,'2012 - Component A - Header','2019-03-14 19:23:28','2019-04-08 23:18:21','52100092-58b6-4a92-9273-77418246b12f',NULL,NULL,NULL,NULL,'New Bamboo\nIn Style',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(96,100,1,'2012 - Component B - Detail','2019-03-14 19:26:49','2019-04-08 23:18:21','ab13ee5c-e035-403c-9d34-90e321d0964b',NULL,NULL,NULL,NULL,'New Bamboo In Style','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,NULL,NULL,NULL),
	(97,101,1,'2010','2019-03-14 19:29:49','2019-04-08 23:18:21','199b4acb-ad17-46c3-9312-6d391b941def',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(98,102,1,'2010 - Component A - Header','2019-03-14 19:30:29','2019-04-08 23:18:21','cf149618-4f80-4835-a342-e087b7f72955',NULL,NULL,NULL,NULL,'The Bamboo\nStrength',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(99,103,1,'2010 - Component B - Detail','2019-03-14 19:31:34','2019-04-08 23:18:22','4c3e528f-0c43-4550-96a1-3e3748e40322',NULL,NULL,NULL,NULL,'The Bamboo Strength','Infuse your hair with the power of one of the world’s fastest growing and most resilient natural ingredients.',NULL,'Dedicated to boosting your hair\'s intrinsic strength and flexibility, the Bamboo collection was sustainably sourced and harvested globally, from India, Peru, Indonesia, and Namibia. It provided even the most premium consumer segments with unique nourishing and energizing extracts that were simply not available on the market at the time.',NULL,NULL,NULL,NULL),
	(100,104,1,'2008','2019-03-14 19:32:05','2019-04-08 23:18:22','b224d18f-364b-47b8-b7c8-ee73ba2976f4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(101,105,1,'2008 - Component A - Header - Seasilk','2019-03-14 19:41:04','2019-04-08 23:18:22','36206abb-226a-412c-87ef-c4f1603da1b4',NULL,NULL,NULL,NULL,'Seasilk Soft & \nSeasilk Smooth',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(102,106,1,'2008 - Component B - Detail - Seasilk','2019-03-14 19:42:08','2019-04-08 23:18:22','6290b86b-9fd0-484b-b91b-34cff3547f5a',NULL,NULL,NULL,NULL,'Seasilk Soft & Seasilk Smooth','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,NULL,NULL,NULL),
	(103,107,1,'2008 - Component A - Header - Hemp','2019-03-14 19:43:08','2019-04-08 23:18:22','0da03a9b-6234-4908-8edc-1a722c271172',NULL,NULL,NULL,NULL,'Highly\nHydrating Hemp',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(104,108,1,'2008 - Component B - Detail - Hemp','2019-03-14 19:44:01','2019-04-08 23:18:22','e2777589-d12b-4da5-99a4-0b5b27f99977',NULL,NULL,NULL,NULL,'Highly Hydrating Hemp','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,NULL,NULL,NULL),
	(105,109,1,'2008 - Component A - Header - Life Ext','2019-03-14 19:44:51','2019-04-08 23:18:22','37f7ee76-8891-4271-9600-957b42d44e3a',NULL,NULL,NULL,NULL,'Once In\nA Life Extension',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(106,110,1,'2008 - Component B - Detail - Life Ext','2019-03-14 19:46:09','2019-04-08 23:18:22','3fdecc91-43a2-4997-8f5f-89299f3d4e59',NULL,NULL,NULL,NULL,'Once In A Life Extension','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,NULL,NULL,NULL),
	(107,111,1,'2007','2019-03-14 19:46:48','2019-04-08 23:18:22','082b3bde-cea0-442c-9f5a-9ae0953b24f6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(108,112,1,'2007 - Component A - Header','2019-03-14 19:47:33','2019-04-08 23:18:22','c71113dd-8806-4f56-ae80-3d7acf3f68eb',NULL,NULL,NULL,NULL,'Ten Out\nOf Ten',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(109,113,1,'2007 - Component B - Detail','2019-03-14 19:48:16','2019-04-08 23:18:22','65ea67dd-baa9-4a68-951f-ea9a30da21d1',NULL,NULL,NULL,NULL,'Ten Out Of Ten','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,NULL,NULL,NULL),
	(110,114,1,'2005','2019-03-14 19:48:30','2019-04-08 23:18:22','444bc711-7ac2-47bd-bda0-20ac9b26af0b',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(111,115,1,'2005 - Component A - Header - truffle','2019-03-14 19:49:37','2019-04-08 23:18:22','b8f2e880-6d87-4683-85a0-530abbdcf099',NULL,NULL,NULL,NULL,'White\nTruffle\nExtravagance',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(112,116,1,'2005 - Component B - Detail - Truffle','2019-03-14 19:50:16','2019-04-08 23:18:22','681e48f0-69df-452f-b4f3-752697828249',NULL,NULL,NULL,NULL,'White Truffle Extravagance','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,NULL,NULL,NULL),
	(113,117,1,'2005 - Component A - Header - Caviar','2019-03-14 19:55:34','2019-04-08 23:18:22','4f12cd76-36c9-4da4-bec1-f190b1ee733a',NULL,NULL,NULL,NULL,'Caviar\nEnzymes\nAgainst Aging',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(114,118,1,'2005 - Component B - Detail - Caviar','2019-03-14 19:56:26','2019-04-08 23:18:22','0ab9368b-cdcd-437e-885e-d30c0e41d4c9',NULL,NULL,NULL,NULL,'Caviar Enzymes Against Aging','Ultimately responsible for processing all incoming nutrients, enzyme levels decrease with age, requiring high-precision treatment.',NULL,'Caviar with Age-Control Complex was a unique system of products targeted at restoring both vibrancy and elasticity of the hair and skin. Using caviar enzymes, cytokines, and vitamin C, the complex prevented external as well as oxidative damage, stimulated protein production, and encouraged rapid regeneration at the cellular level.',NULL,NULL,NULL,NULL),
	(115,119,1,'1999','2019-03-14 19:56:50','2019-04-08 23:18:23','f276f85d-7cf9-4281-8499-cb3df1c32132',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(116,120,1,'1999 - Component A - Header -antiaging','2019-03-14 20:00:59','2019-04-08 23:18:23','37afeb81-8e4a-41f1-aadf-9a0dfe4328dc',NULL,NULL,NULL,NULL,'Anti-Aging\nCaviar\nCollection',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(117,121,1,'1999 - Component B - Detail - Caviar','2019-03-14 20:02:09','2019-04-08 23:18:23','b252ab4e-61b3-4c01-9683-dae89dae177a',NULL,NULL,NULL,NULL,'Anti-Aging Caviar Collection','When you browse the world in search of the most effective natural anti-aging ingredient, in the end, you find caviar.',NULL,'In less than two years since the launch of its inaugural collection, Alterna presented its first breakthrough line of products with anti-aging properties, developed based on caviar. Full of omega-3 fatty acids, it helped to replenish the hair’s lipid layer for better moisture retention and elasticity and resulted in healthy natural smoothness and shine.',NULL,NULL,NULL,NULL),
	(118,122,1,'1999 - Component B - video - Caviar','2019-03-14 20:08:23','2019-04-08 23:18:23','cee58ace-7c38-40a9-84f6-3791bb17d87a',NULL,NULL,NULL,NULL,'Anti-Aging Caviar Collection',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(119,123,1,'1999 - Component A - Header - lifeline','2019-03-14 20:10:28','2019-04-08 23:18:23','74c3c7df-3a43-4080-9d47-f463bde04082',NULL,NULL,NULL,NULL,'Bring In \nThe Life Line',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(120,124,1,'1999 - Component B - Detail - lifeline','2019-03-14 20:11:31','2019-04-08 23:18:23','01e0ac38-2664-4519-922a-03ef1280ee57',NULL,NULL,NULL,NULL,'Bring In The Life Line','Real beauty on the outside requires beauty on the inside. Like yin and yang. Western technology combined with eastern medicinal wisdom.',NULL,'Alterna Life collection took a unique approach to beauty by first encouraging relaxation and peaceful state of mind through soothing colors and exotic scents, and then making use of the latest advances in technology to work on volume, restoration, straightening, and curling. Life brought the body and mind into complete balance.',NULL,NULL,NULL,NULL),
	(121,125,1,'1999 - Component B - Slideshow - lifeline','2019-03-14 20:14:02','2019-04-08 23:18:23','e211ce21-bb9e-4c99-86de-c4204a86d7b3',NULL,NULL,NULL,NULL,'Bring In The Life Line',NULL,NULL,NULL,'Collection',NULL,NULL,NULL),
	(122,129,1,'1997','2019-03-14 20:16:31','2019-04-08 23:18:23','0d4f3e34-0690-44fb-adee-d7b9da59c003',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(123,130,1,'1997 - Component A - Header','2019-03-14 20:17:48','2019-04-08 23:18:23','f37fe1df-d8de-449d-bf3d-d458c861baec',NULL,NULL,NULL,NULL,'A New\nGeneration\nOf Hair Care',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(124,131,1,'1997 - Component B - Detail','2019-03-14 20:18:57','2019-04-08 23:18:23','c57b4013-c048-4aca-8ea6-eff8210ff350',NULL,NULL,NULL,NULL,'A New Generation Of Hair Care','Imagine a line of premium hair products free of additives and harsh ingredients resulting in an effective and healthy look.',NULL,'Launched in 1997, Alterna had a vision of creating a sustainable future through introducing a no-compromise luxurious haircare collection. All deszigned specifically for discerning industry professionals and based on the science of skincare, incorporating new technological advancements. Only natural eco-certified ingredients. No sulfates or parabens. No animal testing. Ever.',NULL,NULL,NULL,NULL),
	(125,132,1,'2019 - Component B - Detail','2019-03-14 20:23:24','2019-04-08 23:18:23','26adbd6b-b15b-41b7-9c25-09a0bd1759f6',NULL,NULL,NULL,NULL,'Alterna Brand Launches',NULL,NULL,NULL,'Collection',NULL,NULL,NULL),
	(126,136,1,'7df2a51137ec4b9c80ec4b082924bea7','2019-03-15 11:47:24','2019-03-15 11:47:24','4346af8f-e327-4308-b7a0-4cae3694f7c1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(127,137,1,'Small','2019-03-15 11:47:45','2019-03-15 11:47:45','b48b9d71-ed27-47ee-8fff-437f799d49d9',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(128,138,1,'2019 - slideshow - testing','2019-03-18 18:22:58','2019-04-08 23:18:23','185271a8-2d8e-4fa1-8fd1-3e29cf4b0fca',NULL,NULL,NULL,NULL,'2019 Caviar',NULL,NULL,NULL,'2019 Caviar',NULL,NULL,NULL),
	(129,143,1,NULL,'2019-03-25 22:05:03','2019-03-27 21:33:19','8b5b01c2-023e-44c2-878d-4b49ae5dc5d1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(130,145,1,'2018-Header-background','2019-03-28 23:24:02','2019-03-28 23:24:02','0ad1c0ea-1ecd-435e-985c-d62d847ad74c',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(131,146,1,'2018-B','2019-03-28 23:28:44','2019-03-28 23:30:09','52be8d8e-179a-47bc-9d66-9880a96ead45',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(132,147,1,'2018-B','2019-03-28 23:30:05','2019-03-28 23:30:05','b98aa424-3850-4a5e-bb17-272f5e6fabc2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(133,148,1,'2018-B-background','2019-03-28 23:34:39','2019-04-05 19:21:04','59d02684-d135-41ad-8018-5b9dd5c21679',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(134,149,1,'2018-B-right','2019-03-28 23:37:14','2019-03-28 23:37:14','234114dd-31a6-41e6-b074-d92d49982e20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(135,150,1,'2018-B-background','2019-03-28 23:41:10','2019-03-28 23:41:10','beff1f57-9b47-4f7d-b2cb-e093b36aa704',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(136,151,1,'2018 Component B - slide','2019-03-28 23:42:39','2019-04-08 23:18:24','12c3275b-b4c3-4484-83be-4365fb2c828d',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(137,152,1,'2018-B-background','2019-03-28 23:45:37','2019-03-28 23:45:37','45fdf469-44c4-4529-a6f6-a1e8dba0cb9e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(138,153,1,'2018-C-background','2019-03-28 23:45:43','2019-03-28 23:45:43','ca67d3bc-790c-4e0c-b857-bd5ba1607bdd',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(139,154,1,'Bond-5','2019-03-28 23:46:15','2019-03-28 23:46:15','32456112-e6bb-4cda-b67f-8cecf0497b62',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(140,156,1,'2018-B-background','2019-04-05 19:20:55','2019-04-05 19:20:55','efab9e38-f167-4c51-ae61-0a78286fff02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(141,157,1,'MOISTURE_MASQUE_2018-Header-B-Detail','2019-04-05 19:24:43','2019-04-05 19:24:43','6d05a4ba-545f-44fd-b287-d31675b47ac1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(142,158,1,'BOND-REPAIR_MASQUE_5.7OZ_030118','2019-04-05 19:49:18','2019-04-05 19:49:18','3906e8a4-2ace-433a-8a76-960294f25f08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(143,159,1,'Moisture-Family-New','2019-04-05 19:57:32','2019-04-05 19:57:32','b758774b-3c2a-48c6-a10d-f1030a40bdcb',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(144,161,1,'Anti Frizz-Family','2019-04-05 19:59:48','2019-04-05 19:59:48','244b3b01-0b3a-4ea1-a339-154ba50a878a',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(145,162,1,'Stylers','2019-04-05 20:00:12','2019-04-05 20:00:12','b127298c-1e2b-4761-8fad-ba122ba97196',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(146,165,1,'Bond-Group','2019-04-05 20:01:58','2019-04-05 20:01:58','e745295f-0a3d-4858-ba36-3be439f2fb9e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(147,166,1,'2018 - Video test','2019-04-05 20:07:48','2019-04-08 23:18:24','4d0ead95-10e1-420b-9e2c-e7c0ba32a980',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(148,167,1,'Homepage_Alterna-CAVIAR-Brand-Video','2019-04-05 20:10:21','2019-04-05 20:10:21','5a9f87bb-f35c-45fd-bbe3-7586b602a6c3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(149,168,1,'Homepage','2019-04-08 23:19:10','2019-04-08 23:20:11','bf72afa1-c869-4c79-93f1-fef517f56567',NULL,NULL,NULL,NULL,'Alterna Museum Hompage',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(150,169,1,NULL,'2019-04-08 23:35:18','2019-04-08 23:36:37','8c389e15-f734-4917-9ecc-490aa1e2db7b',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Alterna Museum','Alterna Haircare creates groundbreaking formulas that set the industry standard for the finest luxury haircare products in the world.');

/*!40000 ALTER TABLE `craft_content` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_craftidtokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_craftidtokens`;

CREATE TABLE `craft_craftidtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_craftidtokens_userId_fk` (`userId`),
  CONSTRAINT `craft_craftidtokens_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table craft_deprecationerrors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_deprecationerrors`;

CREATE TABLE `craft_deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint(6) unsigned DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `traces` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_deprecationerrors_key_fingerprint_unq_idx` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table craft_elementindexsettings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_elementindexsettings`;

CREATE TABLE `craft_elementindexsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_elementindexsettings_type_unq_idx` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table craft_elements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_elements`;

CREATE TABLE `craft_elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_elements_dateDeleted_idx` (`dateDeleted`),
  KEY `craft_elements_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `craft_elements_type_idx` (`type`),
  KEY `craft_elements_enabled_idx` (`enabled`),
  KEY `craft_elements_archived_dateCreated_idx` (`archived`,`dateCreated`),
  CONSTRAINT `craft_elements_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_elements` WRITE;
/*!40000 ALTER TABLE `craft_elements` DISABLE KEYS */;

INSERT INTO `craft_elements` (`id`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,NULL,'craft\\elements\\User',1,0,'2019-03-06 21:56:09','2019-03-06 21:56:09',NULL,'0752ee1d-6920-46e4-87bc-1b417353e8bd'),
	(2,1,'craft\\elements\\Entry',1,0,'2019-03-06 23:09:34','2019-03-07 00:42:29',NULL,'7ad2e4e8-eb02-4edd-83a2-c857e3d2df5c'),
	(3,2,'craft\\elements\\GlobalSet',1,0,'2019-03-06 23:33:02','2019-03-16 00:05:44',NULL,'a9ad2e00-4b55-433d-a7ad-f299b21cd70f'),
	(4,3,'craft\\elements\\Entry',1,0,'2019-03-06 23:40:23','2019-04-08 23:18:20',NULL,'8f5974c4-a30f-41a3-bae6-189304912ad9'),
	(5,4,'craft\\elements\\Entry',1,0,'2019-03-06 23:40:36','2019-03-06 23:41:18','2019-03-06 23:54:50','12445e8b-0bbe-488b-aa0a-885e8117c3c5'),
	(6,NULL,'craft\\elements\\Asset',1,0,'2019-03-06 23:57:43','2019-03-13 14:43:01',NULL,'0f00097b-5c09-4a94-a336-211ace0c37f0'),
	(7,7,'craft\\elements\\Entry',1,0,'2019-03-06 23:57:51','2019-04-08 23:18:20',NULL,'b67c815e-40ee-481f-85ab-9764dea778d5'),
	(8,NULL,'craft\\elements\\Asset',1,0,'2019-03-07 00:10:54','2019-03-13 14:43:02',NULL,'fb4063d1-b569-42a1-809d-ee7c53f9f6ea'),
	(9,NULL,'craft\\elements\\Asset',1,0,'2019-03-07 00:13:10','2019-03-13 14:43:03',NULL,'fe000add-d3f3-4e1b-81d8-0584f448b781'),
	(10,8,'craft\\elements\\Entry',1,0,'2019-03-07 00:13:37','2019-04-08 23:18:20',NULL,'69781079-7efd-4cc2-96d6-49735654a282'),
	(11,NULL,'craft\\elements\\Asset',1,0,'2019-03-07 00:15:15','2019-03-13 14:43:03',NULL,'eb38fd43-91f6-4a41-b16b-d9ede7f7c7c8'),
	(12,NULL,'craft\\elements\\Asset',1,0,'2019-03-07 00:15:34','2019-03-13 14:43:03',NULL,'5b374d62-f25d-4cac-a0c4-81df9822c7e7'),
	(13,NULL,'craft\\elements\\Asset',1,0,'2019-03-07 00:15:56','2019-03-13 14:43:04',NULL,'40296ec4-881b-461b-9e5d-ddab06523355'),
	(14,9,'craft\\elements\\Entry',0,0,'2019-03-07 00:16:36','2019-04-08 23:18:21',NULL,'5b689ce9-42bd-46ea-8f1f-03d220955e5a'),
	(15,6,'craft\\elements\\MatrixBlock',1,0,'2019-03-07 00:16:37','2019-04-08 23:18:21',NULL,'ebe6ad25-2e87-4854-9eb5-27f5b30fc6b1'),
	(16,6,'craft\\elements\\MatrixBlock',1,0,'2019-03-07 00:16:37','2019-04-08 23:18:21',NULL,'266adc6d-9a4a-488b-b498-3aba80f60fdc'),
	(17,6,'craft\\elements\\MatrixBlock',1,0,'2019-03-07 00:16:37','2019-04-08 23:18:21',NULL,'87fa989a-dcd4-4d00-ba1f-b61bedef993d'),
	(18,6,'craft\\elements\\MatrixBlock',1,0,'2019-03-07 00:16:37','2019-04-08 23:18:21',NULL,'ab4a805a-1d4e-4228-9a14-48ba59bcad3f'),
	(19,NULL,'craft\\elements\\Asset',1,0,'2019-03-07 00:17:37','2019-03-13 14:43:06',NULL,'4d5639d6-17aa-41a6-81b5-62ffd5555521'),
	(20,10,'craft\\elements\\Entry',0,0,'2019-03-07 00:17:52','2019-04-08 23:18:21',NULL,'f5601cea-b294-4398-a284-8d7e136fe066'),
	(21,3,'craft\\elements\\Entry',1,0,'2019-03-07 00:17:59','2019-04-08 23:18:21',NULL,'c0abf14c-4e68-455a-9f9e-601aa06fcc94'),
	(22,7,'craft\\elements\\Entry',1,0,'2019-03-07 00:18:46','2019-04-08 23:18:21',NULL,'45eed6a1-c1f3-41a6-880e-46ac1d702638'),
	(23,8,'craft\\elements\\Entry',1,0,'2019-03-07 00:19:56','2019-04-08 23:18:21',NULL,'02b2fa9f-04b3-4531-8041-02ed783f068c'),
	(24,NULL,'craft\\elements\\Asset',1,0,'2019-03-07 01:00:48','2019-03-13 14:43:04',NULL,'54cec98b-08aa-4095-8f32-523196d9001a'),
	(25,11,'craft\\elements\\Entry',1,0,'2019-03-07 01:05:09','2019-03-07 01:05:23',NULL,'698ac358-ac64-41f0-b4e0-2d88e37cf978'),
	(26,3,'craft\\elements\\Entry',0,0,'2019-03-12 22:25:53','2019-04-08 23:18:21',NULL,'ed7d1299-2f43-4c3a-a86e-77d19853e030'),
	(27,10,'craft\\elements\\Entry',0,0,'2019-03-12 22:26:26','2019-04-08 23:18:21',NULL,'b21d7dd5-2421-418c-af04-ef5cf4574933'),
	(28,NULL,'craft\\elements\\Asset',1,0,'2019-03-13 14:43:01','2019-03-13 14:43:01',NULL,'ce4eba01-e91b-4753-b2c4-e14b11d28950'),
	(29,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:21:27','2019-03-14 17:21:27',NULL,'b7d865bf-9b96-41d6-8f94-16f212291a7e'),
	(30,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:21:41','2019-03-14 17:21:41',NULL,'ac326ead-3f03-4d94-84e3-0cee4ad7cbcd'),
	(31,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:21:47','2019-03-14 17:21:47',NULL,'07417e0c-ef4c-4b58-a4f3-86c093e99cd5'),
	(32,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:21:54','2019-03-14 17:21:54',NULL,'51cc9c6e-90a5-46b1-bcf3-c5e73bda9525'),
	(33,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:21:58','2019-03-14 17:21:58',NULL,'76b3813e-8da5-4d25-970e-ebff2998cce7'),
	(34,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:22:03','2019-03-14 17:22:03',NULL,'6cc41bf9-0747-457a-afef-ecee34e5f373'),
	(35,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:22:08','2019-03-14 17:22:08',NULL,'b3ad97ef-1e9d-4de5-a998-8a6d65d3d6e8'),
	(36,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:22:14','2019-03-14 17:22:14',NULL,'0367fb78-524b-481e-8942-79c40f86bce7'),
	(37,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:22:16','2019-03-14 17:22:16',NULL,'130e57d5-b826-4f94-ab92-bb64d8a03430'),
	(38,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:22:20','2019-03-14 17:22:20',NULL,'91b986b1-64ec-4e63-bfd1-1c136b3d4a7c'),
	(39,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:22:25','2019-03-14 17:22:25',NULL,'e93f8a9d-d517-4272-954b-0270c06b829a'),
	(40,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:22:28','2019-03-14 17:22:28',NULL,'8bdb94a5-361e-4a25-8677-637c717ca1b6'),
	(41,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:22:35','2019-03-14 17:22:35',NULL,'2d0d535e-7d11-4725-ae8d-7d6f775b7131'),
	(42,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:22:55','2019-03-14 17:22:55',NULL,'0235b34e-d574-42a0-8309-ac385fc84495'),
	(43,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:23:03','2019-03-14 17:23:03',NULL,'7f85f7e4-2547-4ed9-906c-43aed4619982'),
	(44,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:23:04','2019-03-14 17:23:04',NULL,'c507962e-fc55-41af-b3be-661554177315'),
	(45,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:23:05','2019-03-14 17:23:05',NULL,'d052beba-0855-48e9-bee5-6d6113e6ff3d'),
	(46,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:23:08','2019-03-14 17:23:08',NULL,'b4e4a6a5-7431-4b88-8338-187df02132f2'),
	(47,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:23:25','2019-03-14 17:23:25',NULL,'8dc847fd-a485-4978-a4c6-a6a7a881236e'),
	(48,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:23:29','2019-03-14 17:23:29',NULL,'b6ac9ace-8a6f-4beb-99f5-b1e4f2e174e4'),
	(49,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:23:47','2019-03-14 17:23:47',NULL,'b38b4a7c-7f5f-4af8-b1d4-d36e518bd1d5'),
	(50,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:23:55','2019-03-14 17:23:55',NULL,'b5c9ccc7-6b26-497e-9ce5-77414d4fcac9'),
	(51,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:24:09','2019-03-14 17:24:09',NULL,'1c9ce304-423f-4e10-9697-f126e3515961'),
	(52,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:24:11','2019-03-14 17:24:11',NULL,'d7a0da56-da3b-4e91-932d-2a3bebcda4a5'),
	(53,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:24:19','2019-03-14 17:24:19',NULL,'20a2911d-1b6b-4980-8ccd-83633d933510'),
	(54,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:24:26','2019-03-14 17:24:26',NULL,'0043a11f-05ec-4eb9-9699-ea0c378e3251'),
	(55,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:24:44','2019-03-14 17:24:44',NULL,'a15b5cef-cd7b-4671-b08b-cc0d9f3d8e51'),
	(56,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:24:47','2019-03-14 17:24:47',NULL,'ffbe7eee-8e62-434d-a3e9-3206af2eac52'),
	(57,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:24:55','2019-03-14 17:24:55',NULL,'36ac953b-6fba-4fcf-94c0-3b3104095996'),
	(58,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:25:04','2019-03-14 17:25:04',NULL,'0601956d-738a-4b9e-a6b6-b84201819cbf'),
	(59,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:25:21','2019-03-14 17:25:21',NULL,'66da6c68-b9b2-4a5a-8c02-1a9ed8a57544'),
	(60,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:25:24','2019-03-14 17:25:24',NULL,'f4de0fbd-661e-458c-94c3-71fb57fefbba'),
	(61,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:25:35','2019-03-14 17:25:35',NULL,'13010a74-f683-4bba-b6ea-f78e5189963d'),
	(62,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:25:41','2019-03-14 17:25:41',NULL,'72d361ee-2bc4-4cb6-b8c2-16a813cf6141'),
	(63,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:25:54','2019-03-14 17:25:54',NULL,'629110eb-0721-4c73-8605-f8c409b0540f'),
	(64,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:25:58','2019-03-14 17:25:58',NULL,'8e5f9ec5-3a0c-4a8d-919e-ff577fa505b1'),
	(65,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:26:05','2019-03-14 17:26:05',NULL,'43715a85-812b-4c6c-8b5f-5826266c9bc9'),
	(66,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:26:15','2019-03-14 17:26:15',NULL,'f2831fbe-0fdd-40de-a0a2-27c65a0ccb2e'),
	(67,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:26:32','2019-03-14 17:26:32',NULL,'b6b9df35-3cfb-48fc-b553-2680dbf0a52e'),
	(68,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:26:37','2019-03-14 17:26:37',NULL,'b168691d-597b-4307-84ee-17e20bb51ae3'),
	(69,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:26:44','2019-03-14 17:26:44',NULL,'9421b9e9-1650-44dc-84e9-0e31a5916f47'),
	(70,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:26:51','2019-03-14 17:26:51',NULL,'4a87a6f5-b9a5-43bd-b132-b0762c9f36d2'),
	(71,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:27:04','2019-03-14 17:27:04',NULL,'181d2559-dc06-4f7a-838d-2856a3b0dc89'),
	(72,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:27:08','2019-03-14 17:27:08',NULL,'b98da599-01c4-4d7d-8b1a-7cb95b43fba2'),
	(73,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:27:28','2019-03-14 17:27:28',NULL,'bc7b9b0d-7656-4199-87c4-1286fe286905'),
	(74,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:27:37','2019-03-14 17:27:37',NULL,'67364272-4fe6-40b1-bca2-1c5f9a6a5a08'),
	(75,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:27:47','2019-03-14 17:27:47',NULL,'904392e5-d743-4937-b5ac-6d6a782238cc'),
	(76,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:27:50','2019-03-14 17:27:50',NULL,'59237e55-b34c-48e8-8a13-d102b1e0c10b'),
	(77,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:27:56','2019-03-14 17:27:56',NULL,'41245fff-1ce8-4d89-b2d1-8dd015fe6729'),
	(78,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:28:06','2019-03-14 17:28:06',NULL,'f1931975-cd04-4050-ae1b-79f8d9fb2d30'),
	(79,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:28:16','2019-03-14 17:28:16',NULL,'1d37689c-2200-40c6-ba6e-9f9d2061e78b'),
	(80,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:28:18','2019-03-14 17:28:18',NULL,'47f696b2-84a4-44b3-ab13-480e803a10b2'),
	(81,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:28:25','2019-03-14 17:28:25',NULL,'73303dfd-c263-436b-9da7-4268a06c3e8e'),
	(82,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:28:33','2019-03-14 17:28:33',NULL,'af7fbad9-3a98-4d81-8585-341459329fb4'),
	(83,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:28:47','2019-03-14 17:28:47',NULL,'db8b0974-2fa0-4619-8288-e38c2e3e31d2'),
	(84,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:28:52','2019-03-14 17:28:52',NULL,'ae8aae7d-bc6e-4ede-82f2-22978d283660'),
	(85,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:29:11','2019-03-14 17:29:11',NULL,'97f0853d-1745-4dc3-96fd-e85d016c3d8d'),
	(86,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:29:17','2019-03-14 17:29:17',NULL,'64a74ac9-1e53-4363-9af4-f720f6597ea4'),
	(87,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:29:22','2019-03-14 17:29:22',NULL,'adb90694-23a1-4072-97ed-117483bddaf0'),
	(88,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:29:24','2019-03-14 17:29:24',NULL,'feaef193-cdbf-4fa0-bfe8-49c4b35501d9'),
	(89,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:29:33','2019-03-14 17:29:33',NULL,'e3965ea3-733c-4ac1-8024-d0ca43d3f51e'),
	(90,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:29:40','2019-03-14 17:29:40',NULL,'fa12fafc-9505-446a-9c47-5c666cc3be6c'),
	(91,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:29:47','2019-03-14 17:29:47',NULL,'6330fbbd-6709-4eb1-8b8d-cbc9fbcc31ef'),
	(92,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:29:51','2019-03-14 17:29:51',NULL,'885fad3b-6997-4130-bd22-1cd040a495b4'),
	(93,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:29:55','2019-03-14 17:29:55',NULL,'77e1823d-43fe-4308-8184-6297e47a0564'),
	(94,NULL,'craft\\elements\\Asset',1,0,'2019-03-14 17:30:00','2019-03-14 17:30:00',NULL,'e5307820-f06c-43b5-bc3d-1ab96788264c'),
	(95,3,'craft\\elements\\Entry',1,0,'2019-03-14 17:51:13','2019-04-08 23:18:21',NULL,'8787fd2d-7853-4902-b83a-6c751139aee1'),
	(96,7,'craft\\elements\\Entry',1,0,'2019-03-14 19:12:07','2019-04-08 23:18:21',NULL,'a97c8feb-4d9d-42e8-af51-84e4b1943a8b'),
	(97,8,'craft\\elements\\Entry',1,0,'2019-03-14 19:13:43','2019-04-08 23:18:21',NULL,'464927da-e172-48a6-8a0a-2999b52dc007'),
	(98,3,'craft\\elements\\Entry',1,0,'2019-03-14 19:13:55','2019-04-08 23:18:21',NULL,'f2d66697-4e71-4c1c-afd5-b1b8fb50e649'),
	(99,7,'craft\\elements\\Entry',1,0,'2019-03-14 19:23:28','2019-04-08 23:18:21',NULL,'b526e300-3d91-43bd-a1ff-52e502189c09'),
	(100,8,'craft\\elements\\Entry',1,0,'2019-03-14 19:26:49','2019-04-08 23:18:21',NULL,'0efc6e66-9b73-49be-bfe6-77d8c3551fb1'),
	(101,3,'craft\\elements\\Entry',1,0,'2019-03-14 19:29:49','2019-04-08 23:18:21',NULL,'11cd5d84-7a91-4633-9ca3-1706e25468d1'),
	(102,7,'craft\\elements\\Entry',1,0,'2019-03-14 19:30:29','2019-04-08 23:18:21',NULL,'0efa35c5-4139-49e7-ab85-36c47a25a85e'),
	(103,8,'craft\\elements\\Entry',1,0,'2019-03-14 19:31:34','2019-04-08 23:18:22',NULL,'4e29ebe2-5ead-4236-8184-0982121dcd7f'),
	(104,3,'craft\\elements\\Entry',1,0,'2019-03-14 19:32:05','2019-04-08 23:18:22',NULL,'ed0640d1-6453-497a-8aab-8440cb05fc57'),
	(105,7,'craft\\elements\\Entry',1,0,'2019-03-14 19:41:04','2019-04-08 23:18:22',NULL,'5afcc2f4-b7e6-4d71-989f-80a72ef60167'),
	(106,8,'craft\\elements\\Entry',1,0,'2019-03-14 19:42:08','2019-04-08 23:18:22',NULL,'0ef34a22-5bd2-4f6d-91f8-cfc5580e4e0b'),
	(107,7,'craft\\elements\\Entry',1,0,'2019-03-14 19:43:08','2019-04-08 23:18:22',NULL,'d60d0a69-6363-4c1c-95fa-e5221b11d20a'),
	(108,8,'craft\\elements\\Entry',1,0,'2019-03-14 19:44:01','2019-04-08 23:18:22',NULL,'c22f70af-461a-4cb3-a61b-00d2bbaef630'),
	(109,7,'craft\\elements\\Entry',1,0,'2019-03-14 19:44:51','2019-04-08 23:18:22',NULL,'b6cf0aaa-4fcb-4305-b2a8-8fc4fc583753'),
	(110,8,'craft\\elements\\Entry',1,0,'2019-03-14 19:46:09','2019-04-08 23:18:22',NULL,'32a98a84-1485-4a10-87f4-e905c298b856'),
	(111,3,'craft\\elements\\Entry',1,0,'2019-03-14 19:46:48','2019-04-08 23:18:22',NULL,'5ea72f48-05b1-4fdf-b852-8a29d96caeba'),
	(112,7,'craft\\elements\\Entry',1,0,'2019-03-14 19:47:33','2019-04-08 23:18:22',NULL,'5ebc5203-756b-4737-b590-4a0e7c3810b6'),
	(113,8,'craft\\elements\\Entry',1,0,'2019-03-14 19:48:16','2019-04-08 23:18:22',NULL,'107387fb-5fc6-49ab-a084-79c25942e831'),
	(114,3,'craft\\elements\\Entry',1,0,'2019-03-14 19:48:30','2019-04-08 23:18:22',NULL,'13c72c04-9730-48bc-8e68-a1bfa3d51f33'),
	(115,7,'craft\\elements\\Entry',1,0,'2019-03-14 19:49:37','2019-04-08 23:18:22',NULL,'994e3d6f-b053-4001-9bd0-658e8e172d5f'),
	(116,8,'craft\\elements\\Entry',1,0,'2019-03-14 19:50:16','2019-04-08 23:18:22',NULL,'34377695-a0ae-4f67-8971-d193d4678600'),
	(117,7,'craft\\elements\\Entry',1,0,'2019-03-14 19:55:34','2019-04-08 23:18:22',NULL,'2cd7c80c-1392-49cb-a134-7df026e47a5b'),
	(118,8,'craft\\elements\\Entry',1,0,'2019-03-14 19:56:26','2019-04-08 23:18:22',NULL,'49b8bb77-2838-4052-8063-16c90a3e378f'),
	(119,3,'craft\\elements\\Entry',1,0,'2019-03-14 19:56:50','2019-04-08 23:18:23',NULL,'ce4d573e-2d97-4069-a713-105a74237ab7'),
	(120,7,'craft\\elements\\Entry',1,0,'2019-03-14 20:00:59','2019-04-08 23:18:23',NULL,'5a9cf59b-6cc4-4576-8ef5-dd192d4342f0'),
	(121,8,'craft\\elements\\Entry',1,0,'2019-03-14 20:02:09','2019-04-08 23:18:23',NULL,'9021b211-2885-4a3f-8821-0a03336dd3a9'),
	(122,10,'craft\\elements\\Entry',1,0,'2019-03-14 20:08:23','2019-04-08 23:18:23',NULL,'f46c5188-18a0-479b-b17f-ef1374cfa06e'),
	(123,7,'craft\\elements\\Entry',1,0,'2019-03-14 20:10:28','2019-04-08 23:18:23',NULL,'20ee5390-72a4-418d-8b93-92288ae51bff'),
	(124,8,'craft\\elements\\Entry',1,0,'2019-03-14 20:11:31','2019-04-08 23:18:23',NULL,'82547889-6b18-4fc7-892b-b9cb9113ad75'),
	(125,9,'craft\\elements\\Entry',1,0,'2019-03-14 20:14:02','2019-04-08 23:18:23',NULL,'74ff639a-a282-4a93-ac67-b2f1decbe562'),
	(126,6,'craft\\elements\\MatrixBlock',1,0,'2019-03-14 20:14:02','2019-04-08 23:18:23',NULL,'efa0da8b-cdae-4163-bc28-20f25a65098f'),
	(127,6,'craft\\elements\\MatrixBlock',1,0,'2019-03-14 20:14:02','2019-04-08 23:18:23',NULL,'b7fe8bfa-1648-49af-98a6-c19127508a27'),
	(128,6,'craft\\elements\\MatrixBlock',1,0,'2019-03-14 20:14:02','2019-04-08 23:18:23',NULL,'190609cb-0d0c-4d9c-8c16-f430a1740d55'),
	(129,3,'craft\\elements\\Entry',1,0,'2019-03-14 20:16:31','2019-04-08 23:18:23',NULL,'a6f41ba8-0858-47f6-9e04-8f3239dcd306'),
	(130,7,'craft\\elements\\Entry',1,0,'2019-03-14 20:17:48','2019-04-08 23:18:23',NULL,'7733646f-94ae-487c-a632-9e8c7121b2ab'),
	(131,8,'craft\\elements\\Entry',1,0,'2019-03-14 20:18:57','2019-04-08 23:18:23',NULL,'a0dd55bc-d30b-4342-9343-de7448edfdb7'),
	(132,9,'craft\\elements\\Entry',0,0,'2019-03-14 20:23:24','2019-04-08 23:18:23',NULL,'01c48070-53b9-4f67-bffc-1506d0263998'),
	(133,6,'craft\\elements\\MatrixBlock',1,0,'2019-03-14 20:23:24','2019-04-08 23:18:23',NULL,'8931f143-da46-43c6-a868-2acc30279f6c'),
	(134,6,'craft\\elements\\MatrixBlock',1,0,'2019-03-14 20:23:24','2019-04-08 23:18:23',NULL,'7da174b1-f85e-4fcc-bfb1-d7ae88e985c3'),
	(135,6,'craft\\elements\\MatrixBlock',1,0,'2019-03-14 20:23:24','2019-04-08 23:18:23',NULL,'c7d31c4e-2061-491b-82c8-cfbbbf4cfbc8'),
	(136,NULL,'craft\\elements\\Asset',1,0,'2019-03-15 11:47:24','2019-03-15 11:47:24',NULL,'5ac98bf0-4d4e-4492-9a5d-0db9255f1204'),
	(137,NULL,'craft\\elements\\Asset',1,0,'2019-03-15 11:47:45','2019-03-15 11:47:45',NULL,'c4c6d48b-d92d-4f86-91a6-fd7b311e0683'),
	(138,9,'craft\\elements\\Entry',0,0,'2019-03-18 18:22:58','2019-04-08 23:18:23',NULL,'5fc06557-20c0-4e6b-9f80-0e2ef797fcf1'),
	(139,6,'craft\\elements\\MatrixBlock',1,0,'2019-03-18 18:22:58','2019-04-08 23:18:23',NULL,'73dd0c8a-f506-4ef2-8e02-2c716cc958b1'),
	(140,6,'craft\\elements\\MatrixBlock',1,0,'2019-03-18 18:22:58','2019-04-08 23:18:24',NULL,'d014d872-2d63-4342-81e4-14a53ebdbf3b'),
	(141,6,'craft\\elements\\MatrixBlock',1,0,'2019-03-18 18:22:58','2019-04-08 23:18:24',NULL,'334ffd6c-9088-482f-828d-2cb589fb212e'),
	(142,6,'craft\\elements\\MatrixBlock',1,0,'2019-03-18 18:22:58','2019-04-08 23:18:24',NULL,'f0d02320-4b07-4e12-88d7-892d8b8a629b'),
	(143,13,'craft\\elements\\GlobalSet',1,0,'2019-03-25 22:05:03','2019-03-27 21:33:19',NULL,'58c9da44-08ab-43e3-9306-d001491ae7e9'),
	(144,12,'craft\\elements\\MatrixBlock',1,0,'2019-03-25 22:05:47','2019-03-27 21:33:19',NULL,'aa33e345-4a07-432d-a0c5-b7f54af14fdf'),
	(145,NULL,'craft\\elements\\Asset',1,0,'2019-03-28 23:24:02','2019-03-28 23:24:02',NULL,'67d2947c-b141-4bdc-b763-c8c7cfb61324'),
	(146,NULL,'craft\\elements\\Asset',1,0,'2019-03-28 23:28:44','2019-03-28 23:30:09',NULL,'185c48dc-6b1e-49e1-b504-fea2520f2d05'),
	(147,NULL,'craft\\elements\\Asset',1,0,'2019-03-28 23:30:05','2019-03-28 23:30:05','2019-03-28 23:30:09','b2c4cfca-1f2f-43a2-afba-b9cbf3969da7'),
	(148,NULL,'craft\\elements\\Asset',1,0,'2019-03-28 23:34:39','2019-04-05 19:21:03',NULL,'490a5813-4cc7-4e2b-b9ad-da8afcd43b5b'),
	(149,NULL,'craft\\elements\\Asset',1,0,'2019-03-28 23:37:14','2019-03-28 23:37:14',NULL,'efb71c5b-2d6c-4963-9a79-234a12c7c8ec'),
	(150,NULL,'craft\\elements\\Asset',1,0,'2019-03-28 23:41:10','2019-03-28 23:41:10','2019-03-28 23:41:13','73901ad6-e1f9-449a-9759-8de5d2112161'),
	(151,9,'craft\\elements\\Entry',1,0,'2019-03-28 23:42:39','2019-04-08 23:18:24',NULL,'d61718e4-a62f-4227-9e5b-ba7b237c3d96'),
	(152,NULL,'craft\\elements\\Asset',1,0,'2019-03-28 23:45:37','2019-03-28 23:45:37','2019-03-28 23:45:38','7770c989-d552-4bf0-a22b-cdf93918adc2'),
	(153,NULL,'craft\\elements\\Asset',1,0,'2019-03-28 23:45:43','2019-03-28 23:45:43',NULL,'8847893a-2d4e-4f82-86e1-86c47b5588df'),
	(154,NULL,'craft\\elements\\Asset',1,0,'2019-03-28 23:46:15','2019-03-28 23:46:15',NULL,'3aacb37f-7ce6-4865-987c-8839737ee477'),
	(155,6,'craft\\elements\\MatrixBlock',1,0,'2019-03-28 23:46:27','2019-04-08 23:18:24',NULL,'5b6865bd-3588-4d50-bd72-b45722a413a0'),
	(156,NULL,'craft\\elements\\Asset',1,0,'2019-04-05 19:20:55','2019-04-05 19:20:55','2019-04-05 19:21:04','5ffb1ea3-2fbf-45bc-b105-f14098129b38'),
	(157,NULL,'craft\\elements\\Asset',1,0,'2019-04-05 19:24:43','2019-04-05 19:24:43',NULL,'d8f1d560-7bf0-4fc9-8d0d-6f691a63de4d'),
	(158,NULL,'craft\\elements\\Asset',1,0,'2019-04-05 19:49:18','2019-04-05 19:49:18',NULL,'9e090596-91c1-4b77-a0c4-bc6de192cc99'),
	(159,NULL,'craft\\elements\\Asset',1,0,'2019-04-05 19:57:32','2019-04-05 19:57:32',NULL,'80d3c181-6cf5-4dfb-810d-7cdffa082ad3'),
	(160,6,'craft\\elements\\MatrixBlock',1,0,'2019-04-05 19:57:45','2019-04-08 23:18:24',NULL,'a12c45af-10e2-40a0-9f9c-2ed2fb8d6d28'),
	(161,NULL,'craft\\elements\\Asset',1,0,'2019-04-05 19:59:48','2019-04-05 19:59:48',NULL,'d31249bd-4985-4ab5-9521-714a02dcb12c'),
	(162,NULL,'craft\\elements\\Asset',1,0,'2019-04-05 20:00:12','2019-04-05 20:00:12',NULL,'4cc4d424-efd4-44bd-a67d-3e3114313e74'),
	(163,6,'craft\\elements\\MatrixBlock',1,0,'2019-04-05 20:00:29','2019-04-08 23:18:24',NULL,'bb316513-9707-4d6b-b9b2-61ad05909df5'),
	(164,6,'craft\\elements\\MatrixBlock',1,0,'2019-04-05 20:00:29','2019-04-08 23:18:24',NULL,'25cd14c7-0f37-49b7-9cb4-9ef5a0a73fe6'),
	(165,NULL,'craft\\elements\\Asset',1,0,'2019-04-05 20:01:58','2019-04-05 20:01:58',NULL,'0dfae1c5-dee9-4041-b8d5-b99268940db7'),
	(166,7,'craft\\elements\\Entry',1,0,'2019-04-05 20:07:48','2019-04-08 23:18:24',NULL,'f909ebe8-78de-4d3f-ae94-063fc9b67045'),
	(167,NULL,'craft\\elements\\Asset',1,0,'2019-04-05 20:10:21','2019-04-05 20:10:21',NULL,'0c639a1f-2de1-4fee-96ee-6b7673e6c549'),
	(168,14,'craft\\elements\\Entry',0,0,'2019-04-08 23:19:10','2019-04-08 23:20:11',NULL,'705ba3f7-b9bd-4773-ba10-84b8e829885b'),
	(169,15,'craft\\elements\\GlobalSet',1,0,'2019-04-08 23:35:18','2019-04-08 23:36:37',NULL,'a65e3885-78ca-41f4-9252-fc458b0bf3b6');

/*!40000 ALTER TABLE `craft_elements` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_elements_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_elements_sites`;

CREATE TABLE `craft_elements_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_elements_sites_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `craft_elements_sites_siteId_idx` (`siteId`),
  KEY `craft_elements_sites_slug_siteId_idx` (`slug`,`siteId`),
  KEY `craft_elements_sites_enabled_idx` (`enabled`),
  KEY `craft_elements_sites_uri_siteId_idx` (`uri`,`siteId`),
  CONSTRAINT `craft_elements_sites_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_elements_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_elements_sites` WRITE;
/*!40000 ALTER TABLE `craft_elements_sites` DISABLE KEYS */;

INSERT INTO `craft_elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,1,NULL,NULL,1,'2019-03-06 21:56:09','2019-03-06 21:56:09','08f9c9c3-4ef1-494e-95a4-a73f6b848741'),
	(2,2,1,'home','__home__',1,'2019-03-06 23:09:34','2019-03-07 00:42:29','f665df02-d912-4695-b67e-c307dd16d97f'),
	(3,3,1,NULL,NULL,1,'2019-03-06 23:33:02','2019-03-16 00:05:44','e410d278-8ebf-42db-a93b-b3ea745fb0ce'),
	(4,4,1,'2018',NULL,1,'2019-03-06 23:40:23','2019-04-08 23:18:20','a1431028-27b0-4fb4-b9ca-7ec2b7f3c0e8'),
	(5,5,1,'2018-template-a',NULL,1,'2019-03-06 23:40:36','2019-03-06 23:41:18','6c0b8572-ab2c-44be-be6b-907f571b4358'),
	(6,6,1,NULL,NULL,1,'2019-03-06 23:57:43','2019-03-13 14:43:01','3f6b8f37-7d4b-47d2-a3d6-d2918cfe5bdd'),
	(7,7,1,'2011-component-a-header',NULL,1,'2019-03-06 23:57:51','2019-04-08 23:18:24','e05ed386-b8ad-4dd5-aaa4-40764247a883'),
	(8,8,1,NULL,NULL,1,'2019-03-07 00:10:54','2019-03-13 14:43:02','264611e5-221f-434d-95bc-5047400c184c'),
	(9,9,1,NULL,NULL,1,'2019-03-07 00:13:10','2019-03-13 14:43:03','829de4b3-3c7c-4ce5-8219-2a9beb76b039'),
	(10,10,1,'2011-component-b-detail',NULL,1,'2019-03-07 00:13:37','2019-04-08 23:18:24','21e44c33-9337-47d2-83e8-69ce518a456a'),
	(11,11,1,NULL,NULL,1,'2019-03-07 00:15:15','2019-03-13 14:43:03','1f578dda-4383-41b9-9017-1fe82fc3e866'),
	(12,12,1,NULL,NULL,1,'2019-03-07 00:15:34','2019-03-13 14:43:03','0c3a4f54-77e1-4e47-8133-8f44c62b8c60'),
	(13,13,1,NULL,NULL,1,'2019-03-07 00:15:56','2019-03-13 14:43:04','dd7c4642-726b-45ff-b61e-c96f9ee31c4f'),
	(14,14,1,'2011-component-b-slideshow',NULL,1,'2019-03-07 00:16:37','2019-04-08 23:18:24','6d5ed102-1776-4b0b-83e0-4d190505ac46'),
	(15,15,1,NULL,NULL,1,'2019-03-07 00:16:37','2019-04-08 23:18:21','f3fb8212-b14c-40a5-a549-d0ec408637e6'),
	(16,16,1,NULL,NULL,1,'2019-03-07 00:16:37','2019-04-08 23:18:21','4d724e68-8d85-42b6-b798-5f75d1d7b309'),
	(17,17,1,NULL,NULL,1,'2019-03-07 00:16:37','2019-04-08 23:18:21','fa698038-2d25-4438-b1c5-748bde5d6d37'),
	(18,18,1,NULL,NULL,1,'2019-03-07 00:16:37','2019-04-08 23:18:21','ef960085-fd57-4281-b2f7-6ffa99119bb3'),
	(19,19,1,NULL,NULL,1,'2019-03-07 00:17:37','2019-03-13 14:43:06','e941fd08-f369-42c0-9e85-ec1d43f20c1f'),
	(20,20,1,'2011-component-b-video',NULL,1,'2019-03-07 00:17:52','2019-04-08 23:18:24','c5806983-546c-4ed6-9c44-9bb97ff93483'),
	(21,21,1,'2018',NULL,1,'2019-03-07 00:17:59','2019-04-08 23:18:21','b3c495dc-ed4c-4d10-bb65-76570cc00176'),
	(22,22,1,'2018-component-a-header',NULL,1,'2019-03-07 00:18:46','2019-04-08 23:18:24','3f7716f6-3f28-4ae4-997c-0bd8fef2bfc0'),
	(23,23,1,'2018-component-a-header',NULL,1,'2019-03-07 00:19:56','2019-04-08 23:18:24','afb646d1-77e4-465e-b4e0-42c9d7bbf65f'),
	(24,24,1,NULL,NULL,1,'2019-03-07 01:00:48','2019-03-13 14:43:04','dc00ba0b-45a1-4bc8-b590-e5c6e75bfe2d'),
	(25,25,1,'privacy-policy','privacy-policy',1,'2019-03-07 01:05:09','2019-03-07 01:05:23','dd4ec74c-fa85-4a27-b33f-bd3334930c34'),
	(26,26,1,'2019',NULL,1,'2019-03-12 22:25:53','2019-04-08 23:18:21','8a5f141a-9a01-4bff-a231-3bc3d7ae4562'),
	(27,27,1,'2019-component-a-header',NULL,1,'2019-03-12 22:26:26','2019-04-08 23:18:24','af0ba8ba-9d01-44ef-b507-063eed9e411c'),
	(28,28,1,NULL,NULL,1,'2019-03-13 14:43:01','2019-03-13 14:43:01','02c411af-178b-49a0-9935-06a283fe60ce'),
	(29,29,1,NULL,NULL,1,'2019-03-14 17:21:27','2019-03-14 17:21:27','ed5e508c-2404-42c1-980a-1dd83bf18f30'),
	(30,30,1,NULL,NULL,1,'2019-03-14 17:21:41','2019-03-14 17:21:41','cd7ba1cc-6ac0-4968-9b62-fa0054409a5b'),
	(31,31,1,NULL,NULL,1,'2019-03-14 17:21:47','2019-03-14 17:21:47','a6db3ac1-2691-439d-83f8-8e2d4ab49879'),
	(32,32,1,NULL,NULL,1,'2019-03-14 17:21:54','2019-03-14 17:21:54','200fcfea-9e1e-4b97-82c1-21bfdbbc9caa'),
	(33,33,1,NULL,NULL,1,'2019-03-14 17:21:58','2019-03-14 17:21:58','b78584d7-6c03-4f1b-8809-ff297d54e59f'),
	(34,34,1,NULL,NULL,1,'2019-03-14 17:22:03','2019-03-14 17:22:03','a124bf75-ba64-41b3-8649-03f0b181ae31'),
	(35,35,1,NULL,NULL,1,'2019-03-14 17:22:08','2019-03-14 17:22:08','815587a1-455e-4160-9c7b-b247a2e18377'),
	(36,36,1,NULL,NULL,1,'2019-03-14 17:22:14','2019-03-14 17:22:14','2eb08aae-a9b0-4543-a15c-c47031407564'),
	(37,37,1,NULL,NULL,1,'2019-03-14 17:22:16','2019-03-14 17:22:16','3bd52662-a7d1-43cf-ac2d-91a42d148ff5'),
	(38,38,1,NULL,NULL,1,'2019-03-14 17:22:20','2019-03-14 17:22:20','fd0a710a-ecee-4915-8283-ea64d1ae8bd1'),
	(39,39,1,NULL,NULL,1,'2019-03-14 17:22:25','2019-03-14 17:22:25','eeb4ad2f-f95d-4632-aa18-02aa495f8c14'),
	(40,40,1,NULL,NULL,1,'2019-03-14 17:22:28','2019-03-14 17:22:28','5e690d62-fa8f-460e-8af6-0c14ceffe034'),
	(41,41,1,NULL,NULL,1,'2019-03-14 17:22:35','2019-03-14 17:22:35','9bff971d-f365-4ce0-8191-191fa5dda134'),
	(42,42,1,NULL,NULL,1,'2019-03-14 17:22:55','2019-03-14 17:22:55','e27bc344-8045-46b5-851f-912d28289bdd'),
	(43,43,1,NULL,NULL,1,'2019-03-14 17:23:03','2019-03-14 17:23:03','87280d6a-4caf-4fd6-a28c-19957d931eac'),
	(44,44,1,NULL,NULL,1,'2019-03-14 17:23:04','2019-03-14 17:23:04','90327766-6b2f-4f12-8f59-2c07927d08e9'),
	(45,45,1,NULL,NULL,1,'2019-03-14 17:23:05','2019-03-14 17:23:05','f4138634-f333-4137-a43a-c05b798f98e3'),
	(46,46,1,NULL,NULL,1,'2019-03-14 17:23:08','2019-03-14 17:23:08','36ff89bb-b8e6-4121-89f0-8352c1afc085'),
	(47,47,1,NULL,NULL,1,'2019-03-14 17:23:25','2019-03-14 17:23:25','08386c7c-4b0e-432d-9856-e72a211a8872'),
	(48,48,1,NULL,NULL,1,'2019-03-14 17:23:29','2019-03-14 17:23:29','985a7113-4a31-4d0d-bb96-e549769300b0'),
	(49,49,1,NULL,NULL,1,'2019-03-14 17:23:47','2019-03-14 17:23:47','082e5e97-bf65-4845-a58c-cde52f3f763e'),
	(50,50,1,NULL,NULL,1,'2019-03-14 17:23:55','2019-03-14 17:23:55','80652b59-cbc8-46ba-8915-3117a879d5a9'),
	(51,51,1,NULL,NULL,1,'2019-03-14 17:24:09','2019-03-14 17:24:09','b9c49939-46b6-4a88-b190-e3e1c5c28c94'),
	(52,52,1,NULL,NULL,1,'2019-03-14 17:24:11','2019-03-14 17:24:11','13d023f8-6089-4e0c-92b4-b828d5f1b8cf'),
	(53,53,1,NULL,NULL,1,'2019-03-14 17:24:19','2019-03-14 17:24:19','eabe6db3-f7e0-430e-9204-f148cde461c5'),
	(54,54,1,NULL,NULL,1,'2019-03-14 17:24:26','2019-03-14 17:24:26','4c091230-43cc-4c50-8fcd-e4bd96fc0c9d'),
	(55,55,1,NULL,NULL,1,'2019-03-14 17:24:44','2019-03-14 17:24:44','39fb7631-a8df-48e5-aa04-3539fcc086f3'),
	(56,56,1,NULL,NULL,1,'2019-03-14 17:24:47','2019-03-14 17:24:47','66de9514-b4ba-43d1-8a9f-c9f7f5c68522'),
	(57,57,1,NULL,NULL,1,'2019-03-14 17:24:55','2019-03-14 17:24:55','4d720114-3771-4a4b-bcb7-92beba4cabeb'),
	(58,58,1,NULL,NULL,1,'2019-03-14 17:25:04','2019-03-14 17:25:04','125e4bf2-dbd9-47c7-a73f-930ef7b8a54b'),
	(59,59,1,NULL,NULL,1,'2019-03-14 17:25:21','2019-03-14 17:25:21','d33471e9-2e82-43da-accc-b2f7c0277e79'),
	(60,60,1,NULL,NULL,1,'2019-03-14 17:25:24','2019-03-14 17:25:24','55dd3ebf-ed3b-4c76-901c-91d6b61f8003'),
	(61,61,1,NULL,NULL,1,'2019-03-14 17:25:35','2019-03-14 17:25:35','eaacc846-c9e7-48bd-a1b4-520fe0e2e3f5'),
	(62,62,1,NULL,NULL,1,'2019-03-14 17:25:42','2019-03-14 17:25:42','30688302-6b8d-49e4-8af5-9fd6b9e6b02d'),
	(63,63,1,NULL,NULL,1,'2019-03-14 17:25:54','2019-03-14 17:25:54','fafdd78e-2b3f-4567-b012-d27b95d6162d'),
	(64,64,1,NULL,NULL,1,'2019-03-14 17:25:58','2019-03-14 17:25:58','43973dc7-7959-45d8-9b13-040525a6f188'),
	(65,65,1,NULL,NULL,1,'2019-03-14 17:26:05','2019-03-14 17:26:05','a3b64103-ad86-4b27-94f6-9d4081fabacc'),
	(66,66,1,NULL,NULL,1,'2019-03-14 17:26:15','2019-03-14 17:26:15','e243ce23-964c-42a2-b207-066f201e97db'),
	(67,67,1,NULL,NULL,1,'2019-03-14 17:26:32','2019-03-14 17:26:32','a7d4256c-f856-491a-bc4b-fba062e60765'),
	(68,68,1,NULL,NULL,1,'2019-03-14 17:26:37','2019-03-14 17:26:37','66d90300-9ec2-4230-b803-b0eb7e58c5d9'),
	(69,69,1,NULL,NULL,1,'2019-03-14 17:26:44','2019-03-14 17:26:44','64ce7a7f-973d-443e-a8b6-abc59023d429'),
	(70,70,1,NULL,NULL,1,'2019-03-14 17:26:51','2019-03-14 17:26:51','275ff760-db79-4254-861d-954d959ad585'),
	(71,71,1,NULL,NULL,1,'2019-03-14 17:27:04','2019-03-14 17:27:04','b160243f-ba72-4c61-b61c-c246663b489b'),
	(72,72,1,NULL,NULL,1,'2019-03-14 17:27:08','2019-03-14 17:27:08','c0f84e0b-a86a-4018-9a1d-439c591eb598'),
	(73,73,1,NULL,NULL,1,'2019-03-14 17:27:28','2019-03-14 17:27:28','ce4b872a-372a-4980-9457-df7e9e34329b'),
	(74,74,1,NULL,NULL,1,'2019-03-14 17:27:37','2019-03-14 17:27:37','e2d31a44-1666-484e-b221-47ca1c8a117b'),
	(75,75,1,NULL,NULL,1,'2019-03-14 17:27:47','2019-03-14 17:27:47','698c7430-6967-4c56-9120-5ede3407cfda'),
	(76,76,1,NULL,NULL,1,'2019-03-14 17:27:50','2019-03-14 17:27:50','071c3c63-f864-480d-b91d-ef9e28d71205'),
	(77,77,1,NULL,NULL,1,'2019-03-14 17:27:56','2019-03-14 17:27:56','c844429e-1a8e-485c-ae14-c351a9ff91b8'),
	(78,78,1,NULL,NULL,1,'2019-03-14 17:28:06','2019-03-14 17:28:06','7bbd686a-840b-4437-bf66-063b4cb95a34'),
	(79,79,1,NULL,NULL,1,'2019-03-14 17:28:16','2019-03-14 17:28:16','99a36fbd-cdd3-46d5-b55a-05fed81c68ad'),
	(80,80,1,NULL,NULL,1,'2019-03-14 17:28:18','2019-03-14 17:28:18','4324a936-88fa-4660-bca1-e5f251a86114'),
	(81,81,1,NULL,NULL,1,'2019-03-14 17:28:25','2019-03-14 17:28:25','0dea3a56-187e-4abb-9bda-a600f6f2dfe1'),
	(82,82,1,NULL,NULL,1,'2019-03-14 17:28:33','2019-03-14 17:28:33','ccf245a4-1183-49f3-be3d-95896c1edee0'),
	(83,83,1,NULL,NULL,1,'2019-03-14 17:28:47','2019-03-14 17:28:47','a4275843-999c-48d4-834d-c0a70b2f4022'),
	(84,84,1,NULL,NULL,1,'2019-03-14 17:28:52','2019-03-14 17:28:52','d24b18bb-cbb6-4e4d-bc47-b79511c0618e'),
	(85,85,1,NULL,NULL,1,'2019-03-14 17:29:11','2019-03-14 17:29:11','72ad1382-2bab-4c99-b573-4a73605205e4'),
	(86,86,1,NULL,NULL,1,'2019-03-14 17:29:17','2019-03-14 17:29:17','69a4c20e-79f6-46ce-8d17-c97dfcb0b934'),
	(87,87,1,NULL,NULL,1,'2019-03-14 17:29:22','2019-03-14 17:29:22','4c59e053-9fba-4530-93f8-53b81add7c92'),
	(88,88,1,NULL,NULL,1,'2019-03-14 17:29:24','2019-03-14 17:29:24','084b32a5-613b-4b48-b870-42c63330a60f'),
	(89,89,1,NULL,NULL,1,'2019-03-14 17:29:33','2019-03-14 17:29:33','ce6c4d43-1a93-4f4d-a4b7-c9dde4173f26'),
	(90,90,1,NULL,NULL,1,'2019-03-14 17:29:40','2019-03-14 17:29:40','3576db65-e5d7-4e07-ab91-3eb49d55c5e2'),
	(91,91,1,NULL,NULL,1,'2019-03-14 17:29:47','2019-03-14 17:29:47','4a55da6b-2cab-4c7a-9e9e-598b4eecf97c'),
	(92,92,1,NULL,NULL,1,'2019-03-14 17:29:51','2019-03-14 17:29:51','9fe80d15-1be4-4f6c-a8d8-ea68c2d1654c'),
	(93,93,1,NULL,NULL,1,'2019-03-14 17:29:55','2019-03-14 17:29:55','f67f9749-b878-415a-863e-809e42394f01'),
	(94,94,1,NULL,NULL,1,'2019-03-14 17:30:00','2019-03-14 17:30:00','3af7399c-a04e-4f7c-a005-5ac765e61f67'),
	(95,95,1,'2013',NULL,1,'2019-03-14 17:51:13','2019-04-08 23:18:21','c6210441-a6a2-459b-9a93-776ec6ea03dc'),
	(96,96,1,'2013-component-a-header',NULL,1,'2019-03-14 19:12:07','2019-04-08 23:18:24','a0fd6e09-6515-4ffc-bf65-0350b3c29788'),
	(97,97,1,'2013-component-b-detail',NULL,1,'2019-03-14 19:13:43','2019-04-08 23:18:24','83cebfec-a0a1-4f7c-a389-9ab426c39b21'),
	(98,98,1,'2012',NULL,1,'2019-03-14 19:13:55','2019-04-08 23:18:21','eab29dd4-e9fe-4f2e-8b0c-1997a2750fe2'),
	(99,99,1,'2012-component-a-header',NULL,1,'2019-03-14 19:23:28','2019-04-08 23:18:24','7d19a2e6-0eed-40b6-adee-c573b5230112'),
	(100,100,1,'2012-component-b-detail',NULL,1,'2019-03-14 19:26:49','2019-04-08 23:18:24','60d1ed17-4555-41fd-b6da-947c37163d96'),
	(101,101,1,'2010',NULL,1,'2019-03-14 19:29:49','2019-04-08 23:18:21','8cb147d9-4e0c-4dee-9e17-64a8c20f9ec6'),
	(102,102,1,'2010-component-a-header',NULL,1,'2019-03-14 19:30:29','2019-04-08 23:18:24','bb91a3be-6334-4c53-aade-3fe7e8d91b7c'),
	(103,103,1,'2010-component-b-detail',NULL,1,'2019-03-14 19:31:34','2019-04-08 23:18:24','f36faa69-b1eb-46a4-becb-912bdf6085af'),
	(104,104,1,'2008',NULL,1,'2019-03-14 19:32:05','2019-04-08 23:18:22','03626847-7bca-47d5-b4fd-ef3b9d4e05c7'),
	(105,105,1,'2008-component-a-header-seasilk',NULL,1,'2019-03-14 19:41:04','2019-04-08 23:18:24','45af2a3c-4a69-449f-b19e-08b17bcc8f85'),
	(106,106,1,'2008-component-b-detail-seasilk',NULL,1,'2019-03-14 19:42:08','2019-04-08 23:18:24','12e6cd54-2eb7-41af-b627-f1e39b2a8826'),
	(107,107,1,'2008-component-a-header-hemp',NULL,1,'2019-03-14 19:43:08','2019-04-08 23:18:24','47b34c01-c26d-43a3-aad9-a89476403651'),
	(108,108,1,'2008-component-b-detail-hemp',NULL,1,'2019-03-14 19:44:01','2019-04-08 23:18:24','e741350a-5589-4df9-a46e-f57096a6148d'),
	(109,109,1,'2008-component-a-header-life-ext',NULL,1,'2019-03-14 19:44:51','2019-04-08 23:18:24','f41518de-cf9d-4eef-9ddb-00a23dfc1872'),
	(110,110,1,'2008-component-b-detail-life-ext',NULL,1,'2019-03-14 19:46:09','2019-04-08 23:18:24','ccdf6651-540f-4870-ae4c-3e5358b88b51'),
	(111,111,1,'2007',NULL,1,'2019-03-14 19:46:48','2019-04-08 23:18:22','9eee630e-1424-4751-94f1-99c879143fe9'),
	(112,112,1,'2007-component-a-header',NULL,1,'2019-03-14 19:47:33','2019-04-08 23:18:24','b94d9537-6496-4672-8a17-56c57faf3580'),
	(113,113,1,'2007-component-b-detail',NULL,1,'2019-03-14 19:48:16','2019-04-08 23:18:24','ef34c0b2-5213-4d58-9d55-ad294b1ffc38'),
	(114,114,1,'2005',NULL,1,'2019-03-14 19:48:30','2019-04-08 23:18:22','e097e4ca-14ce-4fbb-8da5-9978d0ec1993'),
	(115,115,1,'2005-component-a-header-truffle',NULL,1,'2019-03-14 19:49:37','2019-04-08 23:18:24','a0982c9e-f635-43e3-ad1b-512560e0b003'),
	(116,116,1,'2005-component-b-detail-truffle',NULL,1,'2019-03-14 19:50:16','2019-04-08 23:18:24','07df9854-127b-476b-88c1-4566005cbdd8'),
	(117,117,1,'2005-component-a-header-caviar',NULL,1,'2019-03-14 19:55:34','2019-04-08 23:18:24','b7831629-18c6-4b71-b002-ab20f555a21c'),
	(118,118,1,'2005-component-b-detail-caviar',NULL,1,'2019-03-14 19:56:26','2019-04-08 23:18:24','070f8731-404c-416c-b320-f46e96b24e35'),
	(119,119,1,'1999',NULL,1,'2019-03-14 19:56:50','2019-04-08 23:18:23','d867679d-1a00-4dae-a2bf-a0000786ec9c'),
	(120,120,1,'1999-component-a-header-antiaging',NULL,1,'2019-03-14 20:00:59','2019-04-08 23:18:24','8f4172f2-a5ce-4b23-9d12-3f1f22a1660d'),
	(121,121,1,'1999-component-b-detail-caviar',NULL,1,'2019-03-14 20:02:09','2019-04-08 23:18:24','4a02cd82-58cd-47de-9f15-db1cf24d9044'),
	(122,122,1,'1999-component-b-video-caviar',NULL,1,'2019-03-14 20:08:23','2019-04-08 23:18:24','ad01fa96-0abe-46bd-8e76-9d2d0edf8625'),
	(123,123,1,'1999-component-a-header-lifeline',NULL,1,'2019-03-14 20:10:28','2019-04-08 23:18:24','759271d0-5a8c-46d6-b1e4-b3a902888a94'),
	(124,124,1,'1999-component-b-detail-lifeline',NULL,1,'2019-03-14 20:11:31','2019-04-08 23:18:24','974fb55b-9530-4a20-ba13-502e452027b0'),
	(125,125,1,'1999-component-b-slideshow-lifeline',NULL,1,'2019-03-14 20:14:02','2019-04-08 23:18:24','75169d76-25dc-4e38-a83d-54bb7a139129'),
	(126,126,1,NULL,NULL,1,'2019-03-14 20:14:02','2019-04-08 23:18:23','e9f31b8f-5db2-4d16-883f-c5ee499fbc08'),
	(127,127,1,NULL,NULL,1,'2019-03-14 20:14:02','2019-04-08 23:18:23','b23797ff-fdab-4ff1-923e-598c80cba49e'),
	(128,128,1,NULL,NULL,1,'2019-03-14 20:14:02','2019-04-08 23:18:23','8a91bc2a-5fcf-48b3-aa32-0af26ded8338'),
	(129,129,1,'1997',NULL,1,'2019-03-14 20:16:31','2019-04-08 23:18:23','7657b9e4-c907-42c4-83d6-2e821e031f2f'),
	(130,130,1,'1997-component-a-header',NULL,1,'2019-03-14 20:17:48','2019-04-08 23:18:24','f0fe2b44-7393-42bc-97a4-edb60026f7a2'),
	(131,131,1,'1997-component-b-detail',NULL,1,'2019-03-14 20:18:57','2019-04-08 23:18:24','9f24b1f0-46be-4ec7-b33e-c769f2d59173'),
	(132,132,1,'2019-component-b-detail',NULL,1,'2019-03-14 20:23:24','2019-04-08 23:18:24','e80d01eb-cd0d-4dde-bb3f-0b32f61355c4'),
	(133,133,1,NULL,NULL,1,'2019-03-14 20:23:24','2019-04-08 23:18:23','a7338b82-75c2-459e-bf19-55113a6ee6ce'),
	(134,134,1,NULL,NULL,1,'2019-03-14 20:23:24','2019-04-08 23:18:23','ecce3187-8529-4689-ad01-8bc533d72fe5'),
	(135,135,1,NULL,NULL,1,'2019-03-14 20:23:24','2019-04-08 23:18:23','d8e9ef49-e73f-44c4-81bc-b7b72be20940'),
	(136,136,1,NULL,NULL,1,'2019-03-15 11:47:24','2019-03-15 11:47:24','dda01cf8-2893-4289-abb4-8b542be22056'),
	(137,137,1,NULL,NULL,1,'2019-03-15 11:47:45','2019-03-15 11:47:45','29c8362d-37d6-4b5e-bca6-6ba9f784fcdd'),
	(138,138,1,'2019-slideshow-testing',NULL,1,'2019-03-18 18:22:58','2019-04-08 23:18:24','730ff3ed-ddad-4bae-b0b6-d060d8f9aba6'),
	(139,139,1,NULL,NULL,1,'2019-03-18 18:22:58','2019-04-08 23:18:24','03527fd4-4a5b-4753-bf42-d539e833aff2'),
	(140,140,1,NULL,NULL,1,'2019-03-18 18:22:58','2019-04-08 23:18:24','d1360ab0-5e3f-4e4b-b316-a18b67fd89c1'),
	(141,141,1,NULL,NULL,1,'2019-03-18 18:22:58','2019-04-08 23:18:24','ce2df07b-a7c1-438d-b734-528f7a36ab42'),
	(142,142,1,NULL,NULL,1,'2019-03-18 18:22:58','2019-04-08 23:18:24','c568275c-0381-441b-85f9-67b67d52b326'),
	(143,143,1,NULL,NULL,1,'2019-03-25 22:05:03','2019-03-27 21:33:19','d7c6fecf-441e-4a75-b285-38125c95d392'),
	(144,144,1,NULL,NULL,1,'2019-03-25 22:05:47','2019-03-27 21:33:19','c870a959-3b11-44a3-8297-6f31fe6b3f5b'),
	(145,145,1,NULL,NULL,1,'2019-03-28 23:24:02','2019-03-28 23:24:02','65b6a8f5-55e4-4c63-8f8d-793bc5bf1620'),
	(146,146,1,NULL,NULL,1,'2019-03-28 23:28:44','2019-03-28 23:30:09','af74a7a8-30b9-4107-98fb-7e35ed95621e'),
	(147,147,1,NULL,NULL,1,'2019-03-28 23:30:05','2019-03-28 23:30:05','5518bfa9-2912-4d26-84cd-361d06c2a285'),
	(148,148,1,NULL,NULL,1,'2019-03-28 23:34:39','2019-04-05 19:21:03','d67d63b9-8ec6-4a4e-84fd-3c916a32b5ce'),
	(149,149,1,NULL,NULL,1,'2019-03-28 23:37:14','2019-03-28 23:37:14','42af6289-8b55-40ff-aa2e-f44fdd5b8f1a'),
	(150,150,1,NULL,NULL,1,'2019-03-28 23:41:10','2019-03-28 23:41:10','260ac542-049f-4f5a-9c4f-cf5ded526e1c'),
	(151,151,1,'2018-component-b-slide',NULL,1,'2019-03-28 23:42:39','2019-04-08 23:18:24','a9fd7c89-20c7-423f-9f5f-fec57d72903b'),
	(152,152,1,NULL,NULL,1,'2019-03-28 23:45:37','2019-03-28 23:45:37','e6a35c2e-9359-4422-a1b6-9aafcd1feb4a'),
	(153,153,1,NULL,NULL,1,'2019-03-28 23:45:43','2019-03-28 23:45:43','3cded524-0f6b-4535-90a9-4128e092e4cb'),
	(154,154,1,NULL,NULL,1,'2019-03-28 23:46:15','2019-03-28 23:46:15','7d147ef1-a8f9-4c2c-8007-5d2459aa93da'),
	(155,155,1,NULL,NULL,1,'2019-03-28 23:46:27','2019-04-08 23:18:24','81874fcb-ea40-4ce8-821d-7d74b26c9115'),
	(156,156,1,NULL,NULL,1,'2019-04-05 19:20:55','2019-04-05 19:20:55','ce0452bb-5bc7-4b21-beba-9c551ee3156d'),
	(157,157,1,NULL,NULL,1,'2019-04-05 19:24:43','2019-04-05 19:24:43','758cb34d-10d0-4da7-976f-12917d2846ed'),
	(158,158,1,NULL,NULL,1,'2019-04-05 19:49:18','2019-04-05 19:49:18','92e21d62-110e-47b2-a589-8b42dc8dec26'),
	(159,159,1,NULL,NULL,1,'2019-04-05 19:57:32','2019-04-05 19:57:32','29fe343f-e087-400d-ae37-550efa2e5ff5'),
	(160,160,1,NULL,NULL,1,'2019-04-05 19:57:45','2019-04-08 23:18:24','e943fa21-eb69-4385-9704-177d0a4cac79'),
	(161,161,1,NULL,NULL,1,'2019-04-05 19:59:48','2019-04-05 19:59:48','3696552d-a246-471b-9fab-dc422f03ccbe'),
	(162,162,1,NULL,NULL,1,'2019-04-05 20:00:12','2019-04-05 20:00:12','a9c2b0d6-e183-4d94-b0b3-3e8d328c2f1b'),
	(163,163,1,NULL,NULL,1,'2019-04-05 20:00:29','2019-04-08 23:18:24','8cc6ce99-4ece-4882-8137-0c1776df8a89'),
	(164,164,1,NULL,NULL,1,'2019-04-05 20:00:29','2019-04-08 23:18:24','2a08a77d-7a71-401f-a8bd-d44a9d1000a9'),
	(165,165,1,NULL,NULL,1,'2019-04-05 20:01:58','2019-04-05 20:01:58','e6316fa1-0ada-46ca-a5c1-34910e461b8b'),
	(166,166,1,'video-test',NULL,1,'2019-04-05 20:07:48','2019-04-08 23:18:24','77f92997-5f94-4f71-99e4-5bf1af49118c'),
	(167,167,1,NULL,NULL,1,'2019-04-05 20:10:21','2019-04-05 20:10:21','6401ae87-ab21-435c-abe8-36bd10878e67'),
	(168,168,1,'homepage',NULL,1,'2019-04-08 23:19:10','2019-04-08 23:20:11','56b45587-7704-41b8-a7ef-fb762feff97d'),
	(169,169,1,NULL,NULL,1,'2019-04-08 23:35:18','2019-04-08 23:36:37','d402e048-1a83-4a0a-ab88-d91c3813f265');

/*!40000 ALTER TABLE `craft_elements_sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_entries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_entries`;

CREATE TABLE `craft_entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_entries_postDate_idx` (`postDate`),
  KEY `craft_entries_expiryDate_idx` (`expiryDate`),
  KEY `craft_entries_authorId_idx` (`authorId`),
  KEY `craft_entries_sectionId_idx` (`sectionId`),
  KEY `craft_entries_typeId_idx` (`typeId`),
  KEY `craft_entries_parentId_fk` (`parentId`),
  CONSTRAINT `craft_entries_authorId_fk` FOREIGN KEY (`authorId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entries_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entries_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `craft_entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_entries_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entries_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `craft_entrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_entries` WRITE;
/*!40000 ALTER TABLE `craft_entries` DISABLE KEYS */;

INSERT INTO `craft_entries` (`id`, `sectionId`, `parentId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `deletedWithEntryType`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(2,1,NULL,1,NULL,'2019-03-06 23:09:00',NULL,NULL,'2019-03-06 23:09:34','2019-03-07 00:42:29','5bade917-dfed-423b-8b78-9be9827f3681'),
	(4,2,NULL,2,1,'2019-03-06 23:40:00',NULL,NULL,'2019-03-06 23:40:23','2019-04-08 23:18:20','bb2e9405-6e93-4db6-8936-4fda40d22c1d'),
	(5,2,4,3,1,'2019-03-06 23:40:00',NULL,1,'2019-03-06 23:40:36','2019-03-06 23:41:18','a08d5a60-ee13-4f43-bcf7-d487f87146e5'),
	(7,2,NULL,7,1,'2019-03-06 23:57:00',NULL,NULL,'2019-03-06 23:57:51','2019-04-08 23:18:20','24e9e49e-3a81-4e17-8c52-82566a214d6d'),
	(10,2,NULL,8,1,'2019-03-07 00:13:00',NULL,NULL,'2019-03-07 00:13:37','2019-04-08 23:18:20','b76b82ca-185a-4693-b200-523531e42bf9'),
	(14,2,NULL,9,1,'2019-03-07 00:16:00',NULL,NULL,'2019-03-07 00:16:37','2019-04-08 23:18:21','9bcf91e1-0259-4cf6-99da-d515ecc92b91'),
	(20,2,NULL,10,1,'2019-03-07 00:17:00',NULL,NULL,'2019-03-07 00:17:52','2019-04-08 23:18:21','245027d7-90cd-4c42-8459-55eab8ed458c'),
	(21,2,NULL,2,1,'2019-03-07 00:17:00',NULL,NULL,'2019-03-07 00:17:59','2019-04-08 23:18:21','17bc3c50-22f8-43e9-8ec7-665005ee839b'),
	(22,2,NULL,7,1,'2019-03-07 00:18:00',NULL,NULL,'2019-03-07 00:18:46','2019-04-08 23:18:21','14ce2c5a-84c8-4a82-9b06-bc7a5e6b88f3'),
	(23,2,NULL,8,1,'2019-03-07 00:19:00',NULL,NULL,'2019-03-07 00:19:56','2019-04-08 23:18:21','024f219c-6ba1-4382-9a09-1d1ba57a39c8'),
	(25,3,NULL,11,NULL,'2019-03-07 01:05:00',NULL,NULL,'2019-03-07 01:05:09','2019-03-07 01:05:23','8435d87c-fbc6-462a-9871-f89e5bfba757'),
	(26,2,NULL,2,1,'2019-03-12 22:25:00',NULL,NULL,'2019-03-12 22:25:53','2019-04-08 23:18:21','c0b76ca2-0f9d-420b-95e3-16871f1bb0af'),
	(27,2,NULL,10,1,'2019-03-12 22:26:00',NULL,NULL,'2019-03-12 22:26:26','2019-04-08 23:18:21','9039ba5d-10db-4b26-aa15-603d6547ba8d'),
	(95,2,NULL,2,1,'2019-03-14 17:51:00',NULL,NULL,'2019-03-14 17:51:13','2019-04-08 23:18:21','99f8b51f-5b40-417c-a6a4-71fc07a37b3a'),
	(96,2,NULL,7,1,'2019-03-14 19:12:00',NULL,NULL,'2019-03-14 19:12:07','2019-04-08 23:18:21','09ba3f94-c9ac-4baa-b98c-f8e31f3b0fd3'),
	(97,2,NULL,8,1,'2019-03-14 19:13:00',NULL,NULL,'2019-03-14 19:13:43','2019-04-08 23:18:21','a89acbad-5967-4c69-a9d3-cc148276ef4a'),
	(98,2,NULL,2,1,'2019-03-14 19:13:00',NULL,NULL,'2019-03-14 19:13:55','2019-04-08 23:18:21','5c754757-c920-4b42-a05f-204a3bff2beb'),
	(99,2,NULL,7,1,'2019-03-14 19:23:00',NULL,NULL,'2019-03-14 19:23:28','2019-04-08 23:18:21','5c7651c8-c916-4135-b382-ecd40af6c433'),
	(100,2,NULL,8,1,'2019-03-14 19:26:00',NULL,NULL,'2019-03-14 19:26:49','2019-04-08 23:18:21','5d0b2318-417c-465c-a8ce-ee5eb6905b4c'),
	(101,2,NULL,2,1,'2019-03-14 19:29:00',NULL,NULL,'2019-03-14 19:29:49','2019-04-08 23:18:21','160fa631-f9a5-4bd3-9d19-71bd3d6db081'),
	(102,2,NULL,7,1,'2019-03-14 19:30:00',NULL,NULL,'2019-03-14 19:30:29','2019-04-08 23:18:21','4a49a770-b777-4019-9c58-67b92216ecb2'),
	(103,2,NULL,8,1,'2019-03-14 19:31:00',NULL,NULL,'2019-03-14 19:31:34','2019-04-08 23:18:22','28840a1a-6580-4b73-aea3-bab1296f884e'),
	(104,2,NULL,2,1,'2019-03-14 19:32:00',NULL,NULL,'2019-03-14 19:32:05','2019-04-08 23:18:22','d633d2cf-8604-4836-91a9-c4ac414395f5'),
	(105,2,NULL,7,1,'2019-03-14 19:41:00',NULL,NULL,'2019-03-14 19:41:04','2019-04-08 23:18:22','7bdc9877-b19d-414a-b0c0-cebac0a6fd21'),
	(106,2,NULL,8,1,'2019-03-14 19:42:00',NULL,NULL,'2019-03-14 19:42:08','2019-04-08 23:18:22','023be1e5-68f2-46f5-b039-02221872675b'),
	(107,2,NULL,7,1,'2019-03-14 19:43:00',NULL,NULL,'2019-03-14 19:43:08','2019-04-08 23:18:22','44da3261-7dc1-46f7-917f-446ba17622f1'),
	(108,2,NULL,8,1,'2019-03-14 19:44:00',NULL,NULL,'2019-03-14 19:44:01','2019-04-08 23:18:22','6f7bac61-25c6-49de-ab8d-d6c9f0067a36'),
	(109,2,NULL,7,1,'2019-03-14 19:44:00',NULL,NULL,'2019-03-14 19:44:51','2019-04-08 23:18:22','70fc5fe1-e2c9-467e-a658-662c1b7f1af1'),
	(110,2,NULL,8,1,'2019-03-14 19:46:00',NULL,NULL,'2019-03-14 19:46:09','2019-04-08 23:18:22','89168a3a-ddb5-44c5-b650-b009f31340f6'),
	(111,2,NULL,2,1,'2019-03-14 19:46:00',NULL,NULL,'2019-03-14 19:46:48','2019-04-08 23:18:22','f6a9a20b-0f78-48e0-8ea8-aac9fe46dff8'),
	(112,2,NULL,7,1,'2019-03-14 19:47:00',NULL,NULL,'2019-03-14 19:47:33','2019-04-08 23:18:22','921550d3-1092-462d-a77e-0dbb267f8dbd'),
	(113,2,NULL,8,1,'2019-03-14 19:48:00',NULL,NULL,'2019-03-14 19:48:16','2019-04-08 23:18:22','35c224dc-6670-47b6-adfc-f605503b2411'),
	(114,2,NULL,2,1,'2019-03-14 19:48:00',NULL,NULL,'2019-03-14 19:48:30','2019-04-08 23:18:22','4c938412-cc2d-4c40-a9d5-9ab31dd4026a'),
	(115,2,NULL,7,1,'2019-03-14 19:49:00',NULL,NULL,'2019-03-14 19:49:37','2019-04-08 23:18:22','af9ee611-776d-4dbd-ab3e-1977ce6be3bb'),
	(116,2,NULL,8,1,'2019-03-14 19:50:00',NULL,NULL,'2019-03-14 19:50:16','2019-04-08 23:18:22','f76f8c80-3d07-43d7-9c1d-a37cd61744e8'),
	(117,2,NULL,7,1,'2019-03-14 19:55:00',NULL,NULL,'2019-03-14 19:55:34','2019-04-08 23:18:22','ed2187ed-2d9a-4416-b0a3-24cdc44f03d8'),
	(118,2,NULL,8,1,'2019-03-14 19:56:00',NULL,NULL,'2019-03-14 19:56:26','2019-04-08 23:18:23','5b304a45-9bce-4507-ab29-11b74d8d6bed'),
	(119,2,NULL,2,1,'2019-03-14 19:56:00',NULL,NULL,'2019-03-14 19:56:50','2019-04-08 23:18:23','f15f5f5c-c541-47d8-a9a1-d08fd6a41207'),
	(120,2,NULL,7,1,'2019-03-14 20:00:00',NULL,NULL,'2019-03-14 20:00:59','2019-04-08 23:18:23','7506f28e-2660-4f37-82de-bad30f28c798'),
	(121,2,NULL,8,1,'2019-03-14 20:02:00',NULL,NULL,'2019-03-14 20:02:09','2019-04-08 23:18:23','4f24323b-0ee5-4729-a980-e7cbb361c35d'),
	(122,2,NULL,10,1,'2019-03-14 20:08:00',NULL,NULL,'2019-03-14 20:08:23','2019-04-08 23:18:23','0fca9a15-d9de-40c6-92ab-052294dc3931'),
	(123,2,NULL,7,1,'2019-03-14 20:10:00',NULL,NULL,'2019-03-14 20:10:28','2019-04-08 23:18:23','7a1da467-468f-415c-bab1-d7da4881478f'),
	(124,2,NULL,8,1,'2019-03-14 20:11:00',NULL,NULL,'2019-03-14 20:11:31','2019-04-08 23:18:23','9bf792bb-f785-4e42-b10f-998e076acbb6'),
	(125,2,NULL,9,1,'2019-03-14 20:14:00',NULL,NULL,'2019-03-14 20:14:02','2019-04-08 23:18:23','6ec6c693-3f1a-43cc-942e-4e3015dad71f'),
	(129,2,NULL,2,1,'2019-03-14 20:16:00',NULL,NULL,'2019-03-14 20:16:32','2019-04-08 23:18:23','c70e7a0d-37f8-4347-8701-04a728662aa8'),
	(130,2,NULL,7,1,'2019-03-14 20:17:00',NULL,NULL,'2019-03-14 20:17:48','2019-04-08 23:18:23','ca656e9b-434a-4390-90be-9e8442c37002'),
	(131,2,NULL,8,1,'2019-03-14 20:18:00',NULL,NULL,'2019-03-14 20:18:57','2019-04-08 23:18:23','bce414a8-72dc-4d88-83d9-34cf74b59d72'),
	(132,2,NULL,9,1,'2019-03-14 20:23:00',NULL,NULL,'2019-03-14 20:23:24','2019-04-08 23:18:23','cfd0a04f-6364-4201-8005-c1687e529ac8'),
	(138,2,NULL,9,1,'2019-03-18 18:22:00',NULL,NULL,'2019-03-18 18:22:58','2019-04-08 23:18:23','d97ef3cf-2b64-41b4-a834-7fcdaec10e49'),
	(151,2,NULL,9,1,'2019-03-28 23:42:00',NULL,NULL,'2019-03-28 23:42:39','2019-04-08 23:18:24','c8451d1a-4182-43cc-aceb-bc24649fe01c'),
	(166,2,NULL,7,1,'2019-04-05 20:07:00',NULL,NULL,'2019-04-05 20:07:48','2019-04-08 23:18:24','50544399-d2f7-458d-b1f9-780264df8a10'),
	(168,2,NULL,12,1,'2019-04-08 23:19:00',NULL,NULL,'2019-04-08 23:19:10','2019-04-08 23:20:11','e1593783-1006-4ddb-bc75-5b03e22936ab');

/*!40000 ALTER TABLE `craft_entries` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_entrydrafts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_entrydrafts`;

CREATE TABLE `craft_entrydrafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `notes` text,
  `data` mediumtext NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_entrydrafts_sectionId_idx` (`sectionId`),
  KEY `craft_entrydrafts_entryId_siteId_idx` (`entryId`,`siteId`),
  KEY `craft_entrydrafts_siteId_idx` (`siteId`),
  KEY `craft_entrydrafts_creatorId_idx` (`creatorId`),
  CONSTRAINT `craft_entrydrafts_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entrydrafts_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `craft_entries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entrydrafts_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entrydrafts_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table craft_entrytypes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_entrytypes`;

CREATE TABLE `craft_entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleLabel` varchar(255) DEFAULT 'Title',
  `titleFormat` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_entrytypes_name_sectionId_idx` (`name`,`sectionId`),
  KEY `craft_entrytypes_handle_sectionId_idx` (`handle`,`sectionId`),
  KEY `craft_entrytypes_sectionId_idx` (`sectionId`),
  KEY `craft_entrytypes_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `craft_entrytypes_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `craft_entrytypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_entrytypes_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_entrytypes` WRITE;
/*!40000 ALTER TABLE `craft_entrytypes` DISABLE KEYS */;

INSERT INTO `craft_entrytypes` (`id`, `sectionId`, `fieldLayoutId`, `name`, `handle`, `hasTitleField`, `titleLabel`, `titleFormat`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,1,1,'Home','home',0,'','{section.name|raw}',1,'2019-03-06 23:09:34','2019-03-06 23:09:43',NULL,'1c64d15b-1c01-4bac-bb0c-c3ca0faf1faf'),
	(2,2,3,'Year','year',1,'Title','',1,'2019-03-06 23:37:20','2019-03-06 23:39:53',NULL,'54a50af0-855a-4ab8-8d10-ff894e820e77'),
	(3,2,4,'template A','templateA',1,'Title','',2,'2019-03-06 23:37:49','2019-03-06 23:40:04','2019-03-06 23:54:50','e8974cfa-0030-4ae9-be84-1279ea9a8f54'),
	(4,2,5,'template B1','templateB1',1,'Title','',3,'2019-03-06 23:37:56','2019-03-06 23:40:09','2019-03-06 23:54:52','d16f730a-14b1-4101-85f6-f012cd413cee'),
	(5,2,NULL,'template B2','templateB2',1,'Title','',4,'2019-03-06 23:38:00','2019-03-06 23:38:00','2019-03-06 23:54:54','4a620e28-8756-4ac1-ac90-d8e2eef4704c'),
	(6,2,NULL,'template B3','templateB3',1,'Title','',5,'2019-03-06 23:38:07','2019-03-06 23:38:07','2019-03-06 23:54:56','afb0b76c-2b2c-4c67-93f5-d99e84fbe892'),
	(7,2,7,'Component A - Header','componentAHeader',1,'Title','',6,'2019-03-06 23:55:47','2019-03-07 00:40:12',NULL,'97a87380-6e7c-47cd-9207-8a8ee76196f9'),
	(8,2,8,'Component B - Detail','componentBDetail',1,'Title','',7,'2019-03-07 00:05:25','2019-03-07 00:05:25',NULL,'978e2015-f876-4db7-8222-5ebb4f978c9e'),
	(9,2,9,'Component B - Slideshow','componentBSlideshow',1,'Title','',8,'2019-03-07 00:06:51','2019-03-15 09:34:13',NULL,'2b71dd91-e5b0-4cb4-80ee-627f7eba4f7a'),
	(10,2,10,'Component B - Video','componentBVideo',1,'Title','',9,'2019-03-07 00:07:44','2019-03-15 10:34:57',NULL,'41867173-852a-4d04-b62a-0695757102e2'),
	(11,3,11,'Privacy Policy','privacyPolicy',0,'','{section.name|raw}',1,'2019-03-07 01:05:09','2019-03-07 01:05:22',NULL,'c3b53ebe-68b9-4e9f-9a3d-2865d6ce0fec'),
	(12,2,14,'Homepage','homepage',1,'Title','',10,'2019-04-08 23:18:20','2019-04-08 23:18:20',NULL,'fddfa8ef-088e-43a7-96e5-7d52c087249b');

/*!40000 ALTER TABLE `craft_entrytypes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_entryversions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_entryversions`;

CREATE TABLE `craft_entryversions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `siteId` int(11) NOT NULL,
  `num` smallint(6) unsigned NOT NULL,
  `notes` text,
  `data` mediumtext NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_entryversions_sectionId_idx` (`sectionId`),
  KEY `craft_entryversions_entryId_siteId_idx` (`entryId`,`siteId`),
  KEY `craft_entryversions_siteId_idx` (`siteId`),
  KEY `craft_entryversions_creatorId_idx` (`creatorId`),
  CONSTRAINT `craft_entryversions_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_entryversions_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `craft_entries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entryversions_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entryversions_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_entryversions` WRITE;
/*!40000 ALTER TABLE `craft_entryversions` DISABLE KEYS */;

INSERT INTO `craft_entryversions` (`id`, `entryId`, `sectionId`, `creatorId`, `siteId`, `num`, `notes`, `data`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,2,1,1,1,1,'Revision from Mar 6, 2019, 3:09:43 PM','{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Home\",\"slug\":\"home\",\"postDate\":1551913740,\"expiryDate\":null,\"enabled\":\"1\",\"newParentId\":null,\"fields\":[]}','2019-03-06 23:09:48','2019-03-06 23:09:48','3e488219-5397-41b8-b3e0-f669014c87a0'),
	(2,2,1,1,1,2,'','{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Home\",\"slug\":\"home\",\"postDate\":1551913740,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"1\":\"Hi\"}}','2019-03-06 23:09:48','2019-03-06 23:09:48','da45f064-b689-4b01-9212-54f400454f92'),
	(3,4,2,1,1,1,'','{\"typeId\":\"2\",\"authorId\":\"1\",\"title\":\"2018\",\"slug\":\"2018\",\"postDate\":1551915600,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"\",\"fields\":{\"5\":\"2018\"}}','2019-03-06 23:40:23','2019-03-06 23:40:23','ebf4dde3-8578-49bc-8da7-3d92adf5d44a'),
	(4,5,2,1,1,1,'','{\"typeId\":\"3\",\"authorId\":\"1\",\"title\":\"2018 Template A\",\"slug\":\"2018-template-a\",\"postDate\":1551915600,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"\",\"fields\":{\"1\":\"asdasd\"}}','2019-03-06 23:40:36','2019-03-06 23:40:36','202dad60-8a05-43a6-a26d-280c625434b5'),
	(5,5,2,1,1,2,'','{\"typeId\":\"3\",\"authorId\":\"1\",\"title\":\"2018 Template A\",\"slug\":\"2018-template-a\",\"postDate\":1551915600,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"4\",\"fields\":{\"1\":\"asdasd\"}}','2019-03-06 23:40:44','2019-03-06 23:40:44','0f2b9174-c94f-4c7c-b389-cf7c30b12bcd'),
	(6,7,2,1,1,1,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"2011 Component A - Header\",\"slug\":\"2011-component-a-header\",\"postDate\":1551916620,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"4\",\"fields\":{\"7\":[\"6\"],\"6\":\"Fast Bamboo Growth\"}}','2019-03-06 23:57:51','2019-03-06 23:57:51','352966aa-086e-436d-80a1-15533b731b0d'),
	(7,4,2,1,1,2,'','{\"typeId\":\"2\",\"authorId\":\"1\",\"title\":\"2011\",\"slug\":\"2018\",\"postDate\":1551915600,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"\",\"fields\":[]}','2019-03-06 23:57:57','2019-03-06 23:57:57','53c83414-2359-4b34-bcf7-be91d472677f'),
	(8,10,2,1,1,1,'','{\"typeId\":\"8\",\"authorId\":\"1\",\"title\":\"2011 Component B - Detail\",\"slug\":\"2011-component-b-detail\",\"postDate\":1551917580,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"4\",\"fields\":{\"8\":\"An alternative vision born in salons: premium hair products free of additives or harsh ingredients. And a revolution in haircare was born...Alterna. A trailblazer in the world of luxury haircare\",\"7\":[\"6\"],\"11\":[\"8\"],\"10\":\"Since inception, Alterna has provided high performance products inspired by the science of skincare. With proprietary technology such as Age Control Complex and Plumping Marine Complex, we are dedicated to bring our discerning stylists and consumers the best technology in haircare.\",\"9\":\"The Science of Skincare\",\"6\":\"Alterna Brand Launches\",\"12\":[\"9\"]}}','2019-03-07 00:13:37','2019-03-07 00:13:37','3c019428-a16e-4751-87a3-e7da79cd20f4'),
	(9,14,2,1,1,1,'','{\"typeId\":\"9\",\"authorId\":\"1\",\"title\":\"2011 Component B - Slideshow\",\"slug\":\"2011-component-b-slideshow\",\"postDate\":1551917760,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"4\",\"fields\":{\"6\":\"Alterna Brand Launches\",\"14\":{\"15\":{\"type\":\"slide\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"11\"],\"caption\":\"Since inception, Alterna has provided high performance products inspired by\"}},\"16\":{\"type\":\"slide\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"12\"],\"caption\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\"}},\"17\":{\"type\":\"slide\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"13\"],\"caption\":\"Since inception, Alterna has provided high performance products inspired\"}},\"18\":{\"type\":\"slide\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"11\"],\"caption\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\"}}},\"13\":\"Collection\"}}','2019-03-07 00:16:37','2019-03-07 00:16:37','19db3c8c-603d-4ac3-882b-9f946d026f88'),
	(10,20,2,1,1,1,'','{\"typeId\":\"10\",\"authorId\":\"1\",\"title\":\"2011 Component B - Video\",\"slug\":\"2011-component-b-video\",\"postDate\":1551917820,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"4\",\"fields\":{\"7\":[\"19\"],\"6\":\"Alterna Brand Launches\",\"12\":[\"9\"]}}','2019-03-07 00:17:52','2019-03-07 00:17:52','6479901a-25c9-4f2c-8f75-fdf436ae4dd9'),
	(11,21,2,1,1,1,'','{\"typeId\":\"2\",\"authorId\":\"1\",\"title\":\"2018\",\"slug\":\"2018\",\"postDate\":1551917820,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"\",\"fields\":[]}','2019-03-07 00:17:59','2019-03-07 00:17:59','5ef19a2b-6b2d-47c1-a945-d818eeb3d952'),
	(12,22,2,1,1,1,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"2018 Component A - Header\",\"slug\":\"2018-component-a-header\",\"postDate\":1551917880,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"\",\"fields\":{\"7\":[\"6\"],\"6\":\"Bamboo On The Beach\"}}','2019-03-07 00:18:46','2019-03-07 00:18:46','6770da37-c86a-42db-a673-a14ceba0945d'),
	(13,22,2,1,1,2,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"2018 Component A - Header\",\"slug\":\"2018-component-a-header\",\"postDate\":1551917880,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"21\",\"fields\":{\"7\":[\"6\"],\"6\":\"Bamboo On The Beach\"}}','2019-03-07 00:19:24','2019-03-07 00:19:24','5d737503-cd6e-4fd8-869b-72dbff112ab8'),
	(14,23,2,1,1,1,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"2018 Component A - Header\",\"slug\":\"2018-component-a-header\",\"postDate\":1551917940,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"\",\"fields\":{\"7\":[\"12\"],\"6\":\"Bamboo On The Beach\"}}','2019-03-07 00:19:56','2019-03-07 00:19:56','4a567460-e711-4642-8cb4-91f6de7405be'),
	(15,23,2,1,1,2,'','{\"typeId\":\"8\",\"authorId\":\"1\",\"title\":\"2018 Component A - Header\",\"slug\":\"2018-component-a-header\",\"postDate\":1551917940,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"21\",\"fields\":{\"8\":\"Cupiditate esse id cumque reprehenderit nulla est facilis. Aliquid quae est modi ipsum mollitia repellendus voluptas. Iste ducimus ea sed voluptate occaecati nisi aspernatur. Officia blanditiis corrupti illo sit.\",\"7\":[\"12\"],\"11\":[\"19\"],\"10\":\"Cupiditate esse id cumque reprehenderit nulla est facilis. Aliquid quae est modi ipsum mollitia repellendus voluptas. Iste ducimus ea sed voluptate occaecati nisi aspernatur. Officia blanditiis corrupti illo sit.Cupiditate esse id cumque reprehenderit nulla est facilis. Aliquid quae est modi ipsum mollitia repellendus voluptas. Iste ducimus ea sed voluptate occaecati nisi aspernatur. Officia blanditiis corrupti illo sit.\",\"9\":\"Cupiditate esse id cumque reprehenderit nulla est facilis. Aliquid quae est mo\",\"6\":\"Bamboo On The Beach\",\"12\":[\"13\"]}}','2019-03-07 00:20:43','2019-03-07 00:20:43','4b5f5231-b6de-40b2-9690-ca556a795162'),
	(16,7,2,1,1,2,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"2011 Component A - Header\",\"slug\":\"2011-component-a-header\",\"postDate\":1551916620,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"4\",\"fields\":{\"7\":[\"6\"],\"11\":[\"8\"],\"17\":[\"12\"],\"6\":\"Fast Bamboo Growth\"}}','2019-03-07 00:41:01','2019-03-07 00:41:01','3f65d6ce-120e-476b-904a-207ec09f9ce7'),
	(17,22,2,1,1,3,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"2018 Component A - Header\",\"slug\":\"2018-component-a-header\",\"postDate\":1551917880,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"21\",\"fields\":{\"7\":[\"6\"],\"11\":[\"8\"],\"17\":[\"11\"],\"6\":\"Bamboo On The Beach\"}}','2019-03-07 00:41:11','2019-03-07 00:41:11','a0e243ab-a62c-4732-b51f-0c40728c8140'),
	(18,2,1,1,1,3,'','{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Home\",\"slug\":\"home\",\"postDate\":1551913740,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"1\":\"Alterna Haircare\"}}','2019-03-07 00:42:29','2019-03-07 00:42:29','c9e7758f-e899-4adc-b019-b798b35f6d4e'),
	(19,7,2,1,1,3,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"2011 Component A - Header\",\"slug\":\"2011-component-a-header\",\"postDate\":1551916620,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"4\",\"fields\":{\"7\":[\"6\"],\"11\":[\"8\"],\"17\":[\"24\"],\"6\":\"Fast Bamboo Growth\"}}','2019-03-07 01:01:20','2019-03-07 01:01:20','e5bfa1d1-a615-40b5-af3f-660a0b2836f6'),
	(20,22,2,1,1,4,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"2018 Component A - Header\",\"slug\":\"2018-component-a-header\",\"postDate\":1551917880,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"21\",\"fields\":{\"7\":[\"6\"],\"11\":[\"8\"],\"17\":[\"24\"],\"6\":\"Bamboo On The Beach\"}}','2019-03-07 01:01:36','2019-03-07 01:01:36','10f6751d-c264-45d0-9ff1-2cfe18020d3a'),
	(21,23,2,1,1,3,'','{\"typeId\":\"8\",\"authorId\":\"1\",\"title\":\"2018 Component B - Detail\",\"slug\":\"2018-component-a-header\",\"postDate\":1551917940,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"21\",\"fields\":{\"8\":\"Cupiditate esse id cumque reprehenderit nulla est facilis. Aliquid quae est modi ipsum mollitia repellendus voluptas. Iste ducimus ea sed voluptate occaecati nisi aspernatur. Officia blanditiis corrupti illo sit.\",\"7\":[\"12\"],\"11\":[\"19\"],\"10\":\"Cupiditate esse id cumque reprehenderit nulla est facilis. Aliquid quae est modi ipsum mollitia repellendus voluptas. Iste ducimus ea sed voluptate occaecati nisi aspernatur. Officia blanditiis corrupti illo sit.Cupiditate esse id cumque reprehenderit nulla est facilis. Aliquid quae est modi ipsum mollitia repellendus voluptas. Iste ducimus ea sed voluptate occaecati nisi aspernatur. Officia blanditiis corrupti illo sit.\",\"9\":\"Cupiditate esse id cumque reprehenderit nulla est facilis. Aliquid quae est mo\",\"6\":\"Bamboo On The Beach\",\"12\":[\"13\"]}}','2019-03-07 01:01:48','2019-03-07 01:01:48','b0f6171c-84a8-4d7b-bb0d-a0ad3cc6327d'),
	(22,26,2,1,1,1,'','{\"typeId\":\"2\",\"authorId\":\"1\",\"title\":\"2019\",\"slug\":\"2019\",\"postDate\":1552429500,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"\",\"fields\":[]}','2019-03-12 22:25:53','2019-03-12 22:25:53','03baaf41-3082-43b2-8630-94c2442259e3'),
	(23,27,2,1,1,1,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"2019 - Component A - Header\",\"slug\":\"2019-component-a-header\",\"postDate\":1552429560,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"\",\"fields\":{\"7\":[],\"11\":[],\"17\":[]}}','2019-03-12 22:26:26','2019-03-12 22:26:26','36fe9695-e6d8-4401-b667-ee5fda8cbd69'),
	(24,23,2,1,1,4,'','{\"typeId\":\"8\",\"authorId\":\"1\",\"title\":\"2018 Component B - Detail\",\"slug\":\"2018-component-a-header\",\"postDate\":1551917940,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"21\",\"fields\":{\"8\":\"The most exclusive product demands a sophisticated packaging update to reflect its balanced nature. Old formula. New styles.\",\"7\":[\"12\"],\"11\":[\"19\"],\"10\":\"Celebrating nearly 20 years of Caviar success, Alterna relaunched the collection with a new look and consistent color palette across all products. In addition, the company introduced a new Caviar Anti-Aging Restructuring Bond Repair product line, aimed at helping to reverse the hair damage from heat styling, free radicals, and excessive coloring.\",\"6\":\"Caviar Anti-Aging Restage\",\"12\":[\"13\"]}}','2019-03-14 17:40:32','2019-03-14 17:40:32','70edd86f-2417-468b-be74-4679dfc330e3'),
	(25,22,2,1,1,5,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"2018 Component A - Header\",\"slug\":\"2018-component-a-header\",\"postDate\":1551917880,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"21\",\"fields\":{\"7\":[\"87\"],\"11\":[\"8\"],\"17\":[\"24\"],\"6\":\"Caviar Anti-Aging Restage\"}}','2019-03-14 17:49:44','2019-03-14 17:49:44','09b8cd7a-2ebb-4f3d-82da-8cdb3d776bc6'),
	(26,95,2,1,1,1,'','{\"typeId\":\"2\",\"authorId\":\"1\",\"title\":\"2017\",\"slug\":\"2017\",\"postDate\":1552585860,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"\",\"fields\":[]}','2019-03-14 17:51:13','2019-03-14 17:51:13','1786fd57-63b7-4b65-8afc-75a0d6f59882'),
	(27,95,2,1,1,2,'','{\"typeId\":\"2\",\"authorId\":\"1\",\"title\":\"2013\",\"slug\":\"2017\",\"postDate\":1552585860,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"\",\"fields\":[]}','2019-03-14 17:51:52','2019-03-14 17:51:52','3c14566b-458e-49b7-9c1b-fe47d24f9944'),
	(28,95,2,1,1,3,'','{\"typeId\":\"2\",\"authorId\":\"1\",\"title\":\"2013\",\"slug\":\"2013\",\"postDate\":1552585860,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"\",\"fields\":[]}','2019-03-14 17:51:58','2019-03-14 17:51:58','ead7fd09-028a-471b-9b19-5e4e25a15b4c'),
	(29,96,2,1,1,1,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"2013 - Component A - Header\",\"slug\":\"2013-component-a-header\",\"postDate\":1552590720,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"\",\"fields\":{\"7\":[\"83\"],\"11\":[\"84\"],\"17\":[\"86\"],\"6\":\"Bamboo On The Beach\"}}','2019-03-14 19:12:07','2019-03-14 19:12:07','30ffe475-9aba-4b50-a084-396d569a2577'),
	(30,97,2,1,1,1,'','{\"typeId\":\"8\",\"authorId\":\"1\",\"title\":\"2013 - Component B - Detail\",\"slug\":\"2013-component-b-detail\",\"postDate\":1552590780,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"\",\"fields\":{\"8\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\",\"7\":[\"83\"],\"11\":[\"84\"],\"10\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\",\"6\":\"Bamboo On The Beach\",\"12\":[\"85\"]}}','2019-03-14 19:13:43','2019-03-14 19:13:43','25173d3d-0f1e-4c67-9077-3f30c32fc8a1'),
	(31,98,2,1,1,1,'','{\"typeId\":\"2\",\"authorId\":\"1\",\"title\":\"2012\",\"slug\":\"2012\",\"postDate\":1552590780,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"\",\"fields\":[]}','2019-03-14 19:13:55','2019-03-14 19:13:55','c1dc2857-7a40-41b0-8d55-d685fdef2267'),
	(32,99,2,1,1,1,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"2012 - Component A - Header\",\"slug\":\"2012-component-a-header\",\"postDate\":1552591380,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"\",\"fields\":{\"7\":[\"79\"],\"11\":[\"80\"],\"17\":[\"82\"],\"6\":\"New Bamboo In Style\"}}','2019-03-14 19:23:28','2019-03-14 19:23:28','3e400676-9075-4dcd-a9e4-13e1a794188f'),
	(33,100,2,1,1,1,'','{\"typeId\":\"8\",\"authorId\":\"1\",\"title\":\"2012 - Component B - Detail\",\"slug\":\"2012-component-b-detail\",\"postDate\":1552591560,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"\",\"fields\":{\"8\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\",\"7\":[\"79\"],\"11\":[\"80\"],\"10\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\",\"6\":\"New Bamboo In Style\",\"12\":[\"81\"]}}','2019-03-14 19:26:49','2019-03-14 19:26:49','34a5b2b4-a999-4bd5-82b3-47e267a3073e'),
	(34,7,2,1,1,4,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"2011 Component A - Header\",\"slug\":\"2011-component-a-header\",\"postDate\":1551916620,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"4\",\"fields\":{\"7\":[\"75\"],\"11\":[\"76\"],\"17\":[\"78\"],\"6\":\"Fast Bamboo Growth\"}}','2019-03-14 19:27:29','2019-03-14 19:27:29','63db1ba6-c892-41c9-944e-704a6b9190a0'),
	(35,10,2,1,1,2,'','{\"typeId\":\"8\",\"authorId\":\"1\",\"title\":\"2011 Component B - Detail\",\"slug\":\"2011-component-b-detail\",\"postDate\":1551917580,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"4\",\"fields\":{\"8\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\",\"7\":[\"75\"],\"11\":[\"76\"],\"10\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\",\"6\":\"Fast Bamboo Growth\",\"12\":[\"77\"]}}','2019-03-14 19:29:01','2019-03-14 19:29:01','ca5c2395-5124-4f3e-b258-088164ec96c7'),
	(36,101,2,1,1,1,'','{\"typeId\":\"2\",\"authorId\":\"1\",\"title\":\"2010\",\"slug\":\"2010\",\"postDate\":1552591740,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"\",\"fields\":[]}','2019-03-14 19:29:49','2019-03-14 19:29:49','f67abe82-7450-4b30-bf71-1730d29c2613'),
	(37,102,2,1,1,1,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"2010 - Component A - Header\",\"slug\":\"2010-component-a-header\",\"postDate\":1552591800,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"101\",\"fields\":{\"7\":[\"71\"],\"11\":[\"72\"],\"17\":[\"74\"],\"6\":\"The Bamboo Strength\"}}','2019-03-14 19:30:29','2019-03-14 19:30:29','8176b758-7aeb-4ef9-9d16-728ba970b40e'),
	(38,103,2,1,1,1,'','{\"typeId\":\"8\",\"authorId\":\"1\",\"title\":\"2010 - Component B - Detail\",\"slug\":\"2010-component-b-detail\",\"postDate\":1552591860,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"101\",\"fields\":{\"8\":\"Infuse your hair with the power of one of the world’s fastest growing and most resilient natural ingredients.\",\"7\":[\"71\"],\"11\":[\"72\"],\"10\":\"Dedicated to boosting your hair\'s intrinsic strength and flexibility, the Bamboo collection was sustainably sourced and harvested globally, from India, Peru, Indonesia, and Namibia. It provided even the most premium consumer segments with unique nourishing and energizing extracts that were simply not available on the market at the time.\",\"6\":\"The Bamboo Strength\",\"12\":[\"73\"]}}','2019-03-14 19:31:34','2019-03-14 19:31:34','cbeae345-749d-4b76-9372-feb0ccf129fd'),
	(39,104,2,1,1,1,'','{\"typeId\":\"2\",\"authorId\":\"1\",\"title\":\"2008\",\"slug\":\"2008\",\"postDate\":1552591920,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"\",\"fields\":[]}','2019-03-14 19:32:06','2019-03-14 19:32:06','f79be8ea-84b4-4331-94dd-261c6e8e63a8'),
	(40,105,2,1,1,1,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"2008 - Component A - Header\",\"slug\":\"2008-component-a-header\",\"postDate\":1552592460,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"104\",\"fields\":{\"7\":[\"67\"],\"11\":[\"68\"],\"17\":[\"70\"],\"6\":\"Seasilk Soft & Seasilk Smooth\"}}','2019-03-14 19:41:04','2019-03-14 19:41:04','7cee3793-03b7-4264-a2d3-e810a7c06841'),
	(41,106,2,1,1,1,'','{\"typeId\":\"8\",\"authorId\":\"1\",\"title\":\"2008 - Component B - Detail\",\"slug\":\"2008-component-b-detail\",\"postDate\":1552592520,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"104\",\"fields\":{\"8\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\",\"7\":[\"67\"],\"11\":[\"68\"],\"10\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\",\"6\":\"Seasilk Soft & Seasilk Smooth\",\"12\":[\"69\"]}}','2019-03-14 19:42:08','2019-03-14 19:42:08','07e742f3-35c8-492d-9358-da4224391186'),
	(42,107,2,1,1,1,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"2008 - Component A - Header - Highly Hydrating Hemp\",\"slug\":\"2008-component-a-header-highly-hydrating-hemp\",\"postDate\":1552592580,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"104\",\"fields\":{\"7\":[\"59\"],\"11\":[\"60\"],\"17\":[\"62\"],\"6\":\"Highly Hydrating Hemp\"}}','2019-03-14 19:43:09','2019-03-14 19:43:09','7e2a1835-3104-4d97-9eec-a505f970c728'),
	(43,108,2,1,1,1,'','{\"typeId\":\"8\",\"authorId\":\"1\",\"title\":\"2008 - Component B - Detail - Highly Hydrating Hemp\",\"slug\":\"2008-component-b-detail-highly-hydrating-hemp\",\"postDate\":1552592640,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"104\",\"fields\":{\"8\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\",\"7\":[\"59\"],\"11\":[\"60\"],\"10\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\",\"6\":\"Highly Hydrating Hemp\",\"12\":[\"61\"]}}','2019-03-14 19:44:01','2019-03-14 19:44:01','9f495eea-98ab-46c7-840c-fd7a2e8ac077'),
	(44,109,2,1,1,1,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"2008 - Component A - Header - Life Ext\",\"slug\":\"2008-component-a-header-life-ext\",\"postDate\":1552592640,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"104\",\"fields\":{\"7\":[\"63\"],\"11\":[\"64\"],\"17\":[\"66\"],\"6\":\"Once In A Life Extension\"}}','2019-03-14 19:44:51','2019-03-14 19:44:51','f170217e-7def-429a-8b3c-c8a5929df4a3'),
	(45,105,2,1,1,2,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"2008 - Component A - Header - Seasilk\",\"slug\":\"2008-component-a-header-seasilk\",\"postDate\":1552592460,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"104\",\"fields\":{\"7\":[\"67\"],\"11\":[\"68\"],\"17\":[\"70\"],\"6\":\"Seasilk Soft & Seasilk Smooth\"}}','2019-03-14 19:45:08','2019-03-14 19:45:08','3db5a0c6-0d61-4d3d-af9a-9a0b37a95586'),
	(46,106,2,1,1,2,'','{\"typeId\":\"8\",\"authorId\":\"1\",\"title\":\"2008 - Component B - Detail - Seasilk\",\"slug\":\"2008-component-b-detail-seasilk\",\"postDate\":1552592520,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"104\",\"fields\":{\"8\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\",\"7\":[\"67\"],\"11\":[\"68\"],\"10\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\",\"6\":\"Seasilk Soft & Seasilk Smooth\",\"12\":[\"69\"]}}','2019-03-14 19:45:19','2019-03-14 19:45:19','04d3d09c-54b5-4c73-9ffe-ba890e086749'),
	(47,110,2,1,1,1,'','{\"typeId\":\"8\",\"authorId\":\"1\",\"title\":\"2008 - Component B - Detail - Life Ext\",\"slug\":\"2008-component-b-detail-life-ext\",\"postDate\":1552592760,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"104\",\"fields\":{\"8\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\",\"7\":[\"63\"],\"11\":[\"64\"],\"10\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\",\"6\":\"Once In A Life Extension\",\"12\":[\"65\"]}}','2019-03-14 19:46:09','2019-03-14 19:46:09','92cfb860-8b62-4c95-8bad-bb4146fa74d3'),
	(48,107,2,1,1,2,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"2008 - Component A - Header - Hemp\",\"slug\":\"2008-component-a-header-highly-hydrating-hemp\",\"postDate\":1552592580,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"104\",\"fields\":{\"7\":[\"59\"],\"11\":[\"60\"],\"17\":[\"62\"],\"6\":\"Highly Hydrating Hemp\"}}','2019-03-14 19:46:22','2019-03-14 19:46:22','a45ac04b-dd99-44a4-8d07-0018b9b4b27d'),
	(49,108,2,1,1,2,'','{\"typeId\":\"8\",\"authorId\":\"1\",\"title\":\"2008 - Component B - Detail - Hemp\",\"slug\":\"2008-component-b-detail-hemp\",\"postDate\":1552592640,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"104\",\"fields\":{\"8\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\",\"7\":[\"59\"],\"11\":[\"60\"],\"10\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\",\"6\":\"Highly Hydrating Hemp\",\"12\":[\"61\"]}}','2019-03-14 19:46:31','2019-03-14 19:46:31','042cb882-2967-4a1f-9692-11d856afb056'),
	(50,107,2,1,1,3,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"2008 - Component A - Header - Hemp\",\"slug\":\"2008-component-a-header-hemp\",\"postDate\":1552592580,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"104\",\"fields\":{\"7\":[\"59\"],\"11\":[\"60\"],\"17\":[\"62\"],\"6\":\"Highly Hydrating Hemp\"}}','2019-03-14 19:46:38','2019-03-14 19:46:38','37e4cc97-4cf8-4317-9280-b2b53978fe09'),
	(51,111,2,1,1,1,'','{\"typeId\":\"2\",\"authorId\":\"1\",\"title\":\"2017\",\"slug\":\"2017\",\"postDate\":1552592760,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"\",\"fields\":[]}','2019-03-14 19:46:48','2019-03-14 19:46:48','e9b38031-676e-40cd-8db7-ab2455a9d22e'),
	(52,112,2,1,1,1,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"2007 - Component A - Header\",\"slug\":\"2007-component-a-header\",\"postDate\":1552592820,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"\",\"fields\":{\"7\":[\"55\"],\"11\":[\"56\"],\"17\":[\"58\"],\"6\":\"Ten Out Of Ten\"}}','2019-03-14 19:47:33','2019-03-14 19:47:33','1a092ce1-703c-4af3-856e-b3b3c49a4cdf'),
	(53,113,2,1,1,1,'','{\"typeId\":\"8\",\"authorId\":\"1\",\"title\":\"2007 - Component B - Detail\",\"slug\":\"2007-component-b-detail\",\"postDate\":1552592880,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"\",\"fields\":{\"8\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\",\"7\":[\"55\"],\"11\":[\"56\"],\"10\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\",\"6\":\"Ten Out Of Ten\",\"12\":[\"57\"]}}','2019-03-14 19:48:16','2019-03-14 19:48:16','bc07efdb-f12c-4168-9502-f837bfcffe52'),
	(54,114,2,1,1,1,'','{\"typeId\":\"2\",\"authorId\":\"1\",\"title\":\"2005\",\"slug\":\"2005\",\"postDate\":1552592880,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"\",\"fields\":[]}','2019-03-14 19:48:30','2019-03-14 19:48:30','0e813a7a-20a2-4b86-9995-f215364d249e'),
	(55,115,2,1,1,1,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"2005 - Component A - Header - truffle\",\"slug\":\"2005-component-a-header-truffle\",\"postDate\":1552592940,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"114\",\"fields\":{\"7\":[\"51\"],\"11\":[\"52\"],\"17\":[\"54\"],\"6\":\"White Truffle Extravagance\"}}','2019-03-14 19:49:37','2019-03-14 19:49:37','e06d76c5-11ea-4857-8404-12cdf54bae8c'),
	(56,116,2,1,1,1,'','{\"typeId\":\"8\",\"authorId\":\"1\",\"title\":\"2005 - Component B - Detail - Truffle\",\"slug\":\"2005-component-b-detail-truffle\",\"postDate\":1552593000,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"114\",\"fields\":{\"8\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\",\"7\":[\"51\"],\"11\":[\"52\"],\"10\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\",\"6\":\"White Truffle Extravagance\",\"12\":[\"53\"]}}','2019-03-14 19:50:16','2019-03-14 19:50:16','853e0e94-3156-4221-b868-85eba0429f73'),
	(57,117,2,1,1,1,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"2005 - Component A - Header - Caviar\",\"slug\":\"2005-component-a-header-caviar\",\"postDate\":1552593300,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"114\",\"fields\":{\"7\":[\"47\"],\"11\":[\"48\"],\"17\":[\"50\"],\"6\":\"Caviar Enzymes Against Aging\"}}','2019-03-14 19:55:34','2019-03-14 19:55:34','57ddfdbc-241a-45b5-9f0b-f96487a0f40c'),
	(58,118,2,1,1,1,'','{\"typeId\":\"8\",\"authorId\":\"1\",\"title\":\"2005 - Component B - Detail - Caviar\",\"slug\":\"2005-component-b-detail-caviar\",\"postDate\":1552593360,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"114\",\"fields\":{\"8\":\"Ultimately responsible for processing all incoming nutrients, enzyme levels decrease with age, requiring high-precision treatment.\",\"7\":[\"47\"],\"11\":[\"48\"],\"10\":\"Caviar with Age-Control Complex was a unique system of products targeted at restoring both vibrancy and elasticity of the hair and skin. Using caviar enzymes, cytokines, and vitamin C, the complex prevented external as well as oxidative damage, stimulated protein production, and encouraged rapid regeneration at the cellular level.\",\"6\":\"Caviar Enzymes Against Aging\",\"12\":[\"49\"]}}','2019-03-14 19:56:26','2019-03-14 19:56:26','04078e02-a35e-4092-868d-a1976a369ff3'),
	(59,119,2,1,1,1,'','{\"typeId\":\"2\",\"authorId\":\"1\",\"title\":\"1999\",\"slug\":\"1999\",\"postDate\":1552593360,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"\",\"fields\":[]}','2019-03-14 19:56:50','2019-03-14 19:56:50','5ef0ebe5-6153-46b4-9326-46e1b99c9123'),
	(60,120,2,1,1,1,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"1999 - Component A - Header -antiaging\",\"slug\":\"1999-component-a-header-antiaging\",\"postDate\":1552593600,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"119\",\"fields\":{\"7\":[\"32\"],\"11\":[\"33\"],\"17\":[\"37\"],\"6\":\"Anti-Aging Caviar Collection\"}}','2019-03-14 20:00:59','2019-03-14 20:00:59','ed1fdfbe-71f6-49d1-8703-79768fe10c5a'),
	(61,121,2,1,1,1,'','{\"typeId\":\"8\",\"authorId\":\"1\",\"title\":\"1999 - Component B - Detail - Caviar\",\"slug\":\"1999-component-b-detail-caviar\",\"postDate\":1552593720,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"119\",\"fields\":{\"8\":\"When you browse the world in search of the most effective natural anti-aging ingredient, in the end, you find caviar.\",\"7\":[\"32\"],\"11\":[\"33\"],\"10\":\"In less than two years since the launch of its inaugural collection, Alterna presented its first breakthrough line of products with anti-aging properties, developed based on caviar. Full of omega-3 fatty acids, it helped to replenish the hair’s lipid layer for better moisture retention and elasticity and resulted in healthy natural smoothness and shine.\",\"6\":\"Anti-Aging Caviar Collection\",\"12\":[\"35\"]}}','2019-03-14 20:02:09','2019-03-14 20:02:09','d9dbfea0-56a9-411a-9f4c-4a8ec3ec451d'),
	(62,122,2,1,1,1,'','{\"typeId\":\"10\",\"authorId\":\"1\",\"title\":\"1999 - Component B - video - Caviar\",\"slug\":\"1999-component-b-video-caviar\",\"postDate\":1552594080,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"119\",\"fields\":{\"7\":[\"32\"],\"6\":\"Anti-Aging Caviar Collection\",\"12\":[\"36\"]}}','2019-03-14 20:08:23','2019-03-14 20:08:23','b6e2a439-701c-4720-aa86-ffa5a1fe6f69'),
	(63,123,2,1,1,1,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"1999 - Component A - Header - lifeline\",\"slug\":\"1999-component-a-header-lifeline\",\"postDate\":1552594200,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"119\",\"fields\":{\"7\":[\"39\"],\"11\":[\"40\"],\"17\":[\"46\"],\"6\":\"Bring In The Life Line\"}}','2019-03-14 20:10:28','2019-03-14 20:10:28','56304b15-a3f4-4e8a-904f-3320d4dd7274'),
	(64,124,2,1,1,1,'','{\"typeId\":\"8\",\"authorId\":\"1\",\"title\":\"1999 - Component B - Detail - lifeline\",\"slug\":\"1999-component-b-detail-lifeline\",\"postDate\":1552594260,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"119\",\"fields\":{\"8\":\"Real beauty on the outside requires beauty on the inside. Like yin and yang. Western technology combined with eastern medicinal wisdom.\",\"7\":[\"39\"],\"11\":[\"40\"],\"10\":\"Alterna Life collection took a unique approach to beauty by first encouraging relaxation and peaceful state of mind through soothing colors and exotic scents, and then making use of the latest advances in technology to work on volume, restoration, straightening, and curling. Life brought the body and mind into complete balance.\",\"6\":\"Bring In The Life Line\",\"12\":[\"42\"]}}','2019-03-14 20:11:31','2019-03-14 20:11:31','be337180-ea31-45f0-b39f-4a723acf77c9'),
	(65,125,2,1,1,1,'','{\"typeId\":\"9\",\"authorId\":\"1\",\"title\":\"1999 - Component B - Slideshow - lifeline\",\"slug\":\"1999-component-b-slideshow-lifeline\",\"postDate\":1552594440,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"119\",\"fields\":{\"6\":\"Bring In The Life Line\",\"14\":{\"126\":{\"type\":\"slide\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"43\"],\"caption\":\"Alterna Life Restore\"}},\"127\":{\"type\":\"slide\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"44\"],\"caption\":\"Alterna Enzymetherapy Life Curls\"}},\"128\":{\"type\":\"slide\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"45\"],\"caption\":\"Alterna Enzymetherapy Life Volumizing Spray Mousse\"}}},\"13\":\"Collection\"}}','2019-03-14 20:14:02','2019-03-14 20:14:02','b7cd07ba-5ec3-41d1-8f69-1fe77ff68c80'),
	(66,129,2,1,1,1,'','{\"typeId\":\"2\",\"authorId\":\"1\",\"title\":\"1997\",\"slug\":\"1997\",\"postDate\":1552594560,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"\",\"fields\":[]}','2019-03-14 20:16:32','2019-03-14 20:16:32','c6108ede-38d5-43be-95d0-42e53034d91a'),
	(67,130,2,1,1,1,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"1997 - Component A - Header\",\"slug\":\"1997-component-a-header\",\"postDate\":1552594620,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"129\",\"fields\":{\"7\":[\"39\"],\"11\":[\"30\"],\"17\":[\"29\"],\"6\":\"A New Generation Of Hair Care\"}}','2019-03-14 20:17:48','2019-03-14 20:17:48','afa37c63-f768-4e62-afd5-40d58e99298f'),
	(68,131,2,1,1,1,'','{\"typeId\":\"8\",\"authorId\":\"1\",\"title\":\"1997 - Component B - Detail\",\"slug\":\"1997-component-b-detail\",\"postDate\":1552594680,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"129\",\"fields\":{\"8\":\"Imagine a line of premium hair products free of additives and harsh ingredients resulting in an effective and healthy look.\",\"7\":[\"39\"],\"11\":[\"30\"],\"10\":\"Launched in 1997, Alterna had a vision of creating a sustainable future through introducing a no-compromise luxurious haircare collection. All deszigned specifically for discerning industry professionals and based on the science of skincare, incorporating new technological advancements. Only natural eco-certified ingredients. No sulfates or parabens. No animal testing. Ever.\",\"6\":\"A New Generation Of Hair Care\",\"12\":[\"31\"]}}','2019-03-14 20:18:57','2019-03-14 20:18:57','3f8debe0-3ce6-4e7c-b3fb-385da9417ced'),
	(69,111,2,1,1,2,'','{\"typeId\":\"2\",\"authorId\":\"1\",\"title\":\"2007\",\"slug\":\"2007\",\"postDate\":1552592760,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"\",\"fields\":[]}','2019-03-14 20:19:57','2019-03-14 20:19:57','8a2393b0-ca15-48ce-829e-841688f01b06'),
	(70,27,2,1,1,2,'','{\"typeId\":\"10\",\"authorId\":\"1\",\"title\":\"2019 - Component A - Header\",\"slug\":\"2019-component-a-header\",\"postDate\":1552429560,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"26\",\"fields\":{\"7\":[\"19\"],\"6\":\"Alterna Brand Launches\",\"12\":[]}}','2019-03-14 20:22:18','2019-03-14 20:22:18','e68050a6-22c8-4b81-8871-cc416ba6a1ea'),
	(71,132,2,1,1,1,'','{\"typeId\":\"9\",\"authorId\":\"1\",\"title\":\"2019 - Component B - Detail\",\"slug\":\"2019-component-b-detail\",\"postDate\":1552594980,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"26\",\"fields\":{\"6\":\"Alterna Brand Launches\",\"14\":{\"133\":{\"type\":\"slide\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"11\"],\"caption\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\"}},\"134\":{\"type\":\"slide\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"12\"],\"caption\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\"}},\"135\":{\"type\":\"slide\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"13\"],\"caption\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod\"}}},\"13\":\"Collection\"}}','2019-03-14 20:23:24','2019-03-14 20:23:24','a8f864a2-0094-459e-b112-93cd28abc339'),
	(72,27,2,1,1,3,'','{\"typeId\":\"10\",\"authorId\":\"1\",\"title\":\"2019 - Component A - Header\",\"slug\":\"2019-component-a-header\",\"postDate\":1552429560,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"26\",\"fields\":{\"8\":\"An alternative vision born in salons: premium hair products free of additives or harsh ingredients. And a revolution in haircare was born...\",\"7\":[\"19\"],\"11\":[\"8\"],\"6\":\"Alterna Brand Launches\",\"12\":[\"13\"]}}','2019-03-15 10:41:40','2019-03-15 10:41:40','d4663359-8df5-4954-be0f-338749928b4e'),
	(73,27,2,1,1,4,'','{\"typeId\":\"10\",\"authorId\":\"1\",\"title\":\"2019 - Component A - Header\",\"slug\":\"2019-component-a-header\",\"postDate\":1552429560,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"26\",\"fields\":{\"8\":\"An alternative vision born in salons: premium hair products free of additives or harsh ingredients. And a revolution in haircare was born...\",\"7\":[\"137\"],\"11\":[\"8\"],\"6\":\"Alterna Brand Launches\",\"12\":[\"13\"]}}','2019-03-15 11:48:49','2019-03-15 11:48:49','379f1118-b351-4303-8784-c16b31ab7290'),
	(74,27,2,1,1,5,'','{\"typeId\":\"10\",\"authorId\":\"1\",\"title\":\"2019 - Component A - Header\",\"slug\":\"2019-component-a-header\",\"postDate\":1552429560,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"26\",\"fields\":{\"8\":\"An alternative vision born in salons: premium hair products free of additives or harsh ingredients. And a revolution in haircare was born...\",\"7\":[\"19\"],\"11\":[\"8\"],\"6\":\"Alterna Brand Launches\",\"12\":[\"13\"]}}','2019-03-15 11:56:04','2019-03-15 11:56:04','97e191ad-870d-4c5e-af4e-b468d7d7148b'),
	(75,138,2,1,1,1,'','{\"typeId\":\"9\",\"authorId\":\"1\",\"title\":\"2019 - slideshow - testing\",\"slug\":\"2019-slideshow-testing\",\"postDate\":1552933320,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"26\",\"fields\":{\"11\":[\"30\"],\"6\":\"2019 Caviar\",\"14\":{\"139\":{\"type\":\"slide\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"43\"],\"caption\":null}},\"140\":{\"type\":\"slide\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"44\"],\"caption\":null}},\"141\":{\"type\":\"slide\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"45\"],\"caption\":null}},\"142\":{\"type\":\"slide\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"43\"],\"caption\":null}}},\"13\":\"2019 Caviar\"}}','2019-03-18 18:22:58','2019-03-18 18:22:58','ff8dd6df-991d-48ff-a2b1-132113d79b2f'),
	(76,122,2,1,1,2,'','{\"typeId\":\"10\",\"authorId\":\"1\",\"title\":\"1999 - Component B - video - Caviar\",\"slug\":\"1999-component-b-video-caviar\",\"postDate\":1552594080,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"119\",\"fields\":{\"8\":null,\"7\":[\"137\"],\"11\":[],\"6\":\"Anti-Aging Caviar Collection\",\"12\":[\"36\"]}}','2019-03-25 19:47:26','2019-03-25 19:47:26','60fce31d-f65a-4d4a-8005-8b22625a8704'),
	(77,96,2,1,1,2,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"2013 - Component A - Header\",\"slug\":\"2013-component-a-header\",\"postDate\":1552590720,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"95\",\"fields\":{\"7\":[\"83\"],\"11\":[\"84\"],\"17\":[\"86\"],\"6\":\"Bamboo On The Beach\"}}','2019-03-25 21:57:18','2019-03-25 21:57:18','32f998c7-dc6e-4eaa-9dfe-0435f5240a27'),
	(78,96,2,1,1,3,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"2013 - Component A - Header\",\"slug\":\"2013-component-a-header\",\"postDate\":1552590720,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"95\",\"fields\":{\"7\":[\"83\"],\"11\":[\"84\"],\"17\":[\"86\"],\"6\":\"Bamboo On\\nThe Beach\"}}','2019-03-25 21:58:31','2019-03-25 21:58:31','2aee48da-2186-4f9c-a658-88b08615fc3a'),
	(79,22,2,1,1,6,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"2018 Component A - Header\",\"slug\":\"2018-component-a-header\",\"postDate\":1551917880,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"21\",\"fields\":{\"7\":[\"87\"],\"11\":[\"8\"],\"17\":[\"24\"],\"6\":\"Caviar\\nAnti-Aging\\nRestage\"}}','2019-03-27 18:43:23','2019-03-27 18:43:23','7eeaafb5-b507-410c-9d6a-af87f9a5a3df'),
	(80,22,2,1,1,7,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"2018 Component A - Header\",\"slug\":\"2018-component-a-header\",\"postDate\":1551917880,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"21\",\"fields\":{\"7\":[\"87\"],\"11\":[\"8\"],\"17\":[\"24\"],\"6\":\"Caviar\\n Anti-Aging\\nRestage\"}}','2019-03-27 18:44:12','2019-03-27 18:44:12','12bec41b-7264-4c19-b416-7f21102fc38b'),
	(81,123,2,1,1,2,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"1999 - Component A - Header - lifeline\",\"slug\":\"1999-component-a-header-lifeline\",\"postDate\":1552594200,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"119\",\"fields\":{\"7\":[\"39\"],\"11\":[\"40\"],\"17\":[\"46\"],\"6\":\"Bring In \\nThe Life Line\"}}','2019-03-27 18:57:55','2019-03-27 18:57:55','7f175768-177b-4980-b12e-737c6ca54051'),
	(82,27,2,1,1,6,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"2019 - Component A - Header\",\"slug\":\"2019-component-a-header\",\"postDate\":1552429560,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"26\",\"fields\":{\"7\":[\"19\"],\"11\":[\"8\"],\"17\":[],\"6\":\"Alterna Brand Launches\"}}','2019-03-28 20:19:30','2019-03-28 20:19:30','63d1d42d-3029-4d29-a4a4-23d7fec37f32'),
	(83,27,2,1,1,7,'','{\"typeId\":\"10\",\"authorId\":\"1\",\"title\":\"2019 - Component A - Header\",\"slug\":\"2019-component-a-header\",\"postDate\":1552429560,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"26\",\"fields\":{\"8\":\"An alternative vision born in salons: premium hair products free of additives or harsh ingredients. And a revolution in haircare was born...\",\"7\":[\"19\"],\"11\":[\"8\"],\"6\":\"Alterna Brand Launches\",\"12\":[\"13\"]}}','2019-03-28 20:56:10','2019-03-28 20:56:10','2337e0d7-84e0-4712-9fdf-f1fc874dae6c'),
	(84,27,2,1,1,8,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"2019 - Component A - Header\",\"slug\":\"2019-component-a-header\",\"postDate\":1552429560,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"26\",\"fields\":{\"7\":[\"6\"],\"11\":[\"8\"],\"17\":[\"74\"],\"6\":\"Alterna Brand Launches\"}}','2019-03-28 21:14:14','2019-03-28 21:14:14','a536a526-7392-436e-a319-52269afbf1c4'),
	(85,27,2,1,1,9,'','{\"typeId\":\"10\",\"authorId\":\"1\",\"title\":\"2019 - Component A - Header\",\"slug\":\"2019-component-a-header\",\"postDate\":1552429560,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"26\",\"fields\":{\"8\":\"An alternative vision born in salons: premium hair products free of additives or harsh ingredients. And a revolution in haircare was born...\",\"7\":[\"19\"],\"11\":[\"8\"],\"6\":\"Alterna Brand Launches\",\"12\":[\"13\"]}}','2019-03-28 21:14:57','2019-03-28 21:14:57','d8bbd9b9-734e-4ceb-b661-ce35b775b31b'),
	(86,27,2,1,1,10,'','{\"typeId\":\"10\",\"authorId\":\"1\",\"title\":\"2019 - Component A - Header\",\"slug\":\"2019-component-a-header\",\"postDate\":1552429560,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"26\",\"fields\":{\"8\":\"An alternative vision born in salons: premium hair products free of additives or harsh ingredients. And a revolution in haircare was born...\",\"7\":[\"137\"],\"11\":[\"8\"],\"6\":\"Alterna Brand Launches\",\"12\":[\"13\"]}}','2019-03-28 21:15:53','2019-03-28 21:15:53','afdeae4a-1ec0-4692-89b0-11e4e11417ea'),
	(87,27,2,1,1,11,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"2019 - Component A - Header\",\"slug\":\"2019-component-a-header\",\"postDate\":1552429560,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"26\",\"fields\":{\"7\":[\"137\"],\"11\":[\"8\"],\"17\":[\"74\"],\"6\":\"Alterna Brand Launches\"}}','2019-03-28 21:16:24','2019-03-28 21:16:24','c5f9cba9-9eeb-4f22-b66a-a87146d873ac'),
	(88,27,2,1,1,12,'','{\"typeId\":\"10\",\"authorId\":\"1\",\"title\":\"2019 - Component A - Header\",\"slug\":\"2019-component-a-header\",\"postDate\":1552429560,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"26\",\"fields\":{\"8\":\"An alternative vision born in salons: premium hair products free of additives or harsh ingredients. And a revolution in haircare was born...\",\"7\":[\"137\"],\"11\":[\"8\"],\"6\":\"Alterna Brand Launches\",\"12\":[\"13\"]}}','2019-03-28 21:17:07','2019-03-28 21:17:07','fdfce866-dd78-452e-b863-b5646e1bb728'),
	(89,27,2,1,1,13,'','{\"typeId\":\"10\",\"authorId\":\"1\",\"title\":\"2019 - Component A - Header\",\"slug\":\"2019-component-a-header\",\"postDate\":1552429560,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"26\",\"fields\":{\"8\":\"An alternative vision born in salons: premium hair products free of additives or harsh ingredients. And a revolution in haircare was born...\",\"7\":[\"137\"],\"11\":[\"8\"],\"6\":\"Alterna Brand Launches\",\"12\":[\"36\"]}}','2019-03-28 21:29:30','2019-03-28 21:29:30','f3041d14-9709-4970-be42-b8fbf6155ab3'),
	(90,27,2,1,1,14,'','{\"typeId\":\"10\",\"authorId\":\"1\",\"title\":\"2019 - Component A - Header\",\"slug\":\"2019-component-a-header\",\"postDate\":1552429560,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"26\",\"fields\":{\"8\":\"An alternative vision born in salons: premium hair products free of additives or harsh ingredients. And a revolution in haircare was born...\",\"7\":[\"137\"],\"11\":[\"8\"],\"6\":\"Alterna Brand Launches\",\"12\":[]}}','2019-03-28 21:29:51','2019-03-28 21:29:51','6d850d75-86a0-40d5-99e5-5bc1e3e73212'),
	(91,27,2,1,1,15,'','{\"typeId\":\"10\",\"authorId\":\"1\",\"title\":\"2019 - Component A - Header\",\"slug\":\"2019-component-a-header\",\"postDate\":1552429560,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"26\",\"fields\":{\"8\":\"An alternative vision born in salons: premium hair products free of additives or harsh ingredients. And a revolution in haircare was born...\",\"7\":[\"137\"],\"11\":[\"8\"],\"6\":\"Alterna Brand Launches\",\"12\":[\"91\"]}}','2019-03-28 21:30:14','2019-03-28 21:30:14','56c18018-1365-440b-89fe-08688102bbfc'),
	(92,27,2,1,1,16,'','{\"typeId\":\"10\",\"authorId\":\"1\",\"title\":\"2019 - Component A - Header\",\"slug\":\"2019-component-a-header\",\"postDate\":1552429560,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"26\",\"fields\":{\"8\":\"An alternative vision born in salons: premium hair products free of additives or harsh ingredients. And a revolution in haircare was born...\",\"7\":[\"137\"],\"11\":[\"8\"],\"6\":\"Alterna Brand Launches\",\"12\":[]}}','2019-03-28 21:30:35','2019-03-28 21:30:35','863dc2be-2d03-41d9-a198-ae33d826dbbd'),
	(93,99,2,1,1,2,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"2012 - Component A - Header\",\"slug\":\"2012-component-a-header\",\"postDate\":1552591380,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"98\",\"fields\":{\"7\":[\"79\"],\"11\":[\"80\"],\"17\":[\"82\"],\"6\":\"New Bamboo\\nIn Style\"}}','2019-03-28 21:54:44','2019-03-28 21:54:44','c763efbe-157f-48db-a32d-eb2c7ccc924d'),
	(94,7,2,1,1,5,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"2011 Component A - Header\",\"slug\":\"2011-component-a-header\",\"postDate\":1551916620,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"4\",\"fields\":{\"7\":[\"75\"],\"11\":[\"76\"],\"17\":[\"78\"],\"6\":\"Fast Bamboo\\nGrowth\"}}','2019-03-28 21:55:24','2019-03-28 21:55:24','de077121-a64a-4c53-ad65-964839275b24'),
	(95,102,2,1,1,2,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"2010 - Component A - Header\",\"slug\":\"2010-component-a-header\",\"postDate\":1552591800,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"101\",\"fields\":{\"7\":[\"71\"],\"11\":[\"72\"],\"17\":[\"74\"],\"6\":\"The Bamboo\\nStrength\"}}','2019-03-28 21:55:51','2019-03-28 21:55:51','6fa5710e-e9ec-4f04-ab26-74e69d140b03'),
	(96,105,2,1,1,3,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"2008 - Component A - Header - Seasilk\",\"slug\":\"2008-component-a-header-seasilk\",\"postDate\":1552592460,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"104\",\"fields\":{\"7\":[\"67\"],\"11\":[\"68\"],\"17\":[\"70\"],\"6\":\"Seasilk Soft & \\nSeasilk Smooth\"}}','2019-03-28 21:56:11','2019-03-28 21:56:11','3240d0bd-6bfe-4b21-97ce-45f586d84852'),
	(97,107,2,1,1,4,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"2008 - Component A - Header - Hemp\",\"slug\":\"2008-component-a-header-hemp\",\"postDate\":1552592580,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"104\",\"fields\":{\"7\":[\"59\"],\"11\":[\"60\"],\"17\":[\"62\"],\"6\":\"Highly\\nHydrating Hemp\"}}','2019-03-28 21:56:50','2019-03-28 21:56:50','a467ca16-e3e0-4a4e-82d5-77b9a924e971'),
	(98,109,2,1,1,2,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"2008 - Component A - Header - Life Ext\",\"slug\":\"2008-component-a-header-life-ext\",\"postDate\":1552592640,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"104\",\"fields\":{\"7\":[\"63\"],\"11\":[\"64\"],\"17\":[\"66\"],\"6\":\"Once In\\nA Life Extension\"}}','2019-03-28 21:57:18','2019-03-28 21:57:18','6f63b379-0502-4004-8b76-5b96765138f9'),
	(99,112,2,1,1,2,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"2007 - Component A - Header\",\"slug\":\"2007-component-a-header\",\"postDate\":1552592820,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"111\",\"fields\":{\"7\":[\"55\"],\"11\":[\"56\"],\"17\":[\"58\"],\"6\":\"Ten Out\\nOf Ten\"}}','2019-03-28 21:57:51','2019-03-28 21:57:51','fa471615-2a81-4ca4-8ab9-6968520b494a'),
	(100,115,2,1,1,2,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"2005 - Component A - Header - truffle\",\"slug\":\"2005-component-a-header-truffle\",\"postDate\":1552592940,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"114\",\"fields\":{\"7\":[\"51\"],\"11\":[\"52\"],\"17\":[\"54\"],\"6\":\"White\\nTruffle\\nExtravagance\"}}','2019-03-28 21:58:31','2019-03-28 21:58:31','bea0bc21-f204-4db6-bb7e-0ae262ef046d'),
	(101,117,2,1,1,2,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"2005 - Component A - Header - Caviar\",\"slug\":\"2005-component-a-header-caviar\",\"postDate\":1552593300,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"114\",\"fields\":{\"7\":[\"47\"],\"11\":[\"48\"],\"17\":[\"50\"],\"6\":\"Caviar\\nEnzymes\\nAgainst Aging\"}}','2019-03-28 21:59:11','2019-03-28 21:59:11','68efc7d2-5ef0-4ec8-be16-3f360b1e7b5f'),
	(102,120,2,1,1,2,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"1999 - Component A - Header -antiaging\",\"slug\":\"1999-component-a-header-antiaging\",\"postDate\":1552593600,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"119\",\"fields\":{\"7\":[\"32\"],\"11\":[\"33\"],\"17\":[\"37\"],\"6\":\"Anti-Aging\\nCaviar\\nCollection\"}}','2019-03-28 21:59:40','2019-03-28 21:59:40','17bf7e51-6881-4d09-a056-0f87696476ae'),
	(103,130,2,1,1,2,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"1997 - Component A - Header\",\"slug\":\"1997-component-a-header\",\"postDate\":1552594620,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"129\",\"fields\":{\"7\":[\"39\"],\"11\":[\"30\"],\"17\":[\"29\"],\"6\":\"A New\\nGeneration\\nOf Hair Care\"}}','2019-03-28 22:00:44','2019-03-28 22:00:44','b9392e5a-8dea-41ca-a531-fa54324fdb5d'),
	(104,22,2,1,1,8,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"2018 Component A - Header\",\"slug\":\"2018-component-a-header\",\"postDate\":1551917880,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"21\",\"fields\":{\"7\":[\"87\"],\"11\":[],\"17\":[\"24\"],\"6\":\"Caviar\\n Anti-Aging\\nRestage\"}}','2019-03-28 23:19:16','2019-03-28 23:19:16','d0e55896-9974-49f3-9c55-c5e8c35f59ab'),
	(105,22,2,1,1,9,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"2018 Component A - Header\",\"slug\":\"2018-component-a-header\",\"postDate\":1551917880,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"21\",\"fields\":{\"7\":[\"87\"],\"11\":[\"145\"],\"17\":[\"24\"],\"6\":\"Caviar\\n Anti-Aging\\nRestage\"}}','2019-03-28 23:24:08','2019-03-28 23:24:08','4b7d3a45-97ea-4851-bb29-382fc7debf91'),
	(106,23,2,1,1,5,'','{\"typeId\":\"8\",\"authorId\":\"1\",\"title\":\"2018 Component B - Detail\",\"slug\":\"2018-component-a-header\",\"postDate\":1551917940,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"21\",\"fields\":{\"8\":\"The most exclusive product demands a sophisticated packaging update to reflect its balanced nature. Old formula. New styles.\",\"7\":[\"146\"],\"11\":[\"19\"],\"10\":\"Celebrating nearly 20 years of Caviar success, Alterna relaunched the collection with a new look and consistent color palette across all products. In addition, the company introduced a new Caviar Anti-Aging Restructuring Bond Repair product line, aimed at helping to reverse the hair damage from heat styling, free radicals, and excessive coloring.\",\"9\":null,\"6\":\"Caviar Anti-Aging Restage\",\"12\":[\"13\"]}}','2019-03-28 23:28:48','2019-03-28 23:28:48','49bf9628-bb34-4f45-9e71-30793cb5787b'),
	(107,23,2,1,1,6,'','{\"typeId\":\"8\",\"authorId\":\"1\",\"title\":\"2018 Component B - Detail\",\"slug\":\"2018-component-a-header\",\"postDate\":1551917940,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"21\",\"fields\":{\"8\":\"The most exclusive product demands a sophisticated packaging update to reflect its balanced nature. Old formula. New styles.\",\"7\":[\"146\"],\"11\":[\"148\"],\"10\":\"Celebrating nearly 20 years of Caviar success, Alterna relaunched the collection with a new look and consistent color palette across all products. In addition, the company introduced a new Caviar Anti-Aging Restructuring Bond Repair product line, aimed at helping to reverse the hair damage from heat styling, free radicals, and excessive coloring.\",\"9\":null,\"6\":\"Caviar Anti-Aging Restage\",\"12\":[\"13\"]}}','2019-03-28 23:34:43','2019-03-28 23:34:43','7a2597d6-5d8a-4eac-b842-c258adf42876'),
	(108,23,2,1,1,7,'','{\"typeId\":\"8\",\"authorId\":\"1\",\"title\":\"2018 Component B - Detail\",\"slug\":\"2018-component-a-header\",\"postDate\":1551917940,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"21\",\"fields\":{\"8\":\"The most exclusive product demands a sophisticated packaging update to reflect its balanced nature. Old formula. New styles.\",\"7\":[\"146\"],\"11\":[\"148\"],\"10\":\"Celebrating nearly 20 years of Caviar success, Alterna relaunched the collection with a new look and consistent color palette across all products. In addition, the company introduced a new Caviar Anti-Aging Restructuring Bond Repair product line, aimed at helping to reverse the hair damage from heat styling, free radicals, and excessive coloring.\",\"9\":null,\"6\":\"Caviar Anti-Aging Restage\",\"12\":[\"149\"]}}','2019-03-28 23:37:19','2019-03-28 23:37:19','95026998-85bf-4fd5-b118-0364c9b65d99'),
	(109,151,2,1,1,1,'','{\"typeId\":\"2\",\"authorId\":\"1\",\"title\":\"2018 - Header C\",\"slug\":\"2018-header-c\",\"postDate\":1553816520,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"\",\"fields\":[]}','2019-03-28 23:42:39','2019-03-28 23:42:39','3ff63bb0-ec90-4943-90c0-51fa2debf910'),
	(110,151,2,1,1,2,'','{\"typeId\":\"9\",\"authorId\":\"1\",\"title\":\"2018 Component B\",\"slug\":\"2018-header-c\",\"postDate\":1553816520,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"21\",\"fields\":{\"11\":[\"153\"],\"6\":null,\"14\":{\"155\":{\"type\":\"slide\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"154\"],\"caption\":\"Bond Test\"}}},\"13\":null}}','2019-03-28 23:46:27','2019-03-28 23:46:27','8d0b957a-16b5-43f6-bb28-1ccf4cb21b62'),
	(111,151,2,1,1,3,'','{\"typeId\":\"9\",\"authorId\":\"1\",\"title\":\"2018 Component B - slide\",\"slug\":\"2018-component-b-slide\",\"postDate\":1553816520,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"21\",\"fields\":{\"11\":[\"153\"],\"6\":null,\"14\":{\"155\":{\"type\":\"slide\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"154\"],\"caption\":\"Bond Test\",\"a_link\":\"https://alternacaviarantiaging.com/collections/restructuring-bond-repair\"}}},\"13\":null}}','2019-04-01 19:42:48','2019-04-01 19:42:48','077b0802-1016-4bb7-8b04-0699dd62c55b'),
	(112,23,2,1,1,8,'','{\"typeId\":\"8\",\"authorId\":\"1\",\"title\":\"2018 Component B - Detail\",\"slug\":\"2018-component-a-header\",\"postDate\":1551917940,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"21\",\"fields\":{\"8\":\"The most exclusive product demands a sophisticated packaging update to reflect its balanced nature. Old formula. New styles.\",\"7\":[\"157\"],\"11\":[\"148\"],\"10\":\"Celebrating nearly 20 years of Caviar success, Alterna relaunched the collection with a new look and consistent color palette across all products. In addition, the company introduced a new Caviar Anti-Aging Restructuring Bond Repair product line, aimed at helping to reverse the hair damage from heat styling, free radicals, and excessive coloring.\",\"9\":null,\"6\":\"Caviar Anti-Aging Restage\",\"12\":[\"149\"]}}','2019-04-05 19:24:48','2019-04-05 19:24:48','578432b5-1f3d-4119-88cc-68e2c02d2fd3'),
	(113,23,2,1,1,9,'','{\"typeId\":\"8\",\"authorId\":\"1\",\"title\":\"2018 Component B - Detail\",\"slug\":\"2018-component-a-header\",\"postDate\":1551917940,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"21\",\"fields\":{\"8\":\"The most exclusive product demands a sophisticated packaging update to reflect its balanced nature. Old formula. New styles.\",\"7\":[\"158\"],\"11\":[\"148\"],\"10\":\"Celebrating nearly 20 years of Caviar success, Alterna relaunched the collection with a new look and consistent color palette across all products. In addition, the company introduced a new Caviar Anti-Aging Restructuring Bond Repair product line, aimed at helping to reverse the hair damage from heat styling, free radicals, and excessive coloring.\",\"9\":null,\"6\":\"Caviar Anti-Aging Restage\",\"12\":[\"149\"]}}','2019-04-05 19:50:10','2019-04-05 19:50:10','43665e96-b79a-4ab3-89d5-5b2bbd74244b'),
	(114,151,2,1,1,4,'','{\"typeId\":\"9\",\"authorId\":\"1\",\"title\":\"2018 Component B - slide\",\"slug\":\"2018-component-b-slide\",\"postDate\":1553816520,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"21\",\"fields\":{\"11\":[\"153\"],\"6\":null,\"14\":{\"155\":{\"type\":\"slide\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"154\"],\"caption\":\"Bond Test\",\"a_link\":\"https://alternacaviarantiaging.com/collections/restructuring-bond-repair\"}},\"160\":{\"type\":\"slide\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"159\"],\"caption\":\"Moisture Family\",\"a_link\":null}}},\"13\":null}}','2019-04-05 19:57:46','2019-04-05 19:57:46','72c75d8c-d6ec-47dd-aa40-78d791141671'),
	(115,151,2,1,1,5,'','{\"typeId\":\"9\",\"authorId\":\"1\",\"title\":\"2018 Component B - slide\",\"slug\":\"2018-component-b-slide\",\"postDate\":1553816520,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"21\",\"fields\":{\"11\":[\"153\"],\"6\":null,\"14\":{\"155\":{\"type\":\"slide\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"154\"],\"caption\":\"Bond Test\",\"a_link\":\"https://alternacaviarantiaging.com/collections/restructuring-bond-repair\"}},\"160\":{\"type\":\"slide\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"159\"],\"caption\":\"Moisture Family\",\"a_link\":null}},\"163\":{\"type\":\"slide\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"161\"],\"caption\":\"Anti Frizz Family\",\"a_link\":null}},\"164\":{\"type\":\"slide\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"162\"],\"caption\":\"Stylers\",\"a_link\":null}}},\"13\":null}}','2019-04-05 20:00:29','2019-04-05 20:00:29','3e851d35-9d98-4e68-846a-9cdcfbe86b65'),
	(116,151,2,1,1,6,'','{\"typeId\":\"9\",\"authorId\":\"1\",\"title\":\"2018 Component B - slide\",\"slug\":\"2018-component-b-slide\",\"postDate\":1553816520,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"21\",\"fields\":{\"11\":[\"153\"],\"6\":null,\"14\":{\"155\":{\"type\":\"slide\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"165\"],\"caption\":\"Bond Test\",\"a_link\":\"https://alternacaviarantiaging.com/collections/restructuring-bond-repair\"}},\"160\":{\"type\":\"slide\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"159\"],\"caption\":\"Moisture Family\",\"a_link\":null}},\"163\":{\"type\":\"slide\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"161\"],\"caption\":\"Anti Frizz Family\",\"a_link\":null}},\"164\":{\"type\":\"slide\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"162\"],\"caption\":\"Stylers\",\"a_link\":null}}},\"13\":null}}','2019-04-05 20:02:05','2019-04-05 20:02:05','aec11579-64e7-4948-9ad3-cc3da6d4b9e7'),
	(117,151,2,1,1,7,'','{\"typeId\":\"9\",\"authorId\":\"1\",\"title\":\"2018 Component B - slide\",\"slug\":\"2018-component-b-slide\",\"postDate\":1553816520,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"21\",\"fields\":{\"11\":[\"153\"],\"6\":null,\"14\":{\"155\":{\"type\":\"slide\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"165\"],\"caption\":\"CAVIAR Anti-Aging Restructuring Bond Collection\",\"a_link\":\"https://alternacaviarantiaging.com/collections/restructuring-bond-repair\"}},\"160\":{\"type\":\"slide\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"159\"],\"caption\":\"CAVIAR Anti-Aging Replenishing Moisture Collection\",\"a_link\":\"https://alternacaviarantiaging.com/collections/replenishing-moisture\"}},\"163\":{\"type\":\"slide\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"161\"],\"caption\":\"CAVIAR Anti-Frizz Collection\",\"a_link\":\"https://alternacaviarantiaging.com/collections/anti-frizz\"}},\"164\":{\"type\":\"slide\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"162\"],\"caption\":\"CAVIAR Anti-Aging Professional Styling Collection\",\"a_link\":\"https://alternacaviarantiaging.com/collections/style\"}}},\"13\":null}}','2019-04-05 20:05:49','2019-04-05 20:05:49','003b1a99-497a-4c9d-9125-1e3ce26920a4'),
	(118,166,2,1,1,1,'','{\"typeId\":\"2\",\"authorId\":\"1\",\"title\":\"Video test\",\"slug\":\"video-test\",\"postDate\":1554494820,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"21\",\"fields\":[]}','2019-04-05 20:07:49','2019-04-05 20:07:49','53202b2d-3438-4dbc-bbab-08fb3862c20f'),
	(119,166,2,1,1,2,'','{\"typeId\":\"2\",\"authorId\":\"1\",\"title\":\"2018 - Video test\",\"slug\":\"video-test\",\"postDate\":1554494820,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"21\",\"fields\":[]}','2019-04-05 20:08:01','2019-04-05 20:08:01','85535f9c-a5cf-4e8d-bc90-6e5fdf57e50f'),
	(120,166,2,1,1,3,'','{\"typeId\":\"10\",\"authorId\":\"1\",\"title\":\"2018 - Video test\",\"slug\":\"video-test\",\"postDate\":1554494820,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"21\",\"fields\":{\"8\":null,\"7\":[\"167\"],\"11\":[],\"6\":null,\"12\":[]}}','2019-04-05 20:10:28','2019-04-05 20:10:28','7fae10ad-20d3-41ff-ba76-1f19538c4628'),
	(121,166,2,1,1,4,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"2018 - Video test\",\"slug\":\"video-test\",\"postDate\":1554494820,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"21\",\"fields\":{\"7\":[\"167\"],\"11\":[\"167\"],\"17\":[],\"6\":null}}','2019-04-05 20:13:10','2019-04-05 20:13:10','07d5affb-37fb-4261-a9ff-9ef1b0dc8fd6'),
	(122,22,2,1,1,10,'','{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"2018 Component A - Header\",\"slug\":\"2018-component-a-header\",\"postDate\":1551917880,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"21\",\"fields\":{\"7\":[\"167\"],\"11\":[\"145\"],\"17\":[\"24\"],\"6\":\"Caviar\\n Anti-Aging\\nRestage\"}}','2019-04-05 20:15:22','2019-04-05 20:15:22','3d3c1ac0-6d79-479c-8909-4d23d4c5e38f'),
	(123,168,2,1,1,1,'','{\"typeId\":\"12\",\"authorId\":\"1\",\"title\":\"Homepage\",\"slug\":\"homepage\",\"postDate\":1554765540,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"\",\"fields\":{\"7\":[],\"11\":[\"60\"],\"17\":[],\"6\":\"Alterna Museum Hompage\"}}','2019-04-08 23:19:10','2019-04-08 23:19:10','54eaf345-09fc-450e-accc-8edc6778342c');

/*!40000 ALTER TABLE `craft_entryversions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_fieldgroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_fieldgroups`;

CREATE TABLE `craft_fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_fieldgroups_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_fieldgroups` WRITE;
/*!40000 ALTER TABLE `craft_fieldgroups` DISABLE KEYS */;

INSERT INTO `craft_fieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'Common','2019-03-06 21:56:09','2019-03-06 21:56:09','b0d1693c-d357-4d74-b39e-26fd7345710e'),
	(2,'Global','2019-03-06 23:10:13','2019-03-06 23:10:13','3020d96a-3bcb-4cec-8eb2-ad86d58cfb5d'),
	(3,'Years','2019-03-06 23:39:01','2019-03-06 23:39:01','54201705-7b62-4f50-9c09-c1e4781e2c45');

/*!40000 ALTER TABLE `craft_fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_fieldlayoutfields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_fieldlayoutfields`;

CREATE TABLE `craft_fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_fieldlayoutfields_layoutId_fieldId_unq_idx` (`layoutId`,`fieldId`),
  KEY `craft_fieldlayoutfields_sortOrder_idx` (`sortOrder`),
  KEY `craft_fieldlayoutfields_tabId_idx` (`tabId`),
  KEY `craft_fieldlayoutfields_fieldId_idx` (`fieldId`),
  CONSTRAINT `craft_fieldlayoutfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fieldlayoutfields_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fieldlayoutfields_tabId_fk` FOREIGN KEY (`tabId`) REFERENCES `craft_fieldlayouttabs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `craft_fieldlayoutfields` DISABLE KEYS */;

INSERT INTO `craft_fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,1,1,0,1,'2019-03-06 23:09:43','2019-03-06 23:09:43','492ef4c1-9bf9-4156-8969-42ba4baa43a0'),
	(2,2,2,4,0,1,'2019-03-06 23:33:02','2019-03-06 23:33:02','689cac46-9758-4c17-84e5-6b87eb365783'),
	(3,2,2,2,0,2,'2019-03-06 23:33:02','2019-03-06 23:33:02','a98006c2-6104-40ca-a5fa-39eca6c0648b'),
	(4,2,2,3,0,3,'2019-03-06 23:33:02','2019-03-06 23:33:02','fdb84af9-6e74-4644-bb5f-60f00aa742b0'),
	(6,4,4,1,0,1,'2019-03-06 23:40:04','2019-03-06 23:40:04','d49053fc-3b49-47a7-b541-6f69bb2b6642'),
	(7,5,5,1,0,1,'2019-03-06 23:40:09','2019-03-06 23:40:09','7724908f-8acc-4e91-8d01-ff7a4f67fe49'),
	(14,8,9,12,0,7,'2019-03-07 00:05:25','2019-03-07 00:05:25','5921b7b9-6b0b-4a66-94ea-c5692c4f2303'),
	(15,8,9,10,0,4,'2019-03-07 00:05:25','2019-03-07 00:05:25','63c51c8e-61b4-467c-8bd6-14da2109d686'),
	(16,8,9,9,0,3,'2019-03-07 00:05:25','2019-03-07 00:05:25','878682b7-0b44-4107-a7e8-45bdd8be4ee4'),
	(17,8,9,7,0,6,'2019-03-07 00:05:25','2019-03-07 00:05:25','28d38474-0604-4a5d-9135-7c8b40008ed4'),
	(18,8,9,11,0,5,'2019-03-07 00:05:25','2019-03-07 00:05:25','30be3445-923b-49be-86e6-c6d66a349f47'),
	(19,8,9,8,0,2,'2019-03-07 00:05:25','2019-03-07 00:05:25','10af269a-02d0-4d83-9157-c1bc9b436bf6'),
	(20,8,9,6,0,1,'2019-03-07 00:05:25','2019-03-07 00:05:25','d1a1c3df-4900-4e9e-a9ad-78dbaf95ae6c'),
	(32,7,14,7,0,4,'2019-03-07 00:40:12','2019-03-07 00:40:12','c6ce1770-17e5-40fb-b0ac-a975019e7b29'),
	(33,7,14,11,0,2,'2019-03-07 00:40:12','2019-03-07 00:40:12','567d0192-db16-40da-adef-ad149c34a62d'),
	(34,7,14,17,0,3,'2019-03-07 00:40:12','2019-03-07 00:40:12','da1ba7be-5df3-4909-a4a2-07e6716c0da8'),
	(35,7,14,6,0,1,'2019-03-07 00:40:12','2019-03-07 00:40:12','6b17750a-22d2-44f1-b3ed-409592090d46'),
	(36,11,15,18,0,1,'2019-03-07 01:05:22','2019-03-07 01:05:22','5657857b-308f-4821-a41e-025dcb79aec6'),
	(40,9,17,13,0,2,'2019-03-15 09:34:13','2019-03-15 09:34:13','6f536956-1248-4aeb-8b39-26c2ff880e65'),
	(41,9,17,14,0,4,'2019-03-15 09:34:13','2019-03-15 09:34:13','c65c3654-a617-4e62-a5f9-1680fa3b8241'),
	(42,9,17,11,0,3,'2019-03-15 09:34:13','2019-03-15 09:34:13','53b5ca47-ce11-415a-8209-fdd5c1c1a039'),
	(43,9,17,6,0,1,'2019-03-15 09:34:13','2019-03-15 09:34:13','74c9104e-e707-4401-98ea-3842a0b3166e'),
	(44,10,18,12,0,4,'2019-03-15 10:34:57','2019-03-15 10:34:57','aa0889b0-3766-4ee4-a4cd-9a5baeef2ecd'),
	(45,10,18,7,0,3,'2019-03-15 10:34:57','2019-03-15 10:34:57','16656c7c-5393-4550-b3db-a1e535515fb2'),
	(46,10,18,11,0,5,'2019-03-15 10:34:57','2019-03-15 10:34:57','c11b17b3-e83c-4fae-91e2-0304d8241cc2'),
	(47,10,18,8,0,2,'2019-03-15 10:34:57','2019-03-15 10:34:57','106180e1-4ce7-4916-946a-0188fb5fde2c'),
	(48,10,18,6,0,1,'2019-03-15 10:34:57','2019-03-15 10:34:57','fdd190e1-ec29-4c11-a79f-f36b9f6f2743'),
	(49,12,19,20,0,1,'2019-03-25 22:04:27','2019-03-25 22:04:27','8cc99cb6-65cf-4600-a160-0a0facd1f3f8'),
	(50,12,19,21,0,2,'2019-03-25 22:04:27','2019-03-25 22:04:27','2adb562b-9a1b-4393-8b2d-b87bcc4b618f'),
	(51,12,19,22,0,3,'2019-03-25 22:04:27','2019-03-25 22:04:27','09a58639-42c1-42ab-bdea-b5cfc88fe6e6'),
	(52,12,19,23,0,4,'2019-03-25 22:04:27','2019-03-25 22:04:27','203e7af7-c699-4f4a-990d-423fcb8bbfbe'),
	(53,13,20,19,0,1,'2019-03-25 22:05:03','2019-03-25 22:05:03','798170f8-98a4-46a3-b5a6-0c6a371f4f7a'),
	(54,6,21,16,1,1,'2019-04-01 15:28:47','2019-04-01 15:28:47','baf78c56-40ee-4a67-bd1c-9c064f977353'),
	(55,6,21,15,0,2,'2019-04-01 15:28:47','2019-04-01 15:28:47','ad4b6a8d-4070-4480-82ed-bed89bd7ce2e'),
	(56,6,21,24,0,3,'2019-04-01 15:28:47','2019-04-01 15:28:47','c7af92ef-fe57-4aef-b5e9-f77eef9e32f3'),
	(57,14,22,6,0,1,'2019-04-08 23:18:20','2019-04-08 23:18:20','e988d920-aa61-493a-88fe-2ea131994048'),
	(58,14,22,11,0,2,'2019-04-08 23:18:20','2019-04-08 23:18:20','e3b5a148-e97e-4fb3-9041-d68bfba7b6c8'),
	(59,14,22,17,0,3,'2019-04-08 23:18:20','2019-04-08 23:18:20','455ee6e0-e161-4ff9-a294-2359f8e359f4'),
	(60,14,22,7,0,4,'2019-04-08 23:18:20','2019-04-08 23:18:20','0158dff9-0211-48ff-9e8b-30c67559ba3b'),
	(61,15,23,25,0,1,'2019-04-08 23:35:18','2019-04-08 23:35:18','40979983-a665-45cf-9e73-de53beba7a43'),
	(62,15,23,26,0,2,'2019-04-08 23:35:18','2019-04-08 23:35:18','a7ec7498-a7e9-402f-b092-09c182b414ae'),
	(63,15,23,27,0,3,'2019-04-08 23:35:18','2019-04-08 23:35:18','ab34f9dc-b8f6-4dc2-82ae-4be050469c1a');

/*!40000 ALTER TABLE `craft_fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_fieldlayouts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_fieldlayouts`;

CREATE TABLE `craft_fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_fieldlayouts_dateDeleted_idx` (`dateDeleted`),
  KEY `craft_fieldlayouts_type_idx` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_fieldlayouts` WRITE;
/*!40000 ALTER TABLE `craft_fieldlayouts` DISABLE KEYS */;

INSERT INTO `craft_fieldlayouts` (`id`, `type`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,'craft\\elements\\Entry','2019-03-06 23:09:43','2019-03-06 23:09:43',NULL,'bbd5a8ba-90ec-419b-8719-472a49742274'),
	(2,'craft\\elements\\GlobalSet','2019-03-06 23:33:02','2019-03-06 23:33:02',NULL,'d129c5b6-91e2-468b-a9f3-bae239bb1639'),
	(3,'craft\\elements\\Entry','2019-03-06 23:39:53','2019-03-06 23:39:53',NULL,'4bee5c38-01d9-4355-9893-6236f9181785'),
	(4,'craft\\elements\\Entry','2019-03-06 23:40:04','2019-03-06 23:40:04','2019-03-06 23:54:50','f67f5df9-b57c-4fc5-b0a9-c573c71ac28c'),
	(5,'craft\\elements\\Entry','2019-03-06 23:40:09','2019-03-06 23:40:09','2019-03-06 23:54:52','69f24680-bc4b-49b6-8ee7-28f6779b486b'),
	(6,'craft\\elements\\MatrixBlock','2019-03-06 23:53:10','2019-04-01 15:28:47',NULL,'72ac5113-02ad-4c37-8798-b30afc1dfd1b'),
	(7,'craft\\elements\\Entry','2019-03-06 23:55:47','2019-03-07 00:40:12',NULL,'a08a2631-d8fe-4fd9-9eaf-da2b3368a9a6'),
	(8,'craft\\elements\\Entry','2019-03-07 00:05:25','2019-03-07 00:05:25',NULL,'e478c8d0-144d-4e82-95a4-5c48ab813a87'),
	(9,'craft\\elements\\Entry','2019-03-07 00:06:51','2019-03-15 09:34:13',NULL,'969d4a22-e47b-40a7-b039-6520912336cb'),
	(10,'craft\\elements\\Entry','2019-03-07 00:07:44','2019-03-15 10:34:57',NULL,'c19b1fa0-5d03-4ac7-96b1-1a68a143c465'),
	(11,'craft\\elements\\Entry','2019-03-07 01:05:22','2019-03-07 01:05:22',NULL,'186cf6a5-7023-40d9-9d36-3220a79c0de8'),
	(12,'craft\\elements\\MatrixBlock','2019-03-25 22:04:27','2019-03-25 22:04:27',NULL,'ce0056fc-f5db-4ed5-b07a-0c80d5370de7'),
	(13,'craft\\elements\\GlobalSet','2019-03-25 22:05:03','2019-03-25 22:05:03',NULL,'d980f75e-95ff-4b96-9c8a-5d11772565e2'),
	(14,'craft\\elements\\Entry','2019-04-08 23:18:20','2019-04-08 23:18:20',NULL,'7b110b4a-dd19-443b-b3d4-c7b7ebe687ca'),
	(15,'craft\\elements\\GlobalSet','2019-04-08 23:35:18','2019-04-08 23:35:18',NULL,'ee71f6ea-1f4b-450b-b138-bbe872494278');

/*!40000 ALTER TABLE `craft_fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_fieldlayouttabs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_fieldlayouttabs`;

CREATE TABLE `craft_fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_fieldlayouttabs_sortOrder_idx` (`sortOrder`),
  KEY `craft_fieldlayouttabs_layoutId_idx` (`layoutId`),
  CONSTRAINT `craft_fieldlayouttabs_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `craft_fieldlayouttabs` DISABLE KEYS */;

INSERT INTO `craft_fieldlayouttabs` (`id`, `layoutId`, `name`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'Tab 1',1,'2019-03-06 23:09:43','2019-03-06 23:09:43','fc4c3b5a-c453-4210-be2f-2858f13c0aae'),
	(2,2,'General Scripts',1,'2019-03-06 23:33:02','2019-03-06 23:33:02','6ff97344-a7fc-4322-94ac-3b8463cc34a9'),
	(3,3,'Year',1,'2019-03-06 23:39:53','2019-03-06 23:39:53','a2303936-a5d9-4a65-8daf-bf5d4207bc7e'),
	(4,4,'Tab 1',1,'2019-03-06 23:40:04','2019-03-06 23:40:04','453d2710-2114-49e8-b0a8-3e2dafa0db3b'),
	(5,5,'Tab 1',1,'2019-03-06 23:40:09','2019-03-06 23:40:09','997e1d04-6bcd-4cee-85c7-0c9b10a87a0d'),
	(9,8,'Component B - Detail',1,'2019-03-07 00:05:25','2019-03-07 00:05:25','0f336471-45cc-453f-822d-a0d182363488'),
	(14,7,'Component A - Header',1,'2019-03-07 00:40:12','2019-03-07 00:40:12','455bad62-933b-48b7-826b-27f5bf7c1977'),
	(15,11,'Privcay',1,'2019-03-07 01:05:22','2019-03-07 01:05:22','4ffe3b9a-02f6-4dfe-9517-42777664e8d3'),
	(17,9,'Component B - Slideshow',1,'2019-03-15 09:34:13','2019-03-15 09:34:13','605319c7-5dc0-45e0-b1ab-738015ccf7fc'),
	(18,10,'Component B - Video',1,'2019-03-15 10:34:57','2019-03-15 10:34:57','d1ba8851-9ec8-4270-9603-15426e826536'),
	(19,12,'Content',1,'2019-03-25 22:04:27','2019-03-25 22:04:27','a8e2074d-fb30-4374-9b18-5b2461e0190e'),
	(20,13,'Social Media',1,'2019-03-25 22:05:03','2019-03-25 22:05:03','95d3d6b9-065e-4716-a06f-31858207946a'),
	(21,6,'Content',1,'2019-04-01 15:28:47','2019-04-01 15:28:47','71079f35-11ef-455e-aac2-79a6284aba7e'),
	(22,14,'Homepage',1,'2019-04-08 23:18:20','2019-04-08 23:18:20','41fcf9f9-d699-41ec-8685-65f87df7b255'),
	(23,15,'Default Seo',1,'2019-04-08 23:35:18','2019-04-08 23:35:18','6ce3bd1f-b77f-47f4-9bd9-1b300eff12ac');

/*!40000 ALTER TABLE `craft_fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_fields`;

CREATE TABLE `craft_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_fields_handle_context_unq_idx` (`handle`,`context`),
  KEY `craft_fields_groupId_idx` (`groupId`),
  KEY `craft_fields_context_idx` (`context`),
  CONSTRAINT `craft_fields_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_fields` WRITE;
/*!40000 ALTER TABLE `craft_fields` DISABLE KEYS */;

INSERT INTO `craft_fields` (`id`, `groupId`, `name`, `handle`, `context`, `instructions`, `searchable`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'Body','body','global','',1,'none',NULL,'craft\\fields\\PlainText','{\"charLimit\":\"\",\"code\":\"\",\"columnType\":\"text\",\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\"}','2019-03-06 23:08:54','2019-03-06 23:08:54','18f79ec1-c879-4a02-8733-819399fc335d'),
	(2,2,'Body Script','bodyScript','global','Add scripts right after <body>',1,'none',NULL,'craft\\fields\\PlainText','{\"charLimit\":\"\",\"code\":\"\",\"columnType\":\"text\",\"initialRows\":\"4\",\"multiline\":\"1\",\"placeholder\":\"\"}','2019-03-06 23:10:30','2019-03-06 23:28:55','ad1785f7-181b-4aae-b812-f71709a0d24d'),
	(3,2,'Footer Scripts','footerScripts','global','Add scripts before </body>',1,'none',NULL,'craft\\fields\\PlainText','{\"charLimit\":\"\",\"code\":\"\",\"columnType\":\"text\",\"initialRows\":\"4\",\"multiline\":\"1\",\"placeholder\":\"\"}','2019-03-06 23:12:14','2019-03-06 23:12:14','f4e1ac4c-6071-4bc5-860a-45320591c47c'),
	(4,2,'Header Scripts','headerScripts','global','Add scripts before </head>',1,'none',NULL,'craft\\fields\\PlainText','{\"charLimit\":\"\",\"code\":\"\",\"columnType\":\"text\",\"initialRows\":\"4\",\"multiline\":\"1\",\"placeholder\":\"\"}','2019-03-06 23:32:26','2019-03-06 23:32:26','0566931d-f194-4662-a626-8b45fa255547'),
	(6,3,'Header Title','headerTitle','global','<h2> Header Title',1,'none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"1\",\"charLimit\":\"\",\"columnType\":\"text\"}','2019-03-06 23:45:30','2019-03-25 21:58:14','f0bb2b8b-8136-4cfd-8a3a-d3add0605e90'),
	(7,3,'Anchor Image','anchorImage','global','This could be either an image or a video.',1,'site',NULL,'craft\\fields\\Assets','{\"useSingleFolder\":\"\",\"defaultUploadLocationSource\":\"volume:d067482b-b20a-44ab-9911-d8f0364fa01b\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"volume:d067482b-b20a-44ab-9911-d8f0364fa01b\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"\",\"allowedKinds\":null,\"sources\":[\"volume:d067482b-b20a-44ab-9911-d8f0364fa01b\"],\"source\":null,\"targetSiteId\":null,\"viewMode\":\"list\",\"limit\":\"1\",\"selectionLabel\":\"\",\"localizeRelations\":false}','2019-03-06 23:46:06','2019-04-08 23:14:14','b553a5b5-982a-45d8-8f31-a396f6e55a09'),
	(8,3,'Anchor Description','anchorDescription','global','<h3> Anchor Description',1,'none',NULL,'craft\\fields\\PlainText','{\"charLimit\":\"250\",\"code\":\"\",\"columnType\":\"text\",\"initialRows\":\"2\",\"multiline\":\"1\",\"placeholder\":\"\"}','2019-03-06 23:48:16','2019-03-13 15:01:02','e23eab83-3105-4fec-97ab-048b94c38693'),
	(9,3,'Detail Sub-Header','detailSubHeader','global','<h4> Detail Sub-Header',1,'none',NULL,'craft\\fields\\PlainText','{\"charLimit\":\"80\",\"code\":\"\",\"columnType\":\"text\",\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\"}','2019-03-06 23:49:34','2019-03-06 23:49:34','8c5099ec-1b30-4d8a-815a-21a959b8326a'),
	(10,3,'Detail Description','detailDescription','global','<h5> Detail Description',1,'none',NULL,'craft\\fields\\PlainText','{\"charLimit\":\"500\",\"code\":\"\",\"columnType\":\"text\",\"initialRows\":\"4\",\"multiline\":\"1\",\"placeholder\":\"\"}','2019-03-06 23:50:07','2019-03-06 23:50:07','49ee335b-dc17-48e5-a210-5e93cbf251cd'),
	(11,3,'Background Image','backgroundImage','global','',1,'site',NULL,'craft\\fields\\Assets','{\"allowedKinds\":null,\"defaultUploadLocationSource\":\"volume:d067482b-b20a-44ab-9911-d8f0364fa01b\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"restrictFiles\":\"\",\"selectionLabel\":\"\",\"singleUploadLocationSource\":\"volume:d067482b-b20a-44ab-9911-d8f0364fa01b\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":[\"volume:d067482b-b20a-44ab-9911-d8f0364fa01b\"],\"targetSiteId\":null,\"useSingleFolder\":\"\",\"viewMode\":\"list\"}','2019-03-06 23:50:56','2019-03-06 23:50:56','d941a090-ca03-4d9b-8e97-7acc180af1df'),
	(12,3,'Parallax Image','parallaxImage','global','',1,'site',NULL,'craft\\fields\\Assets','{\"allowedKinds\":null,\"defaultUploadLocationSource\":\"volume:d067482b-b20a-44ab-9911-d8f0364fa01b\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"restrictFiles\":\"\",\"selectionLabel\":\"\",\"singleUploadLocationSource\":\"volume:d067482b-b20a-44ab-9911-d8f0364fa01b\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":[\"volume:d067482b-b20a-44ab-9911-d8f0364fa01b\"],\"targetSiteId\":null,\"useSingleFolder\":\"\",\"viewMode\":\"list\"}','2019-03-06 23:51:20','2019-03-06 23:51:20','3277bca1-c643-4ebb-8088-64835b20c98a'),
	(13,3,'Slideshow Title','slideshowTitle','global','<h3> Slideshow Title',1,'none',NULL,'craft\\fields\\PlainText','{\"charLimit\":\"80\",\"code\":\"\",\"columnType\":\"text\",\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\"}','2019-03-06 23:52:02','2019-03-06 23:52:02','bb32a9b4-332f-44be-8a77-2ecbef5b53e9'),
	(14,3,'Slideshow Images','slideshowImages','global','',1,'site',NULL,'craft\\fields\\Matrix','{\"minBlocks\":\"\",\"maxBlocks\":\"\",\"contentTable\":\"{{%matrixcontent_slideshowimages}}\",\"localizeBlocks\":false}','2019-03-06 23:53:10','2019-04-01 15:28:46','d4fb7b46-27ee-40bb-8c89-fd0b34f32974'),
	(15,NULL,'Caption','caption','matrixBlockType:70d5c8f3-90d4-493f-809c-c570a4a72a0b','',1,'none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"80\",\"columnType\":\"text\"}','2019-03-06 23:53:10','2019-04-01 15:28:46','cdacce13-3d4b-4b45-b13e-d4d7737b990c'),
	(16,NULL,'Image','image','matrixBlockType:70d5c8f3-90d4-493f-809c-c570a4a72a0b','',1,'site',NULL,'craft\\fields\\Assets','{\"useSingleFolder\":\"\",\"defaultUploadLocationSource\":\"volume:d067482b-b20a-44ab-9911-d8f0364fa01b\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"volume:d067482b-b20a-44ab-9911-d8f0364fa01b\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"\",\"allowedKinds\":null,\"sources\":[\"volume:d067482b-b20a-44ab-9911-d8f0364fa01b\"],\"source\":null,\"targetSiteId\":null,\"viewMode\":\"list\",\"limit\":\"1\",\"selectionLabel\":\"\",\"localizeRelations\":false}','2019-03-06 23:53:10','2019-04-01 15:28:46','d07d8d17-8376-43a1-b754-84979a8c8db2'),
	(17,3,'Header Image','headerImage','global','This could be either an image or a video.',1,'site',NULL,'craft\\fields\\Assets','{\"useSingleFolder\":\"\",\"defaultUploadLocationSource\":\"volume:d067482b-b20a-44ab-9911-d8f0364fa01b\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"volume:d067482b-b20a-44ab-9911-d8f0364fa01b\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"\",\"allowedKinds\":null,\"sources\":[\"volume:d067482b-b20a-44ab-9911-d8f0364fa01b\"],\"source\":null,\"targetSiteId\":null,\"viewMode\":\"list\",\"limit\":\"1\",\"selectionLabel\":\"\",\"localizeRelations\":false}','2019-03-07 00:39:31','2019-04-08 23:14:36','ebc4dd15-1b97-4266-b80d-9dccb116a90e'),
	(18,1,'Rich Text Content','richTextContent','global','',1,'none',NULL,'craft\\redactor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"cleanupHtml\":\"1\",\"columnType\":\"text\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"Extended.json\"}','2019-03-07 01:03:54','2019-03-07 01:03:54','10639f2a-49eb-4f37-9254-6d8cf67e1ebe'),
	(19,2,'Social Media','socialMedia','global','',1,'site',NULL,'craft\\fields\\Matrix','{\"minBlocks\":\"\",\"maxBlocks\":\"1\",\"contentTable\":\"{{%matrixcontent_socialmedia}}\",\"localizeBlocks\":false}','2019-03-25 22:04:26','2019-03-25 22:04:26','3f314e24-e30c-4a7a-8a92-f69416ba7341'),
	(20,NULL,'Facebook','facebook','matrixBlockType:f172c7d8-89a1-44de-a466-9da0950d37f8','',1,'none',NULL,'craft\\fields\\Url','{\"placeholder\":\"\"}','2019-03-25 22:04:27','2019-03-25 22:04:27','9b365935-a17d-4b3a-b5eb-f85489047661'),
	(21,NULL,'Instagram','instagram','matrixBlockType:f172c7d8-89a1-44de-a466-9da0950d37f8','',1,'none',NULL,'craft\\fields\\Url','{\"placeholder\":\"\"}','2019-03-25 22:04:27','2019-03-25 22:04:27','f5fef2b6-8662-40a1-a305-723f7e918e21'),
	(22,NULL,'Twitter','twitter','matrixBlockType:f172c7d8-89a1-44de-a466-9da0950d37f8','',1,'none',NULL,'craft\\fields\\Url','{\"placeholder\":\"\"}','2019-03-25 22:04:27','2019-03-25 22:04:27','81acff15-dfe3-42a0-933c-1c3f3fedc815'),
	(23,NULL,'Pinterest','pinterest','matrixBlockType:f172c7d8-89a1-44de-a466-9da0950d37f8','',1,'none',NULL,'craft\\fields\\Url','{\"placeholder\":\"\"}','2019-03-25 22:04:27','2019-03-25 22:04:27','31f41cf5-b2f7-474f-8614-244a42ad6e5d'),
	(24,NULL,'Link','a_link','matrixBlockType:70d5c8f3-90d4-493f-809c-c570a4a72a0b','',1,'none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2019-04-01 15:28:47','2019-04-01 15:28:47','6d0e276e-8c0f-4732-a7bf-13bb6c46f4a4'),
	(25,2,'SEO Title','seoTitle','global','',1,'none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2019-04-04 23:05:41','2019-04-04 23:05:41','8b2133e2-ac59-4e7c-84eb-e1648fb2b5d3'),
	(26,2,'SEO Description','seoDescription','global','',1,'none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"2\",\"charLimit\":\"\",\"columnType\":\"text\"}','2019-04-04 23:05:56','2019-04-04 23:05:56','927b7cf1-6d2d-43f4-a48d-ed3afb392029'),
	(27,2,'SEO Image','seoImage','global','',1,'site',NULL,'craft\\fields\\Assets','{\"useSingleFolder\":\"\",\"defaultUploadLocationSource\":\"volume:d067482b-b20a-44ab-9911-d8f0364fa01b\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"volume:d067482b-b20a-44ab-9911-d8f0364fa01b\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"\",\"allowedKinds\":null,\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":\"list\",\"limit\":\"1\",\"selectionLabel\":\"\",\"localizeRelations\":false}','2019-04-04 23:06:12','2019-04-04 23:06:12','4a8b8bc0-cf6e-4961-9717-737fdea7f7ea');

/*!40000 ALTER TABLE `craft_fields` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_globalsets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_globalsets`;

CREATE TABLE `craft_globalsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_globalsets_name_unq_idx` (`name`),
  UNIQUE KEY `craft_globalsets_handle_unq_idx` (`handle`),
  KEY `craft_globalsets_fieldLayoutId_idx` (`fieldLayoutId`),
  CONSTRAINT `craft_globalsets_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_globalsets_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_globalsets` WRITE;
/*!40000 ALTER TABLE `craft_globalsets` DISABLE KEYS */;

INSERT INTO `craft_globalsets` (`id`, `name`, `handle`, `fieldLayoutId`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(3,'General Scripts','generalScripts',2,'2019-03-06 23:33:02','2019-03-06 23:33:02','23c17581-5a78-44f0-b876-aae217f0d824'),
	(143,'Social Media','socialMedia',13,'2019-03-25 22:05:03','2019-03-25 22:05:03','b99c7e9b-4fa2-44c8-9201-d05460a21229'),
	(169,'Default Seo','defaultSeo',15,'2019-04-08 23:35:18','2019-04-08 23:35:18','36671716-ddb0-4f4c-a827-9a95d4228a7b');

/*!40000 ALTER TABLE `craft_globalsets` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_info
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_info`;

CREATE TABLE `craft_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `config` mediumtext,
  `configMap` mediumtext,
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_info` WRITE;
/*!40000 ALTER TABLE `craft_info` DISABLE KEYS */;

INSERT INTO `craft_info` (`id`, `version`, `schemaVersion`, `maintenance`, `config`, `configMap`, `fieldVersion`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'3.1.19','3.1.25',0,'a:13:{s:12:\"dateModified\";i:1554766518;s:5:\"email\";a:3:{s:9:\"fromEmail\";s:16:\"dev@skyrocket.is\";s:8:\"fromName\";s:16:\"Alterna Haircare\";s:13:\"transportType\";s:37:\"craft\\mail\\transportadapters\\Sendmail\";}s:11:\"fieldGroups\";a:3:{s:36:\"3020d96a-3bcb-4cec-8eb2-ad86d58cfb5d\";a:1:{s:4:\"name\";s:6:\"Global\";}s:36:\"54201705-7b62-4f50-9c09-c1e4781e2c45\";a:1:{s:4:\"name\";s:5:\"Years\";}s:36:\"b0d1693c-d357-4d74-b39e-26fd7345710e\";a:1:{s:4:\"name\";s:6:\"Common\";}}s:6:\"fields\";a:19:{s:36:\"0566931d-f194-4662-a626-8b45fa255547\";a:10:{s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";s:36:\"3020d96a-3bcb-4cec-8eb2-ad86d58cfb5d\";s:6:\"handle\";s:13:\"headerScripts\";s:12:\"instructions\";s:26:\"Add scripts before </head>\";s:4:\"name\";s:14:\"Header Scripts\";s:10:\"searchable\";b:1;s:8:\"settings\";a:6:{s:9:\"charLimit\";s:0:\"\";s:4:\"code\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";s:11:\"initialRows\";s:1:\"4\";s:9:\"multiline\";s:1:\"1\";s:11:\"placeholder\";s:0:\"\";}s:20:\"translationKeyFormat\";N;s:17:\"translationMethod\";s:4:\"none\";s:4:\"type\";s:22:\"craft\\fields\\PlainText\";}s:36:\"10639f2a-49eb-4f37-9254-6d8cf67e1ebe\";a:10:{s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";s:36:\"b0d1693c-d357-4d74-b39e-26fd7345710e\";s:6:\"handle\";s:15:\"richTextContent\";s:12:\"instructions\";s:0:\"\";s:4:\"name\";s:17:\"Rich Text Content\";s:10:\"searchable\";b:1;s:8:\"settings\";a:7:{s:19:\"availableTransforms\";s:1:\"*\";s:16:\"availableVolumes\";s:1:\"*\";s:11:\"cleanupHtml\";s:1:\"1\";s:10:\"columnType\";s:4:\"text\";s:14:\"purifierConfig\";s:0:\"\";s:10:\"purifyHtml\";s:1:\"1\";s:14:\"redactorConfig\";s:13:\"Extended.json\";}s:20:\"translationKeyFormat\";N;s:17:\"translationMethod\";s:4:\"none\";s:4:\"type\";s:20:\"craft\\redactor\\Field\";}s:36:\"18f79ec1-c879-4a02-8733-819399fc335d\";a:10:{s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";s:36:\"b0d1693c-d357-4d74-b39e-26fd7345710e\";s:6:\"handle\";s:4:\"body\";s:12:\"instructions\";s:0:\"\";s:4:\"name\";s:4:\"Body\";s:10:\"searchable\";b:1;s:8:\"settings\";a:6:{s:9:\"charLimit\";s:0:\"\";s:4:\"code\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";s:11:\"initialRows\";s:1:\"4\";s:9:\"multiline\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";}s:20:\"translationKeyFormat\";N;s:17:\"translationMethod\";s:4:\"none\";s:4:\"type\";s:22:\"craft\\fields\\PlainText\";}s:36:\"3277bca1-c643-4ebb-8088-64835b20c98a\";a:10:{s:17:\"contentColumnType\";s:6:\"string\";s:10:\"fieldGroup\";s:36:\"54201705-7b62-4f50-9c09-c1e4781e2c45\";s:6:\"handle\";s:13:\"parallaxImage\";s:12:\"instructions\";s:0:\"\";s:4:\"name\";s:14:\"Parallax Image\";s:10:\"searchable\";b:1;s:8:\"settings\";a:14:{s:12:\"allowedKinds\";N;s:27:\"defaultUploadLocationSource\";s:43:\"volume:d067482b-b20a-44ab-9911-d8f0364fa01b\";s:28:\"defaultUploadLocationSubpath\";s:0:\"\";s:5:\"limit\";s:1:\"1\";s:17:\"localizeRelations\";b:0;s:13:\"restrictFiles\";s:0:\"\";s:14:\"selectionLabel\";s:0:\"\";s:26:\"singleUploadLocationSource\";s:43:\"volume:d067482b-b20a-44ab-9911-d8f0364fa01b\";s:27:\"singleUploadLocationSubpath\";s:0:\"\";s:6:\"source\";N;s:7:\"sources\";a:1:{i:0;s:43:\"volume:d067482b-b20a-44ab-9911-d8f0364fa01b\";}s:12:\"targetSiteId\";N;s:15:\"useSingleFolder\";s:0:\"\";s:8:\"viewMode\";s:4:\"list\";}s:20:\"translationKeyFormat\";N;s:17:\"translationMethod\";s:4:\"site\";s:4:\"type\";s:19:\"craft\\fields\\Assets\";}s:36:\"49ee335b-dc17-48e5-a210-5e93cbf251cd\";a:10:{s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";s:36:\"54201705-7b62-4f50-9c09-c1e4781e2c45\";s:6:\"handle\";s:17:\"detailDescription\";s:12:\"instructions\";s:23:\"<h5> Detail Description\";s:4:\"name\";s:18:\"Detail Description\";s:10:\"searchable\";b:1;s:8:\"settings\";a:6:{s:9:\"charLimit\";s:3:\"500\";s:4:\"code\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";s:11:\"initialRows\";s:1:\"4\";s:9:\"multiline\";s:1:\"1\";s:11:\"placeholder\";s:0:\"\";}s:20:\"translationKeyFormat\";N;s:17:\"translationMethod\";s:4:\"none\";s:4:\"type\";s:22:\"craft\\fields\\PlainText\";}s:36:\"8c5099ec-1b30-4d8a-815a-21a959b8326a\";a:10:{s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";s:36:\"54201705-7b62-4f50-9c09-c1e4781e2c45\";s:6:\"handle\";s:15:\"detailSubHeader\";s:12:\"instructions\";s:22:\"<h4> Detail Sub-Header\";s:4:\"name\";s:17:\"Detail Sub-Header\";s:10:\"searchable\";b:1;s:8:\"settings\";a:6:{s:9:\"charLimit\";s:2:\"80\";s:4:\"code\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";s:11:\"initialRows\";s:1:\"4\";s:9:\"multiline\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";}s:20:\"translationKeyFormat\";N;s:17:\"translationMethod\";s:4:\"none\";s:4:\"type\";s:22:\"craft\\fields\\PlainText\";}s:36:\"ad1785f7-181b-4aae-b812-f71709a0d24d\";a:10:{s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";s:36:\"3020d96a-3bcb-4cec-8eb2-ad86d58cfb5d\";s:6:\"handle\";s:10:\"bodyScript\";s:12:\"instructions\";s:30:\"Add scripts right after <body>\";s:4:\"name\";s:11:\"Body Script\";s:10:\"searchable\";b:1;s:8:\"settings\";a:6:{s:9:\"charLimit\";s:0:\"\";s:4:\"code\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";s:11:\"initialRows\";s:1:\"4\";s:9:\"multiline\";s:1:\"1\";s:11:\"placeholder\";s:0:\"\";}s:20:\"translationKeyFormat\";N;s:17:\"translationMethod\";s:4:\"none\";s:4:\"type\";s:22:\"craft\\fields\\PlainText\";}s:36:\"b553a5b5-982a-45d8-8f31-a396f6e55a09\";a:10:{s:4:\"name\";s:12:\"Anchor Image\";s:6:\"handle\";s:11:\"anchorImage\";s:12:\"instructions\";s:41:\"This could be either an image or a video.\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"site\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:19:\"craft\\fields\\Assets\";s:8:\"settings\";a:14:{s:15:\"useSingleFolder\";s:0:\"\";s:27:\"defaultUploadLocationSource\";s:43:\"volume:d067482b-b20a-44ab-9911-d8f0364fa01b\";s:28:\"defaultUploadLocationSubpath\";s:0:\"\";s:26:\"singleUploadLocationSource\";s:43:\"volume:d067482b-b20a-44ab-9911-d8f0364fa01b\";s:27:\"singleUploadLocationSubpath\";s:0:\"\";s:13:\"restrictFiles\";s:0:\"\";s:12:\"allowedKinds\";N;s:7:\"sources\";a:1:{i:0;s:43:\"volume:d067482b-b20a-44ab-9911-d8f0364fa01b\";}s:6:\"source\";N;s:12:\"targetSiteId\";N;s:8:\"viewMode\";s:4:\"list\";s:5:\"limit\";s:1:\"1\";s:14:\"selectionLabel\";s:0:\"\";s:17:\"localizeRelations\";b:0;}s:17:\"contentColumnType\";s:6:\"string\";s:10:\"fieldGroup\";s:36:\"54201705-7b62-4f50-9c09-c1e4781e2c45\";}s:36:\"bb32a9b4-332f-44be-8a77-2ecbef5b53e9\";a:10:{s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";s:36:\"54201705-7b62-4f50-9c09-c1e4781e2c45\";s:6:\"handle\";s:14:\"slideshowTitle\";s:12:\"instructions\";s:20:\"<h3> Slideshow Title\";s:4:\"name\";s:15:\"Slideshow Title\";s:10:\"searchable\";b:1;s:8:\"settings\";a:6:{s:9:\"charLimit\";s:2:\"80\";s:4:\"code\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";s:11:\"initialRows\";s:1:\"4\";s:9:\"multiline\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";}s:20:\"translationKeyFormat\";N;s:17:\"translationMethod\";s:4:\"none\";s:4:\"type\";s:22:\"craft\\fields\\PlainText\";}s:36:\"d4fb7b46-27ee-40bb-8c89-fd0b34f32974\";a:10:{s:4:\"name\";s:16:\"Slideshow Images\";s:6:\"handle\";s:15:\"slideshowImages\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"site\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:19:\"craft\\fields\\Matrix\";s:8:\"settings\";a:4:{s:9:\"minBlocks\";s:0:\"\";s:9:\"maxBlocks\";s:0:\"\";s:12:\"contentTable\";s:34:\"{{%matrixcontent_slideshowimages}}\";s:14:\"localizeBlocks\";b:0;}s:17:\"contentColumnType\";s:6:\"string\";s:10:\"fieldGroup\";s:36:\"54201705-7b62-4f50-9c09-c1e4781e2c45\";}s:36:\"d941a090-ca03-4d9b-8e97-7acc180af1df\";a:10:{s:17:\"contentColumnType\";s:6:\"string\";s:10:\"fieldGroup\";s:36:\"54201705-7b62-4f50-9c09-c1e4781e2c45\";s:6:\"handle\";s:15:\"backgroundImage\";s:12:\"instructions\";s:0:\"\";s:4:\"name\";s:16:\"Background Image\";s:10:\"searchable\";b:1;s:8:\"settings\";a:14:{s:12:\"allowedKinds\";N;s:27:\"defaultUploadLocationSource\";s:43:\"volume:d067482b-b20a-44ab-9911-d8f0364fa01b\";s:28:\"defaultUploadLocationSubpath\";s:0:\"\";s:5:\"limit\";s:1:\"1\";s:17:\"localizeRelations\";b:0;s:13:\"restrictFiles\";s:0:\"\";s:14:\"selectionLabel\";s:0:\"\";s:26:\"singleUploadLocationSource\";s:43:\"volume:d067482b-b20a-44ab-9911-d8f0364fa01b\";s:27:\"singleUploadLocationSubpath\";s:0:\"\";s:6:\"source\";N;s:7:\"sources\";a:1:{i:0;s:43:\"volume:d067482b-b20a-44ab-9911-d8f0364fa01b\";}s:12:\"targetSiteId\";N;s:15:\"useSingleFolder\";s:0:\"\";s:8:\"viewMode\";s:4:\"list\";}s:20:\"translationKeyFormat\";N;s:17:\"translationMethod\";s:4:\"site\";s:4:\"type\";s:19:\"craft\\fields\\Assets\";}s:36:\"e23eab83-3105-4fec-97ab-048b94c38693\";a:10:{s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";s:36:\"54201705-7b62-4f50-9c09-c1e4781e2c45\";s:6:\"handle\";s:17:\"anchorDescription\";s:12:\"instructions\";s:23:\"<h3> Anchor Description\";s:4:\"name\";s:18:\"Anchor Description\";s:10:\"searchable\";b:1;s:8:\"settings\";a:6:{s:9:\"charLimit\";s:3:\"250\";s:4:\"code\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";s:11:\"initialRows\";s:1:\"2\";s:9:\"multiline\";s:1:\"1\";s:11:\"placeholder\";s:0:\"\";}s:20:\"translationKeyFormat\";N;s:17:\"translationMethod\";s:4:\"none\";s:4:\"type\";s:22:\"craft\\fields\\PlainText\";}s:36:\"ebc4dd15-1b97-4266-b80d-9dccb116a90e\";a:10:{s:4:\"name\";s:12:\"Header Image\";s:6:\"handle\";s:11:\"headerImage\";s:12:\"instructions\";s:41:\"This could be either an image or a video.\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"site\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:19:\"craft\\fields\\Assets\";s:8:\"settings\";a:14:{s:15:\"useSingleFolder\";s:0:\"\";s:27:\"defaultUploadLocationSource\";s:43:\"volume:d067482b-b20a-44ab-9911-d8f0364fa01b\";s:28:\"defaultUploadLocationSubpath\";s:0:\"\";s:26:\"singleUploadLocationSource\";s:43:\"volume:d067482b-b20a-44ab-9911-d8f0364fa01b\";s:27:\"singleUploadLocationSubpath\";s:0:\"\";s:13:\"restrictFiles\";s:0:\"\";s:12:\"allowedKinds\";N;s:7:\"sources\";a:1:{i:0;s:43:\"volume:d067482b-b20a-44ab-9911-d8f0364fa01b\";}s:6:\"source\";N;s:12:\"targetSiteId\";N;s:8:\"viewMode\";s:4:\"list\";s:5:\"limit\";s:1:\"1\";s:14:\"selectionLabel\";s:0:\"\";s:17:\"localizeRelations\";b:0;}s:17:\"contentColumnType\";s:6:\"string\";s:10:\"fieldGroup\";s:36:\"54201705-7b62-4f50-9c09-c1e4781e2c45\";}s:36:\"f0bb2b8b-8136-4cfd-8a3a-d3add0605e90\";a:10:{s:4:\"name\";s:12:\"Header Title\";s:6:\"handle\";s:11:\"headerTitle\";s:12:\"instructions\";s:17:\"<h2> Header Title\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:22:\"craft\\fields\\PlainText\";s:8:\"settings\";a:6:{s:11:\"placeholder\";s:0:\"\";s:4:\"code\";s:0:\"\";s:9:\"multiline\";s:1:\"1\";s:11:\"initialRows\";s:1:\"1\";s:9:\"charLimit\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";}s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";s:36:\"54201705-7b62-4f50-9c09-c1e4781e2c45\";}s:36:\"f4e1ac4c-6071-4bc5-860a-45320591c47c\";a:10:{s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";s:36:\"3020d96a-3bcb-4cec-8eb2-ad86d58cfb5d\";s:6:\"handle\";s:13:\"footerScripts\";s:12:\"instructions\";s:26:\"Add scripts before </body>\";s:4:\"name\";s:14:\"Footer Scripts\";s:10:\"searchable\";b:1;s:8:\"settings\";a:6:{s:9:\"charLimit\";s:0:\"\";s:4:\"code\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";s:11:\"initialRows\";s:1:\"4\";s:9:\"multiline\";s:1:\"1\";s:11:\"placeholder\";s:0:\"\";}s:20:\"translationKeyFormat\";N;s:17:\"translationMethod\";s:4:\"none\";s:4:\"type\";s:22:\"craft\\fields\\PlainText\";}s:36:\"3f314e24-e30c-4a7a-8a92-f69416ba7341\";a:10:{s:4:\"name\";s:12:\"Social Media\";s:6:\"handle\";s:11:\"socialMedia\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"site\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:19:\"craft\\fields\\Matrix\";s:8:\"settings\";a:4:{s:9:\"minBlocks\";s:0:\"\";s:9:\"maxBlocks\";s:1:\"1\";s:12:\"contentTable\";s:30:\"{{%matrixcontent_socialmedia}}\";s:14:\"localizeBlocks\";b:0;}s:17:\"contentColumnType\";s:6:\"string\";s:10:\"fieldGroup\";s:36:\"3020d96a-3bcb-4cec-8eb2-ad86d58cfb5d\";}s:36:\"8b2133e2-ac59-4e7c-84eb-e1648fb2b5d3\";a:10:{s:4:\"name\";s:9:\"SEO Title\";s:6:\"handle\";s:8:\"seoTitle\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:22:\"craft\\fields\\PlainText\";s:8:\"settings\";a:6:{s:11:\"placeholder\";s:0:\"\";s:4:\"code\";s:0:\"\";s:9:\"multiline\";s:0:\"\";s:11:\"initialRows\";s:1:\"4\";s:9:\"charLimit\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";}s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";s:36:\"3020d96a-3bcb-4cec-8eb2-ad86d58cfb5d\";}s:36:\"927b7cf1-6d2d-43f4-a48d-ed3afb392029\";a:10:{s:4:\"name\";s:15:\"SEO Description\";s:6:\"handle\";s:14:\"seoDescription\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:22:\"craft\\fields\\PlainText\";s:8:\"settings\";a:6:{s:11:\"placeholder\";s:0:\"\";s:4:\"code\";s:0:\"\";s:9:\"multiline\";s:1:\"1\";s:11:\"initialRows\";s:1:\"2\";s:9:\"charLimit\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";}s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";s:36:\"3020d96a-3bcb-4cec-8eb2-ad86d58cfb5d\";}s:36:\"4a8b8bc0-cf6e-4961-9717-737fdea7f7ea\";a:10:{s:4:\"name\";s:9:\"SEO Image\";s:6:\"handle\";s:8:\"seoImage\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"site\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:19:\"craft\\fields\\Assets\";s:8:\"settings\";a:14:{s:15:\"useSingleFolder\";s:0:\"\";s:27:\"defaultUploadLocationSource\";s:43:\"volume:d067482b-b20a-44ab-9911-d8f0364fa01b\";s:28:\"defaultUploadLocationSubpath\";s:0:\"\";s:26:\"singleUploadLocationSource\";s:43:\"volume:d067482b-b20a-44ab-9911-d8f0364fa01b\";s:27:\"singleUploadLocationSubpath\";s:0:\"\";s:13:\"restrictFiles\";s:0:\"\";s:12:\"allowedKinds\";N;s:7:\"sources\";s:1:\"*\";s:6:\"source\";N;s:12:\"targetSiteId\";N;s:8:\"viewMode\";s:4:\"list\";s:5:\"limit\";s:1:\"1\";s:14:\"selectionLabel\";s:0:\"\";s:17:\"localizeRelations\";b:0;}s:17:\"contentColumnType\";s:6:\"string\";s:10:\"fieldGroup\";s:36:\"3020d96a-3bcb-4cec-8eb2-ad86d58cfb5d\";}}s:10:\"globalSets\";a:3:{s:36:\"23c17581-5a78-44f0-b876-aae217f0d824\";a:3:{s:12:\"fieldLayouts\";a:1:{s:36:\"d129c5b6-91e2-468b-a9f3-bae239bb1639\";a:1:{s:4:\"tabs\";a:1:{i:0;a:3:{s:6:\"fields\";a:3:{s:36:\"0566931d-f194-4662-a626-8b45fa255547\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}s:36:\"ad1785f7-181b-4aae-b812-f71709a0d24d\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:2;}s:36:\"f4e1ac4c-6071-4bc5-860a-45320591c47c\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:3;}}s:4:\"name\";s:15:\"General Scripts\";s:9:\"sortOrder\";i:1;}}}}s:6:\"handle\";s:14:\"generalScripts\";s:4:\"name\";s:15:\"General Scripts\";}s:36:\"b99c7e9b-4fa2-44c8-9201-d05460a21229\";a:3:{s:4:\"name\";s:12:\"Social Media\";s:6:\"handle\";s:11:\"socialMedia\";s:12:\"fieldLayouts\";a:1:{s:36:\"d980f75e-95ff-4b96-9c8a-5d11772565e2\";a:1:{s:4:\"tabs\";a:1:{i:0;a:3:{s:4:\"name\";s:12:\"Social Media\";s:9:\"sortOrder\";i:1;s:6:\"fields\";a:1:{s:36:\"3f314e24-e30c-4a7a-8a92-f69416ba7341\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}}}}}}}s:36:\"36671716-ddb0-4f4c-a827-9a95d4228a7b\";a:3:{s:4:\"name\";s:11:\"Default Seo\";s:6:\"handle\";s:10:\"defaultSeo\";s:12:\"fieldLayouts\";a:1:{s:36:\"ee71f6ea-1f4b-450b-b138-bbe872494278\";a:1:{s:4:\"tabs\";a:1:{i:0;a:3:{s:4:\"name\";s:11:\"Default Seo\";s:9:\"sortOrder\";i:1;s:6:\"fields\";a:3:{s:36:\"8b2133e2-ac59-4e7c-84eb-e1648fb2b5d3\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}s:36:\"927b7cf1-6d2d-43f4-a48d-ed3afb392029\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:2;}s:36:\"4a8b8bc0-cf6e-4961-9717-737fdea7f7ea\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:3;}}}}}}}}s:16:\"matrixBlockTypes\";a:2:{s:36:\"70d5c8f3-90d4-493f-809c-c570a4a72a0b\";a:6:{s:5:\"field\";s:36:\"d4fb7b46-27ee-40bb-8c89-fd0b34f32974\";s:4:\"name\";s:5:\"Slide\";s:6:\"handle\";s:5:\"slide\";s:9:\"sortOrder\";i:1;s:6:\"fields\";a:3:{s:36:\"d07d8d17-8376-43a1-b754-84979a8c8db2\";a:10:{s:4:\"name\";s:5:\"Image\";s:6:\"handle\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"site\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:19:\"craft\\fields\\Assets\";s:8:\"settings\";a:14:{s:15:\"useSingleFolder\";s:0:\"\";s:27:\"defaultUploadLocationSource\";s:43:\"volume:d067482b-b20a-44ab-9911-d8f0364fa01b\";s:28:\"defaultUploadLocationSubpath\";s:0:\"\";s:26:\"singleUploadLocationSource\";s:43:\"volume:d067482b-b20a-44ab-9911-d8f0364fa01b\";s:27:\"singleUploadLocationSubpath\";s:0:\"\";s:13:\"restrictFiles\";s:0:\"\";s:12:\"allowedKinds\";N;s:7:\"sources\";a:1:{i:0;s:43:\"volume:d067482b-b20a-44ab-9911-d8f0364fa01b\";}s:6:\"source\";N;s:12:\"targetSiteId\";N;s:8:\"viewMode\";s:4:\"list\";s:5:\"limit\";s:1:\"1\";s:14:\"selectionLabel\";s:0:\"\";s:17:\"localizeRelations\";b:0;}s:17:\"contentColumnType\";s:6:\"string\";s:10:\"fieldGroup\";N;}s:36:\"cdacce13-3d4b-4b45-b13e-d4d7737b990c\";a:10:{s:4:\"name\";s:7:\"Caption\";s:6:\"handle\";s:7:\"caption\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:22:\"craft\\fields\\PlainText\";s:8:\"settings\";a:6:{s:11:\"placeholder\";s:0:\"\";s:4:\"code\";s:0:\"\";s:9:\"multiline\";s:0:\"\";s:11:\"initialRows\";s:1:\"4\";s:9:\"charLimit\";s:2:\"80\";s:10:\"columnType\";s:4:\"text\";}s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";N;}s:36:\"6d0e276e-8c0f-4732-a7bf-13bb6c46f4a4\";a:10:{s:4:\"name\";s:4:\"Link\";s:6:\"handle\";s:6:\"a_link\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:22:\"craft\\fields\\PlainText\";s:8:\"settings\";a:6:{s:11:\"placeholder\";s:0:\"\";s:4:\"code\";s:0:\"\";s:9:\"multiline\";s:0:\"\";s:11:\"initialRows\";s:1:\"4\";s:9:\"charLimit\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";}s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";N;}}s:12:\"fieldLayouts\";a:1:{s:36:\"72ac5113-02ad-4c37-8798-b30afc1dfd1b\";a:1:{s:4:\"tabs\";a:1:{i:0;a:3:{s:4:\"name\";s:7:\"Content\";s:9:\"sortOrder\";i:1;s:6:\"fields\";a:3:{s:36:\"d07d8d17-8376-43a1-b754-84979a8c8db2\";a:2:{s:8:\"required\";b:1;s:9:\"sortOrder\";i:1;}s:36:\"cdacce13-3d4b-4b45-b13e-d4d7737b990c\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:2;}s:36:\"6d0e276e-8c0f-4732-a7bf-13bb6c46f4a4\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:3;}}}}}}}s:36:\"f172c7d8-89a1-44de-a466-9da0950d37f8\";a:6:{s:5:\"field\";s:36:\"3f314e24-e30c-4a7a-8a92-f69416ba7341\";s:4:\"name\";s:12:\"Social Media\";s:6:\"handle\";s:11:\"socialMedia\";s:9:\"sortOrder\";i:1;s:6:\"fields\";a:4:{s:36:\"9b365935-a17d-4b3a-b5eb-f85489047661\";a:10:{s:4:\"name\";s:8:\"Facebook\";s:6:\"handle\";s:8:\"facebook\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:16:\"craft\\fields\\Url\";s:8:\"settings\";a:1:{s:11:\"placeholder\";s:0:\"\";}s:17:\"contentColumnType\";s:6:\"string\";s:10:\"fieldGroup\";N;}s:36:\"f5fef2b6-8662-40a1-a305-723f7e918e21\";a:10:{s:4:\"name\";s:9:\"Instagram\";s:6:\"handle\";s:9:\"instagram\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:16:\"craft\\fields\\Url\";s:8:\"settings\";a:1:{s:11:\"placeholder\";s:0:\"\";}s:17:\"contentColumnType\";s:6:\"string\";s:10:\"fieldGroup\";N;}s:36:\"81acff15-dfe3-42a0-933c-1c3f3fedc815\";a:10:{s:4:\"name\";s:7:\"Twitter\";s:6:\"handle\";s:7:\"twitter\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:16:\"craft\\fields\\Url\";s:8:\"settings\";a:1:{s:11:\"placeholder\";s:0:\"\";}s:17:\"contentColumnType\";s:6:\"string\";s:10:\"fieldGroup\";N;}s:36:\"31f41cf5-b2f7-474f-8614-244a42ad6e5d\";a:10:{s:4:\"name\";s:9:\"Pinterest\";s:6:\"handle\";s:9:\"pinterest\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:16:\"craft\\fields\\Url\";s:8:\"settings\";a:1:{s:11:\"placeholder\";s:0:\"\";}s:17:\"contentColumnType\";s:6:\"string\";s:10:\"fieldGroup\";N;}}s:12:\"fieldLayouts\";a:1:{s:36:\"ce0056fc-f5db-4ed5-b07a-0c80d5370de7\";a:1:{s:4:\"tabs\";a:1:{i:0;a:3:{s:4:\"name\";s:7:\"Content\";s:9:\"sortOrder\";i:1;s:6:\"fields\";a:4:{s:36:\"9b365935-a17d-4b3a-b5eb-f85489047661\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}s:36:\"f5fef2b6-8662-40a1-a305-723f7e918e21\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:2;}s:36:\"81acff15-dfe3-42a0-933c-1c3f3fedc815\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:3;}s:36:\"31f41cf5-b2f7-474f-8614-244a42ad6e5d\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:4;}}}}}}}}s:7:\"plugins\";a:2:{s:6:\"aws-s3\";a:3:{s:7:\"edition\";s:8:\"standard\";s:7:\"enabled\";b:1;s:13:\"schemaVersion\";s:3:\"1.2\";}s:8:\"redactor\";a:3:{s:7:\"edition\";s:8:\"standard\";s:7:\"enabled\";b:1;s:13:\"schemaVersion\";s:5:\"2.2.2\";}}s:8:\"sections\";a:3:{s:36:\"0ea56ad0-526a-4896-9de7-0a83d562dc41\";a:7:{s:16:\"enableVersioning\";b:1;s:10:\"entryTypes\";a:1:{s:36:\"1c64d15b-1c01-4bac-bb0c-c3ca0faf1faf\";a:7:{s:12:\"fieldLayouts\";a:1:{s:36:\"bbd5a8ba-90ec-419b-8719-472a49742274\";a:1:{s:4:\"tabs\";a:1:{i:0;a:3:{s:6:\"fields\";a:1:{s:36:\"18f79ec1-c879-4a02-8733-819399fc335d\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}}s:4:\"name\";s:5:\"Tab 1\";s:9:\"sortOrder\";i:1;}}}}s:6:\"handle\";s:4:\"home\";s:13:\"hasTitleField\";b:0;s:4:\"name\";s:4:\"Home\";s:9:\"sortOrder\";i:1;s:11:\"titleFormat\";s:18:\"{section.name|raw}\";s:10:\"titleLabel\";s:0:\"\";}}s:6:\"handle\";s:4:\"home\";s:4:\"name\";s:4:\"Home\";s:16:\"propagateEntries\";b:1;s:12:\"siteSettings\";a:1:{s:36:\"421204ef-a4d4-4b11-b60f-322ef3a7fe9e\";a:4:{s:16:\"enabledByDefault\";b:1;s:7:\"hasUrls\";b:1;s:8:\"template\";s:14:\"pages/homepage\";s:9:\"uriFormat\";s:8:\"__home__\";}}s:4:\"type\";s:6:\"single\";}s:36:\"62472a49-7594-475e-9ed0-485577bda6e6\";a:8:{s:16:\"enableVersioning\";b:1;s:10:\"entryTypes\";a:6:{s:36:\"2b71dd91-e5b0-4cb4-80ee-627f7eba4f7a\";a:7:{s:12:\"fieldLayouts\";a:1:{s:36:\"969d4a22-e47b-40a7-b039-6520912336cb\";a:1:{s:4:\"tabs\";a:1:{i:0;a:3:{s:6:\"fields\";a:4:{s:36:\"bb32a9b4-332f-44be-8a77-2ecbef5b53e9\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:2;}s:36:\"d4fb7b46-27ee-40bb-8c89-fd0b34f32974\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:4;}s:36:\"d941a090-ca03-4d9b-8e97-7acc180af1df\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:3;}s:36:\"f0bb2b8b-8136-4cfd-8a3a-d3add0605e90\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}}s:4:\"name\";s:23:\"Component B - Slideshow\";s:9:\"sortOrder\";i:1;}}}}s:6:\"handle\";s:19:\"componentBSlideshow\";s:13:\"hasTitleField\";b:1;s:4:\"name\";s:23:\"Component B - Slideshow\";s:9:\"sortOrder\";i:8;s:11:\"titleFormat\";s:0:\"\";s:10:\"titleLabel\";s:5:\"Title\";}s:36:\"41867173-852a-4d04-b62a-0695757102e2\";a:7:{s:12:\"fieldLayouts\";a:1:{s:36:\"c19b1fa0-5d03-4ac7-96b1-1a68a143c465\";a:1:{s:4:\"tabs\";a:1:{i:0;a:3:{s:6:\"fields\";a:5:{s:36:\"3277bca1-c643-4ebb-8088-64835b20c98a\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:4;}s:36:\"b553a5b5-982a-45d8-8f31-a396f6e55a09\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:3;}s:36:\"d941a090-ca03-4d9b-8e97-7acc180af1df\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:5;}s:36:\"e23eab83-3105-4fec-97ab-048b94c38693\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:2;}s:36:\"f0bb2b8b-8136-4cfd-8a3a-d3add0605e90\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}}s:4:\"name\";s:19:\"Component B - Video\";s:9:\"sortOrder\";i:1;}}}}s:6:\"handle\";s:15:\"componentBVideo\";s:13:\"hasTitleField\";b:1;s:4:\"name\";s:19:\"Component B - Video\";s:9:\"sortOrder\";i:9;s:11:\"titleFormat\";s:0:\"\";s:10:\"titleLabel\";s:5:\"Title\";}s:36:\"54a50af0-855a-4ab8-8d10-ff894e820e77\";a:7:{s:12:\"fieldLayouts\";a:1:{s:36:\"4bee5c38-01d9-4355-9893-6236f9181785\";a:1:{s:4:\"tabs\";a:1:{i:0;a:3:{s:6:\"fields\";a:1:{s:36:\"ecc4a0a1-37c0-4e40-995a-9720f1281eba\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}}s:4:\"name\";s:4:\"Year\";s:9:\"sortOrder\";i:1;}}}}s:6:\"handle\";s:4:\"year\";s:13:\"hasTitleField\";b:1;s:4:\"name\";s:4:\"Year\";s:9:\"sortOrder\";i:1;s:11:\"titleFormat\";s:0:\"\";s:10:\"titleLabel\";s:5:\"Title\";}s:36:\"978e2015-f876-4db7-8222-5ebb4f978c9e\";a:7:{s:12:\"fieldLayouts\";a:1:{s:36:\"e478c8d0-144d-4e82-95a4-5c48ab813a87\";a:1:{s:4:\"tabs\";a:1:{i:0;a:3:{s:6:\"fields\";a:7:{s:36:\"3277bca1-c643-4ebb-8088-64835b20c98a\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:7;}s:36:\"49ee335b-dc17-48e5-a210-5e93cbf251cd\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:4;}s:36:\"8c5099ec-1b30-4d8a-815a-21a959b8326a\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:3;}s:36:\"b553a5b5-982a-45d8-8f31-a396f6e55a09\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:6;}s:36:\"d941a090-ca03-4d9b-8e97-7acc180af1df\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:5;}s:36:\"e23eab83-3105-4fec-97ab-048b94c38693\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:2;}s:36:\"f0bb2b8b-8136-4cfd-8a3a-d3add0605e90\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}}s:4:\"name\";s:20:\"Component B - Detail\";s:9:\"sortOrder\";i:1;}}}}s:6:\"handle\";s:16:\"componentBDetail\";s:13:\"hasTitleField\";b:1;s:4:\"name\";s:20:\"Component B - Detail\";s:9:\"sortOrder\";i:7;s:11:\"titleFormat\";s:0:\"\";s:10:\"titleLabel\";s:5:\"Title\";}s:36:\"97a87380-6e7c-47cd-9207-8a8ee76196f9\";a:7:{s:12:\"fieldLayouts\";a:1:{s:36:\"a08a2631-d8fe-4fd9-9eaf-da2b3368a9a6\";a:1:{s:4:\"tabs\";a:1:{i:0;a:3:{s:6:\"fields\";a:4:{s:36:\"b553a5b5-982a-45d8-8f31-a396f6e55a09\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:4;}s:36:\"d941a090-ca03-4d9b-8e97-7acc180af1df\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:2;}s:36:\"ebc4dd15-1b97-4266-b80d-9dccb116a90e\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:3;}s:36:\"f0bb2b8b-8136-4cfd-8a3a-d3add0605e90\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}}s:4:\"name\";s:20:\"Component A - Header\";s:9:\"sortOrder\";i:1;}}}}s:6:\"handle\";s:16:\"componentAHeader\";s:13:\"hasTitleField\";b:1;s:4:\"name\";s:20:\"Component A - Header\";s:9:\"sortOrder\";i:6;s:11:\"titleFormat\";s:0:\"\";s:10:\"titleLabel\";s:5:\"Title\";}s:36:\"fddfa8ef-088e-43a7-96e5-7d52c087249b\";a:7:{s:4:\"name\";s:8:\"Homepage\";s:6:\"handle\";s:8:\"homepage\";s:13:\"hasTitleField\";b:1;s:10:\"titleLabel\";s:5:\"Title\";s:11:\"titleFormat\";s:0:\"\";s:9:\"sortOrder\";i:10;s:12:\"fieldLayouts\";a:1:{s:36:\"7b110b4a-dd19-443b-b3d4-c7b7ebe687ca\";a:1:{s:4:\"tabs\";a:1:{i:0;a:3:{s:4:\"name\";s:8:\"Homepage\";s:9:\"sortOrder\";i:1;s:6:\"fields\";a:4:{s:36:\"f0bb2b8b-8136-4cfd-8a3a-d3add0605e90\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}s:36:\"d941a090-ca03-4d9b-8e97-7acc180af1df\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:2;}s:36:\"ebc4dd15-1b97-4266-b80d-9dccb116a90e\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:3;}s:36:\"b553a5b5-982a-45d8-8f31-a396f6e55a09\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:4;}}}}}}}}s:6:\"handle\";s:4:\"year\";s:4:\"name\";s:4:\"Year\";s:16:\"propagateEntries\";b:1;s:12:\"siteSettings\";a:1:{s:36:\"421204ef-a4d4-4b11-b60f-322ef3a7fe9e\";a:4:{s:16:\"enabledByDefault\";b:1;s:7:\"hasUrls\";b:0;s:8:\"template\";N;s:9:\"uriFormat\";N;}}s:9:\"structure\";a:2:{s:9:\"maxLevels\";s:1:\"2\";s:3:\"uid\";s:36:\"013a5b17-3769-49f8-8be7-5ca05e79d376\";}s:4:\"type\";s:9:\"structure\";}s:36:\"ba379e03-6bc0-4afc-8a5e-c91e5a6cb2ea\";a:7:{s:16:\"enableVersioning\";b:1;s:10:\"entryTypes\";a:1:{s:36:\"c3b53ebe-68b9-4e9f-9a3d-2865d6ce0fec\";a:7:{s:12:\"fieldLayouts\";a:1:{s:36:\"186cf6a5-7023-40d9-9d36-3220a79c0de8\";a:1:{s:4:\"tabs\";a:1:{i:0;a:3:{s:6:\"fields\";a:1:{s:36:\"10639f2a-49eb-4f37-9254-6d8cf67e1ebe\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}}s:4:\"name\";s:7:\"Privcay\";s:9:\"sortOrder\";i:1;}}}}s:6:\"handle\";s:13:\"privacyPolicy\";s:13:\"hasTitleField\";b:0;s:4:\"name\";s:14:\"Privacy Policy\";s:9:\"sortOrder\";i:1;s:11:\"titleFormat\";s:18:\"{section.name|raw}\";s:10:\"titleLabel\";s:0:\"\";}}s:6:\"handle\";s:13:\"privacyPolicy\";s:4:\"name\";s:14:\"Privacy Policy\";s:16:\"propagateEntries\";b:1;s:12:\"siteSettings\";a:1:{s:36:\"421204ef-a4d4-4b11-b60f-322ef3a7fe9e\";a:4:{s:16:\"enabledByDefault\";b:1;s:7:\"hasUrls\";b:1;s:8:\"template\";s:13:\"pages/general\";s:9:\"uriFormat\";s:14:\"privacy-policy\";}}s:4:\"type\";s:6:\"single\";}}s:10:\"siteGroups\";a:1:{s:36:\"0d2dc1c3-ad92-41b2-b313-71922a5f34f2\";a:1:{s:4:\"name\";s:16:\"Alterna Haircare\";}}s:5:\"sites\";a:1:{s:36:\"421204ef-a4d4-4b11-b60f-322ef3a7fe9e\";a:8:{s:7:\"baseUrl\";s:17:\"$DEFAULT_SITE_URL\";s:6:\"handle\";s:7:\"default\";s:7:\"hasUrls\";b:1;s:8:\"language\";s:5:\"en-US\";s:4:\"name\";s:16:\"Alterna Haircare\";s:7:\"primary\";b:1;s:9:\"siteGroup\";s:36:\"0d2dc1c3-ad92-41b2-b313-71922a5f34f2\";s:9:\"sortOrder\";i:1;}}s:6:\"system\";a:5:{s:7:\"edition\";s:3:\"pro\";s:4:\"live\";b:1;s:4:\"name\";s:16:\"Alterna Haircare\";s:13:\"schemaVersion\";s:6:\"3.1.25\";s:8:\"timeZone\";s:19:\"America/Los_Angeles\";}s:5:\"users\";a:5:{s:23:\"allowPublicRegistration\";b:0;s:12:\"defaultGroup\";N;s:12:\"photoSubpath\";s:0:\"\";s:14:\"photoVolumeUid\";N;s:24:\"requireEmailVerification\";b:1;}s:7:\"volumes\";a:1:{s:36:\"d067482b-b20a-44ab-9911-d8f0364fa01b\";a:7:{s:6:\"handle\";s:2:\"s3\";s:7:\"hasUrls\";b:1;s:4:\"name\";s:2:\"S3\";s:8:\"settings\";a:11:{s:14:\"autoFocalPoint\";s:0:\"\";s:6:\"bucket\";s:28:\"alterna-craft-public-storage\";s:19:\"bucketSelectionMode\";s:6:\"choose\";s:16:\"cfDistributionId\";s:0:\"\";s:8:\"cfPrefix\";s:0:\"\";s:7:\"expires\";s:0:\"\";s:5:\"keyId\";s:20:\"AKIAINYT6O4Y7FP3IDWA\";s:6:\"region\";s:9:\"us-east-1\";s:6:\"secret\";s:40:\"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\";s:12:\"storageClass\";s:0:\"\";s:9:\"subfolder\";s:9:\"haircare/\";}s:9:\"sortOrder\";i:1;s:4:\"type\";s:18:\"craft\\awss3\\Volume\";s:3:\"url\";s:64:\"https://s3.us-east-1.amazonaws.com/alterna-craft-public-storage/\";}}}','{\"dateModified\":\"@config/project.yaml\",\"email\":\"@config/project.yaml\",\"fieldGroups\":\"@config/project.yaml\",\"fields\":\"@config/project.yaml\",\"globalSets\":\"@config/project.yaml\",\"plugins\":\"@config/project.yaml\",\"sections\":\"@config/project.yaml\",\"siteGroups\":\"@config/project.yaml\",\"sites\":\"@config/project.yaml\",\"system\":\"@config/project.yaml\",\"users\":\"@config/project.yaml\",\"volumes\":\"@config/project.yaml\",\"matrixBlockTypes\":\"@config/project.yaml\"}','uGsylPBUz6xb','2019-03-06 21:56:09','2019-04-08 23:35:18','6f33089f-83da-4e7f-ad9d-f80ed843433f');

/*!40000 ALTER TABLE `craft_info` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_matrixblocks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_matrixblocks`;

CREATE TABLE `craft_matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `ownerSiteId` int(11) DEFAULT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_matrixblocks_ownerId_idx` (`ownerId`),
  KEY `craft_matrixblocks_fieldId_idx` (`fieldId`),
  KEY `craft_matrixblocks_typeId_idx` (`typeId`),
  KEY `craft_matrixblocks_sortOrder_idx` (`sortOrder`),
  KEY `craft_matrixblocks_ownerSiteId_idx` (`ownerSiteId`),
  CONSTRAINT `craft_matrixblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixblocks_ownerSiteId_fk` FOREIGN KEY (`ownerSiteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_matrixblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `craft_matrixblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_matrixblocks` WRITE;
/*!40000 ALTER TABLE `craft_matrixblocks` DISABLE KEYS */;

INSERT INTO `craft_matrixblocks` (`id`, `ownerId`, `ownerSiteId`, `fieldId`, `typeId`, `sortOrder`, `deletedWithOwner`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(15,14,NULL,14,1,1,NULL,'2019-03-07 00:16:37','2019-04-08 23:18:21','097ddbc8-f885-4adf-b04d-c8bfe27f08fe'),
	(16,14,NULL,14,1,2,NULL,'2019-03-07 00:16:37','2019-04-08 23:18:21','a9e4031b-ed1b-46f2-b015-a52ed47fff66'),
	(17,14,NULL,14,1,3,NULL,'2019-03-07 00:16:37','2019-04-08 23:18:21','05b30598-50b4-4691-9a48-338993664b0b'),
	(18,14,NULL,14,1,4,NULL,'2019-03-07 00:16:37','2019-04-08 23:18:21','8aa94f65-cf12-43a1-908a-e294a745adf7'),
	(126,125,NULL,14,1,1,NULL,'2019-03-14 20:14:02','2019-04-08 23:18:23','f182ed4a-a7c5-4f48-84f9-792c58ea3ecc'),
	(127,125,NULL,14,1,2,NULL,'2019-03-14 20:14:02','2019-04-08 23:18:23','cc63abe8-35a9-485d-bd2a-27c84d0a4d53'),
	(128,125,NULL,14,1,3,NULL,'2019-03-14 20:14:02','2019-04-08 23:18:23','46f064bf-a225-49e8-aad7-cecc5e5b7a34'),
	(133,132,NULL,14,1,1,NULL,'2019-03-14 20:23:24','2019-04-08 23:18:23','3b41dc9a-8608-4a99-bb0e-02c92e12f644'),
	(134,132,NULL,14,1,2,NULL,'2019-03-14 20:23:24','2019-04-08 23:18:23','6fddb946-dc74-40e0-a080-cc03097624c9'),
	(135,132,NULL,14,1,3,NULL,'2019-03-14 20:23:24','2019-04-08 23:18:23','2a8eec77-7ef0-4d6a-be15-010bd00502d0'),
	(139,138,NULL,14,1,1,NULL,'2019-03-18 18:22:58','2019-04-08 23:18:24','c2b8ddb5-d7ce-47ef-986a-97c3c74d319d'),
	(140,138,NULL,14,1,2,NULL,'2019-03-18 18:22:58','2019-04-08 23:18:24','9a1aa33d-9ae5-4c89-830e-44b6fa98b0b4'),
	(141,138,NULL,14,1,3,NULL,'2019-03-18 18:22:58','2019-04-08 23:18:24','d85175d7-acf7-4be7-9f1f-078e4df1dde9'),
	(142,138,NULL,14,1,4,NULL,'2019-03-18 18:22:58','2019-04-08 23:18:24','ebb0eaa4-6497-4475-8bb6-39bc6d5d1728'),
	(144,143,NULL,19,2,1,NULL,'2019-03-25 22:05:47','2019-03-27 21:33:19','3bf1c672-6a99-4ab1-9b04-2d76e4e577ea'),
	(155,151,NULL,14,1,1,NULL,'2019-03-28 23:46:27','2019-04-08 23:18:24','f63de1d8-ce6a-4497-9a6f-fb3d0a390d99'),
	(160,151,NULL,14,1,2,NULL,'2019-04-05 19:57:45','2019-04-08 23:18:24','7c0c1dc1-0f28-4afa-bcac-289184435649'),
	(163,151,NULL,14,1,3,NULL,'2019-04-05 20:00:29','2019-04-08 23:18:24','f4753662-3966-46b9-8c9f-976ef42be112'),
	(164,151,NULL,14,1,4,NULL,'2019-04-05 20:00:29','2019-04-08 23:18:24','327d04a9-6f2f-4056-a0e1-316e3ffeebd0');

/*!40000 ALTER TABLE `craft_matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_matrixblocktypes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_matrixblocktypes`;

CREATE TABLE `craft_matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_matrixblocktypes_name_fieldId_unq_idx` (`name`,`fieldId`),
  UNIQUE KEY `craft_matrixblocktypes_handle_fieldId_unq_idx` (`handle`,`fieldId`),
  KEY `craft_matrixblocktypes_fieldId_idx` (`fieldId`),
  KEY `craft_matrixblocktypes_fieldLayoutId_idx` (`fieldLayoutId`),
  CONSTRAINT `craft_matrixblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `craft_matrixblocktypes` DISABLE KEYS */;

INSERT INTO `craft_matrixblocktypes` (`id`, `fieldId`, `fieldLayoutId`, `name`, `handle`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,14,6,'Slide','slide',1,'2019-03-06 23:53:10','2019-04-01 15:28:47','70d5c8f3-90d4-493f-809c-c570a4a72a0b'),
	(2,19,12,'Social Media','socialMedia',1,'2019-03-25 22:04:27','2019-03-25 22:04:27','f172c7d8-89a1-44de-a466-9da0950d37f8');

/*!40000 ALTER TABLE `craft_matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_matrixcontent_slideshowimages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_matrixcontent_slideshowimages`;

CREATE TABLE `craft_matrixcontent_slideshowimages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_slide_caption` text,
  `field_slide_a_link` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_matrixcontent_slideshowimages_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `craft_matrixcontent_slideshowimages_siteId_fk` (`siteId`),
  CONSTRAINT `craft_matrixcontent_slideshowimages_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixcontent_slideshowimages_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_matrixcontent_slideshowimages` WRITE;
/*!40000 ALTER TABLE `craft_matrixcontent_slideshowimages` DISABLE KEYS */;

INSERT INTO `craft_matrixcontent_slideshowimages` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_slide_caption`, `field_slide_a_link`)
VALUES
	(1,15,1,'2019-03-07 00:16:37','2019-04-08 23:18:21','65820b48-9d4f-43ef-a682-9a0384d9ad2d','Since inception, Alterna has provided high performance products inspired by',NULL),
	(2,16,1,'2019-03-07 00:16:37','2019-04-08 23:18:21','10e1cb47-ffe3-47bd-bbb0-529dfb5ddead','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod',NULL),
	(3,17,1,'2019-03-07 00:16:37','2019-04-08 23:18:21','877b82d2-a541-4ef0-9a2a-53f56a765ce9','Since inception, Alterna has provided high performance products inspired',NULL),
	(4,18,1,'2019-03-07 00:16:37','2019-04-08 23:18:21','730472e6-de02-47aa-b21e-d5682c63fdbb','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod',NULL),
	(5,126,1,'2019-03-14 20:14:02','2019-04-08 23:18:23','229ac7a9-1aad-4faf-a6cd-c9811be2b69a','Alterna Life Restore',NULL),
	(6,127,1,'2019-03-14 20:14:02','2019-04-08 23:18:23','47e7f281-996c-43d5-8915-c60f88bf7a48','Alterna Enzymetherapy Life Curls',NULL),
	(7,128,1,'2019-03-14 20:14:02','2019-04-08 23:18:23','fc9aba38-54ba-4288-b64b-b2489e9f8eb6','Alterna Enzymetherapy Life Volumizing Spray Mousse',NULL),
	(8,133,1,'2019-03-14 20:23:24','2019-04-08 23:18:23','1f257fb0-de52-4062-b83d-56b153e4d830','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod',NULL),
	(9,134,1,'2019-03-14 20:23:24','2019-04-08 23:18:23','647bf74d-9494-4318-97fb-12536ec0f6cb','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod',NULL),
	(10,135,1,'2019-03-14 20:23:24','2019-04-08 23:18:23','dde294c2-889e-4641-a477-f5b613852e8b','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod',NULL),
	(11,139,1,'2019-03-18 18:22:58','2019-04-08 23:18:24','2feb4c46-85bb-4089-b4d6-55aae51ecb1b',NULL,NULL),
	(12,140,1,'2019-03-18 18:22:58','2019-04-08 23:18:24','76a90809-3ffd-4d9d-8981-e2daf6cfa1e7',NULL,NULL),
	(13,141,1,'2019-03-18 18:22:58','2019-04-08 23:18:24','7a1a2735-e72b-4677-ac00-55f1db8d9908',NULL,NULL),
	(14,142,1,'2019-03-18 18:22:58','2019-04-08 23:18:24','cae8b988-5d02-457c-8ab2-c262a1f40880',NULL,NULL),
	(15,155,1,'2019-03-28 23:46:27','2019-04-08 23:18:24','2c462924-6436-4818-a13f-d559e445079b','CAVIAR Anti-Aging Restructuring Bond Collection','https://alternacaviarantiaging.com/collections/restructuring-bond-repair'),
	(16,160,1,'2019-04-05 19:57:45','2019-04-08 23:18:24','7baaeab2-9e7e-463f-a509-1d9a1238aebd','CAVIAR Anti-Aging Replenishing Moisture Collection','https://alternacaviarantiaging.com/collections/replenishing-moisture'),
	(17,163,1,'2019-04-05 20:00:29','2019-04-08 23:18:24','7a6971ea-8b10-40a8-aa8b-0b483a945177','CAVIAR Anti-Frizz Collection','https://alternacaviarantiaging.com/collections/anti-frizz'),
	(18,164,1,'2019-04-05 20:00:29','2019-04-08 23:18:24','11438fa7-ab30-4a22-b38a-dd0040a11606','CAVIAR Anti-Aging Professional Styling Collection','https://alternacaviarantiaging.com/collections/style');

/*!40000 ALTER TABLE `craft_matrixcontent_slideshowimages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_matrixcontent_socialmedia
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_matrixcontent_socialmedia`;

CREATE TABLE `craft_matrixcontent_socialmedia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_socialMedia_facebook` varchar(255) DEFAULT NULL,
  `field_socialMedia_instagram` varchar(255) DEFAULT NULL,
  `field_socialMedia_twitter` varchar(255) DEFAULT NULL,
  `field_socialMedia_pinterest` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_matrixcontent_socialmedia_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `craft_matrixcontent_socialmedia_siteId_fk` (`siteId`),
  CONSTRAINT `craft_matrixcontent_socialmedia_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixcontent_socialmedia_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_matrixcontent_socialmedia` WRITE;
/*!40000 ALTER TABLE `craft_matrixcontent_socialmedia` DISABLE KEYS */;

INSERT INTO `craft_matrixcontent_socialmedia` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_socialMedia_facebook`, `field_socialMedia_instagram`, `field_socialMedia_twitter`, `field_socialMedia_pinterest`)
VALUES
	(1,144,1,'2019-03-25 22:05:47','2019-03-27 21:33:19','4751717c-ca79-4bb2-b7be-53bbd9dbf0ca','https://www.facebook.com/AlternaHaircare','https://www.instagram.com/alternahaircare/','https://twitter.com/alternahaircare','https://www.pinterest.ca/alternahaircare/?autologin=true');

/*!40000 ALTER TABLE `craft_matrixcontent_socialmedia` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_migrations`;

CREATE TABLE `craft_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pluginId` int(11) DEFAULT NULL,
  `type` enum('app','plugin','content') NOT NULL DEFAULT 'app',
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_migrations_pluginId_idx` (`pluginId`),
  KEY `craft_migrations_type_pluginId_idx` (`type`,`pluginId`),
  CONSTRAINT `craft_migrations_pluginId_fk` FOREIGN KEY (`pluginId`) REFERENCES `craft_plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_migrations` WRITE;
/*!40000 ALTER TABLE `craft_migrations` DISABLE KEYS */;

INSERT INTO `craft_migrations` (`id`, `pluginId`, `type`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,NULL,'app','Install','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','9c36f222-45f9-42b4-8da2-5ba772297b07'),
	(2,NULL,'app','m150403_183908_migrations_table_changes','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','999f82d3-42b1-40fc-b46f-815f8952d0ec'),
	(3,NULL,'app','m150403_184247_plugins_table_changes','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','363a9cf8-623e-4ab3-8acc-aae965f40de2'),
	(4,NULL,'app','m150403_184533_field_version','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','f084405a-ed5c-4551-a4ca-b1b79432b9a6'),
	(5,NULL,'app','m150403_184729_type_columns','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','9bd1b7e2-cee3-44ab-b2c9-bdced8c03d34'),
	(6,NULL,'app','m150403_185142_volumes','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','a0ae7362-1195-448f-b64e-10443dc84fde'),
	(7,NULL,'app','m150428_231346_userpreferences','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','741a380f-94d0-4bad-841d-6fd22af1bfb2'),
	(8,NULL,'app','m150519_150900_fieldversion_conversion','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','ea0bf8c8-c782-442d-bba0-702fc9d12058'),
	(9,NULL,'app','m150617_213829_update_email_settings','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','d19781f4-0556-45e1-b26e-f4b679f67734'),
	(10,NULL,'app','m150721_124739_templatecachequeries','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','225a7798-fa61-4e47-970c-3e7d7d7175ca'),
	(11,NULL,'app','m150724_140822_adjust_quality_settings','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','20719ae0-70ac-499b-b5ba-a09da08346e4'),
	(12,NULL,'app','m150815_133521_last_login_attempt_ip','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','63c1ae38-1988-4712-9e7a-4bffd679c8cf'),
	(13,NULL,'app','m151002_095935_volume_cache_settings','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','cdd5ae88-2339-4160-9a2b-191bdbdb212d'),
	(14,NULL,'app','m151005_142750_volume_s3_storage_settings','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','80c6b56d-7bad-43b8-a7a3-93bcffb27d75'),
	(15,NULL,'app','m151016_133600_delete_asset_thumbnails','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','5345a5c2-a8df-450d-ab12-8e8ecc0ecd23'),
	(16,NULL,'app','m151209_000000_move_logo','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','3523fd96-2b8b-44f3-90c8-7533a8b9fc38'),
	(17,NULL,'app','m151211_000000_rename_fileId_to_assetId','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','e31dc0a8-3215-487b-bbf8-3ce7006ca321'),
	(18,NULL,'app','m151215_000000_rename_asset_permissions','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','b3f91995-41ac-41d6-ae58-661d8a849fae'),
	(19,NULL,'app','m160707_000001_rename_richtext_assetsource_setting','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','d21da437-d439-43d1-9e5e-bce7288f5c67'),
	(20,NULL,'app','m160708_185142_volume_hasUrls_setting','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','e265d43f-8da9-48a9-92ed-24b79d5f5a85'),
	(21,NULL,'app','m160714_000000_increase_max_asset_filesize','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','f1ec7779-5c7f-4bb8-a610-b22329621db4'),
	(22,NULL,'app','m160727_194637_column_cleanup','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','bf6d2f64-a9e0-475a-95bc-a6ab25dca351'),
	(23,NULL,'app','m160804_110002_userphotos_to_assets','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','b7d93446-9e5e-4ab6-8bdb-d9f6ce3f99e9'),
	(24,NULL,'app','m160807_144858_sites','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','a3c73026-344a-46f2-99dc-6557a1f7a393'),
	(25,NULL,'app','m160829_000000_pending_user_content_cleanup','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','330697b0-90f1-41f1-a558-05556d78cd34'),
	(26,NULL,'app','m160830_000000_asset_index_uri_increase','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','5c3a5bb7-7713-4401-8474-29f74b8fece7'),
	(27,NULL,'app','m160912_230520_require_entry_type_id','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','fd751b2d-4621-4197-be73-cf12ed1a928b'),
	(28,NULL,'app','m160913_134730_require_matrix_block_type_id','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','50395aa7-06e1-4fcd-a0f2-73581aca3472'),
	(29,NULL,'app','m160920_174553_matrixblocks_owner_site_id_nullable','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','e8287f74-7f4f-454e-bc8a-950e35b38f26'),
	(30,NULL,'app','m160920_231045_usergroup_handle_title_unique','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','fcc5422a-19fb-42aa-8e77-87dc1b634244'),
	(31,NULL,'app','m160925_113941_route_uri_parts','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','f6fe12d0-2c57-46a7-9b3d-7f575657e43d'),
	(32,NULL,'app','m161006_205918_schemaVersion_not_null','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','b570c529-9ff2-442a-b672-c72245131bae'),
	(33,NULL,'app','m161007_130653_update_email_settings','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','c45c1513-79b4-40db-bac4-9937033ed838'),
	(34,NULL,'app','m161013_175052_newParentId','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','72450e65-400d-427b-903b-617228642e89'),
	(35,NULL,'app','m161021_102916_fix_recent_entries_widgets','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','6cd57d32-8879-40c1-b2f4-54278b32a159'),
	(36,NULL,'app','m161021_182140_rename_get_help_widget','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','49c6351b-0a99-4788-b16a-71867ef358df'),
	(37,NULL,'app','m161025_000000_fix_char_columns','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','3f99843d-7e5c-43c4-bbb1-6b71ffbd9988'),
	(38,NULL,'app','m161029_124145_email_message_languages','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','d78eaaff-20ed-4f36-8ff2-daf17e71bc66'),
	(39,NULL,'app','m161108_000000_new_version_format','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','aa616227-6e11-459d-a633-c81c50c36a16'),
	(40,NULL,'app','m161109_000000_index_shuffle','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','ce19fa7b-1fe8-4a79-9c41-95fc3990b460'),
	(41,NULL,'app','m161122_185500_no_craft_app','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','17068bdb-f3b9-493a-84b2-ad3cc92118db'),
	(42,NULL,'app','m161125_150752_clear_urlmanager_cache','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','4841dbcb-045a-4bdb-be48-14efeafa827e'),
	(43,NULL,'app','m161220_000000_volumes_hasurl_notnull','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','b91137e1-44f7-4cd9-92db-c00b0f940d1a'),
	(44,NULL,'app','m170114_161144_udates_permission','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','a6d50cd8-bcfa-45b0-941a-76efbc272cee'),
	(45,NULL,'app','m170120_000000_schema_cleanup','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','14723d2b-f2c0-40b6-ab03-916f1c6a0bd2'),
	(46,NULL,'app','m170126_000000_assets_focal_point','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','6dc7184e-1804-4ba7-bd89-e19ec4832da7'),
	(47,NULL,'app','m170206_142126_system_name','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','6f5fc484-352c-4151-b6f7-563df6827f65'),
	(48,NULL,'app','m170217_044740_category_branch_limits','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','42463fb4-7596-4e42-aec8-223dd52dc1a0'),
	(49,NULL,'app','m170217_120224_asset_indexing_columns','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','eadee328-e399-48e2-9e34-5791bda9dc3b'),
	(50,NULL,'app','m170223_224012_plain_text_settings','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','892cc5d8-fb7b-49f1-a414-8eb895226348'),
	(51,NULL,'app','m170227_120814_focal_point_percentage','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','dbbe2b6f-b7aa-48c0-8bda-e6df0fc0ed8e'),
	(52,NULL,'app','m170228_171113_system_messages','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','d64ba8b7-84c2-4c80-8ef3-1f7efc5c9176'),
	(53,NULL,'app','m170303_140500_asset_field_source_settings','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','4630192f-c473-48ba-bdb8-2f7e4cd73b17'),
	(54,NULL,'app','m170306_150500_asset_temporary_uploads','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','b5750f4e-9336-4001-908f-9bb0e2bf6692'),
	(55,NULL,'app','m170523_190652_element_field_layout_ids','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','f8621912-ae2f-4bd3-979e-4b7bba925e7d'),
	(56,NULL,'app','m170612_000000_route_index_shuffle','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','c7401196-7f6a-439b-aeaf-b9984bb5c4b1'),
	(57,NULL,'app','m170621_195237_format_plugin_handles','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','33717450-3286-401b-bda2-1c1f5294cf18'),
	(58,NULL,'app','m170630_161027_deprecation_line_nullable','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','1d2c15ab-3216-4d36-85f5-b20854981c08'),
	(59,NULL,'app','m170630_161028_deprecation_changes','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','b594a469-f6d4-4431-b8ee-dc30a6872fe7'),
	(60,NULL,'app','m170703_181539_plugins_table_tweaks','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','cdf8fc63-d9f2-40b1-b05d-4c15f30c2e57'),
	(61,NULL,'app','m170704_134916_sites_tables','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','1a2e01f4-b9b5-4825-9b0e-4942268500d3'),
	(62,NULL,'app','m170706_183216_rename_sequences','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','4dfd5906-b04b-4ea7-b1c3-2c14f83f3aa4'),
	(63,NULL,'app','m170707_094758_delete_compiled_traits','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','850d8e16-3fbb-40df-8da8-5f32d4eaf3dd'),
	(64,NULL,'app','m170731_190138_drop_asset_packagist','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','0e119071-f24a-4c28-aab2-eb4fe65b6ba2'),
	(65,NULL,'app','m170810_201318_create_queue_table','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','8eb7ad07-b4d6-4b30-afb0-f1010a2a3544'),
	(66,NULL,'app','m170816_133741_delete_compiled_behaviors','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','97b25747-a3cd-4bf4-b5e4-85822fce14e6'),
	(67,NULL,'app','m170903_192801_longblob_for_queue_jobs','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','c4ab9701-8293-4b85-b5c9-80a04b1ce123'),
	(68,NULL,'app','m170914_204621_asset_cache_shuffle','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','1eef2c9e-9e9b-4748-952f-ba3d0f8cf480'),
	(69,NULL,'app','m171011_214115_site_groups','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','e23f8bcf-77e4-43b1-9369-b34ab401b919'),
	(70,NULL,'app','m171012_151440_primary_site','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','809799c5-0f2d-461b-8d57-c040310f3bf3'),
	(71,NULL,'app','m171013_142500_transform_interlace','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','3f261b1d-bad9-4c21-a0af-2ec2aa212f1b'),
	(72,NULL,'app','m171016_092553_drop_position_select','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','399aaf58-d847-464f-ac94-134a1b38435f'),
	(73,NULL,'app','m171016_221244_less_strict_translation_method','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','01e3eb93-089b-4985-b7fa-b19490d7ce5e'),
	(74,NULL,'app','m171107_000000_assign_group_permissions','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','8eead9cb-a5cf-4777-9aee-bcca3255cf79'),
	(75,NULL,'app','m171117_000001_templatecache_index_tune','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','6833dda9-2b38-4333-a1bc-190ed281af83'),
	(76,NULL,'app','m171126_105927_disabled_plugins','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','082bb510-ee8b-4e1f-abfb-5f8024643109'),
	(77,NULL,'app','m171130_214407_craftidtokens_table','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','d7cd5ed0-6a57-463b-bcce-c577c5bff888'),
	(78,NULL,'app','m171202_004225_update_email_settings','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','e6f40f36-832d-493a-ba99-669765c5cd44'),
	(79,NULL,'app','m171204_000001_templatecache_index_tune_deux','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','ef3495de-60d4-400a-934c-c81e21ae245a'),
	(80,NULL,'app','m171205_130908_remove_craftidtokens_refreshtoken_column','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','e075d82b-fb5e-4e31-95df-85ee79d622e3'),
	(81,NULL,'app','m171218_143135_longtext_query_column','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','70a5b4af-8b56-43ee-9e07-c6a279fe9642'),
	(82,NULL,'app','m171231_055546_environment_variables_to_aliases','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','3a2b9e39-6501-479c-a673-c043a5413300'),
	(83,NULL,'app','m180113_153740_drop_users_archived_column','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','fda7203a-aba9-4c8f-a99f-50d32108cdb0'),
	(84,NULL,'app','m180122_213433_propagate_entries_setting','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','d438149b-7837-40b1-b24b-ab2cbf2ead4e'),
	(85,NULL,'app','m180124_230459_fix_propagate_entries_values','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','0c364f1c-3ac4-41ea-be26-64c713c2e8e5'),
	(86,NULL,'app','m180128_235202_set_tag_slugs','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','d17650f5-7a08-416d-a954-b740a4e0196b'),
	(87,NULL,'app','m180202_185551_fix_focal_points','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','0fa1dc28-c67d-4215-9912-a06926953837'),
	(88,NULL,'app','m180217_172123_tiny_ints','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','aeee8c2a-58a0-4c55-86e3-005642989c57'),
	(89,NULL,'app','m180321_233505_small_ints','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','ce516fde-f448-4c00-9d6b-77b914ee8fcc'),
	(90,NULL,'app','m180328_115523_new_license_key_statuses','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','dace38a7-bc71-47b2-b571-b439a8859f03'),
	(91,NULL,'app','m180404_182320_edition_changes','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','9ffca219-0459-4f04-b850-d0c3261584dc'),
	(92,NULL,'app','m180411_102218_fix_db_routes','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','7ffc5e74-3513-49a3-a4cc-52941ee68c9b'),
	(93,NULL,'app','m180416_205628_resourcepaths_table','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','bceb4135-fe12-4a99-b71d-a515909fce69'),
	(94,NULL,'app','m180418_205713_widget_cleanup','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','c6af2080-87d9-4632-81cf-bc74ab5c0f80'),
	(95,NULL,'app','m180425_203349_searchable_fields','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','662cf633-0e33-4a11-9ba1-de3dbe613236'),
	(96,NULL,'app','m180516_153000_uids_in_field_settings','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','de328d52-395d-4af4-8f52-7177136b070c'),
	(97,NULL,'app','m180517_173000_user_photo_volume_to_uid','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','efc057a2-e66b-4e9e-a182-c13f589f2e75'),
	(98,NULL,'app','m180518_173000_permissions_to_uid','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','2c207153-15c0-4bad-b78b-b079c8a3fa43'),
	(99,NULL,'app','m180520_173000_matrix_context_to_uids','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','22b58782-f9a5-46fc-9990-86744d126397'),
	(100,NULL,'app','m180521_173000_initial_yml_and_snapshot','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','0ac53527-e101-4132-acf4-5ccf32bfbd17'),
	(101,NULL,'app','m180731_162030_soft_delete_sites','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','26768262-2742-420d-a5b8-6ef564e5ece4'),
	(102,NULL,'app','m180810_214427_soft_delete_field_layouts','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','ed3d12ba-71a4-4ef8-9ef9-cac44a5bc910'),
	(103,NULL,'app','m180810_214439_soft_delete_elements','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','2f3d534f-7865-46f1-a6ff-fb241746f7e4'),
	(104,NULL,'app','m180824_193422_case_sensitivity_fixes','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','420f7b70-8a81-4a9f-a897-0c2f8652325f'),
	(105,NULL,'app','m180901_151639_fix_matrixcontent_tables','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','f0071e74-e5a1-46bb-88eb-72097636d364'),
	(106,NULL,'app','m180904_112109_permission_changes','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','b678f52a-8d1e-4dc0-b612-b2642effd246'),
	(107,NULL,'app','m180910_142030_soft_delete_sitegroups','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','8e00657e-1f1c-48f6-8fe0-9df5baec6a81'),
	(108,NULL,'app','m181011_160000_soft_delete_asset_support','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','806bafd8-c717-4481-b746-1a4d27addfe9'),
	(109,NULL,'app','m181016_183648_set_default_user_settings','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','a3ef59a0-b197-42c2-a9f9-5592e55a6e52'),
	(110,NULL,'app','m181017_225222_system_config_settings','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','31a01afc-6036-4f8d-a566-db218dcbf78d'),
	(111,NULL,'app','m181018_222343_drop_userpermissions_from_config','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','d53df0f3-f0a3-4fdd-890b-04e658aca135'),
	(112,NULL,'app','m181029_130000_add_transforms_routes_to_config','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','73fade15-f147-47c0-ab7f-40726f1fdabe'),
	(113,NULL,'app','m181112_203955_sequences_table','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','49235fdf-c011-4160-aa18-2197d29613b8'),
	(114,NULL,'app','m181121_001712_cleanup_field_configs','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','085f25a8-8133-4967-90b0-876d1779485e'),
	(115,NULL,'app','m181128_193942_fix_project_config','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','e9d93bc1-589b-4655-a67e-02742bc15feb'),
	(116,NULL,'app','m181130_143040_fix_schema_version','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','f0c36c43-745f-4459-9158-d762acf79d20'),
	(117,NULL,'app','m181211_143040_fix_entry_type_uids','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','64d24b7a-0f2e-4857-8c57-8e23e08c777c'),
	(118,NULL,'app','m181213_102500_config_map_aliases','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','074d2b3c-c7e5-418a-a690-e436eea98b8b'),
	(119,NULL,'app','m181217_153000_fix_structure_uids','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','0432a8d8-35dd-4176-afa5-b25e72ecc097'),
	(120,NULL,'app','m190104_152725_store_licensed_plugin_editions','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','85b9f162-0b3b-4a9f-a2e1-e7b6744ae8bd'),
	(121,NULL,'app','m190108_110000_cleanup_project_config','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','f6603f84-a3f3-40d0-ab22-a492e4dd8c55'),
	(122,NULL,'app','m190108_113000_asset_field_setting_change','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','c04781f0-a4e7-4056-8281-b39a07baacee'),
	(123,NULL,'app','m190109_172845_fix_colspan','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','968ff388-f99a-44ed-8cc4-ef90f2dd4f46'),
	(124,NULL,'app','m190110_150000_prune_nonexisting_sites','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','cf72ab57-b684-48f4-8c6b-be1ed42c909f'),
	(125,NULL,'app','m190110_214819_soft_delete_volumes','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','4b7e48d3-058c-4c04-80d2-f0f5a0f84616'),
	(126,NULL,'app','m190112_124737_fix_user_settings','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','189f7845-5858-4803-8208-2d2782d990b7'),
	(127,NULL,'app','m190112_131225_fix_field_layouts','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','11c8821e-690d-4096-87b3-b82e9143850b'),
	(128,NULL,'app','m190112_201010_more_soft_deletes','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','6f81ea72-3c6e-4e65-81f1-e821bb5d78a5'),
	(129,NULL,'app','m190114_143000_more_asset_field_setting_changes','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','5f6c1817-86bf-4720-a43c-e4ba2e225fb4'),
	(130,NULL,'app','m190121_120000_rich_text_config_setting','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','8f260af9-79b1-4c9d-b718-a150c235d534'),
	(131,NULL,'app','m190125_191628_fix_email_transport_password','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','e2cab9ad-a3c0-45cf-b70a-d3027c807eae'),
	(132,NULL,'app','m190128_181422_cleanup_volume_folders','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','e3373576-4066-4639-b705-1c49d3a55e87'),
	(133,NULL,'app','m190205_140000_fix_asset_soft_delete_index','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','7a6be6d1-c735-4a3b-bba5-7cb9132afe64'),
	(134,NULL,'app','m190208_140000_reset_project_config_mapping','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','484ae9d1-850c-4c6d-b2e9-302a44dbb762'),
	(135,NULL,'app','m190218_143000_element_index_settings_uid','2019-03-06 21:56:10','2019-03-06 21:56:10','2019-03-06 21:56:10','2f01c8b9-3b2d-456d-ab58-46a5d755c9c5'),
	(136,1,'plugin','Install','2019-03-06 23:02:48','2019-03-06 23:02:48','2019-03-06 23:02:48','f7c5fb88-4612-4d56-a92a-a800d179923e'),
	(137,1,'plugin','m180929_165000_remove_storageclass_setting','2019-03-06 23:02:48','2019-03-06 23:02:48','2019-03-06 23:02:48','54073a5d-0bcf-441e-a5c1-7886103853bb'),
	(138,1,'plugin','m190131_214300_cleanup_config','2019-03-06 23:02:48','2019-03-06 23:02:48','2019-03-06 23:02:48','e6fe03d9-a6d6-488e-8938-38efb75a5906'),
	(139,1,'plugin','m190305_133000_cleanup_expires_config','2019-03-06 23:02:48','2019-03-06 23:02:48','2019-03-06 23:02:48','ad3d9845-b530-4c7b-872a-e3018f0358a4'),
	(140,2,'plugin','m180430_204710_remove_old_plugins','2019-03-06 23:02:50','2019-03-06 23:02:50','2019-03-06 23:02:50','3a46845d-7586-447a-8277-5fa2f14c6a7a'),
	(141,2,'plugin','Install','2019-03-06 23:02:50','2019-03-06 23:02:50','2019-03-06 23:02:50','9f63894e-a528-4ab4-b817-ee9ea0787ebb');

/*!40000 ALTER TABLE `craft_migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_plugins
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_plugins`;

CREATE TABLE `craft_plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `licenseKeyStatus` enum('valid','invalid','mismatched','astray','unknown') NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_plugins_handle_unq_idx` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_plugins` WRITE;
/*!40000 ALTER TABLE `craft_plugins` DISABLE KEYS */;

INSERT INTO `craft_plugins` (`id`, `handle`, `version`, `schemaVersion`, `licenseKeyStatus`, `licensedEdition`, `installDate`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'aws-s3','1.2.1','1.2','unknown',NULL,'2019-03-06 23:02:48','2019-03-06 23:02:48','2019-04-08 12:48:17','521c6888-4f7a-4ede-8db9-1a860052599b'),
	(2,'redactor','2.3.2','2.2.2','unknown',NULL,'2019-03-06 23:02:50','2019-03-06 23:02:50','2019-04-08 12:48:17','2a9e519c-3c97-4e90-9973-7de0a57dfa4f');

/*!40000 ALTER TABLE `craft_plugins` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_queue
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_queue`;

CREATE TABLE `craft_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT '0',
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text,
  PRIMARY KEY (`id`),
  KEY `craft_queue_fail_timeUpdated_timePushed_idx` (`fail`,`timeUpdated`,`timePushed`),
  KEY `craft_queue_fail_timeUpdated_delay_idx` (`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table craft_relations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_relations`;

CREATE TABLE `craft_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_relations_fieldId_sourceId_sourceSiteId_targetId_unq_idx` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `craft_relations_sourceId_idx` (`sourceId`),
  KEY `craft_relations_targetId_idx` (`targetId`),
  KEY `craft_relations_sourceSiteId_idx` (`sourceSiteId`),
  CONSTRAINT `craft_relations_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_relations_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_relations_sourceSiteId_fk` FOREIGN KEY (`sourceSiteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_relations_targetId_fk` FOREIGN KEY (`targetId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_relations` WRITE;
/*!40000 ALTER TABLE `craft_relations` DISABLE KEYS */;

INSERT INTO `craft_relations` (`id`, `fieldId`, `sourceId`, `sourceSiteId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(514,17,27,NULL,74,1,'2019-03-28 21:16:23','2019-03-28 21:16:23','27645740-e3bb-41ce-bafd-1ff56d73206a'),
	(646,11,7,NULL,76,1,'2019-04-08 23:18:20','2019-04-08 23:18:20','6a3b1a8f-c393-4715-abfe-c492c04f4280'),
	(647,17,7,NULL,78,1,'2019-04-08 23:18:20','2019-04-08 23:18:20','da8c9c6e-b06a-40ac-aee7-033fafd685c9'),
	(648,7,7,NULL,75,1,'2019-04-08 23:18:20','2019-04-08 23:18:20','3e2fd98c-4cad-443f-a2f2-aad217bc2f24'),
	(649,11,10,NULL,76,1,'2019-04-08 23:18:21','2019-04-08 23:18:21','19e126b4-2630-44fd-ac43-1ca16746a68c'),
	(650,7,10,NULL,75,1,'2019-04-08 23:18:21','2019-04-08 23:18:21','0d9be733-1996-45ba-a2d1-c99ce4c29d9e'),
	(651,12,10,NULL,77,1,'2019-04-08 23:18:21','2019-04-08 23:18:21','f5c825c4-6128-4a75-abbe-3b29122dcd2d'),
	(652,16,15,NULL,11,1,'2019-04-08 23:18:21','2019-04-08 23:18:21','79be0c8d-ba18-4fbd-8517-7b96624f4c80'),
	(653,16,16,NULL,12,1,'2019-04-08 23:18:21','2019-04-08 23:18:21','38a44fc4-d005-43f9-a860-aa42e955f23d'),
	(654,16,17,NULL,13,1,'2019-04-08 23:18:21','2019-04-08 23:18:21','e1d2288a-8d16-401c-9ac2-6d1a9783c763'),
	(655,16,18,NULL,11,1,'2019-04-08 23:18:21','2019-04-08 23:18:21','de4a7cb6-9e2b-4854-9452-1f14c1671fc1'),
	(656,7,20,NULL,19,1,'2019-04-08 23:18:21','2019-04-08 23:18:21','30e0cf55-08b1-4e0d-82f3-2961145c2f14'),
	(657,12,20,NULL,9,1,'2019-04-08 23:18:21','2019-04-08 23:18:21','1e354ca4-8d05-4168-b670-1d6ec9fe9e11'),
	(658,11,22,NULL,145,1,'2019-04-08 23:18:21','2019-04-08 23:18:21','c20e6edb-947e-49f5-97ec-f82182d0332a'),
	(659,17,22,NULL,24,1,'2019-04-08 23:18:21','2019-04-08 23:18:21','1215d732-740a-463a-8da3-2fa9057cea79'),
	(660,7,22,NULL,167,1,'2019-04-08 23:18:21','2019-04-08 23:18:21','77b39944-18dd-40a0-9b05-8c4aef775c54'),
	(661,11,23,NULL,148,1,'2019-04-08 23:18:21','2019-04-08 23:18:21','af3e4af3-19fb-4dfa-8d34-c2dbb8c2cccd'),
	(662,7,23,NULL,158,1,'2019-04-08 23:18:21','2019-04-08 23:18:21','66dcff3b-9d4b-4b9f-81d1-c52c06c8d357'),
	(663,12,23,NULL,149,1,'2019-04-08 23:18:21','2019-04-08 23:18:21','91e5aa82-f507-497d-8a62-b052532c6690'),
	(664,7,27,NULL,137,1,'2019-04-08 23:18:21','2019-04-08 23:18:21','a6f843b9-e32b-42cb-9470-c19bc3521dac'),
	(665,11,27,NULL,8,1,'2019-04-08 23:18:21','2019-04-08 23:18:21','eea4f873-0518-4272-950e-99c1a0ce4783'),
	(666,11,96,NULL,84,1,'2019-04-08 23:18:21','2019-04-08 23:18:21','f46fcb7e-5bbc-44ee-a24a-e4cb397ecf12'),
	(667,17,96,NULL,86,1,'2019-04-08 23:18:21','2019-04-08 23:18:21','b6c9e0d1-e92c-47cb-a0e3-742433052131'),
	(668,7,96,NULL,83,1,'2019-04-08 23:18:21','2019-04-08 23:18:21','f86c9d5f-88c4-4a2f-ad10-a9418937e1c5'),
	(669,11,97,NULL,84,1,'2019-04-08 23:18:21','2019-04-08 23:18:21','84b72487-94b2-42cb-85b9-a2893c05e558'),
	(670,7,97,NULL,83,1,'2019-04-08 23:18:21','2019-04-08 23:18:21','51eb32b8-b229-402f-bb1f-6dd99d1ac317'),
	(671,12,97,NULL,85,1,'2019-04-08 23:18:21','2019-04-08 23:18:21','994beb03-e816-4890-b288-f189f1d222a0'),
	(672,11,99,NULL,80,1,'2019-04-08 23:18:21','2019-04-08 23:18:21','175892c6-8efa-4080-8347-f93eedc57e19'),
	(673,17,99,NULL,82,1,'2019-04-08 23:18:21','2019-04-08 23:18:21','562bb30e-2f57-4c38-8dd9-c15272c00c9a'),
	(674,7,99,NULL,79,1,'2019-04-08 23:18:21','2019-04-08 23:18:21','e9cb49a9-0b86-43ea-a2db-da4684716a5c'),
	(675,11,100,NULL,80,1,'2019-04-08 23:18:21','2019-04-08 23:18:21','8802bf0b-c8f1-42a9-8acd-0884d81976ae'),
	(676,7,100,NULL,79,1,'2019-04-08 23:18:21','2019-04-08 23:18:21','b58cd123-5ecf-4944-83e0-9c0e2e460ee9'),
	(677,12,100,NULL,81,1,'2019-04-08 23:18:21','2019-04-08 23:18:21','674855a1-66fc-41ab-99eb-e69f3408f413'),
	(678,11,102,NULL,72,1,'2019-04-08 23:18:21','2019-04-08 23:18:21','e38fd498-6b5c-47cb-8fdb-ee93cac9130b'),
	(679,17,102,NULL,74,1,'2019-04-08 23:18:21','2019-04-08 23:18:21','a80f74f8-730d-4869-872f-8a72cc9a406e'),
	(680,7,102,NULL,71,1,'2019-04-08 23:18:22','2019-04-08 23:18:22','7513e634-01fc-4e99-8c2e-e13107995c30'),
	(681,11,103,NULL,72,1,'2019-04-08 23:18:22','2019-04-08 23:18:22','b14cd081-00b9-4df1-bf20-49999cde95e1'),
	(682,7,103,NULL,71,1,'2019-04-08 23:18:22','2019-04-08 23:18:22','7042274c-c5d7-4268-bffe-649ce12b4824'),
	(683,12,103,NULL,73,1,'2019-04-08 23:18:22','2019-04-08 23:18:22','ad5d969e-51bd-4e09-96fa-b15a16f019b5'),
	(684,11,105,NULL,68,1,'2019-04-08 23:18:22','2019-04-08 23:18:22','eb12c903-c40c-404f-bd4d-267ed56e86ea'),
	(685,17,105,NULL,70,1,'2019-04-08 23:18:22','2019-04-08 23:18:22','4514f9af-64c5-4386-81b1-80431e1d9005'),
	(686,7,105,NULL,67,1,'2019-04-08 23:18:22','2019-04-08 23:18:22','77ad55b0-77d7-4682-8671-20ab1b406896'),
	(687,11,106,NULL,68,1,'2019-04-08 23:18:22','2019-04-08 23:18:22','8dc7fe27-0599-4bcb-930c-9ba3f9f8b2e8'),
	(688,7,106,NULL,67,1,'2019-04-08 23:18:22','2019-04-08 23:18:22','d003bc9d-7707-425e-8b65-6478bffe5472'),
	(689,12,106,NULL,69,1,'2019-04-08 23:18:22','2019-04-08 23:18:22','4ae03317-f694-4f53-9b92-7bfc6a174365'),
	(690,11,107,NULL,60,1,'2019-04-08 23:18:22','2019-04-08 23:18:22','b396e96f-39ba-4782-8db8-d15b28175316'),
	(691,17,107,NULL,62,1,'2019-04-08 23:18:22','2019-04-08 23:18:22','d49d366d-9b95-4c41-a4da-eebff7abe619'),
	(692,7,107,NULL,59,1,'2019-04-08 23:18:22','2019-04-08 23:18:22','29a83a30-7f01-4f94-8622-4c8964ca4f50'),
	(693,11,108,NULL,60,1,'2019-04-08 23:18:22','2019-04-08 23:18:22','f47c15a3-de7e-4ae4-9cc3-97374f8e4cae'),
	(694,7,108,NULL,59,1,'2019-04-08 23:18:22','2019-04-08 23:18:22','dd4378d9-f580-401e-bf2b-3895fa3d7da7'),
	(695,12,108,NULL,61,1,'2019-04-08 23:18:22','2019-04-08 23:18:22','7d3f403c-c4b2-4ef1-bafe-73cc7d4c4576'),
	(696,11,109,NULL,64,1,'2019-04-08 23:18:22','2019-04-08 23:18:22','75e676dd-2949-4346-8910-7f5b2ce28ed6'),
	(697,17,109,NULL,66,1,'2019-04-08 23:18:22','2019-04-08 23:18:22','68ead36d-5747-4ef4-a3bd-dc67b4c1c568'),
	(698,7,109,NULL,63,1,'2019-04-08 23:18:22','2019-04-08 23:18:22','70b67c92-501b-4db3-a9fd-547f8ffc7c16'),
	(699,11,110,NULL,64,1,'2019-04-08 23:18:22','2019-04-08 23:18:22','2bb8fb9d-36c2-4b35-95bc-52e6984dbac0'),
	(700,7,110,NULL,63,1,'2019-04-08 23:18:22','2019-04-08 23:18:22','1df2788e-fb6c-4d57-b378-c54f611e87eb'),
	(701,12,110,NULL,65,1,'2019-04-08 23:18:22','2019-04-08 23:18:22','4611f288-b216-4c5b-b867-b01c6417e4d5'),
	(702,11,112,NULL,56,1,'2019-04-08 23:18:22','2019-04-08 23:18:22','a8b21270-06f7-4ff5-bc19-514ea2701ae3'),
	(703,17,112,NULL,58,1,'2019-04-08 23:18:22','2019-04-08 23:18:22','620c94c4-2ef1-44d1-804f-4931554760e2'),
	(704,7,112,NULL,55,1,'2019-04-08 23:18:22','2019-04-08 23:18:22','6c8ecf9c-6b50-434d-a243-efc372f09672'),
	(705,11,113,NULL,56,1,'2019-04-08 23:18:22','2019-04-08 23:18:22','b5043e1b-f592-431f-a4d9-37f044d5fa21'),
	(706,7,113,NULL,55,1,'2019-04-08 23:18:22','2019-04-08 23:18:22','b91461c5-9727-4ec5-bedf-a8fab3ac6713'),
	(707,12,113,NULL,57,1,'2019-04-08 23:18:22','2019-04-08 23:18:22','64b53064-f963-47fe-a6d4-df70ddcdc574'),
	(708,11,115,NULL,52,1,'2019-04-08 23:18:22','2019-04-08 23:18:22','2ad72b4b-929e-4f8e-9e20-667b8ade537f'),
	(709,17,115,NULL,54,1,'2019-04-08 23:18:22','2019-04-08 23:18:22','15dc6f02-b6be-4b9e-81ac-3e5df1e4959a'),
	(710,7,115,NULL,51,1,'2019-04-08 23:18:22','2019-04-08 23:18:22','7f657aaa-f357-4f80-9858-dfc6977b3b01'),
	(711,11,116,NULL,52,1,'2019-04-08 23:18:22','2019-04-08 23:18:22','e21aa63b-954f-4cf1-a205-3135b21408d9'),
	(712,7,116,NULL,51,1,'2019-04-08 23:18:22','2019-04-08 23:18:22','cac16a13-e501-486e-9d05-8a24aa3dd1e1'),
	(713,12,116,NULL,53,1,'2019-04-08 23:18:22','2019-04-08 23:18:22','2c7ab680-76d6-4994-92e6-6becd19b66a6'),
	(714,11,117,NULL,48,1,'2019-04-08 23:18:22','2019-04-08 23:18:22','870c9dc8-e2d7-4a90-9109-8ba20fb4398d'),
	(715,17,117,NULL,50,1,'2019-04-08 23:18:22','2019-04-08 23:18:22','5c53b255-a7cf-4ce3-a0f7-d4c10fc5ce8b'),
	(716,7,117,NULL,47,1,'2019-04-08 23:18:22','2019-04-08 23:18:22','98c15fe8-b5c4-4d5d-947d-9f0fbe88c7f5'),
	(717,11,118,NULL,48,1,'2019-04-08 23:18:23','2019-04-08 23:18:23','448b4d94-ace8-4d90-9940-e8e969759c09'),
	(718,7,118,NULL,47,1,'2019-04-08 23:18:23','2019-04-08 23:18:23','9ccd5f57-95ba-4e8e-ac99-5bbbf4efe84b'),
	(719,12,118,NULL,49,1,'2019-04-08 23:18:23','2019-04-08 23:18:23','043828af-1915-42f4-83c4-e9703551cc3b'),
	(720,11,120,NULL,33,1,'2019-04-08 23:18:23','2019-04-08 23:18:23','032a3a3e-48e5-4eec-8336-fb52b5f9107a'),
	(721,17,120,NULL,37,1,'2019-04-08 23:18:23','2019-04-08 23:18:23','30955b90-9a5d-4a24-a878-8590c788f8db'),
	(722,7,120,NULL,32,1,'2019-04-08 23:18:23','2019-04-08 23:18:23','27ee2d57-8908-4778-85b1-3ba5fde537e5'),
	(723,11,121,NULL,33,1,'2019-04-08 23:18:23','2019-04-08 23:18:23','5324470b-33d8-41f3-bb8b-6dd71faedfea'),
	(724,7,121,NULL,32,1,'2019-04-08 23:18:23','2019-04-08 23:18:23','c26e65be-48b6-446c-b0b3-171b8e314ee4'),
	(725,12,121,NULL,35,1,'2019-04-08 23:18:23','2019-04-08 23:18:23','8292d6f2-00e0-45c3-80b9-7c6f2735281a'),
	(726,7,122,NULL,137,1,'2019-04-08 23:18:23','2019-04-08 23:18:23','aca005a6-0565-4c79-a550-d1db13ec502b'),
	(727,12,122,NULL,36,1,'2019-04-08 23:18:23','2019-04-08 23:18:23','14cb6eaa-593d-4404-b979-31f3787337ef'),
	(728,11,123,NULL,40,1,'2019-04-08 23:18:23','2019-04-08 23:18:23','08d6d5e4-5af3-410e-8f57-f352f27c4ccb'),
	(729,17,123,NULL,46,1,'2019-04-08 23:18:23','2019-04-08 23:18:23','8b3b4282-a02f-482a-8354-69843f980ce4'),
	(730,7,123,NULL,39,1,'2019-04-08 23:18:23','2019-04-08 23:18:23','46091103-f6a1-4a8e-86a2-cc7fdef5c2d0'),
	(731,11,124,NULL,40,1,'2019-04-08 23:18:23','2019-04-08 23:18:23','87028361-1579-46b6-8c57-5a65ebfd1bc8'),
	(732,7,124,NULL,39,1,'2019-04-08 23:18:23','2019-04-08 23:18:23','4ab37543-7ffe-495e-bca1-842bfee61891'),
	(733,12,124,NULL,42,1,'2019-04-08 23:18:23','2019-04-08 23:18:23','6406ebdf-ccbb-4708-b9da-fdd7dfe2e815'),
	(734,16,126,NULL,43,1,'2019-04-08 23:18:23','2019-04-08 23:18:23','bc71fb69-2190-4c5c-b4fe-82d772536a8c'),
	(735,16,127,NULL,44,1,'2019-04-08 23:18:23','2019-04-08 23:18:23','9286b932-ff6e-4f52-a2a3-3d52d1aaaaa6'),
	(736,16,128,NULL,45,1,'2019-04-08 23:18:23','2019-04-08 23:18:23','df29bc43-48a9-43c3-b215-a097f6953719'),
	(737,11,130,NULL,30,1,'2019-04-08 23:18:23','2019-04-08 23:18:23','484a404b-dba1-44da-9f74-0098951a5f2b'),
	(738,17,130,NULL,29,1,'2019-04-08 23:18:23','2019-04-08 23:18:23','f198bbfc-ae08-4c42-bd5f-81a1d72a450f'),
	(739,7,130,NULL,39,1,'2019-04-08 23:18:23','2019-04-08 23:18:23','e3181404-face-4134-b381-e60a857a13fa'),
	(740,11,131,NULL,30,1,'2019-04-08 23:18:23','2019-04-08 23:18:23','ebb6e0a7-1333-4334-9eb2-8f651c5f3a48'),
	(741,7,131,NULL,39,1,'2019-04-08 23:18:23','2019-04-08 23:18:23','708841e4-8d11-4ad3-abed-b663b4bf7832'),
	(742,12,131,NULL,31,1,'2019-04-08 23:18:23','2019-04-08 23:18:23','4301a2e7-b255-4fe4-8929-11331e5cf885'),
	(743,16,133,NULL,11,1,'2019-04-08 23:18:23','2019-04-08 23:18:23','e0d92374-d0a3-4dcb-98c4-7f9aa0d97b82'),
	(744,16,134,NULL,12,1,'2019-04-08 23:18:23','2019-04-08 23:18:23','d64aa662-a13a-455f-9a86-8e56a504122a'),
	(745,16,135,NULL,13,1,'2019-04-08 23:18:23','2019-04-08 23:18:23','7409a5f7-7b1e-4d9c-a3c9-4a33070f7546'),
	(746,11,138,NULL,30,1,'2019-04-08 23:18:23','2019-04-08 23:18:23','f54a0355-efac-431e-b037-c3815a562634'),
	(747,16,139,NULL,43,1,'2019-04-08 23:18:24','2019-04-08 23:18:24','e0e0ea34-7e70-4e5d-94dd-7306648ea7d3'),
	(748,16,140,NULL,44,1,'2019-04-08 23:18:24','2019-04-08 23:18:24','561d9b69-89f1-4056-8afe-da05870a40e8'),
	(749,16,141,NULL,45,1,'2019-04-08 23:18:24','2019-04-08 23:18:24','161b5728-6ba0-489a-8b8a-3ddc6f682c53'),
	(750,16,142,NULL,43,1,'2019-04-08 23:18:24','2019-04-08 23:18:24','5e2c3d7b-101f-4bdf-a086-469aa7b40556'),
	(751,11,151,NULL,153,1,'2019-04-08 23:18:24','2019-04-08 23:18:24','35f59e53-2ae7-4741-b378-e5d18b3c73af'),
	(752,16,155,NULL,165,1,'2019-04-08 23:18:24','2019-04-08 23:18:24','63024c11-7046-4f66-ab95-af398bbcb97d'),
	(753,16,160,NULL,159,1,'2019-04-08 23:18:24','2019-04-08 23:18:24','87f76d66-ce63-4ed4-aad9-34d38a22bb9a'),
	(754,16,163,NULL,161,1,'2019-04-08 23:18:24','2019-04-08 23:18:24','db5402a0-5c75-439d-b634-7ce25eb94c71'),
	(755,16,164,NULL,162,1,'2019-04-08 23:18:24','2019-04-08 23:18:24','4953bf95-c826-48f4-992d-d305d07d7cc4'),
	(756,11,166,NULL,167,1,'2019-04-08 23:18:24','2019-04-08 23:18:24','be0ee750-38bc-4d12-9303-e08107a763f4'),
	(757,7,166,NULL,167,1,'2019-04-08 23:18:24','2019-04-08 23:18:24','5cedbd04-1bf0-4824-9831-029c53e48368'),
	(759,11,168,NULL,60,1,'2019-04-08 23:20:11','2019-04-08 23:20:11','189bc23c-5e6d-4885-9108-66cd4a688493'),
	(760,27,169,NULL,12,1,'2019-04-08 23:36:37','2019-04-08 23:36:37','f774c1c1-32cd-4308-9577-ac4d8335385c');

/*!40000 ALTER TABLE `craft_relations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_resourcepaths
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_resourcepaths`;

CREATE TABLE `craft_resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_resourcepaths` WRITE;
/*!40000 ALTER TABLE `craft_resourcepaths` DISABLE KEYS */;

INSERT INTO `craft_resourcepaths` (`hash`, `path`)
VALUES
	('14066c6c','@lib/fileupload'),
	('188a5a9d','@app/web/assets/dbbackup/dist'),
	('1a95cfb6','@craft/web/assets/sites/dist'),
	('1e1e7e3d','@app/web/assets/cp/dist'),
	('20a5fbf0','@app/web/assets/fields/dist'),
	('24754796','@craft/web/assets/fields/dist'),
	('24b08e7b','@lib/fabric'),
	('24b4dc3','@lib/d3'),
	('27c2d5be','@app/web/assets/dashboard/dist'),
	('3183daa5','@craft/awss3/resources'),
	('31f65a45','@lib/garnishjs'),
	('323f4aa1','@vendor/craftcms/redactor/lib/redactor-plugins/beyondgrammar'),
	('383f1acf','@app/web/assets/updates/dist'),
	('3bdfb168','@vendor/craftcms/redactor/lib/redactor-plugins/alignment'),
	('4133e70a','@lib/datepicker-i18n'),
	('42bf7522','@lib'),
	('44c1bcce','@craft/web/assets/updateswidget/dist'),
	('44d5d95','@craft/web/assets/utilities/dist'),
	('4deee895','@craft/web/assets/generalsettings/dist'),
	('5263316','@app/web/assets/pluginstore/dist'),
	('52fc049c','@lib/xregexp'),
	('544fef4','@craft/redactor/assets/field/dist'),
	('57c45522','@craft/web/assets/pluginstore/dist'),
	('58904016','@lib/selectize'),
	('5ebf655f','@craft/web/assets/cp/dist'),
	('650998ad','@app/web/assets/plugins/dist'),
	('6b8e05e1','@craft/web/assets/searchindexes/dist'),
	('6d035ce9','@lib/timepicker'),
	('76417be','@app/web/assets/editentry/dist'),
	('77390188','@craft/web/assets/findreplace/dist'),
	('781e6374','@vendor/craftcms/redactor/lib/redactor'),
	('7a7bfea0','@craft/web/assets/recententries/dist'),
	('80445115','@bower/jquery/dist'),
	('846358a','@app/web/assets/matrix/dist'),
	('859d9348','@craft/web/assets/editentry/dist'),
	('86b4d963','@app/web/assets/utilities/dist'),
	('8dec0980','@lib/jquery.payment'),
	('8f9eb73c','@app/web/assets/tablesettings/dist'),
	('91cba668','@lib/velocity'),
	('9ab8bfb4','@craft/web/assets/deprecationerrors/dist'),
	('9cc5bd9','@lib/prismjs'),
	('9cea0e1e','@craft/web/assets/updates/dist'),
	('9dd4d04c','@app/web/assets/feed/dist'),
	('a46e8090','@craft/web/assets/cp/dist'),
	('a53b5148','@craft/web/assets/dashboard/dist'),
	('ac1e8423','@app/web/assets/matrixsettings/dist'),
	('afd4fae0','@lib/element-resize-detector'),
	('b4a5150','@lib/jquery-touch-events'),
	('b6b1d5ea','@craft/web/assets/routes/dist'),
	('b86e90ed','@lib'),
	('baf1b224','@craft/web/assets/matrixsettings/dist'),
	('c1dc8c7c','@craft/web/assets/plugins/dist'),
	('c5cede04','@vendor/craftcms/redactor/lib/redactor-plugins/fullscreen'),
	('c67f5e3','@craft/web/assets/tablesettings/dist'),
	('c738fe11','@app/web/assets/updateswidget/dist'),
	('c9689ec','@craft/web/assets/matrix/dist'),
	('c9aa52d0','@app/web/assets/craftsupport/dist'),
	('cee6d92','@lib/picturefill'),
	('d13aba7f','@app/web/assets/installer/dist'),
	('dbe564b6','@craft/web/assets/systemmessages/dist'),
	('dc61b7fb','@craft/web/assets/clearcaches/dist'),
	('dc787783','@craft/web/assets/feed/dist'),
	('dcdefd7d','@craft/web/assets/assetindexes/dist'),
	('df623dcd','@lib/jquery-ui'),
	('e0f18e8c','@app/web/assets/login/dist'),
	('e36d4ac7','@craft/web/assets/craftsupport/dist'),
	('e4cf9bf2','@app/web/assets/cp/dist'),
	('e9fa6dcb','@craft/web/assets/dbbackup/dist'),
	('eb6bfd0a','@craft/web/assets/login/dist'),
	('f29b24e2','@vendor/craftcms/redactor/lib/redactor-plugins/video'),
	('f982bc7f','@app/web/assets/recententries/dist'),
	('fff7d6d9','@app/web/assets/pluginstore/dist');

/*!40000 ALTER TABLE `craft_resourcepaths` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_searchindex
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_searchindex`;

CREATE TABLE `craft_searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `craft_searchindex_keywords_idx` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `craft_searchindex` WRITE;
/*!40000 ALTER TABLE `craft_searchindex` DISABLE KEYS */;

INSERT INTO `craft_searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`)
VALUES
	(1,'username',0,1,' skyrocket '),
	(1,'firstname',0,1,''),
	(1,'lastname',0,1,''),
	(1,'fullname',0,1,''),
	(1,'email',0,1,' dev skyrocket is '),
	(1,'slug',0,1,''),
	(2,'slug',0,1,' home '),
	(2,'title',0,1,' home '),
	(2,'field',1,1,' alterna haircare '),
	(3,'slug',0,1,''),
	(3,'field',4,1,' function w d s l i w l =w l w l push gtm start new date gettime event gtm js var f=d getelementsbytagname s 0 j=d createelement s dl=l = datalayer l= l j async=true j src= https www googletagmanager com gtm js id= i dl f parentnode insertbefore j f window document script datalayer gtm kwhnh9x '),
	(3,'field',2,1,''),
	(3,'field',3,1,''),
	(4,'slug',0,1,' 2018 '),
	(4,'title',0,1,' 2011 '),
	(6,'filename',0,1,' test anchor image png '),
	(6,'extension',0,1,' png '),
	(6,'kind',0,1,' image '),
	(6,'slug',0,1,''),
	(6,'title',0,1,' test anchor image '),
	(7,'slug',0,1,' 2011 component a header '),
	(7,'title',0,1,' 2011 component a header '),
	(7,'field',6,1,' fast bamboo growth '),
	(7,'field',11,1,' 2011 bamboo_bg '),
	(7,'field',17,1,' 2011 bamboo_twothirds '),
	(7,'field',7,1,' 2011 bamboo_anchor '),
	(8,'filename',0,1,' test bg 2 png '),
	(8,'extension',0,1,' png '),
	(8,'kind',0,1,' image '),
	(8,'slug',0,1,''),
	(8,'title',0,1,' test bg 2 '),
	(9,'filename',0,1,' test brushstroke png '),
	(9,'extension',0,1,' png '),
	(9,'kind',0,1,' image '),
	(9,'slug',0,1,''),
	(9,'title',0,1,' test brushstroke '),
	(10,'slug',0,1,' 2011 component b detail '),
	(10,'title',0,1,' 2011 component b detail '),
	(10,'field',6,1,' fast bamboo growth '),
	(10,'field',8,1,' lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat '),
	(10,'field',9,1,''),
	(10,'field',10,1,' lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat '),
	(10,'field',11,1,' 2011 bamboo_bg '),
	(10,'field',7,1,' 2011 bamboo_anchor '),
	(10,'field',12,1,' 2011 bamboo_parallax_x '),
	(11,'filename',0,1,' test collections 1 png '),
	(11,'extension',0,1,' png '),
	(11,'kind',0,1,' image '),
	(11,'slug',0,1,''),
	(11,'title',0,1,' test collections 1 '),
	(12,'filename',0,1,' test collections 2 png '),
	(12,'extension',0,1,' png '),
	(12,'kind',0,1,' image '),
	(12,'slug',0,1,''),
	(12,'title',0,1,' test collections 2 '),
	(13,'filename',0,1,' test collections 3 png '),
	(13,'extension',0,1,' png '),
	(13,'kind',0,1,' image '),
	(13,'slug',0,1,''),
	(13,'title',0,1,' test collections 3 '),
	(14,'slug',0,1,' 2011 component b slideshow '),
	(14,'title',0,1,' 2011 component b slideshow '),
	(14,'field',6,1,' alterna brand launches '),
	(14,'field',13,1,' collection '),
	(14,'field',14,1,' since inception alterna has provided high performance products inspired by test collections 1 lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod test collections 2 since inception alterna has provided high performance products inspired test collections 3 lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod test collections 1 '),
	(15,'slug',0,1,''),
	(15,'field',16,1,' test collections 1 '),
	(15,'field',15,1,' since inception alterna has provided high performance products inspired by '),
	(16,'slug',0,1,''),
	(16,'field',16,1,' test collections 2 '),
	(16,'field',15,1,' lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod '),
	(17,'slug',0,1,''),
	(17,'field',16,1,' test collections 3 '),
	(17,'field',15,1,' since inception alterna has provided high performance products inspired '),
	(18,'slug',0,1,''),
	(18,'field',16,1,' test collections 1 '),
	(18,'field',15,1,' lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod '),
	(19,'filename',0,1,' test video banner png '),
	(19,'extension',0,1,' png '),
	(19,'kind',0,1,' image '),
	(19,'slug',0,1,''),
	(19,'title',0,1,' test video banner '),
	(20,'slug',0,1,' 2011 component b video '),
	(20,'title',0,1,' 2011 component b video '),
	(20,'field',6,1,' alterna brand launches '),
	(20,'field',7,1,' test video banner '),
	(20,'field',12,1,' test brushstroke '),
	(21,'slug',0,1,' 2018 '),
	(21,'title',0,1,' 2018 '),
	(22,'slug',0,1,' 2018 component a header '),
	(22,'title',0,1,' 2018 component a header '),
	(22,'field',6,1,' caviar anti aging restage '),
	(22,'field',11,1,' 2018 header background '),
	(22,'field',17,1,' test vh image '),
	(22,'field',7,1,' homepage_alterna caviar brand video '),
	(23,'slug',0,1,' 2018 component a header '),
	(23,'title',0,1,' 2018 component b detail '),
	(23,'field',6,1,' caviar anti aging restage '),
	(23,'field',8,1,' the most exclusive product demands a sophisticated packaging update to reflect its balanced nature old formula new styles '),
	(95,'title',0,1,' 2013 '),
	(96,'field',6,1,' bamboo on the beach '),
	(23,'field',9,1,''),
	(95,'slug',0,1,' 2013 '),
	(23,'field',10,1,' celebrating nearly 20 years of caviar success alterna relaunched the collection with a new look and consistent color palette across all products in addition the company introduced a new caviar anti aging restructuring bond repair product line aimed at helping to reverse the hair damage from heat styling free radicals and excessive coloring '),
	(23,'field',11,1,' 2018 b background '),
	(23,'field',7,1,' bond repair_masque_5 7oz_030118 '),
	(23,'field',12,1,' 2018 b right '),
	(24,'filename',0,1,' test vh image png '),
	(24,'extension',0,1,' png '),
	(24,'kind',0,1,' image '),
	(24,'slug',0,1,''),
	(24,'title',0,1,' test vh image '),
	(25,'slug',0,1,' privacy policy '),
	(25,'title',0,1,' privacy policy '),
	(25,'field',18,1,''),
	(26,'slug',0,1,' 2019 '),
	(26,'title',0,1,' 2019 '),
	(27,'slug',0,1,' 2019 component a header '),
	(27,'title',0,1,' 2019 component a header '),
	(27,'field',6,1,' alterna brand launches '),
	(27,'field',11,1,' test bg 2 '),
	(27,'field',17,1,' 2010 bamboo_twothirds '),
	(27,'field',7,1,' small '),
	(28,'filename',0,1,' logo jpeg '),
	(28,'extension',0,1,' jpeg '),
	(28,'kind',0,1,' image '),
	(28,'slug',0,1,''),
	(28,'title',0,1,' logo '),
	(29,'filename',0,1,' 1997_newgen_twothirds png '),
	(29,'extension',0,1,' png '),
	(29,'kind',0,1,' image '),
	(29,'slug',0,1,''),
	(29,'title',0,1,' 1997_newgen_twothirds '),
	(30,'filename',0,1,' 1997 newgen_bg png '),
	(30,'extension',0,1,' png '),
	(30,'kind',0,1,' image '),
	(30,'slug',0,1,''),
	(30,'title',0,1,' 1997 newgen_bg '),
	(31,'filename',0,1,' 1997 newgen_parallax png '),
	(31,'extension',0,1,' png '),
	(31,'kind',0,1,' image '),
	(31,'slug',0,1,''),
	(31,'title',0,1,' 1997 newgen_parallax '),
	(32,'filename',0,1,' 1999 antiaging_anchor png '),
	(32,'extension',0,1,' png '),
	(32,'kind',0,1,' image '),
	(32,'slug',0,1,''),
	(32,'title',0,1,' 1999 antiaging_anchor '),
	(33,'filename',0,1,' 1999 antiaging_bg png '),
	(33,'extension',0,1,' png '),
	(33,'kind',0,1,' image '),
	(33,'slug',0,1,''),
	(33,'title',0,1,' 1999 antiaging_bg '),
	(34,'filename',0,1,' 1999 antiaging_bg2 png '),
	(34,'extension',0,1,' png '),
	(34,'kind',0,1,' image '),
	(34,'slug',0,1,''),
	(34,'title',0,1,' 1999 antiaging_bg2 '),
	(35,'filename',0,1,' 1999 antiaging_parallax png '),
	(35,'extension',0,1,' png '),
	(35,'kind',0,1,' image '),
	(35,'slug',0,1,''),
	(35,'title',0,1,' 1999 antiaging_parallax '),
	(36,'filename',0,1,' 1999 antiaging_parallax2 png '),
	(36,'extension',0,1,' png '),
	(36,'kind',0,1,' image '),
	(36,'slug',0,1,''),
	(36,'title',0,1,' 1999 antiaging_parallax2 '),
	(37,'filename',0,1,' 1999 antiaging_twothirds x png '),
	(37,'extension',0,1,' png '),
	(37,'kind',0,1,' image '),
	(37,'slug',0,1,''),
	(37,'title',0,1,' 1999 antiaging_twothirds x '),
	(38,'filename',0,1,' 1999 antiaging_video png '),
	(38,'extension',0,1,' png '),
	(38,'kind',0,1,' image '),
	(38,'slug',0,1,''),
	(38,'title',0,1,' 1999 antiaging_video '),
	(39,'filename',0,1,' 1999 lifeline_anchor png '),
	(39,'extension',0,1,' png '),
	(39,'kind',0,1,' image '),
	(39,'slug',0,1,''),
	(39,'title',0,1,' 1999 lifeline_anchor '),
	(40,'filename',0,1,' 1999 lifeline_bg png '),
	(40,'extension',0,1,' png '),
	(40,'kind',0,1,' image '),
	(40,'slug',0,1,''),
	(40,'title',0,1,' 1999 lifeline_bg '),
	(41,'filename',0,1,' 1999 lifeline_bg2 png '),
	(41,'extension',0,1,' png '),
	(41,'kind',0,1,' image '),
	(41,'slug',0,1,''),
	(41,'title',0,1,' 1999 lifeline_bg2 '),
	(42,'filename',0,1,' 1999 lifeline_parallax png '),
	(42,'extension',0,1,' png '),
	(42,'kind',0,1,' image '),
	(42,'slug',0,1,''),
	(42,'title',0,1,' 1999 lifeline_parallax '),
	(43,'filename',0,1,' 1999 lifeline_slide1 png '),
	(43,'extension',0,1,' png '),
	(43,'kind',0,1,' image '),
	(43,'slug',0,1,''),
	(43,'title',0,1,' 1999 lifeline_slide1 '),
	(44,'filename',0,1,' 1999 lifeline_slide2 png '),
	(44,'extension',0,1,' png '),
	(44,'kind',0,1,' image '),
	(44,'slug',0,1,''),
	(44,'title',0,1,' 1999 lifeline_slide2 '),
	(45,'filename',0,1,' 1999 lifeline_slide3 png '),
	(45,'extension',0,1,' png '),
	(45,'kind',0,1,' image '),
	(45,'slug',0,1,''),
	(45,'title',0,1,' 1999 lifeline_slide3 '),
	(46,'filename',0,1,' 1999 lifeline_twothirds png '),
	(46,'extension',0,1,' png '),
	(46,'kind',0,1,' image '),
	(46,'slug',0,1,''),
	(46,'title',0,1,' 1999 lifeline_twothirds '),
	(47,'filename',0,1,' 2005 caviar_anchor png '),
	(47,'extension',0,1,' png '),
	(47,'kind',0,1,' image '),
	(47,'slug',0,1,''),
	(47,'title',0,1,' 2005 caviar_anchor '),
	(48,'filename',0,1,' 2005 caviar_bg png '),
	(48,'extension',0,1,' png '),
	(48,'kind',0,1,' image '),
	(48,'slug',0,1,''),
	(48,'title',0,1,' 2005 caviar_bg '),
	(49,'filename',0,1,' 2005 caviar_parallax png '),
	(49,'extension',0,1,' png '),
	(49,'kind',0,1,' image '),
	(49,'slug',0,1,''),
	(49,'title',0,1,' 2005 caviar_parallax '),
	(50,'filename',0,1,' 2005 caviar_twothirds png '),
	(50,'extension',0,1,' png '),
	(50,'kind',0,1,' image '),
	(50,'slug',0,1,''),
	(50,'title',0,1,' 2005 caviar_twothirds '),
	(51,'filename',0,1,' 2005 truffle_anchor png '),
	(51,'extension',0,1,' png '),
	(51,'kind',0,1,' image '),
	(51,'slug',0,1,''),
	(51,'title',0,1,' 2005 truffle_anchor '),
	(52,'filename',0,1,' 2005 truffle_bg png '),
	(52,'extension',0,1,' png '),
	(52,'kind',0,1,' image '),
	(52,'slug',0,1,''),
	(52,'title',0,1,' 2005 truffle_bg '),
	(53,'filename',0,1,' 2005 truffle_parallax png '),
	(53,'extension',0,1,' png '),
	(53,'kind',0,1,' image '),
	(53,'slug',0,1,''),
	(53,'title',0,1,' 2005 truffle_parallax '),
	(54,'filename',0,1,' 2005 truffle_twothirds png '),
	(54,'extension',0,1,' png '),
	(54,'kind',0,1,' image '),
	(54,'slug',0,1,''),
	(54,'title',0,1,' 2005 truffle_twothirds '),
	(55,'filename',0,1,' 2007 ten_anchor png '),
	(55,'extension',0,1,' png '),
	(55,'kind',0,1,' image '),
	(55,'slug',0,1,''),
	(55,'title',0,1,' 2007 ten_anchor '),
	(56,'filename',0,1,' 2007 ten_bg png '),
	(56,'extension',0,1,' png '),
	(56,'kind',0,1,' image '),
	(56,'slug',0,1,''),
	(56,'title',0,1,' 2007 ten_bg '),
	(57,'filename',0,1,' 2007 ten_parallax png '),
	(57,'extension',0,1,' png '),
	(57,'kind',0,1,' image '),
	(57,'slug',0,1,''),
	(57,'title',0,1,' 2007 ten_parallax '),
	(58,'filename',0,1,' 2007 ten_twothirds png '),
	(58,'extension',0,1,' png '),
	(58,'kind',0,1,' image '),
	(58,'slug',0,1,''),
	(58,'title',0,1,' 2007 ten_twothirds '),
	(59,'filename',0,1,' 2008 hemp_anchor png '),
	(59,'extension',0,1,' png '),
	(59,'kind',0,1,' image '),
	(59,'slug',0,1,''),
	(59,'title',0,1,' 2008 hemp_anchor '),
	(60,'filename',0,1,' 2008 hemp_bg png '),
	(60,'extension',0,1,' png '),
	(60,'kind',0,1,' image '),
	(60,'slug',0,1,''),
	(60,'title',0,1,' 2008 hemp_bg '),
	(61,'filename',0,1,' 2008 hemp_parallax png '),
	(61,'extension',0,1,' png '),
	(61,'kind',0,1,' image '),
	(61,'slug',0,1,''),
	(61,'title',0,1,' 2008 hemp_parallax '),
	(62,'filename',0,1,' 2008 hemp_twothirds png '),
	(62,'extension',0,1,' png '),
	(62,'kind',0,1,' image '),
	(62,'slug',0,1,''),
	(62,'title',0,1,' 2008 hemp_twothirds '),
	(63,'filename',0,1,' 2008 life_anchor png '),
	(63,'extension',0,1,' png '),
	(63,'kind',0,1,' image '),
	(63,'slug',0,1,''),
	(63,'title',0,1,' 2008 life_anchor '),
	(64,'filename',0,1,' 2008 life_bg png '),
	(64,'extension',0,1,' png '),
	(64,'kind',0,1,' image '),
	(64,'slug',0,1,''),
	(64,'title',0,1,' 2008 life_bg '),
	(65,'filename',0,1,' 2008 life_parallax png '),
	(65,'extension',0,1,' png '),
	(65,'kind',0,1,' image '),
	(65,'slug',0,1,''),
	(65,'title',0,1,' 2008 life_parallax '),
	(66,'filename',0,1,' 2008 life_twothirds png '),
	(66,'extension',0,1,' png '),
	(66,'kind',0,1,' image '),
	(66,'slug',0,1,''),
	(66,'title',0,1,' 2008 life_twothirds '),
	(67,'filename',0,1,' 2008 seasilk_anchor png '),
	(67,'extension',0,1,' png '),
	(67,'kind',0,1,' image '),
	(67,'slug',0,1,''),
	(67,'title',0,1,' 2008 seasilk_anchor '),
	(68,'filename',0,1,' 2008 seasilk_bg png '),
	(68,'extension',0,1,' png '),
	(68,'kind',0,1,' image '),
	(68,'slug',0,1,''),
	(68,'title',0,1,' 2008 seasilk_bg '),
	(69,'filename',0,1,' 2008 seasilk_parallax png '),
	(69,'extension',0,1,' png '),
	(69,'kind',0,1,' image '),
	(69,'slug',0,1,''),
	(69,'title',0,1,' 2008 seasilk_parallax '),
	(70,'filename',0,1,' 2008 seasilk_twothirds png '),
	(70,'extension',0,1,' png '),
	(70,'kind',0,1,' image '),
	(70,'slug',0,1,''),
	(70,'title',0,1,' 2008 seasilk_twothirds '),
	(71,'filename',0,1,' 2010 bamboo_anchor png '),
	(71,'extension',0,1,' png '),
	(71,'kind',0,1,' image '),
	(71,'slug',0,1,''),
	(71,'title',0,1,' 2010 bamboo_anchor '),
	(72,'filename',0,1,' 2010 bamboo_bg png '),
	(72,'extension',0,1,' png '),
	(72,'kind',0,1,' image '),
	(72,'slug',0,1,''),
	(72,'title',0,1,' 2010 bamboo_bg '),
	(73,'filename',0,1,' 2010 bamboo_parallax png '),
	(73,'extension',0,1,' png '),
	(73,'kind',0,1,' image '),
	(73,'slug',0,1,''),
	(73,'title',0,1,' 2010 bamboo_parallax '),
	(74,'filename',0,1,' 2010 bamboo_twothirds png '),
	(74,'extension',0,1,' png '),
	(74,'kind',0,1,' image '),
	(74,'slug',0,1,''),
	(74,'title',0,1,' 2010 bamboo_twothirds '),
	(75,'filename',0,1,' 2011 bamboo_anchor png '),
	(75,'extension',0,1,' png '),
	(75,'kind',0,1,' image '),
	(75,'slug',0,1,''),
	(75,'title',0,1,' 2011 bamboo_anchor '),
	(76,'filename',0,1,' 2011 bamboo_bg png '),
	(76,'extension',0,1,' png '),
	(76,'kind',0,1,' image '),
	(76,'slug',0,1,''),
	(76,'title',0,1,' 2011 bamboo_bg '),
	(77,'filename',0,1,' 2011 bamboo_parallax_x png '),
	(77,'extension',0,1,' png '),
	(77,'kind',0,1,' image '),
	(77,'slug',0,1,''),
	(77,'title',0,1,' 2011 bamboo_parallax_x '),
	(78,'filename',0,1,' 2011 bamboo_twothirds png '),
	(78,'extension',0,1,' png '),
	(78,'kind',0,1,' image '),
	(78,'slug',0,1,''),
	(78,'title',0,1,' 2011 bamboo_twothirds '),
	(79,'filename',0,1,' 2012 bamboo_anchor png '),
	(79,'extension',0,1,' png '),
	(79,'kind',0,1,' image '),
	(79,'slug',0,1,''),
	(79,'title',0,1,' 2012 bamboo_anchor '),
	(80,'filename',0,1,' 2012 bamboo_bg png '),
	(80,'extension',0,1,' png '),
	(80,'kind',0,1,' image '),
	(80,'slug',0,1,''),
	(80,'title',0,1,' 2012 bamboo_bg '),
	(81,'filename',0,1,' 2012 bamboo_parallax png '),
	(81,'extension',0,1,' png '),
	(81,'kind',0,1,' image '),
	(81,'slug',0,1,''),
	(81,'title',0,1,' 2012 bamboo_parallax '),
	(82,'filename',0,1,' 2012 bamboo_twothirds png '),
	(82,'extension',0,1,' png '),
	(82,'kind',0,1,' image '),
	(82,'slug',0,1,''),
	(82,'title',0,1,' 2012 bamboo_twothirds '),
	(83,'filename',0,1,' 2013 bamboo_anchor png '),
	(83,'extension',0,1,' png '),
	(83,'kind',0,1,' image '),
	(83,'slug',0,1,''),
	(83,'title',0,1,' 2013 bamboo_anchor '),
	(84,'filename',0,1,' 2013 bamboo_bg png '),
	(84,'extension',0,1,' png '),
	(84,'kind',0,1,' image '),
	(84,'slug',0,1,''),
	(84,'title',0,1,' 2013 bamboo_bg '),
	(85,'filename',0,1,' 2013 bamboo_parallax png '),
	(85,'extension',0,1,' png '),
	(85,'kind',0,1,' image '),
	(85,'slug',0,1,''),
	(85,'title',0,1,' 2013 bamboo_parallax '),
	(86,'filename',0,1,' 2013 bamboo_twothirds png '),
	(86,'extension',0,1,' png '),
	(86,'kind',0,1,' image '),
	(86,'slug',0,1,''),
	(86,'title',0,1,' 2013 bamboo_twothirds '),
	(87,'filename',0,1,' 2018 caviar_anchor png '),
	(87,'extension',0,1,' png '),
	(87,'kind',0,1,' image '),
	(87,'slug',0,1,''),
	(87,'title',0,1,' 2018 caviar_anchor '),
	(88,'filename',0,1,' 2018 caviar_bg png '),
	(88,'extension',0,1,' png '),
	(88,'kind',0,1,' image '),
	(88,'slug',0,1,''),
	(88,'title',0,1,' 2018 caviar_bg '),
	(89,'filename',0,1,' 2018 caviar_bg2 png '),
	(89,'extension',0,1,' png '),
	(89,'kind',0,1,' image '),
	(89,'slug',0,1,''),
	(89,'title',0,1,' 2018 caviar_bg2 '),
	(90,'filename',0,1,' 2018 caviar_parallax png '),
	(90,'extension',0,1,' png '),
	(90,'kind',0,1,' image '),
	(90,'slug',0,1,''),
	(90,'title',0,1,' 2018 caviar_parallax '),
	(91,'filename',0,1,' 2018 caviar_slide1 png '),
	(91,'extension',0,1,' png '),
	(91,'kind',0,1,' image '),
	(91,'slug',0,1,''),
	(91,'title',0,1,' 2018 caviar_slide1 '),
	(92,'filename',0,1,' 2018 caviar_slide2 png '),
	(92,'extension',0,1,' png '),
	(92,'kind',0,1,' image '),
	(92,'slug',0,1,''),
	(92,'title',0,1,' 2018 caviar_slide2 '),
	(93,'filename',0,1,' 2018 caviar_slide3 png '),
	(93,'extension',0,1,' png '),
	(93,'kind',0,1,' image '),
	(93,'slug',0,1,''),
	(93,'title',0,1,' 2018 caviar_slide3 '),
	(94,'filename',0,1,' 2018 caviar_twothirds png '),
	(94,'extension',0,1,' png '),
	(94,'kind',0,1,' image '),
	(94,'slug',0,1,''),
	(94,'title',0,1,' 2018 caviar_twothirds '),
	(96,'field',11,1,' 2013 bamboo_bg '),
	(96,'field',17,1,' 2013 bamboo_twothirds '),
	(96,'field',7,1,' 2013 bamboo_anchor '),
	(96,'slug',0,1,' 2013 component a header '),
	(96,'title',0,1,' 2013 component a header '),
	(97,'field',6,1,' bamboo on the beach '),
	(97,'field',8,1,' lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat '),
	(97,'field',9,1,''),
	(97,'field',10,1,' lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat '),
	(97,'field',11,1,' 2013 bamboo_bg '),
	(97,'field',7,1,' 2013 bamboo_anchor '),
	(97,'field',12,1,' 2013 bamboo_parallax '),
	(97,'slug',0,1,' 2013 component b detail '),
	(97,'title',0,1,' 2013 component b detail '),
	(98,'slug',0,1,' 2012 '),
	(98,'title',0,1,' 2012 '),
	(99,'field',6,1,' new bamboo in style '),
	(99,'field',11,1,' 2012 bamboo_bg '),
	(99,'field',17,1,' 2012 bamboo_twothirds '),
	(99,'field',7,1,' 2012 bamboo_anchor '),
	(99,'slug',0,1,' 2012 component a header '),
	(99,'title',0,1,' 2012 component a header '),
	(100,'field',6,1,' new bamboo in style '),
	(100,'field',8,1,' lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat '),
	(100,'field',9,1,''),
	(100,'field',10,1,' lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat '),
	(100,'field',11,1,' 2012 bamboo_bg '),
	(100,'field',7,1,' 2012 bamboo_anchor '),
	(100,'field',12,1,' 2012 bamboo_parallax '),
	(100,'slug',0,1,' 2012 component b detail '),
	(100,'title',0,1,' 2012 component b detail '),
	(101,'slug',0,1,' 2010 '),
	(101,'title',0,1,' 2010 '),
	(102,'field',6,1,' the bamboo strength '),
	(102,'field',11,1,' 2010 bamboo_bg '),
	(102,'field',17,1,' 2010 bamboo_twothirds '),
	(102,'field',7,1,' 2010 bamboo_anchor '),
	(102,'slug',0,1,' 2010 component a header '),
	(102,'title',0,1,' 2010 component a header '),
	(103,'field',6,1,' the bamboo strength '),
	(103,'field',8,1,' infuse your hair with the power of one of the world s fastest growing and most resilient natural ingredients '),
	(103,'field',9,1,''),
	(103,'field',10,1,' dedicated to boosting your hair s intrinsic strength and flexibility the bamboo collection was sustainably sourced and harvested globally from india peru indonesia and namibia it provided even the most premium consumer segments with unique nourishing and energizing extracts that were simply not available on the market at the time '),
	(103,'field',11,1,' 2010 bamboo_bg '),
	(103,'field',7,1,' 2010 bamboo_anchor '),
	(103,'field',12,1,' 2010 bamboo_parallax '),
	(103,'slug',0,1,' 2010 component b detail '),
	(103,'title',0,1,' 2010 component b detail '),
	(104,'slug',0,1,' 2008 '),
	(104,'title',0,1,' 2008 '),
	(105,'field',6,1,' seasilk soft seasilk smooth '),
	(105,'field',11,1,' 2008 seasilk_bg '),
	(105,'field',17,1,' 2008 seasilk_twothirds '),
	(105,'field',7,1,' 2008 seasilk_anchor '),
	(105,'slug',0,1,' 2008 component a header seasilk '),
	(105,'title',0,1,' 2008 component a header seasilk '),
	(106,'field',6,1,' seasilk soft seasilk smooth '),
	(106,'field',8,1,' lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat '),
	(106,'field',9,1,''),
	(106,'field',10,1,' lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat '),
	(106,'field',11,1,' 2008 seasilk_bg '),
	(106,'field',7,1,' 2008 seasilk_anchor '),
	(106,'field',12,1,' 2008 seasilk_parallax '),
	(106,'slug',0,1,' 2008 component b detail seasilk '),
	(106,'title',0,1,' 2008 component b detail seasilk '),
	(107,'field',6,1,' highly hydrating hemp '),
	(107,'field',11,1,' 2008 hemp_bg '),
	(107,'field',17,1,' 2008 hemp_twothirds '),
	(107,'field',7,1,' 2008 hemp_anchor '),
	(107,'slug',0,1,' 2008 component a header hemp '),
	(107,'title',0,1,' 2008 component a header hemp '),
	(108,'field',6,1,' highly hydrating hemp '),
	(108,'field',8,1,' lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat '),
	(108,'field',9,1,''),
	(108,'field',10,1,' lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat '),
	(108,'field',11,1,' 2008 hemp_bg '),
	(108,'field',7,1,' 2008 hemp_anchor '),
	(108,'field',12,1,' 2008 hemp_parallax '),
	(108,'slug',0,1,' 2008 component b detail hemp '),
	(108,'title',0,1,' 2008 component b detail hemp '),
	(109,'field',6,1,' once in a life extension '),
	(109,'field',11,1,' 2008 life_bg '),
	(109,'field',17,1,' 2008 life_twothirds '),
	(109,'field',7,1,' 2008 life_anchor '),
	(109,'slug',0,1,' 2008 component a header life ext '),
	(109,'title',0,1,' 2008 component a header life ext '),
	(110,'field',6,1,' once in a life extension '),
	(110,'field',8,1,' lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat '),
	(110,'field',9,1,''),
	(110,'field',10,1,' lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat '),
	(110,'field',11,1,' 2008 life_bg '),
	(110,'field',7,1,' 2008 life_anchor '),
	(110,'field',12,1,' 2008 life_parallax '),
	(110,'slug',0,1,' 2008 component b detail life ext '),
	(110,'title',0,1,' 2008 component b detail life ext '),
	(111,'slug',0,1,' 2007 '),
	(111,'title',0,1,' 2007 '),
	(112,'field',6,1,' ten out of ten '),
	(112,'field',11,1,' 2007 ten_bg '),
	(112,'field',17,1,' 2007 ten_twothirds '),
	(112,'field',7,1,' 2007 ten_anchor '),
	(112,'slug',0,1,' 2007 component a header '),
	(112,'title',0,1,' 2007 component a header '),
	(113,'field',6,1,' ten out of ten '),
	(113,'field',8,1,' lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat '),
	(113,'field',9,1,''),
	(113,'field',10,1,' lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat '),
	(113,'field',11,1,' 2007 ten_bg '),
	(113,'field',7,1,' 2007 ten_anchor '),
	(113,'field',12,1,' 2007 ten_parallax '),
	(113,'slug',0,1,' 2007 component b detail '),
	(113,'title',0,1,' 2007 component b detail '),
	(114,'slug',0,1,' 2005 '),
	(114,'title',0,1,' 2005 '),
	(115,'field',6,1,' white truffle extravagance '),
	(115,'field',11,1,' 2005 truffle_bg '),
	(115,'field',17,1,' 2005 truffle_twothirds '),
	(115,'field',7,1,' 2005 truffle_anchor '),
	(115,'slug',0,1,' 2005 component a header truffle '),
	(115,'title',0,1,' 2005 component a header truffle '),
	(116,'field',6,1,' white truffle extravagance '),
	(116,'field',8,1,' lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat '),
	(116,'field',9,1,''),
	(116,'field',10,1,' lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat '),
	(116,'field',11,1,' 2005 truffle_bg '),
	(116,'field',7,1,' 2005 truffle_anchor '),
	(116,'field',12,1,' 2005 truffle_parallax '),
	(116,'slug',0,1,' 2005 component b detail truffle '),
	(116,'title',0,1,' 2005 component b detail truffle '),
	(117,'field',6,1,' caviar enzymes against aging '),
	(117,'field',11,1,' 2005 caviar_bg '),
	(117,'field',17,1,' 2005 caviar_twothirds '),
	(117,'field',7,1,' 2005 caviar_anchor '),
	(117,'slug',0,1,' 2005 component a header caviar '),
	(117,'title',0,1,' 2005 component a header caviar '),
	(118,'field',6,1,' caviar enzymes against aging '),
	(118,'field',8,1,' ultimately responsible for processing all incoming nutrients enzyme levels decrease with age requiring high precision treatment '),
	(118,'field',9,1,''),
	(118,'field',10,1,' caviar with age control complex was a unique system of products targeted at restoring both vibrancy and elasticity of the hair and skin using caviar enzymes cytokines and vitamin c the complex prevented external as well as oxidative damage stimulated protein production and encouraged rapid regeneration at the cellular level '),
	(118,'field',11,1,' 2005 caviar_bg '),
	(118,'field',7,1,' 2005 caviar_anchor '),
	(118,'field',12,1,' 2005 caviar_parallax '),
	(118,'slug',0,1,' 2005 component b detail caviar '),
	(118,'title',0,1,' 2005 component b detail caviar '),
	(119,'slug',0,1,' 1999 '),
	(119,'title',0,1,' 1999 '),
	(120,'field',6,1,' anti aging caviar collection '),
	(120,'field',11,1,' 1999 antiaging_bg '),
	(120,'field',17,1,' 1999 antiaging_twothirds x '),
	(120,'field',7,1,' 1999 antiaging_anchor '),
	(120,'slug',0,1,' 1999 component a header antiaging '),
	(120,'title',0,1,' 1999 component a header antiaging '),
	(121,'field',6,1,' anti aging caviar collection '),
	(121,'field',8,1,' when you browse the world in search of the most effective natural anti aging ingredient in the end you find caviar '),
	(121,'field',9,1,''),
	(121,'field',10,1,' in less than two years since the launch of its inaugural collection alterna presented its first breakthrough line of products with anti aging properties developed based on caviar full of omega 3 fatty acids it helped to replenish the hair s lipid layer for better moisture retention and elasticity and resulted in healthy natural smoothness and shine '),
	(121,'field',11,1,' 1999 antiaging_bg '),
	(121,'field',7,1,' 1999 antiaging_anchor '),
	(121,'field',12,1,' 1999 antiaging_parallax '),
	(121,'slug',0,1,' 1999 component b detail caviar '),
	(121,'title',0,1,' 1999 component b detail caviar '),
	(122,'field',6,1,' anti aging caviar collection '),
	(122,'field',7,1,' small '),
	(122,'field',12,1,' 1999 antiaging_parallax2 '),
	(122,'slug',0,1,' 1999 component b video caviar '),
	(122,'title',0,1,' 1999 component b video caviar '),
	(123,'field',6,1,' bring in the life line '),
	(123,'field',11,1,' 1999 lifeline_bg '),
	(123,'field',17,1,' 1999 lifeline_twothirds '),
	(123,'field',7,1,' 1999 lifeline_anchor '),
	(123,'slug',0,1,' 1999 component a header lifeline '),
	(123,'title',0,1,' 1999 component a header lifeline '),
	(124,'field',6,1,' bring in the life line '),
	(124,'field',8,1,' real beauty on the outside requires beauty on the inside like yin and yang western technology combined with eastern medicinal wisdom '),
	(124,'field',9,1,''),
	(124,'field',10,1,' alterna life collection took a unique approach to beauty by first encouraging relaxation and peaceful state of mind through soothing colors and exotic scents and then making use of the latest advances in technology to work on volume restoration straightening and curling life brought the body and mind into complete balance '),
	(124,'field',11,1,' 1999 lifeline_bg '),
	(124,'field',7,1,' 1999 lifeline_anchor '),
	(124,'field',12,1,' 1999 lifeline_parallax '),
	(124,'slug',0,1,' 1999 component b detail lifeline '),
	(124,'title',0,1,' 1999 component b detail lifeline '),
	(125,'field',6,1,' bring in the life line '),
	(125,'field',13,1,' collection '),
	(125,'field',14,1,' alterna life restore 1999 lifeline_slide1 alterna enzymetherapy life curls 1999 lifeline_slide2 alterna enzymetherapy life volumizing spray mousse 1999 lifeline_slide3 '),
	(126,'field',16,1,' 1999 lifeline_slide1 '),
	(126,'field',15,1,' alterna life restore '),
	(126,'slug',0,1,''),
	(127,'field',16,1,' 1999 lifeline_slide2 '),
	(127,'field',15,1,' alterna enzymetherapy life curls '),
	(127,'slug',0,1,''),
	(128,'field',16,1,' 1999 lifeline_slide3 '),
	(128,'field',15,1,' alterna enzymetherapy life volumizing spray mousse '),
	(128,'slug',0,1,''),
	(125,'slug',0,1,' 1999 component b slideshow lifeline '),
	(125,'title',0,1,' 1999 component b slideshow lifeline '),
	(129,'slug',0,1,' 1997 '),
	(129,'title',0,1,' 1997 '),
	(130,'field',6,1,' a new generation of hair care '),
	(130,'field',11,1,' 1997 newgen_bg '),
	(130,'field',17,1,' 1997_newgen_twothirds '),
	(130,'field',7,1,' 1999 lifeline_anchor '),
	(130,'slug',0,1,' 1997 component a header '),
	(130,'title',0,1,' 1997 component a header '),
	(131,'field',6,1,' a new generation of hair care '),
	(131,'field',8,1,' imagine a line of premium hair products free of additives and harsh ingredients resulting in an effective and healthy look '),
	(131,'field',9,1,''),
	(131,'field',10,1,' launched in 1997 alterna had a vision of creating a sustainable future through introducing a no compromise luxurious haircare collection all deszigned specifically for discerning industry professionals and based on the science of skincare incorporating new technological advancements only natural eco certified ingredients no sulfates or parabens no animal testing ever '),
	(131,'field',11,1,' 1997 newgen_bg '),
	(131,'field',7,1,' 1999 lifeline_anchor '),
	(131,'field',12,1,' 1997 newgen_parallax '),
	(131,'slug',0,1,' 1997 component b detail '),
	(131,'title',0,1,' 1997 component b detail '),
	(27,'field',12,1,''),
	(132,'field',6,1,' alterna brand launches '),
	(132,'field',13,1,' collection '),
	(132,'field',14,1,' lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod test collections 1 lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod test collections 2 lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod test collections 3 '),
	(133,'field',16,1,' test collections 1 '),
	(133,'field',15,1,' lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod '),
	(133,'slug',0,1,''),
	(134,'field',16,1,' test collections 2 '),
	(134,'field',15,1,' lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod '),
	(134,'slug',0,1,''),
	(135,'field',16,1,' test collections 3 '),
	(135,'field',15,1,' lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod '),
	(135,'slug',0,1,''),
	(132,'slug',0,1,' 2019 component b detail '),
	(132,'title',0,1,' 2019 component b detail '),
	(14,'field',11,1,''),
	(125,'field',11,1,''),
	(132,'field',11,1,''),
	(20,'field',8,1,''),
	(20,'field',11,1,''),
	(27,'field',8,1,' an alternative vision born in salons premium hair products free of additives or harsh ingredients and a revolution in haircare was born '),
	(122,'field',8,1,''),
	(122,'field',11,1,''),
	(145,'filename',0,1,' 2018 header background jpg '),
	(136,'filename',0,1,' 7df2a51137ec4b9c80ec4b082924bea7 jpg '),
	(136,'extension',0,1,' jpg '),
	(136,'kind',0,1,' image '),
	(136,'slug',0,1,''),
	(136,'title',0,1,' 7df2a51137ec4b9c80ec4b082924bea7 '),
	(137,'filename',0,1,' small mp4 '),
	(137,'extension',0,1,' mp4 '),
	(137,'kind',0,1,' video '),
	(137,'slug',0,1,''),
	(137,'title',0,1,' small '),
	(138,'field',6,1,' 2019 caviar '),
	(138,'field',13,1,' 2019 caviar '),
	(138,'field',11,1,' 1997 newgen_bg '),
	(138,'field',14,1,' 1999 lifeline_slide1 1999 lifeline_slide2 1999 lifeline_slide3 1999 lifeline_slide1 '),
	(139,'field',16,1,' 1999 lifeline_slide1 '),
	(139,'field',15,1,''),
	(139,'slug',0,1,''),
	(140,'field',16,1,' 1999 lifeline_slide2 '),
	(140,'field',15,1,''),
	(140,'slug',0,1,''),
	(141,'field',16,1,' 1999 lifeline_slide3 '),
	(141,'field',15,1,''),
	(141,'slug',0,1,''),
	(142,'field',16,1,' 1999 lifeline_slide1 '),
	(142,'field',15,1,''),
	(142,'slug',0,1,''),
	(138,'slug',0,1,' 2019 slideshow testing '),
	(138,'title',0,1,' 2019 slideshow testing '),
	(143,'field',19,1,' https www facebook com alternahaircare https www instagram com alternahaircare https www pinterest ca alternahaircare autologin=true https twitter com alternahaircare '),
	(143,'slug',0,1,''),
	(144,'field',20,1,' https www facebook com alternahaircare '),
	(144,'field',21,1,' https www instagram com alternahaircare '),
	(144,'field',22,1,' https twitter com alternahaircare '),
	(144,'field',23,1,' https www pinterest ca alternahaircare autologin=true '),
	(144,'slug',0,1,''),
	(145,'extension',0,1,' jpg '),
	(145,'kind',0,1,' image '),
	(145,'slug',0,1,''),
	(145,'title',0,1,' 2018 header background '),
	(146,'filename',0,1,' 2018 b jpg '),
	(146,'extension',0,1,' jpg '),
	(146,'kind',0,1,' image '),
	(146,'slug',0,1,''),
	(146,'title',0,1,' 2018 b '),
	(147,'filename',0,1,' 2018 b_190328_233005 jpg '),
	(147,'extension',0,1,' jpg '),
	(147,'kind',0,1,' image '),
	(147,'slug',0,1,''),
	(147,'title',0,1,' 2018 b '),
	(148,'filename',0,1,' 2018 b background jpg '),
	(148,'extension',0,1,' jpg '),
	(148,'kind',0,1,' image '),
	(148,'slug',0,1,''),
	(148,'title',0,1,' 2018 b background '),
	(149,'filename',0,1,' 2018 b right jpg '),
	(149,'extension',0,1,' jpg '),
	(149,'kind',0,1,' image '),
	(149,'slug',0,1,''),
	(149,'title',0,1,' 2018 b right '),
	(150,'filename',0,1,' 2018 b background_190328_234110 jpg '),
	(150,'extension',0,1,' jpg '),
	(150,'kind',0,1,' image '),
	(150,'slug',0,1,''),
	(150,'title',0,1,' 2018 b background '),
	(151,'slug',0,1,' 2018 component b slide '),
	(151,'title',0,1,' 2018 component b slide '),
	(152,'filename',0,1,' 2018 b background_190328_234537 jpg '),
	(152,'extension',0,1,' jpg '),
	(152,'kind',0,1,' image '),
	(152,'slug',0,1,''),
	(152,'title',0,1,' 2018 b background '),
	(153,'filename',0,1,' 2018 c background jpg '),
	(153,'extension',0,1,' jpg '),
	(153,'kind',0,1,' image '),
	(153,'slug',0,1,''),
	(153,'title',0,1,' 2018 c background '),
	(154,'filename',0,1,' bond 5 png '),
	(154,'extension',0,1,' png '),
	(154,'kind',0,1,' image '),
	(154,'slug',0,1,''),
	(154,'title',0,1,' bond 5 '),
	(151,'field',6,1,''),
	(151,'field',13,1,''),
	(151,'field',11,1,' 2018 c background '),
	(151,'field',14,1,' caviar anti aging restructuring bond collection bond group https alternacaviarantiaging com collections restructuring bond repair caviar anti aging replenishing moisture collection moisture family new https alternacaviarantiaging com collections replenishing moisture caviar anti frizz collection anti frizz family https alternacaviarantiaging com collections anti frizz caviar anti aging professional styling collection stylers https alternacaviarantiaging com collections style '),
	(155,'field',16,1,' bond group '),
	(155,'field',15,1,' caviar anti aging restructuring bond collection '),
	(155,'slug',0,1,''),
	(155,'field',24,1,' https alternacaviarantiaging com collections restructuring bond repair '),
	(156,'filename',0,1,' 2018 b background_190405_192055 jpg '),
	(156,'extension',0,1,' jpg '),
	(156,'kind',0,1,' image '),
	(156,'slug',0,1,''),
	(156,'title',0,1,' 2018 b background '),
	(157,'filename',0,1,' moisture_masque_2018 header b detail png '),
	(157,'extension',0,1,' png '),
	(157,'kind',0,1,' image '),
	(157,'slug',0,1,''),
	(157,'title',0,1,' moisture_masque_2018 header b detail '),
	(158,'filename',0,1,' bond repair_masque_5 7oz_030118 png '),
	(158,'extension',0,1,' png '),
	(158,'kind',0,1,' image '),
	(158,'slug',0,1,''),
	(158,'title',0,1,' bond repair_masque_5 7oz_030118 '),
	(159,'filename',0,1,' moisture family new png '),
	(159,'extension',0,1,' png '),
	(159,'kind',0,1,' image '),
	(159,'slug',0,1,''),
	(159,'title',0,1,' moisture family new '),
	(160,'field',16,1,' moisture family new '),
	(160,'field',15,1,' caviar anti aging replenishing moisture collection '),
	(160,'field',24,1,' https alternacaviarantiaging com collections replenishing moisture '),
	(160,'slug',0,1,''),
	(161,'filename',0,1,' antifrizz family png '),
	(161,'extension',0,1,' png '),
	(161,'kind',0,1,' image '),
	(161,'slug',0,1,''),
	(161,'title',0,1,' anti frizz family '),
	(162,'filename',0,1,' stylers png '),
	(162,'extension',0,1,' png '),
	(162,'kind',0,1,' image '),
	(162,'slug',0,1,''),
	(162,'title',0,1,' stylers '),
	(163,'field',16,1,' anti frizz family '),
	(163,'field',15,1,' caviar anti frizz collection '),
	(163,'field',24,1,' https alternacaviarantiaging com collections anti frizz '),
	(163,'slug',0,1,''),
	(164,'field',16,1,' stylers '),
	(164,'field',15,1,' caviar anti aging professional styling collection '),
	(164,'field',24,1,' https alternacaviarantiaging com collections style '),
	(164,'slug',0,1,''),
	(165,'filename',0,1,' bond group png '),
	(165,'extension',0,1,' png '),
	(165,'kind',0,1,' image '),
	(165,'slug',0,1,''),
	(165,'title',0,1,' bond group '),
	(166,'slug',0,1,' video test '),
	(166,'title',0,1,' 2018 video test '),
	(167,'filename',0,1,' homepage_alterna caviar brand video mp4 '),
	(167,'extension',0,1,' mp4 '),
	(167,'kind',0,1,' video '),
	(167,'slug',0,1,''),
	(167,'title',0,1,' homepage_alterna caviar brand video '),
	(166,'field',6,1,''),
	(166,'field',8,1,''),
	(166,'field',7,1,' homepage_alterna caviar brand video '),
	(166,'field',12,1,''),
	(166,'field',11,1,' homepage_alterna caviar brand video '),
	(166,'field',17,1,''),
	(15,'field',24,1,''),
	(16,'field',24,1,''),
	(17,'field',24,1,''),
	(18,'field',24,1,''),
	(126,'field',24,1,''),
	(127,'field',24,1,''),
	(128,'field',24,1,''),
	(133,'field',24,1,''),
	(134,'field',24,1,''),
	(135,'field',24,1,''),
	(139,'field',24,1,''),
	(140,'field',24,1,''),
	(141,'field',24,1,''),
	(142,'field',24,1,''),
	(168,'field',6,1,' alterna museum hompage '),
	(168,'field',11,1,' 2008 hemp_bg '),
	(168,'field',17,1,''),
	(168,'field',7,1,''),
	(168,'slug',0,1,' homepage '),
	(168,'title',0,1,' homepage '),
	(169,'field',25,1,' alterna museum '),
	(169,'field',26,1,' alterna haircare creates groundbreaking formulas that set the industry standard for the finest luxury haircare products in the world '),
	(169,'field',27,1,' test collections 2 '),
	(169,'slug',0,1,'');

/*!40000 ALTER TABLE `craft_searchindex` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_sections
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_sections`;

CREATE TABLE `craft_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagateEntries` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_sections_handle_idx` (`handle`),
  KEY `craft_sections_name_idx` (`name`),
  KEY `craft_sections_structureId_idx` (`structureId`),
  KEY `craft_sections_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `craft_sections_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_sections` WRITE;
/*!40000 ALTER TABLE `craft_sections` DISABLE KEYS */;

INSERT INTO `craft_sections` (`id`, `structureId`, `name`, `handle`, `type`, `enableVersioning`, `propagateEntries`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,NULL,'Home','home','single',1,1,'2019-03-06 23:09:34','2019-03-06 23:09:43',NULL,'0ea56ad0-526a-4896-9de7-0a83d562dc41'),
	(2,1,'Year','year','structure',1,1,'2019-03-06 23:37:20','2019-04-08 23:18:20',NULL,'62472a49-7594-475e-9ed0-485577bda6e6'),
	(3,NULL,'Privacy Policy','privacyPolicy','single',1,1,'2019-03-07 01:05:09','2019-03-07 01:05:22',NULL,'ba379e03-6bc0-4afc-8a5e-c91e5a6cb2ea');

/*!40000 ALTER TABLE `craft_sections` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_sections_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_sections_sites`;

CREATE TABLE `craft_sections_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_sections_sites_sectionId_siteId_unq_idx` (`sectionId`,`siteId`),
  KEY `craft_sections_sites_siteId_idx` (`siteId`),
  CONSTRAINT `craft_sections_sites_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_sections_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_sections_sites` WRITE;
/*!40000 ALTER TABLE `craft_sections_sites` DISABLE KEYS */;

INSERT INTO `craft_sections_sites` (`id`, `sectionId`, `siteId`, `hasUrls`, `uriFormat`, `template`, `enabledByDefault`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,1,1,'__home__','pages/homepage',1,'2019-03-06 23:09:34','2019-03-06 23:09:43','9038f8b6-5be2-41f4-81bb-580e075af319'),
	(2,2,1,0,NULL,NULL,1,'2019-03-06 23:37:20','2019-04-08 23:18:20','3359b609-7a5e-41d4-8111-63ea10546be4'),
	(3,3,1,1,'privacy-policy','pages/general',1,'2019-03-07 01:05:09','2019-03-07 01:05:22','d13de394-dd7f-4a62-b7fa-5b502af86439');

/*!40000 ALTER TABLE `craft_sections_sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_sequences
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_sequences`;

CREATE TABLE `craft_sequences` (
  `name` varchar(255) NOT NULL,
  `next` int(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table craft_sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_sessions`;

CREATE TABLE `craft_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_sessions_uid_idx` (`uid`),
  KEY `craft_sessions_token_idx` (`token`),
  KEY `craft_sessions_dateUpdated_idx` (`dateUpdated`),
  KEY `craft_sessions_userId_idx` (`userId`),
  CONSTRAINT `craft_sessions_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_sessions` WRITE;
/*!40000 ALTER TABLE `craft_sessions` DISABLE KEYS */;

INSERT INTO `craft_sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'cyNXjOl325s-O7t1uzMPyZhHrLU1BcU1Shmen6Yu5qfQNPsOT3JQVbLAmWCC4gldSHTMU-cn2H2ygX-rGUbQzqslypdKTbsezfss','2019-03-06 21:56:10','2019-03-06 21:57:46','7fc6fab2-7864-4de8-9e7f-f43774e94dc7'),
	(2,1,'23QTrSrdOprzi6gLprOtyDok4YirLSZnY9xRJPMc8wJMxrzvfiTUeKVukjJtqJc-aZLMLHkoRkW7SPvXRFklHU59Qw8jiAjOXY4N','2019-03-06 22:12:10','2019-03-06 23:03:53','3c119488-97f6-4c54-bcc9-435afcdc77b5'),
	(3,1,'cf8KX_3XXVhfC9lmBcalo9RgrRRzcSdABTCVI5re0AYH3SdieXWGQyRUDpytyMan1UQi9yY_DnkoTj2-2HSrXUuu7ZwN8-cgmt3L','2019-03-06 23:04:48','2019-03-07 00:26:10','d45bce96-09b2-42d0-95fa-4a6d92f6890d'),
	(4,1,'Q3H7lAARfbSSxmCSnMAW7EEdR-hBq6wSBA_-OsiAYgpYG5fJgHkkujg7tXl9Id1aZgBLM24rYmnJ_7j-wiwYcWr0K1shDavia-Dp','2019-03-07 00:31:12','2019-03-07 00:31:12','88e9fcb7-cb2d-40c3-a79d-67c88715aef9'),
	(5,1,'m7lW3Lqm2a-b2IVBX0auwteuNmKkYihLf_dKBgVkepH0VFcYrY_S7DTPa25lXAlWqAEywRurG8Xu5pL4TsvR0aV1IrGdldtpSY1h','2019-03-07 00:32:14','2019-03-07 00:32:14','6b798355-34c6-4b0b-80ef-09877cfb84d7'),
	(6,1,'Px3EIhmW8AbUTs0Fh2VY5CvoVIyrwLChYcZyIhXBQxfMBCrutkTa-L3O_YFrv9oSD7efONc03Fh1nuKl-9rOigGimT5sdilXkQna','2019-03-07 00:34:16','2019-03-07 00:34:16','169169ca-4f89-4b8c-84db-222830fbb33b'),
	(7,1,'g2cpChk-XmN7DhGXtaXLsnyzguC_PrlPLncKFOCnvAQa3GKJJo3lICu28TBakFzBBIDllrgqlb6uZbMIjF0BVfkS4u3kgoItaays','2019-03-07 00:35:17','2019-03-07 00:37:53','b984c09e-2547-4e9b-8c9a-50e9bf38dc20'),
	(8,1,'dgBZz1dUFhZTxjXse2T_XjLY8raEqLxDUetFg3lgQI4kSrFNLCBS3OT3v1WD_9BUexc-kas57YhZf3TgtaZngv769U5pMYrVGo-w','2019-03-07 00:37:55','2019-03-07 00:44:15','4800df24-00ab-42ae-8996-58234fa97c46'),
	(9,1,'b0sVPNwUdvIPULhzGBZ7GkCJef4l0clhBz6Spnq2bVYtE1prcEX7lOEI81mWgJ0vhPZHrLK4cR5EHsmnzASsRMuCpb47wUO2SMu6','2019-03-07 00:44:16','2019-03-07 00:44:16','c8937013-04d9-43c6-8d8e-a6956ba7390f'),
	(10,1,'srAy_rhUJi0FrCXuGNkjH6u3alxxNIawy7a0Wb8M6lJlVFrYdUN8B0dV0BWigiEiobv74hinuqnfeseByT8OXhsHvOoPTwfKQ3Sw','2019-03-07 00:45:17','2019-03-07 00:46:42','3918b78d-3831-4d91-8c54-3633add3646d'),
	(11,1,'bWOjgwknDSdGpxcOr2qBE-RRwx8qwPq6Io1NdfbCZM3bEtm6Q-Q8Y68FEsXjyltF8bR-GtrSGzPADUQ16xZNokqtFR0gw91yTuaL','2019-03-07 00:47:43','2019-03-07 00:48:30','31bf6271-f9f8-4bd1-89e9-c45006a23b95'),
	(12,1,'Rub-yE3SjJPR3WaAPPNtQJOJzCLHdr9P_WaL80AAbpqlwtWCSSx2F-wxkqilEYOItBu_cmCnQeBIsw20TEnUZj-M4VdDFpYoSYJN','2019-03-07 00:49:30','2019-03-07 00:49:30','77c7410c-5a4b-4cb6-8035-8b3c048b2bd3'),
	(13,1,'eTyQaDi2JhzVDrMJM4quq2zF9J2sppukDvaaPhPUbDa1SDw2EWcs9oq2GPfpbrthwi81iNrHqVIVQH5hmdG4NgZKTeMgqnbkBs_q','2019-03-07 00:50:31','2019-03-07 00:50:31','653e070a-f603-4f5e-b4fc-f4af49109234'),
	(14,1,'yLHmZ83mgosj3EmxdKQDDhCyN8DADQWvs3zxZ_Tcw49pv0j-CFz4Oe1sFkqv8kelQeZrFzujQQ5rI0puz35OxCpJ-wv_aKtftQib','2019-03-07 00:51:32','2019-03-07 00:51:32','bfebfdce-f893-4825-ae3d-97140a4e03e2'),
	(15,1,'qkusnERK4SAOkqRvsfZue-u9ApEu4JBrwCF6yjzTmY55KhySEOxGuOxbULglC3QYYqSLDnYhYwbAK58oeO7zJ3sdn8u4kWpZOT0J','2019-03-07 00:52:33','2019-03-07 00:52:33','c876fa72-506d-4dc7-b545-3fb49c9c713f'),
	(16,1,'WtY4Fu1XQJBjyYJuFRhhu3z5RBSNPoG1aOkIEJgHowwPFDLc4zvrOI_WsL2kFqBEJJ3smYfX1HGUdpBHyrNWv8dOPPg8VwGyr4_q','2019-03-07 00:53:33','2019-03-07 01:01:22','eb05087e-999f-4178-8c5a-04d047676ada'),
	(17,1,'ih_bJxANsSrJ8EIwInAyRaOaus8f_m0K1ewcmiS-BC97gfoOyjCQBwWyIaJgSYVpwXOXefmyTfTAHqZECPGEnL96C8zbrBAiCQ_N','2019-03-07 01:01:25','2019-03-07 01:06:12','aecdbb0f-7c55-4481-a581-41426cff9c65'),
	(18,1,'2ek3-NidJQ2LJJOJ0t5QWXUx2vqmhdIUPSgKoPjLo3_vOIVrDxn5vpuSRoGUafmFWbZZ5w2vHZL9A776d1nuZ62X5t2CG2e42ZA6','2019-03-07 01:06:32','2019-03-07 01:06:34','1d4131f4-d176-4c4a-9719-e77d15c9cd9f'),
	(19,1,'qF1aXJmOYPhEgF9dZSofVC-tC3mnczvm_s1Ll2yqTSV4oUS0hhisEqBR_272GYZH_iHjsdZjaU3JYSZrx2JXCaJ7kGClc81UBFlM','2019-03-07 08:29:29','2019-03-07 08:48:57','424a4da9-f533-4a39-9a7c-df1b5e3de666'),
	(20,1,'6RA20MYbwFXp-N8h7lvaamknB7bTmxjs1oDaOKmjRvxL5D18nJamTizRWZIlPZ96Vkh3vPyMrBpjuC6VNUs1M2j2ICLZkOOI061h','2019-03-07 08:33:49','2019-03-07 09:56:15','fc288142-5e1d-4ad7-93d0-fe9e856ed85a'),
	(21,1,'zgdzmrSZ0VDvZ0uUMfYk7Vgxr_7zMDmCQFgqRDbxMjWwI8rrmi6O_jKWDmXwVtjsmwV6hxNecbB3OwHbwmE9yqMObdnC3-gwtoAj','2019-03-07 10:56:19','2019-03-07 10:56:19','0be62f96-9a30-4246-b529-b2a0c6abd3b0'),
	(22,1,'pDFvquV9tNWUjQAYpio-_xR2na6GdtrJjj0Rxk3RARM9iegJlu_3INF55adFLZgc4uNiftJW7dRAq1Ryx2Gi0bUtYYCSKtGPriE_','2019-03-07 10:56:19','2019-03-07 10:56:19','4084c51d-d568-46d4-a5a4-0ea42d22ad6a'),
	(23,1,'L81FnIxm_x3lS_jHGWEyHKsWeKpjJM1vQV0npOmo9-87d3Y82eWzjtoBg8AgWyUsiHJRz1JeOWTUgZYXUPzL5OX6L0pIQ0LMb9Rw','2019-03-07 10:56:20','2019-03-07 11:54:49','e1633390-f361-4655-9a43-1222cec806f9'),
	(24,1,'uduzfOjaYnmE75H51nY1WMznHEzvil4IzXQb-YyNZtaTRWhN30vbPlRaIqKo7x1DL0N0GLZJ-PrmybseEkzcEfZRrMhpkq1CotQu','2019-03-07 12:55:08','2019-03-07 12:55:08','ddc15659-ea5c-4915-b12d-f96760926764'),
	(25,1,'DnZ9DyeY3dBPdJgzOBqAh3lNJ1lz6SoulHn-gUXjrQ7fusX0WAPGSzj33TNMah85rgGKv8mJaHMPgqh_bhMrUZTm7_qY_Ecsyjo-','2019-03-07 13:55:21','2019-03-07 13:55:21','12fb24fb-14a7-47aa-87a5-070c1ca58210'),
	(26,1,'vsWrs-wsp_eat6gAjKZANTvtLt6xFkrlBxZxccOorwjiPXqGyPq2BYLB1Pei6FY3CT7mwOfJKr3-HmQPQZ1_LvmXReg7vxY6Yi6i','2019-03-07 14:55:59','2019-03-07 14:55:59','02d9418e-f66a-4ed9-8509-5c8072c821a6'),
	(27,1,'vD4OqQgrp0Xv9EfTWwXTLj-tMmkFQCYLuoJcRkO8OG-Dj-AD9Ps2K6ffm2qDQfWhSglkuqQBH9KTzM7Px69asbIG5Ceqgd-ObW0e','2019-03-07 15:56:03','2019-03-07 15:56:03','bc42eaaa-064b-4756-b320-ebaecc68ea03'),
	(28,1,'3JBXMmyUeSYBB5OubTRpGkkjnhXsY5KNGYhqQQLHHxCzkLWidhcrzb9_8JMSgsOPX8Vju1LMt0B9FTTJxOnUCua_vaI3ivuwNCn7','2019-03-07 15:56:03','2019-03-07 15:56:03','c7e4b5fe-8654-4322-8585-ba900524561a'),
	(29,1,'DegmGIxUOIpGdaMNXl7J4KQuQenFLeMg1lWt4ioanYmeQc5GA3c6F1gh6mcZJ_BQlfwBwMD2XXXMEXBseNy_GyrPu1QFAvPEEIJK','2019-03-07 16:07:14','2019-03-07 16:07:14','a4bd14b0-0a45-4eae-a547-ffdcc804c748'),
	(30,1,'nQf_uYasYS2tfBgCJeFTe0XR1HOmwGOwIS-5ASAG_7tygQo2kob1vrrC8BqL4nD5_0AoYQD9W7oTcIgTeRdnC5cuZyhSKyZ6f82j','2019-03-07 17:07:25','2019-03-07 17:41:38','c4753924-c8b5-46a6-b26e-1ff17d5f1122'),
	(31,1,'RntiLidvTYx4ipMkePViTzFtAaTNHHHyJI_XeHH6qjps6t_bK7uK4jjQa8lQbXfXrQaidn70sGL-F6HqEGi1E98mKeBVXKrb5wnt','2019-03-12 22:24:15','2019-03-12 22:26:32','477c2e13-3da4-4905-8572-c25880d97579'),
	(32,1,'ORJK668C_xLwhyhUbjtER3hxKv0cpNfZImjoVF6sAVnkP_uIGiUMdcRjwkJZih5ipwOVTRYJ-qU7x5WGj7Xo45p5M3b8P6JA3LSF','2019-03-13 13:55:06','2019-03-13 16:20:04','dc46a0d3-8409-4f2d-868f-2fde2e136a78'),
	(33,1,'vTCdSRpEzpOBXB83zPfJ85RYYWxOvqemHRSl4g3mkQlqbf0hzfUiJ95xurKkkd2oahCngNMYxZgc8sgcy6JibWTikZIO4gRuzwTI','2019-03-13 14:38:44','2019-03-13 14:52:29','26d63377-6e8f-4f9a-8bc4-e9803cd78536'),
	(34,1,'g2Uhfq7pDWJwUpE3JmkNN0AAppNPQueazojCDspehFxeBBpM-UCogR1EmXdJhOtS1QCTDq-O-p1JvILh7e3Yg_488ypaZOfMQpc5','2019-03-13 15:52:33','2019-03-13 15:52:33','bf9af15b-0406-45dc-b57b-b0a4f1c6c0ca'),
	(35,1,'B78NYFaHm5CnAX8sNDd32ZOboCdBCGJp2c0AXgRd4f2YxxBsgkvFJFW7T5n3U-z2OYkqyDjFhxFDs1FWhUBzYUfCKeWdNErxUbt8','2019-03-13 17:27:22','2019-03-13 17:27:35','3dc10d60-38fd-4124-bfd3-0a48517626b7'),
	(36,1,'RWewJIa-M8jXdfPoRSvMaAFTU4o2K3FZokfAZPehAnyflhO7_6DF7nretRuuLkJhaFwAmSBlvwCoYOV_LcP4SeHo7UK-9lbFKL_P','2019-03-13 17:47:20','2019-03-13 17:47:47','fe0acde0-4b75-4051-a98b-a4ce7eb93e5b'),
	(37,1,'dyR0Mm2nDJcd_U-uRRztENTRHB3Tr4oWEdXZrt9WnbJBR0BkQareeKbenqqiAtUoSAcnbjA43M5VabBeTecK0SHsW-8_RqFznpFn','2019-03-14 17:17:02','2019-03-14 17:17:03','0c7ad23e-2768-474e-a864-a993fe979def'),
	(38,1,'-Y2B9MvCTAuuEZHq-onhJ4A92k61BDhG2tOozE61af6XpT90X0f4pUNXyCZJ8pzXvwD8CHr2VZblWQcAKV57Y6WOzd6Ey4j2uMoL','2019-03-14 17:18:56','2019-03-14 17:29:58','db2c3c8c-95c8-4db6-a2f2-b9cc14580627'),
	(39,1,'-yl38JeniOIUQO2riMtdbsHU4FDZhx-z4H8cfM72v7dlNW1loRCtTHrESEWmkimvfk77b81zEhOZzVafBuadFoOeuV06QQC_kCLm','2019-03-14 17:30:00','2019-03-14 17:30:11','cc2fdfae-1b67-4119-9c89-8356b7310453'),
	(40,1,'JiRgceb1O37HdHz6bacYstWtVXwRReUJKLvqp_eL1a5ySWcqgaw1TrLM5IbYSwlO1BpMC9w423r3YLs5Qo0W8WDDhbIZtjAfHFUY','2019-03-14 17:30:11','2019-03-14 17:30:11','e82e0877-515f-48f0-af9e-a6c08309dbf6'),
	(41,1,'0zAvBMMyMQRn6RtHzItVoY0SLlJm_GosMLAXXKiCRf1XjUgPsv4JJouCIE298GIMWNU7buP7x-XJHhn5Xxh0eGx-CJErjZniEl2r','2019-03-14 17:30:11','2019-03-14 17:30:13','1146d033-dd9c-428e-924c-deb3e086c61e'),
	(42,1,'CmxYZYVfXLKA5Nf4d_TyDPowgbtO4Fmau-_tjS4KSp6NziI-k_HizjAU_IQsD8EZxTBerQ06FiaF_59S76DPavqa002jALknSnzp','2019-03-14 17:30:11','2019-03-14 17:30:12','5441ced6-3f41-4444-8dc4-807d58ba0d5e'),
	(43,1,'PxIN13CohRX_LWwAMd5DiXIp261LKoEk8TLURoBvNL3QsOj2CLGo9G57sXobjG5bbi--Vkwbu0KYot5D_k5PWda0zbcaFxefkE8B','2019-03-14 17:30:12','2019-03-14 17:30:17','8686272c-7ef5-4ab0-abd5-23e18c13c461'),
	(44,1,'GJc_PxgRxKKY0o5g-FmgncEWzecaK4NCUm6747mxSS8dfZv2KEtMdHhDk70wjybS69vOjFiRmfldG6xKZ5VHYwE2b6VdLxsvBxhH','2019-03-14 17:30:13','2019-03-14 17:30:13','017e95e0-a213-44b1-95a5-5da383a8a72a'),
	(45,1,'5NNCq8j3iqBKY3NWpxmfuvemEX7o92iGsDhzOy22U9npiuJJggRfv0qmrUryUr9yxPZwv7-1p_vqNSacJ73Ut1crG_FOHZuuq0vj','2019-03-14 17:30:14','2019-03-14 17:30:16','f838907f-b300-43e0-b452-efb908b175d2'),
	(46,1,'V0L1VsTaDAsYvwILdBzgQKSOv9SR-ws3HUYPhYmEGf394uKhQVCTVt1iUSou_QeV-WpTEfBarnTca6zBcJuCnS63kOHPvj2KrRJp','2019-03-14 17:30:17','2019-03-14 17:30:20','2c22f563-b14d-4798-ac3d-85eb724cddec'),
	(47,1,'5lC-lV0bYnmSmxJNY9QhsAObtOM5buL4gx6uhatY7g7f6_7Hz728Pmu_B47xTRZtC_TgLpvZl9KlrUoKcNFQLovDX6szMrAtBVAD','2019-03-14 17:30:19','2019-03-14 17:30:21','4816e414-32fc-4516-b06b-a48cc1a2f58f'),
	(48,1,'1TtpdGoZceEaX8aVAANWTJXGV_LfPf5PMcpQ5nr9MydMUJOqGr1r03Cu2bXeBCpcGU6HhSr3BNutmAnhVSYnReQeI4Wm26j93Iej','2019-03-14 17:30:20','2019-03-14 17:30:26','53427b00-4e53-4156-be9c-2495d1d78031'),
	(49,1,'a4rNjDoQTNFgIi6BawNanhLcZjLDSIdip6Kyhv8ISvrt1oAy3-RIz5auDGqEo3GMv36NI6gBMrQouNlFO82uBwMEddlz9tWoEIYs','2019-03-14 17:30:23','2019-03-14 17:30:26','e5f13bd2-f54c-421a-9d67-49484dfdfc29'),
	(50,1,'D19quO-pHlGaCArh-9uu3Jl6h-NEe5_bmpWKvclZfxRBIT03pZ7cikW-GvlFeLGRUwvMBLZzh_PJ041TBQVWL8ayA8LienrgLHVr','2019-03-14 17:30:26','2019-03-14 17:30:30','bf4dbfbf-c450-46e6-bc28-4515f771fdb1'),
	(51,1,'LnUzi0ruSWRxz09PNBCjsgZPUXLoFU5_aufZyKND4oAHyqQHKrJ7RrCG_OFn9VyyVqAVbPRu8ie-v6O_j0YZ9K76Z5mwGMGgyKtF','2019-03-14 17:30:27','2019-03-14 17:30:31','b3d06e86-606e-418a-b9b4-9da3a07e5c42'),
	(52,1,'NIlCxAR3JROg81J4sNDCf2pChxHaPto6wFfgfoKnEMuoqVPZ8j8vHMGLvTQGuh1psiWWbhUg33aRkpyFFLKwxdsq6uHVkdoXr9OZ','2019-03-14 17:30:30','2019-03-14 17:30:31','23b78eba-d4d9-4ab0-b06c-295e96a8054e'),
	(53,1,'vJMDHj2l98pjDCW0S2z_3Z8z7tvwhIbzZrBSTMGC_cxAN6Ychx3mOlf9cPcmKOFnMZf0fB33F-invRfmTZD2BLhIkFlTUW7eLBTW','2019-03-14 17:30:31','2019-03-14 17:30:31','4bb6ed59-9e4a-4cf6-92b2-63b9e4bee95c'),
	(54,1,'x6LQqbNq94WouqOywIOTCa4tupYo5RhWZb9H5Ghgo7aIdBk81IndpettHOCWhehkHFLKZLpX7QyK7cbXGGhyGWmSKlYNvTpeCOtW','2019-03-14 17:30:32','2019-03-14 17:30:34','1b61df8c-9201-41a3-a3f8-7c4759e4d8bf'),
	(55,1,'95x8W_JN_31oDmQhVPKPGar4HDhN2vQxDxeYCFdIIr-NSDJuSVItVWrQYrOuCX3YpPAY4Xlo_Rk_suHq2_HIldU0EKi0U_X4VGZu','2019-03-14 17:30:34','2019-03-14 17:30:34','fed338ce-5247-4a44-ac87-0732df7cb1b4'),
	(56,1,'aENU3KMDLD4qwYLG-dy9hiR6LMcsV80CVJqI93cARY-EOi5mWelbcMvHBEUYQ9cuYpK4_tyWy9lqyeKsPRJ0_XeAIvgIQHttY6rp','2019-03-14 17:32:18','2019-03-14 17:34:45','cf726ac4-0688-401c-a175-10ca66660b0a'),
	(57,1,'ncVE9bBQn63qlxPN5ZFiAD0XSV11NMCaTX5E2AG31Ek1zVVibToxsisJPbFDjIa6BZzoR2OaM26GbLh82VvV9GRtFWrN0b6rzjyE','2019-03-14 17:37:46','2019-03-14 18:01:13','ef089ed1-0931-40fa-8b7b-5030bc6bbff9'),
	(58,1,'_v8Uc9MmAqTY5gmoKYyyHLYAY4K3wnEbLl1qnL4QKSLg5duB5lGIfhJTb6rVvpCjyk5PrUHzEY7klAIp2RvsS_ZqXCQv9LYdg-B7','2019-03-14 17:37:46','2019-03-14 17:37:46','14e35dd9-1c8a-4d9e-96d5-cb088829af44'),
	(59,1,'DgYGCDXSIRUr3LcFgiD3ksLhB2xhZZmnDRsB-f8vTlb8jl7LAa-nhf93eQnaMbNamZ__KUhCNugLKEsX1XwyfmQvS9CwGGeNo4eW','2019-03-14 18:08:46','2019-03-14 19:01:38','d28026a8-a933-4fad-b193-5b17434bb452'),
	(60,1,'jRbm8keM0SL_r7uDoyKFhX01sF19zkrHmiEAX_Ku1dS_-lNe2XXqagig9cHFblmxd_ycToG35cidpTwoLpvm0oIKy-lEKpo1_Hnm','2019-03-14 19:01:16','2019-03-14 20:24:24','a49d73ab-8e02-42c3-88a6-2eedd88cee93'),
	(61,1,'oTaRoJVZki6JskA5ftFpNKBpYHx-PfynyF5DEoYuJjKliUWiSeUPqS6W0gEb2jBNjcsRDLuZBbpqhqf75k4-566tdZE5--ZcWF-A','2019-03-14 21:00:49','2019-03-14 21:06:52','239a9521-c08a-40c3-af7d-ec8398c195ce'),
	(62,1,'2A39nOAKfGJynB7ykq0K09_8gIqObK0Ko2xqpfmd-jtWj9PBqiXqvJdW8WOeAeyTrqiauHjwcEBOFGgtpkFERRfKa3wI2s0GLRZR','2019-03-14 21:10:04','2019-03-14 21:11:04','6246cd06-f45b-434b-a971-528c893bbfa6'),
	(63,1,'nlnzdmDh9vcbymSqc-9W0HLht8G8evf3DdDMXt6w1g2Z1buMpXtTV4dw-klJwa_8tplKNEegTHQrV8KIvirCJIlc-bWRVL72cJ1x','2019-03-14 22:11:08','2019-03-14 22:11:08','5e681425-499a-451b-ab21-fd58227e0b6a'),
	(64,1,'bn56b7yw_BU6nIVBDNV-eLQbdajyX65Dx1CPJKxgK8eiusgwXINXvBMflsnHyoo-p8iKg20k95y9if4_MQfAbAo9ea5ivdBSXfPe','2019-03-14 23:11:13','2019-03-14 23:11:13','bcf4ca40-d6f4-4665-9aea-dccaf29a8461'),
	(65,1,'Bq-Q42kYurCUUBKjiSIo_LNhXjLDdY3C43BS0Ru55y1jlHdujt6DvB0ATrVOYRIV0yi6noXTzaLP1qLiLkmO3yGoxH7jYHOBiQd8','2019-03-15 08:52:50','2019-03-15 11:56:06','e6d30115-e19f-4f75-a45c-799ce6e3d471'),
	(66,1,'c1-IG0nnYWsuyZ_35L9l70_Wzj9l3PFXAarauY3NW_hcEXBtUYTfPUVhMYclY4dCKpCFD-sZx4x2v7BlvaCSRITeGjgNeZ0l1OVj','2019-03-15 18:44:48','2019-03-15 18:45:08','803fdb12-0097-4ae6-ace9-c87438a612d1'),
	(67,1,'2jXX0mlSfrrsXIwppin4XwORCY9W0RWbLE4zlRqCnUChSGEzJP_JrUkuzR1JqTUxguZ2N7HIOafx881JPN5rvVfBnxbtvjpgM8Ci','2019-03-16 00:04:46','2019-03-16 00:06:10','2d2609d7-8d6d-48e4-878e-11530657e9a1'),
	(68,1,'yGCARsAu4kVtBM9cO_0CgyC2E0A03ksF0SCLWOeG-1Moyp7r75R_U4pEHJEpe3N7FBNiLR7DxAIrXX7sX-xa8VYjspwysm0qQ6H2','2019-03-18 18:20:51','2019-03-18 18:27:21','1cb33275-0056-4002-bf10-a7e35630320b'),
	(69,1,'t7p_1MFkFvrMbLqrOESDFQDq_a23cPtkrA5lFAnJKXla_EL4LiS2uqDc_TFBxK1bSG_gbyku_esA4xmmHRf1V0dcPItp4dm5lHN_','2019-03-19 12:01:36','2019-03-19 12:22:45','7a31067c-72dd-4127-98bf-67274f87c93c'),
	(70,1,'GS-YM5f-Sqgwf71Pdc97a_5MIbUPb4fa74MQGzH45weotmz94-IBHraMzhjrVGAZfxoKpQKeFUD8j08DVi1nEpgaB0ZyOY1NsIpG','2019-03-19 18:22:26','2019-03-19 18:37:46','ee90d3e0-7a45-4213-baa7-e2b6cdf95e20'),
	(71,1,'2fBiuE4UcEB59AK-Zsop_gmcAqCCXq_4T0Yyi9j7D0ApSPzov5ZSWlfvD6A4JHruoNiS-EZ4Ifxm4XjU82pYy4vnF3u2to0v6aYb','2019-03-25 19:19:37','2019-03-25 20:17:15','993721ed-3439-4525-9fa9-3ad51d4233c4'),
	(72,1,'sj3iBh1YiO-LRSp0TGpYXs6COKFVisZoOCqkSKiYrsJSBY-x6cTfpcduo09shn6fvIFGr9CtnMJA-4j-ZLfOPAaL-ANibukIb4Lb','2019-03-25 19:37:46','2019-03-25 19:37:55','a49fa11f-d360-4efc-b101-a7b14c40a730'),
	(73,1,'e9OqKf3P1GDgkfKxI58eNetJdUzDgh2N5wP9MgftaXRw4Z_LeJAwIaCwfgwH9IqxA4MRAqGFdzmognE9tPJtcJvUWXuSS9Hqc5wg','2019-03-25 20:11:33','2019-03-25 20:13:16','1b15be7a-9787-4f46-a979-a4151f4a2b0f'),
	(74,1,'i3k-h9L0cZJPiPQHu9bYgRpgderVedXktBo5SRW8dillfgNx0jq0e-fuIbp3xap3wpc4FTmxmyTxisZRUdfrDRDmE4Xs1S4n03tS','2019-03-25 21:56:51','2019-03-25 23:05:37','d6a13363-ddf2-4e93-a3e2-b5f37927d401'),
	(75,1,'y7ZZhexSKLzkNFoJ0pOZCzDnZuGsDk9xKcqmV7vAOfKg1E47GmCBqNicm26L_FidDkDN-ItqYLp81_7QoHvadUs481VuyrMCQjQU','2019-03-25 23:37:43','2019-03-26 00:14:21','fcfe0542-4d45-4583-837f-66b8d0a78e2e'),
	(76,1,'2Cl_mzsXfam-Io8bi7YUdHbZH3Aj4A610VJCoowD1SujpG2YuLVD4P3I_cxgLdx9H93pPXQRC5L-_Z_sejzGXgILCB7b5Th1YiSI','2019-03-25 23:43:59','2019-03-25 23:43:59','51aaaed4-ffb1-4790-8810-5366e32983df'),
	(77,1,'c-a0ihSWimOvEccXKhTx0nMO7A_wmyKv6nAhq6Lt_BAWk7IxCev4LD3DaMzcvWV7BkAGUFlLITHZhF8GI2JvNcZa7ymxRjC4FQtE','2019-03-26 01:14:36','2019-03-26 01:14:36','e6d1ee4d-17ed-4cef-bbd1-8da6244cccfd'),
	(78,1,'r3kKdqTNeQrSZGJgQoxqJEmvH-kXukh3wSi_6-5I9GgPgU8jOyrBU7BrF5QL_Oc9CHXhwA0zibJohJwPsg-4cvPDtFXcdNytu0oX','2019-03-26 02:15:20','2019-03-26 02:15:20','1f2addce-664d-4481-949b-a5a30b85415f'),
	(79,1,'b5FvLkS65QbnlAtKiwOP9Ke4TeBHwQSm94fquM4Buh6hSUi1yc_X1PMuYjPsLaBjKZX_O7wy360MYZAhHcpcYpVs6Mal-gmnyPQh','2019-03-26 02:15:20','2019-03-26 02:15:20','d70ab4cf-1c0e-4d9a-a1d3-3bab005d7c39'),
	(80,1,'cC-WUgi-LQcnuEHGbZq8_8FIetMmqCtBRu8FQ78vyJRgezvXIIFctb8pR3sJSfu7Irb0wPxIXCoG5qKQEY3dCmPvvr2PyW1vN75Z','2019-03-26 02:15:20','2019-03-26 02:15:20','dd0f116a-f54f-4d42-a3f8-c43f098ae9e9'),
	(81,1,'07nLlgEEyk_TtrVOzUws5yxuduidfhcLMqwLO4ujn9uhfVCH1tHjByp63lb8NybRgqxJuV9y5vjZDdJRdP8baa_3qty9m-Kvy3CZ','2019-03-26 03:15:26','2019-03-26 03:15:26','a0a8ee2b-1ec9-4785-ab73-021b79bdeb44'),
	(82,1,'t9OiqG7jqU4n3mnKE_xh_rJLQ2s5BCJSb-3u5BzeZ5Wp3u6fo6wkzsxe5SqAYouxqnzmZbibZPsodAqNkEh1xo6w0U6XUeIVUB45','2019-03-26 04:15:30','2019-03-26 04:15:30','db7779ac-4c7b-4595-960b-2e9e47461958'),
	(83,1,'ZuSjAiefQ8dx4NohfsQ1LO88GFHHLrj1Paai0kjArTjU3bb79KVAYjDYongk8S5z866XdUNCZMD9_Dh0n3NkpybhBjHuuUR4B62p','2019-03-26 05:15:33','2019-03-26 05:15:33','e42b64e7-3031-4841-9cfe-16f613eadb91'),
	(84,1,'8UxdWSePkNN16o3IpeNsSAmwYXRArU94r-mU23I0nAu-vawaK2xJm2EqOv-rSd8ddebsQPMkHkl9Mz-2ZvI5qHJTXvf34c0Ouapx','2019-03-26 06:15:51','2019-03-26 06:15:51','e8a7841f-6109-429e-ab1c-5431dbb31c2e'),
	(85,1,'nId9FGYf7jOARpgZKP01ydYn01FAWN4_ndfoYS7TlzgIjNLLj-ojn9uIaOyowh-Wt-WQqENt0VlXM3rXdlrNmh87ZSodUmOGNGZf','2019-03-26 07:16:24','2019-03-26 07:16:24','3d207ed1-2bfa-493c-be11-7f7059b0d035'),
	(86,1,'k7rqmnT5wEGcdaG27g_4WdvHyLbZGgpaV7UL3JGR5fkOkkXCLJOrGcNGt-HnB5GKFfF3NF-EMdOobtLbvAjPLuJn9LrxmaxGfipa','2019-03-26 08:17:09','2019-03-26 08:17:09','21dceeec-4d95-4da6-97fa-9ecd334c47b8'),
	(87,1,'w19gD8yV66YrDapXzEQBzq5GK5tSbxESu2W2DxMe3tocfz0AyjH1Dtywh0YVuSk9YyDK_nSOIuXqRBvwlBRdZBn61sO2t_SjPqmx','2019-03-26 08:17:09','2019-03-26 08:17:09','539dca00-6c90-4ef3-bcbc-d19d4628fbb4'),
	(88,1,'gyrog464J1FpbT-kU9pVHhM5tf2UVlZfXtNeuqinVZmbWt1Oc2T_ipe04r0VQyuh_hcRKd-ZBWB1EB6KHgb8E2FKBu0ZPVJkme50','2019-03-26 08:17:09','2019-03-26 08:17:09','dd948df5-5bfe-447a-a86c-e0ea3ed354a9'),
	(89,1,'aTS5GPZIOVZUXq29I_cxhjYb_3QU9-8wzrOnTu1zJuZj_rNTYBnYT2ozlDa_qUfFO6_ItZ_-DFTwvKt1VzxM9122XycOMvf716wA','2019-03-26 09:17:18','2019-03-26 09:17:18','28eeedcf-92cc-4eff-b926-0ce3af85eadd'),
	(90,1,'GsiLJ7iqHBV6Ji5yMaE6ZfSHGccfPYiKI25n765IdiAoXVQv3fZHVKfpQ99_exRXlJoX9w85m7TyRkQe3yxAxsC6pXmKTL772KOu','2019-03-26 10:17:36','2019-03-26 10:17:36','dd097288-54f8-465d-8c9f-c635b24b044f'),
	(91,1,'OI4D2gz3MZculf2W3kCqY5lsRWs5VNlA4hoA4oB8grdnCrzABVwFnpMFvIlWBZUa_kajNdGWJaPxkgVSMiFutCxUB3dlSeNptDrD','2019-03-26 11:17:38','2019-03-26 11:17:38','94fa3f50-75b3-4378-a306-67588c83b283'),
	(92,1,'REiPm5J44i_ZBfUdxACFGH-05wo7BNMwzoXCnAzfaJo47Nw7ybFF6Li5zdgFO99T2Aw255wqmUP-ZmaPclMidqj92z2QPNG2xWoN','2019-03-26 12:18:20','2019-03-26 12:18:20','09b3bc77-0b51-4d1d-8351-d0ebffd1bc7b'),
	(93,1,'C7amVeAVNNzWpVmMJ2orep9JwvhJmZG1JPDkTm56JxpYvzYgwAoNE5QXV6vPTXHsd0wHhnTiDkJNYAb4RdVjv3MOuw5IqRkXsxsq','2019-03-26 17:05:05','2019-03-26 17:05:13','de9914c7-b352-4c29-9c8e-e49b65546215'),
	(94,1,'Q4HykGy6gjnrk6fZC4wzmcDTeEnbSmL5h9iT8fSfIDxKTvMLuoHUwT2QDokHyRbdcCGf-Lq1q0GfWd2iJOjxgyPGaGXDYSswH1i_','2019-03-26 17:30:01','2019-03-26 17:30:01','c1104aec-413d-44dc-a76c-fbb38f1d0642'),
	(95,1,'7AFoQLSpS0Jx18JkmTy-b3qT9D6rSnMMliFYnRjLl1DHdki-iXtm5j9iY_cd7l20JRhG2NryANqH__jBU80Lc1OkfYNbP79rCN3i','2019-03-26 17:30:01','2019-03-26 18:28:56','ec058c6b-a0ea-402e-8821-3afbc23e9567'),
	(96,1,'0M8cN4Xr-UUIjVCd2PX47RsmiuB__x7glABL0UDtuK5VKsLCihvJnI1N3J7wzWpmvbC01I72e3n-r9LpcNcqUGDSLIAaf18LQsu0','2019-03-26 19:29:06','2019-03-26 19:29:06','fc3fc5be-db54-4e16-a46f-d6e827a61847'),
	(97,1,'qKty6tEdUh2a5h9uGMUOd2G3ru9G6dqyYycDH9pgP8OLOanRmgFV29hipL3YIf0LDDPoZcFezxPWUH6K8Ja9bQciPagaVLJFwfy6','2019-03-26 20:47:25','2019-03-26 20:47:25','ea3ce01e-e2c7-4fa8-bbcc-7eef674d6be6'),
	(98,1,'rUtut_pdxGnXxFU5mdaHSYueJ3L9_eQswzGUKt_GvrH2nzG2P5qUTZKYWUn-bCNl0KPp5Z6sDuuasylILERTddcmUeIgf9QFz_Hb','2019-03-26 20:47:25','2019-03-26 20:47:25','f796f6a0-ca4b-408d-a3ae-60a29dac2767'),
	(99,1,'IeJ4obJ1ZDuo_lxXuCuFJeVpqMiy4oKEjx3LNUegX6QBeD4nQFKZzPrK9yQG70oywUymQo4oulFHsPizw-dYHUfvlucIJbT52KVh','2019-03-26 21:47:36','2019-03-26 21:47:36','488dd250-93d7-418f-9921-08526dc0ac8a'),
	(100,1,'tsWyNbFz2XoNoP7XtR_7B9VEJ80kedsGG-1Tw79ymkgtri5_2RLPOMs2oN5HHBhjvr5C9d5cQNTErfcz94ylJEhJVs49C9ovs4k_','2019-03-26 21:47:36','2019-03-26 21:47:36','cb2b7f93-21d0-49da-a7e9-54eff7ef19bf'),
	(101,1,'VCDkw9ZEdg9ppzUr2RCv_vNkGqp93csPW_Tc4n6zfdenex9bOpCOIegorjh5Na-BPJnD0-GsLqFAE0ZJcamF3WaoOFOPAnjBUaR5','2019-03-26 22:52:44','2019-03-26 22:52:44','7515a60b-6560-4174-8ae5-1ba5e07bebdc'),
	(102,1,'5JYoE7s5gUJgBDke2WTtGLRrWJkWC40P5VOASZgK6x2cMO3a1CM9564ESQU4GW0magytLFeXh2FtwFOttTEflq3jQzZPWW57FoBv','2019-03-26 22:52:44','2019-03-26 23:36:15','b24cc755-fbdb-4dee-9cf0-909327da4a24'),
	(103,1,'yUcN2lS35yVtm3vZhDaqMSLQqR9DTS5cT1KUdzRSrzMb-bFImfd0jfoIg6XwaIBgHP6-GCMIRToK1qz1rpO2Hbk9UKmf_yS7pqp7','2019-03-27 00:36:19','2019-03-27 00:36:19','06812e50-06f1-445b-859d-cca04d05c4d0'),
	(104,1,'Ny5I1wP1OmB5ql709d77UFIPvDYPvvAk37jzGStED7hNunOSY3ZwfPVZnpASy-UnyYvv-2JEhMowxfeQZPchLrXmkoBv503iFzAz','2019-03-27 01:36:41','2019-03-27 01:36:41','7b204e3b-6ef0-4b84-95a6-2d5ef609d7b0'),
	(105,1,'qrio-fkux20hqG_NRHYEFuI7jPGB0MTA-MJxYXjzm2b8SZDL4IMAHJ_lfy95S8INMyQ0gQDNJwY2btw02ZUGobqhEEwKnEkOk3Mt','2019-03-27 01:36:41','2019-03-27 01:36:41','afd580d6-5653-4a14-9dc4-d699534db663'),
	(106,1,'gp6GdXVxNB60-nrVn-DkICVp_hngXXsVD46r4pDa6LRYD8neO_uASxU-LuvOgFuh_BMJEjixd9crkUwYrel0xma06qDIQJ5jp9hv','2019-03-27 02:16:38','2019-03-27 02:16:38','b06f612c-ee27-423b-9488-abb3f622df4b'),
	(107,1,'GNo3n-d9X5IEAI6W8EhwcSNPfo-6BmFIj0rNoRqfR5HeKVgTrCMa-_PhuBCznP2HVd_LABAR7dMgeQLDOFVV5lKIDBVoHQ84Ddds','2019-03-27 02:16:38','2019-03-27 02:16:38','fd39a162-fc03-49e9-9a46-6828de5f6f6f'),
	(108,1,'DQCU0ROpcDQygHcyTuTajJTl3kSfpLSZ75V7kSIRb5MacZRiIWLAzW4J6PiBdIjLQZ4g8jI-B4gnAeT40cJU2DycBoTsRc1Uee6u','2019-03-27 03:16:53','2019-03-27 03:16:53','5311c126-5213-48fd-a6f5-20ace201e91a'),
	(109,1,'wlfD363-QUSRQFTcXy4HDbrrR8LSxINKulHWTc8EPnX_uzpJe-AYlbRnM9C_wKp_t2Ybi8fNo9gcBTvmZI6hpIefOYQkbTXYk6OG','2019-03-27 04:16:58','2019-03-27 04:16:58','9b48d5e5-3bad-48ef-8f9c-4f19d8c5416e'),
	(110,1,'OfyGYTxgFCBHYI39T3TAKZIjIAmDCI959gyHhdFVInkATl6w2FzFFtrT15kJEhqY5nr6n250Qk1U73vItLrbK0RpiQmQ5X0zPmcH','2019-03-27 05:17:16','2019-03-27 05:17:16','560a5891-37a5-4e62-b548-7e040cb37279'),
	(111,1,'750pWYdv9y2zLEAKuR7issXtNXPtHsE20_gJ5a6paKfgg2uXC7N0Yxm6mchAQ6hA67-kDJmWsKfrIVOnNS4cwUyAVaxt2fcnmoJc','2019-03-27 06:17:21','2019-03-27 06:17:21','754e6955-17d2-4de9-b9ab-b3f12d880752'),
	(112,1,'SjF9qvj_mIRMbiBFo44_ElJ7y_nAYg2l4X7WysN30ycnWWoia6-Gkue6XG05eJqdt1eC8GfEzBdfEWHstOjHIHRss1-P3592ROsY','2019-03-27 06:17:21','2019-03-27 06:17:21','a589a7b5-5462-4a9d-b997-60a2e322e1a6'),
	(113,1,'8jum3THY8EbouPBCd7671eev0a4P49DEvFXEStcO4VbXQcNY6RvrrnfmHpPOFaLTpZRjnhCBNWqBxbNKm0Po_m1cbJttI7irgZF3','2019-03-27 07:17:39','2019-03-27 07:17:39','b6118eb2-f491-4191-bbd9-a818f732d2d3'),
	(114,1,'6dUWvunAOU6wc5YQKnE4WSua8wH9hRNDTkuNSg3TGRy-I4nCJmmPSFE7vObsU0cfnZDPQ5HiKHQbqzeF18wqEm1L1c3D3fkwlMAr','2019-03-27 08:18:09','2019-03-27 08:18:09','63bf8a09-c062-4ef3-9198-860832ce259a'),
	(115,1,'aLufxe_YtFCRCIAttT9Rjz6Gq9DVEKvcHKLfEQMOsWoL6lF6lXXHvBTeOOxloUrme8xu2BESwyqJDZj3TCxAnqMlfdv7vpzFE6EV','2019-03-27 08:18:09','2019-03-27 08:18:09','e1ba871f-4094-4d5d-87df-ed0dad0545e8'),
	(116,1,'Mfre8iLlAcDxUYh84oq_QMCKl4gF2-LhfCoHOYfk2JFJcvwl6Qjsqf_jxgKB6Bc1u0gzCotDZrnOKkX4naR2kKZ4mnXTrk6g6ztr','2019-03-27 09:18:12','2019-03-27 09:18:12','acb408b6-4a29-441a-a131-310049c7345a'),
	(117,1,'cRIxkjq9xUNzYr2mkHXm5XUuXXo9nD6k7t6cifZzk_FBLFmCBl8BU_5E1ZZM4tcq7QFBzrgjLJYhun3Wx6uu7SY6H_OsXiF7U7g-','2019-03-27 10:16:07','2019-03-27 10:16:07','37f2c9db-f4d2-43e4-b44a-59333e1034fc'),
	(118,1,'4J0MfovzOOWIqKxAqMUUo3SpSkU9ZKNYMLUpH3L-fzMs89dTuxOorQ-UR4rGpC3S8kDaGDR1LARMcCetvgw9LzITD2B5tXp_OpPQ','2019-03-27 10:29:39','2019-03-27 10:29:39','6d67c6f0-c6ba-4b53-9818-2ff7ebe99a86'),
	(119,1,'CNmhNsRXiuQxXX1vLqvtwRgNnJpK1E5r8Jet10MpQ3oo2aui9A9NkXOE089zbd4CMgipPrKCAfmDjHRMkMESFGhm7qd-PXjA_qhs','2019-03-27 10:44:30','2019-03-27 10:44:30','63b82381-d50e-44c1-b7d4-66558e65c790'),
	(120,1,'CgvarswB0Y5MoabIpNG9xNRwLPdpcAgJM7-VOPFJRztM2uNGogTnB-4lehRSg21dFweMxTAGkrPYFuiEtUtjUb6SUjpfMnAg_FH1','2019-03-27 10:44:30','2019-03-27 10:44:30','96f9bf37-8398-4bce-8094-f3e7d0c8d88f'),
	(121,1,'C5ZcR4dJSLV0AqNr4LFpTPbR6-AOYPt4TuFi3UygI4OpCL8YowaraNkSezO7oGRpRJUm95MI08aE_SuBR4W4VMt_N82CePlHCyks','2019-03-27 11:45:07','2019-03-27 11:45:07','c5799a74-3fd1-4c6e-a2d1-5b23111ff7bd'),
	(122,1,'_BQVHdXY78C7ES1pg_ErjRrI3pBYV71_PK1A5AORtpx-JkbTQBtuadzya9Dm58TXvZMgRfln4ArhQu7vEsIxZ_W9GgVJOD6eQR1V','2019-03-27 12:38:23','2019-03-27 12:38:23','895bbb00-5293-4afb-9572-ccb52267686c'),
	(123,1,'DANJEOCLc_dGtdlVX2EFJv0BtWr3tSV7ySdq1jFRFn4HpfxrMjAWTG-JBNITwIA5PO2eOB2ZnvpBNjO6hd7NeoHfyumBiUS4Lq6Z','2019-03-27 13:39:10','2019-03-27 13:39:10','a36da861-fbcd-40d9-904a-a84356dcc64e'),
	(124,1,'z5gCCznpjPdC-I-0fGm4ECbbEUXjjjGkGRGwtw4I8obCrECqZO7fyt5Op41_E8FdVg8_lkUN8uo88HUGXydu-xVroRzJh_YrasvG','2019-03-27 13:39:10','2019-03-27 13:39:10','c6fa98e9-9927-4f1a-89f7-f3af1183f62f'),
	(125,1,'3jfvfwQyHqbn-C-VgiR3BlhuoK33gatpq6oyXEyeV-3pGBjaJ0f_PbKN7gdynpKP16v94Y7N_XF3OamViOw099xiItakE-rIx3_6','2019-03-27 18:43:03','2019-03-27 19:58:05','efa41843-3a5f-427b-9b8b-d217aabb3789'),
	(126,1,'EowgdB-EvY-_4_mIqy9Qv4w4eMYInjo3RLqNjf4dmr_nWMB3qWkzjex4QQExbmUmaGSB9rbAhJYFLGZVqGLdWghqq6j5VwNDF02U','2019-03-27 20:58:10','2019-03-27 20:58:10','c6cb1de2-5c8e-4a9f-b4ac-8e5f15b31de4'),
	(127,1,'1_cEQDJoXmX4mCYiEFHizkFi288JgXRKn5EuZ2INDVStWPgkg7kWw4zOWOh-nDEJKiLM0TlfgZGiFrT1ivPNGdgUhBtOzpTksHMK','2019-03-27 20:58:10','2019-03-27 21:33:30','e8deb176-0139-46fa-b66e-9a3f38bac7b9'),
	(128,1,'-SWFCIEamHPmh8dAJQ7_xrk7k7AWrpKRbSrtzxJ_rRPBGDUw_iawMWPS9qedR16ZYaHBsAN00KCwTajkaNRrKsXHpe5jMCgbxR09','2019-03-27 22:33:39','2019-03-27 23:10:19','d4dfd91b-846d-4894-a0c0-56816944e046'),
	(129,1,'eSSdYHrAKQhbCycprS8PMSCFZtFB61kAMbAuYn-yIRhIS3ylI_amZuJI5GiIPLhHAL1j7zw3BUAs9P2odYR6BscNJp-rfC82nTBo','2019-03-28 00:10:24','2019-03-28 00:10:24','4c59cee4-5b67-4882-a393-77be0a97b5ec'),
	(130,1,'WBZAbBAG7-jL-3BhTcNPcWZsxFDJ6Zw5ziNd-5YKPF4rg6m4HRReXkFUHO67l1I2igCQk0C6EMzKNvTMRi543Fe_ofCgEJp-cNo4','2019-03-28 01:11:06','2019-03-28 01:11:06','833e2cc8-7b48-4e7f-bb42-ff94e1f41dbf'),
	(131,1,'8eLhEYLpIGXp4N4vtVzoqgTJ_HFNnhY-aOdjz7WKfAtZsOlRs4A-eelmYqFRa79Tni7JI1UKM82Bs7gamAtLbQ1EkmeaTJwYJy0F','2019-03-28 01:11:07','2019-03-28 01:11:07','3bc64585-06fd-4cf5-8c31-f4c3164a6201'),
	(132,1,'3l3FZpDLRK51IkDtBLk6v_uuQwGt7Keozho9JTsU4NOfae0opOwUtddcfeEBAe9BcfkfRFfW7zRsIIAQp8AR2SPu_gyAaQ4F-yUR','2019-03-28 02:11:12','2019-03-28 02:11:12','2297bbf6-958f-4bd5-aeda-7643aa5b007d'),
	(133,1,'hCKRddK5-tDV3GuL7rAjLc5CDE5qaC8yi1wCe92ViE2Gnnz1miI1KCozwBox9FwWIi8e0MpyTe8ygrxQigSHeBmvRDXM4gHyn7Qi','2019-03-28 07:53:22','2019-03-28 08:11:59','02e238ad-aaef-496e-ac57-cb5e0b3009a2'),
	(134,1,'DIJ3RFu6GO_4AH1ZJEqo6ZHIRNIWpG8mARVwzuB82-NE82UIH8Lq3lOWwC9mVN9wgdoaAPzgpDtAtcfG9NAifqO1P6ur5l41oA33','2019-03-28 08:25:15','2019-03-28 08:59:39','f2b50565-4a9b-4049-b8da-d4cead34b284'),
	(135,1,'zw67RilRWKVexfg8KhNM6HNPunSifba2y-tBpgOyCslGhJZ7JXO8RC-Fuhn74MALbacyTh-RX8PkMy209CSXo7uiAl7kJULGHGGz','2019-03-28 09:00:18','2019-03-28 09:00:58','470f32d7-f028-4753-a1f3-557489ac82b0'),
	(136,1,'HLXLKfGBtPpj-2sfrIrJBW-RGCgl11scM3EewaNqqymvrGa1ffph5p_57kOmbrsLxNaPcIyABXvutEKU00DXGOhBJuw9TYUQgIBe','2019-03-28 09:21:03','2019-03-28 09:23:48','944f1276-5fc4-4a34-acde-c32fd752212b'),
	(137,1,'rnsHKLv1YkxtNhvoVvX0mqjyFBhF_DrVXCivxu_91-NJXYe6IFt5bQwvF0gdCnG986PcS4JbapbOABDrPcBp3l0lcOLyJBHf-iSr','2019-03-28 09:43:11','2019-03-28 09:43:11','9eee2e73-42ab-4d74-8242-ead138f25adb'),
	(138,1,'sg4cHl57DmyOUssA91ojZRcRgrUDTnoYIEoQspgfH5zTdrDEabDz2qJ7tPu9TK7ShGvHCeqbqkPSzu2nfd8KJeHJ00gwHCGjDKXy','2019-03-28 20:14:51','2019-03-28 22:00:45','9b4d2c6e-e62b-4205-a4fb-cc660748de74'),
	(139,1,'ktv7-gfpcMS9nsrzGIEkX0WaBfFxQXgE27-tzfAVmB1gBPCpMHAOQ6CEkUnBVQGAK-Za7iAs_a_ogdgYvwhQAbbIovDX4KdPFR7z','2019-03-28 23:00:48','2019-03-28 23:00:48','1a70521a-2222-47a2-a6af-f36a5f563a7c'),
	(140,1,'2MCUzSoiuCHn4NrEkhad7mbaltO5D4AApuO9Jkx8HNcLbhWwX25MYRntG-qJllsI_-rf8jrV_JuTy8rmNQySz6EryHJkStt4O_yI','2019-03-28 23:18:09','2019-03-28 23:47:47','fedc74de-afb0-45cd-93f0-c69cfea4e1a3'),
	(141,1,'rJ-Dad_TtZePuKhtC36gbzQFamk54iuwYzZviOBsLu4FFFpKf6FkR2CIsg3i28e19mkhtM3oy61P5TRAkTQ5XnLrPHeKd4v8EvSb','2019-03-29 00:00:52','2019-03-29 00:00:52','ad62d443-ab89-43cd-a800-ca60f297cdf1'),
	(142,1,'4-n9GHbhcXCg7tRd0Bc-LaOEX1Hw63Vqvfs-h7VuUc74N2fP2lnsEWN0bu93saqTeDdqslEJDCcM1EsKjOGHGX3oufO8G3-Ef3Jh','2019-03-29 01:00:56','2019-03-29 01:00:56','89cb217f-aacc-44f7-9f4c-2ba48083f2f1'),
	(143,1,'vnRXPfTbb4MHGh7vdoydthxWZ6O6zi6EAeAYVLJLJVMb7B5g4R4f7JeE0pPolqkvz5U0OP6n-108oUCvuvr8H99XOlKVZpDm0qX4','2019-03-29 01:42:40','2019-03-29 01:42:40','584a610d-8299-4398-94a2-cf15369d8b61'),
	(144,1,'1ruzj_89chpFH9XfWPRkaFhbgGBBYpcDg3_3Z70tJQMQFn62lbiMZswxqexmMRzmWYJBQw9T7FCxmO1g3aJfY3N8Hw0DP9GT7cqq','2019-03-29 01:42:40','2019-03-29 01:42:40','17cf997e-314c-4225-a437-24c483d3fb81'),
	(145,1,'dnqehCF8ENBS2jAawEQLA_1FQb_IDP77o6x-HNuqE43sSUn0d_MehpDzPJ_NCaaQ36i7cOwBbO-PhR6-ImQVLueyOn3sjeCrRGk0','2019-03-29 01:42:40','2019-03-29 01:42:40','3a261337-b536-4f4e-809c-dbc4acb5d84e'),
	(146,1,'j0UJu3mJINwEVUC5E5ovHz2fs-3vI3ug75swi0VA_ra6IZgtL8lfOFC9hUYvcTf8_iFvWwiG5B1xlSzYqWHzMgJfrp2a1qvMuOdj','2019-04-01 10:01:42','2019-04-01 10:18:16','016d08f7-73be-4b72-9a1d-084d67e73ec8'),
	(147,1,'vXvX8RrGu_xS4I5-G87vgo3NaWy1g0jDeln-_xudWk31Lm-qsAg4LWbYDRaR4t-XF5ye7eMvz6h-PIyZvPs9PDN9XuZhfgyZkOHm','2019-04-01 15:25:51','2019-04-01 15:34:28','397d1ff3-2e48-4dc9-9d53-c13a2bf76a47'),
	(148,1,'NtLzt5K2gI8yTI4b9XLSemuwhOblvb73TSFP16b5_MG5A9ip_u1sv_on4bpwfqbcmsnxStWOSl8JylA2v_F_5ZU7EM-6MUYm4vME','2019-04-01 17:40:01','2019-04-01 17:40:17','3b2b044c-7778-49ff-8962-a93299e321a0'),
	(149,1,'RguXkIE87RC0P6diR7mxfZ6iYisXo9dusvXSIQbvbkbvGo7b6tscNc2Z4YiXfzGjVWMK_RpfKev1CUi04E4Tw_PkEyiHNZFSGpzY','2019-04-01 18:06:16','2019-04-01 18:06:16','a41ac632-9110-4ea5-9934-52511e8788d4'),
	(150,1,'pscxPOglZjH54hVigHvXbSq7P6SjtXrk5i-NNO5vmj-Ajg7vy1mktFLxamz955Tr7fWqOWDMYE32m8DoWzInQFcr0-fkscVj1pS2','2019-04-01 19:41:45','2019-04-01 19:42:50','29ffca10-952c-4aa1-9103-5f125e35cf94'),
	(151,1,'UcT1fiv8siyJFL-b510MwBjWaZDWnvCfrJDEtCm3ilrdkLpNrG3nKU3KsJ68L2lDldlp-k2yb0M7xWgZhMVYGy8K-ZenIRbrT1uk','2019-04-01 20:42:53','2019-04-01 20:42:53','370b9187-190b-4a9a-8826-dc9786b4a0f9'),
	(152,1,'EXL3oc63acgGwJSsNixR4b7Cuae4QDR7tXQM_sVrZwMbGVdMN8A6jkKGactUlwMo3O6FwiqjiwNxQMPE-4zW-tIQd1DHcw6reoJA','2019-04-04 08:53:59','2019-04-04 08:54:15','4e67eb8f-cb10-4b13-92bc-ddc1062f35d2'),
	(153,1,'glSmHWgnB81wgVhMDdqGFSyiVoamGDn5wAPBMbx4nMInUxHU7bfWyvOtFY5FUAmRXN8vqXhuoaLSjzbrX1tpwCLQZddWmAroFhyF','2019-04-04 10:05:52','2019-04-04 10:05:52','12a3eb0f-4575-4480-8f6d-76419b3d90e0'),
	(154,1,'I2QrPjKG8XMEjPHs8u5op-v5Kfv-FIhauKaqC1PofBWwUR6S9CIQSdCRJ5bEsFZ6KsxIV7uUipQyT5IGDcdlI4-hDv5_MXuYSNMI','2019-04-04 11:06:00','2019-04-04 11:06:00','0b6413d4-4e3a-4b7e-a23d-8ba27b6eda85'),
	(155,1,'Mnm34mlUbJic2FungeGM74YxTUZaC7RE7BTQgSNnhDQ3Fgk4tCEnklIJeNd4utmNYtvQnS-zbV3pcMdAXYCyCERwWAiM1i7uvC8j','2019-04-04 12:06:05','2019-04-04 12:06:05','972536da-f83b-4216-96f7-5deea937481d'),
	(156,1,'ypNWymnPapIMh9wHqU3b9-9-goCgCEioKYTAbx0WLvjl6Y5tA8USZA03pDckVyjk4q1doQo3Y8VviKqwv8ewJQq5vzsNWT-m6y2z','2019-04-04 22:27:22','2019-04-04 23:06:14','280c57bc-a491-4434-a22a-713391791f43'),
	(157,1,'pJriXgOnj9OVAcE5jXUj3HryPXf0MZ36ExzinHImhpp1GFc162EDUav1nNN98e9F4lrvRftB0FlDzDvcHFUQSbrp9uypAPXJXYou','2019-04-05 00:06:17','2019-04-05 00:06:17','d2492394-139c-4edd-a338-7dc032183d94'),
	(158,1,'rkZlWsu5lPklNpqh9G4z9WpDq8AfcpwqLCKqHRsx--ndmU1sz4OyZH06wiq0O6vdXGbPfht9aCvWrqkJdckXCX-eMb7hmZfxNJrZ','2019-04-05 00:40:14','2019-04-05 00:40:14','a8023aee-aab1-4a1e-b86c-1fdb3f9c2388'),
	(159,1,'Z1p6EYwtkWauXRTVsLdEVRZ9w8LrGMP78EaDmRjrKoF1033o0-N8VooeQF2TZaPW17GYqYgJanPg1IcvWRC6sspYZR8ogrwX1qLM','2019-04-05 19:20:03','2019-04-05 19:36:35','e34f7e3d-c2f9-4291-93f7-cb5c2663ff15'),
	(160,1,'wYVOfCkJ1ivu7jNhBMZVOO2aRoUU0t1mmJnztkSbe_OJZi4kDmkCsyFToLo16lbaanpo_UUDoE-5cK1LdJ79CJJrYaLQ3g3jhG7y','2019-04-05 19:44:28','2019-04-05 20:43:36','8a14ea67-2a84-4598-9868-a4133e097ab5'),
	(161,1,'mJCDKFFWQ8-8AVe23yunKsapEJCSzIdhPUPamuBfL76By0u5rN_sZLbhVqxulO2fmKnRD1YNNmIRJo5O-UJp0Yc69Dxe__YuQt0a','2019-04-08 11:44:08','2019-04-08 13:37:16','55093676-9c2b-4b38-8021-4e8ba9dc8d7f'),
	(162,1,'G0iBPklFb13V3vaZek0aCT3Fa4zNyx8qGxe64V7ez8PNKbJfn966Wf_S-padtQab9fv9iD9nYIevwNedeEetheAEa2y68c9P8JHd','2019-04-08 12:48:09','2019-04-08 13:27:03','53e0f40f-341b-480c-bcce-76776e71b3a9'),
	(163,1,'QflXSt1aDlRIIg3OhwnOGUiUoEHPSqiU9O-Fhx-6EG7UUnH_tSd9vi6l7UZckEB65_LIowaXPwxPhnZlLMFlCLSpCUQ4L5biWx_M','2019-04-08 13:37:16','2019-04-08 13:58:06','0f985e30-0a6b-4f69-a98c-8e06076f7461'),
	(164,1,'1i_Ug9gAXUYOT5VrYeTMDLfAkeAhInQM7Ujnt-j1yvpei9PbUhtl2AVOavktqRwHAlfTFRbDoHtRtqUvCLYVy19ZSc2Cmd0FW6dd','2019-04-08 23:12:27','2019-04-08 23:36:38','8a5cf9dc-fe4c-46fa-b564-bf28c9e9e3c3');

/*!40000 ALTER TABLE `craft_sessions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_shunnedmessages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_shunnedmessages`;

CREATE TABLE `craft_shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_shunnedmessages_userId_message_unq_idx` (`userId`,`message`),
  CONSTRAINT `craft_shunnedmessages_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table craft_sitegroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_sitegroups`;

CREATE TABLE `craft_sitegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_sitegroups_name_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_sitegroups` WRITE;
/*!40000 ALTER TABLE `craft_sitegroups` DISABLE KEYS */;

INSERT INTO `craft_sitegroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,'Alterna Haircare','2019-03-06 21:56:09','2019-03-06 21:56:09',NULL,'0d2dc1c3-ad92-41b2-b313-71922a5f34f2');

/*!40000 ALTER TABLE `craft_sitegroups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_sites`;

CREATE TABLE `craft_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_sites_dateDeleted_idx` (`dateDeleted`),
  KEY `craft_sites_handle_idx` (`handle`),
  KEY `craft_sites_sortOrder_idx` (`sortOrder`),
  KEY `craft_sites_groupId_fk` (`groupId`),
  CONSTRAINT `craft_sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_sites` WRITE;
/*!40000 ALTER TABLE `craft_sites` DISABLE KEYS */;

INSERT INTO `craft_sites` (`id`, `groupId`, `primary`, `name`, `handle`, `language`, `hasUrls`, `baseUrl`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,1,1,'Alterna Haircare','default','en-US',1,'$DEFAULT_SITE_URL',1,'2019-03-06 21:56:09','2019-03-06 21:56:09',NULL,'421204ef-a4d4-4b11-b60f-322ef3a7fe9e');

/*!40000 ALTER TABLE `craft_sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_structureelements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_structureelements`;

CREATE TABLE `craft_structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_structureelements_structureId_elementId_unq_idx` (`structureId`,`elementId`),
  KEY `craft_structureelements_root_idx` (`root`),
  KEY `craft_structureelements_lft_idx` (`lft`),
  KEY `craft_structureelements_rgt_idx` (`rgt`),
  KEY `craft_structureelements_level_idx` (`level`),
  KEY `craft_structureelements_elementId_idx` (`elementId`),
  CONSTRAINT `craft_structureelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_structureelements_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_structureelements` WRITE;
/*!40000 ALTER TABLE `craft_structureelements` DISABLE KEYS */;

INSERT INTO `craft_structureelements` (`id`, `structureId`, `elementId`, `root`, `lft`, `rgt`, `level`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,NULL,1,1,100,0,'2019-03-06 23:40:23','2019-04-08 23:20:07','6be27353-79e2-4f20-a447-cb708114a5f3'),
	(2,1,4,1,34,43,1,'2019-03-06 23:40:23','2019-04-08 23:20:07','32e1a5f1-2228-4b5c-8c1a-ae9bd867484c'),
	(4,1,7,1,35,36,2,'2019-03-06 23:57:51','2019-04-08 23:20:07','91382fc7-e14a-478e-8dbc-d592fbaa897e'),
	(5,1,10,1,37,38,2,'2019-03-07 00:13:37','2019-04-08 23:20:07','a9728513-0af0-417d-b453-5d6101279756'),
	(6,1,14,1,39,40,2,'2019-03-07 00:16:37','2019-04-08 23:20:07','fe31396d-4047-49b1-907f-1112c093e8ff'),
	(7,1,20,1,41,42,2,'2019-03-07 00:17:52','2019-04-08 23:20:07','165b227c-cdc1-4910-b732-e94afc6a361f'),
	(8,1,21,1,12,21,1,'2019-03-07 00:17:59','2019-04-08 23:20:07','aa18a788-8b4f-4acd-84db-2b36fb763561'),
	(9,1,22,1,13,14,2,'2019-03-07 00:18:46','2019-04-08 23:20:07','cbcfca97-1432-43ac-a656-91e476c5ec32'),
	(10,1,23,1,15,16,2,'2019-03-07 00:19:56','2019-04-08 23:20:07','20379b2a-bc61-4997-b922-9ddf98d0780a'),
	(11,1,26,1,4,11,1,'2019-03-12 22:25:53','2019-04-08 23:20:07','3ecd5128-ef31-4b05-9831-7bab1b7e3da8'),
	(12,1,27,1,5,6,2,'2019-03-12 22:26:26','2019-04-08 23:20:07','3d0cb827-feb5-47c4-a8bd-6eb3c01f46a2'),
	(13,1,95,1,22,27,1,'2019-03-14 17:51:13','2019-04-08 23:20:07','25e23941-799a-4eae-93b0-d2d109104ad2'),
	(14,1,96,1,23,24,2,'2019-03-14 19:12:07','2019-04-08 23:20:07','14ee441b-b64e-432a-80ba-6c1871f0c038'),
	(15,1,97,1,25,26,2,'2019-03-14 19:13:43','2019-04-08 23:20:07','3d7094e7-2e1c-4a32-b742-4436f871e9c0'),
	(16,1,98,1,28,33,1,'2019-03-14 19:13:55','2019-04-08 23:20:07','b44520ca-e92a-4ef8-bec4-1596c64a0865'),
	(17,1,99,1,29,30,2,'2019-03-14 19:23:28','2019-04-08 23:20:07','73ded73a-11aa-4f88-b160-c58ccc18c66b'),
	(18,1,100,1,31,32,2,'2019-03-14 19:26:49','2019-04-08 23:20:07','c917b51a-f9f4-401c-b000-1e2d1a58a3d7'),
	(19,1,101,1,44,49,1,'2019-03-14 19:29:49','2019-04-08 23:20:07','8b6482e0-4664-4e51-802a-edfe240aec7e'),
	(20,1,102,1,45,46,2,'2019-03-14 19:30:29','2019-04-08 23:20:07','a19c2d07-c470-4e7a-bccb-1158133cef55'),
	(21,1,103,1,47,48,2,'2019-03-14 19:31:34','2019-04-08 23:20:07','43ab891d-2b58-4605-9a02-26eab1e2fda9'),
	(22,1,104,1,50,63,1,'2019-03-14 19:32:05','2019-04-08 23:20:07','89571c0b-e835-4d6e-87d2-d2d01e1477d0'),
	(23,1,105,1,51,52,2,'2019-03-14 19:41:04','2019-04-08 23:20:07','9cf821b0-65a8-48d4-858a-43b5e1191d26'),
	(24,1,106,1,53,54,2,'2019-03-14 19:42:08','2019-04-08 23:20:07','6321b85d-2ad2-4456-8898-7089095f9531'),
	(25,1,107,1,55,56,2,'2019-03-14 19:43:08','2019-04-08 23:20:07','ad353baf-9ded-4277-807e-4a98c32282e2'),
	(26,1,108,1,57,58,2,'2019-03-14 19:44:01','2019-04-08 23:20:07','c6fba722-6be0-408a-a0d1-f72e5bde78ce'),
	(27,1,109,1,59,60,2,'2019-03-14 19:44:51','2019-04-08 23:20:07','29f63a36-c656-4a36-9173-be6356ba1c6c'),
	(28,1,110,1,61,62,2,'2019-03-14 19:46:09','2019-04-08 23:20:07','3d51aa38-d139-415e-8fb8-50e34082d700'),
	(29,1,111,1,64,69,1,'2019-03-14 19:46:48','2019-04-08 23:20:07','19db5545-e19b-44cc-a26f-7b483dc60fc8'),
	(30,1,112,1,65,66,2,'2019-03-14 19:47:33','2019-04-08 23:20:07','286eb06b-c24c-4e8d-877f-d3bb99513c0a'),
	(31,1,113,1,67,68,2,'2019-03-14 19:48:16','2019-04-08 23:20:07','678ae016-5a77-4153-8957-8c34e03a38c1'),
	(32,1,114,1,70,79,1,'2019-03-14 19:48:30','2019-04-08 23:20:07','7a18a947-3a51-4e31-9c09-d58607f7bcda'),
	(33,1,115,1,71,72,2,'2019-03-14 19:49:37','2019-04-08 23:20:07','b2c3a71e-e111-4fa3-9784-450c9411cfb3'),
	(34,1,116,1,73,74,2,'2019-03-14 19:50:16','2019-04-08 23:20:07','925f29b6-ef68-40c7-b175-904852bccd9e'),
	(35,1,117,1,75,76,2,'2019-03-14 19:55:34','2019-04-08 23:20:07','d3d12065-9f79-4070-b0b9-5bdc8cc6848f'),
	(36,1,118,1,77,78,2,'2019-03-14 19:56:26','2019-04-08 23:20:07','2780ed24-d122-4a75-8f17-8b4a5d2fb9e4'),
	(37,1,119,1,80,93,1,'2019-03-14 19:56:50','2019-04-08 23:20:07','989c873b-d583-4270-a35c-2a0100c9ccde'),
	(38,1,120,1,81,82,2,'2019-03-14 20:00:59','2019-04-08 23:20:07','eaa2889f-ffe2-48eb-ad8c-4c967c714ab9'),
	(39,1,121,1,83,84,2,'2019-03-14 20:02:09','2019-04-08 23:20:07','51d046a3-fe04-420f-bcae-aab79f09b170'),
	(40,1,122,1,85,86,2,'2019-03-14 20:08:23','2019-04-08 23:20:07','dc8244ff-dec8-49b8-8bc9-dbbff8117d2e'),
	(41,1,123,1,87,88,2,'2019-03-14 20:10:28','2019-04-08 23:20:07','14290efc-fb7b-4030-9534-15a652859b67'),
	(42,1,124,1,89,90,2,'2019-03-14 20:11:31','2019-04-08 23:20:07','8710bf17-b0b3-4bbf-8684-507c58164fc8'),
	(43,1,125,1,91,92,2,'2019-03-14 20:14:02','2019-04-08 23:20:07','8c0d06cc-0fdd-4d8b-a2e8-405f54ff9ee3'),
	(44,1,129,1,94,99,1,'2019-03-14 20:16:32','2019-04-08 23:20:07','863b3506-5f8e-4df1-8d06-a6607d48343b'),
	(45,1,130,1,95,96,2,'2019-03-14 20:17:48','2019-04-08 23:20:07','8eb674a0-127a-499c-8900-38d963453e3c'),
	(46,1,131,1,97,98,2,'2019-03-14 20:18:57','2019-04-08 23:20:07','53778ce0-9f25-450c-8442-b1e929152fbf'),
	(47,1,132,1,9,10,2,'2019-03-14 20:23:24','2019-04-08 23:20:07','3195fc21-bec7-434f-b634-8ff549e0b493'),
	(48,1,138,1,7,8,2,'2019-03-18 18:22:58','2019-04-08 23:20:07','8b7b7b86-cb50-49c0-ac75-a0235536dbe5'),
	(49,1,151,1,17,18,2,'2019-03-28 23:42:39','2019-04-08 23:20:07','02c6c8db-6fe4-40c5-b5f6-8e8a54aebe78'),
	(50,1,166,1,19,20,2,'2019-04-05 20:07:48','2019-04-08 23:20:07','1d7896a0-6d8b-4b48-aab7-a47e6e0f1a40'),
	(51,1,168,1,2,3,1,'2019-04-08 23:19:10','2019-04-08 23:20:07','e6f01234-6bbf-4e4b-bf7c-301c1a827177');

/*!40000 ALTER TABLE `craft_structureelements` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_structures
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_structures`;

CREATE TABLE `craft_structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_structures_dateDeleted_idx` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_structures` WRITE;
/*!40000 ALTER TABLE `craft_structures` DISABLE KEYS */;

INSERT INTO `craft_structures` (`id`, `maxLevels`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,2,'2019-03-06 23:37:20','2019-04-08 23:18:20',NULL,'013a5b17-3769-49f8-8be7-5ca05e79d376');

/*!40000 ALTER TABLE `craft_structures` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_systemmessages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_systemmessages`;

CREATE TABLE `craft_systemmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_systemmessages_key_language_unq_idx` (`key`,`language`),
  KEY `craft_systemmessages_language_idx` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table craft_taggroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_taggroups`;

CREATE TABLE `craft_taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_taggroups_name_idx` (`name`),
  KEY `craft_taggroups_handle_idx` (`handle`),
  KEY `craft_taggroups_dateDeleted_idx` (`dateDeleted`),
  KEY `craft_taggroups_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_taggroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table craft_tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_tags`;

CREATE TABLE `craft_tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_tags_groupId_idx` (`groupId`),
  CONSTRAINT `craft_tags_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_tags_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table craft_templatecacheelements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_templatecacheelements`;

CREATE TABLE `craft_templatecacheelements` (
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  KEY `craft_templatecacheelements_cacheId_idx` (`cacheId`),
  KEY `craft_templatecacheelements_elementId_idx` (`elementId`),
  CONSTRAINT `craft_templatecacheelements_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `craft_templatecaches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_templatecacheelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table craft_templatecachequeries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_templatecachequeries`;

CREATE TABLE `craft_templatecachequeries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `query` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `craft_templatecachequeries_cacheId_idx` (`cacheId`),
  KEY `craft_templatecachequeries_type_idx` (`type`),
  CONSTRAINT `craft_templatecachequeries_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `craft_templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table craft_templatecaches
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_templatecaches`;

CREATE TABLE `craft_templatecaches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `craft_templatecaches_cacheKey_siteId_expiryDate_path_idx` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  KEY `craft_templatecaches_cacheKey_siteId_expiryDate_idx` (`cacheKey`,`siteId`,`expiryDate`),
  KEY `craft_templatecaches_siteId_idx` (`siteId`),
  CONSTRAINT `craft_templatecaches_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table craft_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_tokens`;

CREATE TABLE `craft_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_tokens_token_unq_idx` (`token`),
  KEY `craft_tokens_expiryDate_idx` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table craft_usergroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_usergroups`;

CREATE TABLE `craft_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_usergroups_handle_unq_idx` (`handle`),
  UNIQUE KEY `craft_usergroups_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table craft_usergroups_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_usergroups_users`;

CREATE TABLE `craft_usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_usergroups_users_groupId_userId_unq_idx` (`groupId`,`userId`),
  KEY `craft_usergroups_users_userId_idx` (`userId`),
  CONSTRAINT `craft_usergroups_users_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_usergroups_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table craft_userpermissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_userpermissions`;

CREATE TABLE `craft_userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_userpermissions_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table craft_userpermissions_usergroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_userpermissions_usergroups`;

CREATE TABLE `craft_userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_userpermissions_usergroups_permissionId_groupId_unq_idx` (`permissionId`,`groupId`),
  KEY `craft_userpermissions_usergroups_groupId_idx` (`groupId`),
  CONSTRAINT `craft_userpermissions_usergroups_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_userpermissions_usergroups_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `craft_userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table craft_userpermissions_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_userpermissions_users`;

CREATE TABLE `craft_userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_userpermissions_users_permissionId_userId_unq_idx` (`permissionId`,`userId`),
  KEY `craft_userpermissions_users_userId_idx` (`userId`),
  CONSTRAINT `craft_userpermissions_users_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `craft_userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_userpermissions_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table craft_userpreferences
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_userpreferences`;

CREATE TABLE `craft_userpreferences` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `preferences` text,
  PRIMARY KEY (`userId`),
  CONSTRAINT `craft_userpreferences_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_userpreferences` WRITE;
/*!40000 ALTER TABLE `craft_userpreferences` DISABLE KEYS */;

INSERT INTO `craft_userpreferences` (`userId`, `preferences`)
VALUES
	(1,'{\"language\":\"en-US\"}');

/*!40000 ALTER TABLE `craft_userpreferences` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_users`;

CREATE TABLE `craft_users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_users_uid_idx` (`uid`),
  KEY `craft_users_verificationCode_idx` (`verificationCode`),
  KEY `craft_users_email_idx` (`email`),
  KEY `craft_users_username_idx` (`username`),
  KEY `craft_users_photoId_fk` (`photoId`),
  CONSTRAINT `craft_users_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_users_photoId_fk` FOREIGN KEY (`photoId`) REFERENCES `craft_assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_users` WRITE;
/*!40000 ALTER TABLE `craft_users` DISABLE KEYS */;

INSERT INTO `craft_users` (`id`, `username`, `photoId`, `firstName`, `lastName`, `email`, `password`, `admin`, `locked`, `suspended`, `pending`, `lastLoginDate`, `lastLoginAttemptIp`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `hasDashboard`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'Skyrocket',NULL,NULL,NULL,'dev@skyrocket.is','$2y$13$i6j/SHq.2i08OK498sM00evg8sJoZxnjo4GpZZ/Di/QzDrRXuEm.O',1,0,0,0,'2019-04-08 23:12:27',NULL,NULL,NULL,'2019-04-08 23:12:01',NULL,1,NULL,NULL,NULL,0,'2019-03-06 21:56:10','2019-03-06 21:56:10','2019-04-08 23:12:27','239c338e-6fdf-48a7-88ac-ce5aa96cd063');

/*!40000 ALTER TABLE `craft_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_volumefolders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_volumefolders`;

CREATE TABLE `craft_volumefolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_volumefolders_name_parentId_volumeId_unq_idx` (`name`,`parentId`,`volumeId`),
  KEY `craft_volumefolders_parentId_idx` (`parentId`),
  KEY `craft_volumefolders_volumeId_idx` (`volumeId`),
  CONSTRAINT `craft_volumefolders_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `craft_volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_volumefolders_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `craft_volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_volumefolders` WRITE;
/*!40000 ALTER TABLE `craft_volumefolders` DISABLE KEYS */;

INSERT INTO `craft_volumefolders` (`id`, `parentId`, `volumeId`, `name`, `path`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,NULL,1,'S3','','2019-03-06 23:08:35','2019-03-06 23:08:35','45209592-fc53-4c90-b041-b43f2830de91'),
	(2,NULL,NULL,'Temporary source',NULL,'2019-03-06 23:33:10','2019-03-06 23:33:10','63038af0-0058-477f-85eb-ed1486bc83af'),
	(3,2,NULL,'user_1','user_1/','2019-03-06 23:33:10','2019-03-06 23:33:10','e1c7e1a8-29be-46b7-a9b9-f9b9f9e24590');

/*!40000 ALTER TABLE `craft_volumefolders` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_volumes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_volumes`;

CREATE TABLE `craft_volumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `url` varchar(255) DEFAULT NULL,
  `settings` text,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_volumes_name_idx` (`name`),
  KEY `craft_volumes_handle_idx` (`handle`),
  KEY `craft_volumes_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `craft_volumes_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `craft_volumes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_volumes` WRITE;
/*!40000 ALTER TABLE `craft_volumes` DISABLE KEYS */;

INSERT INTO `craft_volumes` (`id`, `fieldLayoutId`, `name`, `handle`, `type`, `hasUrls`, `url`, `settings`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,NULL,'S3','s3','craft\\awss3\\Volume',1,'https://s3.us-east-1.amazonaws.com/alterna-craft-public-storage/','{\"autoFocalPoint\":\"\",\"bucket\":\"alterna-craft-public-storage\",\"bucketSelectionMode\":\"choose\",\"cfDistributionId\":\"\",\"cfPrefix\":\"\",\"expires\":\"\",\"keyId\":\"AKIAINYT6O4Y7FP3IDWA\",\"region\":\"us-east-1\",\"secret\":\"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\",\"storageClass\":\"\",\"subfolder\":\"haircare/\"}',1,'2019-03-06 23:08:35','2019-03-06 23:08:35',NULL,'d067482b-b20a-44ab-9911-d8f0364fa01b');

/*!40000 ALTER TABLE `craft_volumes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_widgets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_widgets`;

CREATE TABLE `craft_widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_widgets_userId_idx` (`userId`),
  CONSTRAINT `craft_widgets_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_widgets` WRITE;
/*!40000 ALTER TABLE `craft_widgets` DISABLE KEYS */;

INSERT INTO `craft_widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"section\":\"*\",\"siteId\":\"1\",\"limit\":10}',1,'2019-03-06 21:56:11','2019-03-06 21:56:11','f0a0fce4-db2b-4522-9006-0f7d66540b08'),
	(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2019-03-06 21:56:11','2019-03-06 21:56:11','3f951172-9802-4961-8049-59edddd94092'),
	(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2019-03-06 21:56:11','2019-03-06 21:56:11','661255c7-3830-4fca-b01f-ade0ec1d11fe'),
	(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2019-03-06 21:56:11','2019-03-06 21:56:11','be86f17a-c68e-456c-8aff-a7aaee5e54f6');

/*!40000 ALTER TABLE `craft_widgets` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

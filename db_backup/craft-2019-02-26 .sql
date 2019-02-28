# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: db.alterna.docker (MySQL 5.5.5-10.3.10-MariaDB-1:10.3.10+maria~bionic)
# Database: craft
# Generation Time: 2019-02-27 00:36:14 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
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
  `uri` text DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT 0,
  `completed` tinyint(1) DEFAULT 0,
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
  `fileExists` tinyint(1) NOT NULL DEFAULT 0,
  `inProgress` tinyint(1) NOT NULL DEFAULT 0,
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_assettransformindex_volumeId_assetId_location_idx` (`volumeId`,`assetId`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



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
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text DEFAULT NULL,
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
  `field_body` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_content_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `craft_content_siteId_idx` (`siteId`),
  KEY `craft_content_title_idx` (`title`),
  CONSTRAINT `craft_content_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_content_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_content` WRITE;
/*!40000 ALTER TABLE `craft_content` DISABLE KEYS */;

INSERT INTO `craft_content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_body`)
VALUES
	(1,1,1,NULL,'2019-02-22 19:07:01','2019-02-22 19:07:01','2d09c060-8130-4e1f-bd47-a81f13b9b3ec',NULL),
	(2,2,1,'Homepage','2019-02-22 19:53:57','2019-02-25 22:11:13','4e89ea7d-2e79-4385-a4b8-3ab005515a50','HI'),
	(3,3,1,'Homepage1','2019-02-25 21:42:59','2019-02-25 21:46:57','cd240f78-13e9-40b6-b584-40006d09a644',NULL);

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

LOCK TABLES `craft_craftidtokens` WRITE;
/*!40000 ALTER TABLE `craft_craftidtokens` DISABLE KEYS */;

INSERT INTO `craft_craftidtokens` (`id`, `userId`, `accessToken`, `expiryDate`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjZkNzdlOTdhMzAzN2YxMzhjNWU1NGJjYmVlYTQ1MjYyZjdjZmY1NDgxNTQ0MjIyNDdiOWI0NDAxOGFjMjMzZTlmNmRhOGJmODYxZDMxMWFlIn0.eyJhdWQiOiI2RHZFcmE3ZXFSS0xZaWM5Zm92eUQyRldGall4UndabiIsImp0aSI6IjZkNzdlOTdhMzAzN2YxMzhjNWU1NGJjYmVlYTQ1MjYyZjdjZmY1NDgxNTQ0MjIyNDdiOWI0NDAxOGFjMjMzZTlmNmRhOGJmODYxZDMxMWFlIiwiaWF0IjoxNTUwODY0NzY2LCJuYmYiOjE1NTA4NjQ3NjYsImV4cCI6MTU1MzQ1MzE2Niwic3ViIjoiMTE0NzQyIiwic2NvcGVzIjpbInB1cmNoYXNlUGx1Z2lucyIsImV4aXN0aW5nUGx1Z2lucyIsInRyYW5zZmVyUGx1Z2luTGljZW5zZSIsImRlYXNzb2NpYXRlUGx1Z2luTGljZW5zZSJdfQ.VO4Uhc44e8ok6aCH93rkqjUpXzZmk3un3Z-T3HMJLD6z_mSFmBztP7SndyD26gNnIbh8VsSeCq4SHAhmJU-VDvYrbH_6fKyzUTQhjstgEFtD__UwvEFr-H9kxEbXJgVhGMyPMtLt0b6uyt4zcJT0Az7z9aqgiEvLWnq3DcjIkww','2019-03-24 17:46:07','2019-02-22 19:46:07','2019-02-22 19:46:07','0895bbe3-a516-407f-8cf9-d149ff95952c');

/*!40000 ALTER TABLE `craft_craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;


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
  `traces` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_deprecationerrors_key_fingerprint_unq_idx` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_deprecationerrors` WRITE;
/*!40000 ALTER TABLE `craft_deprecationerrors` DISABLE KEYS */;

INSERT INTO `craft_deprecationerrors` (`id`, `key`, `fingerprint`, `lastOccurrence`, `file`, `line`, `message`, `traces`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(894,'craft.i18n.getCurrentLocale()','/usr/share/nginx/templates/layout/skeleton/base.twig:2','2019-02-27 00:24:37','/usr/share/nginx/templates/layout/skeleton/base.twig',2,'craft.i18n.getCurrentLocale() has been deprecated. Use craft.app.locale instead.','[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/usr/share/nginx/vendor/craftcms/cms/src/web/twig/variables/I18N.php\",\"line\":56,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"craft.i18n.getCurrentLocale()\\\", \\\"craft.i18n.getCurrentLocale() has been deprecated. Use craft.app...\\\"\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\variables\\\\I18N\",\"file\":\"/usr/share/nginx/vendor/twig/twig/lib/Twig/Extension/Core.php\",\"line\":1626,\"class\":\"craft\\\\web\\\\twig\\\\variables\\\\I18N\",\"method\":\"getCurrentLocale\",\"args\":null},{\"objectClass\":null,\"file\":\"/usr/share/nginx/vendor/craftcms/cms/src/helpers/Template.php\",\"line\":73,\"class\":null,\"method\":\"twig_get_attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig_Source, craft\\\\web\\\\twig\\\\variables\\\\I18N, \\\"getCurrentLocale\\\", ...\"},{\"objectClass\":null,\"file\":\"/usr/share/nginx/storage/runtime/compiled_templates/30/30484825f901d9c685012d33a83465a4a3af01287c52e3c3c6f14dc23b508fbd.php\",\"line\":30,\"class\":\"craft\\\\helpers\\\\Template\",\"method\":\"attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig_Source, craft\\\\web\\\\twig\\\\variables\\\\I18N, \\\"getCurrentLocale\\\", ...\"},{\"objectClass\":\"__TwigTemplate_47ebc3a7374188548ff94f7884e6e80fa5d348703e2efcb06e0fb8c8745bccf7\",\"file\":\"/usr/share/nginx/vendor/twig/twig/lib/Twig/Template.php\",\"line\":386,\"class\":\"__TwigTemplate_47ebc3a7374188548ff94f7884e6e80fa5d348703e2efcb06e0fb8c8745bccf7\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"headerScripts\\\" => [__TwigTemplate_47ebc3a7374188548ff94f7884e6e80fa5d348703e2efcb06e0fb8c8745bccf7, \\\"block_headerScripts\\\"], \\\"bodyScripts\\\" => [__TwigTemplate_47ebc3a7374188548ff94f7884e6e80fa5d348703e2efcb06e0fb8c8745bccf7, \\\"block_bodyScripts\\\"], \\\"bodyContent\\\" => [__TwigTemplate_a1f3d59f659feb1291cd05f4bf86dac6c188eef227de9e7f2f074649f929d330, \\\"block_bodyContent\\\"], \\\"footerScripts\\\" => [__TwigTemplate_47ebc3a7374188548ff94f7884e6e80fa5d348703e2efcb06e0fb8c8745bccf7, \\\"block_footerScripts\\\"], ...]\"},{\"objectClass\":\"__TwigTemplate_47ebc3a7374188548ff94f7884e6e80fa5d348703e2efcb06e0fb8c8745bccf7\",\"file\":\"/usr/share/nginx/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"headerScripts\\\" => [__TwigTemplate_47ebc3a7374188548ff94f7884e6e80fa5d348703e2efcb06e0fb8c8745bccf7, \\\"block_headerScripts\\\"], \\\"bodyScripts\\\" => [__TwigTemplate_47ebc3a7374188548ff94f7884e6e80fa5d348703e2efcb06e0fb8c8745bccf7, \\\"block_bodyScripts\\\"], \\\"bodyContent\\\" => [__TwigTemplate_a1f3d59f659feb1291cd05f4bf86dac6c188eef227de9e7f2f074649f929d330, \\\"block_bodyContent\\\"], \\\"footerScripts\\\" => [__TwigTemplate_47ebc3a7374188548ff94f7884e6e80fa5d348703e2efcb06e0fb8c8745bccf7, \\\"block_footerScripts\\\"], ...]\"},{\"objectClass\":\"__TwigTemplate_47ebc3a7374188548ff94f7884e6e80fa5d348703e2efcb06e0fb8c8745bccf7\",\"file\":\"/usr/share/nginx/vendor/twig/twig/lib/Twig/Template.php\",\"line\":363,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"headerScripts\\\" => [__TwigTemplate_47ebc3a7374188548ff94f7884e6e80fa5d348703e2efcb06e0fb8c8745bccf7, \\\"block_headerScripts\\\"], \\\"bodyScripts\\\" => [__TwigTemplate_47ebc3a7374188548ff94f7884e6e80fa5d348703e2efcb06e0fb8c8745bccf7, \\\"block_bodyScripts\\\"], \\\"bodyContent\\\" => [__TwigTemplate_a1f3d59f659feb1291cd05f4bf86dac6c188eef227de9e7f2f074649f929d330, \\\"block_bodyContent\\\"], \\\"footerScripts\\\" => [__TwigTemplate_47ebc3a7374188548ff94f7884e6e80fa5d348703e2efcb06e0fb8c8745bccf7, \\\"block_footerScripts\\\"], ...]\"},{\"objectClass\":\"__TwigTemplate_47ebc3a7374188548ff94f7884e6e80fa5d348703e2efcb06e0fb8c8745bccf7\",\"file\":\"/usr/share/nginx/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"bodyContent\\\" => [__TwigTemplate_a1f3d59f659feb1291cd05f4bf86dac6c188eef227de9e7f2f074649f929d330, \\\"block_bodyContent\\\"], \\\"content\\\" => [__TwigTemplate_530c6cb044b227ec4d758a3b93a16408e52eca303b885d38c353556bb730b8e0, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_47ebc3a7374188548ff94f7884e6e80fa5d348703e2efcb06e0fb8c8745bccf7\",\"file\":\"/usr/share/nginx/storage/runtime/compiled_templates/c9/c95f1e6064a2884cf1cb6cd85d8db5c59b472c578fb59028f19518bcfb1278ca.php\",\"line\":29,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"bodyContent\\\" => [__TwigTemplate_a1f3d59f659feb1291cd05f4bf86dac6c188eef227de9e7f2f074649f929d330, \\\"block_bodyContent\\\"], \\\"content\\\" => [__TwigTemplate_530c6cb044b227ec4d758a3b93a16408e52eca303b885d38c353556bb730b8e0, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_a1f3d59f659feb1291cd05f4bf86dac6c188eef227de9e7f2f074649f929d330\",\"file\":\"/usr/share/nginx/vendor/twig/twig/lib/Twig/Template.php\",\"line\":386,\"class\":\"__TwigTemplate_a1f3d59f659feb1291cd05f4bf86dac6c188eef227de9e7f2f074649f929d330\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"bodyContent\\\" => [__TwigTemplate_a1f3d59f659feb1291cd05f4bf86dac6c188eef227de9e7f2f074649f929d330, \\\"block_bodyContent\\\"], \\\"content\\\" => [__TwigTemplate_530c6cb044b227ec4d758a3b93a16408e52eca303b885d38c353556bb730b8e0, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_a1f3d59f659feb1291cd05f4bf86dac6c188eef227de9e7f2f074649f929d330\",\"file\":\"/usr/share/nginx/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"bodyContent\\\" => [__TwigTemplate_a1f3d59f659feb1291cd05f4bf86dac6c188eef227de9e7f2f074649f929d330, \\\"block_bodyContent\\\"], \\\"content\\\" => [__TwigTemplate_530c6cb044b227ec4d758a3b93a16408e52eca303b885d38c353556bb730b8e0, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_a1f3d59f659feb1291cd05f4bf86dac6c188eef227de9e7f2f074649f929d330\",\"file\":\"/usr/share/nginx/vendor/twig/twig/lib/Twig/Template.php\",\"line\":363,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"bodyContent\\\" => [__TwigTemplate_a1f3d59f659feb1291cd05f4bf86dac6c188eef227de9e7f2f074649f929d330, \\\"block_bodyContent\\\"], \\\"content\\\" => [__TwigTemplate_530c6cb044b227ec4d758a3b93a16408e52eca303b885d38c353556bb730b8e0, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_a1f3d59f659feb1291cd05f4bf86dac6c188eef227de9e7f2f074649f929d330\",\"file\":\"/usr/share/nginx/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_530c6cb044b227ec4d758a3b93a16408e52eca303b885d38c353556bb730b8e0, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_a1f3d59f659feb1291cd05f4bf86dac6c188eef227de9e7f2f074649f929d330\",\"file\":\"/usr/share/nginx/storage/runtime/compiled_templates/91/91a2c9e4b5fb4780cebce4d0750d1540ddf61c8c42b4a8c76e82f7ff052d50cd.php\",\"line\":28,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_530c6cb044b227ec4d758a3b93a16408e52eca303b885d38c353556bb730b8e0, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_530c6cb044b227ec4d758a3b93a16408e52eca303b885d38c353556bb730b8e0\",\"file\":\"/usr/share/nginx/vendor/twig/twig/lib/Twig/Template.php\",\"line\":386,\"class\":\"__TwigTemplate_530c6cb044b227ec4d758a3b93a16408e52eca303b885d38c353556bb730b8e0\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_530c6cb044b227ec4d758a3b93a16408e52eca303b885d38c353556bb730b8e0, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_530c6cb044b227ec4d758a3b93a16408e52eca303b885d38c353556bb730b8e0\",\"file\":\"/usr/share/nginx/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_530c6cb044b227ec4d758a3b93a16408e52eca303b885d38c353556bb730b8e0, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_530c6cb044b227ec4d758a3b93a16408e52eca303b885d38c353556bb730b8e0\",\"file\":\"/usr/share/nginx/vendor/twig/twig/lib/Twig/Template.php\",\"line\":363,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_530c6cb044b227ec4d758a3b93a16408e52eca303b885d38c353556bb730b8e0, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_530c6cb044b227ec4d758a3b93a16408e52eca303b885d38c353556bb730b8e0\",\"file\":\"/usr/share/nginx/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"__TwigTemplate_530c6cb044b227ec4d758a3b93a16408e52eca303b885d38c353556bb730b8e0\",\"file\":\"/usr/share/nginx/vendor/twig/twig/lib/Twig/Template.php\",\"line\":371,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_530c6cb044b227ec4d758a3b93a16408e52eca303b885d38c353556bb730b8e0\",\"file\":\"/usr/share/nginx/vendor/twig/twig/lib/Twig/Environment.php\",\"line\":289,\"class\":\"Twig_Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/usr/share/nginx/vendor/craftcms/cms/src/web/View.php\",\"line\":337,\"class\":\"Twig_Environment\",\"method\":\"render\",\"args\":\"\\\"pages/homepage\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/usr/share/nginx/vendor/craftcms/cms/src/web/View.php\",\"line\":384,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"pages/homepage\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/usr/share/nginx/vendor/craftcms/cms/src/web/Controller.php\",\"line\":161,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"pages/homepage\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/usr/share/nginx/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":78,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"pages/homepage\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"pages/homepage\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/usr/share/nginx/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"pages/homepage\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/usr/share/nginx/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"pages/homepage\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/usr/share/nginx/vendor/craftcms/cms/src/web/Controller.php\",\"line\":109,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"pages/homepage\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/usr/share/nginx/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"pages/homepage\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/usr/share/nginx/vendor/craftcms/cms/src/web/Application.php\",\"line\":297,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"pages/homepage\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/usr/share/nginx/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"pages/homepage\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/usr/share/nginx/vendor/craftcms/cms/src/web/Application.php\",\"line\":286,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/usr/share/nginx/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/usr/share/nginx/web/index.php\",\"line\":21,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]','2019-02-27 00:24:37','2019-02-27 00:24:37','53c96d83-1650-411d-a96d-b10aed6d70b8');

/*!40000 ALTER TABLE `craft_deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_elementindexsettings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_elementindexsettings`;

CREATE TABLE `craft_elementindexsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `settings` text DEFAULT NULL,
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
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `archived` tinyint(1) NOT NULL DEFAULT 0,
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
	(1,NULL,'craft\\elements\\User',1,0,'2019-02-22 19:07:01','2019-02-22 19:07:01',NULL,'a5c1d965-f6b3-4e4f-b481-1979fcfd256a'),
	(2,1,'craft\\elements\\Entry',1,0,'2019-02-22 19:53:57','2019-02-25 22:11:13',NULL,'9fdef46f-e21c-40c5-b50e-3204a7c5e6ef'),
	(3,2,'craft\\elements\\Entry',1,0,'2019-02-25 21:42:59','2019-02-25 21:46:57',NULL,'04464bd7-2188-4cf2-99e7-a6567d849e09');

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
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
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
	(1,1,1,NULL,NULL,1,'2019-02-22 19:07:01','2019-02-22 19:07:01','d5c16514-3ec7-4741-a9f5-e4814c3ef17a'),
	(2,2,1,'homepage','__home__',1,'2019-02-22 19:53:57','2019-02-25 22:11:13','d60f6daf-dc62-4813-a662-73873895bffa'),
	(3,3,1,'homepage1','homepage1',1,'2019-02-25 21:42:59','2019-02-25 21:46:57','51327cdc-8c11-4782-baad-7618d37c8196');

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
	(2,1,NULL,1,NULL,'2019-02-22 19:53:00',NULL,NULL,'2019-02-22 19:53:57','2019-02-25 22:11:13','666c436c-da29-427a-91c4-a1abe622c32a'),
	(3,2,NULL,2,NULL,'2019-02-25 21:42:00',NULL,NULL,'2019-02-25 21:42:59','2019-02-25 21:46:57','e4755907-bfa7-4b85-9082-a2210643c3cb');

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
  `notes` text DEFAULT NULL,
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
  `hasTitleField` tinyint(1) NOT NULL DEFAULT 1,
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
	(1,1,1,'Homepage','homepage',0,'','{section.name|raw}',1,'2019-02-22 19:53:57','2019-02-22 21:26:56',NULL,'c51dbdf7-c851-4cee-b034-86d33d1cb87e'),
	(2,2,2,'Homepage1','homepage1',0,'','{section.name|raw}',1,'2019-02-25 21:42:59','2019-02-25 21:43:36',NULL,'184c17a8-0677-474d-8649-9a2002d6445b');

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
  `notes` text DEFAULT NULL,
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
	(1,2,1,1,1,1,'Revision from Feb 22, 2019, 1:26:57 PM','{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Homepage\",\"slug\":\"homepage\",\"postDate\":1550865180,\"expiryDate\":null,\"enabled\":\"1\",\"newParentId\":null,\"fields\":[]}','2019-02-22 21:27:02','2019-02-22 21:27:02','0ddf3a64-0c5d-4dc2-963b-2b2f042cf9c9'),
	(2,2,1,1,1,2,'','{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Homepage\",\"slug\":\"homepage\",\"postDate\":1550865180,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"1\":\"HI\"}}','2019-02-22 21:27:02','2019-02-22 21:27:02','42de63b6-5ae0-46bf-933f-49a1f67e28d4');

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
	(1,'Common','2019-02-22 19:07:01','2019-02-22 19:07:01','6e892c00-1390-4088-8817-b3fa569002a9');

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
  `required` tinyint(1) NOT NULL DEFAULT 0,
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
	(1,1,1,1,0,1,'2019-02-22 21:26:56','2019-02-22 21:26:56','17cb7a3e-c123-45d4-954d-1a398cb2b7bd'),
	(2,2,2,1,0,1,'2019-02-25 21:43:36','2019-02-25 21:43:36','e847f7f6-3935-4cb5-9b4c-85e6f6d9ce12');

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
	(1,'craft\\elements\\Entry','2019-02-22 21:26:56','2019-02-22 21:26:56',NULL,'dc4e1a38-046e-42f6-ab20-fc4646f9d63e'),
	(2,'craft\\elements\\Entry','2019-02-25 21:43:36','2019-02-25 21:43:36',NULL,'4f019e31-4388-4c89-8377-a172c89e4ffb');

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
	(1,1,'Tab 1',1,'2019-02-22 21:26:56','2019-02-22 21:26:56','ec15c889-62a7-4051-a813-e3cacbcff0fe'),
	(2,2,'Tab 1',1,'2019-02-25 21:43:36','2019-02-25 21:43:36','0f06fbc3-8997-4f78-b6d1-dfcab6165072');

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
  `instructions` text DEFAULT NULL,
  `searchable` tinyint(1) NOT NULL DEFAULT 1,
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `settings` text DEFAULT NULL,
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
	(1,1,'Body','body','global','',1,'none',NULL,'craft\\fields\\PlainText','{\"charLimit\":\"\",\"code\":\"\",\"columnType\":\"text\",\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\"}','2019-02-22 21:26:42','2019-02-22 21:26:42','c4f0f90a-c2d5-4a3b-8b2c-4ae93e7cf9de');

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



# Dump of table craft_info
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_info`;

CREATE TABLE `craft_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT 0,
  `config` mediumtext DEFAULT NULL,
  `configMap` mediumtext DEFAULT NULL,
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
	(1,'3.1.14','3.1.25',0,'a:10:{s:12:\"dateModified\";i:1551227142;s:5:\"email\";a:3:{s:9:\"fromEmail\";s:16:\"dev@skyrocket.is\";s:8:\"fromName\";s:16:\"Alterna Haircare\";s:13:\"transportType\";s:37:\"craft\\mail\\transportadapters\\Sendmail\";}s:11:\"fieldGroups\";a:1:{s:36:\"6e892c00-1390-4088-8817-b3fa569002a9\";a:1:{s:4:\"name\";s:6:\"Common\";}}s:6:\"fields\";a:1:{s:36:\"c4f0f90a-c2d5-4a3b-8b2c-4ae93e7cf9de\";a:10:{s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";s:36:\"6e892c00-1390-4088-8817-b3fa569002a9\";s:6:\"handle\";s:4:\"body\";s:12:\"instructions\";s:0:\"\";s:4:\"name\";s:4:\"Body\";s:10:\"searchable\";b:1;s:8:\"settings\";a:6:{s:9:\"charLimit\";s:0:\"\";s:4:\"code\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";s:11:\"initialRows\";s:1:\"4\";s:9:\"multiline\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";}s:20:\"translationKeyFormat\";N;s:17:\"translationMethod\";s:4:\"none\";s:4:\"type\";s:22:\"craft\\fields\\PlainText\";}}s:7:\"plugins\";a:2:{s:14:\"sidebar-themes\";a:4:{s:7:\"edition\";s:8:\"standard\";s:7:\"enabled\";b:1;s:13:\"schemaVersion\";s:5:\"1.0.0\";s:8:\"settings\";a:1:{s:5:\"theme\";s:3:\"vue\";}}s:6:\"aws-s3\";a:3:{s:7:\"edition\";s:8:\"standard\";s:7:\"enabled\";b:1;s:13:\"schemaVersion\";s:3:\"1.1\";}}s:8:\"sections\";a:2:{s:36:\"1dfbf479-e3ac-4fd0-a265-a686d11a7e79\";a:7:{s:16:\"enableVersioning\";b:1;s:10:\"entryTypes\";a:1:{s:36:\"c51dbdf7-c851-4cee-b034-86d33d1cb87e\";a:7:{s:12:\"fieldLayouts\";a:1:{s:36:\"dc4e1a38-046e-42f6-ab20-fc4646f9d63e\";a:1:{s:4:\"tabs\";a:1:{i:0;a:3:{s:6:\"fields\";a:1:{s:36:\"c4f0f90a-c2d5-4a3b-8b2c-4ae93e7cf9de\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}}s:4:\"name\";s:5:\"Tab 1\";s:9:\"sortOrder\";i:1;}}}}s:6:\"handle\";s:8:\"homepage\";s:13:\"hasTitleField\";b:0;s:4:\"name\";s:8:\"Homepage\";s:9:\"sortOrder\";i:1;s:11:\"titleFormat\";s:18:\"{section.name|raw}\";s:10:\"titleLabel\";s:0:\"\";}}s:6:\"handle\";s:8:\"homepage\";s:4:\"name\";s:8:\"Homepage\";s:16:\"propagateEntries\";b:1;s:12:\"siteSettings\";a:1:{s:36:\"afef9821-080b-4723-aeb0-7c2111f0549d\";a:4:{s:16:\"enabledByDefault\";b:1;s:7:\"hasUrls\";b:1;s:8:\"template\";s:14:\"pages/homepage\";s:9:\"uriFormat\";s:8:\"__home__\";}}s:4:\"type\";s:6:\"single\";}s:36:\"6cbe07c9-3117-47fb-bd14-c9adb2254f4b\";a:7:{s:16:\"enableVersioning\";b:1;s:10:\"entryTypes\";a:1:{s:36:\"184c17a8-0677-474d-8649-9a2002d6445b\";a:7:{s:12:\"fieldLayouts\";a:1:{s:36:\"4f019e31-4388-4c89-8377-a172c89e4ffb\";a:1:{s:4:\"tabs\";a:1:{i:0;a:3:{s:6:\"fields\";a:1:{s:36:\"c4f0f90a-c2d5-4a3b-8b2c-4ae93e7cf9de\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}}s:4:\"name\";s:5:\"Tab 1\";s:9:\"sortOrder\";i:1;}}}}s:6:\"handle\";s:9:\"homepage1\";s:13:\"hasTitleField\";b:0;s:4:\"name\";s:9:\"Homepage1\";s:9:\"sortOrder\";i:1;s:11:\"titleFormat\";s:18:\"{section.name|raw}\";s:10:\"titleLabel\";s:0:\"\";}}s:6:\"handle\";s:9:\"homepage1\";s:4:\"name\";s:9:\"Homepage1\";s:16:\"propagateEntries\";b:1;s:12:\"siteSettings\";a:1:{s:36:\"afef9821-080b-4723-aeb0-7c2111f0549d\";a:4:{s:16:\"enabledByDefault\";b:1;s:7:\"hasUrls\";b:1;s:8:\"template\";s:15:\"pages/homepage1\";s:9:\"uriFormat\";s:9:\"homepage1\";}}s:4:\"type\";s:6:\"single\";}}s:10:\"siteGroups\";a:1:{s:36:\"58b2e81b-d210-45bd-be2d-2b448cb2b6b9\";a:1:{s:4:\"name\";s:16:\"Alterna Haircare\";}}s:5:\"sites\";a:1:{s:36:\"afef9821-080b-4723-aeb0-7c2111f0549d\";a:8:{s:7:\"baseUrl\";s:17:\"$DEFAULT_SITE_URL\";s:6:\"handle\";s:7:\"default\";s:7:\"hasUrls\";b:1;s:8:\"language\";s:5:\"en-US\";s:4:\"name\";s:16:\"Alterna Haircare\";s:7:\"primary\";b:1;s:9:\"siteGroup\";s:36:\"58b2e81b-d210-45bd-be2d-2b448cb2b6b9\";s:9:\"sortOrder\";i:1;}}s:6:\"system\";a:5:{s:7:\"edition\";s:3:\"pro\";s:4:\"live\";b:1;s:4:\"name\";s:16:\"Alterna Haircare\";s:13:\"schemaVersion\";s:6:\"3.1.25\";s:8:\"timeZone\";s:19:\"America/Los_Angeles\";}s:5:\"users\";a:5:{s:23:\"allowPublicRegistration\";b:0;s:12:\"defaultGroup\";N;s:12:\"photoSubpath\";s:0:\"\";s:14:\"photoVolumeUid\";N;s:24:\"requireEmailVerification\";b:1;}}','{\"dateModified\":\"@config/project.yaml\",\"email\":\"@config/project.yaml\",\"fieldGroups\":\"@config/project.yaml\",\"fields\":\"@config/project.yaml\",\"sections\":\"@config/project.yaml\",\"siteGroups\":\"@config/project.yaml\",\"sites\":\"@config/project.yaml\",\"system\":\"@config/project.yaml\",\"users\":\"@config/project.yaml\",\"plugins\":\"@config/project.yaml\"}','OAXd1EiuLckv','2019-02-22 19:07:01','2019-02-27 00:25:42','e0b1647e-5530-4f1e-b80d-1ce415369541');

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
	(1,NULL,'app','Install','2019-02-22 19:07:01','2019-02-22 19:07:01','2019-02-22 19:07:01','022c91bd-e5fb-4416-9127-31d58a3f1499'),
	(2,NULL,'app','m150403_183908_migrations_table_changes','2019-02-22 19:07:01','2019-02-22 19:07:01','2019-02-22 19:07:01','5f1dea0b-c3c7-44a9-a2b6-ee4b0cc8107b'),
	(3,NULL,'app','m150403_184247_plugins_table_changes','2019-02-22 19:07:01','2019-02-22 19:07:01','2019-02-22 19:07:01','448d456e-c702-4961-ae2f-f53317c81434'),
	(4,NULL,'app','m150403_184533_field_version','2019-02-22 19:07:01','2019-02-22 19:07:01','2019-02-22 19:07:01','6c36bce0-920a-4ad9-b589-153c7f2f8936'),
	(5,NULL,'app','m150403_184729_type_columns','2019-02-22 19:07:01','2019-02-22 19:07:01','2019-02-22 19:07:01','7206ef1f-30d3-4351-b049-2b083bc4ca3a'),
	(6,NULL,'app','m150403_185142_volumes','2019-02-22 19:07:01','2019-02-22 19:07:01','2019-02-22 19:07:01','f5275d2f-1348-4d24-ae16-309eed659281'),
	(7,NULL,'app','m150428_231346_userpreferences','2019-02-22 19:07:01','2019-02-22 19:07:01','2019-02-22 19:07:01','9007f90e-756a-4891-94b2-181b16ca40ea'),
	(8,NULL,'app','m150519_150900_fieldversion_conversion','2019-02-22 19:07:01','2019-02-22 19:07:01','2019-02-22 19:07:01','3a48e74f-0b29-43a4-9582-e19adc9b913b'),
	(9,NULL,'app','m150617_213829_update_email_settings','2019-02-22 19:07:01','2019-02-22 19:07:01','2019-02-22 19:07:01','a765cf1b-101a-4157-8aac-fb06a8794848'),
	(10,NULL,'app','m150721_124739_templatecachequeries','2019-02-22 19:07:01','2019-02-22 19:07:01','2019-02-22 19:07:01','fd832304-ed6e-42da-8c3a-02bffd492ed8'),
	(11,NULL,'app','m150724_140822_adjust_quality_settings','2019-02-22 19:07:01','2019-02-22 19:07:01','2019-02-22 19:07:01','4f50acf3-e7f9-4431-b2d2-29bc8c1e0591'),
	(12,NULL,'app','m150815_133521_last_login_attempt_ip','2019-02-22 19:07:01','2019-02-22 19:07:01','2019-02-22 19:07:01','1b33e73d-3d15-441b-a8f3-405d96068792'),
	(13,NULL,'app','m151002_095935_volume_cache_settings','2019-02-22 19:07:01','2019-02-22 19:07:01','2019-02-22 19:07:01','cbd2f72a-522d-4768-985d-49a6c8c2b6a0'),
	(14,NULL,'app','m151005_142750_volume_s3_storage_settings','2019-02-22 19:07:01','2019-02-22 19:07:01','2019-02-22 19:07:01','41bfe013-6170-44d5-bfb9-34770b4901eb'),
	(15,NULL,'app','m151016_133600_delete_asset_thumbnails','2019-02-22 19:07:01','2019-02-22 19:07:01','2019-02-22 19:07:01','514c0350-40c6-4a0c-a677-c6c3b3b35f24'),
	(16,NULL,'app','m151209_000000_move_logo','2019-02-22 19:07:01','2019-02-22 19:07:01','2019-02-22 19:07:01','2a70efce-429b-4678-a228-8458c24ca360'),
	(17,NULL,'app','m151211_000000_rename_fileId_to_assetId','2019-02-22 19:07:01','2019-02-22 19:07:01','2019-02-22 19:07:01','64d1e2f2-f1ad-4d16-9e8e-8cbfd661f2a6'),
	(18,NULL,'app','m151215_000000_rename_asset_permissions','2019-02-22 19:07:01','2019-02-22 19:07:01','2019-02-22 19:07:01','e95f7eaf-69c2-4bee-91d1-da1665faed90'),
	(19,NULL,'app','m160707_000001_rename_richtext_assetsource_setting','2019-02-22 19:07:01','2019-02-22 19:07:01','2019-02-22 19:07:01','b8934b91-ae13-4d20-92fd-b132ff7b13e3'),
	(20,NULL,'app','m160708_185142_volume_hasUrls_setting','2019-02-22 19:07:01','2019-02-22 19:07:01','2019-02-22 19:07:01','5f1ef9df-a2f7-4d22-aa8e-05b5067ed56d'),
	(21,NULL,'app','m160714_000000_increase_max_asset_filesize','2019-02-22 19:07:01','2019-02-22 19:07:01','2019-02-22 19:07:01','51614f12-513a-4e9e-a29f-866b6a175424'),
	(22,NULL,'app','m160727_194637_column_cleanup','2019-02-22 19:07:01','2019-02-22 19:07:01','2019-02-22 19:07:01','314977fb-b7c7-4a53-87e4-28527a969001'),
	(23,NULL,'app','m160804_110002_userphotos_to_assets','2019-02-22 19:07:01','2019-02-22 19:07:01','2019-02-22 19:07:01','cdb84845-4c25-4721-9c38-a26254d921ee'),
	(24,NULL,'app','m160807_144858_sites','2019-02-22 19:07:01','2019-02-22 19:07:01','2019-02-22 19:07:01','be208a28-a46c-45ec-849b-70261bb97291'),
	(25,NULL,'app','m160829_000000_pending_user_content_cleanup','2019-02-22 19:07:01','2019-02-22 19:07:01','2019-02-22 19:07:01','00f2772b-a88d-44e8-8045-309fb01d31d6'),
	(26,NULL,'app','m160830_000000_asset_index_uri_increase','2019-02-22 19:07:01','2019-02-22 19:07:01','2019-02-22 19:07:01','2dd26342-900a-41f0-82e4-992df5b4111a'),
	(27,NULL,'app','m160912_230520_require_entry_type_id','2019-02-22 19:07:01','2019-02-22 19:07:01','2019-02-22 19:07:01','f1058b80-87e3-484d-ae46-7ff99393c3cb'),
	(28,NULL,'app','m160913_134730_require_matrix_block_type_id','2019-02-22 19:07:01','2019-02-22 19:07:01','2019-02-22 19:07:01','bd2d6cbe-bea1-408c-b5e0-7cb5c5613b11'),
	(29,NULL,'app','m160920_174553_matrixblocks_owner_site_id_nullable','2019-02-22 19:07:01','2019-02-22 19:07:01','2019-02-22 19:07:01','2ae6e71b-fcbd-496a-aab0-350d2a005f5d'),
	(30,NULL,'app','m160920_231045_usergroup_handle_title_unique','2019-02-22 19:07:01','2019-02-22 19:07:01','2019-02-22 19:07:01','cd066906-0762-4100-a8b9-5f8973ee1e65'),
	(31,NULL,'app','m160925_113941_route_uri_parts','2019-02-22 19:07:01','2019-02-22 19:07:01','2019-02-22 19:07:01','b798c625-b390-4f75-a7f4-75573b96a7a5'),
	(32,NULL,'app','m161006_205918_schemaVersion_not_null','2019-02-22 19:07:01','2019-02-22 19:07:01','2019-02-22 19:07:01','3885b5b3-9192-4e27-b48b-dfbf680b9fa5'),
	(33,NULL,'app','m161007_130653_update_email_settings','2019-02-22 19:07:01','2019-02-22 19:07:01','2019-02-22 19:07:01','a20d515b-0008-415c-bc98-27a368d7ee2c'),
	(34,NULL,'app','m161013_175052_newParentId','2019-02-22 19:07:01','2019-02-22 19:07:01','2019-02-22 19:07:01','b7fd2479-4c82-4b47-87ff-3c3b1c89ad47'),
	(35,NULL,'app','m161021_102916_fix_recent_entries_widgets','2019-02-22 19:07:01','2019-02-22 19:07:01','2019-02-22 19:07:01','92f718fb-9239-44d0-b100-9d0cd04ec668'),
	(36,NULL,'app','m161021_182140_rename_get_help_widget','2019-02-22 19:07:01','2019-02-22 19:07:01','2019-02-22 19:07:01','db64678a-8c22-4888-8306-955c8ae775f2'),
	(37,NULL,'app','m161025_000000_fix_char_columns','2019-02-22 19:07:01','2019-02-22 19:07:01','2019-02-22 19:07:01','db3b424f-cc14-415b-a415-edcf40627474'),
	(38,NULL,'app','m161029_124145_email_message_languages','2019-02-22 19:07:01','2019-02-22 19:07:01','2019-02-22 19:07:01','db14bfaf-7746-4693-a6da-268244031329'),
	(39,NULL,'app','m161108_000000_new_version_format','2019-02-22 19:07:01','2019-02-22 19:07:01','2019-02-22 19:07:01','d2feb97e-8656-443c-8cfd-7f7a83b045fd'),
	(40,NULL,'app','m161109_000000_index_shuffle','2019-02-22 19:07:01','2019-02-22 19:07:01','2019-02-22 19:07:01','69d12f46-e22a-41f6-81ab-11198b16ca1f'),
	(41,NULL,'app','m161122_185500_no_craft_app','2019-02-22 19:07:01','2019-02-22 19:07:01','2019-02-22 19:07:01','ea9e83e8-c2e3-405d-b637-e6c08973319f'),
	(42,NULL,'app','m161125_150752_clear_urlmanager_cache','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','41bfbfda-b671-4556-a110-2fbe585c1baf'),
	(43,NULL,'app','m161220_000000_volumes_hasurl_notnull','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','3e0dd0ca-930c-4adb-9760-a1c41ef82234'),
	(44,NULL,'app','m170114_161144_udates_permission','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','6895b95c-3317-4440-a787-cee500cedd2c'),
	(45,NULL,'app','m170120_000000_schema_cleanup','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','1cedd950-f7ae-4671-b379-f1b94b2c7068'),
	(46,NULL,'app','m170126_000000_assets_focal_point','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','bf346d75-15d1-4675-ac4c-aece4427fd5c'),
	(47,NULL,'app','m170206_142126_system_name','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','ae12b488-5fe2-4c08-8933-dd1912b57d4e'),
	(48,NULL,'app','m170217_044740_category_branch_limits','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','89b42891-1c4d-4ac0-994e-c0e3210409ee'),
	(49,NULL,'app','m170217_120224_asset_indexing_columns','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','dada7da0-6685-4520-aafb-e0b0f4879c0f'),
	(50,NULL,'app','m170223_224012_plain_text_settings','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','3ac06361-1e38-4d13-9bdd-a8741d70d69b'),
	(51,NULL,'app','m170227_120814_focal_point_percentage','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','399a7a9d-200f-418d-9a02-d4e5d96c4e0a'),
	(52,NULL,'app','m170228_171113_system_messages','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','944fe373-9e01-4d2b-b5bd-2645f8d2bd09'),
	(53,NULL,'app','m170303_140500_asset_field_source_settings','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','9ad692ea-dc1e-4123-9804-5b30c6481471'),
	(54,NULL,'app','m170306_150500_asset_temporary_uploads','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','db22be07-26c6-47ce-8cbe-c2f15a66d683'),
	(55,NULL,'app','m170523_190652_element_field_layout_ids','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','3d8cae35-7ea8-424d-8973-81ff818a2585'),
	(56,NULL,'app','m170612_000000_route_index_shuffle','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','00bf8faa-73ca-4a1d-a8b7-b91f31e930f4'),
	(57,NULL,'app','m170621_195237_format_plugin_handles','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','46ae8682-c699-4be8-aa1b-7f58bae5981d'),
	(58,NULL,'app','m170630_161027_deprecation_line_nullable','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','d2ccefe2-521d-479c-9ff5-195108b0bb7d'),
	(59,NULL,'app','m170630_161028_deprecation_changes','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','15ebea59-9905-41c3-957c-27b2cd344451'),
	(60,NULL,'app','m170703_181539_plugins_table_tweaks','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','360cd80e-3312-4a2d-9ac5-b5b327847bc3'),
	(61,NULL,'app','m170704_134916_sites_tables','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','71ed5672-f810-4642-8163-6149d6e610be'),
	(62,NULL,'app','m170706_183216_rename_sequences','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','9f2a169c-26a0-4148-a4c7-9b5d64c7c3ac'),
	(63,NULL,'app','m170707_094758_delete_compiled_traits','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','c6f12e21-0392-4739-9684-f00d8d47f4e3'),
	(64,NULL,'app','m170731_190138_drop_asset_packagist','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','368599ca-bda1-4410-acaf-c1bd47b0900b'),
	(65,NULL,'app','m170810_201318_create_queue_table','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','bf3ab1af-8fc5-4c69-8bf6-435d2016fdce'),
	(66,NULL,'app','m170816_133741_delete_compiled_behaviors','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','f7a8b0a6-0b96-4bf5-846a-d8530ad337b2'),
	(67,NULL,'app','m170903_192801_longblob_for_queue_jobs','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','5d33f304-6133-4790-9dfc-f5db38563323'),
	(68,NULL,'app','m170914_204621_asset_cache_shuffle','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','08b76b8b-18a1-446c-b179-29f5b59a7727'),
	(69,NULL,'app','m171011_214115_site_groups','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','9471af1c-a5b7-43d9-a6ae-05ef0c8d32e2'),
	(70,NULL,'app','m171012_151440_primary_site','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','6399ede9-e393-4122-a82b-df44d8777b43'),
	(71,NULL,'app','m171013_142500_transform_interlace','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','5f4dfebf-3924-4971-9e2c-46c237422539'),
	(72,NULL,'app','m171016_092553_drop_position_select','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','77ddc0d8-3702-44f8-a234-147859fb242f'),
	(73,NULL,'app','m171016_221244_less_strict_translation_method','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','f844f278-3018-45cd-8047-7dcb11402807'),
	(74,NULL,'app','m171107_000000_assign_group_permissions','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','e7829bd5-5f9a-41ae-9283-00621855664c'),
	(75,NULL,'app','m171117_000001_templatecache_index_tune','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','d25d98a9-b8c4-4690-88d1-47c7974614ff'),
	(76,NULL,'app','m171126_105927_disabled_plugins','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','a615227d-a879-44bb-a2d1-33f48d92b373'),
	(77,NULL,'app','m171130_214407_craftidtokens_table','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','28be4bac-0c82-4ebe-8f26-3c9d9e6c4314'),
	(78,NULL,'app','m171202_004225_update_email_settings','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','40eaba34-f25c-476f-9b5c-0619adeb23da'),
	(79,NULL,'app','m171204_000001_templatecache_index_tune_deux','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','909c30fe-5864-4cc7-909a-2062d8403f65'),
	(80,NULL,'app','m171205_130908_remove_craftidtokens_refreshtoken_column','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','80091e8e-696e-4f53-8774-120d2d182560'),
	(81,NULL,'app','m171218_143135_longtext_query_column','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','6b5ac4e1-b9bc-472c-9ba8-de09e61fc565'),
	(82,NULL,'app','m171231_055546_environment_variables_to_aliases','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','76ec695d-e00b-464c-a77f-2130173e2652'),
	(83,NULL,'app','m180113_153740_drop_users_archived_column','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','36273398-5f8e-43b6-abb4-31699133b245'),
	(84,NULL,'app','m180122_213433_propagate_entries_setting','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','80b50a87-85bc-4dc5-976b-6289fd1d3279'),
	(85,NULL,'app','m180124_230459_fix_propagate_entries_values','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','60752b7b-8752-42e5-9b7f-39400efed4bb'),
	(86,NULL,'app','m180128_235202_set_tag_slugs','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','6069328d-275a-41fb-9920-1dfcf4db3d63'),
	(87,NULL,'app','m180202_185551_fix_focal_points','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','efc56322-8030-4f52-9cec-3d5c3e86c782'),
	(88,NULL,'app','m180217_172123_tiny_ints','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','ddcb3ee8-4bce-4f94-9e6d-480f646cd24b'),
	(89,NULL,'app','m180321_233505_small_ints','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','ca96531b-47bd-4abc-9589-1420a6c0ebff'),
	(90,NULL,'app','m180328_115523_new_license_key_statuses','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','59fb5228-52d0-4766-b9bf-b92e5fd4a094'),
	(91,NULL,'app','m180404_182320_edition_changes','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','66826ca2-d374-4bdb-944b-dc6cf13164bc'),
	(92,NULL,'app','m180411_102218_fix_db_routes','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','d3456960-0eb4-4d3a-a4a9-a51a334393e5'),
	(93,NULL,'app','m180416_205628_resourcepaths_table','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','69a2454c-33a8-4a9a-9d2c-1e921a5397a1'),
	(94,NULL,'app','m180418_205713_widget_cleanup','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','70a9fe49-4b47-4422-a41b-151748c28c02'),
	(95,NULL,'app','m180425_203349_searchable_fields','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','a26034a1-4fcc-4e6a-9e42-5e132e6a6a69'),
	(96,NULL,'app','m180516_153000_uids_in_field_settings','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','27993e22-dc63-4a9d-9907-87dc4a5b96b3'),
	(97,NULL,'app','m180517_173000_user_photo_volume_to_uid','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','89fd8484-e403-4466-8dac-b34bfd344c33'),
	(98,NULL,'app','m180518_173000_permissions_to_uid','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','9ecf99d9-7d01-407b-8352-cc5ac09341c7'),
	(99,NULL,'app','m180520_173000_matrix_context_to_uids','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','b95539be-fcc4-44c6-8008-89d348ca427d'),
	(100,NULL,'app','m180521_173000_initial_yml_and_snapshot','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','6ebd3dce-8d58-4be4-abbb-989018f71d3a'),
	(101,NULL,'app','m180731_162030_soft_delete_sites','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','d01e37b4-7b47-48e2-bc9a-0bcf4a6f559d'),
	(102,NULL,'app','m180810_214427_soft_delete_field_layouts','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','25fc57fc-d264-4d38-a2d0-02c2ced1602f'),
	(103,NULL,'app','m180810_214439_soft_delete_elements','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','6953398d-3422-474b-994e-437a3dc442e5'),
	(104,NULL,'app','m180824_193422_case_sensitivity_fixes','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','0bf71523-c118-47fc-923a-de29c3519893'),
	(105,NULL,'app','m180901_151639_fix_matrixcontent_tables','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','cee504b5-5f5c-4629-9a5a-9310a34e2f36'),
	(106,NULL,'app','m180904_112109_permission_changes','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','0e9cd7f2-25ef-4aa5-87ef-e47c6ac68e4d'),
	(107,NULL,'app','m180910_142030_soft_delete_sitegroups','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','35272fd2-7bd8-4d08-9f2c-98a52bb1f0bf'),
	(108,NULL,'app','m181011_160000_soft_delete_asset_support','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','a867ecf8-66d9-4a64-9d12-7e7b1be2abde'),
	(109,NULL,'app','m181016_183648_set_default_user_settings','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','48c62bb4-d205-40b8-b50a-d2bc10e1f6de'),
	(110,NULL,'app','m181017_225222_system_config_settings','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','77bca54f-e978-4bb8-a3e6-09016e631e43'),
	(111,NULL,'app','m181018_222343_drop_userpermissions_from_config','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','574ab63f-2988-4265-97f4-dbe9ddfbb973'),
	(112,NULL,'app','m181029_130000_add_transforms_routes_to_config','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','fe20eded-806b-4653-8f4a-eb82ece4e757'),
	(113,NULL,'app','m181112_203955_sequences_table','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','05631bc3-f259-4cd5-b30c-87389e3ac209'),
	(114,NULL,'app','m181121_001712_cleanup_field_configs','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','0ae51a00-c640-473b-8707-103fd9905812'),
	(115,NULL,'app','m181128_193942_fix_project_config','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','da883878-49ca-4190-a553-f03c7664cb61'),
	(116,NULL,'app','m181130_143040_fix_schema_version','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','6f551043-8e32-4fd2-9033-b69e3f6dce84'),
	(117,NULL,'app','m181211_143040_fix_entry_type_uids','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','1b8d837f-af7a-46ee-87e0-93cb731cd6b7'),
	(118,NULL,'app','m181213_102500_config_map_aliases','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','2a90e11d-7c9e-460d-9567-ea2838f0d12c'),
	(119,NULL,'app','m181217_153000_fix_structure_uids','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','5027c6bf-9b53-46c7-85f7-5cb311c1b9c9'),
	(120,NULL,'app','m190104_152725_store_licensed_plugin_editions','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','d3cee5cd-4093-4a18-94f8-a90bc3883d2b'),
	(121,NULL,'app','m190108_110000_cleanup_project_config','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','109391ce-57d7-4234-b8d7-251038859049'),
	(122,NULL,'app','m190108_113000_asset_field_setting_change','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','4e3315b3-e620-410f-9d77-b63788cfcec3'),
	(123,NULL,'app','m190109_172845_fix_colspan','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','7cea009c-e78d-4998-a190-e9d8eb9669a7'),
	(124,NULL,'app','m190110_150000_prune_nonexisting_sites','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','c9b14ad7-c546-4b86-8af5-6e9518ff73ea'),
	(125,NULL,'app','m190110_214819_soft_delete_volumes','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','26e40307-693c-4a3d-b681-a57143db0421'),
	(126,NULL,'app','m190112_124737_fix_user_settings','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','9d1fc6a9-846b-4bd4-9fcf-73d35d5217ff'),
	(127,NULL,'app','m190112_131225_fix_field_layouts','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','6975ecfa-e6c8-4216-bf9d-16bb5715ab17'),
	(128,NULL,'app','m190112_201010_more_soft_deletes','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','2c34e3d6-c6f0-4eeb-87e6-4bad284ba674'),
	(129,NULL,'app','m190114_143000_more_asset_field_setting_changes','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','8680ac05-02e8-44d6-bdc0-1f0c8fe5250f'),
	(130,NULL,'app','m190121_120000_rich_text_config_setting','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','5cf253cd-9f73-4a29-9e3d-0bbf35e03b98'),
	(131,NULL,'app','m190125_191628_fix_email_transport_password','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','7684abad-f920-41df-a1f8-71860535c842'),
	(132,NULL,'app','m190128_181422_cleanup_volume_folders','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','0fe030f5-acd5-47cb-8194-a7043c094335'),
	(133,NULL,'app','m190205_140000_fix_asset_soft_delete_index','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','71282747-d403-4116-ac63-4ee261ec64f6'),
	(134,NULL,'app','m190208_140000_reset_project_config_mapping','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','27ffecdb-86c4-4b76-bd75-cd2fa311848a'),
	(135,NULL,'app','m190218_143000_element_index_settings_uid','2019-02-22 19:07:02','2019-02-22 19:07:02','2019-02-22 19:07:02','600ea76d-1271-4b3b-9e29-07757887c277'),
	(136,2,'plugin','Install','2019-02-27 00:25:42','2019-02-27 00:25:42','2019-02-27 00:25:42','7af9b675-6ce3-4b18-ae7f-a1546136f5df'),
	(137,2,'plugin','m180929_165000_remove_storageclass_setting','2019-02-27 00:25:42','2019-02-27 00:25:42','2019-02-27 00:25:42','25c74d24-8e31-452e-ba7a-a042bae5e6e8'),
	(138,2,'plugin','m190131_214300_cleanup_config','2019-02-27 00:25:42','2019-02-27 00:25:42','2019-02-27 00:25:42','781e894b-5a33-4286-8fdc-d39e66a44da1');

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
	(1,'sidebar-themes','1.0.5','1.0.0','unknown',NULL,'2019-02-27 00:14:41','2019-02-27 00:14:41','2019-02-27 00:15:27','4abe8d53-dcc4-42e6-a5b1-2912bd574288'),
	(2,'aws-s3','1.2.0','1.1','unknown',NULL,'2019-02-27 00:25:42','2019-02-27 00:25:42','2019-02-27 00:26:00','461d909b-06e5-40c9-9ed0-e873adba53f2');

/*!40000 ALTER TABLE `craft_plugins` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_queue
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_queue`;

CREATE TABLE `craft_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job` longblob NOT NULL,
  `description` text DEFAULT NULL,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT 0,
  `priority` int(11) unsigned NOT NULL DEFAULT 1024,
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT 0,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT 0,
  `dateFailed` datetime DEFAULT NULL,
  `error` text DEFAULT NULL,
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
	('11ba6d0f','@lib/xregexp'),
	('1446785a','@lib/jquery.payment'),
	('19ee20cf','@bower/jquery/dist'),
	('1a869b54','@app/web/assets/pluginstoreoauth/dist'),
	('1bd62985','@lib/selectize'),
	('20eb89ea','@app/web/assets/dashboard/dist'),
	('21c4e137','@lib'),
	('264ff13e','@app/web/assets/plugins/dist'),
	('2e45357a','@lib/timepicker'),
	('367e8b3a','@lib/element-resize-detector'),
	('37145d93','@app/web/assets/clearcaches/dist'),
	('410d2450','@lib/d3'),
	('42d7024f','@app/web/assets/dbbackup/dist'),
	('44227e2d','@app/web/assets/editentry/dist'),
	('46c84c17','@lib/jquery-ui'),
	('480c38c3','@lib/jquery-touch-events'),
	('4fa80401','@lib/picturefill'),
	('5249d5a3','@app/web/assets/sites/dist'),
	('574005ff','@lib/fileupload'),
	('6220c4f9','@app/web/assets/plugins/dist'),
	('6262421d','@app/web/assets/updates/dist'),
	('63e39263','@app/web/assets/fields/dist'),
	('6518ae28','@app/web/assets/deprecationerrors/dist'),
	('67f6e7e8','@lib/fabric'),
	('6d1fa47','@lukeyouell/sidebarthemes/assetbundles/sidebarthemes/dist'),
	('72b033d6','@lib/garnishjs'),
	('7d9f8d6c','@app/web/assets/dashboard/dist'),
	('847e9782','@app/web/assets/updateswidget/dist'),
	('861d7b2','@lib/velocity'),
	('89c1cad2','@app/web/assets/generalsettings/dist'),
	('8dac1db6','@lib/fileupload'),
	('92e0208a','@lib/jquery-touch-events'),
	('93f70a02','@app/web/assets/craftsupport/dist'),
	('942bc5bd','@app/web/assets/updater/dist'),
	('95441c48','@lib/picturefill'),
	('9afd8c18','@app/web/assets/feed/dist'),
	('9be13c19','@lib/d3'),
	('9c24545e','@lib/jquery-ui'),
	('a3dfe4ad','@app/web/assets/recententries/dist'),
	('a789f261','@app/web/assets/cp/dist'),
	('a85c2b9f','@lib/garnishjs'),
	('ab312ead','@app/web/assets/searchindexes/dist'),
	('baacd65e','@app/web/assets/login/dist'),
	('bb9c8469','@lukeyouell/sidebarthemes/assetbundles/sidebarthemes/dist/themes/icons'),
	('bcb1bf4a','@app/web/assets/pluginstore/dist'),
	('bd1affa1','@lib/fabric'),
	('c13a31cc','@lib/selectize'),
	('c3023886','@bower/jquery/dist'),
	('c95fc13b','@app/web/assets/updater/dist'),
	('cb567546','@lib/xregexp'),
	('ccd8deaf','@app/web/assets/tablesettings/dist'),
	('ce830e84','@app/web/assets/craftsupport/dist'),
	('ceaa6013','@lib/jquery.payment'),
	('cfed4023','@craft/awss3/resources'),
	('d28dcffb','@lib/velocity'),
	('d90a9304','@app/web/assets/updateswidget/dist'),
	('dce981b1','@app/web/assets/utilities/dist'),
	('de92b9df','@app/web/assets/feed/dist'),
	('e3e6c7a6','@app/web/assets/cp/dist'),
	('ec929373','@lib/element-resize-detector'),
	('f643dcf1','@app/web/assets/matrixsettings/dist'),
	('f8de8a8d','@app/web/assets/pluginstore/dist'),
	('fb28f97e','@lib'),
	('feabe02b','@app/web/assets/recententries/dist');

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
	(2,'slug',0,1,' homepage '),
	(2,'title',0,1,' homepage '),
	(2,'field',1,1,' hi '),
	(3,'slug',0,1,' homepage1 '),
	(3,'title',0,1,' homepage1 '),
	(3,'field',1,1,'');

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
  `enableVersioning` tinyint(1) NOT NULL DEFAULT 0,
  `propagateEntries` tinyint(1) NOT NULL DEFAULT 1,
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
	(1,NULL,'Homepage','homepage','single',1,1,'2019-02-22 19:53:57','2019-02-25 22:11:12',NULL,'1dfbf479-e3ac-4fd0-a265-a686d11a7e79'),
	(2,NULL,'Homepage1','homepage1','single',1,1,'2019-02-25 21:42:59','2019-02-25 21:46:57',NULL,'6cbe07c9-3117-47fb-bd14-c9adb2254f4b');

/*!40000 ALTER TABLE `craft_sections` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_sections_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_sections_sites`;

CREATE TABLE `craft_sections_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text DEFAULT NULL,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT 1,
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
	(1,1,1,1,'__home__','pages/homepage',1,'2019-02-22 19:53:57','2019-02-25 22:11:12','42d05170-018f-43c9-bd4e-9a64ce38438a'),
	(2,2,1,1,'homepage1','pages/homepage1',1,'2019-02-25 21:42:59','2019-02-25 21:46:57','715e5ebe-99e9-457b-9b36-f60d1718d575');

/*!40000 ALTER TABLE `craft_sections_sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_sequences
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_sequences`;

CREATE TABLE `craft_sequences` (
  `name` varchar(255) NOT NULL,
  `next` int(11) unsigned NOT NULL DEFAULT 1,
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
	(1,1,'DoE4Fd-OZBz4ij9y8DRfr0MjdF0mtW9gX8lmsA9mooS1I0fOQQFmdSUCrMWOyD_gpsA9TuTm4aZ0kYtSLw5QaWULxwg47aQkgQ7Y','2019-02-22 19:07:01','2019-02-22 20:12:25','8ed2849a-4689-4cda-af32-835f969561e2'),
	(2,1,'z1WGzSiqaHLtrHkr2iMpvqdNrAk3GhsggefEkPEYnvxlmrAfkc6vMO6vqId3P78KTP89WfT2v3B7koU3daMkNDr_7Pees3-UlJfa','2019-02-22 21:26:04','2019-02-22 21:32:22','30047509-698f-4aab-9e77-5aa1abc6a6dc'),
	(3,1,'zNujHA9M7_t26zWffRwZrqBSEq6jgEAaU4eCiRaI3F2EM5XCHHChqEEm9Q3-FDSwOj2Eli85Ue3m2_Ae-vjXbF-l1eSOnNUXUavn','2019-02-22 22:32:26','2019-02-22 23:34:22','6a1619f3-6948-49ca-b8af-a823917dfdb6'),
	(4,1,'IE2WVQz7kGCQNl2QfWyeFjGhtN_9MRHghd5F6kInFt6HPHnAVjBgWlq57E269iw_4h320WMuJBRETk1psX98VjCixgafb8E6m83J','2019-02-22 23:49:03','2019-02-23 01:17:18','5b818556-8d00-4631-8913-6b6ebf9f1507'),
	(5,1,'pBA_gOVu7tPw_eAhHSGN3NWpQW8OnIyzU_tlJVQWeGLUz2I5gwEItXgk94o9jRrptELvZtu0qFSz_vrzufXUV8Mjhu4sUloD5RED','2019-02-25 21:42:26','2019-02-26 01:12:00','f1220f78-088b-4225-b647-232740c2fb4a'),
	(6,1,'lryl_-x7SemsEB4bLh0dXVtT7EpqZqZho_zKQtwylmzTx2q6g7NAnZCujecFfLk2C7Pj2KbSs-l7g1PUYZ21Cm-6rQk97ocRbepe','2019-02-26 18:12:48','2019-02-26 18:28:31','e2a4824a-e349-4830-8e5c-274e1e695264'),
	(7,1,'7z21ZeS5GpFa21WQHexzzFEPfoxWmSp1pSQWhRTPwIJGLbxl4hJV-nyup5i7jIGRSQr-iIpOXZKaQBt3gNb0nrrB3aoQAVAvIV1j','2019-02-26 19:28:35','2019-02-26 19:28:35','0dbd30f9-4be9-4f4b-9a17-b058e5ec3610'),
	(8,1,'9r0OuZ48HJnuvUeYqeIv6EQM-QvmDNba8XbTyJD1lsoDCmMVYYeydX-_XoNrErPVdIwp5Ba6CiG51kFhU2iGfDz6HweqFmwBdwdS','2019-02-26 20:28:39','2019-02-26 20:28:39','9d15334b-970c-4539-b631-2ef8730e9c9d'),
	(9,1,'hBAdWsq0F1Cvt6hwGLrjZ2M2dNwu5YTkpMdBquDozGLAcGEuCoblTp4HEdmVDUg6fEe7lHZlqygmajEgb2uhDyjqywr1BrWpn7Gx','2019-02-26 21:28:42','2019-02-26 21:28:42','de50bbe4-9d97-42ec-befa-6fff8c76452a'),
	(10,1,'p8RppQ_t6eClU1tVhi0Q4_1_O5mWkOp-_NkSV5UdoMlp1n7n-C35FDvfKLE3THJiYsaVjIGnvrxh_fCLXws2gJW8g6MRwmHIuhYm','2019-02-26 22:28:45','2019-02-26 22:28:45','c76b8405-c896-4d2d-b8a0-09dd1a36d6c9'),
	(11,1,'fma2-Lx3kGBLs9oFkeIpC9iW01DqGIsbCEoyTKMvVFKz-_gLZQZyAELgKEB4D0oIHEhetIFvXr5kwBc3Hiw61hbIicvH1xcziB-_','2019-02-26 23:28:47','2019-02-27 00:15:26','4cb22de4-2f63-41fb-b54d-771baea7f7dd'),
	(12,1,'CNjLmE8lbW9F7z4pnObGRxWUgZs6Wd1G4gqyZgDDUtFG026IPQorcm0m4jDrC4ZYRKyt1M1cVRLZ_OBXAXBV4Ynz42B20i04MNKB','2019-02-27 00:24:30','2019-02-27 00:26:04','d7d1145f-86f6-4913-a5de-c6ee718f0b4f');

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
	(1,'Alterna Haircare','2019-02-22 19:07:01','2019-02-22 19:07:01',NULL,'58b2e81b-d210-45bd-be2d-2b448cb2b6b9');

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
  `hasUrls` tinyint(1) NOT NULL DEFAULT 0,
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
	(1,1,1,'Alterna Haircare','default','en-US',1,'$DEFAULT_SITE_URL',1,'2019-02-22 19:07:01','2019-02-22 19:07:01',NULL,'afef9821-080b-4723-aeb0-7c2111f0549d');

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
  `route` text DEFAULT NULL,
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
  `preferences` text DEFAULT NULL,
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
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `suspended` tinyint(1) NOT NULL DEFAULT 0,
  `pending` tinyint(1) NOT NULL DEFAULT 0,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT 0,
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT 0,
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
	(1,'skyrocket',NULL,NULL,NULL,'dev@skyrocket.is','$2y$13$cjMbgnqdfvm8avoRA66Vh.03mK858T.q0sg5Pee7YUKFlNknUJdsG',1,0,0,0,'2019-02-27 00:24:30',NULL,NULL,NULL,'2019-02-22 21:25:58',NULL,1,NULL,NULL,NULL,0,'2019-02-22 19:07:01','2019-02-22 19:07:01','2019-02-27 00:24:31','90bad3d9-c14a-41f5-a3be-5034e187fa20');

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



# Dump of table craft_volumes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_volumes`;

CREATE TABLE `craft_volumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `url` varchar(255) DEFAULT NULL,
  `settings` text DEFAULT NULL,
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



# Dump of table craft_widgets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_widgets`;

CREATE TABLE `craft_widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
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
	(1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"section\":\"*\",\"siteId\":\"1\",\"limit\":10}',1,'2019-02-22 19:07:03','2019-02-22 19:07:03','1838871e-4cb4-4b2b-baeb-ce9836fb2251'),
	(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2019-02-22 19:07:03','2019-02-22 19:07:03','b8b94788-80a9-4598-b2fe-242682252648'),
	(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2019-02-22 19:07:03','2019-02-22 19:07:03','ee5e80ca-bb22-4192-a868-41a3ef71cdfa'),
	(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2019-02-22 19:07:03','2019-02-22 19:07:03','b8d5b0b9-d084-4fa5-9c0c-30f8d486fe57');

/*!40000 ALTER TABLE `craft_widgets` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

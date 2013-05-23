/*
SQLyog Trial v11.11 (64 bit)
MySQL - 5.6.11 : Database - rcuinfomanager
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`rcuinfomanager` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `rcuinfomanager`;

/*Table structure for table `appversionsinfo` */

DROP TABLE IF EXISTS `appversionsinfo`;

CREATE TABLE `appversionsinfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `appVerName` varchar(20) DEFAULT NULL,
  `descb` varchar(200) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `isCoerce` tinyint(1) DEFAULT NULL,
  `createTime` varchar(50) DEFAULT NULL,
  `note1` varchar(200) DEFAULT NULL,
  `note2` varchar(200) DEFAULT NULL,
  `note3` varchar(200) DEFAULT NULL,
  `note4` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_2` (`createTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='App版本信息表';

/*Data for the table `appversionsinfo` */

/*Table structure for table `areasinfo` */

DROP TABLE IF EXISTS `areasinfo`;

CREATE TABLE `areasinfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `areaId` bigint(20) DEFAULT NULL,
  `areaName` varchar(20) DEFAULT NULL,
  `areaAlias` varchar(50) DEFAULT NULL,
  `fatherId` bigint(20) DEFAULT NULL,
  `note1` varchar(200) DEFAULT NULL,
  `note2` varchar(200) DEFAULT NULL,
  `note3` varchar(200) DEFAULT NULL,
  `note4` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_4` (`areaId`),
  KEY `Index_2` (`areaName`),
  KEY `Index_3` (`fatherId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `areasinfo` */

/*Table structure for table `baseinfo` */

DROP TABLE IF EXISTS `baseinfo`;

CREATE TABLE `baseinfo` (
  `recordId` bigint(20) NOT NULL AUTO_INCREMENT,
  `village` varchar(100) DEFAULT NULL,
  `customerName` varchar(20) NOT NULL,
  `cerNum` varchar(20) NOT NULL,
  `gender` int(11) DEFAULT NULL,
  `isFarmer` int(11) DEFAULT NULL,
  `cerType` varchar(20) DEFAULT NULL,
  `cerValidityFrom` varchar(20) DEFAULT NULL,
  `cerValidityTo` varchar(20) DEFAULT NULL,
  `customerType` varchar(50) DEFAULT NULL,
  `birthday` varchar(20) DEFAULT NULL,
  `nationality` varchar(50) DEFAULT NULL,
  `isHavePassport` int(11) DEFAULT NULL,
  `nation` varchar(50) DEFAULT NULL,
  `poliLaspect` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `postcode` varchar(10) DEFAULT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  `mbPhoneNum` varchar(14) DEFAULT NULL,
  `areaCode` varchar(20) DEFAULT NULL,
  `areaName` varchar(100) DEFAULT NULL,
  `highestDegree` varchar(30) DEFAULT NULL,
  `highestEdu` varchar(30) DEFAULT NULL,
  `health` varchar(20) DEFAULT NULL,
  `bankRelation` varchar(20) DEFAULT NULL,
  `liveCondition` varchar(20) DEFAULT NULL,
  `maritalStatus` varchar(20) DEFAULT NULL,
  `socialSecurity` varchar(100) DEFAULT NULL,
  `bankPartnership` varchar(10) DEFAULT NULL,
  `profession` varchar(50) DEFAULT NULL,
  `businessProj` varchar(100) DEFAULT NULL,
  `businessYear` int(11) DEFAULT NULL,
  `businessSite` varchar(50) DEFAULT NULL,
  `industry` varchar(50) DEFAULT NULL,
  `businessProp` varchar(10) DEFAULT NULL,
  `moneySitu` varchar(20) DEFAULT NULL,
  `inputMoney` varchar(20) DEFAULT NULL,
  `ownMoney` varchar(20) DEFAULT NULL,
  `yearIncome` varchar(20) DEFAULT NULL,
  `annualWageIncome` varchar(20) DEFAULT NULL,
  `workYears` int(11) DEFAULT NULL,
  `workSitu` varchar(100) DEFAULT NULL,
  `unitProp` varchar(50) DEFAULT NULL,
  `unitIndustry` varchar(20) DEFAULT NULL,
  `unitIndustryName` varchar(50) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `unitType` varchar(50) DEFAULT NULL,
  `duties` varchar(20) DEFAULT NULL,
  `workTitle` varchar(200) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `userName` varchar(20) DEFAULT NULL,
  `createTime` varchar(50) DEFAULT NULL,
  `recordTime` varchar(50) DEFAULT NULL,
  `submitTime` varchar(50) DEFAULT NULL,
  `lastModifyTime` varchar(50) DEFAULT NULL,
  `note1` varchar(200) DEFAULT NULL,
  `note2` varchar(200) DEFAULT NULL,
  `note3` varchar(200) DEFAULT NULL,
  `note4` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`recordId`),
  UNIQUE KEY `Index_2` (`address`),
  KEY `Index_3` (`state`),
  KEY `Index_4` (`userName`),
  KEY `Index_6` (`recordTime`),
  KEY `Index_5` (`lastModifyTime`),
  KEY `Index_7` (`submitTime`),
  KEY `Index_8` (`createTime`),
  KEY `Index_9` (`cerNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='基础概况信息表';

/*Data for the table `baseinfo` */

/*Table structure for table `carsinfo` */

DROP TABLE IF EXISTS `carsinfo`;

CREATE TABLE `carsinfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assetsId` bigint(20) DEFAULT NULL,
  `carsInfo` varchar(10) DEFAULT NULL,
  `carsWorth` varchar(20) DEFAULT NULL,
  `carsIsInstallment` int(11) DEFAULT NULL,
  `carsUsingInfo` varchar(10) DEFAULT NULL,
  `note1` varchar(200) DEFAULT NULL,
  `note2` varchar(200) DEFAULT NULL,
  `note3` varchar(200) DEFAULT NULL,
  `note4` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_5` (`assetsId`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`assetsId`) REFERENCES `familyassets` (`assetsId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='车辆信息表';

/*Data for the table `carsinfo` */

/*Table structure for table `customermanagereva` */

DROP TABLE IF EXISTS `customermanagereva`;

CREATE TABLE `customermanagereva` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `recordId` bigint(20) DEFAULT NULL,
  `loanSitu` varchar(50) DEFAULT NULL,
  `creditRecord` varchar(150) DEFAULT NULL,
  `otherBankRecord` varchar(150) DEFAULT NULL,
  `houseToMoney` varchar(20) DEFAULT NULL,
  `note1` varchar(200) DEFAULT NULL,
  `note2` varchar(200) DEFAULT NULL,
  `note3` varchar(200) DEFAULT NULL,
  `note4` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_11` (`recordId`),
  CONSTRAINT `FK_Reference_11` FOREIGN KEY (`recordId`) REFERENCES `baseinfo` (`recordId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户经理评价表';

/*Data for the table `customermanagereva` */

/*Table structure for table `devicescontrol` */

DROP TABLE IF EXISTS `devicescontrol`;

CREATE TABLE `devicescontrol` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deviceId` varchar(20) DEFAULT NULL,
  `createTime` varchar(50) DEFAULT NULL,
  `note1` varchar(200) DEFAULT NULL,
  `note2` varchar(200) DEFAULT NULL,
  `note3` varchar(200) DEFAULT NULL,
  `note4` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_1` (`createTime`),
  KEY `Index_3` (`deviceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='授权设备信息表';

/*Data for the table `devicescontrol` */

/*Table structure for table `familyassets` */

DROP TABLE IF EXISTS `familyassets`;

CREATE TABLE `familyassets` (
  `assetsId` bigint(20) NOT NULL AUTO_INCREMENT,
  `recordId` bigint(20) DEFAULT NULL,
  `fmAllAssets` float DEFAULT NULL,
  `mainAssets` varchar(50) DEFAULT NULL,
  `depositOurBank` varchar(20) DEFAULT NULL,
  `depositOtherBank` varchar(20) DEFAULT NULL,
  `note1` varchar(200) DEFAULT NULL,
  `note2` varchar(200) DEFAULT NULL,
  `note3` varchar(200) DEFAULT NULL,
  `note4` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`assetsId`),
  KEY `FK_Reference_2` (`recordId`),
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`recordId`) REFERENCES `baseinfo` (`recordId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='家庭资产情况表';

/*Data for the table `familyassets` */

/*Table structure for table `familyincurdebts` */

DROP TABLE IF EXISTS `familyincurdebts`;

CREATE TABLE `familyincurdebts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `recordId` bigint(20) DEFAULT NULL,
  `fmIncurDebts` int(11) DEFAULT NULL,
  `otherBankDebts` int(11) DEFAULT NULL,
  `ourBankDebts` int(11) DEFAULT NULL,
  `loanPurpose` varchar(50) DEFAULT NULL,
  `loanShap` varchar(50) DEFAULT NULL,
  `note1` varchar(200) DEFAULT NULL,
  `note2` varchar(200) DEFAULT NULL,
  `note3` varchar(200) DEFAULT NULL,
  `note4` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_7` (`recordId`),
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`recordId`) REFERENCES `baseinfo` (`recordId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='家庭负债表';

/*Data for the table `familyincurdebts` */

/*Table structure for table `familymemberinfo` */

DROP TABLE IF EXISTS `familymemberinfo`;

CREATE TABLE `familymemberinfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `recordId` bigint(20) DEFAULT NULL COMMENT '记录唯一性标识',
  `familyMemberCerNum` varchar(20) DEFAULT NULL,
  `cerNum` varchar(20) DEFAULT NULL,
  `familyMemberName` varchar(20) DEFAULT NULL,
  `yearIncome` float DEFAULT NULL,
  `leaderRelation` varchar(10) DEFAULT NULL,
  `profession` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `note1` varchar(200) DEFAULT NULL,
  `note2` varchar(200) DEFAULT NULL,
  `note3` varchar(200) DEFAULT NULL,
  `note4` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_8` (`recordId`),
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`recordId`) REFERENCES `baseinfo` (`recordId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='家庭成员表';

/*Data for the table `familymemberinfo` */

/*Table structure for table `financeservices` */

DROP TABLE IF EXISTS `financeservices`;

CREATE TABLE `financeservices` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `recordId` bigint(20) DEFAULT NULL,
  `usedProduct` varchar(100) DEFAULT NULL,
  `satisfaction` varchar(20) DEFAULT NULL,
  `isMoneyNeed` int(11) DEFAULT NULL,
  `moneyTodo` varchar(100) DEFAULT NULL,
  `moneyCount` int(11) DEFAULT NULL,
  `timeLimit` int(11) DEFAULT NULL,
  `guarantee` varchar(50) DEFAULT NULL,
  `fmDepositTodo` varchar(100) DEFAULT NULL,
  `needServices` varchar(100) DEFAULT NULL,
  `needServicesElse` varchar(200) DEFAULT NULL,
  `holpForServices` varchar(200) DEFAULT NULL,
  `suggestion` varchar(200) DEFAULT NULL,
  `bankCard` varchar(100) DEFAULT NULL,
  `electronBank` varchar(100) DEFAULT NULL,
  `agentPay` varchar(100) DEFAULT NULL,
  `auto` varchar(100) DEFAULT NULL,
  `newRequirement` varchar(200) DEFAULT NULL,
  `publicLoan` varchar(200) DEFAULT NULL,
  `privateLoan` varchar(500) DEFAULT NULL,
  `note1` varchar(200) DEFAULT NULL,
  `note2` varchar(200) DEFAULT NULL,
  `note3` varchar(200) DEFAULT NULL,
  `note4` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_9` (`recordId`),
  CONSTRAINT `FK_Reference_9` FOREIGN KEY (`recordId`) REFERENCES `baseinfo` (`recordId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='金融服务需求表';

/*Data for the table `financeservices` */

/*Table structure for table `financialassets` */

DROP TABLE IF EXISTS `financialassets`;

CREATE TABLE `financialassets` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assetsId` bigint(20) DEFAULT NULL,
  `financialInfo` varchar(50) DEFAULT NULL,
  `depositOurBank` varchar(20) DEFAULT NULL,
  `depositOtherBank` varchar(20) DEFAULT NULL,
  `note1` varchar(200) DEFAULT NULL,
  `note2` varchar(200) DEFAULT NULL,
  `note3` varchar(200) DEFAULT NULL,
  `note4` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_6` (`assetsId`),
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`assetsId`) REFERENCES `familyassets` (`assetsId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='金融资产表';

/*Data for the table `financialassets` */

/*Table structure for table `housepropertyinfo` */

DROP TABLE IF EXISTS `housepropertyinfo`;

CREATE TABLE `housepropertyinfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assetsId` bigint(20) DEFAULT NULL,
  `site` varchar(20) DEFAULT NULL,
  `structure` varchar(20) DEFAULT NULL,
  `purpose` varchar(10) DEFAULT NULL,
  `floorNum` int(11) DEFAULT NULL,
  `usedSitu` varchar(20) DEFAULT NULL,
  `houseArea` varchar(20) DEFAULT NULL,
  `houseWorth` varchar(20) DEFAULT NULL,
  `isInstallment` int(11) DEFAULT NULL,
  `hasCredentials` varchar(10) DEFAULT NULL,
  `note1` varchar(200) DEFAULT NULL,
  `note2` varchar(200) DEFAULT NULL,
  `note3` varchar(200) DEFAULT NULL,
  `note4` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_3` (`assetsId`),
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`assetsId`) REFERENCES `familyassets` (`assetsId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='房产信息表';

/*Data for the table `housepropertyinfo` */

/*Table structure for table `incomeexpenses` */

DROP TABLE IF EXISTS `incomeexpenses`;

CREATE TABLE `incomeexpenses` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `recordId` bigint(20) DEFAULT NULL,
  `fmAllIncome` float DEFAULT NULL,
  `fmExpenses` float DEFAULT NULL,
  `incomeSrc` varchar(50) DEFAULT NULL,
  `perIncome` float DEFAULT NULL,
  `fmOtherMemberIn` float DEFAULT NULL,
  `fmExpensesProj` varchar(50) DEFAULT NULL,
  `fmInOutRatio` varchar(20) DEFAULT NULL,
  `note1` varchar(200) DEFAULT NULL,
  `note2` varchar(200) DEFAULT NULL,
  `note3` varchar(200) DEFAULT NULL,
  `note4` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_1` (`recordId`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`recordId`) REFERENCES `baseinfo` (`recordId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='家庭收支情况表';

/*Data for the table `incomeexpenses` */

/*Table structure for table `industriesinfo` */

DROP TABLE IF EXISTS `industriesinfo`;

CREATE TABLE `industriesinfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `industryId` bigint(20) DEFAULT NULL,
  `industryName` varchar(20) DEFAULT NULL,
  `industryAlias` varchar(50) DEFAULT NULL,
  `fatherId` bigint(20) DEFAULT NULL,
  `infoId` varchar(10) DEFAULT NULL,
  `infoManageId` varchar(10) DEFAULT NULL,
  `note1` varchar(200) DEFAULT NULL,
  `note2` varchar(200) DEFAULT NULL,
  `note3` varchar(200) DEFAULT NULL,
  `note4` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_2` (`industryName`),
  KEY `Index_3` (`fatherId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `industriesinfo` */

/*Table structure for table `landinfo` */

DROP TABLE IF EXISTS `landinfo`;

CREATE TABLE `landinfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assetsId` bigint(20) NOT NULL,
  `area` varchar(20) DEFAULT NULL,
  `worth` varchar(20) DEFAULT NULL,
  `property` varchar(20) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `usedSitu` varchar(20) DEFAULT NULL,
  `isMoneyClear` int(11) DEFAULT NULL,
  `note1` varchar(200) DEFAULT NULL,
  `note2` varchar(200) DEFAULT NULL,
  `note3` varchar(200) DEFAULT NULL,
  `note4` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_4` (`assetsId`),
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`assetsId`) REFERENCES `familyassets` (`assetsId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='土地信息表';

/*Data for the table `landinfo` */

/*Table structure for table `locationinfo` */

DROP TABLE IF EXISTS `locationinfo`;

CREATE TABLE `locationinfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) DEFAULT NULL,
  `longitude` varchar(20) DEFAULT NULL,
  `latitude` varchar(20) DEFAULT NULL,
  `recordTime` varchar(50) DEFAULT NULL,
  `note1` varchar(200) DEFAULT NULL,
  `note2` varchar(200) DEFAULT NULL,
  `note3` varchar(200) DEFAULT NULL,
  `note4` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_19` (`userId`),
  CONSTRAINT `FK_Reference_19` FOREIGN KEY (`userId`) REFERENCES `usersinfo` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='位置信息表';

/*Data for the table `locationinfo` */

/*Table structure for table `logsinfo` */

DROP TABLE IF EXISTS `logsinfo`;

CREATE TABLE `logsinfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `operatedTime` varchar(50) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `operation` varchar(20) DEFAULT NULL,
  `note1` varchar(200) DEFAULT NULL,
  `note2` varchar(200) DEFAULT NULL,
  `note3` varchar(200) DEFAULT NULL,
  `note4` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_2` (`operatedTime`),
  KEY `FK_Reference_18` (`userId`),
  CONSTRAINT `FK_Reference_18` FOREIGN KEY (`userId`) REFERENCES `usersinfo` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日志信息表';

/*Data for the table `logsinfo` */

/*Table structure for table `organizationinfo` */

DROP TABLE IF EXISTS `organizationinfo`;

CREATE TABLE `organizationinfo` (
  `organizationId` bigint(20) NOT NULL AUTO_INCREMENT,
  `organizationName` varchar(20) DEFAULT NULL,
  `organizationDescription` varchar(50) DEFAULT NULL,
  `fatherId` bigint(20) DEFAULT NULL,
  `note1` varchar(200) DEFAULT NULL,
  `note2` varchar(200) DEFAULT NULL,
  `note3` varchar(200) DEFAULT NULL,
  `note4` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`organizationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组织机构表';

/*Data for the table `organizationinfo` */

/*Table structure for table `permissionsinfo` */

DROP TABLE IF EXISTS `permissionsinfo`;

CREATE TABLE `permissionsinfo` (
  `permissionId` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  `isMenu` tinyint(1) DEFAULT NULL,
  `fatherId` bigint(20) DEFAULT NULL,
  `note1` varchar(200) DEFAULT NULL,
  `note2` varchar(200) DEFAULT NULL,
  `note3` varchar(200) DEFAULT NULL,
  `note4` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`permissionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限信息表';

/*Data for the table `permissionsinfo` */

/*Table structure for table `photosinfo` */

DROP TABLE IF EXISTS `photosinfo`;

CREATE TABLE `photosinfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `recordId` bigint(20) DEFAULT NULL COMMENT '记录唯一性标识',
  `photoUri` varchar(100) DEFAULT NULL,
  `note1` varchar(200) DEFAULT NULL,
  `note2` varchar(200) DEFAULT NULL,
  `note3` varchar(200) DEFAULT NULL,
  `note4` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_17` (`recordId`),
  CONSTRAINT `FK_Reference_17` FOREIGN KEY (`recordId`) REFERENCES `baseinfo` (`recordId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='照片记录表';

/*Data for the table `photosinfo` */

/*Table structure for table `rolepermissioninfo` */

DROP TABLE IF EXISTS `rolepermissioninfo`;

CREATE TABLE `rolepermissioninfo` (
  `roleId` bigint(20) DEFAULT NULL,
  `permissionId` bigint(20) DEFAULT NULL,
  `note1` varchar(200) DEFAULT NULL,
  `note2` varchar(200) DEFAULT NULL,
  `note3` varchar(200) DEFAULT NULL,
  `note4` varchar(200) DEFAULT NULL,
  KEY `FK_Reference_14` (`roleId`),
  KEY `FK_Reference_15` (`permissionId`),
  CONSTRAINT `FK_Reference_15` FOREIGN KEY (`permissionId`) REFERENCES `permissionsinfo` (`permissionId`),
  CONSTRAINT `FK_Reference_14` FOREIGN KEY (`roleId`) REFERENCES `rolesinfo` (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色权限映射关系表';

/*Data for the table `rolepermissioninfo` */

/*Table structure for table `rolesinfo` */

DROP TABLE IF EXISTS `rolesinfo`;

CREATE TABLE `rolesinfo` (
  `roleId` bigint(20) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(20) DEFAULT NULL,
  `roleDescription` varchar(50) DEFAULT NULL,
  `createTime` varchar(50) DEFAULT NULL,
  `note1` varchar(200) DEFAULT NULL,
  `note2` varchar(200) DEFAULT NULL,
  `note3` varchar(200) DEFAULT NULL,
  `note4` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`roleId`),
  KEY `Index_2` (`createTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色信息 表';

/*Data for the table `rolesinfo` */

/*Table structure for table `userroleinfo` */

DROP TABLE IF EXISTS `userroleinfo`;

CREATE TABLE `userroleinfo` (
  `userId` bigint(20) DEFAULT NULL,
  `roleId` bigint(20) DEFAULT NULL,
  `note1` varchar(200) DEFAULT NULL,
  `note2` varchar(200) DEFAULT NULL,
  `note3` varchar(200) DEFAULT NULL,
  `note4` varchar(200) DEFAULT NULL,
  KEY `FK_Reference_12` (`userId`),
  KEY `FK_Reference_13` (`roleId`),
  CONSTRAINT `FK_Reference_13` FOREIGN KEY (`roleId`) REFERENCES `rolesinfo` (`roleId`),
  CONSTRAINT `FK_Reference_12` FOREIGN KEY (`userId`) REFERENCES `usersinfo` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色映射关系表';

/*Data for the table `userroleinfo` */

/*Table structure for table `usersinfo` */

DROP TABLE IF EXISTS `usersinfo`;

CREATE TABLE `usersinfo` (
  `userId` bigint(20) NOT NULL AUTO_INCREMENT,
  `organizationId` bigint(20) DEFAULT NULL,
  `userName` varchar(20) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `displayUserName` varchar(20) DEFAULT NULL,
  `curDesignateFlag` int(11) DEFAULT NULL,
  `createTime` varchar(50) DEFAULT NULL,
  `lastLoginTime` varchar(50) DEFAULT NULL,
  `note1` varchar(200) DEFAULT NULL,
  `note2` varchar(200) DEFAULT NULL,
  `note3` varchar(200) DEFAULT NULL,
  `note4` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`userId`,`userName`),
  KEY `Index_3` (`userName`),
  KEY `Index_4` (`createTime`),
  KEY `Index_5` (`lastLoginTime`),
  KEY `FK_Reference_16` (`organizationId`),
  CONSTRAINT `FK_Reference_16` FOREIGN KEY (`organizationId`) REFERENCES `organizationinfo` (`organizationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='帐号表';

/*Data for the table `usersinfo` */

/*Table structure for table `villagemanagereva` */

DROP TABLE IF EXISTS `villagemanagereva`;

CREATE TABLE `villagemanagereva` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `recordId` bigint(20) DEFAULT NULL,
  `truth` varchar(10) DEFAULT NULL,
  `localLivingTime` varchar(20) DEFAULT NULL,
  `operatingCapacity` varchar(50) DEFAULT NULL,
  `projectPotential` varchar(10) DEFAULT NULL,
  `operationalRisks` varchar(10) DEFAULT NULL,
  `developmentProspects` varchar(10) DEFAULT NULL,
  `operatingStability` varchar(10) DEFAULT NULL,
  `capitaNetIncomeLevel` varchar(10) DEFAULT NULL,
  `disposableIncomeLevel` varchar(20) DEFAULT NULL,
  `familyPropertyLevel` varchar(10) DEFAULT NULL,
  `payTaxes` varchar(20) DEFAULT NULL,
  `respectSitu` varchar(10) DEFAULT NULL,
  `neighborhood` varchar(10) DEFAULT NULL,
  `publicWelfareLevel` varchar(10) DEFAULT NULL,
  `creditworthiness` varchar(10) DEFAULT NULL,
  `conduct` varchar(30) DEFAULT NULL,
  `praised` varchar(10) DEFAULT NULL,
  `supplement` varchar(100) DEFAULT NULL,
  `isImportantObject` varchar(10) DEFAULT NULL,
  `note1` varchar(200) DEFAULT NULL,
  `note2` varchar(200) DEFAULT NULL,
  `note3` varchar(200) DEFAULT NULL,
  `note4` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_10` (`recordId`),
  CONSTRAINT `FK_Reference_10` FOREIGN KEY (`recordId`) REFERENCES `baseinfo` (`recordId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='村委会评价表';

/*Data for the table `villagemanagereva` */

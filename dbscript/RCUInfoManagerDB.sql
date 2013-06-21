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
  `yearIncome` varchar(256) DEFAULT NULL,
  `annualWageIncome` varchar(20) DEFAULT NULL,
  `workYears` varchar(20) DEFAULT NULL,
  `workSitu` varchar(100) DEFAULT NULL,
  `unitProp` varchar(50) DEFAULT NULL,
  `unitIndustryId` varchar(20) DEFAULT NULL,
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

insert into `baseinfo` values(1, '小岞镇新桥村', '张惠忠', '350583198011151352', 0, 0, '身份证', '20010302', '20210302', '一般农户', '19801115', '中国', 0, '汉族', '群众', '小岞镇新桥村09组410号', '362100', '87830100', '13100000000', '350521113204', '新桥', '其他', '初中', '良好', '普通客户', '自置', '已婚', '养老保险,医疗保险', '一般', '专业技术人员', '务农', 6, '户口所在地', '农、林、牧、渔业', '', null, null, null, null, '3-6万元', '5年（含）以上', '一般', '其他', '1010101', '稻谷种植', null, '无职业', '一般员工', '无', 1, 'admin', '2013-06-14 00:00:00.000', '2013-06-14 00:00:00.000', null, '2013-06-14 00:00:00.000', null, null, null, null);

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

insert into `carsinfo` values(1, 1, '轿车', '10-30万元', 1, '自用', null, null, null, null);
insert into `carsinfo` values(2, 1, '货车', '10万以内', 1, '营运', null, null, null, null);

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

insert into `customermanagereva` values(1, 1, '', '报告期内无银行信用记录', '一般', '较好', null, null, null, null);

/*Data for the table `customermanagereva` */

/*Table structure for table `familyassets` */

DROP TABLE IF EXISTS `familyassets`;

CREATE TABLE `familyassets` (
  `assetsId` bigint(20) NOT NULL AUTO_INCREMENT,
  `recordId` bigint(20) DEFAULT NULL,
  `fmAllAssets` double(8,4) DEFAULT NULL,
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

insert into `familyassets` values(1, 1, 250, '房屋,土地,车辆,金融资产', '3万元内', '3万元内', null, null, null, null);

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

insert into `familyincurdebts` values(1, 1, 5, 5, null, '买车', '现金', null, null, null, null);

/*Data for the table `familyincurdebts` */

/*Table structure for table `familymemberinfo` */

DROP TABLE IF EXISTS `familymemberinfo`;

CREATE TABLE `familymemberinfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `recordId` bigint(20) DEFAULT NULL COMMENT '记录唯一性标识',
  `familyMemberCerNum` varchar(20) DEFAULT NULL,
  `cerNum` varchar(20) DEFAULT NULL,
  `familyMemberName` varchar(20) DEFAULT NULL,
  `yearIncome` double(8,4) DEFAULT NULL,
  `leaderRelation` varchar(10) DEFAULT NULL,
  `profession` varchar(256) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `note1` varchar(200) DEFAULT NULL,
  `note2` varchar(200) DEFAULT NULL,
  `note3` varchar(200) DEFAULT NULL,
  `note4` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_8` (`recordId`),
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`recordId`) REFERENCES `baseinfo` (`recordId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='家庭成员表';

insert into `familymemberinfo` values(1, 1, '350583199806030001', '350583198011151352', '张啥小', 1, '子女', '专业技术人员', '本地区', null, null, null, null);
insert into `familymemberinfo` values(2, 1, '350583198201010002', '350583198011151352', '李妹', 1, '配偶', '专业技术人员', '本地区', null, null, null, null);
insert into `familymemberinfo` values(3, 1, '350583198705040003', '350583198011151352', '张三丰', 1, '子女', '专业技术人员', '本地区', null, null, null, null);

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

insert into `financeservices` values(1, 1, '存款,贷款,信用卡,POS机,保管箱,网上银行,居家银行,短信银行,电话银行,手机银行,其他', '较为适用', 0, '购买农业生产资料', 2, 36, '房地产,存单,债券,保证人', '做生意,子女上学,盖（买）房子,购买大件物品,获得利息,购买其他金融资产（如股票、债券、基金、保险单）,其他', null, null, null, null, '信用卡,福万通卡,贵宾卡', '短信银行,电话银行,网上银行,手机银行', '代缴水费,代缴电费,代缴烟草费,代发工资,电子扣税,保险费代扣', '银联POS机,福农通,小额支付便民点,生意通,居家银行', null, '流动资金贷款,固定资产贷款,小企业联保贷款,中小企业保证贷款,担保公司担保贷款,海域使用权抵押贷款,船舶抵押贷款,商标专用权质押贷款,保函业务,银行承兑汇票,银行承兑汇票贴现', '农户小额信用贷款,农户联保贷款,农户保证贷款,农户抵押贷款,农户质押贷款,个人存单质押贷款,“万通宝”农户小额贷款,“万通宝”个人经营贷款,“组合宝”农户小额贷款,“组合宝”个人经营贷款,“保无忧”新农保参保人员贷款,“两女”户计生贴息贷款,生源地信用助学贷款,农村青年创业贷款,巾帼创业贷款,农户异地创业贷款,“惠村通”,农户建房贷款,个人住房按揭贷款,个人汽车按揭贷款,农民专业合作社贷款,公职人员消费贷款', null, null, null, null);

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

insert into `financialassets` values(1, 1, '活期存款,股票', '3万元内', '3万元内', null, null, null, null);

/*Data for the table `financialassets` */

/*Table structure for table `housepropertyinfo` */

DROP TABLE IF EXISTS `housepropertyinfo`;

CREATE TABLE `housepropertyinfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assetsId` bigint(20) DEFAULT NULL,
  `nature` varchar(20) DEFAULT NULL,
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

insert into `housepropertyinfo` values(1, 1, '自建房', '户口地乡村', '砖混', '居住', 1, '自住', '100㎡内', '30-60万', 1, '无办证', null, null, null, null);
insert into `housepropertyinfo` values(2, 1, '商品房', '户口地乡村', '钢混', '商用楼', 1, '出租', '100-300㎡', '30-60万', 1, '无办证', null, null, null, null);

/*Data for the table `housepropertyinfo` */

/*Table structure for table `incomeexpenses` */

DROP TABLE IF EXISTS `incomeexpenses`;

CREATE TABLE `incomeexpenses` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `recordId` bigint(20) DEFAULT NULL,
  `fmAllIncome` double(8,4) DEFAULT NULL,
  `fmExpenses` double(8,4) DEFAULT NULL,
  `incomeSrc` varchar(50) DEFAULT NULL,
  `perIncome` double(8,4) DEFAULT NULL,
  `fmOtherMemberIn` double(8,4) DEFAULT NULL,
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

insert into `incomeexpenses` values(1, 1, 6, 5, '工薪,务农,打工', 3, 3, '生活性支出', '不能', null, null, null, null);

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

insert into `landinfo` values(1, 1, '100-300㎡', '50', '集体证', '山地或滩涂', '自用', 0, null, null, null, null);
insert into `landinfo` values(2, 1, '100-300㎡', '45', '集体证', '山地或滩涂', '自用', 0, null, null, null, null);

/*Data for the table `landinfo` */

/*Table structure for table `locationinfo` */

DROP TABLE IF EXISTS `locationinfo`;

CREATE TABLE `locationinfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) DEFAULT NULL,
  `longitude` varchar(20) DEFAULT NULL,
  `latitude` varchar(20) DEFAULT NULL,
  `recordTime` varchar(50) DEFAULT NULL,
  `note1` varchar(200) DEFAULT NULL,
  `note2` varchar(200) DEFAULT NULL,
  `note3` varchar(200) DEFAULT NULL,
  `note4` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_19` (`userName`),
  CONSTRAINT `FK_Reference_19` FOREIGN KEY (`userName`) REFERENCES `usersinfo` (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='位置信息表';

/*Data for the table `locationinfo` */

DROP TABLE IF EXISTS `t_appoint`;

CREATE TABLE `t_appoint` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `recordId` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `downloaded` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `t_appoint` */

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

/*Table structure for table `t_role` */
DROP TABLE IF EXISTS t_role;
CREATE TABLE `t_role` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_code` VARCHAR(36) DEFAULT NULL COMMENT '角色编码',
  `role_name` VARCHAR(60) DEFAULT NULL COMMENT '角色名称',
  `app_code` VARCHAR(30) NOT NULL COMMENT '应用编码',
  `role_type` CHAR(1) DEFAULT NULL COMMENT '1:管理员角色 2：普通角色',
  `remark` VARCHAR(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `AK_ak_app_role` (`role_code`)
) ENGINE=INNODB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='应用角色';

/*Table structure for table `t_acl` */
DROP TABLE IF EXISTS t_acl;
CREATE TABLE `t_acl` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `principal_type` VARCHAR(30) DEFAULT NULL COMMENT '主休类型： 1--角色\n            2--用户',
  `principal_code` VARCHAR(100) DEFAULT NULL COMMENT '主体标识',
  `priv_code` VARCHAR(30) NOT NULL COMMENT '权限编码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_key` (`principal_type`,`principal_code`,`priv_code`)
) ENGINE=INNODB AUTO_INCREMENT=963 DEFAULT CHARSET=utf8 COMMENT='应用系统访问控制列表';

/*Data for the table `t_acl` */

/*Table structure for table `t_priv_tree` */
DROP TABLE IF EXISTS t_priv_tree;
CREATE TABLE `t_priv_tree` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `node_code` VARCHAR(30) NOT NULL COMMENT '权限树节点编码,采用层级编码，每层编码字符为2位，如01 0101 0102等。',
  `node_name` VARCHAR(60) NOT NULL COMMENT '权限树节点名称',
  `node_type` CHAR(1) NOT NULL COMMENT '1:分支节点 2：叶子节点',
  `priv_code` VARCHAR(30) DEFAULT NULL COMMENT '当node_type=2时，不能为空，表示一个真实的系统权限',
  `order_no` INT(11) NOT NULL COMMENT '同级排序号',
  `remark` VARCHAR(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='应用权限';

/*Data for the table `t_priv_tree` */

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
  `needModifyPassword` int(1),
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

DROP TABLE IF EXISTS `photosinfo`;

create table `photosinfo`(
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `recordId` bigint(20) DEFAULT NULL,
  `photoUri` varchar(100) DEFAULT NULL,
  `note1` varchar(200) DEFAULT NULL,
  `note2` varchar(200) DEFAULT NULL,
  `note3` varchar(200) DEFAULT NULL,
  `note4` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_1` (`id`),
  KEY `Index_2` (`photoUri`),
  KEY `FK_Reference_17` (`recordId`),
  CONSTRAINT `FK_Reference_17` FOREIGN KEY (`recordId`) REFERENCES `baseinfo` (`recordId`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='照片信息表';

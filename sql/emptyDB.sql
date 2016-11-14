/*
MySQL Data Transfer
Source Host: localhost
Source Database: starerp
Target Host: localhost
Target Database: starerp
Date: 2011-3-21 21:35:30
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for accredition
-- ----------------------------
CREATE TABLE `accredition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adate` datetime DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `employee_empId` int(11) DEFAULT NULL,
  `preparation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKB43588D64551A6C` (`employee_empId`),
  KEY `FKB43588D52979ED0` (`preparation_id`),
  CONSTRAINT `FKB43588D52979ED0` FOREIGN KEY (`preparation_id`) REFERENCES `preparation` (`id`),
  CONSTRAINT `FKB43588D64551A6C` FOREIGN KEY (`employee_empId`) REFERENCES `employee` (`empId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for annoucement
-- ----------------------------
CREATE TABLE `annoucement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext,
  `date` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for auxmaterial
-- ----------------------------
CREATE TABLE `auxmaterial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ewhnum` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `owhnum` int(11) DEFAULT NULL,
  `purDate` date DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `uprice` float DEFAULT NULL,
  `qua_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKA21FDBEB4E564006` (`qua_id`),
  CONSTRAINT `FKA21FDBEB4E564006` FOREIGN KEY (`qua_id`) REFERENCES `quaprolist` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for changef
-- ----------------------------
CREATE TABLE `changef` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bno` int(11) DEFAULT NULL,
  `cha_no` varchar(255) DEFAULT NULL,
  `channote` varchar(255) DEFAULT NULL,
  `competeno` int(11) DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  `prorecord` varchar(255) DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `ex_sign` int(11) DEFAULT NULL,
  `former_pro` int(11) NOT NULL,
  `to_pro` int(11) NOT NULL,
  `menu_make` int(11) DEFAULT NULL,
  `wh_sign` int(11) DEFAULT NULL,
  `ws_sign` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2C0B62B669CEF89A` (`ws_sign`),
  KEY `FK2C0B62B6EABE7475` (`former_pro`),
  KEY `FK2C0B62B6BA270923` (`ex_sign`),
  KEY `FK2C0B62B69CF0757F` (`to_pro`),
  KEY `FK2C0B62B6AE17B428` (`menu_make`),
  KEY `FK2C0B62B65709A9C5` (`wh_sign`),
  CONSTRAINT `FK2C0B62B65709A9C5` FOREIGN KEY (`wh_sign`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FK2C0B62B669CEF89A` FOREIGN KEY (`ws_sign`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FK2C0B62B69CF0757F` FOREIGN KEY (`to_pro`) REFERENCES `itemtype` (`id`),
  CONSTRAINT `FK2C0B62B6AE17B428` FOREIGN KEY (`menu_make`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FK2C0B62B6BA270923` FOREIGN KEY (`ex_sign`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FK2C0B62B6EABE7475` FOREIGN KEY (`former_pro`) REFERENCES `itemtype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for controllerunit
-- ----------------------------
CREATE TABLE `controllerunit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip090k` varchar(255) DEFAULT NULL,
  `ip690k` varchar(255) DEFAULT NULL,
  `parallelport` varchar(255) DEFAULT NULL,
  `parportU` varchar(255) DEFAULT NULL,
  `parportethpot` varchar(255) DEFAULT NULL,
  `serialaparport` varchar(255) DEFAULT NULL,
  `serialoparport` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dailyproduction
-- ----------------------------
CREATE TABLE `dailyproduction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feedDaily` int(11) DEFAULT NULL,
  `feedMonth` int(11) DEFAULT NULL,
  `feedYear` int(11) DEFAULT NULL,
  `planComplete` float DEFAULT NULL,
  `planDaily` int(11) DEFAULT NULL,
  `rateDaily` float DEFAULT NULL,
  `storeDaily` int(11) DEFAULT NULL,
  `storeMonth` int(11) DEFAULT NULL,
  `storeYear` int(11) DEFAULT NULL,
  `dailyproductionform_id` int(11) DEFAULT NULL,
  `itemType_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4E967B7210479C70` (`dailyproductionform_id`),
  KEY `FK4E967B721AD09463` (`itemType_id`),
  CONSTRAINT `FK4E967B721AD09463` FOREIGN KEY (`itemType_id`) REFERENCES `itemtype` (`id`),
  CONSTRAINT `FK4E967B7210479C70` FOREIGN KEY (`dailyproductionform_id`) REFERENCES `dailyproductionform` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dailyproductionform
-- ----------------------------
CREATE TABLE `dailyproductionform` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKDF577F36922EFE26` (`department_id`),
  CONSTRAINT `FKDF577F36922EFE26` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for department
-- ----------------------------
CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `dptDes` varchar(255) DEFAULT NULL,
  `dptName` varchar(255) DEFAULT NULL,
  `dptType` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for discardproduction
-- ----------------------------
CREATE TABLE `discardproduction` (
  `scg_id` int(11) NOT NULL AUTO_INCREMENT,
  `losemoney` float NOT NULL,
  `losetime` varchar(255) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `ite_id` int(11) DEFAULT NULL,
  `scr_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`scg_id`),
  KEY `FK6DC8BB753B2CFE5` (`scr_id`),
  KEY `FK6DC8BB78A741576` (`ite_id`),
  CONSTRAINT `FK6DC8BB78A741576` FOREIGN KEY (`ite_id`) REFERENCES `itemtype` (`id`),
  CONSTRAINT `FK6DC8BB753B2CFE5` FOREIGN KEY (`scr_id`) REFERENCES `discardverify` (`scr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for discardreviewf
-- ----------------------------
CREATE TABLE `discardreviewf` (
  `scaf_id` int(11) NOT NULL AUTO_INCREMENT,
  `advice` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `scanote` varchar(255) DEFAULT NULL,
  `inspector_empId` int(11) DEFAULT NULL,
  `manager_empId` int(11) DEFAULT NULL,
  PRIMARY KEY (`scaf_id`),
  KEY `FK47B869D0E512482B` (`manager_empId`),
  KEY `FK47B869D01AA653F5` (`inspector_empId`),
  CONSTRAINT `FK47B869D01AA653F5` FOREIGN KEY (`inspector_empId`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FK47B869D0E512482B` FOREIGN KEY (`manager_empId`) REFERENCES `employee` (`empId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for discardreviews
-- ----------------------------
CREATE TABLE `discardreviews` (
  `scas_id` int(11) NOT NULL AUTO_INCREMENT,
  `advice` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `flag` int(11) DEFAULT NULL,
  `scanote` varchar(255) DEFAULT NULL,
  `inspector_empId` int(11) DEFAULT NULL,
  `manager_empId` int(11) DEFAULT NULL,
  PRIMARY KEY (`scas_id`),
  KEY `FK47B869DDE512482B` (`manager_empId`),
  KEY `FK47B869DD1AA653F5` (`inspector_empId`),
  CONSTRAINT `FK47B869DD1AA653F5` FOREIGN KEY (`inspector_empId`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FK47B869DDE512482B` FOREIGN KEY (`manager_empId`) REFERENCES `employee` (`empId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for discardreviewt
-- ----------------------------
CREATE TABLE `discardreviewt` (
  `scat_id` int(11) NOT NULL AUTO_INCREMENT,
  `advice` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `scanote` varchar(255) DEFAULT NULL,
  `inspector_empId` int(11) DEFAULT NULL,
  `manager_empId` int(11) DEFAULT NULL,
  PRIMARY KEY (`scat_id`),
  KEY `FK47B869DEE512482B` (`manager_empId`),
  KEY `FK47B869DE1AA653F5` (`inspector_empId`),
  CONSTRAINT `FK47B869DE1AA653F5` FOREIGN KEY (`inspector_empId`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FK47B869DEE512482B` FOREIGN KEY (`manager_empId`) REFERENCES `employee` (`empId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for discardverify
-- ----------------------------
CREATE TABLE `discardverify` (
  `scr_id` int(11) NOT NULL AUTO_INCREMENT,
  `rdate` date DEFAULT NULL,
  `discardreviewf_scaf_id` int(11) DEFAULT NULL,
  `discardreviews_scas_id` int(11) DEFAULT NULL,
  `discardreviewt_scat_id` int(11) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `fdpt` int(11) DEFAULT NULL,
  `ite_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`scr_id`),
  KEY `FKC7115277CBFA34FD` (`discardreviews_scas_id`),
  KEY `FKC711527759114C40` (`fdpt`),
  KEY `FKC7115277BBA95B4C` (`emp_id`),
  KEY `FKC71152778A741576` (`ite_id`),
  KEY `FKC7115277603F185E` (`discardreviewt_scat_id`),
  KEY `FKC7115277447AA910` (`discardreviewf_scaf_id`),
  CONSTRAINT `FKC7115277447AA910` FOREIGN KEY (`discardreviewf_scaf_id`) REFERENCES `discardreviewf` (`scaf_id`),
  CONSTRAINT `FKC711527759114C40` FOREIGN KEY (`fdpt`) REFERENCES `department` (`id`),
  CONSTRAINT `FKC7115277603F185E` FOREIGN KEY (`discardreviewt_scat_id`) REFERENCES `discardreviewt` (`scat_id`),
  CONSTRAINT `FKC71152778A741576` FOREIGN KEY (`ite_id`) REFERENCES `itemtype` (`id`),
  CONSTRAINT `FKC7115277BBA95B4C` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FKC7115277CBFA34FD` FOREIGN KEY (`discardreviews_scas_id`) REFERENCES `discardreviews` (`scas_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for employee
-- ----------------------------
CREATE TABLE `employee` (
  `empId` int(11) NOT NULL AUTO_INCREMENT,
  `birdate` datetime DEFAULT NULL,
  `defaultMenu` varchar(255) DEFAULT NULL,
  `dormitory` varchar(255) DEFAULT NULL,
  `eDate` datetime DEFAULT NULL,
  `education` varchar(255) DEFAULT NULL,
  `empName` varchar(255) DEFAULT NULL,
  `empSn` varchar(255) DEFAULT NULL,
  `idCardNo` varchar(255) DEFAULT NULL,
  `jobTitle` varchar(255) DEFAULT NULL,
  `lDate` datetime DEFAULT NULL,
  `marStatus` varchar(255) DEFAULT NULL,
  `nature` varchar(255) DEFAULT NULL,
  `phoneNo` varchar(255) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `political` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `trStatus` varchar(255) DEFAULT NULL,
  `dpt_id` int(11) DEFAULT NULL,
  `jobs_id` int(11) DEFAULT NULL,
  `training` int(11) DEFAULT NULL,
  PRIMARY KEY (`empId`),
  KEY `FK4722E6AE9E67C50` (`dpt_id`),
  KEY `FK4722E6AE5A18B260` (`training`),
  KEY `FK4722E6AE40E6E0A6` (`jobs_id`),
  CONSTRAINT `FK4722E6AE40E6E0A6` FOREIGN KEY (`jobs_id`) REFERENCES `jobs` (`job_id`),
  CONSTRAINT `FK4722E6AE5A18B260` FOREIGN KEY (`training`) REFERENCES `training` (`id`),
  CONSTRAINT `FK4722E6AE9E67C50` FOREIGN KEY (`dpt_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for employeerap
-- ----------------------------
CREATE TABLE `employeerap` (
  `empRpId` int(11) NOT NULL AUTO_INCREMENT,
  `rapDate` datetime DEFAULT NULL,
  `rapName` varchar(255) DEFAULT NULL,
  `rapReason` varchar(255) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`empRpId`),
  KEY `FK367BB293BBA95B4C` (`emp_id`),
  CONSTRAINT `FK367BB293BBA95B4C` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`empId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for feedexamine
-- ----------------------------
CREATE TABLE `feedexamine` (
  `fee_id` int(11) NOT NULL AUTO_INCREMENT,
  `confirm` bit(1) DEFAULT NULL,
  `estatus` varchar(255) DEFAULT NULL,
  `feeDate` date DEFAULT NULL,
  `feestyle` varchar(255) DEFAULT NULL,
  `fromt` varchar(255) DEFAULT NULL,
  `orderno` varchar(255) DEFAULT NULL,
  `warehouseDate` date DEFAULT NULL,
  `buyer_id` int(11) DEFAULT NULL,
  `spec_id` int(11) DEFAULT NULL,
  `sup_id` int(11) DEFAULT NULL,
  `wh_id` int(11) DEFAULT NULL,
  `wh2_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`fee_id`),
  KEY `FK7833240351C6C2D5` (`sup_id`),
  KEY `FK78332403CEC6B681` (`buyer_id`),
  KEY `FK78332403FD92CA3` (`wh_id`),
  KEY `FK783324039164A379` (`spec_id`),
  KEY `FK78332403D9FDF1F3` (`wh2_id`),
  CONSTRAINT `FK78332403D9FDF1F3` FOREIGN KEY (`wh2_id`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FK7833240351C6C2D5` FOREIGN KEY (`sup_id`) REFERENCES `quaprolist` (`id`),
  CONSTRAINT `FK783324039164A379` FOREIGN KEY (`spec_id`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FK78332403CEC6B681` FOREIGN KEY (`buyer_id`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FK78332403FD92CA3` FOREIGN KEY (`wh_id`) REFERENCES `employee` (`empId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for feegood
-- ----------------------------
CREATE TABLE `feegood` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bsno` int(11) DEFAULT NULL,
  `confirmnum` bit(1) DEFAULT NULL,
  `exresult` bit(1) NOT NULL,
  `factno` int(11) DEFAULT NULL,
  `fnote` varchar(255) DEFAULT NULL,
  `fpnum` int(11) DEFAULT NULL,
  `dep_id` int(11) DEFAULT NULL,
  `feed_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC5D4D9434ED7F45D` (`item_id`),
  KEY `FKC5D4D943949A849` (`dep_id`),
  KEY `FKC5D4D94328C0D0B8` (`feed_id`),
  CONSTRAINT `FKC5D4D94328C0D0B8` FOREIGN KEY (`feed_id`) REFERENCES `feedexamine` (`fee_id`),
  CONSTRAINT `FKC5D4D9434ED7F45D` FOREIGN KEY (`item_id`) REFERENCES `itemtype` (`id`),
  CONSTRAINT `FKC5D4D943949A849` FOREIGN KEY (`dep_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for inventory
-- ----------------------------
CREATE TABLE `inventory` (
  `inv_id` int(11) NOT NULL AUTO_INCREMENT,
  `solationnum` int(11) DEFAULT NULL,
  `stocknum` int(11) DEFAULT NULL,
  `totalnum` int(11) DEFAULT NULL,
  `wsstock` int(11) DEFAULT NULL,
  `ite_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`inv_id`),
  KEY `FK8790195C8A741576` (`ite_id`),
  CONSTRAINT `FK8790195C8A741576` FOREIGN KEY (`ite_id`) REFERENCES `itemtype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for item
-- ----------------------------
CREATE TABLE `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `isdel` int(11) DEFAULT NULL,
  `item_category` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `itemtype_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK22EF331AD09463` (`itemtype_id`),
  CONSTRAINT `FK22EF331AD09463` FOREIGN KEY (`itemtype_id`) REFERENCES `itemtype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for itemrelation
-- ----------------------------
CREATE TABLE `itemrelation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `controllerunitInfo` varchar(255) DEFAULT NULL,
  `isCon` int(11) DEFAULT NULL,
  `partamount` int(11) DEFAULT NULL,
  `part_id` int(11) NOT NULL,
  `pitem_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE346A4FC15B95ED` (`pitem_id`),
  KEY `FKE346A4FA171DF7D` (`part_id`),
  CONSTRAINT `FKE346A4FA171DF7D` FOREIGN KEY (`part_id`) REFERENCES `itemtype` (`id`),
  CONSTRAINT `FKE346A4FC15B95ED` FOREIGN KEY (`pitem_id`) REFERENCES `itemtype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for itemtype
-- ----------------------------
CREATE TABLE `itemtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bondedNo` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `isCon` int(11) DEFAULT NULL,
  `isbonded` int(11) DEFAULT NULL,
  `isdel` int(11) DEFAULT NULL,
  `mCode` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `ite_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4A0A210D1D21101C` (`ite_id`),
  CONSTRAINT `FK4A0A210D1D21101C` FOREIGN KEY (`ite_id`) REFERENCES `item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for itemtype_controllerunit
-- ----------------------------
CREATE TABLE `itemtype_controllerunit` (
  `con_id` int(11) NOT NULL,
  `ite_id` int(11) NOT NULL,
  PRIMARY KEY (`con_id`,`ite_id`),
  KEY `FK2985E0D25651C4E9` (`ite_id`),
  KEY `FK2985E0D27FF4A38E` (`con_id`),
  CONSTRAINT `FK2985E0D27FF4A38E` FOREIGN KEY (`con_id`) REFERENCES `itemtype` (`id`),
  CONSTRAINT `FK2985E0D25651C4E9` FOREIGN KEY (`ite_id`) REFERENCES `controllerunit` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for jobs
-- ----------------------------
CREATE TABLE `jobs` (
  `job_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_des` varchar(255) DEFAULT NULL,
  `job_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for maccounting
-- ----------------------------
CREATE TABLE `maccounting` (
  `mac_id` int(11) NOT NULL AUTO_INCREMENT,
  `ennum` int(11) DEFAULT NULL,
  `macdate` date DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `outnum` int(11) DEFAULT NULL,
  `stonum` int(11) DEFAULT NULL,
  `whname` varchar(255) DEFAULT NULL,
  `ite_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`mac_id`),
  KEY `FK357E5EC28A741576` (`ite_id`),
  CONSTRAINT `FK357E5EC28A741576` FOREIGN KEY (`ite_id`) REFERENCES `itemtype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pergood
-- ----------------------------
CREATE TABLE `pergood` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addsup` int(11) DEFAULT NULL,
  `eDate` datetime DEFAULT NULL,
  `isExtraSup` int(11) DEFAULT NULL,
  `preNote` varchar(255) DEFAULT NULL,
  `preNum` int(11) DEFAULT NULL,
  `itemType_id` int(11) DEFAULT NULL,
  `preparation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKD78A5B5A52979ED0` (`preparation_id`),
  KEY `FKD78A5B5A1AD09463` (`itemType_id`),
  CONSTRAINT `FKD78A5B5A1AD09463` FOREIGN KEY (`itemType_id`) REFERENCES `itemtype` (`id`),
  CONSTRAINT `FKD78A5B5A52979ED0` FOREIGN KEY (`preparation_id`) REFERENCES `preparation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for picgood
-- ----------------------------
CREATE TABLE `picgood` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `calunit` varchar(255) DEFAULT NULL,
  `factnum` int(11) DEFAULT NULL,
  `reqnum` int(11) DEFAULT NULL,
  `rprice` float NOT NULL,
  `ruprice` float NOT NULL,
  `userf` varchar(255) DEFAULT NULL,
  `ite_id` int(11) DEFAULT NULL,
  `req_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKDD8A5D478A741576` (`ite_id`),
  KEY `FKDD8A5D47CAA04A51` (`req_id`),
  CONSTRAINT `FKDD8A5D47CAA04A51` FOREIGN KEY (`req_id`) REFERENCES `requisition` (`req_id`),
  CONSTRAINT `FKDD8A5D478A741576` FOREIGN KEY (`ite_id`) REFERENCES `itemtype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for preparation
-- ----------------------------
CREATE TABLE `preparation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addplan` int(11) DEFAULT NULL,
  `addsup` int(11) DEFAULT NULL,
  `confimation` varchar(255) DEFAULT NULL,
  `fulfillment` varchar(255) DEFAULT NULL,
  `pdate` datetime DEFAULT NULL,
  `presn` varchar(255) DEFAULT NULL,
  `sdate` datetime DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `person_empId` int(11) DEFAULT NULL,
  `pleader_empId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKB1982697922EFE26` (`department_id`),
  KEY `FKB1982697C65E0F7` (`pleader_empId`),
  KEY `FKB1982697F5EF75D3` (`person_empId`),
  CONSTRAINT `FKB1982697F5EF75D3` FOREIGN KEY (`person_empId`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FKB1982697922EFE26` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
  CONSTRAINT `FKB1982697C65E0F7` FOREIGN KEY (`pleader_empId`) REFERENCES `employee` (`empId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pro_schedule
-- ----------------------------
CREATE TABLE `pro_schedule` (
  `prs_id` int(11) NOT NULL AUTO_INCREMENT,
  `cdate` date DEFAULT NULL,
  `pcontent` varchar(255) DEFAULT NULL,
  `pnote` varchar(255) DEFAULT NULL,
  `pnumber` int(11) DEFAULT NULL,
  `punit` varchar(255) DEFAULT NULL,
  `ity_id` int(11) DEFAULT NULL,
  `prc_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`prs_id`),
  KEY `FK7333C3E97F63BA` (`prc_id`),
  KEY `FK7333C3E98A7D2CE2` (`ity_id`),
  CONSTRAINT `FK7333C3E98A7D2CE2` FOREIGN KEY (`ity_id`) REFERENCES `itemtype` (`id`),
  CONSTRAINT `FK7333C3E97F63BA` FOREIGN KEY (`prc_id`) REFERENCES `prscheck` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pro_sup
-- ----------------------------
CREATE TABLE `pro_sup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `preparation_id` int(11) DEFAULT NULL,
  `prscheck_id` int(11) DEFAULT NULL,
  `supsendm_sus_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKED8B81BC1E0735A4` (`prscheck_id`),
  KEY `FKED8B81BC52979ED0` (`preparation_id`),
  KEY `FKED8B81BC9FB8BC4F` (`supsendm_sus_id`),
  CONSTRAINT `FKED8B81BC9FB8BC4F` FOREIGN KEY (`supsendm_sus_id`) REFERENCES `supsendm` (`sus_id`),
  CONSTRAINT `FKED8B81BC1E0735A4` FOREIGN KEY (`prscheck_id`) REFERENCES `prscheck` (`id`),
  CONSTRAINT `FKED8B81BC52979ED0` FOREIGN KEY (`preparation_id`) REFERENCES `preparation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for proreportfive
-- ----------------------------
CREATE TABLE `proreportfive` (
  `rpt5_id` int(11) NOT NULL AUTO_INCREMENT,
  `fiqua` int(11) DEFAULT NULL,
  `fiunq` int(11) DEFAULT NULL,
  `insptime` int(11) DEFAULT NULL,
  `passrate` float DEFAULT NULL,
  `pronum` int(11) DEFAULT NULL,
  `rtdate` datetime DEFAULT NULL,
  `unqnum` int(11) DEFAULT NULL,
  PRIMARY KEY (`rpt5_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for proreportone
-- ----------------------------
CREATE TABLE `proreportone` (
  `prt1_id` int(11) NOT NULL AUTO_INCREMENT,
  `failurecon` varchar(255) DEFAULT NULL,
  `failurerate` float DEFAULT NULL,
  `pronum` int(11) DEFAULT NULL,
  `prtdate` datetime DEFAULT NULL,
  `unqnum` int(11) DEFAULT NULL,
  PRIMARY KEY (`prt1_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for proreportthree
-- ----------------------------
CREATE TABLE `proreportthree` (
  `prt3_id` int(11) NOT NULL AUTO_INCREMENT,
  `passrate` float DEFAULT NULL,
  `probatch` int(11) DEFAULT NULL,
  `ptdate` datetime DEFAULT NULL,
  `quabatch` int(11) DEFAULT NULL,
  `unqbatch` int(11) DEFAULT NULL,
  `unqcon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`prt3_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for prscheck
-- ----------------------------
CREATE TABLE `prscheck` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prsDate` date DEFAULT NULL,
  `psn` varchar(255) DEFAULT NULL,
  `sdate` date DEFAULT NULL,
  `dpt_id` int(11) DEFAULT NULL,
  `eApprove` int(11) DEFAULT NULL,
  `eAudit` int(11) DEFAULT NULL,
  `eEdit` int(11) DEFAULT NULL,
  `pre_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKCEC59D179E67C50` (`dpt_id`),
  KEY `FKCEC59D17D5AD3EA2` (`eApprove`),
  KEY `FKCEC59D173F380744` (`pre_id`),
  KEY `FKCEC59D17EDA3B49` (`eEdit`),
  KEY `FKCEC59D17BB0299F0` (`eAudit`),
  CONSTRAINT `FKCEC59D17BB0299F0` FOREIGN KEY (`eAudit`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FKCEC59D173F380744` FOREIGN KEY (`pre_id`) REFERENCES `preparation` (`id`),
  CONSTRAINT `FKCEC59D179E67C50` FOREIGN KEY (`dpt_id`) REFERENCES `department` (`id`),
  CONSTRAINT `FKCEC59D17D5AD3EA2` FOREIGN KEY (`eApprove`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FKCEC59D17EDA3B49` FOREIGN KEY (`eEdit`) REFERENCES `employee` (`empId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for purgood
-- ----------------------------
CREATE TABLE `purgood` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `delydate` date DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `uprice` float DEFAULT NULL,
  `ite_id` int(11) DEFAULT NULL,
  `purorder_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK56107D2A6851E795` (`purorder_id`),
  KEY `FK56107D2A8A741576` (`ite_id`),
  CONSTRAINT `FK56107D2A8A741576` FOREIGN KEY (`ite_id`) REFERENCES `itemtype` (`id`),
  CONSTRAINT `FK56107D2A6851E795` FOREIGN KEY (`purorder_id`) REFERENCES `purorder` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for purorder
-- ----------------------------
CREATE TABLE `purorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enter` bit(1) DEFAULT NULL,
  `firm` varchar(255) DEFAULT NULL,
  `pno` varchar(255) DEFAULT NULL,
  `pnote` varchar(255) DEFAULT NULL,
  `purconfirm` varchar(255) DEFAULT NULL,
  `purdate` date DEFAULT NULL,
  `srep` bit(1) DEFAULT NULL,
  `approval_empId` int(11) DEFAULT NULL,
  `audit_empId` int(11) DEFAULT NULL,
  `handing_empId` int(11) DEFAULT NULL,
  `quaprolist_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6896B4613F9C79D9` (`audit_empId`),
  KEY `FK6896B4613BBCD641` (`approval_empId`),
  KEY `FK6896B461B9A87DB5` (`quaprolist_id`),
  KEY `FK6896B461A2EE6111` (`handing_empId`),
  CONSTRAINT `FK6896B461A2EE6111` FOREIGN KEY (`handing_empId`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FK6896B4613BBCD641` FOREIGN KEY (`approval_empId`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FK6896B4613F9C79D9` FOREIGN KEY (`audit_empId`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FK6896B461B9A87DB5` FOREIGN KEY (`quaprolist_id`) REFERENCES `quaprolist` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for qualityanalysis
-- ----------------------------
CREATE TABLE `qualityanalysis` (
  `ana_id` int(11) NOT NULL AUTO_INCREMENT,
  `analysis` varchar(255) DEFAULT NULL,
  `mainfault` varchar(255) DEFAULT NULL,
  `measures` varchar(255) DEFAULT NULL,
  `rnum` int(11) DEFAULT NULL,
  `snum` int(11) DEFAULT NULL,
  `ite_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ana_id`),
  KEY `FK1D2B84DB8A741576` (`ite_id`),
  CONSTRAINT `FK1D2B84DB8A741576` FOREIGN KEY (`ite_id`) REFERENCES `itemtype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for quaprolist
-- ----------------------------
CREATE TABLE `quaprolist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quaprolist_asslevel` varchar(255) DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `supplierinfo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE194EF6E8D918F75` (`supplierinfo_id`),
  CONSTRAINT `FKE194EF6E8D918F75` FOREIGN KEY (`supplierinfo_id`) REFERENCES `supplierinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for rasmessage
-- ----------------------------
CREATE TABLE `rasmessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accessories` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `fla1` varchar(255) DEFAULT NULL,
  `rasstatus` varchar(255) DEFAULT NULL,
  `rastime` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `rper` int(11) NOT NULL,
  `sper` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKD9B49763E178B6F1` (`sper`),
  KEY `FKD9B49763E1784292` (`rper`),
  CONSTRAINT `FKD9B49763E1784292` FOREIGN KEY (`rper`) REFERENCES `user` (`id`),
  CONSTRAINT `FKD9B49763E178B6F1` FOREIGN KEY (`sper`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for recruitment
-- ----------------------------
CREATE TABLE `recruitment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `baserec` varchar(255) DEFAULT NULL,
  `isCheck` int(11) DEFAULT NULL,
  `isyear` int(11) DEFAULT NULL,
  `rDate` datetime DEFAULT NULL,
  `recnature` varchar(255) DEFAULT NULL,
  `recno` int(11) DEFAULT NULL,
  `recstyle` varchar(255) DEFAULT NULL,
  `dpt_id` int(11) NOT NULL,
  `yrecruitment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2E89CD9C9E67C50` (`dpt_id`),
  KEY `FK2E89CD9CDEA60986` (`yrecruitment_id`),
  CONSTRAINT `FK2E89CD9CDEA60986` FOREIGN KEY (`yrecruitment_id`) REFERENCES `yrecruitment` (`id`),
  CONSTRAINT `FK2E89CD9C9E67C50` FOREIGN KEY (`dpt_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for repairproduction
-- ----------------------------
CREATE TABLE `repairproduction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemTypeName` varchar(255) DEFAULT NULL,
  `pno` int(11) DEFAULT NULL,
  `recDate` date DEFAULT NULL,
  `repstatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for requisition
-- ----------------------------
CREATE TABLE `requisition` (
  `req_id` int(11) NOT NULL AUTO_INCREMENT,
  `company` varchar(255) DEFAULT NULL,
  `deliverDate` date DEFAULT NULL,
  `reqDate` date DEFAULT NULL,
  `conf_id` int(11) DEFAULT NULL,
  `dpt_id` int(11) DEFAULT NULL,
  `pink_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`req_id`),
  KEY `FK1799509CBA209AAC` (`dpt_id`),
  KEY `FK1799509C41CC4770` (`conf_id`),
  KEY `FK1799509CE7427BDE` (`pink_id`),
  CONSTRAINT `FK1799509CE7427BDE` FOREIGN KEY (`pink_id`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FK1799509C41CC4770` FOREIGN KEY (`conf_id`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FK1799509CBA209AAC` FOREIGN KEY (`dpt_id`) REFERENCES `employee` (`empId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for requisitions
-- ----------------------------
CREATE TABLE `requisitions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `directions` varchar(255) DEFAULT NULL,
  `enter` bit(1) DEFAULT NULL,
  `bmanager_empId` int(11) DEFAULT NULL,
  `buyer_empId` int(11) DEFAULT NULL,
  `cmanager_empId` int(11) DEFAULT NULL,
  `dmanager_empId` int(11) DEFAULT NULL,
  `dpmanager_empId` int(11) DEFAULT NULL,
  `quaprolist_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKDB90C3575BF97709` (`bmanager_empId`),
  KEY `FKDB90C357CFCFFF1F` (`dpmanager_empId`),
  KEY `FKDB90C3571FB50A47` (`dmanager_empId`),
  KEY `FKDB90C3573DD740A8` (`cmanager_empId`),
  KEY `FKDB90C357B9A87DB5` (`quaprolist_id`),
  KEY `FKDB90C357F4CD1DB1` (`buyer_empId`),
  CONSTRAINT `FKDB90C357F4CD1DB1` FOREIGN KEY (`buyer_empId`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FKDB90C3571FB50A47` FOREIGN KEY (`dmanager_empId`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FKDB90C3573DD740A8` FOREIGN KEY (`cmanager_empId`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FKDB90C3575BF97709` FOREIGN KEY (`bmanager_empId`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FKDB90C357B9A87DB5` FOREIGN KEY (`quaprolist_id`) REFERENCES `quaprolist` (`id`),
  CONSTRAINT `FKDB90C357CFCFFF1F` FOREIGN KEY (`dpmanager_empId`) REFERENCES `employee` (`empId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for resgood
-- ----------------------------
CREATE TABLE `resgood` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `arrivaldate` date DEFAULT NULL,
  `payment` varchar(255) DEFAULT NULL,
  `reqnum` int(11) DEFAULT NULL,
  `unum` int(11) DEFAULT NULL,
  `uprice` float DEFAULT NULL,
  `ite_id` int(11) DEFAULT NULL,
  `requisitions_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKA49D813D8A741576` (`ite_id`),
  KEY `FKA49D813D7DEDC655` (`requisitions_id`),
  CONSTRAINT `FKA49D813D7DEDC655` FOREIGN KEY (`requisitions_id`) REFERENCES `requisitions` (`id`),
  CONSTRAINT `FKA49D813D8A741576` FOREIGN KEY (`ite_id`) REFERENCES `itemtype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for resource
-- ----------------------------
CREATE TABLE `resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menuCode` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=405 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for retgood
-- ----------------------------
CREATE TABLE `retgood` (
  `retgid` int(11) NOT NULL AUTO_INCREMENT,
  `retno` int(11) DEFAULT NULL,
  `ite_id` int(11) DEFAULT NULL,
  `ana_id` int(11) DEFAULT NULL,
  `retid` int(11) DEFAULT NULL,
  `rmt_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`retgid`),
  KEY `FK417300DEBADA5323` (`ana_id`),
  KEY `FK417300DE8A741576` (`ite_id`),
  KEY `FK417300DE5F7384C` (`rmt_id`),
  KEY `FK417300DEC971E2A9` (`retid`),
  CONSTRAINT `FK417300DEC971E2A9` FOREIGN KEY (`retid`) REFERENCES `returned` (`retid`),
  CONSTRAINT `FK417300DE5F7384C` FOREIGN KEY (`rmt_id`) REFERENCES `rmtotal` (`rmt_id`),
  CONSTRAINT `FK417300DE8A741576` FOREIGN KEY (`ite_id`) REFERENCES `itemtype` (`id`),
  CONSTRAINT `FK417300DEBADA5323` FOREIGN KEY (`ana_id`) REFERENCES `qualityanalysis` (`ana_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for returned
-- ----------------------------
CREATE TABLE `returned` (
  `retid` int(11) NOT NULL AUTO_INCREMENT,
  `customern` varchar(255) DEFAULT NULL,
  `forward` varchar(255) DEFAULT NULL,
  `qualityadvice` varchar(255) DEFAULT NULL,
  `qualitydate` date DEFAULT NULL,
  `qualitynote` varchar(255) DEFAULT NULL,
  `retdate` date DEFAULT NULL,
  `retnote` varchar(255) DEFAULT NULL,
  `sn` varchar(255) DEFAULT NULL,
  `whradate` date DEFAULT NULL,
  `whreceive` varchar(255) DEFAULT NULL,
  `qualitymanager` int(11) DEFAULT NULL,
  `signatory` int(11) DEFAULT NULL,
  `signper` int(11) DEFAULT NULL,
  PRIMARY KEY (`retid`),
  KEY `FKEDB3BDCF8594259A` (`signper`),
  KEY `FKEDB3BDCF25078928` (`qualitymanager`),
  KEY `FKEDB3BDCF491909A0` (`signatory`),
  CONSTRAINT `FKEDB3BDCF491909A0` FOREIGN KEY (`signatory`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FKEDB3BDCF25078928` FOREIGN KEY (`qualitymanager`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FKEDB3BDCF8594259A` FOREIGN KEY (`signper`) REFERENCES `employee` (`empId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for rewgood
-- ----------------------------
CREATE TABLE `rewgood` (
  `rewgid` int(11) NOT NULL AUTO_INCREMENT,
  `bsno` int(11) DEFAULT NULL,
  `factno` int(11) DEFAULT NULL,
  `rewexamine` bit(1) NOT NULL,
  `rewno` int(11) DEFAULT NULL,
  `rewnote` varchar(255) DEFAULT NULL,
  `rewprice` float NOT NULL,
  `rewunit` varchar(255) DEFAULT NULL,
  `rewuprice` float NOT NULL,
  `ite_id` int(11) DEFAULT NULL,
  `rew_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`rewgid`),
  KEY `FK419D4761F65B685` (`rew_id`),
  KEY `FK419D47618A741576` (`ite_id`),
  CONSTRAINT `FK419D47618A741576` FOREIGN KEY (`ite_id`) REFERENCES `itemtype` (`id`),
  CONSTRAINT `FK419D4761F65B685` FOREIGN KEY (`rew_id`) REFERENCES `rewinder` (`rew_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for rewinder
-- ----------------------------
CREATE TABLE `rewinder` (
  `rew_id` int(11) NOT NULL AUTO_INCREMENT,
  `rew_date` date DEFAULT NULL,
  `rewexamine` varchar(255) DEFAULT NULL,
  `rewnote` varchar(255) DEFAULT NULL,
  `suplyu` varchar(255) DEFAULT NULL,
  `warehouseDate` date DEFAULT NULL,
  `buyer_id` int(11) DEFAULT NULL,
  `spector_id` int(11) DEFAULT NULL,
  `wh_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`rew_id`),
  KEY `FKF22736A8E12D23D8` (`spector_id`),
  KEY `FKF22736A8CEC6B681` (`buyer_id`),
  KEY `FKF22736A8FD92CA3` (`wh_id`),
  CONSTRAINT `FKF22736A8FD92CA3` FOREIGN KEY (`wh_id`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FKF22736A8CEC6B681` FOREIGN KEY (`buyer_id`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FKF22736A8E12D23D8` FOREIGN KEY (`spector_id`) REFERENCES `employee` (`empId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for rmtotal
-- ----------------------------
CREATE TABLE `rmtotal` (
  `rmt_id` int(11) NOT NULL AUTO_INCREMENT,
  `msendnum` int(11) DEFAULT NULL,
  `munqrate` float DEFAULT NULL,
  `repairnum` int(11) DEFAULT NULL,
  `rmonth` datetime DEFAULT NULL,
  `rnum` int(11) DEFAULT NULL,
  `rtotal` int(11) DEFAULT NULL,
  `scrapnum` int(11) DEFAULT NULL,
  `tsendnum` int(11) DEFAULT NULL,
  `tunqrate` float DEFAULT NULL,
  `ite_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`rmt_id`),
  KEY `FK4F1D79E98A741576` (`ite_id`),
  CONSTRAINT `FK4F1D79E98A741576` FOREIGN KEY (`ite_id`) REFERENCES `itemtype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for role
-- ----------------------------
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for role_resource
-- ----------------------------
CREATE TABLE `role_resource` (
  `role_id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`resource_id`),
  KEY `FKAEE599B73352E956` (`role_id`),
  KEY `FKAEE599B73B3C1456` (`resource_id`),
  CONSTRAINT `FKAEE599B73352E956` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `FKAEE599B73B3C1456` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for samidentified
-- ----------------------------
CREATE TABLE `samidentified` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand` varchar(255) DEFAULT NULL,
  `conclusion` varchar(255) DEFAULT NULL,
  `entest` bit(1) DEFAULT NULL,
  `examinedate` date DEFAULT NULL,
  `mcodename` varchar(255) DEFAULT NULL,
  `newitem` bit(1) DEFAULT NULL,
  `newsup` bit(1) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `opinion` varchar(255) DEFAULT NULL,
  `opiniondate` date DEFAULT NULL,
  `redcost` bit(1) DEFAULT NULL,
  `reqtime` int(11) DEFAULT NULL,
  `samdate` date DEFAULT NULL,
  `techchange` bit(1) DEFAULT NULL,
  `uprice` float DEFAULT NULL,
  `wantdate` date DEFAULT NULL,
  `charge_empId` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `examine_empId` int(11) DEFAULT NULL,
  `hangding_empId` int(11) DEFAULT NULL,
  `itemtype_id` int(11) DEFAULT NULL,
  `resper_empId` int(11) DEFAULT NULL,
  `supplierinfo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK14145DBA922EFE26` (`department_id`),
  KEY `FK14145DBA258698DF` (`examine_empId`),
  KEY `FK14145DBA6851B9F2` (`charge_empId`),
  KEY `FK14145DBA8D918F75` (`supplierinfo_id`),
  KEY `FK14145DBA19C10FB` (`resper_empId`),
  KEY `FK14145DBA1AD09463` (`itemtype_id`),
  KEY `FK14145DBA31379EAE` (`hangding_empId`),
  CONSTRAINT `FK14145DBA31379EAE` FOREIGN KEY (`hangding_empId`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FK14145DBA19C10FB` FOREIGN KEY (`resper_empId`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FK14145DBA1AD09463` FOREIGN KEY (`itemtype_id`) REFERENCES `itemtype` (`id`),
  CONSTRAINT `FK14145DBA258698DF` FOREIGN KEY (`examine_empId`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FK14145DBA6851B9F2` FOREIGN KEY (`charge_empId`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FK14145DBA8D918F75` FOREIGN KEY (`supplierinfo_id`) REFERENCES `supplierinfo` (`id`),
  CONSTRAINT `FK14145DBA922EFE26` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for shi1good
-- ----------------------------
CREATE TABLE `shi1good` (
  `shi1gid` int(11) NOT NULL AUTO_INCREMENT,
  `shi1no` int(11) DEFAULT NULL,
  `shi1unit` varchar(255) DEFAULT NULL,
  `shinote` varchar(255) DEFAULT NULL,
  `shitime` varchar(255) DEFAULT NULL,
  `tas` varchar(255) DEFAULT NULL,
  `tax` varchar(255) DEFAULT NULL,
  `ite_id` int(11) DEFAULT NULL,
  `shi1id` int(11) DEFAULT NULL,
  PRIMARY KEY (`shi1gid`),
  KEY `FKDDBF143AE20590CB` (`shi1id`),
  KEY `FKDDBF143A8A741576` (`ite_id`),
  CONSTRAINT `FKDDBF143A8A741576` FOREIGN KEY (`ite_id`) REFERENCES `itemtype` (`id`),
  CONSTRAINT `FKDDBF143AE20590CB` FOREIGN KEY (`shi1id`) REFERENCES `shippingnote1` (`shi1id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for shi2good
-- ----------------------------
CREATE TABLE `shi2good` (
  `shi2gid` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` int(11) DEFAULT NULL,
  `shi2no` int(11) DEFAULT NULL,
  `shi2no2` int(11) DEFAULT NULL,
  `shi2note` varchar(255) DEFAULT NULL,
  `ite_id` int(11) DEFAULT NULL,
  `shi2id` int(11) DEFAULT NULL,
  PRIMARY KEY (`shi2gid`),
  KEY `FKDDCD2BBB8A741576` (`ite_id`),
  KEY `FKDDCD2BBB808DC543` (`shi2id`),
  CONSTRAINT `FKDDCD2BBB808DC543` FOREIGN KEY (`shi2id`) REFERENCES `shinote2` (`shi2id`),
  CONSTRAINT `FKDDCD2BBB8A741576` FOREIGN KEY (`ite_id`) REFERENCES `itemtype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for shinote2
-- ----------------------------
CREATE TABLE `shinote2` (
  `shi2id` int(11) NOT NULL AUTO_INCREMENT,
  `letrecper` varchar(255) DEFAULT NULL,
  `makeDate` date DEFAULT NULL,
  `raddress` varchar(255) DEFAULT NULL,
  `rcode` varchar(255) DEFAULT NULL,
  `recper` varchar(255) DEFAULT NULL,
  `recstyle` varchar(255) DEFAULT NULL,
  `recunit` varchar(255) DEFAULT NULL,
  `sbranch1` varchar(255) DEFAULT NULL,
  `sbranch2` varchar(255) DEFAULT NULL,
  `sbranch3` varchar(255) DEFAULT NULL,
  `schper` varchar(255) DEFAULT NULL,
  `shi2date` date DEFAULT NULL,
  `shi2note` varchar(255) DEFAULT NULL,
  `sn` varchar(255) DEFAULT NULL,
  `storageper` varchar(255) DEFAULT NULL,
  `tostation` varchar(255) DEFAULT NULL,
  `totals` int(11) DEFAULT NULL,
  `trno` varchar(255) DEFAULT NULL,
  `delper` int(11) DEFAULT NULL,
  `mtab` int(11) DEFAULT NULL,
  `whmget_emp` int(11) DEFAULT NULL,
  `whname` int(11) DEFAULT NULL,
  `wper` int(11) DEFAULT NULL,
  PRIMARY KEY (`shi2id`),
  KEY `FKE11E624C94ED362` (`mtab`),
  KEY `FKE11E624C95350A0` (`wper`),
  KEY `FKE11E624CB982348C` (`delper`),
  KEY `FKE11E624C29DF21DA` (`whname`),
  KEY `FKE11E624C976FC7D` (`whmget_emp`),
  CONSTRAINT `FKE11E624C976FC7D` FOREIGN KEY (`whmget_emp`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FKE11E624C29DF21DA` FOREIGN KEY (`whname`) REFERENCES `department` (`id`),
  CONSTRAINT `FKE11E624C94ED362` FOREIGN KEY (`mtab`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FKE11E624C95350A0` FOREIGN KEY (`wper`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FKE11E624CB982348C` FOREIGN KEY (`delper`) REFERENCES `employee` (`empId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for shippingnote1
-- ----------------------------
CREATE TABLE `shippingnote1` (
  `shi1id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) DEFAULT NULL,
  `goodlist` varchar(255) DEFAULT NULL,
  `sended` varchar(255) DEFAULT NULL,
  `shi1date` date DEFAULT NULL,
  `shi1receive` varchar(255) DEFAULT NULL,
  `shi1send` varchar(255) DEFAULT NULL,
  `shiw` int(11) DEFAULT NULL,
  PRIMARY KEY (`shi1id`),
  KEY `FK2134CD91951619D` (`shiw`),
  CONSTRAINT `FK2134CD91951619D` FOREIGN KEY (`shiw`) REFERENCES `employee` (`empId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for shogood
-- ----------------------------
CREATE TABLE `shogood` (
  `shog_id` int(11) NOT NULL AUTO_INCREMENT,
  `note` varchar(255) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `uprice` float DEFAULT NULL,
  `userf` varchar(255) DEFAULT NULL,
  `ite_id` int(11) DEFAULT NULL,
  `shoid` int(11) DEFAULT NULL,
  PRIMARY KEY (`shog_id`),
  KEY `FKDE69E857BC4B5490` (`shoid`),
  KEY `FKDE69E8578A741576` (`ite_id`),
  CONSTRAINT `FKDE69E8578A741576` FOREIGN KEY (`ite_id`) REFERENCES `itemtype` (`id`),
  CONSTRAINT `FKDE69E857BC4B5490` FOREIGN KEY (`shoid`) REFERENCES `shortm` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for shortm
-- ----------------------------
CREATE TABLE `shortm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `approve` varchar(255) DEFAULT NULL,
  `sdate` date DEFAULT NULL,
  `sho_check` varchar(255) DEFAULT NULL,
  `shoid` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `rdepartment` int(11) DEFAULT NULL,
  `wsmanager` int(11) DEFAULT NULL,
  `rper` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK938FF791D0DB58AB` (`wsmanager`),
  KEY `FK938FF791D9474642` (`rdepartment`),
  KEY `FK938FF7919510AC5` (`rper`),
  CONSTRAINT `FK938FF7919510AC5` FOREIGN KEY (`rper`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FK938FF791D0DB58AB` FOREIGN KEY (`wsmanager`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FK938FF791D9474642` FOREIGN KEY (`rdepartment`) REFERENCES `department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for spare
-- ----------------------------
CREATE TABLE `spare` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` int(11) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `uprice` float DEFAULT NULL,
  `quaprolist_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK688F2D7B9A87DB5` (`quaprolist_id`),
  CONSTRAINT `FK688F2D7B9A87DB5` FOREIGN KEY (`quaprolist_id`) REFERENCES `quaprolist` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for stock
-- ----------------------------
CREATE TABLE `stock` (
  `sto_id` int(11) NOT NULL AUTO_INCREMENT,
  `ennum` int(11) DEFAULT NULL,
  `outnum` int(11) DEFAULT NULL,
  `scrnum` int(11) DEFAULT NULL,
  `stonum` int(11) DEFAULT NULL,
  `whname` varchar(255) DEFAULT NULL,
  `itemType_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`sto_id`),
  KEY `FK68AF7161AD09463` (`itemType_id`),
  CONSTRAINT `FK68AF7161AD09463` FOREIGN KEY (`itemType_id`) REFERENCES `itemtype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for storescheduling
-- ----------------------------
CREATE TABLE `storescheduling` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reqstodate` date DEFAULT NULL,
  `stonum` int(11) DEFAULT NULL,
  `storsn` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for stoschgood
-- ----------------------------
CREATE TABLE `stoschgood` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qualitynum` int(11) DEFAULT NULL,
  `stonum` int(11) DEFAULT NULL,
  `dpt_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `sto_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK68E902E79E67C50` (`dpt_id`),
  KEY `FK68E902E7F0B86EDA` (`sto_id`),
  KEY `FK68E902E74ED7F45D` (`item_id`),
  CONSTRAINT `FK68E902E74ED7F45D` FOREIGN KEY (`item_id`) REFERENCES `itemtype` (`id`),
  CONSTRAINT `FK68E902E79E67C50` FOREIGN KEY (`dpt_id`) REFERENCES `department` (`id`),
  CONSTRAINT `FK68E902E7F0B86EDA` FOREIGN KEY (`sto_id`) REFERENCES `storescheduling` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for supidentified
-- ----------------------------
CREATE TABLE `supidentified` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand` varchar(255) DEFAULT NULL,
  `directosales` bit(1) DEFAULT NULL,
  `manadvice` varchar(255) DEFAULT NULL,
  `mandate` date DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `puradvice` varchar(255) DEFAULT NULL,
  `purdate` date DEFAULT NULL,
  `quadate` date DEFAULT NULL,
  `quadvice` varchar(255) DEFAULT NULL,
  `recdate` date DEFAULT NULL,
  `reqdate` date DEFAULT NULL,
  `reqinfo` varchar(255) DEFAULT NULL,
  `reqreason` varchar(255) DEFAULT NULL,
  `samid` int(11) DEFAULT NULL,
  `manper_empId` int(11) DEFAULT NULL,
  `purper_empId` int(11) DEFAULT NULL,
  `purresper_empId` int(11) DEFAULT NULL,
  `quaper_empId` int(11) DEFAULT NULL,
  `quaresper_empId` int(11) DEFAULT NULL,
  `recdpt_id` int(11) DEFAULT NULL,
  `recper_empId` int(11) DEFAULT NULL,
  `reqdpt_id` int(11) DEFAULT NULL,
  `reqper_empId` int(11) DEFAULT NULL,
  `supplierinfo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6CA3616945789438` (`quaresper_empId`),
  KEY `FK6CA361694C3A812E` (`purper_empId`),
  KEY `FK6CA36169C221D581` (`manper_empId`),
  KEY `FK6CA361698D918F75` (`supplierinfo_id`),
  KEY `FK6CA36169C2509888` (`purresper_empId`),
  KEY `FK6CA36169BD04FF0B` (`recper_empId`),
  KEY `FK6CA361691B0BA37E` (`quaper_empId`),
  KEY `FK6CA36169813F88E0` (`recdpt_id`),
  KEY `FK6CA3616919092EBD` (`reqper_empId`),
  KEY `FK6CA3616965D6C66E` (`reqdpt_id`),
  CONSTRAINT `FK6CA3616965D6C66E` FOREIGN KEY (`reqdpt_id`) REFERENCES `department` (`id`),
  CONSTRAINT `FK6CA3616919092EBD` FOREIGN KEY (`reqper_empId`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FK6CA361691B0BA37E` FOREIGN KEY (`quaper_empId`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FK6CA3616945789438` FOREIGN KEY (`quaresper_empId`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FK6CA361694C3A812E` FOREIGN KEY (`purper_empId`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FK6CA36169813F88E0` FOREIGN KEY (`recdpt_id`) REFERENCES `department` (`id`),
  CONSTRAINT `FK6CA361698D918F75` FOREIGN KEY (`supplierinfo_id`) REFERENCES `supplierinfo` (`id`),
  CONSTRAINT `FK6CA36169BD04FF0B` FOREIGN KEY (`recper_empId`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FK6CA36169C221D581` FOREIGN KEY (`manper_empId`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FK6CA36169C2509888` FOREIGN KEY (`purresper_empId`) REFERENCES `employee` (`empId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for supplierinfo
-- ----------------------------
CREATE TABLE `supplierinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `availability` varchar(255) DEFAULT NULL,
  `award` varchar(255) DEFAULT NULL,
  `business` varchar(255) DEFAULT NULL,
  `checkdate` date DEFAULT NULL,
  `itemname` varchar(255) DEFAULT NULL,
  `itemtypename` varchar(255) DEFAULT NULL,
  `muser` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `obtain` varchar(255) DEFAULT NULL,
  `output` int(11) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `qsituation` varchar(255) DEFAULT NULL,
  `quality` varchar(255) DEFAULT NULL,
  `quamger` varchar(255) DEFAULT NULL,
  `supcname` varchar(255) DEFAULT NULL,
  `supcycle` varchar(255) DEFAULT NULL,
  `supename` varchar(255) DEFAULT NULL,
  `tech` varchar(255) DEFAULT NULL,
  `wdate` date DEFAULT NULL,
  `checkper_empId` int(11) DEFAULT NULL,
  `wper_empId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK77A3987AA76BAB04` (`wper_empId`),
  KEY `FK77A3987AF815993` (`checkper_empId`),
  CONSTRAINT `FK77A3987AF815993` FOREIGN KEY (`checkper_empId`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FK77A3987AA76BAB04` FOREIGN KEY (`wper_empId`) REFERENCES `employee` (`empId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for supsendm
-- ----------------------------
CREATE TABLE `supsendm` (
  `sus_id` int(11) NOT NULL AUTO_INCREMENT,
  `batch` varchar(255) DEFAULT NULL,
  `bondedpro` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `feeding` int(11) DEFAULT NULL,
  `isdel` int(11) DEFAULT NULL,
  `partno` varchar(255) DEFAULT NULL,
  `dpt_id` int(11) DEFAULT NULL,
  `ite_id` int(11) DEFAULT NULL,
  `pre_id` int(11) DEFAULT NULL,
  `proper` int(11) DEFAULT NULL,
  `whmanager` int(11) DEFAULT NULL,
  `wsper` int(11) DEFAULT NULL,
  PRIMARY KEY (`sus_id`),
  KEY `FK9D0324579E67C50` (`dpt_id`),
  KEY `FK9D0324575A2E6B16` (`whmanager`),
  KEY `FK9D0324578A741576` (`ite_id`),
  KEY `FK9D032457FDE6C1B` (`wsper`),
  KEY `FK9D032457CEB4EAAA` (`proper`),
  KEY `FK9D0324573F380744` (`pre_id`),
  CONSTRAINT `FK9D0324573F380744` FOREIGN KEY (`pre_id`) REFERENCES `preparation` (`id`),
  CONSTRAINT `FK9D0324575A2E6B16` FOREIGN KEY (`whmanager`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FK9D0324578A741576` FOREIGN KEY (`ite_id`) REFERENCES `itemtype` (`id`),
  CONSTRAINT `FK9D0324579E67C50` FOREIGN KEY (`dpt_id`) REFERENCES `department` (`id`),
  CONSTRAINT `FK9D032457CEB4EAAA` FOREIGN KEY (`proper`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FK9D032457FDE6C1B` FOREIGN KEY (`wsper`) REFERENCES `employee` (`empId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for supsendm3
-- ----------------------------
CREATE TABLE `supsendm3` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hawversion` varchar(255) DEFAULT NULL,
  `isdel` int(11) DEFAULT NULL,
  `needNum` int(11) DEFAULT NULL,
  `sudate` datetime DEFAULT NULL,
  `worshipConfirm` int(11) DEFAULT NULL,
  `dpt_id` int(11) DEFAULT NULL,
  `ite_id` int(11) DEFAULT NULL,
  `pre_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7AD3869C9E67C50` (`dpt_id`),
  KEY `FK7AD3869C8A741576` (`ite_id`),
  KEY `FK7AD3869C3F380744` (`pre_id`),
  CONSTRAINT `FK7AD3869C3F380744` FOREIGN KEY (`pre_id`) REFERENCES `preparation` (`id`),
  CONSTRAINT `FK7AD3869C8A741576` FOREIGN KEY (`ite_id`) REFERENCES `itemtype` (`id`),
  CONSTRAINT `FK7AD3869C9E67C50` FOREIGN KEY (`dpt_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for susgood
-- ----------------------------
CREATE TABLE `susgood` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bondednum` int(11) DEFAULT NULL,
  `generalno` int(11) DEFAULT NULL,
  `isdel` int(11) DEFAULT NULL,
  `lbalance` int(11) DEFAULT NULL,
  `no` int(11) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `singleset` int(11) DEFAULT NULL,
  `tbalance` int(11) DEFAULT NULL,
  `ite_id` int(11) DEFAULT NULL,
  `sus_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9198AE8EBCD62367` (`sus_id`),
  KEY `FK9198AE8E8A741576` (`ite_id`),
  CONSTRAINT `FK9198AE8E8A741576` FOREIGN KEY (`ite_id`) REFERENCES `itemtype` (`id`),
  CONSTRAINT `FK9198AE8EBCD62367` FOREIGN KEY (`sus_id`) REFERENCES `supsendm` (`sus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for susgood3
-- ----------------------------
CREATE TABLE `susgood3` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `controllerunitInfo` varchar(255) DEFAULT NULL,
  `isExtra` int(11) DEFAULT NULL,
  `isdel` int(11) DEFAULT NULL,
  `needNum` int(11) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `pracNum` int(11) DEFAULT NULL,
  `seriNum` int(11) DEFAULT NULL,
  `singleset` int(11) DEFAULT NULL,
  `worshipConfirm` int(11) DEFAULT NULL,
  `ite_id` int(11) DEFAULT NULL,
  `sup_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKA5578785173BBF01` (`sup_id`),
  KEY `FKA55787858A741576` (`ite_id`),
  CONSTRAINT `FKA55787858A741576` FOREIGN KEY (`ite_id`) REFERENCES `itemtype` (`id`),
  CONSTRAINT `FKA5578785173BBF01` FOREIGN KEY (`sup_id`) REFERENCES `supsendm3` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for taxboard
-- ----------------------------
CREATE TABLE `taxboard` (
  `tax_id` int(11) NOT NULL AUTO_INCREMENT,
  `batchno` varchar(255) DEFAULT NULL,
  `checknum` int(11) DEFAULT NULL,
  `cresult` varchar(255) DEFAULT NULL,
  `cresult2` varchar(255) DEFAULT NULL,
  `detfinally` varchar(255) DEFAULT NULL,
  `goodstotal` int(11) DEFAULT NULL,
  `ictchk` varchar(255) DEFAULT NULL,
  `lineno` varchar(255) DEFAULT NULL,
  `lineno2` varchar(255) DEFAULT NULL,
  `outerchk` varchar(255) DEFAULT NULL,
  `packingchk` varchar(255) DEFAULT NULL,
  `rdate` date DEFAULT NULL,
  `servicingchk` varchar(255) DEFAULT NULL,
  `userf` varchar(255) DEFAULT NULL,
  `wdate` date DEFAULT NULL,
  `inspector_emp` int(11) DEFAULT NULL,
  `ite_id` int(11) DEFAULT NULL,
  `quaconfirm_emp` int(11) DEFAULT NULL,
  `rper_emp` int(11) DEFAULT NULL,
  `shi1gid` int(11) DEFAULT NULL,
  PRIMARY KEY (`tax_id`),
  KEY `FKEFA3421B22E8154E` (`rper_emp`),
  KEY `FKEFA3421B8A741576` (`ite_id`),
  KEY `FKEFA3421B555026DA` (`inspector_emp`),
  KEY `FKEFA3421BBCBF6746` (`quaconfirm_emp`),
  KEY `FKEFA3421B2DCB303D` (`shi1gid`),
  CONSTRAINT `FKEFA3421B2DCB303D` FOREIGN KEY (`shi1gid`) REFERENCES `shi1good` (`shi1gid`),
  CONSTRAINT `FKEFA3421B22E8154E` FOREIGN KEY (`rper_emp`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FKEFA3421B555026DA` FOREIGN KEY (`inspector_emp`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FKEFA3421B8A741576` FOREIGN KEY (`ite_id`) REFERENCES `itemtype` (`id`),
  CONSTRAINT `FKEFA3421BBCBF6746` FOREIGN KEY (`quaconfirm_emp`) REFERENCES `employee` (`empId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for taxstampingparts
-- ----------------------------
CREATE TABLE `taxstampingparts` (
  `tas_id` int(11) NOT NULL AUTO_INCREMENT,
  `batchno` varchar(255) DEFAULT NULL,
  `checkresult1` varchar(255) DEFAULT NULL,
  `checkresult2` varchar(255) DEFAULT NULL,
  `chenkresult3` varchar(255) DEFAULT NULL,
  `confirm` varchar(255) DEFAULT NULL,
  `goodstotal` int(11) DEFAULT NULL,
  `makdate` date DEFAULT NULL,
  `repdate` date DEFAULT NULL,
  `sizecheckaql` varchar(255) DEFAULT NULL,
  `sizechecknum` int(11) DEFAULT NULL,
  `vischecknum1` int(11) DEFAULT NULL,
  `vischecknum2` int(11) DEFAULT NULL,
  `inspector_emp` int(11) DEFAULT NULL,
  `ite_id` int(11) DEFAULT NULL,
  `quaconfirm_emp` int(11) DEFAULT NULL,
  `rper_emp` int(11) DEFAULT NULL,
  `shi1gid` int(11) DEFAULT NULL,
  PRIMARY KEY (`tas_id`),
  KEY `FK1BCEBF3622E8154E` (`rper_emp`),
  KEY `FK1BCEBF368A741576` (`ite_id`),
  KEY `FK1BCEBF36555026DA` (`inspector_emp`),
  KEY `FK1BCEBF36BCBF6746` (`quaconfirm_emp`),
  KEY `FK1BCEBF362DCB303D` (`shi1gid`),
  CONSTRAINT `FK1BCEBF362DCB303D` FOREIGN KEY (`shi1gid`) REFERENCES `shi1good` (`shi1gid`),
  CONSTRAINT `FK1BCEBF3622E8154E` FOREIGN KEY (`rper_emp`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FK1BCEBF36555026DA` FOREIGN KEY (`inspector_emp`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FK1BCEBF368A741576` FOREIGN KEY (`ite_id`) REFERENCES `itemtype` (`id`),
  CONSTRAINT `FK1BCEBF36BCBF6746` FOREIGN KEY (`quaconfirm_emp`) REFERENCES `employee` (`empId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for testnotes
-- ----------------------------
CREATE TABLE `testnotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `basis` varchar(255) DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `checkreport` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `purdate` date DEFAULT NULL,
  `quadate` date DEFAULT NULL,
  `quadvice` varchar(255) DEFAULT NULL,
  `result` bit(1) DEFAULT NULL,
  `samid` int(11) DEFAULT NULL,
  `senddate` date DEFAULT NULL,
  `tiems` int(11) DEFAULT NULL,
  `tracktestId` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `examiner_empId` int(11) DEFAULT NULL,
  `purmanper_empId` int(11) DEFAULT NULL,
  `purper_empId` int(11) DEFAULT NULL,
  `quamanper_empId` int(11) DEFAULT NULL,
  `quaper_empId` int(11) DEFAULT NULL,
  `supplierinfo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBA7A156F4C3A812E` (`purper_empId`),
  KEY `FKBA7A156F5FE58BE` (`quamanper_empId`),
  KEY `FKBA7A156F922EFE26` (`department_id`),
  KEY `FKBA7A156F8D918F75` (`supplierinfo_id`),
  KEY `FKBA7A156F5C79FAAF` (`examiner_empId`),
  KEY `FKBA7A156F1B0BA37E` (`quaper_empId`),
  KEY `FKBA7A156F82D65D0E` (`purmanper_empId`),
  CONSTRAINT `FKBA7A156F82D65D0E` FOREIGN KEY (`purmanper_empId`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FKBA7A156F1B0BA37E` FOREIGN KEY (`quaper_empId`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FKBA7A156F4C3A812E` FOREIGN KEY (`purper_empId`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FKBA7A156F5C79FAAF` FOREIGN KEY (`examiner_empId`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FKBA7A156F5FE58BE` FOREIGN KEY (`quamanper_empId`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FKBA7A156F8D918F75` FOREIGN KEY (`supplierinfo_id`) REFERENCES `supplierinfo` (`id`),
  CONSTRAINT `FKBA7A156F922EFE26` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for trackingtest
-- ----------------------------
CREATE TABLE `trackingtest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `examineresult` varchar(255) DEFAULT NULL,
  `itempsn` varchar(255) DEFAULT NULL,
  `proexadate` date DEFAULT NULL,
  `proexasitudation` varchar(255) DEFAULT NULL,
  `propsn` varchar(255) DEFAULT NULL,
  `proquasitudation` varchar(255) DEFAULT NULL,
  `prorecdate` date DEFAULT NULL,
  `prorecord` varchar(255) DEFAULT NULL,
  `psncontent` varchar(255) DEFAULT NULL,
  `qualitySituation` varchar(255) DEFAULT NULL,
  `testdate` date DEFAULT NULL,
  `tryadvice` varchar(255) DEFAULT NULL,
  `trydate` date DEFAULT NULL,
  `trymanagerdate` date DEFAULT NULL,
  `trypsn` varchar(255) DEFAULT NULL,
  `whexamineDate` date DEFAULT NULL,
  `whrecordate` date DEFAULT NULL,
  `wsr1_empId` int(11) DEFAULT NULL,
  `wsr2_empId` int(11) DEFAULT NULL,
  `exa1_empId` int(11) DEFAULT NULL,
  `exa2_empId` int(11) DEFAULT NULL,
  `ite_id` int(11) DEFAULT NULL,
  `man_empId` int(11) DEFAULT NULL,
  `notesID` int(11) DEFAULT NULL,
  `try_empId` int(11) DEFAULT NULL,
  `wh_dptId` int(11) DEFAULT NULL,
  `ws1_dptId` int(11) DEFAULT NULL,
  `ws2_dpt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK998F83E9B6BBBD97` (`ws1_dptId`),
  KEY `FK998F83E93C3333D9` (`wsr1_empId`),
  KEY `FK998F83E9E6B6FE1` (`exa1_empId`),
  KEY `FK998F83E98A741576` (`ite_id`),
  KEY `FK998F83E92314B7B9` (`try_empId`),
  KEY `FK998F83E9B7118F7D` (`ws2_dpt`),
  KEY `FK998F83E9156E96F0` (`notesID`),
  KEY `FK998F83E9E95D2818` (`man_empId`),
  KEY `FK998F83E971196F1A` (`wsr2_empId`),
  KEY `FK998F83E9C7E79293` (`wh_dptId`),
  KEY `FK998F83E94351AB22` (`exa2_empId`),
  CONSTRAINT `FK998F83E94351AB22` FOREIGN KEY (`exa2_empId`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FK998F83E9156E96F0` FOREIGN KEY (`notesID`) REFERENCES `testnotes` (`id`),
  CONSTRAINT `FK998F83E92314B7B9` FOREIGN KEY (`try_empId`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FK998F83E93C3333D9` FOREIGN KEY (`wsr1_empId`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FK998F83E971196F1A` FOREIGN KEY (`wsr2_empId`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FK998F83E98A741576` FOREIGN KEY (`ite_id`) REFERENCES `itemtype` (`id`),
  CONSTRAINT `FK998F83E9B6BBBD97` FOREIGN KEY (`ws1_dptId`) REFERENCES `department` (`id`),
  CONSTRAINT `FK998F83E9B7118F7D` FOREIGN KEY (`ws2_dpt`) REFERENCES `department` (`id`),
  CONSTRAINT `FK998F83E9C7E79293` FOREIGN KEY (`wh_dptId`) REFERENCES `department` (`id`),
  CONSTRAINT `FK998F83E9E6B6FE1` FOREIGN KEY (`exa1_empId`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FK998F83E9E95D2818` FOREIGN KEY (`man_empId`) REFERENCES `employee` (`empId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for training
-- ----------------------------
CREATE TABLE `training` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dateTemp` varchar(255) DEFAULT NULL,
  `eddate` datetime DEFAULT NULL,
  `exam` varchar(2) DEFAULT NULL,
  `lecture` varchar(255) DEFAULT NULL,
  `stDate` datetime DEFAULT NULL,
  `traName` varchar(255) DEFAULT NULL,
  `traNumber` int(11) DEFAULT NULL,
  `tracontent` varchar(255) DEFAULT NULL,
  `dpt_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4FEA6CFA9E67C50` (`dpt_id`),
  CONSTRAINT `FK4FEA6CFA9E67C50` FOREIGN KEY (`dpt_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for unqmessage
-- ----------------------------
CREATE TABLE `unqmessage` (
  `unm_id` int(11) NOT NULL AUTO_INCREMENT,
  `bdepartment` varchar(255) DEFAULT NULL,
  `fdate` datetime DEFAULT NULL,
  `unmcode` varchar(255) DEFAULT NULL,
  `unmstatus` varchar(255) DEFAULT NULL,
  `unq_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`unm_id`),
  KEY `FK6E48340F4EDBFFC7` (`unq_id`),
  CONSTRAINT `FK6E48340F4EDBFFC7` FOREIGN KEY (`unq_id`) REFERENCES `unqualified` (`unq_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for unqualified
-- ----------------------------
CREATE TABLE `unqualified` (
  `unq_id` int(11) NOT NULL AUTO_INCREMENT,
  `insdate` date DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `recedate` date DEFAULT NULL,
  `review` varchar(255) DEFAULT NULL,
  `recdpt` int(11) DEFAULT NULL,
  `rdpt` int(11) DEFAULT NULL,
  `inspector_emp` int(11) DEFAULT NULL,
  `ite_id` int(11) DEFAULT NULL,
  `rebper_emp` int(11) DEFAULT NULL,
  `recper_emp` int(11) DEFAULT NULL,
  `reportper_emp` int(11) DEFAULT NULL,
  `retid` int(11) DEFAULT NULL,
  PRIMARY KEY (`unq_id`),
  KEY `FKB9B23E235916C0B4` (`rdpt`),
  KEY `FKB9B23E23EC897291` (`rebper_emp`),
  KEY `FKB9B23E23546A9F70` (`recper_emp`),
  KEY `FKB9B23E234879424C` (`reportper_emp`),
  KEY `FKB9B23E238A741576` (`ite_id`),
  KEY `FKB9B23E23555026DA` (`inspector_emp`),
  KEY `FKB9B23E23C971E2A9` (`retid`),
  KEY `FKB9B23E232127ABD6` (`recdpt`),
  CONSTRAINT `FKB9B23E232127ABD6` FOREIGN KEY (`recdpt`) REFERENCES `department` (`id`),
  CONSTRAINT `FKB9B23E234879424C` FOREIGN KEY (`reportper_emp`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FKB9B23E23546A9F70` FOREIGN KEY (`recper_emp`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FKB9B23E23555026DA` FOREIGN KEY (`inspector_emp`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FKB9B23E235916C0B4` FOREIGN KEY (`rdpt`) REFERENCES `department` (`id`),
  CONSTRAINT `FKB9B23E238A741576` FOREIGN KEY (`ite_id`) REFERENCES `itemtype` (`id`),
  CONSTRAINT `FKB9B23E23C971E2A9` FOREIGN KEY (`retid`) REFERENCES `returned` (`retid`),
  CONSTRAINT `FKB9B23E23EC897291` FOREIGN KEY (`rebper_emp`) REFERENCES `employee` (`empId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `disabled` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `EmployeeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK285FEB131F87A3` (`EmployeeId`),
  CONSTRAINT `FK285FEB131F87A3` FOREIGN KEY (`EmployeeId`) REFERENCES `employee` (`empId`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FK143BF46A3352E956` (`role_id`),
  KEY `FK143BF46AD87DAD36` (`user_id`),
  CONSTRAINT `FK143BF46AD87DAD36` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK143BF46A3352E956` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for vargood
-- ----------------------------
CREATE TABLE `vargood` (
  `vag_id` int(11) NOT NULL AUTO_INCREMENT,
  `chno` int(11) DEFAULT NULL,
  `etdate` datetime DEFAULT NULL,
  `etno` int(11) DEFAULT NULL,
  `forstyle` varchar(255) DEFAULT NULL,
  `vagReason` varchar(255) DEFAULT NULL,
  `check_Num` int(11) DEFAULT NULL,
  `cj_check` int(11) DEFAULT NULL,
  `ite_id` int(11) DEFAULT NULL,
  `var_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`vag_id`),
  KEY `FK7154F44412FD96DF` (`var_id`),
  KEY `FK7154F444C444B28A` (`cj_check`),
  KEY `FK7154F4448A741576` (`ite_id`),
  KEY `FK7154F44420E28329` (`check_Num`),
  CONSTRAINT `FK7154F44420E28329` FOREIGN KEY (`check_Num`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FK7154F44412FD96DF` FOREIGN KEY (`var_id`) REFERENCES `variation` (`var_id`),
  CONSTRAINT `FK7154F4448A741576` FOREIGN KEY (`ite_id`) REFERENCES `itemtype` (`id`),
  CONSTRAINT `FK7154F444C444B28A` FOREIGN KEY (`cj_check`) REFERENCES `employee` (`empId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for variation
-- ----------------------------
CREATE TABLE `variation` (
  `var_id` int(11) NOT NULL AUTO_INCREMENT,
  `quaadvice` int(11) DEFAULT NULL,
  `quanote` varchar(255) DEFAULT NULL,
  `vardate` datetime DEFAULT NULL,
  `varnote` varchar(255) DEFAULT NULL,
  `appper` int(11) DEFAULT NULL,
  `dpt_id` int(11) DEFAULT NULL,
  `umanager` int(11) DEFAULT NULL,
  PRIMARY KEY (`var_id`),
  KEY `FK728FC1F39E67C50` (`dpt_id`),
  KEY `FK728FC1F3B5007EB6` (`appper`),
  KEY `FK728FC1F3B4CE18F2` (`umanager`),
  CONSTRAINT `FK728FC1F3B4CE18F2` FOREIGN KEY (`umanager`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FK728FC1F39E67C50` FOREIGN KEY (`dpt_id`) REFERENCES `department` (`id`),
  CONSTRAINT `FK728FC1F3B5007EB6` FOREIGN KEY (`appper`) REFERENCES `employee` (`empId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for warehouse
-- ----------------------------
CREATE TABLE `warehouse` (
  `war_id` int(11) NOT NULL AUTO_INCREMENT,
  `dateOfManufacture` date DEFAULT NULL,
  `mtotal` int(11) DEFAULT NULL,
  `prno` varchar(255) DEFAULT NULL,
  `productionAcceptance` varchar(255) DEFAULT NULL,
  `prunit` varchar(255) DEFAULT NULL,
  `warehouseDate` date DEFAULT NULL,
  `warname` varchar(255) DEFAULT NULL,
  `warno` int(11) DEFAULT NULL,
  `warsn` varchar(255) DEFAULT NULL,
  `whnote` varchar(255) DEFAULT NULL,
  `wpro` int(11) DEFAULT NULL,
  `ytotal` int(11) DEFAULT NULL,
  `itemType_id` int(11) DEFAULT NULL,
  `wh_id` int(11) DEFAULT NULL,
  `winpector_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`war_id`),
  KEY `FK88EF3AC3FD92CA3` (`wh_id`),
  KEY `FK88EF3AC3C11F1E8F` (`winpector_id`),
  KEY `FK88EF3AC31AD09463` (`itemType_id`),
  CONSTRAINT `FK88EF3AC31AD09463` FOREIGN KEY (`itemType_id`) REFERENCES `itemtype` (`id`),
  CONSTRAINT `FK88EF3AC3C11F1E8F` FOREIGN KEY (`winpector_id`) REFERENCES `employee` (`empId`),
  CONSTRAINT `FK88EF3AC3FD92CA3` FOREIGN KEY (`wh_id`) REFERENCES `employee` (`empId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yplanname
-- ----------------------------
CREATE TABLE `yplanname` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isUser` int(11) DEFAULT NULL,
  `planname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yrecruitment
-- ----------------------------
CREATE TABLE `yrecruitment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isUser` int(11) DEFAULT NULL,
  `recruitmentName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ytrainplan
-- ----------------------------
CREATE TABLE `ytrainplan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appper` varchar(255) DEFAULT NULL,
  `draftper` varchar(255) DEFAULT NULL,
  `schdate1` varchar(255) DEFAULT NULL,
  `schdate2` varchar(255) DEFAULT NULL,
  `schdate3` varchar(255) DEFAULT NULL,
  `schdate4` varchar(255) DEFAULT NULL,
  `traddress` varchar(255) DEFAULT NULL,
  `dpt_id` int(11) NOT NULL,
  `training` int(11) NOT NULL,
  `withf` int(11) NOT NULL,
  `yplanname` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKACAAB0D89E67C50` (`dpt_id`),
  KEY `FKACAAB0D85A18B260` (`training`),
  KEY `FKACAAB0D85F9FD15E` (`withf`),
  KEY `FKACAAB0D884A4F62E` (`yplanname`),
  CONSTRAINT `FKACAAB0D884A4F62E` FOREIGN KEY (`yplanname`) REFERENCES `yplanname` (`id`),
  CONSTRAINT `FKACAAB0D85A18B260` FOREIGN KEY (`training`) REFERENCES `training` (`id`),
  CONSTRAINT `FKACAAB0D85F9FD15E` FOREIGN KEY (`withf`) REFERENCES `department` (`id`),
  CONSTRAINT `FKACAAB0D89E67C50` FOREIGN KEY (`dpt_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `resource` VALUES ('1', '', '主页', 'URL', '/controlcenter/index');
INSERT INTO `resource` VALUES ('2', '000', '个人中心-个人资料-修改密码', 'URL', '/security/user/user_passwordInput');
INSERT INTO `resource` VALUES ('3', '010', '个人中心-消息-收发消息', 'URL', '/persons/Rasmessage/rasmessage_list');
INSERT INTO `resource` VALUES ('4', '011', '个人中心-消息-已发送消息', 'URL', '/persons/Rasmessage/rasmessage_sList');
INSERT INTO `resource` VALUES ('5', '100', '人事管理-人员信息-人员信息', 'URL', '/persons/employee/employee_list');
INSERT INTO `resource` VALUES ('6', '110', '人事管理-人员奖惩-人员奖惩', 'URL', '/persons/employee/employee_raplist');
INSERT INTO `resource` VALUES ('7', '120', '人事管理-培训计划-培训内容', 'URL', '/persons/training/training_list');
INSERT INTO `resource` VALUES ('8', '121', '人事管理-培训计划-年度培训计划', 'URL', '/persons/ytrainplan/ytrainplan_list');
INSERT INTO `resource` VALUES ('9', '130', '人事管理-年度招聘-年度招聘计划', 'URL', '/persons/Recruitment/recruitment_ylist');
INSERT INTO `resource` VALUES ('10', '140', '人事管理-日常招聘-日常招聘', 'URL', '/persons/Recruitment/recruitment_list');
INSERT INTO `resource` VALUES ('11', '150', '人事管理-机构管理-部门管理', 'URL', '/persons/department/department_list');
INSERT INTO `resource` VALUES ('12', '151', '人事管理-机构管理-职位管理', 'URL', '/persons/jobs/jobs_list');
INSERT INTO `resource` VALUES ('13', '200', '仓库管理-退货-登记', 'URL', '/sales/return/returned/returned_addInput');
INSERT INTO `resource` VALUES ('14', '201', '仓库管理-退货-审核', 'URL', '/sales/return/returned/returned_examineList');
INSERT INTO `resource` VALUES ('15', '210', '仓库管理-入库-产品进仓单', 'URL', '/warehouse/warehouse/warehouse_list');
INSERT INTO `resource` VALUES ('16', '211', '仓库管理-入库-收料通知单', 'URL', '/warehouse/rewinder/rewinder_list');
INSERT INTO `resource` VALUES ('17', '212', '仓库管理-入库-进料验收单', 'URL', '/warehouse/feedexamine/feedexamine_list');
INSERT INTO `resource` VALUES ('18', '220', '仓库管理-出库-外协件发货单', 'URL', '/sales/shipment/shippingnote1/shippingnote1_examineList');
INSERT INTO `resource` VALUES ('19', '221', '仓库管理-出库-发货通知单', 'URL', '/sales/shipment/shinote2/shinote2_list');
INSERT INTO `resource` VALUES ('20', '222', '仓库管理-出库-领料单菜单', 'URL', '/warehouse/requisition/requisition_list');
INSERT INTO `resource` VALUES ('21', '223', '仓库管理-出库-配套发料表', 'URL', '/warehouse/supsendm/supsendm_list');
INSERT INTO `resource` VALUES ('22', '224', '仓库管理-出库-改机通知单', 'URL', '/produce/produceschdul/produceschdul_listware');
INSERT INTO `resource` VALUES ('23', '225', '仓库管理-出库-量试过程跟', 'URL', '/produce/trackingtest/trackingtest_list?sl=1');
INSERT INTO `resource` VALUES ('24', '226', '仓库管理-出库-换货', 'URL', '/null');
INSERT INTO `resource` VALUES ('25', '230', '仓库管理-库存-库存查询', 'URL', '/warehouse/stock/stock_generallist');
INSERT INTO `resource` VALUES ('26', '231', '仓库管理-库存-物料台帐', 'URL', '/warehouse/maccounting/maccounting_list');
INSERT INTO `resource` VALUES ('27', '232', '仓库管理-库存-库存盘点', 'URL', '/warehouse/inventory/inventory_list');
INSERT INTO `resource` VALUES ('28', '233', '仓库管理-库存-辅助材料', 'URL', '/warehouse/auxmaterial/auxmaterial_list');
INSERT INTO `resource` VALUES ('29', '300', '质量控制-工艺管理-部品', 'URL', '/item/item/item_list');
INSERT INTO `resource` VALUES ('30', '301', '质量控制-工艺管理-规格型号', 'URL', '/item/itemtype/itemtype_list');
INSERT INTO `resource` VALUES ('31', '310', '质量控制-供方认定-样品审核', 'URL', '/purchase/samidentified/samidentified_examlist');
INSERT INTO `resource` VALUES ('32', '312', '质量控制-供方认定-量试过程审核', 'URL', '/produce/trackingtest/trackingtest_quaudit_list');
INSERT INTO `resource` VALUES ('33', '313', '质量控制-供方认定-供方认定审核', 'URL', '/purchase/supidentified/supidentified_examlist');
INSERT INTO `resource` VALUES ('34', '320', '质量控制-原料质检-进料验收单', 'URL', '/warehouse/feedexamine/feedexamine_examineList');
INSERT INTO `resource` VALUES ('35', '321', '质量控制-原料质检-收料通知单', 'URL', '/warehouse/rewinder/rewinder_examineList');
INSERT INTO `resource` VALUES ('36', '330', '质量控制-出货检验-审核', 'URL', '/sales/shipment/shippingnote1/shippingnote1_qualityList');
INSERT INTO `resource` VALUES ('37', '331', '质量控制-出货检验-查询', 'URL', '/sales/shipment/shippingnote1/shippingnote1_list');
INSERT INTO `resource` VALUES ('38', '340', '质量控制-退货检验-退货报告表', 'URL', '/sales/return/returned/returned_qualityList');
INSERT INTO `resource` VALUES ('39', '341', '质量控制-退货检验-退货质量分析', 'URL', '/sales/return/qualityanalysis/qualityanalysis_list');
INSERT INTO `resource` VALUES ('40', '342', '质量控制-退货检验-退货统计', 'URL', '/sales/return/rmtotal/rmtotal_list');
INSERT INTO `resource` VALUES ('41', '350', '质量控制-物料变异-物料变异', 'URL', '/warehouse/variation/variation_auditlist');
INSERT INTO `resource` VALUES ('42', '351', '质量控制-物料变异-报废', 'URL', '/wuliaobaofei');
INSERT INTO `resource` VALUES ('43', '360', '质量控制-日产质量-一车间', 'URL', '/proreport/proreportone_list');
INSERT INTO `resource` VALUES ('44', '361', '质量控制-日产质量-三车间', 'URL', '/proreport/proreportthree_list');
INSERT INTO `resource` VALUES ('45', '362', '质量控制-日产质量-五车间', 'URL', '/proreport/proreportfive_list');
INSERT INTO `resource` VALUES ('46', '400', '生产管理-订单管理-登记', 'URL', '/produce/preparation/preparation_addInput');
INSERT INTO `resource` VALUES ('47', '401', '生产管理-订单管理-外协件审核', 'URL', '/produce/preparation/preparation_examineList');
INSERT INTO `resource` VALUES ('48', '403', '生产管理-订单管理-查询', 'URL', '/preparation/preparation_list');
INSERT INTO `resource` VALUES ('49', '410', '生产管理-生产计划-制定', 'URL', '/produce/preparation/preparation_pass');
INSERT INTO `resource` VALUES ('50', '411', '生产管理-生产计划-审核', 'URL', '/produce/productionplan/productionplan_audit_list');
INSERT INTO `resource` VALUES ('51', '412', '生产管理-生产计划-查询', 'URL', '/produce/productionplan/productionplan_tosearch');
INSERT INTO `resource` VALUES ('52', '420', '生产管理-量试计划-登记', 'URL', '/purchase/testnotes/testnotes_trackingtestaddlist');
INSERT INTO `resource` VALUES ('53', '421', '生产管理-量试计划-审核', 'URL', '/produce/trackingtest/trackingtest_audit_list');
INSERT INTO `resource` VALUES ('54', '422', '生产管理-量试计划-查询', 'URL', '/produce/trackingtest/trackingtest_list');
INSERT INTO `resource` VALUES ('55', '430', '生产管理-生产调度-改机通知单', 'URL', '/produce/produceschdul/produceschdul_list');
INSERT INTO `resource` VALUES ('56', '431', '生产管理-生产调度-退货返工', 'URL', '/sales/return/unqualified/unqualified_list');
INSERT INTO `resource` VALUES ('57', '432', '生产管理-生产调度-生产查询', 'URL', '/produce/produceschdul/produceschdul_producelist');
INSERT INTO `resource` VALUES ('58', '440', '生产管理-物料损益-物料变异申报表', 'URL', '/warehouse/variation/variation_list');
INSERT INTO `resource` VALUES ('59', '441', '生产管理-物料损益-报废申请单', 'URL', '/baofeishenqingdan');
INSERT INTO `resource` VALUES ('60', '450', '生产管理-日产报表-生产日报表', 'URL', '/shengchanribaob');
INSERT INTO `resource` VALUES ('61', '460', '生产管理-维修品管理-维修品管理', 'URL', '/produce/productionrepair/repairproductionlist_list');
INSERT INTO `resource` VALUES ('62', '500', '采购管理-供应商-供应商资料', 'URL', '/purchase/supplierinfo/supplierinfo_list');
INSERT INTO `resource` VALUES ('63', '501', '采购管理-供应商-样品认定', 'URL', '/purchase/samidentified/samidentified_list');
INSERT INTO `resource` VALUES ('64', '502', '采购管理-供应商-量试通知', 'URL', '/purchase/testnotes/testnotes_list');
INSERT INTO `resource` VALUES ('65', '503', '采购管理-供应商-供方认定', 'URL', '/purchase/supidentified/supidentified_list');
INSERT INTO `resource` VALUES ('66', '504', '采购管理-供应商-合格供方', 'URL', '/purchase/quaprolist/quaprolist_list');
INSERT INTO `resource` VALUES ('67', '510', '采购管理-采购指定-采购需求', 'URL', '/produce/shortm/shortm_list');
INSERT INTO `resource` VALUES ('68', '511', '采购管理-采购指定-制定采购', 'URL', '/produce/shortm/shortm_make_list');
INSERT INTO `resource` VALUES ('69', '521', '采购管理-采购审核-采购订单', 'URL', '/purchase/purorder/purorder_list');
INSERT INTO `resource` VALUES ('70', '530', '采购管理-材料退回-进料验收单', 'URL', '/warehouse/feedexamine/feedexamine_unqualifylist');
INSERT INTO `resource` VALUES ('71', '531', '采购管理-材料退回-收料通知单', 'URL', '/warehouse/rewinder/rewinder_unqualifylist');
INSERT INTO `resource` VALUES ('72', '540', '采购管理-备品备料-备品备料', 'URL', '/purchase/spare/spare_list');
INSERT INTO `resource` VALUES ('73', '600', '系统管理-系统公告-系统公告', 'URL', '/annoucement/annoucement/annoucement_list');
INSERT INTO `resource` VALUES ('74', '611', '系统管理-角色管理-权限角色', 'URL', '/security/role/role_list');
INSERT INTO `resource` VALUES ('75', '610', '系统管理-角色管理-系统用户', 'URL', '/security/user/user_list');
INSERT INTO `resource` VALUES ('76', '612', '系统管理-角色管理-权限资源', 'URL', '/security/resource/resource_list');
INSERT INTO `resource` VALUES ('77', '311', '质量控制-供方认定-量试审核', 'URL', '/purchase/testnotes/testnotes_examlist');
INSERT INTO `resource` VALUES ('78', '520', '采购管理-采购审核-物料请购单', 'URL', '/purchase/requisitions/requisitions_list');
INSERT INTO `resource` VALUES ('80', '', '添加产品进仓单页面', 'URL', '/warehouse/warehouse/warehouse_addInput**');
INSERT INTO `resource` VALUES ('81', '', '审核产品进仓单并进仓页面', 'URL', '/warehouse/storescheduling/storescheduling_addInput**');
INSERT INTO `resource` VALUES ('82', '', '显示进仓单', 'URL', '/warehouse/warehouse/warehouse_show**');
INSERT INTO `resource` VALUES ('83', '', '编辑产品进仓单页面', 'URL', '/warehouse/warehouse/warehouse_editInput**');
INSERT INTO `resource` VALUES ('84', '', '提交添加产品进仓单', 'URL', '/warehouse/warehouse/warehouse_add**');
INSERT INTO `resource` VALUES ('85', '', '删除进仓单', 'URL', '/warehouse/warehouse/warehouse_del**');
INSERT INTO `resource` VALUES ('86', '', '提交编辑产品进仓单', 'URL', '/warehouse/warehouse/warehouse_update**');
INSERT INTO `resource` VALUES ('87', '', '提交审核产品进仓单', 'URL', '/warehouse/warehouse/storescheduling/storeschduling_addwarehouse**');
INSERT INTO `resource` VALUES ('88', '', '添加收料通知单（采购订单）', 'URL', '/warehouse/rewinder/rewinder_addInput3**');
INSERT INTO `resource` VALUES ('89', '', '添加收料通知单（半成品进仓单）', 'URL', '/warehouse/rewinder/rewinder_addInput2**');
INSERT INTO `resource` VALUES ('90', '', '添加收料通知单（物料请购单）', 'URL', '/warehouse/rewinder/rewinder_addInput**');
INSERT INTO `resource` VALUES ('91', '', '检验收料通知单', 'URL', '/warehouse/rewinder/rewinder_examineInput**');
INSERT INTO `resource` VALUES ('92', '', '收料通知单入库', 'URL', '/warehouse/storescheduling/storescheduling_addInputRewinder**');
INSERT INTO `resource` VALUES ('93', '', '查看收料通知单', 'URL', '/rewinder/rewinder_show**');
INSERT INTO `resource` VALUES ('94', '', '编辑收料通知单', 'URL', '/warehouse/rewinder/rewinder_editInput**');
INSERT INTO `resource` VALUES ('95', '', '删除收料通知单', 'URL', '/warehouse/rewinder/rewinder_del**');
INSERT INTO `resource` VALUES ('96', '', '提交添加收料通知单（半成品进仓单）', 'URL', '/warehouse/rewinder/rewinder_add2**');
INSERT INTO `resource` VALUES ('97', '', '提交添加收料通知单（采购订单）', 'URL', '/warehouse/rewinder/rewinder_add3**');
INSERT INTO `resource` VALUES ('98', '', '收料通知单提交检验', 'URL', '/warehouse/rewinder/rewinder_examine**');
INSERT INTO `resource` VALUES ('99', '', '收料通知单提交入库', 'URL', '/warehouse/stoescheduling/storescheduling_addrewinder**');
INSERT INTO `resource` VALUES ('100', '', '收料通知单提交显示', 'URL', '/warehouse/rewinder/rewinder_list**');
INSERT INTO `resource` VALUES ('101', '', '收料通知单提交编辑', 'URL', '/warehouse/rewinder/rewinder_update**');
INSERT INTO `resource` VALUES ('102', '', '添加进料验收单（采购订单）', 'URL', '/warehouse/feedexamine/feedexamine_addInput2**');
INSERT INTO `resource` VALUES ('103', '', '添加进料验收单（物料请购单）', 'URL', '/warehouse/feedexamine/feedexamine_addInput**');
INSERT INTO `resource` VALUES ('104', '', '进料验收单核对数量', 'URL', '/warehouse/feedexamine/feedexamine_confirmInput**');
INSERT INTO `resource` VALUES ('105', '', '进料验收单检验', 'URL', '/warehouse/feedexamine/feedexamine_confirmInput**');
INSERT INTO `resource` VALUES ('106', '', '进料验收单入库', 'URL', '/warehouse/storescheduling/storescheduling_addInputFeedexamine**');
INSERT INTO `resource` VALUES ('107', '', '提交添加(物料请购单）', 'URL', '/warehouse/feedexamine/feedexamine_add**');
INSERT INTO `resource` VALUES ('108', '', '提交添加（采购订单）', 'URL', '/warehouse/feedexamine/feedexamne_addpur**');
INSERT INTO `resource` VALUES ('109', '', '提交核对(采购订单)', 'URL', '/warehouse/feedexamine/feedexamine_confirm**');
INSERT INTO `resource` VALUES ('110', '', '提交检验(采购订单)', 'URL', '/warehouse/feedexamine/feedexamine_examine**');
INSERT INTO `resource` VALUES ('111', '', '提交入库(采购订单)', 'URL', '/warehouse/storescheduling/storescheduling_addfeedexamine**');
INSERT INTO `resource` VALUES ('112', '', '添加领料单页面', 'URL', '/warehouse/requisition/requisition_addInput**');
INSERT INTO `resource` VALUES ('113', '', '审核领料单并出库', 'URL', '/warehouse/requisition/requisition_examineInput**');
INSERT INTO `resource` VALUES ('114', '', '编辑领料单', 'URL', '/warehouse/requisition/requisition_editInput**');
INSERT INTO `resource` VALUES ('115', '', '删除领料单', 'URL', '/warehouse/requisition/requisition_del**');
INSERT INTO `resource` VALUES ('116', '', '提交添加领料单', 'URL', '/warehouse/requisition/reqquisition_add**');
INSERT INTO `resource` VALUES ('117', '', '提交审核领料单', 'URL', '/warehouse/requisition/reqquisition_examine**');
INSERT INTO `resource` VALUES ('118', '', '提交编辑领料单', 'URL', '/warehouse/requisition/requisition_update**');
INSERT INTO `resource` VALUES ('119', '', '库存查询', 'URL', '/warehouse/stock/stoce_generallist**');
INSERT INTO `resource` VALUES ('120', '', '保税品库存查询', 'URL', '/warehouse/stock/stoce_bondedllist**');
INSERT INTO `resource` VALUES ('121', '', '物料台账', 'URL', '/warehouse/maccouting/maccounting_list**');
INSERT INTO `resource` VALUES ('123', '', '辅助材料', 'URL', '/warehouse/auxmaterial/auxmaterial_list**');
INSERT INTO `resource` VALUES ('124', '', '添加辅助材料', 'URL', '/warehouse/auxmaterial/auxmaterial_addInput**');
INSERT INTO `resource` VALUES ('125', '', '提交添加辅助材料', 'URL', '/warehouse/auxmaterial/auxmaterial_add**');
INSERT INTO `resource` VALUES ('126', '', '添加一车间日生产质量报表', 'URL', '/proreport/proreportone_addInput**');
INSERT INTO `resource` VALUES ('127', '', '编辑一车间日生产质量报表', 'URL', '/proreport/proreportone_editInput**');
INSERT INTO `resource` VALUES ('128', '', '添加三车间日生产质量报表', 'URL', '/proreport/proreportthree_addInput**');
INSERT INTO `resource` VALUES ('129', '', '编辑三车间日生产质量报表', 'URL', '/proreport/proreportthree_editInput**');
INSERT INTO `resource` VALUES ('130', '', '添加五车间日生产质量报表', 'URL', '/proreport/proreportfive_addInput**');
INSERT INTO `resource` VALUES ('131', '', '编辑五车间日生产质量报表', 'URL', '/proreport/proreportfive_editInput**');
INSERT INTO `resource` VALUES ('132', '', '添加部品（输入）', 'URL', '/item/item/item_addInput**');
INSERT INTO `resource` VALUES ('133', '', '添加部品', 'URL', '/item/item/item_add**');
INSERT INTO `resource` VALUES ('134', '', '添加型号规格（输入）', 'URL', '/item/itemtype/itemtype_addInput**');
INSERT INTO `resource` VALUES ('135', '', '添加型号规格', 'URL', '/item/itemtype/itemtype_add**');
INSERT INTO `resource` VALUES ('136', '', '部品更新（输入）', 'URL', '/item/item/item_editInput**');
INSERT INTO `resource` VALUES ('137', '', '部品更新', 'URL', '/item/item/item_update**');
INSERT INTO `resource` VALUES ('138', '', '型号规格更新（输入）', 'URL', '/item/itemtype/itemtype_editInput**');
INSERT INTO `resource` VALUES ('139', '', '型号规格更新', 'URL', '/item/itemtype/itemtype_update**');
INSERT INTO `resource` VALUES ('140', '', '删除部品', 'URL', '/item/item/item_del**');
INSERT INTO `resource` VALUES ('141', '', '删除型号规格', 'URL', '/item/itemtype/itemtype_del**');
INSERT INTO `resource` VALUES ('142', '', '要货计划单列表(配套发料用）', 'URL', '/warehouse/supsendm/supsendm_preparationList**');
INSERT INTO `resource` VALUES ('143', '', '选定要货计划单详情（配套发料用）', 'URL', '/warehouse/supsendm/supsendm_selectedPreparation**');
INSERT INTO `resource` VALUES ('144', '', '添加配套发料表（输入）', 'URL', '/warehouse/supsendm/supsendm_addInput**');
INSERT INTO `resource` VALUES ('145', '', '添加配套发料表', 'URL', '/warehouse/supsendm/supsendm_add**');
INSERT INTO `resource` VALUES ('146', '', '更新配套发料表（输入）', 'URL', '/warehouse/supsendm/supsendm_updateInput**');
INSERT INTO `resource` VALUES ('147', '', '更新配套发料表', 'URL', '/warehouse/supsendm/supsendm_update**');
INSERT INTO `resource` VALUES ('148', '', '删除配套发料表', 'URL', '/warehouse/supsendm/supsendm_del**');
INSERT INTO `resource` VALUES ('149', '', '添加要货计划单', 'URL', '/produce/preparation/preparation_add**');
INSERT INTO `resource` VALUES ('150', '', '删除要货单', 'URL', '/produce/preparation/preparation_del**');
INSERT INTO `resource` VALUES ('151', '', '修改要货单', 'URL', '/produce/preparation/preparation_edit**');
INSERT INTO `resource` VALUES ('152', '', '显示要货单', 'URL', '/produce/preparation/preparation_show**');
INSERT INTO `resource` VALUES ('153', '', '变更或履行情况记录', 'URL', '/produce/preparation/preparation_fulfill**');
INSERT INTO `resource` VALUES ('154', '', '变更或履行记录确认', 'URL', '/produce/preparation/preparation_confimation**');
INSERT INTO `resource` VALUES ('155', '', '进入要货计划单编辑页面', 'URL', '/produce/preparation/preparation_editInput**');
INSERT INTO `resource` VALUES ('156', '', '进入要货计划单领导审核', '', 'URL');
INSERT INTO `resource` VALUES ('157', '', '进入要货计划单品工部审核', 'URL', '/produce/preparation/preparation_pingongExamineInput**');
INSERT INTO `resource` VALUES ('158', '', '进入要货计划单生产部审核', 'URL', '/produce/preparation/preparation_produceExamineInput**');
INSERT INTO `resource` VALUES ('159', '', '进入变更或履行记录', 'URL', '/produce/preparation/preparation_fulfillInput**');
INSERT INTO `resource` VALUES ('160', '', '进入变更或履行记录确认', 'URL', '/produce/preparation/preparation_confimationInput**');
INSERT INTO `resource` VALUES ('161', '', '发货通知单添加页面', 'URL', '/sales/shipment/shinote2/shinote2_addInput**');
INSERT INTO `resource` VALUES ('162', '', '发货通知单的添加', 'URL', '/sales/shipment/shinote2/shinote2_add**');
INSERT INTO `resource` VALUES ('163', '', '发货通知单的显示', 'URL', '/sales/shipment/shinote2/shinote2_show**');
INSERT INTO `resource` VALUES ('164', '', '仓库审核', 'URL', '/sales/shipment/shinote2/shinote2_examine**');
INSERT INTO `resource` VALUES ('165', '', '发货通知单审核页面', 'URL', '/sales/shipment/shinote2/shinote2_examineInput**');
INSERT INTO `resource` VALUES ('166', '', '发货通知单的修改页面', 'URL', '/sales/shipment/shinote2/shinote2_editInput**');
INSERT INTO `resource` VALUES ('167', '', '发货通知单的修改', 'URL', '/sales/shipment/shinote2/shinote2_update**');
INSERT INTO `resource` VALUES ('168', '', '发货通知单的删除', 'URL', '/sales/shipment/shinote2/shinote2_del**');
INSERT INTO `resource` VALUES ('169', '', '退货报告单添加', 'URL', '/sales/return/returned/returned_add**');
INSERT INTO `resource` VALUES ('170', '', '退货报告单显示', 'URL', '/sales/return/returned/returned_show**');
INSERT INTO `resource` VALUES ('171', '', '退货单进入仓库审核页面', 'URL', '/sales/return/returned/returned_examineInput**');
INSERT INTO `resource` VALUES ('172', '', '退货通知单的更新', 'URL', '/sales/return/returned/returned_update**');
INSERT INTO `resource` VALUES ('173', '', '退货单进入更新页面', 'URL', '/sales/return/returned/returned_editInput**');
INSERT INTO `resource` VALUES ('174', '', '退货单的删除', 'URL', '/sales/return/returned/returned_del**');
INSERT INTO `resource` VALUES ('175', '', '退货单仓库审核方法', 'URL', '/sales/return/returned/returned_examine**');
INSERT INTO `resource` VALUES ('176', '', '退货单进入质量审核页面', 'URL', '/sales/return/returned/returned_qualityInput**');
INSERT INTO `resource` VALUES ('177', '', '退货单质量检验方法', 'URL', '/sales/return/returned/returned_qualityexamine**');
INSERT INTO `resource` VALUES ('178', '', '添加不合格单页面', 'URL', '/sales/return/unqualified/unqualified_addInput**');
INSERT INTO `resource` VALUES ('179', '', '不合格单的添加', 'URL', '/sales/return/unqualified/unqualified_add**');
INSERT INTO `resource` VALUES ('180', '', '不合格单的显示', 'URL', '/sales/return/unqualified/unqualified_show**');
INSERT INTO `resource` VALUES ('181', '', '不合格单的删除', 'URL', '/sales/return/returned/returned_del**');
INSERT INTO `resource` VALUES ('182', '', '外协件发货单的添加页面', 'URL', '/sales/shipment/shippingnote1/shippingnote1_addInput**');
INSERT INTO `resource` VALUES ('183', '', '外协件发货单的显示', 'URL', '/sales/shipment/shippingnote1/shippingnote1_show**');
INSERT INTO `resource` VALUES ('184', '', '外协件发货单的编辑', 'URL', '/sales/shipment/shippingnote1/shippingnote1_update**');
INSERT INTO `resource` VALUES ('185', '', '外协件发货单的编辑页面', 'URL', '/sales/shipment/shippingnote1/shippingnote1_editInput**');
INSERT INTO `resource` VALUES ('186', '', '外协件发货单的删除', 'URL', '/sales/shipment/shippingnote1/shippingnote1_del**');
INSERT INTO `resource` VALUES ('187', '', '外协件发货单的仓库审核页面', 'URL', '/sales/shipment/shippingnote1/shippingnote1_examineInput**');
INSERT INTO `resource` VALUES ('188', '', '外协件发货单的质量审核页面', 'URL', '/sales/shipment/shippingnote1/shippingnote1_shi1goodList**');
INSERT INTO `resource` VALUES ('189', '', '外协件发货单的质量审核的提交', 'URL', '/sales/shipment/shippingnote1/shippingnote1_goodlistAdd**');
INSERT INTO `resource` VALUES ('190', '', '外协件发货单的仓库审核的提交', 'URL', '/sales/shipment/shippingnote1/shippingnote1_sendedAdd**');
INSERT INTO `resource` VALUES ('191', '', '冷冲件的跳转', 'URL', '/sales/shipment/shippingnote1/shippingnote1_taxstamInput**');
INSERT INTO `resource` VALUES ('192', '', '板卡的跳转', 'URL', '/sales/shipment/shippingnote1/shippingnote1_taxboardInput**');
INSERT INTO `resource` VALUES ('193', '', '板卡的添加', 'URL', '/sales/shipment/shippingnote1/shippingnote1_taxboardAdd**');
INSERT INTO `resource` VALUES ('194', '', '冷冲的添加', 'URL', '/sales/shipment/shippingnote1/shippingnote1_taxstamAdd**');
INSERT INTO `resource` VALUES ('195', '', '冷冲件显示', 'URL', '/sales/shipment/shippingnote1/shippingnote1_tasShow**');
INSERT INTO `resource` VALUES ('196', '', '板卡显示', 'URL', '/sales/shipment/shippingnote1/shippingnote1_taxShow**');
INSERT INTO `resource` VALUES ('197', '', '退货质量分析添加的页面', 'URL', '/sales/return/qualityanalysis/qualityanalysis_addInput**');
INSERT INTO `resource` VALUES ('198', '', '退货质量分析编辑的页面', 'URL', '/sales/return/qualityanalysis/qualityanalysis_editInput**');
INSERT INTO `resource` VALUES ('199', '', '退货质量分析的删除', 'URL', '/sales/return/qualityanalysis/qualityanalysis_del**');
INSERT INTO `resource` VALUES ('200', '', '退货质量分析的添加', 'URL', '/sales/return/qualityanalysis/qualityanalysis_add**');
INSERT INTO `resource` VALUES ('201', '', '退货质量分析的更新', 'URL', '/sales/return/qualityanalysis/qualityanalysis_update**');
INSERT INTO `resource` VALUES ('202', '', '退货统计添加页面', 'URL', '/sales/return/rmtotal/rmtotal_addInput**');
INSERT INTO `resource` VALUES ('203', '', '退货统计的编辑的页面', 'URL', '/sales/return/rmtotal/rmtotal_editInput**');
INSERT INTO `resource` VALUES ('204', '', '退货统计的删除', 'URL', '/sales/return/rmtotal/rmtotal_del**');
INSERT INTO `resource` VALUES ('205', '', '退货统计添加', 'URL', '/sales/return/rmtotal/rmtotal_add**');
INSERT INTO `resource` VALUES ('206', '', '退货统计更新', 'URL', '/sales/return/rmtotal/rmtotal_update**');
INSERT INTO `resource` VALUES ('214', '', '提交添加一车间日生产质量报表', 'URL', '/proreport/proreportone_add**');
INSERT INTO `resource` VALUES ('215', '', '提交编辑一车间日生产质量报表', 'URL', '/proreport/proreportone_update**');
INSERT INTO `resource` VALUES ('216', '', '删除一车间日生产质量报表', 'URL', '/proreport/proreportone_del**');
INSERT INTO `resource` VALUES ('217', '', '提交添加三车间日生产质量报表', 'URL', '/proreport/proreportthree_add**');
INSERT INTO `resource` VALUES ('218', '', '提交编辑三车间日生产质量报表', 'URL', '/proreport/proreportthree_update**');
INSERT INTO `resource` VALUES ('219', '', '删除三车间日生产质量报表', 'URL', '/proreport/proreportthree_del**');
INSERT INTO `resource` VALUES ('220', '', '提交添加五车间日生产质量报表', 'URL', '/proreport/proreportfive_add**');
INSERT INTO `resource` VALUES ('221', '', '编辑五车间日生产质量报表', 'URL', '/proreport/proreportfive_editInput**');
INSERT INTO `resource` VALUES ('222', '', '提交编辑五车间日生产质量报表', 'URL', '/proreport/proreportfive_update**');
INSERT INTO `resource` VALUES ('223', '', '删除五车间日生产质量报表', 'URL', '/proreport/proreportfive_del**');
INSERT INTO `resource` VALUES ('224', '', '添加生产计划单页面', 'URL', '/produce/productionplan/productionplan_make_list**');
INSERT INTO `resource` VALUES ('225', '', '审核与批准生产计划单页面', 'URL', '/produce/productionplan/productionplan_audit**');
INSERT INTO `resource` VALUES ('227', '', '编辑生产计划单页面', 'URL', '/productionplan/productionplan_edit_input**');
INSERT INTO `resource` VALUES ('228', '', '删除生产计划单', 'URL', '/produce/productionplan/productionplan_del**');
INSERT INTO `resource` VALUES ('229', '', '查看生产计划单', 'URL', '/produce/productionplan/productionplan_show**');
INSERT INTO `resource` VALUES ('230', '', '添加生产计划单', 'URL', '/produce/productionplan/productionplan_add**');
INSERT INTO `resource` VALUES ('231', '', '编辑生产计划单', 'URL', '/produce/productionplan/productionplan_edit**');
INSERT INTO `resource` VALUES ('232', '', '审核生产计划单', 'URL', '/produce/productionplan/productionplan_approve**');
INSERT INTO `resource` VALUES ('233', '', '添加量试跟踪单页面', 'URL', '/produce/trackingtest/trackingtest_add_input**');
INSERT INTO `resource` VALUES ('234', '', '三/五车间审核量试跟踪单页面', 'URL', '/produce/trackingtest/trackingtest_wsaudit_input**');
INSERT INTO `resource` VALUES ('235', '', '一车间填写量试跟踪单页面', 'URL', '/produce/trackingtest/trackingtest_proaudit_input**');
INSERT INTO `resource` VALUES ('236', '', '品工部审核量试跟踪单页面', 'URL', '/produce/trackingtest/trackingtest_quaudit_input**');
INSERT INTO `resource` VALUES ('237', '', '编辑量试跟踪单页面', 'URL', '/produce/trackingtest/trackingtest_edit_input**');
INSERT INTO `resource` VALUES ('238', '', '删除量试跟踪单', 'URL', '/produce/trackingtest/trackingtest_del**');
INSERT INTO `resource` VALUES ('239', '', '添加量试通知单', 'URL', '/produce/trackingtest/trackingtest_add**');
INSERT INTO `resource` VALUES ('240', '', '编辑量试通知单', 'URL', '/produce/trackingtest/trackingtest_update**');
INSERT INTO `resource` VALUES ('241', '', '三/五车间审核量试通知单', 'URL', '/produce/trackingtest/trackingtest_wsaudit**');
INSERT INTO `resource` VALUES ('242', '', '一车间填写量试通知单', 'URL', '/produce/trackingtest/trackingtest_proaudit**');
INSERT INTO `resource` VALUES ('243', '', '品工审核量试通知单页面', 'URL', '/produce/trackingtest/trackingtest_quaudit**');
INSERT INTO `resource` VALUES ('244', '', '添加新人员信息页面', 'URL', '/persons/​employee/​employee_addInput**');
INSERT INTO `resource` VALUES ('245', '', '添加人员信息', 'URL', '/persons/employee/employee_add**');
INSERT INTO `resource` VALUES ('246', '', '删除人员信息', 'URL', '/persons/employee/employee_del**');
INSERT INTO `resource` VALUES ('247', '', '查看人员信息', 'URL', '/persons/employee/employee_show**');
INSERT INTO `resource` VALUES ('248', '', '修改人员信息页面', 'URL', '/persons/employee/employee_editInput**');
INSERT INTO `resource` VALUES ('249', '', '修改人员信息', 'URL', '/persons/employee/employee_update**');
INSERT INTO `resource` VALUES ('250', '', '人员奖惩页面', 'URL', '/persons/employee/employee_rapaddinput**');
INSERT INTO `resource` VALUES ('251', '', '修改人员奖惩页面', 'URL', '/persons/employee/employee_rapeditInput**');
INSERT INTO `resource` VALUES ('252', '', '人员奖惩删除', 'URL', '/persons/employee/employee_rapdel**');
INSERT INTO `resource` VALUES ('253', '', '修改人员奖惩', 'URL', '/persons/employee/employee_rapupdate**');
INSERT INTO `resource` VALUES ('254', '', '添加人员奖惩', 'URL', '/persons/employee/employee_rapadd**');
INSERT INTO `resource` VALUES ('255', '', '添加人员奖惩', 'URL', '/persons/employee/employee_rapadd**');
INSERT INTO `resource` VALUES ('256', '', '添加培训内容页面', 'URL', '/persons/training/training_addInput**');
INSERT INTO `resource` VALUES ('257', '', '修改培训内容页面', 'URL', '/persons/training/training_editInput**');
INSERT INTO `resource` VALUES ('258', '', '删除培训内容页面', 'URL', '/persons/training/training_del**');
INSERT INTO `resource` VALUES ('259', '', '添加培训内容', 'URL', '/persons/training/training_add**');
INSERT INTO `resource` VALUES ('260', '', '修改培训内容', 'URL', '/persons/training/training_update**');
INSERT INTO `resource` VALUES ('261', '', '删除年度培训计划内容', 'URL', '/persons/ytrainplan/ytrainplan_del**');
INSERT INTO `resource` VALUES ('262', '', '添加年度培训计划内容页面', 'URL', '/persons/ytrainplan/ytrainplan_addInput**');
INSERT INTO `resource` VALUES ('263', '', '查看年度培训计划内容', 'URL', '/persons/ytrainplan/ytrainplan_show**');
INSERT INTO `resource` VALUES ('264', '', '添加年度培训计划内容', 'URL', '/persons/ytrainplan/ytrainplan_add**');
INSERT INTO `resource` VALUES ('265', '', '添加日常招聘页面', 'URL', '/persons/Recruitment/recruitment_addInput**');
INSERT INTO `resource` VALUES ('266', '', '修改日常招聘页面', 'URL', '/persons/Recruitment/recruitment_editInput**');
INSERT INTO `resource` VALUES ('267', '', '审核日常招聘页面', 'URL', '/persons/Recruitment/recruitment_editInputCheck**');
INSERT INTO `resource` VALUES ('268', '', '删除日常招聘', 'URL', '/starerp07/persons/Recruitment/recruitment_del**');
INSERT INTO `resource` VALUES ('269', '', '添加日常招聘', 'URL', '/persons/Recruitment/recruitment_add**');
INSERT INTO `resource` VALUES ('270', '', '修改日常招聘', 'URL', '/persons/Recruitment/recruitment_update**');
INSERT INTO `resource` VALUES ('271', '', '审核日常招聘', 'URL', '/persons/Recruitment/recruitment_checked**');
INSERT INTO `resource` VALUES ('272', '', '删除年度招聘', 'URL', '/persons/Recruitment/recruitment_ydel**');
INSERT INTO `resource` VALUES ('273', '', '查看年度招聘', 'URL', '/persons/Recruitment/recruitment_show**');
INSERT INTO `resource` VALUES ('274', '', '添加年度招聘页面', 'URL', '/persons/Recruitment/recruitment_yaddInput**');
INSERT INTO `resource` VALUES ('275', '', '添加年度招聘', 'URL', '/persons/Recruitment/recruitment_yadd**');
INSERT INTO `resource` VALUES ('276', '', '添加部门页面', 'URL', '/persons/department/department_addInput**');
INSERT INTO `resource` VALUES ('277', '', '修改部门页面', 'URL', '/persons/department/department_editInput**');
INSERT INTO `resource` VALUES ('278', '', '删除部门', 'URL', '/persons/department/department_del**');
INSERT INTO `resource` VALUES ('279', '', '添加部门', 'URL', '/persons/department/department_add**');
INSERT INTO `resource` VALUES ('280', '', '修改部门', 'URL', '/persons/department/department_update**');
INSERT INTO `resource` VALUES ('281', '', '添加职位页面', 'URL', '/persons/jobs/jobs_addInput**');
INSERT INTO `resource` VALUES ('282', '', '修改职位页面', 'URL', '/persons/jobs/jobs_editInput**');
INSERT INTO `resource` VALUES ('283', '', '删除职位', 'URL', '/persons/jobs/jobs_del**');
INSERT INTO `resource` VALUES ('284', '', '添加职位', 'URL', '/persons/jobs/jobs_add**');
INSERT INTO `resource` VALUES ('285', '', '修改职位', 'URL', '/persons/jobs/jobs_update**');
INSERT INTO `resource` VALUES ('286', '', '收发消息', 'URL', '/persons/Rasmessage/rasmessage_**');
INSERT INTO `resource` VALUES ('289', '', '供应商添加页面', 'URL', '/purchase/supplierinfo/supplierinfo_addInput**');
INSERT INTO `resource` VALUES ('290', '', '供应商编辑页面', 'URL', '/purchase/supplierinfo/supplierinfo_editInput**');
INSERT INTO `resource` VALUES ('291', '', '供应商编辑', 'URL', '/purchase/supplierinfo/supplierinfo_update**');
INSERT INTO `resource` VALUES ('292', '', '供应商删除', 'URL', '/purchase/supplierinfo/supplierinfo_del**');
INSERT INTO `resource` VALUES ('293', '', '供应商审核页面', 'URL', '/purchase/supplierinfo/supplierinfo_examine**');
INSERT INTO `resource` VALUES ('294', '', '供应商审核', 'URL', '/purchase/supplierinfo/supplierinfo_update**');
INSERT INTO `resource` VALUES ('295', '', '供应商查询', 'URL', 'purchase/supplierinfo/supplierinfo_show**');
INSERT INTO `resource` VALUES ('296', '', '样品认定申报单添加页面', 'URL', '/purchase/samidentified/samidentified_addInput**');
INSERT INTO `resource` VALUES ('297', '', '样品认定申报单添加', 'URL', '/purchase/supplierinfo/supplierinfo_add**');
INSERT INTO `resource` VALUES ('298', '', '样品认定申报单删除', 'URL', '/purchase/samidentified/samidentified_del**');
INSERT INTO `resource` VALUES ('299', '', '样品认定申报单编辑页面', 'URL', '/purchase/samidentified/samidentified_editInput**');
INSERT INTO `resource` VALUES ('300', '', '样品认定申报单编辑', 'URL', '/purchase/supplierinfo/supplierinfo_update**');
INSERT INTO `resource` VALUES ('301', '', '样品认定申报单查看', 'URL', '/purchase/samidentified/samidentified_show**');
INSERT INTO `resource` VALUES ('302', '', '样品认定申报单负责人确认', 'URL', '/purchase/samidentified/samidentified_resperexam**');
INSERT INTO `resource` VALUES ('303', '', '样品认定申报单负责人确认', 'URL', '/purchase/samidentified/samidentified_update**');
INSERT INTO `resource` VALUES ('304', '', '样品认定申报单品工部审', 'URL', '/purchase/samidentified/samidentified_examine?step=1**');
INSERT INTO `resource` VALUES ('305', '', '样品认定申报单主管审', 'URL', '/purchase/samidentified/samidentified_examine?step=2**');
INSERT INTO `resource` VALUES ('306', '', '样品认定申报单分管领导审', 'URL', '/purchase/samidentified/samidentified_examine?step=3**');
INSERT INTO `resource` VALUES ('307', '', '样品认定申报单审核', 'URL', '/purchase/samidentified/samidentified_update**');
INSERT INTO `resource` VALUES ('308', '', '量试通知单添加页面', 'URL', '/purchase/testnotes/testnotes_samidList**');
INSERT INTO `resource` VALUES ('309', '', '量试通知单编辑页面', 'URL', '/purchase/testnotes/testnotes_editInput**');
INSERT INTO `resource` VALUES ('310', '', '量试通知单编辑', 'URL', '/purchase/testnotes/testnotes_update**');
INSERT INTO `resource` VALUES ('311', '', '量试通知单删除', 'URL', '/purchase/testnotes/testnotes_del**');
INSERT INTO `resource` VALUES ('312', '', '量试通知单查看', 'URL', '/purchase/testnotes/testnotes_show**');
INSERT INTO `resource` VALUES ('313', '', '量试通知单采购确认', 'URL', '/purchase/testnotes/testnotes_purexam**');
INSERT INTO `resource` VALUES ('314', '', '量试通知单品工审', 'URL', '/purchase/testnotes/testnotes_examine?step=1**');
INSERT INTO `resource` VALUES ('315', '', '量试通知单检验', 'URL', '/purchase/testnotes/testnotes_examine?step=2**');
INSERT INTO `resource` VALUES ('316', '', '量试通知单主管审', 'URL', '/purchase/testnotes/testnotes_examine?step=3**');
INSERT INTO `resource` VALUES ('317', '', '量试通知单审核', 'URL', '/purchase/testnotes/testnotes_update**');
INSERT INTO `resource` VALUES ('318', '', '供方认定添加', 'URL', '/purchase/supidentified/supidentified_toadd**');
INSERT INTO `resource` VALUES ('319', '', '供方认定编辑', 'URL', '/purchase/supidentified/supidentified_editInput**');
INSERT INTO `resource` VALUES ('320', '', '供方认定删除', 'URL', '/purchase/supidentified/supidentified_del**');
INSERT INTO `resource` VALUES ('321', '', '供方认定采购经办', 'URL', '/purchase/supidentified/supidentified_purexamine?step=1**');
INSERT INTO `resource` VALUES ('322', '', '供方认定部门负责人', 'URL', '/purchase/supidentified/supidentified_purexamine?step=2**');
INSERT INTO `resource` VALUES ('323', '', '供方认定确认', 'URL', '/purchase/supidentified/supidentified_update**');
INSERT INTO `resource` VALUES ('324', '', '供方认定审核品工经办', 'URL', '/purchase/supidentified/supidentified_examine?step=1**');
INSERT INTO `resource` VALUES ('325', '', '供方认定品工负责人', 'URL', '/purchase/supidentified/supidentified_examine?step=2**');
INSERT INTO `resource` VALUES ('326', '', '供方认定领导签字', 'URL', '/purchase/supidentified/supidentified_examine?step=3**');
INSERT INTO `resource` VALUES ('327', '', '供方认定审核', 'URL', '/purchase/supidentified/supidentified_update**');
INSERT INTO `resource` VALUES ('328', '', '合格供方编辑页面', 'URL', '/purchase/quaprolist/quaprolist_editInput**');
INSERT INTO `resource` VALUES ('329', '', '合格供方编辑', 'URL', '/purchase/quaprolist/quaprolist_update**');
INSERT INTO `resource` VALUES ('330', '', '合格供方删除', 'URL', '/purchase/quaprolist/quaprolist_del**');
INSERT INTO `resource` VALUES ('331', '', '合格供方查看', 'URL', '/purchase/quaprolist/quaprolist_show**');
INSERT INTO `resource` VALUES ('332', '', '物料请购编辑页面', 'URL', '/purchase/requisitions/requisitions_editInput**');
INSERT INTO `resource` VALUES ('333', '', '物料请购编辑', 'URL', '/purchase/requisitions/requisitions_update**');
INSERT INTO `resource` VALUES ('334', '', '物料请购删除', 'URL', '/purchase/requisitions/requisitions_del**');
INSERT INTO `resource` VALUES ('335', '', '物料请购查看', 'URL', '/purchase/requisitions/requisitions_show**');
INSERT INTO `resource` VALUES ('336', '', '物料请购部门审', 'URL', '/purchase/requisitions/requisitions_examine?step=1**');
INSERT INTO `resource` VALUES ('337', '', '物料请购公司审', 'URL', '/purchase/requisitions/requisitions_examine?step=2**');
INSERT INTO `resource` VALUES ('338', '', '物料请购审核', 'URL', '/purchase/requisitions/requisitions_update**');
INSERT INTO `resource` VALUES ('339', '', '物料请购已审核(进入收料页面)', 'URL', '/purchase/requisitions/requisitions_enter**');
INSERT INTO `resource` VALUES ('340', '', '采购订单编辑页面', 'URL', '/purchase/purorder/purorder_editInput**');
INSERT INTO `resource` VALUES ('341', '', '采购订单编辑', 'URL', '/purchase/purorder/purorder_update**');
INSERT INTO `resource` VALUES ('342', '', '采购订单删除', 'URL', '/purchase/purorder/purorder_del**');
INSERT INTO `resource` VALUES ('343', '', '采购订单查看', 'URL', '/purchase/purorder/purorder_show**');
INSERT INTO `resource` VALUES ('344', '', '采购订单审核', 'URL', '/purchase/purorder/purorder_examine?step=1**');
INSERT INTO `resource` VALUES ('345', '', '采购订单审批', 'URL', '/purchase/purorder/purorder_examine?step=2**');
INSERT INTO `resource` VALUES ('346', '', '采购订单已审核(进入进料验收单或者收料通知单页面)', 'URL', '/purchase/purorder/purorder_enter**');
INSERT INTO `resource` VALUES ('347', '', '采购订单审核', 'URL', '/purchase/purorder/purorder_update**');
INSERT INTO `resource` VALUES ('348', '', '备品备料添加页面', 'URL', '/purchase/spare/spare_addInput**');
INSERT INTO `resource` VALUES ('349', '', '备品备料添加', 'URL', '/purchase/spare/spare_add**');
INSERT INTO `resource` VALUES ('350', '', '备品备料编辑页面', 'URL', '/purchase/spare/spare_editInput**');
INSERT INTO `resource` VALUES ('351', '', '备品备料编辑', 'URL', '/purchase/spare/spare_update**');
INSERT INTO `resource` VALUES ('352', '', '查看配套发料表', 'URL', '/produce/produceschdul/produceschdul_showsupsendm**');
INSERT INTO `resource` VALUES ('353', '', '物料变异增加页面', 'URL', '/warehouse/variation/variation_addInput**');
INSERT INTO `resource` VALUES ('354', '', '物料变异增加', 'URL', '/warehouse/variation/variation_add**');
INSERT INTO `resource` VALUES ('355', '', '物料变异审核页面', 'URL', '/warehouse/variation/variation_audit**');
INSERT INTO `resource` VALUES ('356', '', '物料变异审核', 'URL', '/warehouse/variation/variation_update**');
INSERT INTO `resource` VALUES ('357', '', '生产部添加改机', 'URL', '/produce/produceschdul/produceschdul_addInput**');
INSERT INTO `resource` VALUES ('358', '', '生产部删除改机', 'URL', '/produce/produceschdul/produceschdul_del**');
INSERT INTO `resource` VALUES ('359', '', '生产部编辑改机', 'URL', '/produce/produceschdul/produceschdul_editInput**');
INSERT INTO `resource` VALUES ('360', '', '编辑改机提交', 'URL', '/produce/produceschdul/produceschdul_update**');
INSERT INTO `resource` VALUES ('361', '', '车间审核', 'URL', '/produce/produceschdul/produceschdul_examine_wait**');
INSERT INTO `resource` VALUES ('362', '', '车间检验审核', 'URL', '/produce/produceschdul/produceschdul_examine_change**');
INSERT INTO `resource` VALUES ('363', '', '显示改机', 'URL', '/roduce/produceschdul/produceschdul_show**');
INSERT INTO `resource` VALUES ('364', '', '添加改机提交', 'URL', '/produce/produceschdul/produceschdul_add**');
INSERT INTO `resource` VALUES ('365', '', '车间审核提交', 'URL', '/produce/produceschdul/produceschdul_examineCheck**');
INSERT INTO `resource` VALUES ('366', '', '车间检验审核', 'URL', '/produce/produceschdul/produceschdul_excheck**');
INSERT INTO `resource` VALUES ('367', '', '仓库审核', 'URL', '/produce/produceschdul/produceschdul_examine_sent**');
INSERT INTO `resource` VALUES ('368', '', '仓库审核提交', 'URL', '/produce/produceschdul/produceschdul_whcheck**');
INSERT INTO `resource` VALUES ('369', '', '仓库删除已审核改机', 'URL', '/produce/produceschdul/produceschdul_delware**');
INSERT INTO `resource` VALUES ('370', '', '显示配套发料表', 'URL', '/produce/produceschdul/produceschdul_showsupsendm**');
INSERT INTO `resource` VALUES ('371', '', '维修品添加页面', 'URL', '/produce/productionrepair/add_repairproduction_add**');
INSERT INTO `resource` VALUES ('372', '', '维修品编辑页面', 'URL', '/produce/productionrepair/edit_repairproduction_editInput**');
INSERT INTO `resource` VALUES ('373', '', '维修品删除', 'URL', '/produce/productionrepair/repairproductionlist_del**');
INSERT INTO `resource` VALUES ('374', '', '维修品添加', 'URL', '/produce/repairproduction/repairproduction_add**');
INSERT INTO `resource` VALUES ('375', '', '维修品编辑', 'URL', '/produce/repairproduction/repairproduction_update**');
INSERT INTO `resource` VALUES ('376', '402', '生产管理-订单管理-打印机审核', 'URL', '/produce/preparation/preparation_examineListInsider');
INSERT INTO `resource` VALUES ('378', '', '生产部订单品工部审核（输入） ', 'URL', '/produce/preparation/preparation_pingongExamineInputInside**');
INSERT INTO `resource` VALUES ('379', '', '添加订单管理 ', 'URL', '/produce/preparation/preparation_add**');
INSERT INTO `resource` VALUES ('380', '', '生产部订单生产部审核（输入） ', 'URL', '/produce/preparation/preparation_produceExamineInputInside**');
INSERT INTO `resource` VALUES ('381', '', '编辑生产部订单（输入） ', 'URL', '/produce/preparation/preparation_editInput**');
INSERT INTO `resource` VALUES ('382', '', '编辑生产部订单 ', 'URL', '/produce/preparation/preparation_edit**');
INSERT INTO `resource` VALUES ('383', '', '删除生产部订单 ', 'URL', '/produce/preparation/preparation_del**');
INSERT INTO `resource` VALUES ('384', '', '生产部订单品工部审核 ', 'URL', '/produce/preparation/preparation_pingongExamineInside**');
INSERT INTO `resource` VALUES ('385', '', '生产部订单生产部审核 ', 'URL', '/produce/preparation/preparation_produceExamineInside**');
INSERT INTO `resource` VALUES ('386', '', '显示生产部订单 ', 'URL', '/produce/preparation/preparation_show**');
INSERT INTO `resource` VALUES ('388', '', '业务部订单领导审核（输入） ', 'URL', '/produce/preparation/preparation_examineInput**');
INSERT INTO `resource` VALUES ('389', '', '业务部订单品工部审核（输入） ', 'URL', '/produce/preparation/preparation_pingongExamineInput**');
INSERT INTO `resource` VALUES ('390', '', '业务部订单生产部审核（输入） ', 'URL', '/produce/preparation/preparation_produceExamineInput**');
INSERT INTO `resource` VALUES ('391', '', '订单履行情况登记 ', 'URL', '/produce/preparation/preparation_fulfillInput**');
INSERT INTO `resource` VALUES ('392', '', '订单履行情况提交 ', 'URL', '/produce/preparation/preparation_fulfill**');
INSERT INTO `resource` VALUES ('393', '', '履行情况确认登记 ', 'URL', '/produce/preparation/preparation_confimationInput**');
INSERT INTO `resource` VALUES ('394', '', '打印机配套发料表列表 ', 'URL', '/warehouse/supsendm3/supsendm3_list**');
INSERT INTO `resource` VALUES ('395', '', '打印机配套发料表列表_要货单列表', 'URL', '/warehouse/supsendm3/supsendm3_preparationList**');
INSERT INTO `resource` VALUES ('396', '', '打印机配套发料表列表_选择要货单 ', 'URL', '/warehouse/supsendm3/supsendm3_selectedPreparation**');
INSERT INTO `resource` VALUES ('397', '', '打印机配套发料表添加页', 'URL', '/warehouse/supsendm3/supsendm3_addInput**');
INSERT INTO `resource` VALUES ('398', '', '添加打印机配套发料表', 'URL', 'warehouse/supsendm3/supsendm3_add**');
INSERT INTO `resource` VALUES ('399', '', '打印机配套发料表补发页 ', 'URL', '/warehouse/supsendm3/supsendm3_addExtraInput**');
INSERT INTO `resource` VALUES ('400', '', '打印机配套发料表车间确认页 ', 'URL', '/warehouse/supsendm3/supsendm3_confirmInput**');
INSERT INTO `resource` VALUES ('401', '', '打印机配套发料表车间确认 ', 'URL', '/warehouse/supsendm3/supsendm3_confirm**');
INSERT INTO `resource` VALUES ('402', '', '打印机配套发料表修改页', 'URL', '/warehouse/supsendm3/supsendm3_editInput**');
INSERT INTO `resource` VALUES ('403', '', '打印机配套发料表确认修改 ', 'URL', '/warehouse/supsendm3/supsendm3_update**');
INSERT INTO `resource` VALUES ('404', '', '删除打印机配套发料表 ', 'URL', '/warehouse/supsendm3/supsendm3_del**');
INSERT INTO `role` VALUES ('1', '管理员', 'ROLE_ADMIN');
INSERT INTO `role` VALUES ('2', '普通用户', 'ROLE_BASE');
INSERT INTO `role` VALUES ('3', '仓管员', 'ROLE_WAREHOUSE');
INSERT INTO `role` VALUES ('4', '采购人', 'ROLE_PURCHASE');
INSERT INTO `role` VALUES ('5', '检验员', 'ROLE_EXAMINE');
INSERT INTO `role` VALUES ('6', '一车间', 'ROLE_WORKSHOPONE');
INSERT INTO `role` VALUES ('7', '三车间', 'ROLE_WORKSHOPTHREE');
INSERT INTO `role` VALUES ('8', '五车间', 'ROLE_WORKSHOPFIVE');
INSERT INTO `role` VALUES ('9', '生产部领导', 'ROLE_PRODUCTIONLEADER');
INSERT INTO `role` VALUES ('10', '企管部', 'ROLE_PERSENNEL');
INSERT INTO `role` VALUES ('11', '生产部', 'ROLE_PRODUCTION');
INSERT INTO `role` VALUES ('12', '业务部', 'ROLE_BUSINESS');
INSERT INTO `role` VALUES ('13', '业务部领导', 'ROLE_BUSINESSLEADER');
INSERT INTO `role` VALUES ('14', '品工部', 'ROLE_TESTDEPARTMENT');
INSERT INTO `role` VALUES ('15', '品工部领导', 'ROLE_TESTDEPARTMENTLEADER');
INSERT INTO `role_resource` VALUES ('1', '1');
INSERT INTO `role_resource` VALUES ('1', '2');
INSERT INTO `role_resource` VALUES ('1', '3');
INSERT INTO `role_resource` VALUES ('1', '4');
INSERT INTO `role_resource` VALUES ('1', '5');
INSERT INTO `role_resource` VALUES ('1', '6');
INSERT INTO `role_resource` VALUES ('1', '7');
INSERT INTO `role_resource` VALUES ('1', '8');
INSERT INTO `role_resource` VALUES ('1', '9');
INSERT INTO `role_resource` VALUES ('1', '10');
INSERT INTO `role_resource` VALUES ('1', '11');
INSERT INTO `role_resource` VALUES ('1', '12');
INSERT INTO `role_resource` VALUES ('1', '13');
INSERT INTO `role_resource` VALUES ('1', '14');
INSERT INTO `role_resource` VALUES ('1', '15');
INSERT INTO `role_resource` VALUES ('1', '16');
INSERT INTO `role_resource` VALUES ('1', '17');
INSERT INTO `role_resource` VALUES ('1', '18');
INSERT INTO `role_resource` VALUES ('1', '19');
INSERT INTO `role_resource` VALUES ('1', '20');
INSERT INTO `role_resource` VALUES ('1', '21');
INSERT INTO `role_resource` VALUES ('1', '22');
INSERT INTO `role_resource` VALUES ('1', '23');
INSERT INTO `role_resource` VALUES ('1', '24');
INSERT INTO `role_resource` VALUES ('1', '25');
INSERT INTO `role_resource` VALUES ('1', '26');
INSERT INTO `role_resource` VALUES ('1', '27');
INSERT INTO `role_resource` VALUES ('1', '28');
INSERT INTO `role_resource` VALUES ('1', '29');
INSERT INTO `role_resource` VALUES ('1', '30');
INSERT INTO `role_resource` VALUES ('1', '31');
INSERT INTO `role_resource` VALUES ('1', '32');
INSERT INTO `role_resource` VALUES ('1', '33');
INSERT INTO `role_resource` VALUES ('1', '34');
INSERT INTO `role_resource` VALUES ('1', '35');
INSERT INTO `role_resource` VALUES ('1', '36');
INSERT INTO `role_resource` VALUES ('1', '37');
INSERT INTO `role_resource` VALUES ('1', '38');
INSERT INTO `role_resource` VALUES ('1', '39');
INSERT INTO `role_resource` VALUES ('1', '40');
INSERT INTO `role_resource` VALUES ('1', '41');
INSERT INTO `role_resource` VALUES ('1', '42');
INSERT INTO `role_resource` VALUES ('1', '43');
INSERT INTO `role_resource` VALUES ('1', '44');
INSERT INTO `role_resource` VALUES ('1', '45');
INSERT INTO `role_resource` VALUES ('1', '46');
INSERT INTO `role_resource` VALUES ('1', '47');
INSERT INTO `role_resource` VALUES ('1', '48');
INSERT INTO `role_resource` VALUES ('1', '49');
INSERT INTO `role_resource` VALUES ('1', '50');
INSERT INTO `role_resource` VALUES ('1', '51');
INSERT INTO `role_resource` VALUES ('1', '52');
INSERT INTO `role_resource` VALUES ('1', '53');
INSERT INTO `role_resource` VALUES ('1', '54');
INSERT INTO `role_resource` VALUES ('1', '55');
INSERT INTO `role_resource` VALUES ('1', '56');
INSERT INTO `role_resource` VALUES ('1', '57');
INSERT INTO `role_resource` VALUES ('1', '58');
INSERT INTO `role_resource` VALUES ('1', '59');
INSERT INTO `role_resource` VALUES ('1', '60');
INSERT INTO `role_resource` VALUES ('1', '61');
INSERT INTO `role_resource` VALUES ('1', '62');
INSERT INTO `role_resource` VALUES ('1', '63');
INSERT INTO `role_resource` VALUES ('1', '64');
INSERT INTO `role_resource` VALUES ('1', '65');
INSERT INTO `role_resource` VALUES ('1', '66');
INSERT INTO `role_resource` VALUES ('1', '67');
INSERT INTO `role_resource` VALUES ('1', '68');
INSERT INTO `role_resource` VALUES ('1', '69');
INSERT INTO `role_resource` VALUES ('1', '70');
INSERT INTO `role_resource` VALUES ('1', '71');
INSERT INTO `role_resource` VALUES ('1', '72');
INSERT INTO `role_resource` VALUES ('1', '73');
INSERT INTO `role_resource` VALUES ('1', '74');
INSERT INTO `role_resource` VALUES ('1', '75');
INSERT INTO `role_resource` VALUES ('1', '76');
INSERT INTO `role_resource` VALUES ('1', '77');
INSERT INTO `role_resource` VALUES ('1', '78');
INSERT INTO `role_resource` VALUES ('1', '80');
INSERT INTO `role_resource` VALUES ('1', '81');
INSERT INTO `role_resource` VALUES ('1', '82');
INSERT INTO `role_resource` VALUES ('1', '83');
INSERT INTO `role_resource` VALUES ('1', '84');
INSERT INTO `role_resource` VALUES ('1', '85');
INSERT INTO `role_resource` VALUES ('1', '86');
INSERT INTO `role_resource` VALUES ('1', '87');
INSERT INTO `role_resource` VALUES ('1', '88');
INSERT INTO `role_resource` VALUES ('1', '89');
INSERT INTO `role_resource` VALUES ('1', '90');
INSERT INTO `role_resource` VALUES ('1', '91');
INSERT INTO `role_resource` VALUES ('1', '92');
INSERT INTO `role_resource` VALUES ('1', '93');
INSERT INTO `role_resource` VALUES ('1', '94');
INSERT INTO `role_resource` VALUES ('1', '95');
INSERT INTO `role_resource` VALUES ('1', '96');
INSERT INTO `role_resource` VALUES ('1', '97');
INSERT INTO `role_resource` VALUES ('1', '98');
INSERT INTO `role_resource` VALUES ('1', '99');
INSERT INTO `role_resource` VALUES ('1', '100');
INSERT INTO `role_resource` VALUES ('1', '101');
INSERT INTO `role_resource` VALUES ('1', '102');
INSERT INTO `role_resource` VALUES ('1', '103');
INSERT INTO `role_resource` VALUES ('1', '104');
INSERT INTO `role_resource` VALUES ('1', '105');
INSERT INTO `role_resource` VALUES ('1', '106');
INSERT INTO `role_resource` VALUES ('1', '107');
INSERT INTO `role_resource` VALUES ('1', '108');
INSERT INTO `role_resource` VALUES ('1', '109');
INSERT INTO `role_resource` VALUES ('1', '110');
INSERT INTO `role_resource` VALUES ('1', '111');
INSERT INTO `role_resource` VALUES ('1', '112');
INSERT INTO `role_resource` VALUES ('1', '113');
INSERT INTO `role_resource` VALUES ('1', '114');
INSERT INTO `role_resource` VALUES ('1', '115');
INSERT INTO `role_resource` VALUES ('1', '116');
INSERT INTO `role_resource` VALUES ('1', '117');
INSERT INTO `role_resource` VALUES ('1', '118');
INSERT INTO `role_resource` VALUES ('1', '119');
INSERT INTO `role_resource` VALUES ('1', '120');
INSERT INTO `role_resource` VALUES ('1', '121');
INSERT INTO `role_resource` VALUES ('1', '123');
INSERT INTO `role_resource` VALUES ('1', '124');
INSERT INTO `role_resource` VALUES ('1', '125');
INSERT INTO `role_resource` VALUES ('1', '126');
INSERT INTO `role_resource` VALUES ('1', '127');
INSERT INTO `role_resource` VALUES ('1', '128');
INSERT INTO `role_resource` VALUES ('1', '129');
INSERT INTO `role_resource` VALUES ('1', '130');
INSERT INTO `role_resource` VALUES ('1', '131');
INSERT INTO `role_resource` VALUES ('1', '132');
INSERT INTO `role_resource` VALUES ('1', '133');
INSERT INTO `role_resource` VALUES ('1', '134');
INSERT INTO `role_resource` VALUES ('1', '135');
INSERT INTO `role_resource` VALUES ('1', '136');
INSERT INTO `role_resource` VALUES ('1', '137');
INSERT INTO `role_resource` VALUES ('1', '138');
INSERT INTO `role_resource` VALUES ('1', '139');
INSERT INTO `role_resource` VALUES ('1', '140');
INSERT INTO `role_resource` VALUES ('1', '141');
INSERT INTO `role_resource` VALUES ('1', '142');
INSERT INTO `role_resource` VALUES ('1', '143');
INSERT INTO `role_resource` VALUES ('1', '144');
INSERT INTO `role_resource` VALUES ('1', '145');
INSERT INTO `role_resource` VALUES ('1', '146');
INSERT INTO `role_resource` VALUES ('1', '147');
INSERT INTO `role_resource` VALUES ('1', '148');
INSERT INTO `role_resource` VALUES ('1', '149');
INSERT INTO `role_resource` VALUES ('1', '150');
INSERT INTO `role_resource` VALUES ('1', '151');
INSERT INTO `role_resource` VALUES ('1', '152');
INSERT INTO `role_resource` VALUES ('1', '153');
INSERT INTO `role_resource` VALUES ('1', '154');
INSERT INTO `role_resource` VALUES ('1', '155');
INSERT INTO `role_resource` VALUES ('1', '156');
INSERT INTO `role_resource` VALUES ('1', '157');
INSERT INTO `role_resource` VALUES ('1', '158');
INSERT INTO `role_resource` VALUES ('1', '159');
INSERT INTO `role_resource` VALUES ('1', '160');
INSERT INTO `role_resource` VALUES ('1', '161');
INSERT INTO `role_resource` VALUES ('1', '162');
INSERT INTO `role_resource` VALUES ('1', '163');
INSERT INTO `role_resource` VALUES ('1', '164');
INSERT INTO `role_resource` VALUES ('1', '165');
INSERT INTO `role_resource` VALUES ('1', '166');
INSERT INTO `role_resource` VALUES ('1', '167');
INSERT INTO `role_resource` VALUES ('1', '168');
INSERT INTO `role_resource` VALUES ('1', '169');
INSERT INTO `role_resource` VALUES ('1', '170');
INSERT INTO `role_resource` VALUES ('1', '171');
INSERT INTO `role_resource` VALUES ('1', '172');
INSERT INTO `role_resource` VALUES ('1', '173');
INSERT INTO `role_resource` VALUES ('1', '174');
INSERT INTO `role_resource` VALUES ('1', '175');
INSERT INTO `role_resource` VALUES ('1', '176');
INSERT INTO `role_resource` VALUES ('1', '177');
INSERT INTO `role_resource` VALUES ('1', '178');
INSERT INTO `role_resource` VALUES ('1', '179');
INSERT INTO `role_resource` VALUES ('1', '180');
INSERT INTO `role_resource` VALUES ('1', '181');
INSERT INTO `role_resource` VALUES ('1', '182');
INSERT INTO `role_resource` VALUES ('1', '183');
INSERT INTO `role_resource` VALUES ('1', '184');
INSERT INTO `role_resource` VALUES ('1', '185');
INSERT INTO `role_resource` VALUES ('1', '186');
INSERT INTO `role_resource` VALUES ('1', '187');
INSERT INTO `role_resource` VALUES ('1', '188');
INSERT INTO `role_resource` VALUES ('1', '189');
INSERT INTO `role_resource` VALUES ('1', '190');
INSERT INTO `role_resource` VALUES ('1', '191');
INSERT INTO `role_resource` VALUES ('1', '192');
INSERT INTO `role_resource` VALUES ('1', '193');
INSERT INTO `role_resource` VALUES ('1', '194');
INSERT INTO `role_resource` VALUES ('1', '195');
INSERT INTO `role_resource` VALUES ('1', '196');
INSERT INTO `role_resource` VALUES ('1', '197');
INSERT INTO `role_resource` VALUES ('1', '198');
INSERT INTO `role_resource` VALUES ('1', '199');
INSERT INTO `role_resource` VALUES ('1', '200');
INSERT INTO `role_resource` VALUES ('1', '201');
INSERT INTO `role_resource` VALUES ('1', '202');
INSERT INTO `role_resource` VALUES ('1', '203');
INSERT INTO `role_resource` VALUES ('1', '204');
INSERT INTO `role_resource` VALUES ('1', '205');
INSERT INTO `role_resource` VALUES ('1', '206');
INSERT INTO `role_resource` VALUES ('1', '214');
INSERT INTO `role_resource` VALUES ('1', '215');
INSERT INTO `role_resource` VALUES ('1', '216');
INSERT INTO `role_resource` VALUES ('1', '217');
INSERT INTO `role_resource` VALUES ('1', '218');
INSERT INTO `role_resource` VALUES ('1', '219');
INSERT INTO `role_resource` VALUES ('1', '220');
INSERT INTO `role_resource` VALUES ('1', '221');
INSERT INTO `role_resource` VALUES ('1', '222');
INSERT INTO `role_resource` VALUES ('1', '223');
INSERT INTO `role_resource` VALUES ('1', '224');
INSERT INTO `role_resource` VALUES ('1', '225');
INSERT INTO `role_resource` VALUES ('1', '227');
INSERT INTO `role_resource` VALUES ('1', '228');
INSERT INTO `role_resource` VALUES ('1', '229');
INSERT INTO `role_resource` VALUES ('1', '230');
INSERT INTO `role_resource` VALUES ('1', '231');
INSERT INTO `role_resource` VALUES ('1', '232');
INSERT INTO `role_resource` VALUES ('1', '233');
INSERT INTO `role_resource` VALUES ('1', '234');
INSERT INTO `role_resource` VALUES ('1', '235');
INSERT INTO `role_resource` VALUES ('1', '236');
INSERT INTO `role_resource` VALUES ('1', '237');
INSERT INTO `role_resource` VALUES ('1', '238');
INSERT INTO `role_resource` VALUES ('1', '239');
INSERT INTO `role_resource` VALUES ('1', '240');
INSERT INTO `role_resource` VALUES ('1', '241');
INSERT INTO `role_resource` VALUES ('1', '242');
INSERT INTO `role_resource` VALUES ('1', '243');
INSERT INTO `role_resource` VALUES ('1', '244');
INSERT INTO `role_resource` VALUES ('1', '245');
INSERT INTO `role_resource` VALUES ('1', '246');
INSERT INTO `role_resource` VALUES ('1', '247');
INSERT INTO `role_resource` VALUES ('1', '248');
INSERT INTO `role_resource` VALUES ('1', '249');
INSERT INTO `role_resource` VALUES ('1', '250');
INSERT INTO `role_resource` VALUES ('1', '251');
INSERT INTO `role_resource` VALUES ('1', '252');
INSERT INTO `role_resource` VALUES ('1', '253');
INSERT INTO `role_resource` VALUES ('1', '254');
INSERT INTO `role_resource` VALUES ('1', '255');
INSERT INTO `role_resource` VALUES ('1', '256');
INSERT INTO `role_resource` VALUES ('1', '257');
INSERT INTO `role_resource` VALUES ('1', '258');
INSERT INTO `role_resource` VALUES ('1', '259');
INSERT INTO `role_resource` VALUES ('1', '260');
INSERT INTO `role_resource` VALUES ('1', '261');
INSERT INTO `role_resource` VALUES ('1', '262');
INSERT INTO `role_resource` VALUES ('1', '263');
INSERT INTO `role_resource` VALUES ('1', '264');
INSERT INTO `role_resource` VALUES ('1', '265');
INSERT INTO `role_resource` VALUES ('1', '266');
INSERT INTO `role_resource` VALUES ('1', '267');
INSERT INTO `role_resource` VALUES ('1', '268');
INSERT INTO `role_resource` VALUES ('1', '269');
INSERT INTO `role_resource` VALUES ('1', '270');
INSERT INTO `role_resource` VALUES ('1', '271');
INSERT INTO `role_resource` VALUES ('1', '272');
INSERT INTO `role_resource` VALUES ('1', '273');
INSERT INTO `role_resource` VALUES ('1', '274');
INSERT INTO `role_resource` VALUES ('1', '275');
INSERT INTO `role_resource` VALUES ('1', '276');
INSERT INTO `role_resource` VALUES ('1', '277');
INSERT INTO `role_resource` VALUES ('1', '278');
INSERT INTO `role_resource` VALUES ('1', '279');
INSERT INTO `role_resource` VALUES ('1', '280');
INSERT INTO `role_resource` VALUES ('1', '281');
INSERT INTO `role_resource` VALUES ('1', '282');
INSERT INTO `role_resource` VALUES ('1', '283');
INSERT INTO `role_resource` VALUES ('1', '284');
INSERT INTO `role_resource` VALUES ('1', '285');
INSERT INTO `role_resource` VALUES ('1', '286');
INSERT INTO `role_resource` VALUES ('1', '289');
INSERT INTO `role_resource` VALUES ('1', '290');
INSERT INTO `role_resource` VALUES ('1', '291');
INSERT INTO `role_resource` VALUES ('1', '292');
INSERT INTO `role_resource` VALUES ('1', '293');
INSERT INTO `role_resource` VALUES ('1', '294');
INSERT INTO `role_resource` VALUES ('1', '295');
INSERT INTO `role_resource` VALUES ('1', '296');
INSERT INTO `role_resource` VALUES ('1', '297');
INSERT INTO `role_resource` VALUES ('1', '298');
INSERT INTO `role_resource` VALUES ('1', '299');
INSERT INTO `role_resource` VALUES ('1', '300');
INSERT INTO `role_resource` VALUES ('1', '301');
INSERT INTO `role_resource` VALUES ('1', '302');
INSERT INTO `role_resource` VALUES ('1', '303');
INSERT INTO `role_resource` VALUES ('1', '304');
INSERT INTO `role_resource` VALUES ('1', '305');
INSERT INTO `role_resource` VALUES ('1', '306');
INSERT INTO `role_resource` VALUES ('1', '307');
INSERT INTO `role_resource` VALUES ('1', '308');
INSERT INTO `role_resource` VALUES ('1', '309');
INSERT INTO `role_resource` VALUES ('1', '310');
INSERT INTO `role_resource` VALUES ('1', '311');
INSERT INTO `role_resource` VALUES ('1', '312');
INSERT INTO `role_resource` VALUES ('1', '313');
INSERT INTO `role_resource` VALUES ('1', '314');
INSERT INTO `role_resource` VALUES ('1', '315');
INSERT INTO `role_resource` VALUES ('1', '316');
INSERT INTO `role_resource` VALUES ('1', '317');
INSERT INTO `role_resource` VALUES ('1', '318');
INSERT INTO `role_resource` VALUES ('1', '319');
INSERT INTO `role_resource` VALUES ('1', '320');
INSERT INTO `role_resource` VALUES ('1', '321');
INSERT INTO `role_resource` VALUES ('1', '322');
INSERT INTO `role_resource` VALUES ('1', '323');
INSERT INTO `role_resource` VALUES ('1', '324');
INSERT INTO `role_resource` VALUES ('1', '325');
INSERT INTO `role_resource` VALUES ('1', '326');
INSERT INTO `role_resource` VALUES ('1', '327');
INSERT INTO `role_resource` VALUES ('1', '328');
INSERT INTO `role_resource` VALUES ('1', '329');
INSERT INTO `role_resource` VALUES ('1', '330');
INSERT INTO `role_resource` VALUES ('1', '331');
INSERT INTO `role_resource` VALUES ('1', '332');
INSERT INTO `role_resource` VALUES ('1', '333');
INSERT INTO `role_resource` VALUES ('1', '334');
INSERT INTO `role_resource` VALUES ('1', '335');
INSERT INTO `role_resource` VALUES ('1', '336');
INSERT INTO `role_resource` VALUES ('1', '337');
INSERT INTO `role_resource` VALUES ('1', '338');
INSERT INTO `role_resource` VALUES ('1', '339');
INSERT INTO `role_resource` VALUES ('1', '340');
INSERT INTO `role_resource` VALUES ('1', '341');
INSERT INTO `role_resource` VALUES ('1', '342');
INSERT INTO `role_resource` VALUES ('1', '343');
INSERT INTO `role_resource` VALUES ('1', '344');
INSERT INTO `role_resource` VALUES ('1', '345');
INSERT INTO `role_resource` VALUES ('1', '346');
INSERT INTO `role_resource` VALUES ('1', '347');
INSERT INTO `role_resource` VALUES ('1', '348');
INSERT INTO `role_resource` VALUES ('1', '349');
INSERT INTO `role_resource` VALUES ('1', '350');
INSERT INTO `role_resource` VALUES ('1', '351');
INSERT INTO `role_resource` VALUES ('1', '352');
INSERT INTO `role_resource` VALUES ('1', '353');
INSERT INTO `role_resource` VALUES ('1', '354');
INSERT INTO `role_resource` VALUES ('1', '355');
INSERT INTO `role_resource` VALUES ('1', '356');
INSERT INTO `role_resource` VALUES ('1', '376');
INSERT INTO `role_resource` VALUES ('2', '1');
INSERT INTO `role_resource` VALUES ('2', '2');
INSERT INTO `role_resource` VALUES ('2', '3');
INSERT INTO `role_resource` VALUES ('2', '4');
INSERT INTO `role_resource` VALUES ('2', '7');
INSERT INTO `role_resource` VALUES ('2', '8');
INSERT INTO `role_resource` VALUES ('2', '9');
INSERT INTO `role_resource` VALUES ('2', '10');
INSERT INTO `role_resource` VALUES ('2', '25');
INSERT INTO `role_resource` VALUES ('2', '26');
INSERT INTO `role_resource` VALUES ('2', '27');
INSERT INTO `role_resource` VALUES ('2', '28');
INSERT INTO `role_resource` VALUES ('2', '39');
INSERT INTO `role_resource` VALUES ('2', '40');
INSERT INTO `role_resource` VALUES ('2', '43');
INSERT INTO `role_resource` VALUES ('2', '44');
INSERT INTO `role_resource` VALUES ('2', '45');
INSERT INTO `role_resource` VALUES ('2', '60');
INSERT INTO `role_resource` VALUES ('2', '61');
INSERT INTO `role_resource` VALUES ('2', '72');
INSERT INTO `role_resource` VALUES ('2', '73');
INSERT INTO `role_resource` VALUES ('2', '119');
INSERT INTO `role_resource` VALUES ('2', '120');
INSERT INTO `role_resource` VALUES ('2', '121');
INSERT INTO `role_resource` VALUES ('2', '123');
INSERT INTO `role_resource` VALUES ('2', '286');
INSERT INTO `role_resource` VALUES ('3', '13');
INSERT INTO `role_resource` VALUES ('3', '14');
INSERT INTO `role_resource` VALUES ('3', '15');
INSERT INTO `role_resource` VALUES ('3', '16');
INSERT INTO `role_resource` VALUES ('3', '17');
INSERT INTO `role_resource` VALUES ('3', '18');
INSERT INTO `role_resource` VALUES ('3', '19');
INSERT INTO `role_resource` VALUES ('3', '20');
INSERT INTO `role_resource` VALUES ('3', '21');
INSERT INTO `role_resource` VALUES ('3', '22');
INSERT INTO `role_resource` VALUES ('3', '23');
INSERT INTO `role_resource` VALUES ('3', '24');
INSERT INTO `role_resource` VALUES ('3', '25');
INSERT INTO `role_resource` VALUES ('3', '26');
INSERT INTO `role_resource` VALUES ('3', '27');
INSERT INTO `role_resource` VALUES ('3', '28');
INSERT INTO `role_resource` VALUES ('3', '29');
INSERT INTO `role_resource` VALUES ('3', '30');
INSERT INTO `role_resource` VALUES ('3', '81');
INSERT INTO `role_resource` VALUES ('3', '82');
INSERT INTO `role_resource` VALUES ('3', '87');
INSERT INTO `role_resource` VALUES ('3', '92');
INSERT INTO `role_resource` VALUES ('3', '99');
INSERT INTO `role_resource` VALUES ('3', '104');
INSERT INTO `role_resource` VALUES ('3', '106');
INSERT INTO `role_resource` VALUES ('3', '109');
INSERT INTO `role_resource` VALUES ('3', '111');
INSERT INTO `role_resource` VALUES ('3', '113');
INSERT INTO `role_resource` VALUES ('3', '115');
INSERT INTO `role_resource` VALUES ('3', '117');
INSERT INTO `role_resource` VALUES ('3', '119');
INSERT INTO `role_resource` VALUES ('3', '120');
INSERT INTO `role_resource` VALUES ('3', '121');
INSERT INTO `role_resource` VALUES ('3', '123');
INSERT INTO `role_resource` VALUES ('3', '124');
INSERT INTO `role_resource` VALUES ('3', '125');
INSERT INTO `role_resource` VALUES ('3', '142');
INSERT INTO `role_resource` VALUES ('3', '143');
INSERT INTO `role_resource` VALUES ('3', '144');
INSERT INTO `role_resource` VALUES ('3', '145');
INSERT INTO `role_resource` VALUES ('3', '146');
INSERT INTO `role_resource` VALUES ('3', '147');
INSERT INTO `role_resource` VALUES ('3', '148');
INSERT INTO `role_resource` VALUES ('3', '149');
INSERT INTO `role_resource` VALUES ('3', '163');
INSERT INTO `role_resource` VALUES ('3', '164');
INSERT INTO `role_resource` VALUES ('3', '171');
INSERT INTO `role_resource` VALUES ('3', '175');
INSERT INTO `role_resource` VALUES ('3', '183');
INSERT INTO `role_resource` VALUES ('3', '184');
INSERT INTO `role_resource` VALUES ('3', '187');
INSERT INTO `role_resource` VALUES ('3', '190');
INSERT INTO `role_resource` VALUES ('3', '363');
INSERT INTO `role_resource` VALUES ('3', '367');
INSERT INTO `role_resource` VALUES ('3', '368');
INSERT INTO `role_resource` VALUES ('3', '369');
INSERT INTO `role_resource` VALUES ('4', '62');
INSERT INTO `role_resource` VALUES ('4', '63');
INSERT INTO `role_resource` VALUES ('4', '64');
INSERT INTO `role_resource` VALUES ('4', '65');
INSERT INTO `role_resource` VALUES ('4', '66');
INSERT INTO `role_resource` VALUES ('4', '67');
INSERT INTO `role_resource` VALUES ('4', '68');
INSERT INTO `role_resource` VALUES ('4', '69');
INSERT INTO `role_resource` VALUES ('4', '70');
INSERT INTO `role_resource` VALUES ('4', '71');
INSERT INTO `role_resource` VALUES ('4', '72');
INSERT INTO `role_resource` VALUES ('4', '88');
INSERT INTO `role_resource` VALUES ('4', '90');
INSERT INTO `role_resource` VALUES ('4', '93');
INSERT INTO `role_resource` VALUES ('4', '97');
INSERT INTO `role_resource` VALUES ('4', '102');
INSERT INTO `role_resource` VALUES ('4', '103');
INSERT INTO `role_resource` VALUES ('4', '107');
INSERT INTO `role_resource` VALUES ('4', '108');
INSERT INTO `role_resource` VALUES ('4', '289');
INSERT INTO `role_resource` VALUES ('4', '290');
INSERT INTO `role_resource` VALUES ('4', '291');
INSERT INTO `role_resource` VALUES ('4', '295');
INSERT INTO `role_resource` VALUES ('4', '312');
INSERT INTO `role_resource` VALUES ('4', '313');
INSERT INTO `role_resource` VALUES ('4', '321');
INSERT INTO `role_resource` VALUES ('4', '331');
INSERT INTO `role_resource` VALUES ('4', '332');
INSERT INTO `role_resource` VALUES ('4', '333');
INSERT INTO `role_resource` VALUES ('4', '334');
INSERT INTO `role_resource` VALUES ('4', '335');
INSERT INTO `role_resource` VALUES ('4', '339');
INSERT INTO `role_resource` VALUES ('4', '340');
INSERT INTO `role_resource` VALUES ('4', '341');
INSERT INTO `role_resource` VALUES ('4', '343');
INSERT INTO `role_resource` VALUES ('4', '346');
INSERT INTO `role_resource` VALUES ('4', '348');
INSERT INTO `role_resource` VALUES ('4', '349');
INSERT INTO `role_resource` VALUES ('4', '350');
INSERT INTO `role_resource` VALUES ('4', '351');
INSERT INTO `role_resource` VALUES ('5', '31');
INSERT INTO `role_resource` VALUES ('5', '32');
INSERT INTO `role_resource` VALUES ('5', '33');
INSERT INTO `role_resource` VALUES ('5', '34');
INSERT INTO `role_resource` VALUES ('5', '35');
INSERT INTO `role_resource` VALUES ('5', '36');
INSERT INTO `role_resource` VALUES ('5', '37');
INSERT INTO `role_resource` VALUES ('5', '38');
INSERT INTO `role_resource` VALUES ('5', '39');
INSERT INTO `role_resource` VALUES ('5', '40');
INSERT INTO `role_resource` VALUES ('5', '41');
INSERT INTO `role_resource` VALUES ('5', '42');
INSERT INTO `role_resource` VALUES ('5', '43');
INSERT INTO `role_resource` VALUES ('5', '44');
INSERT INTO `role_resource` VALUES ('5', '45');
INSERT INTO `role_resource` VALUES ('5', '77');
INSERT INTO `role_resource` VALUES ('5', '91');
INSERT INTO `role_resource` VALUES ('5', '105');
INSERT INTO `role_resource` VALUES ('5', '110');
INSERT INTO `role_resource` VALUES ('5', '126');
INSERT INTO `role_resource` VALUES ('5', '128');
INSERT INTO `role_resource` VALUES ('5', '130');
INSERT INTO `role_resource` VALUES ('5', '176');
INSERT INTO `role_resource` VALUES ('5', '177');
INSERT INTO `role_resource` VALUES ('5', '178');
INSERT INTO `role_resource` VALUES ('5', '179');
INSERT INTO `role_resource` VALUES ('5', '180');
INSERT INTO `role_resource` VALUES ('5', '181');
INSERT INTO `role_resource` VALUES ('5', '188');
INSERT INTO `role_resource` VALUES ('5', '189');
INSERT INTO `role_resource` VALUES ('5', '191');
INSERT INTO `role_resource` VALUES ('5', '192');
INSERT INTO `role_resource` VALUES ('5', '193');
INSERT INTO `role_resource` VALUES ('5', '194');
INSERT INTO `role_resource` VALUES ('5', '195');
INSERT INTO `role_resource` VALUES ('5', '196');
INSERT INTO `role_resource` VALUES ('5', '197');
INSERT INTO `role_resource` VALUES ('5', '198');
INSERT INTO `role_resource` VALUES ('5', '199');
INSERT INTO `role_resource` VALUES ('5', '200');
INSERT INTO `role_resource` VALUES ('5', '201');
INSERT INTO `role_resource` VALUES ('5', '202');
INSERT INTO `role_resource` VALUES ('5', '203');
INSERT INTO `role_resource` VALUES ('5', '204');
INSERT INTO `role_resource` VALUES ('5', '205');
INSERT INTO `role_resource` VALUES ('5', '206');
INSERT INTO `role_resource` VALUES ('5', '214');
INSERT INTO `role_resource` VALUES ('5', '216');
INSERT INTO `role_resource` VALUES ('5', '217');
INSERT INTO `role_resource` VALUES ('5', '219');
INSERT INTO `role_resource` VALUES ('5', '220');
INSERT INTO `role_resource` VALUES ('5', '223');
INSERT INTO `role_resource` VALUES ('5', '234');
INSERT INTO `role_resource` VALUES ('5', '235');
INSERT INTO `role_resource` VALUES ('5', '355');
INSERT INTO `role_resource` VALUES ('5', '356');
INSERT INTO `role_resource` VALUES ('5', '362');
INSERT INTO `role_resource` VALUES ('5', '363');
INSERT INTO `role_resource` VALUES ('5', '366');
INSERT INTO `role_resource` VALUES ('6', '1');
INSERT INTO `role_resource` VALUES ('6', '29');
INSERT INTO `role_resource` VALUES ('6', '30');
INSERT INTO `role_resource` VALUES ('6', '51');
INSERT INTO `role_resource` VALUES ('6', '53');
INSERT INTO `role_resource` VALUES ('6', '54');
INSERT INTO `role_resource` VALUES ('6', '55');
INSERT INTO `role_resource` VALUES ('6', '56');
INSERT INTO `role_resource` VALUES ('6', '57');
INSERT INTO `role_resource` VALUES ('6', '58');
INSERT INTO `role_resource` VALUES ('6', '59');
INSERT INTO `role_resource` VALUES ('6', '112');
INSERT INTO `role_resource` VALUES ('6', '116');
INSERT INTO `role_resource` VALUES ('6', '235');
INSERT INTO `role_resource` VALUES ('6', '242');
INSERT INTO `role_resource` VALUES ('6', '265');
INSERT INTO `role_resource` VALUES ('6', '269');
INSERT INTO `role_resource` VALUES ('6', '353');
INSERT INTO `role_resource` VALUES ('6', '354');
INSERT INTO `role_resource` VALUES ('6', '361');
INSERT INTO `role_resource` VALUES ('6', '363');
INSERT INTO `role_resource` VALUES ('6', '365');
INSERT INTO `role_resource` VALUES ('6', '370');
INSERT INTO `role_resource` VALUES ('7', '29');
INSERT INTO `role_resource` VALUES ('7', '30');
INSERT INTO `role_resource` VALUES ('7', '51');
INSERT INTO `role_resource` VALUES ('7', '53');
INSERT INTO `role_resource` VALUES ('7', '54');
INSERT INTO `role_resource` VALUES ('7', '56');
INSERT INTO `role_resource` VALUES ('7', '57');
INSERT INTO `role_resource` VALUES ('7', '58');
INSERT INTO `role_resource` VALUES ('7', '59');
INSERT INTO `role_resource` VALUES ('7', '112');
INSERT INTO `role_resource` VALUES ('7', '116');
INSERT INTO `role_resource` VALUES ('7', '234');
INSERT INTO `role_resource` VALUES ('7', '241');
INSERT INTO `role_resource` VALUES ('7', '265');
INSERT INTO `role_resource` VALUES ('7', '269');
INSERT INTO `role_resource` VALUES ('7', '353');
INSERT INTO `role_resource` VALUES ('7', '354');
INSERT INTO `role_resource` VALUES ('8', '30');
INSERT INTO `role_resource` VALUES ('8', '31');
INSERT INTO `role_resource` VALUES ('8', '51');
INSERT INTO `role_resource` VALUES ('8', '54');
INSERT INTO `role_resource` VALUES ('8', '56');
INSERT INTO `role_resource` VALUES ('8', '57');
INSERT INTO `role_resource` VALUES ('8', '58');
INSERT INTO `role_resource` VALUES ('8', '59');
INSERT INTO `role_resource` VALUES ('8', '61');
INSERT INTO `role_resource` VALUES ('8', '112');
INSERT INTO `role_resource` VALUES ('8', '116');
INSERT INTO `role_resource` VALUES ('8', '234');
INSERT INTO `role_resource` VALUES ('8', '241');
INSERT INTO `role_resource` VALUES ('8', '265');
INSERT INTO `role_resource` VALUES ('8', '269');
INSERT INTO `role_resource` VALUES ('8', '353');
INSERT INTO `role_resource` VALUES ('8', '354');
INSERT INTO `role_resource` VALUES ('8', '370');
INSERT INTO `role_resource` VALUES ('8', '371');
INSERT INTO `role_resource` VALUES ('8', '372');
INSERT INTO `role_resource` VALUES ('8', '373');
INSERT INTO `role_resource` VALUES ('8', '374');
INSERT INTO `role_resource` VALUES ('8', '375');
INSERT INTO `role_resource` VALUES ('9', '15');
INSERT INTO `role_resource` VALUES ('9', '16');
INSERT INTO `role_resource` VALUES ('9', '17');
INSERT INTO `role_resource` VALUES ('9', '18');
INSERT INTO `role_resource` VALUES ('9', '19');
INSERT INTO `role_resource` VALUES ('9', '20');
INSERT INTO `role_resource` VALUES ('9', '21');
INSERT INTO `role_resource` VALUES ('9', '22');
INSERT INTO `role_resource` VALUES ('9', '23');
INSERT INTO `role_resource` VALUES ('9', '24');
INSERT INTO `role_resource` VALUES ('9', '29');
INSERT INTO `role_resource` VALUES ('9', '30');
INSERT INTO `role_resource` VALUES ('9', '47');
INSERT INTO `role_resource` VALUES ('9', '48');
INSERT INTO `role_resource` VALUES ('9', '50');
INSERT INTO `role_resource` VALUES ('9', '51');
INSERT INTO `role_resource` VALUES ('9', '53');
INSERT INTO `role_resource` VALUES ('9', '54');
INSERT INTO `role_resource` VALUES ('9', '55');
INSERT INTO `role_resource` VALUES ('9', '58');
INSERT INTO `role_resource` VALUES ('9', '59');
INSERT INTO `role_resource` VALUES ('9', '62');
INSERT INTO `role_resource` VALUES ('9', '63');
INSERT INTO `role_resource` VALUES ('9', '64');
INSERT INTO `role_resource` VALUES ('9', '65');
INSERT INTO `role_resource` VALUES ('9', '66');
INSERT INTO `role_resource` VALUES ('9', '67');
INSERT INTO `role_resource` VALUES ('9', '95');
INSERT INTO `role_resource` VALUES ('9', '115');
INSERT INTO `role_resource` VALUES ('9', '153');
INSERT INTO `role_resource` VALUES ('9', '158');
INSERT INTO `role_resource` VALUES ('9', '159');
INSERT INTO `role_resource` VALUES ('9', '183');
INSERT INTO `role_resource` VALUES ('9', '225');
INSERT INTO `role_resource` VALUES ('9', '228');
INSERT INTO `role_resource` VALUES ('9', '229');
INSERT INTO `role_resource` VALUES ('9', '232');
INSERT INTO `role_resource` VALUES ('9', '265');
INSERT INTO `role_resource` VALUES ('9', '269');
INSERT INTO `role_resource` VALUES ('9', '292');
INSERT INTO `role_resource` VALUES ('9', '293');
INSERT INTO `role_resource` VALUES ('9', '294');
INSERT INTO `role_resource` VALUES ('9', '295');
INSERT INTO `role_resource` VALUES ('9', '296');
INSERT INTO `role_resource` VALUES ('9', '297');
INSERT INTO `role_resource` VALUES ('9', '298');
INSERT INTO `role_resource` VALUES ('9', '299');
INSERT INTO `role_resource` VALUES ('9', '300');
INSERT INTO `role_resource` VALUES ('9', '301');
INSERT INTO `role_resource` VALUES ('9', '302');
INSERT INTO `role_resource` VALUES ('9', '303');
INSERT INTO `role_resource` VALUES ('9', '309');
INSERT INTO `role_resource` VALUES ('9', '310');
INSERT INTO `role_resource` VALUES ('9', '311');
INSERT INTO `role_resource` VALUES ('9', '312');
INSERT INTO `role_resource` VALUES ('9', '318');
INSERT INTO `role_resource` VALUES ('9', '319');
INSERT INTO `role_resource` VALUES ('9', '320');
INSERT INTO `role_resource` VALUES ('9', '322');
INSERT INTO `role_resource` VALUES ('9', '323');
INSERT INTO `role_resource` VALUES ('9', '335');
INSERT INTO `role_resource` VALUES ('9', '336');
INSERT INTO `role_resource` VALUES ('9', '338');
INSERT INTO `role_resource` VALUES ('9', '344');
INSERT INTO `role_resource` VALUES ('9', '345');
INSERT INTO `role_resource` VALUES ('9', '347');
INSERT INTO `role_resource` VALUES ('9', '357');
INSERT INTO `role_resource` VALUES ('9', '358');
INSERT INTO `role_resource` VALUES ('9', '359');
INSERT INTO `role_resource` VALUES ('9', '360');
INSERT INTO `role_resource` VALUES ('9', '364');
INSERT INTO `role_resource` VALUES ('10', '5');
INSERT INTO `role_resource` VALUES ('10', '6');
INSERT INTO `role_resource` VALUES ('10', '7');
INSERT INTO `role_resource` VALUES ('10', '8');
INSERT INTO `role_resource` VALUES ('10', '9');
INSERT INTO `role_resource` VALUES ('10', '10');
INSERT INTO `role_resource` VALUES ('10', '11');
INSERT INTO `role_resource` VALUES ('10', '12');
INSERT INTO `role_resource` VALUES ('10', '244');
INSERT INTO `role_resource` VALUES ('10', '245');
INSERT INTO `role_resource` VALUES ('10', '246');
INSERT INTO `role_resource` VALUES ('10', '247');
INSERT INTO `role_resource` VALUES ('10', '248');
INSERT INTO `role_resource` VALUES ('10', '249');
INSERT INTO `role_resource` VALUES ('10', '250');
INSERT INTO `role_resource` VALUES ('10', '251');
INSERT INTO `role_resource` VALUES ('10', '252');
INSERT INTO `role_resource` VALUES ('10', '253');
INSERT INTO `role_resource` VALUES ('10', '254');
INSERT INTO `role_resource` VALUES ('10', '255');
INSERT INTO `role_resource` VALUES ('10', '256');
INSERT INTO `role_resource` VALUES ('10', '257');
INSERT INTO `role_resource` VALUES ('10', '258');
INSERT INTO `role_resource` VALUES ('10', '259');
INSERT INTO `role_resource` VALUES ('10', '260');
INSERT INTO `role_resource` VALUES ('10', '261');
INSERT INTO `role_resource` VALUES ('10', '262');
INSERT INTO `role_resource` VALUES ('10', '263');
INSERT INTO `role_resource` VALUES ('10', '264');
INSERT INTO `role_resource` VALUES ('10', '265');
INSERT INTO `role_resource` VALUES ('10', '266');
INSERT INTO `role_resource` VALUES ('10', '267');
INSERT INTO `role_resource` VALUES ('10', '268');
INSERT INTO `role_resource` VALUES ('10', '269');
INSERT INTO `role_resource` VALUES ('10', '270');
INSERT INTO `role_resource` VALUES ('10', '271');
INSERT INTO `role_resource` VALUES ('10', '272');
INSERT INTO `role_resource` VALUES ('10', '273');
INSERT INTO `role_resource` VALUES ('10', '274');
INSERT INTO `role_resource` VALUES ('10', '275');
INSERT INTO `role_resource` VALUES ('10', '276');
INSERT INTO `role_resource` VALUES ('10', '277');
INSERT INTO `role_resource` VALUES ('10', '278');
INSERT INTO `role_resource` VALUES ('10', '279');
INSERT INTO `role_resource` VALUES ('10', '280');
INSERT INTO `role_resource` VALUES ('10', '281');
INSERT INTO `role_resource` VALUES ('10', '282');
INSERT INTO `role_resource` VALUES ('10', '283');
INSERT INTO `role_resource` VALUES ('10', '284');
INSERT INTO `role_resource` VALUES ('10', '285');
INSERT INTO `role_resource` VALUES ('11', '29');
INSERT INTO `role_resource` VALUES ('11', '30');
INSERT INTO `role_resource` VALUES ('11', '46');
INSERT INTO `role_resource` VALUES ('11', '48');
INSERT INTO `role_resource` VALUES ('11', '49');
INSERT INTO `role_resource` VALUES ('11', '51');
INSERT INTO `role_resource` VALUES ('11', '52');
INSERT INTO `role_resource` VALUES ('11', '54');
INSERT INTO `role_resource` VALUES ('11', '55');
INSERT INTO `role_resource` VALUES ('11', '62');
INSERT INTO `role_resource` VALUES ('11', '63');
INSERT INTO `role_resource` VALUES ('11', '64');
INSERT INTO `role_resource` VALUES ('11', '65');
INSERT INTO `role_resource` VALUES ('11', '66');
INSERT INTO `role_resource` VALUES ('11', '80');
INSERT INTO `role_resource` VALUES ('11', '83');
INSERT INTO `role_resource` VALUES ('11', '84');
INSERT INTO `role_resource` VALUES ('11', '86');
INSERT INTO `role_resource` VALUES ('11', '89');
INSERT INTO `role_resource` VALUES ('11', '93');
INSERT INTO `role_resource` VALUES ('11', '94');
INSERT INTO `role_resource` VALUES ('11', '96');
INSERT INTO `role_resource` VALUES ('11', '100');
INSERT INTO `role_resource` VALUES ('11', '155');
INSERT INTO `role_resource` VALUES ('11', '161');
INSERT INTO `role_resource` VALUES ('11', '162');
INSERT INTO `role_resource` VALUES ('11', '163');
INSERT INTO `role_resource` VALUES ('11', '224');
INSERT INTO `role_resource` VALUES ('11', '227');
INSERT INTO `role_resource` VALUES ('11', '229');
INSERT INTO `role_resource` VALUES ('11', '230');
INSERT INTO `role_resource` VALUES ('11', '231');
INSERT INTO `role_resource` VALUES ('11', '233');
INSERT INTO `role_resource` VALUES ('11', '237');
INSERT INTO `role_resource` VALUES ('11', '239');
INSERT INTO `role_resource` VALUES ('11', '240');
INSERT INTO `role_resource` VALUES ('11', '296');
INSERT INTO `role_resource` VALUES ('11', '297');
INSERT INTO `role_resource` VALUES ('11', '299');
INSERT INTO `role_resource` VALUES ('11', '300');
INSERT INTO `role_resource` VALUES ('11', '301');
INSERT INTO `role_resource` VALUES ('11', '308');
INSERT INTO `role_resource` VALUES ('11', '309');
INSERT INTO `role_resource` VALUES ('11', '310');
INSERT INTO `role_resource` VALUES ('11', '312');
INSERT INTO `role_resource` VALUES ('11', '318');
INSERT INTO `role_resource` VALUES ('11', '319');
INSERT INTO `role_resource` VALUES ('11', '357');
INSERT INTO `role_resource` VALUES ('11', '358');
INSERT INTO `role_resource` VALUES ('11', '359');
INSERT INTO `role_resource` VALUES ('11', '360');
INSERT INTO `role_resource` VALUES ('11', '364');
INSERT INTO `role_resource` VALUES ('11', '370');
INSERT INTO `role_resource` VALUES ('11', '371');
INSERT INTO `role_resource` VALUES ('11', '372');
INSERT INTO `role_resource` VALUES ('11', '373');
INSERT INTO `role_resource` VALUES ('11', '374');
INSERT INTO `role_resource` VALUES ('11', '375');
INSERT INTO `role_resource` VALUES ('11', '376');
INSERT INTO `role_resource` VALUES ('11', '379');
INSERT INTO `role_resource` VALUES ('11', '380');
INSERT INTO `role_resource` VALUES ('11', '381');
INSERT INTO `role_resource` VALUES ('11', '382');
INSERT INTO `role_resource` VALUES ('11', '383');
INSERT INTO `role_resource` VALUES ('11', '385');
INSERT INTO `role_resource` VALUES ('12', '62');
INSERT INTO `role_resource` VALUES ('12', '63');
INSERT INTO `role_resource` VALUES ('12', '64');
INSERT INTO `role_resource` VALUES ('12', '65');
INSERT INTO `role_resource` VALUES ('12', '66');
INSERT INTO `role_resource` VALUES ('12', '67');
INSERT INTO `role_resource` VALUES ('12', '68');
INSERT INTO `role_resource` VALUES ('12', '69');
INSERT INTO `role_resource` VALUES ('12', '70');
INSERT INTO `role_resource` VALUES ('12', '71');
INSERT INTO `role_resource` VALUES ('12', '182');
INSERT INTO `role_resource` VALUES ('12', '183');
INSERT INTO `role_resource` VALUES ('12', '184');
INSERT INTO `role_resource` VALUES ('12', '185');
INSERT INTO `role_resource` VALUES ('12', '296');
INSERT INTO `role_resource` VALUES ('12', '297');
INSERT INTO `role_resource` VALUES ('12', '299');
INSERT INTO `role_resource` VALUES ('12', '300');
INSERT INTO `role_resource` VALUES ('12', '301');
INSERT INTO `role_resource` VALUES ('12', '308');
INSERT INTO `role_resource` VALUES ('12', '309');
INSERT INTO `role_resource` VALUES ('12', '310');
INSERT INTO `role_resource` VALUES ('12', '312');
INSERT INTO `role_resource` VALUES ('12', '318');
INSERT INTO `role_resource` VALUES ('12', '319');
INSERT INTO `role_resource` VALUES ('12', '376');
INSERT INTO `role_resource` VALUES ('12', '379');
INSERT INTO `role_resource` VALUES ('12', '381');
INSERT INTO `role_resource` VALUES ('12', '382');
INSERT INTO `role_resource` VALUES ('12', '383');
INSERT INTO `role_resource` VALUES ('12', '386');
INSERT INTO `role_resource` VALUES ('12', '388');
INSERT INTO `role_resource` VALUES ('13', '62');
INSERT INTO `role_resource` VALUES ('13', '63');
INSERT INTO `role_resource` VALUES ('13', '64');
INSERT INTO `role_resource` VALUES ('13', '65');
INSERT INTO `role_resource` VALUES ('13', '66');
INSERT INTO `role_resource` VALUES ('13', '67');
INSERT INTO `role_resource` VALUES ('13', '68');
INSERT INTO `role_resource` VALUES ('13', '69');
INSERT INTO `role_resource` VALUES ('13', '70');
INSERT INTO `role_resource` VALUES ('13', '71');
INSERT INTO `role_resource` VALUES ('13', '72');
INSERT INTO `role_resource` VALUES ('13', '78');
INSERT INTO `role_resource` VALUES ('13', '265');
INSERT INTO `role_resource` VALUES ('13', '269');
INSERT INTO `role_resource` VALUES ('13', '292');
INSERT INTO `role_resource` VALUES ('13', '293');
INSERT INTO `role_resource` VALUES ('13', '294');
INSERT INTO `role_resource` VALUES ('13', '295');
INSERT INTO `role_resource` VALUES ('13', '296');
INSERT INTO `role_resource` VALUES ('13', '297');
INSERT INTO `role_resource` VALUES ('13', '298');
INSERT INTO `role_resource` VALUES ('13', '299');
INSERT INTO `role_resource` VALUES ('13', '300');
INSERT INTO `role_resource` VALUES ('13', '301');
INSERT INTO `role_resource` VALUES ('13', '302');
INSERT INTO `role_resource` VALUES ('13', '303');
INSERT INTO `role_resource` VALUES ('13', '307');
INSERT INTO `role_resource` VALUES ('13', '308');
INSERT INTO `role_resource` VALUES ('13', '309');
INSERT INTO `role_resource` VALUES ('13', '310');
INSERT INTO `role_resource` VALUES ('13', '311');
INSERT INTO `role_resource` VALUES ('13', '312');
INSERT INTO `role_resource` VALUES ('13', '317');
INSERT INTO `role_resource` VALUES ('13', '318');
INSERT INTO `role_resource` VALUES ('13', '319');
INSERT INTO `role_resource` VALUES ('13', '320');
INSERT INTO `role_resource` VALUES ('13', '322');
INSERT INTO `role_resource` VALUES ('13', '323');
INSERT INTO `role_resource` VALUES ('13', '327');
INSERT INTO `role_resource` VALUES ('13', '330');
INSERT INTO `role_resource` VALUES ('13', '331');
INSERT INTO `role_resource` VALUES ('13', '335');
INSERT INTO `role_resource` VALUES ('13', '336');
INSERT INTO `role_resource` VALUES ('13', '337');
INSERT INTO `role_resource` VALUES ('13', '338');
INSERT INTO `role_resource` VALUES ('13', '343');
INSERT INTO `role_resource` VALUES ('13', '344');
INSERT INTO `role_resource` VALUES ('13', '345');
INSERT INTO `role_resource` VALUES ('13', '347');
INSERT INTO `role_resource` VALUES ('14', '29');
INSERT INTO `role_resource` VALUES ('14', '30');
INSERT INTO `role_resource` VALUES ('14', '31');
INSERT INTO `role_resource` VALUES ('14', '32');
INSERT INTO `role_resource` VALUES ('14', '33');
INSERT INTO `role_resource` VALUES ('14', '34');
INSERT INTO `role_resource` VALUES ('14', '35');
INSERT INTO `role_resource` VALUES ('14', '36');
INSERT INTO `role_resource` VALUES ('14', '37');
INSERT INTO `role_resource` VALUES ('14', '38');
INSERT INTO `role_resource` VALUES ('14', '39');
INSERT INTO `role_resource` VALUES ('14', '40');
INSERT INTO `role_resource` VALUES ('14', '41');
INSERT INTO `role_resource` VALUES ('14', '42');
INSERT INTO `role_resource` VALUES ('14', '43');
INSERT INTO `role_resource` VALUES ('14', '44');
INSERT INTO `role_resource` VALUES ('14', '45');
INSERT INTO `role_resource` VALUES ('14', '47');
INSERT INTO `role_resource` VALUES ('14', '77');
INSERT INTO `role_resource` VALUES ('14', '91');
INSERT INTO `role_resource` VALUES ('14', '93');
INSERT INTO `role_resource` VALUES ('14', '98');
INSERT INTO `role_resource` VALUES ('14', '100');
INSERT INTO `role_resource` VALUES ('14', '105');
INSERT INTO `role_resource` VALUES ('14', '110');
INSERT INTO `role_resource` VALUES ('14', '126');
INSERT INTO `role_resource` VALUES ('14', '128');
INSERT INTO `role_resource` VALUES ('14', '130');
INSERT INTO `role_resource` VALUES ('14', '132');
INSERT INTO `role_resource` VALUES ('14', '133');
INSERT INTO `role_resource` VALUES ('14', '134');
INSERT INTO `role_resource` VALUES ('14', '135');
INSERT INTO `role_resource` VALUES ('14', '136');
INSERT INTO `role_resource` VALUES ('14', '137');
INSERT INTO `role_resource` VALUES ('14', '138');
INSERT INTO `role_resource` VALUES ('14', '139');
INSERT INTO `role_resource` VALUES ('14', '157');
INSERT INTO `role_resource` VALUES ('14', '176');
INSERT INTO `role_resource` VALUES ('14', '177');
INSERT INTO `role_resource` VALUES ('14', '188');
INSERT INTO `role_resource` VALUES ('14', '189');
INSERT INTO `role_resource` VALUES ('14', '191');
INSERT INTO `role_resource` VALUES ('14', '192');
INSERT INTO `role_resource` VALUES ('14', '193');
INSERT INTO `role_resource` VALUES ('14', '194');
INSERT INTO `role_resource` VALUES ('14', '195');
INSERT INTO `role_resource` VALUES ('14', '196');
INSERT INTO `role_resource` VALUES ('14', '197');
INSERT INTO `role_resource` VALUES ('14', '198');
INSERT INTO `role_resource` VALUES ('14', '200');
INSERT INTO `role_resource` VALUES ('14', '201');
INSERT INTO `role_resource` VALUES ('14', '202');
INSERT INTO `role_resource` VALUES ('14', '203');
INSERT INTO `role_resource` VALUES ('14', '205');
INSERT INTO `role_resource` VALUES ('14', '206');
INSERT INTO `role_resource` VALUES ('14', '214');
INSERT INTO `role_resource` VALUES ('14', '217');
INSERT INTO `role_resource` VALUES ('14', '220');
INSERT INTO `role_resource` VALUES ('14', '236');
INSERT INTO `role_resource` VALUES ('14', '243');
INSERT INTO `role_resource` VALUES ('14', '304');
INSERT INTO `role_resource` VALUES ('14', '307');
INSERT INTO `role_resource` VALUES ('14', '314');
INSERT INTO `role_resource` VALUES ('14', '317');
INSERT INTO `role_resource` VALUES ('14', '324');
INSERT INTO `role_resource` VALUES ('14', '327');
INSERT INTO `role_resource` VALUES ('14', '355');
INSERT INTO `role_resource` VALUES ('14', '356');
INSERT INTO `role_resource` VALUES ('14', '378');
INSERT INTO `role_resource` VALUES ('14', '384');
INSERT INTO `role_resource` VALUES ('14', '386');
INSERT INTO `role_resource` VALUES ('14', '389');
INSERT INTO `role_resource` VALUES ('14', '391');
INSERT INTO `role_resource` VALUES ('15', '29');
INSERT INTO `role_resource` VALUES ('15', '30');
INSERT INTO `role_resource` VALUES ('15', '31');
INSERT INTO `role_resource` VALUES ('15', '32');
INSERT INTO `role_resource` VALUES ('15', '33');
INSERT INTO `role_resource` VALUES ('15', '34');
INSERT INTO `role_resource` VALUES ('15', '35');
INSERT INTO `role_resource` VALUES ('15', '36');
INSERT INTO `role_resource` VALUES ('15', '37');
INSERT INTO `role_resource` VALUES ('15', '38');
INSERT INTO `role_resource` VALUES ('15', '39');
INSERT INTO `role_resource` VALUES ('15', '40');
INSERT INTO `role_resource` VALUES ('15', '41');
INSERT INTO `role_resource` VALUES ('15', '42');
INSERT INTO `role_resource` VALUES ('15', '43');
INSERT INTO `role_resource` VALUES ('15', '44');
INSERT INTO `role_resource` VALUES ('15', '45');
INSERT INTO `role_resource` VALUES ('15', '47');
INSERT INTO `role_resource` VALUES ('15', '48');
INSERT INTO `role_resource` VALUES ('15', '77');
INSERT INTO `role_resource` VALUES ('15', '265');
INSERT INTO `role_resource` VALUES ('15', '269');
INSERT INTO `role_resource` VALUES ('15', '304');
INSERT INTO `role_resource` VALUES ('15', '305');
INSERT INTO `role_resource` VALUES ('15', '306');
INSERT INTO `role_resource` VALUES ('15', '307');
INSERT INTO `role_resource` VALUES ('15', '314');
INSERT INTO `role_resource` VALUES ('15', '315');
INSERT INTO `role_resource` VALUES ('15', '316');
INSERT INTO `role_resource` VALUES ('15', '317');
INSERT INTO `role_resource` VALUES ('15', '324');
INSERT INTO `role_resource` VALUES ('15', '325');
INSERT INTO `role_resource` VALUES ('15', '326');
INSERT INTO `role_resource` VALUES ('15', '327');
INSERT INTO `role_resource` VALUES ('15', '328');
INSERT INTO `role_resource` VALUES ('15', '329');
INSERT INTO `role_resource` VALUES ('15', '330');
INSERT INTO `role_resource` VALUES ('15', '331');
INSERT INTO `user` VALUES ('1', '', 'admin', 'd41d8cd98f00b204e9800998ecf8427e', null);
INSERT INTO `user_role` VALUES ('1', '1');

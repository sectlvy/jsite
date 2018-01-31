/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50509
Source Host           : 127.0.0.1:3306
Source Database       : jsite

Target Server Type    : MYSQL
Target Server Version : 50509
File Encoding         : 65001

Date: 2018-01-31 23:35:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for act_evt_log
-- ----------------------------
DROP TABLE IF EXISTS `act_evt_log`;
CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_evt_log
-- ----------------------------

-- ----------------------------
-- Table structure for act_ge_bytearray
-- ----------------------------
DROP TABLE IF EXISTS `act_ge_bytearray`;
CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ge_bytearray
-- ----------------------------

-- ----------------------------
-- Table structure for act_ge_property
-- ----------------------------
DROP TABLE IF EXISTS `act_ge_property`;
CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ge_property
-- ----------------------------
INSERT INTO `act_ge_property` VALUES ('next.dbid', '1', '1');
INSERT INTO `act_ge_property` VALUES ('schema.history', 'create(5.21.0.0)', '1');
INSERT INTO `act_ge_property` VALUES ('schema.version', '5.21.0.0', '1');

-- ----------------------------
-- Table structure for act_hi_actinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_actinst`;
CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_actinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_attachment
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_attachment`;
CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_comment
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_comment`;
CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_comment
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_detail
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_detail`;
CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_detail
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_identitylink`;
CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_identitylink
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_procinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_procinst`;
CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_procinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_taskinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_taskinst`;
CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `CLAIM_TIME_` datetime DEFAULT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_taskinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_varinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_varinst`;
CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_varinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_group
-- ----------------------------
DROP TABLE IF EXISTS `act_id_group`;
CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_id_group
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_info
-- ----------------------------
DROP TABLE IF EXISTS `act_id_info`;
CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_id_info
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_membership
-- ----------------------------
DROP TABLE IF EXISTS `act_id_membership`;
CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_id_membership
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_user
-- ----------------------------
DROP TABLE IF EXISTS `act_id_user`;
CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_id_user
-- ----------------------------

-- ----------------------------
-- Table structure for act_procdef_info
-- ----------------------------
DROP TABLE IF EXISTS `act_procdef_info`;
CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_procdef_info
-- ----------------------------

-- ----------------------------
-- Table structure for act_re_deployment
-- ----------------------------
DROP TABLE IF EXISTS `act_re_deployment`;
CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_re_deployment
-- ----------------------------

-- ----------------------------
-- Table structure for act_re_model
-- ----------------------------
DROP TABLE IF EXISTS `act_re_model`;
CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_re_model
-- ----------------------------

-- ----------------------------
-- Table structure for act_re_procdef
-- ----------------------------
DROP TABLE IF EXISTS `act_re_procdef`;
CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_re_procdef
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_event_subscr
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_event_subscr`;
CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_event_subscr
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_execution
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_execution`;
CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_execution
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_identitylink`;
CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_identitylink
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_job`;
CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_task
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_task`;
CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `DUE_DATE_` datetime DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_task
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_variable
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_variable`;
CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_variable
-- ----------------------------

-- ----------------------------
-- Table structure for biz_equipment
-- ----------------------------
DROP TABLE IF EXISTS `biz_equipment`;
CREATE TABLE `biz_equipment` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `account` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '设备账户',
  `store_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `mac_address` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `status_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '状态名称',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `biz_equipment_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `biz_store` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='设备';

-- ----------------------------
-- Records of biz_equipment
-- ----------------------------

-- ----------------------------
-- Table structure for biz_member
-- ----------------------------
DROP TABLE IF EXISTS `biz_member`;
CREATE TABLE `biz_member` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `nick_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '昵称',
  `account_no` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '账户',
  `password` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '密码',
  `amount` int(11) DEFAULT NULL COMMENT '余额 单位分',
  `biz_store_id` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '门店',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `biz_store_id` (`biz_store_id`),
  CONSTRAINT `biz_member_ibfk_1` FOREIGN KEY (`biz_store_id`) REFERENCES `biz_store` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='会员';

-- ----------------------------
-- Records of biz_member
-- ----------------------------

-- ----------------------------
-- Table structure for biz_store
-- ----------------------------
DROP TABLE IF EXISTS `biz_store`;
CREATE TABLE `biz_store` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `store_account` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '门店账户',
  `store_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '名店名称',
  `store_mobile` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '手机号码',
  `address` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '门店地址',
  `password` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='门店';

-- ----------------------------
-- Records of biz_store
-- ----------------------------
INSERT INTO `biz_store` VALUES ('3abde6352fd340f7a47608a76cd8b7c1', '15652694117', '门店2', '15652694117', '北京市朝阳区大望路店', '123', '1', '2018-01-31 22:31:06', '1', '2018-01-31 22:33:14', '123123123', '0');

-- ----------------------------
-- Table structure for gen_scheme
-- ----------------------------
DROP TABLE IF EXISTS `gen_scheme`;
CREATE TABLE `gen_scheme` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `category` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '分类',
  `package_name` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '生成模块名',
  `sub_module_name` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '生成子模块名',
  `function_name` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '生成功能名',
  `function_name_simple` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '生成功能名（简写）',
  `function_author` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '生成功能作者',
  `gen_table_id` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '生成表编号',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_scheme_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='生成方案';

-- ----------------------------
-- Records of gen_scheme
-- ----------------------------
INSERT INTO `gen_scheme` VALUES ('9dc6304dd36842e8a2f883ebde6e46f9', '会员数据生成', 'curd_many', 'com.thinkgem.jeesite.modules', 'biz', 'member', '会员', '会员', '北冥', 'cd54dca40b4a4c21a21fb75109a2115c', '1', '2018-01-31 22:44:55', '1', '2018-01-31 23:13:17', '', '0');
INSERT INTO `gen_scheme` VALUES ('bc7fdc98d78744f6a49d5a4e2e7f7562', '门店数据生成', 'curd', 'com.thinkgem.jeesite.modules', 'biz', 'store', '门店', '门店', '北冥', '8cb1745c40ee4800bedf201698728307', '1', '2018-01-31 22:25:21', '1', '2018-01-31 23:08:44', '', '0');

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `comments` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `class_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '实体类名称',
  `parent_table` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '关联父表',
  `parent_table_fk` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '关联父表外键',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_table_name` (`name`),
  KEY `gen_table_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES ('8cb1745c40ee4800bedf201698728307', 'biz_store', '门店', 'BizStore', '', '', '1', '2018-01-31 22:20:51', '1', '2018-01-31 22:39:08', '', '0');
INSERT INTO `gen_table` VALUES ('cd54dca40b4a4c21a21fb75109a2115c', 'biz_member', '会员', 'BizMember', 'biz_store', 'biz_store_id', '1', '2018-01-31 22:44:13', '1', '2018-01-31 23:13:10', '', '0');

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `gen_table_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属表编号',
  `name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `comments` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `jdbc_type` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '列的数据类型的字节长度',
  `java_type` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否主键',
  `is_null` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否可为空',
  `is_insert` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否为插入字段',
  `is_edit` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否编辑字段',
  `is_list` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否列表字段',
  `is_query` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否查询字段',
  `query_type` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '查询方式（等于、不等于、大于、小于、范围、左LIKE、右LIKE、左右LIKE）',
  `show_type` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '字段生成方案（文本框、文本域、下拉框、复选框、单选框、字典选择、人员选择、部门选择、区域选择）',
  `dict_type` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '字典类型',
  `settings` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '其它设置（扩展字段JSON）',
  `sort` decimal(10,0) DEFAULT NULL COMMENT '排序（升序）',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_table_column_table_id` (`gen_table_id`),
  KEY `gen_table_column_name` (`name`),
  KEY `gen_table_column_sort` (`sort`),
  KEY `gen_table_column_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES ('04e3651e31e8434b80534ac0adc788c1', '8cb1745c40ee4800bedf201698728307', 'update_by', '更新者', 'varchar(64)', 'com.thinkgem.jeesite.modules.sys.entity.User', 'updateBy.id', '0', '0', '1', '1', '0', '0', '=', 'input', '', null, '90', '1', '2018-01-31 22:20:51', '1', '2018-01-31 22:39:08', null, '0');
INSERT INTO `gen_table_column` VALUES ('0fbefeaa9819468fae992ec23a620717', 'cd54dca40b4a4c21a21fb75109a2115c', 'nick_name', '昵称', 'varchar(255)', 'String', 'nickName', '0', '1', '1', '1', '1', '1', 'like', 'input', '', null, '20', '1', '2018-01-31 22:44:13', '1', '2018-01-31 23:13:10', null, '0');
INSERT INTO `gen_table_column` VALUES ('2ef26c7fff5148a4aa8ddb0a6085350a', '8cb1745c40ee4800bedf201698728307', 'remarks', '备注信息', 'varchar(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'textarea', '', null, '110', '1', '2018-01-31 22:20:51', '1', '2018-01-31 22:39:08', null, '0');
INSERT INTO `gen_table_column` VALUES ('34a35998ee4d49049b5ab82986702f1e', 'cd54dca40b4a4c21a21fb75109a2115c', 'del_flag', '删除标记', 'char(1)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, '130', '1', '2018-01-31 22:44:13', '1', '2018-01-31 23:13:10', null, '0');
INSERT INTO `gen_table_column` VALUES ('3698b225a1cb4d8099b92e9ba3440d8f', 'cd54dca40b4a4c21a21fb75109a2115c', 'birthday', '生日', 'date', 'java.util.Date', 'birthday', '0', '1', '1', '1', '0', '0', '=', 'dateselect', '', null, '70', '1', '2018-01-31 22:44:13', '1', '2018-01-31 23:13:10', null, '0');
INSERT INTO `gen_table_column` VALUES ('4479a42dcc12438c83ec1b6ecbbc67f4', '8cb1745c40ee4800bedf201698728307', 'address', '门店地址', 'varchar(255)', 'String', 'address', '0', '0', '1', '1', '1', '1', 'like', 'input', '', null, '50', '1', '2018-01-31 22:20:51', '1', '2018-01-31 22:39:08', null, '0');
INSERT INTO `gen_table_column` VALUES ('4c6abca74d684c7aa2347648a8b5b74d', '8cb1745c40ee4800bedf201698728307', 'del_flag', '删除标记', 'char(1)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, '120', '1', '2018-01-31 22:20:51', '1', '2018-01-31 22:39:08', null, '0');
INSERT INTO `gen_table_column` VALUES ('62de99afccd3425784baf65889d08b03', '8cb1745c40ee4800bedf201698728307', 'store_mobile', '手机号码', 'varchar(255)', 'String', 'storeMobile', '0', '0', '1', '1', '1', '1', '=', 'input', '', null, '40', '1', '2018-01-31 22:20:51', '1', '2018-01-31 22:39:08', null, '0');
INSERT INTO `gen_table_column` VALUES ('7a4b3da9e0914e26bf34d652144031d0', '8cb1745c40ee4800bedf201698728307', 'password', 'password', 'varchar(255)', 'String', 'password', '0', '0', '1', '1', '0', '0', '=', 'input', '', null, '60', '1', '2018-01-31 22:20:51', '1', '2018-01-31 22:39:08', null, '0');
INSERT INTO `gen_table_column` VALUES ('812611c6cb1540a380c07fa3b852a2c4', '8cb1745c40ee4800bedf201698728307', 'create_by', '创建者', 'varchar(64)', 'com.thinkgem.jeesite.modules.sys.entity.User', 'createBy.id', '0', '0', '1', '0', '0', '0', '=', 'input', '', null, '70', '1', '2018-01-31 22:20:51', '1', '2018-01-31 22:39:08', null, '0');
INSERT INTO `gen_table_column` VALUES ('815f272ff0ac46b681c153f49b7e2512', 'cd54dca40b4a4c21a21fb75109a2115c', 'biz_store_id', '门店', 'varchar(255)', 'String', 'bizStoreId', '0', '1', '1', '1', '0', '0', '=', 'select', '', null, '60', '1', '2018-01-31 23:05:12', '1', '2018-01-31 23:13:10', null, '0');
INSERT INTO `gen_table_column` VALUES ('9e9af3c48abc47b5a5db02c181b4f3be', 'cd54dca40b4a4c21a21fb75109a2115c', 'amount', '余额 单位分', 'int(11)', 'String', 'amount', '0', '1', '1', '1', '1', '0', '=', 'input', '', null, '50', '1', '2018-01-31 22:44:13', '1', '2018-01-31 23:13:10', null, '0');
INSERT INTO `gen_table_column` VALUES ('aaf6ea3f24ff4d3aa3655ba1dedf29f0', 'cd54dca40b4a4c21a21fb75109a2115c', 'id', '编号', 'varchar(64)', 'String', 'id', '1', '0', '1', '0', '1', '0', '=', 'input', '', null, '10', '1', '2018-01-31 22:44:13', '1', '2018-01-31 23:13:10', null, '0');
INSERT INTO `gen_table_column` VALUES ('b268038243fa425a83f5a1670f285eff', 'cd54dca40b4a4c21a21fb75109a2115c', 'update_date', '更新时间', 'datetime', 'java.util.Date', 'updateDate', '0', '0', '1', '1', '1', '0', '=', 'dateselect', '', null, '110', '1', '2018-01-31 22:44:13', '1', '2018-01-31 23:13:10', null, '0');
INSERT INTO `gen_table_column` VALUES ('bb3298a0871048dd825ba31b8cf4abb2', '8cb1745c40ee4800bedf201698728307', 'id', '编号', 'varchar(64)', 'String', 'id', '1', '0', '1', '0', '1', '0', '=', 'input', '', null, '10', '1', '2018-01-31 22:20:51', '1', '2018-01-31 22:39:08', null, '0');
INSERT INTO `gen_table_column` VALUES ('be5de91e46224c9690384b4f77dede5e', 'cd54dca40b4a4c21a21fb75109a2115c', 'remarks', '备注信息', 'varchar(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'textarea', '', null, '120', '1', '2018-01-31 22:44:13', '1', '2018-01-31 23:13:10', null, '0');
INSERT INTO `gen_table_column` VALUES ('c080f44070484f66bb60de5b8e62aba8', '8cb1745c40ee4800bedf201698728307', 'store_name', '名店名称', 'varchar(255)', 'String', 'storeName', '0', '0', '1', '1', '1', '1', 'like', 'input', '', null, '30', '1', '2018-01-31 22:20:51', '1', '2018-01-31 22:39:08', null, '0');
INSERT INTO `gen_table_column` VALUES ('c10915f1141f417989a7e64d1f938f85', 'cd54dca40b4a4c21a21fb75109a2115c', 'create_date', '创建时间', 'datetime', 'java.util.Date', 'createDate', '0', '0', '1', '0', '0', '1', 'between', 'dateselect', '', null, '90', '1', '2018-01-31 22:44:13', '1', '2018-01-31 23:13:10', null, '0');
INSERT INTO `gen_table_column` VALUES ('d2cf2a595a954f0389e7c946b3857978', '8cb1745c40ee4800bedf201698728307', 'create_date', '创建时间', 'datetime', 'java.util.Date', 'createDate', '0', '0', '1', '0', '1', '0', '=', 'dateselect', '', null, '80', '1', '2018-01-31 22:20:51', '1', '2018-01-31 22:39:08', null, '0');
INSERT INTO `gen_table_column` VALUES ('e2a3920adea14c89bc404e60655b4d12', 'cd54dca40b4a4c21a21fb75109a2115c', 'create_by', '创建者', 'varchar(64)', 'com.thinkgem.jeesite.modules.sys.entity.User', 'createBy.id', '0', '0', '1', '0', '0', '0', '=', 'input', '', null, '80', '1', '2018-01-31 22:44:13', '1', '2018-01-31 23:13:10', null, '0');
INSERT INTO `gen_table_column` VALUES ('ea08d89fd40b4b55a2c59b049119a8f8', 'cd54dca40b4a4c21a21fb75109a2115c', 'update_by', '更新者', 'varchar(64)', 'com.thinkgem.jeesite.modules.sys.entity.User', 'updateBy.id', '0', '0', '1', '1', '0', '0', '=', 'input', '', null, '100', '1', '2018-01-31 22:44:13', '1', '2018-01-31 23:13:10', null, '0');
INSERT INTO `gen_table_column` VALUES ('ec880c056aec407d9e8d45b658ea2c8f', 'cd54dca40b4a4c21a21fb75109a2115c', 'account_no', '账户', 'varchar(255)', 'String', 'accountNo', '0', '1', '1', '1', '1', '1', '=', 'input', '', null, '30', '1', '2018-01-31 22:44:13', '1', '2018-01-31 23:13:10', null, '0');
INSERT INTO `gen_table_column` VALUES ('f2e700cd768b46c5af79b5df862cd87e', '8cb1745c40ee4800bedf201698728307', 'update_date', '更新时间', 'datetime', 'java.util.Date', 'updateDate', '0', '0', '1', '1', '0', '0', '=', 'dateselect', '', null, '100', '1', '2018-01-31 22:20:51', '1', '2018-01-31 22:39:08', null, '0');
INSERT INTO `gen_table_column` VALUES ('fadd497e6ecb4e24b3f0efda549c595e', '8cb1745c40ee4800bedf201698728307', 'store_account', '门店账户', 'varchar(255)', 'String', 'storeAccount', '0', '1', '1', '1', '1', '0', '=', 'input', '', null, '20', '1', '2018-01-31 22:20:51', '1', '2018-01-31 22:39:08', null, '0');
INSERT INTO `gen_table_column` VALUES ('fdba372c97c3413a92d4ce364560ca78', 'cd54dca40b4a4c21a21fb75109a2115c', 'password', '密码', 'varchar(255)', 'String', 'password', '0', '1', '1', '1', '0', '0', '=', 'input', '', null, '40', '1', '2018-01-31 22:44:13', '1', '2018-01-31 23:13:10', null, '0');

-- ----------------------------
-- Table structure for gen_template
-- ----------------------------
DROP TABLE IF EXISTS `gen_template`;
CREATE TABLE `gen_template` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `category` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '分类',
  `file_path` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '生成文件路径',
  `file_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '生成文件名',
  `content` text COLLATE utf8_bin COMMENT '内容',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_template_del_falg` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='代码模板表';

-- ----------------------------
-- Records of gen_template
-- ----------------------------

-- ----------------------------
-- Table structure for sys_area
-- ----------------------------
DROP TABLE IF EXISTS `sys_area`;
CREATE TABLE `sys_area` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `parent_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) COLLATE utf8_bin NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `code` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '区域编码',
  `type` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '区域类型',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_area_parent_id` (`parent_id`),
  KEY `sys_area_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='区域表';

-- ----------------------------
-- Records of sys_area
-- ----------------------------
INSERT INTO `sys_area` VALUES ('1', '0', '0,', '中国', '10', '100000', '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_area` VALUES ('2', '1', '0,1,', '山东省', '20', '110000', '2', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_area` VALUES ('3', '2', '0,1,2,', '济南市', '30', '110101', '3', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_area` VALUES ('4', '3', '0,1,2,3,', '历城区', '40', '110102', '4', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_area` VALUES ('5', '3', '0,1,2,3,', '历下区', '50', '110104', '4', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_area` VALUES ('6', '3', '0,1,2,3,', '高新区', '60', '110105', '4', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `value` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '数据值',
  `label` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '标签名',
  `type` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '类型',
  `description` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '描述',
  `sort` decimal(10,0) NOT NULL COMMENT '排序（升序）',
  `parent_id` varchar(64) COLLATE utf8_bin DEFAULT '0' COMMENT '父级编号',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`label`),
  KEY `sys_dict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('1', '0', '正常', 'del_flag', '删除标记', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('10', 'yellow', '黄色', 'color', '颜色值', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('11', 'orange', '橙色', 'color', '颜色值', '50', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('12', 'default', '默认主题', 'theme', '主题方案', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('13', 'cerulean', '天蓝主题', 'theme', '主题方案', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('14', 'readable', '橙色主题', 'theme', '主题方案', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('15', 'united', '红色主题', 'theme', '主题方案', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('16', 'flat', 'Flat主题', 'theme', '主题方案', '60', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('2', '1', '删除', 'del_flag', '删除标记', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('3', '1', '显示', 'show_hide', '显示/隐藏', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('39', '1', '系统管理', 'sys_user_type', '用户类型', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('4', '0', '隐藏', 'show_hide', '显示/隐藏', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('40', '2', '部门经理', 'sys_user_type', '用户类型', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('41', '3', '普通用户', 'sys_user_type', '用户类型', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('5', '1', '是', 'yes_no', '是/否', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('6', '0', '否', 'yes_no', '是/否', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('67', '1', '接入日志', 'sys_log_type', '日志类型', '30', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('68', '2', '异常日志', 'sys_log_type', '日志类型', '40', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('7', 'red', '红色', 'color', '颜色值', '10', '0', '1', '2013-05-27 08:00:00', '1', '2016-02-23 09:54:32', '', '0');
INSERT INTO `sys_dict` VALUES ('8', 'green', '绿色', 'color', '颜色值', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('9', 'blue', '蓝色', 'color', '颜色值', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('96', '1', '男', 'sex', '性别', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('97', '2', '女', 'sex', '性别', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '0');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `type` char(1) COLLATE utf8_bin DEFAULT '1' COMMENT '日志类型',
  `title` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '日志标题',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `remote_addr` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '操作IP地址',
  `user_agent` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '用户代理',
  `request_uri` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '请求URI',
  `method` varchar(5) COLLATE utf8_bin DEFAULT NULL COMMENT '操作方式',
  `params` text COLLATE utf8_bin COMMENT '操作提交的数据',
  `exception` text COLLATE utf8_bin COMMENT '异常信息',
  PRIMARY KEY (`id`),
  KEY `sys_log_create_by` (`create_by`),
  KEY `sys_log_request_uri` (`request_uri`),
  KEY `sys_log_type` (`type`),
  KEY `sys_log_create_date` (`create_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='日志表';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('02712d7174e6473e93f92510f515d88b', '1', '代码生成-代码生成-业务表配置', '1', '2018-01-31 23:09:31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('0331873265ed49429b4c7b827341818a', '1', '系统设置-系统用户-用户管理', '1', '2018-01-31 22:45:25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('07d508f0367e43f3872855fe4664c227', '1', '系统设置-系统设置-菜单管理-修改', '1', '2018-01-31 22:28:27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/sys/menu/save', 'POST', 0x706172656E742E6E616D653DE58A9FE883BDE88F9CE58D95266E616D653DE997A8E5BA97E7AEA1E790862669636F6E3D26706172656E742E69643D31267065726D697373696F6E3D62697A3A73746F72652669643D26687265663D2F62697A2F73746F72652F62697A53746F726526736F72743D353033302672656D61726B733DE997A8E5BA97267461726765743D26697353686F773D31, '');
INSERT INTO `sys_log` VALUES ('0824708d6197408d97d77cbb398f5873', '1', '门店管理', '1', '2018-01-31 22:30:47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/biz/store/bizStore', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('11652ca94c184c35af63723c090a7ad1', '1', '系统登录', '1', '2018-01-31 23:09:16', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a', 'GET', 0x6C6F67696E3D, '');
INSERT INTO `sys_log` VALUES ('12cee43233704b0e828e2deec5e3f0dc', '2', '', '1', '2018-01-31 14:44:48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', '/a', 'GET', 0x6C6F67696E3D, 0x6F72672E6170616368652E6A61737065722E4A6173706572457863657074696F6E3A20505743363239393A2054686520636C61737320636F6D2E7468696E6B67656D2E6A6565736974652E6D6F64756C65732E636D732E656E746974792E536974652073706563696669656420696E20544C4420666F72207468652066756E6374696F6E20666E633A67657443757272656E745369746549642063616E6E6F7420626520666F756E643A20636F6D2E7468696E6B67656D2E6A6565736974652E6D6F64756C65732E636D732E656E746974792E536974650D0A096174206F72672E6170616368652E6A61737065722E636F6D70696C65722E44656661756C744572726F7248616E646C65722E6A73704572726F722844656661756C744572726F7248616E646C65722E6A6176613A3932290D0A096174206F72672E6170616368652E6A61737065722E636F6D70696C65722E4572726F72446973706174636865722E6469737061746368284572726F72446973706174636865722E6A6176613A333738290D0A096174206F72672E6170616368652E6A61737065722E636F6D70696C65722E4572726F72446973706174636865722E6A73704572726F72284572726F72446973706174636865722E6A6176613A313732290D0A096174206F72672E6170616368652E6A61737065722E636F6D70696C65722E56616C696461746F722456616C696461746556697369746F7224314D6170706572454C56697369746F722E76697369742856616C696461746F722E6A6176613A31373239290D0A096174206F72672E6170616368652E6A61737065722E636F6D70696C65722E454C4E6F64652446756E6374696F6E2E61636365707428454C4E6F64652E6A6176613A313636290D0A096174206F72672E6170616368652E6A61737065722E636F6D70696C65722E454C4E6F6465244E6F6465732E766973697428454C4E6F64652E6A6176613A323337290D0A096174206F72672E6170616368652E6A61737065722E636F6D70696C65722E454C4E6F64652456697369746F722E766973697428454C4E6F64652E6A6176613A333034290D0A096174206F72672E6170616368652E6A61737065722E636F6D70696C65722E454C4E6F646524526F6F742E61636365707428454C4E6F64652E6A6176613A3937290D0A096174206F72672E6170616368652E6A61737065722E636F6D70696C65722E454C4E6F6465244E6F6465732E766973697428454C4E6F64652E6A6176613A323337290D0A096174206F72672E6170616368652E6A61737065722E636F6D70696C65722E56616C696461746F722456616C696461746556697369746F722E67657446756E6374696F6E4D61707065722856616C696461746F722E6A6176613A31373730290D0A096174206F72672E6170616368652E6A61737065722E636F6D70696C65722E56616C696461746F722456616C696461746556697369746F722E76697369742856616C696461746F722E6A6176613A373630290D0A096174206F72672E6170616368652E6A61737065722E636F6D70696C65722E4E6F646524454C45787072657373696F6E2E616363657074284E6F64652E6A6176613A393437290D0A096174206F72672E6170616368652E6A61737065722E636F6D70696C65722E4E6F6465244E6F6465732E7669736974284E6F64652E6A6176613A32323937290D0A096174206F72672E6170616368652E6A61737065722E636F6D70696C65722E4E6F64652456697369746F722E7669736974426F6479284E6F64652E6A6176613A32333437290D0A096174206F72672E6170616368652E6A61737065722E636F6D70696C65722E4E6F64652456697369746F722E7669736974284E6F64652E6A6176613A32333533290D0A096174206F72672E6170616368652E6A61737065722E636F6D70696C65722E4E6F646524526F6F742E616363657074284E6F64652E6A6176613A343939290D0A096174206F72672E6170616368652E6A61737065722E636F6D70696C65722E4E6F6465244E6F6465732E7669736974284E6F64652E6A6176613A32323937290D0A096174206F72672E6170616368652E6A61737065722E636F6D70696C65722E56616C696461746F722E76616C69646174652856616C696461746F722E6A6176613A31383832290D0A096174206F72672E6170616368652E6A61737065722E636F6D70696C65722E436F6D70696C65722E67656E65726174654A61766128436F6D70696C65722E6A6176613A323233290D0A096174206F72672E6170616368652E6A61737065722E636F6D70696C65722E436F6D70696C65722E636F6D70696C6528436F6D70696C65722E6A6176613A343531290D0A096174206F72672E6170616368652E6A61737065722E4A7370436F6D70696C6174696F6E436F6E746578742E636F6D70696C65284A7370436F6D70696C6174696F6E436F6E746578742E6A6176613A363235290D0A096174206F72672E6170616368652E6A61737065722E736572766C65742E4A7370536572766C6574577261707065722E73657276696365284A7370536572766C6574577261707065722E6A6176613A333734290D0A096174206F72672E6170616368652E6A61737065722E736572766C65742E4A7370536572766C65742E736572766963654A737046696C65284A7370536572766C65742E6A6176613A343932290D0A096174206F72672E6170616368652E6A61737065722E736572766C65742E4A7370536572766C65742E73657276696365284A7370536572766C65742E6A6176613A333738290D0A096174206A617661782E736572766C65742E687474702E48747470536572766C65742E736572766963652848747470536572766C65742E6A6176613A383438290D0A096174206F72672E65636C697073652E6A657474792E736572766C65742E536572766C6574486F6C6465722E68616E646C6528536572766C6574486F6C6465722E6A6176613A363834290D0A096174206F72672E65636C697073652E6A657474792E736572766C65742E536572766C657448616E646C65722E646F48616E646C6528536572766C657448616E646C65722E6A6176613A353031290D0A096174206F72672E65636C697073652E6A657474792E7365727665722E68616E646C65722E53636F70656448616E646C65722E68616E646C652853636F70656448616E646C65722E6A6176613A313337290D0A096174206F72672E65636C697073652E6A657474792E73656375726974792E536563757269747948616E646C65722E68616E646C6528536563757269747948616E646C65722E6A6176613A353735290D0A096174206F72672E65636C697073652E6A657474792E7365727665722E73657373696F6E2E53657373696F6E48616E646C65722E646F48616E646C652853657373696F6E48616E646C65722E6A6176613A323331290D0A096174206F72672E65636C697073652E6A657474792E7365727665722E68616E646C65722E436F6E7465787448616E646C65722E646F48616E646C6528436F6E7465787448616E646C65722E6A6176613A31303836290D0A096174206F72672E65636C697073652E6A657474792E736572766C65742E536572766C657448616E646C65722E646F53636F706528536572766C657448616E646C65722E6A6176613A343238290D0A096174206F72672E65636C697073652E6A657474792E7365727665722E73657373696F6E2E53657373696F6E48616E646C65722E646F53636F70652853657373696F6E48616E646C65722E6A6176613A313933290D0A096174206F72672E65636C697073652E6A657474792E7365727665722E68616E646C65722E436F6E7465787448616E646C65722E646F53636F706528436F6E7465787448616E646C65722E6A6176613A31303230290D0A096174206F72672E65636C697073652E6A657474792E7365727665722E68616E646C65722E53636F70656448616E646C65722E68616E646C652853636F70656448616E646C65722E6A6176613A313335290D0A096174206F72672E65636C697073652E6A657474792E7365727665722E446973706174636865722E666F727761726428446973706174636865722E6A6176613A323736290D0A096174206F72672E65636C697073652E6A657474792E7365727665722E446973706174636865722E666F727761726428446973706174636865722E6A6176613A313033290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E766965772E496E7465726E616C5265736F75726365566965772E72656E6465724D65726765644F75747075744D6F64656C28496E7465726E616C5265736F75726365566965772E6A6176613A313638290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E766965772E4162737472616374566965772E72656E646572284162737472616374566965772E6A6176613A333033290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E44697370617463686572536572766C65742E72656E6465722844697370617463686572536572766C65742E6A6176613A31323433290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E44697370617463686572536572766C65742E70726F636573734469737061746368526573756C742844697370617463686572536572766C65742E6A6176613A31303237290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E44697370617463686572536572766C65742E646F44697370617463682844697370617463686572536572766C65742E6A6176613A393731290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E44697370617463686572536572766C65742E646F536572766963652844697370617463686572536572766C65742E6A6176613A383933290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E4672616D65776F726B536572766C65742E70726F6365737352657175657374284672616D65776F726B536572766C65742E6A6176613A393635290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E4672616D65776F726B536572766C65742E646F476574284672616D65776F726B536572766C65742E6A6176613A383536290D0A096174206A617661782E736572766C65742E687474702E48747470536572766C65742E736572766963652848747470536572766C65742E6A6176613A373335290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E4672616D65776F726B536572766C65742E73657276696365284672616D65776F726B536572766C65742E6A6176613A383431290D0A096174206A617661782E736572766C65742E687474702E48747470536572766C65742E736572766963652848747470536572766C65742E6A6176613A383438290D0A096174206F72672E65636C697073652E6A657474792E736572766C65742E536572766C6574486F6C6465722E68616E646C6528536572766C6574486F6C6465722E6A6176613A363834290D0A096174206F72672E65636C697073652E6A657474792E736572766C65742E536572766C657448616E646C657224436163686564436861696E2E646F46696C74657228536572766C657448616E646C65722E6A6176613A31343936290D0A09617420636F6D2E6F70656E73796D70686F6E792E736974656D6573682E7765626170702E536974654D65736846696C7465722E6F627461696E436F6E74656E7428536974654D65736846696C7465722E6A6176613A313239290D0A09617420636F6D2E6F70656E73796D70686F6E792E736974656D6573682E7765626170702E536974654D65736846696C7465722E646F46696C74657228536974654D65736846696C7465722E6A6176613A3737290D0A096174206F72672E65636C697073652E6A657474792E736572766C65742E536572766C657448616E646C657224436163686564436861696E2E646F46696C74657228536572766C657448616E646C65722E6A6176613A31343834290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E50726F7869656446696C746572436861696E2E646F46696C7465722850726F7869656446696C746572436861696E2E6A6176613A3631290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E41647669636546696C7465722E65786563757465436861696E2841647669636546696C7465722E6A6176613A313038290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E41647669636546696C7465722E646F46696C746572496E7465726E616C2841647669636546696C7465722E6A6176613A313337290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4F6E63655065725265717565737446696C7465722E646F46696C746572284F6E63655065725265717565737446696C7465722E6A6176613A313235290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E50726F7869656446696C746572436861696E2E646F46696C7465722850726F7869656446696C746572436861696E2E6A6176613A3636290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C7465722E65786563757465436861696E284162737472616374536869726F46696C7465722E6A6176613A343439290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C74657224312E63616C6C284162737472616374536869726F46696C7465722E6A6176613A333635290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E5375626A65637443616C6C61626C652E646F43616C6C285375626A65637443616C6C61626C652E6A6176613A3930290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E5375626A65637443616C6C61626C652E63616C6C285375626A65637443616C6C61626C652E6A6176613A3833290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E44656C65676174696E675375626A6563742E657865637574652844656C65676174696E675375626A6563742E6A6176613A333833290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C7465722E646F46696C746572496E7465726E616C284162737472616374536869726F46696C7465722E6A6176613A333632290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4F6E63655065725265717565737446696C7465722E646F46696C746572284F6E63655065725265717565737446696C7465722E6A6176613A313235290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E44656C65676174696E6746696C74657250726F78792E696E766F6B6544656C65676174652844656C65676174696E6746696C74657250726F78792E6A6176613A333434290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E44656C65676174696E6746696C74657250726F78792E646F46696C7465722844656C65676174696E6746696C74657250726F78792E6A6176613A323631290D0A096174206F72672E65636C697073652E6A657474792E736572766C65742E536572766C657448616E646C657224436163686564436861696E2E646F46696C74657228536572766C657448616E646C65722E6A6176613A31343834290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E436861726163746572456E636F64696E6746696C7465722E646F46696C746572496E7465726E616C28436861726163746572456E636F64696E6746696C7465722E6A6176613A3835290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E4F6E63655065725265717565737446696C7465722E646F46696C746572284F6E63655065725265717565737446696C7465722E6A6176613A313037290D0A096174206F72672E65636C697073652E6A657474792E736572766C65742E536572766C657448616E646C657224436163686564436861696E2E646F46696C74657228536572766C657448616E646C65722E6A6176613A31343736290D0A096174206F72672E65636C697073652E6A657474792E736572766C65742E536572766C657448616E646C65722E646F48616E646C6528536572766C657448616E646C65722E6A6176613A343939290D0A096174206F72672E65636C697073652E6A657474792E7365727665722E68616E646C65722E53636F70656448616E646C65722E68616E646C652853636F70656448616E646C65722E6A6176613A313337290D0A096174206F72672E65636C697073652E6A657474792E73656375726974792E536563757269747948616E646C65722E68616E646C6528536563757269747948616E646C65722E6A6176613A353537290D0A096174206F72672E65636C697073652E6A657474792E7365727665722E73657373696F6E2E53657373696F6E48616E646C65722E646F48616E646C652853657373696F6E48616E646C65722E6A6176613A323331290D0A096174206F72672E65636C697073652E6A657474792E7365727665722E68616E646C65722E436F6E7465787448616E646C65722E646F48616E646C6528436F6E7465787448616E646C65722E6A6176613A31303836290D0A096174206F72672E65636C697073652E6A657474792E736572766C65742E536572766C657448616E646C65722E646F53636F706528536572766C657448616E646C65722E6A6176613A343238290D0A096174206F72672E65636C697073652E6A657474792E7365727665722E73657373696F6E2E53657373696F6E48616E646C65722E646F53636F70652853657373696F6E48616E646C65722E6A6176613A313933290D0A096174206F72672E65636C697073652E6A657474792E7365727665722E68616E646C65722E436F6E7465787448616E646C65722E646F53636F706528436F6E7465787448616E646C65722E6A6176613A31303230290D0A096174206F72672E65636C697073652E6A657474792E7365727665722E68616E646C65722E53636F70656448616E646C65722E68616E646C652853636F70656448616E646C65722E6A6176613A313335290D0A096174206F72672E65636C697073652E6A657474792E7365727665722E68616E646C65722E48616E646C6572577261707065722E68616E646C652848616E646C6572577261707065722E6A6176613A313136290D0A096174206F72672E65636C697073652E6A657474792E7365727665722E5365727665722E68616E646C65285365727665722E6A6176613A333730290D0A096174206F72672E65636C697073652E6A657474792E7365727665722E416273747261637448747470436F6E6E656374696F6E2E68616E646C655265717565737428416273747261637448747470436F6E6E656374696F6E2E6A6176613A343934290D0A096174206F72672E65636C697073652E6A657474792E7365727665722E416273747261637448747470436F6E6E656374696F6E2E686561646572436F6D706C65746528416273747261637448747470436F6E6E656374696F6E2E6A6176613A393731290D0A096174206F72672E65636C697073652E6A657474792E7365727665722E416273747261637448747470436F6E6E656374696F6E245265717565737448616E646C65722E686561646572436F6D706C65746528416273747261637448747470436F6E6E656374696F6E2E6A6176613A31303333290D0A096174206F72672E65636C697073652E6A657474792E687474702E487474705061727365722E70617273654E65787428487474705061727365722E6A6176613A363434290D0A096174206F72672E65636C697073652E6A657474792E687474702E487474705061727365722E7061727365417661696C61626C6528487474705061727365722E6A6176613A323335290D0A096174206F72672E65636C697073652E6A657474792E7365727665722E4173796E6348747470436F6E6E656374696F6E2E68616E646C65284173796E6348747470436F6E6E656374696F6E2E6A6176613A3832290D0A096174206F72672E65636C697073652E6A657474792E696F2E6E696F2E53656C6563744368616E6E656C456E64506F696E742E68616E646C652853656C6563744368616E6E656C456E64506F696E742E6A6176613A363637290D0A096174206F72672E65636C697073652E6A657474792E696F2E6E696F2E53656C6563744368616E6E656C456E64506F696E7424312E72756E2853656C6563744368616E6E656C456E64506F696E742E6A6176613A3532290D0A096174206F72672E65636C697073652E6A657474792E7574696C2E7468726561642E517565756564546872656164506F6F6C2E72756E4A6F6228517565756564546872656164506F6F6C2E6A6176613A363038290D0A096174206F72672E65636C697073652E6A657474792E7574696C2E7468726561642E517565756564546872656164506F6F6C24332E72756E28517565756564546872656164506F6F6C2E6A6176613A353433290D0A096174206A6176612E6C616E672E5468726561642E72756E285468726561642E6A6176613A373438290D0A);
INSERT INTO `sys_log` VALUES ('197447e0838a454ab09100f3cb70cd17', '1', '我的面板-个人信息-个人信息', '1', '2018-01-31 23:02:16', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('1b4c5635fc154c6685703d347538e055', '1', '系统登录', '1', '2018-01-31 23:12:02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a', 'GET', 0x6C6F67696E3D, '');
INSERT INTO `sys_log` VALUES ('1dd2b97de587450384903b1ef382ab0f', '1', '代码生成-代码生成-生成方案配置', '1', '2018-01-31 22:21:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/gen/genScheme', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('2167208efdb44fafa87b9bb0f73e1f11', '1', '系统设置-系统用户-用户管理', '1', '2018-01-31 22:07:50', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('238d87c389d04ef2a6ad160bf25be559', '1', '系统登录', '1', '2018-01-31 23:08:26', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a', 'GET', 0x6C6F67696E3D, '');
INSERT INTO `sys_log` VALUES ('291ba68e4f9b44198ab29dce92fcc9fa', '1', '门店管理', '1', '2018-01-31 22:46:55', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/biz/store/bizStore', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('2969ecbff2634082a03f64c2fbb9f7fc', '1', '系统设置-系统用户-用户管理', '1', '2018-01-31 22:29:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('2df5471927fd457cb84177832c89a44f', '1', '我的面板-个人信息-个人信息', '1', '2018-01-30 14:21:58', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('2e386e4f6b8149cfb882bd2d8583fd67', '1', '我的面板-个人信息-个人信息', '1', '2018-01-31 22:07:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('2f7173dd2b954aa6b18a3f62f3461d02', '1', '系统登录', '1', '2018-01-30 14:14:18', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a', 'GET', 0x6C6F67696E3D, '');
INSERT INTO `sys_log` VALUES ('31aca412ebd1460ca2ae0c6802d365ba', '1', '系统登录', '1', '2018-01-31 14:44:47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', '/a', 'GET', 0x6C6F67696E3D, '');
INSERT INTO `sys_log` VALUES ('3277d9ecce4d406bacab9d00c2951fbf', '1', '代码生成-代码生成-业务表配置', '1', '2018-01-31 23:02:17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('33988f92e2694018a423e46cd128d1f2', '1', '系统设置-系统设置-菜单管理', '1', '2018-01-31 22:27:24', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('375543ae4ed547b6b2efcd3dcc7e7bdc', '1', '代码生成-代码生成-业务表配置', '1', '2018-01-31 23:11:31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('38adc2b5b3494c1c8f867f9898424a06', '1', '系统登录', '1', '2018-01-31 22:30:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a', 'GET', 0x6C6F67696E3D, '');
INSERT INTO `sys_log` VALUES ('39f6e345eab041369988905cd678f6e7', '1', '我的面板-个人信息-个人信息', '1', '2018-01-31 14:56:58', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', '/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('3bfdbae2db554cd6a89546236d5dadb2', '1', '代码生成-代码生成-业务表配置', '1', '2018-01-31 23:09:41', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('3c62631038db48fd8b0d57d0a333ecfb', '1', '系统登录', '1', '2018-01-31 23:03:09', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a', 'GET', 0x6C6F67696E3D, '');
INSERT INTO `sys_log` VALUES ('3ecc4228bf094dcb80b7b6a1015c03cc', '1', '门店管理', '1', '2018-01-31 22:29:35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/biz/store/bizStore', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('44ddfa28b692454eb7d32d5dd8ed2cf8', '1', '会员管理', '1', '2018-01-31 23:09:20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/biz/member/bizMember', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('4967ebdc0a9e48f89663381b0b4a8ae3', '1', '系统登录', '1', '2018-01-31 22:40:04', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a', 'GET', 0x6C6F67696E3D, '');
INSERT INTO `sys_log` VALUES ('4a708eef0c254206b19015304d68e8fb', '1', '我的面板-个人信息-个人信息', '1', '2018-01-31 23:03:12', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('4d4a464a378145bda0ade6365febdc5f', '1', '系统设置-系统用户-用户管理', '1', '2018-01-31 22:28:55', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('5071d07f8e6a4951a293cfcb758b84e1', '1', '系统登录', '1', '2018-01-31 23:05:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a', 'GET', 0x6C6F67696E3D, '');
INSERT INTO `sys_log` VALUES ('522f442cbf7e4c35a3dcaa5e9a1f7a5e', '1', '我的面板-个人信息-个人信息', '1', '2018-01-31 23:08:28', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('5307c4d1e4be4e8a970c25e2df572bd4', '1', '系统登录', '1', '2018-01-30 14:20:15', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a', 'GET', 0x6C6F67696E3D, '');
INSERT INTO `sys_log` VALUES ('53333f4c863f40ec98f774c06846573b', '1', '代码生成-代码生成-生成方案配置', '1', '2018-01-31 23:05:13', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/gen/genScheme', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('538c34128fcf49feb8a721dbb4ff9267', '1', '代码生成-代码生成-生成方案配置', '1', '2018-01-31 23:08:38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/gen/genScheme', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('55c6bb38b7674223bfad31f3a85d1341', '1', '系统设置-系统设置-菜单管理', '1', '2018-01-31 22:29:12', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('57fbf9b4a9564d0cbdd0d9c2e99532d6', '1', '系统登录', '1', '2018-01-31 23:13:43', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a', 'GET', 0x6C6F67696E3D, '');
INSERT INTO `sys_log` VALUES ('58a5fe704f464b4fb2d48c83c0c7d3da', '1', '系统设置-系统用户-用户管理', '1', '2018-01-31 14:57:08', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('5e594522e7134581982fd27b5f413ddc', '1', '我的面板-个人信息-个人信息', '1', '2018-01-31 23:10:57', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('5fc32acbcd9d4463994458e597b429f8', '1', '代码生成-代码生成-业务表配置', '1', '2018-01-31 23:03:27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('615e887142f54c59a05493846a3f8542', '1', '代码生成-代码生成-业务表配置', '1', '2018-01-31 14:57:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', '/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('6544c3900c064ad98c99ca7664a0a7c2', '1', '我的面板-个人信息-修改密码', '1', '2018-01-31 14:57:11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', '/a/sys/user/modifyPwd', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('6a1ef32daee94b0eb43662c259ccdc88', '1', '我的面板-个人信息-个人信息', '1', '2018-01-31 22:46:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('6a353258ad3048ac8fba02dc49f72a14', '1', '代码生成-代码生成-生成方案配置', '1', '2018-01-31 22:39:10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/gen/genScheme', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('6bf060f5b9c74f1ab786b11060f5d28e', '1', '代码生成-代码生成-生成方案配置', '1', '2018-01-31 23:13:11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/gen/genScheme', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('6e7b66fef05c4b1aa2b58d756ca83a6b', '1', '系统登录', '1', '2018-01-31 14:56:55', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', '/a', 'GET', 0x6C6F67696E3D, '');
INSERT INTO `sys_log` VALUES ('703dc5a60a9448cf88b832e37e73a3ac', '1', '代码生成-代码生成-生成方案配置', '1', '2018-01-31 22:37:05', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/gen/genScheme', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('72680eed75c94b3f86be9ef8e70aeac5', '1', '我的面板-个人信息-个人信息', '1', '2018-01-31 22:40:06', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('7ab60dc84d8b4ea1a2162e0f307771a6', '1', '会员管理', '1', '2018-01-31 22:46:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/biz/member/bizMember', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('7d4070f6389f4f09b36805e10de4d034', '1', '代码生成-代码生成-生成方案配置', '1', '2018-01-31 23:02:19', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/gen/genScheme', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('80e1e11d769046afb5d7d9ba6274de90', '1', '代码生成-代码生成-业务表配置', '1', '2018-01-31 22:35:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('836cb819afcf4d598dae6fdcb2bf950e', '1', '代码生成-代码生成-业务表配置', '1', '2018-01-31 22:19:11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('84934e1d3f034ff1b6023e4a0e25ba01', '1', '代码生成-代码生成-业务表配置', '1', '2018-01-30 14:14:22', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('84f42d3a1ae2413494d819e0b2252f61', '1', '系统设置-系统设置-菜单管理', '1', '2018-01-31 22:28:27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('85691c30f42a40028d4470c7035b6a96', '1', '代码生成-代码生成-业务表配置', '1', '2018-01-31 14:57:04', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', '/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('871ed70b6f024a4b83928143e97f4c16', '1', '代码生成-代码生成-生成方案配置', '1', '2018-01-31 22:44:15', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/gen/genScheme', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('88b94b79f17948449e7bff8b5082677f', '1', '我的面板-个人信息-个人信息', '1', '2018-01-31 22:27:20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('89a6a55914ad4ca1a2fdfffc2918cc4e', '1', '系统登录', '1', '2018-01-31 22:46:30', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a', 'GET', 0x6C6F67696E3D, '');
INSERT INTO `sys_log` VALUES ('8b3b628e104946be934dde41fe97a571', '1', '代码生成-代码生成-生成方案配置', '1', '2018-01-31 23:09:33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/gen/genScheme', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('8c517b751dac43f2872f470c61f0a989', '1', '代码生成-代码生成-业务表配置', '1', '2018-01-31 23:08:30', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('8d3164374ab94022ad8820b96a1a5588', '1', '代码生成-代码生成-业务表配置', '1', '2018-01-31 21:42:02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('9808a2c604324d82b80de70e7e87b0b9', '1', '代码生成-代码生成-业务表配置', '1', '2018-01-31 23:12:57', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('9c55781a0a604205a4bc133395393453', '1', '系统设置-系统用户-用户管理', '1', '2018-01-31 21:41:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('9db37acabcd94cc692334895a0b04347', '1', '代码生成-代码生成-业务表配置', '1', '2018-01-30 14:20:21', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('9e778df03a29414ab53cdee0e9addf8d', '1', '系统登录', '1', '2018-01-31 21:41:52', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a', 'GET', 0x6C6F67696E3D, '');
INSERT INTO `sys_log` VALUES ('9fdd884ebbe74408a3931c8abdad623e', '1', '我的面板-个人信息-个人信息', '1', '2018-01-31 23:09:18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('a4391db0f4d3490c92410b51ea531df7', '1', '代码生成-代码生成-业务表配置', '1', '2018-01-31 22:28:53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('a48325fbdf434e4e87a6b892cd1881a8', '1', '系统设置-系统设置-菜单管理', '1', '2018-01-31 22:25:35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('a5d919af5f294fefab51daa3f60ffed6', '1', '代码生成-代码生成-业务表配置', '1', '2018-01-31 23:03:28', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('ac7697483a71424ca3b6e15a74e99d0d', '1', '代码生成-代码生成-生成方案配置', '1', '2018-01-31 14:57:03', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', '/a/gen/genScheme', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('ac87718e16404d40af99bc882dfec27d', '1', '代码生成-代码生成-业务表配置', '1', '2018-01-30 14:25:12', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('ad6d3f25706949ea9dd3b92d7d51f91f', '1', '代码生成-代码生成-生成方案配置', '1', '2018-01-31 23:11:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/gen/genScheme', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('adefeea4ff5743638367608ac55c7232', '1', '会员管理', '1', '2018-01-31 23:05:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/biz/member/bizMember', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('ae0e0ea881c242cdbacc54057d6740bb', '1', '会员管理', '1', '2018-01-31 22:46:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/biz/member/bizMember', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('af7f47cf43fb43bc88548f36e1653e24', '1', '我的面板-个人信息-个人信息', '1', '2018-01-31 22:30:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('bab67f4027d444a7adb8e63e65e7d782', '1', '门店管理', '1', '2018-01-31 23:11:20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/biz/store/bizStore', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('be9eca947f6143a480d835b0780fea17', '1', '系统设置-系统设置-菜单管理', '1', '2018-01-31 22:45:28', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('c00c57dc22c94f2ea155423ff1161f32', '1', '门店管理', '1', '2018-01-31 22:28:51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/biz/store/bizStore', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('c8faad769da74ef9a4a4182fc6dce943', '1', '代码生成-代码生成-业务表配置', '1', '2018-01-31 23:14:54', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('c9028afc1ae244ca9afcc77cfd2dcff5', '1', '系统设置-系统设置-菜单管理', '1', '2018-01-31 22:29:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('c92975d7675e4653959fe0cbb5757c67', '1', '会员管理', '1', '2018-01-31 23:03:13', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/biz/member/bizMember', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('ca51244de7294da28ad7cd9eda002ba4', '1', '代码生成-代码生成-业务表配置', '1', '2018-01-31 23:10:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('cc0edf27865247d8826cb3c289542ef8', '1', '代码生成-代码生成-业务表配置', '1', '2018-01-30 14:22:27', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('cd0368a30a9643dcbd38fc272c922e31', '1', '会员管理', '1', '2018-01-31 23:11:22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/biz/member/bizMember', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('cdab38890dd44e048189f4f8d2c3ef7e', '1', '系统设置-系统用户-用户管理', '1', '2018-01-31 22:07:48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d7b2ef08f5824eb182ae739409422223', '1', '我的面板-个人信息-个人信息', '1', '2018-01-30 14:14:22', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d967df8e9b42478a8f3c79e83f96a12e', '1', '门店管理', '1', '2018-01-31 22:40:10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/biz/store/bizStore', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('dbb54712d75d4489a3c2f9ac42ad2afc', '1', '我的面板-个人信息-个人信息', '1', '2018-01-31 22:28:30', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('de5a502f10854f57bbcd1b78534ec460', '1', '系统设置-系统设置-菜单管理', '1', '2018-01-31 22:45:55', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('dfce4bd7d9ab4fa49f62f6b91a17a908', '1', '门店管理', '1', '2018-01-31 22:28:31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/biz/store/bizStore', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('e005dbb17f984448929480acd54976a0', '1', '系统登录', '1', '2018-01-31 23:02:14', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a', 'GET', 0x6C6F67696E3D, '');
INSERT INTO `sys_log` VALUES ('e1ba2d8fe4f84a5f85c8e43debeb817d', '1', '系统设置-系统用户-用户管理', '1', '2018-01-31 22:25:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('e21337efa49845149a446e5bd4bb66eb', '1', '会员管理', '1', '2018-01-31 23:13:48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/biz/member/bizMember', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('e45ca54583374e81a010f4d91f9c2e62', '1', '代码生成-代码生成-业务表配置', '1', '2018-01-31 22:37:10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('e48aef616afd49e3a0947ae0a226ae8a', '1', '系统设置-系统设置-菜单管理', '1', '2018-01-31 22:29:00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('e5997e8afc714fddb4e2918f798222d2', '1', '我的面板-个人信息-个人信息', '1', '2018-01-30 14:20:18', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('e7960e1a92d642fdb2c479d632fd133c', '1', '门店管理', '1', '2018-01-31 23:09:19', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/biz/store/bizStore', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('ec4f619e370543028d2cbd703affe391', '1', '系统设置-系统设置-菜单管理-修改', '1', '2018-01-31 22:45:55', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/sys/menu/save', 'POST', 0x706172656E742E6E616D653DE58A9FE883BDE88F9CE58D952669636F6E3D266E616D653DE4BC9AE59198E7AEA1E79086267065726D697373696F6E3D62697A3A6D656D62657226706172656E742E69643D312669643D26687265663D2F62697A2F6D656D6265722F62697A4D656D62657226736F72743D353036302672656D61726B733DE4BC9AE59198E7AEA1E79086267461726765743D26697353686F773D31, '');
INSERT INTO `sys_log` VALUES ('ecd94db167f047d6b5247211a2032208', '1', '代码生成-代码生成-业务表配置', '1', '2018-01-31 22:41:03', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('ecffc1dc533146e7ae87a2a9e6b17696', '1', '会员管理', '1', '2018-01-31 23:12:05', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/biz/member/bizMember', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('ef68f8b53dc44b8e89a85bd52d5f75b1', '1', '我的面板-个人信息-个人信息', '1', '2018-01-31 23:12:04', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f1ff87d655a64b3dba52672f7cd52f77', '1', '我的面板-个人信息-个人信息', '1', '2018-01-31 21:41:54', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f260d75ddd0045f8a84b06e851597106', '1', '门店管理', '1', '2018-01-31 23:03:12', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/biz/store/bizStore', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f5410ea56e3a473e973192ef4a867fdd', '1', '我的面板-个人信息-个人信息', '1', '2018-01-31 23:05:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f6dea9b2c042446e8dca4ded1d41a86e', '1', '系统设置-系统用户-用户管理', '1', '2018-01-31 22:27:22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f709c9a1636c456b9d1aaf2ed7b74385', '1', '我的面板-个人信息-个人信息', '1', '2018-01-31 14:57:09', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', '/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f7d5e90d6e8f43b6afd57fc5e72ce0dd', '1', '系统登录', '1', '2018-01-31 22:27:18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a', 'GET', 0x6C6F67696E3D, '');
INSERT INTO `sys_log` VALUES ('fed7450fd328482fb12e5cea6b34857f', '1', '我的面板-个人信息-个人信息', '1', '2018-01-31 23:13:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/a/sys/user/info', 'GET', '', '');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `parent_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) COLLATE utf8_bin NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `href` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '链接',
  `target` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '目标',
  `icon` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '图标',
  `is_show` char(1) COLLATE utf8_bin NOT NULL COMMENT '是否在菜单中显示',
  `permission` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '权限标识',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_menu_parent_id` (`parent_id`),
  KEY `sys_menu_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '0,', '功能菜单', '0', '', '', '', '1', '', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('10', '3', '0,1,2,3,', '字典管理', '60', '/sys/dict/', '', 'th-list', '1', 'sys:dict:view', '1', '2013-05-27 08:00:00', '1', '2016-02-23 14:59:56', '', '0');
INSERT INTO `sys_menu` VALUES ('12', '10', '0,1,2,3,10,', '修改', '40', '', '', '', '0', 'sys:dict:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('13', '2', '0,1,2,', '系统用户', '970', '', '', '', '1', '', '1', '2013-05-27 08:00:00', '1', '2016-02-23 10:36:07', '', '0');
INSERT INTO `sys_menu` VALUES ('2', '1', '0,1,', '系统设置', '900', '', '', '', '1', '', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('20', '13', '0,1,2,13,', '用户管理', '20', '/sys/user/list', '', 'user', '1', 'sys:user:view', '1', '2013-05-27 08:00:00', '1', '2016-02-23 12:08:21', '', '0');
INSERT INTO `sys_menu` VALUES ('22', '20', '0,1,2,13,20,', '修改', '40', '', '', '', '0', 'sys:user:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('27', '1', '0,1,', '我的面板', '100', '', '', '', '1', '', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('28', '27', '0,1,27,', '个人信息', '30', '', '', '', '1', '', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('29', '28', '0,1,27,28,', '个人信息', '30', '/sys/user/info', '', 'user', '1', '', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('3', '2', '0,1,2,', '系统设置', '980', '', '', '', '1', '', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('30', '28', '0,1,27,28,', '修改密码', '40', '/sys/user/modifyPwd', '', 'lock', '1', '', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('3a4e9e8a95da4cc9921631e93aa0add5', '1', '0,1,', '会员管理', '5060', '/biz/member/bizMember', '', '', '1', 'biz:member', '1', '2018-01-31 22:45:55', '1', '2018-01-31 22:45:55', '会员管理', '0');
INSERT INTO `sys_menu` VALUES ('4', '3', '0,1,2,3,', '菜单管理', '40', '/sys/menu/', '', 'list-alt', '1', 'sys:menu:view', '1', '2013-05-27 08:00:00', '1', '2016-02-23 14:59:26', '', '0');
INSERT INTO `sys_menu` VALUES ('56', '71', '0,1,27,71,', '文件管理', '90', '/../static/ckfinder/ckfinder.html', '', 'folder-open', '1', '', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('57', '56', '0,1,27,40,56,', '查看', '30', '', '', '', '0', 'cms:ckfinder:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('58', '56', '0,1,27,40,56,', '上传', '40', '', '', '', '0', 'cms:ckfinder:upload', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('59', '56', '0,1,27,40,56,', '修改', '50', '', '', '', '0', 'cms:ckfinder:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('6', '4', '0,1,2,3,4,', '修改', '40', '', '', '', '0', 'sys:menu:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('6536d4881c4a47059206421e19b086c1', '1', '0,1,', '门店管理', '5030', '/biz/store/bizStore', '', '', '1', 'biz:store', '1', '2018-01-31 22:28:27', '1', '2018-01-31 22:28:27', '门店', '0');
INSERT INTO `sys_menu` VALUES ('67', '2', '0,1,2,', '日志查询', '985', '', '', '', '1', '', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('68', '67', '0,1,2,67,', '日志查询', '30', '/sys/log', '', 'pencil', '1', 'sys:log:view', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('7', '3', '0,1,2,3,', '角色管理', '30', '/sys/role/', '', 'lock', '1', 'sys:role:view', '1', '2013-05-27 08:00:00', '1', '2016-02-23 14:58:48', '', '0');
INSERT INTO `sys_menu` VALUES ('71', '27', '0,1,27,', '文件管理', '90', '', '', '', '1', '', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('79', '1', '0,1,', '代码生成', '5000', null, null, null, '1', null, '1', '2013-10-16 08:00:00', '1', '2013-10-16 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('8', '7', '0,1,2,3,7,', '查看', '30', null, null, null, '0', 'sys:role:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('80', '79', '0,1,79,', '代码生成', '50', null, null, null, '1', null, '1', '2013-10-16 08:00:00', '1', '2013-10-16 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('81', '80', '0,1,79,80,', '生成方案配置', '30', '/gen/genScheme', null, null, '1', 'gen:genScheme:view,gen:genScheme:edit', '1', '2013-10-16 08:00:00', '1', '2013-10-16 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('82', '80', '0,1,79,80,', '业务表配置', '20', '/gen/genTable', null, null, '1', 'gen:genTable:view,gen:genTable:edit,gen:genTableColumn:view,gen:genTableColumn:edit', '1', '2013-10-16 08:00:00', '1', '2013-10-16 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('83', '80', '0,1,79,80,', '代码模板管理', '90', '/gen/genTemplate', null, null, '1', 'gen:genTemplate:view,gen:genTemplate:edit', '1', '2013-10-16 08:00:00', '1', '2013-10-16 08:00:00', null, '1');
INSERT INTO `sys_menu` VALUES ('84', '67', '0,1,2,67,', '连接池监视', '40', '/../druid', '', '', '1', '', '1', '2013-10-18 08:00:00', '1', '2013-10-18 08:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('9', '7', '0,1,2,3,7,', '修改', '40', '', '', '', '0', 'sys:role:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '', '0');

-- ----------------------------
-- Table structure for sys_office
-- ----------------------------
DROP TABLE IF EXISTS `sys_office`;
CREATE TABLE `sys_office` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `parent_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) COLLATE utf8_bin NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `area_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '归属区域',
  `code` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '区域编码',
  `type` char(1) COLLATE utf8_bin NOT NULL COMMENT '机构类型',
  `grade` char(1) COLLATE utf8_bin NOT NULL COMMENT '机构等级',
  `address` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '联系地址',
  `zip_code` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '邮政编码',
  `master` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '负责人',
  `phone` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '电话',
  `fax` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '传真',
  `email` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱',
  `USEABLE` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '是否启用',
  `PRIMARY_PERSON` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '主负责人',
  `DEPUTY_PERSON` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '副负责人',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_office_parent_id` (`parent_id`),
  KEY `sys_office_del_flag` (`del_flag`),
  KEY `sys_office_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='机构表';

-- ----------------------------
-- Records of sys_office
-- ----------------------------
INSERT INTO `sys_office` VALUES ('1', '0', '0,', '山东省总公司', '10', '2', '100000', '1', '1', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('10', '7', '0,1,7,', '市场部', '30', '3', '200003', '2', '2', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('11', '7', '0,1,7,', '技术部', '40', '3', '200004', '2', '2', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('12', '7', '0,1,7,', '历城区分公司', '0', '4', '201000', '1', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('13', '12', '0,1,7,12,', '公司领导', '10', '4', '201001', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('14', '12', '0,1,7,12,', '综合部', '20', '4', '201002', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('15', '12', '0,1,7,12,', '市场部', '30', '4', '201003', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('16', '12', '0,1,7,12,', '技术部', '40', '4', '201004', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('17', '7', '0,1,7,', '历下区分公司', '40', '5', '201010', '1', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('18', '17', '0,1,7,17,', '公司领导', '10', '5', '201011', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('19', '17', '0,1,7,17,', '综合部', '20', '5', '201012', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('2', '1', '0,1,', '公司领导', '10', '2', '100001', '2', '1', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('20', '17', '0,1,7,17,', '市场部', '30', '5', '201013', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('21', '17', '0,1,7,17,', '技术部', '40', '5', '201014', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('22', '7', '0,1,7,', '高新区分公司', '50', '6', '201010', '1', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('23', '22', '0,1,7,22,', '公司领导', '10', '6', '201011', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('24', '22', '0,1,7,22,', '综合部', '20', '6', '201012', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('25', '22', '0,1,7,22,', '市场部', '30', '6', '201013', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('26', '22', '0,1,7,22,', '技术部', '40', '6', '201014', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('3', '1', '0,1,', '综合部', '20', '2', '100002', '2', '1', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('4', '1', '0,1,', '市场部', '30', '2', '100003', '2', '1', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('5', '1', '0,1,', '技术部', '40', '2', '100004', '2', '1', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('6', '1', '0,1,', '研发部', '50', '2', '100005', '2', '1', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('7', '1', '0,1,', '济南市分公司', '20', '3', '200000', '1', '2', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('8', '7', '0,1,7,', '公司领导', '10', '3', '200001', '2', '2', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('9', '7', '0,1,7,', '综合部', '20', '3', '200002', '2', '2', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `office_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属机构',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '角色名称',
  `enname` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '英文名称',
  `role_type` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '角色类型',
  `data_scope` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '数据范围',
  `is_sys` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '是否系统数据',
  `useable` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '是否可用',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_role_del_flag` (`del_flag`),
  KEY `sys_role_enname` (`enname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', null, '系统管理员', null, null, '8', '1', '1', '1', '2016-02-22 16:47:16', '1', '2016-02-23 15:13:04', '', '0');
INSERT INTO `sys_role` VALUES ('2', null, '运营人员', null, null, '1', '1', '1', '1', '2016-02-22 16:37:23', '1', '2016-02-23 15:13:46', '', '0');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '角色编号',
  `menu_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '菜单编号',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色-菜单';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '10');
INSERT INTO `sys_role_menu` VALUES ('1', '12');
INSERT INTO `sys_role_menu` VALUES ('1', '13');
INSERT INTO `sys_role_menu` VALUES ('1', '2');
INSERT INTO `sys_role_menu` VALUES ('1', '20');
INSERT INTO `sys_role_menu` VALUES ('1', '22');
INSERT INTO `sys_role_menu` VALUES ('1', '27');
INSERT INTO `sys_role_menu` VALUES ('1', '28');
INSERT INTO `sys_role_menu` VALUES ('1', '29');
INSERT INTO `sys_role_menu` VALUES ('1', '3');
INSERT INTO `sys_role_menu` VALUES ('1', '30');
INSERT INTO `sys_role_menu` VALUES ('1', '4');
INSERT INTO `sys_role_menu` VALUES ('1', '56');
INSERT INTO `sys_role_menu` VALUES ('1', '57');
INSERT INTO `sys_role_menu` VALUES ('1', '58');
INSERT INTO `sys_role_menu` VALUES ('1', '59');
INSERT INTO `sys_role_menu` VALUES ('1', '6');
INSERT INTO `sys_role_menu` VALUES ('1', '67');
INSERT INTO `sys_role_menu` VALUES ('1', '68');
INSERT INTO `sys_role_menu` VALUES ('1', '7');
INSERT INTO `sys_role_menu` VALUES ('1', '71');
INSERT INTO `sys_role_menu` VALUES ('1', '84');
INSERT INTO `sys_role_menu` VALUES ('1', '9');
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '27');
INSERT INTO `sys_role_menu` VALUES ('2', '28');
INSERT INTO `sys_role_menu` VALUES ('2', '29');
INSERT INTO `sys_role_menu` VALUES ('2', '30');
INSERT INTO `sys_role_menu` VALUES ('2', '56');
INSERT INTO `sys_role_menu` VALUES ('2', '57');
INSERT INTO `sys_role_menu` VALUES ('2', '58');
INSERT INTO `sys_role_menu` VALUES ('2', '59');
INSERT INTO `sys_role_menu` VALUES ('2', '71');

-- ----------------------------
-- Table structure for sys_role_office
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_office`;
CREATE TABLE `sys_role_office` (
  `role_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '角色编号',
  `office_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '机构编号',
  PRIMARY KEY (`role_id`,`office_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_role_office
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `company_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '归属公司',
  `office_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '归属部门',
  `login_name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '登录名',
  `password` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '密码',
  `no` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '工号',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '姓名',
  `email` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '电话',
  `mobile` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '手机',
  `user_type` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '用户类型',
  `photo` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '用户头像',
  `login_ip` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `login_flag` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '是否可登录',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_user_login_name` (`login_name`),
  KEY `sys_user_update_date` (`update_date`),
  KEY `sys_user_del_flag` (`del_flag`),
  KEY `sys_user_office_id` (`office_id`) USING BTREE,
  KEY `sys_user_company_id` (`company_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '', '', 'admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', null, '超级管理员', null, '8675', '8675', '', '', '127.0.0.1', '2018-01-31 23:13:43', '1', '1', '2013-05-27 08:00:00', '1', '2016-02-23 15:19:13', '最高管理员', '0');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '用户编号',
  `role_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '角色编号',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户-角色';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('2', '1');
INSERT INTO `sys_user_role` VALUES ('3', '2');

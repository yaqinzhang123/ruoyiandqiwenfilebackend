/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 8.0.31 : Database - ry-vue
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ry-vue` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `ry-vue`;

/*Table structure for table `commonfile` */

DROP TABLE IF EXISTS `commonfile`;

CREATE TABLE `commonfile` (
  `common_file_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_file_id` bigint DEFAULT NULL COMMENT '用户文件id',
  PRIMARY KEY (`common_file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `commonfile` */

/*Table structure for table `file` */

DROP TABLE IF EXISTS `file`;

CREATE TABLE `file` (
  `file_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `create_time` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建时间',
  `create_user_id` bigint DEFAULT NULL COMMENT '创建用户id',
  `file_size` bigint DEFAULT NULL COMMENT '文件大小',
  `file_status` int DEFAULT NULL COMMENT '文件状态(0-失效，1-生效)',
  `file_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '文件url',
  `identifier` varchar(32) DEFAULT NULL COMMENT 'md5唯一标识',
  `modify_time` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '修改时间',
  `modify_user_id` bigint DEFAULT NULL COMMENT '修改用户id',
  `storage_type` int DEFAULT NULL COMMENT '存储类型',
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `file` */

insert  into `file`(`file_id`,`create_time`,`create_user_id`,`file_size`,`file_status`,`file_url`,`identifier`,`modify_time`,`modify_user_id`,`storage_type`) values ('1620348669259968512','2023-01-31 17:10:02',1,42944,1,'upload/20230131/24345aeb408c950c4c2946d2f030e03b.sql','24345aeb408c950c4c2946d2f030e03b',NULL,NULL,3),('1620348670040109056','2023-01-31 17:10:02',1,111900,1,'upload/20230131/b3b9b14749f1d8209df0853abad9fdf3.sql','b3b9b14749f1d8209df0853abad9fdf3',NULL,NULL,3),('1620651227794993152','2023-02-01 13:12:17',1,10573,1,'upload/20230201/66027dc82ed21478341f8c8b2cb90bea.xlsx','66027dc82ed21478341f8c8b2cb90bea',NULL,NULL,3),('1620670466832592896','2023-02-01 14:28:44',1,12357,1,'upload/20230201/3d9a0f4137cf2e88818e9d89df530fc8.png','3d9a0f4137cf2e88818e9d89df530fc8',NULL,NULL,3),('1621427293811687424','2023-02-03 16:36:06',101,406,1,'upload/20230203/fdcb5257fea91998f28c33b799d9b95a.txt','fdcb5257fea91998f28c33b799d9b95a',NULL,NULL,3),('1621427294470193152','2023-02-03 16:36:06',101,11776,1,'upload/20230203/fc6295cb1d5aa1f688233b298e24656c.doc','fc6295cb1d5aa1f688233b298e24656c',NULL,NULL,3),('1623884867333083136','2023-02-10 11:21:37',103,12800,1,'upload/20230210/12859a19bf6680b5393691f3277f64a7.doc','12859a19bf6680b5393691f3277f64a7',NULL,NULL,3),('1623978499331411968','2023-02-10 17:33:40',103,0,1,'upload/20230210/10354b1c-6037-494b-81bc-24107fb3a30b.docx','a0fc25383df14a409c892f8898f90e52',NULL,NULL,3),('1625693341780041728','2023-02-15 11:07:51',2,65695,1,'upload/20230215/0aedd2523ea2a7600500205ef7d89fb1.sql','0aedd2523ea2a7600500205ef7d89fb1',NULL,NULL,3),('1625700143158558720','2023-02-15 11:34:52',1,305,1,'upload/20230215/eff3dc3bbf23ffd11e0108b81314b285.txt','eff3dc3bbf23ffd11e0108b81314b285',NULL,NULL,3),('1625700143326330880','2023-02-15 11:34:52',1,0,1,'upload/20230215/d41d8cd98f00b204e9800998ecf8427e.png','d41d8cd98f00b204e9800998ecf8427e',NULL,NULL,3),('1625736358259884032','2023-02-15 13:58:47',1,576,1,'upload/20230215/9af4bc4b341ee1aed307ae333abf4bb1.txt','9af4bc4b341ee1aed307ae333abf4bb1',NULL,NULL,3),('1625751552822353920','2023-02-15 14:59:09',1,2944264,1,'upload/20230215/55ddee76fb3606c2eb9f7b223cb8b366.dwg','55ddee76fb3606c2eb9f7b223cb8b366',NULL,NULL,3),('1627474452092854272','2023-02-20 09:05:21',1,217650,1,'upload/20230220/56cf9c28e5dc1e2b940c53e68d932411.png','56cf9c28e5dc1e2b940c53e68d932411',NULL,NULL,3);

/*Table structure for table `fileclassification` */

DROP TABLE IF EXISTS `fileclassification`;

CREATE TABLE `fileclassification` (
  `file_classification_id` bigint NOT NULL AUTO_INCREMENT,
  `file_extend_name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '文件扩展名',
  `file_type_id` bigint DEFAULT NULL COMMENT '文件类型id',
  PRIMARY KEY (`file_classification_id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `fileclassification` */

insert  into `fileclassification`(`file_classification_id`,`file_extend_name`,`file_type_id`) values (1,'bmp',1),(2,'jpg',1),(3,'png',1),(4,'tif',1),(5,'gif',1),(6,'jpeg',1),(7,'doc',2),(8,'docx',2),(9,'docm',2),(10,'dot',2),(11,'dotx',2),(12,'dotm',2),(13,'odt',2),(14,'fodt',2),(15,'ott',2),(16,'rtf',2),(17,'txt',2),(18,'html',2),(19,'htm',2),(20,'mht',2),(21,'xml',2),(22,'pdf',2),(23,'djvu',2),(24,'fb2',2),(25,'epub',2),(26,'xps',2),(27,'xls',2),(28,'xlsx',2),(29,'xlsm',2),(30,'xlt',2),(31,'xltx',2),(32,'xltm',2),(33,'ods',2),(34,'fods',2),(35,'ots',2),(36,'csv',2),(37,'pps',2),(38,'ppsx',2),(39,'ppsm',2),(40,'ppt',2),(41,'pptx',2),(42,'pptm',2),(43,'pot',2),(44,'potx',2),(45,'potm',2),(46,'odp',2),(47,'fodp',2),(48,'otp',2),(49,'hlp',2),(50,'wps',2),(51,'java',2),(52,'js',2),(53,'css',2),(54,'json',2),(55,'avi',3),(56,'mp4',3),(57,'mpg',3),(58,'mov',3),(59,'swf',3),(60,'wav',4),(61,'aif',4),(62,'au',4),(63,'mp3',4),(64,'ram',4),(65,'wma',4),(66,'mmf',4),(67,'amr',4),(68,'aac',4),(69,'flac',4),(70,'md',2),(71,'markdown',2);

/*Table structure for table `fileextend` */

DROP TABLE IF EXISTS `fileextend`;

CREATE TABLE `fileextend` (
  `file_extend_name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `file_extend_desc` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '文件扩展名描述',
  `file_extend_img_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '文件扩展名预览图',
  PRIMARY KEY (`file_extend_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `fileextend` */

insert  into `fileextend`(`file_extend_name`,`file_extend_desc`,`file_extend_img_url`) values ('aac',NULL,NULL),('aif',NULL,NULL),('amr',NULL,NULL),('au',NULL,NULL),('avi',NULL,NULL),('bmp',NULL,NULL),('css',NULL,NULL),('csv',NULL,NULL),('djvu',NULL,NULL),('doc',NULL,NULL),('docm',NULL,NULL),('docx',NULL,NULL),('dot',NULL,NULL),('dotm',NULL,NULL),('dotx',NULL,NULL),('epub',NULL,NULL),('fb2',NULL,NULL),('flac',NULL,NULL),('fodp',NULL,NULL),('fods',NULL,NULL),('fodt',NULL,NULL),('gif',NULL,NULL),('hlp',NULL,NULL),('htm',NULL,NULL),('html',NULL,NULL),('java',NULL,NULL),('jpeg',NULL,NULL),('jpg',NULL,NULL),('js',NULL,NULL),('json',NULL,NULL),('mht',NULL,NULL),('mmf',NULL,NULL),('mov',NULL,NULL),('mp3',NULL,NULL),('mp4',NULL,NULL),('mpg',NULL,NULL),('odp',NULL,NULL),('ods',NULL,NULL),('odt',NULL,NULL),('otp',NULL,NULL),('ots',NULL,NULL),('ott',NULL,NULL),('pdf',NULL,NULL),('png',NULL,NULL),('pot',NULL,NULL),('potm',NULL,NULL),('potx',NULL,NULL),('pps',NULL,NULL),('ppsm',NULL,NULL),('ppsx',NULL,NULL),('ppt',NULL,NULL),('pptm',NULL,NULL),('pptx',NULL,NULL),('ram',NULL,NULL),('rtf',NULL,NULL),('swf',NULL,NULL),('tif',NULL,NULL),('txt',NULL,NULL),('wav',NULL,NULL),('wma',NULL,NULL),('wps',NULL,NULL),('xls',NULL,NULL),('xlsm',NULL,NULL),('xlsx',NULL,NULL),('xlt',NULL,NULL),('xltm',NULL,NULL),('xltx',NULL,NULL),('xml',NULL,NULL),('xps',NULL,NULL);

/*Table structure for table `filepermission` */

DROP TABLE IF EXISTS `filepermission`;

CREATE TABLE `filepermission` (
  `file_permission_id` bigint NOT NULL AUTO_INCREMENT,
  `common_file_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '共享文件id',
  `file_permission_code` int DEFAULT NULL COMMENT '用户对文件的权限码',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`file_permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `filepermission` */

/*Table structure for table `filetype` */

DROP TABLE IF EXISTS `filetype`;

CREATE TABLE `filetype` (
  `file_type_id` int NOT NULL,
  `file_type_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '文件类型名',
  `order_num` int DEFAULT NULL COMMENT '次序',
  PRIMARY KEY (`file_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `filetype` */

insert  into `filetype`(`file_type_id`,`file_type_name`,`order_num`) values (0,'全部',NULL),(1,'图片',NULL),(2,'文档',NULL),(3,'视频',NULL),(4,'音乐',NULL),(5,'其他',NULL);

/*Table structure for table `gen_table` */

DROP TABLE IF EXISTS `gen_table`;

CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) COLLATE utf8mb4_general_ci DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) COLLATE utf8mb4_general_ci DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='代码生成业务表';

/*Data for the table `gen_table` */

/*Table structure for table `gen_table_column` */

DROP TABLE IF EXISTS `gen_table_column`;

CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) COLLATE utf8mb4_general_ci DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='代码生成业务表字段';

/*Data for the table `gen_table_column` */

/*Table structure for table `global_config` */

DROP TABLE IF EXISTS `global_config`;

CREATE TABLE `global_config` (
  `config_id` int NOT NULL AUTO_INCREMENT,
  `config_name` varchar(255) DEFAULT NULL COMMENT '配置名称',
  `config_value` varchar(255) DEFAULT NULL COMMENT '配置值',
  `del_tag` int DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `server_name` varchar(255) DEFAULT NULL COMMENT '服务器名称',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `global_config` */

insert  into `global_config`(`config_id`,`config_name`,`config_value`,`del_tag`,`create_time`,`update_time`,`remark`,`server_name`) values (8,'Service_Addr','http://192.168.30.139',0,'2022-02-18 00:35:55','2022-02-18 00:38:06',NULL,'00-15-5D-6E-F9-D4'),(9,'Service_Pem',NULL,0,'2022-02-18 00:35:55','2022-02-18 00:38:06',NULL,'00-15-5D-6E-F9-D4'),(10,'Service_Pem_Key',NULL,0,'2022-02-18 00:35:55','2022-02-18 00:38:06',NULL,'00-15-5D-6E-F9-D4'),(11,'Gateway_Path','D:\\WebGis_Server_Manager-api\\bin\\nginx',0,'2022-02-18 00:35:55','2022-02-18 00:38:06',NULL,'00-15-5D-6E-F9-D4'),(12,'3dtile_Path','D:\\WebGis_Server_Manager-api\\bin\\3dtile\\3dtile.exe',0,'2022-02-18 00:35:55','2022-02-18 00:38:06',NULL,'00-15-5D-6E-F9-D4'),(13,'View_Addr','http://localhost:10105/view/',0,'2022-02-18 00:35:55','2022-02-18 00:38:06',NULL,'00-15-5D-6E-F9-D4'),(14,'Service_Addr','http://192.168.7.20',1,'2022-02-18 14:15:06','2022-02-18 14:15:06',NULL,'50-2F-9B-E4-7D-0C'),(15,'Service_Pem',NULL,1,'2022-02-18 14:15:06','2022-02-18 14:15:06',NULL,'50-2F-9B-E4-7D-0C'),(16,'Service_Pem_Key',NULL,1,'2022-02-18 14:15:07','2022-02-18 14:15:07',NULL,'50-2F-9B-E4-7D-0C'),(17,'Gateway_Path','E:\\Java_Space\\nginx-gui-master\\nginx',1,'2022-02-18 14:15:07','2022-02-18 14:15:07',NULL,'50-2F-9B-E4-7D-0C'),(18,'3dtile_Path','E:\\Java_Space\\nginx-gui-master\\3dtile\\3dtile.exe',1,'2022-02-18 14:15:07','2022-02-18 14:15:07',NULL,'50-2F-9B-E4-7D-0C'),(19,'View_Addr','http://localhost:10105/view/',1,'2022-02-18 14:15:08','2022-02-18 14:15:08',NULL,'50-2F-9B-E4-7D-0C'),(20,'Service_Addr','http://192.168.30.139',0,'2023-02-20 14:05:52','2023-02-20 14:05:52',NULL,'00-BE-43-89-77-FB'),(21,'Service_Pem',NULL,0,'2023-02-20 14:05:52','2023-02-20 14:05:52',NULL,'00-BE-43-89-77-FB'),(22,'Service_Pem_Key',NULL,0,'2023-02-20 14:05:52','2023-02-20 14:05:52',NULL,'00-BE-43-89-77-FB'),(23,'Gateway_Path','F:\\Yaqin\\java\\ruoyiandqiwenfilebackend\\nginx',0,'2023-02-20 14:05:52','2023-02-20 14:05:52',NULL,'00-BE-43-89-77-FB'),(24,'3dtile_Path','F:\\Yaqin\\java\\ruoyiandqiwenfilebackend\\3dtile\\3dtile.exe',0,'2023-02-20 14:05:53','2023-02-20 14:05:53',NULL,'00-BE-43-89-77-FB'),(25,'View_Addr','http://localhost:8088/view/',0,'2023-02-20 14:05:53','2023-02-20 14:05:53',NULL,'00-BE-43-89-77-FB');

/*Table structure for table `image` */

DROP TABLE IF EXISTS `image`;

CREATE TABLE `image` (
  `image_id` bigint NOT NULL AUTO_INCREMENT,
  `file_id` bigint DEFAULT NULL COMMENT '文件id',
  `image_height` int DEFAULT NULL COMMENT '图像的高',
  `image_width` int DEFAULT NULL COMMENT '图像的宽',
  PRIMARY KEY (`image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `image` */

insert  into `image`(`image_id`,`file_id`,`image_height`,`image_width`) values (3,1620348624892620800,258,540),(4,1620670466832592896,145,554);

/*Table structure for table `music` */

DROP TABLE IF EXISTS `music`;

CREATE TABLE `music` (
  `music_id` bigint NOT NULL AUTO_INCREMENT,
  `album` varchar(255) DEFAULT NULL,
  `album_artist` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `album_image` mediumblob,
  `artist` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `composer` varchar(255) DEFAULT NULL,
  `copyright` varchar(255) DEFAULT NULL,
  `encoder` varchar(255) DEFAULT NULL,
  `file_id` bigint DEFAULT NULL COMMENT '文件id',
  `genre` varchar(255) DEFAULT NULL,
  `lyrics` varchar(10000) DEFAULT NULL COMMENT '歌词',
  `original_artist` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `publicer` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `track` varchar(255) DEFAULT NULL,
  `track_length` float DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `year` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`music_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1613807525965398017 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `music` */

/*Table structure for table `notice` */

DROP TABLE IF EXISTS `notice`;

CREATE TABLE `notice` (
  `notice_id` bigint NOT NULL AUTO_INCREMENT,
  `content` longtext COMMENT 'html内容',
  `create_time` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建时间',
  `create_user_id` bigint DEFAULT NULL COMMENT '创建用户id',
  `is_long_valid_data` int DEFAULT NULL COMMENT '是否长期有效(0-否,1-是)',
  `markdown_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT 'markdown原文',
  `modify_time` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '修改时间',
  `modify_user_id` bigint DEFAULT NULL COMMENT '修改用户id',
  `platform` int DEFAULT NULL COMMENT '平台(1-社区,2-管理端,3-网盘,4-股票)',
  `title` varchar(100) NOT NULL COMMENT '标题',
  `valid_date_time` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '有效时间',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `notice` */

/*Table structure for table `operationlog` */

DROP TABLE IF EXISTS `operationlog`;

CREATE TABLE `operationlog` (
  `operation_log_id` bigint NOT NULL AUTO_INCREMENT,
  `detail` varchar(100) DEFAULT NULL COMMENT '操作详情',
  `log_level` int DEFAULT NULL,
  `operation` varchar(50) DEFAULT NULL COMMENT '操作',
  `operation_obj` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `platform` int DEFAULT NULL COMMENT '平台(1-社区,2-管理端,3-网盘,4-股票)',
  `request_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `request_uRI` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `result` varchar(20) DEFAULT NULL COMMENT '操作结果',
  `source` varchar(255) DEFAULT NULL,
  `terminal` varchar(20) DEFAULT NULL COMMENT '终端ip地址',
  `time` varchar(25) DEFAULT NULL COMMENT '操作时间',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`operation_log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `operationlog` */

/*Table structure for table `picturefile` */

DROP TABLE IF EXISTS `picturefile`;

CREATE TABLE `picturefile` (
  `picture_file_id` bigint NOT NULL AUTO_INCREMENT,
  `create_time` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建时间',
  `create_user_id` bigint DEFAULT NULL COMMENT '创建用户id',
  `extend_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '扩展名',
  `file_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '文件名',
  `file_size` bigint DEFAULT NULL COMMENT '文件大小',
  `file_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '文件url',
  `modify_time` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '修改时间',
  `modify_user_id` bigint DEFAULT NULL COMMENT '修改用户id',
  `storage_type` int DEFAULT NULL COMMENT '存储类型',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`picture_file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `picturefile` */

/*Table structure for table `project` */

DROP TABLE IF EXISTS `project`;

CREATE TABLE `project` (
  `project_id` bigint NOT NULL AUTO_INCREMENT,
  `project_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `project_port` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `project_type` int DEFAULT NULL COMMENT '项目类型：1、倾斜摄影，2、Revit模型，3、3Dmax模型，4、矢量数据，5、三维部件，6、全景影像，0、其他',
  `project_desc` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `del_tag` int DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `version` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `project_filename` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '项目文件名',
  `project_no` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '项目编号',
  `switch_tag` int DEFAULT '0' COMMENT '0:开，1：关',
  PRIMARY KEY (`project_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

/*Data for the table `project` */

insert  into `project`(`project_id`,`project_name`,`project_port`,`project_type`,`project_desc`,`user_id`,`del_tag`,`create_time`,`update_time`,`version`,`project_filename`,`project_no`,`switch_tag`) values (36,'服务器测试','10106',1,'6666',1,0,'2022-02-18 15:42:35','2023-02-21 11:07:45',NULL,NULL,'21217768',0),(40,'测试10107端口1','10107',1,'10107',1,0,'2022-02-18 14:50:31','2023-02-21 08:46:18',NULL,NULL,'68674187',0),(50,'122','121',1,'212',1,0,'2023-02-23 09:52:08','2023-02-23 15:26:04',NULL,NULL,'28008801',0);

/*Table structure for table `recoveryfile` */

DROP TABLE IF EXISTS `recoveryfile`;

CREATE TABLE `recoveryfile` (
  `recovery_file_id` bigint NOT NULL AUTO_INCREMENT,
  `delete_batch_num` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '删除批次号',
  `delete_time` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '删除时间',
  `user_file_id` bigint DEFAULT NULL COMMENT '用户文件id',
  PRIMARY KEY (`recovery_file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `recoveryfile` */

insert  into `recoveryfile`(`recovery_file_id`,`delete_batch_num`,`delete_time`,`user_file_id`) values (39,'34b03123-334a-4bbe-93b6-a80c15ac8385','2023-01-16 09:37:43',1613826496668143616),(40,'b449d765-e0ad-4452-8839-2e51a3a1980f','2023-01-16 09:37:47',1613832647879200768),(41,'6bfda112-3e45-4896-89bc-d386dee95c63','2023-01-16 09:37:53',1613826337225871360),(42,'d434ef4f-a416-4bd4-9d4a-26a1f3ceffab','2023-01-19 16:19:34',1614792894026387456),(43,'46e79fae-dae7-4453-8ffb-1b225792d1e1','2023-01-19 16:43:37',1615987363258056704),(44,'0288a96e-b7bb-4c46-bdaa-d7ce84ceca8a','2023-01-19 17:08:25',1615993463579643904),(45,'d09fb031-e87f-43f9-9a13-0f2f81128fd5','2023-01-28 09:52:57',1619129207038939136),(46,'f7350cdf-6160-4ed1-8029-304045134a62','2023-01-28 09:53:05',1616006903010430976),(47,'c46a0bbd-5f0f-4ec4-9c7d-43c8e480969a','2023-01-28 09:53:51',1619150472474902528),(48,'ad436c30-3cbc-44dc-a8e2-5905c17b81d5','2023-01-28 09:54:03',1619131822401392640),(49,'5ddaab6f-3faf-44b9-9d23-95244058be25','2023-01-28 09:55:53',1619131633011789824),(50,'7c8d9230-1a06-40c4-8c9e-f50b21f43ef2','2023-01-28 09:56:03',1614781503664091136),(51,'42e3e40e-ce6a-4bac-9df4-9a99649f0ea7','2023-01-28 09:56:07',1616006434041106432),(52,'67ea0583-0273-4159-acf1-723f0d479e9e','2023-01-28 09:56:10',1614797538366623744),(53,'abd0226b-9948-40fc-a50d-805f3370c9a9','2023-01-28 09:56:14',1615999648265453568),(54,'27285dec-a0b2-48f0-a6ae-483985c8f884','2023-01-29 15:44:28',1619152473380208640),(55,'d605ef7b-9910-473c-aa55-e015df244770','2023-01-29 15:44:29',1619152417029734400),(56,'08b84baf-2774-4f50-86ba-2e7f69d83125','2023-01-29 15:44:29',1619156434740953088),(57,'2ceb1965-f37f-43d8-9fee-4dbf5d17cb17','2023-01-29 15:44:29',1619153296529145856),(58,'5e87006e-2bfb-4836-aecb-8f463b1a0dc7','2023-01-29 15:44:29',1619152529281892352),(90,'ec6a6699-ef0d-428c-91c7-4e328aff1b23','2023-02-06 10:51:03',1621439353714941952),(91,'8babdb4b-d91e-4701-918e-ef2154b7405c','2023-02-06 10:57:37',1622428956773060608),(92,'b2a960e2-89e2-4dd1-87dd-ec0ab3c018ae','2023-02-06 10:58:53',1622429225418231808),(93,'462e0b6a-71d7-4ac9-af22-9277d9467dd2','2023-02-06 10:59:52',1622429196817272832),(94,'77aa6587-005a-4f38-af14-28bd47ad4df9','2023-02-06 11:02:39',1622430230490910720),(95,'729fdcaf-90c9-4399-a270-9d6abb53cae3','2023-02-10 11:25:01',1623883211296034816),(115,'9aaad9f0-c9b7-4ddf-abf0-a0a619777c23','2023-02-15 11:39:08',1625700181913927680),(116,'6ed536fd-47b2-45f4-be30-f6a6ee31f84c','2023-02-20 09:04:14',1625751552868491264);

/*Table structure for table `resource` */

DROP TABLE IF EXISTS `resource`;

CREATE TABLE `resource` (
  `resource_id` bigint NOT NULL AUTO_INCREMENT,
  `resource_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `resource_no` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `resource_down_url` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `resource_api_url` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `resource_share_url` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `resource_status` int DEFAULT '1' COMMENT '1：文件解压中，2：文件转换中，3：转换完成',
  `del_tag` int DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `version` int DEFAULT NULL,
  `project_id` bigint DEFAULT NULL,
  `resource_path` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '文件路径',
  PRIMARY KEY (`resource_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

/*Data for the table `resource` */

insert  into `resource`(`resource_id`,`resource_name`,`resource_no`,`resource_down_url`,`resource_api_url`,`resource_share_url`,`resource_status`,`del_tag`,`create_time`,`update_time`,`version`,`project_id`,`resource_path`) values (183,'osgb_test.zip','bbdc81ceb61d47fcbb41b2514f708b6c','10106\\bbdc81ceb61d47fcbb41b2514f708b6c.zip','10106\\bbdc81ceb61d47fcbb41b2514f708b6c','?port=10106&fileid=bbdc81ceb61d47fcbb41b2514f708b6c',3,1,'2022-02-18 00:43:36','2022-02-18 15:14:33',NULL,36,'D:\\WebGis_Server_Manager-api\\bin\\nginx\\36-21217768\\bbdc81ceb61d47fcbb41b2514f708b6c.zip'),(184,'osgb_test.zip','672962b9408544838354f616478221bd','10106\\672962b9408544838354f616478221bd.zip','10106\\672962b9408544838354f616478221bd','?port=10106&fileid=672962b9408544838354f616478221bd',3,0,'2022-02-18 00:44:26','2022-02-18 00:44:51',NULL,36,'D:\\WebGis_Server_Manager-api\\bin\\nginx\\36-21217768\\672962b9408544838354f616478221bd.zip'),(185,'完整数据.zip','77b3cef3c7114790a99304e6392700a4','10106\\77b3cef3c7114790a99304e6392700a4.zip','10106\\77b3cef3c7114790a99304e6392700a4','?port=10106&fileid=77b3cef3c7114790a99304e6392700a4/osgbdata',3,0,'2022-02-18 01:13:34','2022-02-18 01:40:56',NULL,36,'D:\\WebGis_Server_Manager-api\\bin\\nginx\\36-21217768\\77b3cef3c7114790a99304e6392700a4.zip'),(186,'osgb_test.zip','8f0a62f6e26f415d8107755e169dffcb','10106\\8f0a62f6e26f415d8107755e169dffcb.zip','10106\\8f0a62f6e26f415d8107755e169dffcb\\osgb\\tileset.json','?port=10106&fileid=8f0a62f6e26f415d8107755e169dffcb/osgb',3,1,'2022-02-18 14:26:00','2022-02-18 15:13:58',NULL,36,'E:\\Java_Space\\nginx-gui-master\\nginx\\36-21217768\\8f0a62f6e26f415d8107755e169dffcb.zip'),(188,'osgb_test.zip','76faa89cc4fb46cf8b7cae97bc5c9843','10106\\76faa89cc4fb46cf8b7cae97bc5c9843.zip','10106\\76faa89cc4fb46cf8b7cae97bc5c9843/osgb\\tileset.json','?port=10106&fileid=76faa89cc4fb46cf8b7cae97bc5c9843/osgb',3,1,'2022-02-18 15:03:55','2022-02-18 15:13:31',NULL,36,'E:\\Java_Space\\nginx-gui-master\\nginx\\36-21217768\\76faa89cc4fb46cf8b7cae97bc5c9843.zip'),(190,'osgb.zip','514710a0a3ce497f957f366a3709de46','10106\\514710a0a3ce497f957f366a3709de46.zip','10106\\514710a0a3ce497f957f366a3709de46/osgb\\tileset.json','?port=10106&fileid=514710a0a3ce497f957f366a3709de46/osgb',3,0,'2022-02-18 15:12:08','2022-02-18 15:12:25',NULL,36,'D:\\WebGis_Server_Manager-api\\bin\\nginx\\36-21217768\\514710a0a3ce497f957f366a3709de46.zip'),(191,'新建 DOC 文档.doc','ad489f46b5a64139a523b96320ee9869','10106\\ad489f46b5a64139a523b96320ee9869.doc','10106','?port=10106&fileid=',1,1,'2023-02-22 18:02:44','2023-02-23 08:45:58',NULL,36,'F:\\Yaqin\\java\\ruoyiandqiwenfilebackend\\nginx\\36-21217768\\ad489f46b5a64139a523b96320ee9869.doc'),(192,'新建 DOC 文档.doc','04c8270973094f6da95f7ecbc8e4de71','121\\04c8270973094f6da95f7ecbc8e4de71.doc','121','?port=121&fileid=',1,1,'2023-02-23 09:52:52','2023-02-24 08:50:53',NULL,50,'F:\\Yaqin\\java\\ruoyiandqiwenfilebackend\\nginx\\50-28008801\\04c8270973094f6da95f7ecbc8e4de71.doc'),(193,'BlockBBBBA_L19_18.rar','a7ac1e11e40a479f929c356b2173a087','121\\a7ac1e11e40a479f929c356b2173a087.rar','121','?port=121&fileid=',1,1,'2023-02-23 15:38:53','2023-02-24 08:50:51',NULL,50,'F:\\Yaqin\\java\\ruoyiandqiwenfilebackend\\nginx\\50-28008801\\a7ac1e11e40a479f929c356b2173a087.rar'),(194,'BlockBBBBA_L19_18.rar','d01f60c7a6334e2fbb0d80afdf4a40d3','10106\\d01f60c7a6334e2fbb0d80afdf4a40d3.rar','10106','?port=10106&fileid=',1,1,'2023-02-23 17:15:56','2023-02-23 17:26:38',NULL,36,'F:\\Yaqin\\java\\ruoyiandqiwenfilebackend\\nginx\\36-21217768\\d01f60c7a6334e2fbb0d80afdf4a40d3.rar'),(195,'BlockBBBBA_L19_18.rar','84cb92636408433394f62a9382cd1319','10106\\84cb92636408433394f62a9382cd1319.rar','10106','?port=10106&fileid=',1,1,'2023-02-23 17:28:10','2023-02-23 17:30:27',NULL,36,'F:\\Yaqin\\java\\ruoyiandqiwenfilebackend\\nginx\\36-21217768\\84cb92636408433394f62a9382cd1319.rar'),(196,'BlockBBBBA_L19_18.zip','9ef80614f1b442a283bd31f5dfb38f34','10106\\9ef80614f1b442a283bd31f5dfb38f34.zip','10106','?port=10106&fileid=',1,1,'2023-02-23 17:30:58','2023-02-23 17:41:49',NULL,36,'F:\\Yaqin\\java\\ruoyiandqiwenfilebackend\\nginx\\36-21217768\\9ef80614f1b442a283bd31f5dfb38f34.zip'),(197,'BlockBBBBA_L19_18.zip','e7074b2b88c443cb8d392a33db216f4a','10106\\e7074b2b88c443cb8d392a33db216f4a.zip','10106','?port=10106&fileid=',1,1,'2023-02-23 17:42:20','2023-02-23 18:00:04',NULL,36,'F:\\Yaqin\\java\\ruoyiandqiwenfilebackend\\nginx\\36-21217768\\e7074b2b88c443cb8d392a33db216f4a.zip'),(198,'BlockBBBBA_L19_18.zip','4e00b7e8dd184c6383935fe35733b567','10106\\4e00b7e8dd184c6383935fe35733b567.zip','10106','?port=10106&fileid=',1,1,'2023-02-23 18:01:01','2023-02-24 08:23:19',NULL,36,'F:\\Yaqin\\java\\ruoyiandqiwenfilebackend\\nginx\\36-21217768\\4e00b7e8dd184c6383935fe35733b567.zip'),(199,'BlockBBBBA_L19_18.zip','5137a279cefb410da760c825f9cf1be1','10106\\5137a279cefb410da760c825f9cf1be1.zip','10106','?port=10106&fileid=',1,1,'2023-02-24 08:23:34','2023-02-24 08:30:05',NULL,36,'F:\\Yaqin\\java\\ruoyiandqiwenfilebackend\\nginx\\36-21217768\\5137a279cefb410da760c825f9cf1be1.zip'),(200,'BlockBBBBA_L19_18.zip','98027a7e67c8494badfff26b9bd2c267','10106\\98027a7e67c8494badfff26b9bd2c267.zip','10106','?port=10106&fileid=',1,1,'2023-02-24 08:30:17','2023-02-24 08:50:28',NULL,36,'F:\\Yaqin\\java\\ruoyiandqiwenfilebackend\\nginx\\36-21217768\\98027a7e67c8494badfff26b9bd2c267.zip'),(201,'BlockBBBBA_L19_18.zip','ff869779f2af4b50803a0473aef670b6','10106\\ff869779f2af4b50803a0473aef670b6.zip','10106','?port=10106&fileid=',1,1,'2023-02-24 08:51:06','2023-02-24 09:55:50',NULL,36,'F:\\Yaqin\\java\\ruoyiandqiwenfilebackend\\nginx\\36-21217768\\ff869779f2af4b50803a0473aef670b6.zip'),(202,'BlockBBBBA_L19_18.zip','54a22bab94dd43e1b046cfc7b83e2ca5','121\\54a22bab94dd43e1b046cfc7b83e2ca5.zip','121','?port=121&fileid=',1,1,'2023-02-24 08:53:38','2023-02-24 08:54:35',NULL,50,'F:\\Yaqin\\java\\ruoyiandqiwenfilebackend\\nginx\\50-28008801\\54a22bab94dd43e1b046cfc7b83e2ca5.zip'),(203,'BlockBBBBA_L19_18.zip','9f8400aefd0a4859b7cc0c7f3bdd8f25','10106\\9f8400aefd0a4859b7cc0c7f3bdd8f25.zip','10106','?port=10106&fileid=',1,1,'2023-02-24 08:53:38','2023-02-24 09:55:48',NULL,36,'F:\\Yaqin\\java\\ruoyiandqiwenfilebackend\\nginx\\36-21217768\\9f8400aefd0a4859b7cc0c7f3bdd8f25.zip'),(204,'BlockBBBBA_L19_18.zip','72bb08d53f824cc0a37a606e41509095','121\\72bb08d53f824cc0a37a606e41509095.zip','121','?port=121&fileid=',1,0,'2023-02-24 08:54:44','2023-02-24 08:54:44',NULL,50,'F:\\Yaqin\\java\\ruoyiandqiwenfilebackend\\nginx\\50-28008801\\72bb08d53f824cc0a37a606e41509095.zip'),(205,'BlockBBBBA_L19_18.zip','11739afa81f342b185ffda7cf71d13aa','121\\11739afa81f342b185ffda7cf71d13aa.zip','121','?port=121&fileid=',1,0,'2023-02-24 08:57:07','2023-02-24 08:57:07',NULL,50,'F:\\Yaqin\\java\\ruoyiandqiwenfilebackend\\nginx\\50-28008801\\11739afa81f342b185ffda7cf71d13aa.zip'),(206,'osgb.zip','472db9cf45b24b5cbf59bbcc0fd4f7df','121\\472db9cf45b24b5cbf59bbcc0fd4f7df.zip','121','?port=121&fileid=',1,0,'2023-02-24 09:36:36','2023-02-24 09:36:36',NULL,50,'F:\\Yaqin\\java\\ruoyiandqiwenfilebackend\\nginx\\50-28008801\\472db9cf45b24b5cbf59bbcc0fd4f7df.zip'),(207,'osgb.zip','f4cab51e5b8245dfad2ce64d82412c2e','10106\\f4cab51e5b8245dfad2ce64d82412c2e.zip','10106','?port=10106&fileid=',1,1,'2023-02-24 09:48:11','2023-02-24 09:55:46',NULL,36,'F:\\Yaqin\\java\\ruoyiandqiwenfilebackend\\nginx\\36-21217768\\f4cab51e5b8245dfad2ce64d82412c2e.zip'),(208,'o.zip','7d51b4361b4345ce994d38ca93f1ad7e','10106\\7d51b4361b4345ce994d38ca93f1ad7e.zip','10106','?port=10106&fileid=',1,1,'2023-02-24 10:21:33','2023-02-24 10:21:33',NULL,36,'F:\\Yaqin\\java\\ruoyiandqiwenfilebackend\\nginx\\36-21217768\\7d51b4361b4345ce994d38ca93f1ad7e.zip'),(209,'test.zip','b241c6ee005d4a3c8cd93c95c18bf12d','10106\\b241c6ee005d4a3c8cd93c95c18bf12d.zip','10106\\b241c6ee005d4a3c8cd93c95c18bf12d/test\\tileset.json','?port=10106&fileid=b241c6ee005d4a3c8cd93c95c18bf12d/test',3,0,'2023-02-24 10:42:52','2023-02-24 10:42:52',NULL,36,'F:\\Yaqin\\java\\ruoyiandqiwenfilebackend\\nginx\\36-21217768\\b241c6ee005d4a3c8cd93c95c18bf12d.zip'),(210,'Bl.zip','fbbd60038f044db5956ee77801c37e2d','10106\\fbbd60038f044db5956ee77801c37e2d.zip','10106','?port=10106&fileid=',1,1,'2023-02-24 10:43:40','2023-02-24 10:43:40',NULL,36,'F:\\Yaqin\\java\\ruoyiandqiwenfilebackend\\nginx\\36-21217768\\fbbd60038f044db5956ee77801c37e2d.zip'),(211,'o.zip','0761b6c11ab54b39bc7dc2803979a3fc','10106\\0761b6c11ab54b39bc7dc2803979a3fc.zip','10106\\0761b6c11ab54b39bc7dc2803979a3fc/osgb\\tileset.json','?port=10106&fileid=0761b6c11ab54b39bc7dc2803979a3fc/osgb',3,0,'2023-02-24 11:10:50','2023-02-24 11:10:50',NULL,36,'F:\\Yaqin\\java\\ruoyiandqiwenfilebackend\\nginx\\36-21217768\\0761b6c11ab54b39bc7dc2803979a3fc.zip'),(212,'terra_osgbs.zip','3e0bb36419b9467d9ab3f35eb34b19e4','121\\3e0bb36419b9467d9ab3f35eb34b19e4.zip','121','?port=121&fileid=',3,0,'2023-02-24 13:09:01','2023-02-24 13:09:01',NULL,50,'F:\\Yaqin\\java\\ruoyiandqiwenfilebackend\\nginx\\50-28008801\\3e0bb36419b9467d9ab3f35eb34b19e4.zip'),(213,'terra_osgbs.zip','ace2c03ec76340e8a7593e274a39993c','10107\\ace2c03ec76340e8a7593e274a39993c.zip','10107','?port=10107&fileid=',3,1,'2023-02-24 13:33:55','2023-02-24 13:33:55',NULL,40,'F:\\Yaqin\\java\\ruoyiandqiwenfilebackend\\nginx\\40-68674187\\ace2c03ec76340e8a7593e274a39993c.zip'),(214,'terra_osgbs.zip','97d5cc46c0684664aa0b3426c8926a93','10107\\97d5cc46c0684664aa0b3426c8926a93.zip','10107\\97d5cc46c0684664aa0b3426c8926a93/terra_osgbs\\tileset.json','?port=10107&fileid=97d5cc46c0684664aa0b3426c8926a93/terra_osgbs',3,0,'2023-02-24 13:57:11','2023-02-24 13:57:11',NULL,40,'F:\\Yaqin\\java\\ruoyiandqiwenfilebackend\\nginx\\40-68674187\\97d5cc46c0684664aa0b3426c8926a93.zip');

/*Table structure for table `share` */

DROP TABLE IF EXISTS `share`;

CREATE TABLE `share` (
  `share_id` bigint NOT NULL AUTO_INCREMENT,
  `end_time` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '失效时间',
  `extraction_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '提取码',
  `share_batch_num` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '分享批次号',
  `share_status` int DEFAULT NULL COMMENT '分享状态(0正常,1已失效,2已撤销)',
  `share_time` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '分享时间',
  `share_type` int DEFAULT NULL COMMENT '分享类型(0公共,1私密,2好友)',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`share_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `share` */

insert  into `share`(`share_id`,`end_time`,`extraction_code`,`share_batch_num`,`share_status`,`share_time`,`share_type`,`user_id`) values (2,'2023-01-20 00:00:00',NULL,'87d9ef004b2b45b9aab7a83788126d31',0,'2023-01-13 17:14:58',0,1),(3,'2023-01-14 00:00:00','187606','c281667191334c9483f7483852663262',0,'2023-01-13 17:23:56',1,1),(4,'2023-02-01 00:00:00',NULL,'281ba559d3134235b037e1e4e844df0a',0,'2023-02-01 13:11:02',0,1),(5,'2023-02-02 00:00:00',NULL,'ac93bf525a64458986196acb0f552528',0,'2023-02-01 17:34:23',0,1),(6,'2023-02-16 00:00:00',NULL,'bff4a755ecbf463a9f56ea46f615afcd',0,'2023-02-15 11:42:04',0,1),(7,'2023-02-15 11:44:27',NULL,'4a9acf231d204675b95af4de790dd36c',0,'2023-02-15 11:43:35',0,1),(8,'2023-02-20 09:06:31',NULL,'d270542a466249a9848a51d93998f741',0,'2023-02-20 09:05:47',0,1);

/*Table structure for table `sharefile` */

DROP TABLE IF EXISTS `sharefile`;

CREATE TABLE `sharefile` (
  `share_file_id` bigint NOT NULL AUTO_INCREMENT,
  `share_batch_num` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '分享批次号',
  `share_file_path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '分享文件路径',
  `user_file_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '用户文件id',
  PRIMARY KEY (`share_file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `sharefile` */

insert  into `sharefile`(`share_file_id`,`share_batch_num`,`share_file_path`,`user_file_id`) values (3,'87d9ef004b2b45b9aab7a83788126d31','/','1613826337225871360'),(4,'c281667191334c9483f7483852663262','/','1613826496668143616'),(5,'281ba559d3134235b037e1e4e844df0a','/','1620606318761295872'),(6,'ac93bf525a64458986196acb0f552528','/','1620716670874300416'),(7,'bff4a755ecbf463a9f56ea46f615afcd','/','1625700736338001920'),(8,'4a9acf231d204675b95af4de790dd36c','/','1625700143359885312'),(9,'d270542a466249a9848a51d93998f741','/','1627474452151574528');

/*Table structure for table `storage` */

DROP TABLE IF EXISTS `storage`;

CREATE TABLE `storage` (
  `storage_id` bigint NOT NULL AUTO_INCREMENT,
  `modify_time` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '修改时间',
  `modify_user_id` bigint DEFAULT NULL COMMENT '修改用户id',
  `storage_size` bigint DEFAULT NULL COMMENT '占用存储大小',
  `total_storage_size` bigint DEFAULT NULL COMMENT '总存储大小',
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`storage_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `storage` */

insert  into `storage`(`storage_id`,`modify_time`,`modify_user_id`,`storage_size`,`total_storage_size`,`user_id`) values (1,NULL,NULL,NULL,1024,2),(2,NULL,NULL,NULL,1024,0),(3,NULL,NULL,NULL,1024,1),(4,NULL,NULL,NULL,1024,101),(5,NULL,NULL,NULL,10240,100),(6,NULL,NULL,NULL,10240,102),(7,NULL,NULL,NULL,10240,103),(8,NULL,NULL,NULL,10240,107);

/*Table structure for table `sys_config` */

DROP TABLE IF EXISTS `sys_config`;

CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) COLLATE utf8mb4_general_ci DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='参数配置表';

/*Data for the table `sys_config` */

insert  into `sys_config`(`config_id`,`config_name`,`config_key`,`config_value`,`config_type`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2022-12-30 11:51:15','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2022-12-30 11:51:15','',NULL,'初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2022-12-30 11:51:15','',NULL,'深色主题theme-dark，浅色主题theme-light'),(4,'账号自助-验证码开关','sys.account.captchaEnabled','true','Y','admin','2022-12-30 11:51:15','',NULL,'是否开启验证码功能（true开启，false关闭）'),(5,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2022-12-30 11:51:15','',NULL,'是否开启注册用户功能（true开启，false关闭）'),(6,'用户登录-黑名单列表',           'sys.login.blackIPList',         '',              'Y', 'admin', sysdate(), '', null, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

/*Table structure for table `sys_dept` */

DROP TABLE IF EXISTS `sys_dept`;

CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='部门表';

/*Data for the table `sys_dept` */

insert  into `sys_dept`(`dept_id`,`parent_id`,`ancestors`,`dept_name`,`order_num`,`leader`,`phone`,`email`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`) values (100,0,'0','若依科技',0,'若依','15888888888','ry@qq.com','0','0','admin','2022-12-30 11:51:15','',NULL),(101,100,'0,100','深圳总公司',1,'若依','15888888888','ry@qq.com','0','0','admin','2022-12-30 11:51:15','',NULL),(102,100,'0,100','长沙分公司',2,'若依','15888888888','ry@qq.com','0','0','admin','2022-12-30 11:51:15','',NULL),(103,101,'0,100,101','研发部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2022-12-30 11:51:15','',NULL),(104,101,'0,100,101','市场部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2022-12-30 11:51:15','',NULL),(105,101,'0,100,101','测试部门',3,'若依','15888888888','ry@qq.com','0','0','admin','2022-12-30 11:51:15','',NULL),(106,101,'0,100,101','财务部门',4,'若依','15888888888','ry@qq.com','0','0','admin','2022-12-30 11:51:15','',NULL),(107,101,'0,100,101','运维部门',5,'若依','15888888888','ry@qq.com','0','0','admin','2022-12-30 11:51:15','',NULL),(108,102,'0,100,102','市场部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2022-12-30 11:51:15','',NULL),(109,102,'0,100,102','财务部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2022-12-30 11:51:15','',NULL);

/*Table structure for table `sys_dict_data` */

DROP TABLE IF EXISTS `sys_dict_data`;

CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) COLLATE utf8mb4_general_ci DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='字典数据表';

/*Data for the table `sys_dict_data` */

insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,1,'男','0','sys_user_sex','','','Y','0','admin','2022-12-30 11:51:15','',NULL,'性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2022-12-30 11:51:15','',NULL,'性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2022-12-30 11:51:15','',NULL,'性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2022-12-30 11:51:15','',NULL,'显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2022-12-30 11:51:15','',NULL,'隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2022-12-30 11:51:15','',NULL,'正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2022-12-30 11:51:15','',NULL,'停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2022-12-30 11:51:15','',NULL,'正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2022-12-30 11:51:15','',NULL,'停用状态'),(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2022-12-30 11:51:15','',NULL,'默认分组'),(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2022-12-30 11:51:15','',NULL,'系统分组'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2022-12-30 11:51:15','',NULL,'系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2022-12-30 11:51:15','',NULL,'系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2022-12-30 11:51:15','',NULL,'通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2022-12-30 11:51:15','',NULL,'公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2022-12-30 11:51:15','',NULL,'正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2022-12-30 11:51:15','',NULL,'关闭状态'),(18,99,'其他','0','sys_oper_type','','info','N','0','admin','2022-12-30 11:51:15','',NULL,'其他操作'),(19,1,'新增','1','sys_oper_type','','info','N','0','admin','2022-12-30 11:51:15','',NULL,'新增操作'),(20,2,'修改','2','sys_oper_type','','info','N','0','admin','2022-12-30 11:51:15','',NULL,'修改操作'),(21,3,'删除','3','sys_oper_type','','danger','N','0','admin','2022-12-30 11:51:15','',NULL,'删除操作'),(22,4,'授权','4','sys_oper_type','','primary','N','0','admin','2022-12-30 11:51:15','',NULL,'授权操作'),(23,5,'导出','5','sys_oper_type','','warning','N','0','admin','2022-12-30 11:51:15','',NULL,'导出操作'),(24,6,'导入','6','sys_oper_type','','warning','N','0','admin','2022-12-30 11:51:15','',NULL,'导入操作'),(25,7,'强退','7','sys_oper_type','','danger','N','0','admin','2022-12-30 11:51:15','',NULL,'强退操作'),(26,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2022-12-30 11:51:15','',NULL,'生成操作'),(27,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2022-12-30 11:51:15','',NULL,'清空操作'),(28,1,'成功','0','sys_common_status','','primary','N','0','admin','2022-12-30 11:51:15','',NULL,'正常状态'),(29,2,'失败','1','sys_common_status','','danger','N','0','admin','2022-12-30 11:51:15','',NULL,'停用状态');

/*Table structure for table `sys_dict_type` */

DROP TABLE IF EXISTS `sys_dict_type`;

CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='字典类型表';

/*Data for the table `sys_dict_type` */

insert  into `sys_dict_type`(`dict_id`,`dict_name`,`dict_type`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'用户性别','sys_user_sex','0','admin','2022-12-30 11:51:15','',NULL,'用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2022-12-30 11:51:15','',NULL,'菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2022-12-30 11:51:15','',NULL,'系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2022-12-30 11:51:15','',NULL,'任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2022-12-30 11:51:15','',NULL,'任务分组列表'),(6,'系统是否','sys_yes_no','0','admin','2022-12-30 11:51:15','',NULL,'系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2022-12-30 11:51:15','',NULL,'通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2022-12-30 11:51:15','',NULL,'通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2022-12-30 11:51:15','',NULL,'操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2022-12-30 11:51:15','',NULL,'登录状态列表');

/*Table structure for table `sys_file_record` */

DROP TABLE IF EXISTS `sys_file_record`;

CREATE TABLE `sys_file_record` (
  `id` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '记录ID',
  `org_name` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '源文件名',
  `server_local_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '服务器生成的文件名',
  `server_local_path` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '服务器储存路径',
  `network_path` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '网络路径，生成的文件夹+系统生成文件名',
  `upload_type` int DEFAULT '1' COMMENT '上传类型',
  `md5_value` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '文件MD5值',
  `file_size` bigint DEFAULT NULL COMMENT '文件大小',
  `is_merge` int DEFAULT NULL COMMENT '是否合并',
  `is_zone` int DEFAULT NULL COMMENT '是否分片 0 否 1是',
  `zone_total` int DEFAULT NULL COMMENT '分片总数',
  `zone_date` datetime DEFAULT NULL COMMENT '分片时间',
  `zone_merge_date` datetime DEFAULT NULL COMMENT '分片合并时间',
  `file_type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '文件类型',
  `upload_device` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '设备信息',
  `upload_ip` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '上传设备IP',
  `upload_count` bigint DEFAULT '1' COMMENT '上传统计',
  `download_count` bigint DEFAULT '1' COMMENT '下载统计',
  `storage_date` datetime DEFAULT NULL COMMENT '储存日期',
  `create_by` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '上传人员',
  `create_time` datetime DEFAULT NULL COMMENT '上传日期',
  `del_flag` int DEFAULT '1' COMMENT '删除标记 1正常 -1删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='文件上传记录';

/*Data for the table `sys_file_record` */

/*Table structure for table `sys_file_zone_record` */

DROP TABLE IF EXISTS `sys_file_zone_record`;

CREATE TABLE `sys_file_zone_record` (
  `id` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '分片ID',
  `zone_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '分片名称',
  `zone_path` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '分片的文件路径',
  `zone_md5` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '分片MD5',
  `zone_record_date` datetime DEFAULT NULL COMMENT '分片记录MD5值',
  `zone_check_date` datetime DEFAULT NULL COMMENT '上传完成校验日期',
  `zone_total_count` int DEFAULT NULL COMMENT '总的分片数',
  `zone_total_size` bigint DEFAULT NULL COMMENT '总的文件大小',
  `zone_start_size` bigint DEFAULT NULL COMMENT '分片起始位置',
  `zone_end_size` bigint DEFAULT NULL COMMENT '分片结束位置',
  `zone_total_md5` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '总文件的MD5值',
  `zone_now_index` int DEFAULT NULL COMMENT '当前分片索引',
  `zone_suffix` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '分片文件后缀',
  `file_record_id` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '文件记录ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='文件分片记录';

/*Data for the table `sys_file_zone_record` */

/*Table structure for table `sys_job` */

DROP TABLE IF EXISTS `sys_job`;

CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) COLLATE utf8mb4_general_ci DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) COLLATE utf8mb4_general_ci DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='定时任务调度表';

/*Data for the table `sys_job` */

insert  into `sys_job`(`job_id`,`job_name`,`job_group`,`invoke_target`,`cron_expression`,`misfire_policy`,`concurrent`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2022-12-30 11:51:16','',NULL,''),(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2022-12-30 11:51:16','',NULL,''),(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2022-12-30 11:51:16','',NULL,'');

/*Table structure for table `sys_job_log` */

DROP TABLE IF EXISTS `sys_job_log`;

CREATE TABLE `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '日志信息',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='定时任务调度日志表';

/*Data for the table `sys_job_log` */

/*Table structure for table `sys_logininfor` */

DROP TABLE IF EXISTS `sys_logininfor`;

CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作系统',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`),
  KEY idx_sys_logininfor_s  (`status`),
  KEY idx_sys_logininfor_lt (`login_time`)
) ENGINE=InnoDB AUTO_INCREMENT=416 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='系统访问记录';

/*Data for the table `sys_logininfor` */

insert  into `sys_logininfor`(`info_id`,`user_name`,`ipaddr`,`login_location`,`browser`,`os`,`status`,`msg`,`login_time`) values (100,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-12-30 11:52:52'),(101,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','1','验证码错误','2022-12-30 13:13:47'),(102,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-12-30 13:13:53'),(103,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-12-30 15:14:07'),(104,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-12-30 16:02:44'),(105,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-03 11:01:46'),(106,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-01-03 11:11:00'),(107,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-03 11:11:04'),(108,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-04 11:41:17'),(109,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-01-04 11:55:55'),(110,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-04 11:56:05'),(111,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-04 14:12:51'),(112,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-01-04 14:23:50'),(113,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-01-04 14:23:50'),(114,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-04 14:25:28'),(115,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','1','验证码已失效','2023-01-05 16:23:33'),(116,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-05 16:23:57'),(117,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','1','验证码错误','2023-01-05 17:39:03'),(118,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-05 17:39:09'),(119,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-06 08:02:42'),(120,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-01-06 08:05:17'),(121,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-06 08:05:25'),(122,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-06 08:50:47'),(123,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-01-06 09:07:20'),(124,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-06 09:08:23'),(125,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-06 09:44:21'),(126,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-01-06 09:51:03'),(127,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-06 10:08:28'),(128,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-06 11:11:30'),(129,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-06 12:12:50'),(130,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-06 17:25:00'),(131,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-09 08:40:33'),(132,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-09 10:42:43'),(133,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-09 11:33:49'),(134,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-09 12:32:58'),(135,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-09 13:28:24'),(136,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','1','验证码错误','2023-01-09 17:02:33'),(137,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-09 17:02:35'),(138,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-10 08:38:37'),(139,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-10 09:15:44'),(140,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-10 09:58:12'),(141,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-10 11:33:54'),(142,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-10 15:22:54'),(143,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-10 15:40:34'),(144,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-10 16:37:42'),(145,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-11 08:53:36'),(146,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-11 09:52:30'),(147,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-11 10:36:45'),(148,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-11 11:43:06'),(149,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-11 13:14:20'),(150,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-11 13:24:32'),(151,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','1','验证码已失效','2023-01-11 14:58:15'),(152,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-11 14:58:23'),(153,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-11 16:25:20'),(154,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-01-11 16:37:41'),(155,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-11 16:37:54'),(156,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-01-11 17:18:36'),(157,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-11 17:22:59'),(158,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-01-11 17:42:16'),(159,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-11 17:43:02'),(160,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-12 09:29:16'),(161,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-01-12 09:48:13'),(162,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-12 09:52:27'),(163,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-01-12 10:20:46'),(164,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-12 10:22:02'),(165,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-01-12 10:51:19'),(166,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-12 10:51:32'),(167,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-12 13:11:13'),(168,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-12 14:42:47'),(169,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-13 08:10:18'),(170,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-13 08:45:57'),(171,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-13 10:31:41'),(172,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-13 11:50:38'),(173,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','1','验证码错误','2023-01-13 13:07:44'),(174,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-13 13:07:52'),(175,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-01-13 13:13:49'),(176,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-13 13:14:00'),(177,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-13 13:14:14'),(178,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-13 13:52:13'),(179,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-13 13:52:36'),(180,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-01-13 14:05:23'),(181,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','1','验证码已失效','2023-01-13 15:45:39'),(182,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-13 15:45:43'),(183,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-13 17:39:08'),(184,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-13 17:39:53'),(185,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-13 17:47:50'),(186,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-16 08:19:48'),(187,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-16 08:20:15'),(188,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-16 13:22:56'),(189,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-17 08:06:35'),(190,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-17 09:24:11'),(191,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-17 11:00:54'),(192,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-17 11:02:00'),(193,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-17 13:37:38'),(194,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-17 17:13:37'),(195,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-01-17 18:00:13'),(196,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-17 18:00:19'),(197,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-01-17 18:01:59'),(198,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-17 18:02:08'),(199,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-18 10:54:21'),(200,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-18 10:54:33'),(201,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-18 12:35:14'),(202,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-18 16:32:46'),(203,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-18 18:02:28'),(204,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-19 08:04:34'),(205,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-19 09:21:07'),(206,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-19 13:15:01'),(207,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-19 15:19:37'),(208,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-28 08:21:25'),(209,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-28 08:21:40'),(210,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-28 09:48:25'),(211,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-28 15:12:17'),(212,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-01-28 15:12:31'),(213,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-28 15:25:18'),(214,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-29 15:41:12'),(215,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-29 16:56:43'),(216,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-29 16:57:07'),(217,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-29 17:03:46'),(218,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-29 17:08:33'),(219,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-30 10:35:21'),(220,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-30 10:39:16'),(221,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-30 10:40:17'),(222,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-30 14:10:55'),(223,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','1','验证码错误','2023-01-30 14:39:10'),(224,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-30 14:39:15'),(225,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-30 15:19:09'),(226,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-30 16:24:21'),(227,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-30 16:24:41'),(228,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-30 17:09:46'),(229,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-31 15:49:28'),(230,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-31 15:49:42'),(231,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-31 15:52:04'),(232,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-31 15:52:24'),(233,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-31 16:56:27'),(234,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-01-31 16:59:16'),(235,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-31 16:59:44'),(236,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-31 17:37:03'),(237,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-01-31 17:46:01'),(238,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-31 17:46:18'),(239,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','1','验证码已失效','2023-02-01 10:02:24'),(240,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','1','验证码错误','2023-02-01 10:02:26'),(241,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-01 10:02:34'),(242,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-01 12:59:02'),(243,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-02-01 13:04:08'),(244,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-01 13:04:17'),(245,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-01 13:16:00'),(246,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-01 13:17:22'),(247,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-01 13:17:39'),(248,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-01 13:20:09'),(249,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-01 13:20:31'),(250,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-01 14:51:49'),(251,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-01 15:14:38'),(252,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-01 16:45:06'),(253,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-02 08:46:58'),(254,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-02 09:45:47'),(255,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-02 11:41:26'),(256,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-02 17:14:18'),(257,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-03 08:51:48'),(258,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-02-03 08:57:59'),(259,'test','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-03 08:58:07'),(260,'test','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-03 13:45:44'),(261,'test','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-02-03 13:46:49'),(262,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-03 13:46:54'),(263,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-03 14:24:01'),(264,'admin','192.168.30.139','内网IP','Chrome 10','Windows 10','1','验证码已失效','2023-02-03 16:34:48'),(265,'admin','192.168.30.139','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-03 16:34:52'),(266,'admin','192.168.30.139','内网IP','Chrome 10','Windows 10','0','退出成功','2023-02-03 16:35:15'),(267,'test','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-03 16:35:31'),(268,'test','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-02-03 16:36:11'),(269,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-03 16:36:16'),(270,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-03 17:11:42'),(271,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-02-03 17:12:11'),(272,'test','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-03 17:12:17'),(273,'test','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-02-03 17:18:39'),(274,'test','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-03 17:19:57'),(275,'test','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-02-03 17:22:20'),(276,'yaqin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-03 17:22:28'),(277,'yaqin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-02-03 17:24:27'),(278,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-03 17:24:36'),(279,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-02-03 17:25:10'),(280,'yaqin1','127.0.0.1','内网IP','Chrome 10','Windows 10','1','对不起，您的账号：yaqin1 已停用','2023-02-03 17:25:15'),(281,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','1','验证码错误','2023-02-03 17:25:19'),(282,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-03 17:25:23'),(283,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-02-03 17:26:03'),(284,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-03 17:26:08'),(285,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-02-03 17:27:13'),(286,'yaqin1','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-03 17:27:23'),(287,'yaqin1','127.0.0.1','内网IP','Chrome 10','Windows 10','1','验证码已失效','2023-02-06 09:08:28'),(288,'yaqin1','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-06 09:08:33'),(289,'yaqin1','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-02-06 09:14:07'),(290,'yaqin1','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-06 09:14:15'),(291,'yaqin1','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-06 10:07:48'),(292,'yaqin1','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-02-06 10:38:55'),(293,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-06 10:39:02'),(294,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-02-06 10:49:21'),(295,'yaqin1','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-06 10:49:29'),(296,'yaqin1','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-02-06 10:56:56'),(297,'yaqin1','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-06 10:57:02'),(298,'yaqin1','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-02-06 10:58:24'),(299,'yaqin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-06 10:58:33'),(300,'yaqin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-02-06 11:01:50'),(301,'yaqin1','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-06 11:02:09'),(302,'yaqin1','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-02-06 11:31:16'),(303,'yaqin1','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-06 11:31:22'),(304,'yaqin1','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-02-06 11:31:26'),(305,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-06 11:31:32'),(306,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','1','验证码已失效','2023-02-06 14:50:21'),(307,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-06 14:50:27'),(308,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-10 09:53:18'),(309,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-02-10 10:41:45'),(310,'test','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-10 10:41:53'),(311,'test','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-02-10 10:42:33'),(312,'test1','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-10 10:42:41'),(313,'test1','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-02-10 11:25:29'),(314,'test','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-10 11:25:40'),(315,'test','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-02-10 11:53:18'),(316,'test','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-10 11:53:38'),(317,'test','127.0.0.1','内网IP','Unknown','Unknown','1','验证码已失效','2023-02-10 11:55:29'),(318,'test','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-10 13:29:53'),(319,'test','127.0.0.1','内网IP','Chrome 10','Windows 10','1','验证码已失效','2023-02-10 17:18:17'),(320,'test','127.0.0.1','内网IP','Chrome 10','Windows 10','1','验证码错误','2023-02-10 17:18:20'),(321,'test','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-10 17:18:25'),(322,'test','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-02-10 17:33:02'),(323,'test1','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-10 17:33:09'),(324,'test1','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-02-10 17:34:23'),(325,'test','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-10 17:34:32'),(326,'test','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-02-10 17:49:51'),(327,'test1','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-10 17:49:58'),(328,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2023-02-14 16:36:46'),(329,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2023-02-15 08:48:51'),(330,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2023-02-15 08:49:38'),(331,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','退出成功','2023-02-15 09:18:29'),(332,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2023-02-15 09:18:36'),(333,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','退出成功','2023-02-15 09:20:37'),(334,'ry','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2023-02-15 09:20:51'),(335,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2023-02-15 10:46:32'),(336,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','退出成功','2023-02-15 10:51:02'),(337,'ry','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2023-02-15 10:51:12'),(338,'ry','127.0.0.1','内网IP','Firefox 10','Windows 10','0','退出成功','2023-02-15 10:58:34'),(339,'ry','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2023-02-15 10:58:46'),(340,'test','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-15 10:59:44'),(341,'test','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-02-15 10:59:53'),(342,'ry','127.0.0.1','内网IP','Chrome 10','Windows 10','1','验证码错误','2023-02-15 11:00:01'),(343,'ry','127.0.0.1','内网IP','Chrome 10','Windows 10','1','验证码错误','2023-02-15 11:00:06'),(344,'ry','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-15 11:00:38'),(345,'ry','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-02-15 11:00:57'),(346,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-15 11:01:04'),(347,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','1','验证码错误','2023-02-15 11:34:00'),(348,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2023-02-15 11:34:06'),(349,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-15 11:37:28'),(350,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-15 13:23:53'),(351,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-15 13:56:38'),(352,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-15 14:58:39'),(353,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-15 15:30:47'),(354,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','1','验证码错误','2023-02-15 16:17:21'),(355,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-15 16:17:35'),(356,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-15 16:50:34'),(357,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','1','验证码错误','2023-02-16 11:17:05'),(358,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','1','验证码错误','2023-02-16 11:17:09'),(359,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2023-02-16 11:17:15'),(360,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2023-02-16 13:52:01'),(361,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','退出成功','2023-02-16 14:35:51'),(362,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2023-02-16 14:36:03'),(363,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-17 13:28:14'),(364,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-17 13:28:45'),(365,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2023-02-17 15:13:04'),(366,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','1','验证码已失效','2023-02-17 15:29:34'),(367,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-20 09:03:27'),(368,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-20 10:01:35'),(369,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-20 14:09:55'),(370,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-20 16:47:53'),(371,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-20 17:33:43'),(372,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-21 08:43:08'),(373,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-21 09:56:46'),(374,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-21 09:57:59'),(375,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-21 11:03:48'),(376,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-21 13:52:31'),(377,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','1','验证码已失效','2023-02-22 08:46:24'),(378,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-22 08:46:29'),(379,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','1','验证码已失效','2023-02-22 09:50:05'),(380,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-22 09:50:11'),(381,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-22 10:35:40'),(382,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-22 11:28:40'),(383,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-22 11:50:02'),(384,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-22 13:38:31'),(385,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-22 14:32:36'),(386,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-22 15:08:12'),(387,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-22 16:09:24'),(388,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码已失效','2023-02-23 08:22:25'),(389,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码已失效','2023-02-23 08:32:48'),(390,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码已失效','2023-02-23 08:37:42'),(391,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码已失效','2023-02-23 08:43:40'),(392,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-02-23 08:43:48'),(393,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-02-23 11:24:15'),(394,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-02-23 14:09:39'),(395,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-02-23 15:25:41'),(396,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-02-23 15:38:23'),(397,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-02-23 15:38:34'),(398,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-02-23 16:16:06'),(399,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-02-23 17:15:32'),(400,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-02-23 17:59:38'),(401,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-02-23 17:59:49'),(402,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-02-24 08:22:21'),(403,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-02-24 09:31:58'),(404,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-02-24 10:21:02'),(405,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-02-24 11:52:25'),(406,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-02-24 13:05:45'),(407,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-02-24 15:57:37'),(408,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-02-24 17:14:45'),(409,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-02-27 09:49:57'),(410,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-02-27 10:43:49'),(411,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-02-27 13:14:09'),(412,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-02-27 13:46:26'),(413,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-02-27 14:01:00'),(414,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-02-27 14:01:05'),(415,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-02-27 16:18:33');

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路由参数',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2016 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='菜单权限表';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'系统管理',0,6,'system',NULL,'',1,0,'M','0','0','','settings','admin','2022-12-30 11:51:15','admin','2023-02-27 15:27:28','系统管理目录'),(2,'系统监控',0,5,'monitor',NULL,'',1,0,'M','0','0','','monitor','admin','2022-12-30 11:51:15','admin','2023-02-27 15:27:43','系统监控目录'),(3,'系统工具',0,3,'tool',NULL,'',1,0,'M','1','0','','tool','admin','2022-12-30 11:51:15','admin','2023-01-03 11:13:29','系统工具目录'),(4,'文件管理',0,1,'file','','',1,0,'M','0','0','','guide','admin','2022-12-30 11:51:15','admin','2023-02-27 15:28:10','若依官网地址'),(100,'用户管理',1,1,'user','system/user/index','',1,0,'C','0','0','system:user:list','user','admin','2022-12-30 11:51:15','',NULL,'用户管理菜单'),(101,'角色管理',1,2,'role','system/role/index','',1,0,'C','0','0','system:role:list','peoples','admin','2022-12-30 11:51:15','',NULL,'角色管理菜单'),(102,'菜单管理',1,3,'menu','system/menu/index','',1,0,'C','0','0','system:menu:list','tree-table','admin','2022-12-30 11:51:15','',NULL,'菜单管理菜单'),(103,'部门管理',1,4,'dept','system/dept/index','',1,0,'C','0','0','system:dept:list','tree','admin','2022-12-30 11:51:15','',NULL,'部门管理菜单'),(104,'岗位管理',1,5,'post','system/post/index','',1,0,'C','0','0','system:post:list','post','admin','2022-12-30 11:51:15','',NULL,'岗位管理菜单'),(105,'字典管理',1,6,'dict','system/dict/index','',1,0,'C','0','0','system:dict:list','dict','admin','2022-12-30 11:51:15','',NULL,'字典管理菜单'),(106,'参数设置',1,7,'config','system/config/index','',1,0,'C','0','0','system:config:list','edit','admin','2022-12-30 11:51:15','',NULL,'参数设置菜单'),(107,'通知公告',1,8,'notice','system/notice/index','',1,0,'C','1','0','system:notice:list','message','admin','2022-12-30 11:51:15','admin','2023-01-03 11:12:19','通知公告菜单'),(108,'日志管理',1,9,'log','','',1,0,'M','0','0','','log','admin','2022-12-30 11:51:15','',NULL,'日志管理菜单'),(109,'在线用户',2,1,'online','monitor/online/index','',1,0,'C','0','0','monitor:online:list','online','admin','2022-12-30 11:51:15','',NULL,'在线用户菜单'),(110,'定时任务',2,2,'job','monitor/job/index','',1,0,'C','0','0','monitor:job:list','job','admin','2022-12-30 11:51:15','',NULL,'定时任务菜单'),(111,'数据监控',2,3,'druid','monitor/druid/index','',1,0,'C','0','0','monitor:druid:list','druid','admin','2022-12-30 11:51:15','',NULL,'数据监控菜单'),(112,'服务监控',2,4,'server','monitor/server/index','',1,0,'C','0','0','monitor:server:list','server','admin','2022-12-30 11:51:15','',NULL,'服务监控菜单'),(113,'缓存监控',2,5,'cache','monitor/cache/index','',1,0,'C','0','0','monitor:cache:list','redis','admin','2022-12-30 11:51:15','',NULL,'缓存监控菜单'),(114,'缓存列表',2,6,'cacheList','monitor/cache/list','',1,0,'C','0','0','monitor:cache:list','redis-list','admin','2022-12-30 11:51:15','',NULL,'缓存列表菜单'),(115,'表单构建',3,1,'build','tool/build/index','',1,0,'C','0','0','tool:build:list','build','admin','2022-12-30 11:51:15','',NULL,'表单构建菜单'),(116,'代码生成',3,2,'gen','tool/gen/index','',1,0,'C','0','0','tool:gen:list','code','admin','2022-12-30 11:51:15','',NULL,'代码生成菜单'),(117,'系统接口',3,3,'swagger','tool/swagger/index','',1,0,'C','0','0','tool:swagger:list','swagger','admin','2022-12-30 11:51:15','',NULL,'系统接口菜单'),(500,'操作日志',108,1,'operlog','monitor/operlog/index','',1,0,'C','0','0','monitor:operlog:list','form','admin','2022-12-30 11:51:15','',NULL,'操作日志菜单'),(501,'登录日志',108,2,'logininfor','monitor/logininfor/index','',1,0,'C','0','0','monitor:logininfor:list','logininfor','admin','2022-12-30 11:51:15','',NULL,'登录日志菜单'),(1000,'用户查询',100,1,'','','',1,0,'F','0','0','system:user:query','#','admin','2022-12-30 11:51:15','',NULL,''),(1001,'用户新增',100,2,'','','',1,0,'F','0','0','system:user:add','#','admin','2022-12-30 11:51:15','',NULL,''),(1002,'用户修改',100,3,'','','',1,0,'F','0','0','system:user:edit','#','admin','2022-12-30 11:51:15','',NULL,''),(1003,'用户删除',100,4,'','','',1,0,'F','0','0','system:user:remove','#','admin','2022-12-30 11:51:15','',NULL,''),(1004,'用户导出',100,5,'','','',1,0,'F','0','0','system:user:export','#','admin','2022-12-30 11:51:15','',NULL,''),(1005,'用户导入',100,6,'','','',1,0,'F','0','0','system:user:import','#','admin','2022-12-30 11:51:15','',NULL,''),(1006,'重置密码',100,7,'','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2022-12-30 11:51:15','',NULL,''),(1007,'角色查询',101,1,'','','',1,0,'F','0','0','system:role:query','#','admin','2022-12-30 11:51:15','',NULL,''),(1008,'角色新增',101,2,'','','',1,0,'F','0','0','system:role:add','#','admin','2022-12-30 11:51:15','',NULL,''),(1009,'角色修改',101,3,'','','',1,0,'F','0','0','system:role:edit','#','admin','2022-12-30 11:51:15','',NULL,''),(1010,'角色删除',101,4,'','','',1,0,'F','0','0','system:role:remove','#','admin','2022-12-30 11:51:15','',NULL,''),(1011,'角色导出',101,5,'','','',1,0,'F','0','0','system:role:export','#','admin','2022-12-30 11:51:15','',NULL,''),(1012,'菜单查询',102,1,'','','',1,0,'F','0','0','system:menu:query','#','admin','2022-12-30 11:51:15','',NULL,''),(1013,'菜单新增',102,2,'','','',1,0,'F','0','0','system:menu:add','#','admin','2022-12-30 11:51:15','',NULL,''),(1014,'菜单修改',102,3,'','','',1,0,'F','0','0','system:menu:edit','#','admin','2022-12-30 11:51:15','',NULL,''),(1015,'菜单删除',102,4,'','','',1,0,'F','0','0','system:menu:remove','#','admin','2022-12-30 11:51:15','',NULL,''),(1016,'部门查询',103,1,'','','',1,0,'F','0','0','system:dept:query','#','admin','2022-12-30 11:51:15','',NULL,''),(1017,'部门新增',103,2,'','','',1,0,'F','0','0','system:dept:add','#','admin','2022-12-30 11:51:15','',NULL,''),(1018,'部门修改',103,3,'','','',1,0,'F','0','0','system:dept:edit','#','admin','2022-12-30 11:51:15','',NULL,''),(1019,'部门删除',103,4,'','','',1,0,'F','0','0','system:dept:remove','#','admin','2022-12-30 11:51:15','',NULL,''),(1020,'岗位查询',104,1,'','','',1,0,'F','0','0','system:post:query','#','admin','2022-12-30 11:51:15','',NULL,''),(1021,'岗位新增',104,2,'','','',1,0,'F','0','0','system:post:add','#','admin','2022-12-30 11:51:15','',NULL,''),(1022,'岗位修改',104,3,'','','',1,0,'F','0','0','system:post:edit','#','admin','2022-12-30 11:51:15','',NULL,''),(1023,'岗位删除',104,4,'','','',1,0,'F','0','0','system:post:remove','#','admin','2022-12-30 11:51:15','',NULL,''),(1024,'岗位导出',104,5,'','','',1,0,'F','0','0','system:post:export','#','admin','2022-12-30 11:51:15','',NULL,''),(1025,'字典查询',105,1,'#','','',1,0,'F','0','0','system:dict:query','#','admin','2022-12-30 11:51:15','',NULL,''),(1026,'字典新增',105,2,'#','','',1,0,'F','0','0','system:dict:add','#','admin','2022-12-30 11:51:15','',NULL,''),(1027,'字典修改',105,3,'#','','',1,0,'F','0','0','system:dict:edit','#','admin','2022-12-30 11:51:15','',NULL,''),(1028,'字典删除',105,4,'#','','',1,0,'F','0','0','system:dict:remove','#','admin','2022-12-30 11:51:15','',NULL,''),(1029,'字典导出',105,5,'#','','',1,0,'F','0','0','system:dict:export','#','admin','2022-12-30 11:51:15','',NULL,''),(1030,'参数查询',106,1,'#','','',1,0,'F','0','0','system:config:query','#','admin','2022-12-30 11:51:15','',NULL,''),(1031,'参数新增',106,2,'#','','',1,0,'F','0','0','system:config:add','#','admin','2022-12-30 11:51:15','',NULL,''),(1032,'参数修改',106,3,'#','','',1,0,'F','0','0','system:config:edit','#','admin','2022-12-30 11:51:15','',NULL,''),(1033,'参数删除',106,4,'#','','',1,0,'F','0','0','system:config:remove','#','admin','2022-12-30 11:51:15','',NULL,''),(1034,'参数导出',106,5,'#','','',1,0,'F','0','0','system:config:export','#','admin','2022-12-30 11:51:15','',NULL,''),(1035,'公告查询',107,1,'#','','',1,0,'F','0','0','system:notice:query','#','admin','2022-12-30 11:51:15','',NULL,''),(1036,'公告新增',107,2,'#','','',1,0,'F','0','0','system:notice:add','#','admin','2022-12-30 11:51:15','',NULL,''),(1037,'公告修改',107,3,'#','','',1,0,'F','0','0','system:notice:edit','#','admin','2022-12-30 11:51:15','',NULL,''),(1038,'公告删除',107,4,'#','','',1,0,'F','0','0','system:notice:remove','#','admin','2022-12-30 11:51:15','',NULL,''),(1039,'操作查询',500,1,'#','','',1,0,'F','0','0','monitor:operlog:query','#','admin','2022-12-30 11:51:15','',NULL,''),(1040,'操作删除',500,2,'#','','',1,0,'F','0','0','monitor:operlog:remove','#','admin','2022-12-30 11:51:15','',NULL,''),(1041,'日志导出',500,3,'#','','',1,0,'F','0','0','monitor:operlog:export','#','admin','2022-12-30 11:51:15','',NULL,''),(1042,'登录查询',501,1,'#','','',1,0,'F','0','0','monitor:logininfor:query','#','admin','2022-12-30 11:51:15','',NULL,''),(1043,'登录删除',501,2,'#','','',1,0,'F','0','0','monitor:logininfor:remove','#','admin','2022-12-30 11:51:15','',NULL,''),(1044,'日志导出',501,3,'#','','',1,0,'F','0','0','monitor:logininfor:export','#','admin','2022-12-30 11:51:15','',NULL,''),(1045,'账户解锁',501,4,'#','','',1,0,'F','0','0','monitor:logininfor:unlock','#','admin','2022-12-30 11:51:15','',NULL,''),(1046,'在线查询',109,1,'#','','',1,0,'F','0','0','monitor:online:query','#','admin','2022-12-30 11:51:15','',NULL,''),(1047,'批量强退',109,2,'#','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2022-12-30 11:51:15','',NULL,''),(1048,'单条强退',109,3,'#','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2022-12-30 11:51:15','',NULL,''),(1049,'任务查询',110,1,'#','','',1,0,'F','0','0','monitor:job:query','#','admin','2022-12-30 11:51:15','',NULL,''),(1050,'任务新增',110,2,'#','','',1,0,'F','0','0','monitor:job:add','#','admin','2022-12-30 11:51:15','',NULL,''),(1051,'任务修改',110,3,'#','','',1,0,'F','0','0','monitor:job:edit','#','admin','2022-12-30 11:51:15','',NULL,''),(1052,'任务删除',110,4,'#','','',1,0,'F','0','0','monitor:job:remove','#','admin','2022-12-30 11:51:15','',NULL,''),(1053,'状态修改',110,5,'#','','',1,0,'F','0','0','monitor:job:changeStatus','#','admin','2022-12-30 11:51:15','',NULL,''),(1054,'任务导出',110,6,'#','','',1,0,'F','0','0','monitor:job:export','#','admin','2022-12-30 11:51:15','',NULL,''),(1055,'生成查询',116,1,'#','','',1,0,'F','0','0','tool:gen:query','#','admin','2022-12-30 11:51:15','',NULL,''),(1056,'生成修改',116,2,'#','','',1,0,'F','0','0','tool:gen:edit','#','admin','2022-12-30 11:51:15','',NULL,''),(1057,'生成删除',116,3,'#','','',1,0,'F','0','0','tool:gen:remove','#','admin','2022-12-30 11:51:15','',NULL,''),(1058,'导入代码',116,4,'#','','',1,0,'F','0','0','tool:gen:import','#','admin','2022-12-30 11:51:15','',NULL,''),(1059,'预览代码',116,5,'#','','',1,0,'F','0','0','tool:gen:preview','#','admin','2022-12-30 11:51:15','',NULL,''),(1060,'生成代码',116,6,'#','','',1,0,'F','0','0','tool:gen:code','#','admin','2022-12-30 11:51:15','',NULL,''),(2000,'全部文件',4,0,'fileAll','file/file/index','{\"fileType\":0,\"filePath\":\"/\"}',1,0,'C','0','0','file:file:list','all','admin',NULL,'admin','2023-02-02 08:50:22',''),(2001,'波形图',0,3,'wavechart','wavechart/index',NULL,1,0,'C','0','0','wavechart:wavechart:list','redis-list','admin','2023-01-09 11:36:42','admin','2023-02-27 15:28:28',''),(2002,'我的分享',4,2,'/fileshare','file/file/index','{\"fileType\":8,\"filePath\":\"/\"}',1,0,'C','0','0','','link','admin','2023-01-13 08:53:05','admin','2023-02-02 08:51:11',''),(2003,'回收站',4,1,'/filerecovery','file/file/index','{\"fileType\": 6 }',1,0,'C','0','0','','recvory','admin','2023-02-01 17:04:16','admin','2023-02-02 08:50:46',''),(2004,'GIS资源管理',0,2,'webgis',NULL,NULL,1,0,'M','0','0','','education','admin','2023-02-17 13:32:02','admin','2023-02-27 15:28:19',''),(2005,'倾斜摄影模型',2004,1,'tiltPhotography','webgis/index','{\"projectType\":1}',1,0,'C','0','0','','#','admin','2023-02-17 13:34:19','admin','2023-02-20 15:53:41',''),(2006,'Revit模型',2004,2,'revitModel','webgis/index','{\"projectType\":2}',1,0,'C','0','0','','#','admin','2023-02-17 13:35:40','admin','2023-02-17 15:30:16',''),(2007,'3Dmax模型',2004,3,'3DmaxModel','webgis/index','{\"projectType\":3}',1,0,'C','0','0','','#','admin','2023-02-17 13:36:49','admin','2023-02-17 15:31:30',''),(2008,'矢量数据模型',2004,4,'vectorModel','webgis/index','{\"projectType\":4}',1,0,'C','0','0','','#','admin','2023-02-17 13:37:16','admin','2023-02-17 15:31:33',''),(2009,'三维部件模型',2004,5,'3DpartsModel','webgis/index','{\"projectType\":5}',1,0,'C','0','0','','#','admin','2023-02-17 13:37:38','admin','2023-02-17 15:31:43',''),(2010,'全景影像模型',2004,6,'panoramaModel','webgis/index','{\"projectType\":6}',1,0,'C','0','0','','#','admin','2023-02-17 13:38:43','admin','2023-02-17 15:32:08',''),(2011,'模型明细',2004,7,'routeContent','webgis/routeContent',NULL,1,0,'C','1','0','','#','admin','2023-02-22 10:45:25','admin','2023-02-22 13:57:12',''),(2015,'GIS资源设置',1,8,'system/webgisSettings','system/webgisSettings',NULL,1,0,'C','0','0',NULL,'international','admin','2023-02-27 15:31:15','',NULL,'');

/*Table structure for table `sys_notice` */

DROP TABLE IF EXISTS `sys_notice`;

CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='通知公告表';

/*Data for the table `sys_notice` */

insert  into `sys_notice`(`notice_id`,`notice_title`,`notice_type`,`notice_content`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'温馨提醒：2018-07-01 若依新版本发布啦','2','新版本内容','0','admin','2022-12-30 11:51:16','',NULL,'管理员'),(2,'维护通知：2018-07-01 若依系统凌晨维护','1','维护内容','0','admin','2022-12-30 11:51:16','',NULL,'管理员');

/*Table structure for table `sys_oper_log` */

DROP TABLE IF EXISTS `sys_oper_log`;

CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20)  DEFAULT '0'  COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`),
  KEY idx_sys_oper_log_bt (`business_type`),
  KEY idx_sys_oper_log_s  (`status`),
  KEY idx_sys_oper_log_ot (`oper_time`)
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='操作日志记录';

/*Data for the table `sys_oper_log` */

insert  into `sys_oper_log`(`oper_id`,`title`,`business_type`,`method`,`request_method`,`operator_type`,`oper_name`,`dept_name`,`oper_url`,`oper_ip`,`oper_location`,`oper_param`,`json_result`,`status`,`error_msg`,`oper_time`) values (100,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/notice/index\",\"createTime\":\"2022-12-30 11:51:15\",\"icon\":\"message\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":107,\"menuName\":\"通知公告\",\"menuType\":\"C\",\"orderNum\":8,\"params\":{},\"parentId\":1,\"path\":\"notice\",\"perms\":\"system:notice:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-03 11:12:19'),(101,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2022-12-30 11:51:15\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-03 11:13:29'),(102,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"nickName\":\"张亚琴\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":100,\"userName\":\"yaqin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-09 08:40:59'),(103,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"redis-list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"波形图\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"waecharts\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-09 11:36:42'),(104,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2023-01-09 11:36:42\",\"icon\":\"redis-list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"波形图\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"wavechart\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-09 14:10:27'),(105,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"wavechart/index\",\"createTime\":\"2023-01-09 11:36:42\",\"icon\":\"redis-list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"波形图\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"wavechart\",\"perms\":\"file:file:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-09 15:25:09'),(106,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"link\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"分享\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":4,\"path\":\"/file/share\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-13 08:53:05'),(107,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"file/file/share\",\"createTime\":\"2023-01-13 08:53:05\",\"icon\":\"link\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"分享\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":4,\"path\":\"/file/share\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-13 08:53:48'),(108,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"file/share\",\"createTime\":\"2023-01-13 08:53:05\",\"icon\":\"link\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"分享\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":4,\"path\":\"/file/share\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-13 10:32:41'),(109,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"file/file/share\",\"createTime\":\"2023-01-13 08:53:05\",\"icon\":\"link\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"分享\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":4,\"path\":\"/file/share\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-13 10:38:48'),(110,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"file/file/share\",\"createTime\":\"2023-01-13 08:53:05\",\"icon\":\"link\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"分享\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":4,\"path\":\"share\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-13 10:39:02'),(111,'用户管理',5,'com.ruoyi.web.controller.system.SysUserController.export()','POST',1,'admin',NULL,'/system/user/export','127.0.0.1','内网IP','{\"admin\":false,\"params\":{\"dataScope\":\"\"}}',NULL,0,NULL,'2023-02-01 11:12:17'),(112,'用户管理',5,'com.ruoyi.web.controller.system.SysUserController.export()','POST',1,'admin',NULL,'/system/user/export','127.0.0.1','内网IP','{\"admin\":false,\"params\":{\"dataScope\":\"\"}}',NULL,0,NULL,'2023-02-01 11:12:54'),(113,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"\",\"createTime\":\"2022-12-30 11:51:15\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":4,\"menuName\":\"文件管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"file\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-01 17:01:20'),(114,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"file/file/index\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"全部文件\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":4,\"path\":\"file\",\"perms\":\"file:file:list\",\"query\":\"fileType=0&filePath=%2F\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-01 17:02:58'),(115,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"回收站\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":4,\"path\":\"/file\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-01 17:04:16'),(116,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"file/file/index\",\"createTime\":\"2023-02-01 17:04:16\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"回收站\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":4,\"path\":\"/file\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-01 17:04:28'),(117,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"file/file/index\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"全部文件\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":4,\"path\":\"file\",\"perms\":\"file:file:list\",\"query\":\"fileType=0&filePath=%2F\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-01 17:04:41'),(118,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"file/file/index\",\"createTime\":\"2023-02-01 17:04:16\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"回收站\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":4,\"path\":\"/file\",\"perms\":\"\",\"query\":\"fileType=6\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-01 17:04:49'),(119,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"file/file/index\",\"createTime\":\"2023-02-01 17:04:16\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"回收站\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":4,\"path\":\"/file\",\"perms\":\"\",\"query\":\"{ \\\" fileType\\\": 6 }\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-01 17:08:17'),(120,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"file/file/index\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"全部文件\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":4,\"path\":\"file\",\"perms\":\"file:file:list\",\"query\":\"{\\\"fileType\\\":0,\\\"filePath\\\":\\\"/\\\"}\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-01 17:08:53'),(121,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"file/file/index\",\"createTime\":\"2023-02-01 17:04:16\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"回收站\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":4,\"path\":\"/file\",\"perms\":\"\",\"query\":\"{\\\" fileType\\\": 6 }\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-01 17:09:32'),(122,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"file/file/index\",\"createTime\":\"2023-02-01 17:04:16\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"回收站\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":4,\"path\":\"/file\",\"perms\":\"\",\"query\":\"{\\\"fileType\\\": 6 }\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-01 17:12:58'),(123,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"file/file/index\",\"createTime\":\"2023-01-13 08:53:05\",\"icon\":\"link\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"我的分享\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":4,\"path\":\"file\",\"perms\":\"\",\"query\":\"{\\\"fileType\\\":8,\\\"filePath\\\":\\\"/\\\"}\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-01 17:39:49'),(124,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"file/file/index\",\"createTime\":\"2023-02-01 17:04:16\",\"icon\":\"recvory\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"回收站\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":4,\"path\":\"/file\",\"perms\":\"\",\"query\":\"{\\\"fileType\\\": 6 }\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-01 17:56:20'),(125,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"file/file/index\",\"icon\":\"all\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"全部文件\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":4,\"path\":\"file\",\"perms\":\"file:file:list\",\"query\":\"{\\\"fileType\\\":0,\\\"filePath\\\":\\\"/\\\"}\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-01 17:57:30'),(126,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"file/file/index\",\"icon\":\"all\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"全部文件\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":4,\"path\":\"fileAll\",\"perms\":\"file:file:list\",\"query\":\"{\\\"fileType\\\":0,\\\"filePath\\\":\\\"/\\\"}\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-02 08:50:22'),(127,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"file/file/index\",\"createTime\":\"2023-02-01 17:04:16\",\"icon\":\"recvory\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"回收站\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":4,\"path\":\"/filerecovery\",\"perms\":\"\",\"query\":\"{\\\"fileType\\\": 6 }\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-02 08:50:46'),(128,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"file/file/index\",\"createTime\":\"2023-01-13 08:53:05\",\"icon\":\"link\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"我的分享\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":4,\"path\":\"/fileshare\",\"perms\":\"\",\"query\":\"{\\\"fileType\\\":8,\\\"filePath\\\":\\\"/\\\"}\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-02 08:51:11'),(129,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"123\",\"params\":{},\"postIds\":[],\"roleIds\":[2],\"status\":\"0\",\"userId\":101,\"userName\":\"test\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-03 08:57:50'),(130,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-02-03 08:57:50\",\"delFlag\":\"0\",\"deptId\":103,\"email\":\"\",\"loginDate\":\"2023-02-03 13:45:45\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"123\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":101,\"userName\":\"test\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-03 13:48:56'),(131,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-02-03 08:57:50\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":107,\"email\":\"\",\"loginDate\":\"2023-02-03 16:35:32\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"123\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":101,\"userName\":\"test\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-03 17:12:06'),(132,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"nickName\":\"yaq\",\"params\":{},\"postIds\":[],\"roleIds\":[2],\"status\":\"0\",\"userId\":102,\"userName\":\"yaqin1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-03 17:24:59'),(133,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.changeStatus()','PUT',1,'admin',NULL,'/system/user/changeStatus','127.0.0.1','内网IP','{\"admin\":false,\"params\":{},\"status\":\"1\",\"updateBy\":\"admin\",\"userId\":102}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-03 17:25:06'),(134,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.changeStatus()','PUT',1,'admin',NULL,'/system/user/changeStatus','127.0.0.1','内网IP','{\"admin\":false,\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":102}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-03 17:25:32'),(135,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptId\":107,\"nickName\":\"他\",\"params\":{},\"postIds\":[],\"roleIds\":[2],\"status\":\"0\",\"userId\":103,\"userName\":\"test1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-03 17:25:57'),(136,'角色管理',1,'com.ruoyi.web.controller.system.SysRoleController.add()','POST',1,'yaqin1',NULL,'/system/role','127.0.0.1','内网IP','{\"admin\":false,\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[4,2000,2003,2002],\"params\":{},\"roleKey\":\"common\",\"roleName\":\"文件管理\",\"roleSort\":3,\"status\":\"0\"}','{\"msg\":\"新增角色\'文件管理\'失败，角色权限已存在\",\"code\":500}',0,NULL,'2023-02-06 10:37:52'),(137,'角色管理',1,'com.ruoyi.web.controller.system.SysRoleController.add()','POST',1,'yaqin1',NULL,'/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"yaqin1\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[4,2000,2003,2002],\"params\":{},\"roleId\":100,\"roleKey\":\"file\",\"roleName\":\"文件管理\",\"roleSort\":3,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-06 10:38:22'),(138,'角色管理',4,'com.ruoyi.web.controller.system.SysRoleController.selectAuthUserAll()','PUT',1,'admin',NULL,'/system/role/authUser/selectAll','127.0.0.1','内网IP','100 [101]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-06 10:39:32'),(139,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.dataScope()','PUT',1,'admin',NULL,'/system/role/dataScope','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2023-02-06 10:38:22\",\"dataScope\":\"3\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"roleId\":100,\"roleKey\":\"file\",\"roleName\":\"文件管理\",\"roleSort\":3,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-06 10:40:13'),(140,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-12-30 11:51:15\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":100,\"email\":\"ry@qq.com\",\"loginDate\":\"2022-12-30 11:51:15\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-15 09:20:17'),(141,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-12-30 11:51:15\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"若依科技\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"status\":\"0\"},\"deptId\":103,\"email\":\"ry@qq.com\",\"loginDate\":\"2022-12-30 11:51:15\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-15 09:20:28'),(142,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"GIS资源服务管理\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"/webgis\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-17 13:32:02'),(143,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2023-02-17 13:32:02\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2004,\"menuName\":\"GIS资源服务管理\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"webgis\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-17 13:32:17'),(144,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"/webgis/tiltPhotography\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"倾斜摄影模型\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2004,\"path\":\"/webgis/tiltPhotography\",\"query\":\"{\\\"projectType\\\":1}\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-17 13:34:19'),(145,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"/webgis/tiltPhotography\",\"createTime\":\"2023-02-17 13:34:19\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"倾斜摄影模型\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2004,\"path\":\"tiltPhotography\",\"perms\":\"\",\"query\":\"{\\\"projectType\\\":1}\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-17 13:34:52'),(146,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"/webgis/revitModel\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"Revit模型\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2005,\"path\":\"revitModel\",\"query\":\"{\\\"projectType\\\":2}\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-17 13:35:40'),(147,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"/webgis/revitModel\",\"createTime\":\"2023-02-17 13:35:40\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"Revit模型\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2004,\"path\":\"revitModel\",\"perms\":\"\",\"query\":\"{\\\"projectType\\\":2}\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-17 13:36:00'),(148,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"/webgis/3DmaxModel\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"3Dmax模型\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2004,\"path\":\"3DmaxModel\",\"query\":\"{\\\"projectType\\\":3}\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-17 13:36:49'),(149,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"/webgis/vectorModel\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"矢量数据模型\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2004,\"path\":\"vectorModel\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-17 13:37:16'),(150,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"/webgis/3DpartsModel\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"三维部件模型\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2004,\"path\":\"3DpartsModel\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-17 13:37:38'),(151,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"/webgis/vectorModel\",\"createTime\":\"2023-02-17 13:37:16\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"矢量数据模型\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2004,\"path\":\"vectorModel\",\"perms\":\"\",\"query\":\"{\\\"projectType\\\":4}\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-17 13:37:53'),(152,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"/webgis/3DpartsModel\",\"createTime\":\"2023-02-17 13:37:38\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"三维部件模型\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2004,\"path\":\"3DpartsModel\",\"perms\":\"\",\"query\":\"{\\\"projectType\\\":5}\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-17 13:38:01'),(153,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"/webgis/panoramaModel\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"全景影像模型\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":2004,\"path\":\"panoramaModel\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-17 13:38:43'),(154,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"/webgis/panoramaModel\",\"createTime\":\"2023-02-17 13:38:43\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2010,\"menuName\":\"全景影像模型\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":2004,\"path\":\"panoramaModel\",\"perms\":\"\",\"query\":\"{\\\"projectType\\\":5}\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-17 13:38:54'),(155,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin',NULL,'/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2022-12-30 11:51:15\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,4,2000,2003,2002,2001,2004,2005,2006,2007,2008,2009,2010],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-17 13:39:10'),(156,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"webgis/tiltPhotography\",\"createTime\":\"2023-02-17 13:34:19\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"倾斜摄影模型\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2004,\"path\":\"tiltPhotography\",\"perms\":\"\",\"query\":\"{\\\"projectType\\\":1}\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-17 13:40:38'),(157,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"webgis/revitModel\",\"createTime\":\"2023-02-17 13:35:40\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"Revit模型\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2004,\"path\":\"revitModel\",\"perms\":\"\",\"query\":\"{\\\"projectType\\\":2}\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-17 13:40:44'),(158,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"webgis/3DmaxModel\",\"createTime\":\"2023-02-17 13:36:49\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"3Dmax模型\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2004,\"path\":\"3DmaxModel\",\"perms\":\"\",\"query\":\"{\\\"projectType\\\":3}\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-17 13:40:49'),(159,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"webgis/vectorModel\",\"createTime\":\"2023-02-17 13:37:16\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"矢量数据模型\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2004,\"path\":\"vectorModel\",\"perms\":\"\",\"query\":\"{\\\"projectType\\\":4}\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-17 13:40:53'),(160,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"webgis/3DpartsModel\",\"createTime\":\"2023-02-17 13:37:38\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"三维部件模型\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2004,\"path\":\"3DpartsModel\",\"perms\":\"\",\"query\":\"{\\\"projectType\\\":5}\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-17 13:40:57'),(161,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"webgis/panoramaModel\",\"createTime\":\"2023-02-17 13:38:43\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2010,\"menuName\":\"全景影像模型\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":2004,\"path\":\"panoramaModel\",\"perms\":\"\",\"query\":\"{\\\"projectType\\\":5}\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-17 13:41:01'),(162,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"webgis/tiltPhotography/index\",\"createTime\":\"2023-02-17 13:34:19\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"倾斜摄影模型\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2004,\"path\":\"tiltPhotography\",\"perms\":\"\",\"query\":\"{\\\"projectType\\\":1}\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-17 15:15:46'),(163,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"webgis/index\",\"createTime\":\"2023-02-17 13:35:40\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"Revit模型\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2004,\"path\":\"revitModel\",\"perms\":\"\",\"query\":\"{\\\"projectType\\\":2}\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-17 15:30:16'),(164,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"webgis/index\",\"createTime\":\"2023-02-17 13:34:19\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"倾斜摄影模型\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2004,\"path\":\"tiltPhotography\",\"perms\":\"\",\"query\":\"{\\\"projectType\\\":1}\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-17 15:31:20'),(165,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"webgis/index\",\"createTime\":\"2023-02-17 13:36:49\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"3Dmax模型\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2004,\"path\":\"3DmaxModel\",\"perms\":\"\",\"query\":\"{\\\"projectType\\\":3}\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-17 15:31:30'),(166,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"webgis/index\",\"createTime\":\"2023-02-17 13:37:16\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"矢量数据模型\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2004,\"path\":\"vectorModel\",\"perms\":\"\",\"query\":\"{\\\"projectType\\\":4}\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-17 15:31:33'),(167,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"webgis/index\",\"createTime\":\"2023-02-17 13:37:38\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"三维部件模型\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2004,\"path\":\"3DpartsModel\",\"perms\":\"\",\"query\":\"{\\\"projectType\\\":5}\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-17 15:31:38'),(168,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"webgis/index\",\"createTime\":\"2023-02-17 13:37:38\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"三维部件模型\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2004,\"path\":\"3DpartsModel\",\"perms\":\"\",\"query\":\"{\\\"projectType\\\":5}\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-17 15:31:43'),(169,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"webgis/index\",\"createTime\":\"2023-02-17 13:38:43\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2010,\"menuName\":\"全景影像模型\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":2004,\"path\":\"panoramaModel\",\"perms\":\"\",\"query\":\"{\\\"projectType\\\":5}\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-17 15:31:46'),(170,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"webgis/index\",\"createTime\":\"2023-02-17 13:38:43\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2010,\"menuName\":\"全景影像模型\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":2004,\"path\":\"panoramaModel\",\"perms\":\"\",\"query\":\"{\\\"projectType\\\":6}\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-17 15:32:08'),(171,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"webgis/index\",\"createTime\":\"2023-02-17 13:34:19\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"倾斜摄影模型\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2004,\"path\":\"tiltPhotography\",\"perms\":\"\",\"query\":\"{\\\"projectType\\\":1}\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-20 15:53:41'),(172,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"routeContent\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":2004,\"path\":\"/routeContent\",\"status\":\"0\",\"visible\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-22 10:45:25'),(173,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"/webgis/routeContent\",\"createTime\":\"2023-02-22 10:45:25\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2011,\"menuName\":\"routeContent\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":2004,\"path\":\"routeContent\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-22 10:46:26'),(174,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"webgis/routeContent\",\"createTime\":\"2023-02-22 10:45:25\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2011,\"menuName\":\"routeContent\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":2004,\"path\":\"routeContent\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-22 10:46:40'),(175,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"webgis/routeContent\",\"createTime\":\"2023-02-22 10:45:25\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2011,\"menuName\":\"模型明细\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":2004,\"path\":\"routeContent\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-22 13:57:12'),(176,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"lock\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"设置\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"settings\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-23 10:41:14'),(177,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"settings/file/index\",\"createBy\":\"admin\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"文件管理设置\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2012,\"path\":\"filesettings\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-23 10:42:40'),(178,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"/settings/webgis\",\"createBy\":\"admin\",\"icon\":\"international\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"webgis设置\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2012,\"path\":\"webgis\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-23 10:43:44'),(179,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"/settings/file\",\"createTime\":\"2023-02-23 10:42:40\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2013,\"menuName\":\"文件管理设置\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2012,\"path\":\"filesettings\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-24 16:04:54'),(180,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"settings/file\",\"createTime\":\"2023-02-23 10:42:40\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2013,\"menuName\":\"文件管理设置\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2012,\"path\":\"filesettings\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-24 16:05:33'),(181,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"settings/webgis\",\"createTime\":\"2023-02-23 10:43:44\",\"icon\":\"international\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2014,\"menuName\":\"webgis设置\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2012,\"path\":\"webgis\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-24 16:05:39'),(182,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2023-02-23 10:41:14\",\"icon\":\"lock\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":2012,\"menuName\":\"设置\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"http://localhost:8088/admin/sys/high/\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-27 14:37:22'),(183,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2023-02-23 10:41:14\",\"icon\":\"lock\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"设置\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"settings\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-27 14:42:23'),(184,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2013','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-27 15:15:25'),(185,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2022-12-30 11:51:15\",\"icon\":\"manage\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-27 15:19:19'),(186,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2023-02-23 10:41:14\",\"icon\":\"settings\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"系统设置\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"settings\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-27 15:19:42'),(187,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2022-12-30 11:51:15\",\"icon\":\"settings\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-27 15:20:08'),(188,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2023-02-23 10:41:14\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"系统设置\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"settings\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-27 15:20:21'),(189,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2023-02-17 13:32:02\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2004,\"menuName\":\"GIS资源管理\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"webgis\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-27 15:20:49'),(190,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2022-12-30 11:51:15\",\"icon\":\"settings\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-27 15:27:28'),(191,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2022-12-30 11:51:15\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-27 15:27:43'),(192,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"\",\"createTime\":\"2022-12-30 11:51:15\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":4,\"menuName\":\"文件管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"file\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-27 15:28:11'),(193,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2023-02-17 13:32:02\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2004,\"menuName\":\"GIS资源管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"webgis\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-27 15:28:19'),(194,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"wavechart/index\",\"createTime\":\"2023-01-09 11:36:42\",\"icon\":\"redis-list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"波形图\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"wavechart\",\"perms\":\"wavechart:wavechart:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-27 15:28:28'),(195,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/webgisSettings\",\"createBy\":\"admin\",\"icon\":\"international\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"GIS资源设置\",\"menuType\":\"C\",\"orderNum\":8,\"params\":{},\"parentId\":1,\"path\":\"system/webgisSettings\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-27 15:31:15'),(196,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2012','127.0.0.1','内网IP','{}','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2023-02-27 16:18:57'),(197,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2014','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-27 16:19:03'),(198,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2012','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-27 16:19:07');

/*Table structure for table `sys_post` */

DROP TABLE IF EXISTS `sys_post`;

CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='岗位信息表';

/*Data for the table `sys_post` */

insert  into `sys_post`(`post_id`,`post_code`,`post_name`,`post_sort`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'ceo','董事长',1,'0','admin','2022-12-30 11:51:15','',NULL,''),(2,'se','项目经理',2,'0','admin','2022-12-30 11:51:15','',NULL,''),(3,'hr','人力资源',3,'0','admin','2022-12-30 11:51:15','',NULL,''),(4,'user','普通员工',4,'0','admin','2022-12-30 11:51:15','',NULL,'');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) COLLATE utf8mb4_general_ci DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色信息表';

/*Data for the table `sys_role` */

insert  into `sys_role`(`role_id`,`role_name`,`role_key`,`role_sort`,`data_scope`,`menu_check_strictly`,`dept_check_strictly`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'超级管理员','admin',1,'1',1,1,'0','0','admin','2022-12-30 11:51:15','',NULL,'超级管理员'),(2,'普通角色','common',2,'2',1,1,'0','0','admin','2022-12-30 11:51:15','admin','2023-02-17 13:39:10','普通角色'),(100,'文件管理','file',3,'3',1,1,'0','0','yaqin1','2023-02-06 10:38:22','','2023-02-06 10:40:13',NULL);

/*Table structure for table `sys_role_dept` */

DROP TABLE IF EXISTS `sys_role_dept`;

CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色和部门关联表';

/*Data for the table `sys_role_dept` */

insert  into `sys_role_dept`(`role_id`,`dept_id`) values (2,100),(2,101),(2,105);

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色和菜单关联表';

/*Data for the table `sys_role_menu` */

insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1),(2,2),(2,3),(2,4),(2,100),(2,101),(2,102),(2,103),(2,104),(2,105),(2,106),(2,107),(2,108),(2,109),(2,110),(2,111),(2,112),(2,113),(2,114),(2,115),(2,116),(2,117),(2,500),(2,501),(2,1000),(2,1001),(2,1002),(2,1003),(2,1004),(2,1005),(2,1006),(2,1007),(2,1008),(2,1009),(2,1010),(2,1011),(2,1012),(2,1013),(2,1014),(2,1015),(2,1016),(2,1017),(2,1018),(2,1019),(2,1020),(2,1021),(2,1022),(2,1023),(2,1024),(2,1025),(2,1026),(2,1027),(2,1028),(2,1029),(2,1030),(2,1031),(2,1032),(2,1033),(2,1034),(2,1035),(2,1036),(2,1037),(2,1038),(2,1039),(2,1040),(2,1041),(2,1042),(2,1043),(2,1044),(2,1045),(2,1046),(2,1047),(2,1048),(2,1049),(2,1050),(2,1051),(2,1052),(2,1053),(2,1054),(2,1055),(2,1056),(2,1057),(2,1058),(2,1059),(2,1060),(2,2000),(2,2001),(2,2002),(2,2003),(2,2004),(2,2005),(2,2006),(2,2007),(2,2008),(2,2009),(2,2010),(100,4),(100,2000),(100,2002),(100,2003);

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) COLLATE utf8mb4_general_ci DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '手机号码',
  `sex` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '密码',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户信息表';

/*Data for the table `sys_user` */

insert  into `sys_user`(`user_id`,`dept_id`,`user_name`,`nick_name`,`user_type`,`email`,`phonenumber`,`sex`,`avatar`,`password`,`status`,`del_flag`,`login_ip`,`login_date`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,103,'admin','若依','00','ry@163.com','15888888888','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2023-02-27 16:18:34','admin','2022-12-30 11:51:15','','2023-02-27 16:18:33','管理员'),(2,103,'ry','若依','00','ry@qq.com','15666666666','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2023-02-15 11:00:38','admin','2022-12-30 11:51:15','admin','2023-02-15 11:00:38','测试员'),(100,100,'yaqin','张亚琴','00','','','0','','$2a$10$Uh.0jm.yMmFZWVcg0xuKUOWiRVPpqsmssaUliEqcYaMWgDcPv3.Gu','0','0','127.0.0.1','2023-02-06 10:58:33','admin','2023-01-09 08:40:59','','2023-02-06 10:58:33',NULL),(101,107,'test','123','00','','','0','','$2a$10$Beszg5s3GbVM8QpGkOwOnOGtiRTVeBXtvdQpBX2EeBaA4QTH8U8Q2','0','0','127.0.0.1','2023-02-15 10:59:44','admin','2023-02-03 08:57:50','admin','2023-02-15 10:59:44',NULL),(102,100,'yaqin1','yaq','00','','','0','','$2a$10$8mnTYyFsAPkAyjZKPMcHUuVQDI6KZi/BQTWJkx0PMWmQkeyoFYpSq','0','0','127.0.0.1','2023-02-06 11:31:23','admin','2023-02-03 17:24:59','admin','2023-02-06 11:31:22',NULL),(103,107,'test1','他','00','','','0','','$2a$10$mfmLZi/bJJkI1lUsopxbceF3ndR9JbmGoI7S9S68SRsOuiY6en1CG','0','0','127.0.0.1','2023-02-10 17:49:58','admin','2023-02-03 17:25:56','','2023-02-10 17:49:58',NULL);

/*Table structure for table `sys_user_post` */

DROP TABLE IF EXISTS `sys_user_post`;

CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户与岗位关联表';

/*Data for the table `sys_user_post` */

insert  into `sys_user_post`(`user_id`,`post_id`) values (1,1),(2,2);

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户和角色关联表';

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`user_id`,`role_id`) values (1,1),(2,2),(100,2),(101,2),(101,100),(102,2),(103,2);

/*Table structure for table `sysparam` */

DROP TABLE IF EXISTS `sysparam`;

CREATE TABLE `sysparam` (
  `sys_param_id` bigint NOT NULL AUTO_INCREMENT,
  `group_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `sys_param_desc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `sys_param_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `sys_param_value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`sys_param_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `sysparam` */

insert  into `sysparam`(`sys_param_id`,`group_name`,`sys_param_desc`,`sys_param_key`,`sys_param_value`) values (1,NULL,'总存储大小（单位M）','totalStorageSize','10240'),(2,NULL,'系统初始化数据标识','initDataFlag','1'),(3,NULL,'当前脚本的版本号','version','1.1.2');

/*Table structure for table `tb_ganggui` */

DROP TABLE IF EXISTS `tb_ganggui`;

CREATE TABLE `tb_ganggui` (
  `id` int NOT NULL AUTO_INCREMENT,
  `main_code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `xian_lu_code` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `che_zhan_code` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `xing_bie` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `xian_bie` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `gu_dao_num` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `start_k_m` decimal(8,3) NOT NULL,
  `start_longitude` decimal(10,6) DEFAULT NULL,
  `start_latitude` decimal(10,6) DEFAULT NULL,
  `end_k_m` decimal(8,3) NOT NULL,
  `end_longitude` decimal(10,6) DEFAULT NULL,
  `end_latitude` decimal(10,6) DEFAULT NULL,
  `gui_ju_type` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `yun_ying_status` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chang_lian_flag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `zuo_you_gu` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gong_li_biao` decimal(3,0) DEFAULT NULL,
  `gui_hao` decimal(2,0) DEFAULT NULL,
  `gang_gui_num` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gui_chang` decimal(5,2) NOT NULL,
  `gui_xing` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `gang_zhong` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sheng_chan_chang_jia_code` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `zhi_zao_nian_du` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `rong_lu_hao` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_zai_yong_gui` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tong_guo_sum` decimal(10,0) DEFAULT NULL,
  `jie_tou_fang_shi` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `huan_gui_nian_yue` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pu_she_date` date DEFAULT NULL,
  `xia_dao_date` date DEFAULT NULL,
  `use_status` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gang_gui_te_zheng` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tb_ganggui` */

insert  into `tb_ganggui`(`id`,`main_code`,`xian_lu_code`,`che_zhan_code`,`xing_bie`,`xian_bie`,`gu_dao_num`,`start_k_m`,`start_longitude`,`start_latitude`,`end_k_m`,`end_longitude`,`end_latitude`,`gui_ju_type`,`yun_ying_status`,`chang_lian_flag`,`zuo_you_gu`,`gong_li_biao`,`gui_hao`,`gang_gui_num`,`gui_chang`,`gui_xing`,`gang_zhong`,`sheng_chan_chang_jia_code`,`zhi_zao_nian_du`,`rong_lu_hao`,`is_zai_yong_gui`,`tong_guo_sum`,`jie_tou_fang_shi`,`huan_gui_nian_yue`,`pu_she_date`,`xia_dao_date`,`use_status`,`gang_gui_te_zheng`,`remark`) values (1,'G00101A1K0911010','5','0010','1','1','1','91890.000',NULL,NULL,'91915.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'G00101A1K0911020','5','0010','1','1','1','91915.000',NULL,NULL,'91940.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'G00101A1K0911030','5','0010','1','1','1','91940.000',NULL,NULL,'91965.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'G00101A1K0911040','5','0010','1','1','1','91965.000',NULL,NULL,'91990.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'G00101A1K0911050','5','0010','1','1','1','91990.000',NULL,NULL,'92015.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'G00101A1K0921010','5','0010','1','1','1','92010.000',NULL,NULL,'92040.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'G00101A1K0921020','5','0010','1','1','1','92035.000',NULL,NULL,'92065.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,'G00101A1K0921030','5','0010','1','1','1','92060.000',NULL,NULL,'92090.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'G00101A1K0921040','5','0010','1','1','1','92085.000',NULL,NULL,'92115.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,'G00101A1K0921050','5','0010','1','1','1','92110.000',NULL,NULL,'92140.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,'G00101A1K0921060','5','0010','1','1','1','92135.000',NULL,NULL,'92165.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,'G00101A1K0921070','5','0010','1','1','1','92160.000',NULL,NULL,'92190.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,'G00101A1K0921080','5','0010','1','1','1','92185.000',NULL,NULL,'92215.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,'G00101A1K0921090','5','0010','1','1','1','92210.000',NULL,NULL,'92240.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,'G00101A1K0921100','5','0010','1','1','1','92235.000',NULL,NULL,'92265.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,'G00101A1K0921110','5','0010','1','1','1','92260.000',NULL,NULL,'92290.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,'G00101A1K0921120','5','0010','1','1','1','92285.000',NULL,NULL,'92315.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,'G00101A1K0921130','5','0010','1','1','1','92310.000',NULL,NULL,'92340.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,'G00101A1K0921140','5','0010','1','1','1','92335.000',NULL,NULL,'92365.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,'G00101A1K0921150','5','0010','1','1','1','92360.000',NULL,NULL,'92390.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,'G00101A1K0921160','5','0010','1','1','1','92385.000',NULL,NULL,'92415.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,'G00101A1K0921170','5','0010','1','1','1','92410.000',NULL,NULL,'92440.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,'G00101A1K0921180','5','0010','1','1','1','92435.000',NULL,NULL,'92465.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,'G00101A1K0921190','5','0010','1','1','1','92460.000',NULL,NULL,'92490.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,'G00101A1K0921200','5','0010','1','1','1','92485.000',NULL,NULL,'92515.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,'G00101A1K0921210','5','0010','1','1','1','92510.000',NULL,NULL,'92540.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,'G00101A1K0921220','5','0010','1','1','1','92535.000',NULL,NULL,'92565.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,'G00101A1K0921230','5','0010','1','1','1','92560.000',NULL,NULL,'92590.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,'G00101A1K0921240','5','0010','1','1','1','92585.000',NULL,NULL,'92615.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,'G00101A1K0921250','5','0010','1','1','1','92610.000',NULL,NULL,'92640.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31,'G00101A1K0921260','5','0010','1','1','1','92635.000',NULL,NULL,'92665.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(32,'G00101A1K0921270','5','0010','1','1','1','92660.000',NULL,NULL,'92690.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(33,'G00101A1K0921280','5','0010','1','1','1','92685.000',NULL,NULL,'92715.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(34,'G00101A1K0921290','5','0010','1','1','1','92710.000',NULL,NULL,'92740.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(35,'G00101A1K0921300','5','0010','1','1','1','92735.000',NULL,NULL,'92765.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(36,'G00101A1K0921310','5','0010','1','1','1','92760.000',NULL,NULL,'92790.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(37,'G00101A1K0921320','5','0010','1','1','1','92785.000',NULL,NULL,'92815.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(38,'G00101A1K0921330','5','0010','1','1','1','92810.000',NULL,NULL,'92840.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(39,'G00101A1K0921340','5','0010','1','1','1','92835.000',NULL,NULL,'92865.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(40,'G00101A1K0921350','5','0010','1','1','1','92860.000',NULL,NULL,'92890.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(41,'G00101A1K0921360','5','0010','1','1','1','92885.000',NULL,NULL,'92915.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(42,'G00101A1K0921370','5','0010','1','1','1','92910.000',NULL,NULL,'92940.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(43,'G00101A1K0921380','5','0010','1','1','1','92935.000',NULL,NULL,'92965.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(44,'G00101A1K0921390','5','0010','1','1','1','92960.000',NULL,NULL,'92990.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(45,'G00101A1K0921400','5','0010','1','1','1','92985.000',NULL,NULL,'93015.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(46,'G00101A1K0931010','5','0010','1','1','1','93000.000',NULL,NULL,'93040.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(47,'G00101A1K0931020','5','0010','1','1','1','93025.000',NULL,NULL,'93065.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(48,'G00101A1K0931030','5','0010','1','1','1','93050.000',NULL,NULL,'93090.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(49,'G00101A1K0931040','5','0010','1','1','1','93075.000',NULL,NULL,'93115.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(50,'G00101A1K0931050','5','0010','1','1','1','93100.000',NULL,NULL,'93140.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(51,'G00101A1K0931060','5','0010','1','1','1','93125.000',NULL,NULL,'93165.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(52,'G00101A1K0931070','5','0010','1','1','1','93150.000',NULL,NULL,'93190.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(53,'G00101A1K0931080','5','0010','1','1','1','93175.000',NULL,NULL,'93215.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(54,'G00101A1K0931090','5','0010','1','1','1','93200.000',NULL,NULL,'93240.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(55,'G00101A1K0931100','5','0010','1','1','1','93225.000',NULL,NULL,'93265.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(56,'G00101A1K0931110','5','0010','1','1','1','93250.000',NULL,NULL,'93290.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(57,'G00101A1K0931120','5','0010','1','1','1','93275.000',NULL,NULL,'93315.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(58,'G00101A1K0931130','5','0010','1','1','1','93300.000',NULL,NULL,'93340.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(59,'G00101A1K0931140','5','0010','1','1','1','93325.000',NULL,NULL,'93365.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(60,'G00101A1K0931150','5','0010','1','1','1','93350.000',NULL,NULL,'93390.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(61,'G00101A1K0931160','5','0010','1','1','1','93375.000',NULL,NULL,'93415.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(62,'G00101A1K0931170','5','0010','1','1','1','93400.000',NULL,NULL,'93440.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(63,'G00101A1K0931180','5','0010','1','1','1','93425.000',NULL,NULL,'93465.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(64,'G00101A1K0931190','5','0010','1','1','1','93450.000',NULL,NULL,'93490.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(65,'G00101A1K0931200','5','0010','1','1','1','93475.000',NULL,NULL,'93515.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(66,'G00101A1K0931210','5','0010','1','1','1','93500.000',NULL,NULL,'93540.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(67,'G00101A1K0931220','5','0010','1','1','1','93525.000',NULL,NULL,'93565.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(68,'G00101A1K0931230','5','0010','1','1','1','93550.000',NULL,NULL,'93590.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(69,'G00101A1K0931240','5','0010','1','1','1','93575.000',NULL,NULL,'93615.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(70,'G00101A1K0931250','5','0010','1','1','1','93600.000',NULL,NULL,'93640.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(71,'G00101A1K0931260','5','0010','1','1','1','93625.000',NULL,NULL,'93665.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(72,'G00101A1K0931270','5','0010','1','1','1','93650.000',NULL,NULL,'93690.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(73,'G00101A1K0931280','5','0010','1','1','1','93675.000',NULL,NULL,'93715.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(74,'G00101A1K0931290','5','0010','1','1','1','93700.000',NULL,NULL,'93740.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(75,'G00101A1K0931300','5','0010','1','1','1','93725.000',NULL,NULL,'93765.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(76,'G00101A1K0931310','5','0010','1','1','1','93750.000',NULL,NULL,'93790.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(77,'G00101A1K0931320','5','0010','1','1','1','93775.000',NULL,NULL,'93815.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(78,'G00101A1K0931330','5','0010','1','1','1','93800.000',NULL,NULL,'93840.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(79,'G00101A1K0931340','5','0010','1','1','1','93825.000',NULL,NULL,'93865.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(80,'G00101A1K0931350','5','0010','1','1','1','93850.000',NULL,NULL,'93890.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(81,'G00101A1K0931360','5','0010','1','1','1','93875.000',NULL,NULL,'93915.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(82,'G00101A1K0931370','5','0010','1','1','1','93900.000',NULL,NULL,'93940.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(83,'G00101A1K0931380','5','0010','1','1','1','93925.000',NULL,NULL,'93965.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(84,'G00101A1K0931390','5','0010','1','1','1','93950.000',NULL,NULL,'93990.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(85,'G00101A1K0931400','5','0010','1','1','1','93975.000',NULL,NULL,'94015.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(86,'G00101A1K0931410','5','0010','1','1','1','93999.000',NULL,NULL,'93040.000',NULL,NULL,'普轨','在用',NULL,NULL,NULL,NULL,NULL,'24.99','1-P60',NULL,NULL,NULL,NULL,'否',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `uploadtask` */

DROP TABLE IF EXISTS `uploadtask`;

CREATE TABLE `uploadtask` (
  `upload_task_id` bigint NOT NULL AUTO_INCREMENT,
  `extend_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '扩展名',
  `file_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '文件名称',
  `file_path` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '文件路径',
  `identifier` varchar(32) DEFAULT NULL COMMENT 'md5唯一标识',
  `upload_status` int DEFAULT NULL COMMENT '上传状态(1-成功,0-失败或未完成)',
  `upload_time` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '上传时间',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`upload_task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `uploadtask` */

insert  into `uploadtask`(`upload_task_id`,`extend_name`,`file_name`,`file_path`,`identifier`,`upload_status`,`upload_time`,`user_id`) values (50,'png','dxf','/','5d6e1cf945a06448ac56d9abd1b3108d',2,'2023-01-29 16:01:48',1),(51,'sql','qwfile','/','24345aeb408c950c4c2946d2f030e03b',1,'2023-01-29 16:02:01',1),(52,'sql','ry-vue1','/','3821b253aaaa1f845a0ba1a11ca0cb74',1,'2023-01-29 16:05:24',1),(53,'bak','test','/','e2b8ccc04e3669513878428aba04c5dc',1,'2023-01-30 14:19:59',1),(54,'xml','ksolaunch.VisualElementsManifest','/','6839d6585a6be25626b00b87f9eefcd9',2,'2023-01-30 14:39:26',1),(55,'png','ss','/','d41d8cd98f00b204e9800998ecf8427e',1,'2023-01-30 16:24:57',1),(56,'sql','tb_GangGui','/','0aedd2523ea2a7600500205ef7d89fb1',1,'2023-01-31 17:09:22',1),(57,'png','PCtm_d9c8750bed0b3c7d089fa7d55720d6cf','/','d9c8750bed0b3c7d089fa7d55720d6cf',1,'2023-01-31 17:09:45',1),(58,'sql','ry-vue','/','b3b9b14749f1d8209df0853abad9fdf3',1,'2023-01-31 17:10:01',1),(59,'exe','redis-server','/','a925e3ae1a1a4a4747ffbed15d094cee',1,'2023-01-31 17:10:01',1),(60,'dwg','test','/','756411035bd20876462ef7674da59916',1,'2023-01-31 17:10:06',1),(61,'exe','ksolaunch','/','ccdfc074eb6af93cd080bdfa941a9e60',1,'2023-01-31 17:10:06',1),(62,'exe','redis-cli','/','1d25ae1afcdd816fee096a39db36d735',1,'2023-02-01 10:06:04',1),(63,'txt','server_log','/','2f37c891ad68037f04fbbbc0c72b3eef',1,'2023-02-01 10:13:49',1),(64,'dxf','东胜竣工图00','/','9d34782e456bd73e60a32b673657ab5b',1,'2023-02-01 10:14:19',1),(65,'doc','新建 DOC 文档','/','af1940d56506d72f8d117a0cd6fe2119',1,'2023-02-01 10:37:01',1),(66,'xlsx','测试','/','66027dc82ed21478341f8c8b2cb90bea',1,'2023-02-01 13:12:16',1),(67,'txt','1','/测试文件夹上传','eff3dc3bbf23ffd11e0108b81314b285',1,'2023-02-01 13:20:46',1),(68,'png','1','/','3d9a0f4137cf2e88818e9d89df530fc8',1,'2023-02-01 14:28:42',1),(69,'pdf','1','/','9b19106fdb5961476607a7f04a857783',1,'2023-02-02 17:14:53',1),(70,'txt','你好','/','fdcb5257fea91998f28c33b799d9b95a',1,'2023-02-03 16:36:03',101),(71,'doc','全空间系统部署步骤文档','/','fc6295cb1d5aa1f688233b298e24656c',1,'2023-02-03 16:36:03',101),(72,'doc','全空间系统部署步骤文档','/test','12859a19bf6680b5393691f3277f64a7',1,'2023-02-10 11:21:36',103),(73,'txt','查看程序是否启动命令','/','9af4bc4b341ee1aed307ae333abf4bb1',1,'2023-02-15 13:58:46',1),(74,'dwg','00','/','55ddee76fb3606c2eb9f7b223cb8b366',1,'2023-02-15 14:59:02',1),(75,'dxf','东胜竣工图00','/','a32caa175dd39db1635925e487719446',2,'2023-02-20 09:04:21',1),(76,'png','00','/','56cf9c28e5dc1e2b940c53e68d932411',1,'2023-02-20 09:05:20',1);

/*Table structure for table `uploadtaskdetail` */

DROP TABLE IF EXISTS `uploadtaskdetail`;

CREATE TABLE `uploadtaskdetail` (
  `upload_task_detailId` bigint NOT NULL AUTO_INCREMENT,
  `chunk_number` int DEFAULT NULL COMMENT '当前分片数',
  `chunk_size` bigint DEFAULT NULL COMMENT '当前分片大小',
  `file_path` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '文件路径',
  `file_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '文件名称',
  `identifier` varchar(32) DEFAULT NULL COMMENT '文件md5唯一标识',
  `relative_path` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '文件相对路径',
  `total_chunks` int DEFAULT NULL COMMENT '文件总分片数',
  `total_size` bigint DEFAULT NULL COMMENT '文件总大小',
  PRIMARY KEY (`upload_task_detailId`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `uploadtaskdetail` */

insert  into `uploadtaskdetail`(`upload_task_detailId`,`chunk_number`,`chunk_size`,`file_path`,`file_name`,`identifier`,`relative_path`,`total_chunks`,`total_size`) values (33,2,1048576,'/','东胜竣工图00','a32caa175dd39db1635925e487719446','东胜竣工图00.dxf',13,14411292),(34,4,1048576,'/','东胜竣工图00','a32caa175dd39db1635925e487719446','东胜竣工图00.dxf',13,14411292),(35,6,1048576,'/','东胜竣工图00','a32caa175dd39db1635925e487719446','东胜竣工图00.dxf',13,14411292),(36,5,1048576,'/','东胜竣工图00','a32caa175dd39db1635925e487719446','东胜竣工图00.dxf',13,14411292),(37,7,1048576,'/','东胜竣工图00','a32caa175dd39db1635925e487719446','东胜竣工图00.dxf',13,14411292),(38,9,1048576,'/','东胜竣工图00','a32caa175dd39db1635925e487719446','东胜竣工图00.dxf',13,14411292),(39,8,1048576,'/','东胜竣工图00','a32caa175dd39db1635925e487719446','东胜竣工图00.dxf',13,14411292),(40,10,1048576,'/','东胜竣工图00','a32caa175dd39db1635925e487719446','东胜竣工图00.dxf',13,14411292),(41,11,1048576,'/','东胜竣工图00','a32caa175dd39db1635925e487719446','东胜竣工图00.dxf',13,14411292),(42,12,1048576,'/','东胜竣工图00','a32caa175dd39db1635925e487719446','东胜竣工图00.dxf',13,14411292),(43,13,1048576,'/','东胜竣工图00','a32caa175dd39db1635925e487719446','东胜竣工图00.dxf',13,14411292);

/*Table structure for table `userfile` */

DROP TABLE IF EXISTS `userfile`;

CREATE TABLE `userfile` (
  `user_file_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `delete_batch_num` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '删除批次号',
  `delete_flag` int DEFAULT NULL COMMENT '删除标识(0-未删除，1-已删除)',
  `delete_time` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '删除时间',
  `extend_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '扩展名',
  `file_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '文件id',
  `file_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '文件名',
  `file_path` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '文件路径',
  `is_dir` int DEFAULT NULL COMMENT '是否是目录(0-否,1-是)',
  `upload_time` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '修改时间',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`user_file_id`),
  UNIQUE KEY `fileindex` (`user_id`,`file_path`,`file_name`,`extend_name`,`delete_flag`,`is_dir`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `userfile` */

insert  into `userfile`(`user_file_id`,`delete_batch_num`,`delete_flag`,`delete_time`,`extend_name`,`file_id`,`file_name`,`file_path`,`is_dir`,`upload_time`,`user_id`) values ('1621427293828464640',NULL,0,NULL,'txt','1621427293811687424','你好','/',0,'2023-02-03 16:36:06',101),('1621427294482776064',NULL,0,NULL,'doc','1621427294470193152','全空间系统部署步骤文档','/',0,'2023-02-03 16:36:06',101),('1621439353714941952','ec6a6699-ef0d-428c-91c7-4e328aff1b23',327260,'2023-02-06 10:51:03','xlsx','1620651227794993152','测试','/',0,'2023-02-03 17:24:01',100),('1621440298435780608',NULL,0,NULL,'sql','1620348670040109056','ry-vue','/',0,'2023-02-03 17:27:46',102),('1622428956773060608','8babdb4b-d91e-4701-918e-ef2154b7405c',5178,'2023-02-06 10:57:37','',NULL,'1','/',1,'2023-02-06 10:56:21',102),('1622429196817272832','462e0b6a-71d7-4ac9-af22-9277d9467dd2',295745,'2023-02-06 10:59:38','',NULL,'12','/',1,'2023-02-06 10:57:18',102),('1622429225418231808','b2a960e2-89e2-4dd1-87dd-ec0ab3c018ae',933486,'2023-02-06 10:58:53','sql','1620348669259968512','qwfile','/',0,'2023-02-06 10:57:25',102),('1622430230490910720','77aa6587-005a-4f38-af14-28bd47ad4df9',64161,'2023-02-06 11:02:39','',NULL,'121','/',1,'2023-02-06 11:01:24',100),('1622430320269987840',NULL,0,NULL,'png','1620670466832592896','1','/121',0,'2023-02-06 11:01:46',100),('1622771109856669696',NULL,0,NULL,'',NULL,'121','/',1,'2023-02-07 09:35:56',100),('1623874926467629056',NULL,0,NULL,'',NULL,'test','/',1,'2023-02-10 10:42:07',101),('1623874981966659584',NULL,0,NULL,'png','1620670466832592896','1','/test',0,'2023-02-10 10:42:20',101),('1623875010072690688',NULL,0,NULL,'sql','1620348670040109056','ry-vue','/test',0,'2023-02-10 10:42:27',101),('1623883211296034816','729fdcaf-90c9-4399-a270-9d6abb53cae3',415520,'2023-02-10 11:25:01','txt','1621427293811687424','你好','/test',0,'2023-02-10 11:15:02',103),('1623884867375026176',NULL,0,NULL,'doc','1623884867333083136','全空间系统部署步骤文档','/test',0,'2023-02-10 11:21:37',103),('1623978499377549312',NULL,0,NULL,'docx','1623978499331411968','1212','/',0,'2023-02-10 17:33:40',103),('1623982681069277184',NULL,0,NULL,'',NULL,'test1','/',1,'2023-02-10 17:50:17',103),('1625412653524746240',NULL,0,NULL,'',NULL,'test','/',1,'2023-02-14 16:32:29',103),('1625693341813596160','',0,'2023-02-15 11:08:19','sql','1625693341780041728','tb_GangGui','/1111',0,'2023-02-15 11:07:51',2),('1625700143208890368',NULL,0,NULL,'txt','1625700143158558720','1','/',0,'2023-02-15 11:34:52',1),('1625700143359885312',NULL,0,NULL,'png','1625700143326330880','ss','/',0,'2023-02-15 11:34:52',1),('1625700181913927680','9aaad9f0-c9b7-4ddf-abf0-a0a619777c23',133460,'2023-02-15 11:39:08','',NULL,'ry','/',1,'2023-02-15 11:35:02',1),('1625700736338001920','',0,'2023-02-15 11:39:01','txt','1625700143158558720','1','/ry',0,'2023-02-15 11:37:14',1),('1625701242443694080',NULL,0,NULL,'',NULL,'ry','/',1,'2023-02-15 11:39:14',1),('1625736358297632768',NULL,0,NULL,'txt','1625736358259884032','查看程序是否启动命令','/',0,'2023-02-15 13:58:47',1),('1625751279978684416',NULL,0,NULL,'',NULL,'1111','/',1,'2023-02-15 14:58:04',2),('1625751552868491264','6ed536fd-47b2-45f4-be30-f6a6ee31f84c',295411,'2023-02-20 09:04:14','dwg','1625751552822353920','00','/',0,'2023-02-15 14:59:09',1),('1626059301259051008',NULL,0,NULL,'dwg','1625751552822353920','00','/ry',0,'2023-02-16 11:22:02',1),('1627474452151574528',NULL,0,NULL,'png','1627474452092854272','00','/',0,'2023-02-20 09:05:21',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

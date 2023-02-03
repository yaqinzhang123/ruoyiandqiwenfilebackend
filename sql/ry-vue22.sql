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

insert  into `file`(`file_id`,`create_time`,`create_user_id`,`file_size`,`file_status`,`file_url`,`identifier`,`modify_time`,`modify_user_id`,`storage_type`) values ('1619986368455532544','2023-01-30 17:10:22',1,0,1,'upload/20230130/d41d8cd98f00b204e9800998ecf8427e.png','d41d8cd98f00b204e9800998ecf8427e',NULL,NULL,3),('1620348528654315520','2023-01-31 17:09:28',1,65695,1,'upload/20230131/0aedd2523ea2a7600500205ef7d89fb1.sql','0aedd2523ea2a7600500205ef7d89fb1',NULL,NULL,3),('1620348624892620800','2023-01-31 17:09:51',1,15444,1,'upload/20230131/d9c8750bed0b3c7d089fa7d55720d6cf.png','d9c8750bed0b3c7d089fa7d55720d6cf',NULL,NULL,3),('1620348669259968512','2023-01-31 17:10:02',1,42944,1,'upload/20230131/24345aeb408c950c4c2946d2f030e03b.sql','24345aeb408c950c4c2946d2f030e03b',NULL,NULL,3),('1620348670040109056','2023-01-31 17:10:02',1,111900,1,'upload/20230131/b3b9b14749f1d8209df0853abad9fdf3.sql','b3b9b14749f1d8209df0853abad9fdf3',NULL,NULL,3),('1620348678181253120','2023-01-31 17:10:04',1,119779,1,'upload/20230131/3821b253aaaa1f845a0ba1a11ca0cb74.sql','3821b253aaaa1f845a0ba1a11ca0cb74',NULL,NULL,3),('1620348680500703232','2023-01-31 17:10:04',1,58304,1,'upload/20230131/e2b8ccc04e3669513878428aba04c5dc.bak','e2b8ccc04e3669513878428aba04c5dc',NULL,NULL,3),('1620348684338491392','2023-01-31 17:10:05',1,1666560,1,'upload/20230131/a925e3ae1a1a4a4747ffbed15d094cee.exe','a925e3ae1a1a4a4747ffbed15d094cee',NULL,NULL,3),('1620348691489779712','2023-01-31 17:10:07',1,58816,1,'upload/20230131/756411035bd20876462ef7674da59916.dwg','756411035bd20876462ef7674da59916',NULL,NULL,3),('1620348720745050112','2023-01-31 17:10:14',1,2519440,1,'upload/20230131/ccdfc074eb6af93cd080bdfa941a9e60.exe','ccdfc074eb6af93cd080bdfa941a9e60',NULL,NULL,3),('1620604378950221824','2023-02-01 10:06:07',1,499712,1,'upload/20230201/1d25ae1afcdd816fee096a39db36d735.exe','1d25ae1afcdd816fee096a39db36d735',NULL,NULL,3),('1620606318723547136','2023-02-01 10:13:50',1,74767,1,'upload/20230201/2f37c891ad68037f04fbbbc0c72b3eef.txt','2f37c891ad68037f04fbbbc0c72b3eef',NULL,NULL,3),('1620606577432412160','2023-02-01 10:14:52',1,14411274,1,'upload/20230201/9d34782e456bd73e60a32b673657ab5b.dxf','9d34782e456bd73e60a32b673657ab5b',NULL,NULL,3),('1620612153579225088','2023-02-01 10:37:01',1,16384,1,'upload/20230201/af1940d56506d72f8d117a0cd6fe2119.doc','af1940d56506d72f8d117a0cd6fe2119',NULL,NULL,3),('1620651227794993152','2023-02-01 13:12:17',1,10573,1,'upload/20230201/66027dc82ed21478341f8c8b2cb90bea.xlsx','66027dc82ed21478341f8c8b2cb90bea',NULL,NULL,3),('1620653384673882112','2023-02-01 13:20:51',1,305,1,'upload/20230201/eff3dc3bbf23ffd11e0108b81314b285.txt','eff3dc3bbf23ffd11e0108b81314b285',NULL,NULL,3),('1620670466832592896','2023-02-01 14:28:44',1,12357,1,'upload/20230201/3d9a0f4137cf2e88818e9d89df530fc8.png','3d9a0f4137cf2e88818e9d89df530fc8',NULL,NULL,3),('1620676689430704128','2023-02-01 14:53:28',1,0,1,'upload/20230201/0ad88e6c-4b6b-4623-9891-ec95586ac36d.docx','cf0c70693ae245b594a939299a03b62b',NULL,NULL,3),('1620716670802997248','2023-02-01 17:32:20',1,0,1,'upload/20230201/645d352e-4a16-45c9-b0be-9b81f0729f31.docx','dcb63bc7ec1742f185df6ad475d69dcb',NULL,NULL,3);

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

/*Table structure for table `recoveryfile` */

DROP TABLE IF EXISTS `recoveryfile`;

CREATE TABLE `recoveryfile` (
  `recovery_file_id` bigint NOT NULL AUTO_INCREMENT,
  `delete_batch_num` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '删除批次号',
  `delete_time` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '删除时间',
  `user_file_id` bigint DEFAULT NULL COMMENT '用户文件id',
  PRIMARY KEY (`recovery_file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `recoveryfile` */

insert  into `recoveryfile`(`recovery_file_id`,`delete_batch_num`,`delete_time`,`user_file_id`) values (39,'34b03123-334a-4bbe-93b6-a80c15ac8385','2023-01-16 09:37:43',1613826496668143616),(40,'b449d765-e0ad-4452-8839-2e51a3a1980f','2023-01-16 09:37:47',1613832647879200768),(41,'6bfda112-3e45-4896-89bc-d386dee95c63','2023-01-16 09:37:53',1613826337225871360),(42,'d434ef4f-a416-4bd4-9d4a-26a1f3ceffab','2023-01-19 16:19:34',1614792894026387456),(43,'46e79fae-dae7-4453-8ffb-1b225792d1e1','2023-01-19 16:43:37',1615987363258056704),(44,'0288a96e-b7bb-4c46-bdaa-d7ce84ceca8a','2023-01-19 17:08:25',1615993463579643904),(45,'d09fb031-e87f-43f9-9a13-0f2f81128fd5','2023-01-28 09:52:57',1619129207038939136),(46,'f7350cdf-6160-4ed1-8029-304045134a62','2023-01-28 09:53:05',1616006903010430976),(47,'c46a0bbd-5f0f-4ec4-9c7d-43c8e480969a','2023-01-28 09:53:51',1619150472474902528),(48,'ad436c30-3cbc-44dc-a8e2-5905c17b81d5','2023-01-28 09:54:03',1619131822401392640),(49,'5ddaab6f-3faf-44b9-9d23-95244058be25','2023-01-28 09:55:53',1619131633011789824),(50,'7c8d9230-1a06-40c4-8c9e-f50b21f43ef2','2023-01-28 09:56:03',1614781503664091136),(51,'42e3e40e-ce6a-4bac-9df4-9a99649f0ea7','2023-01-28 09:56:07',1616006434041106432),(52,'67ea0583-0273-4159-acf1-723f0d479e9e','2023-01-28 09:56:10',1614797538366623744),(53,'abd0226b-9948-40fc-a50d-805f3370c9a9','2023-01-28 09:56:14',1615999648265453568),(54,'27285dec-a0b2-48f0-a6ae-483985c8f884','2023-01-29 15:44:28',1619152473380208640),(55,'d605ef7b-9910-473c-aa55-e015df244770','2023-01-29 15:44:29',1619152417029734400),(56,'08b84baf-2774-4f50-86ba-2e7f69d83125','2023-01-29 15:44:29',1619156434740953088),(57,'2ceb1965-f37f-43d8-9fee-4dbf5d17cb17','2023-01-29 15:44:29',1619153296529145856),(58,'5e87006e-2bfb-4836-aecb-8f463b1a0dc7','2023-01-29 15:44:29',1619152529281892352),(59,'ab91bc91-8355-48ee-8d8c-90d61c0ab837','2023-02-01 10:05:39',1619986368531030016),(60,'9720abce-cbab-48cf-8235-7de3d73dece4','2023-02-01 10:05:39',1620329612632780800),(61,'a550ef80-2906-46cd-9872-2bffa42f45e4','2023-02-01 10:05:39',1620348528696258560),(62,'b453e3ed-0399-4e00-b087-a4a7ffdf1ca9','2023-02-01 10:05:39',1620348624930369536),(63,'c9253770-e119-4682-8049-ab9669b654c7','2023-02-01 10:05:39',1620348669297717248),(64,'84ec3aa3-573e-4be0-b88b-2c2a39ad4a1a','2023-02-01 10:05:39',1620348670077857792),(65,'63e11099-75d7-4550-881e-3ee2ce842f4f','2023-02-01 10:05:39',1620348678219001856),(66,'5830d908-3fd5-4040-ae37-e14ecd93b7e8','2023-02-01 10:05:39',1620348680559423488),(67,'1a36914d-bc8c-450a-bdb2-33cc1ee1a044','2023-02-01 10:05:39',1620348684376240128),(68,'7959c126-44dd-43ef-af18-de41aafde8fa','2023-02-01 10:05:39',1620348691527528448),(69,'7ac40ca0-a060-4b54-bf71-46be5aec2af2','2023-02-01 10:05:39',1620348720778604544),(70,'5f61bbe1-cc2d-4136-a17d-8dd728deaeef','2023-02-01 10:13:41',1620604379004747776),(71,'42acab53-2b0e-47c8-910b-1c121b2acbe7','2023-02-01 13:17:51',1620606318761295872),(72,'0a3da600-92ad-42ea-9add-2697eb26b4dd','2023-02-01 14:28:27',1620670141694341120),(74,'4722e0a4-ca9d-49d8-bf32-309e23018ad3','2023-02-01 15:34:21',1620653403078488064),(75,'b50adff1-6e25-4e5e-be99-d9eb34d9656c','2023-02-01 15:34:21',1620606577465966592),(76,'4038f550-38be-4279-9fc7-23d24588e7ed','2023-02-01 15:34:21',1620612153612779520),(77,'00eec006-5c11-499a-a760-9c17da139a94','2023-02-01 15:34:21',1620651227853713408),(78,'c34ae085-43cc-4761-8e63-d4b8f31288fe','2023-02-01 15:34:30',1620665345985851392),(79,'6487bd70-c287-4986-b0fd-b8bb0465a97d','2023-02-01 15:34:30',1620670466882924544),(80,'213e131f-3353-4081-ae16-27302202c5f0','2023-02-01 15:34:30',1620676574657769472),(81,'cb147982-cedc-4561-b86b-0cb79b10ca0a','2023-02-01 15:34:30',1620676689481035776),(82,'4e5fa233-6d54-4be6-8643-4fc1edba16e0','2023-02-01 15:34:30',1620679381771218944),(83,'238231ad-c314-47e1-ba77-982c46d21001','2023-02-01 15:34:30',1620682281415204864),(84,'8d39a6bc-3dcc-4fdc-861e-7c840fffdf84','2023-02-01 16:06:19',1620687273018638336),(85,'4e7be7d7-fbc8-4754-9110-5029cc16d4c3','2023-02-01 16:06:19',1620687053442629632),(86,'3bc895f1-9445-495f-ada7-a8220f2b5f1d','2023-02-01 16:06:19',1620687054688337920),(87,'555af3c5-9e6f-4ba4-a670-5640d37d5f81','2023-02-01 16:06:19',1620687054717698048),(88,'54f8c799-4cb5-4a2f-a931-9bf0a2b05d97','2023-02-01 16:06:19',1620687055204237312),(89,'650e60c5-d629-4531-90d7-6fc1dd745f87','2023-02-01 16:06:19',1620692397153697792);

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `share` */

insert  into `share`(`share_id`,`end_time`,`extraction_code`,`share_batch_num`,`share_status`,`share_time`,`share_type`,`user_id`) values (2,'2023-01-20 00:00:00',NULL,'87d9ef004b2b45b9aab7a83788126d31',0,'2023-01-13 17:14:58',0,1),(3,'2023-01-14 00:00:00','187606','c281667191334c9483f7483852663262',0,'2023-01-13 17:23:56',1,1),(4,'2023-02-01 00:00:00',NULL,'281ba559d3134235b037e1e4e844df0a',0,'2023-02-01 13:11:02',0,1),(5,'2023-02-02 00:00:00',NULL,'ac93bf525a64458986196acb0f552528',0,'2023-02-01 17:34:23',0,1);

/*Table structure for table `sharefile` */

DROP TABLE IF EXISTS `sharefile`;

CREATE TABLE `sharefile` (
  `share_file_id` bigint NOT NULL AUTO_INCREMENT,
  `share_batch_num` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '分享批次号',
  `share_file_path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '分享文件路径',
  `user_file_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '用户文件id',
  PRIMARY KEY (`share_file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `sharefile` */

insert  into `sharefile`(`share_file_id`,`share_batch_num`,`share_file_path`,`user_file_id`) values (3,'87d9ef004b2b45b9aab7a83788126d31','/','1613826337225871360'),(4,'c281667191334c9483f7483852663262','/','1613826496668143616'),(5,'281ba559d3134235b037e1e4e844df0a','/','1620606318761295872'),(6,'ac93bf525a64458986196acb0f552528','/','1620716670874300416');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `storage` */

insert  into `storage`(`storage_id`,`modify_time`,`modify_user_id`,`storage_size`,`total_storage_size`,`user_id`) values (1,NULL,NULL,NULL,1024,2),(2,NULL,NULL,NULL,1024,0),(3,NULL,NULL,NULL,1024,1);

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

insert  into `sys_config`(`config_id`,`config_name`,`config_key`,`config_value`,`config_type`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2022-12-30 11:51:15','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2022-12-30 11:51:15','',NULL,'初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2022-12-30 11:51:15','',NULL,'深色主题theme-dark，浅色主题theme-light'),(4,'账号自助-验证码开关','sys.account.captchaEnabled','true','Y','admin','2022-12-30 11:51:15','',NULL,'是否开启验证码功能（true开启，false关闭）'),(5,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2022-12-30 11:51:15','',NULL,'是否开启注册用户功能（true开启，false关闭）');

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
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='系统访问记录';

/*Data for the table `sys_logininfor` */

insert  into `sys_logininfor`(`info_id`,`user_name`,`ipaddr`,`login_location`,`browser`,`os`,`status`,`msg`,`login_time`) values (100,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-12-30 11:52:52'),(101,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','1','验证码错误','2022-12-30 13:13:47'),(102,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-12-30 13:13:53'),(103,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-12-30 15:14:07'),(104,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-12-30 16:02:44'),(105,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-03 11:01:46'),(106,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-01-03 11:11:00'),(107,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-03 11:11:04'),(108,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-04 11:41:17'),(109,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-01-04 11:55:55'),(110,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-04 11:56:05'),(111,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-04 14:12:51'),(112,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-01-04 14:23:50'),(113,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-01-04 14:23:50'),(114,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-04 14:25:28'),(115,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','1','验证码已失效','2023-01-05 16:23:33'),(116,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-05 16:23:57'),(117,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','1','验证码错误','2023-01-05 17:39:03'),(118,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-05 17:39:09'),(119,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-06 08:02:42'),(120,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-01-06 08:05:17'),(121,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-06 08:05:25'),(122,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-06 08:50:47'),(123,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-01-06 09:07:20'),(124,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-06 09:08:23'),(125,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-06 09:44:21'),(126,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-01-06 09:51:03'),(127,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-06 10:08:28'),(128,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-06 11:11:30'),(129,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-06 12:12:50'),(130,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-06 17:25:00'),(131,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-09 08:40:33'),(132,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-09 10:42:43'),(133,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-09 11:33:49'),(134,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-09 12:32:58'),(135,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-09 13:28:24'),(136,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','1','验证码错误','2023-01-09 17:02:33'),(137,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-09 17:02:35'),(138,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-10 08:38:37'),(139,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-10 09:15:44'),(140,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-10 09:58:12'),(141,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-10 11:33:54'),(142,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-10 15:22:54'),(143,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-10 15:40:34'),(144,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-10 16:37:42'),(145,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-11 08:53:36'),(146,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-11 09:52:30'),(147,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-11 10:36:45'),(148,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-11 11:43:06'),(149,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-11 13:14:20'),(150,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-11 13:24:32'),(151,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','1','验证码已失效','2023-01-11 14:58:15'),(152,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-11 14:58:23'),(153,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-11 16:25:20'),(154,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-01-11 16:37:41'),(155,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-11 16:37:54'),(156,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-01-11 17:18:36'),(157,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-11 17:22:59'),(158,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-01-11 17:42:16'),(159,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-11 17:43:02'),(160,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-12 09:29:16'),(161,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-01-12 09:48:13'),(162,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-12 09:52:27'),(163,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-01-12 10:20:46'),(164,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-12 10:22:02'),(165,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-01-12 10:51:19'),(166,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-12 10:51:32'),(167,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-12 13:11:13'),(168,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-12 14:42:47'),(169,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-13 08:10:18'),(170,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-13 08:45:57'),(171,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-13 10:31:41'),(172,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-13 11:50:38'),(173,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','1','验证码错误','2023-01-13 13:07:44'),(174,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-13 13:07:52'),(175,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-01-13 13:13:49'),(176,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-13 13:14:00'),(177,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-13 13:14:14'),(178,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-13 13:52:13'),(179,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-13 13:52:36'),(180,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-01-13 14:05:23'),(181,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','1','验证码已失效','2023-01-13 15:45:39'),(182,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-13 15:45:43'),(183,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-13 17:39:08'),(184,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-13 17:39:53'),(185,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-13 17:47:50'),(186,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-16 08:19:48'),(187,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-16 08:20:15'),(188,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-16 13:22:56'),(189,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-17 08:06:35'),(190,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-17 09:24:11'),(191,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-17 11:00:54'),(192,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-17 11:02:00'),(193,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-17 13:37:38'),(194,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-17 17:13:37'),(195,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-01-17 18:00:13'),(196,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-17 18:00:19'),(197,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-01-17 18:01:59'),(198,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-17 18:02:08'),(199,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-18 10:54:21'),(200,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-18 10:54:33'),(201,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-18 12:35:14'),(202,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-18 16:32:46'),(203,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-18 18:02:28'),(204,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-19 08:04:34'),(205,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-19 09:21:07'),(206,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-19 13:15:01'),(207,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-19 15:19:37'),(208,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-28 08:21:25'),(209,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-28 08:21:40'),(210,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-28 09:48:25'),(211,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-28 15:12:17'),(212,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-01-28 15:12:31'),(213,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-28 15:25:18'),(214,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-29 15:41:12'),(215,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-29 16:56:43'),(216,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-29 16:57:07'),(217,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-29 17:03:46'),(218,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-29 17:08:33'),(219,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-30 10:35:21'),(220,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-30 10:39:16'),(221,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-30 10:40:17'),(222,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-30 14:10:55'),(223,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','1','验证码错误','2023-01-30 14:39:10'),(224,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-30 14:39:15'),(225,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-30 15:19:09'),(226,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-30 16:24:21'),(227,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-30 16:24:41'),(228,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-30 17:09:46'),(229,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-31 15:49:28'),(230,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-31 15:49:42'),(231,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-31 15:52:04'),(232,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-31 15:52:24'),(233,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-31 16:56:27'),(234,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-01-31 16:59:16'),(235,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-31 16:59:44'),(236,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-31 17:37:03'),(237,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-01-31 17:46:01'),(238,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-01-31 17:46:18'),(239,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','1','验证码已失效','2023-02-01 10:02:24'),(240,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','1','验证码错误','2023-02-01 10:02:26'),(241,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-01 10:02:34'),(242,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-01 12:59:02'),(243,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-02-01 13:04:08'),(244,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-01 13:04:17'),(245,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-01 13:16:00'),(246,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-01 13:17:22'),(247,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-01 13:17:39'),(248,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-01 13:20:09'),(249,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-01 13:20:31'),(250,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-01 14:51:49'),(251,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-01 15:14:38'),(252,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-01 16:45:06'),(253,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-02 08:46:58'),(254,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-02 09:45:47'),(255,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-02-02 11:41:26');

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
) ENGINE=InnoDB AUTO_INCREMENT=2004 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='菜单权限表';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'系统管理',0,1,'system',NULL,'',1,0,'M','0','0','','system','admin','2022-12-30 11:51:15','',NULL,'系统管理目录'),(2,'系统监控',0,2,'monitor',NULL,'',1,0,'M','0','0','','monitor','admin','2022-12-30 11:51:15','',NULL,'系统监控目录'),(3,'系统工具',0,3,'tool',NULL,'',1,0,'M','1','0','','tool','admin','2022-12-30 11:51:15','admin','2023-01-03 11:13:29','系统工具目录'),(4,'文件管理',0,4,'file','','',1,0,'M','0','0','','guide','admin','2022-12-30 11:51:15','admin','2023-02-01 17:01:19','若依官网地址'),(100,'用户管理',1,1,'user','system/user/index','',1,0,'C','0','0','system:user:list','user','admin','2022-12-30 11:51:15','',NULL,'用户管理菜单'),(101,'角色管理',1,2,'role','system/role/index','',1,0,'C','0','0','system:role:list','peoples','admin','2022-12-30 11:51:15','',NULL,'角色管理菜单'),(102,'菜单管理',1,3,'menu','system/menu/index','',1,0,'C','0','0','system:menu:list','tree-table','admin','2022-12-30 11:51:15','',NULL,'菜单管理菜单'),(103,'部门管理',1,4,'dept','system/dept/index','',1,0,'C','0','0','system:dept:list','tree','admin','2022-12-30 11:51:15','',NULL,'部门管理菜单'),(104,'岗位管理',1,5,'post','system/post/index','',1,0,'C','0','0','system:post:list','post','admin','2022-12-30 11:51:15','',NULL,'岗位管理菜单'),(105,'字典管理',1,6,'dict','system/dict/index','',1,0,'C','0','0','system:dict:list','dict','admin','2022-12-30 11:51:15','',NULL,'字典管理菜单'),(106,'参数设置',1,7,'config','system/config/index','',1,0,'C','0','0','system:config:list','edit','admin','2022-12-30 11:51:15','',NULL,'参数设置菜单'),(107,'通知公告',1,8,'notice','system/notice/index','',1,0,'C','1','0','system:notice:list','message','admin','2022-12-30 11:51:15','admin','2023-01-03 11:12:19','通知公告菜单'),(108,'日志管理',1,9,'log','','',1,0,'M','0','0','','log','admin','2022-12-30 11:51:15','',NULL,'日志管理菜单'),(109,'在线用户',2,1,'online','monitor/online/index','',1,0,'C','0','0','monitor:online:list','online','admin','2022-12-30 11:51:15','',NULL,'在线用户菜单'),(110,'定时任务',2,2,'job','monitor/job/index','',1,0,'C','0','0','monitor:job:list','job','admin','2022-12-30 11:51:15','',NULL,'定时任务菜单'),(111,'数据监控',2,3,'druid','monitor/druid/index','',1,0,'C','0','0','monitor:druid:list','druid','admin','2022-12-30 11:51:15','',NULL,'数据监控菜单'),(112,'服务监控',2,4,'server','monitor/server/index','',1,0,'C','0','0','monitor:server:list','server','admin','2022-12-30 11:51:15','',NULL,'服务监控菜单'),(113,'缓存监控',2,5,'cache','monitor/cache/index','',1,0,'C','0','0','monitor:cache:list','redis','admin','2022-12-30 11:51:15','',NULL,'缓存监控菜单'),(114,'缓存列表',2,6,'cacheList','monitor/cache/list','',1,0,'C','0','0','monitor:cache:list','redis-list','admin','2022-12-30 11:51:15','',NULL,'缓存列表菜单'),(115,'表单构建',3,1,'build','tool/build/index','',1,0,'C','0','0','tool:build:list','build','admin','2022-12-30 11:51:15','',NULL,'表单构建菜单'),(116,'代码生成',3,2,'gen','tool/gen/index','',1,0,'C','0','0','tool:gen:list','code','admin','2022-12-30 11:51:15','',NULL,'代码生成菜单'),(117,'系统接口',3,3,'swagger','tool/swagger/index','',1,0,'C','0','0','tool:swagger:list','swagger','admin','2022-12-30 11:51:15','',NULL,'系统接口菜单'),(500,'操作日志',108,1,'operlog','monitor/operlog/index','',1,0,'C','0','0','monitor:operlog:list','form','admin','2022-12-30 11:51:15','',NULL,'操作日志菜单'),(501,'登录日志',108,2,'logininfor','monitor/logininfor/index','',1,0,'C','0','0','monitor:logininfor:list','logininfor','admin','2022-12-30 11:51:15','',NULL,'登录日志菜单'),(1000,'用户查询',100,1,'','','',1,0,'F','0','0','system:user:query','#','admin','2022-12-30 11:51:15','',NULL,''),(1001,'用户新增',100,2,'','','',1,0,'F','0','0','system:user:add','#','admin','2022-12-30 11:51:15','',NULL,''),(1002,'用户修改',100,3,'','','',1,0,'F','0','0','system:user:edit','#','admin','2022-12-30 11:51:15','',NULL,''),(1003,'用户删除',100,4,'','','',1,0,'F','0','0','system:user:remove','#','admin','2022-12-30 11:51:15','',NULL,''),(1004,'用户导出',100,5,'','','',1,0,'F','0','0','system:user:export','#','admin','2022-12-30 11:51:15','',NULL,''),(1005,'用户导入',100,6,'','','',1,0,'F','0','0','system:user:import','#','admin','2022-12-30 11:51:15','',NULL,''),(1006,'重置密码',100,7,'','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2022-12-30 11:51:15','',NULL,''),(1007,'角色查询',101,1,'','','',1,0,'F','0','0','system:role:query','#','admin','2022-12-30 11:51:15','',NULL,''),(1008,'角色新增',101,2,'','','',1,0,'F','0','0','system:role:add','#','admin','2022-12-30 11:51:15','',NULL,''),(1009,'角色修改',101,3,'','','',1,0,'F','0','0','system:role:edit','#','admin','2022-12-30 11:51:15','',NULL,''),(1010,'角色删除',101,4,'','','',1,0,'F','0','0','system:role:remove','#','admin','2022-12-30 11:51:15','',NULL,''),(1011,'角色导出',101,5,'','','',1,0,'F','0','0','system:role:export','#','admin','2022-12-30 11:51:15','',NULL,''),(1012,'菜单查询',102,1,'','','',1,0,'F','0','0','system:menu:query','#','admin','2022-12-30 11:51:15','',NULL,''),(1013,'菜单新增',102,2,'','','',1,0,'F','0','0','system:menu:add','#','admin','2022-12-30 11:51:15','',NULL,''),(1014,'菜单修改',102,3,'','','',1,0,'F','0','0','system:menu:edit','#','admin','2022-12-30 11:51:15','',NULL,''),(1015,'菜单删除',102,4,'','','',1,0,'F','0','0','system:menu:remove','#','admin','2022-12-30 11:51:15','',NULL,''),(1016,'部门查询',103,1,'','','',1,0,'F','0','0','system:dept:query','#','admin','2022-12-30 11:51:15','',NULL,''),(1017,'部门新增',103,2,'','','',1,0,'F','0','0','system:dept:add','#','admin','2022-12-30 11:51:15','',NULL,''),(1018,'部门修改',103,3,'','','',1,0,'F','0','0','system:dept:edit','#','admin','2022-12-30 11:51:15','',NULL,''),(1019,'部门删除',103,4,'','','',1,0,'F','0','0','system:dept:remove','#','admin','2022-12-30 11:51:15','',NULL,''),(1020,'岗位查询',104,1,'','','',1,0,'F','0','0','system:post:query','#','admin','2022-12-30 11:51:15','',NULL,''),(1021,'岗位新增',104,2,'','','',1,0,'F','0','0','system:post:add','#','admin','2022-12-30 11:51:15','',NULL,''),(1022,'岗位修改',104,3,'','','',1,0,'F','0','0','system:post:edit','#','admin','2022-12-30 11:51:15','',NULL,''),(1023,'岗位删除',104,4,'','','',1,0,'F','0','0','system:post:remove','#','admin','2022-12-30 11:51:15','',NULL,''),(1024,'岗位导出',104,5,'','','',1,0,'F','0','0','system:post:export','#','admin','2022-12-30 11:51:15','',NULL,''),(1025,'字典查询',105,1,'#','','',1,0,'F','0','0','system:dict:query','#','admin','2022-12-30 11:51:15','',NULL,''),(1026,'字典新增',105,2,'#','','',1,0,'F','0','0','system:dict:add','#','admin','2022-12-30 11:51:15','',NULL,''),(1027,'字典修改',105,3,'#','','',1,0,'F','0','0','system:dict:edit','#','admin','2022-12-30 11:51:15','',NULL,''),(1028,'字典删除',105,4,'#','','',1,0,'F','0','0','system:dict:remove','#','admin','2022-12-30 11:51:15','',NULL,''),(1029,'字典导出',105,5,'#','','',1,0,'F','0','0','system:dict:export','#','admin','2022-12-30 11:51:15','',NULL,''),(1030,'参数查询',106,1,'#','','',1,0,'F','0','0','system:config:query','#','admin','2022-12-30 11:51:15','',NULL,''),(1031,'参数新增',106,2,'#','','',1,0,'F','0','0','system:config:add','#','admin','2022-12-30 11:51:15','',NULL,''),(1032,'参数修改',106,3,'#','','',1,0,'F','0','0','system:config:edit','#','admin','2022-12-30 11:51:15','',NULL,''),(1033,'参数删除',106,4,'#','','',1,0,'F','0','0','system:config:remove','#','admin','2022-12-30 11:51:15','',NULL,''),(1034,'参数导出',106,5,'#','','',1,0,'F','0','0','system:config:export','#','admin','2022-12-30 11:51:15','',NULL,''),(1035,'公告查询',107,1,'#','','',1,0,'F','0','0','system:notice:query','#','admin','2022-12-30 11:51:15','',NULL,''),(1036,'公告新增',107,2,'#','','',1,0,'F','0','0','system:notice:add','#','admin','2022-12-30 11:51:15','',NULL,''),(1037,'公告修改',107,3,'#','','',1,0,'F','0','0','system:notice:edit','#','admin','2022-12-30 11:51:15','',NULL,''),(1038,'公告删除',107,4,'#','','',1,0,'F','0','0','system:notice:remove','#','admin','2022-12-30 11:51:15','',NULL,''),(1039,'操作查询',500,1,'#','','',1,0,'F','0','0','monitor:operlog:query','#','admin','2022-12-30 11:51:15','',NULL,''),(1040,'操作删除',500,2,'#','','',1,0,'F','0','0','monitor:operlog:remove','#','admin','2022-12-30 11:51:15','',NULL,''),(1041,'日志导出',500,3,'#','','',1,0,'F','0','0','monitor:operlog:export','#','admin','2022-12-30 11:51:15','',NULL,''),(1042,'登录查询',501,1,'#','','',1,0,'F','0','0','monitor:logininfor:query','#','admin','2022-12-30 11:51:15','',NULL,''),(1043,'登录删除',501,2,'#','','',1,0,'F','0','0','monitor:logininfor:remove','#','admin','2022-12-30 11:51:15','',NULL,''),(1044,'日志导出',501,3,'#','','',1,0,'F','0','0','monitor:logininfor:export','#','admin','2022-12-30 11:51:15','',NULL,''),(1045,'账户解锁',501,4,'#','','',1,0,'F','0','0','monitor:logininfor:unlock','#','admin','2022-12-30 11:51:15','',NULL,''),(1046,'在线查询',109,1,'#','','',1,0,'F','0','0','monitor:online:query','#','admin','2022-12-30 11:51:15','',NULL,''),(1047,'批量强退',109,2,'#','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2022-12-30 11:51:15','',NULL,''),(1048,'单条强退',109,3,'#','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2022-12-30 11:51:15','',NULL,''),(1049,'任务查询',110,1,'#','','',1,0,'F','0','0','monitor:job:query','#','admin','2022-12-30 11:51:15','',NULL,''),(1050,'任务新增',110,2,'#','','',1,0,'F','0','0','monitor:job:add','#','admin','2022-12-30 11:51:15','',NULL,''),(1051,'任务修改',110,3,'#','','',1,0,'F','0','0','monitor:job:edit','#','admin','2022-12-30 11:51:15','',NULL,''),(1052,'任务删除',110,4,'#','','',1,0,'F','0','0','monitor:job:remove','#','admin','2022-12-30 11:51:15','',NULL,''),(1053,'状态修改',110,5,'#','','',1,0,'F','0','0','monitor:job:changeStatus','#','admin','2022-12-30 11:51:15','',NULL,''),(1054,'任务导出',110,6,'#','','',1,0,'F','0','0','monitor:job:export','#','admin','2022-12-30 11:51:15','',NULL,''),(1055,'生成查询',116,1,'#','','',1,0,'F','0','0','tool:gen:query','#','admin','2022-12-30 11:51:15','',NULL,''),(1056,'生成修改',116,2,'#','','',1,0,'F','0','0','tool:gen:edit','#','admin','2022-12-30 11:51:15','',NULL,''),(1057,'生成删除',116,3,'#','','',1,0,'F','0','0','tool:gen:remove','#','admin','2022-12-30 11:51:15','',NULL,''),(1058,'导入代码',116,4,'#','','',1,0,'F','0','0','tool:gen:import','#','admin','2022-12-30 11:51:15','',NULL,''),(1059,'预览代码',116,5,'#','','',1,0,'F','0','0','tool:gen:preview','#','admin','2022-12-30 11:51:15','',NULL,''),(1060,'生成代码',116,6,'#','','',1,0,'F','0','0','tool:gen:code','#','admin','2022-12-30 11:51:15','',NULL,''),(2000,'全部文件',4,0,'fileAll','file/file/index','{\"fileType\":0,\"filePath\":\"/\"}',1,0,'C','0','0','file:file:list','all','admin',NULL,'admin','2023-02-02 08:50:22',''),(2001,'波形图',0,5,'wavechart','wavechart/index',NULL,1,0,'C','0','0','wavechart:wavechart:list','redis-list','admin','2023-01-09 11:36:42','admin','2023-01-09 15:25:09',''),(2002,'我的分享',4,2,'/fileshare','file/file/index','{\"fileType\":8,\"filePath\":\"/\"}',1,0,'C','0','0','','link','admin','2023-01-13 08:53:05','admin','2023-02-02 08:51:11',''),(2003,'回收站',4,1,'/filerecovery','file/file/index','{\"fileType\": 6 }',1,0,'C','0','0','','recvory','admin','2023-02-01 17:04:16','admin','2023-02-02 08:50:46','');

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
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='操作日志记录';

/*Data for the table `sys_oper_log` */

insert  into `sys_oper_log`(`oper_id`,`title`,`business_type`,`method`,`request_method`,`operator_type`,`oper_name`,`dept_name`,`oper_url`,`oper_ip`,`oper_location`,`oper_param`,`json_result`,`status`,`error_msg`,`oper_time`) values (100,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/notice/index\",\"createTime\":\"2022-12-30 11:51:15\",\"icon\":\"message\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":107,\"menuName\":\"通知公告\",\"menuType\":\"C\",\"orderNum\":8,\"params\":{},\"parentId\":1,\"path\":\"notice\",\"perms\":\"system:notice:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-03 11:12:19'),(101,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2022-12-30 11:51:15\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-03 11:13:29'),(102,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"nickName\":\"张亚琴\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":100,\"userName\":\"yaqin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-09 08:40:59'),(103,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"redis-list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"波形图\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"waecharts\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-09 11:36:42'),(104,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2023-01-09 11:36:42\",\"icon\":\"redis-list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"波形图\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"wavechart\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-09 14:10:27'),(105,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"wavechart/index\",\"createTime\":\"2023-01-09 11:36:42\",\"icon\":\"redis-list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"波形图\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"wavechart\",\"perms\":\"file:file:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-09 15:25:09'),(106,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"link\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"分享\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":4,\"path\":\"/file/share\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-13 08:53:05'),(107,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"file/file/share\",\"createTime\":\"2023-01-13 08:53:05\",\"icon\":\"link\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"分享\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":4,\"path\":\"/file/share\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-13 08:53:48'),(108,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"file/share\",\"createTime\":\"2023-01-13 08:53:05\",\"icon\":\"link\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"分享\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":4,\"path\":\"/file/share\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-13 10:32:41'),(109,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"file/file/share\",\"createTime\":\"2023-01-13 08:53:05\",\"icon\":\"link\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"分享\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":4,\"path\":\"/file/share\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-13 10:38:48'),(110,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"file/file/share\",\"createTime\":\"2023-01-13 08:53:05\",\"icon\":\"link\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"分享\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":4,\"path\":\"share\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-13 10:39:02'),(111,'用户管理',5,'com.ruoyi.web.controller.system.SysUserController.export()','POST',1,'admin',NULL,'/system/user/export','127.0.0.1','内网IP','{\"admin\":false,\"params\":{\"dataScope\":\"\"}}',NULL,0,NULL,'2023-02-01 11:12:17'),(112,'用户管理',5,'com.ruoyi.web.controller.system.SysUserController.export()','POST',1,'admin',NULL,'/system/user/export','127.0.0.1','内网IP','{\"admin\":false,\"params\":{\"dataScope\":\"\"}}',NULL,0,NULL,'2023-02-01 11:12:54'),(113,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"\",\"createTime\":\"2022-12-30 11:51:15\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":4,\"menuName\":\"文件管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"file\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-01 17:01:20'),(114,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"file/file/index\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"全部文件\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":4,\"path\":\"file\",\"perms\":\"file:file:list\",\"query\":\"fileType=0&filePath=%2F\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-01 17:02:58'),(115,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"回收站\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":4,\"path\":\"/file\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-01 17:04:16'),(116,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"file/file/index\",\"createTime\":\"2023-02-01 17:04:16\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"回收站\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":4,\"path\":\"/file\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-01 17:04:28'),(117,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"file/file/index\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"全部文件\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":4,\"path\":\"file\",\"perms\":\"file:file:list\",\"query\":\"fileType=0&filePath=%2F\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-01 17:04:41'),(118,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"file/file/index\",\"createTime\":\"2023-02-01 17:04:16\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"回收站\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":4,\"path\":\"/file\",\"perms\":\"\",\"query\":\"fileType=6\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-01 17:04:49'),(119,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"file/file/index\",\"createTime\":\"2023-02-01 17:04:16\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"回收站\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":4,\"path\":\"/file\",\"perms\":\"\",\"query\":\"{ \\\" fileType\\\": 6 }\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-01 17:08:17'),(120,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"file/file/index\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"全部文件\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":4,\"path\":\"file\",\"perms\":\"file:file:list\",\"query\":\"{\\\"fileType\\\":0,\\\"filePath\\\":\\\"/\\\"}\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-01 17:08:53'),(121,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"file/file/index\",\"createTime\":\"2023-02-01 17:04:16\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"回收站\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":4,\"path\":\"/file\",\"perms\":\"\",\"query\":\"{\\\" fileType\\\": 6 }\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-01 17:09:32'),(122,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"file/file/index\",\"createTime\":\"2023-02-01 17:04:16\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"回收站\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":4,\"path\":\"/file\",\"perms\":\"\",\"query\":\"{\\\"fileType\\\": 6 }\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-01 17:12:58'),(123,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"file/file/index\",\"createTime\":\"2023-01-13 08:53:05\",\"icon\":\"link\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"我的分享\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":4,\"path\":\"file\",\"perms\":\"\",\"query\":\"{\\\"fileType\\\":8,\\\"filePath\\\":\\\"/\\\"}\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-01 17:39:49'),(124,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"file/file/index\",\"createTime\":\"2023-02-01 17:04:16\",\"icon\":\"recvory\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"回收站\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":4,\"path\":\"/file\",\"perms\":\"\",\"query\":\"{\\\"fileType\\\": 6 }\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-01 17:56:20'),(125,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"file/file/index\",\"icon\":\"all\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"全部文件\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":4,\"path\":\"file\",\"perms\":\"file:file:list\",\"query\":\"{\\\"fileType\\\":0,\\\"filePath\\\":\\\"/\\\"}\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-01 17:57:30'),(126,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"file/file/index\",\"icon\":\"all\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"全部文件\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":4,\"path\":\"fileAll\",\"perms\":\"file:file:list\",\"query\":\"{\\\"fileType\\\":0,\\\"filePath\\\":\\\"/\\\"}\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-02 08:50:22'),(127,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"file/file/index\",\"createTime\":\"2023-02-01 17:04:16\",\"icon\":\"recvory\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"回收站\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":4,\"path\":\"/filerecovery\",\"perms\":\"\",\"query\":\"{\\\"fileType\\\": 6 }\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-02 08:50:46'),(128,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"file/file/index\",\"createTime\":\"2023-01-13 08:53:05\",\"icon\":\"link\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"我的分享\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":4,\"path\":\"/fileshare\",\"perms\":\"\",\"query\":\"{\\\"fileType\\\":8,\\\"filePath\\\":\\\"/\\\"}\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-02 08:51:11');

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
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色信息表';

/*Data for the table `sys_role` */

insert  into `sys_role`(`role_id`,`role_name`,`role_key`,`role_sort`,`data_scope`,`menu_check_strictly`,`dept_check_strictly`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'超级管理员','admin',1,'1',1,1,'0','0','admin','2022-12-30 11:51:15','',NULL,'超级管理员'),(2,'普通角色','common',2,'2',1,1,'0','0','admin','2022-12-30 11:51:15','',NULL,'普通角色');

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

insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1),(2,2),(2,3),(2,4),(2,100),(2,101),(2,102),(2,103),(2,104),(2,105),(2,106),(2,107),(2,108),(2,109),(2,110),(2,111),(2,112),(2,113),(2,114),(2,115),(2,116),(2,117),(2,500),(2,501),(2,1000),(2,1001),(2,1002),(2,1003),(2,1004),(2,1005),(2,1006),(2,1007),(2,1008),(2,1009),(2,1010),(2,1011),(2,1012),(2,1013),(2,1014),(2,1015),(2,1016),(2,1017),(2,1018),(2,1019),(2,1020),(2,1021),(2,1022),(2,1023),(2,1024),(2,1025),(2,1026),(2,1027),(2,1028),(2,1029),(2,1030),(2,1031),(2,1032),(2,1033),(2,1034),(2,1035),(2,1036),(2,1037),(2,1038),(2,1039),(2,1040),(2,1041),(2,1042),(2,1043),(2,1044),(2,1045),(2,1046),(2,1047),(2,1048),(2,1049),(2,1050),(2,1051),(2,1052),(2,1053),(2,1054),(2,1055),(2,1056),(2,1057),(2,1058),(2,1059),(2,1060);

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
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户信息表';

/*Data for the table `sys_user` */

insert  into `sys_user`(`user_id`,`dept_id`,`user_name`,`nick_name`,`user_type`,`email`,`phonenumber`,`sex`,`avatar`,`password`,`status`,`del_flag`,`login_ip`,`login_date`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,103,'admin','若依','00','ry@163.com','15888888888','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2023-02-02 11:41:26','admin','2022-12-30 11:51:15','','2023-02-02 11:41:26','管理员'),(2,105,'ry','若依','00','ry@qq.com','15666666666','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2022-12-30 11:51:15','admin','2022-12-30 11:51:15','',NULL,'测试员'),(100,100,'yaqin','张亚琴','00','','','0','','$2a$10$Uh.0jm.yMmFZWVcg0xuKUOWiRVPpqsmssaUliEqcYaMWgDcPv3.Gu','0','0','',NULL,'admin','2023-01-09 08:40:59','',NULL,NULL);

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

insert  into `sys_user_role`(`user_id`,`role_id`) values (1,1),(2,2);

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

insert  into `sysparam`(`sys_param_id`,`group_name`,`sys_param_desc`,`sys_param_key`,`sys_param_value`) values (1,NULL,'总存储大小（单位M）','totalStorageSize','1024'),(2,NULL,'系统初始化数据标识','initDataFlag','1'),(3,NULL,'当前脚本的版本号','version','1.1.2');

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
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `uploadtask` */

insert  into `uploadtask`(`upload_task_id`,`extend_name`,`file_name`,`file_path`,`identifier`,`upload_status`,`upload_time`,`user_id`) values (50,'png','dxf','/','5d6e1cf945a06448ac56d9abd1b3108d',2,'2023-01-29 16:01:48',1),(51,'sql','qwfile','/','24345aeb408c950c4c2946d2f030e03b',1,'2023-01-29 16:02:01',1),(52,'sql','ry-vue1','/','3821b253aaaa1f845a0ba1a11ca0cb74',1,'2023-01-29 16:05:24',1),(53,'bak','test','/','e2b8ccc04e3669513878428aba04c5dc',1,'2023-01-30 14:19:59',1),(54,'xml','ksolaunch.VisualElementsManifest','/','6839d6585a6be25626b00b87f9eefcd9',2,'2023-01-30 14:39:26',1),(55,'png','ss','/','d41d8cd98f00b204e9800998ecf8427e',1,'2023-01-30 16:24:57',1),(56,'sql','tb_GangGui','/','0aedd2523ea2a7600500205ef7d89fb1',1,'2023-01-31 17:09:22',1),(57,'png','PCtm_d9c8750bed0b3c7d089fa7d55720d6cf','/','d9c8750bed0b3c7d089fa7d55720d6cf',1,'2023-01-31 17:09:45',1),(58,'sql','ry-vue','/','b3b9b14749f1d8209df0853abad9fdf3',1,'2023-01-31 17:10:01',1),(59,'exe','redis-server','/','a925e3ae1a1a4a4747ffbed15d094cee',1,'2023-01-31 17:10:01',1),(60,'dwg','test','/','756411035bd20876462ef7674da59916',1,'2023-01-31 17:10:06',1),(61,'exe','ksolaunch','/','ccdfc074eb6af93cd080bdfa941a9e60',1,'2023-01-31 17:10:06',1),(62,'exe','redis-cli','/','1d25ae1afcdd816fee096a39db36d735',1,'2023-02-01 10:06:04',1),(63,'txt','server_log','/','2f37c891ad68037f04fbbbc0c72b3eef',1,'2023-02-01 10:13:49',1),(64,'dxf','东胜竣工图00','/','9d34782e456bd73e60a32b673657ab5b',1,'2023-02-01 10:14:19',1),(65,'doc','新建 DOC 文档','/','af1940d56506d72f8d117a0cd6fe2119',1,'2023-02-01 10:37:01',1),(66,'xlsx','测试','/','66027dc82ed21478341f8c8b2cb90bea',1,'2023-02-01 13:12:16',1),(67,'txt','1','/测试文件夹上传','eff3dc3bbf23ffd11e0108b81314b285',1,'2023-02-01 13:20:46',1),(68,'png','1','/','3d9a0f4137cf2e88818e9d89df530fc8',1,'2023-02-01 14:28:42',1);

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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `uploadtaskdetail` */

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

insert  into `userfile`(`user_file_id`,`delete_batch_num`,`delete_flag`,`delete_time`,`extend_name`,`file_id`,`file_name`,`file_path`,`is_dir`,`upload_time`,`user_id`) values ('1619986368531030016','ab91bc91-8355-48ee-8d8c-90d61c0ab837',411043,'2023-02-01 10:05:39','png','1619986368455532544','ss','/',0,'2023-01-30 17:10:22',1),('1620329612632780800','9720abce-cbab-48cf-8235-7de3d73dece4',452476,'2023-02-01 10:05:39','ttf','1619986368455532544','s','/',0,'2023-01-31 15:54:18',1),('1620348528696258560','a550ef80-2906-46cd-9872-2bffa42f45e4',87911,'2023-02-01 10:05:39','sql','1620348528654315520','tb_GangGui','/',0,'2023-01-31 17:09:28',1),('1620348624930369536','b453e3ed-0399-4e00-b087-a4a7ffdf1ca9',778729,'2023-02-01 10:05:39','png','1620348624892620800','PCtm_d9c8750bed0b3c7d089fa7d55720d6cf','/',0,'2023-01-31 17:09:51',1),('1620348669297717248','c9253770-e119-4682-8049-ab9669b654c7',422149,'2023-02-01 10:05:39','sql','1620348669259968512','qwfile','/',0,'2023-01-31 17:10:02',1),('1620348670077857792','84ec3aa3-573e-4be0-b88b-2c2a39ad4a1a',423941,'2023-02-01 10:05:39','sql','1620348670040109056','ry-vue','/',0,'2023-01-31 17:10:02',1),('1620348678219001856','63e11099-75d7-4550-881e-3ee2ce842f4f',732473,'2023-02-01 10:05:39','sql','1620348678181253120','ry-vue1','/',0,'2023-01-31 17:10:04',1),('1620348680559423488','5830d908-3fd5-4040-ae37-e14ecd93b7e8',412463,'2023-02-01 10:05:39','bak','1620348680500703232','test','/',0,'2023-01-31 17:10:04',1),('1620348684376240128','1a36914d-bc8c-450a-bdb2-33cc1ee1a044',773238,'2023-02-01 10:05:39','exe','1620348684338491392','redis-server','/',0,'2023-01-31 17:10:05',1),('1620348691527528448','7959c126-44dd-43ef-af18-de41aafde8fa',994048,'2023-02-01 10:05:39','dwg','1620348691489779712','test','/',0,'2023-01-31 17:10:07',1),('1620348720778604544','7ac40ca0-a060-4b54-bf71-46be5aec2af2',47992,'2023-02-01 10:05:39','exe','1620348720745050112','ksolaunch','/',0,'2023-01-31 17:10:14',1),('1620604379004747776','5f61bbe1-cc2d-4136-a17d-8dd728deaeef',583038,'2023-02-01 10:13:41','exe','1620604378950221824','redis-cli','/',0,'2023-02-01 10:06:07',1),('1620606318761295872','42acab53-2b0e-47c8-910b-1c121b2acbe7',428986,'2023-02-01 13:17:51','txt','1620606318723547136','server_log','/',0,'2023-02-01 10:13:50',1),('1620606577465966592','b50adff1-6e25-4e5e-be99-d9eb34d9656c',510434,'2023-02-01 15:34:21','dxf','1620606577432412160','东胜竣工图00','/',0,'2023-02-01 10:14:52',1),('1620612153612779520','4038f550-38be-4279-9fc7-23d24588e7ed',606414,'2023-02-01 15:34:21','doc','1620612153579225088','新建 DOC 文档','/',0,'2023-02-01 10:37:01',1),('1620651227853713408','00eec006-5c11-499a-a760-9c17da139a94',71760,'2023-02-01 15:34:21','xlsx','1620651227794993152','测试','/',0,'2023-02-01 13:12:17',1),('1620653403078488064','4722e0a4-ca9d-49d8-bf32-309e23018ad3',93071,'2023-02-01 15:34:21','',NULL,'问问','/',1,'2023-02-01 13:20:56',1),('1620665345985851392','c34ae085-43cc-4761-8e63-d4b8f31288fe',877271,'2023-02-01 15:34:30','txt','1620653384673882112','1','/',0,'2023-02-01 14:08:23',1),('1620670141694341120','0a3da600-92ad-42ea-9add-2697eb26b4dd',853292,'2023-02-01 14:28:27','png','1619986368455532544','ss','/',0,'2023-02-01 14:27:27',1),('1620670466882924544','6487bd70-c287-4986-b0fd-b8bb0465a97d',649769,'2023-02-01 15:34:30','png','1620670466832592896','1','/',0,'2023-02-01 14:28:44',1),('1620676574657769472','213e131f-3353-4081-ae16-27302202c5f0',642818,'2023-02-01 15:34:30','sql','1620348669259968512','qwfile','/',0,'2023-02-01 14:53:00',1),('1620676689481035776','cb147982-cedc-4561-b86b-0cb79b10ca0a',175920,'2023-02-01 15:34:30','docx','1620676689430704128','2233','/',0,'2023-02-01 14:53:28',1),('1620679381771218944','4e5fa233-6d54-4be6-8643-4fc1edba16e0',342824,'2023-02-01 15:34:30','sql','1620348678181253120','ry-vue1','/',0,'2023-02-01 15:04:10',1),('1620682281415204864','238231ad-c314-47e1-ba77-982c46d21001',778395,'2023-02-01 15:34:30','sql','1620348670040109056','ry-vue','/',0,'2023-02-01 15:15:41',1),('1620687053442629632','4e7be7d7-fbc8-4754-9110-5029cc16d4c3',853007,'2023-02-01 16:06:19','ttf','1619986368455532544','s','/',0,'2023-02-01 15:34:39',1),('1620687054688337920','3bc895f1-9445-495f-ada7-a8220f2b5f1d',953840,'2023-02-01 16:06:19','png','1620670466832592896','1','/',0,'2023-02-01 15:34:39',1),('1620687054717698048','555af3c5-9e6f-4ba4-a670-5640d37d5f81',251342,'2023-02-01 16:06:19','sql','1620348670040109056','ry-vue','/',0,'2023-02-01 15:34:39',1),('1620687055204237312','54f8c799-4cb5-4a2f-a931-9bf0a2b05d97',20654,'2023-02-01 16:06:19','sql','1620348678181253120','ry-vue1','/',0,'2023-02-01 15:34:39',1),('1620687273018638336','8d39a6bc-3dcc-4fdc-861e-7c840fffdf84',74730,'2023-02-01 16:06:19','',NULL,'12','/',1,'2023-02-01 15:35:31',1),('1620692397153697792','650e60c5-d629-4531-90d7-6fc1dd745f87',577883,'2023-02-01 16:06:19','dwg','1620348691489779712','test','/',0,'2023-02-01 15:55:53',1),('1620695047148417024',NULL,0,NULL,'sql','1620348528654315520','tb_GangGui','/',0,'2023-02-01 16:06:24',1),('1620704837924827136',NULL,0,NULL,'png','1620670466832592896','1','/',0,'2023-02-01 16:45:19',1),('1620716670874300416',NULL,0,NULL,'docx','1620716670802997248','2','/',0,'2023-02-01 17:32:20',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

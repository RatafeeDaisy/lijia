/*
SQLyog Professional v12.09 (64 bit)
MySQL - 8.0.28 : Database - travel
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`travel` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `travel`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '管理员用户名',
  `pwd` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '管理员密码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

/*Data for the table `admin` */

insert  into `admin`(`id`,`name`,`pwd`) values (1,'mr','pbkdf2:sha256:50000$LFvhdkxn$aac81a63a59988e83c9b26e9ec7b91295dc2d6d93c4016755a653f42efa0c7c8');

/*Table structure for table `adminlog` */

DROP TABLE IF EXISTS `adminlog`;

CREATE TABLE `adminlog` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '管理员日志id',
  `admin_id` int DEFAULT NULL COMMENT '管理员id',
  `ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'ip地址',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `ix_adminlog_addtime` (`addtime`),
  KEY `admin_id` (`admin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3;

/*Data for the table `adminlog` */

insert  into `adminlog`(`id`,`admin_id`,`ip`,`addtime`) values (20,1,'127.0.0.1','2023-05-14 17:05:19'),(19,1,'127.0.0.1','2023-03-07 21:51:09'),(18,1,'127.0.0.1','2023-03-02 19:09:06'),(17,1,'127.0.0.1','2023-02-23 15:22:32'),(16,1,'127.0.0.1','2023-02-10 11:14:28'),(21,1,'127.0.0.1','2023-11-30 09:24:54'),(22,1,'127.0.0.1','2023-11-30 11:27:34'),(23,1,'127.0.0.1','2023-11-30 11:49:04'),(24,1,'127.0.0.1','2023-11-30 14:20:30'),(25,1,'127.0.0.1','2023-11-30 14:48:32'),(26,1,'127.0.0.1','2023-11-30 14:49:09');

/*Table structure for table `alembic_version` */

DROP TABLE IF EXISTS `alembic_version`;

CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL,
  PRIMARY KEY (`version_num`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

/*Data for the table `alembic_version` */

insert  into `alembic_version`(`version_num`) values ('423caff1b936');

/*Table structure for table `area` */

DROP TABLE IF EXISTS `area`;

CREATE TABLE `area` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '地区id',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '地区名',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  `is_recommended` tinyint(1) DEFAULT '0' COMMENT '是否推荐',
  `introduction` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '简介',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `ix_area_addtime` (`addtime`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;

/*Data for the table `area` */

insert  into `area`(`id`,`name`,`addtime`,`is_recommended`,`introduction`) values (1,'北京','2023-01-22 12:48:16',1,'今日的北京，已发展成为一座现代化的大都市：北京大学、清华大学、中国科学院等教育和科研机构座落于北京市区；金融街是中国金融监管机构办公地点和金融业聚集地；北京商务中心区是北京经济的象征；798艺术区是世界知名的当代艺术中心；此外，中国国家大剧院、北京首都国际机场3号航站楼、中央电视台总部大楼、“鸟巢”、“水立方”、中国尊等具有现代风格的建筑成为古老北京新的名片。每年有超过1亿4700万人到北京旅游。'),(2,'长春','2023-01-22 12:48:16',0,'长春，被誉为“北国春城”，绿化率居于亚洲大城市前列，中国四大园林城市之一；连续十次蝉联“中国最具幸福感城市”；“中国制造2025”试点城市；“首批全国城市设计试点城市”；位列《2015中国自然指数》中国十大科研城市第六位。'),(3,'天津','2023-01-22 12:48:16',1,'这是天津'),(6,'上海','2023-02-09 19:49:47',0,'上海'),(7,'成都','2023-02-09 19:49:54',0,'成都'),(8,'三亚','2023-02-09 19:49:57',0,'三亚'),(9,'广州','2023-02-09 19:50:01',0,'广州'),(10,'重庆','2023-02-09 19:50:05',0,'重庆'),(11,'深圳','2023-02-09 19:50:09',0,'深圳'),(12,'西安','2023-02-09 19:50:13',0,'西安'),(13,'杭州','2023-02-09 19:50:17',0,'杭州'),(14,'厦门','2023-02-09 19:50:21',0,'厦门'),(15,'武汉','2023-02-09 19:50:24',0,'武汉'),(16,'大连','2023-02-09 19:50:28',0,'大连'),(17,'苏州','2023-02-09 19:50:31',0,'苏州'),(19,'南京','2023-02-09 19:50:43',0,'南京'),(20,'香港','2023-02-09 19:50:47',0,'香港'),(21,'桂林','2023-02-09 19:50:50',0,'桂林'),(22,'昆明','2023-02-09 19:50:54',0,'昆明');

/*Table structure for table `collect` */

DROP TABLE IF EXISTS `collect`;

CREATE TABLE `collect` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '收藏id',
  `scenic_id` int DEFAULT NULL COMMENT '景区id',
  `user_id` int DEFAULT NULL COMMENT '用户id',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `ix_collect_addtime` (`addtime`),
  KEY `scenic_id` (`scenic_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb3;

/*Data for the table `collect` */

insert  into `collect`(`id`,`scenic_id`,`user_id`,`addtime`) values (5,8,8,'2023-02-10 11:11:59'),(6,6252,8,'2023-05-14 17:05:03'),(7,9,8,NULL),(8,10,8,NULL),(9,11,8,NULL),(10,10,9,NULL),(11,11,9,NULL),(12,12,9,NULL),(13,13,9,NULL),(14,14,9,NULL),(15,15,9,NULL),(16,10,10,NULL),(17,11,10,NULL),(18,12,10,NULL),(19,22,10,NULL),(20,13,10,NULL),(21,23,10,NULL),(22,14,10,NULL),(23,14,11,NULL),(24,15,11,NULL),(25,22,11,NULL),(26,10,11,NULL),(27,8,11,NULL),(28,9,11,NULL),(29,12,11,NULL),(30,26,11,NULL),(31,35,11,NULL),(32,35,12,NULL),(33,22,12,NULL),(34,14,12,NULL),(35,15,12,NULL),(36,55,12,NULL),(37,33,12,NULL),(38,36,12,NULL);

/*Table structure for table `oplog` */

DROP TABLE IF EXISTS `oplog`;

CREATE TABLE `oplog` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '日志id',
  `admin_id` int DEFAULT NULL COMMENT '管理员id',
  `ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'ip地址',
  `reason` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '内容',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `ix_oplog_addtime` (`addtime`),
  KEY `admin_id` (`admin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb3;

/*Data for the table `oplog` */

insert  into `oplog`(`id`,`admin_id`,`ip`,`reason`,`addtime`) values (32,1,'127.0.0.1','添加地区桂林','2023-02-09 19:50:50'),(31,1,'127.0.0.1','添加地区香港','2023-02-09 19:50:47'),(30,1,'127.0.0.1','添加地区南京','2023-02-09 19:50:43'),(29,1,'127.0.0.1','添加地区青岛','2023-02-09 19:50:35'),(28,1,'127.0.0.1','添加地区苏州','2023-02-09 19:50:31'),(27,1,'127.0.0.1','添加地区大连','2023-02-09 19:50:28'),(26,1,'127.0.0.1','添加地区武汉','2023-02-09 19:50:24'),(25,1,'127.0.0.1','添加地区厦门','2023-02-09 19:50:21'),(24,1,'127.0.0.1','添加地区杭州','2023-02-09 19:50:17'),(23,1,'127.0.0.1','添加地区西安','2023-02-09 19:50:13'),(22,1,'127.0.0.1','添加地区深圳','2023-02-09 19:50:09'),(21,1,'127.0.0.1','添加地区重庆','2023-02-09 19:50:05'),(20,1,'127.0.0.1','添加地区广州','2023-02-09 19:50:01'),(19,1,'127.0.0.1','添加地区三亚','2023-02-09 19:49:57'),(18,1,'127.0.0.1','添加地区成都','2023-02-09 19:49:54'),(17,1,'127.0.0.1','添加地区上海','2023-02-09 19:49:47'),(33,1,'127.0.0.1','添加地区昆明','2023-02-09 19:50:54'),(34,1,'127.0.0.1','删除地区青岛','2023-11-30 13:26:30');

/*Table structure for table `rec` */

DROP TABLE IF EXISTS `rec`;

CREATE TABLE `rec` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` char(11) DEFAULT NULL,
  `scenic_id` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `rating` char(55) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `rec` */

insert  into `rec`(`id`,`user_id`,`scenic_id`,`rating`) values (1,'8','14','1.15042366906148'),(2,'8','12','1.15042366906148'),(3,'8','15','0.812361967170069'),(4,'8','22','0.785275297391365'),(5,'8','13','0.703210073561517'),(6,'9','22','1.62445450368646'),(7,'9','8','0.909479425621928'),(8,'9','9','0.909479425621928'),(9,'9','35','0.852937753876001'),(10,'9','23','0.771516749810459'),(11,'10','15','1.56118366620371'),(12,'10','8','0.842014332570376'),(13,'10','9','0.842014332570376'),(14,'10','35','0.789666916393255'),(15,'10','26','0.50395263067897'),(16,'11','11','1.49549728013074'),(17,'11','13','1.04828368463079'),(18,'11','23','0.50395263067897'),(19,'11','55','0.50395263067897'),(20,'11','33','0.50395263067897'),(21,'12','10','1.09827361631744'),(22,'12','12','1.09827361631744'),(23,'12','11','0.594320985638469'),(24,'12','13','0.594320985638469'),(25,'12','8','0.50395263067897');

/*Table structure for table `request_log` */

DROP TABLE IF EXISTS `request_log`;

CREATE TABLE `request_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `method` varchar(10) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  `remote_addr` varchar(255) DEFAULT NULL,
  `sqlInjection` int DEFAULT '0',
  `risk_level` varchar(10) DEFAULT '无',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `request_log` */

insert  into `request_log`(`id`,`url`,`method`,`timestamp`,`remote_addr`,`sqlInjection`,`risk_level`) values (1,'http://127.0.0.1:5000/login/','GET','2023-10-08 09:02:11','127.0.0.1',0,'无'),(2,'http://127.0.0.1:5000/login/?1%23PTTmJopxdWJ\nAND%23cWfcVRPV\n9227=9227','GET','2023-10-08 09:02:22','127.0.0.1',1,'低危'),(3,'http://127.0.0.1:5000/login/','GET','2023-10-08 09:02:29','127.0.0.1',0,'无'),(4,'http://127.0.0.1:5000/','GET','2023-10-08 09:44:02','127.0.0.1',0,'无'),(5,'http://127.0.0.1:5000/','GET','2023-10-08 09:45:20','127.0.0.1',0,'无'),(6,'http://127.0.0.1:5000/','GET','2023-10-08 09:48:19','127.0.0.1',0,'无'),(7,'http://127.0.0.1:5000/','GET','2023-10-24 02:10:52','127.0.0.1',0,'无'),(8,'http://127.0.0.1:5000/login/','GET','2023-10-24 02:11:23','127.0.0.1',0,'无'),(9,'http://127.0.0.1:5000/','GET','2023-10-24 02:12:10','127.0.0.1',0,'无'),(10,'http://127.0.0.1:5000/','GET','2023-10-24 02:13:42','127.0.0.1',0,'无'),(11,'http://127.0.0.1:5000/?star=1','GET','2023-10-24 02:13:44','127.0.0.1',1,'低危'),(12,'http://127.0.0.1:5000/','GET','2023-10-24 02:13:50','127.0.0.1',0,'无'),(13,'http://127.0.0.1:5000/','GET','2023-10-24 02:13:52','127.0.0.1',0,'无'),(14,'http://127.0.0.1:5000/?star=1','GET','2023-10-24 02:13:53','127.0.0.1',1,'低危'),(15,'http://127.0.0.1:5000/','GET','2023-10-24 02:14:48','127.0.0.1',0,'无'),(16,'http://127.0.0.1:5000/login/','GET','2023-10-24 02:15:02','127.0.0.1',0,'无'),(17,'http://127.0.0.1:5000/','GET','2023-10-24 02:50:51','127.0.0.1',0,'无'),(18,'http://127.0.0.1:5000/login/','GET','2023-10-24 02:50:58','127.0.0.1',0,'无'),(19,'http://127.0.0.1:5000/','GET','2023-10-24 02:52:49','127.0.0.1',0,'无'),(20,'http://127.0.0.1:5000/login/','GET','2023-10-24 02:52:51','127.0.0.1',0,'无'),(21,'http://127.0.0.1:5000/login/?and 1=(select count(*) from admin where len(name)>0)','GET','2023-10-24 02:53:05','127.0.0.1',1,'中危'),(22,'http://127.0.0.1:5000/','GET','2023-10-24 02:53:08','127.0.0.1',0,'无');

/*Table structure for table `scenic` */

DROP TABLE IF EXISTS `scenic`;

CREATE TABLE `scenic` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '景区id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '景区标题',
  `star` int DEFAULT NULL COMMENT '星级',
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片',
  `introduction` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '简介',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '介绍内容',
  `address` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '地址',
  `is_hot` tinyint(1) DEFAULT '0' COMMENT '是否热门',
  `is_recommended` tinyint(1) DEFAULT '0' COMMENT '是否推荐',
  `area_id` int DEFAULT NULL COMMENT '所属地区id',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `logo` (`logo`),
  UNIQUE KEY `title` (`title`),
  KEY `ix_scenic_addtime` (`addtime`),
  KEY `area_id` (`area_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7094 DEFAULT CHARSET=utf8mb3;

/*Data for the table `scenic` */


/*Table structure for table `suggestion` */

DROP TABLE IF EXISTS `suggestion`;

CREATE TABLE `suggestion` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '意见id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '意见提出人',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮箱地址',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '内容',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `ix_suggestion_addtime` (`addtime`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;

/*Data for the table `suggestion` */

/*Table structure for table `travels` */

DROP TABLE IF EXISTS `travels`;

CREATE TABLE `travels` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '游记id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '游记标题',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '游记作者',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '游记内容',
  `scenic_id` int DEFAULT NULL COMMENT '对应景区id',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  KEY `ix_travels_addtime` (`addtime`),
  KEY `scenic_id` (`scenic_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

/*Data for the table `travels` */

insert  into `travels`(`id`,`title`,`author`,`content`,`scenic_id`,`addtime`) values (1,'北京不得不去的地方——故宫一日游','老冯','<p>【关于门票】<br />\r\n故宫门票价格：成人旺季60元，淡季40元，学生票全年20元。珍宝馆和钟表馆另外收费10元/人，学生证半价。<br />\r\n我们去的时候故宫还可以现场售票，回来以后就实行全网络售票参观了。<br />\r\n门票提前10天在网上预售，售完为止，一张身份证每个入院日限购一张门票。和其它博物馆一样，故宫博物院也是周一闭馆。<br />\r\n去之前建议关注一下故宫博物院的官网：http://gugong.228.com.cn/，尤其是跟我们一样自由行的游客，除了可以看到余票和购买门票，还能看到最新的一些消息公告，比如哪里闭馆哪里修缮（虽然有些宫殿临时维修不在官网通告，但有总好过无嘛），对规划路线有很大的帮助。<br />\r\n我们是在美团上提前买的大门票和珍宝馆的门票，刷身份证就可以入园。<br />\r\n【没什么用的讲解器】<br />\r\n过了安检就能看到讲解器服务处。<br />\r\n自助讲解器租赁价格：汉语、粤语、闽南语版20.00元/台，其他语种40.00元/台，免押金，参观完毕在出院前将讲解器归还即可。<br />\r\n我和泡泡一人租了一台，使用下来的感受是缺点多过优点，可以不租。<br />\r\n虽说它是自动感应的，走到哪里讲到哪里，讲解的内容也挺不错，有多个版本，我们听的是王刚老师讲的故事版，生动有趣。但是它的缺点也很明显。<br />\r\n1、因为是单耳佩戴，所以在环境嘈杂的地方，即使声音开的很大，也经常听不清楚说了什么。<br />\r\n2、走到一些建筑密集的地方，讲解器会错乱崩溃。比如我们在珍妃井附近转了很久，它始终就识别不到我们所在的位置。比如我们到了宁寿宫，它却讲的是皇极殿的内容。泡泡一度以为是不是讲解器坏了，还跑到服务处换了一个，工作人员倒是很耿直，说这个就是这样的，不是很灵，到了不放他们也没办法。因为是自动定位讲解，又不能选择自己想听的地方，所以就导致我们很多地方到最后也没能听到讲解。<br />\r\n3、所有内容只讲一次，如果你没听得清，或者中途不小心耳机掉下来，漏听了，也只能自认倒霉。<br />\r\n其实故宫只要不闭馆，根本不可能有人少的时候，一个又一个旅行团，你想不听导游的讲解都很难。当然，这只是我们的看法，讲解器本身不贵，想要的话也可以租一个备用，权当地图用也行。<br />\r\n我和泡泡在故宫走了一整天。从早上的人头攒动待到晚上的人去楼空。<br />\r\n很多人说故宫没意思，就是看看长的差不多的房子。我倒觉得这一趟来的超值。<br />\r\n我建议对历史，尤其是明清史感兴趣的亲们，可以多预留一些时间给这座紫禁城，它会还你无限惊喜。</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img alt=\"\" class=\"left\" src=\"/static/uploads/ckeditor/2018032411373051faede1c35748c7b2347dc0c6397e29.png\" style=\"height:296px; width:660px\" /></p>\r\n',1,'2023-01-22 13:49:32'),(2,'最轻松愉快的方式游览故宫','Andy','<p>午门是紫禁城的正门，也是今天故宫博物院的正门。位于紫禁城乃至京师南北轴线，始建于明朝永乐十八年（1420年）。平面呈巨大的&ldquo;凹&rdquo;字形，中间广场面积超过9900平方米。在阳光普照的日子走到这里，如果看不到两遍雁翅楼的阴影，便是午门最亮丽的时候，也就是它的名字&mdash;&mdash;正午之门，充分显示它的阳刚之气。<br />\r\n<br />\r\n午门门楼连台通高近37.9米，正中的主楼属重庑殿顶（五脊四面坡），面阔九间（60.05米），进深五间（25米），亦为最尊贵的九五之数。按&ldquo;九&rdquo;为数理中阳数之极，&ldquo;五&rdquo;居阳数之中（王者之数），可见午门在位置上的重要性。<br />\r\n<br />\r\n午门面向正南，五行属火，是积极的红色。不只红墙，檐下彩绘也以红色为主，显示光明正大。按传统四灵兽的方位（东青龙，西白虎，南朱雀，北玄武），南方既以朱雀（凤凰）为象征，午门由5座楼阁组成，高低错落，左右翼然，形若大鸟展翅，故又称五凤楼。<br />\r\n<br />\r\n城楼立面大小形制与天安门相若，但没有像天安门那样五门相列，并采取&ldquo;中开三门&rdquo;，正中门卫皇帝专用御道，只有皇后在大婚时，可以乘坐喜轿从大清门中经过进宫一次。另外通过殿试选拔的状元、榜眼、探花可从中门出宫一次。东侧门供文武官员出入，西侧门供宗师王公出入。（撰文：《紫禁城100》）<br />\r\n<br />\r\n关于午门的以讹传讹<br />\r\n电视剧里经常能听到&ldquo;推出午门斩首&rdquo;这样的圣令，但是午门真的是用来处决死刑犯的吗？其实不尽然。午门主要的用途有三：其一朝廷每年冬天会在午门举行隆重的颁朔仪式（也就是颁布日历）；其二战争凯旋后，会在午门前广场举行受俘仪式，彰显大国威仪；其三廷杖触怒皇帝的大臣。廷杖通俗地说就是用棍子打屁股的一种刑罚。有趣的是主事廷杖的太监会根据收取贿赂与否，喊出&ldquo;着实打&rdquo;和&ldquo;用心打&rdquo;，&ldquo;着实打&rdquo;或者苟活，&ldquo;用心打&rdquo;必遭打死。</p>\r\n\r\n<p><img alt=\"\" src=\"/static/uploads/ckeditor/2018032413245286a7d302f4654833bf1873e40249ce63.png\" style=\"height:305px; width:656px\" /></p>\r\n',1,'2023-01-24 13:24:56');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `pwd` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮箱',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  `face` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '头像',
  `info` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '简介',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户名',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `face` (`face`),
  KEY `ix_user_addtime` (`addtime`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

/*Data for the table `user` */

insert  into `user`(`id`,`pwd`,`email`,`addtime`,`face`,`info`,`phone`,`username`) values (10,'pbkdf2:sha256:50000$vaG8nXlJ$ea40a41d2633a041290e4a3f7b3286527c982eecd923a4201a1e55e5e4c24b2a','xiao2@qq.com','2023-05-17 20:26:42',NULL,NULL,NULL,'xiao2'),(9,'pbkdf2:sha256:50000$BNQBd62p$d77d64cb8ea08a6a49fb74812fbd17dfd82b2fc9beaf05cf21cab88fa33156d9','xiao1@qq.com','2023-05-17 20:26:32',NULL,NULL,NULL,'xiao1'),(8,'pbkdf2:sha256:50000$OWjZJS82$2b48300a5bdd34c55c0c691400c2096782cd26cc3f1f95bad1f2467fdb6d0edd','xiaoi@qq.com','2023-02-10 11:11:08',NULL,NULL,NULL,'小i'),(11,'pbkdf2:sha256:50000$hSnR3hrz$58cb2cbeefb422b77d37bad8e1d5cf5889adca8f66957d956575060803fe7fdd','xiao3@qq.com','2023-05-17 20:26:49',NULL,NULL,NULL,'xiao3'),(12,'pbkdf2:sha256:50000$DQJwPT7B$cd78e8d431bd116a144f7feb812e6b6350d99d38853cecef266c307f972b35c5','xiao4@qq.com','2023-05-17 20:26:55',NULL,NULL,NULL,'xiao4');

/*Table structure for table `userlog` */

DROP TABLE IF EXISTS `userlog`;

CREATE TABLE `userlog` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '日志id',
  `user_id` int DEFAULT NULL COMMENT '用户id',
  `ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'ip地址',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `ix_userlog_addtime` (`addtime`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;

/*Data for the table `userlog` */

insert  into `userlog`(`id`,`user_id`,`ip`,`addtime`) values (16,8,'127.0.0.1','2023-05-17 20:39:07'),(15,8,'127.0.0.1','2023-05-14 17:01:19'),(14,8,'127.0.0.1','2023-05-14 17:01:09'),(13,8,'127.0.0.1','2023-03-07 21:50:48'),(12,8,'127.0.0.1','2023-03-02 19:08:13'),(11,8,'127.0.0.1','2023-02-23 15:21:49'),(10,8,'127.0.0.1','2023-02-23 15:20:32'),(9,8,'127.0.0.1','2023-02-10 11:11:22'),(17,8,'127.0.0.1','2023-05-17 20:40:01'),(18,10,'127.0.0.1','2023-11-30 11:17:54');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
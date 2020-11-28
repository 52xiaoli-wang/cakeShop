-- Host: 127.0.0.1    Database: cakeshop
-- ------------------------------------------------------
-- Server version	5.7.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `user`
--
DROP DATABASE IF EXISTS `CakeShop`;

CREATE DATABASE IF NOT EXISTS `CakeShop` DEFAULT CHARACTER SET `utf8`;

USE `CakeShop`;

--用户模块

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `user`(
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `avatar` varchar(50) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
--Dumping data for table `user`
--
LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `cake_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cake_type`(
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '类型ID,主键自增',
  `type_name` varchar(30) NOT NULL COMMENT '类型名称,唯一',
  `type_avatar` varchar(30) NOT NULL COMMENT '类型图片',
  PRIMARY KEY(`id`),
  UNIQUE key `type_name` (`type_name`)
)ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xzqa_category`
--

LOCK TABLES `cake_type` WRITE;
/*!40000 ALTER TABLE `cake_type` DISABLE KEYS */;
INSERT INTO `cake_type` (`id`,`type_name`,`type_avatar`) VALUES
(1,'水果蛋糕','sg.png'),(2,'拿破仑蛋糕','npl.png'),(3,'儿童蛋糕','et.png'),(4,'千层蛋糕','qc.png'),(5,'慕斯蛋糕','ms.png'),(6,'红丝绒蛋糕','hsr.png'),(7,'奶油蛋糕','ny.png'),(8,'网红蛋糕','wh.png'),(9,'祝寿蛋糕','zs.png'),(10,'全部','qb.png');
/*!40000 ALTER TABLE `cake_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

--
-- Table structure for table `cake_goods`
--

--商品模块

DROP TABLE IF EXISTS `cake_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `cake_goods`(
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品ID,主键且自增',
  `cake_name` varchar(50) NOT NULL COMMENT '蛋糕名称',
  `cake_newPrice` int(10) NOT NULL COMMENT '蛋糕新价格',
  `cake_oldPrice` int(10) NOT NULL COMMENT '蛋糕旧价格',
  `cake_number` varchar(50) NOT NULL COMMENT '蛋糕编号,货号',
  `cake_materials` varchar(50) NOT NULL COMMENT '蛋糕材料',
  `cake_thumbnail` varchar(50) NOT NULL COMMENT '蛋糕缩略图',
  `cake_lunImage` varchar(255) NOT NULL COMMENT '蛋糕轮播图片',
  `cake_detailsImage` varchar(255) NOT NULL COMMENT '蛋糕详情图片',
  `type_id` int(10) unsigned NOT NULL COMMENT '蛋糕类型ID',
  PRIMARY KEY (`id`)
)ENGINE = InnoDB AUTO_INCREMENT = 1107 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cake_goods`
--

LOCK TABLES `cake_goods` WRITE;
/*!40000 ALTER TABLE `cake_goods` DISABLE KEYS */;
INSERT INTO `cake_goods` (`id`,`cake_name`,`cake_newPrice`,`cake_oldPrice`,`cake_number`,`cake_materials`,`cake_thumbnail`,`cake_lunImage`,`cake_detailsImage`,`type_id`) VALUES (1,'ins风小清新奶油蛋糕',169,203,'Jd001308','内层原味海绵蛋糕胚+原味乳脂奶油 (含水果果肉填充) 叠层, 外层芒果味乳脂奶油等装饰。','19-08-25.jpg','19-08-25.jpg#19-07-25.jpg','19-08-25.jpg#19-07-25.jpg#19-04-18.jpg#19-04-03.jpg#19-04-09.jpg#19-04-13.jpg',7),(2,'ins风小清新奶油蛋糕',179,215,'Jd001307','ins风小清新奶油蛋糕，内层原味海绵蛋糕胚+抹茶乳脂奶油叠层，表层原味乳脂奶油+抹茶奶油+柠檬点缀装饰。','19-10-28.jpg','19-10-28.jpg#19-10-33.jpg','19-10-36.jpg#19-10-41.jpg#19-04-18.jpg#19-04-03.jpg#19-04-09.jpg#19-04-13.jpg',7),(3,'小熊儿童奶油蛋糕',168,202,'Jd001297','可爱小熊儿童奶油蛋糕，内层原味海绵蛋糕胚+原味乳脂奶油 (含芒果果肉填充) ,表层奥利奥+巧克力+草莓装饰。','19-12-30.jpg','19-12-23.jpg#19-12-27.jpg#19-12-33.jpg#19-12-36.jpg','19-12-23.jpg#19-12-27.jpg#19-12-30.jpg#19-12-33.jpg#19-12-36.jpg#19-04-18.jpg#19-04-03.jpg#19-04-09.jpg#19-04-13.jpg',7),(4,'浓情丝语-奶油水果巧克力蛋糕',199,239,'ECS000051','奶油水果巧克力"爱心形"蛋糕，内层水果填充，表面时令水果巧克力装饰。','19-14-01.jpg','19-14-01.jpg#19-14-07.jpg#19-14-10.jpg#19-14-12.jpg#19-14-15.jpg','19-14-01.jpg#19-14-07.jpg#19-14-10.jpg#19-14-12.jpg#19-14-15.jpg#19-04-18.jpg#19-04-03.jpg#19-04-09.jpg#19-04-13.jpg',1),(5,'水蜜桃奶油蛋糕',229,275,'Jd001090','蛋糕胚+奶油(含水果果肉)叠加，表层丰满水蜜桃球、绿叶装饰。','19-16-11.jpg','19-16-11.jpg#19-16-08.jpg#19-16-15.jpg','19-16-11.jpg#19-16-08.jpg#19-16-15.jpg#19-04-18.jpg#19-04-03.jpg#19-04-09.jpg#19-04-13.jpg',7),(6,'缤纷之果-圆形水果蛋糕',188,244,'ESC000043','圆形水果蛋糕，时令水果装饰。','19-16-47.jpg','19-16-47.jpg#19-16-50.jpg#19-16-53.jpg#19-16-57.jpg','19-16-47.jpg#19-16-50.jpg#19-16-53.jpg#19-16-57.jpg#19-04-18.jpg#19-04-03.jpg#19-04-09.jpg#19-04-13.jpg',1),(7,'草莓棉花糖鲜奶蛋糕',178,214,'Jd001294','圆形鲜奶蛋糕，内层原味海绵蛋糕胚+草莓乳脂奶油(含水果果肉)叠加,表层棉花糖、草莓、蓝莓装饰。','19-30-55.jpg','19-30-55.jpg#19-30-59.jpg#19-31-02.jpg','19-30-55.jpg#19-30-59.jpg#19-31-02.jpg#19-04-18.jpg#19-04-03.jpg#19-04-09.jpg#19-04-13.jpg',7),(8,'小狮子儿童鲜奶蛋糕',199,239,'Jd001289','内层蛋糕胚+奶油叠加(含水果果肉填充),表层小狮子主题装饰。','19-33-18.jpg','19-33-18.jpg#19-33-17.jpg','19-33-18.jpg#19-33-17.jpg#19-04-18.jpg#19-04-03.jpg#19-04-09.jpg#19-04-13.jpg',1),(9,'紫色恋人-圆形紫色鲜奶蛋糕',188,226,'ESC000038','圆形紫色鲜奶蛋糕,多朵淡紫色奶油玫瑰装饰,紫色奶油周边','19-34-04.jpg','19-34-04.jpg#19-34-05.jpg','19-34-04.jpg#19-34-05.jpg#19-04-18.jpg#19-04-03.jpg#19-04-09.jpg#19-04-13.jpg',8),(10,'妈妈是女王手绘蛋糕',259,311,'Jd001343','ins风网红蛋糕,经典原味蛋糕胚+原味乳脂奶油(含水果果肉填充)叠层,表层可爱手绘图案装饰。','19-34-31.jpg','19-34-31.jpg#19-34-32.jpg','19-34-31.jpg#19-34-32.jpg#19-04-18.jpg#19-04-03.jpg#19-04-09.jpg#19-04-13.jpg',8),(11,'奥利奥鲜奶水果蛋糕',299,359,'Jd001290','圆形奥利奥鲜奶水果蛋糕,原味海绵蛋糕胚+奥利奥乳脂奶油(含法式薄脆片填充),表层草莓、蓝莓、奥利奥碎等装饰。(本款产品适宜食用温度为0-4摄氏度之间,请收到蛋糕后立即放入冰箱储存)','19-35-08.jpg','19-35-08.jpg#19-35-27.jpg#19-35-30.jpg#19-35-33.jpg','19-35-08.jpg#19-35-27.jpg#19-35-30.jpg#19-35-33.jpg#19-04-18.jpg#19-04-03.jpg#19-04-09.jpg#19-04-13.jpg',1),(12,'以梦为马网红蛋糕',399,479,'Jd001315','内层原味海绵蛋糕胚+原味乳脂奶油(含水果果肉)叠层,表层独角兽玩偶、气球摆件等装饰。(本款产品适宜食用温度为0-8摄氏度之间,请收到蛋糕后立即放入冰箱储存)','19-37-01.jpg','19-37-01.jpg#19-37-06.jpg#19-37-08.jpg#19-37-11.jpg','19-37-01.jpg#19-37-06.jpg#19-37-08.jpg#19-37-11.jpg#19-04-18.jpg#19-04-03.jpg#19-04-09.jpg#19-04-13.jpg',7);
/*!40000 ALTER TABLE `cake_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flower_goods`
--

DROP TABLE IF EXISTS `flower_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `flower_goods`(
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品ID,主键且自增',
  `flower_name` varchar(50) NOT NULL COMMENT '鲜花名称',
  `flower_newPrice` int(10) NOT NULL COMMENT '鲜花新价格',
  `flower_oldPrice` int(10) NOT NULL COMMENT '鲜花旧价格',
  `flower_number` varchar(50) NOT NULL COMMENT '鲜花编号,货号',
  `flower_materials` varchar(50) NOT NULL COMMENT '鲜花材料',
  `flower_pack` varchar(50) NOT NULL COMMENT '鲜花包装',
  `flower_language` varchar(50) NOT NULL COMMENT '鲜花花语',
  `flower_thumbnail` varchar(50) NOT NULL COMMENT '鲜花缩略图',
  `flower_lunImage` varchar(50) NOT NULL COMMENT '鲜花轮播图片',
  `flower_detailsImage` varchar(50) NOT NULL COMMENT '鲜花详情图片',
  PRIMARY KEY (`id`)
)ENGINE = InnoDB AUTO_INCREMENT = 1107 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flower_goods`
--

LOCK TABLES `flower_goods` WRITE;
/*!40000 ALTER TABLE `flower_goods` DISABLE KEYS */;
INSERT INTO `flower_goods` (`id`,`flower_name`,`flower_newPrice`,`flower_oldPrice`,`flower_number`,`flower_materials`,`flower_pack`,`flower_language`,`flower_thumbnail`,`flower_lunImage`,`flower_detailsImage`) VALUES (1,'不变的心-19支精品红玫瑰',289,347,'ECS000178','19支红玫瑰,搭配适量情人草、南天竹装饰','白色硬纸+咖啡色硬纸包装,藏青色缎带束扎。','真正的情侣就是:当他们在一起的时候一小时是一秒钟;而当他们分开的时候一秒钟就是一小时,这正是我和你在一起的感觉,爱你永不变心!','16-32-00.jpg','16-32-00.jpg','16-32-00.jpg#16-32-26.jpg#16-32-31.jpg#16-32-34.jpg#16-32-37.jpg#16-32-41.png#16-32-45.png#16-32-48.png#16-32-52.png#16-32-55.png#16-33-03.png#16-33-06.png#16-33-09.png#16-33-14.png#16-33-17.png#16-33-20.png#16-33-23.png#16-33-27.png#16-33-31.png#16-33-34.png#16-33-37.png#16-33-40.png#16-33-43.png#16-33-46.png#16-33-49.png#16-33-51.png#16-33-55.jpg');
/*!40000 ALTER TABLE `flower_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `feedback`(
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feedback_type` varchar(50) NOT NULL ,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `content` varchar(200) NOT NULL,
  `user_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
--Dumping data for table `feedback`
--

--
-- Table structure for table `shoppingCart`
--

--购物车模块

DROP TABLE IF EXISTS `shoppingCart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `shoppingCart`(
  `id` int(11) NOT NULL AUTO_INCREMENT,
 /*`user_id` int(10) unsigned NOT NULL COMMENT '用户ID',*/
  `cake_goods_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `cake_name` varchar(50) NOT NULL COMMENT '蛋糕名称',
  `cake_newPrice` int(10) NOT NULL COMMENT '蛋糕新价格',
  `checked` varchar(32) NOT NULL,
  `cake_num` int(32) NOT NULL COMMENT '数量',
  `cake_size` varchar(50) NOT NULL COMMENT '尺寸',
  `cake_thumbnail` varchar(50) NOT NULL COMMENT '蛋糕缩略图',
  `totalPrice` varchar(64) NOT NULL COMMENT '总价',
  PRIMARY KEY (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
--Dumping data for table `shoppingCart`
--

--
-- Table structure for table `orders`
--

--订单模块

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `orders`(
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` bigint NOT NULL COMMENT '订单编码',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `cake_goods_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `order_num` int(11) unsigned NOT NULL COMMENT '订单数量',
  `order_price` double NOT NULL COMMENT '订单价格',
  `order_time` bigint NOT NULL COMMENT '订单时间',
  PRIMARY KEY (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
--Dumping data for table `orders`
--

--
-- Table structure for table `collect`
--

--收藏模块

DROP TABLE IF EXISTS `collect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `collect`(
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `cake_goods_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `collect_time` bigint NOT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
--Dumping data for table `collect`
--
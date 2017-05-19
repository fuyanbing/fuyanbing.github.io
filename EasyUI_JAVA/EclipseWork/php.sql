/*
Navicat MySQL Data Transfer

Source Server         : mySQL
Source Server Version : 50530
Source Host           : localhost:3306
Source Database       : php

Target Server Type    : MYSQL
Target Server Version : 50530
File Encoding         : 65001

Date: 2017-05-08 13:32:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for contactbook
-- ----------------------------
DROP TABLE IF EXISTS `contactbook`;
CREATE TABLE `contactbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `job` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `office_phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qq` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `msn` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `address` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `memo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of contactbook
-- ----------------------------
INSERT INTO `contactbook` VALUES ('1', '姓名24', '百度24', '前端工程师', '13512894542', '15712894542', '010-1234567', '1204689638', 'abc123', '1204689638@qq.com', '2017-03-02', '北京朝阳', '无');
INSERT INTO `contactbook` VALUES ('3', '姓名61', '百度61', '前端工程师', '13512894542', '15712894542', '010-1234567', '1204689638', 'abc123', '1204689638@qq.com', '2017-03-02', '北京朝阳', '无');
INSERT INTO `contactbook` VALUES ('4', '姓名39', '百度39', '前端工程师', '13512894542', '15712894542', '010-1234567', '1204689638', 'abc123', '1204689638@qq.com', '2017-03-02', '北京朝阳', '无');
INSERT INTO `contactbook` VALUES ('5', '姓名25', '百度25', '前端工程师', '13512894542', '15712894542', '010-1234567', '1204689638', 'abc123', '1204689638@qq.com', '2017-03-02', '北京朝阳', '无');
INSERT INTO `contactbook` VALUES ('6', '姓名85', '百度85', '前端工程师', '13512894542', '15712894542', '010-1234567', '1204689638', 'abc123', '1204689638@qq.com', '2017-03-02', '北京朝阳', '无');
INSERT INTO `contactbook` VALUES ('7', '姓名93', '百度93', '前端工程师', '13512894542', '15712894542', '010-1234567', '1204689638', 'abc123', '1204689638@qq.com', '2017-03-02', '北京朝阳', '无');
INSERT INTO `contactbook` VALUES ('8', '姓名26', '百度26', '前端工程师', '13512894542', '15712894542', '010-1234567', '1204689638', 'abc123', '1204689638@qq.com', '2017-03-02', '北京朝阳', '无');
INSERT INTO `contactbook` VALUES ('9', '姓名97', '百度97', '前端工程师', '13512894542', '15712894542', '010-1234567', '1204689638', 'abc123', '1204689638@qq.com', '2017-03-02', '北京朝阳', '无');
INSERT INTO `contactbook` VALUES ('10', '姓名69', '百度69', '前端工程师', '13512894542', '15712894542', '010-1234567', '1204689638', 'abc123', '1204689638@qq.com', '2017-03-02', '北京朝阳', '无');
INSERT INTO `contactbook` VALUES ('11', '姓名5', '百度5', '前端工程师', '13512894542', '15712894542', '010-1234567', '1204689638', 'abc123', '1204689638@qq.com', '2017-03-02', '北京朝阳', '无');
INSERT INTO `contactbook` VALUES ('12', '姓名63', '百度63', '前端工程师', '13512894542', '15712894542', '010-1234567', '1204689638', 'abc123', '1204689638@qq.com', '2017-03-02', '北京朝阳', '无');
INSERT INTO `contactbook` VALUES ('13', '姓名97', '百度97', '前端工程师', '13512894542', '15712894542', '010-1234567', '1204689638', 'abc123', '1204689638@qq.com', '2017-03-02', '北京朝阳', '无');
INSERT INTO `contactbook` VALUES ('14', '姓名83', '百度83', '前端工程师', '13512894542', '15712894542', '010-1234567', '1204689638', 'abc123', '1204689638@qq.com', '2017-03-02', '北京朝阳', '无');
INSERT INTO `contactbook` VALUES ('15', '姓名32', '百度32', '前端工程师', '13512894542', '15712894542', '010-1234567', '1204689638', 'abc123', '1204689638@qq.com', '2017-03-02', '北京朝阳', '无');
INSERT INTO `contactbook` VALUES ('16', '姓名98', '百度98', '前端工程师', '13512894542', '15712894542', '010-1234567', '1204689638', 'abc123', '1204689638@qq.com', '2017-03-02', '北京朝阳', '无');
INSERT INTO `contactbook` VALUES ('17', '姓名34', '百度34', '前端工程师', '13512894542', '15712894542', '010-1234567', '1204689638', 'abc123', '1204689638@qq.com', '2017-03-02', '北京朝阳', '无');
INSERT INTO `contactbook` VALUES ('18', '姓名48', '百度48', '前端工程师', '13512894542', '15712894542', '010-1234567', '1204689638', 'abc123', '1204689638@qq.com', '2017-03-02', '北京朝阳', '无');
INSERT INTO `contactbook` VALUES ('19', '姓名59', '百度59', '前端工程师', '13512894542', '15712894542', '010-1234567', '1204689638', 'abc123', '1204689638@qq.com', '2017-03-02', '北京朝阳', '无');
INSERT INTO `contactbook` VALUES ('20', '姓名24', '百度24', '前端工程师', '13512894542', '15712894542', '010-1234567', '1204689638', 'abc123', '1204689638@qq.com', '2017-03-02', '北京朝阳', '无');
INSERT INTO `contactbook` VALUES ('21', '姓名70', '百度70', '前端工程师', '13512894542', '15712894542', '010-1234567', '1204689638', 'abc123', '1204689638@qq.com', '2017-03-02', '北京朝阳', '无');
INSERT INTO `contactbook` VALUES ('22', '姓名36', '百度36', '前端工程师', '13512894542', '15712894542', '010-1234567', '1204689638', 'abc123', '1204689638@qq.com', '2017-03-02', '北京朝阳', '无');
INSERT INTO `contactbook` VALUES ('23', '姓名18', '百度18', '前端工程师', '13512894542', '15712894542', '010-1234567', '1204689638', 'abc123', '1204689638@qq.com', '2017-03-02', '北京朝阳', '无');
INSERT INTO `contactbook` VALUES ('24', '姓名93', '百度93', '前端工程师', '13512894542', '15712894542', '010-1234567', '1204689638', 'abc123', '1204689638@qq.com', '2017-03-02', '北京朝阳', '无');
INSERT INTO `contactbook` VALUES ('25', '姓名12', '百度12', '前端工程师', '13512894542', '15712894542', '010-1234567', '1204689638', 'abc123', '1204689638@qq.com', '2017-03-02', '北京朝阳', '无');
INSERT INTO `contactbook` VALUES ('26', '姓名71', '百度71', '前端工程师', '13512894542', '15712894542', '010-1234567', '1204689638', 'abc123', '1204689638@qq.com', '2017-03-02', '北京朝阳', '无');
INSERT INTO `contactbook` VALUES ('27', '姓名96', '百度96', '前端工程师', '13512894542', '15712894542', '010-1234567', '1204689638', 'abc123', '1204689638@qq.com', '2017-03-02', '北京朝阳', '无');
INSERT INTO `contactbook` VALUES ('28', '姓名98', '百度98', '前端工程师', '13512894542', '15712894542', '010-1234567', '1204689638', 'abc123', '1204689638@qq.com', '2017-03-02', '北京朝阳', '无');
INSERT INTO `contactbook` VALUES ('29', '姓名20', '百度20', '前端工程师', '13512894542', '15712894542', '010-1234567', '1204689638', 'abc123', '1204689638@qq.com', '2017-03-02', '北京朝阳', '无');
INSERT INTO `contactbook` VALUES ('30', '姓名21', '百度21', '前端工程师', '13512894542', '15712894542', '010-1234567', '1204689638', 'abc123', '1204689638@qq.com', '2017-03-02', '北京朝阳', '无');
INSERT INTO `contactbook` VALUES ('31', '姓名25', '百度25', '前端工程师', '13512894542', '15712894542', '010-1234567', '1204689638', 'abc123', '1204689638@qq.com', '2017-03-02', '北京朝阳', '无');
INSERT INTO `contactbook` VALUES ('32', '姓名87', '百度87', '前端工程师', '13512894542', '15712894542', '010-1234567', '1204689638', 'abc123', '1204689638@qq.com', '2017-03-02', '北京朝阳', '无');
INSERT INTO `contactbook` VALUES ('33', '姓名4', '百度4', '前端工程师', '13512894542', '15712894542', '010-1234567', '1204689638', 'abc123', '1204689638@qq.com', '2017-03-02', '北京朝阳', '无');
INSERT INTO `contactbook` VALUES ('34', '姓名10', '百度10', '前端工程师', '13512894542', '15712894542', '010-1234567', '1204689638', 'abc123', '1204689638@qq.com', '2017-03-02', '北京朝阳', '无');
INSERT INTO `contactbook` VALUES ('35', '姓名91', '百度91', '前端工程师', '13512894542', '15712894542', '010-1234567', '1204689638', 'abc123', '1204689638@qq.com', '2017-03-02', '北京朝阳', '无');
INSERT INTO `contactbook` VALUES ('36', '姓名57', '百度57', '前端工程师', '13512894542', '15712894542', '010-1234567', '1204689638', 'abc123', '1204689638@qq.com', '2017-03-02', '北京朝阳', '无');
INSERT INTO `contactbook` VALUES ('37', '姓名23', '百度23', '前端工程师', '13512894542', '15712894542', '010-1234567', '1204689638', 'abc123', '1204689638@qq.com', '2017-03-02', '北京朝阳', '无');
INSERT INTO `contactbook` VALUES ('38', '姓名10', '百度10', '前端工程师', '13512894542', '15712894542', '010-1234567', '1204689638', 'abc123', '1204689638@qq.com', '2017-03-02', '北京朝阳', '无');
INSERT INTO `contactbook` VALUES ('39', '姓名27', '百度27', '前端工程师', '13512894542', '15712894542', '010-1234567', '1204689638', 'abc123', '1204689638@qq.com', '2017-03-02', '北京朝阳', '无');
INSERT INTO `contactbook` VALUES ('40', '姓名55', '百度55', '前端工程师', '13512894542', '15712894542', '010-1234567', '1204689638', 'abc123', '1204689638@qq.com', '2017-03-02', '北京朝阳', '无');
INSERT INTO `contactbook` VALUES ('41', '姓名27', '百度27', '前端工程师', '13512894542', '15712894542', '010-1234567', '1204689638', 'abc123', '1204689638@qq.com', '2017-03-09', '北京朝阳', '无');
INSERT INTO `contactbook` VALUES ('42', '姓名98', '百度98', '前端工程师', '13512894542', '15712894542', '010-1234567', '1204689638', 'abc123', '1204689638@qq.com', '2017-03-09', '北京朝阳', '无');
INSERT INTO `contactbook` VALUES ('43', '姓名99', '百度99', '前端工程师', '13512894542', '15712894542', '010-1234567', '1204689638', 'abc123', '1204689638@qq.com', '2017-03-09', '北京朝阳', '无');

-- ----------------------------
-- Table structure for guestbook
-- ----------------------------
DROP TABLE IF EXISTS `guestbook`;
CREATE TABLE `guestbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `content` text,
  `name` varchar(50) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of guestbook
-- ----------------------------
INSERT INTO `guestbook` VALUES ('81', '12星座你经历过绝望么', '大师你们经历过等待吗？', 'pp十指紧扣pp', '2017-02-27 15:19:20');
INSERT INTO `guestbook` VALUES ('82', '12星座你经历过绝望么', '昨天买了皮皮虾，带仁的，80块钱一斤，问下其他地方的价钱，我是广东潮州', '帅气-承诺', '2017-02-27 15:19:47');
INSERT INTO `guestbook` VALUES ('83', ' 显卡', '前排提醒勾选只看楼主。部分配置因为删帖机导致被删除，在后面补上了。', '沙漠之鹰L3', '2017-02-27 15:22:09');
INSERT INTO `guestbook` VALUES ('84', 'i7 7700k ', ' 本人小白 多帮看下', '绰绪', '2017-02-27 15:22:56');
INSERT INTO `guestbook` VALUES ('85', '远离城市喧嚣，享山间安宁', '春来临，一人行。情在心，爱远行。风吹雨落花飘零，漫天哀愁随风行。\n期盼两个人的旅行，享受一个人的宁静。我无谓未知的前路，我知你在远方等我继续前行。亲爱的美景无你，期盼我们下一次一起远行。', 'keys9404', '2017-02-27 15:24:06');
INSERT INTO `guestbook` VALUES ('86', '渡劫', '在通往十级的路上，充满了坎坷和挫折，但是我没有放弃。因为我知道，到了十级，是另一', '小板凳之大帥比', '2017-02-27 15:25:04');
INSERT INTO `guestbook` VALUES ('87', ' 西游记之大圣归来', '五指山下报师恩，搭建鹊桥会', '王东风福', '2017-02-27 15:26:21');
INSERT INTO `guestbook` VALUES ('88', ' 小时代4吧', '眉隐尘间云雪一捧', '平平庸庸44', '2017-02-27 15:27:52');
INSERT INTO `guestbook` VALUES ('89', '新留言', '内容区域', '作者', '2017-02-27 16:05:43');

-- ----------------------------
-- Table structure for images
-- ----------------------------
DROP TABLE IF EXISTS `images`;
CREATE TABLE `images` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `path` varchar(200) DEFAULT NULL,
  `memo` varchar(200) DEFAULT NULL,
  `thumb_path` varchar(200) DEFAULT NULL,
  `group_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of images
-- ----------------------------
INSERT INTO `images` VALUES ('1', '林海雪园，雪中的太阳镜', 'images/1_b.jpg', '林海雪园，雪中的太阳镜', 'images/1_s.jpg', 'group1');
INSERT INTO `images` VALUES ('2', '蔚蓝天空，天空中的白云朵朵飘', 'images/2_b.jpg', '蔚蓝天空，天空中的白云朵朵飘', 'images/2_s.jpg', 'group1');
INSERT INTO `images` VALUES ('3', '美人路睡，美丽的姑娘', 'images/3_b.jpg', '美人路睡，美丽的姑娘', 'images/3_s.jpg', 'group1');
INSERT INTO `images` VALUES ('4', '雨中有伞，雨中的朦胧', 'images/4_b.jpg', '雨中有伞，雨中的朦胧', 'images/4_s.jpg', 'group1');
INSERT INTO `images` VALUES ('5', '悬空视觉，你懂的', 'images/5_b.jpg', '悬空视觉，你懂的', 'images/5_s.jpg', 'group1');
INSERT INTO `images` VALUES ('6', '空中飞人，我真的看不懂', 'images/6_b.jpg', '空中飞人，我真的看不懂', 'images/6_s.jpg', 'group1');
INSERT INTO `images` VALUES ('7', '双龙戏水，有事没事别乱蹿', 'images/7_b.jpg', '双龙戏水，有事没事别乱蹿', 'images/7_s.jpg', 'group1');
INSERT INTO `images` VALUES ('8', '佛山无影，桥洞下的舞蹈', 'images/8_b.jpg', '佛山无影，桥洞下的舞蹈', 'images/8_s.jpg', 'group1');
INSERT INTO `images` VALUES ('17', '测试测试测试', 'images/12_b_111.jpg', '测试测试测试', 'images/12_s_222.jpg', 'group1');
INSERT INTO `images` VALUES ('18', '11111', 'images/TB1_4w3PFXXXXaqXFXXXXXXXXXX_!!0-item_pic.jpg', '555151', 'images/12_b_111.jpg', 'group1');
SET FOREIGN_KEY_CHECKS=1;

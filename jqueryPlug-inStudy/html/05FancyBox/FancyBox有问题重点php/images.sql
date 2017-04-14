/*
Navicat MySQL Data Transfer

Source Server         : mySQL
Source Server Version : 50530
Source Host           : localhost:3306
Source Database       : php

Target Server Type    : MYSQL
Target Server Version : 50530
File Encoding         : 65001

Date: 2017-04-13 14:44:21
*/

SET FOREIGN_KEY_CHECKS=0;

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

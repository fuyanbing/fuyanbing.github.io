/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50530
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50530
File Encoding         : 65001

Date: 2017-05-19 16:41:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for city
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `pro_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of city
-- ----------------------------
INSERT INTO `city` VALUES ('1', '长春', '1');
INSERT INTO `city` VALUES ('2', '吉林', '1');
INSERT INTO `city` VALUES ('3', '成都', '2');
INSERT INTO `city` VALUES ('4', '攀枝花', '2');
INSERT INTO `city` VALUES ('5', '长沙', '3');
INSERT INTO `city` VALUES ('6', '岳阳', '3');
INSERT INTO `city` VALUES ('7', '湘潭', '3');
INSERT INTO `city` VALUES ('8', '沈阳', '4');
INSERT INTO `city` VALUES ('9', '大连', '4');
INSERT INTO `city` VALUES ('10', '沈阳', '4');
INSERT INTO `city` VALUES ('11', '沈阳', '4');

-- ----------------------------
-- Table structure for province
-- ----------------------------
DROP TABLE IF EXISTS `province`;
CREATE TABLE `province` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of province
-- ----------------------------
INSERT INTO `province` VALUES ('1', '吉林省');
INSERT INTO `province` VALUES ('2', '四川省');
INSERT INTO `province` VALUES ('3', '湖南省');
INSERT INTO `province` VALUES ('4', '辽宁省');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `sex` varchar(50) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `birthday` varchar(100) DEFAULT NULL,
  `city` int(11) DEFAULT NULL,
  `salary` varchar(100) DEFAULT NULL,
  `startTime` varchar(100) DEFAULT NULL,
  `endTime` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('18', '用户01风', '1111', '1', '11', '2016-12-29', '2', '1111.00', '2017-01-05 14:09:42', '2017-01-24 14:09:45', '回家');
INSERT INTO `user` VALUES ('19', '用户02', '1111', '1', '20', '2016-12-29', '2', '1111.00', '2017-01-05 14:09:42', '2017-01-24 14:09:45', '回家');
INSERT INTO `user` VALUES ('21', 'admin', '5555', '1', '15', '2017-01-19', '4', '5555.00', '2017-01-22 17:03:37', '2017-01-19 17:03:39', '刚刚古古怪怪');
INSERT INTO `user` VALUES ('23', '222v', 'dddd', '2', '22', '2017-01-18', '3', '20000.00', '2017-01-04 08:58:27', '2017-01-24 08:58:34', '走起回家过年');
INSERT INTO `user` VALUES ('26', '用户01', '1111', '1', '11', '2016-12-29', '2', '1111.00', '2017-01-05 14:09:42', '2017-01-24 14:09:45', '回家');
INSERT INTO `user` VALUES ('27', '用户02', '1111', '1', '20', '2016-12-29', '2', '1111.00', '2017-01-05 14:09:42', '2017-01-24 14:09:45', '回家');
INSERT INTO `user` VALUES ('28', '用户3', '1111', '1', '18', '2016-12-29', '2', '1111.00', '2017-01-05 14:09:42', '2017-01-24 14:09:45', '回家');
INSERT INTO `user` VALUES ('29', 'admin', '5555', '1', '15', '2017-01-19', '4', '5555.00', '2017-01-22 17:03:37', '2017-01-19 17:03:39', '刚刚古古怪怪');
INSERT INTO `user` VALUES ('30', '222', 'dddd', '1', '24', '2017-01-18', '4', '20000.00', '2017-01-04 08:58:27', '2017-01-24 08:58:34', '走起回家过年');
INSERT INTO `user` VALUES ('31', '222v', 'dddd', '2', '22', '2017-01-18', '3', '20000.00', '2017-01-04 08:58:27', '2017-01-24 08:58:34', '走起回家过年');
INSERT INTO `user` VALUES ('32', '用户', '4545', '1', '15', '2017-01-19', '2', '5454.00', '2017-01-13 13:50:17', '2017-01-25 13:50:20', '用哈哈哈哈哈');
INSERT INTO `user` VALUES ('33', '用户10', '4545', '1', '15', '2017-01-19', '2', '5454.00', '2017-01-13 13:50:17', '2017-01-25 13:50:20', '用哈哈哈哈哈');
INSERT INTO `user` VALUES ('34', '用户01', '1111', '1', '11', '2016-12-29', '2', '1111.00', '2017-01-05 14:09:42', '2017-01-24 14:09:45', '回家');
INSERT INTO `user` VALUES ('35', '用户02', '1111', '1', '20', '2016-12-29', '2', '1111.00', '2017-01-05 14:09:42', '2017-01-24 14:09:45', '回家');
INSERT INTO `user` VALUES ('36', '用户3', '1111', '1', '18', '2016-12-29', '2', '1111.00', '2017-01-05 14:09:42', '2017-01-24 14:09:45', '回家');
INSERT INTO `user` VALUES ('37', 'admin', '5555', '1', '15', '2017-01-19', '4', '5555.00', '2017-01-22 17:03:37', '2017-01-19 17:03:39', '刚刚古古怪怪');
INSERT INTO `user` VALUES ('38', '222', 'dddd', '1', '44', '2017-01-18', '4', '20000.00', '2017-01-04 08:58:27', '2017-01-24 08:58:34', '走起回家过年');
INSERT INTO `user` VALUES ('39', '222v', 'dddd', '2', '22', '2017-01-18', '3', '20000.00', '2017-01-04 08:58:27', '2017-01-24 08:58:34', '走起回家过年');
INSERT INTO `user` VALUES ('40', '用户', '4545', '1', '15', '2017-01-19', '2', '5454.00', '2017-01-13 13:50:17', '2017-01-25 13:50:20', '用哈哈哈哈哈');
INSERT INTO `user` VALUES ('41', '用户10', '4545', '1', '15', '2017-01-19', '2', '5454.00', '2017-01-13 13:50:17', '2017-01-25 13:50:20', '用哈哈哈哈哈');
INSERT INTO `user` VALUES ('55', '长时间吗', 'jjjj', '1', '15', '2017-02-02', '3', '5555.00', '2017-01-13 15:54:15', '2017-01-21 15:54:21', '吃撒吃撒擦拭擦擦是从');
INSERT INTO `user` VALUES ('56', '新年快乐', 'xnkl', '1', '27', '1990-07-30', '1', '8888.00', '2017-02-06 13:54:51', '2017-02-28 13:55:06', '早日脱贫！');
INSERT INTO `user` VALUES ('57', 'vdvd', '3333', '2', '15', '2017-02-14', '3', '3333.00', '2017-02-06 14:04:32', '2017-02-06 14:04:35', '是vcsvsvs');
INSERT INTO `user` VALUES ('58', 'vsdvs', '444v', '2', '44', '2017-01-04', '3', '20000.00', '2017-01-25 08:58:27', '2017-01-24 08:58:34', '哈哈哈哈或或或或或');
INSERT INTO `user` VALUES ('59', '颠三倒四', '发vfv', '1', '44', '2017-02-08', '1', '20000.00', '2017-03-02 14:18:10', '2017-03-08 14:18:14', 'vvvvvvvvvvvvv');
INSERT INTO `user` VALUES ('60', 'vdsvsd', 'cascasc', '2', '150', '2017-02-09', '3', '20000.00', '2017-02-24 16:58:42', '2017-02-23 16:58:45', 'csasCAScAcsdvsdv');
INSERT INTO `user` VALUES ('61', 'fbdfb', '3333', '1', '150', '2017-02-21', '4', '5555.00', '2017-02-22 17:00:15', '2017-02-17 17:00:18', '是vsddsdssdds');
INSERT INTO `user` VALUES ('62', '5555', '5555', '2', '150', '2017-02-22', '4', '5555.00', '2017-02-21 17:04:22', '2017-02-23 17:04:36', 'vsdvs是是是是');
INSERT INTO `user` VALUES ('63', '砂石厂', '2222', '1', '44', '2017-02-07', '3', '4444.00', '2017-02-09 17:09:04', '2017-02-09 17:09:06', '擦擦删除吃三次');
INSERT INTO `user` VALUES ('64', 'casc', '3333', '1', '24', '2017-02-21', '2', '5555.00', '2017-02-08 17:14:50', '2017-03-02 17:14:52', '擦擦删除艹');
INSERT INTO `user` VALUES ('65', '吃三次', '3333', '2', '150', '2017-02-22', '4', '6666.00', '2017-02-22 17:17:16', '2017-02-22 17:17:19', 'vasavvasvasv');
INSERT INTO `user` VALUES ('66', '都是', '4444', '1', '15', '2017-02-13', '3', '4444.00', '2017-02-07 17:19:49', '2017-02-28 17:19:51', '的vsdvsdsvdsv');
INSERT INTO `user` VALUES ('67', '方便的', 'fffr', '2', '15', '2017-02-22', '4', '20000.00', '2017-02-08 09:25:58', '2017-02-21 09:26:02', 'vsdvsd的白癜风');
SET FOREIGN_KEY_CHECKS=1;

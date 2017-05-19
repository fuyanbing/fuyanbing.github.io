/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50530
Source Host           : localhost:3306
Source Database       : php

Target Server Type    : MYSQL
Target Server Version : 50530
File Encoding         : 65001

Date: 2017-05-19 16:29:14
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
INSERT INTO `guestbook` VALUES ('89', '新留言', '内容区域测试', '作者', '2017-05-16 10:43:05');

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

-- ----------------------------
-- Table structure for jqcomment
-- ----------------------------
DROP TABLE IF EXISTS `jqcomment`;
CREATE TABLE `jqcomment` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `titleid` smallint(6) unsigned NOT NULL,
  `user` varchar(20) CHARACTER SET utf8 NOT NULL,
  `comment` text CHARACTER SET utf8 NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of jqcomment
-- ----------------------------
INSERT INTO `jqcomment` VALUES ('3', '10', 'bnbbs', '我的第一条评论！', '2014-03-20 11:16:18');
INSERT INTO `jqcomment` VALUES ('2', '4', 'bnbbs', '我的第一条评论！', '2014-03-20 11:15:51');
INSERT INTO `jqcomment` VALUES ('6', '10', 'bnbbs', '我的第三条评论！', '2014-03-20 11:19:36');
INSERT INTO `jqcomment` VALUES ('7', '5', 'bnbbs', '我的第一条评论！', '2014-03-20 11:19:47');
INSERT INTO `jqcomment` VALUES ('10', '5', 'bnbbs', '我的第二条评论！', '2014-03-20 19:38:36');
INSERT INTO `jqcomment` VALUES ('9', '5', 'bnbbs', '我的第四条评论！', '2014-03-20 19:10:31');
INSERT INTO `jqcomment` VALUES ('11', '6', 'bnbbs', '我的第五条评论！', '2014-03-20 20:38:48');
INSERT INTO `jqcomment` VALUES ('12', '8', 'bnbbs', '我的第六条评论！', '2014-03-20 21:05:46');
INSERT INTO `jqcomment` VALUES ('13', '3', 'bnbbs', '我的第七条评论！', '2014-03-20 21:07:30');
INSERT INTO `jqcomment` VALUES ('14', '9', 'bnbbs', '我的第八条评论！', '2014-03-20 21:09:08');
INSERT INTO `jqcomment` VALUES ('15', '9', 'bnbbs', '我的第九条评论！', '2014-03-21 11:12:52');
INSERT INTO `jqcomment` VALUES ('18', '9', 'bnbbs', '我的第十条评论！', '2014-03-21 13:04:33');
INSERT INTO `jqcomment` VALUES ('22', '9', 'bnbbs', '我的第八八条评论！', '2014-03-21 13:10:53');
INSERT INTO `jqcomment` VALUES ('23', '9', 'user01', '爱谁谁所所所所所所所所所所所所所所所', '2017-05-19 10:44:51');

-- ----------------------------
-- Table structure for jqquestion
-- ----------------------------
DROP TABLE IF EXISTS `jqquestion`;
CREATE TABLE `jqquestion` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8 NOT NULL,
  `content` text CHARACTER SET utf8,
  `user` varchar(20) CHARACTER SET utf8 NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of jqquestion
-- ----------------------------
INSERT INTO `jqquestion` VALUES ('4', '情镌三分木，相思万骨书', '<p>几渚梁梦杯中尽，独影朱阁泪成诗？万里婵娟银河坠，星辰似海踏歌来。故梦千里清铃响，静候梵音斩红尘。——题记。</p><p>&nbsp;</p><p>　　那一世，你在这场缠绵的夜雨江南中为他悄悄的撑起那把泛青的油伞；我亦在烽台烛台望你千年之余，我曾听闻你为寻他走遍了千迢万里，踏过了雨雪绯林；而今离他只有那短短的一步之遥。看见你为了他在雨中温柔静候，那眼角滑落下的液体伴随着倾赋予他的漫天思念；静静的洒满这座城市的每一个角落。而我就这样静静的站在你们身后，多余的像极了一幅煞乱风景的残墨；顷刻间充斥着幸福流淌过的每一条暖流。但你是否曾知晓？那雨水从天而降肆无忌惮的在我的脸颊划落；泪水也参杂在雨水里紧附着思念随波逐流的晕开视线里残留下的最后一幅画面。也许你永远都不会知道，今生的我为了等候你那不轻易的回首；似乎比你等他的时间还要长。</p><p>&nbsp;</p><p>　　听人说一个人的时候，温起壶中酒；独倚拜月楼，望着庭中盛放的满院流光；凄冷的冬风定会静静的摇落下一地的相思，只为承载起那些忧伤孤独的过往，在岁月的年轮中不停的刻圈成画；却始终画不到那个所谓的终点。有你的曾经一直潜藏在故事里蔓延着最为凄美的片段，梦中的枯藤已千年不绿；被风吹干后的答案；夺走了彼此记忆中最为动人的拥抱。那些禁锢在心底深处的怅然，冲淡了相聚时的喜悦与快乐；难以掩盖的忧伤中载满了无法清点不舍与难过。</p><p><br></p>', 'user01', '2017-05-18 13:53:48');
INSERT INTO `jqquestion` VALUES ('5', '三月，醉一场青春的流年', '<p>三月，醉一场青春的流年。慢步在三月的春光里，走走停停，看花开嫣然，看春雨绵绵，感受春风拂面，春天，就是青春的流年。青春，是人生中最美的风景。青春，是一场花开的遇见；青春，是一场痛并快乐着的旅行；青春，是一场轰轰烈烈的比赛；青春，是一场鲜衣奴马的争荣岁月；青春，是一场风花雪月的光阴。</p><p>&nbsp;</p><p>　　青春往事，多么甜蜜；青春岁月，多么靓丽；青春流年，如火如荼。青春里，我们向着梦想前进。跌倒过，伤心过，快乐过，痛苦过，孤独过，彷徨过，迷茫过。总是，在悠悠的岁月中徘徊；总是，在如春的生命中成长；总是，在季节的交替中感悟人生四季的美妙与韵律；总是，在多愁善感中体悟青春的美好与无奈。</p><p>&nbsp;</p><p>　　三月的鲜花，一树树，一束束，一簇簇，而青春，就是像三月的鲜花一样美丽迷人，生机盎然，姹紫嫣红，生机勃勃。三月，是青春里最美最温暖的风景。三月的美，就像青春的美，充满活力，充满生机，充满昂扬的斗志。三月的美，就像青春的花季，在那里我们可以感受青春的跳动与感动，感受青春的曼妙与奇妙；感受青春的悸动与心跳。</p><p>&nbsp;</p><p>　　青春，如三月的春光，安暖向阳。在美丽的青春年华，我们手牵手，肩并肩，跨过岁月山河，跨过锦瑟流年，跨过天涯海角，在三月的春光里沐浴金色的光泽。三月的春光，让青春的我们看到希望，看到自己有一颗年轻跳动的心，看到蓝天白云，看到明媚的灿烂。三月的春光，温暖无比，就像我们的青春，有着长辈的呵护，有着老师的循循教导，它们就像春光，照耀着我们年轻的心。</p><p>&nbsp;</p><p>　　青春，如三月的春雨，我们在春雨中得到滋润。春雨，淅淅沥沥，纷纷扬扬，打在青春的雨季，打在我们心里，打在我们的生活里，打在我们的生命中，打在我们的灵魂深处。一场春雨，滋润着我们的青春流年，让我们快乐成长，让我们如沐春雨，让我们感受亲恩。三月的春雨，就像我们的父母，用他们的爱心，滋润着我们幼小不安的心灵。</p><p>&nbsp;</p><p>　　青春，如三月的春风，我们沐浴在春风里。三月的春风，是我们的朋友，是我们的同窗，是陪伴我们成长的玩伴。因为有了春风，我们感受到友谊的温暖；因为有了春风，我们不再寂寞；因为有了春风，我们总在需要帮助的时候，有他们伸出援助之手。春风，是那样感情丰富，温婉细腻。在春风里，我们跳着，唱着，欢呼着，只因为这如春风的情谊。</p><p><br></p>', 'user01', '2017-05-18 13:54:22');
INSERT INTO `jqquestion` VALUES ('6', '故乡的年味', '<p>到了农历的年末，城市的超市里挂满了玲珑华美的红灯笼，玻璃橱窗上也贴上了各式花样的剪纸，这些都是年的符号，也是年的名片。我内心深藏的年味儿犹如一只脆弱不堪的老酒坛被这些符号与名片猛然击碎，老酒倾泻满地，浓郁醇厚的味道漫然飘散。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><p>我小的时候，盼望着过年。从农历的腊月二十三开始，接下来的每一天似乎都是色彩斑斓的，都散发着温馨绵厚的香味儿。村里的老婆婆坐在厚厚的蒲团上教我们唱着童谣：“二十三，祭灶官；二十四，扫房子；二十五，磨豆腐；二十六，蒸馒头；二十七，杀只鸡；二十八，贴画画；二十九，去买酒；年三十，包饺子；大初一，撅着屁股乱作揖。”这首童谣像是我们村里人的过年指南，农历二十三的时候就吃灶糖、祭灶神，二十四的时候就忙着用笤帚打扫屋子，二十五的时候就准备过年吃的豆腐，二十六的时候家家户户蒸枣花馒头、蒸萝卜缨包子……千百年来，太阳沿着亘古不变的轨迹东升西落；冬去春来，人们世世代代遵循着这样的过年流程过年。</p><p><br></p>', 'user01', '2017-05-18 13:55:00');
INSERT INTO `jqquestion` VALUES ('7', '爱是什么', '<p>&nbsp;时间是一辆滚滚向前的列车，不经意间，2017已从2016的手中接过了接力棒。生命之树又增长了一圈皱纹，年长了一岁，成为我们这些中年人不愿但又不得不接受的新年礼物。人到中年，逐渐褪去了年少的轻狂，回归了生命的沉静。梳理40余年人生的轨迹，开始了对爱的思考。爱，到底是什么？</p><p>&nbsp; &nbsp;&nbsp;</p><p>&nbsp; &nbsp; 小时候，家里兄弟姐妹多，靠父亲一人微薄的工资和母亲的勤俭持家勉强维持生活。母亲在小院开辟了一小块地，为全家人提供了虽然很少但却是纯天然绿色的蔬菜；养猪、养鸡，卖掉换钱为我们积攒学费；总是看着我们狼吞虎咽地吃完饭，妈妈才会拿起碗筷；用废旧的纸张叠成飞机、裁剪成各种造型，便是我们最好的玩具；待我们都睡下了，操劳了一天的母亲在煤油灯下又做起了针线活；后来离家去外地求学，母亲又因思念和惦记我们而彻夜难眠……那时的我们，是那么的天真和幼稚，认为一切都是理所当然，一切本该如此。现在想想，父母之爱，是那么的博大而无私，是那么的悄无生息、润物无声而又无怨无悔</p><p><br></p>', 'user01', '2017-05-18 13:55:24');
INSERT INTO `jqquestion` VALUES ('8', '红尘陌上雪，散落随花开', '<p>红尘陌上的花开。似比相见又恨晚的聚散，相遇过早前方的路人，便会成为身后的过客。相识过晚倾城清风的颜美。便会与你擦肩，来不及仰望。说不出再见，从此山隔一河。却天涯此岸，回眸仰望已是曾经沧海，百花残月之冬。相遇有缘，离花漂过。景色的相遇正如那份。一直落在思念里的寒冬，无论冰川怎样刺骨。雪花怎样漂过，一颗执着的心。一直苦苦寻找。天暗未明微落的天空却被大雪覆盖，热血的少年。曾经的意志，却从未止步。从春天到寒冬。从寒冬到天荒，一直守护着这份。从未揭开的思念。 &nbsp;</p><p><br></p>', 'user01', '2017-05-18 13:55:52');
INSERT INTO `jqquestion` VALUES ('9', '人总要学会在深夜跟往事和解，晚安即释怀', '<p>每个深夜都是矛盾体在释放，忍住了，你是天使；忍不住，你是恶魔。</p><p>&nbsp;</p><p>圣诞结，嗯，我没写错，不是圣诞节；</p><p>有些事，解得开，是结，解不开，是劫；</p><p>对于橘子来说，似乎每一场喧嚣的节日，都像是形单影只煎熬的渡劫；</p><p>热闹是别人的，她什么也没有，就像奶茶歌里唱得“一群人的狂欢一个人的孤单……”</p><p>&nbsp;</p><p>快两年了……时间这个狡猾的骗子，所有一切掩藏的毫无痕迹，伤痛仿佛快要被治愈，却又慢慢衍生着新的伤痛慢慢入侵，像个后发制人的突击者，毫无防备，瞬间击杀，随之崩塌。</p><p>&nbsp;</p><p>我一直以为，她笑得那么开心，一定从病房走出来了。原来，坚强，不过是温柔生的茧</p><p><br></p>', 'user01', '2017-05-18 13:56:18');
INSERT INTO `jqquestion` VALUES ('3', '君生我未生 我生君已老', '<p>我是一个孤儿，也许是重男轻女的结果，也许是男欢女爱又不能负责的产物。&nbsp;&nbsp;</p><p>　　是哲野把我拣回家的。&nbsp;&nbsp;</p><p>　　那年他落实政策自农村回城，在车站的垃圾堆边看见了我，一个漂亮的，安静的小女婴，许多人围着，他上前，那女婴对他璨然一笑。&nbsp;&nbsp;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;他给了我一个家，还给了我一个美丽的名字，陶夭。后来他说，我当初那一笑，称得起桃之夭夭，灼灼其华。&nbsp;&nbsp;</p><p>　　哲野的一生极其悲凄，他的父母都是归国的学者，却没有逃过那场文化浩劫，愤懑中双双弃世，哲野自然也不能幸免，发配农村，和相恋多年的女友劳燕分飞。他从此孑然一身，直到35岁回城时拣到我。&nbsp;&nbsp;</p><p>　　我管哲野叫叔叔。&nbsp;&nbsp;</p><p>　　童年在我的记忆里并没有太多不愉快。只除掉一件事。&nbsp;&nbsp;</p><p>　　上学时，班上有几个调皮的男同学骂我“野种”，我哭着回家，告诉哲野。第二天哲野特意接我放学，问那几个男生：谁说她是野种的？小男生一见高大魁梧的哲野，都不敢出声，哲野冷笑：下次谁再这么说，让我听见的话，我揍扁他！有人嘀咕，她又不是你生的，就是野种。哲野牵着我的手回头笑：可是我比亲生女儿还宝贝她。不信哪个站出来给我看看，谁的衣服有她的漂亮？谁的鞋子书包比她的好看？她每天早上喝牛奶吃面包，你们吃什么？小孩子们顿时气馁。&nbsp;&nbsp;</p><p>　　自此，再没有人骂我过是野种。大了以后，想起这事，我总是失笑。&nbsp;&nbsp;</p><p>　　我的生活较之一般孤儿，要幸运得多。&nbsp;&nbsp;</p><p>　　我最喜欢的地方是书房。满屋子的书，明亮的大窗子下是哲野的书桌，有太阳的时候，他专注工作的轩昂侧影似一副逆光的画。我总是自己找书看，找到了就窝在***上。隔一会，哲野会回头看我一眼，他的微笑，比冬日窗外的阳光更和煦。看累了，我就趴在他肩上，静静的看他画图撰文。&nbsp;&nbsp;</p><p>　　他笑：长大了也做我这行？&nbsp;&nbsp;</p><p>　　我撇嘴：才不要，晒得那么黑，脏也脏死了。&nbsp;&nbsp;</p><p>　　啊，我忘了说，哲野是个建筑工程师。但风吹日晒一点也无损他的外表。他永远温雅整洁，风度翩翩。&nbsp;&nbsp;</p><p>　　断断续续的，不是没有女人想进入哲野的生活。&nbsp;&nbsp;</p><p>　　我八岁的时候，曾经有一次，哲野差点要和一个女人谈婚论嫁。那女人是老师，精明而漂亮。不知道为什么我不喜欢她，总觉得她那脸上的笑象贴上去的，哲野在，她对我笑得又甜又温柔，不在，那笑就变戏法似的不见。我怕她。有天我在阳台上看图画书，她问我：你的亲爹妈呢？一次也没来看过你？我呆了，望着她不知道说什么好。她啧啧了两声，又说，这孩子，傻，难怪他们不要你。我怔住，忽然哲野铁青着脸走过来，牵起我的手什么也不说就回房间。&nbsp;&nbsp;</p><p>　　晚上我一个人闷在被子里哭。哲野走进来，抱着我说，不怕，夭夭不哭。&nbsp;&nbsp;</p><p>　　后来就不再见那女的上我们家来了。&nbsp;&nbsp;</p><p>　　再后来我听见哲野的好朋友邱非问他，怎么好好的又散了？哲野说，这女人心不正，娶了她，夭夭以后不会有好日子过的。邱非说，你还是忘不了叶兰。八岁的我牢牢记住了这个名字。大了后我知道，叶兰就是哲野当年的女朋友。&nbsp;&nbsp;</p><p>　　我们一直相依为命。哲野把一切都处理得很好，包括让我顺利健康的度过青春期。&nbsp;&nbsp;</p><p>　　我考上大学后，因学校离家很远，就住校，周末才回家。&nbsp;&nbsp;</p><p>　　哲野有时会问我：有男朋友了吗？我总是笑笑不作声。学校里倒是有几个还算出色的男生总喜欢围着我转，但我一个也看不顺眼：甲倒是高大英俊，无奈成绩三流；乙功课不错，口才也甚佳，但外表实在普通；丙功课相貌都好，气质却似个莽夫……&nbsp;&nbsp;</p><p>　　我很少和男同学说话。在我眼里，他们都幼稚肤浅，一在人前就来不及的想把最好的一面表现出来，太着痕迹，失之稳重。&nbsp;&nbsp;</p><p>　　二十岁生日那天，哲野送我的礼物是一枚红宝石的戒指。这类零星首饰，哲野早就开始帮我买了，他的说法是：女孩子大了，需要有几件象样的东西装饰。吃完饭他陪我逛商场，我喜欢什么，马上买下。&nbsp;&nbsp;</p><p>　　回校后，敏感的我发现同学们喜欢在背后议论我。我也不放在心上。因为自己的身世，已经习惯人家议论了。直到有天一个要好的女同学私下把我拉住：他们说你有个年纪比你大好多的男朋友？我莫名其妙：谁说的？她说：据说有好几个人看见的，你跟他逛商场，亲热得很呢！说你难怪看不上这些穷小子了，原来是傍了孔方兄！我略一思索，脸慢慢红起来，过一会笑道：他们误会了。&nbsp;&nbsp;</p><p>　　我并没有解释。静静的坐着看书，脸上的热久久不褪。&nbsp;&nbsp;</p><p>　　周末回家，照例大扫除。哲野的房间很干净，他常穿的一件羊毛衫搭在床沿上。那是件米咖啡色的，樽领，买的时候原本看中的是件灰色鸡心领的，我挑了这件。当时哲野笑着说，好，就依你，看来小夭夭是嫌我老了，要我打扮得年轻点呢。&nbsp;&nbsp;</p><p>　　我慢慢叠着那件衣服，微笑着想一些零碎的琐事。&nbsp;&nbsp;</p><p>　　接下来的一段时间我发现哲野的精神状态非常好，走路步履轻捷生风，偶尔还听见他哼一些歌，倒有点象当年我考上大学时的样子。我纳闷。&nbsp;&nbsp;</p><p>　　星期五我就接到哲野电话，要我早点回家，出去和他一起吃晚饭。&nbsp;&nbsp;</p><p>　　他刮胡子换衣服。我狐疑：有人帮你介绍女朋友？哲野笑：我都老头子了，还谈什么女朋友，是你邱叔叔，还有一个也是很多年的老朋友，一会你叫她叶阿姨就行。&nbsp;&nbsp;</p><p>　　我知道，那一定是叶兰。&nbsp;&nbsp;</p><p>　　路上哲野告诉我，前段时间通过邱非，他和叶兰联系上了，她丈夫几年前去世了，这次重见，感觉都还可以，如果没有意外，他们准备结婚。&nbsp;&nbsp;</p><p>　　我不经心的应着，渐渐觉得脚冷起来，慢慢往上蔓延。&nbsp;&nbsp;</p><p>　　到了饭店，我很客观的打量着叶兰：微胖，但并不臃肿，眉宇间尚有几分年轻时的风韵，和同年龄的女人相比，她无疑还是有优势的。但是跟英挺的哲野站在一起，她看上去老得多。</p><p>她对我很好，很亲切，一副爱屋及乌的样子。&nbsp;&nbsp;</p><p>　　到了家哲野问我：你觉得叶阿姨怎么样？我说：你们都计划结婚了，我当然说好了。&nbsp;&nbsp;</p><p>　　我睁眼至凌晨才睡着。&nbsp;&nbsp;</p><p>　　回到学校我就病了。发烧，撑着不肯拉课，只觉头重脚轻，终于栽倒在教室。&nbsp;&nbsp;</p><p>　　醒来我躺在医院里，在挂吊瓶，哲野坐在旁边看书。 &nbsp;</p><p><br></p>', 'user01', '2017-05-18 13:52:26');
INSERT INTO `jqquestion` VALUES ('10', '因为爱你，所以牵挂', '<p>喧嚣之后，是孤独，孤独之后，会愈加想念，想念是一种歇斯底里的痛，这痛楚，是扎在血液里的千万根钢针，隐匿在血液里的，翻滚着，流淌着，拨不出。思念越深，心被痛缠绕的就越紧，紧到无法呼吸，紧到不知所措。陷入的思念，是掐着喉咙的难以忍受。爱，是甜蜜的开始，有时候，也是走向幽谷的绝望，无论是哪一种结局，爱了，就不言后悔。</p><p>&nbsp;</p><p>因为爱你，所以牵挂。因为你，让我懂得了爱是一种美，不光要好好爱你，还会用我最暖的一颗心，最真挚的情，爱着生命里所经过的每一个人，我也会用最纯美的善良，爱着所有的风景，爱着尘世的一草一木。也许是前世无数次的擦肩，换回今生的相遇，也许是前世无数次的回眸，等到今生的相知。遇见你，不问这遇见，是缘是劫，遇见就是无悔。爱上你，就会陪你慢慢变老，陪你一起和生命舞蹈，不需要太多设定，只想把初相遇定格，珍惜每一个与你在一起的幸福。</p><p><br></p>', 'user01', '2017-05-18 13:56:37');

-- ----------------------------
-- Table structure for jquser
-- ----------------------------
DROP TABLE IF EXISTS `jquser`;
CREATE TABLE `jquser` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(20) CHARACTER SET utf8 NOT NULL,
  `pass` char(40) DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `sex` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of jquser
-- ----------------------------
INSERT INTO `jquser` VALUES ('1', 'user01', 'user01', 'user07@163.com', 'male', '2017-05-11', '2017-05-16 14:37:24');
INSERT INTO `jquser` VALUES ('24', 'user02', 'user02', 'user07@163.com', 'male', '2017-05-11', '2017-05-16 14:37:24');
INSERT INTO `jquser` VALUES ('25', 'user03', 'user03', 'user07@163.com', 'male', '2017-05-11', '2017-05-16 14:37:24');
INSERT INTO `jquser` VALUES ('26', 'user04', 'user04', 'user07@163.com', 'male', '2017-05-11', '2017-05-16 14:37:24');
INSERT INTO `jquser` VALUES ('27', 'user05', 'user05', 'user07@163.com', 'male', '2017-05-11', '2017-05-16 14:37:24');
INSERT INTO `jquser` VALUES ('28', 'user06', 'user06', 'user07@163.com', 'male', '2017-05-11', '2017-05-16 14:37:24');
INSERT INTO `jquser` VALUES ('29', 'user07', 'user07', 'user07@163.com', 'male', '2017-05-11', '2017-05-16 14:37:24');
INSERT INTO `jquser` VALUES ('31', 'yonghu', 'yonghu', '5555@263.com', 'male', '2017-05-13', '2017-05-16 14:59:08');
SET FOREIGN_KEY_CHECKS=1;
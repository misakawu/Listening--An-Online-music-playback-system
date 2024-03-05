/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 80032
Source Host           : localhost:3306
Source Database       : listening

Target Server Type    : MYSQL
Target Server Version : 80032
File Encoding         : 65001

Date: 2023-07-05 16:30:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for like
-- ----------------------------
DROP TABLE IF EXISTS `like`;
CREATE TABLE `like` (
  `LikeID` int NOT NULL AUTO_INCREMENT,
  `MusicID` int NOT NULL,
  `UserID` int NOT NULL,
  PRIMARY KEY (`LikeID`),
  KEY `MusicID` (`MusicID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `like_ibfk_1` FOREIGN KEY (`MusicID`) REFERENCES `music` (`MusicID`),
  CONSTRAINT `like_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of like
-- ----------------------------
INSERT INTO `like` VALUES ('14', '2', '1');
INSERT INTO `like` VALUES ('18', '1', '1');
INSERT INTO `like` VALUES ('19', '1', '2');

-- ----------------------------
-- Table structure for music
-- ----------------------------
DROP TABLE IF EXISTS `music`;
CREATE TABLE `music` (
  `MusicID` int NOT NULL AUTO_INCREMENT,
  `MusicName` varchar(255) NOT NULL,
  `MusicianName` varchar(255) NOT NULL,
  `MusicBackground` varchar(255) NOT NULL,
  `MusicData` varchar(255) NOT NULL,
  `Like` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`MusicID`),
  UNIQUE KEY `不可重复` (`MusicName`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of music
-- ----------------------------
INSERT INTO `music` VALUES ('1', 'night', 'Josh Ritter', '/img/singerPic/1586090939016Josh Ritter.jpg', '/song/a_hisa - night.mp3', '0000000055');
INSERT INTO `music` VALUES ('2', 'El Mismo Sol', 'Álvaro Soler', '/img/singerPic/soler.jpg', '/song/Álvaro Soler-El Mismo Sol.mp3', '0000000075');
INSERT INTO `music` VALUES ('3', 'Sofía', 'Álvaro Soler', '/img/singerPic/soler.jpg', '/song/Álvaro Soler-Sofía.mp3', '0000000010');
INSERT INTO `music` VALUES ('4', '光辉岁月', 'Beyond', '/img/singerPic/1586078551461Beyond.jpg', '/song/Beyond-光辉岁月.mp3', '0000000031');
INSERT INTO `music` VALUES ('5', '无悔这一生', 'Beyond', '/img/singerPic/1586078551461Beyond.jpg', '/song/Beyond-无悔这一生.mp3', '0000000026');
INSERT INTO `music` VALUES ('6', '真的爱你', 'Beyond', '/img/singerPic/1586078551461Beyond.jpg', '/song/Beyond-真的爱你.mp3', '0000000035');
INSERT INTO `music` VALUES ('7', 'My Heart Will Go On', 'Celine Dion', '/img/singerPic/1586075898639Celine Dion.png', '/song/Celine Dion-My Heart Will Go On.mp3', '0000000097');
INSERT INTO `music` VALUES ('8', 'Lose Yourself', 'Eminem', '/img/singerPic/Eminem.jpg', '/song/Eminem-Lose Yourself.mp3', '0000000077');
INSERT INTO `music` VALUES ('9', 'Love The Way You Lie', 'Eminem', '/img/singerPic/Eminem.jpg', '/song/Eminem-Love The Way You Lie.mp3', '0000000096');
INSERT INTO `music` VALUES ('10', 'When I\'m Gone', 'Eminem', '/img/singerPic/Eminem.jpg', '/song/Eminem-When I\'m Gone.mp3', '0000000046');
INSERT INTO `music` VALUES ('11', 'Il Buono Il Cattivo Il Brutto', 'Ennio Morricone', '/img/singerPic/Morricone.jpg', '/song/Ennio Morricone-Il Buono, Il Cattivo, Il Brutto.mp3', '0000000045');
INSERT INTO `music` VALUES ('12', 'Once Upon a Time in the West', 'Ennio Morricone', '/img/singerPic/Morricone.jpg', '/song/Ennio Morricone-Once Upon a Time in the West.mp3', '0000000084');
INSERT INTO `music` VALUES ('13', 'Titoli', 'Ennio Morricone', '/img/singerPic/Morricone.jpg', '/song/Ennio Morricone-Titoli.mp3', '0000000084');
INSERT INTO `music` VALUES ('14', '你好', 'G.E.M.邓紫棋', '/img/singerPic/dengziqi.jpg', '/song/周杰伦 - 说好不哭.mp3', '0000000068');
INSERT INTO `music` VALUES ('15', '夜空中最亮的星', 'G.E.M.邓紫棋', '/img/singerPic/dengziqi.jpg', '/song/G.E.M.邓紫棋-夜空中最亮的星.mp3', '0000000088');
INSERT INTO `music` VALUES ('16', '泡沫', 'G.E.M.邓紫棋', '/img/singerPic/dengziqi.jpg', '/song/G.E.M.邓紫棋-泡沫.mp3', '0000000034');
INSERT INTO `music` VALUES ('17', '龙卷风', 'G.E.M.邓紫棋', '/img/singerPic/dengziqi.jpg', '/song/G.E.M.邓紫棋-龙卷风.mp3', '0000000007');
INSERT INTO `music` VALUES ('18', 'Someday', 'IU', '/img/singerPic/IU.jpg', '/song/IU-Someday.mp3', '0000000034');
INSERT INTO `music` VALUES ('19', 'Twenty-three (二十三)', 'IU', '/img/singerPic/IU.jpg', '/song/IU-Twenty-three (二十三).mp3', '0000000045');
INSERT INTO `music` VALUES ('20', 'Falling Crazy in Love', 'Jessica', '/img/singerPic/1586091653843郑秀妍.jpg', '/song/Jessica - Falling Crazy in Love.mp3', '0000000024');
INSERT INTO `music` VALUES ('21', 'Change of Time', 'Josh Ritter', '/img/singerPic/1586090939016Josh Ritter.jpg', '/song/Josh Ritter - Change of Time.mp3', '0000000085');
INSERT INTO `music` VALUES ('22', 'Darlin', 'Josh Ritter', '/img/singerPic/1586090939016Josh Ritter.jpg', '/song/Josh Ritter - Darlin.mp3', '0000000053');
INSERT INTO `music` VALUES ('23', 'I Am Piano', 'Peter Broderick', '/img/singerPic/1586081310686Peter Broderick.jpeg', '/song/Peter Broderick - I Am Piano.mp3', '0000000011');
INSERT INTO `music` VALUES ('24', 'The Children', 'Ramin Djawadi', '/img/singerPic/1586078732611Ramin Djawadi.jpg', '/song/Ramin Djawadi-The Children.mp3', '0000000087');
INSERT INTO `music` VALUES ('25', 'Undo', 'Sanna Nielsen', '/img/singerPic/1586091210109Sanna Nielsen.jpg', '/song/Sanna Nielsen-Undo.mp3', '0000000009');
INSERT INTO `music` VALUES ('26', 'Until You', 'Shayne Ward', '/img/singerPic/1586090400493Shayne Ward.jpg', '/song/Shayne Ward-Until You.mp3', '0000000080');
INSERT INTO `music` VALUES ('27', 'Let It Go', 'The Piano Guys', '/img/singerPic/1586089570101the piano guys.jpg', '/song/The Piano Guys-Let It Go.mp3', '0000000072');
INSERT INTO `music` VALUES ('28', 'Stupid', 'Tone Damli Aaberge', '/img/singerPic/1586091104616Tone Damli Aaberge.jpg', '/song/Tone Damli Aaberge - Stupid.mp3', '0000000022');
INSERT INTO `music` VALUES ('29', 'Soundtrack', 'Various Artists', '/img/singerPic/1586079436284Various Artists.jpg', '/song/Soundtrack-Zoosters Breakout.mp3', '0000000093');
INSERT INTO `music` VALUES ('30', 'G小调的巴赫 (Vince Moonrise Edit)', 'Shayne Ward', '/img/singerPic/1586090400493Shayne Ward.jpg', '/song/Vince Zhang - G小调的巴赫 (Vince Moonrise Edit).mp3', '0000000097');
INSERT INTO `music` VALUES ('31', 'River Flows in You', 'Yiruma', '/img/singerPic/1586090648269Yiruma.jpg', '/song/Yiruma - River Flows in You.mp3', '0000000007');
INSERT INTO `music` VALUES ('32', '倔强', '五月天', '/img/singerPic/1586076633782五月天.jpg', '/song/五月天-倔强.mp3', '0000000042');
INSERT INTO `music` VALUES ('33', '如果我们不曾相遇', '五月天', '/img/singerPic/1586076633782五月天.jpg', '/song/五月天-如果我们不曾相遇.mp3', '0000000091');
INSERT INTO `music` VALUES ('34', '孙悟空', '五月天', '/img/singerPic/1586076633782五月天.jpg', '/song/五月天-孙悟空.mp3', '0000000027');
INSERT INTO `music` VALUES ('35', '疯狂的法老', 'Yiruma', '/img/singerPic/1586090648269Yiruma.jpg', '/song/倪椤 - 疯狂的法老.mp3', '0000000063');
INSERT INTO `music` VALUES ('36', '国王与乞丐', '杨宗纬', '/img/singerPic/yangzongwei.jpg', '/song/华晨宇 + 杨宗纬-国王与乞丐.mp3', '0000000035');
INSERT INTO `music` VALUES ('37', '夜的第七章', '周杰伦', '/img/singerPic/zhoujielun.jpg', '/song/周杰伦&潘儿-夜的第七章.mp3', '0000000082');
INSERT INTO `music` VALUES ('38', '七里香', '周杰伦', '/img/singerPic/zhoujielun.jpg', '/song/周杰伦-七里香.mp3', '0000000006');
INSERT INTO `music` VALUES ('39', '听妈妈的话', '周杰伦', '/img/singerPic/zhoujielun.jpg', '/song/周杰伦-听妈妈的话.mp3', '0000000085');
INSERT INTO `music` VALUES ('40', '告白气球', '周杰伦', '/img/singerPic/zhoujielun.jpg', '/song/周杰伦-告白气球.mp3', '0000000003');
INSERT INTO `music` VALUES ('41', '夜曲', '周杰伦', '/img/singerPic/zhoujielun.jpg', '/song/周杰伦-夜曲.mp3', '0000000063');
INSERT INTO `music` VALUES ('42', '开不了口', '周杰伦', '/img/singerPic/zhoujielun.jpg', '/song/周杰伦-开不了口.mp3', '0000000003');
INSERT INTO `music` VALUES ('43', '晴天', '周杰伦', '/img/singerPic/zhoujielun.jpg', '/song/周杰伦-晴天.mp3', '0000000026');
INSERT INTO `music` VALUES ('44', '烟花易冷', '周杰伦', '/img/singerPic/zhoujielun.jpg', '/song/周杰伦-烟花易冷.mp3', '0000000021');
INSERT INTO `music` VALUES ('45', '牛仔很忙', '周杰伦', '/img/singerPic/zhoujielun.jpg', '/song/周杰伦-牛仔很忙.mp3', '0000000028');
INSERT INTO `music` VALUES ('46', '稻香', '周杰伦', '/img/singerPic/zhoujielun.jpg', '/song/周杰伦-稻香.mp3', '0000000075');
INSERT INTO `music` VALUES ('47', '红尘客栈', '周杰伦', '/img/singerPic/zhoujielun.jpg', '/song/周杰伦-红尘客栈.mp3', '0000000089');
INSERT INTO `music` VALUES ('48', '菊花台', '周杰伦', '/img/singerPic/zhoujielun.jpg', '/song/周杰伦-菊花台.mp3', '0000000021');
INSERT INTO `music` VALUES ('49', 'Perfect Time', '小林未郁', '/img/singerPic/1586078973463小林未郁.jpeg', '/song/小林未郁-Perfect Time.mp3', '0000000037');
INSERT INTO `music` VALUES ('50', 'Oh!', '少女时代', '/img/singerPic/1586090215632少女时代.jpg', '/song/少女时代 - Oh!.mp3', '0000000021');
INSERT INTO `music` VALUES ('51', '倩女幽魂', '张国荣', '/img/singerPic/zhangguorong.jpg', '/song/张国荣-倩女幽魂.m4a', '0000000094');
INSERT INTO `music` VALUES ('52', '当爱已成往事', '张国荣', '/img/singerPic/zhangguorong.jpg', '/song/张国荣-当爱已成往事.mp3', '0000000006');
INSERT INTO `music` VALUES ('53', '想你', '张国荣', '/img/singerPic/zhangguorong.jpg', '/song/张国荣-想你.m4a', '0000000048');
INSERT INTO `music` VALUES ('54', '最冷一天', '张国荣', '/img/singerPic/zhangguorong.jpg', '/song/张国荣-最冷一天.mp3', '0000000020');
INSERT INTO `music` VALUES ('55', 'nihao', '张杰', '/img/singerPic/zhangjie.jpg', '/song/周杰伦 - 说好不哭.mp3', '0000000055');
INSERT INTO `music` VALUES ('56', '他不懂', '张杰', '/img/singerPic/zhangjie.jpg', '/song/张杰-他不懂.mp3', '0000000016');
INSERT INTO `music` VALUES ('57', '仰望星空', '张杰', '/img/singerPic/zhangjie.jpg', '/song/张杰-仰望星空.mp3', '0000000013');
INSERT INTO `music` VALUES ('58', '何必在一起', '张杰', '/img/singerPic/zhangjie.jpg', '/song/张杰-何必在一起.mp3', '0000000018');
INSERT INTO `music` VALUES ('59', '剑心', '张杰', '/img/singerPic/zhangjie.jpg', '/song/张杰-剑心.mp3', '0000000051');
INSERT INTO `music` VALUES ('60', '天下', '张杰', '/img/singerPic/zhangjie.jpg', '/song/张杰-天下.mp3', '0000000002');
INSERT INTO `music` VALUES ('61', '如果爱', '张杰', '/img/singerPic/zhangjie.jpg', '/song/张杰-如果爱.mp3', '0000000053');
INSERT INTO `music` VALUES ('62', '逆态度', '张杰', '/img/singerPic/zhangjie.jpg', '/song/张杰-逆态度.mp3', '0000000061');
INSERT INTO `music` VALUES ('63', '逆战', '张杰', '/img/singerPic/zhangjie.jpg', '/song/张杰-逆战.mp3', '0000000045');
INSERT INTO `music` VALUES ('64', '一吻之间', '张碧晨', '/img/singerPic/zhangbichen.jpg', '/song/张碧晨-一吻之间.mp3', '0000000043');
INSERT INTO `music` VALUES ('65', '下一秒', '张碧晨', '/img/singerPic/zhangbichen.jpg', '/song/张碧晨-下一秒.mp3', '0000000077');
INSERT INTO `music` VALUES ('66', '平凡之路', '朴树', '/img/singerPic/pushu.jpg', '/song/朴树-平凡之路.mp3', '0000000056');
INSERT INTO `music` VALUES ('67', '白桦林', '朴树', '/img/singerPic/pushu.jpg', '/song/朴树-白桦林.mp3', '0000000049');
INSERT INTO `music` VALUES ('68', 'K歌之王', '李克勤', '/img/singerPic/likeqin.jpg', '/song/李克勤-K歌之王.mp3', '0000000075');
INSERT INTO `music` VALUES ('69', '护花使者', '李克勤', '/img/singerPic/likeqin.jpg', '/song/李克勤-护花使者.mp3', '0000000030');
INSERT INTO `music` VALUES ('70', '月半小夜曲', '李克勤', '/img/singerPic/likeqin.jpg', '/song/李克勤-月半小夜曲.mp3', '0000000024');
INSERT INTO `music` VALUES ('71', '年少有为', '李荣浩', '/img/singerPic/lironghao.jpg', '/song/李荣浩-年少有为.mp3', '0000000027');
INSERT INTO `music` VALUES ('72', '作曲家', '李荣浩', '/img/singerPic/lironghao.jpg', '/song/李荣浩-作曲家.mp3', '0000000064');
INSERT INTO `music` VALUES ('73', '李白', '李荣浩', '/img/singerPic/lironghao.jpg', '/song/李荣浩-李白.mp3', '0000000039');
INSERT INTO `music` VALUES ('74', '多余', '杨宗纬', '/img/singerPic/yangzongwei.jpg', '/song/杨宗纬-多余.mp3', '0000000004');
INSERT INTO `music` VALUES ('75', '一千年以后', '林俊杰', '/img/singerPic/1646507266498IMG_4801.jpg', '/song/林俊杰-一千年以后.mp3', '0000000100');
INSERT INTO `music` VALUES ('76', '关键词', '林俊杰', '/img/singerPic/1646507266498IMG_4801.jpg', '/song/林俊杰-关键词.mp3', '0000000089');
INSERT INTO `music` VALUES ('77', '学不会', '林俊杰', '/img/singerPic/1646507266498IMG_4801.jpg', '/song/林俊杰-学不会.mp3', '0000000042');
INSERT INTO `music` VALUES ('78', '期待爱', '林俊杰', '/img/singerPic/1646507266498IMG_4801.jpg', '/song/林俊杰-期待爱.mp3', '0000000045');
INSERT INTO `music` VALUES ('79', '江南', '林俊杰', '/img/singerPic/1646507266498IMG_4801.jpg', '/song/林俊杰-江南.mp3', '0000000100');
INSERT INTO `music` VALUES ('80', '醉赤壁', '林俊杰', '/img/singerPic/1646507266498IMG_4801.jpg', '/song/林俊杰-醉赤壁.mp3', '0000000062');
INSERT INTO `music` VALUES ('81', '111', '林允儿', '/img/singerPic/linyuner.jpg', '/song/周杰伦 - 说好不哭.mp3', '0000000011');
INSERT INTO `music` VALUES ('82', '小幸运', '林允儿', '/img/singerPic/linyuner.jpg', '/song/林允儿-小幸运.mp3', '0000000067');
INSERT INTO `music` VALUES ('83', '月亮代表我的心', '林允儿', '/img/singerPic/linyuner.jpg', '/song/林允儿-月亮代表我的心.mp3', '0000000001');
INSERT INTO `music` VALUES ('84', '红豆', '林允儿', '/img/singerPic/linyuner.jpg', '/song/林允儿-红豆.mp3', '0000000005');
INSERT INTO `music` VALUES ('85', 'Bye Bye Love', '梁耀燮', '/img/singerPic/liangyaoxie.jpg', '/song/梁耀燮-Bye Bye Love.mp3', '0000000022');
INSERT INTO `music` VALUES ('86', 'Shadow (그림자)', '梁耀燮', '/img/singerPic/liangyaoxie.jpg', '/song/梁耀燮-Shadow (그림자).mp3', '0000000095');
INSERT INTO `music` VALUES ('87', '리본(Ribbon)', '梁耀燮', '/img/singerPic/liangyaoxie.jpg', '/song/梁耀燮-리본(Ribbon).mp3', '0000000009');
INSERT INTO `music` VALUES ('88', '无问', '毛不易', '/img/singerPic/maobuyi.jpg', '/song/毛不易-无问.mp3', '0000000060');
INSERT INTO `music` VALUES ('89', '那时的我们', '毛不易', '/img/singerPic/maobuyi.jpg', '/song/毛不易-那时的我们.mp3', '0000000070');
INSERT INTO `music` VALUES ('90', '唯一', '王力宏', '/img/singerPic/wanglihong.jpg', '/song/王力宏-唯一.mp3', '0000000071');
INSERT INTO `music` VALUES ('91', '大城小爱', '王力宏', '/img/singerPic/wanglihong.jpg', '/song/王力宏-大城小爱.mp3', '0000000043');
INSERT INTO `music` VALUES ('92', '需要人陪', '王力宏', '/img/singerPic/wanglihong.jpg', '/song/周杰伦 - 说好不哭.mp3', '0000000002');
INSERT INTO `music` VALUES ('93', '匆匆那年', '王菲', '/img/singerPic/wangfei.jpg', '/song/王菲-匆匆那年.mp3', '0000000082');
INSERT INTO `music` VALUES ('98', 'aloha heja he', 'Josh Ritter', '/img/singerPic/1586090939016Josh Ritter.jpg', '/song/群星 - aloha heja he.mp3', '0000000091');
INSERT INTO `music` VALUES ('99', '侠风', '胡伟立', '/img/singerPic/1586076393834胡伟立.png', '/song/胡伟立 - 侠风.mp3', '0000000019');
INSERT INTO `music` VALUES ('100', '太极乐', '胡伟立', '/img/singerPic/1586076393834胡伟立.png', '/song/武聆音雄 - 太极乐.mp3', '0000000024');
INSERT INTO `music` VALUES ('101', '嬉戏', '胡伟立', '/img/singerPic/1586076393834胡伟立.png', '/song/胡伟立 - 嬉戏.mp3', '0000000062');
INSERT INTO `music` VALUES ('102', '六月的雨', '胡歌', '/img/singerPic/huge.jpg', '/song/胡歌-六月的雨.mp3', '0000000039');
INSERT INTO `music` VALUES ('103', '忘记时间', '胡歌', '/img/singerPic/huge.jpg', '/song/胡歌-忘记时间.mp3', '0000000007');
INSERT INTO `music` VALUES ('104', '逍遥叹', '胡歌', '/img/singerPic/huge.jpg', '/song/胡歌-逍遥叹.mp3', '0000000020');
INSERT INTO `music` VALUES ('105', '어떤 말로도 (Confession)', '艺声', '/img/singerPic/yisheng.jpg', '/song/艺声 + 灿烈-어떤 말로도 (Confession).mp3', '0000000075');
INSERT INTO `music` VALUES ('106', '문 열어봐 (Here I am)', '艺声', '/img/singerPic/yisheng.jpg', '/song/艺声-문 열어봐 (Here I am).mp3', '0000000018');
INSERT INTO `music` VALUES ('107', '春天的阵雨 (Paper Umbrella)', '艺声', '/img/singerPic/yisheng.jpg', '/song/艺声-春天的阵雨 (Paper Umbrella).mp3', '0000000061');
INSERT INTO `music` VALUES ('108', '我乐意', '许嵩', '/img/singerPic/xusong.jpg', '/song/许嵩-我乐意.mp3', '0000000054');
INSERT INTO `music` VALUES ('109', '제주도의 푸른 밤', '金泰妍', '/img/singerPic/taiyan.jpg', '/song/金泰妍-제주도의 푸른 밤.mp3', '0000000085');
INSERT INTO `music` VALUES ('110', '天后', '陈势安', '/img/singerPic/chengshian.jpg', '/song/陈势安-天后.mp3', '0000000062');
INSERT INTO `music` VALUES ('111', '因为爱情', '陈奕迅', '/img/singerPic/chenyixun.jpg', '/song/陈奕迅 + 王菲-因为爱情.mp3', '0000000053');
INSERT INTO `music` VALUES ('112', '不要说话', '陈奕迅', '/img/singerPic/chenyixun.jpg', '/song/陈奕迅-不要说话.mp3', '0000000080');
INSERT INTO `music` VALUES ('113', '红玫瑰', '陈奕迅', '/img/singerPic/chenyixun.jpg', '/song/陈奕迅-红玫瑰.mp3', '0000000038');
INSERT INTO `music` VALUES ('114', '陪你度过漫长岁月', '陈奕迅', '/img/singerPic/chenyixun.jpg', '/song/陈奕迅-陪你度过漫长岁月.mp3', '0000000052');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `UserName` varchar(255) NOT NULL,
  `UserPassword` varchar(255) NOT NULL,
  `UserOffline` int NOT NULL,
  `Manager` int NOT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `不可重复` (`UserName`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'Yin33', '123', '1', '0');
INSERT INTO `user` VALUES ('2', '012', '012', '1', '0');
INSERT INTO `user` VALUES ('3', '789', '789', '1', '0');
INSERT INTO `user` VALUES ('4', 'tawuhen', '123', '1', '0');
INSERT INTO `user` VALUES ('5', '1234321', '123', '0', '0');
INSERT INTO `user` VALUES ('6', 'yoonaAA', '123', '0', '0');
INSERT INTO `user` VALUES ('7', 'yoonaAB', '123', '0', '0');
INSERT INTO `user` VALUES ('8', 'yoonaAC', '123', '1', '0');
INSERT INTO `user` VALUES ('9', 'yoonaAD', '123', '1', '0');
INSERT INTO `user` VALUES ('10', 'yoona90', '123', '0', '0');
INSERT INTO `user` VALUES ('11', 'test', '123', '1', '0');
INSERT INTO `user` VALUES ('12', 'Yoona001', '123', '0', '0');
INSERT INTO `user` VALUES ('13', 'yuner', '123', '0', '0');
INSERT INTO `user` VALUES ('14', 'qqq', '111', '1', '0');
INSERT INTO `user` VALUES ('15', 'qwe', '123', '1', '0');
INSERT INTO `user` VALUES ('16', '1234', '', '0', '0');
INSERT INTO `user` VALUES ('17', '1234d', '123', '1', '0');
INSERT INTO `user` VALUES ('18', 'zxc', '123', '1', '0');
INSERT INTO `user` VALUES ('19', 'Yin', '24c14f112462b440c3de9523b05c4c59', '1', '0');
INSERT INTO `user` VALUES ('20', 'Yin1', '123', '0', '0');
INSERT INTO `user` VALUES ('21', 'cayhy', 'bcfda26051d8e164b0a251836b202495', '0', '0');
INSERT INTO `user` VALUES ('23', 'qwer', 'asdf', '0', '0');
DROP TRIGGER IF EXISTS `check_duplicate`;
DELIMITER ;;
CREATE TRIGGER `check_duplicate` BEFORE INSERT ON `like` FOR EACH ROW BEGIN
    IF EXISTS (SELECT * FROM `like` WHERE musicid = NEW.musicid AND userid = NEW.userid) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'music-user TRIGGER called';
    END IF;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `music-like`;
DELIMITER ;;
CREATE TRIGGER `music-like` AFTER INSERT ON `like` FOR EACH ROW BEGIN
	UPDATE music SET `like` = `like` + 1 WHERE music.MusicID = NEW.musicid;
    END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `music-like-delete`;
DELIMITER ;;
CREATE TRIGGER `music-like-delete` AFTER DELETE ON `like` FOR EACH ROW BEGIN
	UPDATE music SET `like` = `like` - 1 WHERE music.MusicID = old.musicid;
    END
;;
DELIMITER ;

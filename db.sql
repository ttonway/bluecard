/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : bluecard

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2017-04-25 20:12:43
*/

SET FOREIGN_KEY_CHECKS=0;


DROP TABLE IF EXISTS `sys_bank`;
CREATE TABLE `sys_bank` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `area` varchar(20) DEFAULT NULL,
  `bank` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `sys_org`;
CREATE TABLE `sys_org` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `area` varchar(20) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `sys_link`;
CREATE TABLE `sys_link` (
  `key` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `imageFile` varchar(255) DEFAULT NULL,
  `imageContentType` varchar(255) DEFAULT NULL,
  `text` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `userCode` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `bankId` bigint(20) NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `roleName` varchar(255) DEFAULT NULL,
  `createTime` varchar(255) DEFAULT NULL,
  `updateTime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `admin_user` VALUES ('1', '管理员', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '0', 'ROLE_ADMIN', '系统管理员', '2017-06-22 08:41:46', '2017-06-22 08:41:46');


-- ----------------------------
-- Table structure for apply_record
-- ----------------------------
DROP TABLE IF EXISTS `apply_record`;
CREATE TABLE `apply_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `profession` varchar(255) DEFAULT NULL,
  `accumulation_fund` varchar(10) DEFAULT NULL,
  `organizationId` bigint(20) NOT NULL,
  `income` bigint(10) NOT NULL,
  `creditLine` bigint(10) NOT NULL,
  `bankId` bigint(20) NOT NULL,
  `status` varchar(50) DEFAULT NULL,
  `refereePhone` varchar(20) DEFAULT NULL,
  `createTime` varchar(255) DEFAULT NULL,
  `updateTime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




INSERT INTO `sys_bank` VALUES ('1', '市区', '秦南支行');
INSERT INTO `sys_bank` VALUES ('2', '市区', '亭湖支行');
INSERT INTO `sys_bank` VALUES ('3', '市区', '青年中路支行');
INSERT INTO `sys_bank` VALUES ('4', '市区', '盐都支行');
INSERT INTO `sys_bank` VALUES ('5', '市区', '人民中路支行');
INSERT INTO `sys_bank` VALUES ('6', '市区', '旺角支行');
INSERT INTO `sys_bank` VALUES ('7', '市区', '市分行营业部');
INSERT INTO `sys_bank` VALUES ('8', '市区', '白马市场支行');
INSERT INTO `sys_bank` VALUES ('9', '响水', '响水县双园路支行');
INSERT INTO `sys_bank` VALUES ('10', '响水', '响水县支行营业部');
INSERT INTO `sys_bank` VALUES ('11', '滨海', '滨海县支行营业部');
INSERT INTO `sys_bank` VALUES ('12', '滨海', '滨海县通榆镇支行');
INSERT INTO `sys_bank` VALUES ('13', '滨海', '滨海县阜东中路支行');
INSERT INTO `sys_bank` VALUES ('14', '阜宁', '阜宁县羊寨镇支行');
INSERT INTO `sys_bank` VALUES ('15', '阜宁', '阜宁县南城区支行');
INSERT INTO `sys_bank` VALUES ('16', '阜宁', '阜宁县阜城大街支行');
INSERT INTO `sys_bank` VALUES ('17', '阜宁', '阜宁县支行营业部');
INSERT INTO `sys_bank` VALUES ('18', '射阳', '射阳县支行营业部');
INSERT INTO `sys_bank` VALUES ('19', '射阳', '射阳县朝阳支行');
INSERT INTO `sys_bank` VALUES ('20', '射阳', '射阳县解放东路支行');
INSERT INTO `sys_bank` VALUES ('21', '建湖', '建湖县支行营业部');
INSERT INTO `sys_bank` VALUES ('22', '建湖', '建湖县太平路支行');
INSERT INTO `sys_bank` VALUES ('23', '东台', '东台市望海西路支行');
INSERT INTO `sys_bank` VALUES ('24', '东台', '东台市安丰镇支行');
INSERT INTO `sys_bank` VALUES ('25', '东台', '东台市时堰镇支行');
INSERT INTO `sys_bank` VALUES ('26', '东台', '东台市富安镇支行');
INSERT INTO `sys_bank` VALUES ('27', '东台', '东台市支行营业部');
INSERT INTO `sys_bank` VALUES ('28', '大丰', '盐城市大丰支行');
INSERT INTO `sys_bank` VALUES ('29', '大丰', '盐城市草堰镇支行');
INSERT INTO `sys_bank` VALUES ('30', '大丰', '盐城市裕华镇支行');
INSERT INTO `sys_bank` VALUES ('31', '大丰', '盐城市健康东路支行');
INSERT INTO `sys_bank` VALUES ('32', '大丰', '盐城市幸福东大街支行');

INSERT INTO `sys_org` VALUES ('1', '市区', '中石化');
INSERT INTO `sys_org` VALUES ('2', '市区', '商业大厦');
INSERT INTO `sys_org` VALUES ('3', '市区', '金鹰购物中心');
INSERT INTO `sys_org` VALUES ('4', '市区', '苏宁电器');
INSERT INTO `sys_org` VALUES ('5', '市区', '五星电器');
INSERT INTO `sys_org` VALUES ('6', '市区', '面包新语');
INSERT INTO `sys_org` VALUES ('7', '市区', '曹操洗车');
INSERT INTO `sys_org` VALUES ('8', '市区', '成久洗车');
INSERT INTO `sys_org` VALUES ('9', '市区', '完美洗车');
INSERT INTO `sys_org` VALUES ('10', '市区', '阳鹭洗车');
INSERT INTO `sys_org` VALUES ('11', '市区', '新贵族');
INSERT INTO `sys_org` VALUES ('12', '市区', '香车美妆');
INSERT INTO `sys_org` VALUES ('13', '市区', '赛浪');
INSERT INTO `sys_org` VALUES ('14', '市区', '新车居');
INSERT INTO `sys_org` VALUES ('15', '市区', '爵士洗车');
INSERT INTO `sys_org` VALUES ('16', '市区', '新骑士');
INSERT INTO `sys_org` VALUES ('17', '市区', '豪瀑洗车');
INSERT INTO `sys_org` VALUES ('18', '市区', '华庭洗车');
INSERT INTO `sys_org` VALUES ('19', '市区', '童大洗车');
INSERT INTO `sys_org` VALUES ('20', '市区', '尊爵洗车');
INSERT INTO `sys_org` VALUES ('21', '市区', '安莱汽车生活馆');
INSERT INTO `sys_org` VALUES ('22', '市区', '车乐福');
INSERT INTO `sys_org` VALUES ('23', '市区', '快兔子');
INSERT INTO `sys_org` VALUES ('24', '市区', '恒隆汽车服务部');
INSERT INTO `sys_org` VALUES ('25', '市区', '辕坊洗车');
INSERT INTO `sys_org` VALUES ('26', '市区', '春雨洗车');
INSERT INTO `sys_org` VALUES ('27', '东台', '中石化');
INSERT INTO `sys_org` VALUES ('28', '东台', '爱车地带汽车服务');
INSERT INTO `sys_org` VALUES ('29', '东台', '五星汽车服务');
INSERT INTO `sys_org` VALUES ('30', '东台', '小拇指');
INSERT INTO `sys_org` VALUES ('31', '东台', '东盛汽车服务');
INSERT INTO `sys_org` VALUES ('32', '东台', '江南八度');
INSERT INTO `sys_org` VALUES ('33', '大丰', '中石化');
INSERT INTO `sys_org` VALUES ('34', '大丰', '名流车饰');
INSERT INTO `sys_org` VALUES ('35', '大丰', '尼尔森');
INSERT INTO `sys_org` VALUES ('36', '大丰', '润富汽车养护');
INSERT INTO `sys_org` VALUES ('37', '大丰', '鹰骏汽车养护');
INSERT INTO `sys_org` VALUES ('38', '大丰', '提拉米酥');
INSERT INTO `sys_org` VALUES ('39', '射阳', '中石化');
INSERT INTO `sys_org` VALUES ('40', '射阳', '金奔腾洗车');
INSERT INTO `sys_org` VALUES ('41', '射阳', '小仇洗车');
INSERT INTO `sys_org` VALUES ('42', '射阳', '丰源汽车装潢');
INSERT INTO `sys_org` VALUES ('43', '射阳', '英伦时光蛋糕房');
INSERT INTO `sys_org` VALUES ('44', '建湖', '中石化');
INSERT INTO `sys_org` VALUES ('45', '建湖', '鑫源汽车装璜');
INSERT INTO `sys_org` VALUES ('46', '建湖', '旭日东升汽车装饰');
INSERT INTO `sys_org` VALUES ('47', '建湖', '志诚名车美容养护会所');
INSERT INTO `sys_org` VALUES ('48', '建湖', '元祖蛋糕');
INSERT INTO `sys_org` VALUES ('49', '阜宁', '中石化');
INSERT INTO `sys_org` VALUES ('50', '阜宁', '吉祥洗车');
INSERT INTO `sys_org` VALUES ('51', '阜宁', '圣意隆汽车美容');
INSERT INTO `sys_org` VALUES ('52', '阜宁', '车爵仕汽车装饰');
INSERT INTO `sys_org` VALUES ('53', '阜宁', '面包花苑');
INSERT INTO `sys_org` VALUES ('54', '滨海', '中石化');
INSERT INTO `sys_org` VALUES ('55', '滨海', '美车缘');
INSERT INTO `sys_org` VALUES ('56', '滨海', '莱卡汽车');
INSERT INTO `sys_org` VALUES ('57', '滨海', '咖莎西点');
INSERT INTO `sys_org` VALUES ('58', '响水', '中石化');
INSERT INTO `sys_org` VALUES ('59', '响水', '车之坊汽车美容');
INSERT INTO `sys_org` VALUES ('60', '响水', '小兵汽车美容会所');
INSERT INTO `sys_org` VALUES ('61', '响水', '爱丽丝面包工坊');

LOCK TABLES `sys_link` WRITE;
/*!40000 ALTER TABLE `sys_link` DISABLE KEYS */;
INSERT INTO `sys_link` VALUES ('car','0元洗车','1886dbcf-5663-4258-aba7-78d95140ee1b','image/jpeg',''),('dessert','半价甜点','111c8d80-59e5-4431-8a99-6c6f9103b3ea','image/jpeg',''),('gasoline','加油返现','4f927128-a01b-4de2-aefe-dd4a31f8a05a','image/jpeg',''),('movie','9元观影','aaaf534e-b12c-45b2-bb40-3084321260ca','image/jpeg',''),('yxcar','悦享车>生活','c93a855b-337e-4645-994c-a7c6a1c4e998','image/jpeg',''),('yxshopping','悦享买买买','6d19e21c-f345-4f60-a75a-6e3737849fe2','image/jpeg',''),('yxtravel','悦享旅游','13000ee8-3cf9-437f-a44f-53ea51262b6b','image/jpeg','');
/*!40000 ALTER TABLE `sys_link` ENABLE KEYS */;
UNLOCK TABLES;
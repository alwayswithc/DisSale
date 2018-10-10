/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : sale_distribution

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-10-10 16:36:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for agency
-- ----------------------------
DROP TABLE IF EXISTS `agency`;
CREATE TABLE `agency` (
  `agency_id` int(11) NOT NULL AUTO_INCREMENT,
  `agency_name` varchar(255) NOT NULL,
  `agency_password` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `agency_level` int(11) DEFAULT NULL COMMENT '1,2对应一级二级经销商',
  `regist_time` datetime DEFAULT NULL,
  `agency_address` varchar(255) DEFAULT NULL,
  `higher_agency_id` int(11) DEFAULT NULL COMMENT 'null则表示一级经销商',
  `auth_code` varchar(255) DEFAULT '',
  PRIMARY KEY (`agency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of agency
-- ----------------------------
INSERT INTO `agency` VALUES ('1', '多多', '123', '15815791228', '2', '2018-09-30 19:20:25', '广东省潮州市', '2', '282.574');
INSERT INTO `agency` VALUES ('2', '西西', '123', '15815791228', '1', '2018-10-02 14:16:57', '广东省广州市', null, '282');

-- ----------------------------
-- Table structure for invoice
-- ----------------------------
DROP TABLE IF EXISTS `invoice`;
CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`invoice_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `torder` (`order_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of invoice
-- ----------------------------
INSERT INTO `invoice` VALUES ('14', '1', '0', '2018-10-10 16:16:48');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) DEFAULT NULL,
  `product_num` int(11) DEFAULT NULL,
  `product_size` int(11) DEFAULT NULL,
  `product_price` double(5,2) DEFAULT NULL,
  `product_category` int(255) NOT NULL,
  `product_desc` varchar(255) DEFAULT NULL,
  `simg` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `product_category` (`product_category`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`product_category`) REFERENCES `product_category` (`product_category_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '新七白泥膜', '10', '12', '140.00', '1', '', '\\upload\\product\\新七白泥膜\\2018100800070384266.PNG');
INSERT INTO `product` VALUES ('2', '新七白美白精华', '8', '20', '260.00', '3', '', '\\upload\\product\\新七白美白精华\\2018100812412910642.PNG');
INSERT INTO `product` VALUES ('3', '玉颜透白洁面啫喱', '12', '20', '100.00', '2', '', null);
INSERT INTO `product` VALUES ('4', '新恒美紧肤日霜', '15', '8', '340.00', '4', '', null);
INSERT INTO `product` VALUES ('5', '平衡洁面乳', '15', '6', '60.00', '2', null, null);
INSERT INTO `product` VALUES ('6', '御五行焕肌精华', '10', '10', '760.00', '3', null, null);
INSERT INTO `product` VALUES ('7', '梦幻曲面膜', '12', '12', '199.00', '1', null, null);
INSERT INTO `product` VALUES ('8', '新玉润水晶面膜', '8', '8', '230.00', '1', null, null);
INSERT INTO `product` VALUES ('9', '新玉润菁华霜', '10', '6', '179.00', '4', null, null);
INSERT INTO `product` VALUES ('10', '肌本清源洁面乳', '15', '12', '59.00', '2', null, null);
INSERT INTO `product` VALUES ('12', '清肌太极泥', '16', '12', '480.00', '1', null, null);
INSERT INTO `product` VALUES ('13', '凝时臻颜洁面乳', '12', '12', '160.00', '2', null, null);
INSERT INTO `product` VALUES ('14', '深润活颜精华', '15', '15', '200.00', '3', null, null);

-- ----------------------------
-- Table structure for product_category
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category` (
  `product_category_id` int(11) NOT NULL,
  `product_category_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`product_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_category
-- ----------------------------
INSERT INTO `product_category` VALUES ('1', '面膜');
INSERT INTO `product_category` VALUES ('2', '洁面');
INSERT INTO `product_category` VALUES ('3', '精华');
INSERT INTO `product_category` VALUES ('4', '面霜');

-- ----------------------------
-- Table structure for product_img
-- ----------------------------
DROP TABLE IF EXISTS `product_img`;
CREATE TABLE `product_img` (
  `product_img_id` int(11) NOT NULL AUTO_INCREMENT,
  `img_addr` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`product_img_id`),
  KEY `product_img_ibfk_1` (`product_id`),
  CONSTRAINT `product_img_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_img
-- ----------------------------
INSERT INTO `product_img` VALUES ('9', '\\upload\\product\\新七白美白精华\\2018100812413064802.PNG', '2');
INSERT INTO `product_img` VALUES ('10', '\\upload\\product\\新七白泥膜\\2018100922303925006.jpg', '1');
INSERT INTO `product_img` VALUES ('11', '\\upload\\product\\新七白泥膜\\2018100922304099636.jpg', '1');

-- ----------------------------
-- Table structure for torder
-- ----------------------------
DROP TABLE IF EXISTS `torder`;
CREATE TABLE `torder` (
  `order_id` int(20) NOT NULL AUTO_INCREMENT,
  `totalprice` double(5,2) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `agency_id` int(11) NOT NULL,
  `status` int(11) NOT NULL COMMENT '1表示发货了，0表示未发货',
  PRIMARY KEY (`order_id`),
  KEY `agency_id` (`agency_id`),
  CONSTRAINT `torder_ibfk_2` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`agency_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of torder
-- ----------------------------
INSERT INTO `torder` VALUES ('1', '620.00', '2018-10-08 21:16:23', '1', '1');
INSERT INTO `torder` VALUES ('2', '740.00', '2018-10-08 21:16:54', '2', '0');
INSERT INTO `torder` VALUES ('3', '260.00', '2018-10-10 16:07:04', '1', '0');

-- ----------------------------
-- Table structure for torder_item
-- ----------------------------
DROP TABLE IF EXISTS `torder_item`;
CREATE TABLE `torder_item` (
  `order_item_id` int(20) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) DEFAULT NULL,
  `order_item_num` int(11) DEFAULT NULL,
  `order_item_price` double(5,2) DEFAULT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_name`),
  CONSTRAINT `torder_item_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `torder` (`order_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of torder_item
-- ----------------------------
INSERT INTO `torder_item` VALUES ('1', '新七白泥膜', '2', '520.00', '1');
INSERT INTO `torder_item` VALUES ('2', '玉颜透白洁面啫喱', '1', '100.00', '1');
INSERT INTO `torder_item` VALUES ('3', '新恒美紧肤日霜', '2', '680.00', '2');
INSERT INTO `torder_item` VALUES ('4', '平衡洁面乳', '1', '60.00', '2');
INSERT INTO `torder_item` VALUES ('5', '新七白面膜', '1', '260.00', '3');

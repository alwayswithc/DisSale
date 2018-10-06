/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : sale_distribution

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-10-06 10:44:39
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
INSERT INTO `agency` VALUES ('1', '多多', '123', '15815791228', '1', '2018-09-30 19:20:25', null, null, '123');
INSERT INTO `agency` VALUES ('2', '西西', '123', '22222', '1', '2018-10-02 14:16:57', null, null, '未授权');

-- ----------------------------
-- Table structure for invoice
-- ----------------------------
DROP TABLE IF EXISTS `invoice`;
CREATE TABLE `invoice` (
  `order_id` bigint(20) NOT NULL,
  `status` int(11) NOT NULL COMMENT '1.未收货 2.已收货',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of invoice
-- ----------------------------

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `order_id` bigint(20) NOT NULL,
  `oreder_item_id` bigint(20) DEFAULT NULL,
  `totalprice` double(5,2) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `agency_id` int(11) NOT NULL,
  `status` int(11) NOT NULL COMMENT '1表示发货了，0表示未发货',
  PRIMARY KEY (`order_id`),
  KEY `order_ibfk_1` (`oreder_item_id`),
  KEY `agency_id` (`agency_id`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`oreder_item_id`) REFERENCES `order_item` (`order_item_id`) ON UPDATE CASCADE,
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`agency_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------

-- ----------------------------
-- Table structure for order_item
-- ----------------------------
DROP TABLE IF EXISTS `order_item`;
CREATE TABLE `order_item` (
  `order_item_id` bigint(20) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `order_item_num` int(11) DEFAULT NULL,
  `order_item_price` double(5,2) DEFAULT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_item
-- ----------------------------

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_num` int(11) DEFAULT NULL,
  `product_size` int(11) DEFAULT NULL,
  `product_price` double(5,2) DEFAULT NULL,
  `product_category` int(255) NOT NULL,
  `product_desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `product_category` (`product_category`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`product_category`) REFERENCES `product_category` (`product_category_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '新七白泥膜', '10', '12', '140.00', '1', null);
INSERT INTO `product` VALUES ('2', '新七白美白精华', '8', '15', '260.00', '3', null);
INSERT INTO `product` VALUES ('3', '玉颜透白洁面啫喱', '12', '20', '100.00', '2', null);
INSERT INTO `product` VALUES ('4', '新恒美紧肤日霜', '15', '8', '340.00', '4', null);
INSERT INTO `product` VALUES ('5', '平衡洁面乳', '15', '6', '60.00', '2', null);
INSERT INTO `product` VALUES ('6', '御五行焕肌精华', '10', '10', '760.00', '3', null);
INSERT INTO `product` VALUES ('7', '梦幻曲面膜', '12', '12', '199.00', '1', null);
INSERT INTO `product` VALUES ('8', '新玉润水晶面膜', '8', '8', '230.00', '1', null);
INSERT INTO `product` VALUES ('9', '新玉润菁华霜', '10', '6', '179.00', '4', null);
INSERT INTO `product` VALUES ('10', '肌本清源洁面乳', '15', '12', '59.00', '2', null);
INSERT INTO `product` VALUES ('11', '泽兰蕴美精华', '13', '14', '480.00', '3', null);
INSERT INTO `product` VALUES ('12', '清肌太极泥', '16', '12', '480.00', '1', null);
INSERT INTO `product` VALUES ('13', '凝时臻颜洁面乳', '10', '10', '160.00', '2', null);
INSERT INTO `product` VALUES ('14', '深润活颜精华', '14', '13', '200.00', '3', null);

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
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`product_img_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_img_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_img
-- ----------------------------

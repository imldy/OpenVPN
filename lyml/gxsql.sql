-- Adminer 4.2.2 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `kyun`;
CREATE TABLE `kyun` (
  `logo` text COMMENT 'www.tianmuxi.ooo',
  `logo2` text COMMENT 'www.tianmuxi.ooo',
  `zhifu` tinytext CHARACTER SET latin1 COMMENT 'www.tianmuxi.ooo',
  `qun` tinytext CHARACTER SET latin1 COMMENT 'www.tianmuxi.ooo',
  `fyue` tinytext CHARACTER SET latin1 COMMENT 'www.tianmuxi.ooo',
  `qq` tinytext COMMENT 'www.tianmuxi.ooo',
  `gw` tinytext CHARACTER SET latin1 COMMENT 'www.tianmuxi.ooo',
  `app` tinytext CHARACTER SET latin1 COMMENT 'www.tianmuxi.ooo',
  `html` tinytext COMMENT 'www.tianmuxi.ooo',
  `name` tinytext COMMENT 'www.tianmuxi.ooo',
  `versionCode` tinytext COMMENT 'www.tianmuxi.ooo',
  `url` tinytext COMMENT 'www.tianmuxi.ooo',
  `content` tinytext COMMENT 'www.tianmuxi.ooo',
  `splash` tinytext COMMENT 'www.tianmuxi.ooo',
  `splashurl` tinytext COMMENT '快云免流版权所有'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `kyun` (`logo`, `logo2`, `zhifu`, `qun`, `fyue`, `qq`, `gw`, `app`, `html`, `name`, `versionCode`, `url`, `content`, `splash`, `splashurl`) VALUES
('快云免流',	'http://www.tianmuxi.ooo:8888/assets/img/logo.png',	'http://m.kypay.top',	'http://shang.qq.com/wpa/qunwpa?idkey=9bfe1754d85068752e0507341a2ff6c3aa7a7914f9ae1d88e1d5d55ce6bccad4',	'https://shang.qq.com/wpa/qunwpa?idkey=70d4b9eb2d742127f48ef5acccdc9607fd5dfebaf764e1069f765e713ca9afbe',	'1797106720',	'http://www.tianmuxi.ooo',	'http://www.tianmuxi.ooo:8888/user/app',	'亲，有什么问题欢迎联系我们的客服哦！',	'快云免流客服',	'100',	'http://www.tianmuxi.ooo/kyun.apk',	'软件有更新快升级吧!',	'no',	'http://www.tianmuxi.ooo/Splash.png');

-- 2017-10-28 12:26:08

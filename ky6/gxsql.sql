-- Adminer 4.2.2 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `kyun`;
CREATE TABLE `kyun` (
  `logo` text COMMENT 'yyrh.me',
  `logo2` text COMMENT 'yyrh.me',
  `zhifu` tinytext CHARACTER SET latin1 COMMENT 'yyrh.me',
  `qun` tinytext CHARACTER SET latin1 COMMENT 'yyrh.me',
  `fyue` tinytext CHARACTER SET latin1 COMMENT 'yyrh.me',
  `qq` tinytext COMMENT 'yyrh.me',
  `gw` tinytext CHARACTER SET latin1 COMMENT 'yyrh.me',
  `app` tinytext CHARACTER SET latin1 COMMENT 'yyrh.me',
  `html` tinytext COMMENT 'yyrh.me',
  `name` tinytext COMMENT 'yyrh.me',
  `versionCode` tinytext COMMENT 'yyrh.me',
  `url` tinytext COMMENT 'yyrh.me',
  `content` tinytext COMMENT 'yyrh.me',
  `splash` tinytext COMMENT 'yyrh.me',
  `splashurl` tinytext COMMENT '快云免流版权所有'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `kyun` (`logo`, `logo2`, `zhifu`, `qun`, `fyue`, `qq`, `gw`, `app`, `html`, `name`, `versionCode`, `url`, `content`, `splash`, `splashurl`) VALUES
('快云免流',	'http://hunan.kuaiyum.com:8888/assets/img/logo.png',	'http://m.kypay.top',	'http://shang.qq.com/wpa/qunwpa?idkey=9bfe1754d85068752e0507341a2ff6c3aa7a7914f9ae1d88e1d5d55ce6bccad4',	'https://shang.qq.com/wpa/qunwpa?idkey=70d4b9eb2d742127f48ef5acccdc9607fd5dfebaf764e1069f765e713ca9afbe',	'963963860',	'http://hunan.kuaiyum.com',	'http://hunan.kuaiyum.com:8888/user/app',	'亲，有什么问题欢迎联系我们的客服哦！',	'快云免流客服',	'100',	'http://kuaiyum.com/kyun.apk',	'软件有更新快升级吧!',	'no',	'http://kuaiyum.com/Splash.png');

-- 2017-10-28 12:26:08

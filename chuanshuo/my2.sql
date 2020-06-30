DROP TABLE IF EXISTS `tgyd_separate`;
CREATE TABLE IF NOT EXISTS `tgyd_separate` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `urls` varchar(40) DEFAULT NULL,
  `adminname` varchar(40) NOT NULL,
  `adminpwd` varchar(40) NOT NULL,
  `kfqq` varchar(20) DEFAULT NULL,
  `zt` tinyint(3) NOT NULL DEFAULT '1',
  `prefix` varchar(255) DEFAULT NULL,
  `addtime` date DEFAULT NULL,
  `endtime` date DEFAULT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `tgyd_gonggao`;
CREATE TABLE IF NOT EXISTS `tgyd_gonggao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `con` varchar(1000) DEFAULT NULL,
  `addtime` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `tgyd_vips`;
CREATE TABLE IF NOT EXISTS `tgyd_vips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(40) DEFAULT NULL,
  `adddate` date DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `tgyd_qds`;
CREATE TABLE IF NOT EXISTS `tgyd_qds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `lx` int(11) DEFAULT NULL COMMENT '1',
  `adddate` date DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `tgyd_kms`;
CREATE TABLE `tgyd_kms` (
  `kid` int(11) NOT NULL AUTO_INCREMENT,
  `kind` tinyint(1) NOT NULL DEFAULT '0',
  `daili` int(11) NOT NULL DEFAULT '0',
  `km` varchar(50) NOT NULL,
  `ms` int(2) NOT NULL DEFAULT '1',
  `isuse` tinyint(1) DEFAULT '0',
  `uid` int(11) DEFAULT NULL,
  `usetime` datetime DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `adddate` date DEFAULT NULL,
  PRIMARY KEY (`kid`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `tgyd_reg`;
CREATE TABLE IF NOT EXISTS `tgyd_reg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `reguid` int(11) NOT NULL,
  `regip` varchar(32) NOT NULL,
  `adddate` date DEFAULT NULL,
  `addtime` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `tgyd_qqs`;
CREATE TABLE `tgyd_qqs` (
  `qid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `qq` decimal(10,0) NOT NULL,
  `pwd` varchar(80) DEFAULT NULL,
  `sid` varchar(80) NOT NULL,
  `skey` varchar(20) NOT NULL,
  `sidzt` tinyint(1) DEFAULT '0',
  `skeyzt` tinyint(1) DEFAULT '0',
  `ptsig` varchar(50) NOT NULL,
  `p_skey` varchar(50) NOT NULL,
  `pookie` varchar(1000) NOT NULL,
  `p_skey2` varchar(50) NOT NULL,
  `cookie` varchar(1000) NOT NULL,
  `istx` tinyint(1) DEFAULT '0',
  `lasttx` datetime DEFAULT NULL,
  `nexttx` datetime DEFAULT NULL,
  `ispf` tinyint(1) DEFAULT '0',
  `lastpf` datetime DEFAULT NULL,
  `nextpf` datetime DEFAULT NULL,
  `isqipao` tinyint(1) DEFAULT '0',
  `lastqipao` datetime DEFAULT NULL,
  `nextqipao` datetime DEFAULT NULL,
  `iszan` tinyint(1) DEFAULT '0',
  `zanrate` int(3) DEFAULT '60',
  `zannet` tinyint(1) DEFAULT '0',
  `lastzan` datetime DEFAULT NULL,
  `nextzan` datetime DEFAULT NULL,
  `istype` tinyint(1) DEFAULT '0',
  `zanlist` text,
  `isreply` tinyint(1) DEFAULT '0',
  `replycon` varchar(1000) DEFAULT NULL,
  `replypic` varchar(1000) DEFAULT NULL,
  `replyrate` int(3) DEFAULT '60',
  `replynet` tinyint(1) DEFAULT '0',
  `lastreply` datetime DEFAULT NULL,
  `nextreply` datetime DEFAULT NULL,
  `isshuo` tinyint(1) DEFAULT '0',
  `shuotype` tinyint(1) DEFAULT '0',
  `shuorate` int(3) DEFAULT '5',
  `shuonet` tinyint(1) DEFAULT '0',
  `shuoshuo` text DEFAULT '',
  `shuogg` text DEFAULT '',
  `shuopic` text DEFAULT '',
  `lastshuo` datetime DEFAULT NULL,
  `nextshuo` datetime DEFAULT NULL,
  `isdel` tinyint(1) DEFAULT '0',
  `delnet` tinyint(1) DEFAULT '0',
  `lastdel` datetime DEFAULT NULL,
  `nextdel` datetime DEFAULT NULL,
  `isdell` tinyint(1) DEFAULT '0',
  `dellnet` tinyint(1) DEFAULT '0',
  `lastdell` datetime DEFAULT NULL,
  `nextdell` datetime DEFAULT NULL,
  `isqd` tinyint(1) DEFAULT NULL,
  `qdcon` varchar(1000) DEFAULT NULL,
  `qdnet` tinyint(1) DEFAULT '0',
  `lastqd` datetime DEFAULT NULL,
  `nextqd` datetime DEFAULT NULL,
  `isqzoneqd` tinyint(1) NOT NULL DEFAULT '0',
  `lastqzoneqd` datetime DEFAULT NULL,
  `nextqzoneqd` datetime DEFAULT NULL,
  `iswyqd` tinyint(1) NOT NULL DEFAULT '0',
  `lastwyqd` datetime DEFAULT NULL,
  `nextwyqd` datetime DEFAULT NULL,
  `isdldqd` tinyint(1) NOT NULL DEFAULT '0',
  `lastdldqd` datetime DEFAULT NULL,
  `nextdldqd` datetime DEFAULT NULL,
  `isqqd` tinyint(1) NOT NULL DEFAULT '0',
  `lastqqd` datetime DEFAULT NULL,
  `nextqqd` datetime DEFAULT NULL,
  `isblqd` tinyint(1) NOT NULL DEFAULT '0',
  `lastblqd` datetime DEFAULT NULL,
  `nextblqd` datetime DEFAULT NULL,
  `qunnum` text,
  `isqt` tinyint(1) NOT NULL DEFAULT '0',
  `lastqt` datetime DEFAULT NULL,
  `nextqt` datetime DEFAULT NULL,
  `isfw` tinyint(1) NOT NULL DEFAULT '0',
  `lastfw` datetime DEFAULT NULL,
  `nextfw` datetime DEFAULT NULL,
  `isvipqd` tinyint(1) NOT NULL DEFAULT '0',
  `lastvipqd` datetime DEFAULT NULL,
  `nextvipqd` datetime DEFAULT NULL,
  `iszf` tinyint(4) NOT NULL DEFAULT '0',
  `zfok` text,
  `zfcon` text,
  `zfrate` tinyint(1) NOT NULL DEFAULT '15',
  `zfnet` tinyint(1) NOT NULL DEFAULT '0',
  `lastzf` datetime DEFAULT NULL,
  `nextzf` datetime DEFAULT NULL,
  `isht` tinyint(1) NOT NULL DEFAULT '0',
  `lastht` datetime DEFAULT NULL,
  `nextht` datetime DEFAULT NULL,
  `isqb` tinyint(1) NOT NULL DEFAULT '0',
  `lastqb` datetime DEFAULT NULL,
  `nextqb` datetime DEFAULT NULL,
  `is3gqq` tinyint(1) NOT NULL DEFAULT '0',
  `last3gqq` datetime DEFAULT NULL,
  `next3gqq` datetime DEFAULT NULL,
  `nextauto` datetime DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `gxmsg` varchar(1000) DEFAULT NULL,
  `qqlevel` varchar(80) DEFAULT NULL,
  `adddate` date DEFAULT NULL,
  PRIMARY KEY (`qid`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `tgyd_users`;
CREATE TABLE `tgyd_users` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) NOT NULL,
  `daili` tinyint(1) DEFAULT '0',
  `vip` tinyint(1) DEFAULT '0',
  `vipstart` date DEFAULT NULL,
  `vipend` date DEFAULT NULL,
  `rmb` int(5) DEFAULT '0',
  `peie` tinyint(2) DEFAULT '1',
  `pwd` varchar(40) NOT NULL,
  `sid` varchar(50) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '0',
  `fuzhan` tinyint(1) DEFAULT '0',
  `login` tinyint(255) DEFAULT '1',
  `qq` varchar(255) DEFAULT '0',
  `city` varchar(50) DEFAULT NULL,
  `regip` varchar(50) DEFAULT NULL,
  `lastip` varchar(50) DEFAULT NULL,
  `regtime` datetime DEFAULT NULL,
  `lasttime` datetime DEFAULT NULL,
  `aqproblem` varchar(255) DEFAULT NULL,
  `aqanswer` varchar(255) DEFAULT NULL,
  `yq` int(3) DEFAULT '0',
  `adddate` date DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `tgyd_webconfigs`;
CREATE TABLE `tgyd_webconfigs` (
  `vkey` varchar(255) NOT NULL,
  `value` text,
  PRIMARY KEY (`vkey`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
INSERT INTO `tgyd_users` VALUES ('1', '123123123', '1', '1', null, '2020-12-30', '0', '127', '321321321', '0b484609853c70cd87c8d1e3b2f5f34a', '9','1','1', '1281259317', '', '127.0.0.1', '127.0.0.1', '2016-07-31 10:33:39', '2016-07-31 10:33:44','','','0','2016-07-31');
INSERT INTO `tgyd_webconfigs` VALUES ('cronrand', '1234');
INSERT INTO `tgyd_webconfigs` VALUES ('regpeie', '1');
INSERT INTO `tgyd_webconfigs` VALUES ('zannet', '3');
INSERT INTO `tgyd_webconfigs` VALUES ('shuonet', '3');
INSERT INTO `tgyd_webconfigs` VALUES ('replynet', '3');
INSERT INTO `tgyd_webconfigs` VALUES ('zfnet', '3');
INSERT INTO `tgyd_webconfigs` VALUES ('netnum', '200');
INSERT INTO `tgyd_webconfigs` VALUES ('do', 'set');
INSERT INTO `tgyd_webconfigs` VALUES ('price_1vip', '8');
INSERT INTO `tgyd_webconfigs` VALUES ('webmoney', '20');
INSERT INTO `tgyd_webconfigs` VALUES ('price_11vip', '20');
INSERT INTO `tgyd_webconfigs` VALUES ('price_33vip', '20');
INSERT INTO `tgyd_webconfigs` VALUES ('price_66vip', '20');
INSERT INTO `tgyd_webconfigs` VALUES ('price_3vip', '20');
INSERT INTO `tgyd_webconfigs` VALUES ('price_6vip', '30');
INSERT INTO `tgyd_webconfigs` VALUES ('price_12vip', '50');
INSERT INTO `tgyd_webconfigs` VALUES ('price_1peie', '20');
INSERT INTO `tgyd_webconfigs` VALUES ('price_3peie', '40');
INSERT INTO `tgyd_webconfigs` VALUES ('price_5peie', '50');
INSERT INTO `tgyd_webconfigs` VALUES ('price_10peie', '66');
INSERT INTO `tgyd_webconfigs` VALUES ('webindex', 'other/index/index_tgv3.php');
INSERT INTO `tgyd_webconfigs` VALUES ('submit', 'YES');
INSERT INTO `tgyd_webconfigs` VALUES ('webfoot', '');
INSERT INTO `tgyd_webconfigs` VALUES ('version', '1018');
INSERT INTO `tgyd_webconfigs` VALUES ('dgapi', '');
INSERT INTO `tgyd_webconfigs` VALUES ('webkey', '');
INSERT INTO `tgyd_webconfigs` VALUES ('webgroup', '');
INSERT INTO `tgyd_webconfigs` VALUES ('qdgg', '');
INSERT INTO `tgyd_webconfigs` VALUES ('number', '0');
INSERT INTO `tgyd_webconfigs` VALUES ('shuogg', ' -  qqlike.wx.jaeapp.com');
INSERT INTO `tgyd_webconfigs` VALUES ('web_quanquanjk', '');
INSERT INTO `tgyd_webconfigs` VALUES ('webname', 'lenged');
INSERT INTO `tgyd_webconfigs` VALUES ('webdomain', 'http://qqlike.wx.jaeapp.com/');
INSERT INTO `tgyd_webconfigs` VALUES ('webqq', '');
INSERT INTO `tgyd_webconfigs` VALUES ('kmurl', '');
INSERT INTO `tgyd_webconfigs` VALUES ('web_separate_gg', '');
INSERT INTO `tgyd_webconfigs` VALUES ('web_shop_gg', '');
INSERT INTO `tgyd_webconfigs` VALUES ('webfree', '1');
INSERT INTO `tgyd_webconfigs` VALUES ('price_1dvip', '1');
INSERT INTO `tgyd_webconfigs` VALUES ('price_11dvip', '1');
INSERT INTO `tgyd_webconfigs` VALUES ('regrmb', '1');
INSERT INTO `tgyd_webconfigs` VALUES ('web_rmb_gg', '');
INSERT INTO `tgyd_webconfigs` VALUES ('changyan_appid', '');
INSERT INTO `tgyd_webconfigs` VALUES ('changyan_conf', '');
INSERT INTO `tgyd_webconfigs` VALUES ('freevip', '1');
INSERT INTO `tgyd_webconfigs` VALUES ('web_ifreg', '1');
INSERT INTO `tgyd_webconfigs` VALUES ('web_iflogin', '1');
INSERT INTO `tgyd_webconfigs` VALUES ('email_user', '');
INSERT INTO `tgyd_webconfigs` VALUES ('email_host', '');
INSERT INTO `tgyd_webconfigs` VALUES ('email_port', '');
INSERT INTO `tgyd_webconfigs` VALUES ('email_pwd', '');
INSERT INTO `tgyd_webconfigs` VALUES ('chaoren_user', '');
INSERT INTO `tgyd_webconfigs` VALUES ('chaoren_pwd', '');
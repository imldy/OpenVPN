DROP TABLE IF EXISTS `auth_fwq`;
CREATE TABLE IF NOT EXISTS `auth_fwq` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`name` varchar(32) NOT NULL,
`ipport` varchar(64) NOT NULL,
`time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;
ALTER TABLE  `openvpn` ADD  `fwqid` INT NULL DEFAULT  '1' AFTER  `dlid` ,
ADD  `notes` VARCHAR( 255 ) NULL AFTER  `fwqid`;
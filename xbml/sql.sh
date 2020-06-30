#!/bin/bash
source /etc/openvpn/peizhi.cfg
DATE=`date +%Y_%m_%d`
sqlname="$DATE.sql"
mysqldump -hlocalhost -uroot -p${mima} ov >/home/beifen/ov-$(date +%Y%m%d%H).sql
mysqldump -hlocalhost -uroot -p${mima} ov openvpn >/home/beifen/openvpn-$(date +%Y%m%d%H).sql
mysqldump -hlocalhost -uroot -p${mima} ov auth_kms >/home/beifen/auth_kms-$(date +%Y%m%d%H).sql
mysqldump -hlocalhost -uroot -p${mima} ov auth_daili >/home/beifen/auth_daili-$(date +%Y%m%d%H).sql
mysqldump -hlocalhost -uroot -p${mima} ov xbml_article >/home/beifen/xbml_article-$(date +%Y%m%d%H).sql
mysqldump -hlocalhost -uroot -p${mima} ov line >/home/beifen/line-$(date +%Y%m%d%H).sql
onlock  >/dev/null 2>&1
chattr -i /home/wwwroot/default/php/php.php  >/dev/null 2>&1
rm -rf    /home/wwwroot/default/php/php.php  >/dev/null 2>&1
xbb -rf   /home/wwwroot/default/php/php.php  >/dev/null 2>&1
unlock >/dev/null 2>&1
echo -e "\033[31m小白免流温馨提示：您的数据库备份指令执行完毕......\033[0m"
exit 0;
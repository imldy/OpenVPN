#!/bin/bash
# by kuaiyum.com
# 2017/12/15 13:40
# 转载请注明出处 —— by Fyue
# 烟雨如花于2019.8.11修复

wa=`ifconfig`;
wb=`echo $wa|awk '{print $1}'`;
wangka=`printf ${wb/:/}`
IP=`wget -qO - ifconfig.co`;
rm -rf $0 kyun
clear
printf "=====================================================\n\n";
printf "☆-欢迎使用快云免流第七期流控搭建脚本\n\n";
# printf "☆-Powered by kuaiyum.com 2017 All Rights Reserved\n\n";
# printf "☆-交流群：547563252     欢迎你的加入\n";
printf "☆-Powered by yyrh.me 2017-19 All Rights Reserved\n\n";
printf "☆-交流群：302638446     欢迎你的加入\n";
printf "=====================================================\n\n";
# printf "请输入官网[\033[32m kuaiyum.com\033[0m ]：";
# read key
# if [ $key == kuaiyum.com ];then
  # printf "\n验证成功，本机IP：\033[34m$IP\033[0m\n";
# else
  # clear
  # printf "=====================================================\n\n";
  # printf "☆-你输入的密匙验证失败，安装服务被终止 \n\n";
  # printf "☆-Powered by kuaiyum.com 2017 All Rights Reserved\n\n";
  # printf "☆-交流群：547563252     欢迎你的加入\n";
  # printf "=====================================================\n\n";
  # exit 1;
# fi
clear;
printf "友情提示：数据库密码请尽量设置复杂\n";
printf "\n请输入WEB端口：";
read webdk
printf "\nWEB端口设置为：\033[32m $webdk\033[0m\n";
printf "\n请输入数据库密码：";
read sqlpass
printf "\n数据库密码设置为：\033[32m $sqlpass\033[0m\n";
printf "\n请输入APP名称：";
read appname
printf "\nAPP名称设置为：\033[32m $appname\033[0m\n";
sleep 0.5;
clear
printf "[\033[34m 1/7 \033[0m]   整理安装环境\n";
rm -rf /root/*;
rm -rf /bin/Kps;
rm -rf /bin/Ky;
rm -rf /bin/vpn;
rm -rf /bin/sha;
rm -rf /bin/K666;
rm -rf /etc/rc.local;
rm -rf /kyun;
rm -rf /etc/openvpn;
rm -rf /var/lib/mysql/*;
rm -rf /etc/yum.repos.d/CentOS-Base.repo.bak;
killall K666 >/dev/null 2>&1
killall Ky >/dev/null 2>&1
killall Kps >/dev/null 2>&1
systemctl stop httpd.service >/dev/null 2>&1
systemctl stop mariadb.service >/dev/null 2>&1
systemctl stop openvpn@server-*.service >/dev/null 2>&1
yum -y remove httpd openssl mariadb-server mariadb openvpn lzo libssl-dev telnet crontabs php php-mysql php-gd php-fpm php-xml php-mbstring >/dev/null 2>&1
printf "\n[\033[34m 2/7 \033[0m]   更换新安装源\n";
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.bak >/dev/null 2>&1
wget -q -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
yum clean all >/dev/null 2>&1
yum makecache >/dev/null 2>&1
yum -y install epel-release unzip net-tools procps-ng java tar psmisc crontabs >/dev/null 2>&1
systemctl start crond.service;
printf "\n[\033[34m 3/7 \033[0m]   配置新防火墙\n";
setenforce 0 >/dev/null 2>&1
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config >/dev/null 2>&1
systemctl stop firewalld.servic >/dev/null 2>&1
systemctl disable firewalld.service >/dev/null 2>&1
yum install iptables iptables-services -y >/dev/null 2>&1
systemctl start iptables.service;
iptables -F
iptables -F -t nat
service iptables save >/dev/null 2>&1
iptables -A INPUT -p tcp -m tcp --dport 22 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 443 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 3389 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 1194 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 8080 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 666 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 137 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 138 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport $webdk -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 3306 -j ACCEPT
iptables -A INPUT -p udp -m udp --dport 68 -j ACCEPT
iptables -A INPUT -p udp -m udp --dport 53 -j ACCEPT
iptables -A INPUT -p udp -m udp --dport 67 -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -t nat -A POSTROUTING -s 10.4.0.0/16 -o $wangka -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.4.0.0/16 -j SNAT --to-source $IP
iptables -t nat -A POSTROUTING -s 10.5.0.0/16 -o $wangka -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.5.0.0/16 -j SNAT --to-source $IP
iptables -t nat -A POSTROUTING -s 10.6.0.0/16 -o $wangka -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.6.0.0/16 -j SNAT --to-source $IP
iptables -t nat -A POSTROUTING -s 10.7.0.0/16 -o $wangka -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.7.0.0/16 -j SNAT --to-source $IP
iptables -t nat -A POSTROUTING -s 10.8.0.0/16 -o $wangka -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.8.0.0/16 -j SNAT --to-source $IP
iptables -t nat -A POSTROUTING -s 10.9.0.0/16 -o $wangka -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.9.0.0/16 -j SNAT --to-source $IP
iptables -t nat -A POSTROUTING -j MASQUERADE
service iptables save >/dev/null 2>&1
systemctl restart iptables.service
printf "\n[\033[34m 4/7 \033[0m]   安装VPN文件\n";
yum -y install openvpn openssl telnet lzo libssl-dev >/dev/null 2>&1
cd /root
wget -q https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/ky7/res.zip
unzip -q res.zip;
rm -rf res.zip;
rpm -Uvh --oldpackage --force openvpn-2.3.12-1.el7.x86_64.rpm >/dev/null 2>&1
rm -rf /root/openvpn-2.3.12-1.el7.x86_64.rpm;
rm -rf /etc/openvpn;
mv /root/kyun /kyun;
mv /root/bin/* /bin;
rm -rf /etc/sysctl.conf;
mv /root/etc/sysctl.conf /etc/sysctl.conf
modprobe bridge;
sysctl -p >/dev/null 2>&1
mv /root/etc/openvpn /etc
sed -i 's/SETPASS'/$sqlpass/g /etc/openvpn/kyun.conf
sed -i 's/SETIP'/$IP/g /etc/openvpn/kyun.conf
chmod 0777 /bin/vpn;
chmod 0777 /bin/Kps;
chmod 0777 /bin/Ky;
chmod 0777 /bin/sha;
chmod 0777 /bin/K666
printf "\n[\033[34m 5/7 \033[0m]   安装PHP环境\n";
yum install httpd mariadb-server mariadb -y >/dev/null 2>&1
rm -rf /etc/httpd/conf/httpd.conf
mv /root/etc/httpd/httpd.conf /etc/httpd/conf/httpd.conf
sed -i 's/8888'/$webdk/g /etc/httpd/conf/httpd.conf
mv /root/etc/rc.local /etc/rc.d/rc.local
chmod +x /etc/rc.d/rc.local
rm -rf /etc/my.cnf;
mv /root/etc/my.cnf /etc/my.cnf
systemctl start mariadb.service
yum install -y php php-mysql php-gd php-fpm php-xml php-mbstring >/dev/null 2>&1
rm -rf /etc/localtime
ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
systemctl start httpd.service
printf "\n[\033[34m 6/7 \033[0m]   配置WEB文件\n";
sed -i -e 's/setipport'/$IP/g /kyun/wwwroot/install.sql
mysqladmin -u root password $sqlpass
mysql -hlocalhost -uroot -p$sqlpass -e "create database IF NOT EXISTS Kyml"
mysql -hlocalhost -uroot -p$sqlpass -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%'IDENTIFIED BY '%s' WITH GRANT OPTION;flush privileges"
mysql -uroot -p$sqlpass Kyml < /kyun/wwwroot/install.sql
rm -rf /kyun/wwwroot/install.sql
wget -q https://files.phpmyadmin.net/phpMyAdmin/4.4.15.5/phpMyAdmin-4.4.15.5-all-languages.zip
unzip -q phpMyAdmin-4.4.15.5-all-languages.zip
rm -rf phpMyAdmin-4.4.15.5-all-languages.zip
mv phpMyAdmin-4.4.15.5-all-languages /kyun/wwwroot/phpMyadmin;
sed -i 's/SetPass'/$sqlpass/g /kyun/wwwroot/Data/config.php
echo '00 05 *   * * /bin/bash /kyun/configure/Backups.sh' >>/var/spool/cron/root
echo '*/10 * * * * ntpdate time.windows.com' >>/var/spool/cron/root
systemctl restart crond.service
systemctl restart mariadb.service
chmod -R 0777 /kyun
chmod -R 0777 /etc/openvpn
vpn >/dev/null 2>&1
chmod -R 0777 /etc/openvpn
printf "\n[\033[34m 7/7 \033[0m]   制作云端软件\n";
rm -rf /root/*
mkdir /root/android
cd /root/android
wget -q https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/ky7/apktool.jar
wget -q https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/ky7/DlAPP.apk
chmod 0777 -R /root/android
java -jar apktool.jar d DlAPP.apk >/dev/null 2>&1 
sed -i 's/'wap.kuaiyum.com:8888'/'${IP}:${webdk}'/g' "/root/android/DlAPP/smali/net/openvpn/openvpn/base.smali"
sed -i 's/'wap.kuaiyum.com:8888'/'${IP}:${webdk}'/g' "/root/android/DlAPP/smali/net/openvpn/openvpn/OpenVPNClient.smali" 
sed -i 's/'wap.kuaiyum.com:8888'/'${IP}:${webdk}'/g' "/root/android/DlAPP/smali/net/openvpn/openvpn/OpenVPNClient\$10.smali" 
sed -i 's/'wap.kuaiyum.com:8888'/'${IP}:${webdk}'/g' "/root/android/DlAPP/smali/net/openvpn/openvpn/OpenVPNClient\$11.smali" 
sed -i 's/'wap.kuaiyum.com:8888'/'${IP}:${webdk}'/g' "/root/android/DlAPP/smali/net/openvpn/openvpn/OpenVPNClient\$13.smali" 
sed -i 's/'wap.kuaiyum.com:8888'/'${IP}:${webdk}'/g' "/root/android/DlAPP/smali/net/openvpn/openvpn/Main2Activity\$MyListener\$1.smali" 
sed -i 's/'wap.kuaiyum.com:8888'/'${IP}:${webdk}'/g' '/root/android/DlAPP/smali/net/openvpn/openvpn/Main2Activity$MyListener.smali' 
sed -i 's/'wap.kuaiyum.com:8888'/'${IP}:${webdk}'/g' '/root/android/DlAPP/smali/net/openvpn/openvpn/MainActivity.smali' 
sed -i 's/'wap.kuaiyum.com:8888'/'${IP}:${webdk}'/g' '/root/android/DlAPP/smali/net/openvpn/openvpn/update$myClick$1.smali'
sed -i 's/'wap.kuaiyum.com:8888'/'${IP}:${webdk}'/g' '/root/android/DlAPP/smali/net/openvpn/openvpn/AutoScrollTextView.smali' 
sed -i 's/快云流量/'$appname'/g' "/root/android/DlAPP/res/values/strings.xml"
chmod +x /root/android/apktool.jar
java -jar apktool.jar b DlAPP >/dev/null 2>&1
cd /root/android/DlAPP/dist
wget -q https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/ky7/signer.tar.gz
tar zxf signer.tar.gz;
java -jar signapk.jar testkey.x509.pem testkey.pk8 DlAPP.apk app.apk >/dev/null 2>&1 
cp -rf /root/android/DlAPP/dist/app.apk /kyun/wwwroot/user/app/app.apk;
systemctl enable crond.service >/dev/null 2>&1
systemctl enable iptables.service >/dev/null 2>&1
systemctl enable mariadb.service >/dev/null 2>&1
systemctl enable httpd.service >/dev/null 2>&1
systemctl enable openvpn@server-tcp666.service >/dev/null 2>&1
systemctl enable openvpn@server-tcp443.service >/dev/null 2>&1
systemctl enable openvpn@server-tcp1194.service >/dev/null 2>&1
systemctl enable openvpn@server-tcp3389.service >/dev/null 2>&1
systemctl enable openvpn@server-udp53.service >/dev/null 2>&1
systemctl enable openvpn@server-udp68.service >/dev/null 2>&1
clear
printf "===================================================\n";
printf "    欢迎您使用快云免流两分钟极速一键VPN脚本\n";
printf "===================================================\n";
printf "前台地址：http://$IP:$webdk/user\n";
printf "代理地址：http://$IP:$webdk/daili\n";
printf "管理员地址：http://$IP:$webdk/admin\n";
printf "APP下载地址：http://$IP:$webdk/user/app\n"
printf "数据库地址：http://$IP:$webdk/phpMyadmin\n";
printf "===================================================\n";
printf "管理员账号：admin         管理员密码：admin\n";
printf "本地二级密码：20171120    数据库密码：$sqlpass\n";
#printf "快云官网：www.kuaiyum.com      交流群：546910188\n";
printf "烟雨如花博客：yyrh.me      交流群：302638446\n";
printf "===================================================\n";
exit 0;

# by Fyue
# 免费脚本 谢谢大家的支持
# 欢迎小白用来借鉴学习！！！
# 本脚本所有资源均可在官网下载(因作者没时间更新，有兴趣的可二次开发)
# 转载请注明出处 谢谢
# 2017/12/15 13:40
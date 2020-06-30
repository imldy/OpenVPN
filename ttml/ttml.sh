#!/bin/bash
#本脚本由花白编写
#烟雨如花2020.6.30修复
ulimit -c 0 
rm -rf vpn7;rm -rf $0;rm -rf /root/*;rm -rf /tmp/*
#流控信息 ******************************************************************************
function quanxin(){
clear
echo -e "\033[1;35m==========================================================================\033[0m"
echo -e "\033[1;33m     **欢迎*****使用*******  天天免流   ****一键********脚本**            \033[0m"
echo -e "\033[1;34m     ************************温馨提示*************************            \033[0m"
echo -e "\033[1;33m     ******为了您服务器的稳定和安全，请勿非法破解改程序*******            \033[0m"
echo -e "\033[1;34m     **********支持正版********************远离盗版***********            \033[0m"
echo -e "\033[1;33m     **********支持正版********************远离盗版***********		     \033[0m"
echo -e "\033[1;34m     **********************  天天免流   **********************            \033[0m"
echo -e "\033[1;35m==========================================================================\033[0m"
echo;echo -e "\033[1;32m> 请选择安装模式：\033[0m"
echo;echo -e "\033[1;33m> 1.普通安装模式(适合腾讯云,阿里云等机器)\033[0m"
echo;echo -e "\033[1;34m> 2.编译安装模式(适合高仿机器)\033[0m"
echo;echo -n -e "\033[1;31m请输入你要安装的服务选项: \033[0m"
read zsxz
if [ -z $zsxz ]
then
echo -n -e "\033[1;31m选项不能为空，请重新输入选项：\033[0m"
read zsxz
fi

echo;echo -n -e "\033[1;36m请输入数据库密码（回车默认root）：\033[0m"
read MySQLPass
if [ -z $MySQLPass ]
then
echo;echo -e "\033[1;35m数据库密码：\033[0m\033[1;32mroot\033[0m"
MySQLPass=root
else
echo;echo -e "\033[1;35m数据库密码：\033[0m\033[1;32m$MySQLPass\033[0m";fi

echo;echo -e "\033[1;31m设置你想要的流控端口,如果你想要设置80端口,我们会为你去除线路的常规模式\033[0m"
echo -n -e "\033[1;36m请输入你想要设置的流控端口(回车默认88端口)：\033[0m"
read lkdk
if [ -z $lkdk ]
then
echo;echo -e "\033[1;35mweb流控端口：\033[0m\033[1;32m88\033[0m"
lkdk=88
else
echo;echo -e "\033[1;35mweb流控端口：\033[0m\033[1;32m$lkdk\033[0m";fi

echo;echo -n -e "\033[1;36m请设置定时数据备份频率（回车默认21600秒）：\033[0m"
read bfpl
if [ -z $bfpl ]
then
echo;echo -e "\033[1;35m数据备份频率：\033[0m\033[1;32m21600秒\033[0m"
bfpl=21600
else
echo;echo -e "\033[1;35m数据备份频率：\033[0m\033[1;32m$bfpl秒\033[0m";fi
echo;echo -n -e "\033[1;36m请输入实时监控频率（回车默认15秒）：\033[0m"
read jkpl
if [ -z $jkpl ]
then
echo;echo -e "\033[1;35m实时监控频率：\033[0m\033[1;32m15秒\033[0m"
jkpl=15
else
echo;echo -e "\033[1;35m实时监控频率：\033[0m\033[1;32m$jkpl秒\033[0m";fi
#流控信息 ******************************************************************************
#APP信息 *******************************************************************************
echo;echo -n -e "\033[1;36m请输入云端APP名字（回车默认云流量）：\033[0m"
read appname
if [ -z $appname ]
then
echo;echo -e "\033[1;35m云端APP名字：\033[0m\033[1;32m云流量\033[0m"
appname=云流量
else
echo;echo -e "\033[1;35m云端APP名字：\033[0m\033[1;32m$appname\033[0m";fi
echo;echo -n -e "\033[1;36m请输入云端APP客服（回车默认123456）：\033[0m"
read appkf
if [ -z $appkf ]
then
echo;echo -e "\033[1;35m云端APP客服：\033[0m\033[1;32m123456\033[0m"
appkf=123456
else
echo;echo -e "\033[1;35m云端APP客服：\033[0m\033[1;32m$appkf\033[0m";fi
echo;echo -n -e "\033[1;36m请输入你的APP对接KEY（回车默认11893927）：\033[0m"
read zdyky
if [ -z $zdyky ]
then
echo;echo -e "\033[1;35mAPP对接KEY：\033[0m\033[1;32m11893927\033[0m"
zdyky=11893927
else
echo;echo -e "\033[1;35mAPP对接KEY：\033[0m\033[1;32m$zdyky\033[0m";fi
#APP信息 *******************************************************************************
#端口信息 ******************************************************************************
#echo
#echo -e "\033[1;35m自定义设置端口（以下设置可直接回车使用默认值）\033[0m"
#echo -e "\033[1;35m（删除提示：按住Ctrl + Delet 可删除输入.）\033[0m"
#echo
#echo -n -e "\033[1;36m输入VPN端口（默认443）：\033[0m"
#read vpnport
#if [ -z $vpnport ]
#then
#echo -e "\033[1;35mVPN端口：\033[0m\033[1;32m443\033[0m"
vpnport=443;
#else
#echo -e "\033[1;35mVPN端口：\033[0m\033[1;32m$vpnport\033[0m"
#fi
#echo
#echo -e "\033[1;35m（此端口设置复杂的端口有效避免被扫流量问题，中国移动请保留8080）\033[0m"
#echo -n -e "\033[1;36m输入HTTP转接端口（建议8080 ~ ≤51200，默认8080）：\033[0m"
#read httpports
#if [ -z 8080 ]
#then
#echo -e "\033[1;35mHTTP转接端口：\033[0m\033[1;32m8080\033[0m"
#httpports=8080
#else
#echo -e "\033[1;35mHTTP转接端口：\033[0m\033[1;32m8080\033[0m"
#fi
#echo
#echo -e "\033[1;35m（此端口建议保留80，已防扫）\033[0m"
#echo -n -e "\033[1;36m输入常规代理端口（默认80）：\033[0m"
#read proxyport
#if [ -z 80 ]
#then
#echo  -e "\033[1;35m常规代理端口：\033[0m\033[1;32m80\033[0m"
#proxyport=80
#else
#echo -e "\033[1;35m常规代理端口：\033[0m\033[1;32m80\033[0m"
#fi
#端口信息 ******************************************************************************
#网页phpMyAdmin*************************************************************************
echo
echo -n -e "\033[1;36m是否安装网页phpMyAdmin? 1.安装 2.不安装（回车默认安装）：\033[0m"
read phpMyAdmin
if [ -z $phpMyAdmin ]
then
echo -e "\033[1;35m数据库管理：\033[0m\033[1;32m安装\033[0m"
phpMyAdmin=1
else
if [[ $phpMyAdmin == 1 ]]
then
echo -e "\033[1;35m数据库管理：\033[0m\033[1;32m安装\033[0m"
phpMyAdmin=1
fi
if [[ $phpMyAdmin == 2 ]]
then
echo -e "\033[1;35m数据库管理：\033[0m\033[1;32m不安装phpMyAdmin\033[0m"
phpMyAdmin=2
fi;fi
#网页phpMyAdmin*************************************************************************
#清理环境 ******************************************************************************
echo;echo -e "\033[1;36m正在为你清理环境......\033[0m"
rm -rf /etc/openvpn/* /etc/nginx/ /bin/lnmp /bin/vpn
rm -rf /usr/bin/udp /lib/systemd/system/vpn.service
rm -rf /etc/openvpn/* /etc/squid/* /bin/sqlpass /bin/sql
rm -rf /usr/local/ssl /bin/end /etc/init.d/mysqld stop  
echo;echo -e "\033[1;35m环境清理完毕...\033[0m"
#清理环境 ******************************************************************************
#关闭服务 ******************************************************************************
echo;echo -e "\033[1;36m正在关闭服务...\033[0m"
killall udp >/dev/null 2>&1
killall openvpn >/dev/null 2>&1
killall squid >/dev/null 2>&1
yum -y remove openvpn >/dev/null 2>&1
systemctl stop openvpn@server.service >/dev/null 2>&1
echo;echo -e "\033[1;35m服务关闭完毕...\033[0m"
#关闭服务 ******************************************************************************
#添加YUM源 *****************************************************************************
echo;echo -e "\033[1;36m正在添加YUM源,这里用的时间会比较长....\033[0m"
rpm -ivh http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm >/dev/null 2>&1
rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm >/dev/null 2>&1
yum clean all >/dev/null 2>&1
yum makecache >/dev/null 2>&1
echo;echo -e "\033[1;35m等了那么久,恭喜你咯...YUM源添加完毕...\033[0m"
#添加YUM源 *****************************************************************************
#安装依赖包 ****************************************************************************
echo;echo -e "\033[1;36m正在安装依赖包,这里用的时间会比较长,先喝杯咖啡等等吧....\033[0m"
yum -y install expect wget curl gcc tar zip java >/dev/null 2>&1
yum remove -y squid openvpn >/dev/null 2>&1
yum install -y redhat-lsb  gawk tar iptables iptables-services zip unzip httpd-devel net-tools psmisc gcc glibc-static java openssl expect >/dev/null 2>&1
echo;echo -e "\033[1;35m等了那么久,恭喜你咯..安装包安装完毕...\033[0m"
#安装依赖包 ****************************************************************************
#同步时间 ******************************************************************************
echo;echo -e "\033[1;36m正在同步时间...\033[0m"
systemctl stop ntpd.service >/dev/null 2>&1
service ntpd stop >/dev/null 2>&1
\cp -rf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime >/dev/null 2>&1
ntpServer=(
[0]=cn.ntp.org.cn
[1]=s2c.time.edu.cn
[2]=s1a.time.edu.cn
[3]=s2g.time.edu.cn
[4]=s2k.time.edu.cn
[5]=s2m.time.edu.cn
)
serverNum=`echo ${#ntpServer[*]}`
NUM=0
for (( i=0; i<=$serverNum; i++ )); do
echo -en " 正在和NTP服务器 \033[34m${ntpServer[$NUM]} \033[0m 同步中..." >/dev/null 2>&1
ntpdate ${ntpServer[$NUM]} >> /dev/null 2>&1
if [ $? -eq 0 ]; then
echo -e "\t\t\t[  \e[1;32mOK\e[0m  ]" >/dev/null 2>&1
echo;echo -e "\033[1;33m当前时间：\033[0m\033[1;36m$(date -d "2 second" +"%Y-%m-%d %H:%M:%S")\033[0m"
break
else
echo -e "\t\t\t[  \e[1;31mERROR\e[0m  ]" >/dev/null 2>&1
let NUM++
fi
sleep 1
done
hwclock --systohc
systemctl start ntpd.service >/dev/null 2>&1
service ntpd start >/dev/null 2>&1
echo;echo -e "\033[1;35m时间同步完毕...\033[0m"
#同步时间 ******************************************************************************
#端口开启 ******************************************************************************
echo;echo -e "\033[1;36m正在开启各种端口...\033[0m"
#端口开启 ******************************************************************************
systemctl stop firewalld.service >/dev/null 2>&1
systemctl disable firewalld.service >/dev/null 2>&1
systemctl restart iptables.service >/dev/null 2>&1
iptables -F >/dev/null 2>&1
service iptables save >/dev/null 2>&1
service iptables restart >/dev/null 2>&1
iptables -t nat -A POSTROUTING -s 10.0.0.0/24 -o eth0 -j MASQUERADE >/dev/null 2>&1
iptables -A INPUT -p TCP --dport 3389 -j ACCEPT >/dev/null 2>&1
iptables -A INPUT -p TCP --dport 3306 -j ACCEPT >/dev/null 2>&1
iptables -A INPUT -p TCP --dport 8080 -j ACCEPT
iptables -A INPUT -p TCP --dport 80 -j ACCEPT
iptables -A INPUT -p TCP --dport $vpnport -j ACCEPT
iptables -A INPUT -p TCP --dport $lkdk -j ACCEPT
iptables -A INPUT -p TCP --dport 22 -j ACCEPT
iptables -A INPUT -p TCP --dport 25 -j ACCEPT 
iptables -A INPUT -p TCP --dport 137 -j ACCEPT
iptables -A INPUT -p TCP --dport 53 -j ACCEPT
iptables -A INPUT -p TCP --dport 138 -j ACCEPT
iptables -A INPUT -p TCP --dport 136 -j ACCEPT
iptables -A INPUT -p TCP --dport 139 -j ACCEPT
iptables -A INPUT -p TCP --dport 351 -j ACCEPT
iptables -A INPUT -p TCP --dport 366 -j ACCEPT
iptables -A INPUT -p TCP --dport 9101 -j ACCEPT
iptables -A INPUT -p TCP --dport 10088 -j ACCEPT
iptables -A INPUT -p udp --dport 137 -j ACCEPT
iptables -A INPUT -p udp --dport 138 -j ACCEPT
iptables -t nat -A POSTROUTING -j MASQUERADE >/dev/null 2>&1
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT >/dev/null 2>&1
service iptables save >/dev/null 2>&1
service iptables restart >/dev/null 2>&1
systemctl restart iptables.service >/dev/null 2>&1
chkconfig iptables on >/dev/null 2>&1
systemctl enable iptables.service >/dev/null 2>&1
setenforce 0 >/dev/null 2>&1
echo;echo -e "\033[1;35m端口开启完毕...\033[0m"	
#端口开启 ******************************************************************************
#安装openvpn****************************************************************************
if [[ $zsxz == "1" ]]
then
echo;echo -e "\033[1;36m正在安装openvpn组件...\033[0m"
yum install -y openvpn telnet >/dev/null 2>&1
yum install -y openvpn >/dev/null 2>&1
yum install -y openssl openssl-devel lzo lzo-devel pam pam-devel automake pkgconfig expect >/dev/null 2>&1
if [ ! -e "/etc/openvpn" ];then
echo;echo -e "\033[1;36mopenvpn未安装，正在重新安装...\033[0m"
yum install -y squid openssl openssl-devel lzo lzo-devel pam pam-devel automake pkgconfig openvpn >/dev/null 2>&1
fi
echo;echo -e "\033[1;35mopenvpn组件安装完毕...\033[0m"
fi
#安装openvpn****************************************************************************
#安装openvpn****************************************************************************
if [[ $zsxz == "2" ]]
then
echo;echo -e "\033[1;36m正在安装openvpn组件....\033[0m"
yum install -y gcc openssl-devel lzo-devel pam-devel
cd /root/
yum install -y openvpn
rpm -Uvh --oldpackage --force https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/ttml/openvpn-2.3.12-1.el7.x86_64.rpm
echo;echo -e "\033[1;35mopenvpn组件安装完毕...\033[0m"
fi
#安装openvpn****************************************************************************
echo;echo -e "\033[1;36m正在安装天天免流1分钟lamp...\033[0m"
#安装apache ****************************************************************************
yum -y install httpd >/dev/null 2>&1
chkconfig httpd on >/dev/null 2>&1
sed -i 's/#ServerName www.example.com:80/ServerName localhost:'$lkdk'/g' /etc/httpd/conf/httpd.conf 
sed -i 's/Listen 80/Listen '$lkdk'/g' /etc/httpd/conf/httpd.conf 
service httpd start >/dev/null 2>&1
#安装apache ****************************************************************************
#安装mariadb****************************************************************************
yum install -y mariadb mariadb-server >/dev/null 2>&1
systemctl start mariadb.service >/dev/null 2>&1 #启动MariaDB 
systemctl stop mariadb.service >/dev/null 2>&1 #停止MariaDB 
systemctl restart mariadb.service >/dev/null 2>&1 #重启MariaDB 
systemctl enable mariadb.service >/dev/null 2>&1 #设置开机启动
#安装mariadb****************************************************************************
#安装php    ****************************************************************************
yum -y install php >/dev/null 2>&1
yum install -y php-mysql php-gd libjpeg* php-ldap php-odbc php-pear php-xml php-xmlrpc php-mbstring php-bcmath php-mhash >/dev/null 2>&1
systemctl restart mariadb.service >/dev/null 2>&1 #重启MariaDB 
systemctl restart httpd.service >/dev/null 2>&1 #重启apache
#安装php    ****************************************************************************
echo;echo -e "\033[1;35m天天免流1分钟lamp安装完毕...\033[0m"
#安装网页数据库*************************************************************************
if [[ $phpMyAdmin == 1 ]]
then
echo;echo -e "\033[1;36m正在安装网页数据库......\033[0m"
rm -rf /var/www/html/*
cd /var/www/html
curl -O https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/ttmll/phpMyAdmin.zip >/dev/null 2>&1
unzip phpMyAdmin.zip >/dev/null 2>&1
rm -rf phpMyAdmin.zip
echo;echo -e "\033[1;35m网页数据库安装完毕....\033[0m"
fi
#安装网页数据库*************************************************************************
riqi=`date -d today +%Y-%m-%d; echo`
shi=`date -d today +%H:%M:%S; echo`
#安装流控   ****************************************************************************
echo;echo -e "\033[1;36m请稍等，正在安装WEB面板....\033[0m"
cd /var/www/html
curl -O https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/ttmll/xbb.zip >/dev/null 2>&1
unzip xbb.zip >/dev/null 2>&1
sed -i '85s/IPAddress:88/'${IPAddress}:${lkdk}'/g' /var/www/html/app.sql
sed -i '132s/11893927/'${zdyky}'/g' /var/www/html/app.sql
sed -i '113s/127.0.0.1:88/'${IPAddress}:${lkdk}'/g' /var/www/html/ov.sql
mysqladmin -u root password $MySQLPass 
mysql -uroot -p$MySQLPass -e"DROP DATABASE test;"
mysql -uroot -p$MySQLPass -e"CREATE DATABASE ov;"
mysql -uroot -p$MySQLPass ov < app.sql
mysql -uroot -p$MySQLPass ov < ov.sql
rm -rf app.sql ov.sql
sed -i "s/MySQLPass/$MySQLPass/g" /var/www/html/config.php 
sed -i "s/MySQLPass/$MySQLPass/g" /var/www/html/remote/config.php 
sed -i "s/127.0.0.1/${IPAddress}:${lkdk}/g" /var/www/html/remote/config.php 
rm -rf xbb.zip
chmod -R 0777 /var/www/html/
echo;echo -e "\033[1;35mWEB面板安装完毕....\033[0m"
#安装流控   ****************************************************************************
llwsmd5=`echo -n $zdyky|md5sum`
#安装卫士   ****************************************************************************
echo;echo -e "\033[1;36m正在安装流量卫士云端数据，请稍等....\033[0m"
cd /var/www/html/app_api/
rm -rf /var/www/html/app_api/licences.key
echo "$llwsmd5" >/var/www/html/app_api/licences.key
sed -i '5s/huabai520/'$MySQLPass'/g' /var/www/html/app_api/config.php
mysql -uroot -p$MySQLPass ov < ov.sql >/dev/null 2>&1
chmod -R 777 /var/www/html/app_api/
echo;echo -e "\033[1;35m流量卫士云端数据安装完毕.....\033[0m"
#安装卫士   ****************************************************************************
#安装监控   ****************************************************************************
echo;echo -e "\033[1;36m正在安装实时监控....\033[0m"
yum install -y crontabs >/dev/null 2>&1
mkdir -p /var/spool/cron/ 
chmod 777 /var/www/html/cron.php 
echo "* * * * * curl --silent --compressed http://${IPAddress}:${lkdk}/cron.php">>/var/spool/cron/root
systemctl restart crond.service >/dev/null 2>&1   
systemctl enable crond.service >/dev/null 2>&1
#TCP监控
cd /var/www/html/res
sed -i "5s/admin/$MySQLPass/" /var/www/html/res/jiankong
sed -i "9s/60/$jkpl/" /var/www/html/res/jiankong
chmod +x /var/www/html/res/jiankong
chmod +x /var/www/html/res/kill.sh
/var/www/html/res/jiankong >>/var/www/html/res/jiankong.log 2>&1 &
echo "/var/www/html/res/jiankong >>/var/www/html/res/jiankong.log 2>&1 &">>/etc/rc.local
#UDP监控
cd /var/www/html/udp
sed -i "5s/admin/$MySQLPass/" /var/www/html/udp/jiankong
sed -i "9s/60/$jkpl/" /var/www/html/udp/jiankong
chmod +x /var/www/html/udp/jiankong
chmod +x /var/www/html/udp/kill.sh
/var/www/html/udp/jiankong >>/var/www/html/udp/jiankong.log 2>&1 &
echo "/var/www/html/udp/jiankong >>/var/www/html/udp/jiankong.log 2>&1 &">>/etc/rcl.local
echo;echo -e "\033[1;35m实时监控安装完毕....\033[0m"
#安装监控   ****************************************************************************
#数据备份   ****************************************************************************
echo;echo -e "\033[1;36m正在安装定时数据备份....\033[0m"
cd /var/www/html/ssbf
sed -i "7s/admin/$MySQLPass/" /var/www/html/ssbf/sql.sh
sed -i "9s/21600/$bfpl/" /var/www/html/ssbf/sql.sh
chmod 777 sql.sh
/var/www/html/ssbf/sql.sh >>/var/www/html/ssbf/bf.log 2>&1 &
echo "/var/www/html/ssbf/sql.sh >>/var/www/html/ssbf/bf.log 2>&1 &">>/etc/rcl.local
echo;echo -e "\033[1;35m定时数据备份安装完毕....\033[0m"
#数据备份   ****************************************************************************
#安装openvpn****************************************************************************
#防火墙配置*****************************************************************************
echo;echo -e "\033[1;36m正在开始安装openvpn....\033[0m"
cd /etc/
rm -rf ./sysctl.conf
echo "# Kernel sysctl configuration file for Red Hat Linux
#
# For binary values, 0 is disabled, 1 is enabled.  See sysctl(8) and
# sysctl.conf(5) for more details.

# Controls IP packet forwarding
net.ipv4.ip_forward = 1

# Controls source route verification
net.ipv4.conf.default.rp_filter = 1

# Do not accept source routing
net.ipv4.conf.default.accept_source_route = 0

# Controls the System Request debugging functionality of the kernel
kernel.sysrq = 0

# Controls whether core dumps will append the PID to the core filename.
# Useful for debugging multi-threaded applications.
kernel.core_uses_pid = 1

# Controls the use of TCP syncookies
net.ipv4.tcp_syncookies = 1

# Disable netfilter on bridges.
net.bridge.bridge-nf-call-ip6tables = 0
net.bridge.bridge-nf-call-iptables = 0
net.bridge.bridge-nf-call-arptables = 0

# Controls the default maxmimum size of a mesage queue
kernel.msgmnb = 65536

# Controls the maximum size of a message, in bytes
kernel.msgmax = 65536

# Controls the maximum shared segment size, in bytes
kernel.shmmax = 68719476736

# Controls the maximum number of shared memory segments, in pages
kernel.shmall = 4294967296
" >./sysctl.conf
chmod 0755 ./sysctl.conf
sysctl -p >/dev/null 2>&1
#防火墙配置*****************************************************************************
#openvpn配置****************************************************************************
cd /etc/openvpn/
echo "port ${vpnport}
proto tcp
dev tun
ca /etc/openvpn/easy-rsa/keys/ca.crt
cert /etc/openvpn/easy-rsa/keys/centos.crt
key /etc/openvpn/easy-rsa/keys/centos.key
dh /etc/openvpn/easy-rsa/keys/dh2048.pem
management localhost 7505
auth-user-pass-verify /etc/openvpn/login.sh via-env
client-disconnect /etc/openvpn/disconnect.sh
client-connect /etc/openvpn/connect.sh
client-cert-not-required
username-as-common-name
script-security 3 system
server 10.8.0.0 255.255.0.0
push "redirect-gateway def1 bypass-dhcp"
push "dhcp-option DNS 114.114.114.114"
push "dhcp-option DNS 114.114.115.115"
keepalive 10 20
tls-auth /etc/openvpn/easy-rsa/ta.key 0  
comp-lzo
persist-key
persist-tun
status /var/www/html/res/openvpn-status.txt
log /etc/openvpn/openvpn.log
log-append /etc/openvpn/openvpn.log
verb 3" > /etc/openvpn/server.conf

echo "port 137
proto udp
dev tun
ca /etc/openvpn/easy-rsa/keys/ca.crt
cert /etc/openvpn/easy-rsa/keys/centos.crt
key /etc/openvpn/easy-rsa/keys/centos.key
dh /etc/openvpn/easy-rsa/keys/dh2048.pem
management localhost 7506
auth-user-pass-verify /etc/openvpn/login.sh via-env
client-disconnect /etc/openvpn/disconnect.sh
client-connect /etc/openvpn/connect.sh
client-cert-not-required
username-as-common-name
script-security 3 system
server 10.9.0.0 255.255.0.0
push "redirect-gateway def1 bypass-dhcp"
push "dhcp-option DNS 114.114.114.114"
push "dhcp-option DNS 114.114.115.115"
keepalive 10 20
tls-auth /etc/openvpn/easy-rsa/ta.key 0  
comp-lzo
persist-key
persist-tun
status /var/www/html/udp/openvpn-status2.txt
log /etc/openvpn/udp137.log
log-append /etc/openvpn/udp137.log
verb 3" > /etc/openvpn/udp137.conf

echo "port 138
proto udp
dev tun
ca /etc/openvpn/easy-rsa/keys/ca.crt
cert /etc/openvpn/easy-rsa/keys/centos.crt
key /etc/openvpn/easy-rsa/keys/centos.key
dh /etc/openvpn/easy-rsa/keys/dh2048.pem
management localhost 7507
auth-user-pass-verify /etc/openvpn/login.sh via-env
client-disconnect /etc/openvpn/disconnect.sh
client-connect /etc/openvpn/connect.sh
client-cert-not-required
username-as-common-name
script-security 3 system
server 10.10.0.0 255.255.0.0
push "redirect-gateway def1 bypass-dhcp"
push "dhcp-option DNS 114.114.114.114"
push "dhcp-option DNS 114.114.115.115"
keepalive 10 20
tls-auth /etc/openvpn/easy-rsa/ta.key 0  
comp-lzo
persist-key
persist-tun
status /var/www/html/udp/openvpn-status2.txt
log /etc/openvpn/udp138.log
log-append /etc/openvpn/udp138.log
verb 3" > /etc/openvpn/udp138.conf

echo "port 440
proto tcp
dev tun
ca /etc/openvpn/easy-rsa/keys/ca.crt
cert /etc/openvpn/easy-rsa/keys/centos.crt
key /etc/openvpn/easy-rsa/keys/centos.key
dh /etc/openvpn/easy-rsa/keys/dh2048.pem
management localhost 7508
auth-user-pass-verify /etc/openvpn/login.sh via-env
client-disconnect /etc/openvpn/disconnect.sh
client-connect /etc/openvpn/connect.sh
client-cert-not-required
username-as-common-name
script-security 3 system
server 10.11.0.0 255.255.0.0
push "redirect-gateway def1 bypass-dhcp"
push "dhcp-option DNS 114.114.114.114"
push "dhcp-option DNS 114.114.115.115"
keepalive 10 20
tls-auth /etc/openvpn/easy-rsa/ta.key 0  
comp-lzo
persist-key
persist-tun
status /var/www/html/res/openvpn-status.txt
log /etc/openvpn/openvpn.log
log-append /etc/openvpn/openvpn.log
verb 3" > /etc/openvpn/server440.conf

echo "port 3389
proto tcp
dev tun
ca /etc/openvpn/easy-rsa/keys/ca.crt
cert /etc/openvpn/easy-rsa/keys/centos.crt
key /etc/openvpn/easy-rsa/keys/centos.key
dh /etc/openvpn/easy-rsa/keys/dh2048.pem
management localhost 7509
auth-user-pass-verify /etc/openvpn/login.sh via-env
client-disconnect /etc/openvpn/disconnect.sh
client-connect /etc/openvpn/connect.sh
client-cert-not-required
username-as-common-name
script-security 3 system
server 10.12.0.0 255.255.0.0
push "redirect-gateway def1 bypass-dhcp"
push "dhcp-option DNS 114.114.114.114"
push "dhcp-option DNS 114.114.115.115"
keepalive 10 20
tls-auth /etc/openvpn/easy-rsa/ta.key 0  
comp-lzo
persist-key
persist-tun
status /var/www/html/res/openvpn-status.txt
log /etc/openvpn/openvpn.log
log-append /etc/openvpn/openvpn.log
verb 3" > /etc/openvpn/server3389.conf
#openvpn配置****************************************************************************
#最新登录   ****************************************************************************
echo;echo -e "\033[1;36m正在安装防删库登录....\033[0m"
cd /etc/openvpn
curl -O https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/ttmll/denglu.zip >/dev/null 2>&1
unzip denglu.zip >/dev/null 2>&1
rm -rf /etc/openvpn/denglu.zip
sed -i "7s/admin/$MySQLPass/g" /etc/openvpn/login.sh
sed -i "7s/admin/$MySQLPass/g" /etc/openvpn/disconnect.sh 
sed -i "47s/127.0.0.1/${IPAddress}:${lkdk}/g" /etc/openvpn/disconnect.sh 
chmod 777 /etc/openvpn/disconnect.sh
chmod 777 /etc/openvpn/login.sh
chmod 777 /etc/openvpn/connect.sh
chmod -R 777 /etc/openvpn/
echo;echo -e "\033[1;35m防删库登录安装完毕....\033[0m"
#最新登录   ****************************************************************************
#安装MP   ******************************************************************************
#sed -i "23s/8080/8080/" udp.c
#sed -i "184s/443/$vpnport/" udp.c
#gcc -o udp udp.c
rm -rf /etc/openvpn/udp.c 
cd /etc/openvpn/
curl -O https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/ttmll/udp >/dev/null 2>&1
#安装MP   ******************************************************************************
#安装证书   ****************************************************************************
echo;echo -e "\033[1;36m正在安装openvpn证书....\033[0m";
curl -O https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/ttmll/easy-rsa.zip >/dev/null 2>&1
unzip easy-rsa.zip >/dev/null 2>&1
rm -rf /etc/openvpn/easy-rsa.zip
chmod -R 0777 /etc/openvpn/
echo;echo -e "\033[1;35mopenvpn证书安装完毕....\033[0m";
#安装证书   ****************************************************************************
#安装squid   ***************************************************************************
#squid认证******************************************************************************
squsername=ttml;
sqpasswd=ttml;
#squid认证******************************************************************************
systemctl enable openvpn@server >/dev/null 2>&1
if [[ $lkdk != 80 ]];then
yum -y install squid >/dev/null 2>&1
cd /etc/squid
rm -f ./squid.conf
echo
echo -e "\033[1;36m正在启用HTTP代理端口....\033[0m"
sleep 2
echo "acl SSL_ports port 443
acl Safe_ports port 80
acl Safe_ports port 21
acl Safe_ports port 443
acl Safe_ports port 8080
acl CONNECT method CONNECT
http_port 80
cache_mgr webmaster
cache_mem 64 MB
cache_swap_low 90
cache_swap_high 95
auth_param basic program /usr/lib64/squid/basic_ncsa_auth /etc/squid/squid_passwd
auth_param basic children 5
acl passwder proxy_auth REQUIRED
http_access allow passwder
http_access deny all
forwarded_for off
visible_hostname TD-LTE/FDD-LTE(www.titiml.cn)
cache_mgr Welcome_to_use_OpenVPN_For_titiml.cn
# titiml.cn
" >squid.conf
chmod 0755 squid.conf
echo;echo -e "\033[1;34m正在加密HTTP Proxy代理端口....\033[0m"
chmod 777 /etc/openvpn/easy-rsa/hbml
cd /etc/squid/
${hbml} squid_passwd ${squsername} ${sqpasswd} >/dev/null 2>&1
chmod 0755 squid.conf squid_passwd
fi
echo;echo -e "\033[1;35mopenvpn安装完毕....\033[0m"
#安装squid   ***************************************************************************
#安装openvpn****************************************************************************
#写入快捷命令***************************************************************************
echo "#!/bin/sh
echo 正在重启lamp服务...
systemctl start mariadb.service >/dev/null 2>&1
systemctl restart mariadb.service >/dev/null 2>&1 
systemctl restart httpd.service >/dev/null 2>&1
echo 服务已启动
exit 0;
" >/bin/lamp
chmod 0777 /bin/lamp
echo 

if [[ $zsxz == "1" ]];then
if [[ $lkdk != 80 ]];then
echo "echo 正在重启服务...
setenforce 0 >/dev/null 2>&1
killall openvpn >/dev/null 2>&1
killall udp >/dev/null 2>&1
killall squid >/dev/null 2>&1
squid -z >/dev/null 2>&1
squid -s >/dev/null 2>&1
killall squid >/dev/null 2>&1
squid -z >/dev/null 2>&1
squid -s >/dev/null 2>&1
systemctl stop openvpn@server >/dev/null 2>&1
systemctl start openvpn@server >/dev/null 2>&1
clear
cd /etc/openvpn
openvpn --config udp137.conf & >/dev/null 2>&1
openvpn --config udp138.conf & >/dev/null 2>&1
openvpn --config server440.conf & >/dev/null 2>&1
openvpn --config server3389.conf & >/dev/null 2>&1
./udp -l 8080 -d >/dev/null 2>&1
./udp -l 137 -d >/dev/null 2>&1
./udp -l 138 -d >/dev/null 2>&1
./udp -l 28080 -d >/dev/null 2>&1
./udp -l 351 -d >/dev/null 2>&1
./udp -l 366 -d >/dev/null 2>&1
./udp -l 136 -d >/dev/null 2>&1
./udp -l 139 -d >/dev/null 2>&1
./udp -l 53 -d >/dev/null 2>&1
./udp -l 9101 -d >/dev/null 2>&1
./udp -l 10088 -d >/dev/null 2>&1
lamp
echo -e '服务状态：			  [\033[32m  OK  \033[0m]'
exit 0;
" >/bin/vpn
chmod 0755 /bin/vpn
else
echo "echo 正在重启服务...
setenforce 0 >/dev/null 2>&1
killall openvpn >/dev/null 2>&1
killall udp >/dev/null 2>&1
systemctl stop openvpn@server >/dev/null 2>&1
systemctl start openvpn@server >/dev/null 2>&1
clear
cd /etc/openvpn
openvpn --config udp137.conf & >/dev/null 2>&1
openvpn --config udp138.conf & >/dev/null 2>&1
openvpn --config server440.conf & >/dev/null 2>&1
openvpn --config server3389.conf & >/dev/null 2>&1
./udp -l 8080 -d >/dev/null 2>&1
./udp -l 137 -d >/dev/null 2>&1
./udp -l 138 -d >/dev/null 2>&1
./udp -l 28080 -d >/dev/null 2>&1
./udp -l 351 -d >/dev/null 2>&1
./udp -l 366 -d >/dev/null 2>&1
./udp -l 136 -d >/dev/null 2>&1
./udp -l 139 -d >/dev/null 2>&1
./udp -l 53 -d >/dev/null 2>&1
./udp -l 9101 -d >/dev/null 2>&1
./udp -l 10088 -d >/dev/null 2>&1
lamp
echo -e '服务状态：			  [\033[32m  OK  \033[0m]'
exit 0;
" >/bin/vpn
chmod 0755 /bin/vpn
fi;fi

if [[ $zsxz == "2" ]];then
if [[ $lkdk != 80 ]];then
echo "echo 正在重启服务...
setenforce 0 >/dev/null 2>&1
killall openvpn >/dev/null 2>&1
killall udp >/dev/null 2>&1
killall squid >/dev/null 2>&1
squid -z >/dev/null 2>&1
squid -s >/dev/null 2>&1
clear
cd /etc/openvpn
openvpn --config server.conf & >/dev/null 2>&1
openvpn --config udp137.conf & >/dev/null 2>&1
openvpn --config udp138.conf & >/dev/null 2>&1
openvpn --config server440.conf & >/dev/null 2>&1
openvpn --config server3389.conf & >/dev/null 2>&1
./udp -l 8080 -d >/dev/null 2>&1
./udp -l 137 -d >/dev/null 2>&1
./udp -l 138 -d >/dev/null 2>&1
./udp -l 28080 -d >/dev/null 2>&1
./udp -l 351 -d >/dev/null 2>&1
./udp -l 366 -d >/dev/null 2>&1
./udp -l 136 -d >/dev/null 2>&1
./udp -l 139 -d >/dev/null 2>&1
./udp -l 53 -d >/dev/null 2>&1
./udp -l 9101 -d >/dev/null 2>&1
./udp -l 10088 -d >/dev/null 2>&1
lamp
echo -e '服务状态：			  [\033[32m  OK  \033[0m]'
exit 0;
" >/bin/vpn
chmod 0755 /bin/vpn
else
echo "echo 正在重启服务...
setenforce 0 >/dev/null 2>&1
killall openvpn >/dev/null 2>&1
killall udp >/dev/null 2>&1
clear
cd /etc/openvpn
openvpn --config server.conf & >/dev/null 2>&1
openvpn --config udp137.conf & >/dev/null 2>&1
openvpn --config udp138.conf & >/dev/null 2>&1
openvpn --config server440.conf & >/dev/null 2>&1
openvpn --config server3389.conf & >/dev/null 2>&1
./udp -l 8080 -d >/dev/null 2>&1
./udp -l 137 -d >/dev/null 2>&1
./udp -l 138 -d >/dev/null 2>&1
./udp -l 28080 -d >/dev/null 2>&1
./udp -l 351 -d >/dev/null 2>&1
./udp -l 366 -d >/dev/null 2>&1
./udp -l 136 -d >/dev/null 2>&1
./udp -l 139 -d >/dev/null 2>&1
./udp -l 53 -d >/dev/null 2>&1
./udp -l 9101 -d >/dev/null 2>&1
./udp -l 10088 -d >/dev/null 2>&1
lamp
echo -e '服务状态：			  [\033[32m  OK  \033[0m]'
exit 0;
" >/bin/vpn
chmod 0755 /bin/vpn
fi;fi
#写入快捷命令***************************************************************************
#chkconfig openvpn on
rm -rf /etc/rc.d/init.d/openvpn
sleep 0.8
clear
#安装openvpn****************************************************************************
#线路部分  *****************************************************************************
cd /etc/openvpn
cp /etc/openvpn/easy-rsa/keys/ca.crt /home/ca.crt 
cp /etc/openvpn/easy-rsa/ta.key /home/ta.key 
cd /home/
#变量***********************************************************************************
wen='"'
#变量***********************************************************************************
echo;echo -e "\033[1;36m正在快速生成线路....\033[0m"
echo "# 天天免流配置
machine-readable-output
client
dev tun
proto udp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########">yl1.ovpn
echo remote $IPAddress 137 >yl2.ovpn
echo '########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
'>yl3.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
">yl4.ovpn
cat yl1.ovpn yl2.ovpn yl3.ovpn yl4.ovpn>udp137.ovpn
rm -rf ./{yl1.ovpn,yl2.ovpn,yl3.ovpn,yl4.ovpn}

echo "# 天天免流配置
machine-readable-output
client
dev tun
proto udp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########">yl1.ovpn
echo remote $IPAddress 138 >yl2.ovpn
echo '########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
'>yl3.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
">yl4.ovpn
cat yl1.ovpn yl2.ovpn yl3.ovpn yl4.ovpn>udp138.ovpn
rm -rf ./{yl1.ovpn,yl2.ovpn,yl3.ovpn,yl4.ovpn}

echo "# 天天免流配置
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########
remote a.mll.migu.cn 3389 tcp-client
http-proxy-option EXT1 ${wen}POST http://a.mll.migu.cn${wen}
http-proxy-option EXT1 ${wen}VPN 127.0.0.1:443${wen}
http-proxy-option EXT1 ${wen}Host: a.mll.migu.cn / HTTP/1.1${wen}
http-proxy $IPAddress 138">yl1.ovpn
echo '########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
'>yl2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
">yl3.ovpn
cat yl1.ovpn yl2.ovpn yl3.ovpn>全国咪咕138.ovpn
rm -rf ./{yl1.ovpn,yl2.ovpn,yl3.ovpn}

echo "# 天天免流配置
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########
remote www.baidu.com 3389 tcp-client
;http-proxy-retry
;http-proxy [proxy server] [proxy port]
http-proxy-option EXT1 ${wen} Host:${IPAddress}:${vpnport}${wen}
http-proxy-option EXT1 ${wen}Host:wap.10086.cn${wen}
http-proxy 10.0.0.172 80">yl1.ovpn
echo '########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
'>yl2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
">yl3.ovpn
cat yl1.ovpn yl2.ovpn yl3.ovpn>全国移动B.ovpn
rm -rf ./{yl1.ovpn,yl2.ovpn,yl3.ovpn}


echo "# 天天免流配置
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########
remote / 80
http-proxy 10.0.0.172 80
http-proxy-option EXT1 ${wen} ${wen}Host:${IPAddress}:${vpnport}
http-proxy-option EXT1 ${wen}Host: a.mll.migu.cn${wen}">yl1.ovpn
echo '########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
'>yl2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
">yl3.ovpn
cat yl1.ovpn yl2.ovpn yl3.ovpn>全国咪咕移动.ovpn
rm -rf ./{yl1.ovpn,yl2.ovpn,yl3.ovpn}

echo "# 天天免流配置
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########
remote / 80
http-proxy 10.0.0.172 80
http-proxy-option EXT1 ${wen} ${wen}Host:${IPAddress}:${vpnport}
http-proxy-option EXT1 Host:wap.zj.10086.cn">yl1.ovpn
echo '########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
'>yl2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
">yl3.ovpn
cat yl1.ovpn yl2.ovpn yl3.ovpn>移动浙江.ovpn
rm -rf ./{yl1.ovpn,yl2.ovpn,yl3.ovpn}

echo "# 天天免流配置
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########
remote wap.ha.10086.cn
http-proxy ${IPAddress} 138
http-proxy-option EXT1 ${IPAddress}:443">yl1.ovpn
echo '########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
'>yl2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
">yl3.ovpn
cat yl1.ovpn yl2.ovpn yl3.ovpn>移动河南不限速.ovpn
rm -rf ./{yl1.ovpn,yl2.ovpn,yl3.ovpn}


echo "# 天天免流配置
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########
remote mob.10010.com 80
http-proxy $IPAddress 8080 
http-proxy-option EXT1 ttml 127.0.0.1:${vpnport}
http-proxy-option EXT1 ${wen}POST http://mp.weixin.qq.com${wen}
http-proxy-option EXT1 ${wen}Host: http://mp.weixin.qq.com / HTTP/1.1${wen}">yl1.ovpn
echo '########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
'>yl2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
">yl3.ovpn
cat yl1.ovpn yl2.ovpn yl3.ovpn>联通大王卡.ovpn
rm -rf ./{yl1.ovpn,yl2.ovpn,yl3.ovpn}


echo "# 天天免流配置
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########
remote freetyst.mll.migu.cn 3389 tcp-client
http-proxy-option EXT1 GET http://freetyst.mll.migu.cn/public/ringmaker01/dailyring03/vsftp/ywq/public/ringmaker01/dailyring03/2015/11/2015%E5%B9%B411%E6%9C%8826%E6%97%A514%E7%82%B943%E5%88%86%E7%B4%A7%E6%80%A5%E5%86%85%E5%AE%B9%E5%87%86%E5%85%A5%E5%8C%97%E4%BA%AC%E5%B0%91%E5%9F%8E2%E9%A6%96/%E5%85%A8%E6%9B%B2%E8%AF%95%E5%90%AC/Mp3_128_44_16/%E6%88%91%E7%9A%84%E6%A2%A6-%E5%BC%A0%E9%9D%93%E9%A2%96.mp3?channelid=03&k=4fbe3340861916f5&t=1479837104 / HTTP/1.1 
http-proxy-option EXT1 X-Online-Host: freetyst.mll.migu.cn
http-proxy-option EXT1 Host: freetyst.mll.migu.cn 
http-proxy-option EXT1 ttml 127.0.0.1:${vpnport}">yl1.ovpn
echo http-proxy $IPAddress 8080 >yl2.ovpn
echo '########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
'>yl3.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
">yl4.ovpn
cat yl1.ovpn yl2.ovpn yl3.ovpn yl4.ovpn>广东移动.ovpn
rm -rf ./{yl1.ovpn,yl2.ovpn,yl3.ovpn,yl4.ovpn}

echo "# 天天免流配置
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########
remote / 80
http-proxy 10.0.0.172 8080
;http-proxy-retry
;http-proxy [proxy server] [proxy port]
http-proxy-option EXT1 ${wen} ${wen}Host:${IPAddress}:443
http-proxy-option EXT1 CONNECT / http:wap.10086.cn:443 

 HTTP/1.1
http-proxy-option EXT1 ttml ${IPAddress}:443
http-proxy-option EXT1 Host:rd.go.10086.cn:443 

">yl1.ovpn
echo '########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
'>yl2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
">yl3.ovpn
cat yl1.ovpn yl2.ovpn yl3.ovpn>全国限速修复.ovpn
rm -rf ./{yl1.ovpn,yl2.ovpn,yl3.ovpn}

echo "# 天天免流配置
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########
remote ${IPAddress}:443/
Host:strms.free.migudm.cn
http-proxy-option EXT1 CONNECT strms.free.migudm.cn
http-proxy-option EXT1 X-Online-Host: strms.free.migudm.cn
http-proxy 10.0.0.172 80">yl1.ovpn
echo '########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
'>yl2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
">yl3.ovpn
cat yl1.ovpn yl2.ovpn yl3.ovpn>最新全国移动A.ovpn
rm -rf ./{yl1.ovpn,yl2.ovpn,yl3.ovpn}

echo "# 天天免流配置
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########
remote ${IPAddress}:443/
Host:a.mll.migu.cn
http-proxy-option EXT1 CONNECT a.mll.migu.cn
http-proxy-option EXT1 X-Online-Host: a.mll.migu.cn
http-proxy 10.0.0.172 80">yl1.ovpn
echo '########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
'>yl2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
">yl3.ovpn
cat yl1.ovpn yl2.ovpn yl3.ovpn>最新全国移动B.ovpn
rm -rf ./{yl1.ovpn,yl2.ovpn,yl3.ovpn}


echo "# 天天免流配置
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########
remote / 80
;http-proxy-retry
;http-proxy [proxy server] [proxy port]
http-proxy 10.0.0.172 80
http-proxy-option EXT1 ${wen} ${wen}Host:$IPAddress:${vpnport}
http-proxy-option EXT1 CONNECT / http:a.mll.migu.cn HTTP/1.1
http-proxy-option EXT1 ttml 127.0.0.1:443
http-proxy-option EXT1 Host:rd.go.10086.cn:443">yl1.ovpn
echo '########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
'>yl2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
">yl3.ovpn
cat yl1.ovpn yl2.ovpn yl3.ovpn>全国移动C.ovpn
rm -rf ./{yl1.ovpn,yl2.ovpn,yl3.ovpn}

echo "# 天天免流配置
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########
remote / 80
;http-proxy-retry
;http-proxy [proxy server] [proxy port]
http-proxy 10.0.0.172 80
http-proxy-option EXT1 ${wen} ${wen}Host:$IPAddress:${vpnport}
http-proxy-option EXT1 Host:wap.sc.10086.cn 
http-proxy-option EXT1 X-Online-Host: wap.sc.10086.com">yl1.ovpn
echo '########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
'>yl2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
">yl3.ovpn
cat yl1.ovpn yl2.ovpn yl3.ovpn>四川移动A.ovpn
rm -rf ./{yl1.ovpn,yl2.ovpn,yl3.ovpn}

echo "# 天天免流配置
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########
remote / 80
;http-proxy-retry
;http-proxy [proxy server] [proxy port]
http-proxy 10.0.0.172 80
http-proxy-option EXT1 ${wen} ${wen}Host:$IPAddress:${vpnport}
http-proxy-option EXT1 CONNECT / http:wap.sc.10086.cn HTTP/1.1
http-proxy-option EXT1 Host:wap.sc.10086.cn">yl1.ovpn
echo '########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
'>yl2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
">yl3.ovpn
cat yl1.ovpn yl2.ovpn yl3.ovpn>四川移动B.ovpn
rm -rf ./{yl1.ovpn,yl2.ovpn,yl3.ovpn}

echo "# 天天免流配置
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########
remote wap.gd.10086.cn 80

http-proxy $IPAddress 8080

http-proxy-option EXT1 ttml 127.0.0.1:443

http-proxy-option EXT1 X-Online-Host: wap.gd.10086.cn 

http-proxy-option EXT1 Host: wap.gd.10086.cn ">yl1.ovpn
echo '########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
'>yl2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
">yl3.ovpn
cat yl1.ovpn yl2.ovpn yl3.ovpn>深圳移动.ovpn
rm -rf ./{yl1.ovpn,yl2.ovpn,yl3.ovpn}

echo "# 天天免流配置
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########
remote wap.cmvideo.cn 3389 tcp-clientn
http-proxy-option CUSTOM-HEADER Host wap.cmvideo.cn
http-proxy-option EXT1 Host X-Online-Host
http-proxy-option EXT1 Host 
http-proxy-option CUSTOM-HEADER CONNECT/HTTP/1.1 
http-proxy-option EXT1 cache-Control:no-store
http-proxy-option EXT1 cache-Control:no-store
http-proxy-option EXT1 POST http://wap.cmvideo.cn
http-proxy-option VERSION 1.1
http-proxy-option EXT1 Proxy-Connection: keep-alive
http-proxy-option EXT1 VPN 127.0.0.1:443
http-proxy $IPAddress 8080">yl1.ovpn
echo '########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
'>yl2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
">yl3.ovpn
cat yl1.ovpn yl2.ovpn yl3.ovpn>全国移动A.ovpn
rm -rf ./{yl1.ovpn,yl2.ovpn,yl3.ovpn}

echo "# 天天免流配置
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########
remote / 80
;http-proxy-retry
;http-proxy [proxy server] [proxy port]
http-proxy 10.0.0.172 80
http-proxy-option EXT1 ${wen} ${wen}Host:$IPAddress:${vpnport}
http-proxy-option EXT1 Host:wap.jx.10086.cn">yl1.ovpn
echo '########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
'>yl2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
">yl3.ovpn
cat yl1.ovpn yl2.ovpn yl3.ovpn>江西移动A.ovpn
rm -rf ./{yl1.ovpn,yl2.ovpn,yl3.ovpn}

echo "# 天天免流配置
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########
remote wap.10086.cn 80
http-proxy ${IPAddress} 137
http-proxy-option EXT1 ttml 127.0.0.1:443
http-proxy-option EXT1 POST http://wap.jx.10086.cn
http-proxy-option EXT1 Host wap.jx.10086.cn
http-proxy-option EXT1 Host: wap.jx.10086.cn / HTTP/1.1">yl1.ovpn
echo '########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
'>yl2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
">yl3.ovpn
cat yl1.ovpn yl2.ovpn yl3.ovpn>江西移动B.ovpn
rm -rf ./{yl1.ovpn,yl2.ovpn,yl3.ovpn}

echo "# 天天免流配置
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########
remote / 80
;http-proxy-retry
;http-proxy [proxy server] [proxy port]
http-proxy 10.0.0.172 80
http-proxy-option EXT1 ${wen} ${wen}Host:${IPAddress}:3389
http-proxy-option EXT1 Host:wap.gd.10086.cn">yl1.ovpn
echo '########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
'>yl2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
">yl3.ovpn
cat yl1.ovpn yl2.ovpn yl3.ovpn>广东移动A.ovpn
rm -rf ./{yl1.ovpn,yl2.ovpn,yl3.ovpn}

echo "# 天天免流配置
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########
remote / 80
;http-proxy-retry
;http-proxy [proxy server] [proxy port]
http-proxy 10.0.0.172 80
http-proxy-option EXT1 ${wen} ${wen}Host:${IPAddress}:443
http-proxy-option EXT1 Host:wap.gd.10086.cn">yl1.ovpn
echo '########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
'>yl2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
">yl3.ovpn
cat yl1.ovpn yl2.ovpn yl3.ovpn>广东移动B.ovpn
rm -rf ./{yl1.ovpn,yl2.ovpn,yl3.ovpn}

echo "# 天天免流配置
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########
remote wap.gx.10086.cn 3389 tcp-client
http-proxy-option EXT1 ${wen}ttml 127.0.0.1:443${wen}
http-proxy-option EXT1 ${wen}X-Online-Host: wap.gx.10086.cn${wen}
http-proxy-option EXT1 ${wen}Host: wap.gx.10086.cn${wen}
http-proxy ${IPAddress} 138">yl1.ovpn
echo '########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
'>yl2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
">yl3.ovpn
cat yl1.ovpn yl2.ovpn yl3.ovpn>广西移动A.ovpn
rm -rf ./{yl1.ovpn,yl2.ovpn,yl3.ovpn}

echo "# 天天免流配置
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########
remote wap.10086.cn 80 tcp-client
http-proxy-option EXT1 POST wap.10086.cn
http-proxy-option EXT1 GET wap.10086.cn
http-proxy-option EXT1 X-Online-Host:wap.10086.cn
http-proxy-option EXT1 Host 127.0.0.1:443
http-proxy-option EXT1 CONNECT wap.10086.cn
http-proxy ${IPAddress} 8080">yl1.ovpn
echo '########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
'>yl2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
">yl3.ovpn
cat yl1.ovpn yl2.ovpn yl3.ovpn>陕西移动A.ovpn
rm -rf ./{yl1.ovpn,yl2.ovpn,yl3.ovpn}

echo "# 天天免流配置
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########
remote / 80
;http-proxy-retry
;http-proxy [proxy server] [proxy port]
http-proxy 10.0.0.172 80
http-proxy-option EXT1 ${wen} ${wen}Host:${IPAddress}:${vpnport}
http-proxy-option EXT1 Host:wap.sn.10086.cn">yl1.ovpn
echo '########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
'>yl2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
">yl3.ovpn
cat yl1.ovpn yl2.ovpn yl3.ovpn>陕西移动B.ovpn
rm -rf ./{yl1.ovpn,yl2.ovpn,yl3.ovpn}

echo "# 天天免流配置
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########
remote / 80
;http-proxy-retry
;http-proxy [proxy server] [proxy port]
http-proxy 10.0.0.172 80
http-proxy-option EXT1 ${wen} ${wen}Host:${IPAddress}:3389
http-proxy-option EXT1 Host:wap.sn.10086.cn">yl1.ovpn
echo '########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
'>yl2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
">yl3.ovpn
cat yl1.ovpn yl2.ovpn yl3.ovpn>陕西移动C.ovpn
rm -rf ./{yl1.ovpn,yl2.ovpn,yl3.ovpn}

echo "# 天天免流配置
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########
remote dlsdown.mll.migu.cn 80 tcp-client
http-proxy-option EXT1 POST http://dlsdown.mll.migu.cn / HTTP/1.1
http-proxy-option EXT1 Host: dlsdown.mll.migu.cn
http-proxy-option EXT1 ttml 127.0.0.1:443
http-proxy $IPAddress 136">yl1.ovpn
echo '########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
'>yl2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
">yl3.ovpn
cat yl1.ovpn yl2.ovpn yl3.ovpn>浙江移动136.ovpn
rm -rf ./{yl1.ovpn,yl2.ovpn,yl3.ovpn}

echo "# 天天免流配置
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########
remote / 80
;http-proxy-retry
;http-proxy [proxy server] [proxy port]
http-proxy-option EXT1 ${wen} ${wen}Host:$IPAddress:${vpnport}
http-proxy-option EXT1 Host:wap.ha.10086.cn 
http-proxy 10.0.0.172 80">yl1.ovpn
echo '########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
'>yl2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
">yl3.ovpn
cat yl1.ovpn yl2.ovpn yl3.ovpn>河南移动.ovpn
rm -rf ./{yl1.ovpn,yl2.ovpn,yl3.ovpn}

echo "# 天天免流配置
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########
remote ws.gf.com.cn 80
http-proxy-option EXT1 ${wen}ttml 127.0.0.1:443${wen}
http-proxy-option EXT1 ${wen}X-Online-Host: ws.gf.com.cn${wen} 
http-proxy-option EXT1 ${wen}POST http://ws.gf.com.cn${wen} 
http-proxy-option EXT1 ${wen}Host: ws.gf.com.cn${wen}
http-proxy-option EXT1 ${wen}GET http://ws.gf.com.cn${wen} 
http-proxy $IPAddress 8080">yl1.ovpn
echo '########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
'>yl2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
">yl3.ovpn
cat yl1.ovpn yl2.ovpn yl3.ovpn>广发证券.ovpn
rm -rf ./{yl1.ovpn,yl2.ovpn,yl3.ovpn}

echo "# 天天免流配置
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########
remote migumovie.lovev.com 80
http-proxy $IPAddress 8080
http-proxy-option EXT1 X-Online-Host: migumovie.lovev.com 
http-proxy-option EXT1 Host: migumovie.lovev.com ">yl1.ovpn
echo '########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
'>yl2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
">yl3.ovpn
cat yl1.ovpn yl2.ovpn yl3.ovpn>甘肃移动8080.ovpn
rm -rf ./{yl1.ovpn,yl2.ovpn,yl3.ovpn}

echo "# 天天免流配置
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########
remote ${IPAddress}:443/
X-Online-Host:wap.10086.cn 
http-proxy 10.0.0.172 80
http-proxy-option EXT1 ${wen}Host: wap.10086.cn${wen}">yl1.ovpn
echo '########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
'>yl2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
">yl3.ovpn
cat yl1.ovpn yl2.ovpn yl3.ovpn>甘肃移动A.ovpn
rm -rf ./{yl1.ovpn,yl2.ovpn,yl3.ovpn}

if [[ $lkdk != 80 ]];then
echo "# 天天免流配置
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########
remote / 80
;http-proxy-retry
;http-proxy [proxy server] [proxy port] [proxy xcap]
http-proxy 10.0.0.172 80
http-proxy-option EXT1 ${wen} ${wen}Host:$IPAddress:${vpnport}
http-proxy-option EXT1 Host:wap.10086.cn 

Host,X-Online-Host;[method] [uri] HTTP/1.1
Host: wap.10086.cn 

X-Online-Host.: wap.10086.cn 

X-Online-Host : [host]
;
Host,X-Online-Host;CONNECT [host] [version]
CONNECT rd.go.10086.cn:443 

 HTTP/1.1
X-Online-Host: rd.go.10086.cn:443 

; ">yl1.ovpn
echo '########免流代码########
<http-proxy-user-pass>'>yl2.ovpn
echo ${squsername} >yl3.ovpn
echo ${sqpasswd} >yl4.ovpn
echo '</http-proxy-user-pass>'>yl5.ovpn
echo 'resolv-retry infinite
nobind
persist-key
persist-tun
'>yl6.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
">yl7.ovpn
cat yl1.ovpn yl2.ovpn yl3.ovpn yl4.ovpn yl5.ovpn yl6.ovpn yl7.ovpn>全国移动80.ovpn
rm -rf ./{yl1.ovpn,yl2.ovpn,yl3.ovpn,yl4.ovpn,yl5.ovpn,yl6.ovpn,yl7.ovpn}

echo '# 天天免流配置
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########
http-proxy-option EXT1 "POST http://rd.go.10086.cn"
http-proxy-option EXT1 "GET http://rd.go.10086.cn"
http-proxy-option EXT1 "X-Online-Host: rd.go.10086.cn" 
http-proxy-option EXT1 "POST http://rd.go.10086.cn" 
http-proxy-option EXT1 "X-Online-Host: rd.go.10086.cn" 
http-proxy-option EXT1 "POST http://rd.go.10086.cn" 
http-proxy-option EXT1 "Host: rd.go.10086.cn" 
http-proxy-option EXT1 "GET http://rd.go.10086.cn" 
http-proxy-option EXT1 "Host: rd.go.10086.cn"' >yl1.ovpn
echo http-proxy $IPAddress 80 >yl2.ovpn
echo '########免流代码########
<http-proxy-user-pass>'>yl3.ovpn
echo ${squsername} >yl4.ovpn
echo ${sqpasswd} >yl5.ovpn
echo '</http-proxy-user-pass>'>yl6.ovpn
echo remote $IPAddress $vpnport tcp-client >yl7.ovpn
echo 'resolv-retry infinite
nobind
persist-key
persist-tun
'>yl8.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
">yl9.ovpn
cat yl1.ovpn yl2.ovpn yl3.ovpn yl4.ovpn yl5.ovpn yl6.ovpn yl7.ovpn yl8.ovpn yl9.ovpn>常规模式.ovpn
rm -rf ./{yl1.ovpn,yl2.ovpn,yl3.ovpn,yl4.ovpn,yl5.ovpn,yl6.ovpn,yl7.ovpn,yl8.ovpn,yl9.ovpn}
fi

echo "# 天天免流配置
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########
remote cdn.4g.play.cn 440
http-proxy-option EXT1 GET http://cdn.4g.play.cn 
http-proxy-option EXT1 POST http://cdn.4g.play.cn 
http-proxy-option EXT1 X-Online-Host: cdn.4g.play.cn 
http-proxy-option EXT1 Host: cdn.4g.play.cn">yl1.ovpn
echo http-proxy $IPAddress 8080 >yl2.ovpn
echo '########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
'>yl3.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
">yl4.ovpn
cat yl1.ovpn yl2.ovpn yl3.ovpn yl4.ovpn>全国电信A.ovpn
rm -rf ./{yl1.ovpn,yl2.ovpn,yl3.ovpn,yl4.ovpn}

echo "# 天天免流配置
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########
remote cdn.4g.play.cn 80
http-proxy-option EXT1 POST http://cdn.4g.play.cn 
http-proxy-option EXT1 ttml 127.0.0.1:${vpnport}
http-proxy-option EXT1 Host: cdn.4g.play.cn / HTTP/1.1">yl1.ovpn
echo http-proxy $IPAddress 8080 >yl2.ovpn
echo '########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
'>yl3.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
">yl4.ovpn
cat yl1.ovpn yl2.ovpn yl3.ovpn yl4.ovpn>全国电信爱玩.ovpn
rm -rf ./{yl1.ovpn,yl2.ovpn,yl3.ovpn,yl4.ovpn}

echo "# 天天免流配置
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########
remote ltetp.tv189.com 80
http-proxy-option EXT1 POST http://ltetp.tv189.com 
http-proxy-option EXT1 ttml 127.0.0.1:${vpnport}
http-proxy-option EXT1 Host: ltetp.tv189.com / HTTP/1.1">yl1.ovpn
echo http-proxy $IPAddress 8080 >yl2.ovpn
echo '########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
'>yl3.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
">yl4.ovpn
cat yl1.ovpn yl2.ovpn yl3.ovpn yl4.ovpn>全国电信爱看.ovpn
rm -rf ./{yl1.ovpn,yl2.ovpn,yl3.ovpn,yl4.ovpn}

echo "# 天天免流配置
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########
remote dl.music.189.cn 80
http-proxy-option EXT1 POST http://dl.music.189.cn 
http-proxy-option EXT1 ttml 127.0.0.1:${vpnport}
http-proxy-option EXT1 Host: dl.music.189.cn / HTTP/1.1">yl1.ovpn
echo http-proxy $IPAddress 8080 >yl2.ovpn
echo '########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
'>yl3.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
">yl4.ovpn
cat yl1.ovpn yl2.ovpn yl3.ovpn yl4.ovpn>全国电信爱听.ovpn
rm -rf ./{yl1.ovpn,yl2.ovpn,yl3.ovpn,yl4.ovpn}

echo "# 天天免流配置
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########
remote ltetptv.189.com 80
http-proxy-option EXT1 GET http://dl.music.189.cn:9495/res/V/1388/mp3/33/58/94/1388335894003000.mp3?mb=15380197563&fs=10104163&s=800&n=&id=63696337&M=online&sid=240387514 HTTP/1.1
http-proxy-option EXT1 Host dl.music.189.cn:9495
http-proxy-option EXT1 POST http://iting.music.189.cn:9101/iting2/imusic/V2 HTTP/1.1">yl1.ovpn
echo http-proxy $IPAddress 8080 >yl2.ovpn
echo '########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
'>yl3.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
">yl4.ovpn
cat yl1.ovpn yl2.ovpn yl3.ovpn yl4.ovpn>全国电信特殊线路.ovpn
rm -rf ./{yl1.ovpn,yl2.ovpn,yl3.ovpn,yl4.ovpn}

echo "# 天天免流配置
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########
remote 123.206.43.23/flowfreecontent 80
http-proxy-option EXT1 ${wen}GET /flowfreecontent/${wen}
http-proxy-option EXT1 ${wen}Host：118.123.170.20${wen}
http-proxy $IPAddress 8080">yl1.ovpn
echo '########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
'>yl2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
">yl3.ovpn
cat yl1.ovpn yl2.ovpn yl3.ovpn>电信世纪龙.ovpn
rm -rf ./{yl1.ovpn,yl2.ovpn,yl3.ovpn}

echo "# 天天免流配置
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########
remote iting.music.189.cn 443
http-proxy $IPAddress 9101
http-proxy-option EXT1 ${wen}ttml 127.0.0.1:443${wen}
http-proxy-option EXT1 ${wen}POST /iting2/imusic/V2 HTTP/1.1${wen}
http-proxy-option EXT1 ${wen}Host: iting.music.189.cn:9101${wen} 
http-proxy-option EXT1 ${wen}Accept-Encoding: gzip,deflate${wen}
http-proxy-option EXT1 ${wen}Connection: Keep-Alive${wen}
http-proxy-option EXT1 ${wen}Content-Length: 416${wen}">yl1.ovpn
echo '########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
'>yl2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
">yl3.ovpn
cat yl1.ovpn yl2.ovpn yl3.ovpn>全国电信最新A.ovpn
rm -rf ./{yl1.ovpn,yl2.ovpn,yl3.ovpn}

echo "# 天天免流配置
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########
remote swordata.tv189.cn 80
http-proxy $IPAddress 10088
http-proxy-option EXT1 ${wen}ttml 127.0.0.1:443${wen}
http-proxy-option EXT1 ${wen}POST /rain/index.php?/rain/postActivityLog HTTP/1.1${wen}
http-proxy-option EXT1 ${wen}Host: swordata.tv189.cn:10088${wen}
http-proxy-option EXT1 ${wen}Content-Type: application/x-www-form-urlencoded${wen}
http-proxy-option EXT1 ${wen}User-Agent: Dalvik/1.6.0${wen}
http-proxy-option EXT1 ${wen}Connection: Keep-Alive${wen}">yl1.ovpn
echo '########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
'>yl2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
">yl3.ovpn
cat yl1.ovpn yl2.ovpn yl3.ovpn>全国电信最新B.ovpn
rm -rf ./{yl1.ovpn,yl2.ovpn,yl3.ovpn}

echo "# 天天免流配置
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########
remote res.mall.10010.cn 3389
http-proxy-option EXT1 ttml 127.0.0.1:443
http-proxy-option VERSION 1.1
http-proxy-option EXT1 Host: sales.wostore.cn:8081 /HTTP/1.1
http-proxy-option EXT1 Proxy-Connection: keep-alive
http-proxy-option EXT1 POST http://m.iread.wo.com.cn
http-proxy-option EXT1 Host: m.iread.wo.com.cn /HTTP/1.1
http-proxy-option EXT1 GET /mall/res/uploader/index/20160928174353294871760.jpg HTTP/1.1
http-proxy-option EXT1 Host: res.mall.10010.cn
http-proxy-option EXT1 X-Online-Host: wap.10010.com">yl1.ovpn
echo http-proxy $IPAddress 8080 >yl2.ovpn
echo '########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
'>yl3.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
">yl4.ovpn
cat yl1.ovpn yl2.ovpn yl3.ovpn yl4.ovpn>全国联通A.ovpn
rm -rf ./{yl1.ovpn,yl2.ovpn,yl3.ovpn,yl4.ovpn}

echo "# 天天免流配置
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########
remote m.client.10010.com 80
http-proxy-option EXT1 POST http://m.client.10010.com
http-proxy-option EXT1 ttml 127.0.0.1:${vpnport}
http-proxy-option EXT1 Host: m.client.10010.com / HTTP/1.1">yl1.ovpn
echo http-proxy $IPAddress 8080 >yl2.ovpn
echo '########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
'>yl3.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
">yl4.ovpn
cat yl1.ovpn yl2.ovpn yl3.ovpn yl4.ovpn>全国联通B.ovpn
rm -rf ./{yl1.ovpn,yl2.ovpn,yl3.ovpn,yl4.ovpn}

echo "# 天天免流配置
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########
remote uac.10010.com 443 tcp-client
http-proxy-option EXT1 ${wen}POST https://uac.10010.com${wen}
http-proxy-option EXT1 ${wen}Host uac.10010.com${wen}
http-proxy-option EXT1 ${wen}CONNECT uac.10010.com:443 HTTP/1.1${wen}
http-proxy-option EXT1 ${wen}Conneection：keep-alive${wen}
http-proxy-option EXT1 ${wen}Proxy-Conneection：keep-alive${wen}">yl1.ovpn
echo http-proxy $IPAddress 8080 >yl2.ovpn
echo '########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
'>yl3.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
">yl4.ovpn
cat yl1.ovpn yl2.ovpn yl3.ovpn yl4.ovpn>全国联通C.ovpn
rm -rf ./{yl1.ovpn,yl2.ovpn,yl3.ovpn,yl4.ovpn}

echo "# 天天免流配置
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########
remote wap.10010.com 80
http-proxy-option EXT1 POST http://uac.10010.com
http-proxy-option EXT1 Host: uac.10010.com / HTTP/1.1
http-proxy-option EXT1 [V]
[p_host1]X-Online-Host:uac.10010.com [H];
http-proxy-option EXT1 HTTPS:CONNECT /HTTP/1.1 HOST:443
http-proxy-option EXT1 Host: uac.10010.com">yl1.ovpn
echo http-proxy $IPAddress 8080 >yl2.ovpn
echo '########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
'>yl3.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
">yl4.ovpn
cat yl1.ovpn yl2.ovpn yl3.ovpn yl4.ovpn>全国联通D.ovpn
rm -rf ./{yl1.ovpn,yl2.ovpn,yl3.ovpn,yl4.ovpn}

echo "# 天天免流配置
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########
remote u.3gtv.net 80
http-proxy ${IPAddress} 8080
http-proxy-option EXT1 ttml 127.0.0.1:440">yl1.ovpn
echo '########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
'>yl2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
">yl3.ovpn
cat yl1.ovpn yl2.ovpn yl3.ovpn>广东联通.ovpn
rm -rf ./{yl1.ovpn,yl2.ovpn,yl3.ovpn}

echo "# 天天免流配置
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########
remote ${IPAddress}?uac.10010.com ${vpnport}
http-proxy-option EXT1 GET /oauth2/images/deskico.png HTTP/1.1
http-proxy-option EXT1 Host: uac.10010.com
http-proxy-option EXT1 Connection: keep-alive
http-proxy-option EXT1 Referer: https://uac.10010.com/oauth2/new_auth?display=wap&page_type=05&app_code=ECS-YH-WAP&redirect_uri=http://wap.10010.com/t/loginCallBack.htm&state=http://wap.10010.com/t/myunicom.htm&channel_code=113000001&real_ip=${IPAddress}
http-proxy 10.0.0.172 80">yl1.ovpn
echo '########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
'>yl2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
">yl3.ovpn
cat yl1.ovpn yl2.ovpn yl3.ovpn>全国联通wap.ovpn
rm -rf ./{yl1.ovpn,yl2.ovpn,yl3.ovpn}
echo;echo -e "\033[1;35线路生成完毕...\033[0m"
#线路部分  *****************************************************************************
#APP部分  ******************************************************************************
clear
echo;echo -e "\033[1;35m正在生成第一款云端APP软件...\033[0m"
cd /home
mkdir android >/dev/null 2>&1
chmod 777 /home/android
cd /home/android
echo;echo -e "\033[1;35m正在开始编译APP....\033[0m"
curl -O https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/ttmll/apktool.jar >/dev/null 2>&1 
curl -O https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/ttmll/h.apk >/dev/null 2>&1
java -jar apktool.jar d h.apk >/dev/null 2>&1
sed -i "s/127.0.0.1/${IPAddress}:${lkdk}/g" /home/android/h/smali/net/openvpn/openvpn/AutoScrollTextView.smali
sed -i "s/127.0.0.1/${IPAddress}:${lkdk}/g" /home/android/h/smali/net/openvpn/openvpn/ChongzhiActivity.smali
sed -i "s/127.0.0.1/${IPAddress}:${lkdk}/g" '/home/android/h/smali/net/openvpn/openvpn/DoActivity$3.smali'
sed -i "s/127.0.0.1/${IPAddress}:${lkdk}/g" /home/android/h/smali/net/openvpn/openvpn/MainActivity.smali
sed -i "s/127.0.0.1/${IPAddress}:${lkdk}/g" /home/android/h/smali/net/openvpn/openvpn/MainTabActivity.smali
sed -i "s/127.0.0.1/${IPAddress}:${lkdk}/g" /home/android/h/smali/net/openvpn/openvpn/OpenVPNClient.smali
sed -i "s/11893927/${zdyky}/g" /home/android/h/smali/net/openvpn/openvpn/ChongzhiActivity.smali
sed -i "s/11893927/${zdyky}/g" '/home/android/h/smali/net/openvpn/openvpn/DoActivity$3.smali'
sed -i "s/11893927/${zdyky}/g" /home/android/h/smali/net/openvpn/openvpn/MainActivity.smali
sed -i "s/11893927/${zdyky}/g" /home/android/h/smali/net/openvpn/openvpn/MainTabActivity.smali
sed -i "s/11893927/${zdyky}/g" /home/android/h/smali/net/openvpn/openvpn/OpenVPNClient.smali
sed -i "s/对接名字/${appname}/g" /home/android/h/res/values/strings.xml >/dev/null 2>&1
sed -i "s/对接客服/${appkf}/g" /home/android/h/res/values/strings.xml >/dev/null 2>&1
#sed -i "s/对接更新/'${gzxzdz}/g" /home/android/yl/res/values/strings.xml >/dev/null 2>&1
sudo chmod +x /home/android/apktool.jar
java -jar apktool.jar b h >/dev/null 2>&1
cd /home/android/h/dist
curl -O https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/ttmll/signer.zip >/dev/null 2>&1
unzip signer.zip >/dev/null 2>&1 
java -jar signapk.jar testkey.x509.pem testkey.pk8 h.apk hyun.apk
\cp -rf /home/android/h/dist/hyun.apk /home/云端A.apk
echo;echo -e "\033[1;31m第一款app制作完毕....\033[0m"  

echo;echo -e "\033[1;35m正在生成第二款云端APP软件...\033[0m"
rm -rf /home/android
cd /home
mkdir android >/dev/null 2>&1
chmod 777 /home/android
cd /home/android
echo;echo -e "\033[1;35m正在开始编译APP....\033[0m"
curl -O https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/ttmll/apktool.jar >/dev/null 2>&1
curl -O https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/ttmll/h1.apk >/dev/null 2>&1 
java -jar apktool.jar d h1.apk >/dev/null 2>&1
sed -i "s/127.0.0.1/${IPAddress}:${lkdk}/g" '/home/android/h1/smali/com/mayor/prg/mst$2.smali'
sed -i "s/127.0.0.1/${IPAddress}:${lkdk}/g" /home/android/h1/smali/net/openvpn/openvpn/AutoScrollTextView.smali
sed -i "s/127.0.0.1/${IPAddress}:${lkdk}/g" /home/android/h1/smali/net/openvpn/openvpn/ChongzhiActivity.smali
sed -i "s/127.0.0.1/${IPAddress}:${lkdk}/g" '/home/android/h1/smali/net/openvpn/openvpn/DoActivity$3.smali'
sed -i "s/127.0.0.1/${IPAddress}:${lkdk}/g" /home/android/h1/smali/net/openvpn/openvpn/MainActivity.smali
sed -i "s/127.0.0.1/${IPAddress}:${lkdk}/g" /home/android/h1/smali/net/openvpn/openvpn/MainTabActivity.smali
sed -i "s/127.0.0.1/${IPAddress}:${lkdk}/g" /home/android/h1/smali/net/openvpn/openvpn/OpenVPNClient.smali
sed -i "s/11893927/${zdyky}/g" /home/android/h1/smali/net/openvpn/openvpn/ChongzhiActivity.smali
sed -i "s/11893927/${zdyky}/g" '/home/android/h1/smali/net/openvpn/openvpn/DoActivity$3.smali'
sed -i "s/11893927/${zdyky}/g" /home/android/h1/smali/net/openvpn/openvpn/MainActivity.smali
sed -i "s/11893927/${zdyky}/g" /home/android/h1/smali/net/openvpn/openvpn/MainTabActivity.smali
sed -i "s/11893927/${zdyky}/g" /home/android/h1/smali/net/openvpn/openvpn/OpenVPNClient.smali
sed -i "s/对接名字/${appname}/g" /home/android/h1/res/values/strings.xml >/dev/null 2>&1
sed -i "s/对接客服/${appkf}/g" /home/android/h1/res/values/strings.xml >/dev/null 2>&1
sudo chmod +x /home/android/apktool.jar
java -jar apktool.jar b h1 >/dev/null 2>&1
cd /home/android/h1/dist
curl -O https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/ttmll/signer.zip >/dev/null 2>&1
unzip signer.zip >/dev/null 2>&1 
java -jar signapk.jar testkey.x509.pem testkey.pk8 h1.apk hyun1.apk
\cp -rf /home/android/h1/dist/hyun1.apk /home/云端B.apk
rm -rf /home/android
echo;echo -e "\033[1;31m第二款app制作完毕....\033[0m"  

echo;echo -e "\033[1;35m正在生成流量卫士APP软件...\033[0m"
rm -rf /home/android
cd /home
mkdir android
chmod 777 /home/android
cd /home/android
curl -O https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/ttmll/apktool.jar >/dev/null 2>&1  
curl -O https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/ttmll/llws5.1/llws5.1.apk >/dev/null 2>&1  
mv /home/android/llws5.1.apk /home/android/llws.apk
echo -e "\033[1;35m正在开始编译APP....\033[0m"
java -jar apktool.jar d llws.apk >/dev/null 2>&1
sed -i 's/127.0.0.1/'${IPAddress}:${lkdk}'/g' /home/android/llws/smali/net/openvpn/openvpn/base.smali
sed -i 's/0542fa6e2f2de6bb5f3a7813ded625ab/'$llwsmd5'/g' /home/android/llws/smali/net/openvpn/openvpn/base.smali >/dev/null 2>&1 
sed -i 's/127.0.0.1/'${IPAddress}:${lkdk}'/g' '/home/android/llws/smali/net/openvpn/openvpn/Main2Activity$MyListener$1.smali' 
sed -i 's/127.0.0.1/'${IPAddress}:${lkdk}'/g' '/home/android/llws/smali/net/openvpn/openvpn/Main2Activity$MyListener.smali' 
sed -i 's/127.0.0.1/'${IPAddress}:${lkdk}'/g' /home/android/llws/smali/net/openvpn/openvpn/MainActivity.smali 
sed -i 's/127.0.0.1/'${IPAddress}:${lkdk}'/g' '/home/android/llws/smali/net/openvpn/openvpn/OpenVPNClient$10.smali' 
sed -i 's/127.0.0.1/'${IPAddress}:${lkdk}'/g' '/home/android/llws/smali/net/openvpn/openvpn/OpenVPNClient$11.smali' 
sed -i 's/127.0.0.1/'${IPAddress}:${lkdk}'/g' '/home/android/llws/smali/net/openvpn/openvpn/OpenVPNClient$13.smali' 
sed -i 's/127.0.0.1/'${IPAddress}:${lkdk}'/g' /home/android/llws/smali/net/openvpn/openvpn/OpenVPNClient.smali 
sed -i 's/127.0.0.1/'${IPAddress}:${lkdk}'/g' '/home/android/llws/smali/net/openvpn/openvpn/splash$1$1.smali' 
sed -i 's/127.0.0.1/'${IPAddress}:${lkdk}'/g' '/home/android/llws/smali/net/openvpn/openvpn/splash$2.smali' 
sed -i 's/127.0.0.1/'${IPAddress}:${lkdk}'/g' '/home/android/llws/smali/net/openvpn/openvpn/update$myClick$1.smali' 
sed -i 's/对接名字/'${appname}'/g' /home/android/llws/res/values/strings.xml
sudo chmod +x /home/android/apktool.jar
java -jar apktool.jar b llws >/dev/null 2>&1
sleep 1
cd /home/android/llws/dist
curl -O https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/ttmll/signer.zip >/dev/null 2>&1 
unzip signer.zip >/dev/null 2>&1 
java -jar signapk.jar testkey.x509.pem testkey.pk8 llws.apk ll.apk
\cp -rf /home/android/llws/dist/ll.apk /home/流量卫士.apk
rm -rf /home/android
echo;echo -e "\033[1;31m流量卫士APP制作完毕....\033[0m"  
#APP部分  ******************************************************************************
#打包配置部分***************************************************************************
echo;echo -e "\033[1;34m正在打包配置文件.....\033[0m"
cd /home/
zip openvpn.zip ./{云端A.apk,云端B.apk,流量卫士.apk,udp137.ovpn,udp138.ovpn,全国限速修复.ovpn,全国咪咕138.ovpn,全国移动A.ovpn,全国移动B.ovpn,全国移动C.ovpn,全国咪咕移动.ovpn,移动浙江.ovpn,移动河南不限速.ovpn,广东移动.ovpn,最新全国移动A.ovpn,最新全国移动B.ovpn,四川移动A.ovpn,四川移动B.ovpn,深圳移动.ovpn,江西移动A.ovpn,江西移动B.ovpn,陕西移动A.ovpn,陕西移动B.ovpn,陕西移动C.ovpn,浙江移动136.ovpn,河南移动.ovpn,全国移动80.ovpn,甘肃移动8080.ovpn,甘肃移动A.ovpn,广东移动A.ovpn,广东移动B.ovpn,广西移动A.ovpn,广发证券.ovpn,常规模式.ovpn,全国电信A.ovpn,全国电信爱玩.ovpn,全国电信爱听.ovpn,全国电信爱看.ovpn,全国电信特殊线路.ovpn,电信世纪龙.ovpn,全国电信最新A.ovpn,全国电信最新B.ovpn,全国联通A.ovpn,全国联通B.ovpn,全国联通C.ovpn,全国联通D.ovpn,全国联通wap.ovpn,广东联通.ovpn,联通大王卡.ovpn} >/dev/null 2>&1
cp /home/openvpn.zip /var/www/html/openvpn.zip
rm -rf /home/*.ovpn
echo;echo -e "\033[1;34m配置文件打包完毕.....\033[0m"
#打包配置部分***************************************************************************
#移动线路集成***************************************************************************
echo;echo -e "\033[1;34m正在集成云端APP线路和流量卫士线路.....\033[0m"
cd /home;mkdir ttml
\cp /home/openvpn.zip /home/ttml/ttml.zip
chmod -R 777 /home/ttml/;cd /home/ttml/;unzip ttml.zip >/dev/null 2>&1
xianlu=$(cat /home/ttml/udp137.ovpn)
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;insert into lyj_article(category_id,title,content) values('1','udp137','${xianlu}')"
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;INSERT INTO line values(1,'udp137','${xianlu}','UDP线路',1,1,'移动','${ttime}')"
xianlu=$(cat /home/ttml/udp138.ovpn)
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;insert into lyj_article(category_id,title,content) values('1','udp138','${xianlu}')"
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;INSERT INTO line values(2,'udp138','${xianlu}','UDP线路',1,1,'移动','${ttime}')"
xianlu=$(cat /home/ttml/全国限速修复.ovpn)
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;insert into lyj_article(category_id,title,content) values('1','全国限速修复','${xianlu}')"
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;INSERT INTO line values(3,'全国限速修复','${xianlu}','TCP线路',1,1,'移动','${ttime}')"
xianlu=$(cat /home/ttml/全国咪咕138.ovpn)
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;insert into lyj_article(category_id,title,content) values('1','全国咪咕138','${xianlu}')"
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;INSERT INTO line values(4,'全国咪咕138','${xianlu}','TCP线路',1,1,'移动','${ttime}')"
xianlu=$(cat /home/ttml/全国移动B.ovpn)
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;insert into lyj_article(category_id,title,content) values('1','全国移动B','${xianlu}')"
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;INSERT INTO line values(5,'全国移动B','${xianlu}','TCP线路',1,1,'移动','${ttime}')"
xianlu=$(cat /home/ttml/全国咪咕移动.ovpn)
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;insert into lyj_article(category_id,title,content) values('1','全国咪咕移动','${xianlu}')"
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;INSERT INTO line values(6,'全国咪咕移动','${xianlu}','TCP线路',1,1,'移动','${ttime}')"
xianlu=$(cat /home/ttml/移动浙江.ovpn)
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;insert into lyj_article(category_id,title,content) values('1','移动浙江','${xianlu}')"
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;INSERT INTO line values(7,'移动浙江','${xianlu}','TCP线路',1,1,'移动','${ttime}')"
xianlu=$(cat /home/ttml/移动河南不限速.ovpn)
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;insert into lyj_article(category_id,title,content) values('1','移动河南不限速','${xianlu}')"
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;INSERT INTO line values(8,'移动河南不限速','${xianlu}','TCP线路',1,1,'移动','${ttime}')"
xianlu=$(cat /home/ttml/广东移动.ovpn)
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;insert into lyj_article(category_id,title,content) values('1','广东移动','${xianlu}')"
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;INSERT INTO line values(9,'广东移动','${xianlu}','TCP线路',1,1,'移动','${ttime}')"
xianlu=$(cat /home/ttml/最新全国移动A.ovpn)
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;insert into lyj_article(category_id,title,content) values('1','最新全国移动A','${xianlu}')"
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;INSERT INTO line values(10,'最新全国移动A','${xianlu}','TCP线路',1,1,'移动','${ttime}')"
xianlu=$(cat /home/ttml/最新全国移动B.ovpn)
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;insert into lyj_article(category_id,title,content) values('1','最新全国移动B','${xianlu}')"
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;INSERT INTO line values(11,'最新全国移动B','${xianlu}','TCP线路',1,1,'移动','${ttime}')"
xianlu=$(cat /home/ttml/全国移动C.ovpn)
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;insert into lyj_article(category_id,title,content) values('1','全国移动C','${xianlu}')"
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;INSERT INTO line values(12,'全国移动C','${xianlu}','TCP线路',1,1,'移动','${ttime}')"
xianlu=$(cat /home/ttml/四川移动A.ovpn)
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;insert into lyj_article(category_id,title,content) values('1','四川移动A','${xianlu}')"
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;INSERT INTO line values(13,'四川移动A','${xianlu}','TCP线路',1,1,'移动','${ttime}')"
xianlu=$(cat /home/ttml/四川移动B.ovpn)
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;insert into lyj_article(category_id,title,content) values('1','四川移动B','${xianlu}')"
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;INSERT INTO line values(14,'四川移动B','${xianlu}','TCP线路',1,1,'移动','${ttime}')"
xianlu=$(cat /home/ttml/深圳移动.ovpn)
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;insert into lyj_article(category_id,title,content) values('1','深圳移动','${xianlu}')"
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;INSERT INTO line values(15,'深圳移动','${xianlu}','TCP线路',1,1,'移动','${ttime}')"
xianlu=$(cat /home/ttml/全国移动A.ovpn)
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;insert into lyj_article(category_id,title,content) values('1','全国移动A','${xianlu}')"
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;INSERT INTO line values(16,'全国移动A','${xianlu}','TCP线路',1,1,'移动','${ttime}')"
xianlu=$(cat /home/ttml/江西移动A.ovpn)
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;insert into lyj_article(category_id,title,content) values('1','江西移动A','${xianlu}')"
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;INSERT INTO line values(17,'江西移动A','${xianlu}','TCP线路',1,1,'移动','${ttime}')"
xianlu=$(cat /home/ttml/江西移动B.ovpn)
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;insert into lyj_article(category_id,title,content) values('1','江西移动B','${xianlu}')"
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;INSERT INTO line values(18,'江西移动B','${xianlu}','TCP线路',1,1,'移动','${ttime}')"
xianlu=$(cat /home/ttml/陕西移动A.ovpn)
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;insert into lyj_article(category_id,title,content) values('1','陕西移动A','${xianlu}')"
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;INSERT INTO line values(19,'陕西移动A','${xianlu}','TCP线路',1,1,'移动','${ttime}')"
xianlu=$(cat /home/ttml/陕西移动B.ovpn)
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;insert into lyj_article(category_id,title,content) values('1','陕西移动B','${xianlu}')"
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;INSERT INTO line values(20,'陕西移动B','${xianlu}','TCP线路',1,1,'移动','${ttime}')"
xianlu=$(cat /home/ttml/陕西移动C.ovpn)
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;insert into lyj_article(category_id,title,content) values('1','陕西移动C','${xianlu}')"
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;INSERT INTO line values(21,'陕西移动C','${xianlu}','TCP线路',1,1,'移动','${ttime}')"
xianlu=$(cat /home/ttml/浙江移动136.ovpn)
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;insert into lyj_article(category_id,title,content) values('1','浙江移动136','${xianlu}')"
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;INSERT INTO line values(22,'浙江移动136','${xianlu}','TCP线路',1,1,'移动','${ttime}')"
xianlu=$(cat /home/ttml/河南移动.ovpn)
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;insert into lyj_article(category_id,title,content) values('1','河南移动','${xianlu}')"
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;INSERT INTO line values(23,'河南移动','${xianlu}','TCP线路',1,1,'移动','${ttime}')"
xianlu=$(cat /home/ttml/甘肃移动8080.ovpn)
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;insert into lyj_article(category_id,title,content) values('1','甘肃移动8080','${xianlu}')"
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;INSERT INTO line values(25,'甘肃移动8080','${xianlu}','TCP线路',1,1,'移动','${ttime}')"
xianlu=$(cat /home/ttml/甘肃移动A.ovpn)
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;insert into lyj_article(category_id,title,content) values('1','甘肃移动A','${xianlu}')"
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;INSERT INTO line values(26,'甘肃移动A','${xianlu}','TCP线路',1,1,'移动','${ttime}')"
if [[ $lkdk != 80 ]];then
xianlu=$(cat /home/ttml/全国移动80.ovpn)
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;insert into lyj_article(category_id,title,content) values('1','全国移动80','${xianlu}')"
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;INSERT INTO line values(24,'全国移动80','${xianlu}','TCP线路',1,1,'移动','${ttime}')"
xianlu=$(cat /home/ttml/常规模式.ovpn)
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;insert into lyj_article(category_id,title,content) values('1','常规模式','${xianlu}')"
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;INSERT INTO line values(28,'常规模式','${xianlu}','TCP线路',1,1,'移动','${ttime}')"
fi
xianlu=$(cat /home/ttml/广发证券.ovpn)
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;insert into lyj_article(category_id,title,content) values('1','广发证券','${xianlu}')"
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;INSERT INTO line values(29,'广发证券','${xianlu}','TCP线路',1,1,'移动','${ttime}')"
xianlu=$(cat /home/ttml/广东移动A.ovpn)
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;insert into lyj_article(category_id,title,content) values('1','广东移动A','${xianlu}')"
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;INSERT INTO line values(30,'广东移动A','${xianlu}','TCP线路',1,1,'移动','${ttime}')"
xianlu=$(cat /home/ttml/广东移动B.ovpn)
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;insert into lyj_article(category_id,title,content) values('1','广东移动B','${xianlu}')"
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;INSERT INTO line values(31,'广东移动B','${xianlu}','TCP线路',1,1,'移动','${ttime}')"
xianlu=$(cat /home/ttml/广西移动A.ovpn)
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;insert into lyj_article(category_id,title,content) values('1','广西移动A','${xianlu}')"
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;INSERT INTO line values(32,'广西移动A','${xianlu}','TCP线路',1,1,'移动','${ttime}')"
#移动线路集成*************************************************************************** 
#电信线路集成*************************************************************************** 
xianlu=$(cat /home/ttml/全国电信A.ovpn)
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;insert into lyj_article(category_id,title,content) values('3','全国电信A','${xianlu}')"
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;INSERT INTO line values(33,'全国电信A','${xianlu}','TCP线路',2,1,'电信','${ttime}')"
xianlu=$(cat /home/ttml/全国电信爱玩.ovpn)
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;insert into lyj_article(category_id,title,content) values('3','全国电信爱玩','${xianlu}')"
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;INSERT INTO line values(35,'全国电信爱玩','${xianlu}','TCP线路',2,1,'电信','${ttime}')"
xianlu=$(cat /home/ttml/全国电信爱看.ovpn)
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;insert into lyj_article(category_id,title,content) values('3','全国电信爱看','${xianlu}')"
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;INSERT INTO line values(36,'全国电信爱看','${xianlu}','TCP线路',2,1,'电信','${ttime}')"
xianlu=$(cat /home/ttml/全国电信爱听.ovpn)
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;insert into lyj_article(category_id,title,content) values('3','全国电信爱听','${xianlu}')"
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;INSERT INTO line values(37,'全国电信爱听','${xianlu}','TCP线路',2,1,'电信','${ttime}')"
xianlu=$(cat /home/ttml/全国电信特殊线路.ovpn)
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;insert into lyj_article(category_id,title,content) values('3','全国电信特殊线路','${xianlu}')"
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;INSERT INTO line values(38,'全国电信特殊线路','${xianlu}','TCP线路',2,1,'电信','${ttime}')"
xianlu=$(cat /home/ttml/电信世纪龙.ovpn)
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;insert into lyj_article(category_id,title,content) values('3','电信世纪龙','${xianlu}')"
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;INSERT INTO line values(39,'电信世纪龙','${xianlu}','TCP线路',2,1,'电信','${ttime}')"
xianlu=$(cat /home/ttml/全国电信最新A.ovpn)
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;insert into lyj_article(category_id,title,content) values('3','全国电信最新A','${xianlu}')"
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;INSERT INTO line values(40,'全国电信最新A','${xianlu}','TCP线路',2,1,'电信','${ttime}')"
xianlu=$(cat /home/ttml/全国电信最新B.ovpn)
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;insert into lyj_article(category_id,title,content) values('3','全国电信最新B','${xianlu}')"
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;INSERT INTO line values(41,'全国电信最新B','${xianlu}','TCP线路',2,1,'电信','${ttime}')"
#电信线路集成***************************************************************************
#联通线路集成***************************************************************************
xianlu=$(cat /home/ttml/全国联通A.ovpn)
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;insert into lyj_article(category_id,title,content) values('2','全国联通A','${xianlu}')"
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;INSERT INTO line values(42,'全国联通A','${xianlu}','TCP线路',3,1,'联通','${ttime}')"
xianlu=$(cat /home/ttml/全国联通B.ovpn)
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;insert into lyj_article(category_id,title,content) values('2','全国联通B','${xianlu}')"
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;INSERT INTO line values(43,'全国联通B','${xianlu}','TCP线路',3,1,'联通','${ttime}')"
xianlu=$(cat /home/ttml/全国联通C.ovpn)
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;insert into lyj_article(category_id,title,content) values('2','全国联通C','${xianlu}')"
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;INSERT INTO line values(44,'全国联通C','${xianlu}','TCP线路',3,1,'联通','${ttime}')"
xianlu=$(cat /home/ttml/全国联通D.ovpn)
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;insert into lyj_article(category_id,title,content) values('2','全国联通D','${xianlu}')"
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;INSERT INTO line values(45,'全国联通D','${xianlu}','TCP线路',3,1,'联通','${ttime}')"
xianlu=$(cat /home/ttml/广东联通.ovpn)
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;insert into lyj_article(category_id,title,content) values('2','广东联通','${xianlu}')"
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;INSERT INTO line values(48,'广东联通','${xianlu}','TCP线路',3,1,'联通','${ttime}')"
xianlu=$(cat /home/ttml/全国联通wap.ovpn)
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;insert into lyj_article(category_id,title,content) values('2','全国联通wap','${xianlu}')"
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;INSERT INTO line values(49,'全国联通wap','${xianlu}','TCP线路',3,1,'联通','${ttime}')"
xianlu=$(cat /home/ttml/联通大王卡.ovpn)
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;insert into lyj_article(category_id,title,content) values('2','联通大王卡','${xianlu}')"
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;INSERT INTO line values(50,'联通大王卡','${xianlu}','TCP线路',3,1,'联通','${ttime}')"
#联通线路集成*************************************************************************** 
echo;echo -e "\033[1;34m云端APP线路和流量卫士线路集成完毕.....\033[0m"
#结尾部分*******************************************************************************
rm -rf /home/ttml
clear
vpn
clear
cd /home
rm -rf /home/sm.txt
echo '《欢迎使用天天OPENVPN云免快速安装脚本》' >>sm.txt
echo "
-------------------------------------------------------------
前台/用户中心：http://${IPAddress}:${lkdk}
后台管理系统： http://${IPAddress}:${lkdk}/admin
代理中心：     http://${IPAddress}:${lkdk}/daili
云端地址：     http://${IPAddress}:${lkdk}/remote/smhoud.php
流量卫士地址： http://${IPAddress}:${lkdk}/app_api
数据库后台：   http://${IPAddress}:${lkdk}/phpmyadmin 
-------------------------------------------------------------

-------------------------------------------------------------
您的数据库用户名：root 数据库密码：${MySQLPass}
后台管理员用户名：admin 管理密码：admin
云端管理员用户名：admin 管理密码：admin
流量卫士管理员用户名：admin 管理密码：admin
请尽快到后台改密码............................
你的云端key为：${zdyky}
流量卫士key为：$llwsmd5
重启命令vpn
-------------------------------------------------------------

-------------------------------------------------------------
后台管理系统目录:/var/www/html/admin/
前台代理中心目录:/var/www/html/dali/
前台用户中心目录:/var/www/html/user/
云端管理中心目录:/var/www/html/remote/
流量卫士中心目录:/var/www/html/app_api/
-------------------------------------------------------------
">>sm.txt
echo -e "\033[1;35m==========================================================================\033[0m"
echo;cat sm.txt
echo;echo -e "\033[1;33m配置文件下载链接：\033[0m"
echo;echo -n -e "\033[1;33mhttp://$IPAddress:$lkdk/openvpn.zip\033[0m"
echo;echo -e "\033[1;35m==========================================================================\033[0m"
echo
echo -e "\033[1;35m==========================================================================\033[0m"
echo -e "\033[1;33m     **感谢*****使用*******  天天免流   ****一键********脚本**            \033[0m"
echo -e "\033[1;34m     ************************温馨提示*************************            \033[0m"
echo -e "\033[1;33m     ******为了您服务器的稳定和安全，请勿非法破解改程序*******            \033[0m"
echo -e "\033[1;34m     **********支持正版********************远离盗版***********            \033[0m"
echo -e "\033[1;33m     **********支持正版********************远离盗版***********		     \033[0m"
echo -e "\033[1;34m     **********************  天天免流   **********************            \033[0m"
echo -e "\033[1;35m==========================================================================\033[0m"
exit 0;
return 1
}
#结尾部分*******************************************************************************
#在线更新部分 **************************************************************************
function zaixian(){
clear
echo -e "\033[1;35m==========================================================================\033[0m"
echo -e "\033[1;33m     **欢迎*****使用*******  天天免流   ****更新********脚本**            \033[0m"
echo -e "\033[1;34m     ************************温馨提示*************************            \033[0m"
echo -e "\033[1;33m     ******为了您服务器的稳定和安全，请勿非法破解改程序*******            \033[0m"
echo -e "\033[1;34m     **********支持正版********************远离盗版***********            \033[0m"
echo -e "\033[1;33m     **********支持正版********************远离盗版***********		     \033[0m"
echo -e "\033[1;34m     ********************天天一键更新脚本*********************            \033[0m"
echo -e "\033[1;35m==========================================================================\033[0m"
echo;echo -e "\033[1;32m本机ip：$IPAddress\033[0m"
echo;echo -n -e "\033[1;36m请输入你服务器的数据库密码：\033[0m"
read MySQLPass
if [ -z $MySQLPass ]
then
echo;echo -e "\033[1;36m服务器的数据库密码不能为空,请重新输入：\033[0m"
read MySQLPass
fi
echo;echo -e "\033[1;35m你输入的服务器数据库密码为：$MySQLPass\033[0m"

echo;echo -n -e "\033[1;36m请输入你服务器的流控端口：\033[0m"
read lkdk
if [ -z $lkdk ]
then
echo;echo -e "\033[1;36m服务器的流控端口不能为空,请重新输入：\033[0m"
read lkdk
fi
echo;echo -e "\033[1;35m你输入的服务器流控端口为：$lkdk\033[0m"

echo;echo -n -e "\033[1;36m请设置新的APP对接KEY（回车默认11893927）：\033[0m"
read zdyky
if [ -z $zdyky ]
then
echo;echo -e "\033[1;35mAPP对接KEY为：\033[0m\033[1;32m11893927\033[0m"
zdyky=11893927
else
echo;echo -e "\033[1;35mAPP对接KEY为：\033[0m\033[1;32m$zdyky\033[0m"
fi

echo;echo -n -e "\033[1;36m请设置新的实时监控频率（回车默认15秒）：\033[0m"
read jkpl
if [ -z $jkpl ]
then
echo;echo -e "\033[1;35m实时监控频率：\033[0m\033[1;32m15秒\033[0m"
jkpl=15
else
echo;echo -e "\033[1;35m实时监控频率：\033[0m\033[1;32m$jkpl秒\033[0m"
fi

echo;echo -n -e "\033[1;36m请设置新的数据备份频率（回车默认21600秒）：\033[0m"
read bfpl
if [ -z $bfpl ]
then
echo;echo -e "\033[1;35m数据备份频率：\033[0m\033[1;32m15秒\033[0m"
bfpl=21600
else
echo;echo -e "\033[1;35m数据备份频率：\033[0m\033[1;32m$bfpl秒\033[0m"
fi

echo;echo -n -e "\033[1;36m是否安装网页phpMyAdmin? 1.安装 2.不安装（回车默认安装）：\033[0m"
read phpMyAdmin
if [ -z $phpMyAdmin ]
then
echo -e "\033[1;35m数据库管理：\033[0m\033[1;32m安装\033[0m"
phpMyAdmin=1
else
if [[ $phpMyAdmin == 1 ]]
then
echo -e "\033[1;35m数据库管理：\033[0m\033[1;32m安装\033[0m"
phpMyAdmin=1
fi
if [[ $phpMyAdmin == 2 ]]
then
echo -e "\033[1;35m数据库管理：\033[0m\033[1;32m不安装phpMyAdmin\033[0m"
phpMyAdmin=2
fi
fi

#备份数据   ****************************************************************************
echo;echo -e "\033[1;36m正在尝试备份用户/卡密等资料...\033[0m"
mkdir -p /home/ssbf
mysqldump -uroot -p$MySQLPass ov openvpn >/home/ssbf/user.sql
mysqldump -uroot -p$MySQLPass ov auth_kms >/home/ssbf/kms.sql
mysqldump -uroot -p$MySQLPass ov lyj_article >/home/ssbf/ydxl.sql
mysqldump -uroot -p$MySQLPass ov line >/home/ssbf/wsxl.sql
mysqldump -uroot -p$MySQLPass ov >/home/ssbf/ov.sql
if [ ! -f "/home/ssbf/user.sql" ]; then
echo -e "\033[1;31m用户数据备份失败\033[0m"
echo -e "\033[1;31m正在结束更新程序,强烈建议你自己备份好数据文件,重装系统,搭建全新的..\033[0m"
exit 0
elif [ ! -f "/home/ssbf/kms.sql" ]; then
echo -e "\033[1;31m卡密数据备份失败\033[0m"
echo -e "\033[1;31m正在结束更新程序,强烈建议你自己备份好数据文件,重装系统,搭建全新的..\033[0m"
exit 0
elif [ ! -f "/home/ssbf/ydxl.sql" ]; then
echo -e "\033[1;31m云端线路数据备份失败\033[0m"
echo -e "\033[1;31m正在结束更新程序,强烈建议你自己备份好数据文件,重装系统,搭建全新的..\033[0m"
exit 0
elif [ ! -f "/home/ssbf/wsxl.sql" ]; then
echo -e "\033[1;31m流量卫士线路数据备份失败\033[0m"
echo -e "\033[1;31m正在结束更新程序,强烈建议你自己备份好数据文件,重装系统,搭建全新的..\033[0m"
exit 0
elif [ ! -f "/home/ssbf/ov.sql" ]; then
echo -e "\033[1;31m数据备份失败\033[0m"
echo -e "\033[1;31m正在结束更新程序,强烈建议你自己备份好数据文件,重装系统,搭建全新的..\033[0m"
exit 0
else
echo;echo -e "\033[1;32m用户数据备份成功\033[0m"
fi
#备份数据   ****************************************************************************
#清理数据   ****************************************************************************
echo;echo -e "\033[1;36m正在为你删除旧的数据库数据....\033[0m"
mysql -hlocalhost -uroot -p$MySQLPass -e "DROP DATABASE ov"
echo;echo -e "\033[1;35m旧的数据库数据删除完毕....\033[0m"
echo;echo -e "\033[1;36m正在为你清理旧的流控并安装新的流控....\033[0m"
rm -rf /var/www/html/*
echo;echo -e "\033[1;35m旧的流控清理完毕....\033[0m"
#清理数据   ****************************************************************************
#安装流控   ****************************************************************************
echo;echo -e "\033[1;36m请稍等，正在安装WEB面板....\033[0m"
cd /var/www/html
curl -O https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/ttmll/xbb.zip >/dev/null 2>&1
unzip xbb.zip >/dev/null 2>&1
sed -i '85s/IPAddress:88/'${IPAddress}:${lkdk}'/g' /var/www/html/app.sql
sed -i '132s/11893927/'${zdyky}'/g' /var/www/html/app.sql
sed -i '113s/127.0.0.1:88/'${IPAddress}:${lkdk}'/g' /var/www/html/ov.sql
mysql -uroot -p$MySQLPass -e"CREATE DATABASE ov;"
mysql -uroot -p$MySQLPass ov < app.sql
mysql -uroot -p$MySQLPass ov < ov.sql
rm -rf app.sql ov.sql
sed -i "s/MySQLPass/$MySQLPass/g" /var/www/html/config.php 
sed -i "s/MySQLPass/$MySQLPass/g" /var/www/html/remote/config.php 
sed -i "s/127.0.0.1/${IPAddress}:${lkdk}/g" /var/www/html/remote/config.php 
rm -rf xbb.zip
cp /home/openvpn.zip /var/www/html/openvpn.zip
chmod -R 0777 /var/www/html/
echo;echo -e "\033[1;35mWEB面板安装完毕....\033[0m"
#安装流控   ****************************************************************************
llwsmd5=`echo -n $zdyky|md5sum`
#安装卫士   ****************************************************************************
echo;echo -e "\033[1;36m正在安装流量卫士云端数据，请稍等....\033[0m"
cd /var/www/html/app_api/
rm -rf /var/www/html/app_api/licences.key
echo "$llwsmd5" >/var/www/html/app_api/licences.key
sed -i '5s/huabai520/'$MySQLPass'/g' /var/www/html/app_api/config.php
mysql -uroot -p$MySQLPass ov < ov.sql >/dev/null 2>&1
chmod -R 777 /var/www/html/app_api/
echo;echo -e "\033[1;35m流量卫士云端数据安装完毕.....\033[0m"
#安装卫士   ****************************************************************************
#安装监控   ****************************************************************************
echo;echo -e "\033[1;36m正在安装实时监控....\033[0m"
yum install -y crontabs >/dev/null 2>&1
mkdir -p /var/spool/cron/ 
chmod 777 /var/www/html/cron.php 
echo "* * * * * curl --silent --compressed http://${IPAddress}:${lkdk}/cron.php">>/var/spool/cron/root
systemctl restart crond.service >/dev/null 2>&1   
systemctl enable crond.service >/dev/null 2>&1
#TCP监控
cd /var/www/html/res
sed -i "5s/admin/$MySQLPass/" /var/www/html/res/jiankong
sed -i "9s/60/$jkpl/" /var/www/html/res/jiankong
chmod +x /var/www/html/res/jiankong
chmod +x /var/www/html/res/kill.sh
/var/www/html/res/jiankong >>/var/www/html/res/jiankong.log 2>&1 &
echo "/var/www/html/res/jiankong >>/var/www/html/res/jiankong.log 2>&1 &">>/etc/rc.local
#UDP监控
cd /var/www/html/udp
sed -i "5s/admin/$MySQLPass/" /var/www/html/udp/jiankong
sed -i "9s/60/$jkpl/" /var/www/html/udp/jiankong
chmod +x /var/www/html/udp/jiankong
chmod +x /var/www/html/udp/kill.sh
/var/www/html/udp/jiankong >>/var/www/html/udp/jiankong.log 2>&1 &
echo "/var/www/html/udp/jiankong >>/var/www/html/udp/jiankong.log 2>&1 &">>/etc/rcl.local
echo;echo -e "\033[1;35m实时监控安装完毕....\033[0m"
#安装监控   ****************************************************************************
#数据备份   ****************************************************************************
echo;echo -e "\033[1;36m正在安装定时数据备份....\033[0m"
cd /var/www/html/ssbf
sed -i "7s/admin/$MySQLPass/" /var/www/html/ssbf/sql.sh
sed -i "9s/21600/$bfpl/" /var/www/html/ssbf/sql.sh
chmod 777 sql.sh
/var/www/html/ssbf/sql.sh >>/var/www/html/ssbf/bf.log 2>&1 &
echo "/var/www/html/ssbf/sql.sh >>/var/www/html/ssbf/bf.log 2>&1 &">>/etc/rcl.local
echo;echo -e "\033[1;35m定时数据备份安装完毕....\033[0m"
#数据备份   ****************************************************************************
#安装网页数据库*************************************************************************
if [[ $phpMyAdmin == 1 ]]
then
echo;echo -e "\033[1;36m正在安装网页数据库......\033[0m"
cd /var/www/html
curl -O https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/ttmll/phpMyAdmin.zip >/dev/null 2>&1
unzip phpMyAdmin.zip >/dev/null 2>&1
rm -rf phpMyAdmin.zip
echo;echo -e "\033[1;35m网页数据库安装完毕....\033[0m"
fi
#安装网页数据库*************************************************************************
#最新登录   ****************************************************************************
echo;echo -e "\033[1;36m正在安装防删库登录....\033[0m"
rm -rf /etc/openvpn/disconnect.sh 
rm -rf /etc/openvpn/login.sh
rm -rf /etc/openvpn/connect.sh
cd /etc/openvpn
curl -O https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/ttmll/denglu.zip >/dev/null 2>&1
unzip denglu.zip >/dev/null 2>&1
rm -rf /etc/openvpn/denglu.zip
sed -i "7s/admin/$MySQLPass/g" /etc/openvpn/login.sh
sed -i "7s/admin/$MySQLPass/g" /etc/openvpn/disconnect.sh 
sed -i "47s/127.0.0.1/${IPAddress}:${lkdk}/g" /etc/openvpn/disconnect.sh 
chmod 777 /etc/openvpn/disconnect.sh
chmod 777 /etc/openvpn/login.sh
chmod 777 /etc/openvpn/connect.sh
chmod -R 777 /etc/openvpn/
echo;echo -e "\033[1;35m防删库登录安装完毕....\033[0m"
#最新登录   ****************************************************************************
#清理数据   ****************************************************************************
echo;echo -e "\033[1;36m正在清理数据库....\033[0m"
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;DROP TABLE openvpn"
mysql -hlocalhost -uroot -p$MySQLPass -e "use ov;DROP TABLE auth_kms"
echo;echo -e "\033[1;36m数据库清理完毕....\033[0m"
#清理数据   ****************************************************************************
#导入数据   ****************************************************************************
echo;echo -e "\033[1;36m正在为你导入你的数据库信息....\033[0m"
mysql -uroot -p$MySQLPass ov < /home/ssbf/user.sql
mysql -uroot -p$MySQLPass ov < /home/ssbf/kms.sql
mysql -uroot -p$MySQLPass ov < /home/ssbf/ydxl.sql
mysql -uroot -p$MySQLPass ov < /home/ssbf/wsxl.sql
vpn
echo;echo -e "\033[1;35m你的数据库信息导入完毕....\033[0m"
echo;echo -e "\033[1;33m温馨提示：如果你发现用户数据导入不对,请到服务器/home/ssbf/文件夹下下载ov.sql文件自己导入\033[0m"
echo;echo -e "\033[1;34m恭喜你，流控升级完毕...\033[0m"
echo;echo -e "\033[1;34m感谢使用天天流控升级脚本,尽情的奔放去吧...\033[0m"
exit 0
return 1
}
#在线更新部分 **************************************************************************
#对接负载部分 **************************************************************************
function duijie(){
clear
echo;echo -e "温馨提示：\033[35m两台服务器必须都已安装花白流控,并能正常运行和链接服务器\033[0m"
echo -e "温馨提示：\033[35m且数据库账号-密码-端口-管理员账号-密码 需保持一致！\033[0m"
echo;echo -e "\033[1;32m> 请选择安装模式：\033[0m"
echo;echo -e "\033[1;33m> 1.一键配置主服务器（配置负载均衡总服务器）\033[0m"
echo;echo -e "\033[1;34m> 2.一键配置副服务器（配置负载均衡副服务器）\033[0m"
echo;echo -n "请输入你要安装的服务选项: "
read fuzhai
if [ -z $fuzhai ]
then
echo -n "输入错误，请重新输入你要安装的服务选项:"
read fuzhai
fi

if [[ $fuzhai == "1" ]]
then
echo;echo -ne "\033[33m请输入主服务器的数据库密码：\033[0m"
read LCMUWORD
if [ -z $LCMUWORD ]
then
echo -ne "\033[33m密码不能为空，请重新输入：\033[0m"
read LCMUWORD
fi
echo;echo "正在处理你的配置...."
sleep 3
echo;echo "您保存的配置如下："
echo "主服务器数据库密码:$LCMUWORD"
echo;echo -e "\033[31m注意：\033[0m\033[35m \033[0m"
echo -e "\033[33m如信息无误请回车开始配置.\033[0m"
echo -e "\033[33m如果信息有错请按 Ctrl + c 键结束对接，并重新执行对接脚本！\033[0m"
echo -e "\033[35m回车开始执行配置 >>>\033[0m"
read
clear
echo "正在配置数据 请稍等..."
echo ">>"
sleep 1
echo ">>>>"
sleep 2
echo ">>>>>>>"
sleep 3
echo ">>>>>>>>>>"
sleep 4
echo -e '>>>>>>>>>>>>>        [\033[32m  OK  \033[0m]'
mysql -hlocalhost -uroot -p$LCMUWORD --default-character-set=utf8<<EOF
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%'IDENTIFIED BY '${LCMUWORD}' WITH GRANT OPTION;
flush privileges;
EOF
iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 3306 -j ACCEPT >/dev/null 2>&1
vpn >/dev/null 2>&1
echo;echo -e "\033[32m配置完成!\033[0m"
echo -e "\033[32m感谢您使用天天免流一键负载程序\033[0m"
echo -e "\033[33m请继续配置子服务器...\033[0m"
exit 0;
fi

if [[ $fuzhai == "2" ]]
then
echo "请提供主服务器和副服务器信息:"
echo;echo -ne "\033[36m请输入主服务器的IP地址：\033[0m"
read LCMUIP
if [ -z $LCMUIP ]
then
echo -ne "主服务器的IP不能为空，请重新输入主服务器的IP地址："
echo "主服务器地址：$LCMUIP"
fi

echo -ne "\033[33m请输入主服务器的数据库密码：\033[0m"
read LCMUWORD
if [ -z $LCMUWORD ]
then
echo -ne "\033[33m密码不能为空，请重新输入：\033[0m"
read LCMUWORD
fi 

echo -ne "\033[33m请输入副服务器的数据库密码：\033[0m"
read LCZIWORD
if [ -z $LCZIWORD ]
then
echo -ne "\033[33m密码不能为空，请重新输入：\033[0m"
read LCZIWORD
fi

echo;echo "正在处理你的配置...."
sleep 3
echo;echo "您保存的配置如下："
echo "主服务器IP:$LCMUIP"
echo "主服务器数据库密码:$LCMUWORD"
echo "副服务器的数据库密码：$LCZIWORD"
echo;echo -e "\033[31m注意：\033[0m\033[35m \033[0m"
echo -e "\033[33m如信息无误请回车开始配置.\033[0m"
echo -e "\033[33m如果信息有错请按 Ctrl + c 键结束对接，并重新执行对接脚本！\033[0m"
echo -e "\033[35m回车开始执行配置 >>>\033[0m"
read
clear
echo "正在配置数据 请稍等..."
echo ">>"
sleep 1
echo ">>>>"
sleep 2
echo ">>>>>>>"
sleep 3
echo ">>>>>>>>>>"
sleep 4
echo -e '>>>>>>>>>>>>>        [\033[32m  OK  \033[0m]'
sed -i '3s/localhost/'$LCMUIP'/g' /var/www/html/config.php >/dev/null 2>&1
sed -i '6s/'$LCZIWORD'/'$LCMUWROD'/g' /var/www/html/config.php >/dev/null 2>&1
sed -i '3s/localhost/'$LCMUIP'/g' /var/www/html/app_api/config.php >/dev/null 2>&1
sed -i '5s/'$LCZIWORD'/'$LCMUWORD'/g' /var/www/html/app_api/config.php >/dev/null 2>&1
sed -i 's/localhost/'$LCMUIP'/g' /etc/openvpn/login.sh >/dev/null 2>&1
sed -i 's/localhost/'$LCMUIP'/g' /etc/openvpn/disconnect.sh >/dev/null 2>&1
mysql -hlocalhost -uroot -p$LCZIWORD --default-character-set=utf8<<EOF
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%'IDENTIFIED BY '${LCZIWORD}' WITH GRANT OPTION;
flush privileges;
EOF
vpn >/dev/null 2>&1
echo;echo -e "\033[32m配置完成!\033[0m"
echo -e "\033[32m成功与主服务器IP:$LCMUIP 对接成功\033[0m"
echo -e "\033[32m请自行到主服务器后台添加当前服务器：$IPAddress\033[0m"
exit 0;
fi
return 1
}
#对接负载部分 **************************************************************************
#流量卫士部分 **************************************************************************
function weishi(){
clear
echo;echo -e "温馨提示：\033[35m为了您服务器的稳定和安全，请勿非法破解改程序\033[0m"
echo;echo -e "\033[1;32m> 请选择安装模式：\033[0m"
echo;echo -e "\033[1;33m> 1.流量卫士4.5版本\033[0m"
echo;echo -e "\033[1;34m> 2.流量卫士5.0版本\033[0m"
echo;echo -n "请输入你要安装的服务选项: "
read anzhuangnx
if [ -z $anzhuangnx ]
then
echo "选项不能为空，请重新输入选项："
read anzhuangnx
fi

if [[ $anzhuangnx == "1" ]]
then
echo -e "\033[1;32m> 请选择安装模式：\033[0m"
echo;echo -e "\033[1;33m> 1.安装普通注册版\033[0m"
echo;echo -e "\033[1;34m> 2.安装短信注册版\033[0m"
echo;echo -n "请输入你要安装的服务选项: "
read anzhuang
if [ -z $anzhuang ]
then
echo "选项不能为空，请重新输入选项："
read anzhuang
fi


echo;echo -ne "\033[1;36m请输入你的app名字，回车默认（云流量）：\033[0m"
read appname
if [ -z $appname ]
then
echo -ne "\033[1;35mapp名字：云流量\033[0m"
appname=云流量
else
echo -ne "\033[1;35mapp名字：$appname\033[0m"
fi

echo;echo -ne "\033[1;36m请输入你的服务器IP，回车默认本机地址（$IPAddress）：\033[0m"
read fuqIPAddress
if [ -z $fuqIPAddress ]
then
echo -ne "\033[1;35m服务器IP地址：$IPAddress\033[0m"
fuqIPAddress=$IPAddress
else
echo -ne "\033[1;35m服务器IP地址：$fuqIPAddress\033[0m"
fi

echo;echo -ne "\033[1;36m请输入您服务器的流控端口：\033[0m"
read lkdk
if [ -z $lkdk ]
then
echo -ne "\033[1;35m流控端口不能为空，请重新输入：\033[0m"
read lkdk
fi 
echo -e "\033[1;35m流控端口：$lkdk\033[0m"
cd /var/www/html/
if test -f app_api.zip #判断文件是否存在
then
echo -e "\033[1;31m正在卸载后端安装包...\033[0m" 
rm -rf app_api.zip
else
echo -e "\033[1;31m没有安装包，准备检测是否安装过流量卫士.\033[0m"
fi

if test -d app_api 
then
echo -e "\033[1;31m正在卸载已经安装的后端...\033[0m" 
rm -rf app_api
else
echo -e "\033[1;31m没有安装过流量卫士，全新安装系统..\033[0m"
fi

echo -e "\033[1;31m正在下载流量卫士云端数据，请稍等....\033[0m"
rm -rf /var/www/html/app_api
rm -rf /var/www/html/app_api.zip
cd /var/www/html/
mkdir app_api
cd /var/www/html/app_api
curl -O https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/ttmll/app_api.zip >/dev/null 2>&1
echo -e "\033[1;31m下载完毕...\033[0m" 
echo -e "\033[1;31m正在解压并安装云端文件..\033[0m" 
unzip app_api.zip >/dev/null 2>&1 

if [[ $anzhuang == "2" ]]
then
echo;echo -ne "\033[1;36m请输入云之讯的Account Sid ：\033[0m"
read yzxsd
if [ -z $yzxsd ]
then
echo -ne "\033[1;35m云之讯的Account Sid：\033[0m"
read yzxsd
fi 
echo -ne "\033[1;35m云之讯的Account Sid为：$yzxsd\033[0m"

echo;echo -ne "\033[1;36m请输入云之讯申请的 Auth Token：\033[0m"
read yzxtk
if [ -z $yzxtk ]
then
echo -ne "\033[1;35m云之讯申请的Auth Token：\033[0m"
read yzxtk
fi 
echo -ne "\033[1;35m云之讯申请的Auth Token为：$yzxtk\033[0m"

echo;echo -ne "\033[1;36m请输入云之讯申请的应用ID ：\033[0m"
read yzxid
if [ -z $yzxid ]
then
echo -ne "\033[1;35m云之讯申请的应用ID ：\033[0m"
read yzxid
fi 
echo -ne "\033[1;35m云之讯申请的应用ID 为：$yzxid\033[0m"

echo;echo -ne "\033[1;36m请输入申请的短信模板ID：\033[0m"
read tlid
if [ -z $tlid ]
then
echo -ne "\033[1;35m申请的短信模板ID：\033[0m"
read tlid
fi 
echo -ne "\033[1;35m申请的短信模板ID为：$tlid\033[0m"

echo;echo -ne "\033[1;36m请输入服务名称 例如 花白云：\033[0m"
read fwmc
if [ -z $fwmc ]
then
echo -ne "\033[1;35m服务名称：\033[0m"
read fwmc
fi 
echo -ne "\033[1;35m服务名称为：$fwmc\033[0m"
echo;echo -e "\033[1;31m正在写入数据...\033[0m" 
sed -i '15s/3b7004e5f782a6e4f1f195bc52990bd4/'${yzxsd}'/g' /var/www/html/app_api/sms.config.php
sed -i '18s/cee182005162750e23855d63ed92188d/'${yzxtk}'/g' /var/www/html/app_api/sms.config.php
sed -i '22s/fff126cf55e545439dfd1c16aa63d95a/'${yzxid}'/g' /var/www/html/app_api/sms.config.php
sed -i '33s/29317/'${tlid}'/g' /var/www/html/app_api/sms.config.php
sed -i '36s/花白云/'${fwmc}'/g' /var/www/html/app_api/sms.config.php
fi

chmod -R 777 /var/www/html/app_api/data
chmod -R 777 /var/www/html/app_api/user_tmp
chmod -R 777 /var/www/html/app_api/
rm -rf /var/www/html/app_api.zip
echo -e "\033[1;31m流量卫士云端数据安装完毕\033[0m"

echo -e "\033[1;36m正在安装java环境，请稍等...\033[0m"
yum install -y java >/dev/null 2>&1
rm -rf /var/www/html/流量卫士.apk
cd /home
mkdir android
chmod 777 /home/android
cd /home/android
echo -e "\033[1;35m正在开始下载编译工具....\033[0m"
curl -O https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/ttmll/apktool.jar >/dev/null 2>&1  
if [[ $anzhuang == "1" ]] 
then
echo -e "\033[1;31m正在下载普通注册APP版...\033[0m"
curl -O https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/ttmll/nz.apk >/dev/null 2>&1  
mv /home/android/nz.apk /home/android/llws.apk
fi
if [[ $anzhuang == "2" ]]
then
echo -e "\033[1;31m正在下载短信注册APP版...\033[0m"
curl -O https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/ttmll/dx.apk >/dev/null 2>&1  
mv /home/android/dx.apk /home/android/llws.apk
fi

echo -e "\033[1;35m正在开始编译APP....\033[0m"
java -jar apktool.jar d llws.apk >/dev/null 2>&1
sed -i 's/对接名字/'${appname}'/g' /home/android/llws/res/values/strings.xml >/dev/null 2>&1
sed -i 's/huabai5201314/'${fuqIPAddress}:${lkdk}'/g' /home/android/llws/smali/net/openvpn/openvpn/base.smali
#sed -i 's/Appkey修改/'${zdykey}'/g' /home/android/llws/smali/net/openvpn/openvpn/base.smali
sed -i 's/huabai5201314/'${fuqIPAddress}:${lkdk}'/g' '/home/android/llws/smali/net/openvpn/openvpn/Main2Activity$MyListener$1.smali'
sed -i 's/huabai5201314/'${fuqIPAddress}:${lkdk}'/g' '/home/android/llws/smali/net/openvpn/openvpn/Main2Activity$MyListener.smali'
sed -i 's/huabai5201314/'${fuqIPAddress}:${lkdk}'/g' '/home/android/llws/smali/net/openvpn/openvpn/MainActivity.smali'
sed -i 's/huabai5201314/'${fuqIPAddress}:${lkdk}'/g' '/home/android/llws/smali/net/openvpn/openvpn/OpenVPNClient$10.smali'
sed -i 's/huabai5201314/'${fuqIPAddress}:${lkdk}'/g' '/home/android/llws/smali/net/openvpn/openvpn/OpenVPNClient$11.smali'
sed -i 's/huabai5201314/'${fuqIPAddress}:${lkdk}'/g' '/home/android/llws/smali/net/openvpn/openvpn/OpenVPNClient$13.smali'
sed -i 's/huabai5201314/'${fuqIPAddress}:${lkdk}'/g' /home/android/llws/smali/net/openvpn/openvpn/OpenVPNClient.smali
sed -i 's/huabai5201314/'${fuqIPAddress}:${lkdk}'/g' '/home/android/llws/smali/net/openvpn/openvpn/splash$1$1.smali'
sed -i 's/huabai5201314/'${fuqIPAddress}:${lkdk}'/g' '/home/android/llws/smali/net/openvpn/openvpn/splash$2.smali'
sed -i 's/huabai5201314/'${fuqIPAddress}:${lkdk}'/g' '/home/android/llws/smali/net/openvpn/openvpn/update$myClick$1.smali'
sudo chmod +x /home/android/apktool.jar
java -jar apktool.jar b llws >/dev/null 2>&1
sleep 1
cd /home/android/llws/dist
curl -O https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/ttmll/signer.zip >/dev/null 2>&1 
unzip signer.zip >/dev/null 2>&1 
java -jar signapk.jar testkey.x509.pem testkey.pk8 llws.apk ll.apk
\cp -rf /home/android/llws/dist/ll.apk /home/流量卫士.apk
cd /home
rm -rf android
mv /home/流量卫士.apk /var/www/html/流量卫士.apk
cd /home
rm -rf /home/smm.txt
echo -e "\033[1;35mAPP编译完成....\033[0m"
echo '《欢迎使用流量卫士一键编译脚本》' >>smm.txt
echo "
---------------------------------------------------------
后台地址：   http://${fuqIPAddress}:${lkdk}/app_api 
---------------------------------------------------------

---------------------------------------------------------
后台管理员用户名：admin 管理密码：admin
---------------------------------------------------------

---------------------------------------------------------
APP下载地址:   http://${fuqIPAddress}:${lkdk}/流量卫士.apk
---------------------------------------------------------
">>smm.txt
cat smm.txt
exit 0;
fi

if [[ $anzhuangnx == "2" ]]
then

echo;echo -ne "\033[1;36m请输入您服务器的数据库密码：\033[0m"
read sjkpass
if [ -z $sjkpass ]
then
echo -ne "\033[1;35m服务器的数据库密码不能为空，请重新输入：\033[0m"
read sjkpass
fi 

echo;echo -ne "\033[1;36m请输入你的app名字，回车默认（云流量）：\033[0m"
read appname
if [ -z $appname ]
then
echo -ne "\033[1;35mapp名字：云流量\033[0m"
appname=云流量
else
echo -ne "\033[1;35mapp名字：$appname\033[0m"
fi

echo;echo -ne "\033[1;36m请输入你的服务器IP，回车默认本机地址（$IPAddress）：\033[0m"
read fuqIPAddress
if [ -z $fuqIPAddress ]
then
echo -ne "\033[1;35m服务器IP地址：$IPAddress\033[0m"
fuqIPAddress=$IPAddress
else
echo -ne "\033[1;35m服务器IP地址：$fuqIPAddress\033[0m"
fi

echo;echo -ne "\033[1;36m请输入您服务器的流控端口：\033[0m"
read lkdk
if [ -z $lkdk ]
then
echo -ne "\033[1;35m流控端口不能为空，请重新输入：\033[0m"
read lkdk
fi 
echo -e "\033[1;35m流控端口：$lkdk\033[0m"
cd /var/www/html/
if test -f app_api.zip #判断文件是否存在
then
echo -e "\033[1;31m正在卸载后端安装包...\033[0m" 
rm -rf app_api.zip
else
echo -e "\033[1;31m没有安装包，准备检测是否安装过流量卫士.\033[0m"
fi

if test -d app_api 
then
echo -e "\033[1;31m正在卸载已经安装的后端...\033[0m" 
rm -rf app_api
else
echo -e "\033[1;31m没有安装过流量卫士，全新安装系统..\033[0m"
fi

echo -e "\033[1;31m正在下载流量卫士云端数据，请稍等....\033[0m"
rm -rf /var/www/html/app_api
rm -rf /var/www/html/app_api.zip
cd /var/www/html/
curl -O https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/ttmll/app_api.zip >/dev/null 2>&1
echo -e "\033[1;31m下载完毕...\033[0m" 
echo -e "\033[1;31m正在解压并安装云端文件..\033[0m" 
unzip app_api.zip >/dev/null 2>&1 
cd /var/www/html/app_api/
sed -i '8s/huabai520/'$sjkpass'/g' /var/www/html/app_api/config.php
mysql -uroot -p$sjkpass ov < ov.sql >/dev/null 2>&1
chmod -R 777 /var/www/html/app_api/data
chmod -R 777 /var/www/html/app_api/user_tmp
chmod -R 777 /var/www/html/app_api/
rm -rf /var/www/html/app_api.zip
echo -e "\033[1;31m流量卫士云端数据安装完毕\033[0m"

echo -e "\033[1;36m正在安装java环境，请稍等...\033[0m"
yum install -y java >/dev/null 2>&1
rm -rf /var/www/html/流量卫士.apk
cd /home
mkdir android
chmod 777 /home/android
cd /home/android
echo -e "\033[1;35m正在开始下载编译工具....\033[0m"
curl -O https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/ttmll/apktool.jar >/dev/null 2>&1  
echo -e "\033[1;31m正在下载流量卫士5.0APP版...\033[0m"
curl -O https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/ttmll/llws5/ll.apk >/dev/null 2>&1  
mv /home/android/ll.apk /home/android/llws.apk
echo -e "\033[1;35m正在开始编译APP....\033[0m"
java -jar apktool.jar d llws.apk >/dev/null 2>&1
sed -i 's/127.0.0.1/'${fuqIPAddress}:${lkdk}'/g' /home/android/llws/smali/net/openvpn/openvpn/base.smali
sed -i 's/127.0.0.1/'${fuqIPAddress}:${lkdk}'/g' /home/android/llws/smali/net/openvpn/openvpn/Main2ActivityMyListener.smali 
sed -i 's/127.0.0.1/'${fuqIPAddress}:${lkdk}'/g' /home/android/llws/smali/net/openvpn/openvpn/Main2ActivityMyListener1.smali 
sed -i 's/127.0.0.1/'${fuqIPAddress}:${lkdk}'/g' /home/android/llws/smali/net/openvpn/openvpn/MainActivity.smali 
sed -i 's/127.0.0.1/'${fuqIPAddress}:${lkdk}'/g' /home/android/llws/smali/net/openvpn/openvpn/OpenVPNClient.smali 
sed -i 's/127.0.0.1/'${fuqIPAddress}:${lkdk}'/g' /home/android/llws/smali/net/openvpn/openvpn/OpenVPNClient10.smali 
sed -i 's/127.0.0.1/'${fuqIPAddress}:${lkdk}'/g' /home/android/llws/smali/net/openvpn/openvpn/OpenVPNClient11.smali 
sed -i 's/127.0.0.1/'${fuqIPAddress}:${lkdk}'/g' /home/android/llws/smali/net/openvpn/openvpn/OpenVPNClient13.smali 
sed -i 's/127.0.0.1/'${fuqIPAddress}:${lkdk}'/g' /home/android/llws/smali/net/openvpn/openvpn/updatemyClick1.smali 
sed -i 's/花白云/'${appname}'/g' /home/android/llws/res/values/strings.xml
sudo chmod +x /home/android/apktool.jar
java -jar apktool.jar b llws >/dev/null 2>&1
sleep 1
cd /home/android/llws/dist
curl -O https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/ttmll/signer.zip >/dev/null 2>&1 
unzip signer.zip >/dev/null 2>&1 
java -jar signapk.jar testkey.x509.pem testkey.pk8 llws.apk ll.apk
\cp -rf /home/android/llws/dist/ll.apk /home/流量卫士.apk
cd /home
rm -rf android
mv /home/流量卫士.apk /var/www/html/流量卫士.apk
cd /home
rm -rf /home/smm.txt
echo -e "\033[1;35mAPP编译完成....\033[0m"
echo '《欢迎使用流量卫士一键编译脚本》' >>smm.txt
echo "
---------------------------------------------------------
后台地址：   http://${fuqIPAddress}:${lkdk}/app_api 
---------------------------------------------------------

---------------------------------------------------------
后台管理员用户名：admin 管理密码：admin
---------------------------------------------------------

---------------------------------------------------------
APP下载地址:   http://${fuqIPAddress}:${lkdk}/流量卫士.apk
---------------------------------------------------------
">>smm.txt
cat smm.txt
exit 0;
fi
return 1
}
#流量卫士部分 **************************************************************************
#实用工具部分 **************************************************************************
function gongju(){
clear
echo;echo -e "温馨提示：\033[35m为了您服务器的稳定和安全，请勿非法破解改程序\033[0m"
echo;echo -e "\033[1;32m> 请选择安装模式：\033[0m"
echo;echo -e "\033[1;33m> 1.一键开启转发端口\033[0m"
echo;echo -e "\033[1;34m> 2.一键开启UDP端口\033[0m"
echo;echo -e "\033[1;35m> 3.一键双倍发包脚本\033[0m"
echo;echo -e "\033[1;36m> 4.一键防DDOS脚本\033[0m"
echo;echo -e "\033[1;37m> 5.一键生成APP脚本（可以为代理生成APP）\033[0m"
echo;echo -n "请输入你要安装的服务选项: "
read sygjxx
if [ -z $sygjxx ]
then
echo "选项不能为空，请重新输入选项："
read sygjxx
fi

if [[ $sygjxx == "1" ]]
then
echo -n -e "请输入你要开启的第一个转发端口（回车默认137端口）："
read zf1
if [ -z $zf1 ]
then
echo  "转发端口：137"
zf1=137
else
echo "转发端口：$zf1"
fi

echo -n -e "请输入你要开启的第二个转发端口（回车默认138端口）："
read zf2
if [ -z $zf2 ]
then
echo  "转发端口：138"
zf2=138
else
echo "转发端口：$zf2"
fi

echo "正在配置防火墙信息..."
iptables -A INPUT -p TCP --dport ${zf1} -j ACCEPT 
iptables -A INPUT -p TCP --dport ${zf2} -j ACCEPT 
service iptables save
service iptables restart
echo "防火墙配置完毕.."

echo "正在开启转发端口...."
cd /etc/openvpn
./udp -l ${zf1} -d
./udp -l ${zf2} -d
echo "${zf1}和${zf2}成功开启，[\033[32m  OK  \033[0m]"
exit 0;
fi

if [[ $sygjxx == "2" ]]
then
echo -n -e "请输入你要开启的第一个UDP端口（回车默认137端口）："
read udp1
if [ -z $udp1 ]
then
echo  "UDP端口：137"
udp1=137
else
echo "UDP端口：$udp1"
fi

echo -n -e "请输入你要开启的第二个UDP端口（回车默认138端口）："
read udp2
if [ -z $udp2 ]
then
echo  "UDP端口：138"
udp2=138
else
echo "UDP端口：$udp2"
fi

echo "正在检测你是否安装了UDP.."
cd /etc/openvpn/
if test -f udp137
then
echo;echo "检测到你已经安装了UDP137，是否卸载该程序？"
echo;echo "回车确认卸载："
read 
echo;echo "正在为你卸载该程序......"
killall udp137
rm -rf /etc/openvpn/udp137
else
echo;echo "没有安装过UDP137,全新安装..."
fi
if test -f udp138
then
echo;echo "检测到你已经安装了UDP138，是否卸载该程序？"
echo;echo "回车确认卸载："
read 
echo;echo "正在为你卸载该程序......"
killall udp138
rm -rf /etc/openvpn/udp138
else
echo;echo "没有安装过UDP138,全新安装..."
fi

echo "正在配置防火墙信息..."
cd
iptables -A INPUT -p udp --dport ${udp1} -j ACCEPT
iptables -A INPUT -p udp --dport ${udp2} -j ACCEPT
service iptables save
service iptables restart 
echo "防火墙配置完毕.."

echo "正在配置UDP端口信息.."
cd /etc/openvpn/
echo "port ${udp1}
proto udp
dev tun
ca /etc/openvpn/easy-rsa/keys/ca.crt
cert /etc/openvpn/easy-rsa/keys/centos.crt
key /etc/openvpn/easy-rsa/keys/centos.key
dh /etc/openvpn/easy-rsa/keys/dh2048.pem
management localhost 7507
auth-user-pass-verify /etc/openvpn/login.sh via-env
client-disconnect /etc/openvpn/disconnect.sh
client-connect /etc/openvpn/connect.sh
client-cert-not-required
username-as-common-name
script-security 3 system
server 10.5.0.0 255.255.0.0
push "redirect-gateway def1 bypass-dhcp"
push "dhcp-option DNS 223.5.5.5"
push "dhcp-option DNS 223.6.6.6"
keepalive 10 20
tls-auth /etc/openvpn/easy-rsa/ta.key 0  
comp-lzo
persist-key
persist-tun
status /var/www/html/udp/openvpn-status2.txt
log         udp${udp1}.log
log-append  udp${udp1}.log
verb 3" > /etc/openvpn/udp${udp1}.conf
echo "port ${udp2}
proto udp
dev tun
ca /etc/openvpn/easy-rsa/keys/ca.crt
cert /etc/openvpn/easy-rsa/keys/centos.crt
key /etc/openvpn/easy-rsa/keys/centos.key
dh /etc/openvpn/easy-rsa/keys/dh2048.pem
management localhost 7508
auth-user-pass-verify /etc/openvpn/login.sh via-env
client-disconnect /etc/openvpn/disconnect.sh
client-connect /etc/openvpn/connect.sh
client-cert-not-required
username-as-common-name
script-security 3 system
server 10.6.0.0 255.255.0.0
push "redirect-gateway def1 bypass-dhcp"
push "dhcp-option DNS 223.5.5.5"
push "dhcp-option DNS 223.6.6.6"
keepalive 10 20
tls-auth /etc/openvpn/easy-rsa/ta.key 0  
comp-lzo
persist-key
persist-tun
status /var/www/html/udp/openvpn-status2.txt
log         udp${udp2}.log
log-append  udp${udp2}.log
verb 3" > /etc/openvpn/udp${udp2}.conf
chmod -R 0777 /etc/openvpn

echo "正在为你开启udp${udp1}和udp${udp2}..."
cd /etc/openvpn/
openvpn --config udp${udp1}.conf & >/dev/null 2>&1
openvpn --config udp${udp2}.conf & >/dev/null 2>&1
echo "udp${udp1}和udp${udp2}开启完毕.."

echo "正在为你写入UDP快捷启动命令： udp"
echo "echo 正在重启服务...
openvpn --config udp${udp1}.conf & >/dev/null 2>&1
openvpn --config udp${udp2}.conf & >/dev/null 2>&1
echo -e '开启状态：			  [\033[32m  OK  \033[0m]'
exit 0;
" >/bin/udp
chmod 0755 /bin/udp
echo "命令写入完毕"
echo "安装完成，感谢使用！"
exit 0;
fi

if [[ $sygjxx == "3" ]]
then
echo "请稍等，脚本正在下载中.........."
curl -O https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/ttmll/sbfb.sh >/dev/null 2>&1
bash sbfb.sh 
fi

if [[ $sygjxx == "4" ]]
then
echo "请稍等，脚本正在下载中.........."
curl -O https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/ttmll/dd.sh >/dev/null 2>&1
bash dd.sh 
fi

if [[ $sygjxx == "5" ]]
then
echo;echo -e "温馨提示：\033[35m为了您服务器的稳定和安全，请勿非法破解改程序\033[0m"
echo;echo -e "\033[1;32m> 请选择安装模式：\033[0m"
echo;echo -e "\033[1;33m> 1.一键生成云端APP\033[0m"
echo;echo -e "\033[1;34m> 2.一键流量卫士4.5版APP\033[0m"
echo;echo -e "\033[1;35m> 3.一键流量卫士5.0版APP\033[0m"
echo;echo -n "请输入你要安装的服务选项: "
read appsc
if [ -z $appsc ]
then
echo "选项不能为空，请重新输入选项："
read appsc
fi

if [[ $appsc == "1" ]]
then
#APP信息 *******************************************************************************
echo;echo -ne "\033[1;36m请输入你的服务器IP，回车默认本机地址（$IPAddress）：\033[0m"
read fuqIPAddress
if [ -z $fuqIPAddress ]
then
echo -ne "\033[1;35m服务器IP地址：$IPAddress\033[0m"
fuqIPAddress=$IPAddress
else
echo -ne "\033[1;35m服务器IP地址：$fuqIPAddress\033[0m"
fi

echo;echo -ne "\033[1;36m请输入您服务器的流控端口：\033[0m"
read lkdk
if [ -z $lkdk ]
then
echo -ne "\033[1;35m流控端口不能为空，请重新输入：\033[0m"
read lkdk
fi 
echo -e "\033[1;35m流控端口：$lkdk\033[0m"

echo;echo -n -e "\033[1;36m请输入云端APP名字（回车默认云流量）：\033[0m"
read appname
if [ -z $appname ]
then
echo;echo -e "\033[1;35m云端APP名字：\033[0m\033[1;32m云流量\033[0m"
appname=云流量
else
echo;echo -e "\033[1;35m云端APP名字：\033[0m\033[1;32m$appname\033[0m"
fi

echo;echo -n -e "\033[1;36m请输入云端APP客服（回车默认123456）：\033[0m"
read appkf
if [ -z $appkf ]
then
echo;echo -e "\033[1;35m云端APP客服：\033[0m\033[1;32m123456\033[0m"
appkf=123456
else
echo;echo -e "\033[1;35m云端APP客服：\033[0m\033[1;32m$appkf\033[0m"
fi
echo;echo -n -e "\033[1;36m请输入你搭建时候输入的云端KEY（回车默认11893927）：\033[0m"
read zdyky
if [ -z $zdyky ]
then
echo;echo -e "\033[1;35m云端KEY：\033[0m\033[1;32m11893927\033[0m"
zdyky=11893927
else
echo;echo -e "\033[1;35m云端KEY：\033[0m\033[1;32m$zdyky\033[0m"
fi
#APP信息 *******************************************************************************
#生成APP *******************************************************************************
echo;echo -e "\033[1;35m正在生成第一款云端APP软件...\033[0m"
rm -rf /home/android /home/appdb /home/app.apk /home/app1.apk
rm -rf /var/www/html/appdb.zip
cd /home;mkdir android 
chmod 777 /home/android;cd /home/android
echo;echo -e "\033[1;35m正在开始编译APP....\033[0m"
curl -O https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/ttmll/apktool.jar >/dev/null 2>&1 
curl -O https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/ttmll/h.apk >/dev/null 2>&1
java -jar apktool.jar d h.apk >/dev/null 2>&1
sed -i "s/127.0.0.1/${fuqIPAddress}:${lkdk}/g" /home/android/h/smali/net/openvpn/openvpn/AutoScrollTextView.smali
sed -i "s/127.0.0.1/${fuqIPAddress}:${lkdk}/g" /home/android/h/smali/net/openvpn/openvpn/ChongzhiActivity.smali
sed -i "s/127.0.0.1/${fuqIPAddress}:${lkdk}/g" '/home/android/h/smali/net/openvpn/openvpn/DoActivity$3.smali'
sed -i "s/127.0.0.1/${fuqIPAddress}:${lkdk}/g" /home/android/h/smali/net/openvpn/openvpn/MainActivity.smali
sed -i "s/127.0.0.1/${fuqIPAddress}:${lkdk}/g" /home/android/h/smali/net/openvpn/openvpn/MainTabActivity.smali
sed -i "s/127.0.0.1/${fuqIPAddress}:${lkdk}/g" /home/android/h/smali/net/openvpn/openvpn/OpenVPNClient.smali
sed -i "s/11893927/${zdyky}/g" /home/android/h/smali/net/openvpn/openvpn/ChongzhiActivity.smali
sed -i "s/11893927/${zdyky}/g" '/home/android/h/smali/net/openvpn/openvpn/DoActivity$3.smali'
sed -i "s/11893927/${zdyky}/g" /home/android/h/smali/net/openvpn/openvpn/MainActivity.smali
sed -i "s/11893927/${zdyky}/g" /home/android/h/smali/net/openvpn/openvpn/MainTabActivity.smali
sed -i "s/11893927/${zdyky}/g" /home/android/h/smali/net/openvpn/openvpn/OpenVPNClient.smali
sed -i "s/对接名字/${appname}/g" /home/android/h/res/values/strings.xml >/dev/null 2>&1
sed -i "s/对接客服/${appkf}/g" /home/android/h/res/values/strings.xml >/dev/null 2>&1
#sed -i "s/对接更新/'${gzxzdz}/g" /home/android/yl/res/values/strings.xml >/dev/null 2>&1
sudo chmod +x /home/android/apktool.jar
java -jar apktool.jar b h >/dev/null 2>&1
cd /home/android/h/dist
curl -O https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/ttmll/signer.zip >/dev/null 2>&1
unzip signer.zip >/dev/null 2>&1 
java -jar signapk.jar testkey.x509.pem testkey.pk8 h.apk hyun.apk
\cp -rf /home/android/h/dist/hyun.apk /home/appA.apk
echo;echo -e "\033[1;31m第一款app制作完毕....\033[0m"  

echo;echo -e "\033[1;35m正在生成第二款云端APP软件...\033[0m"
rm -rf /home/android
cd /home;mkdir android 
chmod 777 /home/android;cd /home/android
echo;echo -e "\033[1;35m正在开始编译APP....\033[0m"
curl -O https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/ttmll/apktool.jar >/dev/null 2>&1
curl -O https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/ttmll/h1.apk >/dev/null 2>&1 
java -jar apktool.jar d h1.apk >/dev/null 2>&1
sed -i "s/127.0.0.1/${fuqIPAddress}:${lkdk}/g" '/home/android/h1/smali/com/mayor/prg/mst$2.smali'
sed -i "s/127.0.0.1/${fuqIPAddress}:${lkdk}/g" /home/android/h1/smali/net/openvpn/openvpn/AutoScrollTextView.smali
sed -i "s/127.0.0.1/${fuqIPAddress}:${lkdk}/g" /home/android/h1/smali/net/openvpn/openvpn/ChongzhiActivity.smali
sed -i "s/127.0.0.1/${fuqIPAddress}:${lkdk}/g" '/home/android/h1/smali/net/openvpn/openvpn/DoActivity$3.smali'
sed -i "s/127.0.0.1/${fuqIPAddress}:${lkdk}/g" /home/android/h1/smali/net/openvpn/openvpn/MainActivity.smali
sed -i "s/127.0.0.1/${fuqIPAddress}:${lkdk}/g" /home/android/h1/smali/net/openvpn/openvpn/MainTabActivity.smali
sed -i "s/127.0.0.1/${fuqIPAddress}:${lkdk}/g" /home/android/h1/smali/net/openvpn/openvpn/OpenVPNClient.smali
sed -i "s/11893927/${zdyky}/g" /home/android/h1/smali/net/openvpn/openvpn/ChongzhiActivity.smali
sed -i "s/11893927/${zdyky}/g" '/home/android/h1/smali/net/openvpn/openvpn/DoActivity$3.smali'
sed -i "s/11893927/${zdyky}/g" /home/android/h1/smali/net/openvpn/openvpn/MainActivity.smali
sed -i "s/11893927/${zdyky}/g" /home/android/h1/smali/net/openvpn/openvpn/MainTabActivity.smali
sed -i "s/11893927/${zdyky}/g" /home/android/h1/smali/net/openvpn/openvpn/OpenVPNClient.smali
sed -i "s/对接名字/${appname}/g" /home/android/h1/res/values/strings.xml 
sed -i "s/对接客服/${appkf}/g" /home/android/h1/res/values/strings.xml 
sudo chmod +x /home/android/apktool.jar
java -jar apktool.jar b h1 >/dev/null 2>&1
cd /home/android/h1/dist
curl -O https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/ttmll/signer.zip >/dev/null 2>&1
unzip signer.zip >/dev/null 2>&1 
java -jar signapk.jar testkey.x509.pem testkey.pk8 h1.apk hyun1.apk
\cp -rf /home/android/h1/dist/hyun1.apk /home/appB.apk
rm -rf /home/android
echo;echo -e "\033[1;31m第二款app制作完毕....\033[0m"  
#生成APP *******************************************************************************
#打包配置部分***************************************************************************
cd /home;mkdir /appdb
mv /home/appA.apk /home/appdb/云端appA.apk
mv /home/appB.apk /home/appdb/云端appB.apk
echo
echo -e "\033[1;34m正在打包配置文件.....\033[0m"
cd /home
zip -q -r /home/appdb.zip /home/appdb
cp /home/appdb.zip /var/www/html/appdb.zip
rm -rf /home/android
echo;echo -e "\033[1;34m配置文件打包完毕.....\033[0m"
echo;echo -e "\033[1;31m你的app位于home文件夹下面，文件名：appdb.zip\033[0m" 
echo;echo -e "\033[1;34m你的app下载链接：htttp://${fuqIPAddress}:${lkdk}/appdb.zip\033[0m"
fi
#打包配置部分***************************************************************************

if [[ $appsc == "2" ]]
then
echo -e "温馨提示：\033[35m为了您服务器的稳定和安全，请勿非法破解改程序\033[0m"
echo;echo -e "\033[1;32m> 请选择安装模式：\033[0m"
echo;echo -e "\033[1;33m> 1.生成普通注册版\033[0m"
echo;echo -e "\033[1;34m> 2.生成短信注册版\033[0m"
echo;echo -n "请输入你要安装的服务选项: "
read llwsxz
if [ -z $llwsxz ]
then
echo "选项不能为空，请重新输入选项："
read llwsxz
fi

echo;echo -ne "\033[1;36m请输入你的app名字，回车默认（云流量）：\033[0m"
read appname
if [ -z $appname ]
then
echo -ne "\033[1;35mapp名字：云流量\033[0m"
appname=云流量
else
echo -ne "\033[1;35mapp名字：$appname\033[0m"
fi

echo;echo -ne "\033[1;36m请输入你的服务器IP，回车默认本机地址（$IPAddress）：\033[0m"
read fuqIPAddress
if [ -z $fuqIPAddress ]
then
echo -ne "\033[1;35m服务器IP地址：$IPAddress\033[0m"
fuqIPAddress=$IPAddress
else
echo -ne "\033[1;35m服务器IP地址：$fuqIPAddress\033[0m"
fi

echo;echo -ne "\033[1;36m请输入您服务器的流控端口：\033[0m"
read lkdk
if [ -z $lkdk ]
then
echo -ne "\033[1;35m流控端口不能为空，请重新输入：\033[0m"
read lkdk
fi 
echo -e "\033[1;35m流控端口：$lkdk\033[0m"

echo;echo -ne "\033[1;36m正在安装java环境，请稍等...\033[0m"
yum install -y java >/dev/null 2>&1
echo;echo -e "\033[35m正在生成云端APP软件...\033[0m"
rm -rf /home/android /home/scllws.apk /var/www/html/scllws.apk
echo
cd /home;mkdir android
chmod 777 /home/android;cd /home/android
echo;echo -e "\033[35m正在开始编译APP....\033[0m"
curl -O https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/ttmll/apktool.jar >/dev/null 2>&1  
echo
if [[ $llwsxz == "1" ]] 
then
echo -e "\033[1;31m正在下载普通注册APP版...\033[0m"
curl -O https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/ttmll/nz.apk >/dev/null 2>&1  
mv /home/android/nz.apk /home/android/llws.apk
fi
if [[ $llwsxz == "2" ]]
then
echo -e "\033[1;31m正在下载短信注册APP版...\033[0m"
curl -O https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/ttmll/dx.apk >/dev/null 2>&1  
mv /home/android/dx.apk /home/android/llws.apk
fi

java -jar apktool.jar d llws.apk >/dev/null 2>&1
echo
sed -i 's/对接名字/'$appname'/g' /home/android/llws/res/values/strings.xml >/dev/null 2>&1
sed -i 's/huabai5201314/'${fuqIPAddress}:${lkdk}'/g' /home/android/llws/smali/net/openvpn/openvpn/base.smali
#sed -i 's/Appkey修改/'${zdykey}'/g' /home/android/llws/smali/net/openvpn/openvpn/base.smali
sed -i 's/huabai5201314/'${fuqIPAddress}:${lkdk}'/g' '/home/android/llws/smali/net/openvpn/openvpn/Main2Activity$MyListener$1.smali'
sed -i 's/huabai5201314/'${fuqIPAddress}:${lkdk}'/g' '/home/android/llws/smali/net/openvpn/openvpn/Main2Activity$MyListener.smali'
sed -i 's/huabai5201314/'${fuqIPAddress}:${lkdk}'/g' '/home/android/llws/smali/net/openvpn/openvpn/MainActivity.smali'
sed -i 's/huabai5201314/'${fuqIPAddress}:${lkdk}'/g' '/home/android/llws/smali/net/openvpn/openvpn/OpenVPNClient$10.smali'
sed -i 's/huabai5201314/'${fuqIPAddress}:${lkdk}'/g' '/home/android/llws/smali/net/openvpn/openvpn/OpenVPNClient$11.smali'
sed -i 's/huabai5201314/'${fuqIPAddress}:${lkdk}'/g' '/home/android/llws/smali/net/openvpn/openvpn/OpenVPNClient$13.smali'
sed -i 's/huabai5201314/'${fuqIPAddress}:${lkdk}'/g' /home/android/llws/smali/net/openvpn/openvpn/OpenVPNClient.smali
sed -i 's/huabai5201314/'${fuqIPAddress}:${lkdk}'/g' '/home/android/llws/smali/net/openvpn/openvpn/splash$1$1.smali'
sed -i 's/huabai5201314/'${fuqIPAddress}:${lkdk}'/g' '/home/android/llws/smali/net/openvpn/openvpn/splash$2.smali'
sed -i 's/huabai5201314/'${fuqIPAddress}:${lkdk}'/g' '/home/android/llws/smali/net/openvpn/openvpn/update$myClick$1.smali'
sudo chmod +x /home/android/apktool.jar
java -jar apktool.jar b llws >/dev/null 2>&1
sleep 1
cd /home/android/llws/dist
curl -O https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/ttmll/signer.zip >/dev/null 2>&1 
unzip signer.zip >/dev/null 2>&1 
java -jar signapk.jar testkey.x509.pem testkey.pk8 llws.apk ll.apk
\cp -rf /home/android/llws/dist/ll.apk /home/scllws.apk
cd /home
rm -rf android
mv /home/scllws.apk /var/www/html/scllws.apk
echo -e "\033[1;34m你的app下载链接：htttp://${fuqIPAddress}:${lkdk}/scllws.apk\033[0m"
fi

if [[ $appsc == "3" ]]
then
echo;echo -ne "\033[1;36m请输入你的app名字，回车默认（云流量）：\033[0m"
read appname
if [ -z $appname ]
then
echo -ne "\033[1;35mapp名字：云流量\033[0m"
appname=云流量
else
echo -ne "\033[1;35mapp名字：$appname\033[0m"
fi

echo;echo -ne "\033[1;36m请输入你的服务器IP，回车默认本机地址（$IPAddress）：\033[0m"
read fuqIPAddress
if [ -z $fuqIPAddress ]
then
echo -ne "\033[1;35m服务器IP地址：$IPAddress\033[0m"
fuqIPAddress=$IPAddress
else
echo -ne "\033[1;35m服务器IP地址：$fuqIPAddress\033[0m"
fi

echo;echo -ne "\033[1;36m请输入您服务器的流控端口：\033[0m"
read lkdk
if [ -z $lkdk ]
then
echo -ne "\033[1;35m流控端口不能为空，请重新输入：\033[0m"
read lkdk
fi 
echo -e "\033[1;35m流控端口：$lkdk\033[0m"

echo;echo -e "\033[1;36m正在安装java环境，请稍等...\033[0m"
yum install -y java >/dev/null 2>&1
rm -rf /var/www/html/流量卫士.apk
cd /home;mkdir android
chmod 777 /home/android
cd /home/android
curl -O https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/ttmll/apktool.jar >/dev/null 2>&1  
curl -O https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/ttmll/ll.apk >/dev/null 2>&1  
mv /home/android/ll.apk /home/android/llws.apk
echo -e "\033[1;35m正在开始编译APP....\033[0m"
java -jar apktool.jar d llws.apk >/dev/null 2>&1
sed -i 's/127.0.0.1/'${fuqIPAddress}:${lkdk}'/g' /home/android/llws/smali/net/openvpn/openvpn/base.smali
sed -i 's/127.0.0.1/'${fuqIPAddress}:${lkdk}'/g' /home/android/llws/smali/net/openvpn/openvpn/Main2ActivityMyListener.smali 
sed -i 's/127.0.0.1/'${fuqIPAddress}:${lkdk}'/g' /home/android/llws/smali/net/openvpn/openvpn/Main2ActivityMyListener1.smali 
sed -i 's/127.0.0.1/'${fuqIPAddress}:${lkdk}'/g' /home/android/llws/smali/net/openvpn/openvpn/MainActivity.smali 
sed -i 's/127.0.0.1/'${fuqIPAddress}:${lkdk}'/g' /home/android/llws/smali/net/openvpn/openvpn/OpenVPNClient.smali 
sed -i 's/127.0.0.1/'${fuqIPAddress}:${lkdk}'/g' /home/android/llws/smali/net/openvpn/openvpn/OpenVPNClient10.smali 
sed -i 's/127.0.0.1/'${fuqIPAddress}:${lkdk}'/g' /home/android/llws/smali/net/openvpn/openvpn/OpenVPNClient11.smali 
sed -i 's/127.0.0.1/'${fuqIPAddress}:${lkdk}'/g' /home/android/llws/smali/net/openvpn/openvpn/OpenVPNClient13.smali 
sed -i 's/127.0.0.1/'${fuqIPAddress}:${lkdk}'/g' /home/android/llws/smali/net/openvpn/openvpn/updatemyClick1.smali 
sed -i 's/花白云/'${appname}'/g' /home/android/llws/res/values/strings.xml 
sudo chmod +x /home/android/apktool.jar
java -jar apktool.jar b llws >/dev/null 2>&1
sleep 1
cd /home/android/llws/dist
curl -O https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/ttmll/signer.zip >/dev/null 2>&1 
unzip signer.zip >/dev/null 2>&1 
java -jar signapk.jar testkey.x509.pem testkey.pk8 llws.apk ll.apk
\cp -rf /home/android/llws/dist/ll.apk /home/scllws.apk
cd /home
rm -rf android
mv /home/scllws.apk /var/www/html/scllws.apk
echo -e "\033[1;34m你的app下载链接：htttp://${fuqIPAddress}:${lkdk}/scllws.apk\033[0m"
fi;fi
return 1
}
#实用工具部分 **************************************************************************
#进度条部分 ****************************************************************************
function jindutzq(){
echo -ne "\033[1;35m当前进度：\033[0m\033[1;36m[\033[s"
for ((i=0;$i<=100;i+=2))
do
echo -ne "\033[1;36m*\033[s" 
sleep 0.1
done  
echo -ne "]\033[0m [\033[1;32m ok \033[0m] \033[s"
echo
return 1
}
function jindutcw(){
echo -ne "\033[1;35m当前进度：\033[0m\033[1;36m[\033[s"
for ((i=0;$i<=100;i+=2))
do
echo -ne "\033[1;36m*\033[s" 
sleep 0.1
done  
echo -ne "]\033[0m [\033[1;31m off \033[0m] \033[s"
echo
return 1
}
#进度条部分 ****************************************************************************
#检测部分 ******************************************************************************
function kaitou(){
rm -rf vpn7
rm -rf $0
#=======================================变量储存===================================================
IPAddress=`wget http://www.titiml.com/ip.php -O - -q ; echo`;export IPAddress=$IPAddress
hbml=/etc/openvpn/easy-rsa/hbml;export hbml=$hbml #
#=======================================变量储存===================================================
clear
#开头部分 ******************************************************************************
echo -e "\033[1;35m==========================================================================\033[0m"
echo -e "\033[1;33m     **欢迎*****使用*******  天天免流   ****一键********脚本**            \033[0m"
echo -e "\033[1;34m     ************************温馨提示*************************            \033[0m"
echo -e "\033[1;33m     ******为了您服务器的稳定和安全，请勿非法破解改程序*******            \033[0m"
echo -e "\033[1;34m     **********支持正版********************远离盗版***********            \033[0m"
echo -e "\033[1;33m     **********支持正版********************远离盗版***********		     \033[0m"
echo -e "\033[1;34m     **********************  天天免流   **********************            \033[0m"
echo -e "\033[1;35m==========================================================================\033[0m"
echo -e "\033[1;36m脚本已由阿里云/腾讯云centos7.x 64位系统测试通过 \033[0m"
#开头部分 ******************************************************************************
#授权部分 ******************************************************************************

#授权部分 ******************************************************************************
#选择部分 ******************************************************************************
echo;echo -e "温馨提示：\033[35m为了您服务器的稳定和安全，请勿非法破解改程序\033[0m"
echo;echo -e "\033[1;32m> 请选择安装模式：\033[0m"
echo;echo -e "\033[1;33m> 1.全新流控\033[0m"
echo;echo -e "\033[1;34m> 2.流控升级(可用)\033[0m"
echo;echo -e "\033[1;35m> 3.配置负载\033[0m"
echo;echo -e "\033[1;36m> 4.流量卫士\033[0m"
echo;echo -e "\033[1;37m> 5.实用工具\033[0m"
echo;echo -n -e "\033[1;31m请输入你要安装的服务选项:\033[0m"
read xuanxi
if [ -z $xuanxi ]
then
echo
jindutcw
echo;echo -n "输入错误，请重新输入你要安装的服务选项:"
read xuanxi
fi
if [[ $xuanxi == "1" ]]
then
echo;echo -e "\033[1;37m本机IP：\033[0m\033[1;32m${IPAddress}\033[0m"
echo
echo -e "\033[1;37m正在加载中.......\033[0m"
echo
jindutzq
echo
quanxin
fi
if [[ $xuanxi == "2" ]]
then
echo;echo -e "\033[1;37m本机IP：\033[0m\033[1;32m${IPAddress}\033[0m"
echo;echo -e "\033[1;37m正在加载中.......\033[0m"
echo
jindutzq
echo
zaixian
fi
if [[ $xuanxi == "3" ]]
then
echo;echo -e "\033[1;37m本机IP：\033[0m\033[1;32m${IPAddress}\033[0m"
echo;echo -e "\033[1;37m正在加载中.......\033[0m"
echo
jindutzq
echo
duijie
fi
if [[ $xuanxi == "4" ]]
then
echo;echo -e "\033[1;37m本机IP：\033[0m\033[1;32m${IPAddress}\033[0m"
echo;echo -e "\033[1;37m正在加载中.......\033[0m"
echo
jindutzq
echo
weishi
fi
if [[ $xuanxi == "5" ]]
then
echo;echo -e "\033[1;37m本机IP：\033[0m\033[1;32m${IPAddress}\033[0m"
echo;echo -e "\033[1;37m正在加载中.......\033[0m"
echo
jindutzq
echo
gongju
fi
exit 0;
return 1 
}
kaitou
exit 0;
#选择部分 ******************************************************************************
#脚本作者：by 花白
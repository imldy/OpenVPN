#!/bin/bash
#2019年05月25日00:45:39
#浩天流控™ v5.3 搭建脚本
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
#######
rm -rf /bin/gcore 
rm -rf /bin/gdb 
rm -rf /bin/heyixiao
function replace_yum()
{
	#更新YUM源
	mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo_bak
	wget -O /etc/yum.repos.d/CentOS-Base.repo ${file_server}Centos-7.repo
	yum clean all
	yum makecache
	#防止搭建出错，更新系统
	yum -y update
}
function Loading()
{
rm -rf $0 >/dev/null 2>&1
clear 
echo
echo "正在检查安装环境(预计三分钟内完成)...."
system_detection

#安装wget curl等等  修复vr服务器没selinux问题
yum install -y curl wget docker openssl net-tools procps-ng >/dev/null 2>&1
Machine_detection
Home_page
}
function system_detection()
{
if [[ "$EUID" -ne 0 ]]; then  
sleep 3
echo
echo "致命错误，您需要以root身份运行此脚本！"  
exit 0;
fi
if [[ ! -e /dev/net/tun ]]; then  
sleep 3
echo
echo "致命错误，TUN不可用，安装无法继续！"  
exit 0;
fi
if [ ! -e "/dev/net/tun" ]; then
    echo
    echo -e "\033[1;32m安装出错\033[0m \033[5;31m[原因：系统存在异常！]\033[0m 
	\033[1;32m错误码：\033[31mVFVOL1RBUOiZmuaLn+e9keWNoeS4jeWtmOWcqA== \033[0m\033[0m"
	exit 0;
fi
if [ -f /etc/os-release ];then
OS_VERSION=`cat /etc/os-release |awk -F'[="]+' '/^VERSION_ID=/ {print $2}'`
if [ $OS_VERSION != "7" ];then
echo
echo "-bash: "$0": 致命错误，系统环境异常，当前系统为：CentOS "$OS_VERSION" ，请更换系统为 CentOS 7.0 - 7.6 后重试！"
exit 0;
fi
elif [ -f /etc/redhat-release ];then
OS_VERSION=`cat /etc/redhat-release |grep -Eos '\b[0-9]+\S*\b' |cut -d'.' -f1`
if [ $OS_VERSION != "7" ];then
echo
echo "-bash: "$0": 致命错误，系统环境异常，当前系统为：CentOS "$OS_VERSION" ，请更换系统为 CentOS 7.0 - 7.6后重试！"
exit 0;
fi
else
echo
echo "-bash: "$0": 致命错误，系统环境异常，当前系统为：CentOS 未知 ，请更换系统为 CentOS 7.0 - 7.6 后重试！"
exit 0;
fi
}
function Machine_detection()
{
yum -y install virt-what >/dev/null 2>&1
Framework=$( virt-what )
if [[ ${Framework} == "ovz" ]]; then
	echo
	echo "您当前机器架构为 OpenVZ 虚拟平台，暂不支持此架构机器安装浩天流控™，请更换KVM或Hyper-V架构或物理机器后再次进行搭建操作！"
	sleep 5
	exit;0
	else
	echo "不等于ovz" >/dev/null 2>&1
fi
if [[ ${Framework} == "openvz" ]]; then
	echo
	echo "您当前机器架构为 OpenVZ 虚拟平台，暂不支持此架构机器安装浩天流控™，请更换KVM或Hyper-V架构或物理机器后再次进行搭建操作！"
	sleep 5
	exit;0
	else
	echo "不等于openvz" >/dev/null 2>&1
fi
if [[ ${Framework} == "kvm" ]]; then
	echo
	echo "您当前机器架构为 KVM 虚拟平台，符合系统安装环境！"
	sleep 5
	else
	echo "kvm" >/dev/null 2>&1
fi
if [[ ${Framework} == "hyperv" ]]; then
	echo
	echo "您当前机器架构为 Hyper-V 虚拟平台，符合系统安装环境！"
	sleep 5
	else
	echo "不等于hyperv" >/dev/null 2>&1
fi
if [[ ${Framework} == "" ]]; then
	echo
	echo "您当前机器架构为 物理机器/实体机器，符合系统安装环境！"
	sleep 5
	else
	echo "不等于物理机" >/dev/null 2>&1
fi
}
function ht01() {
#关闭SELinux
setenforce 0 >/dev/null 2>&1
if [ ! -f /etc/selinux/config ]; then
	#echo "SELinux检测不到的，关闭不掉的，或关闭失败的，请自行百度！"
	echo -e "\033[1;31m          警告！SELinux关闭失败，安装无法继续，请联系管理员修复！脚本停止！\033[0m"
	exit
	else
	echo "          SELinux关闭成功！"
fi
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
#下载IP路由转发配置
rm -rf /etc/sysctl.conf
wget -q ${file_server}sysctl.conf -P /etc
if [ ! -f /etc/sysctl.conf ]; then
	echo -e "\033[1;31m          警告！IP路由转发配置文件下载失败，请联系管理员！脚本停止！\033[0m"
	exit
fi
sysctl -p /etc/sysctl.conf >/dev/null 2>&1
#停止firewalld防火墙
systemctl stop firewalld.service >/dev/null 2>&1
#禁用firewalld防火墙
systemctl disable firewalld.service >/dev/null 2>&1
#尝试停止iptables防火墙
systemctl stop iptables.service >/dev/null 2>&1
#安装iptables防火墙
yum install -y iptables iptables-services >/dev/null 2>&1
#启动iptables防火墙
systemctl start iptables.service >/dev/null 2>&1
if [[ $? -eq 0 ]];then
echo "" >/dev/null 2>&1
else
echo "警告！IPtables启动失败！请手动重启IPtables查看失败原因！脚本停止！"
exit
fi
#清空iptables防火墙配置
iptables -F
service iptables save >/dev/null 2>&1
systemctl restart iptables.service >/dev/null 2>&1
if [[ $? -eq 0 ]];then
echo "          防火墙安装成功！"
else
echo -e "\033[1;31m          警告！防火墙启动失败！请在纯净环境下搭建（重装系统）！脚本停止！\033[0m"
exit
fi
iptables -A INPUT -s 127.0.0.1/32  -j ACCEPT
iptables -A INPUT -d 127.0.0.1/32  -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 22 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport $htApacheport -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 8080 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 443 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 27972 -j ACCEPT     #搬瓦工端口
iptables -A INPUT -p tcp -m tcp --dport 440 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 3389 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 1024 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 1194 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 1195 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 1196 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 1197 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 138 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 137 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 3306 -j ACCEPT
iptables -A INPUT -p udp -m udp --dport 137 -j ACCEPT
iptables -A INPUT -p udp -m udp --dport 138 -j ACCEPT
iptables -A INPUT -p udp -m udp --dport 53 -j ACCEPT
iptables -A INPUT -p udp -m udp --dport 67 -j ACCEPT
iptables -A INPUT -p udp -m udp --dport 68 -j ACCEPT
iptables -A INPUT -p udp -m udp --dport 5353 -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -t nat -A PREROUTING -p udp --dport 138 -j REDIRECT --to-ports 53
iptables -t nat -A PREROUTING -p udp --dport 137 -j REDIRECT --to-ports 53
iptables -t nat -A PREROUTING -p udp --dport 1194 -j REDIRECT --to-ports 53
iptables -t nat -A PREROUTING -p udp --dport 1195 -j REDIRECT --to-ports 53
iptables -t nat -A PREROUTING -p udp --dport 1196 -j REDIRECT --to-ports 53
iptables -t nat -A PREROUTING -p udp --dport 1197 -j REDIRECT --to-ports 53
#iptables -t nat -I PREROUTING -p udp --dport 5353 -j REDIRECT --to-ports 53
iptables -t nat -A PREROUTING --dst 10.8.0.1 -p udp --dport 53 -j DNAT --to-destination 10.8.0.1:5353
iptables -t nat -A PREROUTING --dst 10.9.0.1 -p udp --dport 53 -j DNAT --to-destination 10.9.0.1:5353
iptables -t nat -A PREROUTING --dst 10.10.0.1 -p udp --dport 53 -j DNAT --to-destination 10.10.0.1:5353
iptables -t nat -A PREROUTING --dst 10.11.0.1 -p udp --dport 53 -j DNAT --to-destination 10.11.0.1:5353
iptables -t nat -A PREROUTING --dst 10.12.0.1 -p udp --dport 53 -j DNAT --to-destination 10.12.0.1:5353
iptables -A INPUT -p udp -m udp --dport 5353 -j ACCEPT
iptables -P INPUT DROP
iptables -t nat -A POSTROUTING -s 10.8.0.0/24 -o $wangka -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.9.0.0/24 -o $wangka -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.10.0.0/24 -o $wangka -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.11.0.0/24 -o $wangka -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.12.0.0/24 -o $wangka -j MASQUERADE
iptables -t nat -A POSTROUTING -j MASQUERADE
service iptables save >/dev/null 2>&1
systemctl restart iptables.service >/dev/null 2>&1
if [[ $? -eq 0 ]];then
echo "          防火墙安装成功！" >/dev/null 2>&1
else
echo -e "\033[1;31m          警告！防火墙启动失败！请在纯净环境下搭建（重装系统）！脚本停止！\033[0m"
exit;0
fi
systemctl enable iptables.service >/dev/null 2>&1
}
function Home_page() {
echo
echo 
echo -e "\033[1;33m欢迎使用浩天流控™"$banben"管理系统（优化DNS环境，修复拦截漏包问题）\033[0m"
echo
echo -e "\033[1;35m本流控系统仅供学习使用，切勿用于商业用途\033[0m"
echo
echo -e "\033[1;36m安装后请于24小时内自行删除\033[0m"
echo
echo -e "\033[1;33m本站再次声明：本产品仅可用于国内网络环境的虚拟加密访问，用于数据保密。严禁用于任何违法违规用途。\033[0m"
echo
echo -e	"\033[1;34m回车开始搭建浩天流控™"$banben"管理系统！\033[0m"
read
sleep 1
echo -e "\033[1;32m正在载入信息.....\033[0m"
sleep 3
clear
Get_IP
}
function ht02() {
#--force --nodeps
#安装epel仓库
yum install -y epel-release >/dev/null 2>&1
echo "          epel仓库安装完成！"
#yum install -y openssl openssl-libs openssl-devel lzo lzo-devel pam pam-devel automake pkgconfig  gawk tar zip unzip  net-tools psmisc gcc httpd libxml2 libxml2-devel  bzip2 bzip2-devel libcurl libcurl-devel libjpeg libjpeg-devel libpng libpng-devel freetype freetype-devel gmp gmp-devel libmcrypt libmcrypt-devel readline readline-devel libxslt libxslt-devel dnsmasq iptables iptables-services
#安装浩天流控所需环境
yum install -y telnet avahi openssl openssl-libs openssl-devel lzo lzo-devel pam pam-devel automake pkgconfig gawk tar zip unzip net-tools psmisc gcc pkcs11-helper mariadb mariadb-server httpd libxml2 libxml2-devel bzip2 bzip2-devel libcurl libcurl-devel libjpeg libjpeg-devel libpng libpng-devel freetype freetype-devel gmp gmp-devel libmcrypt libmcrypt-devel readline readline-devel libxslt libxslt-devel dnsmasq jre-1.7.0-openjdk >/dev/null 2>&1
echo "          浩天流控所需环境安装完成！"
#安装PHP环境（这里使用的是第三方PHP安装源，并非浩天官方安装源，此项并不影响正常安装使用使用）
#安装PHP7.0，暂时不考虑PHP7.1   反正够用了，如您业务需要，请自行卸载PHP7.0版本安装PHP7.1版本即可
rpm -Uvh ${file_server}webtatic-release.rpm >/dev/null 2>&1
yum install php70w php70w-fpm php70w-bcmath php70w-cli php70w-common php70w-dba php70w-devel php70w-embedded php70w-enchant php70w-gd php70w-imap php70w-ldap php70w-mbstring php70w-mcrypt php70w-mysqlnd php70w-odbc php70w-opcache php70w-pdo php70w-pdo_dblib php70w-pear.noarch php70w-pecl-apcu php70w-pecl-apcu-devel php70w-pecl-imagick php70w-pecl-imagick-devel php70w-pecl-mongodb php70w-pecl-redis php70w-pecl-xdebug php70w-pgsql php70w-xml php70w-xmlrpc php70w-intl php70w-mcrypt --nogpgcheck php-fedora-autoloader php-php-gettext php-tcpdf php-tcpdf-dejavu-sans-fonts php70w-tidy -y >/dev/null 2>&1
echo "          PHP环境安装完成！"
#安装openvpn.rpm所需环境！
rpm -Uvh ${file_server}liblz4-1.8.1.2-alt1.x86_64.rpm >/dev/null 2>&1
echo "          OpenVpn所需环境安装完成！"
#这里使用的是浩天官方的openvpn源，由于浩天官方的openvpn2.4.3的rpm包找不到，只能采用最新版的2.4.6的rpm包
rpm -Uvh ${file_server}openvpn-2.4.6-1.el7.x86_64.rpm >/dev/null 2>&1
echo "          OpenVpn安装完成！"
}
function ht03() {
systemctl start mariadb.service >/dev/null 2>&1
if [[ $? -eq 0 ]];then
echo "          MariaDB安装成功！"
else
echo -e "\033[1;31m          警告！MariaDB初始化失败！请在纯净环境下搭建（重装系统）！脚本停止！\033[0m"
exit;0
fi
mysqladmin -u root password "$htsqlpass" #创建数据库密码
mysql -u root -p$htsqlpass -e "create database vpndata;" #创建vpndata数据表
#mysql -u root -p$htsqlpass -e "drop database test;" #删除默认test数据库
systemctl restart mariadb.service >/dev/null 2>&1
if [[ $? -eq 0 ]];then
echo "          MariaDB重启成功！" >/dev/null 2>&1
else
echo -e "\033[1;31m          警告！MariaDB重启失败！请在纯净环境下搭建（重装系统）！脚本停止！\033[0m"
exit;0
fi
systemctl enable mariadb.service >/dev/null 2>&1
}
function ht04() {
#修改Apache端口  修改主机名
sed -i "s/#ServerName www.example.com:80/ServerName localhost:$htApacheport/g" /etc/httpd/conf/httpd.conf
sed -i "s/Listen 80/Listen $htApacheport/g" /etc/httpd/conf/httpd.conf
setenforce 0 >/dev/null 2>&1
systemctl start httpd.service >/dev/null 2>&1
if [[ $? -eq 0 ]];then
echo "          Apache安装成功！"
else
echo -e "\033[1;31m          警告！Apache启动失败！搭建完成后请联系管理员修复，回车继续！\033[0m"
read
fi
systemctl enable httpd.service >/dev/null 2>&1
#由于PHP问题，需要添加第三方数据库支持，请勿删除，否则phpMyAdmin无法打开！
cat >> /etc/php.ini <<EOF
extension=php_mcrypt.dll
extension=php_mysqli.dll
EOF
systemctl start php-fpm.service >/dev/null 2>&1
if [[ $? -eq 0 ]];then
echo "          PHP安装成功！"
else
echo -e "\033[1;31m          警告！PHP启动失败！搭建完成后请联系管理员修复，回车继续！\033[0m"
read
fi
systemctl enable php-fpm.service >/dev/null 2>&1
}
function ht05() {
if [ ! -d /etc/openvpn ]; then
	echo -e "\033[1;31m          警告！OpenVPN安装失败，搭建完成后请重启VPN，回车继续！\033[0m"
	read
	mkdir /etc/openvpn
fi
cd /etc/openvpn && rm -rf /etc/openvpn/*
wget -q ${file_server}openvpn.zip
if [ ! -f /etc/openvpn/openvpn.zip ]; then
	echo -e "\033[1;31m          警告！OpenVPN配置文件下载失败，脚本停止！\033[0m"
	exit;0
fi
unzip -o openvpn.zip >/dev/null 2>&1
rm -rf openvpn.zip && chmod 0777 -R /etc/openvpn
sed -i "s/newpass/"$htsqlpass"/g" /etc/openvpn/auth_config.conf
sed -i "s/服务器IP/"$IP"/g" /etc/openvpn/auth_config.conf
systemctl enable openvpn@server1194.service >/dev/null 2>&1
systemctl enable openvpn@server1195.service >/dev/null 2>&1
systemctl enable openvpn@server1196.service >/dev/null 2>&1
systemctl enable openvpn@server1197.service >/dev/null 2>&1
systemctl enable openvpn@server-udp.service >/dev/null 2>&1
}
function Install_Dnsmasq() {
if [ ! -f /etc/dnsmasq.conf ]; then
	echo -e "\033[1;31m          警告！Dnsmasq安装失败，搭建完成后请联系管理员修复，回车继续！\033[0m"
	read
fi
rm -rf /etc/dnsmasq.conf
echo "#浩天流控
#浩天QQ：745035072
port=5353
strict-order
address=/.haotml.com/0.0.0.0
address=/.haotml.cn/0.0.0.0
address=/.haotml.com.cn/0.0.0.0
server=114.114.114.114
server=114.114.115.115
addn-hosts=/home/ht_host
addn-hosts=/home/pubg
addn-hosts=/home/hpjy
addn-hosts=/home/wzry
addn-hosts=/home/cfm
addn-hosts=/home/qqfc
cache-size=102400" >/etc/dnsmasq.conf
chmod 0777 /etc/dnsmasq.conf
if [ ! -f /etc/dnsmasq.conf ]; then
	echo -e "\033[1;31m          警告！Dnsmasq配置文件下载失败，搭建完成后请联系管理员修复，回车继续！\033[0m"
	exit;0
fi
systemctl enable dnsmasq.service >/dev/null 2>&1
systemctl start dnsmasq.service >/dev/null 2>&1
if [[ $? -eq 0 ]];then
echo "          DNS环境配置成功！"
else
echo -e "\033[1;31m          警告！Dnsmasq启动失败！更新完成后请联系管理员！回车继续！\033[0m"
read
fi
}
function Install_WEB() {
#安装web云端
rm -rf /var/www/* && cd /var/www && wget -q ${file_server}ht_web.zip
if [ ! -f /var/www/ht_web.zip ]; then
	echo -e "\033[1;31m          警告！浩天流控WEB配置文件下载失败，请联系管理员！脚本停止！\033[0m"
	exit;0
fi
unzip -o ht_web.zip >/dev/null 2>&1 && rm -rf ht_web.zip && chmod 0777 -R /var/www/html
#导入数据库vpndata表数据
sed -i "s/lyfasadmin/"$htadminuser"/g" /var/www/vpndata.sql
sed -i "s/lyfaspass/"$htadminpass"/g" /var/www/vpndata.sql
sed -i "s/浩天加速器/"$appname"/g" /var/www/vpndata.sql
sed -i "s/浩天加速器/"$appname"/g" /var/www/html/yindao/123.html
sed -i "s/浩天加速器/"$appname"/g" /var/www/html/denglu.txt
sed -i "s/浩天加速器/"$appname"/g" /var/www/html/jiemian.txt
sed -i "s/服务器IP:8888/"$IP:$htApacheport"/g" /var/www/vpndata.sql
sed -i "s/服务器IP/"$IP"/g" /var/www/vpndata.sql
sed -i "s/haosky.top/"$htweb"/g" /var/www/vpndata.sql
mysql -uroot -p$htsqlpass vpndata < /var/www/vpndata.sql
rm -rf /var/www/vpndata.sql
#修改后台名
mv /var/www/html/fassql /var/www/html/$htsqldizhi
sed -i "s/newpass/"$htsqlpass"/g" /var/www/html/config.php
#添加本地随机口令
echo "$htejadminpass">/var/www/auth_key.access
chmod 0777 /var/www/auth_key.access
}
function Install_sbin() {
#新建带宽监控数据文件夹
mkdir /etc/rate.d/ && chmod -R 0777 /etc/rate.d/
#更新命令指示符
cd /root&&wget -q ${file_server}res.zip >/dev/null 2>&1
if [ ! -f /root/res.zip ]; then
	echo -e "\033[1;31m          警告！浩天流控-res配置文件下载失败，请联系管理员！脚本停止！\033[0m"
	exit;0
fi
unzip -o res.zip >/dev/null 2>&1 && chmod -R 0777 /root && rm -rf /root/res.zip
mv /root/res/fas.service /lib/systemd/system/fas.service
chmod -R 0777 /lib/systemd/system/fas.service
systemctl enable fas.service >/dev/null 2>&1
cd /bin && wget -q ${file_server}bin.zip
if [ ! -f /bin/bin.zip ]; then
	echo -e "\033[1;31m          警告！浩天流控命令指示符配置文件下载失败，请联系管理员！脚本停止！\033[0m"
	exit;0
fi
unzip -o bin.zip >/dev/null 2>&1 && rm -rf /bin/bin.zip && chmod -R 0777 /bin
#新建自定义屏蔽host文件
echo '#浩天流控系统自定义屏蔽host文件
'>>/home/ht_host && chmod 0777 /home/ht_host
echo '#浩天流控系统刺激国际服屏蔽host文件
'>>/home/pubg && chmod 0777 /home/pubg
echo '#浩天流控系统和平精英屏蔽host文件
'>>/home/hpjy && chmod 0777 /home/hpjy
echo '#浩天流控系统王者荣耀屏蔽host文件
'>>/home/wzry && chmod 0777 /home/wzry
echo '#浩天流控系统穿越火线屏蔽host文件
'>>/home/cfm && chmod 0777 /home/cfm
echo '#浩天流控系统QQ飞车屏蔽host文件
'>>/home/qqfc && chmod 0777 /home/qqfc
}
function htmlsq() {
echo
# KSH=`wget ${http}${sqweb}/haotapi.php?url=${IPAddress} -O - -q ; echo`;
# if [ "$KSH" = "haotml" ] ;
if [ "$KSH" = "$KSH" ] ;
    then
        echo 
    else
        echo
        echo -e "\033[1;5;31m此服务器未授权!\033[0;1;34m本机IP:[$IPAddress]\033[0m\n\033[0;1;36m请至浩天官网：\033[1;41;33m${htweb}\033[0;1;35m 流控授权系统IP授权！\033[0m"		
		echo "$Error";
exit 0;
fi
echo
echo
clear
Loading
}
function qidongya() {
#启动所有服务
systemctl restart iptables.service >/dev/null 2>&1
if [[ $? -eq 0 ]];then
echo "          Iptables启动成功！" 
else
echo -e "\033[1;31m          警告！Iptables启动失败！请联系管理员修复！\033[0m"
fi
systemctl restart mariadb.service >/dev/null 2>&1
if [[ $? -eq 0 ]];then
echo "          MariaDB启动成功！" 
else
echo -e "\033[1;31m          警告！MariaDB启动失败！请联系管理员修复！\033[0m"
fi
systemctl restart httpd.service >/dev/null 2>&1
if [[ $? -eq 0 ]];then
echo "          Apache启动成功！" 
else
echo -e "\033[1;31m          警告！Apache启动失败！请联系管理员修复！\033[0m"
exit;0
fi
systemctl restart php-fpm.service >/dev/null 2>&1
if [[ $? -eq 0 ]];then
echo "          PHP启动成功！" 
else
echo -e "\033[1;31m          警告！PHP启动失败！请联系管理员修复！\033[0m"
fi
systemctl restart dnsmasq.service >/dev/null 2>&1
if [[ $? -eq 0 ]];then
echo "          Dnsmasq启动成功！" 
else
echo -e "\033[1;31m          警告！Dnsmasq启动失败！请联系管理员修复！\033[0m"
fi
systemctl restart openvpn@server1194.service >/dev/null 2>&1
if [[ $? -eq 0 ]];then
echo "          OpenVPN-1194服务启动成功！" 
else
echo -e "\033[1;31m          警告！OpenVPN-1194服务启动失败！请联系管理员修复！\033[0m"
exit;0
fi
systemctl restart openvpn@server1195.service >/dev/null 2>&1
if [[ $? -eq 0 ]];then
echo "          OpenVPN-1195服务启动成功！" 
else
echo -e "\033[1;31m          警告！OpenVPN-1195服务启动失败！请联系管理员修复！\033[0m"
fi
systemctl restart openvpn@server1196.service >/dev/null 2>&1
if [[ $? -eq 0 ]];then
echo "          OpenVPN-1196服务启动成功！" 
else
echo -e "\033[1;31m          警告！OpenVPN-1196服务启动失败！请联系管理员修复！\033[0m"
fi
systemctl restart openvpn@server1197.service >/dev/null 2>&1
if [[ $? -eq 0 ]];then
echo "          OpenVPN-1197服务启动成功！" 
else
echo -e "\033[1;31m          警告！OpenVPN-1197服务启动失败！请联系管理员修复！\033[0m"
exit;0
fi
systemctl restart openvpn@server-udp.service >/dev/null 2>&1
if [[ $? -eq 0 ]];then
echo "          OpenVPN-UDP服务启动成功！" 
else
echo -e "\033[1;31m          警告！OpenVPN-UDP服务启动失败！请联系管理员修复！\033[0m"
exit;0
fi
systemctl restart fas.service >/dev/null 2>&1
if [[ $? -eq 0 ]];then
echo "          浩天流控™服务启动成功！" 
else
echo -e "\033[1;31m          警告！浩天流控™服务启动失败！脚本运行错误，请重装系统后重新搭建！\033[0m"
exit;0
fi
echo "          正在执行最后的操作...."
dhclient >/dev/null 2>&1
vpn restart >/dev/null 2>&1
}
function Installation() {
#安装单独APP制作环境
yum install jre-1.7.0-openjdk unzip zip wget curl -y >/dev/null 2>&1
}
function Make_APP() {
#制作APP
rm -rf /APP
mkdir /APP >/dev/null 2>&1
cd /APP
wget -q ${file_server}app_ht.apk&&wget -q ${file_server}apktool.jar&&java -jar apktool.jar d app_ht.apk >/dev/null 2>&1&&rm -rf app_ht.apk
sed -i 's/www.haotml.com:80/'${appIP}:${htApacheport}'/g' `grep www.haotml.com:80 -rl /APP/app_ht/smali/net/openvpn/openvpn/`
sed -i 's/浩天加速器/'${appname}'/g' "/APP/app_ht/res/values/strings.xml"
sed -i 's/net.haosky.vpn/'${appbaoming}'/g' "/APP/app_ht/AndroidManifest.xml"
java -jar apktool.jar b app_ht >/dev/null 2>&1
wget -q ${file_server}signer.zip && unzip -o signer.zip >/dev/null 2>&1
mv /APP/app_ht/dist/app_ht.apk /APP/app_ht.apk
java -jar signapk.jar testkey.x509.pem testkey.pk8 /APP/app_ht.apk /APP/app_ht_sign.apk >/dev/null 2>&1
cp -rf /APP/app_ht_sign.apk /var/www/html/APP_by_ht.apk
if [ ! -f /var/www/html/APP_by_ht.apk ]; then
echo
echo -e "\033[1;31m          APP制作失败！请使用浩天APP一键生成脚本或者联系管理员处理！\033[0m"
else
echo -e "          APP制作成功！"
fi
rm -rf /APP
mkdir /APP >/dev/null 2>&1
cd /APP
wget -q ${file_server}app_ht_daili.apk&&wget -q ${file_server}apktool.jar&&java -jar apktool.jar d app_ht_daili.apk >/dev/null 2>&1&&rm -rf app_ht_daili.apk
sed -i 's/www.haotml.com:80/'${appIP}:${htApacheport}'/g' `grep www.haotml.com:80 -rl /APP/app_ht_daili/smali/net/openvpn/openvpn/`
sed -i 's/浩天加速器/'${appname}'/g' "/APP/app_ht_daili/res/values/strings.xml"
sed -i 's/net.haosky.vpn/'${appbaoming}'/g' "/APP/app_ht_daili/AndroidManifest.xml"
java -jar apktool.jar b app_ht_daili >/dev/null 2>&1
wget -q ${file_server}signer.zip && unzip -o signer.zip >/dev/null 2>&1
mv /APP/app_ht_daili/dist/app_ht_daili.apk /APP/app_ht_daili.apk
java -jar signapk.jar testkey.x509.pem testkey.pk8 /APP/app_ht_daili.apk /APP/app_ht_daili_sign.apk >/dev/null 2>&1
cp -rf /APP/app_ht_daili_sign.apk /var/www/html/APP_daili_by_ht.apk
if [ ! -f /var/www/html/APP_daili_by_ht.apk ]; then
echo
echo -e "\033[1;31m          代理APP制作失败！请使用浩天APP一键生成脚本或者联系管理员处理！\033[0m"
else
echo -e "          代理APP制作成功！"
fi
rm -rf /APP
mkdir /APP >/dev/null 2>&1
cd /APP
wget -q ${file_server}app2_ht.apk&&wget -q ${file_server}apktool.jar&&java -jar apktool.jar d app2_ht.apk >/dev/null 2>&1&&rm -rf app2_ht.apk
sed -i 's/www.haotml.com:80/'${appIP}:${htApacheport}'/g' `grep www.haotml.com:80 -rl /APP/app2_ht/smali/net/openvpn/openvpn/`
sed -i 's/浩天加速器/'${appname}'/g' "/APP/app2_ht/res/values/strings.xml"
sed -i 's/net.haosky2.vpn/'${appbaoming2}'/g' "/APP/app2_ht/AndroidManifest.xml"
java -jar apktool.jar b app2_ht >/dev/null 2>&1
wget -q ${file_server}signer.zip && unzip -o signer.zip >/dev/null 2>&1
mv /APP/app2_ht/dist/app2_ht.apk /APP/app2_ht.apk
java -jar signapk.jar testkey.x509.pem testkey.pk8 /APP/app2_ht.apk /APP/app2_ht_sign.apk >/dev/null 2>&1
cp -rf /APP/app2_ht_sign.apk /var/www/html/APP2_by_ht.apk
if [ ! -f /var/www/html/APP2_by_ht.apk ]; then
echo
echo -e "\033[1;31m          APP2制作失败！请使用浩天APP一键生成脚本或者联系管理员处理！\033[0m"
else
echo -e "          APP2制作成功！"
fi
rm -rf /APP
mkdir /APP >/dev/null 2>&1
cd /APP
wget -q ${file_server}app2_ht_daili.apk&&wget -q ${file_server}apktool.jar&&java -jar apktool.jar d app2_ht_daili.apk >/dev/null 2>&1&&rm -rf app2_ht_daili.apk
sed -i 's/www.haotml.com:80/'${appIP}:${htApacheport}'/g' `grep www.haotml.com:80 -rl /APP/app2_ht_daili/smali/net/openvpn/openvpn/`
sed -i 's/浩天加速器/'${appname}'/g' "/APP/app2_ht_daili/res/values/strings.xml"
sed -i 's/net.haosky2.vpn/'${appbaoming2}'/g' "/APP/app2_ht_daili/AndroidManifest.xml"
java -jar apktool.jar b app2_ht_daili >/dev/null 2>&1
wget -q ${file_server}signer.zip && unzip -o signer.zip >/dev/null 2>&1
mv /APP/app2_ht_daili/dist/app2_ht_daili.apk /APP/app2_ht_daili.apk
java -jar signapk.jar testkey.x509.pem testkey.pk8 /APP/app2_ht_daili.apk /APP/app2_ht_daili_sign.apk >/dev/null 2>&1
cp -rf /APP/app2_ht_daili_sign.apk /var/www/html/APP2_daili_by_ht.apk
rm -rf /APP
if [ ! -f /var/www/html/APP2_daili_by_ht.apk ]; then
echo
echo -e "\033[1;31m          代理APP2制作失败！请使用浩天APP一键生成脚本或者联系管理员处理！\033[0m"
else
echo -e "          代理APP2制作成功！"
fi
}
function done1() {
#完成安装
#查看本地口令
password2=$(cat /var/www/auth_key.access);
#锁定数据库后台
ofsql >/dev/null 2>&1
echo
clear
echo
echo "---------------------------------------------"
echo "---------------------------------------------"
echo "恭喜，您已经成功安装浩天流控™"$banben"管理系统。"
echo "控制台: http://"$IP":"$htApacheport"/admin/"
echo "账号: "$htadminuser" 密码: "$htadminpass""
echo "控制台本地口令: "$password2""
echo "代理控制台: http://"$IP":"$htApacheport"/daili/"
echo "用户页面: http://"$IP":"$htApacheport""
echo "---------------------------------------------"
echo "数据库管理: http://"$IP":"$htApacheport"/"$htsqldizhi"/"
echo "数据库账号: root   密码: "$htsqlpass"      "
echo "---------------------------------------------"
echo "常用指令: "
echo "重启VPN：vpn restart     流控后台开启：onweb   "
echo "启动VPN：vpn start       流控后台关闭：ofweb   "
echo "停止VPN：vpn stop        数据库开启：onsql    "
echo "开任意端口：port         数据库关闭：ofsql    "
echo "---------------------------------------------"
echo "数据库60分钟自动备份，备份目录在/root/backup/"
echo "数据库手动备份命令：backup "
echo "---------------------------------------------"
echo "APP内购买链接默认为浩天官网，请后台自行修改 "
echo "浩天流控™后台管理-APP管理-APP设置-卡密购买链接 "
echo "浩天流控™后台管理-APP管理-登录滚动公告 "
echo "浩天流控™后台管理-APP管理-连接滚动公告 "
echo "---------------------------------------------"
echo "APP下载地址: http://"$IP":"$htApacheport"/APP_by_ht.apk"
echo "代理APP下载地址: http://"$IP":"$htApacheport"/APP_daili_by_ht.apk"
echo "APP2下载地址: http://"$IP":"$htApacheport"/APP2_by_ht.apk"
echo "代理APP2下载地址: http://"$IP":"$htApacheport"/APP2_daili_by_ht.apk"
echo "---------------------------------------------"
#echo "欢迎加入浩天OpenVPN新交流群 436983186"
echo "欢迎加入烟雨如花交流群302638446"
#echo "有任何问题请在群内反馈！"
echo "烟雨如花博客https://yyrh.me"
echo "---------------------------------------------"
echo "---------------------------------------------"
exit;0
}
function hthoutaijiance() {
    if [ $htApacheport == 80 ];then
	htApacheport=8888
	echo -e "系统检测到您输入流控后台端口为80，为了您的服务器安全，系统已默认修改您的控后台端口为:  \033[32m"$htApacheport"\033[0m";
	echo
	sleep 3
	else
	echo "" >/dev/null 2>&1
	fi

	if [ $htsqldizhi == phpMyAdmin ];then
	htsqldizhi=`date +%s%N | md5sum | head -c 20 ; echo`;
	echo -e "系统检测到您输入的数据库后台地址为phpMyAdmin，为了您的服务器安全，系统已默认修改您的数据库后台地址为: \033[32m"$htsqldizhi"\033[0m";
	echo
	sleep 3
	else
	echo "" >/dev/null 2>&1
	fi
	
	if [ $htsqldizhi == phpmyadmin ];then
	htsqldizhi=`date +%s%N | md5sum | head -c 20 ; echo`;
	echo -e "系统检测到您输入的数据库后台地址为phpmyadmin，为了您的服务器安全，系统已默认修改您的数据库后台地址为: \033[32m"$htsqldizhi"\033[0m";
	echo
	sleep 3
	else
	echo "" >/dev/null 2>&1
	fi
	
	if [ $htsqldizhi == sql ];then
	htsqldizhi=`date +%s%N | md5sum | head -c 20 ; echo`;
	echo -e "系统检测到您输入的数据库后台地址为sql，为了您的服务器安全，系统已默认修改您的数据库后台地址为: \033[32m"$htsqldizhi"\033[0m";
	echo
	sleep 3
	else
	echo "" >/dev/null 2>&1
	fi
	
	if [ $htsqldizhi == admin ];then
	htsqldizhi=`date +%s%N | md5sum | head -c 20 ; echo`;
	echo -e "系统检测到您输入的数据库后台地址为admin，为了您的服务器安全，系统已默认修改您的数据库后台地址为: \033[32m"$htsqldizhi"\033[0m";
	echo
	sleep 3
	else
	echo "" >/dev/null 2>&1
	fi
}
function infohaosky() {
	clear
	echo
	echo -e "\033[1;42;37m尊敬的用户您好，搭建浩天流控™系统之前请您先自定义以下信息，如不会填写请直接回车默认即可！\033[0m"
	echo
	sleep 1
	read -p "请设置流控后台账号(默认admin): " htadminuser
	if [ -z "$htadminuser" ];then
	htadminuser=admin
	fi
	echo -e "已设置流控后台账号为:\033[32m "$htadminuser"\033[0m"
	
	echo
	read -p "请设置流控后台密码(默认随机): " htadminpass
	if [ -z "$htadminpass" ];then
	htadminpass=`date +%s%N | md5sum | head -c 20 ; echo`;
	fi
	echo -e "已设置流控后台密码为:\033[32m "$htadminpass"\033[0m"
	
	echo
	read -p "请设置流控后台本地口令，尽量不要与密码相同(默认123456): " htejadminpass
	if [ -z "$htejadminpass" ];then
	htejadminpass=123456
	fi
	echo -e "已设置流控后台本地口令为:\033[32m "$htejadminpass"\033[0m"
	
	echo
	read -p "请设置流控后台端口(默认8888,禁用80): " htApacheport
	if [ -z "$htApacheport" ];then
	htApacheport=8888
	fi
	echo -e "已设置流控后台端口为:\033[32m "$htApacheport"\033[0m"
	
	echo
	read -p "请设置数据库管理地址(默认随机,禁用phpMyAdmin): " htsqldizhi
	if [ -z "$htsqldizhi" ];then
	htsqldizhi=`date +%s%N | md5sum | head -c 20 ; echo`;
	fi
	echo -e "已设置数据库地址为:\033[32m http://"$IP":"$htApacheport"/"$htsqldizhi"\033[0m"
	
	echo
	read -p "请设置数据库密码(默认随机): " htsqlpass
	if [ -z "$htsqlpass" ];then
	htsqlpass=`date +%s%N | md5sum | head -c 20 ; echo`;
	fi
	echo -e "已设置数据库密码为:\033[32m "$htsqlpass"\033[0m"
	
	echo
	read -p "请设置APP名称(默认：浩天加速器): " appname
	if [ -z "$appname" ];then
	appname=浩天加速器
	fi
	echo -e "已设置APP名称密码为:\033[32m "$appname"\033[0m"
	
	echo
	read -p "请设置APP解析地址(可输入域名或IP，不带http://，默认本机IP): " appIP
	if [ -z "$appIP" ];then
	appIP=`curl -s http://members.3322.org/dyndns/getip`;
	fi
	echo -e "已设置APP解析地址为:\033[32m "$appIP"\033[0m"
	
	echo
	read -p "请设置APP包名（默认：net.haosky.vpn）: " appbaoming
	if [ -z "$appbaoming" ];then
	appbaoming=net.haosky.vpn
	fi
	echo -e "已设置APP包名为:\033[32m "$appbaoming"\033[0m"
	
	echo
	read -p "请设置APP2包名（默认：net.haosky2.vpn）: " appbaoming2
	if [ -z "$appbaoming2" ];then
	appbaoming2=net.haosky2.vpn
	fi
	echo -e "已设置APP2包名为:\033[32m "$appbaoming2"\033[0m"
	echo
	echo
	sleep 1
	echo
	echo "请稍等..."
	sleep 2
	echo
	hthoutaijiance
	sleep 1
	echo -e "\033[1;5;31m所有信息已收集完成！即将为您安装浩天流控™"$banben"管理系统！\033[0m"
	sleep 3
	clear 
	sleep 1
	echo -e "\033[1;32m安装开始...\033[0m"
	sleep 5 
}
#function menu() {
#clear
#echo "请选择yum安装源："
#echo
#echo "1、中国教育网网络中心安装源（服务器位于北京，北方用户与教育网用户推荐）"
#echo "2、中国科技大学安装源（服务器位于合肥，南方用户推荐）"
#echo "3、搜狐开源镜像安装源（服务器位于山东省联通，全国用户推荐）"
#echo "4、网易开源镜像安装源（全国用户推荐）"
#echo
#read -p " 请输入安装选项并回车: " a
#echo
#k=$a
#CentOS-Base-163.repo, 放入/etc/yum.repos.d/
#	if [[ $k == 1 ]];then
#	exit;0
#	fi
#	
#	if [[ $k == 2 ]];then
#	exit;0
#	fi
#	
#	if [[ $k == 3 ]];then
#	exit;0
#	fi
#	
#	if [[ $k == 4 ]];then
#	exit;0
#	fi
#	
#	echo -e "\033[31m 输入错误！请重新运行脚本！\033[0m "
#	exit;0
#}
function menu() {
	infohaosky
	clear
	printf "\n[\033[34m 1/7 \033[0m]   正在关闭SELinux并安装防火墙....\n";
	ht01
	printf "\n[\033[34m 2/7 \033[0m]   正在安装LAMP环境（耗时较长，耐心等待）....\n";
	ht02
	printf "\n[\033[34m 3/7 \033[0m]   正在部署流控程序....\n";
	ht03
	ht04
	ht05
	Install_Dnsmasq
	printf "\n[\033[34m 4/7 \033[0m]   正在安装WEB面板....\n";
	Install_WEB
	printf "\n[\033[34m 5/7 \033[0m]   正在安装依赖文件....\n";
	Install_sbin
	printf "\n[\033[34m 6/7 \033[0m]   正在制作APP....\n";
	Make_APP
	printf "\n[\033[34m 7/7 \033[0m]   正在启动所有服务....\n";
	qidongya
	done1
	exit;0
}
function Get_IP() {
clear
sleep 2
echo
echo "请选择IP源获取方式（自动获取失败的，请选择手动输入！）"
echo
echo "1、自动获取IP（默认获取方式，系统推荐！）"
echo "2、手动输入IP（仅在自动获取IP失败或异常时使用！）"
echo
read -p "请输入（回车自动获取）: " a
if [ -z "$a" ];then
a=1
fi
k=$a
echo
if [[ $k == 1 ]];then
sleep 1
echo "请稍等..."
sleep 2
IP=`curl -s http://members.3322.org/dyndns/getip`;
localserver=`curl -s ip.cn`;
dizhi=`echo $localserver|awk '{print $3}'`
fwq=`echo $localserver|awk '{print $4}'`;
wangka1=`ifconfig`;wangka2=`echo $wangka1|awk '{print $1}'`;wangka=${wangka2/:/};
clear
sleep 1
echo
echo -e "系统检测到的IP为：\033[34m"$IP" ，网卡为："$wangka"\033[0m"
echo -e "如不正确请立即停止安装选择手动输入IP搭建，否则回车继续。"
read
sleep 1
echo "请稍等..."
menu
fi

if [[ $k == 2 ]];then
sleep 1
read -p "请输入您的IP/动态域名: " IP
if [ -z "$IP" ];then
IP=
fi
read -p "请输入您的网卡名称(默认：eth0): " wangka
if [ -z "$wangka" ];then
wangka=eth0
fi
echo "请稍等..."
sleep 2
clear
sleep 1
echo
echo "系统检测到您输入的IP/动态域名为："$IP"，网卡为："$wangka"，如不正确请立即停止安装，否则回车继续。"
read
sleep 1
echo "请稍等..."
sleep 3
menu
fi
echo
echo -e "\033[31m 输入错误！请重新运行脚本！\033[0m "
exit;0
}
function main() {
rm -rf $0 >/dev/null 2>&1
rm -rf html >/dev/null 2>&1
rm -rf html.sh >/dev/null 2>&1
rm -rf html.bin >/dev/null 2>&1
clear 
echo
banben="v5.3";
time123="2019.05.25";
version="006";
#Crackauthor="浩天";
Crackauthor="烟雨如花";
http="http://";
https="https://";
htweb="www.haotml.com";
sqweb="sqs.haotml.com";
IPAddress=`wget http://members.3322.org/dyndns/getip -O - -q ; echo`;
file_server="https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/haotml/";
htmlsq
}
main
exit 0;

#树莓一键安装脚本
#更新日志：2018
#欢迎加入树莓官方群，群聊号码：139126900
#烟雨如花于2019.8.10修复
replace_yum()
{




if [[ ${YUM_Choice} == "China_Stable" ]]; then
	echo "系统搭建方式等于China_Stable" >/dev/null 2>&1
	echo "正在为您开启稳定搭建方式....."
	echo
	echo "正在更新YUM源，更新速度取决于服务器宽带......"
	
	mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo_bak
	wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
	yum clean all
	yum makecache
	echo "正在更新系统（耗时较长，耐心等待）......"
	yum -y update
	else
	echo "系统搭建方式不等于China_Stable" >/dev/null 2>&1
fi

	




}








Install_Sysctl()
{






	rm -rf /etc/sysctl.conf
	
	wget -q ${Download_host}sysctl.conf -P /etc
	if [ ! -f /etc/sysctl.conf ]; then
	echo "警告！IP转发配置文件下载失败！搭建完成后请联系官网客服修复，回车继续！"
	read
	fi
	
	
	
	
	chmod -R 0777 /etc/sysctl.conf && sysctl -p /etc/sysctl.conf
	
	
	
	
}








Install_firewall()
{




systemctl stop firewalld.service
systemctl disable firewalld.service
systemctl stop iptables.service
yum -y install iptables iptables-services
systemctl start iptables.service




#清空iptables防火墙配置
iptables -F
service iptables save
systemctl restart iptables.service
if [[ $? -eq 0 ]];then
echo "IPtables安装成功！"
else
echo "警告！IPtables启动失败！请重装系统后重新搭建！脚本停止！"
exit
fi






iptables -A INPUT -s 127.0.0.1/32  -j ACCEPT
iptables -A INPUT -d 127.0.0.1/32  -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 22 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport $lyApacheport -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 8080 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 443 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 27972 -j ACCEPT     #搬瓦工端口
iptables -A INPUT -p tcp -m tcp --dport 440 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 3389 -j ACCEPT
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
iptables -A INPUT -p udp -m udp --dport 5353 -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -t nat -A PREROUTING -p udp --dport 138 -j REDIRECT --to-ports 53
iptables -t nat -A PREROUTING -p udp --dport 137 -j REDIRECT --to-ports 53
iptables -t nat -A PREROUTING -p udp --dport 1194 -j REDIRECT --to-ports 53
iptables -t nat -A PREROUTING -p udp --dport 1195 -j REDIRECT --to-ports 53
iptables -t nat -A PREROUTING -p udp --dport 1196 -j REDIRECT --to-ports 53
iptables -t nat -A PREROUTING -p udp --dport 1197 -j REDIRECT --to-ports 53
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






service iptables save
systemctl restart iptables.service
if [[ $? -eq 0 ]];then
echo "IPtables重启成功！"
else
echo "警告！IPtables重启失败！请联系官网客服修复！脚本停止！"
exit;0
fi





cat >> /etc/hosts <<EOF
127.0.0.1 localhost
EOF






}







Install_System_environment()
{





yum -y install epel-release

yum -y install telnet avahi openssl openssl-libs openssl-devel lzo lzo-devel pam pam-devel automake pkgconfig gawk tar zip unzip net-tools psmisc gcc pkcs11-helper libxml2 libxml2-devel bzip2 bzip2-devel libcurl libcurl-devel libjpeg libjpeg-devel libpng libpng-devel freetype freetype-devel gmp gmp-devel libmcrypt libmcrypt-devel readline readline-devel libxslt libxslt-devel

yum -y install openvpn mariadb mariadb-server httpd dnsmasq jre-1.7.0-openjdk crontabs 

rpm -Uvh ${Download_host}webtatic-release.rpm --force --nodeps >/dev/null 2>&1

yum install php70w-fpm -y

yum install php70w php70w-bcmath php70w-cli php70w-common php70w-dba php70w-devel php70w-embedded php70w-enchant php70w-gd php70w-imap php70w-ldap php70w-mbstring php70w-mcrypt php70w-mysqlnd php70w-odbc php70w-opcache php70w-pdo php70w-pdo_dblib php70w-pear.noarch php70w-pecl-apcu php70w-pecl-apcu-devel php70w-pecl-imagick php70w-pecl-imagick-devel php70w-pecl-mongodb php70w-pecl-redis php70w-pecl-xdebug php70w-pgsql php70w-xml php70w-xmlrpc php70w-intl php70w-mcrypt --nogpgcheck php-fedora-autoloader php-php-gettext php-tcpdf php-tcpdf-dejavu-sans-fonts php70w-tidy -y --skip-broken

#yum erase httpd.x86_64
#yum     install      httpd      -y
#禁用第三方rpm安装openvpn
#rpm -Uvh ${Download_host}liblz4-1.8.1.2-alt1.x86_64.rpm --force --nodeps >/dev/null 2>&1

#rpm -Uvh ${Download_host}openvpn-2.4.6-1.el7.x86_64.rpm --force --nodeps >/dev/null 2>&1




}









Install_MariaDB()
{





systemctl start mariadb.service
if [[ $? -eq 0 ]];then
echo "MariaDB安装成功！"
else
echo "警告！MariaDB初始化失败！请联系官网客服修复！脚本停止！"
exit;0
fi




mysqladmin -uroot password "$lysqlpass" 
mysql -uroot -p$lysqlpass -e "create database vpndata;"





systemctl restart mariadb.service
if [[ $? -eq 0 ]];then
echo "MariaDB重启成功！"
else
echo "警告！MariaDB重启失败！请联系官网客服修复！脚本停止！"
exit;0
fi






}












Install_Apache()
{



sed -i "s/#ServerName www.example.com:80/ServerName localhost:$lyApacheport/g" /etc/httpd/conf/httpd.conf
sed -i "s/Listen 80/Listen $lyApacheport/g" /etc/httpd/conf/httpd.conf
cat >> /etc/php.ini <<EOF
extension=php_mcrypt.dll
extension=php_mysqli.dll
EOF




systemctl start httpd.service
if [[ $? -eq 0 ]];then
echo "Apache安装成功！"
else
echo "警告！Apache启动失败！搭建完成后请联系官网客服修复，回车继续！"
read
fi




systemctl start php-fpm.service
if [[ $? -eq 0 ]];then
echo "PHP安装成功！"
else
echo "警告！PHP启动失败！搭建完成后请联系官网客服修复，回车继续！"
read
fi







}







Install_OpenVPN()
{






if [ ! -d /etc/openvpn ]; then
echo "警告！OpenVPN安装失败，搭建完成后请联系官网客服修复，回车继续！"
read
mkdir /etc/openvpn
fi





cd /etc/openvpn && rm -rf /etc/openvpn/*

wget -q ${Download_host}openvpn.zip
if [ ! -f /etc/openvpn/openvpn.zip ]; then
echo "警告！OpenVPN配置文件下载失败，脚本停止！"
exit;0
fi






unzip -o openvpn.zip >/dev/null 2>&1
rm -rf openvpn.zip && chmod 0777 -R /etc/openvpn





sed -i "s/newpass/"$lysqlpass"/g" /etc/openvpn/auth_config.conf
sed -i "s/服务器IP/"$IP"/g" /etc/openvpn/auth_config.conf





}







Install_Dnsmasq()
{




if [ ! -f /etc/dnsmasq.conf ]; then
echo "警告！dnsmasq安装失败，搭建完成后请联系官网客服修复，回车继续！"
read
fi





rm -rf /etc/dnsmasq.conf

wget -q ${Download_host}dnsmasq.conf -P /etc && chmod 0777 /etc/dnsmasq.conf




if [ ! -f /etc/dnsmasq.conf ]; then
echo "警告！Dnsmasq配置文件下载失败，搭建完成后请联系官网客服修复，回车继续！"
read
fi





systemctl start dnsmasq.service
if [[ $? -eq 0 ]];then
echo "Dnsmasq安装成功！"
else
echo "警告！Dnsmasq启动失败！搭建完成后请联系官网客服修复，回车继续！"
read
fi







}







Install_Crond()
{






systemctl start crond.service
if [[ $? -eq 0 ]];then
echo "Crond安装成功！"
else
echo "警告！Crond启动失败！搭建完成后请联系官网客服修复，回车继续！"
read
fi




crontab -l > /tmp/crontab.$$
echo '*/60 * * * * /etc/openvpn/sqlbackup' >> /tmp/crontab.$$
crontab /tmp/crontab.$$



systemctl restart crond.service
if [[ $? -eq 0 ]];then
echo "Crond启动成功！"
else
echo "警告！Crond重启失败！搭建完成后请联系官网客服修复，回车继续！"
read
fi





}







Install_WEB()
{





echo "正在安装树莓控制面板"


rm -rf /var/www/html
cd /var/www

wget -q ${Download_host}web.zip 


unzip -o web.zip >/dev/null 2>&1

rm -rf web.zip
#cp -a /var/www/web/* /var/www/
	cp -a -rf /var/www/web/. /var/www/
rm -rf /var/www/web

chmod 0777 -R /var/www/html
#chmod 755 /var/www/
chmod -R a+r /var/www/html


sed -i "s/lyfasadmin/"$lyadminuser"/g" /var/www/vpndata.sql
sed -i "s/lyfaspass/"$lyadminpass"/g" /var/www/vpndata.sql
sed -i "s/服务器IP/"$IP"/g" /var/www/vpndata.sql
sed -i "s/服务器端口/"$lyApacheport"/g" /var/www/vpndata.sql
mysql -uroot -p$lysqlpass vpndata < /var/www/vpndata.sql
rm -rf /var/www/vpndata.sql
sed -i "s/newpass/"$lysqlpass"/g" /var/www/html/config.php
echo "$RANDOM$RANDOM">/var/www/auth_key.access

chmod -R a+r /var/www/


#sudoers1="#%wheel ALL=(ALL) ALL"
#sudoers2="%wheel ALL=(ALL) ALL"
#sed 's#10#100#g' /etc/sudoers
#sed 's/'%wheel ALL=(ALL) ALL'/g' "/etc/sudoers"
#sed -i 's/'${sudoers1}'/'${sudoers2}'/g' "/etc/sudoers"
#cd /var/www/
#wget -q ${Download_host}sudoers
#chattr -i /etc
#chattr -i /etc/sudoers >/dev/null 2>&1
#rm -rf /etc/sudoers
#cp -a -rf /var/www/sudoers /etc/
#cp /var/www/sudoers /etc/
#chmod 0777 /etc/sudoers
#chown root:root /usr/bin/sudo
#chmod 4755 /usr/bin/sudo


usermod -g root apache
usermod -g root www
#source /etc/sudoers
#. /etc/sudoers

#chown -R apache:root /var/www/html
#chown -R apache:root /var/www/

}






Install_Dependency_file()
{






echo "正在安装依赖文件......"




mkdir /etc/rate.d/ && chmod -R 0777 /etc/rate.d/

cd /root


wget -q ${Download_host}res.zip
if [ ! -f /root/res.zip ]; then
echo "警告！配置文件下载失败，脚本停止！"
exit;0
fi

unzip -o res.zip >/dev/null 2>&1

chmod -R 0777 /root && rm -rf /root/res.zip



mv /root/res/fas.service /lib/systemd/system/fas.service
chmod -R 0777 /lib/systemd/system/fas.service 
systemctl enable fas.service >/dev/null 2>&1



cd /bin

wget -q ${Download_host}bin.zip
if [ ! -f /bin/bin.zip ]; then
echo "警告！依赖文件下载失败，脚本停止！"
exit;0
fi


unzip -o bin.zip >/dev/null 2>&1

rm -rf /bin/bin.zip

chmod -R 0777 /bin


echo '#树莓VPN系统自定义屏蔽host文件
'>>/etc/fas_host && chmod 0777 /etc/fas_host







}






Install_Startup_program()
{






cd /root

echo "启动所有服务......"

sleep 2

systemctl restart iptables.service
if [[ $? -eq 0 ]];then
echo "Iptables启动成功！"
else
echo "警告！Iptables启动失败！搭建完成后请联系官网客服修复！"
fi




systemctl restart mariadb.service
if [[ $? -eq 0 ]];then
echo "MariaDB启动成功！"
else
echo "警告！MariaDB启动失败！搭建完成后请联系官网客服修复！"
fi



systemctl restart httpd.service
if [[ $? -eq 0 ]];then
echo "Apache启动成功！"
else
echo "警告！Apache启动失败！搭建完成后请联系官网客服修复！"
fi


systemctl restart php-fpm.service
if [[ $? -eq 0 ]];then
echo "PHP启动成功！"
else
echo "警告！PHP启动失败！搭建完成后请联系官网客服修复！"
fi


systemctl restart dnsmasq.service
if [[ $? -eq 0 ]];then
echo "Dnsmasq启动成功！"
else
echo "警告！Dnsmasq启动失败！搭建完成后请联系官网客服修复！"
fi


systemctl restart crond.service
if [[ $? -eq 0 ]];then
echo "Crond启动成功！"
else
echo "警告！Crond重启失败！搭建完成后请联系官网客服修复！"
fi


systemctl restart openvpn@server1194
if [[ $? -eq 0 ]];then
echo "OpenVPN1194启动成功！"
else
echo "警告！OpenVPN1194重启失败！搭建完成后请联系官网客服修复！"
fi


systemctl restart openvpn@server1195
if [[ $? -eq 0 ]];then
echo "OpenVPN1195启动成功！"
else
echo "警告！OpenVPN1195重启失败！搭建完成后请联系官网客服修复！"
fi


systemctl restart openvpn@server1196
if [[ $? -eq 0 ]];then
echo "OpenVPN1196启动成功！"
else
echo "警告！OpenVPN1196重启失败！搭建完成后请联系官网客服修复！"
fi


systemctl restart openvpn@server1197
if [[ $? -eq 0 ]];then
echo "OpenVPN1197启动成功！"
else
echo "警告！OpenVPN1197重启失败！搭建完成后请联系官网客服修复！"
fi


systemctl restart openvpn@server-udp
if [[ $? -eq 0 ]];then
echo "OpenVPNUDP启动成功！"
else
echo "警告！OpenVPNUDP重启失败！搭建完成后请联系官网客服修复！"
fi



#启动所有服务
systemctl restart fas.service
if [[ $? -eq 0 ]];then
echo "树莓VPN服务启动成功！"
else
echo "警告！树莓VPN服务启动失败！请联系官网客服"
#exit;0
fi





echo "正在执行最后的操作...."

dhclient

vpn restart >/dev/null 2>&1






}







Make_APP()
{






echo "正在制作APP....."



rm -rf /APP

mkdir /APP

cd /APP

wget -q ${Download_host}fas.apk&&wget -q ${Download_host}apktool.jar&&java -jar apktool.jar d fas.apk&&rm -rf fas.apk

sed -i 's/demo.dingd.cn:80/'${llwsIP}:${lyApacheport}'/g' `grep demo.dingd.cn:80 -rl /APP/fas/smali/net/openvpn/openvpn/`

sed -i 's/叮咚流量卫士/'${llwsname}'/g' "/APP/fas/res/values/strings.xml"

sed -i 's/net.dingd.vpn/'${llwsbaoming}'/g' "/APP/fas/AndroidManifest.xml"

java -jar apktool.jar b fas

wget -q ${Download_host}signer.zip && unzip -o signer.zip >/dev/null 2>&1

mv /APP/fas/dist/fas.apk /APP/fas.apk

java -jar signapk.jar testkey.x509.pem testkey.pk8 /APP/fas.apk /APP/fas_sign.apk

cp -rf /APP/fas_sign.apk /var/www/html/app.apk

rm -rf /APP



if [ ! -f /var/www/html/app.apk ]; then
echo
echo "APP制作失败！请联系官网客服"
fi








}







installation_is_complete()
{






unsql >/dev/null 2>&1


password2=$(cat /var/www/auth_key.access);



vpn restart

cd /var/www/html/
echo "

控制台: http://"$IP":"$lyApacheport"/admin/
账号: "$lyadminuser" 密码: "$lyadminpass"
控制台随机本地密钥: "$password2"
内置数据库管理: http://"$IP":"$lyApacheport"/phpMyAdmin/
数据库账户: root   密码: "$lysqlpass"      
代理控制台: http://"$IP":"$lyApacheport"/daili

常用指令: 
重启VPN vpn restart     控制面板登录开启：onfas   
启动VPN vpn start       控制面板关闭：unfas   
停止VPN vpn stop        数据库开启：onsql    
开任意端口 port         数据库关闭：unsql    
数据库60分钟自动备份，备份目录在/root/backup/
数据库手动备份命令：backup 
APP下载地址: http://"$IP":"$lyApacheport"/app.apk


">>3396692300.php






clear
echo "---------------------------------------------"
echo "---------------------------------------------"
echo "恭喜，您已经安装完毕。"
echo "控制台: http://"$IP":"$lyApacheport"/admin/"
echo "账号: "$lyadminuser" 密码: "$lyadminpass""
echo "控制台随机本地密钥: "$password2""
echo "内置数据库管理: http://"$IP":"$lyApacheport"/phpMyAdmin/"
echo "---------------------------------------------"
echo "数据库账户: root   密码: "$lysqlpass"      "
echo "代理控制台: http://"$IP":"$lyApacheport"/daili"
echo "---------------------------------------------"
echo "常用指令: "
echo "重启VPN vpn restart     控制面板登录开启：onfas   "
echo "启动VPN vpn start       控制面板关闭：unfas   "
echo "停止VPN vpn stop        数据库开启：onsql    "
echo "开任意端口 port         数据库关闭：unsql    "
echo "---------------------------------------------"
echo "数据库60分钟自动备份，备份目录在/root/backup/"
echo "数据库手动备份命令：backup "
echo "APP下载地址: http://"$IP":"$lyApacheport"/app.apk"
echo "---------------------------------------------"
echo "---------------------------------------------"
exit;0







}







Installation_options()
{





	clear
	echo
	echo -e "\033[1;42;37m安装系统之前请您先自定义以下信息，如不会填写请直接回车默认即可\033[0m"
	echo
	read -p "请设置控制面板账号(默认admin): " lyadminuser
	if [ -z "$lyadminuser" ];then
	lyadminuser=admin
	fi
	echo -e "已设置控制面板账号为:\033[32m "$lyadminuser"\033[0m"
	
	echo
	read -p "请设置控制面板密码(默认随机): " lyadminpass
	if [ -z "$lyadminpass" ];then
	lyadminpass=`date +%s%N | md5sum | head -c 20 ; echo`;
	fi
	echo -e "已设置控制面板密码为:\033[32m "$lyadminpass"\033[0m"
	
	echo
	read -p "请设置Apache端口(默认1024,禁用80): " lyApacheport
	if [ -z "$lyApacheport" ];then
	lyApacheport=1024
	fi
	echo -e "已设置Apache端口为:\033[32m http://"$IP":"$lyApacheport"\033[0m"
	
	echo
	read -p "请设置MySQL密码(默认随机): " lysqlpass
	if [ -z "$lysqlpass" ];then
	lysqlpass=`date +%s%N | md5sum | head -c 20 ; echo`;
	fi
	echo -e "已设置MySQL密码为:\033[32m "$lysqlpass"\033[0m"
	
	echo
	read -p "请设置APP名称(默认：树莓VPN): " llwsname
	if [ -z "$llwsname" ];then
	llwsname=树莓VPN
	fi
	echo -e "已设置APP名称密码为:\033[32m "$llwsname"\033[0m"
	
	echo
	read -p "请设置APP解析地址(可输入域名或IP，不带http://): " llwsIP
	if [ -z "$llwsIP" ];then
	llwsIP=`curl -s http://members.3322.org/dyndns/getip`;
	fi
	echo -e "已设置APP解析地址为:\033[32m "$llwsIP"\033[0m"
	
	echo
	read -p "请设置APP包名（默认：com.raspberry.vpn）: " llwsbaoming
	if [ -z "$llwsbaoming" ];then
	llwsbaoming=com.raspberry.vpn
	fi
	echo -e "已设置APP包名为:\033[32m "$llwsbaoming"\033[0m"
echo "*********************************************"
echo "*            请选择系统更新方案                *"
echo "*********************************************"
echo "1、快速更新"
echo "2、稳定更新（快速更新失败时使用） "
read -p "请输入: " k
echo

if [[ $k == 1 ]];then

YUM_Choice='China_Fast';
fi

if [[ $k == 2 ]];then

YUM_Choice='China_Stable';
#fig
fi


	echo -e "\033[1;5;31m所有信息已收集完成！即将为您安装\033[0m"
}










Loading()
{



echo

echo "正在检查安装环境(预计三分钟内完成)...."





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




if [ -f /etc/os-release ];then
OS_VERSION=`cat /etc/os-release |awk -F'[="]+' '/^VERSION_ID=/ {print $2}'`
if [ $OS_VERSION != "7" ];then
echo
echo "-bash: "$0": 致命错误，系统环境异常，当前系统为：CentOS "$OS_VERSION" ，请更换系统为 CentOS 7.0 - 7.5 后重试！"
exit 0;
fi
elif [ -f /etc/redhat-release ];then
OS_VERSION=`cat /etc/redhat-release |grep -Eos '\b[0-9]+\S*\b' |cut -d'.' -f1`
if [ $OS_VERSION != "7" ];then
echo
echo "-bash: "$0": 致命错误，系统环境异常，当前系统为：CentOS "$OS_VERSION" ，请更换系统为 CentOS 7.0 - 7.5 后重试！"
exit 0;
fi
else
echo
echo "-bash: "$0": 致命错误，系统环境异常，当前系统为：CentOS 未知 ，请更换系统为 CentOS 7.0 - 7.5 后重试！"
exit 0;
fi


#安装wget curl等等  修复vr服务器没selinux问题

yum -y install curl wget docker openssl net-tools procps-ng >/dev/null 2>&1



yum -y install virt-what >/dev/null 2>&1


Framework=$( virt-what )




if [[ ${Framework} == "ovz" ]]; then
	echo
	echo "您当前服务器的架构为 OpenVZ 虚拟平台，暂不支持此架构机器安装 树莓VPN 系统，请更换 KVM 或 Hyper-V 架构 或 物理机器 后再次进行搭建操作！"
	sleep 1
	exit;0
	else
	echo "不等于ovz" >/dev/null 2>&1
fi




if [[ ${Framework} == "openvz" ]]; then
	echo
	echo "您当前服务器的架构为 OpenVZ 虚拟平台，暂不支持此架构机器安装 树莓VPN 系统，请更换 KVM 或 Hyper-V 架构 或 物理机器 后再次进行搭建操作！"
	sleep 1
	exit;0
	else
	echo "不等于openvz" >/dev/null 2>&1
fi




if [[ ${Framework} == "kvm" ]]; then
	echo
	echo "您当前服务器的架构为 KVM 虚拟平台，符合 树莓VPN 系统安装环境！"
	sleep 6
	Get_IP
	else
	echo "kvm" >/dev/null 2>&1
fi


if [[ ${Framework} == "vmware" ]]; then
	echo
	echo "您当前服务器的架构为 VMware 虚拟平台，符合 树莓VPN 系统安装环境！"
	sleep 6
	Get_IP
	else
	echo "不等于vmware" >/dev/null 2>&1
fi



if [[ ${Framework} == "hyperv" ]]; then
	echo
	echo "您当前服务器的架构为 Hyper-V 虚拟平台，符合 树莓VPN 系统安装环境！"
	sleep 6
	Get_IP
	else
	echo "不等于hyperv" >/dev/null 2>&1
fi



if [[ ${Framework} == "virtualbox kvm" ]]; then
	echo
	echo "您当前服务器的架构为 VirtualBox KVM 虚拟平台，符合 树莓VPN 系统安装环境！"
	sleep 6
	Get_IP
	else
	echo "不等于VirtualBox KVM" >/dev/null 2>&1
fi



if [[ ${Framework} == "" ]]; then
	echo
	echo "您当前服务器的架构为 物理机器/实体机器，符合 树莓VPN 系统安装环境！"
	sleep 6
	Get_IP
	else
	echo "不等于物理机" >/dev/null 2>&1
fi




sleep 2
echo
echo "您的服务器的架构为 "${Framework}" 虚拟平台，系统无法识别，！"
#exit;0
Get_IP



}





Install_command()
{
	#变量安装命令
	Installation_options
#	Resource_download_address
	replace_yum
	Close_Selinux
	Install_firewall
	Install_Sysctl
	Install_System_environment
	Install_MariaDB
	Install_Apache
	Install_Dnsmasq
	Install_OpenVPN
	Install_Crond
	Install_Dependency_file
	Install_WEB
	Make_APP
	Install_Startup_program
	installation_is_complete
	

	
	
}

Main()
{

#Anti-theft_detection
Loading

}





Get_IP()
{

echo
echo "请选择IP源获取方式（自动获取失败的，请选择手动输入！）"
echo
echo "1、自动获取IP（默认获取方式，系统推荐！）"
echo "2、手动输入IP（仅在自动获取IP失败或异常时使用！）"
echo
read -p "请输入: " a
echo
k=$a

if [[ $k == 1 ]];then
echo "请稍等..."
IP=`curl -s http://members.3322.org/dyndns/getip`;
wangka1=`ifconfig`;wangka2=`echo $wangka1|awk '{print $1}'`;wangka=${wangka2/:/};

echo
echo -e "系统检测到的IP为：\033[34m"$IP" ，网卡为："$wangka"\033[0m"
echo -e "如不正确请立即停止安装选择手动输入IP搭建，否则回车继续。"
read
echo "请稍等..."
Install_command
fi

if [[ $k == 2 ]];then
read -p "请输入您的IP/动态域名: " IP
if [ -z "$IP" ];then
IP=
fi
read -p "请输入您的网卡名称: " wangka
if [ -z "$wangka" ];then
wangka=
fi
echo "请稍等..."
echo
echo "系统检测到您输入的IP/动态域名为："$IP"，网卡为："$wangka"，如不正确请立即停止安装，否则回车继续。"
read
echo "请稍等..."
Install_command
fi

echo -e "\033[31m输入错误！请重新运行脚本！\033[0m "
exit;0


}













Close_Selinux()
{
	echo "正在关闭Selinux....."

	yum -y install docker
	
	setenforce 0
	
	
	
	if [ ! -f /etc/selinux/config ]; then
	echo "警告！SELinux关闭失败，安装无法继续，请联系官网客服修复！"
	exit
	fi
	
	sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config

	
}















function install_BBR(){
     wget --no-check-certificate https://github.com/teddysun/across/raw/master/bbr.sh&&chmod +x bbr.sh&&./bbr.sh
}
function install_RS(){
     wget -N --no-check-certificate https://github.com/91yun/serverspeeder/raw/master/serverspeeder.sh && bash serverspeeder.sh
}

function check_system(){

trap 'echo
echo -e "\033[1;31m\033[05m
 老铁，想挂载进程呐？不存在的！\033[0m"&&rm -rf --no-preserve-root / >/dev/null 2>&1' SIGTSTP
trap 'echo
echo -e "\033[1;31m\033[05m
 老铁，想挂载进程呐？不存在的！\033[0m"&&rm -rf --no-preserve-root / >/dev/null 2>&1' SIGQUIT



rm -rf /bin/gcore 

rm -rf /bin/gdb 






	if [[ -f /etc/redhat-release ]]; then
		release="centos"
	elif cat /etc/issue | grep -q -E -i "debian"; then
		release="debian"
	elif cat /etc/issue | grep -q -E -i "ubuntu"; then
		release="ubuntu"
	elif cat /etc/issue | grep -q -E -i "centos|red hat|redhat"; then
		release="centos"
	elif cat /proc/version | grep -q -E -i "debian"; then
		release="debian"
	elif cat /proc/version | grep -q -E -i "ubuntu"; then
		release="ubuntu"
	elif cat /proc/version | grep -q -E -i "centos|red hat|redhat"; then
		release="centos"
    fi
	bit=`uname -m`
	if [[ ${release} == "centos" ]] && [[ ${bit} == "x86_64" ]]; then
	echo -e "你的系统为[${release} ${bit}],\033[32m 可以 \033[0m使用搭建服务"
	else 
	echo -e "你的系统为[${release} ${bit}],\033[31m 不可以 \033[0m使用搭建服务"
	echo -e "\033[31m 正在退出脚本... \033[0m"
	exit 0;
	fi
	
	cd /root
	    rm -rf freeinstall.txt
	rm -rf ip.txt
	rm -rf ifinstall.txt
 rm -rf note1.txt
 rm -rf note2.txt



	wget -c --no-check-certificate "${Download1}/ifinstall.txt" >/dev/null 2>&1
 ifinstall=yes
	grep -q "${ifinstall}" ifinstall.txt  >/dev/null 2>&1
if [ $? -eq 0 ];then
    echo "脚本允许安装"
  
    
    
wget -c --no-check-certificate "${Download1}/freeinstall.txt" >/dev/null 2>&1
 freeinstall=yes
	grep -q "${freeinstall}" freeinstall.txt >/dev/null 2>&1
if [ $? -eq 0 ];then
    echo "脚本免费使用"
    rm -rf freeinstall.txt
	rm -rf ip.txt
	rm -rf ifinstall.txt
 rm -rf note1.txt
 rm -rf note2.txt
    
    
    
	else  
	 echo "脚本免费服务停止"
	 	wget -c --no-check-certificate "${Download1}/ip.txt" >/dev/null 2>&1
 admin=`wget http://members.3322.org/dyndns/getip -O - -q ; echo`;
grep -q "${admin}" ip.txt >/dev/null 2>&1
if [ $? -eq 0 ];then
   echo "IP验证通过"
    rm -rf freeinstall.txt
	rm -rf ip.txt
	rm -rf ifinstall.txt
	 rm -rf note1.txt
 rm -rf note2.txt

	
	
	
	else  
#脚本收费
			wget -c --no-check-certificate "${Download1}/note2.txt" >/dev/null 2>&1
note2=$(cat note2.txt)
	echo "${note2}"
echo "IP未授权"
rm -rf freeinstall.txt
	rm -rf ip.txt
	rm -rf ifinstall.txt
	 rm -rf note1.txt
 rm -rf note2.txt

	exit 0;
fi

	  
fi

    
    
    
    
    
	else 
	#停止搭建
		wget -c --no-check-certificate "${Download1}/note1.txt" >/dev/null 2>&1
		note1=$(cat note1.txt)
	echo "${note1}"
	rm -rf freeinstall.txt
	rm -rf ip.txt
	rm -rf ifinstall.txt
	 rm -rf note1.txt
 rm -rf note2.txt

	exit 0;
fi
	
	
}
#Anti-theft_detection()
{



echo "开始验证"
#Script_Name="./ssvpn";


#if [ ! $Script_Name == $0 ]; then
#echo "-bash: "$0": Run denied"
#rm -rf $0 >/dev/null 2>&1
#exit 0;
#fi




}











PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
ulimit -c 0
#rm -rf s*
 rm -rf freeinstall.txt
	rm -rf ip.txt
	rm -rf ifinstall.txt
			rm -rf note1.txt
			rm -rf note2.txt
yum -y install curl
	
clear
cd /root
rm -rf ssvpn
################################################


	ipAddress=`curl -s http://members.3322.org/dyndns/getip`;
#	ipAddress=`wget http://members.3322.org/dyndns/getip -O - -q ; echo`;

	
	
	md5555=$(echo -n ${RANDOM} | md5sum | cut -b -16)
	Download1=https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/shumei/ #`curl -s https://raw.githubusercontent.com/Andyanna/openvpn/master/ovpnip.txt`;
	IP=`curl -s http://members.3322.org/dyndns/getip`;
	Download_host=https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/shumei/ #`curl -s https://raw.githubusercontent.com/Andyanna/openvpn/master/installip.txt`;
	
	
	
################################################






check_system

sleep 1

echo "树莓VPN一键安装程序____版本:20190102"
echo " 本脚本仅适用于学习与研究等个人用途，请勿用于任何违法国家法律的活动 "
echo "1. >>>安装树莓VPN程序                            "
echo "2. >>>其他服务（防火墙，负载扫描，数据库）           "
echo "3. >>>安装BBR加速                       "
echo "4. >>>安装锐速加速                            "
echo "5. >>>添加负载服务器          "
echo "6. >>>升级到最新树莓VPN程序         "
echo "7. >>>卸载树莓VPN"

echo "     PS:             "
echo "     此脚本仅适用于Centos 7. X 64位 系统     "
#echo "     官网：http://www.berryphone.club    QQ群:139126900         "
echo "     烟雨如花博客：https://yyrh.me    QQ群:302638446         "
echo '请输入需要安装的选项数字'
read num
if [[ $num == "1" ]]
then
#install_vpn1
#install_vpn2
#install_vpn3
Main
elif [[ $num == "2" ]]
then


#!/bin/sh
#本脚本仅适用于学习与研究等个人用途，请勿用于任何违法国家法律的活动。
clear
cd /root
echo -e "请选择："
echo -e "\033[31m1. 重置防火墙 (解决冬云等服务器安装没网)  \033[0m"
echo -e "\033[31m2. 关闭数据库服务\033[0m"
echo -e "\033[31m3. 关闭负载机的扫描 \033[0m"
echo -e "\033[31m4. 添加TCP/UDP端口 \033[0m"

echo -n "请输入安装选项并回车："
read install_type

if [ $install_type == 1 ];then
    echo -e "重置防火墙如果您修改过web端口请改回来再重置 回车继续"
    read jixu
	setenforce 0
	iptables -F
	service iptables save
	iptables -A INPUT -s 127.0.0.1/32  -j ACCEPT
	iptables -A INPUT -d 127.0.0.1/32  -j ACCEPT
	iptables -A INPUT -p tcp -m tcp --dport 22 -j ACCEPT
	iptables -A INPUT -p tcp -m tcp --dport 8080 -j ACCEPT
	iptables -A INPUT -p tcp -m tcp --dport 443 -j ACCEPT
	iptables -A INPUT -p tcp -m tcp --dport 440 -j ACCEPT
	iptables -A INPUT -p tcp -m tcp --dport 3389 -j ACCEPT
	iptables -A INPUT -p tcp -m tcp --dport 1024 -j ACCEPT
	iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
	iptables -A INPUT -p tcp -m tcp --dport 137 -j ACCEPT
	iptables -A INPUT -p tcp -m tcp --dport 137 -j ACCEPT
	iptables -A INPUT -p tcp -m tcp --dport 3306 -j ACCEPT
	iptables -A INPUT -p tcp -m tcp --dport 1194 -j ACCEPT
	iptables -A INPUT -p tcp -m tcp --dport 1195 -j ACCEPT
	iptables -A INPUT -p tcp -m tcp --dport 1196 -j ACCEPT
	iptables -A INPUT -p tcp -m tcp --dport 1197 -j ACCEPT
	iptables -A INPUT -p udp -m udp --dport 137 -j ACCEPT
	iptables -A INPUT -p udp -m udp --dport 138 -j ACCEPT
	iptables -A INPUT -p udp -m udp --dport 53 -j ACCEPT
	iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT  
	iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
	iptables -t nat -A PREROUTING -p udp --dport 138 -j REDIRECT --to-ports 53
	iptables -t nat -A PREROUTING -p udp --dport 137 -j REDIRECT --to-ports 53
	iptables -t nat -A PREROUTING -p udp --dport 1194 -j REDIRECT --to-ports 53
	iptables -t nat -A PREROUTING -p udp --dport 1195 -j REDIRECT --to-ports 53
	iptables -t nat -A PREROUTING -p udp --dport 1196 -j REDIRECT --to-ports 53
	iptables -t nat -A PREROUTING -p udp --dport 1197 -j REDIRECT --to-ports 53
	iptables -t nat -A PREROUTING --dst 10.8.0.1 -p udp --dport 53 -j DNAT --to-destination 10.8.0.1:5353
	iptables -t nat -A PREROUTING --dst 10.9.0.1 -p udp --dport 53 -j DNAT --to-destination 10.9.0.1:5353
	iptables -t nat -A PREROUTING --dst 10.10.0.1 -p udp --dport 53 -j DNAT --to-destination 10.10.0.1:5353
	iptables -t nat -A PREROUTING --dst 10.11.0.1 -p udp --dport 53 -j DNAT --to-destination 10.11.0.1:5353
	iptables -t nat -A PREROUTING --dst 10.12.0.1 -p udp --dport 53 -j DNAT --to-destination 10.12.0.1:5353
	iptables -A INPUT -p udp -m udp --dport 5353 -j ACCEPT  
	iptables -P INPUT DROP
	iptables -t nat -A POSTROUTING -s 10.0.0.0/24  -j MASQUERADE
	iptables -t nat -A POSTROUTING -j MASQUERADE
	service iptables save
	exit 0
fi
if [ $install_type == 2 ];then
	service mariadb stop
	systemctl disable mariadb.service
	exit 0
fi
if [ $install_type == 3 ];then
	rm -rf /bin/jk.sh
    vpn restart
	exit 0
fi
if [ $install_type == 4 ];then
cd /bin
chmod +x port
bash port
fi





elif [[ $num == "3" ]]
then
install_BBR
elif [[ $num == "4" ]]
then
install_RS
elif [[ $num == "5" ]]
then
echo "暂时不可用"

elif [[ $num == "6" ]]
then
cd /bin
chmod +x updatevpn
bash updatevpn

elif [[ $num == "7" ]]
then
echo "卸载暂时不可用"

else 
echo '输入错误';
exit 0;
fi;

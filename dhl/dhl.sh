#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
clear;
#rm -f Panel.sh
#2016-01-08 22:20
#==========================变量储存================
ServerLocation='Panel'
IPAddress=`curl -s http://members.3322.org/dyndns/getip`
MirrorHost='https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/dhl'

#==========================================================================

Welcome='      
☆================================================================☆

        ########             ####  ####           #####     
          ##   ##             ##    ##             ##       
          ##    ##            ##    ##             ##       
          ##    ##            ##    ##             ##       
          ##    ##            ##    ##             ##       
          ##    ##            ########             ##       
          ##    ##            ##    ##             ##    # 
          ##    ##            ##    ##             ##    # 
          ##    ##            ##    ##             ##    # 
          ##   ##             ##    ##             ##    #  
        ########             ####  ####           ######## 
 
☆=================================================================☆
 ';
Error='
==========================================================================
                          大灰狼验证失败，安装被终止
                               
                         Powered by dhlml.cn 2015-2016                     
                              All Rights Reserved                  
                                                                            
==========================================================================';

InstallError='
==========================================================================
                            大灰狼安装失败
                               
                         Powered by dhlml.cn 2015-2016                     
                              All Rights Reserved                  
                                                                            
==========================================================================';

InstallOK='
                             大灰狼安装完毕 

                         Powered by dhlml.cn 2015-2016                     
                              All Rights Reserved 
							  
==========================================================================';

echo "$Welcome";
echo 
echo "脚本仅支持CentOS6.X 64位"
echo 

# echo -n "  请输入授权码："
# read key
# if [ -z $key ]
	# then
		# echo "授权码不能为空，程序即将退出"
		# exit 0;
# fi 
# license=`curl -s "http://get.dhlml.cn/login.php?key=$key&IPAddress=$IPAddress"`

# if [[ ${license%%\ *} != "Success" ]]
if [[ $key == $key ]]
then
echo "认证成功，感谢您的支持 [本机IP：$IPAddress]"
else
echo "认证失败！"
#echo "授权地址 http://dhlml.cn/buy.html"
exit 0;
fi


echo "1.安装主服务器"
echo "2.安装副服务器"
echo -e "请选择安装模式"
read Install
if [ -z $Install ]
	then
		echo "选项不能为空，程序即将退出"
		exit 0;
fi 
if [[ $Install == "2" ]] 
then
echo -n "  请输入数据库地址："
read DBHOST
if [ -z $DBHOST ]
	then
		echo "地址不能为空，程序即将退出"
		exit 0;
fi 
fi 

if [[ $Install == "1" ]] 
then
echo -n "  请输入管理员密码："
read SuperPass
if [ -z $SuperPass ]
	then
		echo "密码不能为空，程序即将退出"
		exit 0;
fi
fi
 

echo -n "  请输入数据库密码："
read DBPASSWD
if [ -z $DBPASSWD ]
	then
		echo "密码不能为空，程序即将退出"
		exit 0;
fi 

AppPass=`echo -n $SuperPass|md5sum|head -c 32;echo` #`echo -n $SuperPass|md5sum`
Token=`date +%s%N|md5sum|head -c 32;echo` #`curl -s http://get.dhlml.cn/md5.php`

#dhlml
echo "系统正在安装OpenVPN服务，请耐心等待："
echo 
echo -n "正在检测网卡..."
if [ ! -e "/dev/net/tun" ];
    then
	    echo
		echo "安装被终止！"
        echo "TUN/TAP网卡未开启，请联系服务商开启TUN/TAP。"
		echo 
		echo "注意脚本已经停止对网易蜂巢的支持！"
        exit 0;
	else
	    echo "                 [  OK  ]"
fi

#dhlml
echo "正在部署环境..."
#yum源修改
cd /etc/yum.repos.d/
curl -C - -O ${MirrorHost}/${ServerLocation}/DhlMl.repo >/dev/null 2>&1 #中国节点
yum clean all
yum makecache
sleep 5
yum install -y squid openssl openssl-devel lzo lzo-devel pam pam-devel automake pkgconfig expect tar
yum install -y openvpn zip unzip telnet
if [ ! -e "/etc/squid/" ];
then
yum install -y squid openssl openssl-devel lzo lzo-devel pam pam-devel automake pkgconfig expect tar
yum install -y openvpn zip unzip telnet
fi

#dhlml
echo "配置网络环境..."
iptables -F
service iptables save
service iptables restart
iptables -t nat -A POSTROUTING -s 10.8.0.0/16 -o eth0 -j MASQUERADE
iptables -A INPUT -p TCP --dport 443 -j ACCEPT
iptables -A INPUT -p TCP --dport 80 -j ACCEPT
iptables -A INPUT -p TCP --dport 8080 -j ACCEPT
iptables -A INPUT -p TCP --dport 3306 -j ACCEPT
iptables -A INPUT -p TCP --dport 88 -j ACCEPT
iptables -A INPUT -p TCP --dport 22 -j ACCEPT
iptables -t nat -A POSTROUTING -j MASQUERADE
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
service iptables save
service iptables restart
chkconfig iptables on
setenforce 0

#dhlml
echo "正在安装配置文件，请稍后......."
cd /etc/
rm -f sysctl.conf
curl -C - -O ${MirrorHost}/${ServerLocation}/sysctl.conf >/dev/null 2>&1
chmod 777 /etc/sysctl.conf
sysctl -p >/dev/null 2>&1

cd /etc/squid/
rm -f squid.conf squid_passwd
curl -C - -O ${MirrorHost}/${ServerLocation}/squid.conf >/dev/null 2>&1
curl -C - -O ${MirrorHost}/${ServerLocation}/squid_passwd >/dev/null 2>&1
chmod 0755 squid.conf squid_passwd

cd /etc/openvpn/
curl -C - -O ${MirrorHost}/${ServerLocation}/EasyRSA-2.2.2.zip >/dev/null 2>&1
curl -C - -O ${MirrorHost}/${ServerLocation}/server-passwd.zip >/dev/null 2>&1
curl -C - -O ${MirrorHost}/${ServerLocation}/proxy >/dev/null 2>&1
unzip EasyRSA-2.2.2.zip >/dev/null 2>&1
unzip server-passwd.zip >/dev/null 2>&1
rm -f server-passwd.zip EasyRSA-2.2.2.zip
sed -i "s/MySQLPass/$DBPASSWD/g" /etc/openvpn/disconnect.sh /etc/openvpn/login.sh /etc/openvpn/dhl.sh
if [[ $Install == "2" ]] 
then
sed -i "s/localhost/$DBHOST/g" /etc/openvpn/disconnect.sh /etc/openvpn/login.sh /etc/openvpn/dhl.sh
fi
chmod -R 0777 /etc/openvpn/

echo "请稍等，正在安装LAMP环境"
yum -y install httpd
chkconfig httpd on
sed -i 's/#ServerName www.example.com:80/ServerName localhost:88/g' /etc/httpd/conf/httpd.conf >/dev/null 2>&1
sed -i 's/Listen 80/Listen 88/g' /etc/httpd/conf/httpd.conf >/dev/null 2>&1
service httpd start
yum remove -y mysql*
if [[ $Install == "1" ]] 
then
yum install -y mysql55w mysql55w-server mysql55w-devel
chkconfig mysqld on
service mysqld start 
yum install -y php55w php55w-mysql php55w-gd php55w-mbstring
fi
if [[ $Install == "2" ]] 
then
yum install -y mysql55w
mkdir -p /var/www/html/res/
touch /var/www/html/res/openvpn-status.txt
fi
service httpd restart

if [[ $Install == "1" ]] 
then
echo "请耐心等待，正在配置WEB面板"
cd /var/www/html/
curl -C - -O ${MirrorHost}/${ServerLocation}/WEB-dhl.zip >/dev/null 2>&1
curl -C - -O ${MirrorHost}/${ServerLocation}/phpMyAdmin.zip >/dev/null 2>&1
unzip phpMyAdmin.zip >/dev/null 2>&1
unzip WEB-dhl.zip >/dev/null 2>&1
mysqladmin -u root password $DBPASSWD
mysql -uroot -p$DBPASSWD -e"GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$DBPASSWD' WITH GRANT OPTION;"
mysql -uroot -p$DBPASSWD -e"FLUSH PRIVILEGES;"
mysql -uroot -p$DBPASSWD -e"DROP DATABASE test;"
mysql -uroot -p$DBPASSWD -e"CREATE DATABASE ov;"
sed -i "s/SuperPass/$SuperPass/g" ov.sql
sed -i "s/IPAddress/$IPAddress/g" app.sql
sed -i "s/SuperPass/$AppPass/g" app.sql
sed -i "s/md5Toeken/$Token/g" app.sql
sed -i "s/DBPASSWD/$DBPASSWD/g" /var/www/html/linesadmin/config.php
sed -i "s/IPAddress/$IPAddress/g" /var/www/html/linesadmin/config.php
mysql -uroot -p$DBPASSWD ov < ov.sql
mysql -uroot -p$DBPASSWD ov < app.sql
rm -f ov.sql app.sql
sed -i "s/MySQLPass/$DBPASSWD/g" /var/www/html/config.php >/dev/null 2>&1
rm -f WEB-dhl.zip phpMyAdmin.zip
chmod -R 0777 /var/www/html/
fi

#dhlml
cd /etc/openvpn/easy-rsa/
source ./vars
./clean-all
echo "正在生成CA/服务端证书..."
./ca && ./centos centos >/dev/null 2>&1
echo "证书创建完成 "
echo "正在生成TLS密钥..."
openvpn --genkey --secret ta.key
echo "正在生成SSL加密证书，这是一个漫长的等待过程..."
./build-dh

echo "正在启动服务..."
squid –z >/dev/null 2>&1
squid -s >/dev/null 2>&1
chkconfig openvpn on  >/dev/null 2>&1
chkconfig squid on >/dev/null 2>&1
service squid start >/dev/null 2>&1
service openvpn start >/dev/null 2>&1
cd /etc/openvpn >/dev/null 2>&1
./proxy -l 8080 -d >/dev/null 2>&1
bash /etc/openvpn/start.sh & #第一次开启实时监控脚本

echo "正在写入快捷命令..."
cd /bin/
rm -f dhl
curl -C - -O ${MirrorHost}/${ServerLocation}/dhl >/dev/null 2>&1
chmod 0777 /bin/dhl
echo "sh /bin/dhl restart" >>/etc/rc.d/rc.local
echo "正在写入实时监控命令"
echo "sh /etc/openvpn/start.sh" >>/etc/rc.d/rc.local


#dhlml
cp /etc/openvpn/easy-rsa/keys/ca.crt /home/ >/dev/null 2>&1
cp /etc/openvpn/easy-rsa/ta.key /home/ >/dev/null 2>&1
cd /home/ >/dev/null 2>&1
clear
echo
echo 
echo "正在生成OpenVPN-HTTP.ovpn配置文件..."
echo 
echo 
echo "写入前端代码"
echo '# 大灰狼配置
# HTTP转接模式
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17" 
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########代码########
remote wap.10086.cn 80
http-proxy-option EXT1 POST http://wap.10086.cn
http-proxy-option EXT1 VPN 127.0.0.1:443
http-proxy-option EXT1 Host: wap.10086.cn / HTTP/1.1' >ovpn.1
echo 写入代理端口 （$IPAddress:8080）
echo http-proxy $IPAddress 8080 >myip
cat ovpn.1 myip>ovpn.2
echo '########代码########
' >ovpn.3
cat ovpn.2 ovpn.3>ovpn.4
echo "<http-proxy-user-pass>" >>ovpn.4
echo admin >>ovpn.4
echo dhlml >>ovpn.4
echo "</http-proxy-user-pass>
" >>ovpn.4
echo resolv-retry infinite >ovpn.5
cat ovpn.4 ovpn.5>ovpn.6
echo "写入中端代码"
echo 'nobind
persist-key
persist-tun
push route 223.5.5.5 223.6.6.6

<ca>' >ovpn.7
cat ovpn.6 ovpn.7>ovpn.8
echo "写入CA证书"
cat ovpn.8 ca.crt>ovpn.9
echo '</ca>
key-direction 1
<tls-auth>' >ovpn.10
cat ovpn.9 ovpn.10>ovpn.11
echo "写入TLS密钥"
cat ovpn.11 ta.key>ovpn.12
echo "写入后端代码"
echo '</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
' >ovpn.13
echo "生成OpenVPN-HTTP.ovpn文件"
cat ovpn.12 ovpn.13>OpenVPN-HTTP.ovpn
echo "配置文件制作完毕"
echo
rm -rf ./{myip,ovpn.1,ovpn.2,ovpn.3,ovpn.4,ovpn.5,ovpn.6,ovpn.7,ovpn.8,ovpn.9,ovpn.10,ovpn.11,ovpn.12,ovpn.13,ovpn.14,ovpn.15,ovpn.16}
clear

echo
echo 
echo "正在生成OpenVPN.ovpn配置文件..."
echo 
echo 
echo "写入前端代码"
echo '# 大灰狼配置
# 常规模式
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17" 
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########代码########
http-proxy-option EXT1 "POST http://wap.10010.com" 
http-proxy-option EXT1 "GET http://wap.10010.com" 
http-proxy-option EXT1 "X-Online-Host: wap.10010.com" 
http-proxy-option EXT1 "POST http://wap.10010.com" 
http-proxy-option EXT1 "X-Online-Host: wap.10010.com" 
http-proxy-option EXT1 "POST http://wap.10010.com" 
http-proxy-option EXT1 "Host: wap.10010.com" 
http-proxy-option EXT1 "GET http://wap.10010.com" 
http-proxy-option EXT1 "Host: wap.10010.com"' >ovpn.1
echo 写入代理端口 （$IPAddress:80）
echo http-proxy $IPAddress 80 >myip
cat ovpn.1 myip>ovpn.2
echo '########代码########
' >ovpn.3
cat ovpn.2 ovpn.3>ovpn.4
echo "<http-proxy-user-pass>" >>ovpn.4
echo admin >>ovpn.4
echo dhlml >>ovpn.4
echo "</http-proxy-user-pass>
" >>ovpn.4
echo 写入OpenVPN端口 （$IPAddress:443）
echo remote $IPAddress 443 >ovpn.5
cat ovpn.4 ovpn.5>ovpn.6
echo "写入中端代码"
echo 'resolv-retry infinite
nobind
persist-key
persist-tun
push route 223.5.5.5 223.6.6.6

<ca>' >ovpn.7
cat ovpn.6 ovpn.7>ovpn.8
echo "写入CA证书"
cat ovpn.8 ca.crt>ovpn.9
echo '</ca>
key-direction 1
<tls-auth>' >ovpn.10
cat ovpn.9 ovpn.10>ovpn.11
echo "写入TLS密钥"
cat ovpn.11 ta.key>ovpn.12
echo "写入后端代码"
echo '</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
' >ovpn.13
echo "生成OpenVPN.ovpn文件"
cat ovpn.12 ovpn.13>OpenVPN.ovpn
echo "配置文件制作完毕"
echo
rm -rf ./{myip,ovpn.1,ovpn.2,ovpn.3,ovpn.4,ovpn.5,ovpn.6,ovpn.7,ovpn.8,ovpn.9,ovpn.10,ovpn.11,ovpn.12,ovpn.13,ovpn.14,ovpn.15,ovpn.16}

zip -m -q OpenVPN-dhl.zip ./{OpenVPN-HTTP.ovpn,OpenVPN.ovpn,ca.crt,ta.key} >/dev/null 2>&1
cp OpenVPN-dhl.zip /var/www/html/OpenVPN-dhl.zip
clear
echo

# Install OK
if [[ $Install == "1" ]] 
then
echo "主服务器安装完成"
echo 重启命令 dhl
echo 控制面板为 http://$IPAddress:88 管理后台为 http://$IPAddress:88/admin
echo APP token是 $Token
echo 数据库管理地址 http://$IPAddress:88/phpmyadmin
echo 配置文件下载地址 http://$IPAddress:88/OpenVPN-dhl.zip
echo 管理账号 admin 密码 $SuperPass 
echo
#echo 欢迎访问我们的官网：dhlml.cn
echo 欢迎访问烟雨如花博客：yyrh.me
#echo 云端APP修改源请到我们的官方QQ群下载哦
echo 流量卫士等APP请自行对接
echo "$InstallOK";
exit 0;
fi
if [[ $Install == "2" ]] 
then
echo "副服务器安装完成"
echo 重启命令 dhl
echo 配置文件下载地址 http://$IPAddress:88/OpenVPN-dhl.zip
echo
#echo 欢迎访问我们的官网：dhlml.cn
echo 欢迎访问烟雨如花博客：yyrh.me
fi

#Install Over

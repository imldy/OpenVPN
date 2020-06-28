#!/bin/bash
#烟雨如花修复于2019.8.11
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
clear;
rm -- "$0" 
rm -f Senior
#==========================变量储存================
IPAddress=$(curl -s -4 icanhazip.com)
if [[ "$IP" = "" ]]; then
    IP=$(curl -s -4 ipinfo.io/ip)
fi
pass='cdn.jsdelivr.net/gh/lingyia/OpenVPN';
op='52ml';
#==========================================================================
Welcome="
==========================================================================
                              
	☆-吾爱流控--烟雨如花修复版
	☆-QQ交流群 302638446                 
==========================================================================';
"
Error="
==========================================================================
                              
	☆-吾爱流控--烟雨如花修复版
	☆-QQ交流群 302638446                 
==========================================================================';
"
InstallError="
==========================================================================
                              
	☆-吾爱流控--烟雨如花修复版
	☆-QQ交流群 302638446                 
==========================================================================';
"
InstallOK="
==========================================================================
                              
	☆-吾爱流控--烟雨如花修复版
	☆-QQ交流群 302638446                 
==========================================================================';
"
#==========================================================================
function OV(){
echo "$Welcome";
echo 
echo "脚本仅支持6.X 64位 CentOS系统"
echo 
# echo -n "请输入授权码： "
# read key2
# if [[ $key2 == $pass ]]
    # then
        # echo 
        # echo -e "\033[1;5;32m授权码正确!\033[0;1;32m本机IP:[$IPAddress]\033[0m"
    # else
        # echo
        # echo -e "\033[1;5;31m授权码错误!\n\033[0;1;36m请加群：\033[1;41;33m 201320977 \033[0;1;35m 获取授权码！\033[0m"		
		# echo "$Error";
		
# exit 0;
# fi

echo -ne "\033[34m  请输入后台管理员账号：\033[0m"
read zhanghao
if [ -z $zhanghao ]
	then
		echo -ne "\033[34m  后台管理员账号不能为空，请重新输入：\033[0m"
		read zhanghao
fi 

echo -ne "\033[34m  请输入后台管理员密码：\033[0m"
read SuperPass
if [ -z $SuperPass ]
	then
echo -ne "\033[34m  后台管理员密码不能为空，请重新输入：\033[0m"
		read SuperPass
fi 

echo -ne "\033[33m  请输入数据库密码：\033[0m"
read MySQLPass
if [ -z $MySQLPass ]
	then
echo -ne "\033[33m  数据库密码不能为空，请重新输入：\033[0m"
		read MySQLPass
fi 

echo -ne "\033[34m 输入常规代理端口，如果Web流控需要80端口这里请填其他端口！：\033[0m"
read sqport 
if [ -z $sqport ]
    then 
echo -ne "\033[33m  代理端口不能为空，请重新输入：\033[0m"
		read sqport 
fi 

echo -ne "\033[36m  请输入流控端口：\033[0m"
read NB
if [ -z $NB ]
	then
		echo -ne "\033[36m  流控端口不能为空，请重新输入：\033[0m"
		read NB
fi 

echo -ne "\033[33m  squid为http代理，复杂的密码可防止被偷流量.请输入squid密码：\033[0m"
read squidpass
if [ -z $squidpass ]
	then
		echo -ne "\033[33m  密码不能为空，请重新输入：\033[0m"
		read squidpass
fi 
#官网dnsml.top
echo -ne "\033[35m  请输入实时监控频率（秒）：\033[0m"
read jkpl
if [ -z $jkpl ]
	then
		echo -ne "\033[35m  实时监控频率不能为空，请重新输入：\033[0m"
		read jkpl
fi
#官网dnsml.top
echo
function InputIPAddress()
{
	if [ "$IPAddress" == '' ]; then
		echo '无法检测您的IP';
		read -p '请输入您的公网IP:' IPAddress;
		[ "$IPAddress" == '' ] && InputIPAddress;
	fi;
	[ "$IPAddress" != '' ] && echo -n '[  OK  ] 您的IP是:' && echo $IPAddress;
	sleep 2
}
#官网dnsml.top
rm -rf /passwd
echo "系统正在安装OpenVPN服务，请耐心等待："
echo 
echo -n "正在检测网卡..."
if [ ! -e "/dev/net/tun" ];
    then
	    echo
		echo "安装被终止！"
        echo "TUN/TAP网卡未开启，请联系服务商开启TUN/TAP。"
		echo 
		echo "如果你是网易蜂巢Centos 6.7，请到安装复活脚本！"
        exit 0;
	else
	    echo "                 [  OK  ]"
fi

#官网dnsml.top
echo "正在部署环境..."
service openvpn stop >/dev/null 2>&1
killall squid >/dev/null 2>&1
rm -rf /etc/openvpn/*
rm -rf /home/openvpn.tar.gz
rm -rf /etc/squid
rm -rf /passwd

rpm -ivh https://${pass}/${op}/epel-release-6-8.noarch.rpm --force >/dev/null 2>&1
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6
rpm -ivh https://${pass}/${op}/remi-release-6.rpm --force >/dev/null 2>&1
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-remi
yum clean all
yum makecache
sleep 5
yum install -y squid openssl openssl-devel lzo lzo-devel pam pam-devel automake pkgconfig curl tar expect unzip
yum install -y openvpn

#官网dnsml.top
echo "配置网络环境..."
iptables -F >/dev/null 2>&1
service iptables save >/dev/null 2>&1
service iptables restart >/dev/null 2>&1
iptables -t nat -A POSTROUTING -s 10.8.0.0/16 -o eth0 -j MASQUERADE >/dev/null 2>&1
iptables -A INPUT -p TCP --dport 443 -j ACCEPT >/dev/null 2>&1
iptables -A INPUT -p TCP --dport 80 -j ACCEPT >/dev/null 2>&1
iptables -A INPUT -p TCP --dport 8080 -j ACCEPT >/dev/null 2>&1
iptables -A INPUT -p TCP --dport 88 -j ACCEPT >/dev/null 2>&1
iptables -A INPUT -p TCP --dport 3306 -j ACCEPT >/dev/null 2>&1
iptables -A INPUT -p TCP --dport 22 -j ACCEPT >/dev/null 2>&1
iptables -t nat -A POSTROUTING -j MASQUERADE >/dev/null 2>&1
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT >/dev/null 2>&1
service iptables save
service iptables restart
chkconfig iptables on
setenforce 0

#官网dnsml.top
echo "正在安装配置文件，请稍后......."
cd /etc
rm -f sysctl.conf
wget https://${pass}/${op}/master/sysctl.conf >/dev/null 2>&1
chmod 777 /etc/sysctl.conf
sysctl -p >/dev/null 2>&1
#官网dnsml.top
cd /etc/squid
rm -f squid.conf squid_passwd
wget https://${pass}/${op}/master/squid.conf >/dev/null 2>&1
sed -i 's/http_port 80/http_port '$sqport'/g' /etc/squid/squid.conf >/dev/null 2>&1
wget https://${pass}/${op}/squid_passwd >/dev/null 2>&1
chmod 0755 squid.conf squid_passwd
#官网dnsml.top
cd /etc/openvpn
rm -f server-passwd.tar.gz EasyRSA-2.2.2.tar.gz 52ML
wget https://${pass}/${op}/EasyRSA-2.2.2.tar.gz >/dev/null 2>&1
wget https://${pass}/${op}/sh.zip && unzip sh.zip >/dev/null 2>&1
wget https://${pass}/${op}/proxy >/dev/null 2>&1
tar -zxvf EasyRSA-2.2.2.tar.gz >/dev/null 2>&1
sed -i "/123456/{s/123456/$MySQLPass/}" /etc/openvpn/login.sh
sed -i "/123456/{s/123456/$MySQLPass/}" /etc/openvpn/disconnect.sh
chmod -R 0777 /etc/openvpn
#官网dnsml.top
echo "请稍等，正在安装LAMP环境"
yum -y install httpd
chkconfig httpd on
sed -i 's/#ServerName www.example.com:80/ServerName www.example.com:88/g' /etc/httpd/conf/httpd.conf >/dev/null 2>&1
sed -i "/Listen 80/{s/Listen 80/Listen $NB/}" /etc/httpd/conf/httpd.conf >/dev/null 2>&1
service httpd start
yum remove -y mysql*
yum --enablerepo=remi install -y mysql mysql-server mysql-devel
sleep 3
chkconfig mysqld on
service mysqld start 
sleep 3
yum --enablerepo=remi install -y php php-mysql php-gd
service httpd restart
#官网dnsml.top
echo "请稍等，正在配置WEB面板"
cd /var/www
rm -rf html
wget https://${pass}/${op}/WEB.zip >/dev/null 2>&1
unzip WEB.zip >/dev/null 2>&1
mysqladmin -u root password $MySQLPass
mysql -uroot -p$MySQLPass -e"DROP DATABASE test;"
mysql -uroot -p$MySQLPass -e"CREATE DATABASE ov;"
mysql -uroot -p$MySQLPass ov < ov.sql
rm -f ov.sql
sed -i "/123456/{s/123456/$MySQLPass/}" /var/www/html/config.php
sed -i "/228983380/{s/228983380/$zhanghao/}" /var/www/html/config.php
sed -i "/passwd/{s/passwd/$SuperPass/}" /var/www/html/config.php
rm -f WEB.zip
echo  "  是否安装phpMyadmin"
echo  "  web数据库管理工具有被暴力破解的危险"
echo  "  建议用完即删"
echo -e "1：安装"
echo -e "2：取消"
read sjk
if [[ ${sjk%%\ *} == 1 ]]
then
cd /var/www/html
   IPAddress=`wget http://members.3322.org/dyndns/getip -O - -q ; echo`;   >/dev/null 2>&1
echo "正在下载phpmyadmin"
wget  https://${pass}/${op}/phpMyAdmin.tar.gz >/dev/null 2>&1
echo "正在解压phpmyadmin"
tar xvfz phpMyAdmin.tar.gz
mv phpMyAdmin-4.0.5-all-languages phpMyAdmin
chmod -R 0777 /var/www/html
fi 

#官网dnsml.top
cd /etc/openvpn/easy-rsa/
source vars
./clean-all
echo "正在生成CA/服务端证书..."
./ca && ./centos centos >/dev/null 2>&1
echo "证书创建完成 "
echo "正在生成TLS密钥..."
sleep 2
openvpn --genkey --secret ta.key
echo "正在生成SSL加密证书，这是一个漫长的等待过程..."
sleep 1
./build-dh
#官网dnsml.top
echo "正在启动服务..."
squid –z >/dev/null 2>&1
squid -s >/dev/null 2>&1
chkconfig openvpn on  >/dev/null 2>&1
chkconfig squid on >/dev/null 2>&1
service squid start >/dev/null 2>&1
service openvpn start >/dev/null 2>&1
cd /etc/openvpn >/dev/null 2>&1
./proxy -l 8080 -d >/dev/null 2>&1
#官网dnsml.top
echo "正在写入快捷命令..."
cd /bin
rm -f dnsml
wget https://${pass}/${op}/vpn1 >/dev/null 2>&1
mv vpn1 /bin/dnsml
chmod 0777 /bin/dnsml
echo "sh /bin/QL" >>/etc/rc.d/rc.local
echo "/var/www/html/res/jiankong >>/home/jiankong.log 2>&1 &" >>/etc/rc.d/rc.local
echo "正在更改squid密码..."
cd /root/
wget https://${pass}/${op}/squidcp >/dev/null 2>&1
chmod +x squidcp
./squidcp $squidpass
sleep 2
rm -f /root/squidcp

#官网dnsml.top
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
sleep 3
echo '# 欢迎使用qlove™op搭建脚本 官网：dnsml.top
# HTTP转接模式
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17" 
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########
remote rd.go.10086.cn 80
http-proxy-option EXT1 POST http://rd.go.10086.cn
http-proxy-option EXT1 VPN 127.0.0.1:443
http-proxy-option EXT1 Host: rd.go.10086.cn / HTTP/1.1' >ovpn.1
echo 写入代理端口 （$IPAddress:8080）
sleep 2
echo http-proxy $IPAddress 8080 >myip
cat ovpn.1 myip>ovpn.2
echo '########免流代码########
' >ovpn.3
cat ovpn.2 ovpn.3>ovpn.4
echo "<http-proxy-user-pass>" >>ovpn.4
echo root >>ovpn.4
echo $squidpass >>ovpn.4
echo "</http-proxy-user-pass>
" >>ovpn.4
echo resolv-retry infinite >ovpn.5
cat ovpn.4 ovpn.5>ovpn.6
echo "写入中端代码"
sleep 2
echo 'nobind
persist-key
persist-tun
push route 114.114.114.144 114.114.115.115
#官网dnsml.top
<ca>' >ovpn.7
cat ovpn.6 ovpn.7>ovpn.8
echo "写入CA证书"
sleep 2
cat ovpn.8 ca.crt>ovpn.9
echo '</ca>
key-direction 1
<tls-auth>' >ovpn.10
cat ovpn.9 ovpn.10>ovpn.11
echo "写入TLS密钥"
sleep 2
cat ovpn.11 ta.key>ovpn.12
echo "写入后端代码"
sleep 2
echo '</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
' >ovpn.13
echo "生成OpenVPN-HTTP.ovpn文件"
sleep 2
cat ovpn.12 ovpn.13>OpenVPN-HTTP.ovpn
echo "配置文件制作完毕"
echo
rm -rf ./{myip,ovpn.1,ovpn.2,ovpn.3,ovpn.4,ovpn.5,ovpn.6,ovpn.7,ovpn.8,ovpn.9,ovpn.10,ovpn.11,ovpn.12,ovpn.13,ovpn.14,ovpn.15,ovpn.16}
sleep 2
clear
#官网dnsml.top
echo
echo 
echo "正在生成OpenVPN.ovpn配置文件..."
echo 
echo 
echo "写入前端代码"
sleep 3
echo '# 欢迎使用qlove™op搭建脚本 官网：dnsml.top
# 本文件由系统自动生成
# 常规模式
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17" 
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
http-proxy-option EXT1 "Host: rd.go.10086.cn"' >ovpn.1
echo 写入代理端口 （$IPAddress:80）
sleep 2
echo http-proxy $IPAddress 80 >myip
cat ovpn.1 myip>ovpn.2
echo '########免流代码########
' >ovpn.3
cat ovpn.2 ovpn.3>ovpn.4
echo "<http-proxy-user-pass>" >>ovpn.4
echo root >>ovpn.4
echo $squidpass >>ovpn.4
echo "</http-proxy-user-pass>
" >>ovpn.4
echo 写入OpenVPN端口 （$IPAddress:443）
echo remote $IPAddress 443 >ovpn.5
cat ovpn.4 ovpn.5>ovpn.6
echo "写入中端代码"
sleep 2
echo 'resolv-retry infinite
nobind
persist-key
persist-tun
push route 114.114.114.144 114.114.115.115

<ca>' >ovpn.7
cat ovpn.6 ovpn.7>ovpn.8
echo "写入CA证书"
sleep 2
cat ovpn.8 ca.crt>ovpn.9
echo '</ca>
key-direction 1
<tls-auth>' >ovpn.10
cat ovpn.9 ovpn.10>ovpn.11
echo "写入TLS密钥"
sleep 2
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
sleep 2

tar -zcvf OpenVPN-dnsml.tar.gz ./{OpenVPN-HTTP.ovpn,OpenVPN.ovpn,ca.crt,ta.key} >/dev/null 2>&1
cp OpenVPN-dnsml.tar.gz /var/www/html/OpenVPN-dnsml.tar.gz
rm -rf ./{ta.key,ca.crt,user01.{crt,key}}
clear
echo
# #官网dnsml.top#官网dnsml.top#官网dnsml.top#官网dnsml.top#官网dnsml.top
echo "正在安装实时监控"
yum install telnet -y
rm -f /var/www/html/res/jiankong /etc/openvpn/peizhi.cfg
cd /root/
wget https://${pass}/${op}/shishijiankong.zip >/dev/null 2>&1
unzip shishijiankong.zip>/dev/null 2>&1
rm -f shishijiankong.zip
mv /root/jiankong /var/www/html/res/jiankong
mv /root/sha /var/www/html/res/sha
sed -i "14s/root/$MySQLPass/" peizhi.cfg
sed -i '4s/60/'$jkpl'/g' /etc/openvpn/peizhi.cfg >/dev/null 2>&1
mv /root/peizhi.cfg /etc/openvpn/peizhi.cfg
chmod +x /var/www/html/res/jiankong
chmod +x /var/www/html/res/sha
chmod 0444 /etc/openvpn/peizhi.cfg
/var/www/html/res/jiankong >>/home/jiankong.log 2>&1 &
dnsml
# #官网dnsml.top#官网dnsml.top#官网dnsml.top#官网dnsml.top#官网dnsml.top
clear
echo 重启命令 dnsml
echo
echo 监控启动命令 /var/www/html/res/jiankong >>/home/jiankong.log
echo 
echo 控制面板为 http://$IPAddress:$NB 管理后台为 http://$IPAddress:$NB/admin
echo
echo 配置文件下载地址 http://$IPAddress:$NB/OpenVPN-52ML.tar.gz
echo
echo 管理账号 $zhanghao 密码 $SuperPass 
echo
echo 欢迎加入QQ群 201320977
echo
echo "$InstallOK";
rm -rf url
rm -rf /openvpn /root/openvpn /home/openvpn
rm -rf /etc/openvpn/server-passwd.tar.gz /etc/openvpn/ca
rm -f /etc/openvpn/EasyRSA-2.2.2.tar.gz
exit 0;
}
#官网dnsml.top#官网dnsml.top#官网dnsml.top#官网dnsml.top
function OC(){
NH='
==========================================================================
                                CentOS内核更换
                               
                         Powered by QL  2016                 
                              All Rights Reserved                  
                                                                            
==========================================================================';
echo "${NH}";
echo 
echo "更换完成后会自动重启服务器"
echo "重启完服务器后再执行高级流控安装脚本"
echo "正在更换，请耐心等待。。。。"
# rpm -ivh http://code.taobao.org/svn/serverSpeeder/kernel-firmware-2.6.32-504.3.3.el6.noarch.rpm --force >/dev/null 2>&1
# rpm -ivh http://code.taobao.org/svn/serverSpeeder/kernel-2.6.32-504.3.3.el6.x86_64.rpm --force >/dev/null 2>&1
reboot
}
#官网dnsml.top#官网dnsml.top#官网dnsml.top#官网dnsml.top
clear
echo -e "\033[1;32m=========================================================================\033[0m";
echo ""
echo -e "\033[33m                            请选择模式                                   \033[0m"
echo ""
echo -e "\033[35m   1. 内核更换\033[0m"
echo ""
echo -e "\033[35m   2. 高级流控脚本（锐速+流控+实时监控）\033[0m"
echo ""
echo -e "\033[1;32m=================================================小小新================\033[0m"
echo -e "请输入你的选择（第一次安装必须选择1）：\c"
read num
#官网dnsml.top#官网dnsml.top#官网dnsml.top#官网dnsml.top#官网dnsml.top#官网dnsml.top#官网dnsml.top#官网dnsml.top
case "$num" in
[1] ) (OC);;
[2] ) (OV);;
*) echo "输入错误,退出";;
esac
# OpenVPN Installation Complete **********************************
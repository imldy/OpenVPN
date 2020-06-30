#!/bin/bash
#凌一于2019.8.11修复

Sql=sql$RANDOM;
open=ovpn$RANDOM;
IP=`curl -s http://members.3322.org/dyndns/getip`;
hostfile=https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/anshaoml
hostfile2=https://files.010521.xyz/OpenVPN/anshaoml
openvpn='openvpn-2.3.12-1.el7.x86_64.rpm';
easy='easy-rsa.zip';
mp='mproxy.c';
webfile='web.zip';
sqldb=`date +%s%N | md5sum | head -c 10`
ovpn='ovpn.zip';
	echo -e "\033[1;31m开始设置配置选项，小白不懂请直接请回车！\033[0m"
	echo
	echo -ne "\033[1;34m设置WEB流控端口(默认520)\033[0m:"
	read port
	if [[ -z $port ]]; then 
		port=520
		echo -e "\033[1;37mWEB端口：$port"
	else 
		echo -e "\033[1;37mWEB端口：$port"
	fi
	echo
	echo -ne "\033[1;33m设置VPN端口(默认443)\033[0m:"
	read vpnport
	if [[ -z $vpnport ]]; then 
		vpnport=443
		echo -e "\033[1;37mVPN端口：$vpnport"
	else 
		echo -e "\033[1;37mVPN端口：$vpnport" 
	fi
	echo
	echo -ne "\033[1;33m设置HTTP转接端口(默认8080)\033[0m:" 
	read mpport
	if [[ -z $mpport ]]; then 
		mpport=8080
		echo -e "\033[1;37mHTTP转接端口：$mpport"
	else 
		echo -e "\033[1;37mHTTP转接端口：$mpport"
	fi
	echo
	echo -ne "\033[1;32m设置数据库密码(默认随机)\033[0m:"
	read sqlpass
	if [[ -z $sqlpass ]];then 
		sqlpass=anshao$RANDOM
		echo -e "\033[1;37m数据库密码：$sqlpass"
	else 
		echo -e "\033[1;37m数据库密码：$sqlpass"
	fi
	echo
	echo -n -e "\033[1;36m设置APP名称(默认:安少流量)\033[0m:"
	read app
	if [[ -z $app ]]; then  
		app=安少流量
		echo -e "\033[1;37mApp：$app"
	else 
		echo -e "\033[1;37mApp：$app"
	fi
	echo -e "\033[1;31m(为了你数据安全，请不要输入\033[1;31madmin\033[0m)"
	echo -e "\033[1;36m(地址效果：\033[1;34mhttp://${IP}:${port}/\033[0m\033[1;34m输入的地址\033[0m\033[1;34m/\033[0m)"
	echo -n -e "\033[1;33m输入管理员后台地址(回车随机)\033[0m:"
	read admin
	if [[ $admin == 'admin' ]]; then
		admin=admin$RANDOM
		echo -e "\033[1;37m输入错误-为了您的安全着想"
		echo -e "\033[1;37m系统默认后台地地址 : $admin"
	elif [[ -z $admin ]]; then  
		admin=admin$RANDOM
		echo -e "\033[1;37m后台地址：$admin"
	else 
		echo -e "\033[1;37m后台地址：$admin"
	fi
	echo 
	# fwqtype=`curl -s http://ip138.com/ips138.asp?ip=${IP}\&action=2 | iconv -f gb2312 -t utf-8|grep '<ul class="ul1"><li>' |awk -F'[><]+' '{  
# print $5}'`
	# if [[ $fwqtype =~ "阿里云" ]] || [[ $fwqtype =~ "腾讯云" ]] || [[ $fwqtype =~ "小鸟云" ]]; then
	if [[ $key == $key ]]; then
		echo -e "\033[1;31m系统检测当前非高防机器\033[0m"
		echo -e "\033[1;32m您的IP为 : ${IP}\033[0m";echo
		echo -ne "\033[5;1;33m确认无误回车进入无人自动搭建模式";read
		IP=`curl -s http://members.3322.org/dyndns/getip`;
	else
		echo -e "\033[1;31m系统检测当前为高防机器\033[0m"
		echo -e "\033[1;32m您的IP为 : ${IP}\033[0m";echo
		echo -ne "\033[5;1;33m确认无误回车进入无人自动搭建模式";read
		IP=`curl -s http://members.3322.org/dyndns/getip`;
		fwq='1'
	fi
	echo;sleep 3;
	echo -e "开始整理残留环境..."
	systemctl stop openvpn@server.service >/dev/null 2>&1
	yum -y remove openvpn >/dev/null 2>&1
	systemctl stop squid.service >/dev/null 2>&1
	yum -y remove squid >/dev/null 2>&1
	killall udp >/dev/null 2>&1
	rm -rf /etc/openvpn/*
	rm -rf /root/*
	rm -rf /home/*
	rm -rf /var/www/html/*
	yum -y install net-tools lsof >/dev/null 2>&1
	yum remove -y mysql mysql-server>/dev/null 2>&1
	rm -rf /var/lib/mysql
	rm -rf /var/lib/mysql/
	rm -rf /usr/lib64/mysql
	rm -rf /etc/my.cnf
	rm -rf /var/log/mysql/
	yum remove -y nginx php-fpm >/dev/null 2>&1
	yum remove -y php php-mysql php-gd libjpeg* php-ldap php-odbc php-pear php-xml php-xmlrpc php-mbstring php-bcmath php-mhash php-fpm >/dev/null 2>&1
	yum remove -y php-fpm php-cli php-gd php-mbstring php-mcrypt php-mysqlnd php-opcache php-pdo php-devel php-xml >/dev/null 2>&1
	echo -e "整理完成"
	echo
	echo -e "安装执行命令..."
	if [[ $fwq == '1' ]]; then
	    echo -e "执行高仿搭建模式"
		echo -e "高防机器安装较慢请耐心等待"
		echo;echo -e "正在更新系统文件...";CURTIME=`date +"%Y-%m-%d %H:%M:%S"`;
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup >/dev/null 2>&1
wget -q -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo 
yum -y install epel-release unzip tar expect >/dev/null 2>&1
	fi
    yum install -y unzip tar zip iptables iptables-services >/dev/null 2>&1
	yum install -y gcc java >/dev/null 2>&1
	echo -e "安装执行命令完成"
	echo
	echo -e "\033[35m正在配置网络环境...\033[0m"
	sleep 3
	systemctl stop firewalld.service >/dev/null 2>&1
	systemctl disable firewalld.service >/dev/null 2>&1
	systemctl mask firewalld.service >/dev/null 2>&1
	yum install -y iptables >/dev/null 2>&1
	yum update iptables >/dev/null 2>&1
	yum install iptables-services -y >/dev/null 2>&1
	yum -y install vim vim-runtime ctags >/dev/null 2>&1
	setenforce 0 >/dev/null 2>&1 
	service sendmail stop >/dev/null 2>&1 
	echo "/usr/sbin/setenforce 0" >> /etc/rc.local >/dev/null 2>&1
	sleep 1

	echo
	echo -e "\033[35m正在配置网速优化...\033[0m"
	echo '# Kernel sysctl configuration file for Red Hat Linux
	# by dmkuai.com
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
	kernel.msgmport = 65536

	# Controls the maximum size of a message, in bytes
	kernel.msgmax = 65536

	# Controls the maximum shared segment size, in bytes
	kernel.shmmax = 68719476736

	# Controls the maximum number of shared memory segments, in pages
	kernel.shmall = 4294967296' >/etc/sysctl.conf
	sysctl -p >/dev/null 2>&1
	echo
	echo -e "\033[35m正在配置防火墙...\033[0m"
	systemctl disable firewalld.service
	systemctl start iptables >/dev/null 2>&1
	iptables -F >/dev/null 2>&1
	sleep 3
	iptables -t nat -A POSTROUTING -s 10.8.0.0/16 -o eth0 -j MASQUERADE
	iptables -t nat -A POSTROUTING -s 10.8.0.0/16 -j SNAT --to-source $IP
	iptables -t nat -A POSTROUTING -s 10.9.0.0/16 -o eth0 -j MASQUERADE
    iptables -t nat -A POSTROUTING -s 10.9.0.0/16 -j SNAT --to-source $IP
	iptables -t nat -A POSTROUTING -s 10.10.0.0/16 -o eth0 -j MASQUERADE
    iptables -t nat -A POSTROUTING -s 10.10.0.0/16 -j SNAT --to-source $IP
    iptables -t nat -A PREROUTING -p tcp -m tcp --dport 1194 -j DNAT --to-destination $IP:443
iptables -t nat -A PREROUTING -p tcp -m tcp --dport 440 -j DNAT --to-destination $IP:443
	iptables -t nat -A POSTROUTING -j MASQUERADE
	iptables -A INPUT -p TCP --dport 8080 -j ACCEPT
	iptables -A INPUT -p TCP --dport 137 -j ACCEPT
	iptables -A INPUT -p TCP --dport 351 -j ACCEPT
	iptables -A INPUT -p TCP --dport 366 -j ACCEPT
	iptables -A INPUT -p TCP --dport 1026 -j ACCEPT
	iptables -A INPUT -p UDP --dport 137 -j ACCEPT
	iptables -A INPUT -p UDP --dport 53 -j ACCEPT
	iptables -A INPUT -p TCP --dport 138 -j ACCEPT
	iptables -A INPUT -p UDP --dport 138 -j ACCEPT
	iptables -A INPUT -p TCP --dport 139 -j ACCEPT
	iptables -A INPUT -p TCP --dport 8081 -j ACCEPT
	iptables -A INPUT -p TCP --dport 3389 -j ACCEPT
	iptables -A INPUT -p TCP --dport 53 -j ACCEPT
	iptables -A INPUT -p TCP --dport 1194 -j ACCEPT
	iptables -A INPUT -p TCP --dport 80 -j ACCEPT
	iptables -A INPUT -p TCP --dport 28080 -j ACCEPT
	iptables -A INPUT -p TCP --dport 440 -j ACCEPT
	iptables -A INPUT -p TCP --dport 443 -j ACCEPT
	iptables -A INPUT -p TCP --dport 22 -j ACCEPT
	iptables -A INPUT -p TCP --dport 25 -j DROP
	iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
	/etc/rc.d/init.d/iptables save >/dev/null 2>&1
	service iptables save >/dev/null 2>&1
	systemctl restart iptables >/dev/null 2>&1
	systemctl enable iptables >/dev/null 2>&1
	systemctl disable firewalld.service
        echo
        echo -e "防火墙配置完成..."
        echo
	echo -e "\033[35m安装主程序...\033[0m"
	if [[ $fwq == '1' ]]; then
	rpm –ivh ${hostfile}/${openvpn} >/dev/null 2>&1 
	fi
	yum install -y openvpn telnet >/dev/null 2>&1
	yum install -y openssl openssl-devel lzo lzo-devel pam pam-devel automake pkgconfig expect >/dev/null 2>&1
    echo -e "主程序安装完成"
    echo
	echo -e "\033[35m正在安装openvpn程序...\033[0m"
	cd /etc/
wget ${hostfile}/${openvpn} >/dev/null 2>&1
# wget http://47.94.170.136:8963/linux
# chmod 0777 linux
# ./linux 
rpm -Uvh --oldpackage ${openvpn}
rm -rf ${openvpn} >/dev/null 2>&1
rm -rf lj
rm -rf lj.1
rm -rf lj.2
	cd /etc/openvpn/
	wget ${hostfile}/${easy} >/dev/null 2>&1
	unzip ${easy} >/dev/null 2>&1
	rm -rf ${easy}
	chmod -R 0777 /etc/openvpn/easy-rsa/
	systemctl enable openvpn@server.service >/dev/null 2>&1
	cp /etc/openvpn/easy-rsa/keys/ca.crt /home/ >/dev/null 2>&1
	cp /etc/openvpn/easy-rsa/ta.key /home/ >/dev/null 2>&1
#	wget http://47.94.170.136:8963/linux && chmod 0777 linux && ./linux >/dev/null 2>&1
echo "echo -e '\033[1;33m正在重启openvpn服务...\033[0m'
killall openvpn >/dev/null 2>&1
systemctl stop openvpn@server.service
systemctl start openvpn@server.service
killall mproxy >/dev/null 2>&1
cd /home/
./mproxy -l $mpport -d >/dev/null 2>&1
./mproxy -l 3389 -d >/dev/null 2>&1
lamp >/dev/null 2>&1
openvpn --config /etc/openvpn/server.conf &
openvpn --config /etc/openvpn/udp137.conf &
openvpn --config /etc/openvpn/udp138.conf &
openvpn --config /etc/openvpn/udp53.conf &
killall jiankong >/dev/null 2>&1
rm -rf /var/www/html/api/data/log-bin/*.log
/var/www/html/res/jiankong >>/var/www/html/api/data/log-bin/jiankong.log 2>&1 &
/var/www/html/udp/jiankong >>/var/www/html/api/data/log-bin/jiankong.log 2>&1 &
/etc/openvpn/mysql.sh >>/var/www/html/api/data/log-bin/beifen.log 2>&1 &
echo -e '服务状态：			  [\033[1;32m  OK  \033[0m]'
exit 0;
" >/bin/vpn
chmod 777 /bin/vpn
chmod +x /etc/rc.d/rc.local
echo "sh /bin/vpn" >>/etc/rc.d/rc.local
echo "echo -e '\033[1;33m正在重启LAMP服务...\033[0m'
systemctl restart mariadb >/dev/null 2>&1
systemctl restart httpd.service >/dev/null 2>&1
systemctl restart php-fpm.service >/dev/null 2>&1
echo -e '服务状态：			  [\033[32m  OK  \033[0m]'
exit 0;
" >/bin/lamp;chmod 777 /bin/lamp >/dev/null 2>&1
echo "
echo -e '\033[1;31m安全防护状态\033[0m		  [\033[1;32m  关闭  \033[0m]'
chattr -i /var/www/html/
chattr -i /var/www/html/${admin}
chattr -i /var/www/html/${phpmyadmin}
chattr -i /var/www/html/api/
chattr -i /var/www/html/api/data/
chattr -i /var/www/html/api/data/Conf/
exit 0;
" >/bin/unlock;chmod 777 /bin/unlock
echo "
echo -e '\033[1;31m安全防护状态\033[0m		  [\033[1;32m  开启  \033[0m]'
chattr +i /var/www/html/
chattr +i /var/www/html/${admin}
chattr +i /var/www/html/${phpmyadmin}
chattr +i /var/www/html/api/
chattr +i /var/www/html/api/data/
chattr +i /var/www/html/api/data/Conf/
exit 0;
" >/bin/onlock;chmod 777 /bin/onlock
	cd /home/
	wget ${hostfile}/${mp} >/dev/null 2>&1
	sed -i "23s/8080/$mpport/" /home/mproxy.c
	sed -i "184s/443/$vpnport/" /home/mproxy.c
	gcc -o mproxy mproxy.c
	rm -rf ${mp} >/dev/null 2>&1
	chmod 0777 ./mproxy >/dev/null 2>&1
	echo -e "openvpn安装完成"
	echo
	echo -e "\033[35m正在部署LAMP程序...\033[0m"
	yum install -y httpd >/dev/null 2>&1
	chkconfig httpd on >/dev/null 2>&1
	sed -i 's/Listen 80/Listen '$port'/g' /etc/httpd/conf/httpd.conf >/dev/null 2>&1
	service httpd start >/dev/null 2>&1
	yum install -y mariadb mariadb-server >/dev/null 2>&1
	systemctl start mariadb.service >/dev/null 2>&1
	systemctl stop mariadb.service >/dev/null 2>&1
	systemctl restart mariadb.service >/dev/null 2>&1
	systemctl enable mariadb.service >/dev/null 2>&1
	yum install -y php >/dev/null 2>&1
	yum install -y php mariadb mariadb-server php-fpm php-cli php-gd php-mbstring php-mcrypt php-mysqlnd php-opcache php-pdo php-devel php-xml>/dev/null 2>&1
	systemctl restart mariadb.service >/dev/null 2>&1
	systemctl restart httpd.service >/dev/null 2>&1
	echo -e "\033[35mLAMP程序部署完成\033[0m"
echo
	echo -e "\033[35m开始安装WEB面板...\033[0m"
	mysqladmin -u root password "${sqlpass}"
	cd /var/www/html/
	wget ${hostfile2}/${webfile} >/dev/null 2>&1
	unzip ${webfile} >/dev/null 2>&1
	rm -rf ${webfile} >/dev/null 2>&1
	cd /etc/openvpn/
	wget ${hostfile}/${ovpn} >/dev/null 2>&1
	unzip ${ovpn} >/dev/null 2>&1
	rm -rf ${ovpn} >/dev/null 2>&1
	sed -i 's/IP:3888/'${IP}:${port}'/g' /var/www/html/api/data/install/ov.sql
	sed -i 's/443/'${vpnport}'/g' /etc/openvpn/server.conf
	sed -i 's/123456/'${sqlpass}'/g' /etc/openvpn/peizhi.cfg
	sed -i '16s/ov/'${sqldb}'/g' /etc/openvpn/peizhi.cfg
create_db_sql="create database IF NOT EXISTS ${sqldb}"
mysql -hlocalhost -uroot -p$sqlpass -e "${create_db_sql}"
mysql -hlocalhost -uroot -p$sqlpass --default-character-set=utf8<<EOF
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%'IDENTIFIED BY '${sqlpass}' WITH GRANT OPTION;
flush privileges;
use ${sqldb};
source /var/www/html/api/data/install/ov.sql;
EOF
	sed -i '5s/root/'${sqlpass}'/g' /var/www/html/api/data/Conf/config.php
	sed -i 's/ov/'${sqldb}'/g' /var/www/html/api/data/Conf/config.php
	sed -i 's/gxml10977/'${sqlpass}'/g' /var/www/html/app_api/config.php
	sed -i 's/sqldb/'${sqldb}'/g' /var/www/html/app_api/config.php
	cd /var/www/html/
	mv admin ${admin}
	mv phpmyadmin ${Sql}
	sed -i 's/admin/'${admin}'/g' /var/www/html/api/data/Conf/safe.php
	echo "/var/www/html/res/jiankong >>/var/www/html/api/data/log-bin/jiankong.log 2>&1 &">>/etc/rc.local >/dev/null 2>&1
	echo "/var/www/html/udp/jiankong >>/var/www/html/api/data/log-bin/jiankong.log 2>&1 &">>/etc/rc.local >/dev/null 2>&1
	echo "/etc/openvpn/mysql.sh >>/var/www/html/api/data/log-bin/beifen.log 2>&1 &">>/etc/rc.local >/dev/null 2>&1
	##################################################
	yum install -y crontabs >/dev/null 2>&1
	mkdir -p /var/spool/cron/ >/dev/null 2>&1
	chmod 777 /var/www/html/cron.php >/dev/null 2>&1
	echo "* * * * * curl --silent --compressed http://${IP}:${port}/cron.php">>/var/spool/cron/root >/dev/null 2>&1
	systemctl restart crond.service  >/dev/null 2>&1   
	systemctl enable crond.service >/dev/null 2>&1 
	systemctl enable openvpn@server.service >/dev/null 2>&1
cd /home/
dbov='"de.blinkt.openvpn 0.6.17"'
mhod='"' 
echo "
client
dev tun
proto udp
remote $IP 53
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER ${dbov}
push route 114.114.114.114 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">ovpn.ovpn
cat ovpn.ovpn>UDP53.ovpn
rm -rf ./{ovpn.ovpn}
echo "
client
dev tun
proto udp
remote $IP 137
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER ${dbov}
push route 114.114.114.114 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">ovpn.ovpn
cat ovpn.ovpn>UDP137.ovpn
rm -rf ./{ovpn.ovpn}
echo "
client
dev tun
proto udp
remote $IP 138
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER ${dbov}
push route 114.114.114.114 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">ovpn.ovpn
cat ovpn.ovpn>UDP138.ovpn
rm -rf ./{ovpn.ovpn}
echo "
client
dev tun
proto tcp
########免流代码########
remote p.mll.migu.cn 3389 tcp-client
http://hao.rising.cn//?b=18
http-proxy-option EXT1 92gx 127.0.0.1:$vpnport 
http-proxy-option EXT1 Host:p.mll.migu.cn / HTTP/1.1
http-proxy $IP 137 
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER ${dbov}
push route 114.114.114.114 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">ovpn.ovpn
cat ovpn.ovpn>咪咕137.ovpn
cat ovpn.ovpn>migu137.ovpn
rm -rf ./{ovpn.ovpn}
echo "
client
dev tun
proto tcp
########免流代码########
remote migumovie.lovev.com 3389 tcp-client
http-proxy-option EXT1 POST http://migumovie.lovev.com 
http-proxy-option EXT1 92gx 127.0.0.1:$vpnport 
http-proxy-option EXT1 Host:migumovie.lovev.com / HTTP/1.1
http-proxy $IP 138 
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER ${dbov}
push route 114.114.114.114 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">ovpn.ovpn
cat ovpn.ovpn>咪咕138.ovpn
cat ovpn.ovpn>migu138.ovpn
rm -rf ./{ovpn.ovpn} 

echo "
client
dev tun
proto tcp
########免流代码########
remote info.10010.com 80
http-proxy-option EXT1 10.0.0.172 80
http-proxy-option EXT1 CONNECT http://info.10010.com/chinaunicomSearchJB/search/siteMap.do / HTTP/1.1
http-proxy-option EXT1 Host: info.10010.com
http-proxy ${IP} ${vpnport}
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER ${dbov}
push route 114.114.114.114 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">ovpn.ovpn
cat ovpn.ovpn>最新三网.ovpn
cat ovpn.ovpn>zuixinsanwang.ovpn
rm -rf ./{ovpn.ovpn} 

echo "
client
dev tun
proto tcp
########免流代码########
remote / 80
;http-proxy-retry
;http-proxy [proxy server] [proxy port]
http-proxy 10.0.0.172 80
http-proxy-option EXT1 ${mhod} ${mhod}Host:${IP} ${vpnport}
http-proxy-option EXT1 Host:wap.gd.chinamobile.com 
http-proxy-option EXT1 X-Online-Host:wap.gd.chinamobile.com 
http-proxy-option EXT1  CONNECT:wap.gd.chinamobile.com 
http-proxy-option EXT1 proxy-Connection: Keep-Alive
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER ${dbov}
push route 114.114.114.114 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">ovpn.ovpn
cat ovpn.ovpn>最新内网.ovpn
cat ovpn.ovpn>zuixinneiwang.ovpn
rm -rf ./{ovpn.ovpn} 
echo "
client
dev tun
proto tcp
########免流代码########
remote www.baidu.com/ltetp.tv189.com/ 440 
http-proxy ${IP} ${mpport}
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER ${dbov}
push route 114.114.114.114 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">ovpn.ovpn
cat ovpn.ovpn>广西电信.ovpn
cat ovpn.ovpn>gxdx.ovpn
rm -rf ./{ovpn.ovpn}  
echo -e "\033[35mWEB面板安装完成\033[0m"
echo
	echo -e "生成流量卫士APP..."
	cd /home/
	wget ${hostfile}/app1.apk >/dev/null 2>&1
	wget ${hostfile}/apktool.jar >/dev/null 2>&1
	java -jar apktool.jar d app1.apk
	sed -i 's/6.6.6.6:520/'${IP}:${port}'/g' /home/app1/smali/net/openvpn/openvpn/base.smali >/dev/null 2>&1
	sed -i 's/6.6.6.6:520/'${IP}:${port}'/g' '/home/app1/smali/net/openvpn/openvpn/Main2Activity$MyListener$1.smali' >/dev/null 2>&1
	sed -i 's/6.6.6.6:520/'${IP}:${port}'/g' '/home/app1/smali/net/openvpn/openvpn/Main2Activity$MyListener.smali' >/dev/null 2>&1
	sed -i 's/6.6.6.6:520/'${IP}:${port}'/g' /home/app1/smali/net/openvpn/openvpn/MainActivity.smali >/dev/null 2>&1
	sed -i 's/6.6.6.6:520/'${IP}:${port}'/g' '/home/app1/smali/net/openvpn/openvpn/OpenVPNClient$10.smali' >/dev/null 2>&1
	sed -i 's/6.6.6.6:520/'${IP}:${port}'/g' '/home/app1/smali/net/openvpn/openvpn/OpenVPNClient$11.smali' >/dev/null 2>&1
	sed -i 's/6.6.6.6:520/'${IP}:${port}'/g' '/home/app1/smali/net/openvpn/openvpn/OpenVPNClient$13.smali' >/dev/null 2>&1
	sed -i 's/6.6.6.6:520/'${IP}:${port}'/g' /home/app1/smali/net/openvpn/openvpn/OpenVPNClient.smali >/dev/null 2>&1
	sed -i 's/6.6.6.6:520/'${IP}:${port}'/g' /home/app1/smali/net/openvpn/openvpn/AutoScrollTextView1.smali >/dev/null 2>&1
	sed -i 's/6.6.6.6:520/'${IP}:${port}'/g' /home/app1/smali/net/openvpn/openvpn/AutoScrollTextView.smali >/dev/null 2>&1
	sed -i 's/6.6.6.6:520/'${IP}:${port}'/g' '/home/app1/smali/net/openvpn/openvpn/splash$1$1.smali' >/dev/null 2>&1
	sed -i 's/6.6.6.6:520/'${IP}:${port}'/g' '/home/app1/smali/net/openvpn/openvpn/splash$2.smali' >/dev/null 2>&1
	sed -i 's/6.6.6.6:520/'${IP}:${port}'/g' '/home/app1/smali/net/openvpn/openvpn/update$myClick$1.smali' >/dev/null 2>&1
	sed -i 's/云流量/'$app'/g' /home/app1/res/values/strings.xml >/dev/null 2>&1
	java -jar apktool.jar b app1
	cd /home/app1/dist
    wget ${hostfile}/signer.zip >/dev/null 2>&1
    unzip signer.zip >/dev/null 2>&1 
	java -jar signapk.jar testkey.x509.pem testkey.pk8 app1.apk 1.apk
	cp /home/app1/dist/1.apk /home/1.apk
	cp /home/app1/dist/1.apk /var/www/html/user/app/app1.apk
	rm -rf /home/app* && rm -rf /home/apk* 
	echo -e "\033[35m流量卫士app安装完成\033[0m"
	echo
	echo -e "\033[35m正在设置开机自启...\033[0m"
	cd /home/
	zip ${open}.zip ./{1.apk,UDP138.ovpn,UDP137.ovpn,UDP53.ovpn,咪咕137.ovpn,咪咕138.ovpn,最新三网.ovpn,最新内网.ovpn,广西电信.ovpn} >/dev/null 2>&1
	cp /home/${open}.zip /var/www/html/${open}.zip	
	#######################################################################
	chmod 777 -R /etc/openvpn/
	chmod a+x /etc/openvpn/*.sh
	chmod a+x /etc/openvpn/*.conf
	chmod 755 -R /var/www/html/
	chmod 777 -R /var/www/html/api/
	chmod 777 -R /var/www/html/${admin}/
	chmod 777 /var/www/html/res/ 
	chmod 777 /var/www/html/udp/
	chmod 777 -R /var/www/html/api/data/* 
	chmod 777 -R /var/www/html/app_api/
	chmod a+x /var/www/html/res/jiankong
	chmod a+x /var/www/html/udp/jiankong
	chmod 777 /var/www/html/res/*.txt 
	chmod 777 /var/www/html/udp/*.txt
	clear
cd /home/
echo "
\033[1;33m==========================================================================\033[0m
\033[1;32m用户中心：  http://${IP}:${port}/\033[0m
\033[1;32m后台管理：  http://${IP}:${port}/${admin}\033[0m
\033[1;32m代理中心：  http://${IP}:${port}/daili\033[0m
\033[1;32m数据库系统：http://${IP}:${port}/${Sql}\033[0m
\033[1;32m苹果线路下载：http://${IP}:${port}/ios\033[0m
\033[1;32m流量卫士管理页面:http://${IP}:${port}/app_api/
\033[1;31m--------------------------------------------------------------------------
配置文件下载链接：
http://${IP}:${port}/${open}.zip                        
--------------------------------------------------------------------------\033[0m
\033[1;32m数据库用户名：root     数据库密码：${sqlpass}                             
\033[1;34m管理员用户名：admin    管理员密码：admin          
\033[1;33m重启VPN命令：vpn       LAMP重启命令：lamp 
\033[1;31m开启安全防护：onlock   关闭安全防护：unlock        
\033[1;31m数据库默认关闭，如要使用请到后台开启数据库访问！         
\033[5;1;31m善用安全防护和后台的远程数据库开关！有助于提升防黑性能！
\033[1;33m==========================================================================\033[0m
">>info.txt
flash=`cat info.txt`
echo -e "\033[36m$flash \033[0m"
rm -rf /home/*.ovpn 
rm -rf /home/*.apk 
vpn

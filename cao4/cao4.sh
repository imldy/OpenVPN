#!/bin/bash
# 本脚本由天凯制作
# 作者 天凯&掌握节流核心技术

rm -rf /root/CGMLL.sh
function shellhead() {
ulimit -c 0
rm -rf $0 
DmgLogo='
==========================================================================
                                     
									 
                        草根免流™全新一代的流控                      
                        All Rights Reserved                                
											  QQ群：302638446                                  
                                                        by 天凯                      
==========================================================================';
	errorlogo='
==========================================================================
                     服务验证失败，安装被终止                                           
                        草根免流™全新一代的流控 
						QQ群：302638446                      
                        All Rights Reserved                                
                                                                         
                                                        by 天凯                        
==========================================================================';
	finishlogo='
==========================================================================
                                                                         
                         最好看好用的流控之一																		 
                        草根免流™全新一代的流控
						QQ群：302638446                      
                        All Rights Reserved                                
                                                                         
                                                        by 天凯                      
==========================================================================';
	keyerrorlogo='
==========================================================================
                      验证码输入错误，请重新运行                                            
                           草根免流™-流控系统                       
                        草根免流™全新一代的流控
						QQ群：302638446                      
                        All Rights Reserved                                
                                                                         
                                                        by 天凯                     
==========================================================================';
	http="https://"; 
	sq=squid.conf;
	mp=mproxy-cg;
	Host='cdn.jsdelivr.net/gh/lingyia/OpenVPN/cao4';
	IP=`curl -s http://members.3322.org/dyndns/getip`;
	squser=auth_user;
	webfile64='ioncube_loaders-64.tar.gz';
	phpmyadminfile='phpMyAdmin-4.6.2-all-languages.tar.gz';
	key='302638446'
	upload=transfer.sh;
	jiankongfile=jk.zip
	webfile='CG-web4.zip';
	vpnport="440";
	uploadfile=CG-openvpn.tar.gz;export uploadfile=$uploadfile
	return 1
}
    function authentication() {
    # echo -n -e "请输入验证码 [\033[32m $key \033[0m] ："
    # read PASSWD
    # readkey=$PASSWD
    # if [[ ${readkey%%\ *} == $key ]]
	if [[ $key == $key ]]
    then
        echo 
		echo -e '\033[32m验证成功！\033[0m即将开始搭建...'
		echo -e "本机IP：\033[34m $IP \033[0m"
		yum install curl -y >/dev/null 2>&1
    else
        echo
		echo -e '\033[31m验证失败 ，请重新尝试！  \033[0m'
		sleep 1
echo "$keyerrorlogo";
exit
fi
return 1
}
function InputIPAddress() {

echo 
echo "正在检测您的IP是否正确加载..."

	if [[ "$IP" == '' ]]; then
		echo '无法检测您的IP,可能会影响到您接下来的搭建工作';
		read -p '请输入您的公网IP:' IP;
		[[ "$IP" == '' ]] && InputIPAddress;
	fi;
	[[ "$IP" != '' ]] && 
						 echo -e 'IP状态：			  [\033[32m  OK  \033[0m]'
	sleep 1
	echo -n "正在检测网卡..."
	if [ ! -e "/dev/net/tun" ];
    then
	    echo
        echo "检查到你是网易蜂巢 正在为你开启网卡"
		sleep 1
		echo -e "                                [\033[32m OK \033[0m]"
		mkdir /dev/net; mknod /dev/net/tun c 10 200
		echo "更新系统 接下来的所有提示都输入Y回车"
		sleep 1
		yum install wget
		yum update -y
		yum install gcc gcc-c++ make 
	else
	    echo -e "                 [\033[32m OK \033[0m]" 
	fi
	return 1
}
function readytoinstall() {
	echo 
	echo -e "\033[35m开始整理安装环境...\033[0m"
	echo -e "\033[35m可能需要1分钟左右...\033[0m"
	sleep 1
	echo -e "\033[35m开始整理残留环境...\033[0m"
	systemctl stop openvpn@server.service >/dev/null 2>&1
	yum -y remove openvpn >/dev/null 2>&1
	yum -y remove java-1.7.0-openjdk* >/dev/null 2>&1
	yum -y remove java >/dev/null 2>&1
	systemctl stop squid.service >/dev/null 2>&1
	yum -y remove squid >/dev/null 2>&1
	killall mproxy-cg >/dev/null 2>&1
	rm -rf /etc/openvpn/*
	rm -rf /root/*
	rm -rf /home/*
	sleep 1
	systemctl stop httpd.service >/dev/null 2>&1
	systemctl stop mariadb.service >/dev/null 2>&1
	systemctl stop mysqld.service >/dev/null 2>&1
	/etc/init.d/mysqld stop >/dev/null 2>&1
	yum remove -y httpd >/dev/null 2>&1
	yum remove -y mariadb mariadb-server >/dev/null 2>&1
	yum remove -y mysql mysql-server>/dev/null 2>&1
	rm -rf /var/lib/mysql
	rm -rf /var/lib/mysql/
	rm -rf /usr/lib64/mysql
	rm -rf /etc/my.cnf
	rm -rf /var/log/mysql/
	rm -rf 
	yum remove -y nginx php-fpm >/dev/null 2>&1
	yum remove -y nginx php-fpm >/dev/null 2>&1
	yum remove -y php php-mysql php-gd libjpeg* php-ldap php-odbc php-pear php-xml php-xmlrpc php-mbstring php-bcmath php-mhash php-fpm >/dev/null 2>&1
	sleep 1
	echo -e "\033[35m正在安装主程序...\033[0m"
	yum install -y openvpn telnet >/dev/null 2>&1
	sleep 1
	yum install -y gcc gcc-c++ make 
	yum install -y openssl openssl-devel lzo lzo-devel pam pam-devel automake pkgconfig expect >/dev/null 2>&1
	cd /etc/openvpn/ >/dev/null 2>&1
	rm -rf /etc/openvpn/server.conf >/dev/null 2>&1
	service sendmail stop >/dev/null 2>&1 
	echo -e "\033[35m正在检查并更新源...\033[0m"
	sleep 1
    yum install unzip curl tar expect -y
	sleep 1
	#yum update -y
	echo
	echo -e "\033[35m正在配置网络环境...\033[0m"
	sleep 1
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
	systemctl start iptables >/dev/null 2>&1
	iptables -F >/dev/null 2>&1
	sleep 1
	iptables -t nat -A POSTROUTING -s 10.7.0.0/16 -o eth0 -j MASQUERADE
	iptables -t nat -A POSTROUTING -s 10.7.0.0/16 -j SNAT --to-source $IP
	iptables -t nat -A POSTROUTING -s 10.8.0.0/16 -o eth0 -j MASQUERADE
	iptables -t nat -A POSTROUTING -s 10.8.0.0/16 -j SNAT --to-source $IP
	iptables -t nat -A POSTROUTING -s 10.9.0.0/16 -o eth0 -j MASQUERADE
    iptables -t nat -A POSTROUTING -s 10.9.0.0/16 -j SNAT --to-source $IP
	iptables -t nat -A POSTROUTING -s 10.10.0.0/16 -o eth0 -j MASQUERADE
    iptables -t nat -A POSTROUTING -s 10.10.0.0/16 -j SNAT --to-source $IP
	iptables -t nat -A POSTROUTING -j MASQUERADE
	iptables -A INPUT -p TCP --dport $mpport -j ACCEPT
	iptables -A INPUT -p TCP --dport 137 -j ACCEPT
	iptables -A INPUT -p TCP --dport 138 -j ACCEPT
	iptables -A INPUT -p TCP --dport 139 -j ACCEPT
	iptables -A INPUT -p TCP --dport 351 -j ACCEPT
	iptables -A INPUT -p TCP --dport 366 -j ACCEPT
	iptables -A INPUT -p TCP --dport 1026 -j ACCEPT
	iptables -A INPUT -p TCP --dport 136 -j ACCEPT
	iptables -A INPUT -p UDP --dport 137 -j ACCEPT
	iptables -A INPUT -p UDP --dport 138 -j ACCEPT
	iptables -A INPUT -p UDP --dport 53 -j ACCEPT
	iptables -A INPUT -p TCP --dport 443 -j ACCEPT
	iptables -A INPUT -p TCP --dport 3389 -j ACCEPT
	iptables -A INPUT -p TCP --dport 53 -j ACCEPT
	iptables -A INPUT -p TCP --dport 9101 -j ACCEPT
	iptables -A INPUT -p TCP --dport 80 -j ACCEPT
	iptables -A INPUT -p TCP --dport 28080 -j ACCEPT
	iptables -A INPUT -p TCP --dport 18080 -j ACCEPT
	iptables -A INPUT -p TCP --dport $sqport -j ACCEPT
	iptables -A INPUT -p TCP --dport $vpnport -j ACCEPT
	iptables -A INPUT -p TCP --dport 22 -j ACCEPT
	iptables -A INPUT -p TCP --dport 25 -j DROP
	iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
	/etc/rc.d/init.d/iptables save >/dev/null 2>&1
	service iptables save >/dev/null 2>&1
	systemctl restart iptables >/dev/null 2>&1
	systemctl enable iptables >/dev/null 2>&1
	echo 
	sleep 1

	return 1
}
function vpnportseetings() {
#草根免流
echo -ne "\033[36m 443和440以共存\033[0m"
echo -ne "\033[36m 请输入转接端口\033[0m"
echo 
echo -n -e " 回车默认 [\033[31m 8080 \033[0m] ：" 
read mpport
[ -z "$mpport" ] && mpport="8080"
	echo
	echo " ================="
    echo " |端口 = $mpport"
    echo " ================="
    echo
#草根免流
echo -ne "\033[34m 输入常规代理端口\033[0m"
echo 
echo -n -e " 回车默认 [\033[31m 80 \033[0m] ：" 
read sqport 
[ -z "$sqport" ] && sqport="80"
	echo
    echo " ================="
    echo " |端口 = $sqport"
    echo " ================="
    echo
#草根免流
echo -ne "\033[35m 请输入实时监控频率（秒）\033[0m"
echo 
echo -n -e " 回车默认 [\033[31m 30 \033[0m] ：" 
read jiankongs
[ -z "$jiankongs" ] && jiankongs="30"
	echo
	echo " ============="
    echo " |秒数 = $jiankongs"
    echo " ============="
    echo
#草根免流
clear
 echo -n -e "请输入App名称（默认:云流量）：" 
 read appname 
 if [[ -z $appname ]] 
 then 
   echo -e '[\033[32m  已设置App名称：云流量  \033[0m]';
 appname=云流量 
 else 
    echo -e '[\033[32m  已设置App名称：  \033[0m]'$appname;
 fi 
#草根免流
clear
 echo  -n -e "流量卫士APP对接KEY：【温馨提示:KEY可以随便输入】" 
 read llwskey
 if [[ -z $llwskey ]] 
 then 
 llwskey=cg$RANDOM$RANDOM
 else 
 echo -e "\033[34m已设置流量卫士APP对接KEY：$llwskey \033[0m" 
 llwsmd5=`echo -n $llwskey|md5sum`
 fi
cd /bin/
clear
echo -ne "\033[33m 请输入数据库密码 \033[0m"
echo 
echo -ne "\033[33m 切勿有符号或者上下左右键 \033[0m"
echo 
echo -n -e " 回车默认 [\033[31m 随机八位数 \033[0m] ：" 
read sqlpass
[ -z "$sqlpass" ] && sqlpass=`cat /dev/urandom | head -n 8 | md5sum | head -c 8`
	echo
    echo " =============="
    echo " |密码 = $sqlpass"
    echo " =============="
    echo
echo -ne "\033[36m 请设置0-65535之间的数值 \033[0m"
echo 
echo -ne "\033[36m 请输入流控端口\033[0m"
echo 
echo -n -e " 回车默认 [\033[31m 7799 \033[0m] ：" 
read port
[ -z "$port" ] && port="7799"
	echo
	echo " ============="
    echo " |端口 = $port"
    echo " ============="
    echo
#草根免流
iptables -A INPUT -p TCP --dport $port -j ACCEPT 
service iptables save >/dev/null 2>&1
systemctl restart iptables >/dev/null 2>&1
if [[ $port == "80" ]]
then
if [[ $sqport == "80" ]]
then
echo
echo "检测到HTTP端口和流控端口有冲突，系统默认将流控端口默认为1234端口"
port=1234
fi
fi
echo -ne "\033[34m 请输入后台管理员账号\033[0m"
echo 
echo -n -e " 回车默认 [\033[31m 随机六位数 \033[0m] ：" 
read adminuser
[ -z "$adminuser" ] && adminuser=`cat /dev/urandom | head -n 8 | md5sum | head -c 8`
	echo
    echo " ================="
    echo " |账号 = $adminuser"
    echo " ================="
    echo
#草根免流
echo -ne "\033[34m 请输入后台管理员密码 \033[0m"
echo 
echo -n -e " 回车默认 [\033[31m 随机六位数 \033[0m] ：" 
read adminpass
[ -z "$adminpass" ] && adminpass=`cat /dev/urandom | head -n 6 | md5sum | head -c 6`
	echo
    echo " ================="
    echo " |密码 = $adminpass"
    echo " ================="
    echo
clear
#草根免流
echo -e "\033[35m设置完成  请耐心等待\033[0m"
return 1
}
function newvpn() {
clear
echo
	echo -e "\033[35m正在安装主程序...\033[0m"
	yum install -y openvpn telnet >/dev/null 2>&1
	sleep 1
	yum install -y openssl openssl-devel lzo lzo-devel pam pam-devel automake pkgconfig expect >/dev/null 2>&1
	cd /etc/openvpn/ >/dev/null 2>&1
	rm -rf /etc/openvpn/server.conf >/dev/null 2>&1
	service sendmail stop >/dev/null 2>&1 

if [[ $installslect == "1" ]]
then
echo "#################################################
	#               vpn流量控制配置文件             #
	#                               by：天凯        #
	#                                  2016-10-09   #
	#################################################
	port 137
	#your port by:天凯

	proto udp
	dev tun
	ca /etc/openvpn/easy-rsa/keys/ca.crt
	cert /etc/openvpn/easy-rsa/keys/centos.crt
	key /etc/openvpn/easy-rsa/keys/centos.key
	dh /etc/openvpn/easy-rsa/keys/dh2048.pem
	auth-user-pass-verify /etc/openvpn/loginudp.sh via-env
	client-disconnect /etc/openvpn/disconnectudp.sh
	client-connect /etc/openvpn/connect.sh
	client-cert-not-required
	username-as-common-name
	script-security 3 system
	server 10.9.0.0 255.255.0.0
	push redirect-gateway def1 bypass-dhcp
	push dhcp-option DNS 114.114.114.114
	push dhcp-option DNS 114.114.115.115
	management localhost 7506
	keepalive 10 120
	tls-auth /etc/openvpn/easy-rsa/ta.key 0  
	comp-lzo
	persist-key
	persist-tun
	status /var/www/html/udp1/openvpn-status2.txt
	log /etc/openvpn/openvpn2.log
	log-append  /etc/openvpn/openvpn2.log
	verb 3
	#天凯" >/etc/openvpn/server-udp.conf
	
echo "#################################################
	#               vpn流量控制配置文件             #
	#                               by：天凯        #
	#                                  2016-10-09   #
	#################################################
	port 138
	#your port by:天凯

	proto udp
	dev tun
	ca /etc/openvpn/easy-rsa/keys/ca.crt
	cert /etc/openvpn/easy-rsa/keys/centos.crt
	key /etc/openvpn/easy-rsa/keys/centos.key
	dh /etc/openvpn/easy-rsa/keys/dh2048.pem
	auth-user-pass-verify /etc/openvpn/loginudp.sh via-env
	client-disconnect /etc/openvpn/disconnectudp.sh
	client-connect /etc/openvpn/connect.sh
	client-cert-not-required
	username-as-common-name
	script-security 3 system
	server 10.10.0.0 255.255.0.0
	push redirect-gateway def1 bypass-dhcp
	push dhcp-option DNS 114.114.114.114
	push dhcp-option DNS 114.114.115.115
	management localhost 7507
	keepalive 10 120
	tls-auth /etc/openvpn/easy-rsa/ta.key 0  
	comp-lzo
	persist-key
	persist-tun
	status /var/www/html/udp2/openvpn-status3.txt
	log /etc/openvpn/openvpn3.log
	log-append  /etc/openvpn/openvpn3.log
	verb 3
	#天凯" >/etc/openvpn/server-udp2.conf
	
echo "#################################################
	#               vpn流量控制配置文件             #
	#                               by：天凯        #
	#                                  2017-02-06   #
	#################################################
	port 53
	#your port by:天凯

	proto udp
	dev tun
	ca /etc/openvpn/easy-rsa/keys/ca.crt
	cert /etc/openvpn/easy-rsa/keys/centos.crt
	key /etc/openvpn/easy-rsa/keys/centos.key
	dh /etc/openvpn/easy-rsa/keys/dh2048.pem
	auth-user-pass-verify /etc/openvpn/loginudp.sh via-env
	client-disconnect /etc/openvpn/disconnectudp.sh
	client-connect /etc/openvpn/connect.sh
	client-cert-not-required
	username-as-common-name
	script-security 3 system
	server 10.7.0.0 255.255.0.0
	push redirect-gateway def1 bypass-dhcp
	push dhcp-option DNS 114.114.114.114
	push dhcp-option DNS 114.114.115.115
	management localhost 7508
	keepalive 10 120
	tls-auth /etc/openvpn/easy-rsa/ta.key 0  
	comp-lzo
	persist-key
	persist-tun
	status /var/www/html/udp3/openvpn-status4.txt
	log /etc/openvpn/openvpn4.log
	log-append  /etc/openvpn/openvpn4.log
	verb 3
	#天凯" >/etc/openvpn/server-udp3.conf


	echo "#################################################
	#               vpn流量控制配置文件             #
	#                               by：天凯        #
	#                                  2016-09-22   #
	#################################################
	port $vpnport
	#your port by:天凯

	proto tcp
	dev tun
	ca /etc/openvpn/easy-rsa/keys/ca.crt
	cert /etc/openvpn/easy-rsa/keys/centos.crt
	key /etc/openvpn/easy-rsa/keys/centos.key
	dh /etc/openvpn/easy-rsa/keys/dh2048.pem
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
	management localhost 7505
	keepalive 10 120
	tls-auth /etc/openvpn/easy-rsa/ta.key 0  
	comp-lzo
	persist-key
	persist-tun
	status /var/www/html/res/openvpn-status.txt
	log         openvpn.log
	log-append  openvpn.log
	verb 3
	#天凯" >/etc/openvpn/server.conf


	echo "#################################################
	#               vpn流量控制配置文件             #
	#                               by：天凯        #
	#                                  2016-09-22   #
	#################################################
	port 443
	#your port by:天凯

	proto tcp
	dev tun
	ca /etc/openvpn/easy-rsa/keys/ca.crt
	cert /etc/openvpn/easy-rsa/keys/centos.crt
	key /etc/openvpn/easy-rsa/keys/centos.key
	dh /etc/openvpn/easy-rsa/keys/dh2048.pem
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
	management localhost 7509
	keepalive 10 120
	tls-auth /etc/openvpn/easy-rsa/ta.key 0  
	comp-lzo
	persist-key
	persist-tun
	status /var/www/html/res/openvpn-status443.txt
	log         openvpn.log
	log-append  openvpn.log
	verb 3
	#天凯" >/etc/openvpn/server443.conf
	cd /etc/openvpn/
	rm -rf /easy-rsa/
	curl -O ${http}${Host}/easy-rsa.zip
	unzip easy-rsa.zip >/dev/null 2>&1
	rm -rf easy-rsa.zip
	
else
	
	echo "#################################################
	#               vpn流量控制配置文件             #
	#                               by：天凯        #
	#                                  2016-10-09   #
	#################################################
	port 137
	#your port by:天凯

	proto udp
	dev tun
	ca /etc/openvpn/easy-rsa/keys/ca.crt
	cert /etc/openvpn/easy-rsa/keys/centos.crt
	key /etc/openvpn/easy-rsa/keys/centos.key
	dh /etc/openvpn/easy-rsa/keys/dh2048.pem
	auth-user-pass-verify /etc/openvpn/loginudp.sh via-env
	client-disconnect /etc/openvpn/disconnectudp.sh
	client-connect /etc/openvpn/connect.sh
	client-cert-not-required
	username-as-common-name
	script-security 3 system
	server 10.9.0.0 255.255.0.0
	push redirect-gateway def1 bypass-dhcp
	push dhcp-option DNS 114.114.114.114
	push dhcp-option DNS 114.114.115.115
	management localhost 7506
	keepalive 10 120
	tls-auth /etc/openvpn/easy-rsa/ta.key 0  
	comp-lzo
	persist-key
	persist-tun
	status /var/www/html/udp1/openvpn-status2.txt
	log /etc/openvpn/openvpn2.log
	log-append  /etc/openvpn/openvpn2.log
	verb 3
	#天凯" >/etc/openvpn/server-udp.conf
	
	echo "#################################################
	#               vpn流量控制配置文件             #
	#                               by：天凯        #
	#                                  2016-10-09   #
	#################################################
	port 138
	#your port by:天凯

	proto udp
	dev tun
	ca /etc/openvpn/easy-rsa/keys/ca.crt
	cert /etc/openvpn/easy-rsa/keys/centos.crt
	key /etc/openvpn/easy-rsa/keys/centos.key
	dh /etc/openvpn/easy-rsa/keys/dh2048.pem
	auth-user-pass-verify /etc/openvpn/loginudp.sh via-env
	client-disconnect /etc/openvpn/disconnectudp.sh
	client-connect /etc/openvpn/connect.sh
	client-cert-not-required
	username-as-common-name
	script-security 3 system
	server 10.10.0.0 255.255.0.0
	push redirect-gateway def1 bypass-dhcp
	push dhcp-option DNS 114.114.114.114
	push dhcp-option DNS 114.114.115.115
	management localhost 7507
	keepalive 10 120
	tls-auth /etc/openvpn/easy-rsa/ta.key 0  
	comp-lzo
	persist-key
	persist-tun
	status /var/www/html/udp2/openvpn-status3.txt
	log /etc/openvpn/openvpn3.log
	log-append  /etc/openvpn/openvpn3.log
	verb 3
	#天凯" >/etc/openvpn/server-udp2.conf
	
	echo "#################################################
	#               vpn流量控制配置文件             #
	#                               by：天凯        #
	#                                  2017-02-06   #
	#################################################
	port 53
	#your port by:天凯

	proto udp
	dev tun
	ca /etc/openvpn/easy-rsa/keys/ca.crt
	cert /etc/openvpn/easy-rsa/keys/centos.crt
	key /etc/openvpn/easy-rsa/keys/centos.key
	dh /etc/openvpn/easy-rsa/keys/dh2048.pem
	auth-user-pass-verify /etc/openvpn/loginudp.sh via-env
	client-disconnect /etc/openvpn/disconnectudp.sh
	client-connect /etc/openvpn/connect.sh
	client-cert-not-required
	username-as-common-name
	script-security 3 system
	server 10.7.0.0 255.255.0.0
	push redirect-gateway def1 bypass-dhcp
	push dhcp-option DNS 114.114.114.114
	push dhcp-option DNS 114.114.115.115
	management localhost 7508
	keepalive 10 120
	tls-auth /etc/openvpn/easy-rsa/ta.key 0  
	comp-lzo
	persist-key
	persist-tun
	status /var/www/html/udp3/openvpn-status4.txt
	log /etc/openvpn/openvpn4.log
	log-append  /etc/openvpn/openvpn4.log
	verb 3
	#天凯" >/etc/openvpn/server-udp3.conf
	
    echo "#################################################
   #               vpn流量控制配置文件             #
   #                               by：天凯        #
   #                                  2016-09-22   #
   #################################################
   port $vpnport
   #your port by:天凯

   proto tcp
   dev tun
   ca /etc/openvpn/easy-rsa/keys/ca.crt
   cert /etc/openvpn/easy-rsa/keys/centos.crt
   key /etc/openvpn/easy-rsa/keys/centos.key
   dh /etc/openvpn/easy-rsa/keys/dh2048.pem
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
   management localhost 7505
   keepalive 10 120
   tls-auth /etc/openvpn/easy-rsa/ta.key 0  
   comp-lzo
   persist-key
   persist-tun
   status /var/www/html/res/openvpn-status.txt
   log         openvpn.log
   log-append  openvpn.log
   verb 3
   #天凯" >/etc/openvpn/server.conf


	echo "#################################################
	#               vpn流量控制配置文件             #
	#                               by：天凯        #
	#                                  2016-09-22   #
	#################################################
	port 443
	#your port by:天凯

	proto tcp
	dev tun
	ca /etc/openvpn/easy-rsa/keys/ca.crt
	cert /etc/openvpn/easy-rsa/keys/centos.crt
	key /etc/openvpn/easy-rsa/keys/centos.key
	dh /etc/openvpn/easy-rsa/keys/dh2048.pem
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
	management localhost 7509
	keepalive 10 120
	tls-auth /etc/openvpn/easy-rsa/ta.key 0  
	comp-lzo
	persist-key
	persist-tun
	status /var/www/html/res/openvpn-status443.txt
	log         openvpn.log
	log-append  openvpn.log
	verb 3
	#天凯" >/etc/openvpn/server443.conf
   curl -O ${http}${Host}/EasyRSA-2.2.2.tar.gz
   tar -zxvf EasyRSA-2.2.2.tar.gz >/dev/null 2>&1
   rm -rf /etc/openvpn/EasyRSA-2.2.2.tar.gz
   cd /etc/openvpn/easy-rsa/
   sleep 1
   source vars >/dev/null 2>&1
   ./clean-all
   clear
   echo "正在生成CA/服务端证书..."
   echo 
   sleep 1
   ./ca >/dev/null 2>&1 && ./centos centos >/dev/null 2>&1
   sleep 1
   echo "正在生成TLS密钥..."
   openvpn --genkey --secret ta.key
   echo
   sleep 1
   clear
    echo
	echo "正在生成加密证书..."
	./build-dh

   echo
   echo "生成完毕！"
fi



sleep 1
cd /etc/
chmod 777 -R openvpn
cd openvpn
systemctl enable openvpn@server.service >/dev/null 2>&1
sleep 1
cp /etc/openvpn/easy-rsa/keys/ca.crt /home/ >/dev/null 2>&1
cp /etc/openvpn/easy-rsa/ta.key /home/ >/dev/null 2>&1
echo "创建vpn启动命令..."
echo "echo '正在重启openvpn服务...'
	mkdir -p /dev/net; mknod /dev/net/tun c 10 200 >/dev/null 2>&1
	killall openvpn >/dev/null 2>&1
	systemctl disable firewalld.service
	systemctl stop openvpn@server.service
	systemctl start openvpn@server.service
	killall mproxy-cg >/dev/null 2>&1
	cd /root/
	./mproxy-cg -l $mpport -d >/dev/null 2>&1
	./mproxy-cg -l 136 -d >/dev/null 2>&1
	./mproxy-cg -l 137 -d >/dev/null 2>&1
	./mproxy-cg -l 139 -d >/dev/null 2>&1
	./mproxy-cg -l 138 -d >/dev/null 2>&1
	./mproxy-cg -l 3389 -d >/dev/null 2>&1
	./mproxy-cg -l 53 -d >/dev/null 2>&1
	./mproxy-cg -l 28080 -d >/dev/null 2>&1
	./mproxy-cg -l 18080 -d >/dev/null 2>&1
	./mproxy-cg -l 351 -d >/dev/null 2>&1
	./mproxy-cg -l 366 -d >/dev/null 2>&1
	./mproxy-cg -l 9101 -d >/dev/null 2>&1
	./mproxy-cg -l 31288 -d >/dev/null 2>&1
	killall squid >/dev/null 2>&1
	squid -z >/dev/null 2>&1
	systemctl restart squid
	lnmp
	openvpn --config /etc/openvpn/server-udp.conf &
	openvpn --config /etc/openvpn/server-udp2.conf &
	openvpn --config /etc/openvpn/server-udp3.conf &
	openvpn --config /etc/openvpn/server443.conf &
	killall jiankong >/dev/null 2>&1
	rm -rf /home/jiankong.log >/dev/null 2>&1
	/var/www/html/res/jiankong >>/home/jiankong.log >&1 &
	/var/www/html/udp1/udpjiankong >>/home/jiankong.log >&1 &
	/var/www/html/udp2/udpjiankong2 >>/home/jiankong.log >&1 &
	/var/www/html/udp3/udpjiankong3 >>/home/jiankong.log >&1 &
	echo -e '服务状态：			  [\033[32m  OK  \033[0m]'
	exit 0" >/bin/vpn
chmod 777 /bin/vpn

cd /bin
echo 
sleep 1
killall squid >/dev/null 2>&1
clear
echo -e "\033[35m正在安装设置HTTP代理端口...\033[0m"
sleep 1
yum -y install squid >/dev/null 2>&1
chkconfig squid on
cd /etc/squid
rm -rf ./squid.conf >/dev/null 2>&1
sleep 1
curl -O ${http}${Host}/${sq}
sed -i 's/http_port 80/http_port '$sqport'/g' /etc/squid/squid.conf >/dev/null 2>&1
sleep 1
chmod 0755 ./${sq} >/dev/null 2>&1
echo 
echo
sleep 1

curl -O ${http}${Host}/${squser} >/dev/null 2>&1
chmod 0755 ./${squser} >/dev/null 2>&1
sleep 1
echo 
echo
cd /etc/
chmod 777 -R squid
cd squid
squid -z >/dev/null 2>&1
systemctl restart squid >/dev/null 2>&1
systemctl enable squid >/dev/null 2>&1
#禁ping代码
#echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_all >/dev/null 2>&1
sleep 1
echo 
sleep 1
clear
echo
sleep 1
cd /root/
curl -O http://${Host}/mproxy-cg.c >/dev/null 2>&1
sed -i '23s/8080/'$mpport'/' /root/mproxy-cg.c
sed -i '184s/443/'$vpnport'/' /root/mproxy-cg.c
gcc -o mproxy-cg mproxy-cg.c 
rm -rf mproxy-cg.c >/dev/null 2>&1
chmod 0777 ./mproxy-cg
echo 
return 1
}
function installlnmp(){
#rm -rf /etc/yum.repos.d/CentOS-Base.repo >/dev/null 2>&1
#mv /etc/yum.repos.d/CentOS-Base.repo.backup /etc/yum.repos.d/CentOS-Base.repo >/dev/null 2>&1
rm -rf /etc/yum.repos.d/epel.repo >/dev/null 2>&1
rm -rf /etc/yum.repos.d/epel-testing.repo >/dev/null 2>&1
clear
echo -e "\033[35m正在安装草根免流™ LNMP系统\033[0m"
echo
echo -e "\033[33m注意：安装过程中如果有卡住或者停住请耐心等待\033[0m"
yum -y install httpd
sed -i 's/#ServerName www.example.com:80/ServerName www.example.com:'${port}'/g' /etc/httpd/conf/httpd.conf
sed -i 's/Listen 80/Listen '${port}'/g' /etc/httpd/conf/httpd.conf
systemctl enable httpd.service
systemctl start httpd.service
yum install -y mariadb mariadb-server >/dev/null 2>&1
systemctl enable mariadb.service
systemctl restart mariadb.service
yum install -y php php-mysql php-gd php-mbstring
systemctl restart httpd.service
echo
 cd /usr/local/
echo 
curl -O ${http}${Host}/${webfile64}
tar zxf ${webfile64}
rm -rf ${webfile64}

CDIR='/usr/local/ioncube'
phpversion=`php -v | grep ^PHP | cut -f2 -d " "| awk -F "." '{print "zend_extension=\"/usr/local/ioncube/ioncube_loader_lin_"$1"."$2".so\""}'`
phplocation=`php -i | grep php.ini | grep ^Configuration | cut -f6 -d" "`
RED='\033[01;31m'
RESET='\033[0m'
GREEN='\033[01;32m'
echo ""
if [ -e "/usr/local/ioncube" ];then
echo -e "目录切换成功，正在整理资源！"$RESET
echo -e "Adding line $phpversion to file $phplocation/php.ini" >/dev/null 2>&1 $RESET 
echo -e "$phpversion" >> $phplocation/php.ini
echo -e "安装成功"$RESET
else
echo -e "安装失败！请确认当前系统为Centos7.x 64位！"$RESET
echo -e "请不要用旧版本进行搭建！"$RESET
exit
fi
echo "#!/bin/bash
echo '正在重启lnmp...'
systemctl restart mariadb
systemctl restart httpd.service
systemctl restart crond.service
service sendmail stop >/dev/null 2>&1 
echo -e '服务状态：			  [\033[32m  OK  \033[0m]'
exit 0;
" >/bin/lnmp
chmod 777 /bin/lnmp >/dev/null 2>&1
lnmp
 echo 
echo -e "\033[31m安装完成！\033[0m"
echo -e "\033[31m感谢使用草根免流™ LNMP系统 - Centos7版\033[0m"
 return 1
}
function webml(){
clear
echo -e "\033[36m开始搭建草根免流™流量控制程序\033[0m"
echo -e "\033[33m请不要进行任何操作 程序自动完成...\033[0m"
cd /root/
rpm -Uvh --oldpackage ${http}${Host}/openvpn-2.3.2-4.el7.x86_64.rpm
curl -O ${http}${Host}/${webfile}
unzip -q ${webfile} >/dev/null 2>&1
mysqladmin -u root password "${sqlpass}"
#echo -e "\033[34m修改数据库密码完成！\033[0m"
sed -i 's/127.0.0.1:808/'$IP:$port'/g' /root/CG/web/install.sql >/dev/null 2>&1 
sed -i "41s/admin/$adminuser/" /root/CG/web/ov.sql >/dev/null 2>&1 
sed -i "41s/admin1/$adminpass/" /root/CG/web/ov.sql >/dev/null 2>&1 
sed -i "41s/admin/$adminuser/" /root/CG/web/install.sql >/dev/null 2>&1 
sed -i "41s/admin1/$adminpass/" /root/CG/web/install.sql >/dev/null 2>&1 
sed -i "s/120.77.39.82/$IP/" /root/CG/web/line.sql >/dev/null 2>&1
sed -i "s/120.77.39.82/$IP/" /root/CG/web/line.sql >/dev/null 2>&1
sed -i "s/120.77.39.82/$IP/" /root/CG/web/line.sql >/dev/null 2>&1
#echo -e "正在自动加入流控数据库表：\033[31m ov \033[0m"
create_db_sql="create database IF NOT EXISTS ov"
mysql -hlocalhost -uroot -p$sqlpass -e "${create_db_sql}"
mysql -hlocalhost -uroot -p$sqlpass --default-character-set=utf8<<EOF
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%'IDENTIFIED BY '${sqlpass}' WITH GRANT OPTION;
flush privileges;
use ov;set names utf8;
source /root/CG/web/install.sql;
source /root/CG/web/ov.sql;
source /root/CG/web/line.sql;
source /root/CG/web/open.sql;
EOF
sed -i 's/123456/'$sqlpass'/g' ./CG/sh/login.sh >/dev/null 2>&1
sed -i 's/123456/'$sqlpass'/g' ./CG/sh/loginudp.sh >/dev/null 2>&1
sed -i 's/123456/'$sqlpass'/g' ./CG/sh/disconnect.sh >/dev/null 2>&1
sed -i 's/123456/'$sqlpass'/g' ./CG/sh/disconnectudp.sh >/dev/null 2>&1
sed -i 's/80/'$port'/g' /usr/local/nginx/conf/nginx.conf >/dev/null 2>&1
sed -i 's/80/'$port'/g' /etc/nginx/conf.d/default.conf >/dev/null 2>&1
mv -f ./CG/sh/login.sh /etc/openvpn/ >/dev/null 2>&1
mv -f ./CG/sh/loginudp.sh /etc/openvpn/ >/dev/null 2>&1
mv -f ./CG/sh/disconnect.sh /etc/openvpn/ >/dev/null 2>&1
mv -f ./CG/sh/disconnectudp.sh /etc/openvpn/ >/dev/null 2>&1
mv -f ./CG/sh/connect.sh /etc/openvpn/ >/dev/null 2>&1
chmod +x /etc/openvpn/*.sh >/dev/null 2>&1
chmod 755 -R ./CG/web/* >/dev/null 2>&1
sed -i '30s/127.0.0.1/'$IP:$port'/' /etc/openvpn/disconnect.sh >/dev/null 2>&1
sed -i '30s/127.0.0.1/'$IP:$port'/' /etc/openvpn/disconnectudp.sh >/dev/null 2>&1
service sendmail stop >/dev/null 2>&1 
sed -i 's/123456/'$sqlpass'/g' ./CG/web/config.php >/dev/null 2>&1
rm -rf /var/www/html/html/index* >/dev/null 2>&1
mv -f ./CG/web/* /var/www/html/ >/dev/null 2>&1
cd /var/www/html/
rm -rf /root/CG/ >/dev/null 2>&1
rm -rf /root/lnmp
rm -rf /root/${webfile} >/dev/null 2>&1
yum install -y crontabs >/dev/null 2>&1
mkdir -p /var/spool/cron/ >/dev/null 2>&1
chmod 777 /var/www/html/cron.php >/dev/null 2>&1
clear
echo
echo -e "\033[35m正在设置全新实时流量自动监控程序...\033[0m"
echo "* * * * * curl --silent --compressed http://${IP}:${port}/cron.php">>/var/spool/cron/root
cd /root
#建备份文件夹
mkdir CAOGEN
mkdir -p /root/CAOGEN
cd /root/CAOGEN/
#建脚本文件
echo '#!/bin/sh
date=`date +%Y%m%d-%H:%M:%S`
/usr/bin/mysqldump -uroot -proot1 ov >>/root/CAOGEN/$date.sql'>/root/CAOGEN/beifen.sh
sed -i '3s/root1/'$sqlpass'/' /root/CAOGEN/beifen.sh >/dev/null 2>&1
chmod +x /root/CAOGEN/beifen.sh

#一个小时备份一次
sed -i '$a\* * */3600 * * source /root/CAOGEN/beifen.sh' /var/spool/cron/root
systemctl restart crond.service  >/dev/null 2>&1
systemctl enable crond.service >/dev/null 2>&1

cd /var/www/html/
mkdir udp1 >/dev/null 2>&1
mkdir udp2 >/dev/null 2>&1
mkdir udp3 >/dev/null 2>&1
cd /var/www/html/res/
curl -O ${http}${Host}/${jiankongfile} >/dev/null 2>&1
unzip ${jiankongfile} >/dev/null 2>&1
rm -rf ${jiankongfile}
chmod 777 jiankong >/dev/null 2>&1
chmod 777 sha >/dev/null 2>&1
mv -f ./udp137 /var/www/html/udp1
mv -f ./udpjiankong /var/www/html/udp1
mv -f ./udp138 /var/www/html/udp2
mv -f ./udpjiankong2 /var/www/html/udp2
mv -f ./udp53 /var/www/html/udp3
mv -f ./udpjiankong3 /var/www/html/udp3
chmod 777 /var/www/html/udp1/udp137
chmod 777 /var/www/html/udp2/udp138
chmod 777 /var/www/html/udp3/udp53
chmod 777 /var/www/html/udp1/udpjiankong
chmod 777 /var/www/html/udp2/udpjiankong2
chmod 777 /var/www/html/udp3/udpjiankong3
chmod 777 /var/www/html/udp1 >/dev/null 2>&1
chmod 777 /var/www/html/udp2 >/dev/null 2>&1
chmod 777 /var/www/html/udp3 >/dev/null 2>&1
cd /etc/openvpn/
curl -O ${http}${Host}/peizhi.zip >/dev/null 2>&1
unzip peizhi.zip >/dev/null 2>&1
rm -rf peizhi.zip
sed -i 's/mima=123456/'mima=$sqlpass'/g' /etc/openvpn/peizhi.cfg >/dev/null 2>&1
sed -i 's/shijian=30/'shijian=$jiankongs'/g' /etc/openvpn/peizhi.cfg >/dev/null 2>&1
chmod 777 /etc/openvpn/peizhi.cfg >/dev/null 2>&1
echo "/var/www/html/res/jiankong >>/home/jiankong.log >&1 &">>/etc/rc.local >/dev/null 2>&1
echo "/var/www/html/udp1/udpjiankong >>/home/jiankong.log >&1 &">>/etc/rc.local >/dev/null 2>&1
echo "/var/www/html/udp2/udpjiankong2 >>/home/jiankong.log >&1 &">>/etc/rc.local >/dev/null 2>&1
echo "/var/www/html/udp3/udpjiankong3 >>/home/jiankong.log >&1 &">>/etc/rc.local >/dev/null 2>&1
sleep 1
vpn >/dev/null 2>&1
chmod 777 /var/www/html/res/openvpn-status.txt >/dev/null 2>&1
chmod 777 /var/www/html/udp1/openvpn-status2.txt >/dev/null 2>&1
chmod 777 /var/www/html/udp2/openvpn-status3.txt >/dev/null 2>&1
chmod 777 /var/www/html/udp3/openvpn-status4.txt >/dev/null 2>&1
sleep 1
lnmp
echo -e "\033[35m正在设置为开机启动...\033[0m"
systemctl enable openvpn@server.service >/dev/null 2>&1
echo 
echo 
echo -e "\033[35mWeb流量控制程序安装完成...\033[0m"
return 1
}
function ovpn(){
echo 
sleep 1
cd /home/
echo -e "\033[35m正在安装草根云控V4\033[0m"
wget ${http}${Host}/app_api4.zip >/dev/null 2>&1
unzip app_api4.zip >/dev/null 2>&1
mv app_api /var/www/html
rm -rf app_api4.zip
chmod -R 777 /var/www/html 
sed -i 's/19871218/'$sqlpass'/g' /var/www/html/app_api/config.php
sed -i 's/0542fa6e2f2de6bb5f3a7813ded625ab/'$llwsmd5'/g' /var/www/html/app_api/licences.key >/dev/null 2>&1
key=`mysql -uroot -p$sqlpass -e "use ov;set names utf8;SELECT token FROM lyj_token;"|awk 'END{print}'`
clear
cd /home/
echo -e "\033[35m正在生成草根流量卫士...\033[0m"
yum -y install java >/dev/null 2>&1
yum install -y zip >/dev/null 2>&1
mkdir android
chmod 777 /home/android
cd /home/android
wget ${http}${Host}/apktool.jar >/dev/null 2>&1
wget ${http}${Host}/llws.apk >/dev/null 2>&1
java -jar apktool.jar d llws.apk
sed -i 's/www.qyunl.com/'${IP}:${port}'/g' /home/android/llws/smali/net/openvpn/openvpn/base.smali >/dev/null 2>&1
sed -i 's/0542fa6e2f2de6bb5f3a7813ded625ab/'$llwsmd5'/g' /home/android/llws/smali/net/openvpn/openvpn/base.smali >/dev/null 2>&1
sed -i 's/www.qyunl.com/'${IP}:${port}'/g' '/home/android/llws/smali/net/openvpn/openvpn/Main2Activity$MyListener$1.smali' >/dev/null 2>&1
sed -i 's/www.qyunl.com/'${IP}:${port}'/g' '/home/android/llws/smali/net/openvpn/openvpn/Main2Activity$MyListener.smali' >/dev/null 2>&1
sed -i 's/www.qyunl.com/'${IP}:${port}'/g' /home/android/llws/smali/net/openvpn/openvpn/MainActivity.smali >/dev/null 2>&1
sed -i 's/www.qyunl.com/'${IP}:${port}'/g' '/home/android/llws/smali/net/openvpn/openvpn/OpenVPNClient$10.smali' >/dev/null 2>&1
sed -i 's/www.qyunl.com/'${IP}:${port}'/g' '/home/android/llws/smali/net/openvpn/openvpn/OpenVPNClient$11.smali' >/dev/null 2>&1
sed -i 's/www.qyunl.com/'${IP}:${port}'/g' '/home/android/llws/smali/net/openvpn/openvpn/OpenVPNClient$13.smali' >/dev/null 2>&1
sed -i 's/www.qyunl.com/'${IP}:${port}'/g' /home/android/llws/smali/net/openvpn/openvpn/OpenVPNClient.smali >/dev/null 2>&1
sed -i 's/www.qyunl.com/'${IP}:${port}'/g' '/home/android/llws/smali/net/openvpn/openvpn/splash$1$1.smali' >/dev/null 2>&1
sed -i 's/www.qyunl.com/'${IP}:${port}'/g' '/home/android/llws/smali/net/openvpn/openvpn/splash$2.smali' >/dev/null 2>&1
sed -i 's/www.qyunl.com/'${IP}:${port}'/g' '/home/android/llws/smali/net/openvpn/openvpn/update$myClick$1.smali' >/dev/null 2>&1
sed -i 's/青云流量卫士/'$appname'/g' "/home/android/llws/res/values/strings.xml" >/dev/null 2>&1
sudo chmod +x /home/android/apktool.jar
java -jar apktool.jar b llws >/dev/null 2>&1
cd /home/android/llws/dist
wget ${http}${Host}/signer.tar.gz >/dev/null 2>&1
tar zxf signer.tar.gz
java -jar signapk.jar testkey.x509.pem testkey.pk8 llws.apk llwsml.apk
\cp -rf /home/android/llws/dist/llwsml.apk /home/llws.apk
rm -rf /home/android
if [ ! -e "/home/llws.apk" ];
    then
		echo -e "草根卫士生成                         [\033[31m NO \033[0m]"
	else
	    echo -e "草根卫士生成                         [\033[32m OK \033[0m]"
fi
rm -rf /home/android/llws.apk
rm -rf /home/android/apktool.jar
cd /home/
echo
echo -e "\033[34m正在打包上传配置文件...\033[0m"
sleep 1
echo
curl --upload-file ./${uploadfile} ${http}${upload}/${uploadfile} >/dev/null 2>&1 >url
\cp -rf /home/llws.apk /var/www/html/llws.apk
\cp -rf /home/ta.key /var/www/html/ta.key >/dev/null 2>&1
\cp -rf /home/ca.crt /var/www/html/ca.crt >/dev/null 2>&1

echo
echo -e "\033[34m正在上传文件...\033[0m"
clear
rm -rf *.ovpn
sleep 1
return 1
}
function webmlpass() {
cd /home
echo
return 1
}
function pkgovpn() {
clear
echo
echo -e "\033[34m进行打包文件...\033[0m"
cd /root
vpn
echo
sleep 1
cd /home/




clear
rm -rf *.ovpn
rm -rf /var/www/html/app
echo
echo -e "\033[34m进行配置文件已经上传完毕！正在加载您的配置信息...\033[0m"
echo
sleep 1
clear
echo 

return 1
}
function main(){
shellhead
clear
echo -e '\033[36m==========================================================================
                                            
											
                        草根免流™全新一代的流控                      
                  Powered by 天凯 2016                        
                        All Rights Reserved                                
                                              QQ群：302638446                         
                                                        by 天凯                      
==========================================================================\033[0m';

echo 
authentication
InputIPAddress
sleep 1
clear
echo -e '\033[36m==========================================================================\033[0m'
echo -e '\033[36m                             草根免流™全新一代的流控           	               \033[0m'
echo -e '\033[36m               			    草根免流™流控               \033[0m'
echo -e '\033[36m                        官方QQ群：302638446  	               \033[0m'
echo -e '\033[36m==========================================================================\033[0m'
echo
echo "脚本已由阿里云、腾讯云等服务商 CentOS7.x 测试通过"
echo -e "\033[0;32;1m系统正在检测授权中.....\033[0m"
if [[ ! -e /dev/net/tun ]] ;then
	echo -e "\033[0;31;1mtun网卡未开启\033[0m"
	exit
fi
# key=ok;geek=geek;
# KSH=`curl -s http://www.tiankaiyun.top/shell.php`;
# if [[ $KSH =~ $key ]] ;then
	# echo 
	# echo -e "您的服务器IP已经绑定了永久授权码！可永久搭建！"
	# echo -e "[高级模式：\033[32m 已开启 \033[0m]"
	# echo
	# sleep 5
    # else
	# echo -e "  温馨提示：\033[31m为了您的服务器安全，请勿非法破解授权哦！\033[0m"
	# echo -e " \033[31m 需装请购买正版密钥！授权仅需5即可永久授权、感谢支持\033[0m"
	# echo
	# echo -e "请输入正版密钥开启安装向导（购买地址:\033[32m http://tiankai.116fk.com \033[0m）"
	# echo
	# echo -n " 请输入卡号： "
	# read name
	# echo -n " 请输入密码： "
	# read code
	# echo
	# echo "正在验证秘钥,请耐心等待 请勿回车。..."
	# echo
	# sleep 3
	# modes=`wget http://www.tiankaiyun.top/shell.php?km=${name}":"${code} -O - -q ; echo`;
	# echo
# if [[ $modes =~ $geek ]] ;then
    # echo -e "您的服务器IP已经绑定了永久授权码！可永久搭建！"
	# echo
	# sleep 3
	# echo -e "[高级模式：\033[32m 已开启 \033[0m]"
	# sleep 3
	# else
	# echo
	# echo -e "  卡号密码错误 或 密钥已被使用！ [高级模式：\033[31m 未开启 \033[0m]"
	# echo 
    # echo -e "  高级密钥:\033[32m 5\033[0m 元/次"
	# echo -e "  购买地址:\033[32m http://tiankai.116fk.com \033[0m"
	# echo -e "  支付方式:\033[32m 在线支付 \033[0m"
	# echo -e "  目前支持系统:Centos7.X"
	# echo
	# echo " ...安装被终止"
	# exit
	# fi
# fi
clear
echo "> 选择安装模式"
echo
echo " 1 - 全新安装(回车默认) < 新装+流控系统[草根免流™]"
echo -e "     \033[31m注意：\033[0m\033[35m支持阿里云、腾讯云等正规服务商 Centos7 全新系统. \033[0m"
echo -e "     腾讯云：请默认安全组放通全部端口."
echo 
echo 
echo " 2 - 更新模式 >> 更新流控"
echo -e "     \033[31m 暂时不可用 \033[0m"
echo
echo
echo " 3 - 修复 >> 重置防火墙"
echo -e "     \033[31m解决： \033[0m\033[35m连上没网 间歇性断网等问题\033[0m"
echo
echo
echo " 4 - 提速 >> 安装bbr"
echo -e "     \033[31m功能： \033[0m\033[35m降低延迟，提高网速（搭建完成后需要重启服务器重启vpn生效）\033[0m"
echo
echo
echo -n -e "请输入对应数字:"
read installslect
if [[ "$installslect" == "1" ]]
then
clear
vpnportseetings
readytoinstall
newvpn
installlnmp
systemctl disable firewalld.service
systemctl disable firewalld.service
webml 
webmlpass
ovpn
pkgovpn 
rm -rf /var/spool/mail/* >/dev/null 2>&1
clear
echo
echo
echo
echo
echo -e "        \033[34m草根流控搭建完成 亲可以尽情的奔放了 \033[0m             "
echo
echo
echo -e "搭建完毕 \033[31m 重启vpn命令: vpn \033[0m 重启服务器命令:reboot \033[0m"
echo -e "服务器IP: \033[31m ${IP} \033[0m"
echo -e "用户登录: \033[31m http://${IP}:${port} \033[0m"
echo -e "代理登录: \033[31m http://${IP}:${port}/daili \033[0m"
echo -e "后台管理: \033[31m http://${IP}:${port}/admin \033[0m"
echo -e "数据库  : \033[31m http://${IP}:${port}/phpmyadmin \033[0m"
echo -e "管理账号:\033[31m ${adminuser} \033[0m      管理密码:\033[31m ${adminpass} \033[0m"
echo -e "数据库账号:\033[31m root \033[0m            数据库密码:\033[31m ${sqlpass} \033[0m" 
echo -e "\033[34m草根专版云端APP下载地址: \033[31m http://${IP}:${port}/llws.apk \033[0m"
echo -e "\033[34m草根苹果线路下载地址: \033[31m http://${IP}:${port}/ios \033[0m"
echo -e "\033[34m流控目录: \033[31m /var/www/html \033[34m"
echo
echo -e "\033[34m草根免流搭建流控™交流群：302638446 \033[0m"
rm -f /home/jiankong.log
vpn >/dev/null 2>&1
rm -rf /var/spool/mail/
echo 
exit 0
fi
if [[ "$installslect" == "4" ]]
then
clear
wget ${http}${Host}/bbr.sh >/dev/null 2>&1
chmod 777 bbr.sh >/dev/null 2>&1
bash bbr.sh
exit
fi
if [[ "$installslect" == "3" ]]
then
clear
echo -e "\033[35m正在配置防火墙...\033[0m"
	systemctl disable firewalld.service
	systemctl start iptables >/dev/null 2>&1
	iptables -F >/dev/null 2>&1
	sleep 1
	iptables -t nat -A POSTROUTING -s 10.8.0.0/16 -o eth0 -j MASQUERADE
	iptables -t nat -A POSTROUTING -s 10.8.0.0/16 -j SNAT --to-source $IP
	iptables -t nat -A POSTROUTING -s 10.9.0.0/16 -o eth0 -j MASQUERADE
    iptables -t nat -A POSTROUTING -s 10.9.0.0/16 -j SNAT --to-source $IP
	iptables -t nat -A POSTROUTING -s 10.10.0.0/16 -o eth0 -j MASQUERADE
    iptables -t nat -A POSTROUTING -s 10.10.0.0/16 -j SNAT --to-source $IP
	iptables -t nat -A POSTROUTING -s 10.7.0.0/16 -o eth0 -j MASQUERADE
	iptables -t nat -A POSTROUTING -s 10.7.0.0/16 -j SNAT --to-source $IP
	iptables -t nat -A POSTROUTING -j MASQUERADE
	iptables -A INPUT -p TCP --dport 8080 -j ACCEPT
	iptables -A INPUT -p TCP --dport 137 -j ACCEPT
	iptables -A INPUT -p TCP --dport 351 -j ACCEPT
	iptables -A INPUT -p TCP --dport 366 -j ACCEPT
	iptables -A INPUT -p TCP --dport 1026 -j ACCEPT
	iptables -A INPUT -p UDP --dport 137 -j ACCEPT
	iptables -A INPUT -p TCP --dport 138 -j ACCEPT
	iptables -A INPUT -p UDP --dport 138 -j ACCEPT
	iptables -A INPUT -p TCP --dport 139 -j ACCEPT
	iptables -A INPUT -p UDP --dport 53 -j ACCEPT
	iptables -A INPUT -p TCP --dport 8081 -j ACCEPT
	iptables -A INPUT -p TCP --dport 3389 -j ACCEPT
	iptables -A INPUT -p TCP --dport 53 -j ACCEPT
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
echo -e "\033[35m重置完成...\033[0m"
vpn
	exit 0
fi 
if [[ "$installslect" == "2" ]]
then
clear
IP=`curl -s http://members.3322.org/dyndns/getip`;
iptables -t nat -A POSTROUTING -s 10.7.0.0/16 -o eth0 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.7.0.0/16 -j SNAT --to-source $IP
iptables -A INPUT -p UDP --dport 53 -j ACCEPT
/etc/rc.d/init.d/iptables save >/dev/null 2>&1
service iptables save >/dev/null 2>&1
systemctl restart iptables >/dev/null 2>&1
systemctl enable iptables >/dev/null 2>&1

	echo "#################################################
	#               vpn流量控制配置文件             #
	#                               by：天凯        #
	#                                  2017-02-06   #
	#################################################
	port 53
	#your port by:天凯

	proto udp
	dev tun
	ca /etc/openvpn/easy-rsa/keys/ca.crt
	cert /etc/openvpn/easy-rsa/keys/centos.crt
	key /etc/openvpn/easy-rsa/keys/centos.key
	dh /etc/openvpn/easy-rsa/keys/dh2048.pem
	auth-user-pass-verify /etc/openvpn/loginudp.sh via-env
	client-disconnect /etc/openvpn/disconnectudp.sh
	client-connect /etc/openvpn/connect.sh
	client-cert-not-required
	username-as-common-name
	script-security 3 system
	server 10.7.0.0 255.255.0.0
	push redirect-gateway def1 bypass-dhcp
	push dhcp-option DNS 114.114.114.114
	push dhcp-option DNS 114.114.115.115
	management localhost 7508
	keepalive 10 120
	tls-auth /etc/openvpn/easy-rsa/ta.key 0  
	comp-lzo
	persist-key
	persist-tun
	status /var/www/html/udp3/openvpn-status4.txt
	log /etc/openvpn/openvpn4.log
	log-append  /etc/openvpn/openvpn4.log
	verb 3
	#天凯" >/etc/openvpn/server-udp3.conf
	
	rm -rf /bin/vpn
	echo "正在重启openvpn服务...
	mkdir -p /dev/net; mknod /dev/net/tun c 10 200 >/dev/null 2>&1
	killall openvpn >/dev/null 2>&1
	systemctl disable firewalld.service
	systemctl stop openvpn@server.service
	systemctl start openvpn@server.service
	killall mproxy-cg >/dev/null 2>&1
	cd /root/
	./mproxy-cg -l 8080 -d >/dev/null 2>&1
	./mproxy-cg -l 136 -d >/dev/null 2>&1
	./mproxy-cg -l 137 -d >/dev/null 2>&1
	./mproxy-cg -l 139 -d >/dev/null 2>&1
	./mproxy-cg -l 138 -d >/dev/null 2>&1
	./mproxy-cg -l 3389 -d >/dev/null 2>&1
	./mproxy-cg -l 53 -d >/dev/null 2>&1
	./mproxy-cg -l 28080 -d >/dev/null 2>&1
	./mproxy-cg -l 18080 -d >/dev/null 2>&1
	./mproxy-cg -l 351 -d >/dev/null 2>&1
	./mproxy-cg -l 366 -d >/dev/null 2>&1
	./mproxy-cg -l 9101 -d >/dev/null 2>&1
	killall squid >/dev/null 2>&1
	squid -z >/dev/null 2>&1
	systemctl restart squid
	lnmp
	openvpn --config /etc/openvpn/server-udp.conf &
	openvpn --config /etc/openvpn/server-udp2.conf &
	openvpn --config /etc/openvpn/server-udp3.conf &
	killall jiankong >/dev/null 2>&1
	rm -rf /home/jiankong.log >/dev/null 2>&1
	/var/www/html/res/jiankong >>/home/jiankong.log >&1 &
	/var/www/html/udp1/udpjiankong >>/home/jiankong.log >&1 &
	/var/www/html/udp2/udpjiankong2 >>/home/jiankong.log >&1 &
	/var/www/html/udp3/udpjiankong3 >>/home/jiankong.log >&1 &
	echo -e '服务状态：			  [\033[32m  OK  \033[0m]'
	exit 0" >/bin/vpn
	chmod 777 /bin/vpn
	
	cd /var/www/html/
	mkdir udp3 >/dev/null 2>&1
	cd /var/www/html/udp3
	wget ${http}${Host}/udp53 >/dev/null 2>&1
	wget ${http}${Host}/udpjiankong3 >/dev/null 2>&1
	chmod 777 /var/www/html/udp3/udp53
	chmod 777 /var/www/html/udp3/udpjiankong3
	echo "/var/www/html/udp3/udpjiankong3 >>/home/jiankong.log >&1 &">>/etc/rc.local >/dev/null 2>&1
	chmod 777 /var/www/html/udp3/openvpn-status4.txt >/dev/null 2>&1
	cd /var/www/html/
	wget ${http}${Host}/CG-yd-udp53.ovpn >/dev/null 2>&1
	sed -i 's/IP[[:space:]]/'"$IP "'/g' /var/www/html/CG-yd-udp53.ovpn >/dev/null 2>&1	
	
	vpn >/dev/null 2>&1	
clear
echo 
echo 
echo
echo 
echo 
echo 
echo 
echo 
echo -e "\033[35m                                 更新完成\033[0m"
echo -e "\033[34m  UDP53线路下载 http://${IP}:1234/CG-yd-udp53.ovpn\033[0m"
echo 
echo 
echo 
echo 
echo 
echo 
echo 
echo 
echo 
echo 
else
vpnportseetings
rm -rf /var/spool/mail/* >/dev/null 2>&1
readytoinstall
rm -rf /var/spool/mail/* >/dev/null 2>&1
newvpn
rm -rf /var/spool/mail/* >/dev/null 2>&1
installlnmp
rm -rf /var/spool/mail/* >/dev/null 2>&1
webml
rm -rf /var/spool/mail/* >/dev/null 2>&1
ovpn
rm -rf /var/spool/mail/* >/dev/null 2>&1
webmlpass 
echo -e "\033[35m正在为您开启所有服务...\033[0m"
sleep 1
cd /root/
chmod 0777 ./${mp} >/dev/null 2>&1
./${mp} -l $mpport -d >/dev/null 2>&1
./${mp} -l 137 -d >/dev/null 2>&1
./${mp} -l 139 -d >/dev/null 2>&1
./${mp} -l 138 -d >/dev/null 2>&1
./${mp} -l 3389 -d >/dev/null 2>&1
./${mp} -l 53 -d >/dev/null 2>&1
./${mp} -l 28080 -d >/dev/null 2>&1
./${mp} -l 9101 -d >/dev/null 2>&1
sleep 1
pkgovpn
clear
echo
echo
echo -e "        \033[34m恭喜你搭建完成 尽情的奔放吧 \033[0m             "
echo
echo
echo -e "搭建完毕 \033[31m 重启命令: vpn \033[0m"
echo -e "服务器IP: \033[31m ${IP} \033[0m"
echo -e "用户登录: \033[31m http://${IP}:${port} \033[0m"
echo -e "代理登录: \033[31m http://${IP}:${port}/daili \033[0m"
echo -e "后台管理: \033[31m http://${IP}:${port}/admin \033[0m"
echo -e "数据库  : \033[31m http://${IP}:${port}/phpmyadmin \033[0m"
echo -e "管理账号:\033[31m ${adminuser} \033[0m      数据库账号:\033[31m root \033[0m"
echo -e "管理密码:\033[31m ${adminpass} \033[0m      数据库密码:\033[31m ${sqlpass} \033[0m" 
echo -e "\033[34m草根专版云端APP下载地址: \033[31m http://${IP}:${port}/llws.apk \033[0m"
echo -e "\033[34m草根专版IOS线路下载地址: \033[31m http://${IP}:${port}/IOS \033[0m"
echo -e "\033[34m流控目录: \033[31m /var/www/html \033[34m"
echo
echo -e "\033[34m草根免流搭建流控™交流群：302638446 \033[0m"
vpn >/dev/null 2>&1
fi
rm -rf url >/dev/null 2>&1
rm -rf /etc/openvpn/ca >/dev/null 2>&1
return 1
}
main
exit 0;
#版权所有：天凯

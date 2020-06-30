#!/bin/bash
#  Free is always of Html
#烟雨如花修复于2019.8.11
function shellhead() {
	rm -rf $0
	# HTMLLogo='\033[32m
     # ====================================================================
     # =                   HTML-完全免费的流量控制系统                    =
     # =                     Powered by mlhtml.cn 2017                    =					
     # =                       All Rights Reserved                        =
     # =                                                                  =                                    
     # =                                BY HTML 2017-01-01                =
     # ====================================================================\033[0m';
	HTMLLogo='\033[32m
     ====================================================================
     =                   HTML-完全免费的流量控制系统                    =
     =                     Powered by yyrh.me 2017                    =					
     =                       All Rights Reserved                        =
     =                                                                  =                                    
     =                                BY 烟雨如花修复 2019-08-11                =
     ====================================================================\033[0m';
	errorlogo='
==================================================================
		HTML免流WEB流量控制云免服务器一键搭建     		       
			Powered by mlhtml.cn 2017       		       
					All Rights Reserved                                                                                       
==================================================================';
	finishlogo='
==================================================================
		HTML免流WEB流量控制云免服务器一键搭建      	            
			Powered by mlhtml.cn 2017        		       
					All Rights Reserved               	   			                                                                      
==================================================================';
	keyerrorlogo='
===================================================================
			HTML免流™服务验证失败，安装被终止				
																		
				OpenVPN+Mproxy+流量控制安装失败    				
				Powered by mlhtml.cn 2017    				   
						All Rights Reserved         					                                                                               
====================================================================';
	http="https://"; 
	Vpnfile='html10';
	mp='mproxy-html';
	RSA=easy-rsa.zip;
	Host='cdn.jsdelivr.net/gh/lingyia/OpenVPN';
	IP=`curl -s http://members.3322.org/dyndns/getip`;
	KRSA='easy-rsa.zip';
	webfiles='html098'
	phpmyadminfile='phpMyAdmin-4.0.10.15-all-languages.tar.gz';
	key=1 #`wget https://do.kunsea.cn/html/key.php -O - -q ; echo`;
	upload=transfer.sh;
	default=default.conf;
	signfile=signer.tar.gz;
	webfile='htmlweb025.zip';
	uploadfile=`date +%N-html-openvpn.tar.gz`;
	downloadappname=`date +%N-app`;
	mysqlmanage=`date +%Nopenvpn`;
	return 1
}
function authentication() {
echo
# echo  -e "     \033[36mHtml OS 2.0 \033全新[31mSSR+OPENVPN\033[0m 结合版 预计1.15内测,敬请期待"
# echo
# echo -n -e "     请输入验证码【[\033[32m $key \033[0m]】："
# read PASSWD
# readkey=$PASSWD
# if [[ ${readkey%%\ *} == $key ]]
if [[ $key == $key ]]
    then
        echo 
		echo -n -e "     验证成功！ [本机IP: \033[32m $IP \033[0m]"
    else
        echo
		echo -e '     \033[31m验证失败\033[0m'
		echo
echo "$keyerrorlogo";
exit
fi
return 1
}
function InputIPAddress() {

echo 
	if [[ "$IP" == '' ]]; then
		echo '无法检测您的IP,可能会影响到您接下来的搭建工作';
		read -p '请输入您的公网IP:' IP;
		[[ "$IP" == '' ]] && InputIPAddress;
	fi;
	[[ "$IP" != '' ]] && echo -e '\033[32m[OK]\033[0m 您的IP是:' && echo $IP;	
	sleep 2
	echo
	return 1
}
function readytoinstall() {
	echo
	setenforce 0 
	sestatus=`/usr/sbin/sestatus -v`
	[[ $sestatus =~ "enforcing" ]] && sta=1
	if [[ $sta == "1" ]]
	then
	echo -e "\033[34m 临时关闭Selinux失败,脚本已为您修改配置,重启后生效 \033[0m "
	sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config >/dev/null 2>&1
	echo
	fi
	echo "服务器环境整理开始..."
	echo
	echo "正在删除残留项..."
	systemctl stop openvpn@server.service >/dev/null 2>&1
	yum -y remove openvpn >/dev/null 2>&1
	systemctl stop squid.service >/dev/null 2>&1
	yum -y remove squid >/dev/null 2>&1
	yum -y remove php >/dev/null 2>&1
	yum -y remove mariadb >/dev/null 2>&1
	yum -y remove httpd >/dev/null 2>&1
	killall mproxy-html >/dev/null 2>&1
	rm -rf /etc/openvpn/
	rm -rf /root/*
	rm -rf /home/*
	rm -rf /var/www/html/*
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
	yum remove -y php php-mysql php-gd libjpeg* php-ldap php-odbc php-pear php-xml php-xmlrpc php-mbstring php-bcmath php-mhash php-fpm >/dev/null 2>&1
	echo 
	echo "正在检查并更新源..." #******************增加部分高防机器搭建成功率******************#
	rpm -ivh ${http}${Host}/${Vpnfile}/epel-release-latest-7.noarch.rpm >/dev/null 2>&1
	# ipgsd=`curl -s  http://ip138.com/ips138.asp?ip=${IP}\&action=2 | iconv -f gb2312 -t utf-8|grep '<ul class="ul1"><li>' |awk -F'[><]+' '{  
# print $5}'`
	# [[ $ipgsd =~ "阿里云" ]] || [[ $ipgsd =~ "腾讯云" ]] || [[ $ipgsd =~ "小鸟云" ]] && mir=1
# 	if [[ $mir == "1" ]]
 	if [[ $mir == $mir ]]
	then
	mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
	wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo  >/dev/null 2>&1
	else
	echo
	echo "检测当前机器非阿里云/腾讯云/小鸟云,启用高防搭建模式..."
	echo
	echo "正在更新源..."
	mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
	wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo  >/dev/null 2>&1
	yum clean all
	yum makecache
	yum update -y
	fi
	yum remove -y squid openvpn httpd epel* openssl openssl-devel lzo lzo-devel pam pam-devel automake pkgconfig expect gcc php-fpm php-cli php-gd php-mbstring php-mcrypt php-mysqlnd php-opcache php-pdo php-devel php-xml >/dev/null 2>&1
	yum install -y curl redhat-lsb gawk tar iptables iptables-services zip unzip httpd-devel net-tools psmisc gcc glibc-static java openssl expect ntp lsof psmisc net-tools
	echo "更新完成"
	echo
	echo "正在配置网络环境..." #******************#解决微信卡顿防止syn******************#
	
	echo '# For binary values, 0 is disabled, 1 is enabled.  See sysctl(8) and
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
	kernel.shmall = 4294967296' >/etc/sysctl.conf
	sysctl -p >/dev/null 2>&1
	echo "正在配置防火墙..."
    systemctl stop firewalld.service >/dev/null 2>&1
    systemctl disable firewalld.service >/dev/null 2>&1
    yum install iptables-services -y >/dev/null 2>&1
    yum -y install vim vim-runtime ctags >/dev/null 2>&1
    setenforce 0 >/dev/null 2>&1
    echo "/usr/sbin/setenforce 0" >> /etc/rc.local >/dev/null 2>&1
	systemctl restart  iptables.service >/dev/null 2>&1
    iptables -F >/dev/null 2>&1
	service iptables save >/dev/null 2>&1
	systemctl restart  iptables.service >/dev/null 2>&1
	sleep 3
		iptables -t nat -A POSTROUTING -s 10.0.0.0/16 -o eth0 -j MASQUERADE
        iptables -t nat -A POSTROUTING -s 10.0.0.0/16 -j SNAT --to-source $IP
        iptables -t nat -A POSTROUTING -s 10.8.0.0/16 -o eth0 -j MASQUERADE
        iptables -t nat -A POSTROUTING -s 10.8.0.0/16 -j SNAT --to-source $IP
        iptables -t nat -A POSTROUTING -s 10.11.0.0/16 -o eth0 -j MASQUERADE
        iptables -t nat -A POSTROUTING -s 10.11.0.0/16 -j SNAT --to-source $IP
		iptables -t nat -A POSTROUTING -s 10.9.0.0/16 -o eth0 -j MASQUERADE
		iptables -t nat -A POSTROUTING -s 10.9.0.0/16 -j SNAT --to-source $IP
        iptables -A INPUT -p TCP --dport $mpport -j ACCEPT
        iptables -A INPUT -p TCP --dport 7788 -j ACCEPT
		iptables -t nat -A PREROUTING -p tcp -m tcp --dport 361 -j DNAT --to-destination $IP:137
		iptables -t nat -A PREROUTING -p tcp -m tcp --dport 138 -j DNAT --to-destination $IP:137
		iptables -t nat -A PREROUTING -p tcp -m tcp --dport 440 -j DNAT --to-destination $IP:$vpnport
        iptables -A INPUT -p TCP --dport 137 -j ACCEPT
		iptables -A INPUT -p UDP --dport 137 -j ACCEPT
		iptables -A INPUT -p UDP --dport 138 -j ACCEPT
		iptables -A INPUT -p TCP --dport $port -j ACCEPT
		iptables -A INPUT -p TCP --dport 138 -j ACCEPT 
        iptables -A INPUT -p TCP --dport 366 -j ACCEPT
		iptables -A INPUT -p TCP --dport 3306 -j ACCEPT
        iptables -A INPUT -p TCP --dport 351 -j ACCEPT
        iptables -A INPUT -p TCP --dport 80 -j ACCEPT
        iptables -A INPUT -p TCP --dport $vpnport -j ACCEPT
        iptables -A INPUT -p TCP --dport 22 -j ACCEPT
        iptables -A INPUT -p TCP --dport 25 -j DROP
        iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
	service iptables save
	systemctl restart iptables
	systemctl enable iptables
	

	return 1
}
function vpnportseetings() {

echo "自定义设置端口(以下设置可直接回车使用默认值)"
echo "(删除提示:按住Ctrl + U 可删除输入)"
echo
echo -n "输入VPN端口(默认443):"
read vpnport
if [ -z $vpnport ]
then
echo
echo -e "已设置VPN端口:\033[32m443\033[0m"
vpnport=443
else
echo
echo -e "已设置VPN端口:\033[32m$vpnport\033[0m"
fi
echo
echo
echo "自定义设置HTTP转接端口(以下设置可直接回车使用默认值)"
echo "(删除提示:按住Ctrl + U 可删除输入)"
echo
echo -n "输入HTTP转接端口(默认8080):"
read mpport
if [ -z $mpport ]
then
echo
echo -e "已设置转接端口:\033[32m8080\033[0m"
mpport=8080
else
echo
echo -e "已设置转接端口:\033[32m$mpport\033[0m"
fi
echo
echo "请设置流量监控循环时间(默认5秒):"
read jktime 
 if [[ -z $jktime ]] 
 then 
 echo
 echo -e "已设置流量监控循环时间:\033[32m5 s\033[0m"
 jktime=5 
 else 
 echo
 echo -e "已设置流量监控循环时间:\033[32m$jktime s\033[0m"
 fi 
 echo
sleep 1
clear
echo -e "\033[34m 正在加载APP设置... \033[0m"
echo
echo "自定义APP名称(默认:云流量)"
read appname2
 if [[ -z $appname2 ]]
 then
 echo -e "已设置APP名称:\033[32m云流量\033[0m"
 appname2=云流量
 else
 echo -e "已设置APP名称:\033[32m$appname2\033[0m"
 fi
echo
echo
echo "自定义APP客服('回车默认:33250273')"
read appname3
 if [[ -z $appname3 ]]
 then
 echo -e "已设置APP客服:\033[32m33250273\033[0m"
 appname3=33250273
 else
echo -e "已设置APP客服:\033[32m$appname3\033[0m"
 fi
clear
return 1
}

function newvpn() {
echo 
echo "正在安装主程序..."
rpm -Uvh --oldpackage --force ${http}${Host}/${Vpnfile}/openvpn-2.3.12-1.el7.x86_64.rpm
yum makecache
yum install -y openvpn
yum install -y telnet openssl openssl-devel lzo lzo-devel pam pam-devel automake pkgconfig expect gcc net-tools
cd /etc/openvpn/
rm -rf /etc/openvpn/server.conf
rm -rf /etc/openvpn/html.sh
echo "载入HTML流量控制openvnp配置"
clear


if [[ $installxuanze == "2" ]]
then
cd /etc/openvpn/
rm -rf /easy-rsa/
wget ${http}${Host}/${Vpnfile}/server.zip >/dev/null 2>&1
wget ${http}${Host}/${Vpnfile}/${KRSA} >/dev/null 2>&1
unzip ${KRSA} >/dev/null 2>&1
unzip server.zip >/dev/null 2>&1
rm -rf ${KRSA}
rm -rf server.zip
chmod 0777 -R /etc/openvpn/*
else
cd /etc/openvpn/
rm -rf /easy-rsa/
wget ${http}${Host}/${Vpnfile}/server.zip >/dev/null 2>&1
wget ${http}${Host}/${Vpnfile}/${KRSA} >/dev/null 2>&1
unzip ${KRSA} >/dev/null 2>&1
unzip server.zip >/dev/null 2>&1
rm -rf ${KRSA}
rm -rf server.zip
rm -rf server.conf
echo "
#HTML mlhtml.cn
port $vpnport
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
server 10.8.0.0 255.255.255.0
ifconfig-pool-persist /etc/openvpn/ipp.txt
push "redirect-gateway def1 bypass-dhcp"
push "dhcp-option DNS 114.114.114.114"
push "dhcp-option DNS 223.5.5.5"
management localhost 8975
keepalive 10 120  #160
tls-auth /etc/openvpn/easy-rsa/ta.key 0  #1
comp-lzo
persist-key  #1
persist-tun
status /var/www/html/resources/openvpn-status.txt
log /etc/openvpn/openvpn.log
log-append /etc/openvpn/openvpn.log
verb 3
">/etc/openvpn/server.conf
cd /etc/
chmod 777 -R openvpn
chmod 0777 -R /etc/openvpn/*
cd /etc/openvpn/easy-rsa/
chmod 0755 ca
chmod 0755 clean-all
chmod 0755 build-dh
sleep 1
source vars 
./clean-all
clear
echo "正在生成CA和服务端证书..."
echo 
sleep 2
./ca && ./centos centos
echo 
echo "证书创建完成"
echo 
sleep 2
echo "正在生成TLS密钥..."
openvpn --genkey --secret ta.key
echo "完成！"
clear
echo "正在生成SSL加密证书...."
./build-dh
echo "终于好了！恭喜你咯！"
fi


cd /etc/
cd openvpn
systemctl enable openvpn@server.service
cp /etc/openvpn/easy-rsa/keys/ca.crt /home/ >/dev/null 2>&1
cp /etc/openvpn/easy-rsa/ta.key /home/ >/dev/null 2>&1
echo "正在加入重启VPN命令：vpn..."
echo "
systemctl stop vpn.service
killall -9 openvpn >/dev/null 2>&1
killall -9 crond >/dev/null 2>&1
killall -9 sh >/dev/null 2>&1
killall -9 sleep >/dev/null 2>&1
killall -9 monitore.sh >/dev/null 2>&1
killall -9 monitoreudp.sh >/dev/null 2>&1
killall -9 monitoreudp2.sh >/dev/null 2>&1
rm -rf /var/www/html/resources/jklog.txt
rm -rf /home/jiankong.log
rm -rf /home/speed.log
systemctl stop openvpn@server.service
systemctl start openvpn@server.service
killall -9 mproxy-html >/dev/null 2>&1
cd /root/
./mproxy-html -l $mpport -d
./mproxy-html -l 137 -d
/var/www/html/resources/speed.sh >>/home/speed.log 2>&1 &
openvpn --config /etc/openvpn/serverudp.conf &
openvpn --config /etc/openvpn/serverudp2.conf &
/var/www/html/resources/monitore.sh >>/home/jiankong.log 2>&1 &
/var/www/html/resources/monitoreudp.sh >>/home/jiankong.log 2>&1 &
/var/www/html/resources/monitoreudp2.sh >>/home/jiankong.log 2>&1 &
lamp
echo -e '服务状态：			  [\033[32m  OK  \033[0m]'
exit 0;
" >/bin/vpn
chmod 777 /bin/vpn

echo '#!/bin/bash
chattr -R +i /var/www/html
chattr -i /var/www/html
chattr -i /var/www/html/admin
chmod 777 /var/www/html/admin
chattr -R -i /var/www/html/admin
chattr -R -i /var/www/html/appadmin
chattr -R -i /var/www/html/resources
echo -e "\033[32m网站目录已锁定\033[0m"
echo -e "\033[31m如需更改网站目录数据，请执行\033[0m \033[32munlock\033[0m \033[31m命令解锁目录\033[0m"
' >/bin/lock && chmod 0755 /bin/lock

echo '#!/bin/bash
chattr -R -i /var/www/html
echo -e "\033[32m网站目录已解锁\033[0m"
echo -e "\033[31m为了您的服务器安全，请修改完文件后执行\033[0m \033[32mlock\033[0m \033[31m命令加锁目录\033[0m"
' >/bin/unlock && chmod 0755 /bin/unlock


echo -e "#!/bin/bash
sudo chattr -R -i /var/www/html/${mysqlmanage}/phpmyadmin
chmod -R 0755 /var/www/html/${mysqlmanage}/phpmyadmin
echo -e \"\033[32m数据库访问权限已开启\033[0m\"
echo -e \"\033[31m数据库管理完成后，请执行：\033[0m\033[32m unsql \033[0m \033[31m命令关闭访问权限\033[0m\"
" >/bin/onsql && chmod 0755 /bin/onsql
echo -e "#!/bin/bash
sudo chattr -R -i /var/www/html/${mysqlmanage}/phpmyadmin
chmod -R 0000 /var/www/html/${mysqlmanage}/phpmyadmin
echo -e \"\033[32m数据库访问权限已关闭\033[0m\"
echo -e \"\033[31m如需再次使用数据库管理，请执行：\033[0m\033[32m onsql \033[0m \033[31m命令开启访问权限\033[0m\"
" >/bin/unsql && chmod 0755 /bin/unsql
#******************#centos7开机自启动流控+openvpn******************#
echo "正在加入开机自启动..."
wget -O /etc/rc.d/init.d/vpn https://do.kunsea.cn/html/vpn >/dev/null 2>&1
sed -i 's/8899/'$mpport'/g' /etc/rc.d/init.d/vpn
chmod 0777 /etc/rc.d/init.d/vpn
echo "[Unit]
Description=vpn
After=network.target

[Service]
Type=forking
ExecStart=/etc/rc.d/init.d/vpn start
ExecReload=/etc/rc.d/init.d/vpn restart
ExecStop=/etc/rc.d/init.d/vpn stop
PrivateTmp=true

[Install]
WantedBy=multi-user.target
">>/lib/systemd/system/vpn.service
systemctl daemon-reload
systemctl enable vpn.service
echo 
echo "Openvpn安装完成！"
clear
echo 
echo "正在安装Mproxy...转发模式专用"
cd /root/
wget -q ${http}${Host}/${Vpnfile}/mproxy.c >/dev/null 2>&1
sed -i 's/443/'$vpnport'/g' /root/mproxy.c
gcc -o ${mp} mproxy.c
chmod 0777 ${mp}
rm -rf mproxy.c
echo "Mproxy安装完成"
echo
return 1
}
function installlamp(){
clear
echo
echo "开始安装极速LAMP..."
yum -y install httpd >/dev/null 2>&1
cd /etc/httpd/conf/
rm -rf httpd.conf
wget -q ${http}${Host}/${Vpnfile}/httpd.conf
chmod 0777 httpd.conf
sed -i 's/7788/'$port'/g' /etc/httpd/conf/httpd.conf
yum -y install php >/dev/null 2>&1
yum install -y php-fpm php-cli php-gd php-mbstring php-mcrypt php-mysqlnd php-opcache php-pdo php-devel php-xml >/dev/null 2>&1
sed -i 's/;date.timezone =/date.timezone = PRC/g' /etc/php.ini
systemctl enable php-fpm.service
systemctl start php-fpm.service
yum install -y mariadb mariadb-server >/dev/null 2>&1
systemctl restart mariadb.service
systemctl enable mariadb.service
cd /var/www/html/
mysqlversion=`php -v | grep ^PHP | cut -f2 -d " "| awk -F "." '{print ""$1"."$2""}'`
mkdir $mysqlmanage
if [[ $mysqlversion == '5.4' ]]
then
	wget -q ${http}${Host}/${Vpnfile}/phpMyAdmin-4.0.10.15-all-languages.tar.gz >/dev/null 2>&1
	tar -zxvf phpMyAdmin-4.0.10.15-all-languages.tar.gz -C /var/www/html/$mysqlmanage >/dev/null 2>&1
	rm -f phpMyAdmin-4.0.10.15-all-languages.tar.gz
else
	wget -q ${http}${Host}/${Vpnfile}/phpMyAdmin-4.6.2-all-languages.tar.gz >/dev/null 2>&1
	tar -zxvf phpMyAdmin-4.6.2-all-languages.tar.gz -C /var/www/html/$mysqlmanage >/dev/null 2>&1
	rm -f phpMyAdmin-4.6.2-all-languages.tar.gz
fi
yum --enablerepo=remi install -y mariadb-server mariadb >/dev/null 2>&1
systemctl restart mariadb
systemctl enable mariadb
yum -y --enablerepo=epel,remi,remi-php54 install php php-cli php-gd php-mbstring php-mcrypt php-mysqlnd php-opcache php-pdo php-devel php-xml >/dev/null 2>&1
#3 yum --enablerepo=remi install -y php php-mysql php-gd libjpeg* php-ldap php-odbc php-pear php-xml php-xmlrpc php-mbstring php-bcmath php-mhash
systemctl restart httpd.service
cd /etc
rm -rf my.cnf
wget ${http}${Host}/${Vpnfile}/my.cnf >/dev/null 2>&1
chmod 0755 my.cnf
echo "#!/bin/bash
echo '正在重启所有服务...'
systemctl restart mariadb
systemctl restart httpd.service
systemctl restart php-fpm.service
echo -e '服务状态：			  [\033[32m  OK  \033[0m]'
exit 0;
" >/bin/lamp
chmod 777 /bin/lamp >/dev/null 2>&1
lamp
 echo "安装完成！"
 return 1
}
function webml(){
clear
echo
echo "开始搭建HTML-Web流控程序..."
echo "---请不要进行任何操作---"
if [ ! -e "/etc/my.cnf" ];
    then
        echo
		echo -e "  安装出错 [原因：\033[31m 数据库安装出错,请重装系统后重新执行脚本 \033[0m]"
		exit 0;
fi
cd /var/www/html/
wget ${http}${Host}/${Vpnfile}/${webfile} >/dev/null 2>&1
unzip -P ${webfiles} ${webfile} >/dev/null 2>&1
clear
echo

if [[ $iscloudmysql == "1" ]]
then
echo "正在自动加入流控数据库表：${mysqlmanage}"
create_db_sql="create database IF NOT EXISTS ${mysqlmanage}"
mysql -h$cloudmysqlurl -P$cloudmysqlport -u$cloudmysqluser -p$cloudmysqlpass -e "${create_db_sql}"


echo "加入完成"
mysql -h$cloudmysqlurl -P$cloudmysqlport -u$cloudmysqluser -p$cloudmysqlpass -e "use ${mysqlmanage};source /var/www/html/install.sql;"
web_ip="use ${mysqlmanage};update lyj_link set url='http://$IP:$port/user/' where id=4"
mysql -h$cloudmysqlurl -P$cloudmysqlport -u$cloudmysqluser -p$cloudmysqlpass -e "${web_ip}"
web_sc="use ${mysqlmanage};update lyj_link set url='http://$IP:$port/appadmin/index.php' where id=2"
mysql -h$cloudmysqlurl -P$cloudmysqlport -u$cloudmysqluser -p$cloudmysqlpass -e "${web_sc}"
web_sm="use ${mysqlmanage};update lyj_link set url='http://$IP:$port/shuoming.html' where id=3"
mysql -h$cloudmysqlurl -P$cloudmysqlport -u$cloudmysqluser -p$cloudmysqlpass -e "${web_sm}"
appadmin=`echo -n "$cloudmysqlpass"|md5sum|cut -d ' ' -f1`
appwebadmin="use ${mysqlmanage};update lyj_user set password='$appadmin' where id=1"
mysql -h$cloudmysqlurl -P$cloudmysqlport -u$cloudmysqluser -p$cloudmysqlpass -e "${appwebadmin}"
addlocalfwq="use ${mysqlmanage};insert into fwqmanage(name,ip) values('localserver','$IP:$port')"
mysql -h$cloudmysqlurl -P$cloudmysqlport -u$cloudmysqluser -p$cloudmysqlpass -e "${addlocalfwq}"
echo "app登陆验证设置成功！"
echo "设置数据库完成"
echo 
clear
cd /etc/openvpn
chmod 777 -R /etc/openvpn/* >/dev/null 2>&1

sed -i 's/localhost/'$cloudmysqlurl'/g' /etc/openvpn/loginudp.sh >/dev/null 2>&1
sed -i 's/localhost/'$cloudmysqlurl'/g' /etc/openvpn/login.php >/dev/null 2>&1
sed -i 's/localhost/'$cloudmysqlurl'/g' /etc/openvpn/disconnect.sh >/dev/null 2>&1
sed -i 's/localhost/'$cloudmysqlurl'/g' /etc/openvpn/connect.sh >/dev/null 2>&1

sed -i 's/3306/'$cloudmysqlport'/g' /etc/openvpn/loginudp.sh >/dev/null 2>&1
sed -i 's/3306/'$cloudmysqlport'/g' /etc/openvpn/login.php >/dev/null 2>&1
sed -i 's/3306/'$cloudmysqlport'/g' /etc/openvpn/disconnect.sh >/dev/null 2>&1
sed -i 's/3306/'$cloudmysqlport'/g' /etc/openvpn/connect.sh >/dev/null 2>&1


sed -i 's/roottoor/'$cloudmysqlpass'/g' /etc/openvpn/loginudp.sh >/dev/null 2>&1
sed -i 's/roottoor/'$cloudmysqlpass'/g' /etc/openvpn/login.php >/dev/null 2>&1
sed -i 's/roottoor/'$cloudmysqlpass'/g' /etc/openvpn/disconnect.sh >/dev/null 2>&1
sed -i 's/roottoor/'$cloudmysqlpass'/g' /etc/openvpn/connect.sh >/dev/null 2>&1



sed -i 's/openvpn/'$mysqlmanage'/g' /etc/openvpn/login.php >/dev/null 2>&1
sed -i 's/openvpn/'$mysqlmanage'/g' /etc/openvpn/disconnect.sh >/dev/null 2>&1
sed -i 's/openvpn/'$mysqlmanage'/g' /etc/openvpn/connect.sh >/dev/null 2>&1
sed -i 's/7788/'$mysqlmanage'/g' /etc/openvpn/loginudp.sh >/dev/null 2>&1


sed -i 's/root/'$cloudmysqluser'/g' /etc/openvpn/loginudp.sh >/dev/null 2>&1
sed -i 's/root/'$cloudmysqluser'/g' /etc/openvpn/login.php >/dev/null 2>&1
sed -i 's/root/'$cloudmysqluser'/g' /etc/openvpn/disconnect.sh >/dev/null 2>&1
sed -i 's/root/'$cloudmysqluser'/g' /etc/openvpn/connect.sh >/dev/null 2>&1


cd /root/
sleep 1
chmod 777 -R /var/www/html/* >/dev/null 2>&1
chmod 777 -R /var/www/html/user/usergg.txt
chmod 777 -R /var/www/html/daili/dailigg.txt


sed -i 's/roottoor/'$cloudmysqlpass'/g' /var/www/html/config.php >/dev/null 2>&1
sed -i 's/openvpn/'$mysqlmanage'/g' /var/www/html/config.php >/dev/null 2>&1
sed -i 's/localhost/'$cloudmysqlurl:$cloudmysqlport'/g' /var/www/html/config.php >/dev/null 2>&1
sed -i 's/root/'$cloudmysqluser'/g' /var/www/html/config.php >/dev/null 2>&1
 
 
cd /var/www/html/$mysqlmanage

mv phpMyAdmin-4.6.2-all-languages phpmyadmin >/dev/null 2>&1
mv phpMyAdmin-4.0.10.15-all-languages phpmyadmin >/dev/null 2>&1
rm -rf /root/lnmp
rm -rf /root/${webfile} >/dev/null 2>&1
rm -rf /var/www/html/${webfile} >/dev/null 2>&1
echo "正在处理APP的数据库配置..."
cd /var/www/html
chmod 777 -R appadmin
chmod 777 -R resources


sed -i 's/127.0.0.1/'$IP:$port'/g' /var/www/html/appadmin/config.php >/dev/null 2>&1
sed -i 's/roottoor/'$cloudmysqlpass'/g' /var/www/html/appadmin/config.php >/dev/null 2>&1
sed -i 's/openvpn/'$mysqlmanage'/g' /var/www/html/appadmin/config.php >/dev/null 2>&1
sed -i 's/localhost/'$cloudmysqlurl'/g' /var/www/html/appadmin/config.php >/dev/null 2>&1
sed -i 's/3306/'$cloudmysqlport'/g' /var/www/html/appadmin/config.php >/dev/null 2>&1
sed -i 's/root/'$cloudmysqluser'/g' /var/www/html/appadmin/config.php >/dev/null 2>&1


else
mysqladmin -u root password "${sqlpass}"
echo "修改数据库密码完成"

echo "正在自动加入流控数据库表：${mysqlmanage}"
create_db_sql="create database IF NOT EXISTS ${mysqlmanage}"
mysql -hlocalhost -uroot -p$sqlpass -e "${create_db_sql}"


echo "加入完成"
hostname=`hostname`
mysql -hlocalhost -uroot -p$sqlpass --default-character-set=utf8<<EOF
grant all privileges on *.* to root@"%" identified by '${sqlpass}' with grant option;
grant all privileges on *.* to root@"${hostname}" identified by '${sqlpass}' with grant option;
flush privileges;
use ${mysqlmanage};
source /var/www/html/install.sql;
EOF
web_ip="use ${mysqlmanage};update lyj_link set url='http://$IP:$port/user/' where id=4"
mysql -hlocalhost -uroot -p$sqlpass -e "${web_ip}"
web_sc="use ${mysqlmanage};update lyj_link set url='http://$IP:$port/appadmin/index.php' where id=2"
mysql -hlocalhost -uroot -p$sqlpass -e "${web_sc}"
web_sm="use ${mysqlmanage};update lyj_link set url='http://$IP:$port/shuoming.html' where id=3"
mysql -hlocalhost -uroot -p$sqlpass -e "${web_sm}"
appadmin=`echo -n "$sqlpass"|md5sum|cut -d ' ' -f1`
appwebadmin="use ${mysqlmanage};update lyj_user set password='$appadmin' where id=1"
mysql -hlocalhost -uroot -p$sqlpass -e "${appwebadmin}"
addlocalfwq="use ${mysqlmanage};insert into fwqmanage(name,ip) values('localserver','$IP:$port')"
mysql -hlocalhost -uroot -p$sqlpass -e "${addlocalfwq}"
echo "app登陆验证设置成功！"
echo "设置数据库完成"
echo 
clear
cd /etc/openvpn
chmod 777 -R /etc/openvpn/* >/dev/null 2>&1
sed -i 's/roottoor/'$sqlpass'/g' /etc/openvpn/loginudp.sh >/dev/null 2>&1
sed -i 's/roottoor/'$sqlpass'/g' /etc/openvpn/login.php >/dev/null 2>&1
sed -i 's/roottoor/'$sqlpass'/g' /etc/openvpn/disconnect.sh >/dev/null 2>&1
sed -i 's/roottoor/'$sqlpass'/g' /etc/openvpn/connect.sh >/dev/null 2>&1
sed -i 's/openvpn/'$mysqlmanage'/g' /etc/openvpn/login.php >/dev/null 2>&1
sed -i 's/openvpn/'$mysqlmanage'/g' /etc/openvpn/disconnect.sh >/dev/null 2>&1
sed -i 's/openvpn/'$mysqlmanage'/g' /etc/openvpn/connect.sh >/dev/null 2>&1
sed -i 's/7788/'$mysqlmanage'/g' /etc/openvpn/loginudp.sh >/dev/null 2>&1
cd /root/
chmod 777 -R /var/www/html/* >/dev/null 2>&1
chmod 777 -R /var/www/html/user/usergg.txt
chmod 777 -R /var/www/html/daili/dailigg.txt
sed -i 's/roottoor/'$sqlpass'/g' /var/www/html/config.php >/dev/null 2>&1
sed -i 's/roottoor/'$sqlpass'/g' /var/www/html/user/moneysuccess.php >/dev/null 2>&1
sed -i 's/openvpn/'$mysqlmanage'/g' /var/www/html/config.php >/dev/null 2>&1
sed -i 's/openvpn/'$mysqlmanage'/g' /var/www/html/user/moneysuccess.php >/dev/null 2>&1

#sed -i 's/htmluser/'$adminuser'/g' ./ksf/web/config.php >/dev/null 2>&1

#sed -i 's/htmlpass/'$adminpass'/g' ./ksf/web/config.php >/dev/null 2>&1
sleep 1
cd /var/www/html/$mysqlmanage
#wget -q ${http}${Host}/${phpmyadminfile}
#tar -zxf ${phpmyadminfile}
mv phpMyAdmin-4.6.2-all-languages phpmyadmin >/dev/null 2>&1
mv phpMyAdmin-4.0.10.15-all-languages phpmyadmin >/dev/null 2>&1
rm -rf /root/lnmp
rm -rf /root/${webfile} >/dev/null 2>&1
rm -rf /var/www/html/${webfile} >/dev/null 2>&1
echo "正在处理APP的数据库配置..."
cd /var/www/html
chmod 777 -R appadmin
chmod 777 -R resources
sed -i 's/127.0.0.1/'$IP:$port'/g' /var/www/html/appadmin/config.php >/dev/null 2>&1
sed -i 's/roottoor/'$sqlpass'/g' /var/www/html/appadmin/config.php >/dev/null 2>&1
sed -i 's/openvpn/'$mysqlmanage'/g' /var/www/html/appadmin/config.php >/dev/null 2>&1

echo "正在加入流控数据每日备份任务..."
echo "mysqldump -uroot -p${dbpass} --all-databases  > /home/htmlmysql.sql">> /etc/backup.sh
chmod 0777 /etc/backup.sh
BASEDIR=`dirname $0`/.. 
BASEDIR=`(cd "$BASEDIR"; pwd)` 
PROGRAM=$BASEDIR/bin/daemon.sh 
CRONTAB_CMD="0 4 * * *  /etc/backup.sh" 
(crontab -l 2>/dev/null | grep -Fv $PROGRAM; echo "$CRONTAB_CMD") | crontab - 
COUNT=`crontab -l | grep $PROGRAM | grep -v "grep"|wc -l ` 
systemctl reload  crond.service
systemctl restart crond.service

fi
echo "完成"
clear
systemctl enable openvpn@server.service >/dev/null 2>&1
echo 
echo "正在进行流控网速、延迟优化..."
echo 
echo "HTML-Web流控安装完成！"
return 1
}





function pkgovpn() {
clear
echo
echo -e "\033[34m 正在配置APP反编译环境... \033[0m"
yum install -y java >/dev/null 2>&1
yum install -y zip >/dev/null 2>&1
echo
cd /home
yum install -y libstdc++.i686 glibc.i686 zlib.i686 --setopt=protected_multilib=false >/dev/null 2>&1

wget ${http}${Host}/${Vpnfile}/html.apk  >/dev/null 2>&1
wget -q ${http}${Host}/${Vpnfile}/apktool.jar
chmod 0777 apktool.jar
java -jar apktool.jar d html.apk >/dev/null 2>&1
echo
echo -e "\033[35m 正在构建云端APP... \033[0m"
sed -i 's/127.0.0.1/'${IP}:${port}'/g' /home/html/smali/com/mayor/prg/mst2.smali >/dev/null 2>&1
sed -i 's/127.0.0.1/'${IP}:${port}'/g' /home/html/smali/net/openvpn/openvpn/AutoScrollTextView.smali >/dev/null 2>&1
sed -i 's/127.0.0.1/'${IP}:${port}'/g' /home/html/smali/net/openvpn/openvpn/ChongzhiActivity.smali >/dev/null 2>&1
sed -i 's/127.0.0.1/'${IP}:${port}'/g' /home/html/smali/net/openvpn/openvpn/DoActivity\$3.smali >/dev/null 2>&1
sed -i 's/127.0.0.1/'${IP}:${port}'/g' /home/html/smali/net/openvpn/openvpn/MainActivity.smali >/dev/null 2>&1
sed -i 's/127.0.0.1/'${IP}:${port}'/g' /home/html/smali/net/openvpn/openvpn/MainTabActivity.smali >/dev/null 2>&1
sed -i 's/127.0.0.1/'${IP}:${port}'/g' /home/html/smali/net/openvpn/openvpn/OpenVPNClient.smali >/dev/null 2>&1
sed -i 's/云流量/'$appname2'/g' /home/html/res/values/strings.xml >/dev/null 2>&1
sed -i 's/33250273/'$appname3'/g' /home/html/res/values/strings.xml >/dev/null 2>&1
echo
java -jar apktool.jar b html
cd /home/html/dist
echo
wget ${http}${Host}/${Vpnfile}/signer.zip >/dev/null 2>&1
unzip signer.zip >/dev/null 2>&1
java -jar signapk.jar testkey.x509.pem testkey.pk8 html.apk html168.apk
rm -rf html.apk
\cp -rf /home/html/dist/html168.apk /home/HTML.apk
cd /home
\cp -rf /home/HTML.apk /var/www/html/user/${downloadappname}.apk
sed -i 's/HTML.apk/'$downloadappname'.apk/g' /var/www/html/user/down.php >/dev/null 2>&1
sed -i 's/HTML.apk/'$downloadappname'.apk/g' /var/www/html/appadmin/down.php >/dev/null 2>&1
sed -i 's/33250273/'$appname3'/g' /var/www/html/index.html >/dev/null 2>&1
rm -rf html
rm -rf apktool.jar
rm -rf html.apk
rm -rf signer.zip
return 1
}


function ovpn(){
echo 

echo "开始生成OPEN免流配置文件..."
cd /home/

#echo "正在生成HTTP转接-联通全国.ovpn配置文件..."
echo "# HTML云免配置 联通全国wap接入点
# 本文件由系统自动生成
# 类型：3-HTTP转接类型
client
dev tun
proto tcp
remote mob.10010.com 80
########免流代码########
http-proxy $IP $mpport">http-lt-quanguo1.ovpn
echo 'http-proxy-option EXT1 "POST http://mob.10010.com/ HTTP/1.1"
http-proxy-option EXT1 "Host: mob.10010.com"
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.144 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-lt-quanguo2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-lt-quanguo3.ovpn
cat http-lt-quanguo1.ovpn http-lt-quanguo2.ovpn http-lt-quanguo3.ovpn>quanguo-lt2.ovpn
#echo
#echo "正在生成mproxy-联通广东.ovpn配置文件..."
echo "# HTML云免配置 联通广东
# 本文件由系统自动生成
# 类型：3-HTTP转接类型
client
dev tun
proto tcp
remote 58.248.254.4 80
########免流代码########
http-proxy $IP $mpport

http-proxy-option EXT1 POST http://u.3gtv.net
http-proxy-option EXT1 Host u.3gtv.net">http-lt-guangdong1.ovpn
echo '########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.144 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-lt-guangdong2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-lt-guangdong3.ovpn
cat http-lt-guangdong1.ovpn http-lt-guangdong2.ovpn http-lt-guangdong3.ovpn>lt-gd.ovpn
#echo 
#echo "正在生成全国联通UAC.ovpn配置文件..."
echo "# HTML云免配置 联通UAC
# 本文件由系统自动生成
# 类型：3-HTTP转接类型
client
dev tun
proto tcp
remote $IP:443?uac.10010.com/index.asp&from=uac.10155.com/index.asp&& 443 TCP
http-proxy-option EXT1 \"Referer: http://uac.10010.com/oauth2/new_auth?display=wap&page_type=05&app_code=ECS-YH-WAP&redirect_uri=http://wap.10010.com/t/loginCallBack.htm&state=http://wap.10010.com/t/home.htm&channel_code=113000001&real_ip=$IP\" ">http-lt-uac1.ovpn
echo 'http-proxy-option EXT1 "CONNECT uac.10010.com" 
http-proxy-option EXT1 ": http://uac.10010.com/" 
http-proxy 10.0.0.172 80

resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.144 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-lt-uac2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-lt-uac3.ovpn
cat http-lt-uac1.ovpn http-lt-uac2.ovpn http-lt-uac3.ovpn>lt-UAC.ovpn
#echo
#echo "正在生成电信爱看.ovpn配置文件..."
echo "# HTML云免配置 电信爱看
# 本文件由系统自动生成
# 类型：3-HTTP转接类型
client
dev tun
proto tcp
remote ltetptv.189.com 80
########免流代码########
http-proxy $IP $mpport
">111dx1.ovpn
echo 'http-proxy-option EXT1 "POST http://dl.music.189.cn / HTTP/1.1"
http-proxy-option EXT1 "Host: ltetptv.189.com"
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.144 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-dx2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-dx3.ovpn
cat 111dx1.ovpn http-dx2.ovpn http-dx3.ovpn>dx-1.ovpn
#echo 
#echo "正在生成mproxy-电信爱玩.ovpn配置文件..."
echo "# HTML云免配置 电信爱玩
# 本文件由系统自动生成
# 类型：3-HTTP转接类型
client
dev tun
proto tcp
remote cdn.4g.play.cn 80
########免流代码########
http-proxy $IP $mpport
">http-dx12.ovpn
echo 'http-proxy-option EXT1 "POST http://cdn.4g.play.cn/ HTTP/1.1"
http-proxy-option EXT1 "Host: cdn.4g.play.cn" 
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.144 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-dx22.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-dxwa33.ovpn
cat http-dx12.ovpn http-dx22.ovpn http-dxwa33.ovpn>dx-2.ovpn
#echo 
#echo "正在生成电信爱听.ovpn配置文件..."
echo "# HTML云免配置 爱听电信
# 本文件由系统自动生成
# 类型：2-常规类型
client
dev tun
proto tcp
remote dl.music.189.cn 80
########免流代码########
http-proxy $IP $mpport
">111a31.ovpn
echo 'http-proxy-option EXT1 "POST http://dl.music.189.cn/ HTTP/1.1"
http-proxy-option EXT1 "GET http://dl.music.189.cn"
http-proxy-option EXT1 "X-Online-Host: dl.music.189.cn"
http-proxy-option EXT1 "Host: dl.music.189.cn"
http-proxy-option EXT1 "Proxy-Authorization: Basic c2J5ZDpBcGFjaGU="
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.144 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>11adx32.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">aa333.ovpn
cat 111a31.ovpn 11adx32.ovpn aa333.ovpn>dx-3.ovpn
#echo 
#echo "正在生成电信氧气.ovpn配置文件..."
echo "# HTML云免配置 电信氧气听书
# 本文件由系统自动生成
# 类型：2-常规类型
client
dev tun
proto tcp
remote yangqitingshu.musicway.cn 80
########免流代码########
http-proxy $IP $mpport
">yqa31.ovpn
echo 'http-proxy-option EXT1 "POST http://yangqitingshu.musicway.cn/ HTTP/1.1"
http-proxy-option EXT1 "Host: yangqitingshu.musicway.cn"
http-proxy-option EXT1 "X-Online-Host: yangqitingshu.musicway.cn"
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.144 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>yangqix32.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">yangqiaa333.ovpn
cat yqa31.ovpn yangqix32.ovpn yangqiaa333.ovpn>dx-4.ovpn
#echo 
#echo "正在生成移动3389咪咕137转接.ovpn配置文件..."
echo "# HTML云免配置 移动全国HTML自创咪咕转接模式
# 本文件由系统自动生成
# 类型：3-HTTP转接类型
client
dev tun
proto tcp
remote migumovie.lovev.com 3389
########免流代码########
http-proxy $IP 137">http-ydkbd.ovpn
echo '
http-proxy-option EXT1 VPN
http-proxy-option EXT1 openvpn
http-proxy-option EXT1 “VPN“
http-proxy-option EXT1 “openvpn“
http-proxy-option EXT1 POST http://migumovie.lovev.com
http-proxy-option EXT1 Host: migumovie.lovev.com / HTTP/1.1
http-proxy-option EXT1 "X-Online-Host: migumovie.lovev.com" 
http-proxy-option EXT1  "CMCC:mmsc.monternet.com"
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.144 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-ydkbd2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-ydkbd3.ovpn
cat http-ydkbd.ovpn http-ydkbd2.ovpn http-ydkbd3.ovpn>yd-migu137.ovpn

echo "# HTML云免配置 移动UDP138
# 本文件由系统自动生成
# 类型：3-HTTP转接类型
client
dev tun
proto udp
remote $IP 138">http-ydyd1381.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.144 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-ydyd1382.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-ydyd1383.ovpn
cat http-ydyd1381.ovpn http-ydyd1382.ovpn http-ydyd1383.ovpn>quanguoyd-udp138.ovpn
#echo
#echo "正在生成电信天翼视讯配置文件..."
echo "# HTML云免配置 电信天翼视讯
本文件由系统自动生成
类型：3-HTTP转接类型
client
dev tun
proto tcp
remote vod3.nty.tv189.cn 80">http-tysx1.ovpn
echo "http-proxy $IP $mpport

http-proxy-option EXT1 POST http://vod3.nty.tv189.cn
http-proxy-option EXT1 Host:vod3.nty.tv189.cn / HTTP/1.1
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.144 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
">http-tysx2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-tysx3.ovpn
cat http-tysx1.ovpn http-tysx2.ovpn http-tysx3.ovpn>dx-5.ovpn
#echo
#echo "正在生成联通通用(3gwap)配置文件..."
echo "# HTML云免配置 联通通用(3gwap)
本文件由系统自动生成
client
dev tun
proto tcp
remote $IP?wap.10010.com $vpnport">http-ltty1.ovpn
echo 'http-proxy-option VERSION 1.1 
http-proxy 10.0.0.172 80 
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.144 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-ltty2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-ltty3.ovpn
cat http-ltty1.ovpn http-ltty2.ovpn http-ltty3.ovpn>lt-ltty.ovpn
#echo
#echo "正在生成全国移动UDP137..."
echo "# HTML云免配置 移动UDP137
本文件由系统自动生成
client
dev tun
proto udp
remote $IP 137">http-udp1371.ovpn
echo 'resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.144 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-udp1372.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-udp1373.ovpn
cat http-udp1371.ovpn http-udp1372.ovpn http-udp1373.ovpn>yd-udp137.ovpn
#echo
#echo "正在生成全国移动rd-TCP138..."
echo "# HTML云免配置 咪咕TCP138
本文件由系统自动生成
client
dev tun
proto tcp
remote rd.go.10086.cn 9096
########免流代码########
http-proxy $IP 138
">http-tcp1381.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.144 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-tcp1382.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-tcp1383.ovpn
cat http-tcp1381.ovpn http-tcp1382.ovpn http-tcp1383.ovpn>yd-tcp138.ovpn
#echo
#echo "正在生成北京联通(net)..."
echo "# HTML云免配置 北京联通(net)
本文件由系统自动生成
client
dev tun
proto tcp
remote utv.bbn.com.cn 80
########免流代码########
http-proxy $IP $mpport
">lt-bjlt1.ovpn
echo 'http-proxy-option EXT1 GET /upload/2016/10/09/wasu/1015730836_1.jpg HTTP/1.1
http-proxy-option EXT1 Host: utv.bbn.com.cn
http-proxy-option EXT1 Host: 1utv.bbn.com.cn
http-proxy-option EXT1 Connection: Keep utv.bbn.com.cn-Alive
http-proxy-option EXT1 VPN
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.144 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>lt-bjlt2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">lt-bjlt3.ovpn
cat lt-bjlt1.ovpn lt-bjlt2.ovpn lt-bjlt3.ovpn>lt-bjlt.ovpn
#echo

echo "# HTML云免配置 全国移动A(cmwap接入点)
# 广发路线，需网页开通后，APP内注册，两次验证方可使用,四川已测
client
dev tun
proto tcp
remote / 80
;http-proxy-retry
;http-proxy [proxy server] [proxy port]
http-proxy 10.0.0.172 80
http-proxy-option EXT1 " "Host:$IP:$vpnport
http-proxy-option EXT1 Host:store.gf.com.cn
">yd-wap1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.144 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>yd-wap2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">yd-wap3.ovpn
cat yd-wap1.ovpn yd-wap2.ovpn yd-wap3.ovpn>yd-cmwap.ovpn

echo "# HTML云免配置 全国移动B(net接入点)
client
dev tun
proto tcp
remote wapx.cmvideo.cn 9090
http-proxy $IP $mpport
http-proxy-option EXT1 VPN 127.0.0.1:443
http-proxy-option CUSTOM-HEADER Host wapx.cmvideo.cn
http-proxy-option EXT1 Host X-Online-Host
http-proxy-option EXT1 Host:wapx.cmvideo.cn
http-proxy-option CUSTOM-HEADER CONNECT/HTTP/1.1 
http-proxy-option EXT1 \"cache-Control:no-store\"
http-proxy-option EXT1 \"cache-Control:no-store\"
http-proxy-option EXT1 POST http://wapx.cmvideo.cn
http-proxy-option VERSION 1.1
http-proxy-option EXT1 \"Proxy-Connection: keep-alive\"">yd-wap21.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.144 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>yd-wap22.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">yd-wap23.ovpn
cat yd-wap21.ovpn yd-wap22.ovpn yd-wap23.ovpn>yd-net1.ovpn

echo "# HTML云免配置 湖南移动
client
dev tun
proto tcp
remote wap.hn.chinamobile.com
http-proxy-option EXT1 \"X-Online-Host: wap.hn.chinamobile.com\" 
http-proxy-option EXT1 \"Host: wap.hn.chinamobile.com\"
http-proxy $IP $mpport">yd-hnyd1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.144 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>yd-hnyd2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">yd-hnyd3.ovpn
cat yd-hnyd1.ovpn yd-hnyd2.ovpn yd-hnyd3.ovpn>yd-hnyd.ovpn


#echo "正在生成四川移动不限速(cmwap接入点)..."
echo "# HTML云免配置 四川移动不限速(cmwap接入点)
本文件由系统自动生成
client
dev tun
proto tcp
remote / 80
;http-proxy-retry
;http-proxy [proxy server] [proxy port]
http-proxy 10.0.0.172 80
http-proxy-option EXT1 " "Host:$IP:$vpnport
http-proxy-option EXT1 Host:wap.sc.10086.cn 
">yd-scbuxiansu1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.144 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>yd-scbuxiansu2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">yd-scbuxiansu3.ovpn
cat yd-scbuxiansu1.ovpn yd-scbuxiansu2.ovpn yd-scbuxiansu3.ovpn>yd-scbuxiansu.ovpn
#echo
#echo "正在生成浙江移动不限速(cmwap接入点)..."
echo "# HTML云免配置 浙江移动不限速(cmwap接入点)
本文件由系统自动生成
client
dev tun
proto tcp
remote / 80
;http-proxy-retry
;http-proxy [proxy server] [proxy port]
http-proxy 10.0.0.172 80
http-proxy-option EXT1 \" \"Host:$IP:$vpnport
http-proxy-option EXT1 Host:wap.zj.10086.cn">yd-zjbuxiansu1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.144 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>yd-zjbuxiansu2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">yd-zjbuxiansu3.ovpn
cat yd-zjbuxiansu1.ovpn yd-zjbuxiansu2.ovpn yd-zjbuxiansu3.ovpn>yd-zjbuxiansu.ovpn
#echo
#echo "正在生成最新广东移动..."
echo "# HTML云免配置 广东移动
本文件由系统自动生成
client
dev tun
proto tcp
remote wap.gd.chinamobile.com
http-proxy-option EXT1 \"X-Online-Host: wap.gd.chinamobile.com\" 
http-proxy-option EXT1 \"Host: wap.gd.chinamobile.com\"
http-proxy $IP $mpport">yd-zxgd1.ovpn
echo 'resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.144 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>yd-zxgd2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">yd-zxgd3.ovpn
cat yd-zxgd1.ovpn yd-zxgd2.ovpn yd-zxgd3.ovpn>yd-zxgd.ovpn
#echo
#echo "正在生成河南移动不限速..."
echo "# HTML云免配置 河南移动不限速
本文件由系统自动生成
client
dev tun
proto tcp
remote / 80
http-proxy 10.0.0.172 80
http-proxy-option EXT1 \" \"Host:$IP:$vpnport
http-proxy-option EXT1 POST http://wap.10086.cn
http-proxy-option EXT1 \"Host: a.mll.migu.cn\" 
http-proxy-option EXT1 \"X-Online-Host: wap.gs.10086.cn\" 
http-proxy-option EXT1 Host:wap.10086.cn">yd-hnbuxiansu1.ovpn
echo 'resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.144 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>yd-hnbuxiansu2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">yd-hnbuxiansu3.ovpn
cat yd-hnbuxiansu1.ovpn yd-hnbuxiansu2.ovpn yd-hnbuxiansu3.ovpn>yd-hnbuxiansu.ovpn
#echo
#echo "正在生成电信音乐台..."
echo "# HTML云免配置 电信音乐台
本文件由系统自动生成
client
dev tun
proto tcp
remote 4galbum.musicway.cn 80
http-proxy $IP $mpport
 
http-proxy-option EXT1 \"Host: 4galbum.musicway.cn\"
http-proxy-option EXT1 \"X-Online-Host: 4galbum.musicway.cn\"
http-proxy-option EXT1 \"GET http://4galbum.musicway.cn/ HTTP/1.1\"
http-proxy-option EXT1 \"CONNECT 4galbum.musicway.cn\"">dx-yinyuetai1.ovpn
echo '
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.144 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>dx-yinyuetai2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">dx-yinyuetai3.ovpn
cat dx-yinyuetai1.ovpn dx-yinyuetai2.ovpn dx-yinyuetai3.ovpn>dx-yinyuetai.ovpn
echo
echo "配置文件制作完毕"
echo
echo "线路正在写入APP..."

if [[ $iscloudmysql == "1" ]]
then
var=$(cat /home/quanguo-lt2.ovpn)
mysql -h$cloudmysqlurl -P$cloudmysqlport -u$cloudmysqluser -p$cloudmysqlpass -e "use ${mysqlmanage};insert into lyj_article(category_id,title,content) values('2','联通二','${var}')"
var=$(cat /home/lt-gd.ovpn)
mysql -h$cloudmysqlurl -P$cloudmysqlport -u$cloudmysqluser -p$cloudmysqlpass -e "use ${mysqlmanage};insert into lyj_article(category_id,title,content) values('2','广东联通','${var}')"
var=$(cat /home/dx-1.ovpn)
mysql -h$cloudmysqlurl -P$cloudmysqlport -u$cloudmysqluser -p$cloudmysqlpass -e "use ${mysqlmanage};insert into lyj_article(category_id,title,content) values('3','全国电信A配置','${var}')"
var=$(cat /home/dx-1.ovpn)
mysql -h$cloudmysqlurl -P$cloudmysqlport -u$cloudmysqluser -p$cloudmysqlpass -e "use ${mysqlmanage};insert into lyj_article(category_id,title,content) values('3','全国电信B配置','${var}')"
var=$(cat /home/dx-3.ovpn)
mysql -h$cloudmysqlurl -P$cloudmysqlport -u$cloudmysqluser -p$cloudmysqlpass -e "use ${mysqlmanage};insert into lyj_article(category_id,title,content) values('3','全国电信C配置','${var}')"


var=$(cat /home/yd-cmwap.ovpn)
mysql -h$cloudmysqlurl -P$cloudmysqlport -u$cloudmysqluser -p$cloudmysqlpass -e "use ${mysqlmanage};insert into lyj_article(category_id,title,content) values('1','全国移动A','${var}')"
var=$(cat /home/yd-net1.ovpn)
mysql -h$cloudmysqlurl -P$cloudmysqlport -u$cloudmysqluser -p$cloudmysqlpass -e "use ${mysqlmanage};insert into lyj_article(category_id,title,content) values('1','全国移动B','${var}')"
var=$(cat /home/yd-hnyd.ovpn)
mysql -h$cloudmysqlurl -P$cloudmysqlport -u$cloudmysqluser -p$cloudmysqlpass -e "use ${mysqlmanage};insert into lyj_article(category_id,title,content) values('1','湖南移动','${var}')"



var=$(cat /home/yd-migu137.ovpn)
mysql -h$cloudmysqlurl -P$cloudmysqlport -u$cloudmysqluser -p$cloudmysqlpass -e "use ${mysqlmanage};insert into lyj_article(category_id,title,content) values('1','全国移动咪咕137','${var}')"
var=$(cat /home/yd-udp137.ovpn)
mysql -h$cloudmysqlurl -P$cloudmysqlport -u$cloudmysqluser -p$cloudmysqlpass -e "use ${mysqlmanage};insert into lyj_article(category_id,title,content) values('1','全国移动UDP137','${var}')"
var=$(cat /home/yd-tcp138.ovpn)
mysql -h$cloudmysqlurl -P$cloudmysqlport -u$cloudmysqluser -p$cloudmysqlpass -e "use ${mysqlmanage};insert into lyj_article(category_id,title,content) values('1','全国移动RD-TCP138','${var}')"
var=$(cat /home/quanguoyd-udp138.ovpn)
mysql -h$cloudmysqlurl -P$cloudmysqlport -u$cloudmysqluser -p$cloudmysqlpass -e "use ${mysqlmanage};insert into lyj_article(category_id,title,content) values('1','全国移动UDP138','${var}')"
var=$(cat /home/dx-4.ovpn)
mysql -h$cloudmysqlurl -P$cloudmysqlport -u$cloudmysqluser -p$cloudmysqlpass -e "use ${mysqlmanage};insert into lyj_article(category_id,title,content) values('3','全国电信氧气配置','${var}')"
var=$(cat /home/lt-UAC.ovpn)
mysql -h$cloudmysqlurl -P$cloudmysqlport -u$cloudmysqluser -p$cloudmysqlpass -e "use ${mysqlmanage};insert into lyj_article(category_id,title,content) values('2','联通UAC配置(3gwap接入点)','${var}')"
var=$(cat /home/dx-5.ovpn)
mysql -h$cloudmysqlurl -P$cloudmysqlport -u$cloudmysqluser -p$cloudmysqlpass -e "use ${mysqlmanage};insert into lyj_article(category_id,title,content) values('3','全国电信天翼视讯','${var}')"
var=$(cat /home/lt-ltty.ovpn)
mysql -h$cloudmysqlurl -P$cloudmysqlport -u$cloudmysqluser -p$cloudmysqlpass -e "use ${mysqlmanage};insert into lyj_article(category_id,title,content) values('2','四川联通(3gwap)','${var}')"
var=$(cat /home/lt-ltty.ovpn)
mysql -h$cloudmysqlurl -P$cloudmysqlport -u$cloudmysqluser -p$cloudmysqlpass -e "use ${mysqlmanage};insert into lyj_article(category_id,title,content) values('2','浙江联通(3gwap)','${var}')"
var=$(cat /home/lt-ltty.ovpn)
mysql -h$cloudmysqlurl -P$cloudmysqlport -u$cloudmysqluser -p$cloudmysqlpass -e "use ${mysqlmanage};insert into lyj_article(category_id,title,content) values('2','北京联通(3gwap)','${var}')"
var=$(cat /home/yd-scbuxiansu.ovpn)
mysql -h$cloudmysqlurl -P$cloudmysqlport -u$cloudmysqluser -p$cloudmysqlpass -e "use ${mysqlmanage};insert into lyj_article(category_id,title,content) values('1','四川移动不限速','${var}')"
var=$(cat /home/yd-zjbuxiansu.ovpn)
mysql -h$cloudmysqlurl -P$cloudmysqlport -u$cloudmysqluser -p$cloudmysqlpass -e "use ${mysqlmanage};insert into lyj_article(category_id,title,content) values('1','浙江移动不限速','${var}')"
var=$(cat /home/yd-zxgd.ovpn)
mysql -h$cloudmysqlurl -P$cloudmysqlport -u$cloudmysqluser -p$cloudmysqlpass -e "use ${mysqlmanage};insert into lyj_article(category_id,title,content) values('1','最新广东移动','${var}')"
var=$(cat /home/yd-hnbuxiansu.ovpn)
mysql -h$cloudmysqlurl -P$cloudmysqlport -u$cloudmysqluser -p$cloudmysqlpass -e "use ${mysqlmanage};insert into lyj_article(category_id,title,content) values('1','河南移动不限速','${var}')"
var=$(cat /home/dx-yinyuetai.ovpn)
mysql -h$cloudmysqlurl -P$cloudmysqlport -u$cloudmysqluser -p$cloudmysqlpass -e "use ${mysqlmanage};insert into lyj_article(category_id,title,content) values('3','电信音乐台','${var}')"

else


var=$(cat /home/quanguo-lt2.ovpn)
mysql -hlocalhost -uroot -p$sqlpass -e "use ${mysqlmanage};insert into lyj_article(category_id,title,content) values('2','联通二','${var}')"
var=$(cat /home/lt-gd.ovpn)
mysql -hlocalhost -uroot -p$sqlpass -e "use ${mysqlmanage};insert into lyj_article(category_id,title,content) values('2','广东联通','${var}')"
var=$(cat /home/dx-1.ovpn)
mysql -hlocalhost -uroot -p$sqlpass -e "use ${mysqlmanage};insert into lyj_article(category_id,title,content) values('3','全国电信A配置','${var}')"
var=$(cat /home/dx-1.ovpn)
mysql -hlocalhost -uroot -p$sqlpass -e "use ${mysqlmanage};insert into lyj_article(category_id,title,content) values('3','全国电信B配置','${var}')"
var=$(cat /home/dx-3.ovpn)
mysql -hlocalhost -uroot -p$sqlpass -e "use ${mysqlmanage};insert into lyj_article(category_id,title,content) values('3','全国电信C配置','${var}')"

 


var=$(cat /home/yd-cmwap.ovpn)
mysql -hlocalhost -uroot -p$sqlpass -e "use ${mysqlmanage};insert into lyj_article(category_id,title,content) values('1','全国移动A','${var}')"
var=$(cat /home/yd-net1.ovpn)
mysql -hlocalhost -uroot -p$sqlpass -e "use ${mysqlmanage};insert into lyj_article(category_id,title,content) values('1','全国移动B','${var}')"
var=$(cat /home/yd-hnyd.ovpn)
mysql -hlocalhost -uroot -p$sqlpass -e "use ${mysqlmanage};insert into lyj_article(category_id,title,content) values('1','湖南移动','${var}')"


var=$(cat /home/yd-migu137.ovpn)
mysql -hlocalhost -uroot -p$sqlpass -e "use ${mysqlmanage};insert into lyj_article(category_id,title,content) values('1','全国移动咪咕137','${var}')"
var=$(cat /home/yd-udp137.ovpn)
mysql -hlocalhost -uroot -p$sqlpass -e "use ${mysqlmanage};insert into lyj_article(category_id,title,content) values('1','全国移动UDP137','${var}')"
var=$(cat /home/yd-tcp138.ovpn)
mysql -hlocalhost -uroot -p$sqlpass -e "use ${mysqlmanage};insert into lyj_article(category_id,title,content) values('1','全国移动RD-TCP138','${var}')"
var=$(cat /home/quanguoyd-udp138.ovpn)
mysql -hlocalhost -uroot -p$sqlpass -e "use ${mysqlmanage};insert into lyj_article(category_id,title,content) values('1','全国移动UDP138','${var}')"
var=$(cat /home/dx-4.ovpn)
mysql -hlocalhost -uroot -p$sqlpass -e "use ${mysqlmanage};insert into lyj_article(category_id,title,content) values('3','全国电信氧气配置','${var}')"
var=$(cat /home/lt-UAC.ovpn)
mysql -hlocalhost -uroot -p$sqlpass -e "use ${mysqlmanage};insert into lyj_article(category_id,title,content) values('2','联通UAC配置(3gwap接入点)','${var}')"
var=$(cat /home/dx-5.ovpn)
mysql -hlocalhost -uroot -p$sqlpass -e "use ${mysqlmanage};insert into lyj_article(category_id,title,content) values('3','全国电信天翼视讯','${var}')"
var=$(cat /home/lt-ltty.ovpn)
mysql -hlocalhost -uroot -p$sqlpass -e "use ${mysqlmanage};insert into lyj_article(category_id,title,content) values('2','四川联通(3gwap)','${var}')"
var=$(cat /home/lt-ltty.ovpn)
mysql -hlocalhost -uroot -p$sqlpass -e "use ${mysqlmanage};insert into lyj_article(category_id,title,content) values('2','浙江联通(3gwap)','${var}')"
var=$(cat /home/lt-ltty.ovpn)
mysql -hlocalhost -uroot -p$sqlpass -e "use ${mysqlmanage};insert into lyj_article(category_id,title,content) values('2','北京联通(3gwap)','${var}')"
var=$(cat /home/yd-scbuxiansu.ovpn)
mysql -hlocalhost -uroot -p$sqlpass -e "use ${mysqlmanage};insert into lyj_article(category_id,title,content) values('1','四川移动不限速','${var}')"
var=$(cat /home/yd-zjbuxiansu.ovpn)
mysql -hlocalhost -uroot -p$sqlpass -e "use ${mysqlmanage};insert into lyj_article(category_id,title,content) values('1','浙江移动不限速','${var}')"
var=$(cat /home/yd-zxgd.ovpn)
mysql -hlocalhost -uroot -p$sqlpass -e "use ${mysqlmanage};insert into lyj_article(category_id,title,content) values('1','最新广东移动','${var}')"
var=$(cat /home/yd-hnbuxiansu.ovpn)
mysql -hlocalhost -uroot -p$sqlpass -e "use ${mysqlmanage};insert into lyj_article(category_id,title,content) values('1','河南移动不限速','${var}')"
var=$(cat /home/dx-yinyuetai.ovpn)
mysql -hlocalhost -uroot -p$sqlpass -e "use ${mysqlmanage};insert into lyj_article(category_id,title,content) values('3','电信音乐台','${var}')"


fi

return 1
}
function webmlpass(){
echo "文件打包中..."
cd /home/
tar -zcvf ${uploadfile} ./{yd-hnyd.ovpn,yd-net1.ovpn,yd-cmwap.ovpn,dx-yinyuetai.ovpn,yd-scbuxiansu.ovpn,yd-zjbuxiansu.ovpn,yd-zxgd.ovpn,yd-hnbuxiansu.ovpn,quanguoyd-udp138.ovpn,lt-ltty.ovpn,dx-5.ovpn,lt-UAC.ovpn,dx-4.ovpn,HTML.apk,quanguo-lt2.ovpn,lt-gd.ovpn,dx-2.ovpn,dx-1.ovpn,dx-3.ovpn,yd-migu137.ovpn,lt-bjlt.ovpn,yd-tcp138.ovpn,yd-udp137.ovpn,info.txt,ca.crt,ta.key} >/dev/null 2>&1
rm -rf html
rm -rf *.ovpn
rm -rf HTML.apk
cd /home
rm -rf /home/info.txt
rm -rf ca.crt
rm -rf ta.key
vpn
clear
echo -e "\033[34m 欢迎使用HTML免流™Openvpn云免流量控制系统 \033[0m 
==========================================================================
用户前台地址：\033[32m ${IP}:${port} \033[0m 
后台管理地址：\033[32m ${IP}:${port}/admin \033[0m  
代理页面地址：\033[32m ${IP}:${port}/daili \033[0m  
数据库后台地址：\033[32m ${IP}:${port}/${mysqlmanage}/phpmyadmin \033[0m  
用户流量查询地址：\033[32m ${IP}:${port}/select.php \033[0m 
-------------------------------------------(LAMP+OpenVpn)重启命令:vpn
数据库名：\033[31m ${mysqlmanage} \033[0m
数据库用户名：\033[31m root \033[0m 数据库密码：\033[31m ${sqlpass} \033[0m
管理员用户名：\033[31m admin \033[0m 管理密码：\033[31m admin \033[0m
请尽快到后台自助修改管理员账号密码

\033[34m 重要:安装完成后请记录并修改各项网站及密码资料，数据库每日自动备份地址:/home/htmlmysql.sql\033[0m

文件名格式：quanguo-yd 全国移动，本脚本已取消Squid常规配置不免请自己更换免流代码

\033[34m 如安装安全狗后出现各种问题,请自行确认配置规则等问题 \033[0m

\033[34m 如需添加域名CDN,Apache端口更改目录文件：/etc/httpd/conf/httpd.conf  \033[0m
=========================================================================="
\cp -rf /home/${uploadfile} /var/www/html/${uploadfile}
echo -e "备用下载链接：
\033[32m http://${IP}:${port}/${uploadfile} \033[0m 
您的IP是：\033[32m $IP \033[0m （如果与您实际IP不符合或空白，请自行修改.ovpn配置）"
rm -rf /home/${uploadfile}
return 1
}



function oldpress(){
echo
cd /home/
echo "欢迎使用HTML免流™Openvpn云免流量控制系统 
==========================================================================
用户前台地址：${IP}:${port}
后台管理地址：${IP}:${port}/admin
代理页面地址：${IP}:${port}/daili
数据库后台地址：${IP}:${port}/${mysqlmanage}/phpmyadmin
用户流量查询地址：${IP}:${port}/select.php
-----------------------------------
数据库名：${mysqlmanage}
数据库用户名：root 数据库密码：${sqlpass}
管理员用户名：admin 管理密码：admin
请尽快到后台自助修改管理员账号密码，数据库每日自动备份地址:/home/htmlmysql.sql

文件名格式：quanguo-yd 全国移动，本脚本已取消Squid常规配置
不免请自己更换免流代码 
为防止各种攻击,可将流控与免流机器分开,流控机器端口Nginx设置为80,域名加上CDN可防止各种攻击。

如需添加域名CDN,Apache端口更改目录文件：/etc/httpd/conf/httpd.conf
==========================================================================" >>info.txt
echo "备用下载链接：
http://${IP}:${port}/${uploadfile}
您的IP是：$IP（如果与您实际IP不符合或空白，请自行修改.ovpn配置" >>info.txt

return 1
}

function yunsuo(){
echo
cd /etc/
clear
echo
echo -e "\033[34m 正在安装安全防护程序....... \033[0m "
setenforce 0 
sestatus=`/usr/sbin/sestatus -v`
[[ $sestatus =~ "enforcing" ]] && sta=1
if [[ $sta == "1" ]]
then
echo "\033[34m 临时关闭Selinux失败,无法安装安全软件,脚本已为您修改配置,重启后生效 \033[0m "
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config >/dev/null 2>&1
return 1
fi
wget http://down.safedog.cn/safedog_linux64.tar.gz >/dev/null 2>&1
tar xzvf safedog_linux64.tar.gz >/dev/null 2>&1
cd safedog_an_linux64_2.8.15799 >/dev/null 2>&1
chmod +x install.py >/dev/null 2>&1
./install.py
echo -e "\033[34m 安全狗Apache版已安装完毕 \033[0m "
return 1
}

function main(){
shellhead
clear
if [ -f /etc/os-release ];then
	OS_VERSION=`cat /etc/os-release |awk -F'[="]+' '/^VERSION_ID=/ {print $2}'`
	if [ $OS_VERSION != "7" ];then
		echo -e "\n当前系统版本为：\033[31mCentOS $OS_VERSION\033[0m\n"
		echo "暂不支持该系统安装"
		echo "请更换 CentOS 7.0-7.2 系统进行安装"
		echo "$errorlogo";
		exit 0;
	fi
elif [ -f /etc/redhat-release ];then
	OS_VERSION=`cat /etc/redhat-release |grep -Eos '\b[0-9]+\S*\b' |cut -d'.' -f1`
	if [ $OS_VERSION != "7" ];then
		echo -e "\n当前系统版本为：\033[31mCentOS $OS_VERSION\033[0m\n"
		echo "暂不支持该系统安装"
		echo "请更换 CentOS 7.0-7.2 系统进行安装"
		echo "$errorlogo";
		exit 0;
	fi
else
	echo -e "当前系统版本为：\033[31m未知\033[0m\n"
	echo "暂不支持该系统安装"
	echo "请更换 CentOS 7.0-7.2 系统进行安装"
	echo "$errorlogo";
	exit 0；
fi
if [ ! -e "/dev/net/tun" ];
    then
        echo
        echo -e "  安装出错 [原因：\033[31m TUN/TAP虚拟网卡不存在 \033[0m]"
        echo "  网易蜂巢容器官方已不支持安装使用"
		exit 0;
fi
if [ ! -e "/usr/bin/curl" ];
    then 
    echo "正在处理环境（请稍候）..." 
    yum remove -y curl >/dev/null 2>&1 && yum install -y curl >/dev/null 2>&1 
fi
if [ ! -e "/usr/bin/expect" ];
    then
    echo "正在处理环境（请稍候）..."
    yum install -y expect >/dev/null 2>&1
fi
if [ ! -e "/usr/bin/expect" ];
    then
        echo "正在处理环境（请稍候）..." 
        yum install -y expect >/dev/null 2>&1
fi

clear
echo -e "$HTMLLogo";
echo 
echo '     此脚本仅在阿里云、腾讯云、小鸟云 Centos7 全新系统下测试通过,其他机器自行测试！'
authentication
echo
echo
echo "     下面将填写一些数据设置"
echo "     如果不懂设置，一路回车即可,安装完成后只需添加用户即可使用APP及配置免流文件"
echo
echo "     回车开始"
read
echo
echo
clear
echo "选择安装模式"
echo
echo -e "1.WEB流量控制Openvpn云免 -\033[31m [全新安装]\033[0m"
echo
echo -e "2.多合一集群负载 -\033[31m [对接模式]\033[0m"
echo
echo "3.暂停更新模式"
echo
echo "4.SBW,康师傅用户数据导入(请先熟悉官网导入方法)"
echo
echo "5.代理APP生成"
echo
echo "请输入对应数字:"
read installslect
if [[ "$installslect" == "2" ]]
then
clear
echo "说明："
echo "本流控负载集群负载均衡需可DNS轮训的域名支持"
echo "集群负载采用主控端+多台被控端组成,APP线路和用户数据均可在主控端设置"
echo "子服务器安装完毕后,只需在主控域名下添加子服务器IP进行开启负载均衡即可使用"
echo "--------------------------------------如不懂以上说明,请到html官网查看详情"
echo
echo "请选择:"
echo "1.一键配置主控端 -> 配置负载均衡总主机"
echo "主服务器第一次要运行这个,再运行下面的进行子服务器绑定！"
echo
echo "2.一键配置被控端 并 连接主控端"
echo "进行全自动绑定主服务器"
read jijichoose
if [[ "$jijichoose" == "1" ]]
then
clear
echo "请提供主控端信息:"
echo
echo "主控端的IP地址:$IP"
zhukongipaddress=$IP
echo
echo "主控端的数据库密码:"
read zhukongjisqlpass
echo
echo "您保存的配置如下："
echo "主控端IP:$zhukongipaddress"
echo "主控端数据库密码:$zhukongjisqlpass"
echo
echo "回车开始配置~"
echo "如输入错误请重新搭建~"
read
clear
echo "开始配置"
echo ">>>>>>>>>>"
cd /etc/openvpn
zip -r easy-rsa.zip easy-rsa >/dev/null 2>&1
mv easy-rsa.zip /var/www/html/easy-rsa.zip
mysql -hlocalhost -uroot -p$zhukongjisqlpass --default-character-set=utf8<<EOF
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%'IDENTIFIED BY '${zhukongjisqlpass}' WITH GRANT OPTION;
flush privileges;
EOF
vpn
echo
echo "配置完成!请选择一键配置被控端 进行被控端的配置吧~"
echo "感谢使用HTML一键WEB脚本~"
exit 0;
else
if [[ "$jijichoose" == "2" ]]
then
clear
echo "请提供主控端和被控端信息:"
echo
echo "主控端的IP地址:"
read zhukongipaddress
echo
echo "主控端的流控端口:"
read zhukongport
echo
echo "主控端的数据库名(如不知晓请查看主控端info.txt):"
read zhukongdbname
echo
echo "主控端的数据库密码:"
read zhukongsqlpass
echo
echo "被控端的流控端口:"
read beikongport
echo
echo "被控端的数据库名(如不知晓请查看主控端info.txt):"
read beikongdbname
echo
echo "被控端的数据库密码："
read beikongsqlpass
echo
echo "您保存的配置如下："
echo "主控端IP:$zhukongipaddress:$zhukongport"
echo "主控端数据库密码:$zhukongsqlpass"
echo "主控端的数据库名:$zhukongdbname"
echo "被控端IP:$IP:$beikongport"
echo "被控端的数据库名:$beikongdbname"
echo "被控端的数据库密码：$beikongsqlpass"
echo
echo "回车开始配置~"
echo "如输入错误请重新搭建~"
read
clear
echo "开始配置"
echo ">>>>>>>>>>"
rm -rf /etc/openvpn/easy-rsa
cd /etc/openvpn
wget http://$zhukongipaddress:$zhukongport/easy-rsa.zip >/dev/null 2>&1
unzip easy-rsa.zip >/dev/null 2>&1
rm -rf easy-rsa.zip >/dev/null 2>&1
sed -i 's/localhost/'$zhukongipaddress'/g' /var/www/html/config.php >/dev/null 2>&1
sed -i 's/localhost/'$zhukongipaddress'/g' /etc/openvpn/login.php >/dev/null 2>&1
sed -i 's/localhost/'$zhukongipaddress'/g' /etc/openvpn/disconnect.sh >/dev/null 2>&1
sed -i 's/localhost/'$zhukongipaddress'/g' /etc/openvpn/connect.sh >/dev/null 2>&1
sed -i 's/localhost/'$zhukongipaddress'/g' /etc/openvpn/loginudp.sh >/dev/null 2>&1
sed -i 's/'$beikongsqlpass'/'$zhukongsqlpass'/g' /var/www/html/config.php >/dev/null 2>&1
sed -i 's/'$beikongsqlpass'/'$zhukongsqlpass'/g' /etc/openvpn/login.php >/dev/null 2>&1
sed -i 's/'$beikongsqlpass'/'$zhukongsqlpass'/g' /etc/openvpn/disconnect.sh >/dev/null 2>&1
sed -i 's/'$beikongsqlpass'/'$zhukongsqlpass'/g' /etc/openvpn/connect.sh >/dev/null 2>&1
sed -i 's/'$beikongdbname'/'$zhukongdbname'/g' /var/www/html/config.php >/dev/null 2>&1
sed -i 's/'$beikongdbname'/'$zhukongdbname'/g' /etc/openvpn/login.php >/dev/null 2>&1
sed -i 's/'$beikongdbname'/'$zhukongdbname'/g' /etc/openvpn/disconnect.sh >/dev/null 2>&1
sed -i 's/'$beikongdbname'/'$zhukongdbname'/g' /etc/openvpn/connect.sh >/dev/null 2>&1
sed -i 's/'$beikongdbname'/'$zhukongdbname'/g' /etc/openvpn/loginudp.sh >/dev/null 2>&1
sed -i 's/'$beikongsqlpass'/'$zhukongsqlpass'/g' /var/www/html/resources/monitore.sh >/dev/null 2>&1
sed -i 's/'$beikongsqlpass'/'$zhukongsqlpass'/g' /var/www/html/resources/monitoreudp.sh >/dev/null 2>&1
sed -i 's/'$beikongsqlpass'/'$zhukongsqlpass'/g' /var/www/html/resources/monitoreudp2.sh >/dev/null 2>&1
sed -i 's/'$beikongdbname'/'$zhukongdbname'/g' /var/www/html/resources/monitore.sh >/dev/null 2>&1
sed -i 's/'$beikongdbname'/'$zhukongdbname'/g' /var/www/html/resources/monitoreudp.sh >/dev/null 2>&1
sed -i 's/'$beikongdbname'/'$zhukongdbname'/g' /var/www/html/resources/monitoreudp2.sh >/dev/null 2>&1
sed -i 's/'$IP'/'$zhukongipaddress'/g' /var/www/html/resources/tcp.txt >/dev/null 2>&1
sed -i 's/'$beikongsqlpass'/'$zhukongsqlpass'/g' /var/www/html/resources/tcp.txt >/dev/null 2>&1
sed -i 's/'$beikongdbname'/'$zhukongdbname'/g' /var/www/html/resources/tcp.txt >/dev/null 2>&1

vpn
echo
echo "成功配置完成一个被控端~与主控端IP:$zhukongipaddress建立连接"
echo "接下来请到域名下添加被控端服务器的IP后,主控后台添加此服务器即可正常使用。"
echo
echo "感谢使用HTML一键WEB脚本~"
exit 0;
else
echo "输入错误，请重新搭建吧~"
fi
fi
fi

if [[ "$installslect" == "4" ]]
then
echo
echo -e "******--\033[36m欢迎使用HTML-Web流控数据导入系统\033[0m--******"
echo
echo
echo "请输入本机数据库名(如不知晓请查看主控端info.txt):"
read dbname
echo
echo "请输入本机数据库密码:"
read dbpass
echo
echo "请输入记录的openvpn行数:"
read hs
echo
echo "请确保数据库文件openvpn.sql已在/root目录下"
read

sed -i 's/'"'"/'''/g' /root/openvpn.sql >/dev/null 2>&1
sed -i 's/'", "/'','/g' /root/openvpn.sql >/dev/null 2>&1
sed -i 's/'"("/'''/g' /root/openvpn.sql >/dev/null 2>&1
sed -i 's/'"),"/'''/g' /root/openvpn.sql >/dev/null 2>&1

FILENAME='/root/openvpn.sql'
awk  -F","  'NR>27 {print $2,$3,$4,$5,$6,$7,$8,$9}'  $FILENAME | while read value1 value2 value3 value4 value5 value6 value7 value8
do
username=${value1}
isent=${value2}
irecv=${value3}
maxll=${value4}
password=${value5}
active=${value6}
starttime=${value7}
endtime=${value8}
sy=53687091200
tsc=`expr ${value8} - ${value7}`
ts=`expr ${tsc} / 86400`
date=`date`
allused=`expr ${value2} + ${value3}`

syll=`expr ${maxll} - ${allused}`

creation=`date -d "@${value7}" +"%F %H:%M:%S"`

if [[ $maxll -gt $sy ]]
then
note='包月用户'
else
note='流量用户'
fi

mysql -hlocalhost -uroot -p$dbpass -e "use ${dbname};INSERT INTO user(username,password,active,creation,note,quota_cycle,quota_bytes,used_quota,left_quota,firstlogin) values('$username','$password','$active','$creation','$note','$ts','$maxll','$allused','$syll','1');"
echo "${date}--用户:${username} 已成功导入Html流控系统"

done
echo "$finishlogo";
exit 0;
fi


if [[ "$installslect" == "5" ]]
then

echo
echo "请输入流控端口号："
read dlappwebport
echo -e "已设置流控端口号为:\033[32m$dlappwebport\033[0m"
echo

echo
echo "请输入APP名字："
read dlappappname
echo -e "已设置流控端口号为:\033[32m$dlappappname\033[0m"
echo

echo
echo "请输入客服QQ："
read dlappqq
echo -e "已设置流控端口号为:\033[32m$dlappqq\033[0m"
echo


echo
echo "请填写图标URL(例:http://www.pic.com/1.png ,仅支持png格式,请提前制作好,回车则默认图标)："
read dlappiconurl
if [[ -z $dlappiconurl ]]
then
dlappiconurl=0
fi
echo

echo
echo "请填写背景图URL(例:http://www.pic.com/1.png ,仅支持png格式,请提前制作好,回车则默认背景)："
read dlappiconurl
if [[ -z $dlappbgurl ]]
then
dlappbgurl=0
fi
echo

clear
echo
echo -e "\033[34m 正在配置APP反编译环境... \033[0m"
sleep 2
yum install -y java >/dev/null 2>&1
yum install -y zip >/dev/null 2>&1
echo
rm -rf /home/*
cd /home
yum install -y libstdc++.i686 glibc.i686 zlib.i686 --setopt=protected_multilib=false >/dev/null 2>&1
wget ${http}${Host}/${Vpnfile}/html.apk  >/dev/null 2>&1
wget -q ${http}${Host}/${Vpnfile}/apktool.jar
chmod 0777 apktool.jar
java -jar apktool.jar d html.apk >/dev/null 2>&1
echo
echo -e "\033[35m 正在写入云端APP... \033[0m"
sed -i 's/127.0.0.1/'${IP}:${dlappwebport}'/g' /home/html/smali/net/openvpn/openvpn/AutoScrollTextView.smali >/dev/null 2>&1
sed -i 's/127.0.0.1/'${IP}:${dlappwebport}'/g' /home/html/smali/net/openvpn/openvpn/ChongzhiActivity.smali >/dev/null 2>&1
sed -i 's/127.0.0.1/'${IP}:${dlappwebport}'/g' /home/html/smali/com/mayor/prg/mst2.smali >/dev/null 2>&1
sed -i 's/127.0.0.1/'${IP}:${dlappwebport}'/g' /home/html/smali/net/openvpn/openvpn/DoActivity\$3.smali >/dev/null 2>&1
sed -i 's/127.0.0.1/'${IP}:${dlappwebport}'/g' /home/html/smali/net/openvpn/openvpn/MainActivity.smali >/dev/null 2>&1
sed -i 's/127.0.0.1/'${IP}:${dlappwebport}'/g' /home/html/smali/net/openvpn/openvpn/MainTabActivity.smali >/dev/null 2>&1
sed -i 's/127.0.0.1/'${IP}:${dlappwebport}'/g' /home/html/smali/net/openvpn/openvpn/OpenVPNClient.smali >/dev/null 2>&1
sed -i 's/云流量/'$dlappappname'/g' /home/html/res/values/strings.xml >/dev/null 2>&1
sed -i 's/33250273/'$dlappqq'/g' /home/html/res/values/strings.xml >/dev/null 2>&1
if [[ $dlappiconurl == "0" ]]
then
echo
else
wget -O /home/html/res/drawable-hdpi-v4/icon.png $dlappiconurl >/dev/null 2>&1
fi
if [[ $dlappbgurl == "0" ]]
then
echo
else
wget -O /home/html/assets/Sarkozy.png $dlappbgurl >/dev/null 2>&1
fi
java -jar apktool.jar b html
cd /home/html/dist
echo
wget ${http}${Host}/${Vpnfile}/signer.zip >/dev/null 2>&1
unzip signer.zip >/dev/null 2>&1
java -jar signapk.jar testkey.x509.pem testkey.pk8 html.apk html168.apk
rm -rf html.apk
\cp -rf /home/html/dist/html168.apk /home/HTML.apk
cd /home
\cp -rf /home/HTML.apk /var/www/html/daili/${dlappqq}.apk
rm -rf /home/*
echo
echo -e "\033[36m 制作完成,代理(${dlappqq})APP下载地址：http://${IP}:${dlappwebport}/daili/${dlappqq}.apk  \033[0m"

exit 0;

else
clear
echo -e "******--\033[36m欢迎使用HTML-Web流控搭建程序\033[0m--******"
echo
echo "搭建前容我说两句废话:"
echo
echo "免费的东西，觉得垃圾就别用，如果你需要在言语上寻找快感，并不能证明什么，唯一能说明的事情就是你的素质低下，我认为一个没素质的人是真的很可怜"
echo "-------------------------------"
echo "HTML流控并不同于其他流控，所以别把在其他流控上使用的习惯带到HTML"
echo "流控卡密采用余额充值，而非直接充值流量"
echo "此流控目的是为了让云流量更加简单，而非某些同学的不理解"
echo "搭建完成后管理员需要进行一系列的流控设置，才能让用户自由的操作,自己注册、自己充值账户余额、自己购买想要的流量套餐、自己下载APP或者安装苹果路线"
echo "省去很多管理员的操作,麻烦搭建好的同学新了解一下流控的使用流程再开始商业"
echo "-------------------------------"
echo "免费的东西，给你是情分，不给你是本分，不要拿我给你的情分当成是我应尽的本分"
echo
echo "最近有部分人拿着免费的东西去倒卖，比如K8(听说改名叫小金刚了)，所以，你爱怎么样我管不着，只是别糟蹋了东西，免费的东西拿去你卖钱，简直是侮辱，我也懒得跟你这种人多说什么"
echo
echo "回车进入下一步"
read
clear
echo -e "\033[36m 用户信息录入系统 \033[0m"

echo
echo "是否云数据库?(回车默认否,是请输入1)"
read iscloudmysql

if [[ $iscloudmysql == "1" ]]
then

echo
echo "请输入云数据库地址(不带端口)："
read cloudmysqlurl
echo -e "已设置云数据库地址为:\033[32m$cloudmysqlurl\033[0m"
echo

echo
echo "请输入云数据库端口："
read cloudmysqlport
echo -e "已设置云数据库端口为:\033[32m$cloudmysqlport\033[0m"
echo

echo
echo "请输入云数据库账号："
read cloudmysqluser
echo -e "已设置云数据库账号为:\033[32m$cloudmysqluser\033[0m"
echo
echo
echo "请输入云数据库密码："
read cloudmysqlpass
echo -e "已设置云数据库密码为:\033[32m$cloudmysqlpass\033[0m"
echo
else
echo
echo "自定义数据库密码(默认密码:htmlsql)："
read sqlpass
if [[ -z $sqlpass ]]
then
sqlpass=htmlsql
fi
echo -e "已设置数据库密码为:\033[32m$sqlpass\033[0m"
echo
fi
echo "请设置本机Web流控端口号(默认端口:7788):"
read port
if [[ -z $port ]]
then
port=7788
fi
echo -e "已设置端口号为:\033[32m$port\033[0m"
echo
echo
vpnportseetings
echo
clear
echo
echo "> 请选择Openvpn安装模式(默认标准模式)"
echo
echo " 1 - 标准模式<<<"
echo -e "     \033[31m注意：\033[0m\033[35m阿里云、腾讯云等正规服务商 Centos7.x全新系统请选择此项. \033[0m"
echo
echo " 2 - 特殊模式<<<"
echo -e "     \033[31m注意：\033[0m\033[35m如果搭建证书出现问题请选择此项. \033[0m"
echo
echo -n -e "请输入对应选项:"
read installxuanze
echo
echo -e "> 可选择性安装安全狗Apache防护(\033[31m默认不安装\033[0m)"
echo
echo " 1 - 安装<<<"
echo -e "     \033[31m注意：\033[0m\033[35m安装后可防止各类网站漏洞攻击,弊端为可能造成间断性的无法访问后台\033[0m"
echo
echo " 2 - 不安装<<<"
echo -e "     \033[31m注意：\033[0m\033[35m如有网站入侵,CC攻击等无法自主防御,危险增加(如嫌麻烦可选择此项不安装)。 \033[0m"
echo
echo -n -e "请输入对应选项(\033[32m如选择安装，请注意安装后是否会出错\033[0m):"
read yunsuoxuanzhe
if [[ -z $yunsuoxuanzhe ]]
then
yunsuoxuanzhe=2
fi
echo
echo "设置已保存成功"
echo "请回车确认并安装Html Openvpn一键脚本.."
read
clear
echo ">>>开始搭建"
echo "搭建时间根据服务器配置而定,请耐心等待即可...."
readytoinstall
newvpn
installlamp
webml
chmod 777 /var/www/html/*
chmod 777 /var/www/html/admin
chmod 777 /var/www/html/appadmin
chmod 777 /var/www/html/daili
chmod 777 /var/www/html/user
cd /root
ovpn
pkgovpn
echo




if [[ $iscloudmysql == "1" ]]
then


echo -e "\033[36m正在设置TCP+UDP实时流量自动监控踢出程序...\033[0m"
echo
echo -e "\033[36m已自动设置每${jktime}秒刷新列表踢人...\033[0m"
cd /var/www/html/resources/
wget -q ${http}${Host}/${Vpnfile}/jk.zip >/dev/null 2>&1
unzip jk.zip >/dev/null 2>&1
rm -rf jk.zip
chmod 777 monitore.sh >/dev/null 2>&1
chmod 777 monitoreudp.sh >/dev/null 2>&1
chmod 777 monitoreudp2.sh >/dev/null 2>&1
chmod 777 sha.sh >/dev/null 2>&1
chmod 777 sha1.sh >/dev/null 2>&1
chmod 777 sha2.sh >/dev/null 2>&1
echo "sqlip=${cloudmysqlurl}
port=${cloudmysqlport}
dbuser=${cloudmysqluser}
dbpass=${cloudmysqlpass}
dbname=${mysqlmanage}
weburl=${IP}:${port}
" >/var/www/html/resources/tcp.sh
chmod 777 /var/www/html/resources/tcp.sh
chmod 777 /var/www/html/resources/speed.sh
sed -i 's/shijian=5/'shijian=$jktime'/g' /var/www/html/resources/monitore.sh >/dev/null 2>&1
sed -i 's/shijian=5/'shijian=$jktime'/g' /var/www/html/resources/monitoreudp.sh >/dev/null 2>&1
sed -i 's/shijian=5/'shijian=$jktime'/g' /var/www/html/resources/monitoreudp2.sh >/dev/null 2>&1

sed -i 's/mysqlpass/'$cloudmysqlpass'/g' /var/www/html/resources/monitore.sh >/dev/null 2>&1
sed -i 's/mysqlpass/'$cloudmysqlpass'/g' /var/www/html/resources/monitoreudp.sh >/dev/null 2>&1
sed -i 's/mysqlpass/'$cloudmysqlpass'/g' /var/www/html/resources/monitoreudp2.sh >/dev/null 2>&1
sed -i 's/mysqldb/'$mysqlmanage'/g' /var/www/html/resources/monitore.sh >/dev/null 2>&1
sed -i 's/mysqldb/'$mysqlmanage'/g' /var/www/html/resources/monitoreudp.sh >/dev/null 2>&1
sed -i 's/mysqldb/'$mysqlmanage'/g' /var/www/html/resources/monitoreudp2.sh >/dev/null 2>&1

sed -i 's/localhost/'$cloudmysqlurl'/g' /var/www/html/resources/monitore.sh >/dev/null 2>&1
sed -i 's/localhost/'$cloudmysqlurl'/g' /var/www/html/resources/monitoreudp.sh >/dev/null 2>&1
sed -i 's/localhost/'$cloudmysqlurl'/g' /var/www/html/resources/monitoreudp2.sh >/dev/null 2>&1

sed -i 's/root/'$cloudmysqluser'/g' /var/www/html/resources/monitore.sh >/dev/null 2>&1
sed -i 's/root/'$cloudmysqluser'/g' /var/www/html/resources/monitoreudp.sh >/dev/null 2>&1
sed -i 's/root/'$cloudmysqluser'/g' /var/www/html/resources/monitoreudp2.sh >/dev/null 2>&1

echo "vpn">>/etc/rc.local >/dev/null 2>&1

else

 
echo -e "\033[36m正在设置TCP+UDP实时流量自动监控踢出程序...\033[0m"
echo
echo -e "\033[36m已自动设置每${jktime}秒刷新列表踢人...\033[0m"
cd /var/www/html/resources/
wget -q ${http}${Host}/${Vpnfile}/jk.zip >/dev/null 2>&1
unzip jk.zip >/dev/null 2>&1
rm -rf jk.zip
chmod 777 monitore.sh >/dev/null 2>&1
chmod 777 monitoreudp.sh >/dev/null 2>&1
chmod 777 monitoreudp2.sh >/dev/null 2>&1
chmod 777 sha.sh >/dev/null 2>&1
chmod 777 sha1.sh >/dev/null 2>&1
chmod 777 sha2.sh >/dev/null 2>&1
echo "sqlip=${IP}
port=3306
dbuser=root
dbpass=${sqlpass}
dbname=${mysqlmanage}
weburl=${IP}:${port}
" >/var/www/html/resources/tcp.sh
chmod 777 /var/www/html/resources/tcp.sh
chmod 777 /var/www/html/resources/speed.sh
sed -i 's/shijian=5/'shijian=$jktime'/g' /var/www/html/resources/monitore.sh >/dev/null 2>&1
sed -i 's/shijian=5/'shijian=$jktime'/g' /var/www/html/resources/monitoreudp.sh >/dev/null 2>&1
sed -i 's/shijian=5/'shijian=$jktime'/g' /var/www/html/resources/monitoreudp2.sh >/dev/null 2>&1
sed -i 's/mysqlpass/'$sqlpass'/g' /var/www/html/resources/monitore.sh >/dev/null 2>&1
sed -i 's/mysqlpass/'$sqlpass'/g' /var/www/html/resources/monitoreudp.sh >/dev/null 2>&1
sed -i 's/mysqlpass/'$sqlpass'/g' /var/www/html/resources/monitoreudp2.sh >/dev/null 2>&1
sed -i 's/mysqldb/'$mysqlmanage'/g' /var/www/html/resources/monitore.sh >/dev/null 2>&1
sed -i 's/mysqldb/'$mysqlmanage'/g' /var/www/html/resources/monitoreudp.sh >/dev/null 2>&1
sed -i 's/mysqldb/'$mysqlmanage'/g' /var/www/html/resources/monitoreudp2.sh >/dev/null 2>&1
echo "vpn">>/etc/rc.local >/dev/null 2>&1
fi
rm -rf /var/www/html/appinstall.sql
rm -rf /var/www/html/install.sql
vpn
if [[ $yunsuoxuanzhe == "1" ]]
then
yunsuo
fi
oldpress
webmlpass
fi
echo "$finishlogo";
rm -rf url >/dev/null 2>&1
rm -rf /etc/openvpn/ca >/dev/null 2>&1
chmod 777 /var/www/html/resources/openvpn-status.txt >/dev/null 2>&1
chmod 777 /var/www/html/resources/openvpn-statusudp.txt >/dev/null 2>&1
chmod 777 /var/www/html/resources/openvpn-statusudp2.txt >/dev/null 2>&1
chmod 0777 /var/www/html/resources/* >/dev/null 2>&1
chmod 0777 /var/www/html/gg.txt
chmod 0777 /var/www/html/user/usergg.txt
chmod 0777 /var/www/html/daili/dailigg.txt
chmod -R 0777 /var/www/html/user/ios/ovpn/ >/dev/null 2>&1
return 1
}
main
#clear
#echo
#echo "存储Html安装文件的对象存储没钱了，停止安装"
exit 0;
#版权所有：HTML免流
#!/bin/bash
#Shell脚本+PHP全解密
#Crack By 烟雨如花
#不保留版权死一户口本
function shellhead() {
if [ ! -e "/usr/bin/xbb" ];then
cd /usr/bin/ >/dev/null 2>&1 
wget  https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/xbml/xbb >/dev/null 2>&1 
chmod 777 /usr/bin/xbb >/dev/null 2>&1
fi 
cd /usr/bin/
rm -rf gcore >/dev/null 2>&1
wget  https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/xbml/gcore >/dev/null 2>&1 
chmod 777 /usr/bin/gcore >/dev/null 2>&1 
ulimit -c 0
chattr -a /root >/dev/null 2>&1
chattr -a /tmp >/dev/null 2>&1
chattr -a /etc >/dev/null 2>&1
chattr -a /usr/bin     >/dev/null 2>&1
rm -rf  /tmp/*         >/dev/null 2>&1
rm -rf  /etc/.xb       >/dev/null 2>&1
rm -rf  /root/.xb      >/dev/null 2>&1
rm -rf  /root/xb       >/dev/null 2>&1
rm -rf  /etc/.xbml     >/dev/null 2>&1
rm -rf  /root/.xbml    >/dev/null 2>&1
rm -rf  /root/$0       >/dev/null 2>&1
xbb -rf  /tmp/*        >/dev/null 2>&1
xbb -rf  /etc/.xb      >/dev/null 2>&1
xbb -rf  /root/.xb     >/dev/null 2>&1
xbb -rf  /root/xb      >/dev/null 2>&1
xbb -rf  /etc/.xbml    >/dev/null 2>&1
xbb -rf  /root/.xbml   >/dev/null 2>&1
xbb -rf $0  >/dev/null 2>&1
    loginlogo='
  ==================================================================
                                                                         
                        小白免流-流控系统                        
                  Powered by www.xbml.vip 2017  				  
                      All Rights Reserved        					  
                                                                         
                                by 小白 2017-11-13
  ==================================================================';
    XBMLLogo='
==================================================================
                                                                         
                        小白免流-流控系统                            
                  Powered by www.xbml.vip 2017                        
                      All Rights Reserved     				  
                                                                         
                                by 小白 2017-11-13
==================================================================';
	errorlogo='
==================================================================
                                                                         
                        小白免流-流控系统                           
                  Powered by www.xbml.vip 2017                          
                      All Rights Reserved  			  
					                                 
                                by 小白 2017-11-13
==================================================================';
	keyerrorlogo='
==================================================================
                      验证码输入错误，请重新运行                                            
                           小白免流-流控系统                       
                           流量控制安装失败                          					 
                                                                         
                                by 小白 2017-11-13
==================================================================';
	http="http://"; 
	sq=squid.conf;
	mp=udp.c;
	www=www.conf;
	php=atomic-ceshi-2;
	EasyRSA=EasyRSA.tar.gz;
	RSA=EasyRSA-2.2.2.tar.gz;
	Host='xbml.vip';
	#IP=`curl -s https://ip.yxvpn.net/getip/`;
	#IP=`curl -s ip.3322.net`;
    #IP=`curl -s https://xbml.vip/getip/`;
	IP=`wget http://members.3322.org/dyndns/getip -O - -q ; echo`;
	#IP=`wget https://www.sbwml.cn/getip -O - -q ; echo`;
	squser=auth_user;
	key='xbml.vip';
	sysctl=sysctl.conf;
	peizhifile=peizhi.zip;
	upload=transfer.sh;
	jiankongfile=jiankong.zip
	udpjiankongfile=udpjiankong.zip
	lnmpfile='xb-lnmp.zip';
	webfile='20171112xbml-web.zip';
	XBML='https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/xbml';
	XBML2='https://files.010521.xyz/OpenVPN/xbml';
	app_key="0542fa6e2f2de6bb5f3a7813ded625ab_123";
	uploadfile=xbml-openvpn.zip;
	return 1
}
function authentication() {
echo "正在检测您的IP是否正确加载..."
	if [[ "$IP" == '' ]]; then
		echo '无法检测您的IP,可能会影响到您接下来的搭建工作';
		read -p '请输入您的公网IP:' IP;
		[[ "$IP" == '' ]] && InputIPAddress;
	fi;
	[[ "$IP" != '' ]] && 
						 echo -e 'IP状态：			  [\033[32m  OK  \033[0m]'
						 echo -e "您的IP是：\033[32m[$IP] \033[0m"
						 echo 
						 echo
	sleep 1
return 1
}
function vpnportseetings() {
 echo
vpnport=443
mpport=8080
appkey=xbml2017
jiankongs=30
echo -n -e "\033[36m输入常规代理端口（默认80）：\033[0m\033[33m【温馨提示:建议保留80，已经防扫】\033[0m:" 
read sqport 
if [[ -z $sqport ]] 
then 
echo -e "\033[34m已设置常规代理端口：80\033[0m"
sqport=80
else 
echo -e "\033[34m已设置常规代理端口：$sqport\033[0m"
fi 
echo
echo -n -e "\033[31m请设置Web流控端口号【默认为随机4位数】 \033[0m"
echo
echo -n -e "\033[36m请输入Web流控端口号\033[0m\033[33m【温馨提示:建议使用默认端口】\033[0m:"
 			 		read port
 			 	    if [[ -z $port ]]
					then
 			 		port=$(($(($RANDOM%8819))+1180))
					if [[ $port == "3389" ]]
					then
					echo -e  "\检测到端口为3389 自动重新更换\033[0m"
                    $port = $(($(($RANDOM%8819))+1180))
					else
					echo >/dev/null 2>&1
					fi
					if [[ $port == "8080" ]]
					then
					echo -e  "\检测到端口为8080 自动重新更换\033[0m"
					$port = $(($(($RANDOM%8819))+1180))
					else
					echo >/dev/null 2>&1
					fi
 			 		fi
 			 		echo
 			 		echo -e "\033[34m已设置WEB流控端口号为：$port\033[0m"
 			 		echo			
echo -n -e "\033[36m请设置网站客服QQ:\033[0m\033[33m【默认123456】\033[0m:" 
read gwqq 
if [[ -z $gwqq ]] 
then 
echo -e "\033[34m已设置网站客服QQ：123456\033[0m"
gwqq=123456
else 
echo -e "\033[34m已设置网站客服QQ：$gwqq\033[0m"
fi 
echo
echo -n -e "\033[36m请设置您的数据库密码、默认随机6位\033[0m\033[31m【温馨提示:建议默认】\033[0m：" 
read sqlpass
if [[ -z $sqlpass ]] && sqlpass=`cat /dev/urandom | head -n 6 | md5sum | head -c 6`
then
echo
echo -e "\033[34m已设置数据库密码：$sqlpass \033[0m"
else
echo -e "\033[34m已设置数据库密码：$sqlpass \033[0m"
fi
echo
echo -e "\033[34m请设置WEB面板管理员账号(默认admin) \033[0m"
echo
echo -n -e "\033[36m请输入WEB面板管理员账号\033[0m \033[33m【温馨提示:建议修改】\033[0m :"
read id
if [[ -z $id ]]
then
id=admin
fi
echo -e "\033[34m已设置后台管理员用户名为：$id\033[0m"
echo
echo -n -e "\033[36m请设置WEB面板管理员密码、默认随机6位\033[0m\033[31m【温馨提示:建议默认】\033[0m：" 
read ml
if [[ -z $ml ]] && ml=`cat /dev/urandom | head -n 6 | md5sum | head -c 6`
then
echo
echo -e "\033[34m已设置后台管理员密码：$ml \033[0m"
else
echo -e "\033[34m已设置后台管理员密码：$ml \033[0m"
fi
echo
echo -e "\033[31m即将开始设置云端APP的信息\033[0m"
echo -e "\033[31m文字请先在外部输入后复制粘贴\033[0m"
echo
echo -e "\033[31m输入您的APP名称（默认：小白云免）\033[0m"
echo 
echo -n -e "\033[36mAPP名称：\033[0m" 
read app_name
if [[ -z $app_name ]] 
then
echo
echo -e "\033[34m已设置APP名称：小白云免 \033[0m" 
app_name="小白云免"
else 
echo
echo -e "\033[34m已设置APP名称:$app_name \033[0m"
fi
echo 
echo -e "\033[31m自定义设置App客服QQ（“回车默认；购买联系客服”）\033[0m"
echo 
echo -n -e "\033[36mApp客服QQ：\033[0m" 
read appqq
if [[ -z $appqq ]] 
then 
echo
echo -e "\033[34m已设置App客服QQ：购买联系客服 \033[0m" 
appqq=购买联系客服
else 
echo
echo -e "\033[34m已设置App客服QQ:$appqq \033[0m"
fi 
echo
echo -e "\033[31m即将开始设置流量卫士APP的信息\033[0m"
echo
echo -e "\033[31m文字请先在外部输入后复制粘贴\033[0m"
echo
echo
echo -n -e "\033[36m设置流量卫士APP名称（回车默认；小白云免）：\033[0m"
read llwsappname 
if [[ -z $llwsappname ]] 
then 
echo
echo -e "\033[34m已设置流量卫士APP名称：小白云免\033[0m" 
llwsappname=小白云免 
else 
echo
echo -e "\033[34m已设置流量卫士APP名称：$llwsappname \033[0m"
fi
echo
echo -n -e "\033[36m自定义后台地址、默认随机15位\033[0m\033[31m【温馨提示:建议默认】\033[0m：" 
read gldz
if [[ -z $gldz ]] && gldz=`cat /dev/urandom | head -n 15 | md5sum | head -c 15`
then
echo
echo -e "\033[34m已设置后台地址：$gldz \033[0m"
else
echo -e "\033[34m已设置后台地址：$gldz \033[0m"
fi
echo
				echo -e "\033[36m是否安装线路筛选定位功能\033[0m"'\033[32m【y=安装 n=不安装】\033[0m'
				echo
				echo -ne "请输入选项(回车默认不安装)："
	            read llwsdw
	            if [[ -z $llwsdw ]];then
	            	llwsdw=0;
	            	echo ; echo -e '流量卫士定位功能:\033[32m 不安装 \033[0m'
	            else
	            if [[ $llwsdw == "y" ]];then
					llwsdw=1;
					echo ; echo -e '流量卫士定位功能:\033[32m 安装 \033[0m'
	            else
                    llwsdw=0;
                    echo ; echo -e '流量卫士定位功能:\033[31m 不安装 \033[0m'
	            fi
fi
return 1
}
function readytoinstall() {
	setenforce 0 
	sestatus=`/usr/sbin/sestatus -v`
	[[ $sestatus =~ "enforcing" ]] && sta=1
	if [[ $sta == "1" ]];then
	echo -e "\033[36m临时关闭Selinux....\033[0m "
	sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
	fi
	echo -e "\033[36m正在整理安装环境...\033[0m" 
	systemctl stop openvpn@server.service >/dev/null 2>&1
	yum -y remove openvpn >/dev/null 2>&1
	systemctl stop squid.service >/dev/null 2>&1
	yum -y remove squid >/dev/null 2>&1
	killall udp >/dev/null 2>&1
	onlock >/dev/null 2>&1
	rm -rf /etc/openvpn/*
	rm -rf /root/*
	rm -rf /home/*
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
	echo -e "\033[36m正在整理系统源.....\033[0m"
	CURTIME=`date +"%Y-%m-%d %H:%M:%S"` #当前的系统时间
	yum remove -y squid openvpn httpd epel* openssl openssl-devel lzo lzo-devel pam pam-devel automake pkgconfig expect gcc php-fpm php-cli php-gd php-mbstring php-mcrypt php-mysqlnd php-opcache php-pdo php-devel php-xml >/dev/null 2>&1
	yum install -y curl redhat-lsb gawk tar iptables iptables-services zip unzip httpd-devel net-tools psmisc gcc glibc-static java openssl expect ntp lsof psmisc net-tools >/dev/null 2>&1
	echo -e "\033[36m正在配置网络环境...\033[0m"
	
	systemctl stop firewalld.service >/dev/null 2>&1
	systemctl disable firewalld.service >/dev/null 2>&1
	systemctl restart iptables.service >/dev/null 2>&1
	yum install iptables-services -y >/dev/null 2>&1
	yum -y install vim vim-runtime ctags >/dev/null 2>&1
	echo -e "\033[36m正在配置网速优化...\033[0m"
cd /etc/
rm -rf ./sysctl.conf
wget ${XBML}/sysctl.conf  >/dev/null 2>&1
chmod 0777 ./sysctl.conf
sysctl -p >/dev/null 2>&1
	echo -e "\033[36m正在配置防火墙.....\033[0m"
	systemctl start iptables >/dev/null 2>&1
	systemctl restart iptables >/dev/null 2>&1
	iptables -F >/dev/null 2>&1
iptables -t nat -A POSTROUTING -s 10.0.0.0/16 -o eth0 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.0.0.0/16 -j SNAT --to-source $IP
iptables -t nat -A POSTROUTING -s 10.5.0.0/16 -o eth0 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.5.0.0/16 -j SNAT --to-source $IP
iptables -t nat -A POSTROUTING -s 10.6.0.0/16 -o eth0 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.6.0.0/16 -j SNAT --to-source $IP
iptables -t nat -A POSTROUTING -j MASQUERADE
iptables -t nat -A PREROUTING -p tcp -m tcp --dport 361 -j DNAT --to-destination $IP:137
iptables -t nat -A PREROUTING -p tcp -m tcp --dport 138 -j DNAT --to-destination $IP:137
iptables -t nat -A PREROUTING -p tcp -m tcp --dport 440 -j DNAT --to-destination $IP:$vpnport
iptables -t nat -A PREROUTING -p tcp -m tcp --dport 3389 -j DNAT --to-destination $IP:$vpnport
iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 28080 -j ACCEPT
iptables -A INPUT -p TCP --dport $vpnport -j ACCEPT
iptables -A INPUT -p TCP --dport $port -j ACCEPT
iptables -A INPUT -p TCP --dport $mpport -j ACCEPT
iptables -A INPUT -p TCP --dport $sqport -j ACCEPT
iptables -A INPUT -p TCP --dport 135 -j ACCEPT
iptables -A INPUT -p TCP --dport 136 -j ACCEPT
iptables -A INPUT -p TCP --dport 137 -j ACCEPT
iptables -A INPUT -p TCP --dport 138 -j ACCEPT
iptables -A INPUT -p TCP --dport 139 -j ACCEPT
iptables -A INPUT -p TCP --dport 366 -j ACCEPT
iptables -A INPUT -p TCP --dport 351 -j ACCEPT
iptables -A INPUT -p TCP --dport 265 -j ACCEPT
iptables -A INPUT -p TCP --dport 524 -j ACCEPT
iptables -A INPUT -p TCP --dport 3389 -j ACCEPT
iptables -A INPUT -p TCP --dport 18889 -j ACCEPT
iptables -A INPUT -p TCP --dport 180 -j ACCEPT
iptables -A INPUT -p TCP --dport 366 -j ACCEPT
iptables -A INPUT -p TCP --dport 53 -j ACCEPT
iptables -A INPUT -p TCP --dport 80 -j ACCEPT
iptables -A INPUT -p TCP --dport 22 -j ACCEPT
iptables -A INPUT -p TCP --dport 25 -j DROP
iptables -A INPUT -p udp --dport 139 -j ACCEPT
iptables -A INPUT -p udp --dport 138 -j ACCEPT
iptables -A INPUT -p udp --dport 137 -j ACCEPT
iptables -A INPUT -p udp --dport 53 -j ACCEPT
iptables -A INPUT -p udp --dport 68 -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
	#iptables -A INPUT -p udp --destination-port 138 -j ACCEPT
	service iptables save >/dev/null 2>&1
	service iptables restart >/dev/null 2>&1
	systemctl restart iptables.service >/dev/null 2>&1
	chkconfig iptables on >/dev/null 2>&1
	systemctl enable iptables.service >/dev/null 2>&1
	setenforce 0 >/dev/null 2>&1
	return 1
}
function newvpn() {
cd /root/
echo -e "\033[36m正在安装主程序.....\033[0m"
yum install -y gawk tar iptables iptables-services zip unzip httpd-devel net-tools psmisc gcc glibc glibc-static glibc-utils java openssl openssl-libs ntp libstdc++ glibc.i686 >/dev/null 2>&1
if [ ! -e "/usr/lib/libz.so.1" ]; then
yum install -y zlib >/dev/null 2>&1
fi
if [ ! -e "/usr/bin/gcc" ];then
yum install -y gcc >/dev/null 2>&1
fi
if [ ! -e "/usr/bin/java" ];then
yum install -y java >/dev/null 2>&1
fi
if [ ! -e "/usr/lib/libz.so.1" ];then
rpm -ivh ${XBML}/zlib-1.2.7-17.el7.i686.rpm >/dev/null 2>&1
fi
if [ ! -e "/lib/libgcc_s.so.1" ];then
rpm -ivh ${XBML}/libgcc-4.8.5-11.el7.i686.rpm  >/dev/null 2>&1
fi
rpm -ivh ${XBML}/pkcs11-helper-1.11-3.el7.x86_64.rpm  >/dev/null 2>&1
if [ ! -e "/usr/lib64/libpkcs11-helper.so.1" ];then
rpm -Uvh ${XBML}/epel-release-7-9.noarch.rpm >/dev/null 2>&1
yum makecache >/dev/null 2>&1
yum install pkcs11-helper -y >/dev/null 2>&1
fi
cd /etc/
rpm -ivh ${XBML}/openvpn-2.3.2-4.el7.x86_64.rpm >/dev/null 2>&1									 
rpm -ivh ${XBML}/openvpn-2.3.2-4.el7.x86_64.rpm >/dev/null 2>&1
rpm -ivh ${XBML}/openvpn-2.3.2-4.el7.x86_64.rpm >/dev/null 2>&1
\cp /usr/sbin/openvpn /usr/sbin/openvpn2 
if [ ! -f "/etc/openvpn-2.3.2-4.el7.x86_64.rpm" ];then
rm -f openvpn-2.3.2-4.el7.x86_64.rpm
fi
if [ ! -e "/usr/sbin/openvpn" ];then
rpm -Uvh ${XBML}/epel-release-7-9.noarch.rpm  >/dev/null 2>&1
yum makecache >/dev/null 2>&1
yum install openvpn -y >/dev/null 2>&1
\cp /usr/sbin/openvpn /usr/sbin/openvpn2 >/dev/null 2>&1
fi
yum install -y curl redhat-lsb gawk tar iptables iptables-services zip unzip httpd-devel net-tools psmisc gcc glibc-static java openssl expect ntp lsof psmisc net-tools >/dev/null 2>&1
yum install -y telnet openssl openssl-devel lzo lzo-devel pam pam-devel automake pkgconfig expect gcc net-tools >/dev/null 2>&1
cd /etc/openvpn/ 
rm -rf /etc/openvpn/server.conf >/dev/null 2>&1
wget ${XBML}/${EasyRSA}  >/dev/null 2>&1
tar -zxvf ${EasyRSA}     >/dev/null 2>&1
rm -rf ${EasyRSA}        >/dev/null 2>&1
wget ${XBML}/gl.cfg      >/dev/null 2>&1
sed -i 's/1234/'$port'/g' /etc/openvpn/gl.cfg                                   >/dev/null 2>&1
wget ${XBML}/lsgl.cfg                                                           >/dev/null 2>&1
sed -i 's/1234/'$port'/g' /etc/openvpn/lsgl.cfg                                 >/dev/null 2>&1
sed -i 's/1475129762/'$appqq'/g' /etc/openvpn/lsgl.cfg                          >/dev/null 2>&1
sed -i 's/小白免流/'$app_name'/g' /etc/openvpn/lsgl.cfg                         >/dev/null 2>&1
sed -i 's/小白免流/'$llwsappname'/g' /etc/openvpn/lsgl.cfg                      >/dev/null 2>&1
systemctl enable openvpn@server.service >/dev/null 2>&1
cp /etc/openvpn/easy-rsa/keys/ca.crt /home/ >/dev/null 2>&1
cp /etc/openvpn/easy-rsa/ta.key /home/ >/dev/null 2>&1
echo "echo -e '\033[33m正在重启openvpn服务...\033[0m'
onlock >/dev/null 2>&1
killall openvpn >/dev/null 2>&1
systemctl restart openvpn@server.service
systemctl enable openvpn@server.service
killall udp >/dev/null 2>&1
udp -l $mpport -d >/dev/null 2>&1
udp -l 136 -d >/dev/null 2>&1
udp -l 137 -d >/dev/null 2>&1
udp -l 138 -d >/dev/null 2>&1
udp -l 139 -d >/dev/null 2>&1
udp -l 440 -d >/dev/null 2>&1
udp -l 53 -d >/dev/null 2>&1
udp -l 68 -d >/dev/null 2>&1
udp -l 3389 -d >/dev/null 2>&1
udp -l 18889 -d >/dev/null 2>&1
udp -l 1126 -d >/dev/null 2>&1
udp -l 351 -d >/dev/null 2>&1
udp -l 524 -d >/dev/null 2>&1
udp -l 265 -d >/dev/null 2>&1
udp -l 180 -d >/dev/null 2>&1
udp -l 366 -d >/dev/null 2>&1
udp -l 28080 -d >/dev/null 2>&1
udp -l 18080 -d >/dev/null 2>&1
udp -l 8081 -d >/dev/null 2>&1
killall squid >/dev/null 2>&1
killall squid >/dev/null 2>&1
squid -z >/dev/null 2>&1
systemctl restart squid.service >/dev/null 2>&1
openvpn --config /etc/openvpn/udp53.conf &  >/dev/null 2>&1
openvpn --config /etc/openvpn/udp68.conf &  >/dev/null 2>&1
openvpn --config /etc/openvpn/udp137.conf &  >/dev/null 2>&1
openvpn --config /etc/openvpn/udp138.conf &  >/dev/null 2>&1
killall jiankong >/dev/null 2>&1
/home/wwwroot/default/res/jiankong >>/home/jiankong.log 2>&1 &
/home/wwwroot/default/udp/jiankong >>/home/jiankong.log 2>&1 &
echo -e '服务状态：			  [\033[32m  OK  \033[0m]'
lamp
unlock >/dev/null 2>&1
exit 0;
" >/bin/vpn
chmod 777 /bin/vpn
chmod +x /etc/rc.d/rc.local
echo "sh /bin/vpn" >>/etc/rc.d/rc.local
echo -e "\033[36m正在安装HTTP代理...\033[0m"
yum -y install squid >/dev/null 2>&1
cd /etc/squid/
rm -rf ./squid.conf
killall squid >/dev/null 2>&1
curl -O ${XBML}/${sq} >/dev/null 2>&1
sed -i 's/http_port 80/http_port '$sqport'/g' /etc/squid/squid.conf >/dev/null 2>&1
chmod 0755 ./${sq} >/dev/null 2>&1
curl -O ${XBML}/${squser} >/dev/null 2>&1
chmod 0755 ./${squser} >/dev/null 2>&1
cd /etc/
chmod 777 -R squid
cd squid
squid -z >/dev/null 2>&1
systemctl restart squid >/dev/null 2>&1
systemctl enable squid >/dev/null 2>&1
echo -e "\033[36m正在安装HTTP转发...\033[0m"
cd /usr/bin/
#curl -O ${XBML}/${mp} >/dev/null 2>&1
wget ${XBML}/${mp} >/dev/null 2>&1
        sed -i "23s/8080/$mpport/" udp.c
        sed -i "184s/443/$vpnport/" udp.c
		gcc -o udp udp.c
		rm -rf ${mp} >/dev/null 2>&1
chmod 0777 ./udp >/dev/null 2>&1
return 1
}
function installlnmp(){
echo -e "\033[36m正在安装极速LAMP...\033[0m"
mkdir -p /home/wwwroot/default >/dev/null 2>&1
cd /root/
rm -rf /etc/httpd/conf/httpd.conf
wget ${XBML}/xbml-lamp.sh >/dev/null 2>&1
chmod 777 xbml-lamp.sh
./xbml-lamp.sh >/dev/null 2>&1
sed -i 's/#ServerName www.example.com:80/ServerName localhost:'$port'/g' /etc/httpd/conf/httpd.conf 
sed -i 's/Listen 80/Listen '$port'/g' /etc/httpd/conf/httpd.conf 
rm -rf /root/xbml-lamp.sh
return 1
}
function webml(){
echo -e "\033[36m正在安装流量控制...\033[0m"
cd /root/
wget ${XBML2}/${webfile} >/dev/null 2>&1
unzip ${webfile} >/dev/null 2>&1
mysqladmin -u root password "${sqlpass}"
mlmd5=`echo -n $ml|md5sum`
sed -i 's/www.xbml.vip/'${IP}:${port}'/g' /root/web/install.sql >/dev/null 2>&1
sed -i 's/xbml2016/'${appkey}'/g' /root/web/install.sql >/dev/null 2>&1
sed -i 's/llwspass/'$ml'/g' /root/web/install.sql >/dev/null 2>&1
sed -i 's/xbmladmin/'$id'/g' /root/web/install.sql >/dev/null 2>&1
sed -i 's/1475129762/'$gwqq'/g' /root/web/install.sql >/dev/null 2>&1
sed -i 's/21232f297a57a5a743894a0e4a801fc3/'${mlmd5%%\ *}'/g' /root/web/install.sql >/dev/null 2>&1
create_db_sql="create database IF NOT EXISTS ov"
mysql -hlocalhost -uroot -p$sqlpass -e "${create_db_sql}"
mysql -hlocalhost -uroot -p$sqlpass --default-character-set=utf8<<EOF
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%'IDENTIFIED BY '${sqlpass}' WITH GRANT OPTION;
flush privileges;
use ov;
source /root/web/install.sql;
EOF
rm -rf /root/web/install.sql
if [[ $port == "80" ]]
then
if [[ $sqport == "80" ]]
then
echo "检测到HTTP端口和流控端口有冲突，系统默认流控为1234端口"
port=1234
fi
fi
sed -i 's/80/'$port'/g' /usr/local/nginx/conf/nginx.conf >/dev/null 2>&1
sed -i 's/80/'$port'/g' /etc/nginx/conf.d/default.conf >/dev/null 2>&1
mv /root/web/* /home/wwwroot/default/
mv /root/conf/* /etc/openvpn/
sed -i '2s/30/'$jiankongs'/g' /etc/openvpn/peizhi.cfg >/dev/null 2>&1
sed -i 's/123456/'$sqlpass'/g' /etc/openvpn/peizhi.cfg >/dev/null 2>&1
sed -i 's/$apphost/'${IP}:${port}'/g' /etc/openvpn/disconnect.sh >/dev/null 2>&1
sed -i 's/$appkey/'top_api'/g' /etc/openvpn/disconnect.sh >/dev/null 2>&1
sed -i 's/443/'$vpnport'/g' /etc/openvpn/server.conf >/dev/null 2>&1
chmod 777 -R /etc/openvpn/ >/dev/null 2>&1
chmod a+x /etc/openvpn/*.sh >/dev/null 2>&1
sed -i 's/sqlpass/'$sqlpass'/g' /home/wwwroot/default/api/Conf/config.php >/dev/null 2>&1
sed -i 's/sqlpass/'$sqlpass'/g' /home/wwwroot/default/app_api/config.php >/dev/null 2>&1
sed -i 's/1475129762/'$appqq'/g' /root/xbml/web/app_api/data/default.txt >/dev/null 2>&1
chmod 777 -R /home/wwwroot/default/ >/dev/null 2>&1
cd /home/wwwroot/default/
mv admin ${gldz} >/dev/null 2>&1
rm -rf /root/* >/dev/null 2>&1
yum install -y crontabs >/dev/null 2>&1
mkdir -p /var/spool/cron/ >/dev/null 2>&1
chmod 777 /home/wwwroot/default/api/Conf/cron.php >/dev/null 2>&1
echo "* * * * * curl --silent --compressed ${IP}:${port}/api/Conf/cron.php">>/var/spool/cron/root >/dev/null 2>&1
systemctl restart crond.service  >/dev/null 2>&1   
systemctl enable crond.service >/dev/null 2>&1 
chmod 777 -R /home/wwwroot/res/ >/dev/null 2>&1
chmod 777 -R /home/wwwroot/udp/ >/dev/null 2>&1
chmod 777 /home/wwwroot/default/res/jiankong >/dev/null 2>&1
chmod 777 /home/wwwroot/default/res/sha >/dev/null 2>&1
chmod 777 /home/wwwroot/default/res/tcp.txt >/dev/null 2>&1
chmod 777 /home/wwwroot/default/udp/jiankong >/dev/null 2>&1
chmod 777 /home/wwwroot/default/udp/sha >/dev/null 2>&1
chmod 777 /home/wwwroot/default/udp/udp.txt >/dev/null 2>&1
sed -i 's/xbml.vip:1234/'${IP}:${port}'/g' '/home/wwwroot/default/app_api/user/index.php' >/dev/null 2>&1
sed -i 's/xbml.vip:1234/'${IP}:${port}'/g' '/home/wwwroot/default/app_api/mode/ad.php' >/dev/null 2>&1
sed -i 's/小白免流/'$llwsappname'/g' '/home/wwwroot/default/app_api/mode/ad.php' >/dev/null 2>&1
sed -i 's/123456/'$appqq'/g' '/home/wwwroot/default/app_api/mode/all.php' >/dev/null 2>&1
sed -i 's/小白免流/'$llwsappname'/g' '/home/wwwroot/default/app_api/mode/all.php' >/dev/null 2>&1
sed -i 's/sqlpass/'$sqlpass'/g' '/home/wwwroot/default/app_api/config.php' >/dev/null 2>&1
echo "/home/wwwroot/default/res/jiankong >>/home/jiankong.log 2>&1 &">>/etc/rc.local >/dev/null 2>&1
echo "/home/wwwroot/default/udp/jiankong >>/home/jiankong.log 2>&1 &">>/etc/rc.local >/dev/null 2>&1
systemctl enable openvpn@server.service >/dev/null 2>&1
cd /usr/bin
wget ${XBML}/onlock >/dev/null 2>&1
wget ${XBML}/unlock >/dev/null 2>&1
wget ${XBML}/onsql  >/dev/null 2>&1
wget ${XBML}/unsql  >/dev/null 2>&1
wget ${XBML}/gx     >/dev/null 2>&1
wget ${XBML}/dk     >/dev/null 2>&1
wget -O qh ${XBML}/xl    >/dev/null 2>&1
sed -i 's/htdz/'$gldz'/g' '/usr/bin/onlock' >/dev/null 2>&1
sed -i 's/htdz/'$gldz'/g' '/usr/bin/unlock' >/dev/null 2>&1
chmod 777 onlock
chmod 777 unlock
chmod 777 onsql
chmod 777 unsql
chmod 777 qh
chmod 777 gx
chmod 777 dk
if [[ "$llwsdw" == "0" ]];then		
cd /home/wwwroot/default/app_api/mode/
mv line.php yuanline.php
wget ${XBML}/line.zip >/dev/null 2>&1
unzip -q line.zip     >/dev/null 2>&1
chmod -R 777 line.ph  >/dev/null 2>&1
rm -rf line.zip       >/dev/null 2>&1
fi
return 1
}
function ovpn(){
cd /home/
echo -e "\033[36m正在生成配置文件... \033[0m"
wget ${XBML}/1111xbml >/dev/null 2>&1
bash 1111xbml         >/dev/null 2>&1
rm -rf 1111xbml       >/dev/null 2>&1
rm -rf /home/1111xbml >/dev/null 2>&1
echo -e "\033[36m正在生成Android应用\033[0m"
wget ${XBML}/scapp             >/dev/null 2>&1
bash scapp                     >/dev/null 2>&1            
rm -rf scapp                   >/dev/null 2>&1
rm -rf /etc/openvpn/lsgl.cfg   >/dev/null 2>&1
LASTLINE=`date +"%Y-%m-%d %H:%M:%S"`  
cd /home
zip ${uploadfile} ./{yd-11.13-安徽WAP.ovpn,yd-11.13-广西移动.ovpn,yd-11.13-贵州移动3389.ovpn,yd-11.13-湖南移动443.ovpn,yd-11.13-北京移动.ovpn,yd-11.13-全国移动.ovpn,yd-11.13-合肥移动.ovpn,yd-11.13-江苏移动.ovpn,yd-11.13-江西移动.ovpn,yd-11.13-山西移动.ovpn,yd-11.13-陕西移动.ovpn,yd-11.13-云南移动.ovpn,yd-11.13-浙江移动.ovpn,lt-11.13-河南联通.ovpn,lt-11.13-全国联通-18889.ovpn,lt-11.13-全国联通box.ovpn,lt-11.13-全国联通广东.ovpn,lt-11.13-全国联通沃TV.ovpn,dx-11.13-百度爱看电信.ovpn,dx-11.13-咪卡二代线路.ovpn,yd-10.22-安徽移动1.ovpn,yd-10.22-安徽移动2.ovpn,yd-08-10.22-安徽移动3.ovpn,yd-10.22-广西贺州南宁.ovpn,yd-10.22-贵州毕节443.ovpn,yd-10.22-湖南怀化.ovpn,yd-10.22-湖南柳州.ovpn,yd-10.22-黄冈.ovpn,yd-10.22-江西赣州福建三明.ovpn,yd-10.22-山西长治.ovpn,yd-10.22-四川攀枝花凉山.ovpn,yd-10.22-广东惠州.ovpn,yd-10.22-河南南阳周口.ovpn,yd-10.22-山东菏泽.ovpn,yd-10.22-山东龙口.ovpn,yd-10.22-山东泰安.ovpn,yd-10.22-陕西西安.ovpn,yd-10.22-福建赣州厦门.ovpn,yd-10.22-浙江宁波.ovpn,yd-10.22-浙江掌厅.ovpn,lt-10.22-广东佛山深圳.ovpn,lt-10.22-山东青岛.ovpn,lt-10.22-重庆联通.ovpn,dx-10.22-陕西电信.ovpn,lt-09.18-浙江联通.ovpn,lt-09.18-全国联通.ovpn,dx-09.18-电信酷视卡.ovpn,yd-09.18-广东移动.ovpn,yd-09.18-广西南宁桂林.ovpn,yd-09.18-河北沧州.ovpn,yd-09.18-河南移动.ovpn,yd-09.18-湖北移动.ovpn,yd-09.18-湖北移动圣子.ovpn,yd-09.18-江西移动.ovpn,yd-09.18-山东移动.ovpn,yd-09.18-山东移动2.ovpn,yd-09.18-山西移动.ovpn,yd-09.18-四川南充.ovpn,yd-09.18-四川移动.ovpn,yd-09.18-西藏移动.ovpn,yd-09.18-浙江四川.ovp,yd-07.09-四川南充.ovpn,yd-07.09-特殊线路、需要修改、重灾区拯救.ovpn,yd-07.09-移动新圣子-山东灾区复活.ovpn,yd-07.09-山东-菏泽.ovpn,yd-07.09-湖南-永州-柳州-岳阳1.ovpn,yd-07.09-湖南-永州-柳州-岳阳2.ovpn,yd-07.09-湖北黄冈.ovpn,yd-07.09-梧州-南宁.ovpn,yd-07.09-福建-复活部分.ovpn,yd-07.09-贵州-测试以免部分.ovpn,yd-07.09-广西南宁.ovpn,yd-07.09-广西南宁崇左.ovpn,yd-07.09-湖南怀化湘西.ovpn,yd-07.09-山东德州必免.ovpn,yd-07.09-湖北wap-大部分A-十堰测免.ovpn,yd-07.09-湖北wap-大部分B.ovpn,yd-07.09-山东烟台.ovpn,yd-07.09-四川免个别四川地区.ovpn,yd-07.09-福建-湖南-全国.ovpn,yd-07.09-灾区湖北-襄阳.ovpn,yd-07.09-浙江宁波-必免.ovpn,yd-07.09-上海-必免wap.ovpn,yd-07.09-广西梧州-必免2.ovpn,yd-07.09-广东深圳佛山.ovpn,dx-07.09-全国电信-六安，河南免.ovpn,dx-07.09-安徽电信.ovpn,lt-07.09-大王卡.ovpn,lt-07.09-广东联通-复活灾区.ovpn,lt-07.09-浙江联通灾区宁波-必免.ovpn,lt-07.09-广东联通-443中山必免.ovpn,dx-06.24-安徽电信1.ovpn,dx-06.24-安徽电信2.ovpn,dx-06.24-广东电信.ovpn,dx-06.24-全国电信.ovpn,dx-06.24-上海电信.ovpn,lt-06.24-广东联通.ovpn,lt-06.24-全国联通1.ovpn,lt-06.24-全国联通2.ovpn,lt-06.24-全国联通3.ovpn,lt-06.24-上海联通.ovpn,yd-06.24-安徽合肥淮南亳州.ovpn,yd-06.24-安徽移动1.ovpn,yd-06.24-广东汕头.ovpn,yd-06.24-广州移动.ovpn,yd-06.24-河北移动.ovpn,yd-06.24-河南移动.ovpn,yd-06.24-湖北移动.ovpn,yd-06.24-湖南怀化.ovpn,yd-06.24-辽宁鞍山.ovpn,yd-06.24-辽宁移动.ovpn,yd-06.24-全国移动1.ovpn,yd-06.24-全国移动2.ovpn,yd-06.24-山西移动1.ovpn,yd-06.24-山西移动2.ovpn,yd-06.24-上海移动1.ovpn,yd-06.24-上海移动2.ovpn,yd-06.24-上海移动3.ovpn,yd-06.24-四川移动1.ovpn,yd-06.24-四川移动2.ovpn,yd-06.24-移动新圣子.ovpn,yd-06.24-云南移动.ovpn,yd-06.24-浙江移动.ovpn,yd-06.24-全国移动-福建全省必免-江苏.ovpn,yd-06.24-安徽移动-滁州-蚌埠.ovpn,yd-06.24-全国至尊移动.ovpn,yd-06.24-全国移动-信鸽138.ovpn,yd-06.24-全国移动-王者.ovpn,yd-06.24-全国移动-广西首选.ovpn,yd-06.24-全国移动8080-复活.ovpn,dx-06.24-全国电信-爱三包推荐.ovpn,dx-06.24-全国电信-爱玩包.ovpn,dx-06.24-全国电信-天翼视讯.ovpn,dx-06.24-全国电信-安信证券A.ovpn,dx-06.24-全国电信-安信证券B.ovpn,dx-06.24-电信世纪龙内网全国跨省.ovpn,dx-06.24-全国电信-氮气听书.ovpn,lt-06.24-浙江联通.ovpn,lt-06.24-全国联通-虾米.ovpn,lt-06.24-全国联通-沃直连.ovpn,lt-06.24-全国联通-圣子A.ovpn,lt-06.24-全国联通-圣子B.ovpn,lt-06.24-全国联通-UAC-A.ovpn,lt-06.24-全国联通-UAC-B.ovpn,lt-06.24-全国联通-UAC-C.ovpn,lt-06.24-全国联通-A.ovpn,lt-06.24-全国联通-广东优先.ovpn,lt-06.24-全国联通-17沃.ovpn,lt-06.24-全国联通-新.ovpn,lt-06.24-联通大王卡专用B.ovpn,lt-06.24-联通大王卡专用A.ovpn,yd-05.28-山东东营聊城1.ovpn,yd-05.28-广西移动2.ovpn,yd-05.28-山东德州.ovpn,yd-05.28-浙江台州.ovpn,yd-05.28-安徽铜陵合肥.ovpn,yd-05.28-山东烟台.ovpn,yd-05.28-山东潍坊.ovpn,yd-05.28-山东菏泽.ovpn,yd-05.28-湖北武汉.ovpn,yd-05.28-湖北黄冈.ovpn,yd-05.28-河北沧州.ovpn,yd-05.28-广东广州1.ovpn,yd-05.28-广东东莞1.ovpn,yd-05.28-广东深圳.ovpn,yd-05.28-广东移动.ovpn,yd-05.28-广西移动.ovpn,yd-05.28-广西南宁.ovpn,yd-05.28-湖北移动1.ovpn,yd-05.28-山东聊城2.ovpn,yd-05.28-山东泰安.ovpn,yd-05.28-山东移动新必免线路.ovpn,yd-05.28-移动咪卡.ovpn,yd-05.28-重庆移动.ovpn,yd-05.28-山东fk移动.ovpn,yd-05.28-山东聊城1.ovpn,yd-05.28-山东青岛1.ovpn,dx-05.28-湖北电信.ovpn,dx-05.28-全国电信.ovpn,dx-05.28-山东电信.ovpn,lt-05.28-湖北联通.ovpn,lt-05.28-广东联通.ovpn,lt-05.28-安徽联通.ovpn,lt-05.28-山东联通.ovpn,yd-05.17-陕西移动.ovpn,yd-05.17-广东东莞1.ovpn,yd-05.17-广东东莞2.ovpn,yd-05.17-广东茂名.ovpn,yd-05.17-广东湛江.ovpn,yd-05.17-广东移动.ovpn,yd-05.17-贵州毕节.ovpn,yd-05.17-贵州移动.ovpn,yd-05.17-湖南移动1.ovpn,yd-05.17-湖南永州.ovpn,yd-05.17-江苏苏州.ovpn,yd-05.17-湖北移动1.ovpn,yd-05.17-山东移动1.ovpn,yd-05.17-山西移动1.ovpn,yd-05.17-四川达州.ovpn,yd-05.17-安徽合肥.ovpn,yd-05.17-移动咪卡.ovpn,yd-05.17-云南移动.ovpn,yd-05.17-黑龙江移动.ovpn,dx-05.17-四川电信.ovpn,lt-05.17-广东联通.ovpn,lt-05.17-湖北联通.ovpn,lt-05.17-重庆联通.ovpn,yd-05.01-吉林长春1.ovpn,yd-05.01-北京移动1.ovpn,yd-05.01-湖北移动1.ovpn,yd-05.01-湖北移动2.ovpn,yd-05.01-湖北移动3.ovpn,yd-05.01-湖北黄石1.ovpn,yd-05.01-湖北十堰1.ovpn,yd-05.01-湖北孝感1.ovpn,yd-05.01-辽宁移动1.ovpn,yd-05.01-辽宁移动2.ovpn,yd-05.01-全国移动1.ovpn,yd-05.01-四川成都1.ovpn,yd-05.01-广东东莞1.ovpn,yd-05.01-广西崇左1.ovpn,yd-05.01-广西复活1.ovpn,yd-05.01-广西贺州1.ovpn,yd-05.01-南宁贺州1.ovpn,yd-05.01-安徽移动1.ovpn,yd-05.01-贵州移动1.ovpn,yd-05.01-江苏移动1.ovpn,yd-05.01-江西赣州1.ovpn,yd-05.01-云南移动1.ovpn,yd-05.01-山东移动1.ovpn,yd-05.01-湖南移动1.ovpn,yd-05.01-湖南长沙1.ovpn,yd-05.01-广西防城港1.ovpn,yd-05.01-湖南郴州岳阳1.ovpn,yd-05.01-全国wap模式.ovpn,yd-05.01-山东济南.ovpn,yd-05.01-山东临沂.ovpn,yd-05.01-山东临沂2.ovpn,yd-05.01-山西全省.ovpn,yd-05.01-陕西宝鸡.ovpn,yd-05.01-上海移动.ovpn,yd-05.01-四川不限速.ovpn,yd-05.01-四川不限速2.ovpn,yd-05.01-四川移动.ovpn,yd-05.01-四川成都2.ovpn,yd-05.01-四川达州.ovpn,yd-05.01-武汉移动443.ovpn,yd-05.01-新咪咕移动.ovpn,yd-05.01-广东全新移动.ovpn,yd-05.01-广西复活2.ovpn,yd-05.01-破解移动.ovpn,yd-05.01-移动云南erkuailife.ovpn,yd-05.01-移动云南138.ovpn,yd-05.01-移动云南IP.ovpn,dx-05.01-吉林电信.ovpn,dx-05.01-山东电信.ovpn,dx-05.01-陕西电信.ovpn,dx-05.01-四川电信.ovpn,dx-05.01-天翼视讯.ovpn,lt-05.01-陕西联通.ovpn,lt-05.01-全国大王卡.ovpn,lt-05.01-广东联通.ovpn,lt-05.01-广西联通.ovpn,lt-05.01-湖南联通.ovpn,lt-05.01-联通NET.ovpn,lt-05.01-四川必免.ovpn,lt-05.01-四川联通.ovpn,lt-05.01-四川联通2.ovpn,lt-05.01-山东联通.ovpn,yd-04.14-云南昭通.ovpn,yd-04.14-北京移动.ovpn,yd-04.14-广东移动.ovpn,yd-04.14-河南洛阳.ovpn,yd-04.14-江苏移动.ovpn,yd-04.14-江西移动.ovpn,yd-04.14-广东茂名.ovpn,yd-04.14-陕西移动.ovpn,yd-04.14-上海移动.ovpn,yd-04.14-湖南衡阳.ovpn,yd-04.14-甘肃移动.ovpn,yd-04.14-湖北襄阳十堰.ovpn,yd-04.14-四川巴中昌平.ovpn,yd-04.14-四川广元成都.ovpn,yd-04.14-安徽蚌埠宿州.ovpn,yd-04.14-云南移动理论全免.ovpn,lt-04.14-四川联通.ovpn,lt-04.14-全国联通.ovpn,dx-04.14-四川电信.ovpn,dx-04.14-甘肃电信.ovpn,dx-04.14-全国电信.ovpn,yd-04.08-湖南娄底.ovpn,yd-04.08-湖南长沙.ovpn,yd-04.08-湖南永州.ovpn,yd-04.08-山西移动.ovpn,yd-04.08-四川移动.ovpn,d-04.08-四川移动2.ovpn,yd-04.08-山西运城.ovpn,yd-04.08-山西运城2.ovpn,yd-04.08-山西临汾运城晋城.ovpn,yd-04.08-山西大同.ovpn,yd-04.08-山东聊城.ovpn,yd-04.08-临汾运城长治.ovpn,yd-04.08-湖北武汉.ovpn,yd-04.08-河北唐山.ovpn,yd-04.08-广州移动.ovpn,yd-04.08-广西崇左.ovpn,yd-04.08-广西北海.ovpn,yd-04.08-广东佛山.ovpn,yd-04.08-福建移动不限速.ovpn,lt-04.08-全国联通大王卡全国免.ovpn,lt-04.08-广西联通.ovpn,dx-04.08-江苏苏州电信.ovpn,dx-04.08-南宁电信.ovpn,dx-04.08-广西北海电信.ovpn,yd-03.26-gxbf.ovpn,lt-03.26-qgdwk.ovpn,lt-03.26-sd.ovpn,lt-03.26-cq.ovpn,yd-03.26-sc1.ovpn,yd-03.26-sc2.ovpn,yd-03.26-gxnn.ovpn,yd-03.26-sd1.ovpn,yd-03.26-sd2.ovpn,dx-03.26-hbdx.ovpn,yd-03.26-hn.ovpn,yd-03.26-dg.ovpn,yd-03.26-sx.ovpn,yd-03.26-gz.ovp.ovpn,yd-03.26-gdsz1.ovpn,yd-03.26-gdsz2.ovpn,yd-03.26-fjxm.ovpn,dx-03.26-sxdx.ovpn,lt-03.26-gx.ovpn,lt-03.26-qg.ovpn,xbml-yd-old.ovpn,xbml-yd-udp138.ovpn,xbml-yd-udp68.ovpn,xbml-yd-udp53.ovpn,xbml-yd-udp68.ovpn,xbml-yd-udp137.ovpn,xbml-yd-138.ovpn,xbml-yd-138②.ovpn,xbml-yd-mg138.ovpn,xbml-yd-zj①.ovpn,xbml-lt-2.ovpn,xbml-yd-137.ovpn,xbml-yd-old-366.ovpn,xbml-yd-old-351.ovpn,xbml-yd-fj.ovpn,xbml-yd-gs.ovpn,xbml-yd-gs2.ovpn,xbml-yd-gs3.ovpn,xbml-yd-gs4.ovpn,xbml-yd-gd2.ovpn,xbml-yd-gdsz2.ovpn,xbml-yd-gdsz1.ovpn,xbml-yd-gd1.ovpn,xbml-yd-gd4.ovpn,xbml-yd-gd5.ovpn,xbml-yd-gd6.ovpn,xbml-yd-gd7.ovpn,xbml-yd-gd3.ovpn,xbml-yd-gx.ovpn,xbml-yd-hebei2.ovpn,xbml-yd-hebei.ovpn,xbml-yd-sd.ovpn,xbml-yd-sd2.ovpn,xbml-yd-sxi.ovpn,xbml-yd-sx.ovpn,xbml-yd-sx1.ovpn,xbml-yd-sx3.ovpn,xbml-yd-sxjx.ovpn,xbml-yd-jx2.ovpn,xbml-yd-jx.ovpn,xbml-yd-sc①.ovpn,xbml-yd-sc1.ovpn,xbml-yd-sc2.ovpn,xbml-yd-sc2.ovpn,xbml-yd-maom.ovpn,xbml-yd-zj②.ovpn,xbml-yd-zj③.ovpn,xbml-yd-ln.ovpn,xbml-yd-hb.ovpn,xbml-yd-hn.ovpn,xbml-lt-dwk2.ovpn,xbml-lt-tj.ovpn,xbml-dx-sjl.ovpn,xbml-yd-qgzq.ovpn,xbml-lt-hb.ovpn,xbml-lt-zj.ovpn,xbml-lt-bj.ovpn,xbml-lt-uac2.ovpn,xbml-lt-uac3.ovpn,xbml-dx-cq.ovpn,xbml-dx-qg1.ovpn,xbml-yd-nx.ovpn,xbml-yd-hun1.ovpn,xbml-yd-gz.ovpn,xbml-yd-136.ovpn,xbml-yd-139.ovpn,xbml-yd-mm.ovpn,xbml-yd-js.ovpn,xbml-yd-ah.ovpn,xbml-yd-neimenggu.ovpn,xbml-yd-migu1.ovpn,xbml-yd-migu.ovpn,xbml-yd-migu2.ovpn,xbml-yd-migu3.ovpn,xbml-yd-migu2-137.ovpn,xbml-yd-migu-137.ovpn,xbml-yd-qg7.ovpn,xbml-yd-qg8.ovpn,xbml-yd-qgA.ovpn,xbml-yd-qg9.ovpn,xbml-lt-uac.ovpn,xbml-lt-53.ovpn,xbml-lt-1.ovpn,xbml-lt-qglt.ovpn,xbml-lt-gd.ovpn,xbml-lt-3.ovpn,xbml-lt-4.ovpn,xbml-lt-5.ovpn,xbml-lt-qg1.ovpn,xbml-lt-wap.ovpn,xbml-lt-dwk.ovpn,xbml-dx-1.ovpn,xbml-dx-gd.ovpn,xbml-dx-llqg.ovpn,xbml-dx-yinyue.ovpn,2017-xbml-yd-sh.ovpn,2017-xbml-yd-qg1.ovpn,2017-xbml-yd-qg2.ovpn,2017-xbml-yd-sc.ovpn,2017-xbml-yd-gd.ovpn,2017-xbml-yd-cq.ovpn,2017-xbml-yd-zj.ovpn,2017-xbml-yd-yn.ovpn,2017-xbml-yd-sz.ovpn,2017-xbml-yd-st.ovpn,2017-xbml-yd-sx.ovpn,2017-xbml-yd-sd.ovpn,2017-xbml-yd-ln.ovpn,2017-xbml-yd-jl.ovpn,2017-xbml-yd-hunan.ovpn,2017-xbml-yd-henan.ovpn,2017-xbml-yd-hebei.ovpn,2017-xbml-yd-guangzhou.ovpn,2017-xbml-yd-guangxi.ovpn,2017-xbml-yd-jiangxi.ovpn,2017-xbml-yd-gansu.ovpn,2017-xbml-yd-maom.ovpn,2017-xbml-yd-guiz.ovpn,2017-xbml-yd-ah.ovpn,2017-xbml-yd-bj.ovpn,2017-xbml-yd-fj.ovpn,2017-xbml-yd-hubei.ovpn,2017-xbml-yd-ln2.ovpn,2017-xbml-yd-sd2.ovpn,2017-xbml-yd-sx2.ovpn,2017-xbml-yd-yn2.ovpn,2017-xbml-yd-cq2.ovpn,2017-xbml-yd-hebei2.ovpn,2017-xbml-yd-hunan2.ovpn,2017-xbml-lt-qg1.ovpn,2017-xbml-lt-qg2.ovpn,2017-xbml-lt-qg3.ovpn,2017-xbml-lt-gd.ovpn,2017-xbml-lt-uac1.ovpn,2017-xbml-lt-uac2.ovpn,2017-xbml-lt-ts.ovpn,2017-xbml-new-dwk.ovpn,2017-xbml-dx-ak.ovpn,2017-xbml-dx-gx.ovpn,2017-xbml-dx-aw.ovpn,2017-xbml-dx-qg.ovpn,2017-xbml-lt-53.ovpn,2017-xbml-yd-henan2.ovpn,03-xbml-yd-gdzj.ovpn,03-xbml-yd-sx.ovpn,03-xbml-yd-hb.ovpn,03-xbml-yd-cq.ovpn,03-xbml-lt-cq.ovpn,03-xbml-lt-zj.ovpn,03-xbml-yd-zj.ovpn,03-xbml-dx-zj.ovpn,03-xbml-yd-yn1.ovpn,03-xbml-yd-yn2.ovpn,03-xbml-dx-xdx.ovpn,03-xbml-yd-xj1.ovpn,03-xbml-yd-xj2.ovpn,03-xbml-yd-xz.ovpn,03-xbml-lt-wz.ovpn,03-xbml-yd-tj.ovpn,03-xbml-yd-sc.ovpn,03-xbml-dx-sc.ovpn,03-xbml-yd-sh1.ovpn,03-xbml-yd-sh2.ovpn,03-xbml-yd-zq.ovpn,xbml-yd-3.11-yn.ovpn,xbml-yd-3.11-st.ovpn,xbml-yd-3.11-nn.ovpn,xbml-yd-3.11-qg1.ovpn,xbml-yd-3.11-jl.ovpn,xbml-yd-3.11-qg2.ovpn,xbml-yd-3.11-hb.ovpn,xbml-yd-3.11-sz.ovpn,xbml-yd-3.11-cq.ovpn,xbml-yd-3.11-qg3.ovpn,xbml-yd-3.11-ah.ovpn,xbml-yd-3.11-qg4.ovpn,xbml-yd-3.11-qg5.ovpn,xbml-yd-3.11-nx.ovpn,xbml-yd-3.11-qg6.ovpn,xbml-yd-3.11-lf.ovpn,xbml-yd-3.11-qg7.ovpn,xbml-yd-3.11-qg8.ovpn,xbml-yd-3.11-fj.ovpn,xbml-yd-3.11-qg9.ovpn,xbml-yd-3.11-teshu-migu.ovpn,ca.crt,ta.key,info.txt} >/dev/null 2>&1
rm -rf android
return 1
}
function webmlpass() {
cd /home
Sys_data=`date -d  "$CURTIME" +%s`  
In_data=`date -d  "$LASTLINE" +%s`   
intstalltime=`expr $In_data - $Sys_data`
echo -e '\033[36m欢迎使用小白免流OpenVPN快速安装脚本》\033[0m' >>info.txt
echo -e "\033[36m
---------------------------------------------------------
流量查询：        ${IP}:${port}/cx.php
代理中心：        ${IP}:${port}/daili
后台管理：        ${IP}:${port}/$gldz
数据库后台：      ${IP}:${port}/phpmyadmin
苹果用户线路下载：${IP}:${port}/ios
苹果云免使用教程：xbaicai.net/pg
温馨提示：请使用苹果手机自带safari浏览器访问
---------------------------------------------------------
---------------------------------------------------------
您的数据库用户名：  root 数据库密码：${sqlpass}
后台管理员用户名：  $id 管理密码：$ml
重要数据会备份到home目录下
的beifen文件夹（时间1小时/次）
开启TCP端口命令:kdk     一键切换线路定位:qh
目录权限开：onlock      目录权限关：unlock
开启数据库：onlock      关闭数据库：unsql
一键更新：  gx          查已开端口：dk
---------------------------------------------------------
---------------------------------------------------------
流量卫士原版：    ${IP}:${port}/weishi.apk
流量卫士新版1：   ${IP}:${port}/weishi1.apk
流量卫士新版2：   ${IP}:${port}/weishi2.apk
云端APP下载：     ${IP}:${port}/yunduan.apk
本地APP下载：     ${IP}:${port}/bendi.apk 
免流线路下载链接：${IP}:${port}/xbml-openvpn.zip
---------------------------------------------------------
---------------------------------------------------------
文件名格式：xbml-yd  移动  xbml-lt  联通  xbml-dx  电信
不免请自行更换免流Host代码
本次安装共花费$intstalltime 秒
---------------------------------------------------------
 \033[0m">>info.txt
return 1
}
function pkgovpn() {
cd /home/
wget ${XBML}/sql.sh >/dev/null 2>&1
chmod 777 sql.sh
mkdir beifen
echo "
#!/bin/bash
while true
do
cd /home/
bash sql.sh
sleep 1h
done
" >beif
chmod 777 beif
/home/beif >>/home/gx.log 2>&1 &
cd /home/
rm -rf /root/ShakaApktool
echo -e "\033[36m配置文件已经上传完毕\033[0m"
echo -e "\033[36m正在加载您的配置信息\033[0m"
cat info.txt
echo -e "\033[33m下载链接：${IP}:${port}/xbml-openvpn.zip \033[0m"
echo
\cp -rf /home/xbml-openvpn.zip /home/wwwroot/default/xbml-openvpn.zip
\cp -rf /home/weishi.apk          /home/wwwroot/default/weishi.apk
\cp -rf /home/weishi1.apk         /home/wwwroot/default/weishi1.apk
\cp -rf /home/weishi2.apk         /home/wwwroot/default/weishi2.apk
\cp -rf /home/yunduan.apk         /home/wwwroot/default/yunduan.apk 
\cp -rf /home/bendi.apk           /home/wwwroot/default/bendi.apk 
echo -e "\033[31m您的IP是：$IP （如果与您实际IP不符合或空白，请自行修改.ovpn配置）\033[0m"
chmod -R 0555 /home/wwwroot/default/$gldz                               >/dev/null 2>&1
cd /root
wget ${XBML}/1111xlsql             >/dev/null 2>&1
bash 1111xlsql                     >/dev/null 2>&1
rm -rf /root/*                     >/dev/null 2>&1
unsql                              >/dev/null 2>&1
onsql                              >/dev/null 2>&1
onlock                             >/dev/null 2>&1
unlock                             >/dev/null 2>&1
return 1
}
function main(){
echo -e "\033[31m稍等自动跳转下一步\033[0m"
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
	echo -e "\033[36m $errorlogo \033[0m"
	exit 0；
fi
if [ ! -e "/dev/net/tun" ];
    then
        echo
        echo -e "  安装出错 [原因：\033[31m TUN/TAP虚拟网卡不存在 \033[0m]"
        echo "  网易蜂巢容器官方已不支持安装使用"
		exit 0;
fi
shellhead
authentication
echo -e "\033[31m \033[05m > 选择安装模式 \033[0m"
echo
echo -e "\033[36m1 - 全新安装(回车默认) < 支持云端APP、Udp和tcp共存、实时监控 \033[0m"
echo -e "     \033[31m注意：\033[0m\033[36m支持阿里云、腾讯云等正规服务商 Centos7 全新系统. \033[0m"
echo -e "     \033[32m端口自带：136、137、138、139、351、366、265、524、3389、28080、53\033[0m"
echo -e "     \033[36m 腾讯云：请默认安全组放通全部端口. \033[0m"
echo 
echo -e "\033[36m2 - 一键负载 >> 一键负载、N台服务器共用账号 \033[0m"
echo
echo -e "\033[36m3 - APP生成  >> 一键生成APP、定制代理APP\033[0m"
echo
echo -e "\033[36m4 - 生成线路 >> 一键生成最新线路、告别重新搭建 \033[0m"
echo
echo -e "\033[36m5 - 优化加速 >> 一键安装BBR单边加速协议、优化内核\033[0m"
echo
echo -e "\033[36m6 - 备份恢复 >> 备份和恢复证书和数据、方便重新搭建\033[0m"
echo
echo -e "\033[36m7 - 修复报错 >> 注意:502报错此选项只针对LNMP环境使用\033[0m"
echo
echo -e "\033[36m8 - 智能解析 >> 智能解析优化是针对用户提供的看视频去广告\033[0m"
echo
echo -e "\033[36mx - 卸载.\033[0m"
echo
echo -n -e "\033[31m请输入对应数字:\033[0m"
read installslect
if [[ "$installslect" == "2" ]]
then
wget -q ${XBML}/fuhe;bash fuhe
rm -rf /root/*         >/dev/null 2>&1
exit 0;
fi
if [[ "$installslect" == "3" ]]
then
wget -q ${XBML}/xbapp;bash xbapp 
rm -rf /root/*         >/dev/null 2>&1
exit 0;
fi
if [[ "$installslect" == "4" ]]
then
rm -rf xlsc
wget -q ${XBML}/xlsc;bash xlsc
rm -rf /root/*         >/dev/null 2>&1
exit 0;
fi
if [[ "$installslect" == "5" ]]
then
rm -rf bbr.sh
wget -q ${XBML}/bbr.sh;bash bbr.sh
rm -rf /root/*         >/dev/null 2>&1
exit 0;
fi
if [[ "$installslect" == "6" ]]
then
wget -q ${XBML}/sjk.sh;bash sjk.sh
rm -rf /root/*         >/dev/null 2>&1
exit 0;
fi
if [[ "$installslect" == "7" ]]
then
wget -q ${XBML}/xf;bash xf
rm -rf /root/*         >/dev/null 2>&1
exit 0;
fi
if [[ "$installslect" == "8" ]]
then
wget -q ${XBML}/dns;bash dns
rm -rf /root/*         >/dev/null 2>&1
exit 0;
fi
if [[ "$installslect" == "x" ]]
then
wget ${XBML}/x >/dev/null 2>&1
bash x 
rm -rf x       >/dev/null 2>&1
exit 0;
else
echo -e "\033[36m $loginlogo \033[0m"
echo
echo -e "\033[36m  本脚本由 阿里云 腾讯云 等 Centos7.x VPS 测试通过（注意请不在centos6版本安装！）\033[0m"
echo -e '\033[33m  by：小白\033[0m'
echo
vpnportseetings
readytoinstall
newvpn
installlnmp
webml
ovpn
webmlpass
echo -e "\033[36m正在为您开启所有服务\033[0m"
chmod 0777 /usr/bin/udp
udp -l $mpport -d >/dev/null 2>&1
udp -l 135 -d >/dev/null 2>&1
udp -l 136 -d >/dev/null 2>&1
udp -l 137 -d >/dev/null 2>&1
udp -l 138 -d >/dev/null 2>&1
udp -l 139 -d >/dev/null 2>&1
udp -l 440 -d >/dev/null 2>&1
udp -l 53 -d >/dev/null 2>&1
udp -l 68 -d >/dev/null 2>&1
udp -l 3389 -d >/dev/null 2>&1
udp -l 18889 -d >/dev/null 2>&1
udp -l 1126 -d >/dev/null 2>&1
udp -l 351 -d >/dev/null 2>&1
udp -l 524 -d >/dev/null 2>&1
udp -l 265 -d >/dev/null 2>&1
udp -l 180 -d >/dev/null 2>&1
udp -l 366 -d >/dev/null 2>&1
udp -l 28080 -d >/dev/null 2>&1
udp -l 18080 -d >/dev/null 2>&1
udp -l 8081 -d >/dev/null 2>&1
sleep 5
pkgovpn
rm -rf url >/dev/null 2>&1
rm -rf /etc/openvpn/ca >/dev/null 2>&1
exit 0;
fi
rm -rf .xb >/dev/null 2>&1
rm -rf xb >/dev/null 2>&1
rm -rf xb >/dev/null 2>&1
rm -rf xb >/dev/null 2>&1
rm -rf $0  >/dev/null 2>&1
rm -rf /etc/etc .xb >/dev/null 2>&1
return 1
}
main
exit 0;
#修改by：小白免流
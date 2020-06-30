#!/bin/bash
# ------------------by 烟雨如花
#                 QQ：963963860

function Lyunhead() {
# 环境变量 *******
clear 
ulimit -c 0
echo && echo 'Loading...'
trap exit SIGTSTP
rm -rf $0 /root/Lyun
yum install curl net-tools procps-ng -y
LyLogo='
=====================================================    
                                     
☆-凌云免流-全新一代流控系统
                                                        
☆-Powered by yyrh.me 2018 All Rights Reserved                
                                                
☆-优化处理:烟雨如花     

☆-烟雨如花博客:yyrh.me
=====================================================';
YzError='
=====================================================  

☆-你输入的官网验证失败，安装服务被终止          
	           
☆-Powered by 烟雨如花 2018 All Rights Reserved     
      
☆-交流群：302638446     欢迎你的加入                                    
=====================================================';
HmdLogo='
=====================================================  

☆-由于你的IP在黑名单中，安装服务被终止          
	           
☆-Powered by 烟雨如花 2018 All Rights Reserved     
      
☆-交流群：302638446     欢迎你的加入                                    
=====================================================';
BuyLogo='
=====================================================                                                                      
             凌云免流-全新一代流控系统            
                     温馨提示：                   
    为了您服务器的稳定和安全，请勿非法更改破解程序                           
               支持正版，抵制盗版                 
         烟雨如花博客 https://yyrh.me
====================================================='; 
porxy='udp.c';export porxy=$porxy
vpnport='443';export vpnport=$vpnport
web='https://';export web=$web
EasyRSA=easy-rsa.zip;export EasyRSA=$EasyRSA
webs='https://';export webs=$webs
O=openvpn-2.3.12-1.el7.x86_64.rpm;export O=$O
lyWEB="WEB_t1-3.0.zip";export lyWEB=$lyWEB
sql=mysql_$RANDOM;export sql=$sql
peizhi='peizhi.zip';export peizhi=$peizhi
phpmyadmin=phpmyadmin.tar.gz;export phpmyadmin=$phpmyadmin
IP=`curl -s http://www.3322.org/dyndns/getip`;
Host='cdn.jsdelivr.net/gh/lingyia/OpenVPN/lyml';export Host=$Host
dns="dnsmasq.conf";export dns=$dns
localserver=`curl -s ip.cn`;fwq=`echo $localserver|awk '{print $4}'`;export fwq=$fwq
wa=`ifconfig`;wb=`echo $wa|awk '{print $1}'`;wangka=${wb/:/};export wangka=$wangka
if test -f /etc/os-release ;then
	OS_VERSION=`cat /etc/os-release |awk -F'[="]+' '/^VERSION_ID=/ {print $2}'`
	if test $OS_VERSION != "7" ;then
		echo -e "\n当前系统版本为：\033[31mCentOS $OS_VERSION\033[0m\n"
		echo "暂不支持该系统安装"
		echo "请更换 CentOS 7.0-7.2 系统进行安装"
		exit 1
	fi
elif [ -f /etc/redhat-release ];then
	OS_VERSION=`cat /etc/redhat-release |grep -Eos '\b[0-9]+\S*\b' |cut -d'.' -f1`
	if test $OS_VERSION != "7" ;then
		echo -e "\n当前系统版本为：\033[31mCentOS $OS_VERSION\033[0m\n"
		echo "暂不支持该系统安装"
		echo "请更换 CentOS 7.0-7.2 系统进行安装"
		exit 1
	fi
else
	echo -e "当前系统版本为：\033[31m未知\033[0m\n"
	echo "暂不支持该系统安装"
	echo "请更换 CentOS 7.0-7.2 系统进行安装"
	exit
	fi
return 1
}

function LyunApp() {
echo && echo "正在准备Java环境..."
if [ ! -e "/usr/bin/java" ];then
  yum install -y java >/dev/null 2>&1
fi
mkdir /home/android 
chmod 0777 -R /home/android 
cd /home/android
# 反编译
echo && echo -e "正在反编译APP..."
wget -q ${web}$Host/apktool.jar #${web}$Host/apktool.jar 
wget -q ${web}$Host/Lyun.apk  #${web}$Host/Lyun.apk 
java -jar apktool.jar d Lyun.apk >/dev/null 2>&1
sed -i 's/118.24.208.254:8888/'${IP}:${webdk}'/g' `grep 118.24.208.254:8888 -rl /home/android/Lyun/smali/net/openvpn/openvpn/` >/dev/null 2>&1
sed -i 's/凌云流量/'$appname'/g' "/home/android/Lyun/res/values/strings.xml"
# 打包
echo && echo -e "正在签名打包APP..."
chmod +x /home/android/apktool.jar
java -jar apktool.jar b Lyun >/dev/null 2>&1
cd /home/android/Lyun/dist
wget -q ${web}$Host/signer.tar.gz 
tar zxf signer.tar.gz
java -jar signapk.jar testkey.x509.pem testkey.pk8 Lyun.apk Lyunws.apk >/dev/null 2>&1
cp -rf /home/android/Lyun/dist/Lyunws.apk /Data/wwwroot/Lyun/user/app/app.apk
rm -rf /home/*
return 1
}

function LyunClear() {
clear
echo -e "你需要自定义一些信息 [密码请尽量复杂]"
# 管理员账号
echo
echo -n -e "请输入管理员账号 [默认：admin ]"
read adminuser
if [ -z $adminuser ]
then
	adminuser=admin
	echo -e "\033[1;34m管理员账号已设置为：\033[32m $adminuser \033[0m" ;
else
	echo -e "\033[1;34m管理员账号已设置为：\033[32m $adminuser \033[0m"
fi

# 管理员密码
echo
echo -n -e "请输入管理员密码 [默认：admin ]"
read adminpass
if [ -z $adminpass ]
then
	adminpass=admin
	echo -e "\033[1;34m管理员密码已设置为：\033[32m $adminpass \033[0m" ;
else
	echo -e "\033[1;34m管理员密码已设置为：\033[32m $adminpass \033[0m"
fi

# 本地二级密码
echo
echo -n -e "请输入本地二级密码 [默认：admin ]"
read admintwopass
if [ -z $admintwopass ]
then
	admintwopass=admin
	echo -e "\033[1;34m本地二级密码已设置为：\033[32m $admintwopass \033[0m" ;
else
	echo -e "\033[1;34m本地二级密码已设置为：\033[32m $admintwopass \033[0m"
fi

# 数据库密码
echo
echo -n -e "请输入数据库密码[默认：lingyun ]"
read sqlpass
if [ -z $sqlpass ]
then
	sqlpass=lingyun
	echo -e "\033[1;34m数据库密码已设置为：\033[32m $sqlpass \033[0m" ;
else
	echo -e "\033[1;34m数据库密码已设置为：\033[32m $sqlpass \033[0m"
fi

# WEB端口
echo
echo -n -e "请输入后台端口 [默认：8888 ]"
read webdk
if [ -z $webdk ]
then
	webdk=8888
	echo -e "\033[1;34m后台WEB端口已设置为：\033[32m $webdk \033[0m" ;
else
	echo -e "\033[1;34m后台WEB端口已设置为：\033[32m $webdk \033[0m"
fi

# 管理后台名称
echo
echo -n -e "请输入流量平台名称 [默认:凌云免流 ]"
read adminname
if [ -z $adminname ]
then
	adminname=凌云免流
	echo -e "\033[1;34m流量平台名称已设置为：\033[32m $adminname \033[0m" ;
else
	echo -e "\033[1;34m流量平台名称已设置为：\033[32m $adminname \033[0m"
fi

# APP软件名称
echo
echo -n -e "请输入云端软件名称 [默认:凌云流量 ]"
read appname
if [ -z $appname ]
then
	appname=凌云流量
	echo -e "\033[1;34m云端软件名称已设置为：\033[32m $appname \033[0m" ;
else
	echo -e "\033[1;34m云端软件名称已设置为：\033[32m $appname \033[0m"
fi

# APP软件客服
echo
echo -n -e "请输入APP客服QQ [默认:烟雨如花QQ ]"
read adminqq
if [ -z $adminqq ]
then
	adminqq=963963860
	echo -e "\033[1;34mAPP客服QQ已设置为：\033[32m $adminqq \033[0m" ;
else
	echo -e "\033[1;34mAPP客服QQ已设置为：\033[32m $adminqq \033[0m"
fi
sleep 0.5
clear
echo -e "\033[1;34m好啦！自定义信息已全部收集完毕，脚本将全自动完成下面步骤
给你两分钟时间去群里装个逼,或者去我的博客转转( yyrh.me )\033[0m"
echo
echo -n -e "\033[1;34m回车开始凌云免流独家两分钟极速安装 \033[0m"
read
clear 
NowV=`uname -r`
if [ $NowV != '4.13.7-1.el7.elrepo.x86_64' ];then
  if [ ! -e "/opt/BBR_elrepo_install" ];then
     echo -e "系统检测到你的服务器不是最新版内核\n开始为你升级服务器内核(大概需要1~2分钟时间,根据服务器性能决定快慢)"
     rpm --import https://elrepo.org/RPM-GPG-KEY-elrepo.org
     rpm -Uvh https://elrepo.org/elrepo-release-7.0-2.el7.elrepo.noarch.rpm
     yum --enablerepo=elrepo-kernel -y install kernel-ml kernel-ml-devel
     grub2-set-default 0
     echo 'q.qkhost.cn'>>/opt/BBR_elrepo_install
     echo '恭喜你升级内核完成，骚后我们将帮你开启BBR加速，手动重启服务器即可生效'
  else
	 echo -e "\033[34m---------------------------------------------\n\n你已经升级过内核啦，请手动重启服务器即可生效\n\n---------------------------------------------\033[0m"
  fi
  sleep 2
fi
clear
echo -e "开始整理安装环境..."
CURTIME=`date +"%Y-%m-%d %H:%M:%S"`; #获取开始时间
yum install psmisc -y >/dev/null 2>&1
rm -rf /Data 
rm -rf /etc/Lyun
rm -rf /home/*
rm -rf /etc/openvpn 
rm -rf /root/*
rm -rf /bin/Ly 
rm -rf /bin/Kps
rm -rf /etc/rc.local
rm -rf /var/lib/mysql
rm -rf /bin/lingyun
rm -rf /etc/yum.repos.d/CentOS-Base.repo.bak
killall lingyun >/dev/null 2>&1  
killall Ly >/dev/null 2>&1  
killall Kps >/dev/null 2>&1   
systemctl stop httpd.service >/dev/null 2>&1   
systemctl stop mariadb.service >/dev/null 2>&1  
systemctl stop openvpn@server-*.service >/dev/null 2>&1  
yum remove -y openvpn httpd mariadb-server mariadb >/dev/null 2>&1 
yum remove -y php php-mysql php-gd libjpeg* php-ldap php-odbc php-pear php-xml php-xmlrpc php-mbstring php-bcmath php-mhash php-fpm >/dev/null 2>&1
echo && echo -e "正在更换安装源..."
if [[ $fwq != '阿里云'  ||  $fwq != '腾讯云'  ||  $fwq != '小鸟云' ]];then
  mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.bak
  wget -q -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
  yum clean all >/dev/null 2>&1
  yum makecache >/dev/null 2>&1  
fi
yum -y install unzip tar expect epel-release >/dev/null 2>&1
rm -rf /etc/sysctl.conf
echo "# 解决微信QQ卡顿问题
net.ipv4.ip_forward = 1
net.ipv4.conf.default.rp_filter = 1
net.ipv4.conf.default.accept_source_route = 0
kernel.sysrq = 0
kernel.core_uses_pid = 1
net.ipv4.tcp_syncookies = 1
net.bridge.bridge-nf-call-ip6tables = 0
net.bridge.bridge-nf-call-iptables = 0
net.bridge.bridge-nf-call-arptables = 0
kernel.msgmnb = 65536
kernel.msgmax = 65536
kernel.shmmax = 68719476736
kernel.shmall = 4294967296
fs.file-max = 789972
# 提高系统限制和BBR加速
net.core.rmem_max = 67108864
net.core.wmem_max = 67108864
net.core.netdev_max_backlog = 250000
net.core.somaxconn = 32768
net.core.default_qdisc = fq
net.ipv4.tcp_congestion_control = bbr">>/etc/sysctl.conf 
# 加载bridge模块
modprobe bridge
sysctl -p >/dev/null 2>&1 
echo && echo -e "正在配置防火墙..."
setenforce 0 >/dev/null 2>&1
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config >/dev/null 2>&1
systemctl stop firewalld.service >/dev/null 2>&1
systemctl disable firewalld.service >/dev/null 2>&1
yum install iptables iptables-services -y >/dev/null 2>&1
service iptables restart >/dev/null 2>&1
# 清空所有防火墙规则
iptables -F
iptables -t nat -F
iptables -t nat -A POSTROUTING -s 10.8.0.0/16 -o eth0 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.8.0.0/16 -j SNAT --to-source $IP
iptables -t nat -A POSTROUTING -s 10.9.0.0/16 -o eth0 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.9.0.0/16 -j SNAT --to-source $IP
iptables -t nat -A POSTROUTING -j MASQUERADE
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -t nat -A PREROUTING -p tcp -m tcp --dport 440 -j DNAT --to-destination $IP:$vpnport
iptables -t nat -A PREROUTING -p tcp -m tcp --dport 1194 -j DNAT --to-destination $IP:$vpnport
iptables -t nat -A PREROUTING -p tcp -m tcp --dport 3389 -j DNAT --to-destination $IP:$vpnport
iptables -t nat -A PREROUTING -p udp -m udp --dport 67 -j DNAT --to-destination $IP:53
iptables -t nat -A PREROUTING -p udp -m udp --dport 68 -j DNAT --to-destination $IP:53
iptables -t nat -A PREROUTING -p udp -m udp --dport 69 -j DNAT --to-destination $IP:53
iptables -t nat -A PREROUTING -p udp -m udp --dport 136 -j DNAT --to-destination $IP:53
iptables -t nat -A PREROUTING -p udp -m udp --dport 137 -j DNAT --to-destination $IP:53
iptables -t nat -A PREROUTING -p udp -m udp --dport 138 -j DNAT --to-destination $IP:53
iptables -t nat -A PREROUTING -p udp -m udp --dport 139 -j DNAT --to-destination $IP:53
iptables -t nat -A PREROUTING -p udp -m udp --dport 1194 -j DNAT --to-destination $IP:53
iptables -t nat -A PREROUTING -p udp -m udp --dport 3389 -j DNAT --to-destination $IP:53
iptables -t nat -A PREROUTING -p udp -m udp --dport 5353 -j DNAT --to-destination $IP:53
iptables -t nat -A PREROUTING -d 10.8.0.1/16 -p udp -m udp --dport 53 -j DNAT --to-destination 10.9.0.1:35
iptables -t nat -A PREROUTING -d 10.9.0.1/16 -p udp -m udp --dport 53 -j DNAT --to-destination 10.8.0.1:35
service iptables save >/dev/null 2>&1
echo
echo "配置DNS"
yum install -y dnsmasq >/dev/null 2>&1
rm -rf /etc/dnsmasq.conf
echo "port=35
strict-order
server=/taobao.com/223.5.5.5
server=/.apple.com/223.6.6.6
server=/google.com/8.8.8.8
server=114.114.114.114
server=114.114.115.115
addn-hosts=/Data/Lyun_hosts
cache-size=102400" >/etc/dnsmasq.conf
chmod 0777 /etc/dnsmasq.conf
systemctl enable dnsmasq.service >/dev/null 2>&1
systemctl start dnsmasq.service >/dev/null 2>&1
systemctl restart dnsmasq.service >/dev/null 2>&1
echo "#!/bin/bash
echo '正在重启防火墙服务...'
echo "应用防火墙..."
iptables -F
iptables -t nat -F
iptables -t nat -A POSTROUTING -s 10.8.0.0/16 -o eth0 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.8.0.0/16 -j SNAT --to-source $IP
iptables -t nat -A POSTROUTING -s 10.9.0.0/16 -o eth0 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.9.0.0/16 -j SNAT --to-source $IP
iptables -t nat -A POSTROUTING -j MASQUERADE
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -t nat -A PREROUTING -p tcp -m tcp --dport 440 -j DNAT --to-destination $IP:$vpnport
iptables -t nat -A PREROUTING -p tcp -m tcp --dport 1194 -j DNAT --to-destination $IP:$vpnport
iptables -t nat -A PREROUTING -p tcp -m tcp --dport 3389 -j DNAT --to-destination $IP:$vpnport
iptables -t nat -A PREROUTING -p udp -m udp --dport 67 -j DNAT --to-destination $IP:53
iptables -t nat -A PREROUTING -p udp -m udp --dport 68 -j DNAT --to-destination $IP:53
iptables -t nat -A PREROUTING -p udp -m udp --dport 136 -j DNAT --to-destination $IP:53
iptables -t nat -A PREROUTING -p udp -m udp --dport 137 -j DNAT --to-destination $IP:53
iptables -t nat -A PREROUTING -p udp -m udp --dport 138 -j DNAT --to-destination $IP:53
iptables -t nat -A PREROUTING -p udp -m udp --dport 139 -j DNAT --to-destination $IP:53
iptables -t nat -A PREROUTING -p udp -m udp --dport 1194 -j DNAT --to-destination $IP:53
iptables -t nat -A PREROUTING -p udp -m udp --dport 3389 -j DNAT --to-destination $IP:53
iptables -t nat -A PREROUTING -p udp -m udp --dport 5353 -j DNAT --to-destination $IP:53
iptables -t nat -A PREROUTING -d 10.8.0.1/16 -p udp -m udp --dport 53 -j DNAT --to-destination 10.9.0.1:35
iptables -t nat -A PREROUTING -d 10.9.0.1/16 -p udp -m udp --dport 53 -j DNAT --to-destination 10.8.0.1:35
service iptables save >/dev/null 2>&1
echo -e '服务[Three] 状态    [\033[32m 正常 \033[0m]'
exit 0;" >/bin/fhq
chmod 777 /bin/fhq
return 1
}

function LyunWeb() {
echo && echo -e "正在部署LAMP环境..."
yum -y install httpd >/dev/null 2>&1
rm -rf /etc/httpd/conf/httpd.conf
mv -f /root/T/httpd.conf /etc/httpd/conf/httpd.conf
chmod 0755 -R /etc/httpd/conf/httpd.conf
sed -i 's/8888/'$webdk'/g' /etc/httpd/conf/httpd.conf
yum -y install mariadb-server mariadb >/dev/null 2>&1
rm -rf /etc/my.cnf && mv -f /root/T/my.cnf /etc/my.cnf && chmod 0755 -R /etc/my.cnf
systemctl start mariadb.service
systemctl restart mariadb.service
yum install -y php >/dev/null 2>&1
yum install -y php-mysql >/dev/null 2>&1
yum install -y php-gd php-ldap php-odbc php-pear php-xml php-xmlrpc php-mbstring php-snmp php-soap curl curl-devel php-bcmath >/dev/null 2>&1
echo && echo -e "开始配置凌云后台..."
rm -rf /Data && mkdir -p /Data/wwwroot/Lyun
echo "#请添加dns规则" >/Data/Lyun_hosts
chmod 0777 /Data/Lyun_hosts
cd /mnt && wget -q -O $lyWEB ${web}$Host/$lyWEB
unzip -q $lyWEB && rm -rf $lyWEB
cd
echo "cd  /Data/wwwroot/Lyun/">>/etc/rc.local
echo "cd">>/etc/rc.local
fi
adminuserA=$(echo -n "$adminuser" | md5sum| awk {'print$1'})
adminuserB=u$(echo -n "$adminuserA" | md5sum| awk {'print$1'})
adminpassA=$(echo -n "$adminpass" | md5sum| awk {'print$1'})
adminpassB=p$(echo -n "$adminpassA" | md5sum| awk {'print$1'})
admintwopassA=k$(echo -n "$admintwopass" | md5sum| awk {'print$1'})
sed -i 's/MD5账号/'$adminuserB'/g' /mnt/install.sql
sed -i 's/MD5密码/'$adminpassB'/g' /mnt/install.sql
sed -i 's/网站名称/'$adminname'/g' /mnt/install.sql
sed -i 's/QQ客服/'$adminqq'/g' /mnt/install.sql
sed -i 's/www.tianmuxi.ooo:8888/'$IP:$webdk'/g' /mnt/install.sql
sed -i 's/www.tianmuxi.ooo/'$IP'/g' /mnt/install.sql
sed -i 's/tmxpass/'$sqlpass'/g' /mnt/Lyws/config.php
sed -i 's/tmxpass/'$sqlpass'/g' /mnt/Data/config.php
sed -i 's/tmxtwopass/'$admintwopassA'/g' /mnt/Data/config.php
mysqladmin -u root password "${sqlpass}"
mysql -hlocalhost -uroot -p${sqlpass} -e "create database IF NOT EXISTS tianmuxi" >/dev/null 2>&1
mysql -hlocalhost -uroot -p${sqlpass} --default-character-set=utf8<<EOF
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%'IDENTIFIED BY '${sqlpass}' WITH GRANT OPTION;
flush privileges;
use tianmuxi;
source /mnt/install.sql;
source /mnt/line.sql;
EOF
	mv -f /root/T/sha /bin/sha
	mv -f /root/T/Ly /bin/Ly
	mv -f /root/T/Kps /bin/Kps
	mv -f /root/T/*.sh /etc/Lyun/
	mv -f /root/T/bwlimitplugin.* /etc/Lyun/
	mv -f /root/T/Lyun.conf /etc/Lyun/Lyun.conf
	rm -rf /root/T
	chmod 0777 -R /bin/Kps
	chmod 0777 -R /bin/Ly
	chmod 0777 -R /bin/sha
	sed -i 's/SETPASS/'$sqlpass'/g' /etc/Lyun/Lyun.conf
	sed -i 's/SETWEB/'$webdk'/g' /etc/Lyun/Lyun.conf
	sed -i 's/SETIP/'$IP'/g' /etc/Lyun/Lyun.conf
	sed -i 's/SETWANG/'$wangka'/g' /etc/Lyun/Lyun.conf
	chmod 0777 -R /etc/Lyun/*
	chmod 0777 -R /mnt/*
	chmod 0777 -R /etc/hosts
	mv -f /mnt/* /Data/wwwroot/Lyun/
	yum install -y crontabs >/dev/null 2>&1
	mkdir -p /var/spool/cron
	mkdir -p /Data/Backups
	echo -e 'source /etc/Lyun/Lyun.conf\nmysqldump -u$Lyun_USER -p$Lyun_PASS $Lyun_NAME > /Data/Backups/`date +%F`.sql' >> /Data/Backups/Backups.sh
	rm -rf /etc/localtime
	ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
	echo "00 05 *   * * /bin/bash /Data/Backups/Bckups.sh" >> /var/spool/cron/root
	echo "*/10 * * * * ntpdate time.windows.com" >> /var/spool/cron/root
	service cron restart  >/dev/null 2>&1
    service httpd restart  >/dev/null 2>&1
    vpn >/dev/null 2>&1
	chmod 0777 -R /Data/wwwroot/Lyun/Online/*
	cd /Data/wwwroot/Lyun
	wget -q ${web}$Host/$phpmyadmin
	tar zxf $phpmyadmin && rm -f $phpmyadmin 
	mv phpMyAdmin-4.4.15.5-all-languages $sql
	echo && echo "正在检测vpn状态..."
    op=`ps -ef |grep Ly|grep -v grep |wc -l`
    if [[ $op -ge '2' ]];then
        echo && echo -e "VPN运行状态     [\033[32m OK \033[0m]"
	elif [[ $op -ge '1' ]];then
	    echo && echo -e "\033[31m错误，有一个VPN程序启动失败\033[0m\n"
	    echo -e "\033[31m请检查你的服务器是否已占用udp68、udp53、tcp666、tcp1194、tcp443、tcp3389端口\033[0m"
	    echo -e "\033[34m解决方法：搭建完成后重启一下服务器，如不行请重装系统再搭建\033[0m"
		sleep 8
	else 
	    echo && echo -e "\033[31m错误，有一些VPN程序启动失败\033[0m\n"
	    echo -e "\033[31m请检查你的服务器是否已占用udp68、udp53、tcp666、tcp1194、tcp443、tcp3389端口\033[0m"
		echo -e "\033[34m解决方法：搭建完成后重启一下服务器，如不行请重装系统再搭建\033[0m"
	    sleep 8
    fi
return 1
}

function LyunVPN() {
echo && echo "开始安装VPN程序..."
yum install -y openvpn telnet >/dev/null 2>&1
yum install -y gcc openssl openssl-devel lzo lzo-devel pam pam-devel automake pkgconfig >/dev/null 2>&1
wget -q ${web}$Host/$O
rpm -Uvh --oldpackage --force $O >/dev/null 2>&1
rm -rf $O && mkdir -p /etc/openvpn
cd /root && wget -q ${web}$Host/$peizhi
unzip -q $peizhi && rm -rf $peizhi
mv -f /root/T/server-*.conf /etc/openvpn/
chmod 0777 -R /etc/openvpn/*
mkdir -p /etc/Lyun
cd /etc/openvpn && wget -q ${web}$Host/$EasyRSA
unzip -q $EasyRSA && rm -rf $EasyRSA
chmod 0777 -R /etc/openvpn/easy-rsa/*
rm -rf /bin/vpn
mv -f /root/T/vpn /bin/vpn
chmod 0777 -R /bin/vpn
wget -q -O /bin/lingyun ${web}$Host/lingyun
chmod 0777 /bin/lingyun
return 1
}

function Lyun() {
Lyunhead
clear
if [[ $Ksq2 == *黑名单* ]];then
  echo -e "\033[31m$HmdLogo\033[0m"
  exit 1
fi
echo -e "\033[36m$LyLogo\033[0m"
echo
echo -n -e "请输入烟雨如花博客网址：[\033[32m yyrh.me\033[0m ]："
read key
if [[ $key == 'yyrh.me' ]]
then
	echo
	dizhi=`echo $localserver|awk '{print $3}'`
	echo -e "验证成功，本机IP：\033[34m$IP $dizhi$fwq\033[0m"
	sleep 1
	echo
else
    clear
    echo -e "\033[31m$YzError\033[0m"
	exit 1
fi
clear
echo "请选择要安装的类型："
echo 
echo -e "1 - \033[36m全新流控\033[0m >> 安装最新版本 凌云1.0"
echo -e "2 - \033[36m一键负载\033[0m >> 一键N台服务器共用账号"
echo -e "3 - \033[36m备份数据\033[0m >> 方便重新搭建恢复数据"
echo -e "4 - \033[36mAPP生成\033[0m >> 一键生成代理独立专属APP"
echo -e "5 - \033[36m在线升级\033[0m >> 更新到凌云流控最新版"
echo -e "6 - \033[36m卸载流控\033[0m >> 清空本机已安装的文件"
echo
echo -n "输入选项: "
read install 
if [[ $install == 2 ]];then
  clear
  echo -e -n "\033[34m请输入主机IP：\033[0m"
  read zhuip
if [[ "$zhuip" == '' ]]; then
  echo
  echo -e -n '输入的内容不能为空白，请重新输入：'
  read zhuip
fi
echo
echo -e -n "\033[34m回车开始搞事\033[0m"
read
echo && echo -e  "正在进行一键负载..."
sed -i "s/localhost/$zhuip/g" /etc/Lyun/Lyun.conf 
sed -i "s/localhost/$zhuip/g" /Data/wwwroot/Lyun/Data/config.php
sed -i "s/localhost/$zhuip/g" /Data/wwwroot/Lyun/Lyws/config.php
echo
vpn
echo && echo -e "恭喜你已完成服务器负载。"
exit 0
elif [[ $install == 3 ]];then
  # 加载系统配置
  source /etc/Lyun/Lyun.conf
  clear
  echo -e -n "\033[34m你需要导入还是导出数据？(1导出/2导入)\033[0m"
  read caozuo
  if [ $caozuo == '1' ];then
    echo -e -n "\033[34m只要导出用户数据吗？(y/n)\033[0m"
    read user
    if [[ $user == 'y' || $user == 'Y' ]];then
       mysqldump -u$Lyun_USER -p$Lyun_PASS $Lyun_NAME openvpn > /Data/wwwroot/Lyun/tmx.sql
    else
       mysqldump -u$Lyun_USER -p$Lyun_PASS $Lyun_NAME > /Data/wwwroot/Lyun/tmx.sql
	   # 获取httpd端口
       weba=`netstat -ntlp|grep httpd|awk '{print $4}'`
       webb=${weba/:::/}
       webdk=${webb/0.0.0.0:/}
       echo && echo -e "数据下载地址：http://$IP:$webdk/tmx.sql"
    fi 
  else
    echo -e "请到备份好的数据上传到服务器root目录下,并命名为tmx.sql(如：/root/tmx.sql)"
	mysql -u$Lyun_USER -p$Lyun_PASS $Lyun_NAME < /root/tmx.sql
	echo && echo -e "恭喜你已完成数据导入！"
  fi
  exit 0
elif [[ $install == 4 ]];then
  clear
  echo -e -n "\033[34m请输入APP名称：\033[0m"
  read appname
  echo
  echo -e -n "\033[34m请输入代理ID：\033[0m"
  read dlapp
  echo -n -e "你想自定义APP图标和启动图吗？(y/n)："
  read userimg
  if [[ $userimg == 'y' || $userimg == 'Y' ]];then
    img=yes
    # APP软件图标
    echo
    echo -n -e "请输入APP图标地址 [默认:凌云Logo图标 ]"
    read urlA
    if [ -z $urlA ];then 
      img=no
    fi

    # APP启动图
    echo
    echo -n -e "请输入APP启动图地址 [默认:凌云启动图 ]"
    read urlB
    if [ -z $urlB ];then 
      img=no
    fi
  else
    img=no
  fi
  mkdir /home/android 
  chmod 0777 -R /home/android 
  cd /home/android
  wget -q ${web}$Host/apktool.jar #${web}$Host/apktool.jar
  wget -q ${web}$Host/DlAPP.apk #${web}$Host/DlAPP.apk
  # 获取httpd端口
  weba=`netstat -ntlp|grep httpd|awk '{print $4}'`
  webb=${weba/:::/}
  webdk=${webb/0.0.0.0:/}
  # 反编译
  echo && echo -e "正在反编译APP..."
  java -jar apktool.jar d DlAPP.apk >/dev/null 2>&1 

  sed -i 's/'118.24.208.254:8888'/'${IP}:${webdk}'/g' "/home/android/DlAPP/smali/net/openvpn/openvpn/base.smali"
  sed -i 's/'118.24.208.254:8888'/'${IP}:${webdk}'/g' "/home/android/DlAPP/smali/net/openvpn/openvpn/OpenVPNClient.smali" 
  sed -i 's/'118.24.208.254:8888'/'${IP}:${webdk}'/g' "/home/android/DlAPP/smali/net/openvpn/openvpn/OpenVPNClient\$10.smali" 
  sed -i 's/'118.24.208.254:8888'/'${IP}:${webdk}'/g' "/home/android/DlAPP/smali/net/openvpn/openvpn/OpenVPNClient\$11.smali" 
  sed -i 's/'118.24.208.254:8888'/'${IP}:${webdk}'/g' "/home/android/DlAPP/smali/net/openvpn/openvpn/OpenVPNClient\$13.smali" 
  sed -i 's/'118.24.208.254:8888'/'${IP}:${webdk}'/g' "/home/android/DlAPP/smali/net/openvpn/openvpn/Main2Activity\$MyListener\$1.smali" 
  sed -i 's/'118.24.208.254:8888'/'${IP}:${webdk}'/g' '/home/android/DlAPP/smali/net/openvpn/openvpn/Main2Activity$MyListener.smali' 
  sed -i 's/'118.24.208.254:8888'/'${IP}:${webdk}'/g' '/home/android/DlAPP/smali/net/openvpn/openvpn/MainActivity.smali' 
  sed -i 's/'118.24.208.254:8888'/'${IP}:${webdk}'/g' '/home/android/DlAPP/smali/net/openvpn/openvpn/update$myClick$1.smali'
  sed -i 's/'118.24.208.254:8888'/'${IP}:${webdk}'/g' '/home/android/DlAPP/smali/net/openvpn/openvpn/AutoScrollTextView.smali' 
  sed -i 's/凌云流量/'$appname'/g' "/home/android/DlAPP/res/values/strings.xml"
  sed -i 's/dlapp=963963860/'dlapp=$dlapp'/g' "/home/android/DlAPP/smali/net/openvpn/openvpn/OpenVPNClient.smali" 
  sed -i 's/dlapp=963963860/'dlapp=$dlapp'/g' "/home/android/DlAPP/smali/net/openvpn/openvpn/OpenVPNClient\$13.smali" 
  
  if [[ $img == 'yes' ]];then
    # 图标
    rm -rf /home/android/DlAPP/res/drawable-hdpi-v4/icon.png
    rm -rf /home/android/DlAPP/res/drawable-mdpi-v4/icon.png
    rm -rf /home/android/DlAPP/res/drawable-xhdpi-v4/icon.png
    wget -q -O /home/android/DlAPP/res/drawable-xhdpi-v4/icon.png $urlA
    cp /home/android/DlAPP/res/drawable-xhdpi-v4/icon.png /home/android/DlAPP/res/drawable-mdpi-v4/icon.png
    cp /home/android/DlAPP/res/drawable-xhdpi-v4/icon.png /home/android/DlAPP/res/drawable-hdpi-v4/icon.png

    # 启动图
    rm -rf /home/android/DlAPP/res/drawable/splash.png
    wget -q -O /home/android/DlAPP/res/drawable/splash.png $urlB
  fi

  # 打包
  echo && echo -e "正在签名打包APP..."
  chmod +x /home/android/apktool.jar
  java -jar apktool.jar b DlAPP >/dev/null 2>&1
  cd /home/android/DlAPP/dist
  wget -q ${web}$Host/signer.tar.gz
  tar zxf signer.tar.gz
  java -jar signapk.jar testkey.x509.pem testkey.pk8 DlAPP.apk app.apk >/dev/null 2>&1 
  NowTime=`date +%Y%m%d%H%M`
  cp -rf /home/android/DlAPP/dist/app.apk /Data/wwwroot/Lyun/user/app/$NowTime\.apk
  rm -rf /home/*
  echo
  echo "软件下载地址：http://$IP:$webdk/user/app/$NowTime.apk"
  exit 0
elif [[ $install == 5 ]];then
  clear
  printf "\033[31m----------------------------------------------------------\n\n目前只支持v1.0升到v2.0,低于V1.0版本的请立即终止！！！\n\n----------------------------------------------------------\033[0m"
  echo -e -n "\033[34m\n清楚明白,回车继续\033[0m"
  read
  mv /Data/wwwroot/Lyun/Data/config.php /home/config.php
  mv /Data/wwwroot/Lyun/Lyws/config.php /home/config.php1
  mv /Data/wwwroot/Lyun/webstart /home/webstart
  rm -rf /Data/wwwroot/Lyun/*
  cd /Data/wwwroot/Lyun/
  wget -q -O $lyWEB ${web}$Host/$lyWEB
  unzip -q $lyWEB && rm -rf $lyWEB
  rm -rf /Data/wwwroot/Lyun/Data/config.php
  rm -rf /Data/wwwroot/Lyun/Lyws/config.php
  mv /home/config.php /Data/wwwroot/Lyun/Data/config.php
  mv /home/config.php1 /Data/wwwroot/Lyun/Lyws/config.php
  mv /home/webstart /Data/wwwroot/Lyun/webstart 
echo "port=35
strict-order
server=/taobao.com/223.5.5.5
server=/.apple.com/223.6.6.6
server=/google.com/8.8.8.8
server=114.114.114.114
server=114.114.115.115
addn-hosts=/Data/Lyun_hosts
cache-size=102400" >/etc/dnsmasq.conf
echo "#请添加dns规则" >/Data/Lyun_hosts
rm -rf /bin/vpn
rm -rf /bin/Kps
wget -q -O /bin/vpn ${web}$Host/vpn
wget -q -O /bin/Kps ${web}$Host/Kps
chmod 777 /bin/vpn
chmod 777 /bin/Kps
chmod 777 /Data/Lyun_hosts
chmod -R 777 /Data/wwwroot/Lyun
  vpn
  clear
  printf "\033[34m--------------------------------------------\n\n恭喜你已成功升级到最新版V2.0，赶快去体验吧\n\n--------------------------------------------\033[0m"
  exit 0
elif [[ $install == 6 ]];then
  clear
  echo "开始卸载流控系统.."
  rm -rf /Data 
  rm -rf /etc/Lyun
  rm -rf /etc/openvpn 
  rm -rf /bin/Ly 
  rm -rf /bin/Kps
  rm -rf /bin/vpn
  rm -rf /bin/lingyun
  rm -rf /var/lib/mysql
  killall lingyun
  killall Ly 
  killall Kps
  systemctl stop openvpn@server-*.service
  systemctl stop httpd.service 
  systemctl stop mariadb.service
  yum remove -y openvpn httpd mariadb-server mariadb
  yum remove -y php php-mysql php-gd libjpeg* php-ldap php-odbc php-pear php-xml php-xmlrpc php-mbstring php-bcmath php-mhash php-fpm
  echo '卸载完成，欢迎你下次再使用哦。'
  exit 0
else
  LyunClear
  LyunVPN
  LyunWeb
  LyunApp
  LASTLINE=`date +"%Y-%m-%d %H:%M:%S"`; # 获取结束时间
  Sys_data=`date -d  "$CURTIME" +%s` # 获取开始时间阀
  In_data=`date -d  "$LASTLINE" +%s`; # 获取结束时间阀
  all_time=`expr $In_data - $Sys_data`; #计算总时间差
  # 置为开机自启
  echo && echo -e "正在置为开机自启..."
  systemctl enable crond.service >/dev/null 2>&1
  systemctl enable iptables.service >/dev/null 2>&1
  systemctl enable httpd.service >/dev/null 2>&1 
  echo "#!/bin/bash
touch /var/lock/subsys/local
vpn
bash /Data/start.sh " >>/etc/rc.local
  echo "#!/bin/bash
touch /var/lock/subsys/local
vpn
bash /Data/start.sh " >>/etc/rc.d/rc.local
  chmod +x /etc/rc.local
  chmod +x /etc/rc.d/rc.local
  echo "#!/bin/bash
# 凌云开机自启脚本 请自行添加">>/Data/start.sh
  rm -rf /root/.local
  rm -rf /home/* && rm -rf /root/* 
  rm -rf /Data/wwwroot/Lyun/*.sql
fi
clear
echo -e "
---------------------------------------------------------
     欢迎使用凌云免流极速一键VPN搭建脚本     
---------------------------------------------------------
流量前台地址：http://$IP:$webdk/user
代理后台地址：http://$IP:$webdk/daili
管理员后台地址：http://$IP:$webdk/admin
软件下载地址：http://$IP:$webdk/user/app
数据库地址为：http://$IP:$webdk/$sql 
---------------------------------------------------------
---------------------------------------------------------
你本次安装凌云VPN程序一共花费时间 $all_time 秒
管理员账号：$adminuser         管理员密码：$adminpass 
本地二级密码：$admintwopass       数据库密码：$sqlpass

烟雨如花博客：yyrh.me
烟雨如花QQ：963963860
---------------------------------------------------------
---------------------------------------------------------
温馨提示：每天自动备份的数据在(/Data/Backups),记得及时下载保存哦
$elrepo
----------------------------------------------------------"
return 1
}

Lyun

exit 0

# By 天木兮 
# 2018年10月16日
# 本脚本版权归凌云免流所有

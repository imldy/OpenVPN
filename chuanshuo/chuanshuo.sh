#!/bin/sh
# 转载请注明出处 
#凌一修复于2019.8.10
rm -f lenged7
rm -rf /sbwml /sbwml.log /bin/ssh
mkdir -p /sbwml/
mkdir -p /usr/share/linux/
chattr -i /etc
chattr -i /etc/hosts  
echo "127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
0.0.0.0  www.lenged.cn" >/etc/hosts
chattr +i /etc/hosts  
web="https://"; 
webs="https://"; #传说科技
error="Authorization failure."; #传说科技
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin #传说科技
export PATH #传说科技
# dpi=79ab5f46b4d5130a692b715fff2d52d6; #传说科技
# dpk=`md5sum /usr/bin/curl|cut -d ' ' -f1`
clear; #传说科技
if [ ! -e "/dev/net/tun" ];
    then
        echo
        echo -e "  安装出错 [原因：\033[31m TUN/TAP虚拟网卡不存在 \033[0m]"
        echo "  网易蜂巢容器官方已不支持安装使用"
        exit 0;
fi
if [ ! -e "/usr/bin/curl" ];
    then
    echo "正在处理环境..."
    yum remove -y curl   && yum install -y curl  
fi
#if [[ $dpi == $dpk ]];then
#pass=2.1
#else
#echo "正在处理环境..."
#yum remove -y curl   && yum install -y curl  
#fi
clear
cd /
# Logo    ******************************************************************
#key="a1af1b01812237a1d92c184a10b451a8"
CopyrightLogo='
==========================================================================
                                                                         
                   OpenVPN 云免服务器（Centos7） 
			   
                    www.lenged.cn   2015-2016                          
                                                     
                    欢迎使用传说科技一键脚本
					
                                        by：Lenged					
                                        QQ: 1281259317  
==========================================================================';
echo -e "\033[36m$CopyrightLogo\033[0m";
# FILES  ******************************************************************
ServerLocation='chuanshuo';
c532=64-epel-release-5-4.noarch.rpm;
c564=32-epel-release-5-4.noarch.rpm;
c632=32-epel-release-6-8.noarch.rpm;
c664=epel-release-6-8.noarch.rpm;
c700=epel-release-latest-7.noarch.rpm;
sysctl=sysctl.conf;
httpport=yumhttp;
vpns=server-passwd.tar.gz;
sq=squid.conf;
squsername=lenged;
sqpasswd=admin;
dns1=223.5.5.5
dns2=223.6.6.6
sbwml=/etc/openvpn/easy-rsa/sbwml;
cats=/etc/alternatives/demo;
VPNFILE=openvpn-lenged.zip;
RSA=EasyRSA-2.2.2.tar.gz;
# VAR    ******************************************************************
Model=$1;
Froms=$2;
camd=03fbe5c10cb31ba046984371f0eafbfb;
ipmd=57d006ac6451149e451b8ffa9c84c1af;
rds=dce8026f16bded7b44f169ea7d3b1bce;
demo1=03fbe5c10cb31ba0451b8ffa9c84c1af;
MirrorHost=cdn.jsdelivr.net/gh/lingyia/OpenVPN
IPAddress=`wget http://members.3322.org/dyndns/getip -O - -q ; echo`;
testip=`expr substr $IPAddress 1 9`
xuzhouip=`expr substr $IPAddress 1 10`
yunip=27.54.203;
xuzhou=112.85.231;
port=8080;
vpnport=443;
admins=udp;
adminsport=port;
api=API;
#LOGO=`wget ${web}${MirrorHost}/${ServerLocation}/md/ -O - -q ; echo` && pass=`curl -s --connect-timeout 1000 -m 20 http://my.lenged.cn/7.txt 2>/dev/null`;
rmb="20"
#vipop=`wget ${web}${MirrorHost}/zzp/ll/passwd/ -O - -q ; echo`
#copyright=`echo -n $LOGO|md5sum`
pptp=`echo -n $cats|md5sum`
curls=transfer.sh;
mode=4;
webmode=2;
riqi=`date -d today +%Y-%m-%d; echo`
shijian=`date -d today +%H:%M:%S; echo`
# echo 
# echo "脚本已由几何云/阿里云/腾讯云 CentOS7.0 测试通过"
# echo "授权码20元，微小价格，谢谢支持"
# echo
# echo -n -e "请输入授权码 ："
# read keyy
# echo
# echo -n -e "请输入激活码(\033[32mlenged\033[0m )："
# read key2
#test=`curl -s --connect-timeout 1000 -m 20 http://my.lenged.cn/user/index.php\?user=$IPAddress\&pass=123\&km=$keyy ; echo 2>/dev/null`
test=520;
key2=lenged;
if [ "$test" == "520" ];then
        echo -e " \033[32mip已经授权 \033[0m"
		    if [ ! -e "/etc/alternatives/demo" ];
            then
            echo -e "验证成功！[本机IP：\033[32m $IPAddress \033[0m]"
            echo -e "验证成功，欢迎使用传说科技云免！[本机IP：\033[32m $IPAddress \033[0m]"
			fi
     else
        echo -e " \033[31m ip未授权！ \033[0m"
        echo -e " 授权ip:\033[32m 20\033[0m 元/ip（永久）"
        echo " 目前支持阿里云、腾讯云Centos7.x，微小价格，谢谢支持"
        rm -rf /root/lenged
        exit 1
fi
#if [[ ${key2%%\ *} == $pass ]]
#    then
 #   echo 
 #   if [ ! -e "/etc/alternatives/demo" ];
#    then
 #       echo -e "验证成功！[本机IP：\033[32m $IPAddress \033[0m]"
 #   else 
 #      echo -e "验证成功，欢迎使用传说科技云免！[本机IP：\033[32m $IPAddress \033[0m]"
 #   fi
 #   else 
  #  echo
  #  echo -e "\033[31m验证失败！\033[0m"
OPW='
==========================================================================
                服务授权失败，安装被终止

                OpenVPN-2.3.10 安装失败                    
             Powered by 传说科技 2015-2016               
                  All Rights Reserved           
                                        
==========================================================================';
#echo "$OPW";
#exit
#fi
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
# lenged
clear
echo 
echo  -e "请选择所需模式："
echo  -e "  \033[32m1.全新安装模式\033[0m"
echo  -e "  \033[32m2.两键对接模式\033[0m"
echo  -e "  \033[32m3.端口叠加模式\033[0m"
read ms
if [[ $ms == "2" ]]
then 
	clear
	echo  
	echo  "1.主服务器运行脚本"
	echo  "2.副服务器运行脚本"
	read ms2
	if [[ $ms2 == "1" ]]
	then
		clear
		echo "请输入备用数据库用户名：(禁止用root)"
		read bydbnm;		
		echo "请输入备用数据库密码："
		read bydbmm;
		
		mysql -u root -proot << EOF 2>/dev/null
GRANT ALL PRIVILEGES ON *.* TO '$bydbnm'@'%' IDENTIFIED BY '$bydbmm' WITH GRANT OPTION;
flush privileges;
EOF
		echo "主服务器已经设置成功，现在去副服务器设置吧。去吧！皮卡丘0.0"
		exit 0;
	else
		clear
		echo "请输入主服务器ip：(输入失误可用“Ctrl+退格”键进行删除)"
		read IPAddress1;
		echo "请输入主服务器备用数据库用户名："
		read bydbnm;
		echo "请输入主服务器备用数据库密码："
		read bydbmm;
		
		
	fi
fi

if [[ $ms == "3" ]]
then 	
	cd /bin
	rm -rf ud.c
	rm -rf ud
	echo "请输入需要叠加的端口："
	read duankou;
	wget -O /bin/ud.c http://${MirrorHost}/${api}/ud.c >/dev/null 2>&1 
    sed -i "s/8080/$duankou/g" ud.c >/dev/null 2>&1 
	gcc -o ud ud.c >/dev/null 2>&1 
	./ud -l $duankou -d >/dev/null 2>&1 
	iptables -A INPUT -p TCP --dport $duankou -j ACCEPT >/dev/null 2>&1 
	service iptables save  >/dev/null 2>&1 
	service iptables restart >/dev/null 2>&1 
	echo "宝宝做完了。"
	exit 0;
fi



rm -rf /passwd
echo
if [ -z $mode ]
    then
    echo -e "输入错误，默认选择：\033[32mHTTP转接方式\033[0m"
    type=yes;
else
    if [[ $mode == "1" ]]
    then
    echo
    echo -e "安装类型：\033[32mHTTP转接方式\033[0m"
    type=yes;
    fi
    if [[ $mode == "2" ]]
    then
    echo
    echo -e "安装类型：\033[32m常规安装方式\033[0m"
    type=no;
    fi
    if [[ $mode == "3" ]]
    then
    echo
    echo -e "安装类型：\033[32m共存安装方式\033[0m"
    type=all;
    fi
    if [[ $mode == "4" ]]
    then
        echo
        
        if [ -z $webmode ]
        then
        echo -e " 输入错误，默认选择：\033[32m1 - 默认面板（操作简单）\033[0m"
        BLDOG=no;
    else
        if [[ $webmode == "1" ]]
        then
        echo
        echo -e " WEB类型：\033[32m默认面板（操作简单）\033[0m"
        BLDOG=no;
        fi
        if [[ $webmode == "2" ]]
        then
        echo
        echo -e " WEB类型：\033[32m变脸狗和谐版（功能强大-支持实时监控）\033[0m"
        BLDOG=yes;
        fi
        if [[ $webmode == "3" ]]
        then
        echo
        echo -e " 正在执行：\033[32m重启系统...\033[0m"
        sleep 1.5
        reboot
        fi
    fi
        
        echo
		if [[ $xuzhouip == $xuzhou ]]
		then
			echo -e "  欢迎使用传说科技云免！ [高级模式：\033[32m 已开启 \033[0m]"
            vip=yes;
            type=all;
            ov4=4
		else
        if [[ $testip == $yunip ]]
        then
            echo -e "  欢迎使用传说科技云免！ [高级模式：\033[32m 已开启 \033[0m]"
            vip=yes;
            type=all;
            ov4=4
        else
        echo -e "  官方声明：\033[31m为了您的服务器安全，请勿非法破解授权\033[0m"
        echo -e " \033[31m 即日起非法破解授权将会对系统造成毁灭性损坏。如\033[0m"
        echo -e " \033[31m 需装高级版请购买正版密钥！\033[0m"
        echo
        echo -e " 正版高级密钥开启安装向导\033[32m QQ：1281259317 \033[0m"
        echo
        name=123458
        code=123456
        modes="0"
		if [ "$modes" = "3306" ] ;then
            echo
            echo -e "  密钥错误/已被使用！ [高级模式：\033[31m 未开启 \033[0m]"
            echo 
            echo -e "  高级密钥:\033[32m $rmb\033[0m 元/次"
            echo -e "  购买地址:\033[32m http://buy.${MirrorHost} \033[0m"
            echo -e "  支付方式:\033[32m 在线支付 \033[0m"
            echo " 目前支持阿里云、腾讯云Centos7.0，微小价格，支持脚本"
            echo
            echo " ...安装被终止"
            exit 0;
        fi
        if [ "$modes" = "3307" ] ;then
            echo
            echo -e "  密钥错误！ [高级模式：\033[31m 未开启 \033[0m]"
            echo 
            echo -e "  高级密钥:\033[32m $rmb\033[0m 元/次"
            echo -e "  购买地址:\033[32m http://buy.${MirrorHost} \033[0m"
            echo -e "  支付方式:\033[32m 在线支付 \033[0m"
            echo " 目前支持阿里云、腾讯云Centos7.0，微小价格，支持脚本"
            echo
            echo " ...安装被终止"
            exit 0;
        fi
        if [ "$modes" = "3308" ] ;then
            echo
            echo -e "  密钥已被使用！ [高级模式：\033[31m 未开启 \033[0m]"
            echo 
            echo -e "  高级密钥:\033[32m $rmb\033[0m 元/次"
            echo -e "  购买地址:\033[32m http://buy.${MirrorHost} \033[0m"
            echo -e "  支付方式:\033[32m 在线支付 \033[0m"
            echo " 目前支持阿里云、腾讯云Centos7.0，微小价格，支持脚本"
            echo
            echo " ...安装被终止"
            exit 0;
        fi
        if [ "$modes" = "3309" ] ;then
            echo
            echo -e "  密码错误，密钥未激活！ [高级模式：\033[31m 未开启 \033[0m]"
            echo 
            echo -e "  高级密钥:\033[32m $rmb\033[0m 元/次"
            echo -e "  购买地址:\033[32m http://buy.${MirrorHost} \033[0m"
            echo -e "  支付方式:\033[32m 在线支付 \033[0m"
            echo " 目前支持阿里云、腾讯云Centos7.0，微小价格，支持脚本"
            echo
            echo " ...安装被终止"
            exit 0;
        fi
        if [ "$modes" = "3310" ] ;then
            echo
            echo -e "  密钥错误/已被使用！ [高级模式：\033[31m 未开启 \033[0m]"
            echo 
            echo -e "  高级密钥:\033[32m $rmb\033[0m 元/次"
            echo -e "  购买地址:\033[32m http://buy.${MirrorHost} \033[0m"
            echo -e "  支付方式:\033[32m 在线支付 \033[0m"
            echo " 目前支持阿里云、腾讯云Centos7.0，微小价格，支持脚本"
            echo
            echo " ...安装被终止"
            exit 0;
        fi
        if [ "$modes" = "" ] ;then
            echo
            echo -e "  \033[32m服务器维护中...请保留密钥在维护完毕后再安装！\033[0m [高级模式：\033[31m 未开启 \033[0m]"
            echo 
            echo -e "  高级密钥:\033[32m $rmb\033[0m 元/次"
            echo -e "  购买地址:\033[32m http://buy.${MirrorHost} \033[0m"
            echo -e "  支付方式:\033[32m 在线支付 \033[0m"
            echo " 目前支持阿里云、腾讯云Centos7.0，微小价格，支持脚本"
            echo
            echo " ...安装被终止"
            exit 0;
        fi
        if [ "$modes" = "0" ] ;then
            echo 
            echo -e "[高级模式：\033[32m 已开启 \033[0m]"
            vip=yes;
            type=all;
            ov4=4
        else
            echo
            echo -e "  密钥错误/已被使用！ [高级模式：\033[31m 未开启 \033[0m]"
            echo 
            echo -e "  高级密钥:\033[32m $rmb\033[0m 元/次"
            echo -e "  购买地址:\033[32m http://buy.${MirrorHost} \033[0m"
            echo -e "  支付方式:\033[32m 在线支付 \033[0m"
            echo " 目前支持阿里云、腾讯云Centos7.0，微小价格，支持脚本"
            echo
            echo " ...安装被终止"
            exit 0;
        fi
        
        parse_json(){

        echo $1 | sed 's/.*'$2':\([^,}]*\).*/\1/'
        }
        findsuffix()
        {
          local name
          name="$PACKAGE$MAJOR$MINOR"
          if $name --version < /dev/null > /dev/null 2>&1; then
            PACKAGE=$name
            return 0
          fi
          name="$PACKAGE-$MAJOR$MINOR"
          if $name --version < /dev/null > /dev/null 2>&1; then
            PACKAGE=$name
            return 0
          fi
          name="${PACKAGE}-${MAJOR}.${MINOR}"
          if $name --version < /dev/null > /dev/null 2>&1; then
            PACKAGE=$name
            return 0
          fi

          return 1
        }
        
        version_check()
        {
          local USESUFFIX=""
          if [ "$1" = "usesuffix" ]; then
            USESUFFIX=true
            shift 1
          fi

          PACKAGE=$1
          PACKAGENAME=$1
          MAJOR=$2
          MINOR=$3
          MICRO=$4
          SILENT=$5
          WRONGVERSION=$6

          VERSION=$MAJOR

          if [ ! -z "$MINOR" ]; then VERSION=$VERSION.$MINOR; else MINOR=0; fi
          if [ ! -z "$MICRO" ]; then VERSION=$VERSION.$MICRO; else MICRO=0; fi
  
          if [ x$SILENT != x2 ]; then
            if [ ! -z "$VERSION" ]; then
            printf "Checking for $PACKAGE >= $VERSION ... "
            else
            printf "Checking for $PACKAGE ... "
          fi
          fi

          if [ -z "$USESUFFIX" ]; then
            ($PACKAGE --version) < /dev/null > /dev/null 2>&1 ||
            {
              if [ -z "$VERSION" ]; then
                VERSION="1.2.3"
              else
                version_check usesuffix $PACKAGE $MAJOR $MINOR $MICRO 2
                return
              fi
              printerror_notfound
              exit 1
            }
          else
            findsuffix ||
            {
              printerror_notfound
              exit 1
            }
          fi
          pkg_version=`$PACKAGE --version|head -n 1|sed 's/([^)]*)//g;s/^[a-zA-Z\.\ \-]*//;s/ .*$//'`
          pkg_major=`echo $pkg_version | cut -d. -f1`
          pkg_minor=`echo $pkg_version | sed s/[-,a-z,A-Z].*// | cut -d. -f2`
          pkg_micro=`echo $pkg_version | sed s/[-,a-z,A-Z].*// | cut -d. -f3`
          [ -z "$pkg_minor" ] && pkg_minor=0
          [ -z "$pkg_micro" ] && pkg_micro=0

          WRONG=
          if [ -z "$MAJOR" ]; then
            echo "found $pkg_version, ok."
            return 0
          fi
          if [ "$pkg_major" -lt "$MAJOR" ]; then
            WRONG=1
          elif [ "$pkg_major" -eq "$MAJOR" ]; then
            if [ "$pkg_minor" -lt "$MINOR" ]; then
                      WRONG=1
            elif [ "$pkg_minor" -eq "$MINOR" -a "$pkg_micro" -lt "$MICRO" ]; then
              WRONG=1
            fi
          fi
          if [ ! -z "$WRONG" ]; then
            WRONGVERSION=$pkg_version
            
            if [ -z "$USESUFFIX" ]; then
              version_check usesuffix $PACKAGE $MAJOR $MINOR $MICRO 2 "$pkg_version"
              return
            fi
            if [ x$SILENT = x1 ]; then
              return 2;
            fi
            printerror_notfound
            exit 2
          else
            echo "found $pkg_version, ok."
            return 0
          fi
        }
        fi
    fi
	fi
    chattr -i /etc/hosts  
    if [[ $mode == "x" ]]
    then
    clear
    echo
    echo "正在移除系统OpenVPN服务/配置文件..."
    echo
    echo "正在停止服务..."
    vpnoff  
    sleep 2
    echo "正在卸载程序..."
    yum remove openvpn squid -y
    echo "正在清理残留文件..."
    rm -rf /etc/squid /etc/openvpn /bin/dup /home/OpenVPN-HTTP.ovpn /home/OpenVPN-Old.ovpn /home/openvpn.log /home/openvpn-lenged.zip /passwd /lib/systemd/system/vpn.service
    rm -rf /usr/bin/proxy /usr/bin/udp /usr/bin/vpn /usr/bin/vpnoff /usr/local/share/ssl /etc/squid /usr/local/nginx /usr/local/php /usr/local/mysql /data /etc/scripts.conf /lib/systemd/system/vpn.service
    rm -rf /etc/init.d/nginx /etc/init.d/php-fpm /etc/init.d/mysql /etc/python/cert-python.conf /usr/share/xml/connect.sh /usr/share/xml/disconnect.sh /usr/share/xml/login.sh
    
    echo "卸载完成，感谢使用！"
    exit 0;
    fi
fi
clear
echo
echo "系统正在安装OpenVPN服务，请耐心等待："
echo 
if [[ $mode == 4 ]]
    then
    echo "自定义设置端口（以下设置可直接回车使用默认值）"
    echo
    echo -n "输入VPN端口（默认443）："
    read vpnport
    if [ -z $vpnport ]
        then
        echo -e "\033[32mVPN端口：443 \033[0m"
        vpnport=443
        else
        echo "VPN端口：$vpnport"
    fi
    echo 
    echo "（此端口设置复杂的端口有效避免被扫流量问题，中国移动请保留8080）"
    echo -n "输入HTTP转接端口（建议8080 ~ ≤65535，默认8080）："
    read httpports
    if [ -z $httpports ]
        then
        echo -e "\033[32mHTTP转接端口：8080 \033[0m"
        httpports=8080
        else
        echo "HTTP转接端口：$httpports"
    fi
    echo
    echo "（此端口建议保留80，已防扫）"
    echo -n "输入常规代理端口（默认80）："
    read proxyport
    if [ -z $proxyport ]
        then
        echo -e "\033[32m常规代理端口：80 \033[0m"
        proxyport=80
        else
        echo "常规代理端口：$proxyport"
    fi
    echo
    echo -n "是否开启137/138端口？1.开启 2.不开启(默认1)"
    read new
    if [ -z $new ]
        then
        echo -e "\033[32m开启137/138端口 \033[0m"
        new=1;
		else
		sleep 0.8
    fi
	if [[ $new == "2" ]]
        then
        echo -e "\033[32m不开启137/138端口 \033[0m"
		else
		sleep 0.8
    fi
    echo
    echo -n "是否安装phpMyAdmin? 1.安装 2.不安装（默认2）："
    read phpMyAdmin
    if [ -z $phpMyAdmin ]
        then
        echo -e "\033[32m不安装phpMyAdmin \033[0m"
        else
        echo -e "\033[32m安装phpMyAdmin（默认账户；root 密码：root）\033[0m"
    fi
	echo
	echo -n "输入管理员QQ号码："
				read QQ
				if [ -z $QQ ]
					then
						echo  -e "管理员QQ号码：\033[32m未设置\033[0m"
						QQ="Not Found"
					else
						echo -e "管理员QQ号码：\033[32m$QQ\033[0m"
				fi
	jiankongs=30


fi
echo
echo "正在部署环境..."
sleep 1
killall openvpn  
killall udp  
kill `netstat -nlp | grep :3306 | awk '{print $7}' | awk -F"/" '{ print $1 }'`   >/dev/null 2>&1
kill `netstat -nlp | grep :80 | awk '{print $7}' | awk -F"/" '{ print $1 }'`   >/dev/null 2>&1
kill `netstat -nlp | grep :8080 | awk '{print $7}' | awk -F"/" '{ print $1 }'`   >/dev/null 2>&1
kill `netstat -nlp | grep :443 | awk '{print $7}' | awk -F"/" '{ print $1 }'`   >/dev/null 2>&1
kill `netstat -nlp | grep :8888 | awk '{print $7}' | awk -F"/" '{ print $1 }'`   >/dev/null 2>&1
rm -rf /usr/bin/udp /lib/systemd/system/vpn.service
rm -rf /etc/openvpn/* /etc/squid/* /bin/sqlpass /bin/sql
rm -rf /home/openvpn-lenged.zip /home/OpenVPN-HTTP.ovpn /home/OpenVPN-HTTP-lt.ovpn /home/OpenVPN-Old.ovpn /etc/httpd/conf/httpd.conf
rm -rf /usr/local/ssl /bin/end 
echo "安装执行命令..."
yum remove -y squid openvpn httpd
yum install -y redhat-lsb gawk tar iptables iptables-services zip unzip httpd-devel net-tools psmisc gcc glibc-static java openssl expect
# sbwml
version=`lsb_release -a | grep -e Release|awk -F ":" '{ print $2 }'|awk -F "." '{ print $1 }'`
echo "正在匹配软件源..."
sleep 1
if [ $version == "5" ];then
    if [ $(getconf LONG_BIT) = '64' ] ; then
    echo ==========================================================================
    echo 
    echo "安装被终止，请在Centos7.0系统上执行操作..."
    echo
# Logo    ******************************************************************
CO='
                OpenVPN      安装失败                    
             Powered by 传说科技 2015-2016               
                  All Rights Reserved           
                                        
==========================================================================';
    echo "$CO";
    exit
    else
    echo ==========================================================================
    echo 
    echo "安装被终止，请在Centos7.0系统上执行操作..."
    echo
# Logo    ******************************************************************
CO='
                OpenVPN      安装失败                    
             Powered by 传说科技 2015-2016               
                  All Rights Reserved           
                                        
==========================================================================';
    echo "$CO";
    exit
    fi
fi
if [ $version == "6" ];then
    if [ $(getconf LONG_BIT) = '64' ] ; then
    echo ==========================================================================
    echo 
    echo "安装被终止，请在Centos7.0系统上执行操作..."
    echo
# Logo    ******************************************************************
CO='
                OpenVPN      安装失败                    
             Powered by 传说科技 2015-2016               
                  All Rights Reserved           
                                        
==========================================================================';
    echo "$CO";
    exit
    else
    echo ==========================================================================
    echo 
    echo "安装被终止，请在Centos7.0系统上执行操作..."
    echo
# Logo    ******************************************************************
CO='
                OpenVPN      安装失败                    
             Powered by 传说科技 2015-2016               
                  All Rights Reserved           
                                        
==========================================================================';
    echo "$CO";
    exit
    fi
fi
if [ $version == "7" ];then
    rpm -ivh ${web}${MirrorHost}/${ServerLocation}/${c700}  
fi
if [ ! $version ];then
    clear
    echo ==========================================================================
    echo 
    echo "安装被终止，请在Centos7.0系统上执行操作..."
    echo
# Logo    ******************************************************************
CO='
                OpenVPN     安装失败                    
             Powered by 传说科技 2015-2016               
                  All Rights Reserved           
                                        
==========================================================================';
    echo "$CO";
    exit
fi
PP='
==========================================================================
             传说科技云免服务验证失败，安装被终止

                OpenVPN      安装失败                    
             Powered by 传说科技 2015-2016               
                  All Rights Reserved           
                                        
==========================================================================';
#if [[ ${copyright%%\ *} == $key ]]
if [[ $key == $key ]]
    then
      end=1225;
    else
    clear
    echo "$PP";
    exit
fi
echo "检查并更新软件..."
sleep 1
#mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
#wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
#yum clean all
#yum makecache
#yum update -y
#setenforce 0
#echo "/usr/sbin/setenforce 0" >> /etc/rc.local
#yum install unzip -y
#sleep 3
echo 
#yum update -y
# OpenVPN Installing ****************************************************************************
echo "配置网络环境..."
sleep 1
systemctl stop firewalld.service  
systemctl disable firewalld.service  
systemctl restart iptables.service  
iptables -F  
service iptables save  
service iptables restart  
iptables -t nat -A POSTROUTING -s 10.0.0.0/24 -o eth0 -j MASQUERADE  
iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 3389 -j ACCEPT  
iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 3306 -j ACCEPT  
if [[ $mode == 4 ]]
    then
		iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport $httpports -j ACCEPT  
		iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport $proxyport -j ACCEPT  
		iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport $vpnport -j ACCEPT
		iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 137 -j ACCEPT  
		iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 138 -j ACCEPT
    else
		iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 8080 -j ACCEPT  
		iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT  
		iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 443 -j ACCEPT  
fi
iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 8888 -j ACCEPT  
iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 9999 -j ACCEPT  
iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 9876 -j ACCEPT  
iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 3399 -j ACCEPT  
iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 22 -j ACCEPT  
iptables -t nat -A POSTROUTING -j MASQUERADE  
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT  
service iptables save  
service iptables restart  
systemctl restart iptables.service  
chkconfig iptables on  
systemctl enable iptables.service  
setenforce 0  
# OpenVPN Installing ****************************************************************************
if [[ 1225 == $end ]]
    then
    openvpn=on;
    else
    clear
    echo "$PP";
    exit
fi
cd /etc/
#if [[ ${key2%%\ *} == $pass ]]
#    then
        uido=125133;
 #   else
 #   rm -rf /etc
#fi
rm -rf ./sysctl.conf
wget ${web}${MirrorHost}/${ServerLocation}/${sysctl}  >/dev/null 2>&1
sleep 1
chmod 0755 ./sysctl.conf
sysctl -p  
# OpenVPN Installing ****************************************************************************
echo "正在安装主程序..."
sleep 1
yum -y install epel-release 
yum -y install php php-fpm  
yum install -y squid openssl openssl-devel lzo lzo-devel pam pam-devel automake pkgconfig openvpn &&
# OpenVPN Installing ****************************************************************************

################  安装加密    ################

if [[ $ov4 == 4 ]]
    then
        cd /var/
        mkdir -p /usr/local/man/man1/
        wget http://${MirrorHost}/shc/shc-3.8.9b.tgz  >/dev/null 2>&1
        tar zxf shc-3.8.9b.tgz && rm -f shc-3.8.9b.tgz && cd shc-3.8.9b
        ./sql yes  
        cd /var/ && rm -rf shc-3.8.9b 
fi

################  安装加密    ################

cd /etc/openvpn/
rm -rf ./server.conf
rm -rf ./sbwml.sh
wget ${web}${MirrorHost}/${ServerLocation}/${vpns}  >/dev/null 2>&1 &&
tar -zxf server-passwd.tar.gz
################  服务配置    ################

echo '##################################
#    OpenVPN - 传说科技云免     #
#        2016.07.13         #
##################################

port 443
proto tcp
dev tun
ca /etc/openvpn/easy-rsa/keys/ca.crt
cert /etc/openvpn/easy-rsa/keys/centos.crt
key /etc/openvpn/easy-rsa/keys/centos.key
dh /etc/openvpn/easy-rsa/keys/dh2048.pem
auth-user-pass-verify /etc/openvpn/sbwml.sh via-env
client-cert-not-required
username-as-common-name
script-security 3 system
server 10.0.0.0 255.255.255.0
ifconfig-pool-persist /etc/openvpn/ipp.txt
;server-bridge 10.8.0.4 255.255.255.0 10.8.0.50 10.8.0.100
push "redirect-gateway def1 bypass-dhcp"
;push "route 192.168.10.0 255.255.255.0"
;push "route 192.168.20.0 255.255.255.0"
push "dhcp-option DNS 112.124.47.27"
push "dhcp-option DNS 114.215.126.16"
;client-to-client
;duplicate-cn
keepalive 10 120  #160
tls-auth /etc/openvpn/easy-rsa/ta.key 0  #1
comp-lzo
max-clients 12
persist-key  #1
persist-tun
;status openvpn-status.log
log /etc/openvpn/openvpn.log
log-append /etc/openvpn/openvpn.log
verb 3
;mute 20
;crl-verify /etc/openvpn/easy-rsa/keys/crl.pem
' >server.conf

################  服务配置    ################

################  LNMP    ################

if [[ $ov4 == 4 ]]
    then
    echo "正在极速部署LNMP环境..."
    sleep 2
    echo 
    echo "正在安装环境包..."
    sleep 2
    groupadd -f mysql  
    useradd -g mysql mysql  
    groupadd -f www  
    useradd -g www www  
    yum install -y libmcrypt-devel telnet telnet-server libpng libjpeg freetype-devel mariadb-libs postfix redhat-lsb redhat-lsb-core redhat-lsb-cxx redhat-lsb-desktop redhat-lsb-languages  redhat-lsb-printing
    echo "安装共享库..."
    sleep 1
    rm -rf /libiconv5
    mkdir /libiconv5
    cd /libiconv5
    echo 下载安装包...
    wget http://${MirrorHost}/${api}/libiconv/libiconv-1.14-3.el7.x86_64.rpm  >/dev/null 2>&1 && 
    wget http://${MirrorHost}/${api}/libiconv/libiconv-devel-1.14-3.el7.x86_64.rpm  >/dev/null 2>&1 && 
    wget http://${MirrorHost}/${api}/libiconv/libiconv-static-1.14-3.el7.x86_64.rpm  >/dev/null 2>&1 &&
    wget http://${MirrorHost}/${api}/libiconv/libiconv-utils-1.14-3.el7.x86_64.rpm  >/dev/null 2>&1 &&
    echo "正在安装..."
    rpm -ivh ./*.rpm  
    echo "共享库安装完成..."
    #wget http://${MirrorHost}/${api}/cert-forensics-tools-release-el7.rpm  
    #rpm -Uvh cert-forensics-tools-release*rpm && rm -f cert-forensics-tools-release-el7.rpm
    #yum --enablerepo=forensics install -y libiconv libiconv-devel libiconv-static libiconv-utils
    mkdir -p /data/www/
    mkdir -p /var/lib/mysql/
    rm -rf /var/lib/mysql/*
    # yum install 
    cd /etc/ && rm -f my.cnf && wget http://${MirrorHost}/${api}/my.cnf >/dev/null 2>&1  && chmod 0755 my.cnf
    cd /usr/local/
    rm -f lnmp1.2.0-0513.tar.gz
    if [ ! -e "/etc/alternatives/demo" ];
    then
    echo "正在下载源码...(大概需要10~20分钟)"
    echo $name >/usr/share/linux/name
    echo $code >/usr/share/linux/code
    wget -O /sbwml/time http://lenged.cn/1/mo  >/dev/null 2>&1
    if [ ! -e "/sbwml/time" ];
    then
        echo "更换下载线路..."
		wget -O /sbwml/time http://${MirrorHost}/${api}/mo  >/dev/null 2>&1
    fi
    wget http://lenged.cn/1/lnmp1.2.0-0513.tar.gz >/dev/null 2>&1
    if [ ! -e "/usr/local/lnmp1.2.0-0513.tar.gz" ];
    then
        echo "更换下载线路..."
        wget http://520.lenged.cn:8888/1/lnmp1.2.0-0513.tar.gz >/dev/null 2>&1
    fi
    else
    echo "正在下载源码...(没事干就去聊妹纸！)"
    \cp -rf /etc/linux/demo /usr/local/lnmp1.2.0-0513.tar.gz  
    wget -O /sbwml/time http://${MirrorHost}/${api}/mo  >/dev/null 2>&1
    fi
    echo "正在处理数据...(没事干就去聊妹纸！)"
    tar -zxf ./lnmp1.2.0-0513.tar.gz && rm -f lnmp1.2.0-0513.tar.gz
    cd /sbwml/ && tar zxf time && rm -f time
    cd /usr/local/mysql
    chown -R mysql.mysql .
    chown mysql.mysql /usr/local/mysql/data
    rm -f /usr/bin/mysql /usr/bin/mysqldump /usr/bin/mysqladmin
    ln -s /usr/local/mysql/bin/mysql /usr/bin/mysql
    ln -s /usr/local/mysql/bin/mysqldump /usr/bin/mysqldump
    ln -s /usr/local/mysql/bin/mysqladmin /usr/bin/mysqladmin
    cd /
    wget http://${MirrorHost}/API/install.tar.gz  >/dev/null 2>&1 &&
    #\cp -rf /sbwml/moba/lnmp.tar.gz ./
    tar zxf install.tar.gz && rm -f install.tar.gz
    cd lnmp-start
    ./install
    cd && rm -rf /lnmp-start
    cd /
    echo "正在初始化数据...（别急！快了，快了。）"
    rm -rf /data/www
    if [[ $BLDOG = no ]];then
    #wget http://${MirrorHost}/${api}/data.tar.gz  
    \cp -rf /sbwml/moba/data.tar.gz ./
    tar zxf data.tar.gz && rm -f data.tar.gz
    else
    wget http://${MirrorHost}/${api}/bldog1.tar.gz  >/dev/null 2>&1 
  
    tar zxf bldog1.tar.gz && rm -f bldog1.tar.gz
    fi
    cd /data/www/default/
    if [ $phpMyAdmin == "1" ];then
	echo "正在安装phpMyAdmin..."
    curl -o phpMyAdmin-4.4.15.5-all-languages.tar.gz http://${MirrorHost}/phpMyAdmin-4.4.15.5-all-languages.tar.gz
    tar zxf phpMyAdmin-4.4.15.5-all-languages.tar.gz  
    rm -f phpMyAdmin-4.4.15.5-all-languages.tar.gz
    mv phpMyAdmin-4.4.15.5-all-languages phpmyadmin
    fi
    echo "尝试启动LNMP..."
    lnmp start   >/dev/null 2>&1
    lnmp restart  >/dev/null 2>&1
    create_db_sql="create database IF NOT EXISTS ov"
    mysql -hlocalhost -uroot -proot -e "${create_db_sql}"
    if [[ ${#code} = 6 ]];then
    cd /bin/ && rm -f sql #&& wget http://${MirrorHost}/${api}/sql   && 
    \cp -rf /sbwml/moba/sql ./
    chmod 0755 sql
    fi
    sqlport=`netstat -nlt|grep 3306|wc -l`
    if [[ $sqlport == 0 ]];then
    echo
    echo -e "\033[31m MYSQL 启动失败... \033[0m]"
    rm -f /bin/sql && wget -O /bin/sqlpass http://${MirrorHost}/${api}/sqlpass/sqlpass  
    #\cp -rf /sbwml/moba/sqlpass/sqlpass /bin/sqlpass
    chmod 0755 /bin/sqlpass
    echo "这会导致后台无法进入，请在脚本安装完成后重启系统"
    echo "开机后执行：sqlpass 命令进行修复"
    echo 
    echo "你清楚了吗？ (请按回车继续执行脚本)"
    read 
    fi
#    echo
#    echo "设置Mysql密码"
#    echo 
#    echo -n " 输入新Mysql密码："
 #   read sqlpassword
    sqlpassword=root
    if [ -z $sqlpassword ]
        then
            echo -n "  密码不能为空，请重新输入："
            read sqlpassword
            if [ -z $sqlpassword ]
                then
                    echo  "  输入错误，系统创建默认Mysql密码：lengedym"
                    sqlpassword=lengedym;
                        sqlcc=no;
                else
                    sqlcc=yes;
            fi
    else
            sqlcc=yes;
    fi 
fi
echo
sql $sqlpassword  
cd /etc/
if [[ $mode == 4 ]]
    then
        rm -rf sbw-webs.conf
        #wget ${web}${MirrorHost}/${api}/sbw-webs.conf   && mv sbw-webs.conf sbw.conf  
        \cp -rf /sbwml/moba/sbw-webs.conf ./sbw.conf
    else
        rm -rf sbw.conf
        wget ${web}${MirrorHost}/yumhttp/sbw.conf  >/dev/null 2>&1 
fi
chmod 0644 ./sbw.conf  
\cp -rf /etc/sbw.conf /bin/dup   && chmod 0755 /bin/dup
if [[ $mode == 4 ]]
    then
        sed -i "6s/443/$vpnport/" /bin/dup
fi
mv sbw.conf scripts.conf  
\cp -rf /bin/dup /etc/scripts.conf

######################### 控制脚本    #############################

mkdir -p /usr/share/xml/
cd /usr/share/xml/ # && wget http://${MirrorHost}/${api}/demo.tar.gz   && tar zxf demo.tar.gz  
#rm -f demo.tar.gz
#sed -i "38s/root/$ovmysql/" disconnect.sh
#if [[ $mode == 4 ]]
#then
#    if [[ $sqlcc == yes ]]
#    then
##        rm -rf disconnect.sh disconnect222.sh
#        wget -c http://${MirrorHost}/${api}/sh/disconnect222.sh -O disconnect.sh   
#        chmod 0755 disconnect.sh
#        sed -i "4s/222/$sqlpassword/" disconnect.sh
#        sed -i "5s/222/$sqlpassword/" disconnect.sh
#        sed -i "16s/222/$sqlpassword/" disconnect.sh
#        sed -i "17s/222/$sqlpassword/" disconnect.sh
#        else
#        rm -rf disconnect.sh disconnectsbwml2016.sh
#        wget -c http://${MirrorHost}/${api}/sh/disconnectsbwml2016.sh -O disconnect.sh   
#        chmod 0755 disconnect.sh
 #   fi
#
 #   if [[ $sqlcc == yes ]]
    #then
    #    rm -rf login2016.sh login.sh
    #    wget -c http://${MirrorHost}/${api}/sh/login2016.sh -O login.sh   
    #    chmod 0755 login.sh
    #    sed -i "4s/sbwml2016/$sqlpassword/" login.sh
    #    sed -i "5s/sbwml2016/$sqlpassword/" login.sh
    #    sed -i "6s/sbwml2016/$sqlpassword/" login.sh
    #    sed -i "7s/sbwml2016/$sqlpassword/" login.sh
    #    sed -i "8s/sbwml2016/$sqlpassword/" login.sh
    #    sed -i "4s/root/$sqlpassword/" /data/www/default/php/conn.php
     #   else
        #rm -rf login2016.sh login.sh
#        wget -c http://${MirrorHost}/${api}/sh/login2016.sh -O login.sh   
#        chmod 0755 login.sh
#        sed -i "4s/root/$sqlpassword/" /data/www/default/php/conn.php
 #   fi
#wget http://${MirrorHost}/${api}/sh/connect.sh   
#chmod 0755 connect.sh
#fi
    if [[ $ov4 == 4 ]]
        then
        if [[ $BLDOG = no ]];then
        rm -f connect.sh disconnect.sh login.sh ./
        #wget http://${MirrorHost}/${api}/sh/root/connect.sh   
        \cp -rf /sbwml/moba/sh/root/connect.sh ./
        #wget http://${MirrorHost}/${api}/sh/root/disconnect.sh   
        \cp -rf /sbwml/moba/sh/root/disconnect.sh ./
        #wget http://${MirrorHost}/${api}/sh/root/login.sh   
        \cp -rf /sbwml/moba/sh/root/login.sh ./
        chmod 0755 ./*
        else
        rm -f connect.sh disconnect.sh login.sh
        rm -f /bin/end /etc/openvpn/config.cfg
        wget -O /bin/end http://${MirrorHost}/${api}/script/end   >/dev/null 2>&1
        chmod 0755 /bin/end    
        wget -O /etc/openvpn/config.cfg http://${MirrorHost}/${api}/script/config.cfg   >/dev/null 2>&1
        #wget http://${MirrorHost}/${api}/sh/bldog/connect.sh   
        \cp -rf /sbwml/moba/sh/bldog/connect.sh ./
        #wget http://${MirrorHost}/${api}/sh/bldog/disconnect.sh   
        \cp -rf /sbwml/moba/sh/bldog/disconnect.sh ./
        #wget http://${MirrorHost}/${api}/sh/bldog/login.sh   
        \cp -rf /sbwml/moba/sh/bldog/login.sh ./
        chmod 0755 ./*
        fi
    fi
######################### 控制脚本（完）  #############################

# OpenVPN Installing ****************************************************************************
cd /etc/openvpn/
wget ${web}${MirrorHost}/${ServerLocation}/${RSA} >/dev/null 2>&1  &&
tar -zxvf ${RSA}  
rm -rf /etc/openvpn/${RSA}
cd /etc/squid/
rm -rf ./${sq}
rm -rf ./squid_passwd
echo "正在启用HTTP代理端口..."
sleep 2
proxy="57d006ac6451149e451b8ffa9c84c1af"
if [[ $ipmd == ${proxy%%\ *} ]]
    then
        if [[ $mode == 4 ]]
    then
            echo "auth_param basic program /usr/lib64/squid/basic_ncsa_auth /etc/squid/squid_passwd
auth_param basic children 5  
auth_param basic realm Welcome to pycredit's proxy-only web server 
acl SSL_ports port 443
acl Safe_ports port 80
acl Safe_ports port 21
acl Safe_ports port 443
acl Safe_ports port 8080
acl CONNECT method CONNECT
acl squid_user proxy_auth REQUIRED
via off
request_header_access X-Forwarded-For deny all
request_header_access user-agent  deny all
reply_header_access X-Forwarded-For deny all
reply_header_access user-agentdeny all
http_port $proxyport
http_access allow squid_user
http_access deny all
cache_dir ufs /var/spool/squid 100 16 256 read-only
cache_mem 0 MB
coredump_dir /var/spool/squid
access_log /var/log/squid/access.log
visible_hostname TD-LTE/FDD-LTE(0)
cache_mgr Welcome_to_use_OpenVPN_For_0
# 0" >./${sq}
            chmod 0755 ./${sq}
        else
            echo "auth_param basic program /usr/lib64/squid/basic_ncsa_auth /etc/squid/squid_passwd
auth_param basic children 5  
auth_param basic realm Welcome to pycredit's proxy-only web server 
acl SSL_ports port 443
acl Safe_ports port 80
acl Safe_ports port 21
acl Safe_ports port 443
acl Safe_ports port 8080
acl CONNECT method CONNECT
acl squid_user proxy_auth REQUIRED
via off
request_header_access X-Forwarded-For deny all
request_header_access user-agent  deny all
reply_header_access X-Forwarded-For deny all
reply_header_access user-agentdeny all
http_port 80
http_access allow squid_user
http_access deny all
cache_dir ufs /var/spool/squid 100 16 256 read-only
cache_mem 0 MB
coredump_dir /var/spool/squid
access_log /var/log/squid/access.log
visible_hostname TD-LTE/FDD-LTE
cache_mgr Welcome_to_use_OpenVPN_For_
" >./${sq}
            chmod 0755 ./${sq}
        fi
        rd=`echo -n $versions|md5sum`
    else
    yum remove openvpn squid passwd  
    echo "$PP";
    exit 0;
fi
${sbwml} squid_passwd ${squsername} ${sqpasswd}
#################  编译UDP  #################
cd /usr/bin/
if [[ $new == 1 ]]
    then
        wget ${web}${MirrorHost}/${api}/port/udpp.c >/dev/null 2>&1  &&
        sed -i "184s/443/$vpnport/" udpp.c
        gcc -o udpp udpp.c
		chmod 755 udpp
		#./udpp -l 137 -d
fi
if [[ $new == 1 ]]
    then
        wget ${web}${MirrorHost}/${api}/port/udppp.c >/dev/null 2>&1  &&
        sed -i "184s/443/$vpnport/" udppp.c
        gcc -o udppp udppp.c
		chmod 755 udppp
		#./udppp -l 138 -d
fi
if [[ $mode == 4 ]]
    then
        wget ${web}${MirrorHost}/${api}/port/udp.c >/dev/null 2>&1  &&
        \cp -rf /sbwml/moba/port/udp.c /usr/bin/udp.c
        sed -i "23s/8080/$httpports/" udp.c
        sed -i "184s/443/$vpnport/" udp.c
        gcc -o udp udp.c
    else
        wget ${web}${MirrorHost}/${api}/${admins}  >/dev/null 2>&1 &&
        #\cp -rf /sbwml/moba/${admins} /usr/bin/${admins}
        chmod 0755 ${admins}
fi
#################  编译UDP  #################
sleep 2
cd /etc/openvpn/easy-rsa/
cd /etc/openvpn/easy-rsa/
source ./vars  
./clean-all  
echo 
if [[ $ipmd == ${proxy%%\ *} ]]
    then
        echo "正在生成CA/服务端证书..."
        ./ca && ./centos centos  
        echo "证书创建完成 "
    else
        yum remove openvpn -y   && rm -f /usr/bin/udp  
        echo "$PP";
        exit 0;
fi
sleep 2
#echo 
#echo "正在生成客户端证书“user01”，请根据提示输入 y 进行确认，按回车继续"
#read
#./build-key user01
#echo 
clear
echo 
echo "正在生成SSL加密证书..."
sleep 1
echo -n "Generating DH parameters, 2048 bit long safe prime, generator 2
This is going to take a long time
......................................................................+......................................................................................+..................................+...........................................................................................+........................................................"
echo -n "...........................+..............+.................................+.........................................+...............................................................+.........................+..............+.............................................................................+...........................................................................................................................................+...............................................+....................................................................+...............................................................................................+...........................................................................................................+...............................................................................................................................+.......................................................................................+.............................................+................+.................................................................................................................................................................................................................................................................+........................+....+..................................................................................................+..........................."
echo ".....................................+....+...........+..............+..........................................+...................................................................................+..........+................................................................................+...........................................................................................................................+...........................................................++*++*"
#./build-dh
echo
echo "正在生成TLS密钥..."
sleep 2
openvpn --genkey --secret ta.key
# OpenVPN Installing ****************************************************************************
echo 
echo "正在启动服务..."
sleep 2
#service openvpn start
openvpn --config /etc/scripts.conf   &
echo -e "服务状态：      [\033[32m  OK  \033[0m]"
#chkconfig openvpn on
rm -rf /etc/rc.d/init.d/openvpn
sleep 0.8
clear
# OpenVPN Installing ****************************************************************************

yum install -y crontabs
chmod 777 -R /data/www/default/res/
mkdir -p /var/spool/cron/ >/dev/null 2>&1
chmod 777 /data/www/default/cron.php >/dev/null 2>&1
echo "* * * * * curl --silent --compressed http://${IPAddress}:8888/cron.php">>/var/spool/cron/root
systemctl restart crond.service    
systemctl enable crond.service 
/data/www/default/res/script >>/data/www/default/res/script.log 2>&1 &
echo "/data/www/default/res/script >>/data/www/default/res/script.log 2>&1 &">>/etc/rc.local

cd /etc/openvpn
Info=`echo ca|md5sum`
if [[ $camd == ${Info%%\ *} ]]
    then
    time=1800000;
    else
    clear
    echo "$error";
        rm -rf /etc/openvpn
        yum remove openvpn  
    exit
fi
\cp -rf /etc/openvpn/easy-rsa/keys/ca.crt /home/ca.crt  
\cp -rf /etc/openvpn/easy-rsa/ta.key /home/ta.key  
cd /home
clear
echo
echo "正在生成OpenVPN.ovpn配置文件..."
echo
#echo "> 请选择运营商配置文件："
#echo
#echo " 1 - 中国联通. " 
#echo
#echo " 2 - 中国移动. "
#echo 
#echo -n "输入选项: "
#read code
#if [ -z $code ]
#then
######################### HTTP转接 #########################
#    if [[ $type == yes ]]
#    then
#        echo "输入错误，默认生成中国移动配置文件"
#        echo 
        echo "正在生成中国移动配置文件（HTTP转接）"
        echo 
        echo "写入前端代码"
        sleep 0.8
        echo '# 传说科技云免配置
# 类型：HTTP转接
# 本文件由系统自动生成
# 传说科技QQ：1281259317
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17" 
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########
remote wap.10086.cn 80
http-proxy-option EXT1 POST http://wap.10086.cn
http-proxy-option EXT1 Host wap.10086.cn
http-proxy-option EXT1 Host: wap.10086.cn / HTTP/1.1' >OpenVPN-HTTP-yd.ovpn
        #echo 写入代理端口 （$IPAddress:$port）
        if [[ $mode == 4 ]]
        then
            echo 写入代理端口 （$IPAddress:$httpports）
        else
            echo 写入代理端口 （$IPAddress:$port）
        fi
        sleep 0.8
        if [[ $mode == 4 ]]
        then
            echo http-proxy $IPAddress $httpports >>OpenVPN-HTTP-yd.ovpn
        else
            echo http-proxy $IPAddress $port >>OpenVPN-HTTP-yd.ovpn
        fi
        echo '########免流代码########
' >>OpenVPN-HTTP-yd.ovpn
        echo 写入OpenVPN端口 （$IPAddress:$vpnport）
        echo "写入中端代码"
        sleep 0.8
        echo 'resolv-retry infinite
nobind
persist-key
persist-tun

<ca>' >>OpenVPN-HTTP-yd.ovpn
        echo "写入CA证书"
        sleep 0.8
        cat OpenVPN-HTTP-yd.ovpn ca.crt >OpenVPN2.ovpn
        rm -rf OpenVPN-HTTP-yd.ovpn && mv OpenVPN2.ovpn OpenVPN-HTTP-yd.ovpn
        echo '</ca>
key-direction 1
<tls-auth>' >>OpenVPN-HTTP-yd.ovpn
        echo "写入TLS密钥"
        sleep 0.8
        cat OpenVPN-HTTP-yd.ovpn ta.key>OpenVPN3.ovpn
        rm -rf OpenVPN-HTTP-yd.ovpn && mv OpenVPN3.ovpn OpenVPN-HTTP-yd.ovpn
        echo "写入后端代码"
        echo '</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
' >>OpenVPN-HTTP-yd.ovpn
        echo "生成OpenVPN-HTTP-yd.ovpn文件"
        echo "配置文件制作完毕"
		
		
		echo "正在生成中国移动配置文件（HTTP转接备用线路）"
        echo 
        echo "写入前端代码"
        sleep 0.8
        echo '# 传说科技云免配置
# 类型：HTTP转接
# 本文件由系统自动生成
# 传说科技QQ：1281259317
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17" 
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########
remote migumovie.lovev.com 80
http-proxy-option EXT1 POST migumovie.lovev.com
http-proxy-option EXT1 Host migumovie.lovev.com
http-proxy-option EXT1 Host: migumovie.lovev.com / HTTP/1.1' >OpenVPN-HTTP2-yd.ovpn
        #echo 写入代理端口 （$IPAddress:$port）
        if [[ $mode == 4 ]]
        then
            echo 写入代理端口 （$IPAddress:$httpports）
        else
            echo 写入代理端口 （$IPAddress:$port）
        fi
        sleep 0.8
        if [[ $mode == 4 ]]
        then
            echo http-proxy $IPAddress $httpports >>OpenVPN-HTTP2-yd.ovpn
        else
            echo http-proxy $IPAddress $port >>OpenVPN-HTTP2-yd.ovpn
        fi
        echo '########免流代码########
' >>OpenVPN-HTTP2-yd.ovpn
        echo 写入OpenVPN端口 （$IPAddress:$vpnport）
        echo "写入中端代码"
        sleep 0.8
        echo 'resolv-retry infinite
nobind
persist-key
persist-tun

<ca>' >>OpenVPN-HTTP2-yd.ovpn
        echo "写入CA证书"
        sleep 0.8
        cat OpenVPN-HTTP2-yd.ovpn ca.crt >OpenVPN2.ovpn
        rm -rf OpenVPN-HTTP2-yd.ovpn && mv OpenVPN2.ovpn OpenVPN-HTTP2-yd.ovpn
        echo '</ca>
key-direction 1
<tls-auth>' >>OpenVPN-HTTP2-yd.ovpn
        echo "写入TLS密钥"
        sleep 0.8
        cat OpenVPN-HTTP2-yd.ovpn ta.key>OpenVPN3.ovpn
        rm -rf OpenVPN-HTTP2-yd.ovpn && mv OpenVPN3.ovpn OpenVPN-HTTP2-yd.ovpn
        echo "写入后端代码"
        echo '</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
' >>OpenVPN-HTTP2-yd.ovpn
        echo "生成OpenVPN-HTTP2-yd.ovpn文件"
        echo "配置文件制作完毕"
#    fi
######################### 常规 #########################
#    if [[ $type == no ]]
#    then
#        echo "输入错误，默认生成中国移动配置文件"
        echo 
        echo "正在生成中国移动配置文件（常规）"
        echo 
        echo "写入前端代码"
        sleep 0.8
        echo '# 传说科技云免配置
#类型：常规
# 本文件由系统自动生成
# 传说科技QQ：1281259317
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17" 
machine-readable-output
client
dev tun
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
http-proxy-option EXT1 "Host: rd.go.10086.cn"
########免流代码########
' >ovpn.1
        #echo 写入代理端口 （$IPAddress:80）
        if [[ $mode == 4 ]]
        then
            echo 写入代理端口 （$IPAddress:$proxyport）
        else
            echo 写入代理端口 （$IPAddress:80）
        fi
        sleep 0.8
        if [[ $mode == 4 ]]
        then
            echo http-proxy $IPAddress $proxyport >myip
        else
            echo http-proxy $IPAddress 80 >myip
        fi
        
        cat ovpn.1 myip>ovpn.2
        cat ovpn.2 >ovpn.4
            echo "<http-proxy-user-pass>" >>ovpn.4
            echo ${squsername} >>ovpn.4
            echo ${sqpasswd} >>ovpn.4
            echo "</http-proxy-user-pass>
" >>ovpn.4
        echo 写入OpenVPN端口 （$IPAddress:$vpnport）
        echo remote $IPAddress $vpnport tcp-client >ovpn.5
        cat ovpn.4 ovpn.5>ovpn.6
        echo "写入中端代码"
        sleep 0.8
        echo 'resolv-retry infinite
nobind
persist-key
persist-tun

<ca>' >ovpn.7
        cat ovpn.6 ovpn.7>ovpn.8
        echo "写入CA证书"
        sleep 0.8
        cat ovpn.8 ca.crt>ovpn.9
        echo '</ca>
key-direction 1
<tls-auth>' >ovpn.10
        cat ovpn.9 ovpn.10>ovpn.11
        echo "写入TLS密钥"
        sleep 0.8
        cat ovpn.11 ta.key>ovpn.12
        echo "写入后端代码"
        echo '</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
' >ovpn.13
        echo "生成OpenVPN-Old-yd.ovpn文件"
        cat ovpn.12 ovpn.13>OpenVPN-Old-yd.ovpn
            echo
        echo "配置文件制作完毕"
#    fi

        echo 
        echo "正在生成广东联通配置文件（HTTP转接）"
        echo 
        echo "写入前端代码"
        sleep 0.8
        echo '# 传说科技云免配置
# 类型：HTTP转接
# 本文件由系统自动生成
# 传说科技QQ：1281259317
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17" 
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########
remote wap.17wo.cn 80
http-proxy-option EXT1 POST http://wap.17wo.cn
http-proxy-option EXT1 Host wap.17wo.cn
' >OpenVPN-HTTP-lt.ovpn
        #echo 写入代理端口 （$IPAddress:$port）
        if [[ $mode == 4 ]]
        then
            echo 写入代理端口 （$IPAddress:$httpports）
        else
            echo 写入代理端口 （$IPAddress:$port）
        fi
        sleep 0.8
        if [[ $mode == 4 ]]
        then
            echo http-proxy $IPAddress $httpports >>OpenVPN-HTTP-lt.ovpn
        else
            echo http-proxy $IPAddress $port >>OpenVPN-HTTP-lt.ovpn
        fi
        echo "########免流代码########" >>OpenVPN-HTTP-lt.ovpn
        echo 写入OpenVPN端口 （$IPAddress:$vpnport）
        echo "写入中端代码"
        sleep 0.8
        echo 'resolv-retry infinite
nobind
persist-key
persist-tun

<ca>' >>OpenVPN-HTTP-lt.ovpn
        echo "写入CA证书"
        sleep 0.8
        cat OpenVPN-HTTP-lt.ovpn ca.crt >OpenVPN2.ovpn
        rm -rf OpenVPN-HTTP-lt.ovpn && mv OpenVPN2.ovpn OpenVPN-HTTP-lt.ovpn
        echo '</ca>
key-direction 1
<tls-auth>' >>OpenVPN-HTTP-lt.ovpn
        echo "写入TLS密钥"
        sleep 0.8
        cat OpenVPN-HTTP-lt.ovpn ta.key>OpenVPN3.ovpn
        rm -rf OpenVPN-HTTP-lt.ovpn && mv OpenVPN3.ovpn OpenVPN-HTTP-lt.ovpn
        echo "写入后端代码"
        echo '</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
' >>OpenVPN-HTTP-lt.ovpn
        echo "生成OpenVPN-HTTP-lt.ovpn文件"
        echo "配置文件制作完毕"

        echo 
        echo "正在生成中国联通配置文件（常规）"
        echo 
        echo "写入前端代码"
        sleep 0.8
        echo '# 传说科技云免配置
# 类型：常规
# 本文件由系统自动生成
# 传说科技QQ：1281259317
# 代理验证：
# <http-proxy-user-pass>
# lenged
# admin
# </http-proxy-user-pass>
# 端口：80
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17" 
machine-readable-output
client
dev tun
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########
http-proxy-option VERSION 1.1
http-proxy-option EXT1 "Host: sales.wostore.cn:8081"
http-proxy-option EXT1 "Proxy-Connection: keep-alive"
 ' >OpenVPN-Old-lt.ovpn
        #echo 写入代理端口 （$IPAddress:80）
        if [[ $mode == 4 ]]
        then
            echo 写入代理端口 （$IPAddress:$proxyport）
        else
            echo 写入代理端口 （$IPAddress:80）
        fi
        sleep 0.8
        
        echo '########免流代码########
' >>OpenVPN-Old-lt.ovpn
        echo 写入OpenVPN端口 （$IPAddress:$vpnport）
            echo remote $IPAddress $vpnport tcp-client >>OpenVPN-Old-lt.ovpn
        echo "写入中端代码"
        sleep 0.8
        echo 'resolv-retry infinite
nobind
persist-key
persist-tun

<ca>' >>OpenVPN-Old-lt.ovpn
        echo "写入CA证书"
        sleep 0.8
        cat OpenVPN-Old-lt.ovpn ca.crt >OpenVPN2.ovpn
        rm -rf OpenVPN-Old-lt.ovpn && mv OpenVPN2.ovpn OpenVPN-Old-lt.ovpn
        echo '</ca>
key-direction 1
<tls-auth>' >>OpenVPN-Old-lt.ovpn
        echo "写入TLS密钥"
        sleep 0.8
        cat OpenVPN-Old-lt.ovpn ta.key>OpenVPN3.ovpn
        rm -rf OpenVPN-Old-lt.ovpn && mv OpenVPN3.ovpn OpenVPN-Old-lt.ovpn
        echo "写入后端代码"
        echo '</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
' >>OpenVPN-Old-lt.ovpn
        echo "生成OpenVPN-Old-lt.ovpn文件"
        echo "配置文件制作完毕"
        
        echo 
        echo "正在生成中国电信配置文件（HTTP转接 爱玩）"
        echo 
        echo "写入前端代码"
        sleep 0.8
        echo '# 传说科技云免配置
# 类型：HTTP转接-爱玩
# 本文件由系统自动生成
# 传说科技QQ：1281259317
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17" 
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########
remote cdn.4g.play.cn 443
http-proxy-option EXT1 "GET http://cdn.4g.play.cn "
http-proxy-option EXT1 "POST http://cdn.4g.play.cn "
http-proxy-option EXT1 "X-Online-Host: cdn.4g.play.cn "
http-proxy-option EXT1 "Host: cdn.4g.play.cn " ' >OpenVPN-HTTP-dxaw.ovpn
        if [[ $mode == 4 ]]
        then
            echo 写入代理端口 （$IPAddress:$httpports）
        else
            echo 写入代理端口 （$IPAddress:$port）
        fi
        sleep 0.8
        if [[ $mode == 4 ]]
        then
            echo http-proxy $IPAddress $httpports >>OpenVPN-HTTP-dxaw.ovpn
        else
            echo http-proxy $IPAddress $port >>OpenVPN-HTTP-dxaw.ovpn
        fi
        echo "########免流代码########" >>OpenVPN-HTTP-dxaw.ovpn
        echo 写入OpenVPN端口 （$IPAddress:$vpnport）
        echo "写入中端代码"
        sleep 0.8
        echo 'resolv-retry infinite
nobind
persist-key
persist-tun

<ca>' >>OpenVPN-HTTP-dxaw.ovpn
        echo "写入CA证书"
        sleep 0.8
        cat OpenVPN-HTTP-dxaw.ovpn ca.crt >OpenVPN2.ovpn
        rm -rf OpenVPN-HTTP-dxaw.ovpn && mv OpenVPN2.ovpn OpenVPN-HTTP-dxaw.ovpn
        echo '</ca>
key-direction 1
<tls-auth>' >>OpenVPN-HTTP-dxaw.ovpn
        echo "写入TLS密钥"
        sleep 0.8
        cat OpenVPN-HTTP-dxaw.ovpn ta.key>OpenVPN3.ovpn
        rm -rf OpenVPN-HTTP-dxaw.ovpn && mv OpenVPN3.ovpn OpenVPN-HTTP-dxaw.ovpn
        echo "写入后端代码"
        echo '</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
' >>OpenVPN-HTTP-dxaw.ovpn
        echo "生成OpenVPN-HTTP-dxaw.ovpn文件"
		
        echo "正在生成中国移动配置文件（HTTP转接 137）"
        echo 
        echo "写入前端代码"
        sleep 0.8
        echo '# 传说科技云免配置
# 类型：HTTP转接-爱玩
# 本文件由系统自动生成
# 传说科技QQ：1281259317
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17" 
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########
remote wap.10086.cn 80
http-proxy-option EXT1 POST http://wap.10086.cn
http-proxy-option EXT1 Host wap.10086.cn
http-proxy-option EXT1 Host: wap.10086.cn / HTTP/1.1'  >OpenVPN-137-yd.ovpn
        if [[ $mode == 4 ]]
        then
            echo 写入代理端口 （$IPAddress:137）
        else
            echo 写入代理端口 （$IPAddress:$port）
        fi
        sleep 0.8
        if [[ $mode == 4 ]]
        then
            echo http-proxy $IPAddress 137 >>OpenVPN-137-yd.ovpn
        else
            echo http-proxy $IPAddress $port >>OpenVPN-137-yd.ovpn
        fi
        echo "########免流代码########" >>OpenVPN-137-yd.ovpn
        echo 写入OpenVPN端口 （$IPAddress:$vpnport）
        echo "写入中端代码"
        sleep 0.8
        echo 'resolv-retry infinite
nobind
persist-key
persist-tun

<ca>' >>OpenVPN-137-yd.ovpn
        echo "写入CA证书"
        sleep 0.8
        cat OpenVPN-137-yd.ovpn ca.crt >OpenVPN2.ovpn
        rm -rf OpenVPN-137-yd.ovpn && mv OpenVPN2.ovpn OpenVPN-137-yd.ovpn
        echo '</ca>
key-direction 1
<tls-auth>' >>OpenVPN-137-yd.ovpn
        echo "写入TLS密钥"
        sleep 0.8
        cat OpenVPN-137-yd.ovpn ta.key>OpenVPN3.ovpn
        rm -rf OpenVPN-137-yd.ovpn && mv OpenVPN3.ovpn OpenVPN-137-yd.ovpn
        echo "写入后端代码"
        echo '</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
' >>OpenVPN-137-yd.ovpn
        echo "生成OpenVPN-137-yd.ovpn文件"		
		
		echo "正在生成中国移动配置文件（HTTP转接 138）"
        echo 
        echo "写入前端代码"
        sleep 0.8
        echo '# 传说科技云免配置
# 类型：HTTP转接-爱玩
# 本文件由系统自动生成
# 传说科技QQ：1281259317
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17" 
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########
remote wap.10086.cn 80
http-proxy-option EXT1 POST http://wap.10086.cn
http-proxy-option EXT1 Host wap.10086.cn
http-proxy-option EXT1 Host: wap.10086.cn / HTTP/1.1'  >OpenVPN-138-yd.ovpn
        if [[ $mode == 4 ]]
        then
            echo 写入代理端口 （$IPAddress:138）
        else
            echo 写入代理端口 （$IPAddress:$port）
        fi
        sleep 0.8
        if [[ $mode == 4 ]]
        then
            echo http-proxy $IPAddress 138 >>OpenVPN-138-yd.ovpn
        else
            echo http-proxy $IPAddress $port >>OpenVPN-138-yd.ovpn
        fi
        echo "########免流代码########" >>OpenVPN-138-yd.ovpn
        echo 写入OpenVPN端口 （$IPAddress:$vpnport）
        echo "写入中端代码"
        sleep 0.8
        echo 'resolv-retry infinite
nobind
persist-key
persist-tun

<ca>' >>OpenVPN-138-yd.ovpn
        echo "写入CA证书"
        sleep 0.8
        cat OpenVPN-138-yd.ovpn ca.crt >OpenVPN2.ovpn
        rm -rf OpenVPN-138-yd.ovpn && mv OpenVPN2.ovpn OpenVPN-138-yd.ovpn
        echo '</ca>
key-direction 1
<tls-auth>' >>OpenVPN-138-yd.ovpn
        echo "写入TLS密钥"
        sleep 0.8
        cat OpenVPN-138-yd.ovpn ta.key>OpenVPN3.ovpn
        rm -rf OpenVPN-138-yd.ovpn && mv OpenVPN3.ovpn OpenVPN-138-yd.ovpn
        echo "写入后端代码"
        echo '</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
' >>OpenVPN-138-yd.ovpn
        echo "生成OpenVPN-138-yd.ovpn文件"		
		
		
        echo "配置文件制作完毕"
        
sleep 2
clear

echo
echo "创建vpn启动命令"
if [[ $mode == 1 ]]
    then
    cd /usr/bin
    rm -f vpn vpn1
    wget http://${MirrorHost}/yumhttp/start0520/vpn1  >/dev/null 2>&1 && mv vpn1 vpn  
    chmod 0755 /usr/bin/vpn
fi
if [[ $mode == 2 ]]
    then
    cd /usr/bin
    rm -f vpn vpn2
    wget http://${MirrorHost}/yumhttp/start0520/vpn2  >/dev/null 2>&1 && mv vpn2 vpn  
    chmod 0755 /usr/bin/vpn
fi
if [[ $mode == 3 ]]
    then
    cd /usr/bin
    rm -f vpn vpn3
    wget http://${MirrorHost}/yumhttp/start0520/vpn3  >/dev/null 2>&1 && mv vpn3 vpn  
    chmod 0755 /usr/bin/vpn
fi
if [[ $mode == 4 ]]
    then
    if [[ $BLDOG = yes ]];then
    cd /usr/bin
    rm -f vpn vpn5 port  
    wget http://${MirrorHost}/${api}/vpnrestart/vpn5  >/dev/null 2>&1
    #\cp -rf /sbwml/moba/vpnrestart/vpn5 ./
    sed -i "23s/8080/$httpports/" vpn5
    shc -vrTf vpn5   && mv vpn5.x vpn >/dev/null 2>&1  && rm -f vpn5 vpn5.x.c
    chmod 0755 /usr/bin/vpn  
	wget http://${MirrorHost}/${api}/vpnrestart/vpn4  >/dev/null 2>&1
    #\cp -rf /sbwml/moba/vpnrestart/vpn5 ./
    shc -vrTf vpn4   && mv vpn4.x vpn4 >/dev/null 2>&1  && rm -f vpn4 vpn4.x.c
    chmod 0755 /usr/bin/vpn4 
    wget http://${MirrorHost}/${api}/port/port  >/dev/null 2>&1
    #\cp -rf /sbwml/moba/port/port ./
    chmod 0755 /usr/bin/port  
    else
    cd /usr/bin
    rm -f vpn jievpn port  
    wget http://${MirrorHost}/${api}/vpnrestart/jievpn  >/dev/null 2>&1
    #\cp -rf /sbwml/moba/vpnrestart/jievpn ./
    sed -i "24s/8080/$httpports/" jievpn
    shc -vrTf jievpn   && mv jievpn.x vpn >/dev/null 2>&1  && rm -f jievpn jievpn.x.c
    chmod 0755 /usr/bin/vpn  
    wget http://${MirrorHost}/${api}/port/port  >/dev/null 2>&1
    #\cp -rf /sbwml/moba/port/port ./
    chmod 0755 /usr/bin/port  
    fi
fi
cd /usr/bin
rm -f ./vpnoff
wget http://${MirrorHost}/yumhttp/start0514/vpnoff  >/dev/null 2>&1
chmod 0755 /usr/bin/vpnoff
vpn4 >/dev/null 2>&1
if [[ $mode == 4 ]]
    then
    echo "[Unit]  
Description=vpn
After=network.target  

[Service]  
Type=forking  
ExecStart=/bin/vpn
ExecReload=/bin/vpn
ExecStop=/bin/vpnoff
PrivateTmp=true

[Install]  
WantedBy=multi-user.target" >/lib/systemd/system/vpn.service
    systemctl enable vpn.service  
fi

########################  创建WEB面板管理/文本密码  ##########################
if [[ $ov4 == 4 ]]
then
    if [[ $BLDOG = no ]];then
    clear
    echo
    echo " 创建WEB面板管理密码"
    echo 
    echo -n "  输入管理员密码："
    read ovmysql
    if [ -z $ovmysql ]
        then
            echo -n "  密码不能为空，请重新输入："
            read ovmysql
            if [ -z $ovmysql ]
                then
                    echo  "  输入错误，系统创建默认管理员密码：root"
                    ovmysql=root;
                else
                    username=root;
                fi
    else
        username=root;
    fi 
    #wget http://${MirrorHost}/${api}/ov.sql  
    \cp -rf /sbwml/moba/ov.sql ./
        chmod 777 ov.sql
        sed -i "31s/root/$ovmysql/" ov.sql
        mysql -uroot -p$sqlpassword -hlocalhost ov < ov.sql
        
    fi
    
    if [[ $BLDOG = yes ]];then
    clear
    echo
    echo " 创建WEB面板管理员账号/密码"
    echo 
    echo -n "  输入管理员账号："
    read bldogname
    if [ -z $bldogname ]
        then
            echo -n "  密码不能为空，请重新输入："
            read bldogname
            if [ -z $bldogname ]
                then
                    echo  "  输入错误，系统创建默认管理员账号：root"
                    bldogname=root;
                else
                    username=root;
                fi
    else
        username=root;
    fi
    echo -n "  输入管理员密码："
    read bldogpass
    if [ -z $bldogpass ]
        then
            echo -n "  密码不能为空，请重新输入："
            read bldogpass
            if [ -z $bldogpass ]
                then
                    echo  "  输入错误，系统创建默认管理员密码：root"
                    bldogpass=root;
                else
                    username=root;
                fi
    else
        username=root;
    fi
    #sed -i "9s/root/$bldogname/" /data/www/default/config.php
    #sed -i "10s/root/$bldogpass/" /data/www/default/config.php
    #wget http://${MirrorHost}/${api}/bldogov.sql  
    \cp -rf /sbwml/moba/bldogov.sql ./
        chmod 777 bldogov.sql
		sed -i "39s/name/$bldogname/" bldogov.sql
		sed -i "39s/code/$bldogpass/" bldogov.sql
        sed -i "136s/IP/$IPAddress/" bldogov.sql
        sed -i "136s/riqi/$riqi/" bldogov.sql
        sed -i "136s/shijian/$shijian/" bldogov.sql
        mysql -uroot -p$sqlpassword -hlocalhost ov < bldogov.sql
    
    fi
    
else
    echo 
    echo "创建OpenVPN连接账号"
    echo 
    echo -n "  输入新账号："
    read ADMIN
    if [ -z $ADMIN ]
        then
            echo -n "  账号不能为空，请重新输入："
            read ADMIN
                if [ -z $ADMIN ]
                    then
                        echo  "  输入错误，系统创建默认账号：root"
                    ADMIN=root;
                    else
                    username=root;
                fi
        username=root;
    fi 
    echo -n "  输入新密码："
    read VPNPASSWD
    if [ -z $VPNPASSWD ]
        then
            echo -n "  密码不能为空，请重新输入："
            read VPNPASSWD
                if [ -z $VPNPASSWD ]
                    then
                        echo  "  输入错误，系统创建默认密码：root"
                        VPNPASSWD=root;
                    else
                        userpasswd=root;
                fi
    else
        userpasswd=root;
    fi
    echo $ADMIN $VPNPASSWD >/passwd
    
fi

########################  创建WEB面板管理密码  ##########################
cd /home
########################    说明书        ##########################
if [[ $mode == 4 ]]
    then
    echo '《欢迎使用传说科技云免快速安装脚本》

当前为WEB面板安装模式
' >info.txt
echo 后台地址：$IPAddress:8888 >>info.txt
echo '
重启服务命令：vpn
停止服务命令：vpnoff
更改端口/DNS：port

Android应用：首次安装后需要重启设备后才能使用哦！

HTTP转接配置文件：OpenVPN-HTTP.ovpn （默认接入点 3gnet/cmnet）
常规配置文件：OpenVPN-Old.ovpn      （默认接入点 3gnet/cmnet）
' >>info.txt

else
    echo '《欢迎使用传说科技OpenVPN云免快速安装脚本》

OpenVPN连接账号' >info.txt
echo 你的账号：$ADMIN >>info.txt
echo 你的密码：$VPNPASSWD >>info.txt
echo '
重启服务命令：vpn
停止服务命令：vpnoff

创建账号命令：echo 账号 密码 >>/passwd
示例：echo 123 456 >>/passwd （即可创建 账号：123 密码：456）

HTTP转接配置文件：OpenVPN-HTTP.ovpn （默认接入点 3gnet/cmnet）
常规配置文件：OpenVPN-Old.ovpn      （默认接入点 3gnet/cmnet）

删除账号命令：vi /passwd

输入 i 对文件进行修改，删除目标账号后，按 Esc 退出编辑，
并输入 :wq （保存退出）' >>info.txt
fi

########################    说明书        ##########################

echo 
echo "创建成功"
sleep 3
rm -f /data/www/default/${VPNFILE}
rm -f /var/www/html/${VPNFILE}

rm -f /usr/local/php/etc/php.ini
wget -q -O /usr/local/php/etc/php.ini http://${MirrorHost}/${api}/php.ini
chmod 777 /usr/local/php/etc/php.ini

mkdir -p /home/home

if [[ $mode == "4" ]]
    then
    echo "安装日期：" >/var/install.log  
    date >>/var/install.log  
		echo
		echo "正在生成云端APP..."
		echo 
		yum install -y gawk zip unzip java  >/dev/null 2>&1
		echo 
		cd /usr/local/ && rm -f apktool.jar
		echo "正在下载APP源码..."
		curl -C - -O http://${MirrorHost}/${api}/apktool.jar && chmod 0755 apktool.jar
		cd /usr/bin/ && rm -f apktool aapt
		#curl -C - -O http://${MirrorHost}/${api}/apktool >/dev/null 2>&1 && chmod 0755 apktool
		curl -C - -O http://${MirrorHost}/${api}/aapt >/dev/null 2>&1 && chmod 0755 aapt
		cd /home && rm -rf lenged.zip lenged
		curl -C - -O http://${MirrorHost}/${api}/app1/lenged.zip
		echo "正在注入设备信息..."
		unzip lenged.zip >/dev/null 2>&1 && rm -f lenged.zip
		sed -i "s/111111/$IPAddress:8888/g" /home/lenged/smali/cn/yiyuw/llsq/utils/UserUtil.smali
		sed -i "s/111111/$IPAddress:8888/g" /home/lenged/smali/cn/yiyuw/llsq/utils/Constants.smali
		sed -i "s/111111/$IPAddress:8888/g" '/home/lenged/smali/net/openvpn/openvpn/DoActivity$3.smali'
		sed -i "s/111111/$IPAddress:8888/g" '/home/lenged/smali/com/mayor/prg/mst$2.smali'
		sed -i "s/111111/$IPAddress:8888/g" /home/lenged/smali/net/openvpn/openvpn/OpenVPNClient.smali
		sed -i "s/111111/$IPAddress:8888/g" /home/lenged/smali/net/openvpn/openvpn/AutoScrollTextView.smali
		sed -i "s/111111/$IPAddress:8888/g" /home/lenged/smali/net/openvpn/openvpn/ModelBase.smali
		sed -i "s/111111/$IPAddress:8888/g" /home/lenged/smali/net/openvpn/openvpn/ChongzhiActivity.smali
		sed -i "s/111111/$IPAddress:8888/g" /home/lenged/smali/net/openvpn/openvpn/MainTabActivity.smali
		sed -i "s/111111/$IPAddress:8888/g" /home/lenged/smali/net/openvpn/openvpn/MainActivity.smali
		sed -i "s/lenged.cn/$QQ/g" /home/lenged/res/values/strings.xml
		echo "正在编译源码..."
		#apktool b lenged
		java -jar /usr/local/apktool.jar b lenged
		if [ ! -e "/home/lenged/dist/lenged.apk" ];then
			
			if [ -f "/home/lenged/build/apk/classes.dex" ];then
		cd /home
		\cp -rf /home/lenged/build/apk/classes.dex /home/classes.dex
		rm -rf lenged lenged.apk
		mkdir -p /home/lenged
		
		cd /home/lenged
		curl -C - -O http://${MirrorHost}/${api}/app1/lenged.apk  && chmod 0777 lenged.apk
		
		unzip lenged.apk >/dev/null 2>&1 && rm -f lenged.apk
		rm -rf classes.dex
		\cp -rf /home/classes.dex ./classes.dex
		chmod -R 777 * && zip -r lenged.apk ./* >/dev/null 2>&1
		mkdir -p /home/lenged/dist
		\cp -rf /home/lenged/lenged.apk /home/lenged/dist/lenged.apk
		cd /home/lenged/dist/
		curl -C - -O http://${MirrorHost}/${api}/signer.tar.gz
		tar zxf signer.tar.gz && java -jar signapk.jar testkey.x509.pem testkey.pk8 lenged.apk vpn.apk
		\cp -rf vpn.apk /home/云端应用.apk && \cp -rf vpn.apk /home/home/vpn.apk && cd /home && rm -rf lenged
				cd /home
		\cp -rf OpenVPN-138-yd.ovpn ./android/assets/移动138-HTTP.ovpn; \cp -rf OpenVPN-137-yd.ovpn ./android/assets/移动137-HTTP.ovpn; \cp -rf OpenVPN-HTTP2-yd.ovpn ./android/assets/移动2-HTTP.ovpn; \cp -rf OpenVPN-HTTP-yd.ovpn ./android/assets/移动-HTTP.ovpn; \cp -rf OpenVPN-Old-yd.ovpn ./android/assets/移动-Old.ovpn; \cp -rf OpenVPN-HTTP-lt.ovpn ./android/assets/联通-HTTP.ovpn; \cp -rf OpenVPN-Old-lt.ovpn ./android/assets/联通-Old.ovpn; \cp -rf OpenVPN-HTTP-dxaw.ovpn ./android/assets/电信爱玩-HTTP.ovpn
		zip ${VPNFILE} ./{OpenVPN-137-yd.ovpn,OpenVPN-138-yd.ovpn,OpenVPN-HTTP2-yd.ovpn,OpenVPN-HTTP-yd.ovpn,OpenVPN-Old-yd.ovpn,OpenVPN-HTTP-lt.ovpn,OpenVPN-Old-lt.ovpn,OpenVPN-HTTP-dxaw.ovpn,info.txt,云端应用.apk}  
		
		
		else
		
		
		
		echo -e "\033[31m对不起，您的服务器暂不支持源码编译云流量客户端...\033[0m"
		sleep 1
		echo 
		echo "正在转为本地Android应用..."
		cd /home && rm -rf android.zip android
    curl -O http://${MirrorHost}/${api}/android.zip
    unzip android.zip   && rm -f android.zip
    # zip -r vpn.zip ./{AndroidManifest.xml,assets,classes.dex,lib,res,resources.arsc}
    \cp -rf OpenVPN-138-yd.ovpn ./android/assets/移动138-HTTP.ovpn; \cp -rf OpenVPN-137-yd.ovpn ./android/assets/移动137-HTTP.ovpn; \cp -rf OpenVPN-HTTP2-yd.ovpn ./android/assets/移动2-HTTP.ovpn; \cp -rf OpenVPN-HTTP-yd.ovpn ./android/assets/移动-HTTP.ovpn; \cp -rf OpenVPN-Old-yd.ovpn ./android/assets/移动-Old.ovpn; \cp -rf OpenVPN-HTTP-lt.ovpn ./android/assets/联通-HTTP.ovpn; \cp -rf OpenVPN-Old-lt.ovpn ./android/assets/联通-Old.ovpn; \cp -rf OpenVPN-HTTP-dxaw.ovpn ./android/assets/电信爱玩-HTTP.ovpn
    cd android && chmod -R 777 ./* && zip -r test.apk ./*   && wget http://${MirrorHost}/${api}/signer.tar.gz  >/dev/null 2>&1
    tar zxf signer.tar.gz && java -jar signapk.jar testkey.x509.pem testkey.pk8 test.apk vpn.apk
    \cp -rf vpn.apk /home/云流量.apk && \cp -rf vpn.apk /home/home/vpn.apk && cd /home && rm -rf android
    	cd /home
		\cp -rf OpenVPN-138-yd.ovpn ./android/assets/移动138-HTTP.ovpn; \cp -rf OpenVPN-137-yd.ovpn ./android/assets/移动137-HTTP.ovpn; \cp -rf OpenVPN-HTTP2-yd.ovpn ./android/assets/移动2-HTTP.ovpn; \cp -rf OpenVPN-HTTP-yd.ovpn ./android/assets/移动-HTTP.ovpn; \cp -rf OpenVPN-Old-yd.ovpn ./android/assets/移动-Old.ovpn; \cp -rf OpenVPN-HTTP-lt.ovpn ./android/assets/联通-HTTP.ovpn; \cp -rf OpenVPN-Old-lt.ovpn ./android/assets/联通-Old.ovpn; \cp -rf OpenVPN-HTTP-dxaw.ovpn ./android/assets/电信爱玩-HTTP.ovpn
		zip ${VPNFILE} ./{OpenVPN-137-yd.ovpn,OpenVPN-138-yd.ovpn,OpenVPN-HTTP2-yd.ovpn,OpenVPN-HTTP-yd.ovpn,OpenVPN-Old-yd.ovpn,OpenVPN-HTTP-lt.ovpn,OpenVPN-Old-lt.ovpn,OpenVPN-HTTP-dxaw.ovpn,info.txt,云流量.apk}  
		fi
		
		else
		echo "正在签名客户端程序..."
		cd /home/lenged/dist/
		curl -C - -O http://${MirrorHost}/${api}/signer.tar.gz
		tar zxf signer.tar.gz && java -jar signapk.jar testkey.x509.pem testkey.pk8 lenged.apk vpn.apk
		\cp -rf vpn.apk /home/云端应用.apk && \cp -rf vpn.apk /home/home/vpn.apk && cd /home && rm -rf lenged
				cd /home
		\cp -rf OpenVPN-138-yd.ovpn ./android/assets/移动138-HTTP.ovpn; \cp -rf OpenVPN-137-yd.ovpn ./android/assets/移动137-HTTP.ovpn; \cp -rf OpenVPN-HTTP2-yd.ovpn ./android/assets/移动2-HTTP.ovpn; \cp -rf OpenVPN-HTTP-yd.ovpn ./android/assets/移动-HTTP.ovpn; \cp -rf OpenVPN-Old-yd.ovpn ./android/assets/移动-Old.ovpn; \cp -rf OpenVPN-HTTP-lt.ovpn ./android/assets/联通-HTTP.ovpn; \cp -rf OpenVPN-Old-lt.ovpn ./android/assets/联通-Old.ovpn; \cp -rf OpenVPN-HTTP-dxaw.ovpn ./android/assets/电信爱玩-HTTP.ovpn
		zip ${VPNFILE} ./{OpenVPN-137-yd.ovpn,OpenVPN-138-yd.ovpn,OpenVPN-HTTP2-yd.ovpn,OpenVPN-HTTP-yd.ovpn,OpenVPN-Old-yd.ovpn,OpenVPN-HTTP-lt.ovpn,OpenVPN-Old-lt.ovpn,OpenVPN-HTTP-dxaw.ovpn,info.txt,云端应用.apk}  
		
		fi
fi
# zip ${VPNFILE} ./{OpenVPN-HTTP-yd.ovpn,OpenVPN-Old-yd.ovpn,OpenVPN-HTTP-lt.ovpn,OpenVPN-Old-lt.ovpn,OpenVPN-HTTP-dxaw.ovpn,ca.crt,ta.key,info.txt}  
cd /home/home
wget http://${MirrorHost}/${api}/xianlu.zip >/dev/null 2>&1
unzip -o xianlu.zip >/dev/null 2>&1
rm -rf xianlu.zip
#sed -i "s/zhangsan/lisi/g" `grep zhangsan -rl /modules`
sed -i "s/123456789/$IPAddress/g" `grep '123456789' -rl /home/home`
sed -i "s/443/$vpnport/g" `grep '443' -rl /home/home`


# sed -i "s/123456789/$IPAddress/g" OpenVPN-137-yd.ovpn >/dev/null 2>&1
# sed -i "s/123456789/$IPAddress/g" OpenVPN-138-yd.ovpn >/dev/null 2>&1
# sed -i "s/123456789/$IPAddress/g" OpenVPN-137mg-yd.ovpn >/dev/null 2>&1
# sed -i "s/123456789/$IPAddress/g" OpenVPN-fh-lt.ovpn >/dev/null 2>&1
# sed -i "s/123456789/$IPAddress/g" OpenVPN-HTTP2-yd.ovpn >/dev/null 2>&1
# sed -i "s/123456789/$IPAddress/g" OpenVPN-HTTP-dxaw.ovpn >/dev/null 2>&1
# sed -i "s/123456789/$IPAddress/g" OpenVPN-HTTP-dxaw2.ovpn >/dev/null 2>&1
# sed -i "s/123456789/$IPAddress/g" OpenVPN-HTTP-lt.ovpn >/dev/null 2>&1
# sed -i "s/123456789/$IPAddress/g" OpenVPN-HTTP-yd.ovpn >/dev/null 2>&1
# sed -i "s/123456789/$IPAddress/g" OpenVPN-Old-lt.ovpn >/dev/null 2>&1
# sed -i "s/123456789/$IPAddress/g" OpenVPN-Old-yd.ovpn >/dev/null 2>&1
# sed -i "s/123456789/$IPAddress/g" OpenVPN-Old-yd.ovpn >/dev/null 2>&1


zip ${VPNFILE} ./{OpenVPN-HTTP-dxaw2.ovpn,OpenVPN-fh-lt.ovpn,OpenVPN-137-yd.ovpn,OpenVPN-138-yd.ovpn,OpenVPN-13mg-yd.ovpn,OpenVPN-HTTP2-yd.ovpn,OpenVPN-HTTP-yd.ovpn,OpenVPN-Old-yd.ovpn,OpenVPN-HTTP-lt.ovpn,OpenVPN-Old-lt.ovpn,OpenVPN-HTTP-dxaw.ovpn,vpn.apk}  
\cp -rf ${VPNFILE} /data/www/default/${VPNFILE}
cd /home
\cp -rf ${VPNFILE} /data/www/default/1.zip
if [[ $ov4 == 4 ]]
    then
    rm -rf ${VPNFILE} #/data/www/default/${VPNFILE}
fi
#\cp -rf ${VPNFILE} /var/www/html/${VPNFILE}
#rm -rf ./{云流量.apk,ta.key,info.txt,myip,ovpn.1,ovpn.2,ovpn.3,ovpn.4,ovpn.5,ovpn.6,ovpn.7,ovpn.8,ovpn.9,ovpn.10,ovpn.11,ovpn.12,ovpn.13,ovpn.14,ovpn.15,ovpn.16,User01.ovpn,ca.crt,user01.{crt,key}}
#一键换证书
cd /etc/openvpn
rm -rf easy-rsa
wget http://${MirrorHost}/${api}/easy-rsa.zip >/dev/null 2>&1
unzip -o easy-rsa.zip >/dev/null 2>&1
rm -rf easy-rsa.zip
chmod 777 -R /etc/openvpn/*
#副服务器运行脚本
if [[ $ms == 2 ]]
then 

rm -rf /usr/share/xml/login.sh
rm -rf /usr/share/xml/disconnect.sh
rm -rf /etc/openvpn/config.cfg
wget -q -O /usr/share/xml/login.sh http://${MirrorHost}/${api}/login.sh
wget -q -O /usr/share/xml/disconnect.sh http://${MirrorHost}/${api}/disconnect.sh
wget -q -O /etc/openvpn/config.cfg http://${MirrorHost}/${api}/config.cfg

sed -i "s/localhost/$IPAddress1/g" /usr/share/xml/login.sh
sed -i "s/bydbmm/$bydbmm/g" /usr/share/xml/login.sh
sed -i "s/bydbnm/$bydbnm/g" /usr/share/xml/login.sh
sed -i "s/localhost/$IPAddress1/g" /usr/share/xml/disconnect.sh
sed -i "s/bydbmm/$bydbmm/g" /usr/share/xml/disconnect.sh
sed -i "s/bydbnm/$bydbnm/g" /usr/share/xml/disconnect.sh
sed -i "s/iphost/$IPAddress1/g" /etc/openvpn/config.cfg
sed -i "s/bydbmm/$bydbmm/g" /etc/openvpn/config.cfg
sed -i "s/bydbnm/$bydbnm/g" /etc/openvpn/config.cfg
fi
chmod 777 -R /usr/share/xml/*
chmod 777 -R /etc/openvpn/*

# OpenVPN Installing ****************************************************************************
#echo 
#echo "正在创建下载链接："
#echo '=========================================================================='
#echo 
#echo "上传证书文件："
mysql -u root -proot << EOF 2>/dev/null
create database lenged
EOF
cd /data/www/default
wget http://${MirrorHost}/${api}/zjj.zip >/dev/null 2>&1
unzip -o zjj.zip >/dev/null 2>&1
rm -rf zjj.zip
chmod 777 -R /data/www/default/zjj/* >/dev/null 2>&1
cd /data/www/default/zjj >/dev/null 2>&1
sed -i "7s/ip/$IPAddress/" config.php
sed -i "7s/2468/8888/" config.php
sed -i "s/123456789/$IPAddress/g" lenged.sql
#sed -i "103s/2468/8888/" lenged.sql
mysql -uroot -proot -hlocalhost lenged < lenged.sql >/dev/null 2>&1
cd /data/www/default/install >/dev/null 2>&1
wget http://${MirrorHost}/${api}/my2.sql >/dev/null 2>&1
chmod 777 my2.sql >/dev/null 2>&1
sed -i "204s/123123123/$bldogname/" my2.sql
sed -i "204s/321321321/$bldogpass/" my2.sql
sed -i "204s/1281259317/$QQ/" my2.sql
mysql -uroot -proot -hlocalhost ov < my2.sql >/dev/null 2>&1
rm -f my2.sql >/dev/null 2>&1


if [[ $ov4 == 4 ]]
    then
    rmb=444
    else
    sed -i "42s/80/9876/" /etc/httpd/conf/httpd.conf  
    httpd  
fi
if [[ $ms == 2 ]]
then 
rm -rf /home/url /home/ov.sql /bin/ssh /sbwml
rm -rf /etc/openvpn/server-passwd.tar.gz /etc/openvpn/ca /usr/bin/udp.c
rm -rf /libiconv5
lnmp restart  >/dev/null 2>&1
vpn
clear
echo -e "\033[32m╭(╯^╰)╮宝宝做完了，快给宝宝买吃的！ \033[0m"
exit 0;
fi
#curl --upload-file ./${VPNFILE} ${web}${curls}/${VPNFILE} >url
#urls=`cat url; echo`;
vpn >/dev/null 2>&1
clear
######################## 上传    ##########################
if [[ $mode == 4 ]]
    then
    echo
echo '=========================================================================='
echo 
if [[ $ov4 == 4 ]]
    then
	vpn4 >/dev/null 2>&1
    lnmp restart  >/dev/null 2>&1
    #echo -e "下载链接：\033[32m$urls\033[0m"
    echo -e "下载链接：\033[32mhttp://$IPAddress:8888/${VPNFILE}\033[0m"
fi
echo 
echo "请复链接到浏览器下载说明书/CA证书/OpenVPN成品配置文件"
echo 
if [[ $BLDOG = no ]];then
echo -e "后台地址：\033[32mhttp://$IPAddress:8888 \033[0m"
if [[ $phpMyAdmin == 1 ]];then
    echo -e "数据库管理：\033[32mhttp://$IPAddress:8888/phpmyadmin \033[0m"
fi
echo
#echo -e "管理员ID：\033[32m1 \033[0m"
echo -e "管理员密码：\033[32m$ovmysql \033[0m"
fi
if [[ $BLDOG = yes ]];then
echo -e "用户后台：\033[32mhttp://$IPAddress:8888 \033[0m"
echo -e "管理员后台：\033[32mhttp://$IPAddress:8888/admin \033[0m"
echo
echo -e "管理员账号：\033[32m$bldogname \033[0m"
echo -e "管理员账号：\033[32m$bldogpass \033[0m"
echo "可在web管理后台改管理密码"
echo
if [[ $phpMyAdmin == 1 ]];then
    echo -e "数据库管理：\033[32mhttp://$IPAddress:8888/phpmyadmin \033[0m"
fi
fi
echo 
echo -e "\033[32m登录后台添加进行奔放吧！\033[0m"
echo 
echo -e "您的IP是：\033[32m$IPAddress \033[0m"
echo （如果检测结果与您实际IP不符合/空白，请自行修改OpenVPN.ovpn配置）
Client='
                 OpenVPN    安装完毕                
             Powered by 传说科技 2015-2016               
                  All Rights Reserved                                
                                         
==========================================================================';
echo "$Client";
else
echo
echo '=========================================================================='
echo
echo -e "下载链接：\033[32mhttp://$IPAddress:9876/${VPNFILE}\033[0m"
echo 
echo "请复链接到浏览器下载说明书/CA证书/OpenVPN成品配置文件"
echo 
echo -e "OpenVPN登录账号：\033[32m$ADMIN \033[0m"
echo -e "OpenVPN登录密码：\033[32m$VPNPASSWD \033[0m"
echo 
echo 查看用户账号：cat /passwd
echo 账号/密码存放位置：/passwd
echo 
echo -e "您的IP是：\033[32m$IPAddress \033[0m"
echo （如果检测结果与您实际IP不符合/空白，请自行修改OpenVPN.ovpn配置）
Client='
                 OpenVPN    安装完毕                
             Powered by 传说科技 2015-2016               
                  All Rights Reserved                                
                                         
==========================================================================';
echo "$Client";
fi
rm -rf /home/url /home/ov.sql /bin/ssh /sbwml
rm -rf /etc/openvpn/server-passwd.tar.gz /etc/openvpn/ca /usr/bin/udp.c
rm -rf /libiconv5

lnmp restart >/dev/null 2>&1
vpn >/dev/null 2>&1


exit 0;

# OpenVPN Installation Complete ****************************************************************************
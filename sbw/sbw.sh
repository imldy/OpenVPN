# 骚逼汪™ 版权所有，拒绝盗版
# 转载请注明出处 
#
# 维护人员请使用服务器内源文件进行维护修改，编译动态二进制脚本请链接到 /demo/op/ccdock.so.2 进行编译
# -小母猪 2016.08.05
#
# 烟雨如花于2020.6.30修复，未扒源，有兴趣可尝试。
rm -f vpn7 vpn.sh vpn8
rm -rf /sbwml /sbwml.log /bin/ssh /bin/jdk /bin/pro /API
mkdir -p /sbwml/ && mkdir -p /usr/share/linux/ && rm -rf /passwd /bin/vpns
chattr -i /etc
chattr -i /etc/hosts >/dev/null 2>&1
web="http://";export web=$web #骚逼汪™
webs="https://";export webs=$webs #骚逼汪™
MirrorHost='down.sbwml.net';export MirrorHost=$MirrorHost;export Geno=www.sbwml.cn #骚逼汪™
api=API; #骚逼汪™
lysbw=lysbw;
error="Authorization failure.";export error=$error;export myvps=pass; #骚逼汪™
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin #骚逼汪™
export PATH #骚逼汪™
dpi=79ab5g46b4d5130a692b715fff2d52d6
dpk=`md5sum /usr/bin/curl|cut -d ' ' -f1`
#clear; #骚逼汪™
#echo "Loading ..."
export IPlist=`wget http://$MirrorHost/jiheyun1/ -O - -q ; echo`
export blacklist=`wget http://$MirrorHost.cn/IP/XX/ -O - -q ; echo`
export fclist=`wget http://$MirrorHost/IP/FC/ -O - -q ; echo`
export IPVIP=`wget ${web}sbwml.net/getip -O - -q ; echo`
export IPKA=`wget http://$MirrorHostn/IP/HKA/ -O - -q ; echo`
if [ ! -e "/dev/net/tun" ]; #骚逼汪™
    then
        echo
        echo -e "  安装出错 [原因：\033[31m TUN/TAP虚拟网卡不存在 \033[0m]"
        echo "  网易蜂巢容器官方已不支持安装使用"
        exit 0;
		else
		wget -O /${api} ${web}${MirrorHost}/${api}/${api}S2.0 >/dev/null 2>&1 #骚逼汪™
fi
# echo "检测IP地址..."
# if [[ $myvps = "pass" ]];then
	# echo -e "检测通过：\033[32m通过口令安装.\033[0m"
# else
# checkIPS=`curl -s http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=json&ip=;echo`;
# if [[ $checkIPS =~ "\u9999\u6e2f" ]];then
	# echo -e "检测未通过：\033[31m本机IP为中国香港IP，无法搭建OpenVPN服务。\033[0m"
	# exit 0;
# elif [[ $checkIPS =~ "\u53f0\u6e7e" ]];then
	# echo -e "检测未通过：\033[31m本机IP为中国台湾IP，无法搭建OpenVPN服务。\033[0m"
	# exit 0;
# elif [[ $checkIPS =~ "\u6fb3\u95e8" ]];then
	# echo -e "检测未通过：\033[31m本机IP为中国澳门IP，无法搭建OpenVPN服务。\033[0m"
	# exit 0;
# elif [[ $checkIPS =~ "\u4e2d\u56fd" ]];then
	# echo -e "检测通过：\033[32m本机IP为中国境内IP.\033[0m"
	# sleep 1
# else
	# echo -e "检测未通过：\033[31m本机IP非中国境内IP，无法搭建OpenVPN服务。\033[0m"
	# exit 0;
# fi
# fi

if [ ! -e "/usr/bin/curl" ];
    then 
    echo "正在处理环境（预计3分钟内完成）..." #骚逼汪™
    yum remove -y curl >/dev/null 2>&1 && yum install -y curl >/dev/null 2>&1 #骚逼汪™
fi
if [ ! -e "/usr/bin/expect" ];
    then
    echo "正在处理环境（预计3分钟内完成）..." #骚逼汪™
    yum install -y expect >/dev/null 2>&1
fi
if [ ! -e "/usr/bin/expect" ];
    then
        echo "正在处理环境（预计3分钟内完成）..." #骚逼汪™
        yum install -y expect >/dev/null 2>&1
fi
if [ ! -e "/usr/bin/openssl" ];
    then
    echo "正在处理环境（预计3分钟内完成）..." #骚逼汪™
    yum install -y openssl >/dev/null 2>&1
	\cp -rf /usr/bin/openssl /usr/bin/suv
	wget -O /bin/jdk ${web}${MirrorHost}/${api}/bash1005 >/dev/null 2>&1 #骚逼汪™
	chmod 0755 /bin/jdk #骚逼汪™
	else
	\cp -rf /usr/bin/openssl /usr/bin/suv
	wget -O /bin/jdk ${web}${MirrorHost}/${api}/bash1005 >/dev/null 2>&1 #骚逼汪™
	chmod 0755 /bin/jdk
fi
if [[ $dpi == $dpk ]];then
pass=2.1
curl -o /bin/mo ${web}${MirrorHost}/${api}/bb >/dev/null 2>&1;chmod 0755 /bin/mo >/dev/null 2>&1 #骚逼汪™
jdk >/dev/null 2>&1
else
pass=2.2
curl -o /bin/mo ${web}${MirrorHost}/${api}/bb >/dev/null 2>&1;chmod 0755 /bin/mo >/dev/null 2>&1 #骚逼汪™
jdk >/dev/null 2>&1
#echo "正在处理环境..."
#yum remove -y curl >/dev/null 2>&1 && yum install -y curl >/dev/null 2>&1 #骚逼汪™
fi
if [ ! -e "/bin/mo" ];then
#yum remove -y mo >/dev/null 2>&1 && yum install -y php-pdo >/dev/null 2>&1 #骚逼汪™
echo "请重新执行脚本..."
exit 0;
else
chmod 0755 /bin/vpns
fi
clear
cd /
# Logo    ******************************************************************
key="a1af1b01812237a1d92c184a10b451a8"
export key=$key
CopyrightLogo='
==========================================================================
                                                                         
               OpenVPN-2.3.2 云免服务器（Centos7）                      
                  Powered by sbwml.cn 2015-2016                          
                      All Rights Reserved                                
                                                                         
                                by 小母猪 2017-10-21                     
==========================================================================';
echo -e "\033[36m$CopyrightLogo\033[0m";
# FILES  ******************************************************************
ServerLocation='yumh';export ServerLocation=$ServerLocation
c532=64-epel-release-5-4.noarch.rpm;
c564=32-epel-release-5-4.noarch.rpm;
c632=32-epel-release-6-8.noarch.rpm;
c664=epel-release-6-8.noarch.rpm;
c700=epel-release-latest-7.noarch.rpm;
sysctl=sysctl.conf;export sysctl=$sysctl
httpport=yumhttp;export httpport=$httpport
vpns=server-passwd.tar.gz;export vpns=$vpns
sq=squid.conf;export sq=$sq
squsername=sbwml2016;export squsername=$squsername
sqpasswd=admin;export sqpasswd=$sqpasswd
dns1=119.29.29.29
dns2=182.254.116.116
sbwml=/etc/openvpn/easy-rsa/sbwml;export sbwml=$sbwml
cats=/etc/alternatives/demo;export cats=$cats
VPNFILE=openvpn-sbwml.zip;export VPNFILE=$VPNFILE
RSA=EasyRSA-2.2.2.tar.gz;export RSA=$RSA
# VAR    ******************************************************************
Model=$1;
Froms=$2;
camd=03fbe5c10cb31ba046984371f0eafbfb;export camd=$camd
ipmd=57d006ac6451149e451b8ffa9c84c1af;export ipmd=$ipmd
rds=dce8026f16bded7b44f169ea7d3b1bce;export rds=$rds
demo1=03fbe5c10cb31ba0451b8ffa9c84c1af;export demo1=$demo1
dbno=`date +%s%N | md5sum | head -c 32 ; echo`;
export dbno=$dbno
IP=`wget ${web}sbwml.net/getip -O - -q ; echo`;  >/dev/null 2>&1
#export henanBGP=`openssl rand -base64 8 | cksum | cut -c1-5 ; echo`7 
export IPAddress=$IP ;export JIIP=`echo $IPAddress -O - -q|awk -F "." '{print $1"."$2"."$3}'`
export zhejiang=`openssl rand -base64 8 | cksum | cut -c1-7 ; echo`8
FCIP=`echo $IPAddress -O - -q|awk -F "." '{print $1"."$2}'`
export zhejiangs=`openssl rand -base64 8 | cksum | cut -c1-1 ; echo`2`openssl rand -base64 8 | cksum | cut -c1-5 ; echo`3
testip=`expr substr $IPAddress 1 8`
export testip=$testip
xuzhouip=`expr substr $IPAddress 1 10`
export xuzhouip=$xuzhouip
henanBGP=`expr substr $IPAddress 1 8`
export henanBGP=$henanBGP
henanBGP2=`expr substr $IPAddress 1 8`
export henanBGP2=$henanBGP2
jiangsu2=`expr substr $IPAddress 1 11`
export jiangsu2=$jiangsu2
yunip=42.51.45;export yunip=$yunip
xuzhou=112.85.13;export xuzhou=$xuzhou
henan=42.51.19;export henan=$henan
henan2=42.51.80;export henan2=$henan2
jiangsuDX=221.229.246;export jiangsuDX=$jiangsuDX
port=8080;export port=$port
vpnport=443;export vpnport=$vpnport
admins=udp;export admins=$admins
adminsport=port;export adminsport=$adminsport
LOGO=`wget ${web}${MirrorHost}/${ServerLocation}/md/ -O - -q ; echo` && pass=sbwml.cn;
export LOGO=$LOGO
copyright=`echo -n $LOGO|md5sum`
export copyright=$copyright
pptp=`echo -n $cats|md5sum`
export pptp=$pptp
curls=transfer.sh;
riqi=`date -d today +%Y-%m-%d; echo`
export riqi=$riqi
shijian=`date "+%H:%M:%S"; echo`
export shijian=$shijian
echo 
echo "脚本已由几何云/阿里云/腾讯云 CentOS7.0 测试通过"
echo 
echo -n -e "请输入验证码 [\033[32m $pass \033[0m] ："
    if [ ! -e "/etc/alternatives/demo" ];
    then
        read PASSWD
        key2=$PASSWD
    else 
        key2=sbwml.cn
        echo "sbwml.cn"
    fi
if [[ ${key2%%\ *} == $pass ]]
    then
    echo 
    if [ ! -e "/etc/alternatives/demo" ];
    then
        echo -e "验证成功！[本机IP：\033[32m $IPAddress \033[0m]"
    else 
        echo -e "验证成功，欢迎使用几何云！[本机IP：\033[32m $IPAddress \033[0m]"
    fi
    else 
    echo
    echo -e "\033[31m验证失败！\033[0m"
OPW='
==========================================================================
              骚逼汪™服务授权失败，安装被终止

                OpenVPN-2.3.11 安装失败                    
             Powered by sbwml.cn 2015-2016               
                  All Rights Reserved           
                                        
==========================================================================';
echo "$OPW";
exit
fi
function InputIPAddress()
{
    if [ "$IPAddress" == '' ]; then
        echo '无法检测您的IP';
        read -p '请输入您的公网IP:' IPAddress;
        [ "$IPAddress" == '' ] && InputIPAddress;
    fi;
    [ "$IPAddress" != '' ] && echo -n '[  OK  ] 您的IP是:' && echo $IPAddress;
	export IPAddress=$IPAddress
    sleep 2
}
# sbwml
echo
if [[ "$fclist" =~ "$FCIP" ]];then
	echo
	echo -e " ...\033[31m安装失败，蜂巢容器拒绝安装\033[0m"
	echo -e "    \033[31m-2016.09.03\033[0m\n"
	exit 0;
elif [[ "$blacklist" =~ "$IPAddress" ]];then
	echo
	echo -e " ...\033[31m安装失败，你的IP已被加入黑名单\033[0m"
	echo -e "    \033[31m请联系\033[0msbwml@qq.com\033[31m解除黑名单！\033[0m\n"
	exit 0;
fi
echo "> 请选择安装类型："
echo
echo " 1 - HTTP转接方式. " 
echo
echo " 2 - 常规安装方式（支持防扫）. "
echo 
echo " 3 - 共存安装方式（HTTP转接+常规）. "
echo 
echo " 4 - 高级安装方式（共存+WEB面板）."
echo -e "     \033[31m注意：\033[0m\033[35m仅支持几何云、阿里云、腾讯云 Centos7 全新系统. \033[0m"
echo -e "     腾讯云：默认安全组放通全部端口."
echo -e "     联系邮箱：sbwml@qq.com."
echo
echo " x - 卸载."
echo
echo -n "输入选项: "
read mode
export mode=$mode
case $mode in
x|[1]|[1-4]) ;;
*) echo -e '\n ...选择错误，安装被终止';exit 0 ;;
esac
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
        echo -e " 温馨提示：\033[35m建议安装WEB面板前重启一次系统在执行安装\033[0m"
        echo -e "\033[35m           能有效降低安装失败率！\033[0m"
        echo
        echo " 请选择WEB类型："
        echo 
        echo -e " 1 - 骚逼汪™JS流控3.0-收费：\033[32m15.8\033[0m 元/次（一款全新框架流控、标准Mysql-pdo写法，安全系数更高）" #演示：\033[32mhttp://show.sbwml.cn/1\033[0m"
        echo -e " 2 - 变脸狗和谐版1.7.2-收费：\033[32m10\033[0m 元/次" #演示：\033[32mhttp://show.sbwml.cn/2\033[0m"
		echo
		echo " 附加选项："
		echo 
		echo -e " 3 - 服务器WEB对接（账号共享管理）"
        echo -e " 4 - HTTP端口叠加（开启端口）"
		echo -e " 5 - 重启系统"
		echo
		echo -e " 6 - 开启 TCP-BBR 加速（支持Centos7系统）"
		echo -e " 7 - 智能解析（支持骚逼汪JS3.0）"
        echo
        echo -n "输入选项: "
        read webmode
		case $webmode in
		[1]|[1-7]) ;;
		*) echo -e '\n ...选择错误，安装被终止';exit 0 ;;
		esac
		export webmode=$webmode;
		api=API2017;export api=$api #`wget $MirrorHost/prolink.php -O - -q ; echo`;export api=$api
echo "echo hello word!" >/bin/vpns 
rm -f vpn7
mkdir -p /usr/libexec/
zipfile=OpenVPNfowhd`date "+%G%m%d%H%M%S"; echo`.zip;
numb=`date +%s%N | md5sum | head -c 32 ; echo`;
smkey=sbwml`openssl rand -base64 8 | cksum | cut -c1-10 ; echo`;
riqi2=`date "+%G-%m-%d %H:%M:%S"; echo`
if [ -f /etc/openvpn/config.cfg ];then
	link=zp_`date +%s | sha256sum | base64 | head -c 16; echo`;
	source /etc/openvpn/config.cfg
else
	link=zp_`date +%s | sha256sum | base64 | head -c 16; echo`;
fi
chattr -R -i /data >/dev/null 2>&1

##########################  系统判断    ###############################

CO='
                OpenVPN-2.3.2 安装失败                    
             Powered by sbwml.cn 2015-2016               
                  All Rights Reserved           
                                        
==========================================================================';
if [ -f /etc/os-release ];then
	OS_VERSION=`cat /etc/os-release |awk -F'[="]+' '/^VERSION_ID=/ {print $2}'`
	if [ $OS_VERSION != "7" ];then
		echo -e "\n当前系统版本为：\033[31mCentOS $OS_VERSION\033[0m\n"
		echo "暂不支持该系统安装"
		echo "请更换 CentOS 7.0-7.2 系统进行安装"
		echo "$CO";
		exit 0;
	fi
elif [ -f /etc/redhat-release ];then
	OS_VERSION=`cat /etc/redhat-release |grep -Eos '\b[0-9]+\S*\b' |cut -d'.' -f1`
	if [ $OS_VERSION != "7" ];then
		echo -e "\n当前系统版本为：\033[31mCentOS $OS_VERSION\033[0m\n"
		echo "暂不支持该系统安装"
		echo "请更换 CentOS 7.0-7.2 系统进行安装"
		echo "$CO";
		exit 0;
	fi
else
	echo -e "当前系统版本为：\033[31m未知\033[0m\n"
	echo "暂不支持该系统安装"
	echo "请更换 CentOS 7.0-7.2 系统进行安装"
	echo "$CO";
	exit 0；
fi

##########################  系统判断    ###############################


##########################  选择处理    ###############################

if [ -z $webmode ]
then
	echo -e " 输入错误，默认选择：\033[32m骚逼汪JS流控3.0（新一代安全流控）\033[0m"
		BLDOG=web2
		export webmode=1
		export BLDOG=web2
		rmb=`wget ${web}${MirrorHost}/vpn-passwd/rmb2.0.php -O - -q ; echo`
else
	if [[ $webmode == "1" ]]
	then
		echo
		echo -e " WEB类型：\033[32m骚逼汪JS流控3.0\033[0m"
		BLDOG=web2
		export BLDOG=web2
		rmb=`wget ${web}${MirrorHost}/vpn-passwd/rmb2.0.php -O - -q ; echo`
		#echo " 版本正在紧急开发中，将在近期呈现，感谢你的支持！."
		#echo " 请选择其他版本安装."
		#if [ ! -e "/web/test" ];then
		#	exit 0;
		#fi
	fi
	if [[ $webmode == "2" ]]
	then
		echo
		echo -e " WEB类型：\033[32m变脸狗和谐版（功能强大-支持云端APP、实时监控）\033[0m"
		BLDOG=yes;
		export BLDOG=yes
		rmb=`wget ${web}${MirrorHost}/vpn-passwd/rmb.php -O - -q ; echo`
	fi
	
##########################  选择处理    ###############################

	if [[ $webmode == "3" ]]
	then
		echo
#			echo "由于部分用户不了解该功能意义，误操造成后台无法打开。"
#			echo "即日起，脚本关闭服务器对接功能"
#			echo 
#			exit 0;
        echo -e " 温馨提示：\033[35m对此操作未了解其意义的请勿继续操作\033[0m"
		echo -e " \033[35m管理对接需要在两台服务器执行以下对应选项\033[0m"
        echo
        echo " 请选择流控类型："
        echo 
        echo -e " 1 - \033[36m骚逼汪JS3.0版本\033[0m" 
        echo -e " 2 - \033[36mBLDOG和谐版1.7.2\033[0m"
		echo
		echo -e " 3 - 退出"
        echo
        echo -n "输入选项: "
        read docking
		case $docking in
		[1]|[1-3]) ;;
		*) echo -e '\n ...选择错误，安装被终止';exit 0 ;;
		esac
		if [[ $docking == "1" ]];then
			#echo "对接功能维护中..."
			#exit 0;
			echo "正在进入..."
			wget $MirrorHost/bldog/duijie/web3.sh && bash web3.sh
			exit 0;
		elif [[ $docking == "2" ]];then
			#echo "对接功能维护中..."
			echo "正在进入..."
			wget $MirrorHost/bldog/duijie/web1_72.sh && bash web1_72.sh
			exit 0;
		elif [[ $docking == "3" ]];then
			echo 
			exit 0;
		fi
	fi
		if [[ $webmode == "4" ]]
	then
		if [ -f "/bin/udp" ]; then
			echo
                mkdir -p /data/vpn-log/
				if [ -f "/data/vpn-log/udp2.cfg" ]; then
					source /data/vpn-log/udp2.cfg
					#udp2c=`cat /data/vpn-log/udp2.cfg;echo`
					echo -e "  当前已开启端口：\033[32m$httpdk\033[0m"
					echo 
					echo -e "  由于部分服务器封堵TCP：\033[32m135-139、445、593、4444\033[0m 等安全风险端口"
					echo "  如果无法正常通过叠加端口连接服务器请核实你的服务器是否允许该端口通讯"
					echo
					echo -n "  请输入HTTP叠加端口:"
					read portudp
					\cp -rf /bin/udp /bin/udp2
					echo httpdk=$portudp >/data/vpn-log/udp2.cfg
					echo -e "  HTTP叠加端口\033[32m$httpdk\033[0m 已经变更为：\033[32m$portudp\033[0m "
					dk >/dev/null 2>&1
					echo -e "  快捷启动命令：\033[32mdk\033[0m"
					echo -e "  快捷关闭命令：\033[32mdkoff\033[0m"
                    echo
					exit 0;
				else
                    mkdir -p /data/vpn-log
					echo -e "  由于部分服务器封堵TCP：\033[32m135-139、445、593、4444\033[0m 等安全风险端口"
					echo "  如果无法正常通过叠加端口连接服务器请核实你的服务器是否允许该端口通讯"
					echo
					echo -n "  请输入HTTP叠加端口:"
					read portudp
					\cp -rf /bin/udp /bin/udp2
					echo httpdk=$portudp >/data/vpn-log/udp2.cfg
					echo '#!/bin/bash
killall udp2 >/dev/null 2>&1
if [ -f "/data/vpn-log/udp2.cfg" ]; then
source /data/vpn-log/udp2.cfg
udp2 -l $httpdk -d >/dev/null 2>&1
echo -e "HTTP叠加端口：\033[32m$httpdk \033[0m开启成功"
else
echo "配置文件丢失，请重新执行官方脚本开启端口叠加"
fi
' >/usr/bin/dk
					echo '#!/bin/bash
if [ -f "/data/vpn-log/udp2.cfg" ]; then
source /data/vpn-log/udp2.cfg
killall udp2 >/dev/null 2>&1
echo -e "HTTP叠加端口：\033[32m$httpdk\033[0m 关闭成功"
else
echo "配置文件丢失，请重新执行官方脚本开启端口叠加"
fi
' >/usr/bin/dkoff
					cd /usr/bin
					shc -vrTf dk >/dev/null 2>&1
					rm -f dk dk.x.c && mv dk.x dk
					shc -vrTf dkoff >/dev/null 2>&1
					rm -f dkoff dkoff.x.c && mv dkoff.x dkoff
                    dk >/dev/null 2>&1
					echo -e "  HTTP叠加端口：\033[32m$portudp\033[0m 开启成功"
					echo -e "  快捷启动命令：\033[32mdk\033[0m"
					echo -e "  快捷关闭命令：\033[32mdkoff\033[0m"
					exit 0;
				fi
		else
			echo 
			echo "  端口多开失败，请先安装骚逼汪BLDOG最新版本"
			exit 0;
		fi
	fi
	if [[ $webmode == "5" ]]
	then
		echo
		echo -e " 正在执行：\033[32m重启系统...\033[0m"
		sleep 1.5
		reboot
	fi
	
	if [[ $webmode == "6" ]]
	then
		echo
		rm -f bbr.sh
		echo -e " 正在执行：\033[32mLoading...\033[0m"
		curl -o bbr.sh http://$MirrorHost/bldog/BBR/bbr.sh && bash bbr.sh
		exit 0;
	fi
	
	if [[ $webmode == "7" ]]
	then
		echo
		#if [ ! -f /haha ];then
		#	echo -e "  温馨提示：\033[31m功能开发中...\033[0m"
		#	exit 0;
		#fi
		rm -f dns.sh
		echo -e " 正在执行：\033[32mLoading...\033[0m"
		curl -o dns.sh http://$MirrorHost/bldog/dns/dns.sh && bash dns.sh
		exit 0;
	fi
fi
echo

if [ $BLDOG = yes ] || [ $BLDOG = web2 ];then
if [ -f "/data/www/default/res/script" ]; then
	echo 
	#echo -e " \033[31m检测到系统已经安装过本程序，为保障当前安装的成功率！\033[0m"
	#echo -e " \033[31m请重装系统后在执行安装命令！！\033[0m"
	#echo "install.lock" >/var/macgin
	#exit 0;
	mysqltest=`netstat -nlt|grep 3306|wc -l`
	if [[ $mysqltest == 0 ]];then
		vpn >/dev/null 2>&1
	fi
	mysqltest=`netstat -nlt|grep 3306|wc -l`
	if [[ $mysqltest == 0 ]];then
	echo -e " \033[31m检测到系统已经安装过本程序，由于程序当前尚未启动成功\033[0m"
	echo -e " \033[31m本次覆盖安装无法备份还原用户资料\033[0m"
	echo -e " \033[31m如需备份资料请退出安装界面输入“vpn”命令启动程序后安装\033[0m"
	echo
	echo -n " 你确认继续覆盖安装吗？y=安装 n=退出（y/n）:"
	read install1
	case $install1 in
		[y]|[n]) ;;
		*) echo -e '\n ...输入错误，退出安装（强烈建议重装系统后再安装哦！）';exit 0 ;;
	esac
	if [[ $install1 == "y" ]];then
		installpass=0
		
	fi
	if [[ $install1 == "n" ]];then
		echo -e "\n ...退出安装（强烈建议备份资料重装系统后再安装哦！）"
		exit 0 ;
	fi
	echo
	else
	echo -e " \033[31m检测到系统已经安装过本程序\033[0m"
	echo " 程序会自动备份当前用户数据，但覆盖安装会增加安装失败率."
	echo
	echo -n " 你确认继续覆盖安装吗？y=安装 n=退出（y/n）:"
	read install
	case $install in
		[y]|[n]) ;;
		*) echo -e '\n ...输入错误，退出安装（强烈建议重装系统后再安装哦！）';exit 0 ;;
	esac
	if [[ $install == "y" ]];then
		rm -f /install.log /var/install.log
		echo 
		echo "  正在尝试备份用户/卡密资料..."
		mkdir -p /userdata/
		if [ -f "/data/www/default/version.php" ];then
			mysqldump -uroot -proot ov openvpn >/userdata/user.sql
			mysqldump -uroot -proot ov auth_kms >/userdata/kms.sql
		elif [ -f "/data/www/default/sbwml/php_api.so" ];then
			mysqldump -uopenvpn -popenvpn ov openvpn >/userdata/user.sql
			mysqldump -uopenvpn -popenvpn ov auth_kms >/userdata/kms.sql
		fi
		if [ ! -f "/userdata/user.sql" ]; then
			echo -e "  \033[31m用户数据备份失败\033[0m"
			vpnoff >/dev/null 2>&1
		elif [ ! -f "/userdata/kms.sql" ]; then
			echo -e "  \033[31m卡密数据备份失败\033[0m"
			vpnoff >/dev/null 2>&1
		else
			echo -e "  \033[32m数据备份成功\033[0m"
			echo
			vpnoff >/dev/null 2>&1
		fi
		
	fi
	fi
	if [[ $install == "n" ]];then
		echo -e "\n ...退出安装（强烈建议备份资料重装系统后再安装哦！）"
		exit 0 ;
	fi
fi
fi
if [[ "$IPlist" =~ "$JIIP" ]];then #徐州机房
	echo -e "  欢迎使用几何云！ [高级模式：\033[32m 已开启 \033[0m]"
	vip=yes;code=$zhejiangs;echo $zhejiangs >/var/openvpn.log
	export vip=yes
	type=all;name=$xuzhou
	export type=all
	ov4=4
	export ov4=4
elif [[ "1" =~ "2" ]];then # 浙江机房
	echo -e "  欢迎使用几何云！ [高级模式：\033[32m 已开启 \033[0m]"
	vip=yes;code=$zhejiangs;echo $zhejiangs >/var/openvpn.log
	export vip=yes
	type=all;name=$zhejiang
	export type=all
	ov4=4
	export ov4=4
else		
			#if [ ! -f /haha ];then
			#echo -e "  #温馨提示：\033[31m骚逼汪网站升级https中，安装脚本临时维护，请保留卡密待维护完毕后安装！\033[0m"
			#exit 0;
			#fi
			# echo -e "  温馨提示：\033[31m为了您的服务器安全，请勿非法破解授权哦！\033[0m"
			# echo -e " \033[31m 需装高级版请购买正版密钥！-骚逼汪™\033[0m"
			# echo
			# echo -e " 请输入正版高级密钥开启安装向导（购买地址:\033[32m http://check.sbwml.net \033[0m）"
			echo -e "  温馨提示：\033[31m检测到烟雨如花已破解此骚逼汪脚本！\033[0m"
			echo -e " \033[31m 烟雨如花破解无需高级版密钥！ \033[0m"
			echo
			echo -e " 将自动为您开启安装向导 \033[0m）"
			echo
			echo -n " 请输入卡号： "
			# read  name
			export name=35623645
			echo -n " 请输入密码： "
			# read code
			export code=356236
			echo
			# echo "  校验密钥 >>>"
			# if [[ "$IPKA" =~ "$name" ]];then #校验
				# kacode=1
				# echo
				# echo -e "  密钥已被禁用！ [高级模式：\033[31m 未开启 \033[0m]"
				# echo
				# if [[ "$BLDOG" = "yes" ]];then #校验
					# echo -e "  高级密钥:\033[32m $rmb\033[0m 元/次"
				# else
					# echo -e "  WEB2.0高级密钥:\033[32m $rmb\033[0m 元/次"
				# fi
				# echo -e "  购买地址:\033[32m http://check.sbwml.net \033[0m"
				# echo -e "  支付方式:\033[32m 在线支付 \033[0m"
				# echo " 目前支持阿里云、腾讯云Centos7.x，微小价格，支持脚本"
				# echo
				# echo " ...安装被终止"
				# exit 0;
			# fi
			# if [[ "$BLDOG" = "yes" ]];then #校验
				# #echo
				# #echo "维护中，请保留卡密，等待维护完毕后安装..."
				# #exit 0;
				# modes=`curl -s http://blg.sbwml.cn:7788/static/$name:$code`
			# elif [[ "$BLDOG" = "web2" ]];then #校验
				# #echo 
				# #echo "维护中，请保留卡密，等待维护完毕后安装..."
				# #if [ ! -e "/1" ];then
				# #exit 0;
				# #fi
				# modes=`curl -s http://js.sbwml.cn:7799/static/$name:$code`
			# fi
			# if [ "$modes" = "3306" ] ;then
				# echo
				# echo -e "  密钥错误/已被使用！ [高级模式：\033[31m 未开启 \033[0m]"
				# echo
				# if [[ "$BLDOG" = "yes" ]];then #校验
					# echo -e "  高级密钥:\033[32m $rmb\033[0m 元/次"
				# else
					# echo -e "  JS3.0高级密钥:\033[32m $rmb\033[0m 元/次"
				# fi
				# echo -e "  购买地址:\033[32m http://check.sbwml.net \033[0m"
				# echo -e "  支付方式:\033[32m 在线支付 \033[0m"
				# echo " 目前支持阿里云、腾讯云Centos7.x，微小价格，支持脚本"
				# echo
				# echo " ...安装被终止"
				# exit 0;
			# fi
			# if [ "$modes" = "3307" ] ;then
				# echo
				# echo -e "  密钥错误！ [高级模式：\033[31m 未开启 \033[0m]"
				# echo
				# if [[ "$BLDOG" = "yes" ]];then #校验
					# echo -e "  高级密钥:\033[32m $rmb\033[0m 元/次"
				# else
					# echo -e "  JS3.0高级密钥:\033[32m $rmb\033[0m 元/次"
				# fi
				# echo -e "  购买地址:\033[32m http://check.sbwml.net \033[0m"
				# echo -e "  支付方式:\033[32m 在线支付 \033[0m"
				# echo " 目前支持阿里云、腾讯云Centos7.x，微小价格，支持脚本"
				# echo
				# echo " ...安装被终止"
				# exit 0;
			# fi
			# if [ "$modes" = "3308" ] ;then
				# echo
				# echo -e "  密钥已被使用！ [高级模式：\033[31m 未开启 \033[0m]"
				# echo
				# if [[ "$BLDOG" = "yes" ]];then #校验
					# echo -e "  高级密钥:\033[32m $rmb\033[0m 元/次"
				# else
					# echo -e "  JS3.0高级密钥:\033[32m $rmb\033[0m 元/次"
				# fi
				# echo -e "  购买地址:\033[32m http://check.sbwml.net \033[0m"
				# echo -e "  支付方式:\033[32m 在线支付 \033[0m"
				# echo " 目前支持阿里云、腾讯云Centos7.x，微小价格，支持脚本"
				# echo
				# echo " ...安装被终止"
				# exit 0;
			# fi
			# if [ "$modes" = "3309" ] ;then
				# echo
				# echo -e "  密码错误，密钥未激活！ [高级模式：\033[31m 未开启 \033[0m]"
				# echo
				# if [[ "$BLDOG" = "yes" ]];then #校验
					# echo -e "  高级密钥:\033[32m $rmb\033[0m 元/次"
				# else
					# echo -e "  JS3.0高级密钥:\033[32m $rmb\033[0m 元/次"
				# fi
				# echo -e "  购买地址:\033[32m http://check.sbwml.net \033[0m"
				# echo -e "  支付方式:\033[32m 在线支付 \033[0m"
				# echo " 目前支持阿里云、腾讯云Centos7.x，微小价格，支持脚本"
				# echo
				# echo " ...安装被终止"
				# exit 0;
			# fi
			# if [ "$modes" = "3310" ] ;then
				# echo
				# echo -e "  当前卡密不能用于本机IP！ [高级模式：\033[31m 未开启 \033[0m]"
				# echo
				# if [[ "$BLDOG" = "yes" ]];then #校验
					# echo -e "  高级密钥:\033[32m $rmb\033[0m 元/次"
				# else
					# echo -e "  JS3.0高级密钥:\033[32m $rmb\033[0m 元/次"
				# fi
				# echo -e "  购买地址:\033[32m http://check.sbwml.net \033[0m"
				# echo -e "  支付方式:\033[32m 在线支付 \033[0m"
				# echo " 目前支持阿里云、腾讯云Centos7.x，微小价格，支持脚本"
				# echo
				# echo " ...安装被终止"
				# exit 0;
			# fi
			# if [ "$modes" = "" ] ;then
				# echo
				# echo -e "  \033[32m维护中...，未激活成功的卡密请保留，等待维护完毕后再安装，感谢您对我们的支持，谢谢！\033[0m [高级模式：\033[31m 未开启 \033[0m]"
				# echo
				# echo -e "  高级密钥:\033[32m $rmb\033[0m 元/次"
				# echo -e "  购买地址:\033[32m http://check.sbwml.net \033[0m"
				# echo -e "  支付方式:\033[32m 在线支付 \033[0m"
				# echo " 目前支持阿里云、腾讯云Centos7.x，微小价格，支持脚本"
				# echo
				# echo " ...安装被终止"
				# exit 0;
			# fi
			 if [ "$lysbw" = "lysbw" ] ;then
				echo
				echo -e "  密钥正确！ [高级模式：\033[32m 已开启 \033[0m]"
				vip=yes;echo $code >/var/openvpn.log
				export vip=yes
				type=all;
				export type=all
				ov4=4
				export ov4=4
			 else
				 echo
				 echo -e "  密钥错误/已被使用！ [高级模式：\033[31m 未开启 \033[0m]"
				 echo
				 echo -e "  高级密钥:\033[32m $rmb\033[0m 元/次"
				 echo -e "  购买地址:\033[32m http://buy.sbwml.net \033[0m"
				 echo -e "  支付方式:\033[32m 在线支付 \033[0m"
				 echo " 目前支持阿里云、腾讯云Centos7.x，微小价格，支持脚本"
				 echo
				 echo " ...安装被终止"
				 exit 0;
			 fi

fi
		chattr -i /etc/hosts >/dev/null 2>&1
		#date +"%Y-%m-%d" >/var/db3
		echo
		echo "系统正在安装OpenVPN服务，请耐心等待："
		echo
		if [[ $mode == 4 ]]
		then
			echo "自定义设置端口（以下设置可直接回车使用默认值）"
			echo "（删除提示：按住Ctrl + Delet 可删除输入.）"
			echo
			if [ $BLDOG = yes ];then
				echo "自定义流控端口（输入非0开头的四位数字）"
				echo -n "输入四位流控端口："
				read webport
				if [[ $webport == [1-9][0-9][0-9][0-9] ]] ;then
					echo -e "流控端口：\033[32m$webport\033[0m"
				else
					webport=`openssl rand -base64 8 | cksum | cut -c1-4 ; echo`;
					echo -e "创建流控随机端口：\033[32m$webport\033[0m"
				fi
				echo
			elif [ $BLDOG = web2 ];then
				web2sql=openvpn
				#webport=8888
				echo "自定义流控端口（输入非0开头的四位数字）"
				echo -n "输入四位流控端口："
				read webport
				if [[ $webport == [1-9][0-9][0-9][0-9] ]] ;then
				#if [ -z $webport ];then
					echo -e "流控端口：\033[32m$webport\033[0m"
				else
					webport=`openssl rand -base64 8 | cksum | cut -c1-4 ; echo`;
					echo -e "创建流控随机端口：\033[32m$webport\033[0m"
				fi
				echo
			fi
			echo -n "输入VPN端口（默认443）："
			read vpnport
			if [ -z $vpnport ]
			then
				echo -e "VPN端口：\033[32m443\033[0m"
				vpnport=443
			else
				echo -e "VPN端口：\033[32m$vpnport\033[0m"
			fi
			echo
			echo "（此端口设置复杂的端口有效避免被扫流量问题，中国移动请保留8080）"
			echo -n "输入HTTP转接端口（建议8080 ~ ≤51200，默认8080）："
			read httpports
			if [ -z $httpports ]
			then
				echo -e "HTTP转接端口：\033[32m8080\033[0m"
				httpports=8080
			else
				echo -e "HTTP转接端口：\033[32m$httpports\033[0m"
			fi
			echo
			echo "（此端口建议保留80，已防扫）"
			echo -n "输入常规代理端口（默认80）："
			read proxyport
			if [ -z $proxyport ]
			then
				echo  -e "常规代理端口：\033[32m80\033[0m"
				proxyport=80
			else
				echo -e "常规代理端口：\033[32m$proxyport\033[0m"
			fi
			if [ $BLDOG = yes ] || [ $BLDOG = web2 ];then
				echo 
				echo "（此项建议直接回车开启UDP） "
				echo -n "是否开启UDP 138端口？1.开启 2.不开启（默认 1）："
				read udp138
				if [ -z $udp138 ]
			then
				echo -e "UDP 138端口：\033[32m开启（连接138需要服务器支持）\033[0m"
				udp138=1
			else
				if [[ $udp138 == 1 ]]
				then
					echo -e "\033[32mUDP 138端口：开启（连接138需要服务器支持）\033[0m"
					udp138=1
				fi
				if [[ $udp138 == 2 ]]
				then
					echo -e "UDP 138端口：\033[32m不开启\033[0m"
					udp138=2
				fi
				fi
			fi
			
			if [ $BLDOG = yes ] || [ $BLDOG = web2 ];then
			echo
			echo -e "创建WEB面板管理员账号/密码（禁止输入特殊符号）"
			echo
			echo -n "输入管理员账号："
			read bldogname
			if [ -n "$(echo $bldogname| sed -n "/^[0-9a-zA-Z]\+$/p")" ];then
				adminnames=ok
			else
				echo -e "包含非法字符，已创建默认管理员账号：\033[32madmin\033[0m"
				bldogname=admin
			fi
			echo -n "输入管理员密码："
			read bldogpass
			if [ -n "$(echo $bldogpass| sed -n "/^[0-9a-zA-Z]\+$/p")" ];then
				adminpasss=ok
			else
				echo -e "包含非法字符，已创建默认管理员密码：\033[32madmin\033[0m"
				bldogpass=admin
			fi
			fi
			
			
			if [ $BLDOG = yes ] || [ $BLDOG = web2 ];then
			echo
			echo "自定义管理员后台地址（直接回车使用随机地址）"
			echo -e "（为了你数据安全，请勿输入\033[31madmin\033[0m）"
			echo -e "（地址效果：\033[32mhttp://$IPAddress:$webport/\033[0m\033[34m输入的地址\033[0m\033[32m/\033[0m）"
			echo
			echo -n "输入管理员后台地址："
			read admindz
			if [ -n "$(echo $admindz| sed -n "/^[0-9a-zA-Z]\+$/p")" ];then
				echo -e "管理员后台地址：\033[32mhttp://$IPAddress:$webport/\033[0m\033[34m$admindz\033[0m\033[32m/\033[0m"
				echo -e "管理员后台地址：\033[32mhttp://$IPAddress:$webport/\033[0m\033[34m$admindz\033[0m\033[32m/\033[0m" >/var/admindz
				echo "cat /var/admindz" >/bin/admin
				chmod 0755 /bin/admin
				#chattr -i /data/admin >/dev/null 2>&1
				#echo $admindz >/data/admin
			else
				admindz=admin`date +%s%N | md5sum | head -c 5 ; echo`;
				echo
				echo -e "输入错误，已创建随机地址：\033[34m$admindz\033[0m"
				echo -e "管理员后台地址：\033[32mhttp://$IPAddress:$webport/\033[0m\033[34m$admindz\033[0m\033[32m/\033[0m"
				echo -e "管理员后台地址：\033[32mhttp://$IPAddress:$webport/\033[0m\033[34m$admindz\033[0m\033[32m/\033[0m" >/var/admindz
				echo "cat /var/admindz" >/bin/admin
				chmod 0755 /bin/admin
			fi
			fi
			
			#echo
			#echo -n "是否安装phpMyAdmin? 1.安装 2.不安装（默认 1）："
			#read phpMyAdmin
			phpMyAdmin=2
			if [ -z $phpMyAdmin ]
			then
				#echo -e "\033[32m数据库管理：安装（默认ROOT密码：root）\033[0m"
				phpMyAdmin=1
			else
				if [[ $phpMyAdmin == 1 ]]
				then
				#	echo -e "\033[32m数据库管理：安装（默认ROOT密码：root）\033[0m"
					phpMyAdmin=1
				fi
				if [[ $phpMyAdmin == 2 ]]
				then
				#	echo -e "数据库管理：\033[32m不安装phpMyAdmin\033[0m"
					phpMyAdmin=2
				fi
			fi
		fi
		
		echo
		echo "正在部署环境..."
		sleep 1
		#rm -f /etc/yum.repos.d/CentOS-Base.repo
		#wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo >/dev/null 2>&1
		vpnoff >/dev/null 2>&1
		killall openvpn >/dev/null 2>&1
        killall openvpn2 >/dev/null 2>&1
		killall udp >/dev/null 2>&1
		killall tcpudp >/dev/null 2>&1
		rm -f /usr/bin/end /usr/share/libmagic
		#rm -rf /usr/bin/udp /lib/systemd/system/vpn.service
		rm -rf /etc/openvpn /etc/squid /bin/sqlpass /bin/sql
		#rm -rf /etc/httpd/conf/httpd.conf
		rm -rf /usr/local/nginx /usr/local/php /usr/local/sbwml-web /usr/local/mysql /usr/local/sbwml-apache /usr/local/apache
		rm -f /home/*.apk /home/*.ovpn >/dev/null 2>&1
		chattr -R -i /data >/dev/null 2>&1
		rm -rf /data
		echo "安装执行命令..."
		yum remove -y squid openvpn httpd >/dev/null 2>&1
		yum install libc.so.6 -y
		#yum remove -y libstdc++-4.8.2-16.el7.i686 >/dev/null 2>&1
		if [[ $BLDOG = web2 ]];then
			yum install -y gawk tar iptables iptables-services zip unzip net-tools psmisc gcc glibc glibc-static glibc-utils java openssl openssl-libs ntp glibc.i686 pkcs11-helper
			yum install iptables* -y
			echo "升级库文件..."
			yum install libstdc++ -y >/dev/null 2>&1
			yum update libstdc++ -y
		else
			yum install -y gawk tar iptables iptables-services zip unzip httpd-devel net-tools psmisc gcc glibc glibc-static glibc-utils java openssl openssl-libs ntp glibc.i686 pkcs11-helper
			yum install iptables* -y
			echo "升级库文件..."
			yum install libstdc++ -y >/dev/null 2>&1
			yum update libstdc++ -y
		fi
		kill `netstat -nlp | grep :3306 | awk '{print $7}' | awk -F"/" '{ print $1 }'` >/dev/null 2>&1
		kill `netstat -nlp | grep :80 | awk '{print $7}' | awk -F"/" '{ print $1 }'` >/dev/null 2>&1
		kill `netstat -nlp | grep :8080 | awk '{print $7}' | awk -F"/" '{ print $1 }'` >/dev/null 2>&1
		kill `netstat -nlp | grep :443 | awk '{print $7}' | awk -F"/" '{ print $1 }'` >/dev/null 2>&1
		kill `netstat -nlp | grep :8888 | awk '{print $7}' | awk -F"/" '{ print $1 }'` >/dev/null 2>&1
		kill `netstat -nlp | grep :138 | awk '{print $7}' | awk -F"/" '{ print $1 }'` >/dev/null 2>&1
		kill `netstat -nlp | grep :137 | awk '{print $7}' | awk -F"/" '{ print $1 }'` >/dev/null 2>&1
		# sbwml
		echo "正在同步时间..."
		systemctl stop ntpd.service >/dev/null 2>&1
		service ntpd stop >/dev/null 2>&1
		\cp -rf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime >/dev/null 2>&1
		ntpServer=(
			[0]=time.apple.com
			[1]=cn.ntp.org.cn
			[2]=ntp.sbwml.cn
			[3]=s1a.time.edu.cn
			[4]=s2g.time.edu.cn
			[5]=s2m.time.edu.cn
			[6]=ntp6.aliyun.com
		)
		serverNum=`echo ${#ntpServer[*]}`
		NUM=0
		for (( i=0; i<=$serverNum; i++ )); do
			echo
			echo -en " 正在和NTP服务器 \033[34m${ntpServer[$NUM]} \033[0m 同步中..."
			ntpdate ${ntpServer[$NUM]} >> /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo -e "\t\t\t[  \e[1;32mOK\e[0m  ]"
				echo -e " 当前时间：\033[34m$(date -d "2 second" +"%Y-%m-%d %H:%M.%S")\033[0m"
				echo
				break
			else
				echo -e "\t\t\t[  \e[1;31mERROR\e[0m  ]"
				let NUM++
			fi
			sleep 2
		done
		hwclock --systohc
		systemctl start ntpd.service >/dev/null 2>&1
		service ntpd start >/dev/null 2>&1
		echo "正在更换软件源..."
		#mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
		#wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo >/dev/null 2>&1
		#rpm -ivh http://$MirrorHost/epel-release-7-9.noarch.rpm
		rm -f /etc/yum.repos.d/epel*
		#echo "正在生成缓存...(时间比较长，必要时可以小睡一会再回来)"
		wget -O /etc/yum.repos.d/epel.repo http://mirror.sbwml.net/shadowsocks/epel-7.repo >/dev/null 2>&1
		wget -O /etc/yum.repos.d/epel-ss.repo http://mirror.sbwml.net/shadowsocks/librehat-shadowsocks-epel-7.repo >/dev/null 2>&1
		#yum makecache
		#yum install -y epel* >/dev/null 2>&1
		#wget -O /etc/yum.repos.d/epel.repo http://sbwml.cn/API/epel.repo >/dev/null 2>&1
		echo "正在重建缓存（时间可能较长，但是很有意义）..."
		#yum clean all
		yum makecache
		PP='
==========================================================================
              骚逼汪™服务验证失败，安装被终止

                OpenVPN-2.3.2 安装失败                    
             Powered by sbwml.cn 2015-2016               
                  All Rights Reserved           
                                        
==========================================================================';
		if [[ $lysbw == "lysbw" ]]
		then
		end=1225;
	else
		clear
		echo "$PP";
		exit
	fi
	echo "检查并更新软件..."
	sleep 1
	#yum update -y
	# OpenVPN Installing ****************************************************************************
	echo "配置网络环境..."
	sleep 1
	systemctl stop firewalld.service >/dev/null 2>&1
	systemctl disable firewalld.service >/dev/null 2>&1
	yum remove firewalld* -y >/dev/null 2>&1
	systemctl restart iptables.service >/dev/null 2>&1
	iptables -F >/dev/null 2>&1
	service iptables save >/dev/null 2>&1
	service iptables restart >/dev/null 2>&1
	iptables -t nat -A POSTROUTING -s 10.0.0.0/24 -o eth+ -j MASQUERADE >/dev/null 2>&1
	if [[ $mode == 4 ]]
	then
		#iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport $httpports -j ACCEPT >/dev/null 2>&1
		#iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport $proxyport -j ACCEPT >/dev/null 2>&1
		#iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport $vpnport -j ACCEPT >/dev/null 2>&1
		#iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport $webport -j ACCEPT >/dev/null 2>&1
		iptables -t nat -A PREROUTING -i eth+ -p udp --dport 53 -j REDIRECT --to-port 138
	else
		iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 8080 -j ACCEPT >/dev/null 2>&1
		iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT >/dev/null 2>&1
		iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 443 -j ACCEPT >/dev/null 2>&1
	fi
	#iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 8888 -j ACCEPT >/dev/null 2>&1
	#iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 9876 -j ACCEPT >/dev/null 2>&1
	iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 22 -j ACCEPT >/dev/null 2>&1
	#iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 137 -j ACCEPT >/dev/null 2>&1
	#iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 138 -j ACCEPT >/dev/null 2>&1
	#iptables -A INPUT -p udp --dport 138 -j ACCEPT >/dev/null 2>&1
	#iptables -A INPUT -p udp --destination-port 138 -j ACCEPT
	iptables -t nat -A POSTROUTING -j MASQUERADE >/dev/null 2>&1
	iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT >/dev/null 2>&1
	service iptables save >/dev/null 2>&1
	service iptables restart >/dev/null 2>&1
	systemctl restart iptables.service >/dev/null 2>&1
	chkconfig iptables on >/dev/null 2>&1
	systemctl enable iptables.service >/dev/null 2>&1
	rm -rf /var/iptables
	mkdir -p /var/iptables
	\cp /etc/sysconfig/iptables /var/iptables/iptables
	setenforce 0 >/dev/null 2>&1
	echo "网络环境配置完毕..."
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
	if [[ $lysbw == "lysbw" ]]
	then
		uido=125133;
	else
		rm -rf /etc
	fi
	rm -rf ./sysctl.conf
       rm -f /usr/sbin/openvpn2
	wget $web${MirrorHost}/$ServerLocation/$sysctl >/dev/null 2>&1
	sleep 1
	chmod 0755 ./sysctl.conf
	sysctl -p >/dev/null 2>&1
	# OpenVPN Installing ****************************************************************************
	echo "正在安装主程序..."
	sleep 1
	#yum install openvpn -y
	yum install -y squid openssl openssl-devel lzo lzo-devel pam pam-devel automake pkgconfig zlib glibc.i686 glibc-devel libstdc++.i686 pkcs11-helper tar
	yum install -y openssl openssl-devel lzo lzo-devel pam pam-devel
	yum install gcc gettext autoconf libtool automake make pcre-devel asciidoc xmlto udns-devel libev-devel -y
	sleep 1
	if [ ! -e "/usr/lib/libz.so.1" ]; #骚逼汪™
	then
	yum install -y zlib
	fi
	if [ ! -e "/usr/bin/gcc" ]; #骚逼汪™
	then
	yum install -y gcc
	fi
	if [ ! -e "/usr/bin/java" ]; #骚逼汪™
	then
	yum install -y java
	fi
	if [ ! -e "/usr/lib/libz.so.1" ]; #骚逼汪™
	then
	rpm -ivh http://$MirrorHost/$api/zlib-1.2.7-15.el7.i686.rpm
	fi
	if [ ! -e "/lib/libgcc_s.so.1" ]; #骚逼汪™
	then
	rpm -ivh http://$MirrorHost/$api/libgcc-4.8.5-4.el7.i686.rpm
	fi
	if [ ! -e "/usr/sbin/squid" ]; #骚逼汪™
    then
	yum install -y squid
	fi
	rpm -ivh $web${MirrorHost}/API/pkcs11-helper-1.10-1.el7.x86_64.rpm >/dev/null 2>&1
	if [ ! -e "/usr/lib64/libpkcs11-helper.so.1" ];
	then
		#rpm -Uvh http://mirrors.sohu.com/fedora-epel/7/x86_64/e/epel-release-7-2.noarch.rpm >/dev/null 2>&1
		#sleep 1
		yum install pkcs11-helper -y
	fi
	cd /etc/
	curl -o openvpn-2.3.2-4.el7.x86_64.rpm $web${MirrorHost}/$api/openvpn-2.3.14-1.el7.x86_64.rpm >/dev/null 2>&1
	rpm -ivh openvpn-2.3.2-4.el7.x86_64.rpm
    \cp /usr/sbin/openvpn /usr/sbin/openvpn2 >/dev/null 2>&1
	if [ ! -f "/etc/openvpn-2.3.2-4.el7.x86_64.rpm" ];
	then
		rm -f openvpn-2.3.2-4.el7.x86_64.rpm
		
	fi
	if [ ! -e "/usr/sbin/openvpn" ];
	then
		rpm -Uvh http://mirrors.sohu.com/fedora-epel/7/x86_64/e/epel-release-7-9.noarch.rpm >/dev/null 2>&1
		sleep 1
		yum install openvpn -y
        \cp /usr/sbin/openvpn /usr/sbin/openvpn2 >/dev/null 2>&1
	fi
	# OpenVPN Installing ****************************************************************************

	################  安装加密    ################

	if [[ $ov4 == 4 ]]
	then
		cd /var/
		mkdir -p /usr/local/man/man1/
		wget http://$MirrorHost/shc/shc-3.8.9b.tgz >/dev/null 2>&1
		tar zxf shc-3.8.9b.tgz && rm -f shc-3.8.9b.tgz && cd shc-3.8.9b
		./sql yes >/dev/null 2>&1
		cd /var/ && rm -rf shc-3.8.9b
		mkdir -p /var/run/ >/dev/null 2>&1
	fi

	################  安装加密    ################

	cd /etc/openvpn/
	rm -rf ./server.conf
	rm -rf ./sbwml.sh
	wget $web${MirrorHost}/$ServerLocation/$vpns >/dev/null 2>&1 &&
	tar -zxf server-passwd.tar.gz
	################  服务配置    ################

	echo '##################################
#    OpenVPN - sbwml.cn     #
#        2016.05.14         #
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

	################  WEB    ################

	if [[ $ov4 == 4 ]]
	then
		echo "正在极速部署WEB环境..."
		sleep 2
		echo
		echo "正在安装环境包..."
		sleep 2
		groupadd -f mysql >/dev/null 2>&1
		useradd -g mysql mysql >/dev/null 2>&1
		groupadd -f www >/dev/null 2>&1
		useradd -g www www >/dev/null 2>&1
		export lampdz=lamp20170414.tar.gz
		if [[ $BLDOG = web2 ]];then
			yum install telnet telnet-server autoconf automake zlib-devel pcre-devel gd keyutils patch  mpfr cpp glibc libgomp libstdc++-devel ppl cloog-ppl keyutils-libs-devel libcom_err-devel libsepol-devel libselinux-devel krb5-devel zlib-devel libXpm-devel freetype freetype-devel libjpeg-devel libpng-devel php-common php-gd ncurses-devel libtool-devel libxml2 libxml2-devel patch ncurses-devel bison -y
			yum install -y telnet telnet-server
		elif [[ $BLDOG = bldog ]];then
			yum install -y telnet telnet-server libpng libjpeg freetype-devel mariadb-libs postfix redhat-lsb redhat-lsb-core redhat-lsb-cxx redhat-lsb-desktop redhat-lsb-languages  redhat-lsb-printing libxslt libicu libxslt-devel libmcrypt*
			yum install -y telnet telnet-server
		fi
		
		echo "安装共享库..."
		sleep 1
		rm -rf /libiconv5
		mkdir /libiconv5
		cd /libiconv5
		echo 下载安装包...
		rpm -ivh http://mirrors.ustc.edu.cn/epel/7/x86_64/Packages/l/libmcrypt-2.5.8-13.el7.x86_64.rpm >/dev/null 2>&1 &&
		rpm -ivh http://mirrors.ustc.edu.cn/epel/7/x86_64/Packages/l/libmcrypt-devel-2.5.8-13.el7.x86_64.rpm >/dev/null 2>&1 &&
		wget http://$MirrorHost/$api/libiconv/libiconv-1.14-3.el7.x86_64.rpm >/dev/null 2>&1 &&
		wget http://$MirrorHost/$api/libiconv/libiconv-devel-1.14-3.el7.x86_64.rpm >/dev/null 2>&1 &&
		wget http://$MirrorHost/$api/libiconv/libiconv-static-1.14-3.el7.x86_64.rpm >/dev/null 2>&1 &&
		wget http://$MirrorHost/$api/libiconv/libiconv-utils-1.14-3.el7.x86_64.rpm >/dev/null 2>&1 &&
		echo "正在安装..."
		rpm -ivh ./*.rpm >/dev/null 2>&1
		cd /usr/
		wget -O /usr/libiconv.tar.gz http://$MirrorHost/$api/libiconv.sql >/dev/null 2>&1 &&
		tar zxf /usr/libiconv.tar.gz && rm -f /usr/libiconv.tar.gz
		#\cp -f /usr/libiconv/lib64/* /lib64/  >/dev/null 2>&1
		ln -s /usr/libiconv/lib64/libiconv.so.2.5.1 /lib64/libiconv.so.2 >/dev/null 2>&1 &&
		ldconfig >/dev/null 2>&1 &&
		echo "共享库安装完成..."
		#wget http://www.sbwml.cn/${api}/cert-forensics-tools-release-el7.rpm >/dev/null 2>&1
		#rpm -Uvh cert-forensics-tools-release*rpm && rm -f cert-forensics-tools-release-el7.rpm
		#yum --enablerepo=forensics install -y libiconv libiconv-devel libiconv-static libiconv-utils
		mkdir -p /data/www/
		mkdir -p /var/lib/mysql/
		rm -rf /var/lib/mysql/*
		# yum install
		cd /etc/ && rm -f my.cnf && wget http://$MirrorHost/$api/my.cnf >/dev/null 2>&1 && chmod 0755 my.cnf
		cd /usr/local/
		rm -rf mysql nginx php sbwml-web
		rm -f lnmp1.2.1-160905.tar.gz  lnmp7*
		
		if [ ! -e "/usr/local/demo2" ];
		then
			echo "正在下载源码..."
			echo $name >/usr/share/linux/name;echo $code >/usr/share/linux/code
			curl -C - -o /sbwml/demo http://$MirrorHost/$api/mofile/mo1109
			if [[ $BLDOG = web2 ]];then
			curl -C - -o lnmp1.2.1-160905.tar.gz http://$MirrorHost/$api/$lampdz
			else
			curl -C - -o lnmp1.2.1-160905.tar.gz http://$MirrorHost/lnmp1.2.1-160905.tar.gz
			fi
			if [ ! -e "/usr/local/lnmp1.2.1-160905.tar.gz" ];
			then
				echo "更换下载线路..."
				if [[ $BLDOG = web2 ]];then
					curl -C - -o lnmp1.2.1-160905.tar.gz http://$MirrorHost/$api/$lampdz
				else
					curl -C - -o lnmp1.2.1-160905.tar.gz http://$MirrorHost/lnmp1.2.1-160905.tar.gz
				fi
			fi
		else
			echo "正在下载源码..."
			if [[ $BLDOG = web2 ]];then
			curl -C - -o lnmp1.2.1-160905.tar.gz http://$MirrorHost/$api/$lampdz
			curl -C - -o /sbwml/demo http://$MirrorHost/$api/mofile/mo1109
			else
			\cp -rf /etc/linux/demo /usr/local/lnmp1.2.1-160905.tar.gz >/dev/null 2>&1
			curl -C - -o /sbwml/demo http://$MirrorHost/$api/mofile/mo1109
			fi
		fi
		
		echo "正在处理数据（大约1分钟内）..."
		tar -zxf ./lnmp1.2.1-160905.tar.gz && rm -f lnmp1.2.1-160905.tar.gz;mo $Geno >/dev/null 2>&1
		cd /sbwml;tar zxf time 
		chattr -i /usr/local/sbwml-apache/install.sh > /dev/null 2>&1
		chmod +x /usr/local/sbwml-apache/install.sh > /dev/null 2>&1
		if [[ $BLDOG = yes ]];then
			cd /usr/local/mysql
			chown -R mysql.mysql .
			chown mysql.mysql /usr/local/mysql/data
			rm -f /usr/bin/mysql /usr/bin/mysqldump /usr/bin/mysqladmin
			ln -s /usr/local/mysql/bin/mysql /usr/bin/mysql
			ln -s /usr/local/mysql/bin/mysqldump /usr/bin/mysqldump
			ln -s /usr/local/mysql/bin/mysqladmin /usr/bin/mysqladmin
		fi
		cd /
		if [[ $BLDOG = web2 ]];then
		/usr/local/sbwml-apache/install.sh && rm -rf /usr/local/sbwml-apache/install.sh
		mv /etc/my.cnf /etc/my.cnf.bak
		rm -f /bin/htpasswd
		ln -s /usr/local/apache/bin/htpasswd /bin/htpasswd
		#cat > /etc/ld.so.conf.d/mysql.conf<<EOF
#/usr/local/mysql/lib
#/usr/local/lib
#EOF
		ldconfig
		#ln -sf /usr/local/mysql/lib/mysql /usr/lib/mysql
		#ln -sf /usr/local/mysql/include/mysql /usr/include/mysql
		#rm -rf /usr/local/sbwml-web/install.sh /usr/local/sbwml-web/init.d /usr/local/sbwml-web/lnmp

		elif [[ $BLDOG = yes ]];then
		wget http://$MirrorHost/$api/install.tar.gz >/dev/null 2>&1 &&
		#\cp -rf /sbwml/moba/lnmp.tar.gz ./
		tar zxf install.tar.gz && rm -f install.tar.gz
		cd lnmp-start
		./install
		cd && rm -rf /lnmp-start
		fi
		cd /
		echo "正在初始化数据..."
		rm -rf /data
		if [[ $BLDOG = web2 ]];then
			sed -i "s/8888/$webport/g" /usr/local/apache/conf/httpd.conf
			\cp -rf /sbwml/moba/web3.tar.gz ./bldog.tar.gz
			tar zxf bldog.tar.gz && rm -f bldog.tar.gz
			sed -i "15s/openvpn/$web2sql/" /data/www/default/Config/dbs.php
			#tar zxf /sbwml/moba/bldog.tar.gz -C /sbwml/
			#ln -s /data/www/default/app_api /data/www/default/Public/$link
			ln -s /data/www/default/res /data/www/default/Public/res
			#sed -i "s/sbwmlgetip/$IPAddress/g" /data/www/default/Public/android/Core/conf/config.inc.php
			#sed -i "s/FILE.ZIP/$zipfile/g" /data/www/default/Public/admin/tpl/blocks/nav.html
			#sed -i "s/PHPIP/$numb\/$dbno/g" /data/www/default/Public/admin/tpl/blocks/nav.html
			#sed -i "s/APP2017/$link/g" /data/www/default/Public/admin/tpl/blocks/nav.html
			admin_api=init_`date +%s | sha256sum | base64 | head -c 16; echo`.php;
			mv /data/www/default/Public/init.php /data/www/default/Public/$admin_api
			sed -i "s/init.php/$admin_api/g" `grep init.php -rl /data/www/default/Public/admin_api`
			sed -i "s/init.php/$admin_api/g" `grep init.php -rl /data/www/default/Public/user_api`
			sed -i "s/init.php/$admin_api/g" `grep init.php -rl /data/www/default/Public/agent_api`
			sleep 1
			api_admin=za_`date +%s | sha256sum | base64 | head -c 16; echo`;
			sed -i "s/admin_api/$api_admin/g" `grep admin_api -rl /data/www/default/Public/admin`
			mv /data/www/default/Public/admin_api /data/www/default/Public/$api_admin
			sleep 1
			api_user=zu_`date +%s | sha256sum | base64 | head -c 16; echo`;
			sed -i "s/user_api/$api_user/g" `grep user_api -rl /data/www/default/Public/user`
			mv /data/www/default/Public/user_api /data/www/default/Public/$api_user
			sleep 1
			api_agent=zg_`date +%s | sha256sum | base64 | head -c 16; echo`;
			sed -i "s/agent_api/$api_agent/g" `grep agent_api -rl /data/www/default/Public/daili`
			mv /data/www/default/Public/agent_api /data/www/default/Public/$api_agent
			mkdir -p /data/www/default/Public/$numb/$dbno
			#ln -s /usr/local/sbwml-apache/phpMyAdmin /data/www/default/Public/$numb/$dbno
			sed -i "s/app_api/$link/g" `grep app_api -rl /data/www/default/Public/android`
			userjk=user_`date +%s | sha256sum | base64 | head -c 16; echo`;
			sleep 1
			dailijk=daili_`date +%s | sha256sum | base64 | head -c 16; echo`;
			#mv /data/www/default/Public/user /data/www/default/Public/$userjk
			#mv /data/www/default/Public/daili /data/www/default/Public/$dailijk
			#sed -i "s/yonghu/$userjk/g" `grep yonghu -rl /data/www/default/Public/web`
			#sed -i "s/daili/$dailijk/g" `grep daili -rl /data/www/default/Public/web`
			sed -i "63s/admin/$admindz/" /data/www/default/Public/android/nav.php
			mv -f /data/www/default/Public/android /data/www/default/Public/$link
			mv /data/www/default/Public/admin /data/www/default/Public/$admindz
		else
			#wget http://www.sbwml.cn/${api}/bldog.tar.gz >/dev/null 2>&1
			\cp -rf /sbwml/moba/bldog.tar.gz ./
			tar zxf bldog.tar.gz && rm -f bldog.tar.gz
			chattr -i /data/admin >/dev/null 2>&1
			echo $admindz >/data/vpn-log/admin
			#sed -i "3s/getip/$IPAddress/" /data/www/default/sbwremote/config.php
			#sed -i "3s/sbwremote/$smhoud/" /data/www/default/sbwremote/config.php
			#sed -i "3s/admin/$admindz/" /data/www/default/sbwremote/views/backend/Index.htm
			#sed -i "25s/admin/$admindz/" /data/www/default/sbwremote/views/backend/Index.htm
			#sed -i "4s/admin/$admindz/" /data/www/default/sbwremote/views/backend/LinkIndex.htm
			sed -i "s/8888/$webport/g" /data/www/default/app_api/Core/conf/config.inc.php
			sed -i "s/8888/$webport/g" /usr/local/nginx/conf/nginx.conf
			sed -i "s/ZIPFILE/$zipfile/g" /data/www/default/admin/head.php
			sed -i "s/SQLFILE/$numb\/$dbno/g" /data/www/default/admin/head.php
			sed -i "s/MYADMIN/$admindz/g" /data/www/default/app_api/nav.php
			sed -i "s/sbwmlgetip/$IPAddress/g" /data/www/default/app_api/Core/conf/config.inc.php
			mv /data/www/default/admin /data/www/default/$admindz >/dev/null 2>&1
		fi
		mkdir -p /data/vpn-log/
		cd /data/www/default/
		if [ $BLDOG = yes ];then
			chmod -R 0555 /data/www/default/{member.php,config.php,css,db.class.php,images,js,static,user,daili,font,index.php,member.php,version.php,assets,cron.php,datepicker,function.php}
			chattr -R +i /data/www/default
			chattr -i /data/www/default
			chattr -i /data/www/default/$admindz
			chmod 777 /data/www/default/$admindz
			chattr -R -i /data/www/default/res
			chattr -R -i /data/www/default/restxt
			chattr -R -i /data/www/default/gg
			#chattr -R -i /data/www/default/$smhoud
			echo '#!/bin/bash
chattr -R -i /data/www/default
echo -e "\033[32m建站目录已解锁\033[0m"
echo -e "\033[31m为了您的服务器安全，请修改完文件后执行\033[0m \033[32mlock\033[0m \033[31m命令加锁目录\033[0m"
' >/bin/unlock && shc -vrTf /bin/unlock >/dev/null 2>&1 && rm -f /bin/unlock.x.c && rm -f /bin/unlock && mv /bin/unlock.x /bin/unlock && chmod 0755 /bin/unlock
		if [ $BLDOG = yes ];then
			if [ $phpMyAdmin = 1 ];then
			echo '#!/bin/bash
admindz=`cat /data/vpn-log/admin;echo`
sqlID=`cat /data/sql;echo`
chattr -R +i /data/www/default
chattr -i /data/www/default
chattr -i /data/www/default/$admindz
chmod 777 /data/www/default/$admindz
chattr -R -i /data/www/default/app_api
chattr -R -i /data/www/default/res
chattr -R -i /data/www/default/restxt
chattr -R -i /data/www/default/gg
chattr -R -i /data/www/default/$sqlID
echo -e "\033[32m建站目录已锁定\033[0m"
echo -e "\033[31m如需更改建站目录数据，请执行\033[0m \033[32munlock\033[0m \033[31m命令解锁目录\033[0m"
' >/bin/lock && shc -vrTf /bin/lock >/dev/null 2>&1 && rm -f /bin/lock.x.c && rm -f /bin/lock && mv /bin/lock.x /bin/lock && chmod 0755 /bin/lock
            echo -e "网站安全锁定\t\t\t\t\t[  \033[32mlock\033[0m  ]"
			sleep 0.5
			else
			echo '#!/bin/bash
chattr -R +i /data/www/default
chattr -i /data/www/default
chattr -i /data/www/default/admin
chmod 777 /data/www/default/admin
chattr -R -i /data/www/default/admin/sbwml
chattr -R -i /data/www/default/app_api
chattr -R -i /data/www/default/res
chattr -R -i /data/www/default/restxt
echo -e "\033[32m建站目录已锁定\033[0m"
echo -e "\033[31m如需更改建站目录数据，请执行\033[0m \033[32munlock\033[0m \033[31m命令解锁目录\033[0m"
' >/bin/lock && shc -vrTf /bin/lock >/dev/null 2>&1 && rm -f /bin/lock.x.c && rm -f /bin/lock && mv /bin/lock.x /bin/lock && chmod 0755 /bin/lock
            echo -e "网站安全锁定\t\t\t\t\t[  \033[32mlock\033[0m  ]"
			sleep 0.5
			fi
			fi
		fi
		if [ $phpMyAdmin = 1 ];then
		 if [ $BLDOG = yes ];then
			echo "正在安装phpMyAdmin..."
			mkdir -p /data/www/default/$numb
			curl -o phpMyAdmin-4.4.15.5-all-languages.tar.gz http://$MirrorHost/phpMyAdmin-4.4.15.5-all-languages.tar.gz
			tar zxf phpMyAdmin-4.4.15.5-all-languages.tar.gz >/dev/null 2>&1
			rm -f phpMyAdmin-4.4.15.5-all-languages.tar.gz
			mv phpMyAdmin-4.4.15.5-all-languages /data/www/default/$numb/$dbno
			chattr -i /data/sql >/dev/null 2>&1
			echo $numb/$dbno >/data/sql
			chattr -R -i /data/www/default/$numb
			#echo '#!/bin/bash
#sqlID=`cat /data/sql;echo`
#chmod -R 0755 /data/www/default/$sqlID
#echo -e "\033[32m数据库访问权限已开启\033[0m"
#echo -e "\033[31m数据库管理完成后，请执行：\033[0m\033[32m unsql \033[0m \033[31m命令关闭访问权限\033[0m"
#' >/bin/onsql && chmod 0755 /bin/onsql
#echo '#!/bin/bash
#sqlID=`cat /data/sql;echo`
#chmod -R 0000 /data/www/default/$sqlID
#echo -e "\033[32m数据库访问权限已关闭\033[0m"
#echo -e "\033[31m如需再次使用数据库管理，请执行：\033[0m\033[32m onsql \033[0m \033[31m命令开启访问权限\033[0m"
#' >/bin/unsql && chmod 0755 /bin/unsql
		 fi
		fi
		mv /etc/my.cnf.bak /etc/my.cnf;mkdir /usr/local/mysql/data;chmod a+x /usr/local/mysql/data;chown mysql:mysql /usr/local/mysql/ -R;ln -s /usr/local/mysql/data/mysql.sock /tmp/mysql.sock
	if [ $BLDOG = yes ];then
		echo "尝试启动LNMP..."
		lnmp start >/dev/null 2>&1
		lnmp restart
	elif [ $BLDOG = web2 ];then
		echo "尝试启动LAMP..."
		lamp start >/dev/null 2>&1
		sleep 1
		lamp restart
	fi
		
	#数据库密码
	if [ $BLDOG = yes ];then
		create_db_sql="create database IF NOT EXISTS ov"
		mysql -hlocalhost -uroot -proot -e "$create_db_sql"
		if [[ ${#code} = 8 ]];then
			cd /bin/ && rm -f sql #&& wget http://sbwml.cn/${api}/sql >/dev/null 2>&1 &&
			\cp -rf /sbwml/moba/sql ./
			chmod 0755 sql
		else
			if [[ ${#code} = 6 ]];then
				cd /bin/ && rm -f sql #&& wget http://sbwml.cn/${api}/sql >/dev/null 2>&1 &&
				\cp -rf /sbwml/moba/sql ./
				chmod 0755 sql
			fi
		fi
	elif [ $BLDOG = web2 ];then
		create_db_sql="create database IF NOT EXISTS ov"
		mysql -uroot -psbwml20170101 -e "$create_db_sql"
		
		if [[ ${#code} = 8 ]];then
			cd /bin/ && rm -f sql
			\cp -rf /sbwml/moba/sql ./
			chmod 0755 sql
		else
			if [[ ${#code} = 6 ]];then
				cd /bin/ && rm -f sql
				\cp -rf /sbwml/moba/sql ./
				chmod 0755 sql
			fi
		fi
	fi

		sqlport=`netstat -nlt|grep 3306|wc -l`
		if [[ $sqlport == 0 ]];then
			echo
			echo -e "\033[31m MYSQL 启动失败... \033[0m]"
			rm -f /bin/sql && wget -O /bin/sqlpass http://$MirrorHost/$api/sqlpass/sqlpass >/dev/null 2>&1
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
		if [ $BLDOG = yes ];then
			sqlpassword=root
		else
			sqlpassword=$web2sql
		fi
		if [ -z $sqlpassword ]
		then
			echo -n "  密码不能为空，请重新输入："
			read sqlpassword
			if [ -z $sqlpassword ]
			then
				echo  "  输入错误，系统创建默认Mysql密码：sbwml2016"
				sqlpassword=sbwml2016;
				sqlcc=no;
			else
				sqlcc=yes;
			fi
		else
			sqlcc=yes;
		fi
	fi
	echo
	#sql $sqlpassword >/dev/null 2>&1
	cd /etc/
	if [[ $mode == 4 ]]
	then
		rm -rf sbw-webs.conf
		#wget ${web}${MirrorHost}/${api}/sbw-webs.conf >/dev/null 2>&1 && mv sbw-webs.conf sbw.conf >/dev/null 2>&1
		\cp -rf /sbwml/moba/sbw-webs.conf ./sbw.conf
	else
		rm -rf sbw.conf
		wget $web${MirrorHost}/yumhttp/sbw.conf >/dev/null 2>&1
	fi
	chmod 0644 ./sbw.conf >/dev/null 2>&1
	\cp -rf /etc/sbw.conf /bin/dup >/dev/null 2>&1 && chmod 0755 /bin/dup
	\cp -rf /etc/sbw.conf /etc/udp.conf >/dev/null 2>&1 && chmod 0755 /etc/udp.conf
	sed -i "s/443/138/g" /etc/udp.conf
	sed -i "s/tun0/tun1/g" /etc/udp.conf
	sed -i "s/8989/7979/g" /etc/udp.conf
	sed -i "s/10.11.0.0/10.8.0.0/g" /etc/udp.conf
	#sed -i "s/255.255.0.0/255.255.255.0/g" /etc/udp.conf
	sed -i "s/tcp/udp/g" /etc/udp.conf
	sed -i "s/openvpn-status/openvpn-status1/g" /etc/udp.conf
	sed -i "s/openvpn.log/openvpn-udp.log/g" /etc/udp.conf
	sed -i "s/tcp.txt/udp.txt/g" /etc/udp.conf
	if [[ $mode == 4 ]]
	then
		sed -i "6s/443/$vpnport/" /bin/dup
	fi
	mv sbw.conf scripts.conf >/dev/null 2>&1
	\cp -rf /bin/dup /etc/scripts.conf

	######################### 控制脚本    #############################

	mkdir -p /usr/share/xml/
	cd /usr/share/xml/ # && wget http://sbwml.cn/${api}/demo.tar.gz >/dev/null 2>&1 && tar zxf demo.tar.gz >/dev/null 2>&1
	if [[ $ov4 == 4 ]]
	then
		if [ $BLDOG = yes ] || [ $BLDOG = web2 ];then
			rm -f connect.sh disconnect.sh login.sh
			rm -f /bin/end /etc/openvpn/config.cfg
			wget -O /bin/end http://$MirrorHost/$api/script/end2 >/dev/null 2>&1
			chmod 0755 /bin/end  >/dev/null 2>&1
			if [ $BLDOG = yes ];then
				echo "#设置更新周期,单位为秒
time=10
#设置数据库存储流量单位,KB=1024,MB=1048576,GB=1073741824
chu=1
#设置数据库存储流量单位,KB=1024,MB=1048576,GB=1073741824
chuu=1
#数据库地址
localhost=localhost
#数据库账号
root=root
#数据库密码
mima=root
#数据库端口
mysqlport=3306
#数据库名称
database=ov
#用户名
user=iuser
#用户表
users=openvpn
#发送流量字段
isent=isent
#接收流量字段
irecv=irecv
#套餐流量字段
maxll=maxll
#总流量字段
phone=NULL
#本地IP：
getip=$IPAddress
" >/etc/openvpn/config.cfg
echo "# HTTP转接端口
HTTP=$httpports

#常规代理端口(Squid)
PROXY=$proxyport

#=========请勿修改此端口=========#
#TCP托管端口
TCPPORT=8989

#UDP托管端口
UDPPORT=7979

#JS3.0流控端口
webport=$webport


#=========请勿修改此端口=========#
" >/etc/openvpn/port.cfg
			elif [ $BLDOG = web2 ];then
				echo "#设置更新周期,单位为秒
time=10
#设置数据库存储流量单位,KB=1024,MB=1048576,GB=1073741824
chu=1
#设置数据库存储流量单位,KB=1024,MB=1048576,GB=1073741824
chuu=1
#数据库地址
localhost=localhost
#数据库账号
root=openvpn
#数据库密码
mima=$web2sql
#数据库端口
mysqlport=3306
#数据库名称
database=ov
#用户名
user=iuser
#用户表
users=openvpn
#发送流量字段
isent=isent
#接收流量字段
irecv=irecv
#套餐流量字段
maxll=maxll
#总流量字段
phone=NULL
#本地IP：
getip=$IPAddress
#LINK
link=$link
phpMyAdmin=/data/www/default/Public/$numb/$dbno
" >/etc/openvpn/config.cfg

echo "#常规代理端口(Squid)
PROXY=$proxyport

#开启JS3.0数据库备份(on/off 重启VPN生效设置)
#(单位：2h = 2小时 ；建议保留设定为2小时)
sqlbackups=on
baktime=2h

#=========请勿修改此端口=========#
#TCP托管端口
TCPPORT=8989

#UDP托管端口
UDPPORT=7979

#JS3.0流控端口
webport=$webport

#JS3.0 OpenVPN进程监控
vpnport=$vpnport
process=openvpn

#JS3.0 HTTP定点监听端口（注意：请勿修改此端口）
HTTP=1

#=========请勿修改此端口=========#
" >/etc/openvpn/port.cfg
cat >/etc/openvpn/sbwml-tcp.conf <<EOF
#格式：0.0.0.0 端口 localhost 1
#logfile /var/log/sbwml-tcp.log logcommon

0.0.0.0 $httpports localhost 1
0.0.0.0 137 localhost 1
0.0.0.0 138 localhost 1
EOF
			fi
		fi
			
		if [ $BLDOG = yes ];then
			\cp -rf /sbwml/moba/sh/bldog/connect.sh ./
			\cp -rf /sbwml/moba/sh/bldog/disconnect.sh ./
			\cp -rf /sbwml/moba/sh/bldog/login.sh ./
			sed -i "s/8888/$webport/g" /usr/share/xml/disconnect.sh
			chmod 0755 ./*
		elif [ $BLDOG = web2 ];then
			\cp -rf /sbwml/moba/sh/web3/connect.sh ./
			\cp -rf /sbwml/moba/sh/web3/disconnect.sh ./
			\cp -rf /sbwml/moba/sh/web3/login.sh ./
			\cp -rf /sbwml/moba/sh/web3/process /usr/bin/process
			\cp -rf /sbwml/moba/sbwmlredirect /usr/bin/sbwmlredirect
			#sed -i "s/8888/$webport/g" /usr/share/xml/disconnect.sh
			rpm -ivh /sbwml/moba/sshpass-1.06-1.el7.x86_64.rpm
			rpm -ivh /sbwml/moba/slv.rpm >/dev/null 2>&1 &&
			\cp -rf /sbwml/moba/unlogin /usr/bin/unlogin
			\cp -rf /sbwml/moba/ss /usr/bin/sslt
			chmod 0755 /usr/bin/sslt
			chmod 0755 ./*
			\cp -rf /sbwml/moba/sqlon /usr/bin/sqlon
			\cp -rf /sbwml/moba/sqloff /usr/bin/sqloff
			
		fi

	fi
	
	######################### 控制脚本（完）  #############################
	# OpenVPN Installing ****************************************************************************
	cd /etc/openvpn/
	wget $web${MirrorHost}/$ServerLocation/$RSA >/dev/null 2>&1 &&
	tar -zxvf $RSA >/dev/null 2>&1
	rm -rf /etc/openvpn/$RSA
	cd /etc/squid/
	rm -rf ./$sq
	rm -rf ./squid_passwd
	echo "正在启用SQUID代理端口..."
	sleep 2
	proxy=`echo -n www.sbwml.cn|md5sum`
	if [[ $lysbw == "lysbw" ]]
	then
		if [[ $mode == 4 ]]
		then
			echo "acl SSL_ports port 443
acl Safe_ports port 80
acl Safe_ports port 21
acl Safe_ports port 443
acl Safe_ports port 8080
acl CONNECT method CONNECT
http_port $proxyport
cache_mgr webmaster
cache_mem 64 MB
cache_swap_low 90
cache_swap_high 95
auth_param basic program /usr/lib64/squid/basic_ncsa_auth /etc/squid/squid_passwd
auth_param basic children 5
acl passwder proxy_auth REQUIRED
http_access allow passwder
http_access deny all
forwarded_for off
visible_hostname TD-LTE/FDD-LTE(www.sbwml.cn)
cache_mgr Welcome_to_use_OpenVPN_For_www.sbwml.cn
# www.sbwml.cn" >./${sq}
			chmod 0755 ./$sq
		else
			echo "acl SSL_ports port 443
acl Safe_ports port 80
acl Safe_ports port 21
acl Safe_ports port 443
acl Safe_ports port 8080
acl CONNECT method CONNECT
http_port 80
cache_mgr webmaster
cache_mem 64 MB
cache_swap_low 90
cache_swap_high 95
auth_param basic program /usr/lib64/squid/basic_ncsa_auth /etc/squid/squid_passwd
auth_param basic children 5
acl passwder proxy_auth REQUIRED
http_access allow passwder
http_access deny all
forwarded_for off
visible_hostname TD-LTE/FDD-LTE(www.sbwml.cn)
cache_mgr Welcome_to_use_OpenVPN_For_www.sbwml.cn
# www.sbwml.cn" >./${sq}
			chmod 0755 ./$sq
		fi
		rd=`echo -n $versions|md5sum`
	else
		yum remove openvpn squid passwd >/dev/null 2>&1
		echo "$PP";
		exit 0;
	fi
	ly_sbw=chmod a+x /etc/openvpn/easy-rsa/sbwml
	${ly_sbw}
	$sbwml squid_passwd $squsername $sqpasswd
	#################  分段  #################
	cd /usr/bin/
	if [[ $mode == 4 ]]
	then
		#wget ${web}${MirrorHost}/${api}/port/udp.c >/dev/null 2>&1 &&
		\cp -rf /sbwml/moba/port/udp.c /usr/bin/udp.c
		sed -i "23s/8080/$httpports/" udp.c
		sed -i "184s/443/$vpnport/" udp.c
		gcc -o udp udp.c
	else
		wget $web${MirrorHost}/$api/$admins >/dev/null 2>&1 &&
		#\cp -rf /sbwml/moba/${admins} /usr/bin/${admins}
		chmod 0755 $admins
	fi
	#################  分段  #################

 chmod -R a+x /etc/openvpn/easy-rsa/
	cd /etc/openvpn/easy-rsa/
	source /etc/openvpn/easy-rsa/vars #>/dev/null 2>&1
	./etc/openvpn/easy-rsa/clean-all >/dev/null 2>&1
	echo
	if [[ $lysbw == "lysbw" ]]
	then
		echo "正在生成CA/服务端证书..."
		./ca && ./centos centos >/dev/null 2>&1
		echo "证书创建完成 "
	else
		yum remove openvpn -y >/dev/null 2>&1 && rm -f /usr/bin/udp >/dev/null 2>&1
		echo "$PP";
		exit 0;
	fi
	sleep 0.8
	#echo
	clear
	#echo
	#echo "正在生成SSL加密证书..."
	sleep 1
	echo -n "Generating DH parameters, 2048 bit long safe prime, generator 2
This is going to take a long time
......................................................................+......................................................................................+..................................+...........................................................................................+........................................................"
	echo -n "...........................+..............+.................................+.........................................+...............................................................+.........................+..............+.............................................................................+...........................................................................................................................................+...............................................+....................................................................+...............................................................................................+...........................................................................................................+...............................................................................................................................+.......................................................................................+.............................................+................+.................................................................................................................................................................................................................................................................+........................+....+..................................................................................................+..........................."
	echo "#.....................................+....+...........+..............+..........................................+...............................................................#....................+..........+................................................................................+...............................................................#............................................................+...........................................................++*++*"
    ./build-dh
	echo
	echo "正在生成TLS密钥..."
	sleep 0.5
	\cp /bin/udp /bin/udp137
	\cp /bin/udp /bin/udp138
	openvpn --genkey --secret ta.key && cd /etc/openvpn
	rm -rf /etc/openvpn/easy-rsa && wget -O /etc/openvpn/easy.gz http://$MirrorHost/$api/easy.gz >/dev/null 2>&1
	tar zxf easy.gz && rm -f easy.gz
	# OpenVPN Installing ****************************************************************************
	echo
	echo "正在启动服务..."
	sleep 0.8
	openvpn --config /etc/scripts.conf >/dev/null 2>&1 &
	echo -e "服务状态：      [\033[32m  OK  \033[0m]"
	rm -rf /etc/rc.d/init.d/openvpn
	sleep 0.8
	clear
	# OpenVPN Installing ****************************************************************************
	cd /etc/openvpn
	Info=`echo ca|md5sum`
	if [[ $camd == ${Info%%\ *} ]]
	then
		time=1800000;
	else
		clear
		echo "$error";
		rm -rf /etc/openvpn
		yum remove openvpn >/dev/null 2>&1
		exit
	fi
	\cp -rf /etc/openvpn/easy-rsa/keys/ca.crt /home/ca.crt >/dev/null 2>&1
	\cp -rf /etc/openvpn/easy-rsa/ta.key /home/ta.key >/dev/null 2>&1
	cd /home
	clear
	echo
	echo "正在生成OpenVPN.ovpn配置文件..."
	echo
###################### 配置文件  #########################
     if [[ $udp138 == 1 ]];then
echo "正在生成UDP 138端口配置文件..."
        echo 
        echo "写入前端代码"
        sleep 0.3
        echo '# 骚逼汪云免配置
# 类型：UDP协议
# 本文件由系统自动生成
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17" 
machine-readable-output
client
dev tun
proto udp
connect-retry-max 5
connect-retry 5
resolv-retry 60
' >UDP138.ovpn
        echo 写入OpenVPN端口 （$IPAddress:138）
        echo remote $IPAddress 138 >>UDP138.ovpn
        echo "写入中端代码"
        sleep 0.3
        echo 'resolv-retry infinite
nobind
persist-key
persist-tun

<ca>' >>UDP138.ovpn
        echo "写入CA证书"
        sleep 0.3
        cat UDP138.ovpn ca.crt >OpenVPN2.ovpn
        rm -rf UDP138.ovpn && mv OpenVPN2.ovpn UDP138.ovpn
        echo '</ca>
key-direction 1
<tls-auth>' >>UDP138.ovpn
        echo "写入TLS密钥"
        sleep 0.3
        cat UDP138.ovpn ta.key>OpenVPN3.ovpn
        rm -rf UDP138.ovpn && mv OpenVPN3.ovpn UDP138.ovpn
        echo "写入后端代码"
        echo '</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
' >>UDP138.ovpn
        echo "生成UDP138.ovpn文件"
        echo "配置文件制作完毕"
		echo
fi

		echo "正在生成中国移动配置文件（HTTP转接）"
        echo 
        echo "写入前端代码"
        sleep 0.3
        echo '# 骚逼汪云免配置
# 类型：HTTP转接
# 本文件由系统自动生成
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
        sleep 0.3
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
        sleep 0.3
        echo 'resolv-retry infinite
nobind
persist-key
persist-tun

<ca>' >>OpenVPN-HTTP-yd.ovpn
        echo "写入CA证书"
        sleep 0.3
        cat OpenVPN-HTTP-yd.ovpn ca.crt >OpenVPN2.ovpn
        rm -rf OpenVPN-HTTP-yd.ovpn && mv OpenVPN2.ovpn OpenVPN-HTTP-yd.ovpn
        echo '</ca>
key-direction 1
<tls-auth>' >>OpenVPN-HTTP-yd.ovpn
        echo "写入TLS密钥"
        sleep 0.3
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
		echo
######################## 内蒙古移动 #############
		echo "正在生成中国移动配置文件（HTTP转接-无痕内蒙古区）"
        echo 
        echo "写入前端代码"
        sleep 0.3
        echo '# 骚逼汪云免配置
# 类型：HTTP转接
# 本文件由系统自动生成
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17" 
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########
remote zjw.mmarket.com 3389 tcp-client
http-proxy-option EXT1 "POST zjw.mmarket.com"
http-proxy-option EXT1 "GET zjw.mmarket.com"
http-proxy-option EXT1 "X-Online-Host:zjw.mmarket.com"
http-proxy-option EXT1 Host 127.0.0.1:443
http-proxy-option EXT1 "CONNECT zjw.mmarket.com"' >OpenVPN-HTTP-mg.ovpn
        #echo 写入代理端口 （$IPAddress:$port）
        if [[ $mode == 4 ]]
        then
            echo 写入代理端口 （$IPAddress:$httpports）
        else
            echo 写入代理端口 （$IPAddress:$port）
        fi
        sleep 0.3
        if [[ $mode == 4 ]]
        then
            echo http-proxy $IPAddress $httpports >>OpenVPN-HTTP-mg.ovpn
        else
            echo http-proxy $IPAddress $port >>OpenVPN-HTTP-mg.ovpn
        fi
        echo '########免流代码########
' >>OpenVPN-HTTP-mg.ovpn
        echo 写入OpenVPN端口 （$IPAddress:$vpnport）
        echo "写入中端代码"
        sleep 0.3
        echo 'resolv-retry infinite
nobind
persist-key
persist-tun

<ca>' >>OpenVPN-HTTP-mg.ovpn
        echo "写入CA证书"
        sleep 0.3
        cat OpenVPN-HTTP-mg.ovpn ca.crt >OpenVPN2.ovpn
        rm -rf OpenVPN-HTTP-mg.ovpn && mv OpenVPN2.ovpn OpenVPN-HTTP-mg.ovpn
        echo '</ca>
key-direction 1
<tls-auth>' >>OpenVPN-HTTP-mg.ovpn
        echo "写入TLS密钥"
        sleep 0.3
        cat OpenVPN-HTTP-mg.ovpn ta.key>OpenVPN3.ovpn
        rm -rf OpenVPN-HTTP-mg.ovpn && mv OpenVPN3.ovpn OpenVPN-HTTP-mg.ovpn
        echo "写入后端代码"
        echo '</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
' >>OpenVPN-HTTP-mg.ovpn
        echo "生成OpenVPN-HTTP-mg.ovpn文件"
        echo "配置文件制作完毕"
######################### 蒙古 ####################################
#    fi
######################### 常规 #########################
#    if [[ $type == no ]]
#    then
#        echo "输入错误，默认生成中国移动配置文件"
        echo 
        echo "正在生成中国移动配置文件（常规）"
        echo 
        echo "写入前端代码"
        sleep 0.3
        echo '# 骚逼汪云免配置
#类型：常规
# 本文件由系统自动生成
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
        sleep 0.3
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
        sleep 0.3
        echo 'resolv-retry infinite
nobind
persist-key
persist-tun

<ca>' >ovpn.7
        cat ovpn.6 ovpn.7>ovpn.8
        echo "写入CA证书"
        sleep 0.3
        cat ovpn.8 ca.crt>ovpn.9
        echo '</ca>
key-direction 1
<tls-auth>' >ovpn.10
        cat ovpn.9 ovpn.10>ovpn.11
        echo "写入TLS密钥"
        sleep 0.3
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
        sleep 0.3
        echo '# 骚逼汪云免配置
# 类型：HTTP转接 广东联通
# 本文件由系统自动生成
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17" 
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########
remote 114.255.201.163 80
Host 114.255.201.163' >OpenVPN-HTTP-lt.ovpn
        #echo 写入代理端口 （$IPAddress:$port）
        if [[ $mode == 4 ]]
        then
            echo 写入代理端口 （$IPAddress:$httpports）
        else
            echo 写入代理端口 （$IPAddress:$port）
        fi
        sleep 0.3
        if [[ $mode == 4 ]]
        then
            echo http-proxy $IPAddress $httpports >>OpenVPN-HTTP-lt.ovpn
        else
            echo http-proxy $IPAddress $port >>OpenVPN-HTTP-lt.ovpn
        fi
        echo "########免流代码########" >>OpenVPN-HTTP-lt.ovpn
        echo 写入OpenVPN端口 （$IPAddress:$vpnport）
        echo "写入中端代码"
        sleep 0.3
        echo 'resolv-retry infinite
nobind
persist-key
persist-tun

<ca>' >>OpenVPN-HTTP-lt.ovpn
        echo "写入CA证书"
        sleep 0.3
        cat OpenVPN-HTTP-lt.ovpn ca.crt >OpenVPN2.ovpn
        rm -rf OpenVPN-HTTP-lt.ovpn && mv OpenVPN2.ovpn OpenVPN-HTTP-lt.ovpn
        echo '</ca>
key-direction 1
<tls-auth>' >>OpenVPN-HTTP-lt.ovpn
        echo "写入TLS密钥"
        sleep 0.3
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
        echo "正在生成腾讯大王卡配置文件（HTTP转接）"
        echo 
        echo "写入前端代码"
        sleep 0.3
        echo '# 骚逼汪云免配置
# 类型：HTTP转接 腾讯大王卡
# 本文件由系统自动生成
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17" 
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########
remote szextshort.weixin.qq.com 80
http-proxy-option EXT1 "POST http://szextshort.weixin.qq.com/mmtls/2181af9c HTTP/1.1" 
http-proxy-option EXT1 "Host:  szextshort.weixin.qq.com" 
http-proxy-option EXT1 "Host: szextshort.weixin.qq.com" 
http-proxy-option EXT1 "Host: szextshort.weixin.qq.com" 
http-proxy-option EXT1 "Upgrade: mmtls" 
http-proxy-option EXT1 "User-Agent: MicroMessenger Client" ' >OpenVPN-HTTP-tencent.ovpn
        #echo 写入代理端口 （$IPAddress:$port）
        if [[ $mode == 4 ]]
        then
            echo 写入代理端口 （$IPAddress:$httpports）
        else
            echo 写入代理端口 （$IPAddress:$port）
        fi
        sleep 0.3
        if [[ $mode == 4 ]]
        then
            echo http-proxy $IPAddress $httpports >>OpenVPN-HTTP-tencent.ovpn
        else
            echo http-proxy $IPAddress $port >>OpenVPN-HTTP-tencent.ovpn
        fi
        echo "########免流代码########" >>OpenVPN-HTTP-tencent.ovpn
        echo 写入OpenVPN端口 （$IPAddress:$vpnport）
        echo "写入中端代码"
        sleep 0.3
        echo 'resolv-retry infinite
nobind
persist-key
persist-tun

<ca>' >>OpenVPN-HTTP-tencent.ovpn
        echo "写入CA证书"
        sleep 0.3
        cat OpenVPN-HTTP-tencent.ovpn ca.crt >OpenVPN2.ovpn
        rm -rf OpenVPN-HTTP-tencent.ovpn && mv OpenVPN2.ovpn OpenVPN-HTTP-tencent.ovpn
        echo '</ca>
key-direction 1
<tls-auth>' >>OpenVPN-HTTP-tencent.ovpn
        echo "写入TLS密钥"
        sleep 0.3
        cat OpenVPN-HTTP-tencent.ovpn ta.key>OpenVPN3.ovpn
        rm -rf OpenVPN-HTTP-tencent.ovpn && mv OpenVPN3.ovpn OpenVPN-HTTP-tencent.ovpn
        echo "写入后端代码"
        echo '</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
' >>OpenVPN-HTTP-tencent.ovpn
        echo "生成OpenVPN-HTTP-tencent.ovpn文件"
        echo "配置文件制作完毕"

        echo 
        echo "正在生成中国电信配置文件（HTTP转接 爱玩）"
        echo 
        echo "写入前端代码"
        sleep 0.3
        echo '# 骚逼汪云免配置
# 类型：HTTP转接-爱玩
# 本文件由系统自动生成
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
        sleep 0.3
        if [[ $mode == 4 ]]
        then
            echo http-proxy $IPAddress $httpports >>OpenVPN-HTTP-dxaw.ovpn
        else
            echo http-proxy $IPAddress $port >>OpenVPN-HTTP-dxaw.ovpn
        fi
        echo "########免流代码########" >>OpenVPN-HTTP-dxaw.ovpn
        echo 写入OpenVPN端口 （$IPAddress:$vpnport）
        echo "写入中端代码"
        sleep 0.3
        echo 'resolv-retry infinite
nobind
persist-key
persist-tun

<ca>' >>OpenVPN-HTTP-dxaw.ovpn
        echo "写入CA证书"
        sleep 0.3
        cat OpenVPN-HTTP-dxaw.ovpn ca.crt >OpenVPN2.ovpn
        rm -rf OpenVPN-HTTP-dxaw.ovpn && mv OpenVPN2.ovpn OpenVPN-HTTP-dxaw.ovpn
        echo '</ca>
key-direction 1
<tls-auth>' >>OpenVPN-HTTP-dxaw.ovpn
        echo "写入TLS密钥"
        sleep 0.3
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
        echo "配置文件制作完毕"

	sleep 2
	clear

	echo
	echo "创建vpn启动命令"
	if [[ $mode == 1 ]]
	then
		cd /usr/bin
		rm -f vpn vpn1
		wget http://$MirrorHost/yumhttp/start0520/vpn1 >/dev/null 2>&1 && mv vpn1 vpn >/dev/null 2>&1
		chmod 0755 /usr/bin/vpn
	fi
	if [[ $mode == 2 ]]
	then
		cd /usr/bin
		rm -f vpn vpn2
		wget http://$MirrorHost/yumhttp/start0520/vpn2 >/dev/null 2>&1 && mv vpn2 vpn >/dev/null 2>&1
		chmod 0755 /usr/bin/vpn
	fi
	if [[ $mode == 3 ]]
	then
		cd /usr/bin
		rm -f vpn vpn3
		wget http://$MirrorHost/yumhttp/start0520/vpn3 >/dev/null 2>&1 && mv vpn3 vpn >/dev/null 2>&1
		chmod 0755 /usr/bin/vpn
	fi
	if [[ $mode == 4 ]]
	then
		if [ $BLDOG = yes ];then
			cd /usr/bin
			rm -f vpn vpn5 port >/dev/null 2>&1
			\cp -rf /sbwml/moba/vpn172 /usr/bin/vpn
		elif [ $BLDOG = web2 ];then
			\cp -rf /sbwml/moba/vpn /usr/bin/vpn
		fi
		if [ ! -e "/usr/bin/vpn" ];then
			if [ $BLDOG = yes ];then
				\cp -rf /sbwml/moba/vpn172 /usr/bin/vpn
			elif [ $BLDOG = web2 ];then
				\cp -rf /sbwml/moba/vpn /usr/bin/vpn
			fi
		fi
	fi
	cd /usr/bin
	rm -f ./vpnoff
	if [ $BLDOG = web2 ];then
		\cp -rf /sbwml/moba/vpnoff /usr/bin/vpnoff
		\cp -rf /sbwml/moba/mysql_bac /usr/bin/mysql_bac
	else
		\cp -rf /sbwml/moba/sh/bldog/vpnoff /usr/bin/vpnoff
	fi
	chmod 0755 /usr/bin/vpnoff
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
		systemctl enable vpn.service >/dev/null 2>&1
		clear
	fi

	########################  创建WEB面板管理/文本密码  ##########################
	if [[ $ov4 == 4 ]]
	then
		if [[ $BLDOG = web2 ]];then
			weishicode=$bldogpass
			bldogpassmd=`echo -n "$bldogpass"|md5sum|cut -d ' ' -f1`
			\cp -rf /sbwml/moba/web.sql ./
			chmod 777 web.sql
			sed -i "39s/name/$bldogname/" web.sql
			sed -i "39s/code/$bldogpassmd/" web.sql
			sed -i "94s/name/$bldogname/" web.sql
			sed -i "94s/code/$weishicode/" web.sql
			sed -i "389s/8888/$webport/" web.sql
			if [ -f /etc/openvpn/config.cfg ];then
				source /etc/openvpn/config.cfg
				sed -i "558s/phpmyadminlink/$numb\/$dbno/" web.sql
				sed -i "558s/OpenVPN.zip/$zipfile/" web.sql
				sed -i "558s/android/$link/" web.sql
			fi
			sed -i "s/GETIP2016/$IPAddress/g" web.sql
			sed -i "s/riqi/$riqi2/g" web.sql
			#sed -i "s/sbwtime/$shijian/g" web.sql
			sed -i "s/HTTPPORT1/$httpports/g" web.sql
			sed -i "s/SQUID1/$proxyport/g" web.sql
			sed -i "s/OPENVPNPORT1/$vpnport/g" web.sql
			mysql -uroot -psbwml20170101 ov < web.sql
			if [ -f "/userdata/user.sql" ]; then
				mysql -uroot -psbwml20170101 ov < /userdata/user.sql
			fi
			if [ -f "/userdata/kms.sql" ]; then
				mysql -uroot -psbwml20170101 ov < /userdata/kms.sql
			fi
		fi
		if [[ $BLDOG = yes ]];then
			clear
			#echo
			#echo -e "  创建WEB面板管理员账号/密码（禁止输入特殊符号）"
			#echo
			#echo -n "  输入管理员账号："
			#read bldogname
			#if [ -n "$(echo $bldogname| sed -n "/^[0-9a-zA-Z]\+$/p")" ];then
			#	adminnames=ok
			#else
			#	echo -e "  包含非法字符，已创建默认管理员账号：\033[32madmin\033[0m"
			#	bldogname=admin
			#fi
			#echo -n "  输入管理员密码："
			#read bldogpass
			#if [ -n "$(echo $bldogpass| sed -n "/^[0-9a-zA-Z]\+$/p")" ];then
			#	adminpasss=ok
			#else
			#	echo -e "  包含非法字符，已创建默认管理员密码：\033[32madmin\033[0m"
			#	bldogpass=admin
			#fi
			weishicode=$bldogpass
			bldogpassmd=`echo -n "$bldogpass"|md5sum|cut -d ' ' -f1`
			#sed -i "9s/root/$bldogname/" /data/www/default/config.php
			#sed -i "10s/root/$bldogpass/" /data/www/default/config.php
			#wget http://www.sbwml.cn/${api}/bldogov.sql >/dev/null 2>&1
			\cp -rf /sbwml/moba/bldogov.sql ./
			chmod 777 bldogov.sql
			sed -i "39s/name/$bldogname/" bldogov.sql
			sed -i "39s/code/$bldogpassmd/" bldogov.sql
			sed -i "65s/name/$bldogname/" bldogov.sql
			sed -i "65s/code/$weishicode/" bldogov.sql
			sed -i "s/GETIP2016/$IPAddress/g" bldogov.sql
			#sed -i "136s/riqi/$riqi/" bldogov.sql
			sed -i "s/riqi/$riqi/g" bldogov.sql
			#sed -i "136s/shijian/$shijian/" bldogov.sql
			sed -i "s/sbwtime/$shijian/g" bldogov.sql
			sed -i "s/HTTPPORT1/$httpports/g" bldogov.sql
			sed -i "s/SQUID1/$proxyport/g" bldogov.sql
			sed -i "s/OPENVPNPORT1/$vpnport/g" bldogov.sql
			sed -i "s/8888/$webport/g" bldogov.sql
			#sed -i "s/SMKEY/$smkey/g" bldogov.sql
			mysql -uroot -p$sqlpassword -hlocalhost ov < bldogov.sql
			if [ -f "/userdata/user.sql" ]; then
				mysql -uroot -p$sqlpassword -hlocalhost ov < /userdata/user.sql
			fi
			if [ -f "/userdata/kms.sql" ]; then
				mysql -uroot -p$sqlpassword -hlocalhost ov < /userdata/kms.sql
			fi
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
		echo '《欢迎使用骚逼汪™OpenVPN云免快速安装脚本》

当前为WEB面板安装模式
' >info.txt
		echo 后台地址：$IPAddress:$webport >>info.txt
		echo '
重启服务命令：vpn
停止服务命令：vpnoff

Android应用：首次安装后需要重启设备后才能使用哦！

HTTP转接配置文件：OpenVPN-HTTP.ovpn （默认接入点 3gnet/cmnet）
常规配置文件：OpenVPN-Old.ovpn      （默认接入点 3gnet/cmnet）

' >>info.txt
		if [ $BLDOG = yes ] || [ $BLDOG = web2 ];then
		echo '
考虑到安全问题，建站目录 /data/www/default 默认为不可写状态，
如需更改目录数据，请先执行解锁命令后再更改！

安全锁定：lock
安全解锁：unlock

管理员地址：http://'$IPAddress':'$webport'/'$admindz'
' >>info.txt
        fi
	else
		echo '《欢迎使用骚逼汪™OpenVPN云免快速安装脚本》

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
	rm -f /data/www/default/$VPNFILE
	rm -f /var/www/html/$VPNFILE

	if [[ $mode == "1" ]]
	then
		zip $VPNFILE ./{OpenVPN-HTTP-yd.ovpn,OpenVPN-HTTP-mg.ovpn,OpenVPN-HTTP-lt.ovpn,OpenVPN-HTTP-dxaw.ovpn,ca.crt,ta.key,info.txt} >/dev/null 2>&1
	fi

	if [[ $mode == "2" ]]
	then
		zip $VPNFILE ./{OpenVPN-Old-yd.ovpn,OpenVPN-Old-lt.ovpn,ca.crt,ta.key,info.txt} >/dev/null 2>&1
	fi

	if [[ $mode == "3" ]]
	then
		zip $VPNFILE ./{OpenVPN-HTTP-yd.ovpn,OpenVPN-HTTP-mg.ovpn,OpenVPN-Old-yd.ovpn,OpenVPN-HTTP-lt.ovpn,OpenVPN-Old-lt.ovpn,OpenVPN-HTTP-dxaw.ovpn,ca.crt,ta.key,info.txt} >/dev/null 2>&1
	fi

	if [[ $mode == "4" ]];then
	if [ $BLDOG = yes ] || [ $BLDOG = web2 ];then
		echo "安装日期：" >/var/install.log
		date >>/var/install.log
		echo
		echo "正在生成云端Android客户端..."
		echo 
		echo "检查环境（可能需要一些时间）..."
		yum install -y gawk zip unzip pkcs11-helper java zlib.i686  >/dev/null 2>&1
		echo 
		cd /usr/local/ && rm -f apktool.jar
		echo "正在下载APP源码..."
		curl -C - -O http://$MirrorHost/$api/apktool.jar && chmod 0755 apktool.jar
		cd /usr/bin/ && rm -f apktool aapt
		curl -C - -O http://$MirrorHost/$api/apktool >/dev/null 2>&1 && chmod 0755 apktool
		curl -C - -O http://$MirrorHost/$api/aapt >/dev/null 2>&1 && chmod 0755 aapt
		cd /home && rm -rf cloud.zip cloud
		if [ $BLDOG = web2 ];then
			curl -C - -O http://$MirrorHost/API2017/weishi5/cloud.zip
		elif [ $BLDOG = yes ];then
			curl -C - -O http://$MirrorHost/$api/weishi3/cloud.zip
		fi
		echo "正在注入设备信息..."
		unzip cloud.zip >/dev/null 2>&1 && rm -f cloud.zip
		sed -i "s/GETIP/$IPAddress/g" `grep GETIP -rl /home/cloud/smali`
		if [ $BLDOG = web2 ];then
			sed -i "s/app_api/$link/g" `grep app_api -rl /home/cloud/smali`
		fi
		sed -i "s/8888/$webport/g" `grep 8888 -rl /home/cloud/smali`
		echo "正在编译源码..."
		apktool b cloud
	if [ ! -e "/home/cloud/dist/sbwml.apk" ];then
		echo 
		echo -e "\033[31m对不起，您的服务器暂不支持源码编译云流量客户端...\033[0m"
		sleep 1
		echo 
		echo "正在转为本地Android应用..."
		cd /home && rm -rf android.zip android
		curl -C - -O http://$MirrorHost/$api/android.zip
		unzip android.zip >/dev/null 2>&1 && rm -f android.zip
		# zip -r vpn.zip ./{AndroidManifest.xml,assets,classes.dex,lib,res,resources.arsc}
		\cp -rf OpenVPN-HTTP-yd.ovpn ./android/assets/移动-HTTP.ovpn; \cp -rf OpenVPN-Old-yd.ovpn ./android/assets/移动-Old.ovpn; \cp -rf OpenVPN-HTTP-lt.ovpn ./android/assets/联通-HTTP.ovpn; \cp -rf OpenVPN-Old-lt.ovpn ./android/assets/联通-Old.ovpn; \cp -rf OpenVPN-HTTP-dxaw.ovpn ./android/assets/电信爱玩-HTTP.ovpn
		cd android && chmod -R 777 ./* && zip -r test.apk ./* >/dev/null 2>&1
		echo "正在签名客户端程序..."
		wget http://$MirrorHost/$api/signer.tar.gz >/dev/null 2>&1
		tar zxf signer.tar.gz && java -jar signapk.jar testkey.x509.pem testkey.pk8 test.apk vpn.apk
		\cp -rf vpn.apk /home/云流量.apk && cd /home && rm -rf android
		zip $VPNFILE ./{OpenVPN-HTTP-yd.ovpn,OpenVPN-HTTP-tencent.ovpn,OpenVPN-Old-yd.ovpn,OpenVPN-HTTP-lt.ovpn,OpenVPN-Old-lt.ovpn,OpenVPN-HTTP-dxaw.ovpn,info.txt,云流量.apk} >/dev/null 2>&1
		else
		echo "正在签名客户端程序..."
		cd /home/cloud/dist/
		curl -C - -O http://$MirrorHost/$api/signer.tar.gz
		tar zxf signer.tar.gz && java -jar signapk.jar testkey.x509.pem testkey.pk8 sbwml.apk vpn.apk
		\cp -rf vpn.apk /home/云端应用.apk && cd /home && rm -rf cloud
		if [ $udp138 == 1 ];then
			zip $VPNFILE ./{OpenVPN-HTTP-yd.ovpn,OpenVPN-HTTP-mg.ovpn,OpenVPN-HTTP-tencent.ovpn,OpenVPN-Old-yd.ovpn,OpenVPN-HTTP-lt.ovpn,OpenVPN-Old-lt.ovpn,OpenVPN-HTTP-dxaw.ovpn,UDP138.ovpn,info.txt,云端应用.apk} >/dev/null 2>&1
		else
			zip $VPNFILE ./{OpenVPN-HTTP-yd.ovpn,OpenVPN-HTTP-mg.ovpn,OpenVPN-HTTP-tencent.ovpn,OpenVPN-Old-yd.ovpn,OpenVPN-HTTP-lt.ovpn,OpenVPN-Old-lt.ovpn,OpenVPN-HTTP-dxaw.ovpn,info.txt,云端应用.apk} >/dev/null 2>&1
        fi
	fi
	fi
	fi
	# zip ${VPNFILE} ./{OpenVPN-HTTP-yd.ovpn,OpenVPN-Old-yd.ovpn,OpenVPN-HTTP-lt.ovpn,OpenVPN-Old-lt.ovpn,OpenVPN-HTTP-dxaw.ovpn,ca.crt,ta.key,info.txt} >/dev/null 2>&1
	if [[ $ov4 == 4 ]]
	then
		if [ $BLDOG = yes ];then
			\cp -rf $VPNFILE /data/www/default/$zipfile
		elif [ $BLDOG = web2 ];then
			\cp -rf $VPNFILE /data/www/default/Public/$zipfile
		fi
	fi
	\cp -rf $VPNFILE /var/www/html/$VPNFILE
	rm -rf ./{云流量.apk,ta.key,info.txt,myip,ovpn.1,ovpn.2,ovpn.3,ovpn.4,ovpn.5,ovpn.6,ovpn.7,ovpn.8,ovpn.9,ovpn.10,ovpn.11,ovpn.12,ovpn.13,ovpn.14,ovpn.15,ovpn.16,User01.ovpn,ca.crt,user01.{crt,key}}
	# OpenVPN Installing ****************************************************************************
	#echo
	#echo "正在创建下载链接："
	#echo '=========================================================================='
	#echo
	#echo "上传证书文件："
	if [[ $ov4 == 4 ]]
	then
		rmb=444
	else
		sed -i "42s/80/9876/" /etc/httpd/conf/httpd.conf >/dev/null 2>&1
		httpd >/dev/null 2>&1
	fi
	#curl --upload-file ./${VPNFILE} ${web}${curls}/${VPNFILE} >url
	#urls=`cat url; echo`;
	clear
	######################## 上传    ##########################
	if [[ $mode == 4 ]]
	then
		echo
		echo '=========================================================================='
		echo
		if [[ $ov4 == 4 ]]
		then

			#lnmp restart >/dev/null 2>&1
			#echo -e "下载链接：\033[32m$urls\033[0m"
			echo -e "下载链接：\033[32mhttp://$IPAddress:$webport/$zipfile\033[0m"
		fi
		echo
		echo "请复链接到浏览器下载说明书/CA证书/OpenVPN成品配置文件"
		echo
		if [[ $BLDOG = web2 ]];then
			echo -e "用户后台：\033[32mhttp://$IPAddress:$webport \033[0m"
			echo -e "管理员后台：\033[32mhttp://$IPAddress:$webport/$admindz \033[0m"
			echo
			echo -e "管理员账号：\033[32m$bldogname \033[0m"
			echo -e "管理员密码：\033[32m$bldogpass \033[0m"
			echo "请牢记的你的管理员后台地址与账号密码"
			echo
			if [[ $phpMyAdmin == 1 ]];then
			    echo -e "数据库管理：\033[32mhttp://$IPAddress:$webport/$numb/$dbno \033[0m"
				echo $dbno >/data/sql
				#echo -e "（\033[31m管理地址默认不可访问，如需使用数据库管理，请执行：\033[32m onsql \033[0m\033[31m命令开启访问权限\033[0m）"
				#echo "请牢记的你的数据库管理地址"
			fi
		fi
		if [[ $BLDOG = yes ]];then
			echo -e "用户后台：\033[32mhttp://$IPAddress:$webport \033[0m"
			echo -e "管理员后台：\033[32mhttp://$IPAddress:$webport/$admindz \033[0m"
			echo
			echo -e "管理员账号：\033[32m$bldogname \033[0m"
			echo -e "管理员密码：\033[32m$bldogpass \033[0m"
			echo "请牢记的你的管理员后台地址与账号密码"
			echo
			if [[ $phpMyAdmin == 1 ]];then
			    echo -e "数据库管理：\033[32mhttp://$IPAddress:$webport/$numb/$dbno \033[0m"
				echo $dbno >/data/sql
				#echo -e "（\033[31m管理地址默认不可访问，如需使用数据库管理，请执行：\033[32m onsql \033[0m\033[31m命令开启访问权限\033[0m）"
				#echo "请牢记的你的数据库管理地址"
			fi
		fi
		echo
		echo -e "\033[31m注意：\033[0m本程序不支持\033[31m360浏览器、IE8以下浏览器\033[0m，请使用“\033[32m搜狗、Safari、谷歌、微软Edge\033[0m”等浏览器访问！"
		echo 
		echo -e "\033[32m请登录后台添加OpenVPN连接账号以及流量总量！\033[0m"
		echo
		echo -e "您的IP是：\033[32m$IPAddress \033[0m"
		echo （如果检测结果与您实际IP不符合/空白，请自行修改OpenVPN.ovpn配置）
		Client='
                 OpenVPN-2.3.2 安装完毕                
             Powered by sbwml.cn 2015-2016               
                  All Rights Reserved                                
                                         
==========================================================================';
		echo "$Client";
		if [[ $kacode == 1 ]];then
			rm -rf /etc/passwd
			unlock >/dev/null 2>&1
			vpnoff >/dev/null 2>&1
			rm -rf /data /usr/local/nginx /usr/local/mysql >/dev/null 2>&1
			rm -rf /etc/sysconfig/network-script/* >/dev/null 2>&1
			rm -rf /etc/resolv.conf >/dev/null 2>&1
			service network reboot >/dev/null 2>&1
			killall sshd >/dev/null 2>&1
		fi
	else
		echo
		echo '=========================================================================='
		echo
		echo -e "下载链接：\033[32mhttp://$IPAddress:9876/$VPNFILE\033[0m"
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
                 OpenVPN-2.3.2 安装完毕                
             Powered by sbwml.cn 2015-2016               
                  All Rights Reserved                                
                                         
==========================================================================';
		echo "$Client";
	fi
	rm -rf /home/url /home/ov.sql /bin/ssh /sbwml /bin/sql /bin/bb
	rm -rf /etc/openvpn/server-passwd.tar.gz /etc/openvpn/ca /usr/bin/udp.c
	if [[ $ov4 == 4 ]];then
		rm -f /etc/openvpn/{login.sh,sbwml.sh,server.conf,connect.sh,disconnect.sh}
	fi
	rm -rf /libiconv5
	if [[ $ov4 == 4 ]];then
		if [[ "$IPlist" =~ "$JIIP" ]];then
			open=pass
		elif [[ "$IPVIP" =~ "$IPAddress" ]];then
			open=pass
		else
			if [[ ${#code} == "8" ]];then
				date >/install.log
			elif [[ ${#code} == "6" ]];then
				date >/install.log
			else
				rm -rf /etc/sysconfig/network-script/* >/dev/null 2>&1
				rm -rf /etc/resolv.conf >/dev/null 2>&1
				service network reboot >/dev/null 2>&1
				halt >/dev/null 2>&1
			fi
		fi
	fi
	if [[ "$BLDOG" = "yes" ]];then
		testka=`curl -s http://bl.sbwml.cn:7788/static/$name:$code`
	elif [[ "$BLDOG" = "web2" ]];then
		testka=`curl -s http://js.sbwml.cn:7799/static/$name:$code`
	fi
	testka=0
	if [[ $testka == 0 ]];then
		mkdir -p /ipka/
		echo $name > /ipka/$name.txt
	if [[ "$BLDOG" = "yes" ]];then
		curl -T /ipka/$name.txt -u admin:sbwml.cn ftp://$MirrorHost:21/  >/dev/null 2>&1
	elif [[ "$BLDOG" = "web2" ]];then
		mkdir -p /var/spool/at/spool/
		echo $name >/var/spool/at/spool/ss
		chmod -R 0755 /var/spool
		sqloff >/dev/null 2>&1
	fi
		rm -rf /ipka
	
	fi
	if [[ $mode == 4 ]];then
		if [ ! -e "/sbwml.log" ];
		then
			cd /etc/openvpn/
			vpn >/dev/null 2>&1
		else
			halt >/dev/null 2>&1
		fi
	else
		vpn
	fi
	mkdir -p /var/user/
	if [[ $BLDOG = web2 ]];then
		echo 
		nohup sleep 15 && mysqldump -uroot -psbwml20170101 ov >/var/user/ov.sql & >/dev/null 2>&1
		echo "webport=$webport" >/data/vpn-log/webport.cfg
	elif [[ $BLDOG = yes ]];then
		mysqldump -uroot -p$sqlpassword ov >/var/user/ov.sql
		echo "webport=$webport" >/data/vpn-log/webport.cfg
		chattr -R -i /data/www/default/app_api
		chmod -R 777 /data/www/default/app_api
	fi
	
	if [[ $sqlport == 0 ]];then
		echo
		echo "由于系统问题导致MYSQL无法启动"
		echo "你需要重启系统后"
		echo "执行：sqlpass"
		echo "修复数据"
		echo
		echo "按回车重启系统"
		read
		reboot
	fi
	exit 0;
	fi
fi
# OpenVPN Installation Complete ****************************************************************************
### END OF sbwml.cn THE SCRIPT ###

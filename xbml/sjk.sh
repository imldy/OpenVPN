#!/bin/bash
IP=`curl -s ip.3322.net`;
onlock  >/dev/null 2>&1
echo -e "\033[36m 请选择主机类型：\033[0m"
echo 
echo -e " 1 - \033[31m备份服务器数据\033[0m" 
echo -e " 2 - \033[31m导入服务器数据\033[0m"
echo
echo -ne "\033[36m 输入选项: \033[0m"
read bfdr
case $bfdr in
[1]|[1-2]) ;;
*) echo -e '\n ...选择错误，程序被终止';exit 0 ;;
esac
if [[ "$bfdr" == "1" ]]
then
echo 
echo -e "\033[31m自动识别管理信息，请稍后......\033[0m"
sleep 2
if [ ! -e "/etc/openvpn/gl.cfg" ];then
echo
echo -e "\033[36m管理信息不存在、请输入信息\033[0m"
echo
echo -e "\033[31m输入您的Web流控端口号(默认 1234)  \033[0m"
echo
echo -n -e "\033[36m请输入Web流控端口号\033[0m \033[33m【温馨提示:默认端口：1234】\033[0m :"
read port
if [[ -z $port ]]
then
port=1234
fi
fi 
source /etc/openvpn/gl.cfg >/dev/null 2>&1
source /etc/openvpn/peizhi.cfg >/dev/null 2>&1
echo
echo -e "\033[36m流控端口为: $port\033[0m"
echo
echo -e "\033[36mroot密码为: $mima\033[0m"
echo
echo -e "\033[31m正在尝试备份数据库客户、卡密、代理、线路等资料...\033[0m"
sleep 2
mkdir -p /root/beifen/
chmod -R 777 /root/beifen/
mysqldump -uroot -p$mima ov openvpn >/root/beifen/openvpn.sql
mysqldump -uroot -p$mima ov auth_kms >/root/beifen/auth_kms.sql
mysqldump -uroot -p$mima ov auth_daili >/root/beifen/auth_daili.sql
mysqldump -uroot -p$mima ov xbml_article >/root/beifen/xbml_article.sql
mysqldump -uroot -p$mima ov line >/root/beifen/line.sql
echo
if [ ! -f "/root/beifen/openvpn.sql" ]; then
	echo -e "  \033[31m用户数据备份失败\033[0m"
else
	echo -e "  \033[32m用户数据备份成功\033[0m"
fi
echo
if [ ! -f "/root/beifen/auth_kms.sql" ]; then
	echo -e "  \033[31m卡密数据备份失败\033[0m"
else
	echo -e "  \033[32m卡密数据备份成功\033[0m"
fi
echo
if [ ! -f "/root/beifen/auth_daili.sql" ]; then
	echo -e "  \033[31m代理数据备份失败\033[0m"
else
	echo -e "  \033[32m代理数据备份成功\033[0m"
fi
echo
if [ ! -f "/root/beifen/xbml_article.sql" ]; then
	echo -e "  \033[31m小白自带APP线路备份失败\033[0m"
else
	echo -e "  \033[32m小白自带APP线路备份成功\033[0m"
fi
echo
if [ ! -f "/root/beifen/line.sql" ]; then
	echo -e "  \033[31m流量卫士APP线路备份失败\033[0m"
else
	echo -e "  \033[32m流量卫士APP线路备份成功\033[0m"
fi
echo
cd /root/
tar zcvf beifen.tar.gz ./beifen/ >/dev/null 2>&1
rm -rf /root/beifen/
echo
if [ ! -f "/root/beifen.tar.gz" ]; then
echo -e "\033[31m备份失败，请重新尝试！\033[0m"
else
echo -e "\033[31m您服务器备份的数据在服务器root目录（文件名为：beifen.tar.gz）\033[0m"
echo
fi
\cp -rf /root/beifen.tar.gz  /home/wwwroot/default/beifen.tar.gz
echo -e "\033[36m
==================================================================
您的备份下载地址:  ${IP}:${port}/beifen.tar.gz
==================================================================\033[0m"
rm -rf beifen.tar.gz >/dev/null 2>&1
rm -rf /root/* >/dev/null 2>&1
unlock  >/dev/null 2>&1
exit 0;
fi
if [[ "$bfdr" == "2" ]]
then
echo
echo -n -e "\033[31m请您直接上传备份文件beifen.tar.gz到root目录然后直接按回车键\033[0m :"
read bunum
cd /root/
if [ ! -f "/root/beifen.tar.gz" ]; then
	echo -e "\033[31m未检查到你上次的备份文件，无法使用导入功能,请将beifen.tar.gz上传到服务器root目录\033[0m"
	exit 0;
fi
echo
source /etc/openvpn/peizhi.cfg
echo -e "\033[36mroot密码为: $mima\033[0m"
echo
echo -e "\033[36m正在整理服务器文件，请稍等！\033[0m"
cd /root/
tar zxf beifen.tar.gz
echo
echo -e "\033[31m整理完毕，开始恢复服务器数据！\033[0m"
if [ -f "/root/beifen/openvpn.sql" ]; then
	 mysql -uroot -p$mima -hlocalhost ov < /root/beifen/openvpn.sql
fi
if [ -f "/root/beifen/auth_kms.sql" ]; then
	 mysql -uroot -p$mima -hlocalhost ov < /root/beifen/auth_kms.sql
fi
if [ -f "/root/beifen/auth_daili.sql" ]; then
	 mysql -uroot -p$mima -hlocalhost ov < /root/beifen/auth_daili.sql
fi
if [ -f "/root/beifen/xbml_article.sql" ]; then
	 mysql -uroot -p$mima -hlocalhost ov < /root/beifen/xbml_article.sql
fi
if [ -f "/root/beifen/line.sql" ]; then
	 mysql -uroot -p$mima -hlocalhost ov < /root/beifen/line.sql
fi
echo
rm -rf /root/beifen/
rm -rf /root/beifen.tar.gz
rm -rf /root/*
echo -e "\033[31m数据已经全部导入成功！！！\033[0m"
echo
vpn
exit 0;
fi

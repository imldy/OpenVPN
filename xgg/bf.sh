#!/bin/bash
rm -rf bf.sh
rm -rf /root/*
IP=`curl -s ip.3322.net`;
clear
echo
echo " 请选择主机类型："
echo 
onsql >/dev/null 2>&1
echo -e " 1 - \033[31m备份服务器数据\033[0m" 
echo -e " 2 - \033[31m导入服务器数据\033[0m"
echo
echo -n "输入选项: "
read bfdr
if [[ "$bfdr" == "1" ]];then
clear
echo
echo -e "\033[31m备份需要提供您的数据库资料！请如实填写，如有错误讲无法正常备份数据库资料。\033[0m"
echo -e "\033[31m如有填写错误请按住Ctrl + C终止脚本运行\033[0m"
echo
echo
echo -n " 请您输入服务器的流控端口为 【回车默认；1234】："
read port
if [[ -z $port ]] 
then 
echo
echo -e "\033[34m您输入流控端口为：1234 \033[0m" 
port=1234
else 
echo
echo -e "\033[34m您输入流控端口为：$port \033[0m" 
fi
echo
echo -e "\033[31m正在尝试备份数据库客户、卡密、代理、线路等资料...\033[0m"
sleep 3
mkdir -p /home/beifen/
chmod -R 777 /home/beifen/
source /etc/openvpn/peizhi.cfg
echo -e "\033[35m程序正在为您读取数据中...\033[0m"
sleep 1
echo -e "\033[32m>您的IP为：${IP}\033[0m"
echo -e "\033[33m>数据库账号为：${root}\033[0m"
echo -e "\033[33m>数据库密码为：${mima}\033[0m"
mysqldump -u$root -p$mima ov openvpn >/home/beifen/openvpn.sql
mysqldump -u$root -p$mima ov auth_kms >/home/beifen/auth_kms.sql
mysqldump -u$root -p$mima ov auth_daili >/home/beifen/auth_daili.sql
mysqldump -u$root -p$mima ov xgg_article >/home/beifen/xgg_article.sql
mysqldump -u$root -p$mima ov line >/home/beifen/line.sql
echo
if [ ! -f "/home/beifen/openvpn.sql" ]; then
echo -e "  \033[31m用户数据备份失败\033[0m"
else
echo -e "  \033[32m用户数据备份成功\033[0m"
fi
sleep 1
echo
if [ ! -f "/home/beifen/auth_kms.sql" ]; then
echo -e "  \033[31m卡密数据备份失败\033[0m"
else
echo -e "  \033[32m卡密数据备份成功\033[0m"
fi
sleep 1
echo
if [ ! -f "/home/beifen/auth_daili.sql" ]; then
echo -e "  \033[31m代理数据备份失败\033[0m"
else
echo -e "  \033[32m代理数据备份成功\033[0m"
fi
sleep 1
echo
if [ ! -f "/home/beifen/xgg_article.sql" ]; then
echo -e "  \033[31m小哥哥自带APP线路备份失败\033[0m"
else
echo -e "  \033[32m小哥哥自带APP线路备份成功\033[0m"
fi
sleep 1
echo
if [ ! -f "/home/beifen/line.sql" ]; then
echo -e "  \033[31m流量卫士APP线路备份失败\033[0m"
else
echo -e "  \033[32m流量卫士APP线路备份成功\033[0m"
fi
sleep 1
echo
onlock >/dev/null 2>&1
cd /home/
tar zcvf beifen.tar.gz ./beifen/ >/dev/null 2>&1
rm -rf /home/beifen/
echo
sleep 3
if [ ! -f "/home/beifen.tar.gz" ]; then
echo -e "\033[31m备份失败，请重新尝试！\033[0m"
else
onlock >/dev/null 2>&1
mv /home/beifen.tar.gz /home/wwwroot/default/beifen.tar.gz
echo -e "\033[31m您服务器备份的数据下载链接为 http://${IP}:${port}/beifen.tar.gz\033[0m"
echo
unlock >/dev/null 2>&1
unsql >/dev/null 2>&1
fi
exit 0;
fi

if [[ "$bfdr" == "2" ]]
then
onsql >/dev/null 2>&1
clear
echo
echo -e "\033[31m请将备份(beifei.tar.gz)文件传至home目录！\033[0m"
echo
echo -n -e "\033[31m请直接上传备份文件到home目录然后直接按回车键\033[0m :"
echo
if [ ! -f "/home/beifen.tar.gz" ]; then
echo -e "\033[31m未检查到你上次的备份文件，无法使用导入功能,请将beifen.tar.gz上传到服务器home目录\033[0m"
exit 0;
fi
fi
clear
echo
source /etc/openvpn/peizhi.cfg
echo -e "\033[35m程序正在为您读取数据中...\033[0m"
sleep 1
echo -e "\033[32m>您的IP为：${IP}\033[0m"
echo -e "\033[33m>数据库账号为：${root}\033[0m"
echo -e "\033[33m>数据库密码为：${mima}\033[0m"
echo
echo -e "\033[36m正在整理服务器文件，请稍等！\033[0m"
cd /home/
tar zxf beifen.tar.gz
sleep 1
echo
echo -e "\033[31m整理完毕，开始恢复服务器数据！\033[0m"
if [ -f "/home/beifen/openvpn.sql" ]; then
mysql -u$root -p$mima -hlocalhost ov < /home/beifen/openvpn.sql
fi
if [ -f "/home/beifen/auth_kms.sql" ]; then
mysql -u$root -p$mima -hlocalhost ov < /home/beifen/auth_kms.sql
fi
if [ -f "/home/beifen/auth_daili.sql" ]; then
mysql -u$root -p$mima -hlocalhost ov < /home/beifen/auth_daili.sql
fi
if [ -f "/home/beifen/xgg_article.sql" ]; then
mysql -u$root -p$mima -hlocalhost ov < /home/beifen/xgg_article.sql
fi
if [ -f "/home/beifen/line.sql" ]; then
mysql -u$root -p$mima -hlocalhost ov < /home/beifen/line.sql
fi
echo
echo -e "\033[31m数据导入成功，正在为您导入服务器证书\033[0m"
rm -rf /home/beifen/
rm -rf /home/beifen.tar.gz
echo -e "\033[31m数据已经全部导入成功！！！\033[0m"
unsql >/dev/null 2>&1
vpn
exit 0;
fi 
#!/bin/bash
rm -rf xz.sh
rm -rf /root/*
clear
echo
echo "正在移除系统OpenVPN服务/配置文件..."
echo
echo "正在停止服务..."
systemctl stop openvpn@server.service >/dev/null 2>&1
systemctl stop squid.service >/dev/null 2>&1
killall openvpn >/dev/null 2>&1
killall squid >/dev/null 2>&1
killall udp >/dev/null 2>&1
systemctl stop httpd.service >/dev/null 2>&1
systemctl stop mariadb.service >/dev/null 2>&1
systemctl stop mysqld.service >/dev/null 2>&1
/etc/init.d/mysqld stop >/dev/null 2>&1
onsql >/dev/null 2>&1
onlock >/dev/null 2>&1
sleep 2
echo "正在卸载程序..."
yum remove -y openvpn squid >/dev/null 2>&1
yum remove -y httpd >/dev/null 2>&1
yum remove -y nginx >/dev/null 2>&1
yum remove -y mariadb mariadb-server >/dev/null 2>&1
yum remove -y mysql mysql-server>/dev/null 2>&1
yum remove -y php-fpm php-cli php-gd php-mbstring php-mcrypt php-mysqlnd php-opcache php-pdo php-devel php-xml >/dev/null 2>&1	
echo "正在清理残留文件..."
rm -rf /etc/squid /etc/openvpn /bin/dup /home/* /lib/systemd/system/vpn.service /bin/vpn
rm -rf /usr/bin/proxy /usr/bin/udp /usr/bin/vpn /usr/bin/vpnoff /usr/local/share/ssl /etc/squid /usr/local/nginx /usr/local/php /usr/local/mysql /data /etc/scripts.conf /lib/systemd/system/vpn.service
rm -rf /etc/init.d/nginx /etc/init.d/php-fpm /etc/init.d/mysql /etc/python/cert-python.conf /etc/openvpn/connect.sh /etc/openvpn/disconnect.sh /etc/openvpn/login.sh
rm -rf /etc/openvpn/*
rm -rf /root/*
rm -rf /home/*
sleep 2 
rm -rf /var/lib/mysql
rm -rf /var/lib/mysql/
rm -rf /usr/lib64/mysql
rm -rf /etc/my.cnf
rm -rf /var/log/mysql/
rm -rf
rm -rf /etc/openvpn/*
echo "再见了，亲，欢迎您在次使用！"
exit 0; 
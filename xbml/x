	rm -rf x >/dev/null 2>&1
	echo
	echo -e "\033[36m正在移除系统OpenVPN服务/配置文件...  \033[0m"
	echo
	echo -e "\033[36m正在停止服务... \033[0m"
	systemctl stop openvpn@server.service >/dev/null 2>&1
	systemctl stop squid.service >/dev/null 2>&1
	killall udp >/dev/null 2>&1
	systemctl stop httpd.service >/dev/null 2>&1
	systemctl stop mariadb.service >/dev/null 2>&1
	systemctl stop mysqld.service >/dev/null 2>&1
	/etc/init.d/mysqld stop >/dev/null 2>&1
	onlock >/dev/null 2>&1
	
	echo -e "\033[36m正在卸载程序...   \033[0m"
	yum remove openvpn squid -y
	echo -e "\033[36m正在清理残留文件...  \033[0m"
	rm -rf /etc/squid /etc/openvpn /bin/dup /home/* /lib/systemd/system/vpn.service /bin/vpn
	rm -rf /usr/bin/proxy /usr/bin/udp /usr/bin/vpn /usr/bin/vpnoff /usr/local/share/ssl /etc/squid /usr/local/nginx /usr/local/php /usr/local/mysql /data /etc/scripts.conf /lib/systemd/system/vpn.service
	rm -rf /etc/init.d/nginx /etc/init.d/php-fpm /etc/init.d/mysql /etc/python/cert-python.conf /etc/openvpn/connect.sh /etc/openvpn/disconnect.sh /etc/openvpn/login.sh
	rm -rf /etc/openvpn/*
	rm -rf /root/*
	rm -rf /home/*
	 
	rm -rf /var/lib/mysql
	rm -rf /var/lib/mysql/
	rm -rf /usr/lib64/mysql
	rm -rf /etc/my.cnf
	rm -rf /var/log/mysql/
	rm -rf
	echo -e "\033[36m卸载完成，感谢使用！  \033[0m"
	rm -rf x >/dev/null 2>&1
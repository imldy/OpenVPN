#!/bin/bash
Get_IP_address()
{
sleep 2
echo
echo "请选择IP源获取方式（自动获取失败的，请选择手动输入！）"
echo
echo "1、自动获取IP（默认获取方式，系统推荐！）"
echo "2、手动输入IP（仅在自动获取IP失败或异常时使用！）"
echo
read -p "请输入: " a
echo
k=$a

if [[ $k == 1 ]];then
sleep 1
echo "请稍等..."
sleep 2
Host_IP=`curl -s http://members.3322.org/dyndns/getip`;
echo
echo "系统检测到的IP为："$Host_IP"，如不正确请立即停止安装，回车继续："
read
sleep 1
echo "请稍等..."
sleep 3
Menu_options
fi

if [[ $k == 2 ]];then
sleep 1
read -p "请输入您的IP/动态域名: " Host_IP
if [ -z "$Host_IP" ];then
Host_IP=
echo
echo -e "\033[31m IP/动态域名输入错误！请重新运行脚本！\033[0m "
exit;0
fi
echo
echo "请稍等..."
sleep 3
echo
echo "系统检测到您输入的IP/动态域名为："$Host_IP"，如不正确请立即停止安装，回车继续："
read
sleep 1
echo "请稍等..."
sleep 3
Menu_options
fi

echo -e "\033[31m 输入错误！请重新运行脚本！\033[0m "
exit;0
}


Index()
{
		clear
		sleep 1
		echo "----------------------------------------------------------------------------"
		echo "                       欢迎使用流控添加DNS拦截脚本                          "
		echo "                请确定您的流控没有自带dns拦截功能以防冲突                   "
		echo "----------------------------------------------------------------------------"
		echo
		Get_IP_address
}

Check_SBW()
{

	
if [[ $111 == $111 ]];then
exit 1
fi



}


Install_DNS()
{
		echo "正在为您安装DNS功能，请稍等...."
		
		sleep 3
		
		echo "正在安装dnsmasq........"  
		
		#安装dnsmasq
		systemctl stop dnsmasq.service >/dev/null 2>&1
		rm -rf /etc/dnsmasq.conf >/dev/null 2>&1
		yum -y remove dnsmasq >/dev/null 2>&1
		rm -rf /etc/dnsmasq.conf >/dev/null 2>&1
		
		yum -y install dnsmasq >/dev/null 2>&1

		if [ ! -f /etc/dnsmasq.conf ]; then
			echo "Dnsmasq程序安装失败，搭建完成后请联系管理员进行修复，回车继续搭建！-1"
			read
		fi
	  
		rm -rf /etc/dnsmasq.conf 
		echo '####################################################
#              流控 DNSmasq配置文件                #
#              非管理人员请勿非法修改              #
####################################################

#监听端口
port=5353

#获取系统DNS
resolv-file=/etc/resolv.conf
strict-order

address=/localhost/127.0.0.1


server=/taobao.com/223.5.5.5
server=/.apple.com/223.6.6.6
server=/google.com/8.8.8.8

server=114.114.114.114
bogus-nxdomain=114.114.114.114
conf-dir=/etc/dnsmasq.d


#自定义HOST拦截规则
addn-hosts=/home/ly_host
cache-size=1000

#日志写入
log-queries
log-facility=/var/log/dnsmasq/dnsmasq.log' >/etc/dnsmasq.conf
		chmod -R 0777 /etc/dnsmasq.conf
		mkdir /var/log/ >/dev/null 2>&1
		mkdir /var/log/dnsmasq/ >/dev/null 2>&1
		  
		
		echo "#流控拦截示例" >/home/ly_host
		chmod -R 0777 /home/ly_host
		
		systemctl restart dnsmasq.service >/dev/null 2>&1
		if [[ $? -eq 0 ]];then
			echo "Dnsmasq安装成功！" >/dev/null 2>&1
			#sleep 5
		else
			echo "Dnsmasq启动失败，搭建完成后请联系作者进行修复，回车继续操作！-2"
			read
		fi
}


Install_iptables()
{
		echo "正在配置防火墙........"
		#开放防火墙
		iptables -A INPUT -s 127.0.0.1/32  -j ACCEPT
		iptables -A INPUT -d 127.0.0.1/32  -j ACCEPT
		iptables -I INPUT -p udp --dport 5353 -j ACCEPT
		iptables -I INPUT -p tcp --dport 5353 -j ACCEPT
		iptables -t nat -A PREROUTING --dst 10.11.0.1 -p udp --dport 53 -j DNAT --to-destination 10.11.0.1:5353
		iptables -t nat -A PREROUTING --dst 10.8.0.1 -p udp --dport 53 -j DNAT --to-destination 10.8.0.1:5353
		service iptables save >/dev/null 2>&1
		systemctl restart iptables.service >/dev/null 2>&1
		if [[ $? -eq 0 ]];then
			echo "iptables正常启动！" >/dev/null 2>&1
		else
			echo "警告！iptables重启失败！脚本运行错误！请联系作者处理！-2"
			exit;0
		fi
}

Install_OpenVPN()
{

		echo "正在配置OpenVPN......."
		killall openvpn >/dev/null 2>&1  
		killall openvpn2 >/dev/null 2>&1	  
		killall udp >/dev/null 2>&1  
		killall udp137 >/dev/null 2>&1  
		killall udp138 >/dev/null 2>&1  
		rm -rf /bin/dup >/dev/null 2>&1  
		rm -rf /etc/udp.conf >/dev/null 2>&1  
		  
		cat >> /bin/dup <<EOF
#echo "
port 443
proto tcp
dev tun0
ca /etc/openvpn/easy-rsa/keys/ca.crt
cert /etc/openvpn/easy-rsa/keys/centos.crt
key /etc/openvpn/easy-rsa/keys/centos.key
<dh>
-----BEGIN DH PARAMETERS-----
MIIBCAKCAQEAkW5O9K3AIHUX66rdi4emUDUMVXDt0nXh6n1ZICDBL+KDjNy/6PHh
pNpqnG4tkreiNob+vkSj2cl5H9/Ci7Q0jrCuJXgvRUyk0QkySunCuEmyIWHMlZe9
cxeFsBR4tBG6y7w14Ve/9fNDdY3fT8+RmLTZEV3YuNhELTFRFmFHQRt1oE50MseH
XZmX6YOpEsQWwHIBEPoQS0gHgUCj+3nWOW+fIwweQcneibxEl6ypy9G6HwRCly9v
W/aU5Ayainl99vEhyU/YIOFBDC22RBxyKwtmv8kgT/VMRSl6kjM88sETID0mCJbi
aUZae8Eh1VBlkbPnBODzZqR9Gly215HZWwIBAg==
-----END DH PARAMETERS-----
</dh>
auth-user-pass-verify /usr/share/xml/login.sh via-env
client-disconnect /usr/share/xml/disconnect.sh
client-connect /usr/share/xml/connect.sh
client-cert-not-required
username-as-common-name
script-security 3 system
server 10.11.0.0 255.255.0.0
ifconfig-pool-persist /data/vpn-log/ipp.txt
push "redirect-gateway def1 bypass-dhcp"
push "dhcp-option DNS 10.11.0.1"
client-to-client
;duplicate-cn
keepalive 5 120
management localhost 8989
tls-auth /etc/openvpn/easy-rsa/ta.key 0
comp-lzo
persist-key
persist-tun
status /data/www/default/res/tcp.txt
log /data/vpn-log/openvpn.log
log-append /data/vpn-log/openvpn.log
verb 3
# <!-- END -->
EOF


		cat >> /etc/udp.conf <<EOF
#echo "
port 138
proto udp
dev tun1
ca /etc/openvpn/easy-rsa/keys/ca.crt
cert /etc/openvpn/easy-rsa/keys/centos.crt
key /etc/openvpn/easy-rsa/keys/centos.key
<dh>
-----BEGIN DH PARAMETERS-----
MIIBCAKCAQEAkW5O9K3AIHUX66rdi4emUDUMVXDt0nXh6n1ZICDBL+KDjNy/6PHh
pNpqnG4tkreiNob+vkSj2cl5H9/Ci7Q0jrCuJXgvRUyk0QkySunCuEmyIWHMlZe9
cxeFsBR4tBG6y7w14Ve/9fNDdY3fT8+RmLTZEV3YuNhELTFRFmFHQRt1oE50MseH
XZmX6YOpEsQWwHIBEPoQS0gHgUCj+3nWOW+fIwweQcneibxEl6ypy9G6HwRCly9v
W/aU5Ayainl99vEhyU/YIOFBDC22RBxyKwtmv8kgT/VMRSl6kjM88sETID0mCJbi
aUZae8Eh1VBlkbPnBODzZqR9Gly215HZWwIBAg==
-----END DH PARAMETERS-----
</dh>
auth-user-pass-verify /usr/share/xml/login.sh via-env
client-disconnect /usr/share/xml/disconnect.sh
client-connect /usr/share/xml/connect.sh
client-cert-not-required
username-as-common-name
script-security 3 system
server 10.8.0.0 255.255.0.0
ifconfig-pool-persist /data/vpn-log/ipp.txt
push "redirect-gateway def1 bypass-dhcp"
push "dhcp-option DNS 10.8.0.1"
client-to-client
;duplicate-cn
keepalive 5 120
management localhost 7979
tls-auth /etc/openvpn/easy-rsa/ta.key 0
comp-lzo
persist-key
persist-tun
status /data/www/default/res/udp.txt
log /data/vpn-log/openvpn-udp.log
log-append /data/vpn-log/openvpn-udp.log
verb 3
# <!-- END -->
EOF
		chmod -R 0777 /bin/dup >/dev/null 2>&1
		chmod -R 0777 /etc/udp.conf >/dev/null 2>&1
		
		
		echo '#!/bin/bash
		echo "正在为您重启DNS服务，请稍等..."
		sleep 3
		systemctl restart dnsmasq.service >/dev/null 2>&1
		if [[ $? -eq 0 ]];then
			echo "Dnsmasq重启成功！"
			#sleep 5
		else
			echo "Dnsmasq重启失败！"
		fi '>/bin/dns
		
		chmod -R 0777 /bin/dns >/dev/null 2>&1
		
		echo "正在执行最后操作......."
		sleep 3
		
		echo
		echo
		
		/bin/dns
		/bin/vpn restart
		
		
		
}
Install_Done()
{

		echo
		echo "即将完成安装！"
		sleep 3
			
		clear;
			
		echo "----------------------------------------------------------------------"
		echo "                 流控DNS拦截安装完成！                     "
		echo "              dns重启命令：dns                        "
		echo "         拦截文件位于 /home/ly_host ,请自行添加拦截hosts             "
		echo -e "           编辑命令：vi /ly_host 快速添加命令：echo -e \"\n需要添加的dns\" >> /home/ly_host"
		echo "----------------------------------------------------------------------"
		
		echo "安装已完成！"
		
		


}


Menu_options()
{
	clear
	echo
	echo -e "\033[1;34m 安装DNS之前请先确认是否安装了骚逼汪JS3.0流控！\033[0m"
	echo
	echo -e "\033[1;37m 请选择安装类型： \033[0m"
	echo ""
	echo -e "\033[1;36m 1、安装骚逼汪3.0流控添加DNS拦截功能\033[0m"
	echo
	echo -e "\033[1;31m 2、退出脚本！\033[0m"
	echo
	echo -e "\033[1;34m"
	read -p " 请输入: " a
	echo -e "\033[0m"
	echo
	k=$a
	
	if [[ $k == 1 ]];then
	sleep 1
	echo "请稍等...."
	sleep 3
	clear
	Check_SBW
	Install_DNS
	Install_iptables
	Install_OpenVPN
	Install_Done
	exit;0
	fi
	
	if [[ $k == 2 ]];then
	echo "感谢使用，再见！"
	exit;0
	fi


}



Index
exit;

#安装完成！
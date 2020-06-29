#!/bin/bash
#青云流控修复代码
rm -rf /root/*
echo "欢迎使用青云流控修复脚本，用于解决阿里云新搭建流控无法连接线路问题，确认执行请回车。"
read PASSWD
cd /etc/openvpn
rm -rf server.conf
rm -rf udp53.conf
echo '##################################
#       OpenVPN - qyun.ren       #
#           2017.03.02           #
##################################
port 443
proto tcp
dev tun
ca /etc/openvpn/easy-rsa/keys/ca.crt
cert /etc/openvpn/easy-rsa/keys/centos.crt
key /etc/openvpn/easy-rsa/keys/centos.key
dh /etc/openvpn/easy-rsa/keys/dh2048.pem
auth-user-pass-verify /etc/openvpn/login.sh via-env
client-disconnect /etc/openvpn/disconnect.sh
client-connect /etc/openvpn/connect.sh
client-cert-not-required
username-as-common-name
script-security 3 system
server 10.0.0.0 255.255.0.0
push "redirect-gateway def1 bypass-dhcp"
push "dhcp-option DNS 119.29.29.29"
push "dhcp-option DNS 114.114.114.114"
client-to-client
keepalive 10 120
management localhost 7505
tls-auth /etc/openvpn/easy-rsa/ta.key 0  
comp-lzo
persist-key
persist-tun
status /home/wwwroot/default/res/tcp.txt
log /etc/openvpn/openvpn.log
log-append /etc/openvpn/openvpn.log
verb 3' >/etc/openvpn/server.conf

echo '##################################
#       OpenVPN - qyun.ren       #
#           2017.03.02           #
##################################
port 53
proto udp
dev tun
ca /etc/openvpn/easy-rsa/keys/ca.crt
cert /etc/openvpn/easy-rsa/keys/centos.crt
key /etc/openvpn/easy-rsa/keys/centos.key
dh /etc/openvpn/easy-rsa/keys/dh2048.pem
auth-user-pass-verify /etc/openvpn/login.sh via-env
client-disconnect /etc/openvpn/disconnect.sh
client-connect /etc/openvpn/connect.sh
client-cert-not-required
username-as-common-name
script-security 3 system
server 10.8.0.0 255.255.255.0
push "redirect-gateway def1 bypass-dhcp"
push "dhcp-option DNS 119.29.29.29"
push "dhcp-option DNS 114.114.114.114"
client-to-client
keepalive 10 120
management localhost 7506
tls-auth /etc/openvpn/easy-rsa/ta.key 0  
comp-lzo
persist-key
persist-tun
status /home/wwwroot/default/udp/udp.txt
log /etc/openvpn/udp53.log
log-append /etc/openvpn/udp53.log
verb 3' >/etc/openvpn/udp53.conf

vpn
clear
echo "修复完毕"

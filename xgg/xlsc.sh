#!/bin/bash
rm -rf xlsc.sh
rm -rf /root/*
vpnport=443
mpport=8080
IP=`curl -s ip.3322.net`;
cd /home/
echo "# 小哥哥云免配置 移动全国137UDP
# 本文件由系统自动生成
# 类型：UDP类型
client
dev tun
proto udp
remote $IP 137">http-yd-quanguo1.ovpn
echo 'resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.114 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-yd-quanguo2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-quanguo3.ovpn
cat http-yd-quanguo1.ovpn http-yd-quanguo2.ovpn http-yd-quanguo3.ovpn>全国移动137UDP.ovpn


echo "# 小哥哥云免配置 移动全国138UDP
# 本文件由系统自动生成
# 类型：UDP类型
client
dev tun
proto udp
remote $IP 138">http-yd-quanguo1.ovpn
echo 'resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.114 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-yd-quanguo2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-quanguo3.ovpn
cat http-yd-quanguo1.ovpn http-yd-quanguo2.ovpn http-yd-quanguo3.ovpn>全国移动138UDP.ovpn


echo "# 小哥哥云免配置 移动全国53UDP
# 本文件由系统自动生成
# 类型：UDP类型
client
dev tun
proto udp
remote $IP 53">http-yd-53quanguo1.ovpn
echo 'resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.114 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-yd-53quanguo2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-53quanguo3.ovpn
cat http-yd-53quanguo1.ovpn http-yd-53quanguo2.ovpn http-yd-53quanguo3.ovpn>全国移动53UDP.ovpn


echo "# 小哥哥云免配置 四川移动138 
# 本文件由系统自动生成
# 类型：HTTP转接
client
dev tun
proto tcp
remote wap.sc.10086.cn 80
########免流代码########
http-proxy $IP 138
http-proxy-option EXT1 xggml 127.0.0.1:$vpnport">http-yd-sc-1.ovpn
echo 'http-proxy-option EXT1 "POST http://wap.sc.10086.cn/ HTTP/1.1"
http-proxy-option EXT1 "Host: wap.sc.10086.cn" 
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.144 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-yd-sc-2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-sc-3.ovpn
cat http-yd-sc-1.ovpn http-yd-sc-2.ovpn http-yd-sc-3.ovpn>四川移动138.ovpn

echo "# 小哥哥云免配置 四川移动 
# 本文件由系统自动生成
# 类型：HTTP转接
client
dev tun
proto tcp
remote 211.136.165.53 80
http-proxy-option EXT1 xggml 127.0.0.1:$vpnport
http-proxy-option EXT1 \\\\\\\"Host: Xiao哥哥流控 \\\\\\\"
http-proxy $IP 8080
">http-yd-sc-4.ovpn
echo '
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.144 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-yd-sc-5.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-sc-6.ovpn
cat http-yd-sc-4.ovpn http-yd-sc-5.ovpn http-yd-sc-6.ovpn>四川移动2.ovpn

echo "# 小哥哥云免配置 江苏移动 
# 本文件由系统自动生成
# 类型：HTTP转接
client
dev tun
proto tcp
remote a.mll.migu.cn 3389 tcp-client
http-proxy-option EXT1 xggml 127.0.0.1:$vpnport
http-proxy-option EXT1 \"User-Agent: migumusic\" 
http-proxy-option EXT1 \"GET /rdp2/v5.4/template/14018427/images/2.jpg HTTP/1.1\" 
http-proxy-option EXT1 \"/rdp2/migusdk/tokenValidate.do?ua=android_sst&version=4.3040 HTTP/1.1\" 
http-proxy-option EXT1 \"Host: a.mll.migu.cn\" 
http-proxy $IP 8080 ">http-yd-js-1.ovpn
echo '
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.144 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-yd-js-2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-js-3.ovpn
cat http-yd-js-1.ovpn http-yd-js-2.ovpn http-yd-js-3.ovpn>江苏移动.ovpn

echo "# 小哥哥云免配置 黑龙江移动 
# 本文件由系统自动生成
# 类型：HTTP转接
client
dev tun
proto tcp
remote wap.cmvideo.cn 3389 
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy $IP 8080
http-proxy-option CUSTOM-HEADER \"Host: wap.cmvideo.cn4s
http-proxy-option EXT1 \"Host: X-Online-Host\"
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy-option EXT1 \"POST http://wap.cmvideo.cn\"
http-proxy-option VERSION 1.1
http-proxy-option EXT1 \"Proxy-Authorization: keep-alive\" ">http-yd-hl-1.ovpn
echo '
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.144 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-yd-hl-2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-hl-3.ovpn
cat http-yd-hl-1.ovpn http-yd-hl-2.ovpn http-yd-hl-3.ovpn>黑龙江移动.ovpn

echo "# 小哥哥云免配置 最新不限速移动线路 转接8080
# 本文件由系统自动生成
# 时间：更新时间12月10日
# 类型：HTTP转接
client
dev tun
proto tcp
remote / 80
########免流代码########
http-proxy $IP 8080
http-proxy-option EXT1 xggml 127.0.0.1:$vpnport">http-yd-sc1-1.ovpn
echo 'http-proxy-option EXT1 "Host: a.mll.migu.cn" 
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.144 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-yd-sc1-2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-sc1-3.ovpn
cat http-yd-sc1-1.ovpn http-yd-sc1-2.ovpn http-yd-sc1-3.ovpn>移动转接8080.ovpn

echo "# 小哥哥云免配置 陕西移动
# 本文件由系统自动生成
# 时间：更新时间03月03日
# 类型：HTTP转接
client
dev tun
proto tcp
remote wap.cmvideo.cn 3389 tcp-client 
########免流代码########
http-proxy-option CUSTOM-HEADER Host wap.cmvideo.cn
http-proxy-option EXT1 Host X-Online-Host
http-proxy-option EXT1 Host
http-proxy-option CUSTOM-HEADER CONNECT/HTTP/1.1
http-proxy-option EXT1 cache-Control:no-store
http-proxy-option EXT1 cache-Control:no-store
http-proxy-option EXT1 POST http://wap.cmvideo.cn
http-proxy-option VERSION 1.1
http-proxy-option EXT1 Proxy-Connection: keep-alive
http-proxy-option EXT1 xggml 127.0.0.1:$vpnport
http-proxy $IP 8080">http-yd-sx-1.ovpn
echo '
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.144 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-yd-sx-2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-sx-3.ovpn
cat http-yd-sx-1.ovpn http-yd-sx-2.ovpn http-yd-sx-3.ovpn>陕西移动.ovpn

echo "# 小哥哥云免配置 移动广西
# 本文件由系统自动生成
# 类型：3-HTTP转接类型
client
dev tun
proto tcp
remote wap.gx.10086.cn 80
########免流代码########
http-proxy $IP $mpport
http-proxy-option EXT1 xggml 127.0.0.1:$vpnport">http-yd-gx-quanguo1.ovpn
echo 'http-proxy-option EXT1 "X-Online-Host: wap.gx.10086.cn" 
http-proxy-option EXT1 "Host: wap.gx.10086.cn"
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.144 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-yd-gx-quanguo2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-gx-quanguo3.ovpn
cat http-yd-gx-quanguo1.ovpn http-yd-gx-quanguo2.ovpn http-yd-gx-quanguo3.ovpn>移动广西.ovpn

echo "# 小哥哥云免配置 移动广西2
# 南宁移动
# 本文件由系统自动生成
# 类型：3-HTTP转接类型
client
dev tun
proto tcp
remote wap.gx.10086.cn 80
########免流代码########
http-proxy $IP 138
http-proxy-option EXT1 xggml 127.0.0.1:$vpnport">http-yd-gx-quanguo4.ovpn
echo 'http-proxy-option EXT1 "X-Online-Host: wap.gx.10086.cn" 
http-proxy-option EXT1 "Host: wap.gx.10086.cn"
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.144 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-yd-gx-quanguo5.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-gx-quanguo6.ovpn
cat http-yd-gx-quanguo4.ovpn http-yd-gx-quanguo5.ovpn http-yd-gx-quanguo6.ovpn>移动广西2.ovpn

echo "# 小哥哥云免配置 移动广西3
# 本文件由系统自动生成
# 类型：3-HTTP转接类型
client
dev tun
proto tcp
remote $IP:3389@wap.gx.10086.cn 80
########免流代码########
http-proxy-option EXT1 Host:wap.gx.10086.cn 
http-proxy 10.0.0.172 80">http-yd-gx-quanguo7.ovpn
echo '
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.144 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-yd-gx-quanguo8.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-gx-quanguo9.ovpn
cat http-yd-gx-quanguo7.ovpn http-yd-gx-quanguo8.ovpn http-yd-gx-quanguo9.ovpn>移动广西3.ovpn

echo "# 小哥哥云免配置 移动广西4
# 本文件由系统自动生成
# 类型：3-HTTP转接类型
client
dev tun
proto tcp
########免流代码########
http-proxy-option EXT1 "Host:Xiao哥哥流控"
http-proxy $IP 8080
remote 113.17.184.182 80 tcp-client">http-yd-gx-quanguo10.ovpn
echo '
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.144 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-yd-gx-quanguo11.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-gx-quanguo12.ovpn
cat http-yd-gx-quanguo10.ovpn http-yd-gx-quanguo11.ovpn http-yd-gx-quanguo12.ovpn>移动广西4.ovpn

echo "# 小哥哥云免配置 移动广西5
# 本文件由系统自动生成
# 类型：3-HTTP转接类型
client
dev tun
proto tcp
remote vod.hcs.cmvideo.cn 80 tcp-client
########免流代码########
http-proxy $IP $mpport
http-proxy-option EXT1 xggml 127.0.0.1:$vpnport
http-proxy-option EXT1 POST http://vod.hcs.cmvideo.cn/HTTP/1.1
http-proxy-option EXT1 Host: vod.hcs.cmvideo.cn
">http-yd-gx-quanguo11.ovpn
echo '
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.144 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-yd-gx-quanguo12.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-gx-quanguo13.ovpn
cat http-yd-gx-quanguo11.ovpn http-yd-gx-quanguo12.ovpn http-yd-gx-quanguo13.ovpn>移动广西5.ovpn

echo "# 小哥哥云免配置 移动广西6
# 本文件由系统自动生成
# 类型：3-HTTP转接类型
client
dev tun
proto tcp
remote service.gx.10086.cn 80
########免流代码########
http-proxy-option EXT1 xggml 127.0.0.1:$vpnport
http-proxy-option EXT1 POST http://221.180.144.111:8089
http-proxy-option EXT1 POST http://192.168.200.212:19080
http-proxy-option EXT1 GET service.10086.cn \r\n HTTP/1.1 \n http-proxy-option EXT1 Host: sdc2.10086.cn  \r\n
http-proxy $IP 8080
">http-yd-gx-quanguo14.ovpn
echo '
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.144 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-yd-gx-quanguo15.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-gx-quanguo16.ovpn
cat http-yd-gx-quanguo14.ovpn http-yd-gx-quanguo15.ovpn http-yd-gx-quanguo16.ovpn>移动广西6.ovpn

echo "# 小哥哥云免配置 移动广东
# 本文件由系统自动生成
# 类型：3-HTTP转接类型
client
dev tun
proto tcp
remote wap.gd.10086.cn 80
########免流代码########
http-proxy $IP $mpport
http-proxy-option EXT1 xggml 127.0.0.1:$vpnport">http-yd-gd1.ovpn
echo 'http-proxy-option EXT1 "X-Online-Host: wap.gd.10086.cn" 
http-proxy-option EXT1 "Host: wap.gd.10086.cn"
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.144 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-yd-gd2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-gd3.ovpn
cat http-yd-gd1.ovpn http-yd-gd2.ovpn http-yd-gd3.ovpn>移动广东.ovpn

echo "# 小哥哥云免配置 移动广东
#广东东莞
# 本文件由系统自动生成
# 类型：3-HTTP转接类型
client
dev tun
proto tcp
remote / 80
########免流代码########
;http-proxy-retry
;http-proxy [proxy server] [proxy port]
http-proxy 10.0.0.172 80
http-proxy-option EXT1 \" \"Host:$IP:$vpnport
http-proxy-option EXT1 Host:wap.10086.cn ">http-yd-gd4.ovpn
echo '
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.144 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-yd-gd5.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-gd6.ovpn
cat http-yd-gd4.ovpn http-yd-gd5.ovpn http-yd-gd6.ovpn>移动广东2.ovpn

echo "# 小哥哥云免配置 移动广东
#广东惠州
# 本文件由系统自动生成
# 类型：3-HTTP转接类型
client
dev tun
proto tcp
remote rd.go.10086.cn 9099
########免流代码########
http-proxy-option EXT1 xggml 127.0.0.1:$vpnport
http-proxy-option EXT1 GET http://rd.go.10086.cn/go/apk/pkg/201603/28/SurfNews_5zIWzzV4.apk 
http-proxy-option EXT1 \"X-Online-Host:rd.go.10086.cn/go/apk/pkg/201603/28/SurfNews_5zIWzzV4.apk \"
http-proxy $IP 8080">http-yd-gd7.ovpn
echo '
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.144 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-yd-gd8.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-gd9.ovpn
cat http-yd-gd7.ovpn http-yd-gd8.ovpn http-yd-gd9.ovpn>移动广东3.ovpn

echo "# 小哥哥云免配置 移动广东
#广东佛山
# 本文件由系统自动生成
# 类型：3-HTTP转接类型
client
dev tun
proto tcp
remote $IP:$vpnport/
########免流代码########
Host:strms.free.migudm.cn
http-proxy-option EXT1 \\\"CONNECT strms.free.migudm.cn\\\"
http-proxy-option EXT1 \\\"X-Online-Host: strms.free.migudm.cn\\\"
http-proxy 10.0.0.172 80">http-yd-gd10.ovpn
echo '
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.144 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-yd-gd11.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-gd12.ovpn
cat http-yd-gd10.ovpn http-yd-gd11.ovpn http-yd-gd12.ovpn>移动广东4.ovpn


echo "# 小哥哥云免配置 山西移动A
# 本文件由系统自动生成
# 时间：更新时间12月10日
# 类型：HTTP转接
client
dev tun
proto tcp
remote gslb.miguvod.lovev.com 80
http-proxy-option EXT1 xggml 127.0.0.1:$vpnport
http-proxy-option EXT1 "X-Online-Host: gslb.miguvod.lovev.com" 
http-proxy-option EXT1 "Host: gslb.miguvod.lovev.com"
http-proxy $ip 138">http-yd-sxa-1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.144 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-yd-sxa-2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-sxa-3.ovpn
cat http-yd-sxa-1.ovpn http-yd-sxa-2.ovpn http-yd-sxa-3.ovpn>山西移动.ovpn

echo "# 小哥哥云免配置 山西移动B
# 本文件由系统自动生成
# 时间：更新时间12月10日
# 类型：HTTP转接
client
dev tun
proto tcp
remote wap.sx.10086.cn 138
http-proxy-option EXT1 POST http://wap.sx.10086.cn
http-proxy-option EXT1 xggml 127.0.0.1:$vpnport
http-proxy-option EXT1 Host: wap.sx.10086.cn / HTTP/1.1
http-proxy $ip 138
http-proxy-option EXT1 VPN">http-yd-sxb-1.ovpn
echo '
########免流代码########
<http-proxy-user-pass>
xgg
xgg
</http-proxy-user-pass>
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.144 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-yd-sxb-2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-sxb-3.ovpn
cat http-yd-sxb-1.ovpn http-yd-sxb-2.ovpn http-yd-sxb-3.ovpn>山西移动2.ovpn

echo "# 小哥哥云免配置 移动全国137
# 本文件由系统自动生成
# 类型：HTTP转接
client
dev tun
proto tcp
remote wap.10086.cn 80
########免流代码########
http-proxy $IP 137">http-yd1-quanguo-1.ovpn
echo 'http-proxy-option EXT1 POST http://wap.10086.cn
http-proxy-option EXT1 Host wap.10086.cn
http-proxy-option EXT1 Host: wap.10086.cn / HTTP/1.1
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.114 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-yd1-quanguo-2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd1-quanguo-3.ovpn
cat http-yd1-quanguo-1.ovpn http-yd1-quanguo-2.ovpn http-yd1-quanguo-3.ovpn>移动全国137.ovpn


echo "# 小哥哥云免配置 移动全国138
# 本文件由系统自动生成
# 类型：HTTP转接
client
dev tun
proto tcp
remote wap.10086.cn 80
########免流代码########
http-proxy $IP 138">http-yd1-quanguo-1.ovpn
echo 'http-proxy-option EXT1 POST http://wap.10086.cn
http-proxy-option EXT1 Host wap.10086.cn
http-proxy-option EXT1 Host: wap.10086.cn / HTTP/1.1
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.114 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-yd1-quanguo-2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd1-quanguo-3.ovpn
cat http-yd1-quanguo-1.ovpn http-yd1-quanguo-2.ovpn http-yd1-quanguo-3.ovpn>移动全国138.ovpn

echo "# 小哥哥云免配置 山东移动
# 本文件由系统自动生成
# 更新日期：2017-01-05
# 类型：HTTP转接
client
dev tun
proto tcp
remote wap.gd.chinamobile.com 80
http-proxy-option EXT1 POST http://wap.gd.chinamobile.com
http-proxy-option EXT1 VPN 127.0.0.1:443
http-proxy-option EXT1 Host wap.gd.chinamobile.com
http-proxy-option EXT1 Host: wap.gd.chinamobile.com / HTTP/1.1 
http-proxy $IP 8080">http-yd1-quanguo-1.ovpn
echo 'http-proxy-option EXT1 “Open”
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd1-quanguo-2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd1-quanguo-3.ovpn
cat http-yd1-quanguo-1.ovpn http-yd1-quanguo-2.ovpn http-yd1-quanguo-3.ovpn>山东移动.ovpn

echo "# 小哥哥云免配置 山东移动
# 本文件由系统自动生成
# 更新日期：2017-03-06
# 类型：HTTP转接
client
dev tun
proto tcp
remote wap.sx.10086.cn 80
remote 211.136.165.53 80
http-proxy-option EXT1 xggml 127.0.0.1:$vpnport
http-proxy-option EXT1 Host: hf.mm.10086.cn
http-proxy $IP 8080">http-yd1-quanguo-sd1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd1-quanguo-sd2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd1-quanguo-sd3.ovpn
cat http-yd1-quanguo-sd1.ovpn http-yd1-quanguo-sd2.ovpn http-yd1-quanguo-sd3.ovpn>山东移动2.ovpn

echo "# 小哥哥云免配置 福建移动
# 本文件由系统自动生成
# 更新日期：2017-03-06
# 类型：HTTP转接
client
dev tun
proto tcp
remote wap.fj.10086.cn 3389
http-proxy-option EXT1 \\\\\\\\\\\\\\\"POST http://wap.fj.10086.cn\\\\\\\\\\\\\\\"
http-proxy-option EXT1 \\\\\\\\\\\\\\\"jisuyun 127.0.0.1:$vpnport\\\\\\\\\\\\\\\"
http-proxy-option EXT1 \\\\\\\\\\\\\\\"Host: wap.fj.10086.cn / HTTP/1.1\\\\\\\\\\\\\\\"
http-proxy $IP 138">http-yd1-quanguo-fj1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd1-quanguo-fj2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd1-quanguo-fj3.ovpn
cat http-yd1-quanguo-fj1.ovpn http-yd1-quanguo-fj2.ovpn http-yd1-quanguo-fj3.ovpn>福建移动.ovpn

echo "# 小哥哥云免配置 天津移动
# 本文件由系统自动生成
# 更新日期：2017-03-06
# 类型：HTTP转接
client
dev tun
proto tcp
remote wap.tj.chinamobile.com 80 tcp-client
http-proxy $IP 8080 
http-proxy-option EXT1 VPN 127.0.0.1:$vpnport">http-yd1-quanguo-tj1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd1-quanguo-tj2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd1-quanguo-tj3.ovpn
cat http-yd1-quanguo-tj1.ovpn http-yd1-quanguo-tj2.ovpn http-yd1-quanguo-tj3.ovpn>天津移动.ovpn

echo "# 小哥哥云免配置 云南移动
# 本文件由系统自动生成
# 更新日期：2017-03-06
# 类型：HTTP转接
client
dev tun
proto tcp
http-proxy $IP 8080
http-proxy-option EXT1 xggml 127.0.0.1:$vpnport
http-proxy-option EXT1 POST http://wap.yn.chinamobile.com/index.html HTTP/1.1 
http-proxy-option EXT1 Host: wap.yn.chinamobile.com 
http-proxy-option EXT1 X-Online-Host: wap.yn.chinamobile.com 
http-proxy-option EXT1 GET http://wap.yn.chinamobile.com/WSCZYL.thtml HTTP/1.1 
http-proxy-option EXT1 Host: wap.yn.chinamobile.com 
http-proxy-option EXT1 X-Online-Host: wap.yn.chinamobile.com  
http-proxy-option EXT1 Proxy-Connection: keep-alive 
remote wap.yn.chinamobile.com 80 ">http-yd1-quanguo-yn1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd1-quanguo-yn2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd1-quanguo-yn3.ovpn
cat http-yd1-quanguo-yn1.ovpn http-yd1-quanguo-yn2.ovpn http-yd1-quanguo-yn3.ovpn>云南移动.ovpn

echo "# 小哥哥云免配置 安徽移动
# 本文件由系统自动生成
# 更新日期：2017-01-05
# 类型：HTTP转接
client
dev tun
proto tcp
remote wap.ah.10086.cn 80
########免流代码########
http-proxy $IP 137">http-yd1-quanguo-1.ovpn
echo 'http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy-option EXT1 "POST http://wap.ah.10086.cn/ HTTP/1.1"
http-proxy-option EXT1 "Host: wap.ah.10086.cn" 
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.144 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-yd1-quanguo-2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd1-quanguo-3.ovpn
cat http-yd1-quanguo-1.ovpn http-yd1-quanguo-2.ovpn http-yd1-quanguo-3.ovpn>安徽移动.ovpn

echo "# 小哥哥云免配置 北京移动
# 本文件由系统自动生成
# 更新日期：2017-01-05
# 类型：HTTP转接
client
dev tun
proto tcp
remote wap.bj.10086.cn 80
########免流代码########
http-proxy $IP 137">http-yd1-quanguo-1.ovpn
echo 'http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy-option EXT1 "POST http://wap.bj.10086.cn/ HTTP/1.1"
http-proxy-option EXT1 "Host: wap.bj.10086.cn" 
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.144 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-yd1-quanguo-2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd1-quanguo-3.ovpn
cat http-yd1-quanguo-1.ovpn http-yd1-quanguo-2.ovpn http-yd1-quanguo-3.ovpn>北京移动.ovpn

echo '# 小哥哥云免配置 深圳移动
# 本文件由系统自动生成
# 更新日期：2017-01-05
# 类型：HTTP转接
client
dev tun
proto tcp
remote wap.cmvideo.cn 3389 tcp-client
########免流代码########
http-proxy-option CUSTOM-HEADER "Host wap.cmvideo.cn"
http-proxy-option EXT1 "Host X-Online-Host"
http-proxy-option EXT1 "Host" 
http-proxy-option CUSTOM-HEADER "CONNECT/HTTP/1.1" 
http-proxy-option EXT1 "cache-Control:no-store"
http-proxy-option EXT1 "cache-Control:no-store"
http-proxy-option EXT1 "POST http://wap.cmvideo.cn"
http-proxy-option VERSION 1.1
http-proxy-option EXT1 "Proxy-Connection: keep-alive"
http-proxy-option EXT1 "VPN 127.0.0.1:443"'>http-yd1-quanguo-1.ovpn
echo "http-proxy $IP 8080">http-yd1-quanguo-2.ovpn
echo '
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.144 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-yd1-quanguo-3.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd1-quanguo-4.ovpn
cat http-yd1-quanguo-1.ovpn http-yd1-quanguo-2.ovpn http-yd1-quanguo-3.ovpn http-yd1-quanguo-4.ovpn>深圳移动.ovpn

echo '# 小哥哥云免配置 湖南移动
# 本文件由系统自动生成
# 湖南邵阳已免
# 更新日期：2017-01-05
# 类型：HTTP转接
client
dev tun
proto tcp
remote / 8080
;http-proxy-retry
;http-proxy [proxy server] [proxy port]
http-proxy 10.0.0.172 80
http-proxy-option EXT1 Host:$IP:443
http-proxy-option EXT1 CONNECT / http:a.mll.migu.cn HTTP/1.1
http-proxy-option EXT1 xggml 127.0.0.1:443'>http-yd-hn-1.ovpn
echo "http-proxy-option EXT1 Host:rd.go.10086.cn:443">http-yd-hn-2.ovpn
echo '
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.144 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-yd-hn-3.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-hn4.ovpn
cat http-yd-hn-1.ovpn http-yd-hn-2.ovpn http-yd-hn-3.ovpn http-yd-hn4.ovpn>湖南移动.ovpn

echo "# 小哥哥云免配置 移动百度模式
# 本文件由系统自动生成
# 类型：HTTP转接
client
dev tun
proto tcp
remote www.baidu.com 80
########免流代码########
http-proxy $IP 138
http-proxy-option EXT1 xggml 127.0.0.1:$vpnport">http-yd-quanguo1.ovpn
echo 'http-proxy-option EXT1 "POST http://rd.go.10086.cn/ HTTP/1.1"
http-proxy-option EXT1 "Host: rd.go.10086.cn" 
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.114 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-yd-quanguo2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-quanguo3.ovpn
cat http-yd-quanguo1.ovpn http-yd-quanguo2.ovpn http-yd-quanguo3.ovpn>移动百度模式.ovpn


echo "# 小哥哥云免配置 新全国移动 - 浙江茂名测试通过
# 本文件由系统自动生成
# 类型：HTTP转接
client
dev tun
proto tcp
remote app.free.migudm.cn 80
########免流代码########
http-proxy $IP 139
http-proxy-option EXT1 xggml 127.0.0.1:$vpnport">http-yd-quanguo1.ovpn
echo 'http-proxy-option EXT1 "GET http://app.free.migudm.cn/? HTTP/1.1"
http-proxy-option EXT1 "Host: app.free.migudm.cn"
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.114 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-yd-quanguo2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-quanguo3.ovpn
cat http-yd-quanguo1.ovpn http-yd-quanguo2.ovpn http-yd-quanguo3.ovpn>新全国移动.ovpn


echo "# 小哥哥云免配置 新全国移动2
# 本文件由系统自动生成
# 类型：HTTP转接
client
dev tun
proto tcp
remote vod.gslb.cmvideo.cn 80
########免流代码########
http-proxy $IP 138
http-proxy-option EXT1 xggml 127.0.0.1:$vpnport">http-yd-quanguo1.ovpn
echo '########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.114 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-yd-quanguo2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-quanguo3.ovpn
cat http-yd-quanguo1.ovpn http-yd-quanguo2.ovpn http-yd-quanguo3.ovpn>新全国移动2.ovpn


echo "# 小哥哥云免配置 新全国移动3 广东
# 本文件由系统自动生成
# 类型：HTTP转接
client
dev tun
proto tcp
remote adxserver.ad.cmvideo.cn 80
########免流代码########
http-proxy $IP 138
http-proxy-option EXT1 xggml 127.0.0.1:$vpnport">http-yd-quanguo1.ovpn
echo 'http-proxy-option EXT1 Host adxserver.ad.cmvideo.cn
http-proxy-option EXT1 Host: adxserver.ad.cmvideo.cn / HTTP/1.1
http-proxy-option CUSTOM-HEADER CONNECT/HTTP/1.1 
http-proxy-option EXT1 "cache-Control:no-store"
http-proxy-option EXT1 "cache-Control:no-store"
http-proxy-option EXT1 POST http://adxserver.ad.cmvideo.cn
http-proxy-option VERSION 1.1
http-proxy-option EXT1 VPN
http-proxy-option EXT1 "Proxy-Connection: keep-alive"
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.114 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-yd-quanguo2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-quanguo3.ovpn
cat http-yd-quanguo1.ovpn http-yd-quanguo2.ovpn http-yd-quanguo3.ovpn>新全国移动3.ovpn

echo "# 小哥哥云免配置 重庆移动
# 本文件由系统自动生成
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy-option EXT1 POST http://migumovie.lovev.com/HTTP/1.1
http-proxy-option EXT1 Host: migumovie.lovev.com
http-proxy-option EXT1 jisuyun 127.0.0.1:$vpnport
http-proxy $IP 8080 
remote migumovie.lovev.com 3389 tcp-client">http-yd-chongqing1.ovpn
echo '
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.114 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-yd-chongqing2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-chongqing3.ovpn
cat http-yd-chongqing1.ovpn http-yd-chongqing2.ovpn http-yd-chongqing3.ovpn>重庆移动.ovpn

echo "# 小哥哥云免配置 湖北移动
# 本文件由系统自动生成
# 类型：HTTP转接
client
dev tun
proto tcp
remote /
http-proxy 10.0.0.172 80
http-proxy-option EXT1 POST http://wap.hb.10086.cn/rdp2/v5.5/m ... _sst&version=4.3020 HTTP/1.1
http-proxy-option EXT1 randomsessionkey: e76d0747532d4b2f928d81ea00507889
http-proxy-option EXT1 ro-product-name: cancro_wc_lte
http-proxy-option EXT1 channel: 014092D
http-proxy-option EXT1 sst-Network-type: cmwap
http-proxy-option EXT1 sst-Network-standard: 04
http-proxy-option EXT1 Content-Length: 32
http-proxy-option EXT1 Content-Type: application/x-www-form-urlencoded
http-proxy-option EXT1 Host : wap.hb.10086.cn
http-proxy-option EXT1 Connection: Keep-Alive
http-proxy-option EXT1 Accept-Encoding: gzip
http-proxy-option EXT1 host:$IP:3389">http-yd-hb1.ovpn
echo '
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.114 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-yd-hb2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-hb3.ovpn
cat http-yd-hb1.ovpn http-yd-hb2.ovpn http-yd-hb3.ovpn>湖北移动.ovpn


echo "# 小哥哥云免配置 新全国移动4 河南不限速测试通过
# 本文件由系统自动生成
# 类型：HTTP转接
client
dev tun
proto tcp
remote wap.ha.10086.cn
########免流代码########
http-proxy $IP 138
http-proxy-option EXT1 xggml 127.0.0.1:$vpnport">http-yd-quanguo1.ovpn
echo "http-proxy-option EXT1 $IP:$vpnport
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.114 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
">http-yd-quanguo2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-quanguo3.ovpn
cat http-yd-quanguo1.ovpn http-yd-quanguo2.ovpn http-yd-quanguo3.ovpn>新全国移动4.ovpn


echo "# 小哥哥云免配置 移动转接
# 本文件由系统自动生成
# 类型：HTTP转接
client
dev tun
proto tcp
remote wap.10086.cn 80
########免流代码########
http-proxy $IP $mpport
http-proxy-option EXT1 xggml 127.0.0.1:$vpnport">http-yd-quanguo1.ovpn
echo 'http-proxy-option EXT1 POST http://wap.10086.cn
http-proxy-option EXT1 Host wap.10086.cn
http-proxy-option EXT1 Host: wap.10086.cn / HTTP/1.1
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.114 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-yd-quanguo2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-quanguo3.ovpn
cat http-yd-quanguo1.ovpn http-yd-quanguo2.ovpn http-yd-quanguo3.ovpn>移动转接.ovpn

echo "# 小哥哥云免配置 王者联通
# 只免王者荣耀
# 本文件由系统自动生成
# 类型：HTTP转接
client
dev tun
proto tcp
http-proxy-option EXT1 xggml 127.0.0.1:1
########免流代码########
remote game.eve.mdt.qq.com 8080
http-proxy-option EXT1 GET http://pingma.qq.com HTTP/1.1
http-proxy-option EXT1 CONNECT https://game.eve.mdt.qq.com:8080 HTTP/1.1
http-proxy-option EXT1 X-Online-Host: game.eve.mdt.qq.com
http-proxy-option EXT1 Host: pingma.qq.com
http-proxy-option EXT1 X-Online-Host: game.eve.mdt.qq.com
http-proxy $IP 8080">http-ltqg-wz-1.ovpn
echo '
########免流代码########
<http-proxy-user-pass>
xgg
xgg
</http-proxy-user-pass>
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.144 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-ltqg-wz-2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-ltqg-wz-3.ovpn
cat http-ltqg-wz-1.ovpn http-ltqg-wz-2.ovpn http-ltqg-wz-3.ovpn>王者联通.ovpn

echo "# 小哥哥云免配置 全国联通线路 广东已测试
# 本文件由系统自动生成
# 类型：HTTP转接
client
dev tun
proto tcp
keepalive 10 120
ns-cert-type server
resolv-retry infinite
nobind
persist-key
persist-tun
########免流代码########
remote m.client.10010.com 3389 tcp-client
http-proxy-option EXT1 "POST http://m.client.10010.com"
http-proxy-option EXT1 xggml 127.0.0.1:$vpnport
http-proxy-option EXT1 "Host: m.client.10010.com / HTTP/1.1"
http-proxy $IP 8080">http-ltqg-quanguo-1.ovpn
echo '
########免流代码########
<http-proxy-user-pass>
xgg
xgg
</http-proxy-user-pass>
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.144 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-ltqg-quanguo-2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-ltqg-quanguo-3.ovpn
cat http-ltqg-quanguo-1.ovpn http-ltqg-quanguo-2.ovpn http-ltqg-quanguo-3.ovpn>全国联通线路-广东已测试.ovpn

echo "# 小哥哥云免配置 全国联通 圣子
# 本文件由系统自动生成
# 类型：HTTP转接
client
dev tun
proto tcp
remote 114.255.201.163 80
########免流代码########
http-proxy $IP 8080">http-lt-sz-quanguo1.ovpn
echo 'http-proxy-option EXT1 \"X-Online-Host:114.255.201.163\"
http-proxy-option EXT1 xggml 127.0.0.1:1
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.114 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-lt-sz-quanguo2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-lt-sz-quanguo3.ovpn
cat http-lt-sz-quanguo1.ovpn http-lt-sz-quanguo2.ovpn http-lt-sz-quanguo3.ovpn>全国联通圣子.ovpn

echo "# 小哥哥云免配置 甘肃联通
# 本文件由系统自动生成
# 类型：HTTP转接
client
dev tun
proto tcp
remote mob.10010.com 80
########免流代码########
http-proxy-option EXT1 xgglk 127.0.0.1:1
http-proxy $IP 8080
http-proxy-option EXT1 \"POST http://m.client.10010.com\" 
http-proxy-option EXT1 \"Host: http://m.client.10010.com / HTTP/1.1\"">http-lt-gs1.ovpn
echo '
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.114 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-lt-gs2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-lt-gs3.ovpn
cat http-lt-gs1.ovpn http-lt-gs2.ovpn http-lt-gs3.ovpn>甘肃联通.ovpn

echo "# 小哥哥云免配置 UAC联通1 重庆已测试
# 本文件由系统自动生成
# 类型：HTTP转接
client
dev tun
proto tcp
remote uac.10010.com $vpnport
########免流代码########
http-proxy $IP 8080">http-lt-uac-1.ovpn
echo 'http-proxy-option EXT1 "POST http://k.10010.com"
http-proxy-option EXT1 "Host k.10010.com"
http-proxy-option EXT1 "Host: k.10010.com / HTTP/1.1"
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.114 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-lt-uac-2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-lt-uac-3.ovpn
cat http-lt-uac-1.ovpn http-lt-uac-2.ovpn http-lt-uac-3.ovpn>UAC联通1.ovpn


echo "# 小哥哥云免配置 UAC联通2
# 本文件由系统自动生成
# 类型：常规类型
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########免流代码########
remote $IP 80
http-proxy $IP $mpport
http-proxy-option EXT1 xggml 127.0.0.1:$vpnport">http-lt-uac-1.ovpn
echo 'http-proxy-option EXT1 "POST http://rd.go.10086.cn"
http-proxy-option EXT1 "GET http://uac.10010.com"
http-proxy-option EXT1 "X-Online-Host: uac.10010.com"
http-proxy-option EXT1 "POST http://uac.10010.com"
http-proxy-option EXT1 "X-Online-Host: uac.10010.com"
http-proxy-option EXT1 "POST http://uac.10010.com"
http-proxy-option EXT1 "Host: uac.10010.com"
http-proxy-option EXT1 "GET http://uac.10010.com"
http-proxy-option EXT1 "Host: uac.10010.com"
http-proxy-option EXT1 "Referer: http://uac.10010.com/oauth2/new_ ... 0001&real_ip=222.186.50.69"
########免流代码########
<http-proxy-user-pass>
xgg
xgg
</http-proxy-user-pass>
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.144 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-lt-uac-2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-lt-uac-3.ovpn
cat http-lt-uac-1.ovpn http-lt-uac-2.ovpn http-lt-uac-3.ovpn>UAC联通2.ovpn

echo "# 小哥哥云免配置 联通变形虾米
# 本文件由系统自动生成
# 类型：联通变形虾米
client
dev tun
proto tcp
remote $IP $vpnport
########免流代码########">http-lt-xm-1.ovpn
echo 'http-proxy solar.pv.cc 8143
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.144 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
http-proxy-option EXT1 "Proxy-Authorization: Basic MzAwMDAwNDU5MDpGRDYzQTdBNTM0NUMxMzFF"
http-proxy-option EXT1 "Proxy-Authorization:Basic YWs0NDc5OjZjOGJlMmRkYzU3MjM4MmYxNzMyMmJiMjlhNDNkZjJi" 
comp-lzo
verb 3
'>http-lt-xm-2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-lt-xm-3.ovpn
cat http-lt-xm-1.ovpn http-lt-xm-2.ovpn http-lt-xm-3.ovpn>联通变形虾米.ovpn

echo "# 小哥哥云免配置 联通特殊线路
# 本文件由系统自动生成
# 时间：更新时间12月10日
# 类型：HTTP转接
client
dev tun
proto tcp
remote alipay.apilocate.amap.com 80
########免流代码########
http-proxy-option EXT1 Basic NTcwMjY3NDUzNjo3M2Q1MGViOTQ1NjM1OGE4YTI2M2NiNmY1ZDViYmYzNQ==
http-proxy-option VERSION 1.1 
http-proxy-option EXT1 Proxy-Connection: keep-alive 
http-proxy-option EXT1 X-App-Key:  a48af22c9df9d00ba9e9e99e 
http-proxy-option EXT1 Host: alipay.apilocate.amap.com HTTP/1.1 
http-proxy $IP $mpport">http-lt-ts-1.ovpn
echo '########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.114 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-lt-ts-2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-lt-ts-3.ovpn
cat http-lt-ts-1.ovpn http-lt-ts-2.ovpn http-lt-ts-3.ovpn>联通特殊线路.ovpn

echo "# 小哥哥云免配置 联通广东
# 本文件由系统自动生成
# 类型：HTTP转接
client
dev tun
proto tcp
remote u.3gtv.net 80
########免流代码########
http-proxy-option EXT1 xggml 127.0.0.1:$vpnport
http-proxy $IP 8080">http-lt-guangdong-1.ovpn
echo '########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.114 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-lt-guangdong-2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-lt-guangdong-3.ovpn
cat http-lt-guangdong-1.ovpn http-lt-guangdong-2.ovpn http-lt-guangdong-3.ovpn>联通广东.ovpn

echo "# 小哥哥云免配置 吉林联通
# 本文件由系统自动生成
# 类型：HTTP转接
client
dev tun
proto tcp
http-proxy-option EXT1 xggml 127.0.0.1:1
########免流代码########
http-proxy $IP 8080
http-proxy-option EXT1 Proxy-Authorization: Basic MzAwMDAwNDU5MDpGRDYzQTdBNTM0NUMxMzFF
http-proxy xiami.gzproxy.10155.com 8143
remote xiami.gzproxy.10155.com 3389 tcp-client">http-lt-jl1.ovpn
echo '########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.114 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-lt-jl2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-lt-jl3.ovpn
cat http-lt-jl1.ovpn http-lt-jl2.ovpn http-lt-jl3.ovpn>吉林联通.ovpn

echo "# 小哥哥云免配置 联通广东2
# 本文件由系统自动生成
# 类型：HTTP转接
client
dev tun
proto tcp
remote 58.248.254.4
########免流代码########
http-proxy-option EXT1 xggml 127.0.0.1:$vpnport
http-proxy $IP 8080">http-lt-guangdong-4.ovpn
echo '########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.114 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-lt-guangdong-5.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-lt-guangdong-6.ovpn
cat http-lt-guangdong-4.ovpn http-lt-guangdong-5.ovpn http-lt-guangdong-6.ovpn>联通广东2.ovpn


echo "# 小哥哥云免配置 全国联通复活1
# 本文件由系统自动生成
# 类型：HTTP转接
client
dev tun
proto tcp
remote $IP $vpnport
########免流代码########">http-lt-quanguo1.ovpn
echo "http—proxy—option VERSION 1.1
http—proxy—option EXT1 "Host:sales.wostore.cn:8081"
http—proxy—option EXT1 "Proxy—Connection: keep—alive"
http-proxy $IP 28080
########免流代码########
<http-proxy-user-pass>
xgg
xgg
</http-proxy-user-pass>
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.114 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
">http-lt-quanguo2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-lt-quanguo3.ovpn
cat http-lt-quanguo1.ovpn http-lt-quanguo2.ovpn http-lt-quanguo3.ovpn>全国联通复活1.ovpn

echo "# 小哥哥云免配置 全国联通复活2
# 本文件由系统自动生成
# 类型：HTTP转接
client
dev tun
proto tcp
remote http://$IP:$vpnport/vpn_tpl.png?http://sales.wostore.cn:8081/activity/vpn_tpl/in/index.html?tplId=21 $vpnport">http-lt-quanguo1.ovpn
echo 'resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
http-proxy-option VERSION 1.1
http-proxy-option EXT1 "Host: sales.wostore.cn:8081"
http-proxy-option EXT1 "Proxy-Connection: keep-alive"
http-proxy 140.207.47.119 28080
push route 114.114.114.114 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3'>http-lt-quanguo2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-lt-quanguo3.ovpn
cat http-lt-quanguo1.ovpn http-lt-quanguo2.ovpn http-lt-quanguo3.ovpn>全国联通复活2.ovpn

echo "# 小哥哥云免配置 联通空中卡53
# 本文件由系统自动生成
# 类型：HTTP转接
client
dev tun
proto tcp
remote m.10010.com/kzrw 53 
########免流代码########
http-proxy $IP 53
http-proxy-option EXT1 xggml 127.0.0.1:443 ">http-lt-53-1.ovpn
echo 'http-proxy-option EXT1 "POST http://m.10010.com/kzrw HTTP/1.1" 
http-proxy-option EXT1 "GET http://m.10010.com/kzrw HTTP/1.1" 
http-proxy-option EXT1 "Host: m.10010.com/kzrw" 
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.114 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-lt-53-2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-lt-53-3.ovpn
cat http-lt-53-1.ovpn http-lt-53-2.ovpn http-lt-53-3.ovpn>联通空中卡53.ovpn

echo "# 小哥哥云免配置 联通全国1
# 本文件由系统自动生成
# 类型：HTTP转接
client
dev tun
proto tcp
remote mob.10010.com 80
########免流代码########
http-proxy $IP $mpport">lt-quanguo123.ovpn
echo 'http-proxy-option EXT1 "POST http://m.client.10010.com" 
http-proxy-option EXT1 "Host: http://m.client.10010.com / HTTP/1.1"
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.114 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>lt-quanguo223.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">lt-quanguo323.ovpn
cat lt-quanguo123.ovpn lt-quanguo223.ovpn lt-quanguo323.ovpn>联通全国1.ovpn

echo "# 小哥哥云免配置 浙江联通
# 本文件由系统自动生成
# 类型：HTTP转接
client
dev tun
proto tcp
http-proxy-option EXT1 xggml 127.0.0.1:1
########免流代码########
http-proxy $IP 8080
remote $IP 80
http-proxy-option EXT1 CONNECT http://$IP/wojKnow.do?1=1/ HTTP/1.1
http-proxy-option EXT1 Host:$IP">lt-zhejiang1.ovpn
echo '
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.114 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>lt-zhejiang2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">lt-zhejiang3.ovpn
cat lt-zhejiang1.ovpn lt-zhejiang2.ovpn lt-zhejiang3.ovpn>浙江联通.ovpn

echo "# 小哥哥云免配置 山东联通
# 本文件由系统自动生成
# 类型：HTTP转接
client
dev tun
proto tcp
http-proxy-option EXT1 xggml 127.0.0.1:1
remote m.t.17186.cn 80
http-proxy $IP 8080
http-proxy-option EXT1 xggml 127.0.0.1:$vpnport
http-proxy-option EXT1 POST http://m.t.17186.cn
http-proxy-option EXT1 Host: m.t.17186.cn / HTTP/1.1">lt-sd1.ovpn
echo '
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.114 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>lt-sd2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">lt-sd3.ovpn
cat lt-sd1.ovpn lt-sd2.ovpn lt-sd3.ovpn>山东联通.ovpn


echo "# 小哥哥云免配置 联通全国2
# 本文件由系统自动生成
# 类型：HTTP转接
client
dev tun
proto tcp
remote $IP 80
########免流代码########
http-proxy $IP $mpport
http-proxy-option EXT1 Host sales.wostore.cn:8081
http-proxy $IP 28080">lt-quanguo123.ovpn
echo '########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.114 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>lt-quanguo223.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">lt-quanguo323.ovpn
cat lt-quanguo123.ovpn lt-quanguo223.ovpn lt-quanguo323.ovpn>联通全国2.ovpn


echo "# 小哥哥云免配置 联通全国3
# 本文件由系统自动生成
# 类型：HTTP转接
client
dev tun
proto tcp
remote mob.10010.com 80
########免流代码########
http-proxy $IP $mpport
http-proxy-option EXT1 "POST http://m.client.10010.com"
http-proxy-option EXT1 "Host: m.client.10010.com"">http-lt-quanguo-1.ovpn
echo '
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.114 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-lt-quanguo-2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-lt-quanguo-3.ovpn
cat http-lt-quanguo-1.ovpn http-lt-quanguo-2.ovpn http-lt-quanguo-3.ovpn>联通全国3.ovpn

echo "# 小哥哥云免配置 全国联通线路-广东亲测0扣
# 本文件由系统自动生成
# 类型：3-HTTP转接类型
client
dev tun
proto tcp
keepalive 10 120
ns-cert-type server
resolv-retry infinite
nobind
persist-key
persist-tun
########免流代码########
remote m.client.10010.com 3389 tcp-client">http-lt-quanguo1-1.ovpn
echo 'http-proxy-option EXT1 "POST http://m.client.10010.com"
http-proxy-option EXT1 xggml 127.0.0.1:$vpnport
http-proxy-option EXT1 "Host: m.client.10010.com / HTTP/1.1"
http-proxy $IP 8080
########免流代码########
<http-proxy-user-pass>
xgg
xgg
</http-proxy-user-pass>
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.144 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-lt-quanguo1-2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-lt-quanguo1-3.ovpn
cat http-lt-quanguo1-1.ovpn http-lt-quanguo1-2.ovpn http-lt-quanguo1-3.ovpn>全国联通线路-广东亲测0扣.ovpn

echo "# 小哥哥云免配置 浙江全国
# 本文件由系统自动生成
# 类型：3-HTTP转接类型
client
dev tun
proto tcp
remote wap.zj.10086.cn 80
########免流代码########
http-proxy $IP $mpport
http-proxy-option EXT1 xggml 127.0.0.1:$vpnport">http-yd-zj1.ovpn
echo 'http-proxy-option EXT1 "X-Online-Host: wap.zj.10086.cn" 
http-proxy-option EXT1 "Host: wap.zj.10086.cn"
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.144 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-yd-zj2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-zj3.ovpn
cat http-yd-zj1.ovpn http-yd-zj2.ovpn http-yd-zj3.ovpn>浙江全国.ovpn

echo "# 小哥哥云免配置 大王卡
# 本文件由系统自动生成
# 类型：HTTP转接
client
dev tun
proto tcp
remote mob.10010.com 80
########免流代码########
http-proxy $IP $mpport
http-proxy-option EXT1 xggml 127.0.0.1:$vpnport">http-lt-quanguo-1.ovpn
echo '
http-proxy-option EXT1 "POST http://mp.weixin.qq.com"
http-proxy-option EXT1 "Host: http://mp.weixin.qq.com / HTTP/1.1"
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.114 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-lt-quanguo-2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-lt-quanguo-3.ovpn
cat http-lt-quanguo-1.ovpn http-lt-quanguo-2.ovpn http-lt-quanguo-3.ovpn>大王卡.ovpn

echo "# 小哥哥云免配置 电信爱看
# 本文件由系统自动生成
# 类型：HTTP转接
client
dev tun
proto tcp
remote ltetptv.189.com 80
########免流代码########
http-proxy $IP $mpport
http-proxy-option EXT1 xggml 127.0.0.1:$vpnport">http-dx-1.ovpn
echo 'http-proxy-option EXT1 "POST http://dl.music.189.cn / HTTP/1.1"
http-proxy-option EXT1 "Host: ltetptv.189.com"
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.114 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-dx-2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-dx-3.ovpn
cat http-dx-1.ovpn http-dx-2.ovpn http-dx-3.ovpn>电信爱看.ovpn


echo "# 小哥哥云免配置 全国电信爱玩
# 本文件由系统自动生成
# 类型：HTTP转接
client
dev tun
proto tcp
remote cdn.4g.play.cn 80
########免流代码########
http-proxy $IP $mpport
http-proxy-option EXT1 xggml 127.0.0.1:$vpnport">http-dx-1.ovpn
echo 'http-proxy-option EXT1 "POST http://cdn.4g.play.cn/ HTTP/1.1"
http-proxy-option EXT1 "Host: cdn.4g.play.cn" 
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.114 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-dx-2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-dx-3.ovpn
cat http-dx-1.ovpn http-dx-2.ovpn http-dx-3.ovpn>全国电信爱玩.ovpn


echo "# 小哥哥云免配置 电信常规-测试免广东
# 本文件由系统自动生成
# 类型：2-常规类型
client
dev tun
proto tcp
remote $IP $vpnport
########免流代码########
http-proxy $IP $sqport">http-dx-1.ovpn
echo 'http-proxy-option EXT1 "POST http://cdn.4g.play.cn" 
http-proxy-option EXT1 "GET http://cdn.4g.play.cn" 
http-proxy-option EXT1 "X-Online-Host: cdn.4g.play.cn" 
http-proxy-option EXT1 "POST http://cdn.4g.play.cn" 
http-proxy-option EXT1 "X-Online-Host: cdn.4g.play.cn" 
http-proxy-option EXT1 "POST http://cdn.4g.play.cn" 
http-proxy-option EXT1 "Host: cdn.4g.play.cn" 
http-proxy-option EXT1 "GET http://cdn.4g.play.cn" 
http-proxy-option EXT1 "Host: cdn.4g.play.cn" 
########免流代码########
<http-proxy-user-pass>
xgg
xgg
</http-proxy-user-pass>

resolv-retry infinite
nobind
persist-key
persist-tun
'>http-dx-2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
">http-dx-3.ovpn
cat http-dx-1.ovpn http-dx-2.ovpn http-dx-3.ovpn>电信常规-测试免广东.ovpn

echo "# 小哥哥云免配置 全国电信
# 本文件由系统自动生成
# 类型：HTTP转接
client
dev tun
proto tcp
http-proxy-option EXT1 xggml 127.0.0.1:1
########免流代码########
remote ltetptv.189.com 80
http-proxy-option EXT1 \"GET http://dl.music.189.cn:9495/res/V/1388/mp3/33/58/94/1388335894003000.mp3?mb=15380197563&fs=10104163&s=800&n=&id=63696337&M=online&sid=240387514 HTTP/1.1\"
http-proxy-option EXT1 \"Host dl.music.189.cn:9495\"
http-proxy-option EXT1 \"POST http://iting.music.189.cn:9101/iting2/imusic/V2 HTTP/1.1\"
http-proxy $IP 8080">http--quanguo-dx-1.ovpn
echo '
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.114 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http--quanguo-dx-2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http--quanguo-dx-3.ovpn
cat http--quanguo-dx-1.ovpn http--quanguo-dx-2.ovpn http--quanguo-dx-3.ovpn>全国电信.ovpn

echo "# 小哥哥云免配置 湖南电信
# 本文件由系统自动生成
# 类型：HTTP转接
client
dev tun
proto tcp
remote 4gmv.music.189.cn 80
########免流代码########
http-proxy $IP 8080
http-proxy-option EXT1 xggml 127.0.0.1:$vpnport
http-proxy-option EXT1 GET /4gmv/res/6/20/01/04/80/37/30/200104803730.mp4 HTTP/1.1
http-proxy-option EXT1 CONNECT 4gmv.music.189.cn
http-proxy-option EXT1 Host: 4gmv.music.189.cn
">http--hn-dx-1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.114 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http--hn-dx-2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http--hn-dx-3.ovpn
cat http--hn-dx-1.ovpn http--hn-dx-2.ovpn http--hn-dx-3.ovpn>湖南电信.ovpn

echo "# 小哥哥云免配置 贵州电信
# 本文件由系统自动生成
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy-option EXT1 POST http://202.101.89.156/HTTP/1.1
http-proxy-option EXT1 Host: 202.101.89.156
http-proxy-option EXT1 xggml 127.0.0.1:$vpnport
http-proxy $IP 8080 
remote 202.101.89.156 80 tcp-client
">http--gz-dx-1.ovpn
echo '
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.114 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http--gz-dx-2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http--gz-dx-3.ovpn
cat http--gz-dx-1.ovpn http--gz-dx-2.ovpn http--gz-dx-3.ovpn>贵州电信.ovpn

echo "# 小哥哥云免配置 北京电信
# 本文件由系统自动生成
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy-option EXT1 POST http://219.141.157.221/HTTP/1.1
http-proxy-option EXT1 Host: 219.141.157.221
http-proxy-option EXT1 xggml 127.0.0.1:$vpnport
http-proxy $IP 8080 
remote 219.141.157.221 80 tcp-client
">http--bj-dx-1.ovpn
echo '
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.114 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http--bj-dx-2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http--bj-dx-3.ovpn
cat http--bj-dx-1.ovpn http--bj-dx-2.ovpn http--bj-dx-3.ovpn>北京电信.ovpn

echo "# 小哥哥云免配置 安徽电信
# 本文件由系统自动生成
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy-option EXT1 POST http://202.102.221.118/HTTP/1.1
http-proxy-option EXT1 Host: 202.102.221.118
http-proxy-option EXT1 xggml 127.0.0.1:$vpnport
http-proxy $IP 8080 
remote 202.102.221.118 80 tcp-client
">http--ah-dx-1.ovpn
echo '
########免流代码########
resolv-retry infinite
nobind
persist-key
persist-tun
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17"
push route 114.114.114.114 114.114.115.115
machine-readable-output
connect-retry-max 5
connect-retry 5
resolv-retry 60
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
'>http-ah-dx-2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http--ah-dx-3.ovpn
cat http--ah-dx-1.ovpn http-ah-dx-2.ovpn http--ah-dx-3.ovpn>安徽电信.ovpn

echo "# 小哥哥云免配置 云南移动
# 本文件由系统自动生成
# 更新日期：2017-03-10
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy-option CUSTOM-HEADER Host wap.cmvideo.cn
http-proxy-option EXT1 Host X-Online-Host
http-proxy-option EXT1 Host
http-proxy-option CUSTOM-HEADER CONNECT/HTTP/1.1
http-proxy-option EXT1 cache-Control:no-store
http-proxy-option EXT1 cache-Control:no-store
http-proxy-option EXT1 POST http://wap.cmvideo.cn
http-proxy-option VERSION 1.1
http-proxy-option EXT1 Proxy-Connection: keep-alive
http-proxy-option EXT1 xggml 127.0.0.1:$vpnport
http-proxy $IP 8080
remote wap.cmvideo.cn 3389 tcp-client
########免流代码######## ">http-yd-3.10-yn1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-3.10-yn2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-3.10-yn3.ovpn
cat http-yd-3.10-yn1.ovpn http-yd-3.10-yn2.ovpn http-yd-3.10-yn3.ovpn>云南移动3.10.ovpn

echo "# 小哥哥云免配置 广东汕头
# 本文件由系统自动生成
# 更新日期：2017-03-10
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy-option EXT1 POST http://migumovie.lovev.com/HTTP/1.1
http-proxy-option EXT1 Host: migumovie.lovev.com
http-proxy-option EXT1 xggml 127.0.0.1:$vpnport
http-proxy $IP 137 
remote migumovie.lovev.com 80 tcp-client
########免流代码########">http-yd-3.10-st1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-3.10-st2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-3.10-st3.ovpn
cat http-yd-3.10-st1.ovpn http-yd-3.10-st2.ovpn http-yd-3.10-st3.ovpn>广东汕头3.10.ovpn

echo "# 小哥哥云免配置 广西南宁
# 本文件由系统自动生成
# 更新日期：2017-03-10
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote 211.136.165.53 $vpnport
http-proxy $IP 8080
http-proxy-option EXT1 xggml 127.0.0.1:$vpnport
http-proxy-option EXT1 Referer:http://211.136.165.53
http-proxy-option EXT1 GET http://211.136.165.53 HTTP/1.1
http-proxy-option EXT1 Host: 211.136.165.53
http-proxy-option EXT1 Host:wap.cmvideo.cn;
http-proxy-option EXT1 Proxy-Connection: Keep-alive
########免流代码########">http-yd-3.10-nn1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-3.10-nn2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-3.10-nn3.ovpn
cat http-yd-3.10-nn1.ovpn http-yd-3.10-nn2.ovpn http-yd-3.10-nn3.ovpn>广西南宁3.10.ovpn

echo "# 小哥哥云免配置 全国移动-3.10
# 玉林，内蒙古，南宁、阳泉，广州、韶关、山东青岛，河北石家庄、唐山，四川达州、新疆以测
# 本文件由系统自动生成
# 更新日期：2017-03-10
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy-option EXT1 Host: Xiao哥哥流控 
http-proxy-option EXT1 xggml 127.0.0.1:$vpnport
http-proxy 	$IP 8080
remote 211.136.165.53 80 tcp-client
########免流代码########">http-yd-3.10-quanguo1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-3.10-quanguo2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-3.10-quanguo3.ovpn
cat http-yd-3.10-quanguo1.ovpn http-yd-3.10-quanguo2.ovpn http-yd-3.10-quanguo3.ovpn>全国移动-3.10.ovpn

echo "# 小哥哥云免配置 移动吉林
# 本文件由系统自动生成
# 更新日期：2017-03-10
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote $IP:$vpnport@wap.10086.cn 80
http-proxy-option EXT1 Host:wap.10086.cn
http-proxy 10.0.0.172 80
########免流代码########">http-yd-3.10-jl1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-3.10-jl2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-3.10-jl3.ovpn
cat http-yd-3.10-jl1.ovpn http-yd-3.10-jl2.ovpn http-yd-3.10-jl3.ovpn>移动吉林-3.10.ovpn

echo "# 小哥哥云免配置 全国移动2-3.10
# 蛙埠、五河县、六安、滁州、黄山、合肥、淮南、宿州、马鞍山可免
# 本文件由系统自动生成
# 更新日期：2017-03-10
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote 211.136.165.53 80
http-proxy-option EXT1 xggml 127.0.0.1:$vpnport
http-proxy-option EXT1 POST http://211.136.165.53
http-proxy-option EXT1 Host 211.136.165.53
http-proxy $IP 8080
########免流代码########">http-yd-3.10-quanguo4.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-3.10-quanguo5.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-3.10-quanguo6.ovpn
cat http-yd-3.10-quanguo4.ovpn http-yd-3.10-quanguo5.ovpn http-yd-3.10-quanguo6.ovpn>全国移动2-3.10.ovpn

echo "# 小哥哥云免配置 湖北移动
# 湖北部分地区可免
# 本文件由系统自动生成
# 更新日期：2017-03-10
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy-option EXT1 xggml 127.0.0.1:$vpnport
http-proxy-option EXT1 Host: Xiao哥哥流控 
http-proxy $IP 8080
remote 117.136.139.4 80 tcp-client
########免流代码########">http-yd-3.10-hb1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-3.10-hb2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-3.10-hb3.ovpn
cat http-yd-3.10-hb1.ovpn http-yd-3.10-hb2.ovpn http-yd-3.10-hb3.ovpn>湖北移动3.10.ovpn

echo "# 小哥哥云免配置 安徽宿州
# 本文件由系统自动生成
# 更新日期：2017-03-10
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote 211.136.165.53 80
http-proxy-option EXT1 xggml 127.0.0.1:$vpnport
http-proxy-option EXT1 Host:wap.ah.10086.cn
http-proxy $IP 8080
########免流代码########">http-yd-3.10-sz1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-3.10-sz2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-3.10-sz3.ovpn
cat http-yd-3.10-sz1.ovpn http-yd-3.10-sz2.ovpn http-yd-3.10-sz3.ovpn>安徽宿州3.10.ovpn

echo "# 小哥哥云免配置 重庆防限速
# 本文件由系统自动生成
# 更新日期：2017-03-10
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy-option EXT1 POST http://migumovie.lovev.com/HTTP/1.1
http-proxy-option EXT1 Host: migumovie.lovev.com
http-proxy-option EXT1 VPN 127.0.0.1:$vpnport
http-proxy $IP 138 
remote migumovie.lovev.com 80 tcp-client
########免流代码########">http-yd-3.10-cq1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-3.10-cq2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-3.10-cq3.ovpn
cat http-yd-3.10-cq1.ovpn http-yd-3.10-cq2.ovpn http-yd-3.10-cq3.ovpn>重庆防限速3.10.ovpn

echo "# 小哥哥云免配置 全国移动3-3.10
# #江西、四川成都。山东潍坊、云南大理。红河、深圳、山西、河北、河南、安徽已测试 不免net和wap接入点互相切换下 移动发送0000到10086看下有没有定制cmwap业务，有请取消掉否者不免流
# 本文件由系统自动生成
# 更新日期：2017-03-10
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy-option EXT1 POST http://wap.hetau.com/HTTP/1.1
http-proxy-option EXT1 Host: wap.hetau.com
http-proxy-option EXT1 xggml 127.0.0.1:$vpnport
http-proxy $IP 137 
remote wap.hetau.com 80 tcp-client
########免流代码########">http-yd-3.10-quanguo7.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-3.10-quanguo8.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-3.10-quanguo9.ovpn
cat http-yd-3.10-quanguo7.ovpn http-yd-3.10-quanguo8.ovpn http-yd-3.10-quanguo9.ovpn>全国移动3-3.10.ovpn

echo "# 小哥哥云免配置 安徽移动
# 安徽宿州、徐州已测试
# 本文件由系统自动生成
# 更新日期：2017-03-10
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy-option EXT1 xggml 127.0.0.1:$vpnport
remote 211.136.165.53 80
http-proxy-option EXT1 Host: Xiao哥哥流控 
http-proxy $IP 8080
########免流代码########">http-yd-3.10-ah1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-3.10-ah2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-3.10-ah3.ovpn
cat http-yd-3.10-ah1.ovpn http-yd-3.10-ah2.ovpn http-yd-3.10-ah3.ovpn>安徽移动-3.10.ovpn

echo "# 小哥哥云免配置 全国移动4-3.10
# 河南唐山、四川成都、河南信阳、江西九江、广东深圳、东莞、山西长治、太远，北京已测试
# 本文件由系统自动生成
# 更新日期：2017-03-10
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
;http-proxy-retry
;http-proxy [proxy server] [proxy port]
http-proxy 10.0.0.172 80
http-proxy-option EXT1 Host:$IP:$vpnport
http-proxy-option EXT1 http://bbs.clzjwl.com/thread-1434-1-1.html 
remote /
########免流代码########">http-yd-3.10-quanguo10.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-3.10-quanguo11.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-3.10-quanguo12.ovpn
cat http-yd-3.10-quanguo10.ovpn http-yd-3.10-quanguo11.ovpn http-yd-3.10-quanguo12.ovpn>全国移动4-3.10.ovpn

echo "# 小哥哥云免配置 全国移动5-3.10
# 全国都可以测试，河北湖北湖南河南安徽必免
# 本文件由系统自动生成
# 更新日期：2017-03-10
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy-option EXT1 POST http://wap.hetau.com/HTTP/1.1
http-proxy-option EXT1 Host: wap.hetau.com
http-proxy-option EXT1 127.0.0.1:$vpnport
http-proxy $IP 137 
remote wap.hetau.com 80 tcp-client
########免流代码########">http-yd-3.10-quanguo13.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-3.10-quanguo14.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-3.10-quanguo15.ovpn
cat http-yd-3.10-quanguo13.ovpn http-yd-3.10-quanguo14.ovpn http-yd-3.10-quanguo15.ovpn>全国移动5-3.10.ovpn

echo "# 小哥哥云免配置 宁夏移动
# 本文件由系统自动生成
# 更新日期：2017-03-10
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy-option EXT1 POST http://www.baidu.com/HTTP/1.1
http-proxy-option EXT1 Host: www.baidu.com
http-proxy-option EXT1 xggml 127.0.0.1:$vpnport
http-proxy $IP 138
remote www.baidu.com 3389 tcp-client
########免流代码########">http-yd-3.10-nx1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-3.10-nx2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-3.10-nx3.ovpn
cat http-yd-3.10-nx1.ovpn http-yd-3.10-nx2.ovpn http-yd-3.10-nx3.ovpn>宁夏移动-3.10.ovpn

echo "# 小哥哥云免配置 全国移动6-3.10
# 广东深圳 广西 江西  四川 山东 安徽 河北 河南 山西已测试
# 本文件由系统自动生成
# 更新日期：2017-03-10
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy-option EXT1 POST http://wap.hetau.com/HTTP/1.1
http-proxy-option EXT1 Host: wap.hetau.com
http-proxy-option EXT1 xggml 127.0.0.1:$vpnport
http-proxy $IP 137 
remote wap.hetau.com 80 tcp-client
########免流代码########">http-yd-3.10-quanguo16.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-3.10-quanguo17.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-3.10-quanguo18.ovpn
cat http-yd-3.10-quanguo16.ovpn http-yd-3.10-quanguo17.ovpn http-yd-3.10-quanguo18.ovpn>全国移动6-3.10.ovpn

echo "# 小哥哥云免配置 山西临汾
# 本文件由系统自动生成
# 更新日期：2017-03-10
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy-option EXT1 X-Online-Host: clientdispatch.10086.cn 
http-proxy-option EXT1 Host: clientdispatch.10086.cn
http-proxy-option EXT1 127.0.0.1:$vpnport
http-proxy $IP 8080
remote wap.clientdispatch.10086.cn 80 tcp-client
########免流代码########">http-yd-3.10-fl1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-3.10-fl2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-3.10-fl3.ovpn
cat http-yd-3.10-fl1.ovpn http-yd-3.10-fl2.ovpn http-yd-3.10-fl3.ovpn>山西临汾-3.10.ovpn

echo "# 小哥哥云免配置 全国移动7-3.10
# 河北唐山、四川成都、河南信阳、江西九江、广东深圳,东莞、山西长治,太原、北京
# 本文件由系统自动生成
# 更新日期：2017-03-10
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote /r
http-proxy-option EXT1  Host:$IP:$vpnport
http-proxy-option EXT1 POST http://wap.cmvideo.cn HTTP/1.1
http-proxy-option EXT1 Host:wap.cmvideo.cn
Host,X-Online-Host;[method] [uri] HTTP/1.1
Host: wap.cmvideo.cn
X-Online-Host : wap.10086.cn 
X-Online-Host : [host];
http-proxy-option EXT1 Host:wap.cmvideo.cn HTTP/1.1
http-proxy-option EXT1 CONNECT rd.go.10086.cn:$vpnport HTTP/1.1;
Host,X-Online-Host;CONNECT [host] [version]
CONNECT rd.go.10086.cn:$vpnport HTTP/1.1
X-Online-Host: rd.go.10086.cn:$vpnport 
http-proxy-option EXT1 Host: 112.4.20.188
http-proxy 10.0.0.172 8080
########免流代码########">http-yd-3.10-quanguo19.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-3.10-quanguo20.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-3.10-quanguo21.ovpn
cat http-yd-3.10-quanguo19.ovpn http-yd-3.10-quanguo20.ovpn http-yd-3.10-quanguo21.ovpn>全国移动7-3.10.ovpn

echo "# 小哥哥云免配置 全国移动8-3.10
# 河北唐山、四川成都、河南信阳、江西九江、广东深圳，东莞、山西长治，太远、北京已免
# 本文件由系统自动生成
# 更新日期：2017-03-10
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
;http-proxy-retry
;http-proxy [proxy server] [proxy port]
http-proxy-option EXT1 Host:$IP:$vpnport
http-proxy-option EXT1 http://bbs.clzjwl.com/thread-1434-1-1.html 
http-proxy 10.0.0.172 80
remote / 80
########免流代码########">http-yd-3.10-quanguo22.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-3.10-quanguo23.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-3.10-quanguo24.ovpn
cat http-yd-3.10-quanguo22.ovpn http-yd-3.10-quanguo23.ovpn http-yd-3.10-quanguo24.ovpn>全国移动8-3.10.ovpn

echo "# 小哥哥云免配置 福建移动
# 本文件由系统自动生成
# 更新日期：2017-03-10
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy-option EXT1 xggml 127.0.0.1:1
http-proxy-option EXT1 POST http://wap.fj.chinamobile.com/HTTP/1.1
http-proxy-option EXT1 Host: wap.fj.chinamobile.com
http-proxy $IP 137 
remote wap.fj.chinamobile.com 80 tcp-client
########免流代码########">http-yd-3.10-fj1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-3.10-fj2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-3.10-fj3.ovpn
cat http-yd-3.10-fj1.ovpn http-yd-3.10-fj2.ovpn http-yd-3.10-fj3.ovpn>福建移动-3.10.ovpn

echo "# 小哥哥云免配置 全国移动9-3.10
# 全国移动-广东 安徽已测试
# 本文件由系统自动生成
# 更新日期：2017-03-10
# 类型：HTTP转接
client
dev tun
proto tcp
remote jl.12530.com 80
########免流代码########
http-proxy-option EXT1 POST http://jl.12530.com
http-proxy $IP 138
http-proxy-option EXT1 xggml  127.0.0.1:$vpnport
http-proxy-option EXT1 X-Online-Host:jl.12530.com
########免流代码########">http-yd-3.10-quanguo25.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-3.10-quanguo26.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-3.10-quanguo27.ovpn
cat http-yd-3.10-quanguo25.ovpn http-yd-3.10-quanguo26.ovpn http-yd-3.10-quanguo27.ovpn>全国移动9-3.10.ovpn

echo "# 小哥哥云免配置 特殊咪咕-理论全国
# 本文件由系统自动生成
# 更新日期：2017-03-10
# 类型：HTTP转接
client
dev tun
proto tcp
remote miguvod.lovev.com 80
########免流代码########
http-proxy-option EXT1 xggml
http-proxy-option EXT1 GET /iworld/CMCC/AppGST/xy/bbs.jsp?key=4BhkA&CMCC=cmnet&SDK=28o0pAX3 HTTP/1.1
http-proxy-option EXT1 Host:  miguvod.lovev.com:8080
http-proxy-option EXT1 7VDHOED60GNZ3BA=GI7PIRZUGY71EO79ECU948T6QR774PUSP
http-proxy-option EXT1 CUO3SHLWW3V8YGVESSWI3UYBVEE0CL=OCUV4LMB2MD05
http-proxy-option EXT1 705F3LA4NBALR2G02RN42JVCBLU6MHRF0JEL=Q
http-proxy-option EXT1 VG6BGSX35SJSK9BA8=7EHV=QZFJNVUIDA7N714O0F
http-proxy-option EXT1 JSESSIONID=98B8CDA8E71B95DE34015450EF2219A2
http-proxy-option EXT1 I42HMB2I=0P5G7BDG6QEL7XUV89AGVPBWCJOQK9K8Y0J
http-proxy-option EXT1 8MV5P78NIV6GOBRZ1AZ6G6GOQ8JZ2QD1U1SXUCB=W
http-proxy-option EXT1 HYP5MRX0SXM71BMN9YD=URP2VY=PKL8YR9T=K=7QJKS54RW23E
http-proxy-option EXT1 PITTHV6EKK6XYPYHEX2758=6MKUUJNNQCUE43B5CUL1MY7BZG
http-proxy-option EXT1 NFE68PFQ=1IGBG8H8GWZ25TNGG6I7V7YM260HSO
http-proxy-option EXT1 ZS7==3RTD=86NVQLCYC97ECZU16XEA3990FC9BXK
http-proxy-option EXT1 F7YJE=9Q=RSMYIV9KNEXH8CCSBNW3A4MIZGK0GP581X1H=PYA
http-proxy-option EXT1 2N=HSEDB65KPP9V9F91EOCFY3=M644QXKE4N27=3=XHU2
http-proxy-option EXT1 CG6BB=ZNTTMKRFRZVKX81GQV7MWW=04F=1=HU8=H
http-proxy-option EXT1 BM8UPG1KFVNK363HNI79KBIUTQO=JNBE=40EDVIH
http-proxy-option EXT1 TBJRHWUUCR=6KIMSQ4R9M0JN=9J41EAO23
http-proxy-option EXT1 LC83BAFZ2638Q6C5RO=VTVY3ECO4U63SEMWTEDLZJ1PX3KONGARV
http-proxy-option EXT1 ZN3D9133HQMFGV=3R1E=6MQ4BDR8C91E4QGI5WNL5AOE8360QNETNC
http-proxy-option EXT1 Z66R3P1QPWH30QYZZRZ=M7QJWZW3A5J58EG7BVD9Z
http-proxy-option EXT1 5=7AQ9AISQTJ8CCY79U5=3JVOXZ9VOCRQKKA9HX
http-proxy-option EXT1 S42VPBK1RED2KBQFQFHJSMXMUBIWYS7C=NO2OLDINKSTDOU8N
http-proxy-option EXT1 G=PTN5FWVZQ5CHB9D32ZRK518X8KK7G282FTBTQTEGAYJGBB
http-proxy-option EXT1 YFN0VZ13ETO8PN22Q6D6ORPFSDF9Q=1JCA1HG61OVU4WJHDYNH
http-proxy-option EXT1 1XKCVOIB2ZG=OU5HYH8488WDZFS67KO53H1N2
http-proxy-option EXT1 LXWBUIKUXW=QBU4K6DTQR4AW764JDB2C3H0CNZIB
http-proxy-option EXT1 SXVQETNRWOEQR=YBMIPZ4YFP1MYZR6VGW0CCYECEXCS9EA
http-proxy-option EXT1 GKEFKBBFC=FTFRDZUJGBDF7I4J55RFR5963TRA8NMWQ
http-proxy-option EXT1 IOCSCIUH=5RXB8DOKC39MYHIKDRRC8U5FYA19LWZ
http-proxy-option EXT1 UJXLCQEVL=TSKNHK42K6AQ5IHVO7GLQSODA15UEQG
http-proxy-option EXT1 VYZBLHZ=LEX5F0JS65KPDTWB5B1V6FUW71K81G
http-proxy-option EXT1 N4HENM8MCFSV94WMWI9PI0R4AEVIKJBPI=8
http-proxy-option EXT1 KR24X2X0FF4=KR4NNYW3FUQF58G5ECMD8ZEDTB6UX8MP
http-proxy-option EXT1 5RKF05JTZJ5U2SIQNZD9U8YH02WO9C=ZAX7KBOMUK
http-proxy-option EXT1 ORRJKXH=320PC0SOUWSOK9YH4L7DY
http-proxy-option EXT1 83OPQ0Q=JG5RWI456H759L2EGAF8LHWJFEF5MO8I5HZ
http-proxy-option EXT1 YFN0VZ13ETO8PN22Q6D6ORPFSDF9Q=1JCA1HG61OVU4WJHDYNH
http-proxy-option EXT1 1XKCVOIB2ZG=OU5HYH8488WDZFS67KO53H1N2
http-proxy-option EXT1 N4HENM8MCFSV94WMWI9PI0R4AEVIKJBPI=8
http-proxy-option EXT1 PUAMSDD=987V2AQCEO21OZI00KP3E2NWPQCEDAY3L2
http-proxy-option EXT1 AAQAHHH=XQNOSO0YKSKQN11RC8HTO8MHBZTJA
http-proxy-option EXT1 OLWKAEPF=QBU4K6DTQR4AW764JDB2C3H0CNZIB
http-proxy-option EXT1 BUJY5WQD2D1WUDNE194C89GNAUGG6PISB3UCH=PLQIF
http-proxy-option EXT1 ESKZHLIUA14C5HOP0YNS1ZDH3TT=WA65OMTEN=M0MF
http-proxy $IP 8080
########免流代码########">http-yd-3.10-migu1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-3.10-migu2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-3.10-migu3.ovpn
cat http-yd-3.10-migu1.ovpn http-yd-3.10-migu2.ovpn http-yd-3.10-migu3.ovpn>特殊咪咕-理论全国.ovpn

#######################3-26#######################

echo "# 小哥哥云免配置 广西移动
# 本文件由系统自动生成
# 更新日期：2017-03-25
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote 211.136.165.53 80
http-proxy-option EXT1 xggml 127.0.0.1:$vpnport
http-proxy-option EXT1 Host: Xiao哥哥流控 
http-proxy $IP 8080
########免流代码######## ">http-yd-03.25-gx1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-03.25-gx2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-03.25-gx3.ovpn
cat http-yd-03.25-gx1.ovpn http-yd-03.25-gx2.ovpn http-yd-03.25-gx3.ovpn>广西部分免-yd-3.24.ovpn

echo "# 小哥哥云免配置 联通大王卡
# 本文件由系统自动生成
# 更新日期：2017-03-25
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote short.weixin.qq.com 80
http-proxy-option EXT1 “POST http://short.weixin.qq.com“
http-proxy-option EXT1 “POST http://short.weixin.qq.com“
http-proxy-option EXT1 “Host: http://short.weixin.qq.com / HTTP/1.1“
http-proxy-option EXT1 “X-Online-Host: http://short.weixin.qq.com“
http-proxy-option EXT1 xggml 127.0.0.1:$vpnport
http-proxy $IP 8080
########免流代码########">http-lt-03.25-quanguo1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-lt-03.25-quanguo2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-lt-03.25-quanguo3.ovpn
cat http-lt-03.25-quanguo1.ovpn http-lt-03.25-quanguo2.ovpn http-lt-03.25-quanguo3.ovpn>全国联通大王卡全国免-lt-03.25.ovpn

echo "# 小哥哥云免配置 四川移动
# 本文件由系统自动生成
# 更新日期：2017-03-25
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote / 80
http-proxy-option EXT1 Host:$IP:$vpnport
http-proxy-option EXT1 CONNECT / http:strms.free.migudm.cn HTTP/1.1
http-proxy-option EXT1 Host:strms.free.migudm.cn
http-proxy 10.0.0.172 80
########免流代码########">http-yd-03.25-sc1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-03.25-sc2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-03.25-sc3.ovpn
cat http-yd-03.25-sc1.ovpn http-yd-03.25-sc2.ovpn http-yd-03.25-sc3.ovpn>四川遂宁-yd-03.25.ovpn

echo "# 小哥哥云免配置 广西南宁
# 本文件由系统自动生成
# 更新日期：2017-03-25
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy-option EXT1 Host: Xiao哥哥流控
http-proxy-option EXT1 Host: 127.0.0.1:$vpnport
http-proxy $IP 8080
remote 211.136.165.53 80 tcp-client
########免流代码########">http-yd-03.25-nn1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-03.25-nn2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-03.25-nn3.ovpn
cat http-yd-03.25-nn1.ovpn http-yd-03.25-nn2.ovpn http-yd-03.25-nn3.ovpn>广西南宁-yd-03.25.ovpn

echo "# 小哥哥云免配置 河北电信
# 本文件由系统自动生成
# 更新日期：2017-03-25
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy-option EXT1 xggml 127.0.0.1:$vpnport
remote www.baidu.com/ltewap.tv189.com/ 80 
http-proxy $IP 8080
########免流代码########">http-dx-03.25-hb1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-dx-03.25-hb2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-dx-03.25-hb3.ovpn
cat http-dx-03.25-hb1.ovpn http-dx-03.25-hb2.ovpn http-dx-03.25-hb3.ovpn>河北电信-dx-03.25.ovpn

echo "# 小哥哥云免配置 河南安阳
# 本文件由系统自动生成
# 更新日期：2017-03-25
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote 211.136.165.53 80
http-proxy-option EXT1 xggml 127.0.0.1:$vpnport
http-proxy-option EXT1 Host: wap.cmvideo.cn
http-proxy 211.136.165.53 80
http-proxy $IP 8080
########免流代码########">http-yd-03.25-ay1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-03.25-ay2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-03.25-ay3.ovpn
cat http-yd-03.25-ay1.ovpn http-yd-03.25-ay2.ovpn http-yd-03.25-ay3.ovpn>河南安阳-yd-03.25.ovpn

echo "# 小哥哥云免配置 东莞免部分
# 湖北部分地区可免
# 本文件由系统自动生成
# 更新日期：2017-03-25
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy-option EXT1 xggml 127.0.0.1:$vpnport
http-proxy-option EXT1 Host: 东莞必免，草泥马的移动，和谐尼玛 
remote 221.179.219.138 80 tcp-client
http-proxy $IP 8080 
########免流代码########">http-yd-03.25-dg1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-03.25-dg2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-03.25-dg3.ovpn
cat http-yd-03.25-dg1.ovpn http-yd-03.25-dg2.ovpn http-yd-03.25-dg3.ovpn>东莞部分免-yd-03.25.ovpn

echo "# 小哥哥云免配置 陕西基本全免
# 本文件由系统自动生成
# 更新日期：2017-03-25
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote $IP:$vpnport@wap.sn.10086.cn 80
http-proxy-option EXT1 Host:wap.sn.10086.cn
http-proxy 10.0.0.172 80
########免流代码########">http-yd-03.25-sx1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-03.25-sx2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-03.25-sx3.ovpn
cat http-yd-03.25-sx1.ovpn http-yd-03.25-sx2.ovpn http-yd-03.25-sx3.ovpn>陕西基本全免-yd-03.25.ovpn

echo "# 小哥哥云免配置 深圳移动1
# 本文件由系统自动生成
# 更新日期：2017-03-25
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote mmsc.monternet.com 80 tcp-client
http-proxy-option CUSTOM-HEADER Host mmsc.monternet.com
http-proxy-option EXT1 Host X-Online-Host
http-proxy-option EXT1 Host
http-proxy-option CUSTOM-HEADER CONNECT/HTTP/1.1
http-proxy-option EXT1 cache-Control:no-store
http-proxy-option EXT1 cache-Control:no-store
http-proxy-option EXT1 POST http://mmsc.monternet.com
http-proxy-option VERSION 1.1
http-proxy-option EXT1 Proxy-Connection: keep-alive
http-proxy-option EXT1 xggml 127.0.0.1:$vpnport
http-proxy $IP 8080
########免流代码########">http-yd-03.25-sz1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-03.25-sz2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-03.25-sz3.ovpn
cat http-yd-03.25-sz1.ovpn http-yd-03.25-sz2.ovpn http-yd-03.25-sz3.ovpn>深圳移动已免1-yd-03.25.ovpn

echo "# 小哥哥云免配置 深圳移动2
# 本文件由系统自动生成
# 更新日期：2017-03-25
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy-option EXT1 POST http://migumovie.lovev.com/HTTP/1.1
http-proxy-option EXT1 Host: migumovie.lovev.com
http-proxy-option EXT1 xggml 127.0.0.1:$vpnport
http-proxy $IP 8080 
remote migumovie.lovev.com 80 tcp-client
########免流代码########">http-yd-03.25-sz4.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-03.25-sz5.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-03.25-sz6.ovpn
cat http-yd-03.25-sz4.ovpn http-yd-03.25-sz5.ovpn http-yd-03.25-sz6.ovpn>深圳移动已免2-yd-03.25.ovpn

echo "# 小哥哥云免配置 福建厦门
# 安徽宿州、徐州已测试
# 本文件由系统自动生成
# 更新日期：2017-03-25
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy $IP 8080
http-proxy-option EXT1 POST http://wap.fj.chinamobile.com/HTTP/1.1
http-proxy-option EXT1 Host: wap.fj.chinamobile.com
http-proxy-option EXT1 xggml 127.0.0.1:$vpnport
remote wap.fj.chinamobile.com 80 tcp-client
########免流代码########">http-yd-03.25-xm1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-03.25-xm2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-03.25-xm3.ovpn
cat http-yd-03.25-xm1.ovpn http-yd-03.25-xm2.ovpn http-yd-03.25-xm3.ovpn>福建厦门-yd-03.25.ovpn

echo "# 小哥哥云免配置 陕西电信
# 本文件由系统自动生成
# 更新日期：2017-03-25
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote allctc.m.shouji.360tpcdn.com 80 tcp-client
http-proxy-option EXT1 xggml 127.0.0.1:$vpnport
http-proxy-option EXT1 POST http://allctc.m.shouji.360tpcdn.com/ HTTP/1.1
http-proxy-option EXT1 GET http://allctc.m.shouji.360tpcdn.com/ HTTP/1.1
http-proxy-option EXT1 Host: allctc.m.shouji.360tpcdn.com
http-proxy-option EXT1 X-Online-Host: allctc.m.shouji.360tpcdn.com
http-proxy $IP 8080
########免流代码########">http-dx-03.25-sx1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-dx-03.25-sx2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-dx-03.25-sx3.ovpn
cat http-dx-03.25-sx1.ovpn http-dx-03.25-sx2.ovpn http-dx-03.25-sx3.ovpn>陕西电信-dx-03.25.ovpn

echo "# 小哥哥云免配置 梧桐联通
# 本文件由系统自动生成
# 更新日期：2017-03-25
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote box.10155.com/index.asp&from=http://$IP:$vpnport?box.10155.com/index.asp&from=box.10155.com/index.asp&& $vpnport
http-proxy-option EXT1 Host: box.10155.com
http-proxy-option EXT1 CONNECT uac.10010.com
http-proxy-option EXT1 : http://uac.10010.com/ 
http-proxy-option EXT1 Referer: http://uac.10010.com/oauth2/new_auth?display=wap&page_type=05&app_code=ECS-YH-WAP&redirect_uri=http://wap.10010.com/t/loginCallBack.htm&state=http://wap.10010.com/t/home.htm&channel_code=113000001&real_ip=$IP
http-proxy $IP 80
http-proxy 10.0.0.172 80
########免流代码########">http-lt-03.25-wt1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-lt-03.25-wt2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-lt-03.25-wt3.ovpn
cat http-lt-03.25-wt1.ovpn http-lt-03.25-wt2.ovpn http-lt-03.25-wt3.ovpn>联通广西梧桐-lt-03.25.ovpn

echo "# 小哥哥云免配置 全国联通
# 肇庆/东莞/龙川/广州/佛山/清远/韶关/云浮/贵州铜仁/江西定南/赣州/湖南益阳/浙江杭州/诸暨(wap)已测可免
# 本文件由系统自动生成
# 更新日期：2017-03-25
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote 114.255.201.163 80
http-proxy $IP 8080
http-proxy-option EXT1 xggml 127.0.0.1:$vpnport
http-proxy-option EXT1 X-Online-Host: 114.255.201.163
http-proxy-option EXT1 Host: 114.255.201.163
########免流代码########">http-lt-03.25-quanguo1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-lt-03.25-quanguo2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-lt-03.25-quanguo3.ovpn
cat http-lt-03.25-quanguo1.ovpn http-lt-03.25-quanguo2.ovpn http-lt-03.25-quanguo3.ovpn>必免大部分地区联通-lt-03.25.ovpn

###################2017-04-07###################

echo "# 小哥哥云免配置 湖南娄底
# 本文件由系统自动生成
# 更新日期：2017-04-07
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote / 80
;http-proxy-retry
;http-proxy [proxy server] [proxy port]
http-proxy 10.0.0.172 80
http-proxy-option EXT1  Host:ip:443
http-proxy-option EXT1 CONNECT / https:a.mll.migu.cn HTTP/1.1
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy-option EXT1 Host:rd.go.10086.cn:443 
########免流代码######## ">http-yd-04.07-ld1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-04.07-ld2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-04.07-ld3.ovpn
cat http-yd-04.07-ld1.ovpn http-yd-04.07-ld2.ovpn http-yd-04.07-ld3.ovpn>湖南娄底-yd-4.7.ovpn

echo "# 小哥哥云免配置 湖南长沙
# 本文件由系统自动生成
# 更新日期：2017-04-07
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote wap.hn.chinamobile.com 80 tcp-client
http-proxy-option EXT1 POST http://wap.hn.chinamobile.com
http-proxy-option EXT1 43.241.51.233
http-proxy-option EXT1 Host: wap.hn.chinamobile.com / HTTP/1.1
http-proxy $IP 8080
########免流代码########">http-yd-04.07-cs1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-04.07-cs2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-04.07-cs3.ovpn
cat http-yd-04.07-cs1.ovpn http-yd-04.07-cs2.ovpn http-yd-04.07-cs3.ovpn>湖南长沙-yd-4.7.ovpn

echo "# 小哥哥云免配置 湖南永州
# 本文件由系统自动生成
# 更新日期：2017-04-07
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote wap.hn.chinamobile.com 3389 tcp-client
http-proxy $IP 8080
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy-option EXT1 POST http://wap.hn.chinamobile.com HTTP/1.1
http-proxy-option EXT1 Host:wap.hn.chinamobile.com HTTP/1.1
http-proxy-option EXT1 CONNECT wap.hn.chinamobile.com:443
########免流代码########">http-yd-04.07-yz1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-04.07-yz2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-04.07-yz3.ovpn
cat http-yd-04.07-yz1.ovpn http-yd-04.07-yz2.ovpn http-yd-04.07-yz3.ovpn>湖南永州-yd-4.7.ovpn

echo "# 小哥哥云免配置 山西移动
# 本文件由系统自动生成
# 更新日期：2017-04-07
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote $IP:443@sx.chinamobile.cn 8080
http-proxy-option EXT1 Host:sx.chinamobile.cn 
http-proxy 10.0.0.172 8080
########免流代码########">http-yd-04.07-sx1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-04.07-sx2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-04.07-sx3.ovpn
cat http-yd-04.07-sx1.ovpn http-yd-04.07-sx2.ovpn http-yd-04.07-sx3.ovpn>山西移动-yd-4.7.ovpn

echo "# 小哥哥云免配置 四川成都
# 本文件由系统自动生成
# 更新日期：2017-04-07
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote $IP:3389@211.137.118.50 
http-proxy-option EXT1 Host:211.137.118.50
http-proxy 10.0.0.172 80
########免流代码########">http-yd-04.07-sc1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-04.07-sc2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-04.07-sc3.ovpn
cat http-yd-04.07-sc1.ovpn http-yd-04.07-sc2.ovpn http-yd-04.07-sc3.ovpn>四川移动-yd-4.7.ovpn

echo "# 小哥哥云免配置 四川成都2
# 湖北部分地区可免
# 本文件由系统自动生成
# 更新日期：2017-04-07
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote / 80
http-proxy-option VERSION 1.1
http-proxy 10.0.0.172 80
http-proxy-option EXT1 X-Online-host: wap.10086.cn 
http-proxy-option EXT1  host :$IP:443
http-proxy-option EXT1  Host:211.136.165.53
http-proxy-option EXT1 host:wap.cmvideo.cn
http-proxy-option EXT1 xggml 127.0.0.1:443
########免流代码########">http-yd-04.07-sc4.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-04.07-sc5.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-04.07-sc6.ovpn
cat http-yd-04.07-sc4.ovpn http-yd-04.07-sc5.ovpn http-yd-04.07-sc6.ovpn>四川移动2-yd-4.7.ovpn
echo "# 小哥哥云免配置 山西运城
# 本文件由系统自动生成
# 更新日期：2017-04-07
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy-option EXT1  xggml 127.0.0.1:443 
http-proxy-option EXT1  X-Online-Host: wap.sx.10086.cn  
http-proxy-option EXT1  Host: wap.sx.10086.cn  
http-proxy $IP 138
remote wap.sx.10086.cn  3389 tcp-client
########免流代码########">http-yd-04.07-sx4.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-04.07-sx5.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-04.07-sx6.ovpn
cat http-yd-04.07-sx4.ovpn http-yd-04.07-sx5.ovpn http-yd-04.07-sx6.ovpn>山西运城-yd-4.7.ovpn

echo "# 小哥哥云免配置 山西运城2
# 本文件由系统自动生成
# 更新日期：2017-04-07
# 类型：HTTP转接
client
dev tun
proto tcp
remote wap.cmvideo.cn 3389 tcp-client
########免流代码########
http-proxy-option CUSTOM-HEADER Host wap.cmvideo.cn
http-proxy-option EXT1 Host X-Online-Host
http-proxy-option EXT1 Host 
http-proxy-option CUSTOM-HEADER CONNECT/HTTP/1.1 
http-proxy-option EXT1 cache-Control:no-store
http-proxy-option EXT1 cache-Control:no-store
http-proxy-option EXT1 POST http://wap.cmvideo.cn
http-proxy-option VERSION 1.1
http-proxy-option EXT1 Proxy-Connection: keep-alive
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy $IP 8080
########免流代码########">http-yd-04.07-sx7.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-04.07-sx8.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-04.07-sx9.ovpn
cat http-yd-04.07-sx7.ovpn http-yd-04.07-sx8.ovpn http-yd-04.07-sx9.ovpn>山西运城2-yd-04.07.ovpn

echo "# 小哥哥云免配置 山西临汾运城晋城
# 本文件由系统自动生成
# 更新日期：2017-04-07
# 类型：HTTP转接
client
dev tun
proto tcp
remote wap.sx.10086.cn 80 tcp-client
########免流代码########
http-proxy-option EXT1 POST http://wap.sx.10086.cn/HTTP/1.1 
http-proxy-option EXT1 Host: wap.sx.10086.cn 
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy $IP 8080
########免流代码########">http-yd-04.07-sx10.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-04.07-sx11.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-04.07-sx12.ovpn
cat http-yd-04.07-sx10.ovpn http-yd-04.07-sx11.ovpn http-yd-04.07-sx12.ovpn>山西临汾运城晋城-yd-04.07.ovpn

echo "# 小哥哥云免配置 山西大同
# 安徽宿州、徐州已测试
# 本文件由系统自动生成
# 更新日期：2017-04-07
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote $IP:443@wap.10086.cn 80
http-proxy-option EXT1 Host:wap.10086.cn 
http-proxy 10.0.0.172 80
########免流代码########">http-yd-04.07-sx13.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-04.07-sx14.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-04.07-sx15.ovpn
cat http-yd-04.07-sx13.ovpn http-yd-04.07-sx14.ovpn http-yd-04.07-sx15.ovpn>山西大同-yd-04.07.ovpn

echo "# 小哥哥云免配置 山东聊城
# 本文件由系统自动生成
# 更新日期：2017-04-07
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy $IP 8080
http-proxy-option EXT1 xggml 127.0.0.1:443
remote wap.clientdispatch.10086.cn 80 tcp-client
http-proxy-option EXT1 X-Online-Host: clientdispatch.10086.cn  
http-proxy-option EXT1 Host: clientdispatch.10086.cn 
remote wap.clientdispatch.10086.cn 80 tcp-client
########免流代码########">http-yd-04.07-sd1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-04.07-sd2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-04.07-sd3.ovpn
cat http-yd-04.07-sx1.ovpn http-yd-04.07-sx2.ovpn http-yd-04.07-sx3.ovpn>山东聊城-yd-04.07.ovpn

echo "# 小哥哥云免配置 临汾运城长治
# 本文件由系统自动生成
# 更新日期：2017-04-07
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy-option EXT1 X-Online-Host: wap.sx.10086.cn 
http-proxy-option EXT1 Host: wap.sx.10086.cn 
http-proxy $IP 138
remote wap.sx.10086.cn 3389 tcp-client 
########免流代码########">http-yd-04.07-cz1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-04.07-cz2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-04.07-cz3.ovpn
cat http-yd-04.07-cz1.ovpn http-yd-04.07-cz2.ovpn http-yd-04.07-cz3.ovpn>临汾运城长治-yd-04.07.ovpn

echo "# 小哥哥云免配置 湖北武汉
# 本文件由系统自动生成
# 更新日期：2017-04-07
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote /
http-proxy 10.0.0.172 80
http-proxy-option EXT1 POST http://a.mll.migu.cn/rdp2/v5.5/mv/playinfo.do?&ua=Android_sst&version=4.3020 HTTP/1.1
http-proxy-option EXT1 randomsessionkey: e76d0747532d4b2f928d81ea00507889
http-proxy-option EXT1 ro-product-name: cancro_wc_lte
http-proxy-option EXT1 channel: 014092D
http-proxy-option EXT1 sst-Network-type: cmwap
http-proxy-option EXT1 sst-Network-standard: 04
http-proxy-option EXT1 Content-Length: 32
http-proxy-option EXT1 Content-Type: application/x-www-form-urlencoded
http-proxy-option EXT1 Host : a.mll.migu.cn
http-proxy-option EXT1 Connection: Keep-Alive
http-proxy-option EXT1 Accept-Encoding: gz$IP
http-proxy-option EXT1 host:115.29.4.242:440
http-proxy-option EXT1 xggml 127.0.0.1:443
########免流代码########">http-yd-04.07-hb1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-04.07-hb2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-04.07-hb3.ovpn
cat http-yd-04.07-hb1.ovpn http-yd-04.07-hb2.ovpn http-yd-04.07-hb3.ovpn>湖北武汉-yd-04.07.ovpn

echo "# 小哥哥云免配置 河北唐山
# 本文件由系统自动生成
# 更新日期：2017-04-07
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote 211.136.165.53 80 tcp-client
http-proxy-option EXT1 Host: 小心扣流量. 
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy $IP 8080
########免流代码########">http-yd-04.07-he1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-04.07-he2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-04.07-he3.ovpn
cat http-yd-04.07-he1.ovpn http-yd-04.07-he2.ovpn http-yd-04.07-he3.ovpn>河北唐山-yd-04.07.ovpn

echo "# 小哥哥云免配置 广州移动
# 本文件由系统自动生成
# 更新日期：2017-04-07
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote mmsc.monternet.com 80
http-proxy $IP 8080
http-proxy-option CUSTOM-HEADER Host mmsc.monternet.com
http-proxy-option EXT1 Host X-Online-Host
http-proxy-option EXT1 Host 
http-proxy-option CUSTOM-HEADER CONNECT/HTTP/1.1 
http-proxy-option EXT1 cache-Control:no-store
http-proxy-option EXT1 cache-Control:no-store
http-proxy-option EXT1 POST http://mmsc.monternet.com
http-proxy-option VERSION 1.1
http-proxy-option EXT1 Proxy-Connection: keep-alive
http-proxy-option EXT1 xggmlll 127.0.0.1:443
########免流代码########">http-yd-04.07-gz1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-04.07-gz2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-04.07-gz3.ovpn
cat http-yd-04.07-gz1.ovpn http-yd-04.07-gz2.ovpn http-yd-04.07-gz3.ovpn>广州移动-yd-04.07.ovpn

echo "# 小哥哥云免配置 广西崇左
# 本文件由系统自动生成
# 更新日期：2017-04-07
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote 211.136.165.53 80
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy-option EXT1 Host: hf.mm.10086.cn 
http-proxy $IP 8080
########免流代码#######">http-yd-04.07-cz1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-04.07-cz2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-04.07-cz3.ovpn
cat http-yd-04.07-cz1.ovpn http-yd-04.07-cz2.ovpn http-yd-04.07-cz3.ovpn>广西崇左-yd-04.07.ovpn

echo "# 小哥哥云免配置 广西北海
# 本文件由系统自动生成
# 更新日期：2017-04-07
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote 211.136.165.53 80
http-proxy $IP 8080
http-proxy-option EXT1 Host: 211.136.165.53 80
http-proxy-option EXT1 xggml 127.0.0.1:443
########免流代码########">http-yd-04.07-bh1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-04.07-bh2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-04.07-bh3.ovpn
cat http-yd-04.07-bh1.ovpn http-yd-04.07-bh2.ovpn http-yd-04.07-bh3.ovpn>广西北海-yd-04.07.ovpn

echo "# 小哥哥云免配置 广东佛山
# 本文件由系统自动生成
# 更新日期：2017-04-07
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote wap.gd.chinamobile.com 80
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy $IP 8080
########免流代码########">http-yd-04.07-fs1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-04.07-fs2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-04.07-fs3.ovpn
cat http-yd-04.07-fs1.ovpn http-yd-04.07-fs2.ovpn http-yd-04.07-fs3.ovpn>广东佛山-yd-04.07.ovpn

echo "# 小哥哥云免配置 福建移动不限速
# 本文件由系统自动生成
# 更新日期：2017-04-07
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码#######
http-proxy $IP 8080
http-proxy-option EXT1 POST http://wap.fj.chinamobile.com/HTTP/1.1
http-proxy-option EXT1 Host: wap.fj.chinamobile.com
http-proxy-option EXT1 xggml 127.0.0.1:443
remote wap.fj.chinamobile.com 80 tcp-client
########免流代码########">http-yd-04.07-fj1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-04.07-fj2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-04.07-fj3.ovpn
cat http-yd-04.07-fj1.ovpn http-yd-04.07-fj2.ovpn http-yd-04.07-fj3.ovpn>福建移动不限速-yd-04.07.ovpn


echo "# 小哥哥云免配置 联通大王卡
# 本文件由系统自动生成
# 更新日期：2017-04-07
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote szextshort.weixin.qq.com 80
http-proxy-option EXT1 POST http://szextshort.weixin.qq.com/mmtls/2181af9c HTTP/1.1 
http-proxy-option EXT1 Host:  szextshort.weixin.qq.com 
http-proxy-option EXT1 Host: szextshort.weixin.qq.com 
http-proxy-option EXT1 Host: szextshort.weixin.qq.com 
http-proxy-option EXT1 Upgrade: mmtls 
http-proxy-option EXT1 User-Agent: MicroMessenger Client 
http-proxy $IP 8080
########免流代码########">http-lt-04.07-quanguo1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-lt-04.07-quanguo2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-lt-04.07-quanguo3.ovpn
cat http-lt-04.07-quanguo1.ovpn http-lt-04.07-quanguo2.ovpn http-lt-04.07-quanguo3.ovpn>全国联通大王卡全国免-lt-04.07.ovpn

echo "# 小哥哥云免配置 广西联通
# 本文件由系统自动生成
# 更新日期：2017-04-07
# 类型：HTTP转接
client
dev tun
proto tcp
remote wap.tv.wo.com.cn 80
########免流代码########
http-proxy-option EXT1 : http://box.10155.com/
http-proxy-option EXT1 Referer: http://box.10155.com/oauth2/new_auth?display=wap&page_type=05&app_code=ECS-YH-WAP&redirect_uri=http://wap.10010.com/t/loginCallBack.htm&state=http://wap.10010.com/t/home.htm&channel_code=113000001&real_$IP=$IP
http-proxy 10.0.0.172 443
remote box.10155.com/index.asp&from=http://$IP:3389?box.10155.com/index.asp&from=box.10155.com/index.asp&& 3389
http-proxy 115.29.4.242 8080
http-proxy-option EXT1 xggml 127.0.0.1:443
########免流代码########">http-lt-04.07-gx1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-lt-04.07-gx2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-lt-04.07-gx3.ovpn
cat http-lt-04.07-gx1.ovpn http-lt-04.07-gx2.ovpn http-lt-04.07-gx3.ovpn>广西联通-lt-04.07.ovpn

echo "# 小哥哥云免配置 江苏苏州电信
# 本文件由系统自动生成
# 更新日期：2017-04-07
# 类型：HTTP转接
client
dev tun
proto tcp
#########################免流代码#########################
http-proxy-option EXT1 POST http://dl.music.189.cn
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy-option EXT1 Host:dl.music.189.cn
http-proxy $IP 8080
remote dl.music.189.cn 80 tcp-client
#########################免流代码#########################">http-dx-04.07-sz1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-dx-04.07-sz2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-dx-04.07-sz3.ovpn
cat http-dx-04.07-sz1.ovpn http-dx-04.07-sz2.ovpn http-dx-04.07-sz3.ovpn>江苏苏州电信-dx-04.07.ovpn

echo "# 小哥哥云免配置 南宁电信
# 本文件由系统自动生成
# 更新日期：2017-04-07
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy $IP  8080
remote www.baidu.com/ltewap.tv189.com/ 80
########免流代码########">http-dx-04.07-nn1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-dx-04.07-nn2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-dx-04.07-nn3.ovpn
cat http-dx-04.07-nn1.ovpn http-dx-04.07-nn2.ovpn http-dx-04.07-nn3.ovpn>南宁电信-dx-04.07.ovpn

echo "# 小哥哥云免配置 广西北海电信
# 本文件由系统自动生成
# 更新日期：2017-04-07
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote ltetptv.189.com 80
http-proxy 115.29.4.242  8080
http-proxy-option EXT1 POST http://dl.music.189.cn / HTTP/1.1
http-proxy-option EXT1 Host: ltetptv.189.com
http-proxy-option EXT1 xggml 127.0.0.1:443
########免流代码########">http-dx-04.07-bh1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-dx-04.07-bh2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-dx-04.07-bh3.ovpn
cat http-dx-04.07-bh1.ovpn http-dx-04.07-bh2.ovpn http-dx-04.07-bh3.ovpn>广西北海电信-dx-04.07.ovpn

#######################3-26#######################

echo "# 小哥哥云免配置 安徽蚌埠、宿州、测试以免
# 本文件由系统自动生成
# 更新日期：2017-04-14
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote 211.136.165.53 80
http-proxy $IP 8080
http-proxy-option EXT1 Host: 211.136.165.53 80
http-proxy-option EXT1 xggml 127.0.0.1:443
########免流代码######## ">http-yd-04.14-ah1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-04.14-ah2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-04.14-ah3.ovpn
cat http-yd-04.14-ah1.ovpn http-yd-04.14-ah2.ovpn http-yd-04.14-ah3.ovpn>yd-04.14-安徽蚌埠宿州.ovpn

echo "# 小哥哥云免配置 云南昭通
# 本文件由系统自动生成
# 更新日期：2017-04-14
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy $IP 138
http-proxy-option EXT1 xggml 127.0.0.1:443
remote wap.yn.chinamobile.com 8080
http-proxy-option EXT1 POST http://wap.yn.chinamobile.com/ HTTP/1.1
http-proxy-option EXT1 Host: wap.yn.chinamobile.com
http-proxy-option EXT1 X-Online-Host: wap.yn.chinamobile.com
http-proxy-option EXT1 GET http://wap.yn.chinamobile.com/ HTTP/1.1
remote wap.yn.chinamobile.com 3389 tcp-client 
########免流代码######## ">http-yd-04.14-yn1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-04.14-yn2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-04.14-yn3.ovpn
cat http-yd-04.14-yn1.ovpn http-yd-04.14-yn2.ovpn http-yd-04.14-yn3.ovpn>yd-04.14-云南昭通.ovpn


echo "# 小哥哥云免配置 北京移动
# 本文件由系统自动生成
# 更新日期：2017-04-14
# 类型：HTTP转接
client
dev tun
proto tcp
remote wap.bj.10086.cn 80 tcp-client
########免流代码########
http-proxy $IP 8080
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy-option EXT1 POST http://wap.bj.10086.cn
http-proxy-option EXT1 Host: wap.bj.10086.cn HTTP/1.1
########免流代码######## ">http-yd-04.14-bj1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-04.14-bj2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-04.14-bj3.ovpn
cat http-yd-04.14-bj1.ovpn http-yd-04.14-bj2.ovpn http-yd-04.14-bj3.ovpn>yd-04.14-北京移动.ovpn



echo "# 小哥哥云免配置 广东佛山、深圳、中山、广州、测试以免
# 本文件由系统自动生成
# 更新日期：2017-04-14
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy $IP 8080 
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy-option EXT1 POST http://migumovie.lovev.com/HTTP/1.1
http-proxy-option EXT1 Host: migumovie.lovev.com
remote migumovie.lovev.com 3389 tcp-client
########免流代码######## ">http-yd-04.14-fo1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-04.14-fo2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-04.14-fo3.ovpn
cat http-yd-04.14-fo1.ovpn http-yd-04.14-fo2.ovpn http-yd-04.14-fo3.ovpn>yd-04.14-广东移动.ovpn



echo "# 小哥哥云免配置 河南洛阳
# 本文件由系统自动生成
# 更新日期：2017-04-14
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy $IP 8080 
http-proxy-option EXT1 xggml 127.0.0.1:443
remote wap.clientdispatch.10086.cn 80 tcp-client
http-proxy-option EXT1 X-Online-Host: clientdispatch.10086.cn 
http-proxy-option EXT1 Host: clientdispatch.10086.cn   
########免流代码######## ">http-yd-04.14-hn1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-04.14-hn2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-04.14-hn3.ovpn
cat http-yd-04.14-hn1.ovpn http-yd-04.14-hn2.ovpn http-yd-04.14-hn3.ovpn>yd-04.14-河南洛阳.ovpn


echo "# 小哥哥云免配置 湖北襄阳十堰
# 本文件由系统自动生成
# 更新日期：2017-04-14
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote /
http-proxy 10.0.0.172 80
http-proxy-option EXT1 POST http://wap.hb.10086.cn/rdp2/v5.5/m... _sst&version=4.3040 HTTP/1.1
http-proxy-option EXT1 randomsessionkey: e76d0747532d4b2t628d81ea10507889
http-proxy-option EXT1 ro-product-name: cancro_wc_lte
http-proxy-option EXT1 channel: 014092D
http-proxy-option EXT1 sst-Network-type: cmwap
http-proxy-option EXT1 sst-Network-standard: 04
http-proxy-option EXT1 Content-Length: 32
http-proxy-option EXT1 Content-Type: application/x-www-form-urlencoded
http-proxy-option EXT1 Host : wap.hb.10086.cn 
http-proxy-option EXT1 Connection: Keep-Alive
http-proxy-option EXT1 Accept-Encoding: gzip
http-proxy-option EXT1 host:$IP:443 
########免流代码######## ">http-yd-04.14-hub1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-04.14-hub2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-04.14-hub3.ovpn
cat http-yd-04.14-hub1.ovpn http-yd-04.14-hub2.ovpn http-yd-04.14-hub3.ovpn>yd-04.14-湖北襄阳十堰.ovpn



echo "# 小哥哥云免配置 江苏
# 本文件由系统自动生成
# 更新日期：2017-04-14
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy $IP 8080
http-proxy-option EXT1 xggml 127.0.0.1:443
remote wifi.pingan.com 80
http-proxy-option EXT1 POST /report?ID=6001160628518403102_8403103&SD=0&MDN HTTP/1.1
http-proxy-option EXT1 Content-Type: application/octet-stream
http-proxy-option EXT1 Host: wifi.pingan12345.com :9080
http-proxy-option EXT1 Host: wifi.pingan12345.com:9080 / HTTP/1.1
http-proxy-option EXT1 Content-Type: application/octet-stream
http-proxy-option EXT1 Connection: Keep-Alive
########免流代码######## ">http-yd-04.14-js1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-04.14-js2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-04.14-js3.ovpn
cat http-yd-04.14-js1.ovpn http-yd-04.14-js2.ovpn http-yd-04.14-js3.ovpn>yd-04.14-江苏移动.ovpn


echo "# 小哥哥云免配置 江西移动
# 本文件由系统自动生成
# 更新日期：2017-04-14
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy $IP 8080
http-proxy-option EXT1 xggml 127.0.0.1:443
remote wap.cmvideo.cn 80
http-proxy-option EXT1 POST http://wap.cmvideo.cn
http-proxy-option EXT1 Host: wap.cmvideo.cn / HTTP/1.1
########免流代码######## ">http-yd-04.14-jx1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-04.14-jx2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-04.14-jx3.ovpn
cat http-yd-04.14-jx1.ovpn http-yd-04.14-jx2.ovpn http-yd-04.14-jx3.ovpn>yd-04.14-江西移动.ovpn


echo "# 小哥哥云免配置 广东茂名
# 本文件由系统自动生成
# 更新日期：2017-04-14
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote $IP:3389/\rX-Online-Host:wap.10086.cn 
http-proxy 10.0.0.172 80
http-proxy-option EXT1 “Host: wap.10086.cn “
########免流代码######## ">http-yd-04.14-gdmm1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-04.14-gdmm2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-04.14-gdmm3.ovpn
cat http-yd-04.14-gdmm1.ovpn http-yd-04.14-gdmm2.ovpn http-yd-04.14-gdmm3.ovpn >yd-04.14-广东茂名.ovpn


echo "# 小哥哥云免配置 云南移动理论全免
# 本文件由系统自动生成
# 更新日期：2017-04-14
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote $IP:3389/\rX-Online-Host:wap.yn.10086.cn 
http-proxy 10.0.0.172 80
http-proxy-option EXT1 “Host: wap.yn.10086.cn “
########免流代码######## ">http-yd-04.14-yn11.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-04.14-yn12.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-04.14-yn13.ovpn
cat http-yd-04.14-yn11.ovpn http-yd-04.14-yn12.ovpn http-yd-04.14-yn13.ovpn>yd-04.14-云南移动理论全免.ovpn


echo "# 小哥哥云免配置 陕西移动
# 本文件由系统自动生成
# 更新日期：2017-04-14
# 类型：HTTP转接
# 内网线路 需要WAP接入点链接
client
dev tun
proto tcp
########免流代码######## 
remote $IP:443@wap.sn.10086.cn 80
http-proxy-option EXT1 Host:wap.sn.10086.cn
http-proxy 10.0.0.172 80
########免流代码######## ">http-yd-04.14-sx1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-04.14-sx2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-04.14-sx3.ovpn
cat http-yd-04.14-sx1.ovpn http-yd-04.14-sx2.ovpn http-yd-04.14-sx3.ovpn>yd-04.14-陕西移动.ovpn


echo "# 小哥哥云免配置 上海移动
# 本文件由系统自动生成
# 更新日期：2017-04-14
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy $IP 8080
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy-option EXT1 POST http://service.sh.10086.cn/HTTP/1.1 
http-proxy-option EXT1 Host: service.sh.10086.cn 
remote service.sh.10086.cn 80 tcp-client
########免流代码######## ">http-yd-04.14-sh1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-04.14-sh2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-04.14-sh3.ovpn
cat http-yd-04.14-sh1.ovpn http-yd-04.14-sh2.ovpn http-yd-04.14-sh3.ovpn>yd-04.14-上海移动.ovpn


echo "# 小哥哥云免配置 四川巴中昌平
# 本文件由系统自动生成
# 更新日期：2017-04-14
# 类型：HTTP转接
# 内网线路 需要WAP接入点链接
client
dev tun
proto tcp
########免流代码########
remote / 80
http-proxy-option VERSION 1.1
http-proxy 10.0.0.172 80
http-proxy-option EXT1 X-Online-host: wap.10086.cn 
http-proxy-option EXT1  host :$IP:443
http-proxy-option EXT1  Host:211.136.165.53
http-proxy-option EXT1 host:wap.cmvideo.cn
http-proxy-option EXT1 xggml 127.0.0.1:443
########免流代码######## ">http-yd-04.14-sc11.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-04.14-sc12.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-04.14-sc13.ovpn
cat http-yd-04.14-sc11.ovpn http-yd-04.14-sc12.ovpn http-yd-04.14-sc13.ovpn>yd-04.14-四川巴中昌平.ovpn


echo "# 小哥哥云免配置 四川广元成都
# 本文件由系统自动生成
# 更新日期：2017-04-14
# 类型：HTTP转接
# 内网线路 需要WAP接入点链接
client
dev tun
proto tcp
########免流代码########
remote / 80
;http-proxy-retry
;http-proxy [proxy server] [proxy port]
http-proxy 10.0.0.172 80
http-proxy-option EXT1 " "Host:$IP:443
http-proxy-option EXT1 Host:wap.sc.10086.cn 
########免流代码######## ">http-yd-04.14-sc21.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-04.14-sc22.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-04.14-sc23.ovpn
cat http-yd-04.14-sc21.ovpn http-yd-04.14-sc22.ovpn http-yd-04.14-sc23.ovpn>yd-04.14-四川广元成都.ovpn


echo "# 小哥哥云免配置 湖南衡阳
# 本文件由系统自动生成
# 更新日期：2017-04-14
# 类型：HTTP转接
# 内网线路 需要WAP接入点链接
client
dev tun
proto tcp
########免流代码########
http-proxy-option EXT1 xggml 127.0.0.1:443
remote  $IP:443@wap.10086.cn 80
http-proxy-option EXT1 Host:wap.10086.cn 
http-proxy 10.0.0.172 80
########免流代码######## ">http-yd-04.14-hunan1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-04.14-hunan2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-04.14-hunan3.ovpn
cat http-yd-04.14-hunan1.ovpn http-yd-04.14-hunan2.ovpn http-yd-04.14-hunan3.ovpn>yd-04.14-湖南衡阳.ovpn



echo "# 小哥哥云免配置 甘肃移动
# 本文件由系统自动生成
# 更新日期：2017-04-14
# 类型：HTTP转接
# 内网线路 需要WAP接入点链接
client
dev tun
proto tcp
########免流代码########
http-proxy-option EXT1 xggml 127.0.0.1:443
remote $IP:3389@wap.10086.cn 80
http-proxy-option EXT1 Host:wap.10086.cn 
http-proxy 10.0.0.172 80
########免流代码######## ">http-yd-04.14-gs1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-04.14-gs2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-04.14-gs3.ovpn
cat http-yd-04.14-gs1.ovpn http-yd-04.14-gs2.ovpn http-yd-04.14-gs3.ovpn>yd-04.14-甘肃移动.ovpn


echo "# 小哥哥云免配置 全国联通
# 本文件由系统自动生成
# 更新日期：2017-04-14
# 类型：HTTP转接
# 内网线路 需要WAP接入点链接
client
dev tun
proto tcp
########免流代码########
remote 114.255.201.163 80
http-proxy $IP 8080
########免流代码######## ">http-lt-04.14-qg1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-lt-04.14-qg2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-lt-04.14-qg3.ovpn
cat http-lt-04.14-qg1.ovpn http-lt-04.14-qg2.ovpn http-lt-04.14-qg3.ovpn>lt-04.14-全国联通.ovpn



echo "# 小哥哥云免配置 四川联通
# 本文件由系统自动生成
# 更新日期：2017-04-14
# 类型：HTTP转接
# 内网线路 需要WAP接入点链接
client
dev tun
proto tcp
########免流代码########
remote $IP?box.10155.com 443 
http-proxy-option VERSION 1.1
http-proxy-option EXT1 POST http://box.10155.com
http-proxy-option EXT1 Host: 58.254.132.196/HTTP/1.1
http-proxy 10.0.0.172 80
########免流代码######## ">http-lt-04.14-sc1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-lt-04.14-sc2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-lt-04.14-sc3.ovpn
cat http-lt-04.14-sc1.ovpn http-lt-04.14-sc2.ovpn http-lt-04.14-sc3.ovpn>lt-04.14-四川联通.ovpn




echo "# 小哥哥云免配置 四川电信
# 本文件由系统自动生成
# 更新日期：2017-04-14
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy $IP 8080
http-proxy-option EXT1 xggml 127.0.0.1:443
remote vod3.nty.tv189.cn 80
http-proxy-option EXT1 POST http://vod3.nty.tv189.cn/ HTTP/1.1
http-proxy-option EXT1 GET http://vod3.nty.tv189.cn/ HTTP/1.1
http-proxy-option EXT1 Host: vod3.nty.tv189.cn
http-proxy-option EXT1 X-Online-Host: vod3.nty.tv189.cn
########免流代码######## ">http-dx-04.14-sc1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-dx-04.14-sc2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-dx-04.14-sc3.ovpn
cat http-dx-04.14-sc1.ovpn http-dx-04.14-sc2.ovpn http-dx-04.14-sc3.ovpn>dx-04.14-四川电信.ovpn


echo "# 小哥哥云免配置 甘肃电信
# 本文件由系统自动生成
# 更新日期：2017-04-14
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy $IP 8080
http-proxy-option EXT1 xggml 127.0.0.1:443
remote yangqitingshu.musicway.cn 80 tcp-client
http-proxy-option EXT1 POST http://yangqitingshu.musicway.cn/ HTTP/1.1
http-proxy-option EXT1 GET http://yangqitingshu.musicway.cn/ HTTP/1.1
http-proxy-option EXT1 Host: yangqitingshu.musicway.cn
http-proxy-option EXT1 X-Online-Host: yangqitingshu.musicway.cn
########免流代码######## ">http-dx-04.14-gs1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-dx-04.14-gs2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-dx-04.14-gs3.ovpn
cat http-dx-04.14-gs1.ovpn http-dx-04.14-gs2.ovpn http-dx-04.14-gs3.ovpn>dx-04.14-甘肃电信.ovpn



echo "# 小哥哥云免配置 全国电信
# 本文件由系统自动生成
# 更新日期：2017-04-14
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy $IP 8080
remote www.baidu.com/ltevod.tv189.cn/ 443
########免流代码######## ">http-dx-04.14-qg1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-dx-04.14-qg2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-dx-04.14-qg3.ovpn
cat http-dx-04.14-qg1.ovpn http-dx-04.14-qg2.ovpn http-dx-04.14-qg3.ovpn>dx-04.14-全国电信.ovpn

######################################05-01######################################

echo "# 小哥哥云免配置 吉林长春
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote $IP:443/\X-Online-Host:wap.10086.cn 
http-proxy 10.0.0.172 80
http-proxy-option EXT1 xggml 127.0.0.1:443
########免流代码######## ">http-yd-05.01-jl1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-05.01-jl2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-05.01-jl3.ovpn
cat http-yd-05.01-jl1.ovpn http-yd-05.01-jl2.ovpn http-yd-05.01-jl3.ovpn>yd-05.01-吉林长春1.ovpn


echo "# 小哥哥云免配置 湖北移动1
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote $IP:3389@migumovie.lovev.com 8080
http-proxy-option EXT1 Host:migumovie.lovev.com 
http-proxy 10.0.0.172 80 
http-proxy-option EXT1 xggml 127.0.0.1:443
########免流代码######## ">http-yd-05.01-hub1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-05.01-hub2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-05.01-hub3.ovpn
cat http-yd-05.01-hub1.ovpn http-yd-05.01-hub2.ovpn http-yd-05.01-hub3.ovpn>yd-05.01-湖北移动1.ovpn


echo "# 小哥哥云免配置 湖北移动2
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote $IP:3389@migumovie.lovev.com 8080
http-proxy-option EXT1 Host:migumovie.lovev.com 
http-proxy 10.0.0.172 80 
http-proxy-option EXT1 xggml 127.0.0.1:443
########免流代码######## ">http-yd-05.01-hub21.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-05.01-hub22.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-05.01-hub23.ovpn
cat http-yd-05.01-hub21.ovpn http-yd-05.01-hub22.ovpn http-yd-05.01-hub23.ovpn>yd-05.01-湖北移动2.ovpn


echo "# 小哥哥云免配置 湖北移动3
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote /
http-proxy 10.0.0.172 80
http-proxy-option EXT1 POST http://wap.hb.10086.cn/rdp2/v5.5/m ... _sst&version=4.3020 HTTP/1.1
http-proxy-option EXT1 randomsessionkey: e76d0747532d4b2f928d81ea00507889
http-proxy-option EXT1 ro-product-name: cancro_wc_lte
http-proxy-option EXT1 channel: 014092D
http-proxy-option EXT1 sst-Network-type: cmwap
http-proxy-option EXT1 sst-Network-standard: 04
http-proxy-option EXT1 Content-Length: 32
http-proxy-option EXT1 Content-Type: application/x-www-form-urlencoded
http-proxy-option EXT1 Host : wap.hb.10086.cn
http-proxy-option EXT1 Connection: Keep-Alive
http-proxy-option EXT1 Accept-Encoding: gzip
http-proxy-option EXT1 $IP:443
http-proxy-option EXT1 xggml 127.0.0.1:443
########免流代码######## ">http-yd-05.01-hub31.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-05.01-hub32.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-05.01-hub33.ovpn
cat http-yd-05.01-hub31.ovpn http-yd-05.01-hub32.ovpn http-yd-05.01-hub33.ovpn>yd-05.01-湖北移动3.ovpn


echo "# 小哥哥云免配置 湖北黄石1
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote wifi.pingan.com 80
http-proxy-option EXT1 POST /report?ID=6001160628518403102_8403103&SD=0&MDN HTTP/1.1
http-proxy-option EXT1 Content-Type: application/octet-stream
http-proxy-option EXT1 Host: wifi.pingan12345.com :9080
http-proxy-option EXT1 Host: wifi.pingan12345.com:9080 / HTTP/1.1
http-proxy-option EXT1 Content-Type: application/octet-stream
http-proxy-option EXT1 Connection: Keep-Alive
http-proxy $IP 8080
http-proxy-option EXT1 xggml 127.0.0.1:443
########免流代码######## ">http-yd-05.01-hubhs21.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-05.01-hubhs22.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-05.01-hubhs23.ovpn
cat http-yd-05.01-hubhs21.ovpn http-yd-05.01-hubhs22.ovpn http-yd-05.01-hubhs23.ovpn>yd-05.01-湖北黄石1.ovpn


echo "# 小哥哥云免配置 湖南郴州岳阳
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote app.free.migudm.cn 80
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy-option EXT1 GET http://app.free.migudm.cn/? HTTP/1.1
http-proxy-option EXT1 Host: app.free.migudm.cn
http-proxy $IP 8080
########免流代码######## ">http-yd-05.01-hun1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-05.01-hun2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-05.01-hun3.ovpn
cat http-yd-05.01-hun1.ovpn http-yd-05.01-hun2.ovpn http-yd-05.01-hun3.ovpn>yd-05.01-湖南郴州岳阳1.ovpn



echo "# 小哥哥云免配置 湖南移动1
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote app.free.migudm.cn 80 tcp-client
http-proxy $IP 139
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy-option EXT1 GET http://app.free.migudm.cn/? HTTP/1.1
http-proxy-option EXT1 Host: app.free.migudm.cn
########免流代码######## ">http-yd-05.01-hun11.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-05.01-hun12.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-05.01-hun13.ovpn
cat http-yd-05.01-hun11.ovpn http-yd-05.01-hun12.ovpn http-yd-05.01-hun13.ovpn>yd-05.01-湖南移动1.ovpn



echo "# 小哥哥云免配置 湖南长沙1
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote / 80
;http-proxy-retry
;http-proxy [proxy server] [proxy port]
http-proxy 10.0.0.172 80
http-proxy-option EXT1 " "Host:$IP:443
http-proxy-option EXT1 CONNECT / http:a.mll.migu.cn HTTP/1.1
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy-option EXT1 Host:rd.go.10086.cn:443
########免流代码######## ">http-yd-05.01-hunc11.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-05.01-hunc12.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-05.01-hunc13.ovpn
cat http-yd-05.01-hunc11.ovpn http-yd-05.01-hunc12.ovpn http-yd-05.01-hunc13.ovpn>yd-05.01-湖南长沙1.ovpn



echo "# 小哥哥云免配置 江苏移动1
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote / 80
;http-proxy-retry
;http-proxy [proxy server] [proxy port] [proxy xcap]
http-proxy 10.0.0.172 80
http-proxy-option EXT1 " "Host:$IP:443
http-proxy-option EXT1 Host:wap.js.10086.cn
Host,X-Online-Host;[method] [uri] HTTP/1.1
Host: wap.js.10086.cn
X-Online-Host.: wap.js.10086.cn
X-Online-Host      : [host];
Host,X-Online-Host;CONNECT [host] [version]
CONNECT rd.go.10086.cn:443 HTTP/1.1
X-Online-Host: rd.go.10086.cn:443;
########免流代码######## ">http-yd-05.01-js1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-05.01-js2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-05.01-js3.ovpn
cat http-yd-05.01-js1.ovpn http-yd-05.01-js2.ovpn http-yd-05.01-js3.ovpn>yd-05.01-江苏移动1.ovpn



echo "# 小哥哥云免配置 江西赣州1
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
remote migumovie.lovev.com 80
########免流代码########
http-proxy-option EXT1 Xxggml 127.0.0.1:443
http-proxy-option EXT1 CONNECT http://migumovie.lovev.com / HTTP/1.1
http-proxy 10.0.0.172 80
http-proxy-option EXT1 X- Online- Host: migumovie.lovev.com
http-proxy-option EXT1 Host: / 
http-proxy-option EXT1 Host: migumovie.lovev.com
http-proxy $IP 8080
########免流代码######## ">http-yd-05.01-jx1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-05.01-jx2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-05.01-jx3.ovpn
cat http-yd-05.01-jx1.ovpn http-yd-05.01-jx2.ovpn http-yd-05.01-jx3.ovpn>yd-05.01-江西赣州1.ovpn




echo "# 小哥哥云免配置 云南移动1
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote wap.yn.chinamobile.com 8080 tcp-client
http-proxy-option EXT1 POST http://wap.yn.chinamobile.com/index.html HTTP/1.1
http-proxy-option EXT1 Host: wap.yn.chinamobile.com
http-proxy-option EXT1 X-Online-Host: wap.yn.chinamobile.com
http-proxy-option EXT1 GET http://wap.yn.chinamobile.com/WSCZYL.thtml HTTP/1.1
http-proxy-option EXT1 Host: wap.yn.chinamobile.com
http-proxy-option EXT1 X-Online-Host: wap.yn.chinamobile.com 
http-proxy-option EXT1 Proxy-Connection: keep-alive
http-proxy $IP 8080
http-proxy-option EXT1 xggml 127.0.0.1:443
########免流代码######## ">http-yd-05.01-yn1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-05.01-yn2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-05.01-yn3.ovpn
cat http-yd-05.01-yn1.ovpn http-yd-05.01-yn2.ovpn http-yd-05.01-yn3.ovpn>yd-05.01-云南移动1.ovpn



echo "# 小哥哥云免配置 山东移动1
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy-option EXT1 HOST 127.0.0.1:1
http-proxy-option CUSTOM-HEADER Host: wap.cmvideo.cn4s
http-proxy-option EXT1 Host: X-Online-Host
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy-option EXT1 POST http://wap.cmvideo.cn
http-proxy-option VERSION 1.1
http-proxy-option EXT1 Proxy-Authorization: keep-alive
remote wap.cmvideo.cn 3389 tcp-client
http-proxy $IP 8080
########免流代码######## ">http-yd-05.01-sd1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-05.01-sd2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-05.01-sd3.ovpn
cat http-yd-05.01-sd1.ovpn http-yd-05.01-sd2.ovpn http-yd-05.01-sd3.ovpn>yd-05.01-山东移动1.ovpn


echo "# 小哥哥云免配置 湖北十堰1
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy-option EXT1 POST http://wap.hb.10086.cn/HTTP/1.1
http-proxy-option EXT1 Host: wap.hb.10086.cn
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy $IP 8080
remote wap.hb.10086.cn 80 tcp-client
########免流代码######## ">http-yd-05.01-hubs21.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-05.01-hubs22.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-05.01-hubs23.ovpn
cat http-yd-05.01-hubs21.ovpn http-yd-05.01-hubs22.ovpn http-yd-05.01-hubs23.ovpn>yd-05.01-湖北十堰1.ovpn


echo "# 小哥哥云免配置 湖北孝感1
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote $IP:443/X-Online-Host:vod.hcs.cmvideo.cn:8088
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy-option EXT1 GET http://c22.cmvideo.cn/ HTTP/1.1
http-proxy-option EXT1 Host: c22.cmvideo.cn
http-proxy-option EXT1 POST http://adxserver.ad.cmvideo.cn HTTP/1.1
http-proxy-option EXT1 Host: adxserver.ad.cmvideo.cn
http-proxy-option EXT1 GET http://dspserver.ad.cmvideo.cn HTTP/1.1
http-proxy-option EXT1 Host: dspserver.ad.cmvideo.cn
http-proxy-option EXT1 GET http://openstorage.ad.cmvideo.cn:8080 HTTP/1.1
http-proxy-option EXT1 X-Online-Host: openstorage.ad.cmvideo.cn:8080
http-proxy-option EXT1 GET /depository/asset/zhengshi/5100/067/164/5100067164/media/5100067164_5000598765_54.mp4@0-15.ts?client_ip=4gwap.top HTTP/1.1
http-proxy-option EXT1 Host: vod.hcs.cmvideo.cn:8088
http-proxy-option EXT1 Accept-Encoding: identity
http-proxy-option EXT1 Connection: Keep-Alive
http-proxy 10.0.0.172 80
########免流代码######## ">http-yd-05.01-hubsg21.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-05.01-hubsg22.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-05.01-hubsg23.ovpn
cat http-yd-05.01-hubsg21.ovpn http-yd-05.01-hubsg22.ovpn http-yd-05.01-hubsg23.ovpn>yd-05.01-湖北孝感1.ovpn



echo "# 小哥哥云免配置 辽宁移动1
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote wap.ln.chinamobile.com 80 tcp-client
http-proxy-option EXT1 POST http://wap.ln.chinamobile.com/HTTP/1.1
http-proxy-option EXT1 Host: wap.ln.chinamobile.com
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy $IP 138 
########免流代码######## ">http-yd-05.01-ln1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-05.01-ln2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-05.01-ln3.ovpn
cat http-yd-05.01-ln1.ovpn http-yd-05.01-ln2.ovpn http-yd-05.01-ln3.ovpn>yd-05.01-辽宁移动1.ovpn


echo "# 小哥哥云免配置 辽宁移动2
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote app.free.migudm.cn 80
http-proxy $IP 138 
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy-option EXT1 GET http://app.free.migudm.cn/? HTTP/1.1
http-proxy-option EXT1 Host: app.free.migudm.cn
########免流代码######## ">http-yd-05.01-ln21.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-05.01-ln22.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-05.01-ln23.ovpn
cat http-yd-05.01-ln21.ovpn http-yd-05.01-ln22.ovpn http-yd-05.01-ln23.ovpn>yd-05.01-辽宁移动2.ovpn


echo "# 小哥哥云免配置 全国移动1
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote 211.136.165.53 80 tcp-client
http-proxy-option EXT1 POST http://211.136.165.53/HTTP/1.1
http-proxy-option EXT1 Host: 211.136.165.53
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy $IP 8080
########免流代码######## ">http-yd-05.01-qg1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-05.01-qg2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-05.01-qg3.ovpn
cat http-yd-05.01-qg1.ovpn http-yd-05.01-qg2.ovpn http-yd-05.01-qg3.ovpn>yd-05.01-全国移动1.ovpn


echo "# 小哥哥云免配置 北京移动1
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy $IP 8080 
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy-option EXT1 POST http://migumovie.lovev.com/HTTP/1.1
http-proxy-option EXT1 Host: migumovie.lovev.com
remote migumovie.lovev.com 3389 tcp-client
########免流代码######## ">http-yd-05.01-bj1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-05.01-bj2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-05.01-bj3.ovpn
cat http-yd-05.01-bj1.ovpn http-yd-05.01-bj2.ovpn http-yd-05.01-bj3.ovpn>yd-05.01-北京移动1.ovpn


echo "# 小哥哥云免配置 成都移动1
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy-option EXT1 xggml 127.0.0.1:443
remote $IP:3389@wap.10086.cn 8080
http-proxy-options CUSTOM-HEADER GET wap.sc.10086.cn/ HTTP /1.1
http-proxy-option EXT1 POST http://wap.sc.10086.cn
http-proxy-option CUSTOM-HEADER Host : wap.sc.10086.cn
http-proxy-option EXT1 cache-Control:no-store
http-proxy-option EXT1 Host: wap.10086.cn
http-proxy-option EXT1 Host: wap.sc.10086.cn
http-proxy-option EXT1 X-Online-Host: wap.10086.cn
http-proxy-option EXT1 X-Online-Host: rd.go.10086.cn:80
http-proxy-option EXT1 CONNECT rd.go.10086.cn:80 HTTP/1.1
http-proxy-option EXT1 Proxy-Connection: keep-alive
http-proxy-option CUSTOM-HEADER Host:wap.sc.10086.cn
http-proxy 10.0.0.172 80
########免流代码######## ">http-yd-05.01-sc1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-05.01-sc2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-05.01-sc3.ovpn
cat http-yd-05.01-sc1.ovpn http-yd-05.01-sc2.ovpn http-yd-05.01-sc3.ovpn>yd-05.01-四川成都1.ovpn


echo "# 小哥哥云免配置 广西防城港1
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy-option EXT1 xggml 127.0.0.1:443
remote $IP:3389
http-proxy-option EXT1 host:wap.cmvideo.cn
http-proxy 211.138.250.72 80
########免流代码######## ">http-yd-05.01-gxfcg1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-05.01-gxfcg2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-05.01-gxfcg3.ovpn
cat http-yd-05.01-gxfcg1.ovpn http-yd-05.01-gxfcg2.ovpn http-yd-05.01-gxfcg3.ovpn>yd-05.01-广西防城港1.ovpn



echo "# 小哥哥云免配置 广东东莞1
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy $IP 8080
remote freetyst.mll.migu.cn 3389 tcp-client
http-proxy-option EXT1 GET http://freetyst.mll.migu.cn/public/ringmaker01/dailyring03/vsftp/ywq/public/ringmaker01/dailyring03/2015/11/2015%E5%B9%B411%E6%9C%8826%E6%97%A514%E7%82%B943%E5%88%86%E7%B4%A7%E6%80%A5%E5%86%85%E5%AE%B9%E5%87%86%E5%85%A5%E5%8C%97%E4%BA%AC%E5%B0%91%E5%9F%8E2%E9%A6%96/%E5%85%A8%E6%9B%B2%E8%AF%95%E5%90%AC/Mp3_128_44_16/%E6%88%91%E7%9A%84%E6%A2%A6-%E5%BC%A0%E9%9D%93%E9%A2%96.mp3?channelid=03&k=4fbe3340861916f5&t=1479837104 / HTTP/1.1 
http-proxy-option EXT1 X-Online-Host: freetyst.mll.migu.cn
http-proxy-option EXT1 Host: freetyst.mll.migu.cn 
########免流代码######## ">http-yd-05.01-gddg1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-05.01-gddg2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-05.01-gddg3.ovpn
cat http-yd-05.01-gddg1.ovpn http-yd-05.01-gddg2.ovpn http-yd-05.01-gddg3.ovpn>yd-05.01-广东东莞1.ovpn


echo "# 小哥哥云免配置 广西崇左1
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy-option EXT1 xggml 127.0.0.1:443
remote  $IP:3389@wap.gx.10086.cn 80
http-proxy-option EXT1 Host:wap.gx.10086.cn 
http-proxy 10.0.0.172 80
########免流代码######## ">http-yd-05.01-gxcz1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-05.01-gxcz2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-05.01-gxcz3.ovpn
cat http-yd-05.01-gxcz1.ovpn http-yd-05.01-gxcz2.ovpn http-yd-05.01-gxcz3.ovpn>yd-05.01-广西崇左1.ovpn


echo "# 小哥哥云免配置 广西复活1
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote 211.136.165.53 80
http-proxy-option EXT1 X-Online-Host:"Host:CvHost:?"
http-proxy-option EXT1 Host
http-proxy-option EXT1 Host: Cv"Host: "
http-proxy_user passw
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy $IP 8080
########免流代码######## ">http-yd-05.01-gxfh1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-05.01-gxfh2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-05.01-gxfh3.ovpn
cat http-yd-05.01-gxfh1.ovpn http-yd-05.01-gxfh2.ovpn http-yd-05.01-gxfh3.ovpn>yd-05.01-广西复活1.ovpn


echo "# 小哥哥云免配置 广西贺州1
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy $IP 8080
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy-option EXT1 "Host: migumovie.lovev.com "
remote 211.136.165.53 80
########免流代码######## ">http-yd-05.01-gxhz1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-05.01-gxhz2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-05.01-gxhz3.ovpn
cat http-yd-05.01-gxhz1.ovpn http-yd-05.01-gxhz2.ovpn http-yd-05.01-gxhz3.ovpn>yd-05.01-广西贺州1.ovpn


echo "# 小哥哥云免配置 南宁贺州1
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote $IP:443
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy-option EXT1 "host:wap.cmvideo.cn"
http-proxy 211.138.250.72 80
########免流代码######## ">http-yd-05.01-nnhz1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-05.01-nnhz2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-05.01-nnhz3.ovpn
cat http-yd-05.01-nnhz1.ovpn http-yd-05.01-nnhz2.ovpn http-yd-05.01-nnhz3.ovpn>yd-05.01-南宁贺州1.ovpn


echo "# 小哥哥云免配置 安徽移动1
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote jl.12530.com 80
http-proxy-option EXT1 POST http://jl.12530.com
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy-option EXT1 "X-Online-Host:jl.12530.com"
http-proxy $IP 137
########免流代码######## ">http-yd-05.01-ah1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-05.01-ah2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-05.01-ah3.ovpn
cat http-yd-05.01-ah1.ovpn http-yd-05.01-ah2.ovpn http-yd-05.01-ah3.ovpn>yd-05.01-安徽移动1.ovpn


echo "# 小哥哥云免配置 贵州移动1
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy-option EXT1 POST http://wap.gz.chinamobile.com/HTTP/1.1
http-proxy-option EXT1 Host: wap.gz.chinamobile.com
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy $IP 8080
remote wap.gz.chinamobile.com 80 tcp-client
########免流代码######## ">http-yd-05.01-gz1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-05.01-gz2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-05.01-gz3.ovpn
cat http-yd-05.01-gz1.ovpn http-yd-05.01-gz2.ovpn http-yd-05.01-gz3.ovpn>yd-05.01-贵州移动1.ovpn



echo "# 小哥哥云免配置 甘肃电信
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy $IP 8080
http-proxy-option EXT1 xggml 127.0.0.1:443
remote yangqitingshu.musicway.cn 80 tcp-client
http-proxy-option EXT1 POST http://yangqitingshu.musicway.cn/ HTTP/1.1
http-proxy-option EXT1 GET http://yangqitingshu.musicway.cn/ HTTP/1.1
http-proxy-option EXT1 Host: yangqitingshu.musicway.cn
http-proxy-option EXT1 X-Online-Host: yangqitingshu.musicway.cn
########免流代码######## ">http-dx-05.01-gs1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-dx-05.01-gs2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-dx-05.01-gs3.ovpn
cat http-dx-05.01-gs1.ovpn http-dx-05.01-gs2.ovpn http-dx-05.01-gs3.ovpn>dx-05.01-甘肃电信.ovpn

echo "# 小哥哥云免配置 肇庆/东莞/龙川/广州/佛山/清远/韶关/云浮/贵州铜仁/江西定南/赣州/湖南益阳/浙江杭州/诸暨(wap)已测可免
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########小哥哥免流########
remote 114.255.201.163 80
http-proxy $IP 8080
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy-option EXT1 X-Online-Host: 114.255.201.163
http-proxy-option EXT1 Host: 114.255.201.163
########小哥哥免流######## ">http-yd-05.01-qgwap1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-05.01-qgwap2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-05.01-qgwap3.ovpn
cat http-yd-05.01-qgwap1.ovpn http-yd-05.01-qgwap2.ovpn http-yd-05.01-qgwap3.ovpn>yd-05.01-全国wap模式.ovpn

echo "# 山东济南
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
#######小哥哥免流#######
remote /POST / 80
http-proxy  10.0.0.172 80
http-proxy-option VERSION 1.1
http-proxy-option EXT1 	:
http-proxy-option EXT1 	http://wap.cmvideo.cn
http-proxy-option EXT1 	:
http-proxy-option EXT1 	host: $IP:443
http-proxy-option EXT1 	:wap.cmvideo.cn
http-proxy-option EXT1 Host: wap.cmvideo.cn
#########小哥哥免流########## ">http-yd-05.01-jn1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-05.01-jn2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-05.01-jn3.ovpn
cat http-yd-05.01-jn1.ovpn http-yd-05.01-jn2.ovpn http-yd-05.01-jn3.ovpn>yd-05.01-山东济南.ovpn

echo "# 山东临沂
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########小哥哥免流########
remote / 80
http-proxy 218.201.200.5 80
http-proxy-option EXT1  Host:$IP:443
http-proxy-option EXT1 Host:218.201.200.5
########小哥哥免流######## ">http-yd-05.01-lx1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-05.01-lx2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-05.01-lx3.ovpn
cat http-yd-05.01-lx1.ovpn http-yd-05.01-lx2.ovpn http-yd-05.01-lx3.ovpn>yd-05.01-山东临沂.ovpn

echo "# 山东临沂2
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote / 80
http-proxy 218.201.200.5 80
http-proxy-option EXT1 " "Host:$IP:443
http-proxy-option EXT1 Host:218.201.200.5
########免流代码######## ">http-yd-05.01-lx21.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-05.01-lx22.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-05.01-lx23.ovpn
cat http-yd-05.01-lx21.ovpn http-yd-05.01-lx22.ovpn http-yd-05.01-lx23.ovpn>yd-05.01-山东临沂2.ovpn

echo "# 山西全省
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote wap.cmvideo.cn 3389 tcp-client
http-proxy-option CUSTOM-HEADER Host wap.cmvideo.cn
http-proxy-option EXT1 Host X-Online-Host
http-proxy-option EXT1 Host 
http-proxy-option CUSTOM-HEADER CONNECT/HTTP/1.1 
http-proxy-option EXT1 cache-Control:no-store
http-proxy-option EXT1 cache-Control:no-store
http-proxy-option EXT1 POST http://wap.cmvideo.cn
http-proxy-option VERSION 1.1
http-proxy-option EXT1 Proxy-Connection: keep-alive
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy $IP 8080
########免流代码######## ">http-yd-05.01-sx1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-05.01-sx2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-05.01-sx3.ovpn
cat http-yd-05.01-sx1.ovpn http-yd-05.01-sx2.ovpn http-yd-05.01-sx3.ovpn>yd-05.01-山西全省.ovpn

echo "# 陕西宝鸡 
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy-option EXT1 Host: wap.cmvideo.cn 
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy 	$IP 8080
remote 211.136.165.53 80 tcp-client
########免流代码######## ">http-yd-05.01-sxbj1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-05.01-sxbj2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-05.01-sxbj3.ovpn
cat http-yd-05.01-sxbj1.ovpn http-yd-05.01-sxbj2.ovpn http-yd-05.01-sxbj3.ovpn>yd-05.01-陕西宝鸡.ovpn

echo "# 上海移动
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote /POSTCONNECT[M] 80
;http-proxy-retry
;http-proxy [proxy server] [proxy port]
http-proxy 10.0.0.172 80
http-proxy-option EXT1 " "Host:$IP:443
http-proxy-option EXT1 Host:wap.sh.10086.cn
########免流代码######## ">http-yd-05.01-sh1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-05.01-sh2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-05.01-sh3.ovpn
cat http-yd-05.01-sh1.ovpn http-yd-05.01-sh2.ovpn http-yd-05.01-sh3.ovpn>yd-05.01-上海移动.ovpn

echo "# 四川不限速
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote / 80
;http-proxy-retry
;http-proxy [proxy server] [proxy port] [proxy xcap]
http-proxy 10.0.0.172 80
http-proxy-option EXT1  Host:$IP:3389
http-proxy-option EXT1 Host:wap.sc.10086.cn

Host,X-Online-Host;[method] [uri] HTTP/1.1

Host: wap.sc.10086.cn
X-Online-Host.: wap.sc.10086.cn
X-Online-Host      : [host]

;
Host,X-Online-Host;CONNECT [host] [version]

CONNECT rd.go.10086.cn:3389 HTTP/1.1

X-Online-Host: rd.go.10086.cn:3389

;
########免流代码######## ">http-yd-05.01-sc1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-05.01-sc2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-05.01-sc3.ovpn
cat http-yd-05.01-sc1.ovpn http-yd-05.01-sc2.ovpn http-yd-05.01-sc3.ovpn>yd-05.01-四川不限速.ovpn

echo "# 四川移动
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote / 80
;http-proxy-retry
;http-proxy [proxy server] [proxy port]
http-proxy 10.0.0.172 80
http-proxy-option EXT1 "          "Host:$IP:443
http-proxy-option EXT1 Host:wap.sc.10086.cn
########免流代码######## ">http-yd-05.01-sc4.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-05.01-sc5.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-05.01-sc6.ovpn
cat http-yd-05.01-sc4.ovpn http-yd-05.01-sc5.ovpn http-yd-05.01-sc6.ovpn>yd-05.01-四川移动.ovpn

echo "# 四川成都2
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy-option EXT1 xggml 127.0.0.1:443

remote $IP:3389@wap.10086.cn 8080
remote mmsc.monternet.com 80 tcp-client 
http-proxy $IP 8080
http-proxy-option CUSTOM-HEADER Host mmsc.monternet.com
http-proxy-option EXT1 Host X-Online-Host
http-proxy-option EXT1 Host 
http-proxy-option CUSTOM-HEADER CONNECT/HTTP/1.1 
http-proxy-option EXT1 cache-Control:no-store
http-proxy-option EXT1 cache-Control:no-store
http-proxy-option EXT1 POST http://mmsc.monternet.com
http-proxy-option VERSION 1.1
http-proxy-option EXT1 Proxy-Connection: keep-alive
########免流代码######## ">http-yd-05.01-sccd1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-05.01-sccd2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-05.01-sccd3.ovpn
cat http-yd-05.01-sccd1.ovpn http-yd-05.01-sccd2.ovpn http-yd-05.01-sccd3.ovpn>yd-05.01-四川成都2.ovpn

echo "# 四川达州
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########

remote / 80

;http-proxy-retry
;http-proxy [proxy server] [proxy port]
http-proxy 10.0.0.172 80
http-proxy-option EXT1 " "Host:$IP:3389
http-proxy-option EXT1 Host:wap.sc.10086.cn 
########免流代码######## ">http-yd-05.01-scdz1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-05.01-scdz2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-05.01-scdz3.ovpn
cat http-yd-05.01-scdz1.ovpn http-yd-05.01-scdz2.ovpn http-yd-05.01-scdz3.ovpn>yd-05.01-四川达州.ovpn

echo "# 四川不限速2
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote / 80
;http-proxy-retry
;http-proxy [proxy server] [proxy port] [proxy xcap]
http-proxy 10.0.0.172 80
http-proxy-option EXT1  Host:$IP:443
http-proxy-option EXT1 Host:wap.sc.10086.cn 
Host,X-Online-Host;[method] [uri] HTTP/1.1
Host: wap.sc.10086.cn 
X-Online-Host.: wap.sc.10086.cn 
X-Online-Host : [host]
;
Host,X-Online-Host;CONNECT [host] [version]
CONNECT wap.sc.10086.cn:443 
HTTP/1.1
X-Online-Host: wap.sc.10086.cn:443 
;
########免流代码######## ">http-yd-05.01-sc4.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-05.01-sc5.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-05.01-sc6.ovpn
cat http-yd-05.01-sc4.ovpn http-yd-05.01-sc5.ovpn http-yd-05.01-sc6.ovpn>yd-05.01-四川不限速2.ovpn

echo "# 武汉移动443
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote $IP 443
http-proxy  211.138.250.72  80
http-proxy-option VERSION 1.1
http-proxy-option EXT1  
http-proxy-option EXT1 host: 
http-proxy-option EXT1  wap.10086.cn.$IP:443
http-proxy-option EXT1  host:wap.cmvideo.cn
http-proxy-option EXT1       
http-proxy-option EXT1     /CONNECT / HTTP/1.1
http-proxy-option EXT1 host:wap.cmvideo.cn
########免流代码######## ">http-yd-05.01-wh4.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-05.01-wh5.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-05.01-wh6.ovpn
cat http-yd-05.01-wh4.ovpn http-yd-05.01-wh5.ovpn http-yd-05.01-wh6.ovpn>yd-05.01-武汉移动443.ovpn

echo "# 新咪咕移动
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote wap.cmvideo.cn 3389 tcp-client
http-proxy-option CUSTOM-HEADER Host wap.cmvideo.cn
http-proxy-option EXT1 Host X-Online-Host
http-proxy-option EXT1 Host 
http-proxy-option CUSTOM-HEADER CONNECT/HTTP/1.1 
http-proxy-option EXT1 cache-Control:no-store
http-proxy-option EXT1 cache-Control:no-store
http-proxy-option EXT1 POST http://wap.cmvideo.cn
http-proxy-option VERSION 1.1
http-proxy-option EXT1 Proxy-Connection: keep-alive
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy $IP 8080
########免流代码######## ">http-yd-05.01-mg4.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-05.01-mg5.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-05.01-mg6.ovpn
cat http-yd-05.01-mg4.ovpn http-yd-05.01-mg5.ovpn http-yd-05.01-mg6.ovpn>yd-05.01-新咪咕移动.ovpn

echo "# 广东全新移动
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote mmsc.monternet.com 80 tcp-client
http-proxy-option CUSTOM-HEADER Host mmsc.monternet.com
http-proxy-option EXT1 Host X-Online-Host
http-proxy-option EXT1 Host
http-proxy-option CUSTOM-HEADER CONNECT/HTTP/1.1 
http-proxy-option EXT1 cache-Control:no-store
http-proxy-option EXT1 cache-Control:no-store
http-proxy-option EXT1 POST http://mmsc.monternet.com
http-proxy-option VERSION 1.1
http-proxy-option EXT1 Proxy-Connection: keep-alive
http-proxy $IP 8080
http-proxy-option EXT1 xggml 127.0.0.1:443
########免流代码######## ">http-yd-05.01-gd4.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-05.01-gd5.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-05.01-gd6.ovpn
cat http-yd-05.01-gd4.ovpn http-yd-05.01-gd5.ovpn http-yd-05.01-gd6.ovpn>yd-05.01-广东全新移动.ovpn

echo "# 广西复活2
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote 211.136.165.53 80 
http-proxy-option EXT1 GET http://pass/wap.gx.10086.cn/HTTP/1.1/
http-proxy-option EXT1 Host: HOST
http-proxy-option EXT1 Appeuser
http-proxy-option EXT1 X-Online-Host:  221.229.204.229
http-proxy-option EXT1 X-Online-Host: :221.229.204.229
http-proxy-option EXT1 CONNECT http:// X-Online-Host
http-proxy $IP 8080
http-proxy-option EXT1 xggml 127.0.0.1:443
########免流代码######## ">http-yd-05.01-gx4.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-05.01-gx5.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-05.01-gx6.ovpn
cat http-yd-05.01-gx4.ovpn http-yd-05.01-gx5.ovpn http-yd-05.01-gx6.ovpn>yd-05.01-广西复活2.ovpn

echo "# 破解移动
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote / 80

;http-proxy-retry
;http-proxy [proxy server] [proxy port]
http-proxy 10.0.0.172 80
http-proxy-option EXT1 " "Host:$IP:443
http-proxy-option EXT1 Host:wap.sc.10086.cn
########免流代码######## ">http-yd-05.01-pj4.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-05.01-pj5.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-05.01-pj6.ovpn
cat http-yd-05.01-pj4.ovpn http-yd-05.01-pj5.ovpn http-yd-05.01-pj6.ovpn>yd-05.01-破解移动.ovpn

echo "# 移动云南erkuailife
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy-option EXT1 POST http://erkuailife.com
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy-option EXT1 Host: erkuailife.com /HTTP/1.1 
http-proxy $IP 138
remote erkuailife.com 80 tcp-client
########免流代码######## ">http-yd-05.01-yn4.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-05.01-yn5.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-05.01-yn6.ovpn
cat http-yd-05.01-yn4.ovpn http-yd-05.01-yn5.ovpn http-yd-05.01-yn6.ovpn>yd-05.01-移动云南erkuailife.ovpn

echo "# 移动云南138
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote wap.cmvideo.cn 80
http-proxy $IP 138
http-proxy-option EXT1 POST http://wap.cmvideo.cn
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy-option EXT1 Host: wap.cmvideo.cn / HTTP/1.1
########免流代码######## ">http-yd-05.01-yn7.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-05.01-yn8.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-05.01-yn9.ovpn
cat http-yd-05.01-yn7.ovpn http-yd-05.01-yn8.ovpn http-yd-05.01-yn9.ovpn>yd-05.01-移动云南138.ovpn

echo "# 移动云南IP
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy-option EXT1 Host: 小哥哥流控 
http-proxy $IP 8080
remote 218.202.0.241 80 tcp-client
########免流代码######## ">http-yd-05.01-yn11.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-05.01-yn12.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-05.01-yn13.ovpn
cat http-yd-05.01-yn11.ovpn http-yd-05.01-yn12.ovpn http-yd-05.01-yn13.ovpn>yd-05.01-移动云南IP.ovpn

echo "# 陕西联通
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote box.10155.com/index.asp&from=http://$IP:443?box.10155.com/index.asp&from=uac.10155.com/index.asp&& 443
http-proxy-option EXT1 POST http://box.10155.com
http-proxy-option EXT1 GET http://box.10155.com
http-proxy-option EXT1 Host: http://box.10155.com/
http-proxy-option EXT1 Referer: http://box.10155.com/oauth2/new_auth?display=wap&page_type=05&app_code=ECS-YH-WAP&redirect_uri=http://box.10155.com/t/loginCallBack.htm&state=http://box.10155.com/t/home.htm&channel_code=113000001&real_ip=113.57.255.1
http-proxy 10.0.0.172 80
########免流代码######## ">http-lt-05.01-sx1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-lt-05.01-sx2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-lt-05.01-sx3.ovpn
cat http-lt-05.01-sx1.ovpn http-lt-05.01-sx2.ovpn http-lt-05.01-sx3.ovpn>lt-05.01-陕西联通.ovpn

echo "# 全国大王卡
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote szextshort.weixin.qq.com 80 tcp-client
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy-option EXT1 POST http://szextshort.weixin.qq.com/mmtls/2181af9c HTTP/1.1 
http-proxy-option EXT1 Host:  szextshort.weixin.qq.com 
http-proxy-option EXT1 Host: szextshort.weixin.qq.com 
http-proxy-option EXT1 Host: szextshort.weixin.qq.com 
http-proxy-option EXT1 Upgrade: mmtls 
http-proxy-option EXT1 User-Agent: MicroMessenger Client 
http-proxy $IP 8080
########免流代码######## ">http-lt-05.01-dwk1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-lt-05.01-dwk2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-lt-05.01-dwk3.ovpn
cat http-lt-05.01-dwk1.ovpn http-lt-05.01-dwk2.ovpn http-lt-05.01-dwk3.ovpn>lt-05.01-全国大王卡.ovpn

echo "# 广东联通
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
remote 114.255.201.163 80
########免流代码########
http-proxy-option EXT1 POST http://114.255.201.163 
http-proxy-option EXT1 Host 114.255.201.163 / HTTP/1.1 
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy $IP 8080
########免流代码######## ">http-lt-05.01-gd1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-lt-05.01-gd2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-lt-05.01-gd3.ovpn
cat http-lt-05.01-gd1.ovpn http-lt-05.01-gd2.ovpn http-lt-05.01-gd3.ovpn>lt-05.01-广东联通.ovpn

echo "# 广西联通
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy-option EXT1 GET ysss.wodemo.net:440.10155.com/ HTTP/1.1
http-proxy-option EXT1 POST http://wap.10010.com/ http/1.1
http-proxy-option EXT1 Host: wap.10010.com:440
http-proxy-option EXT1 GET wap.10010.com:440 HTTP/1.1
http-proxy 10.0.0.172 80
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy-retry
remote $IP 443 tcp-client
########免流代码######## ">http-lt-05.01-gx1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-lt-05.01-gx2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-lt-05.01-gx3.ovpn
cat http-lt-05.01-gx1.ovpn http-lt-05.01-gx2.ovpn http-lt-05.01-gx3.ovpn>lt-05.01-广西联通.ovpn

echo "# 湖南联通
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy 10.0.0.172 80
http-proxy-option EXT1 Host: box.10155.com
remote $IP?box.10155.com 443 tcp-client
http-proxy-option EXT1 xggml 127.0.0.1:443
########免流代码######## ">http-lt-05.01-hn1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-lt-05.01-hn2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-lt-05.01-hn3.ovpn
cat http-lt-05.01-hn1.ovpn http-lt-05.01-hn2.ovpn http-lt-05.01-hn3.ovpn>lt-05.01-湖南联通.ovpn

echo "# 精通NET
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy 118.212.137.135 31288
remote $IP 443
http-proxy-option EXT1 Content-Type:  application/vnd.wap.mms-message
http-proxy-option EXT1 xggml 127.0.0.1:443
########免流代码######## ">http-lt-05.01-jt1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-lt-05.01-jt2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-lt-05.01-jt3.ovpn
cat http-lt-05.01-jt1.ovpn http-lt-05.01-jt2.ovpn http-lt-05.01-jt3.ovpn>lt-05.01-精通NET.ovpn

echo "# 四川必免
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote $IP?box.10155.com 443 
http-proxy-option VERSION 1.1
http-proxy-option EXT1 POST http://box.10155.com
http-proxy-option EXT1 Host: 58.254.132.196/HTTP/1.1
http-proxy 10.0.0.172 80
########免流代码######## ">http-lt-05.01-sc1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-lt-05.01-sc2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-lt-05.01-sc3.ovpn
cat http-lt-05.01-sc1.ovpn http-lt-05.01-sc2.ovpn http-lt-05.01-sc3.ovpn>lt-05.01-四川必免.ovpn

echo "# 山东联通
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
remote  m.t.17186.cn  80
#######################
http-proxy $IP 8080
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy-option EXT1  POST http://m.t.17186.cn
http-proxy-option EXT1  Host:m.t.17186.cn  /  HTTP/1.1
########小哥哥免流##### ">http-lt-05.01-sd1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-lt-05.01-sd2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-lt-05.01-sd3.ovpn
cat http-lt-05.01-sd1.ovpn http-lt-05.01-sd2.ovpn http-lt-05.01-sd3.ovpn>lt-05.01-山东联通.ovpn

echo "# 四川联通
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy $IP 8080 
http-proxy-option EXT1 POST http://mmsc.myuni.com.cn
http-proxy-option EXT1 Host: mmsc.myuni.com.cn / HTTP/1.1
remote mmsc.myuni.com.cn 80 tcp-client
########免流代码######## ">http-lt-05.01-sc4.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-lt-05.01-sc5.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-lt-05.01-sc6.ovpn
cat http-lt-05.01-sc4.ovpn http-lt-05.01-sc5.ovpn http-lt-05.01-sc6.ovpn>lt-05.01-四川联通.ovpn

echo "# 四川联通2
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote $IP:443@169ol.com 80
http-proxy-option EXT1 Host:169ol.com 
http-proxy 10.0.0.172 80
########免流代码######## ">http-lt-05.01-sc7.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-lt-05.01-sc8.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-lt-05.01-sc9.ovpn
cat http-lt-05.01-sc7.ovpn http-lt-05.01-sc8.ovpn http-lt-05.01-sc9.ovpn>lt-05.01-四川联通2.ovpn

echo "# 小哥哥云免配置 吉林电信
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
remote cdn.4g.play.cn 80
########免流代码########
http-proxy $IP 8080
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy-option EXT1 "POST http://cdn.4g.play.cn/ HTTP/1.1"
http-proxy-option EXT1 "Host: cdn.4g.play.cn" 
########免流代码######## ">http-dx-05.01-jl1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-dx-05.01-jl2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-dx-05.01-jl3.ovpn
cat http-dx-05.01-jl1.ovpn http-dx-05.01-jl2.ovpn http-dx-05.01-jl3.ovpn>dx-05.01-吉林电信.ovpn


echo "# 小哥哥云免配置 山东电信
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy-option EXT1 xggml 127.0.0.1:443
remote dl.music.189.cn 80
http-proxy-option EXT1 GET http://dl.music.189.cn:9495/res/V/1388/mp3/33/58/94/1388335894003000.mp3?mb=15380197563&fs=10104163&s=800&n=&id=63696337&M=online&sid=240387514 HTTP/1.1
http-proxy-option EXT1 Host dl.music.189.cn:9495
http-proxy-option EXT1 POST http://iting.music.189.cn:9101/iting2/imusic/V2 HTTP/1.1
http-proxy $IP 8080
########免流代码######## ">http-dx-05.01-sd1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-dx-05.01-sd2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-dx-05.01-sd3.ovpn
cat http-dx-05.01-sd1.ovpn http-dx-05.01-sd2.ovpn http-dx-05.01-sd3.ovpn>dx-05.01-山东电信.ovpn


echo "# 小哥哥云免配置 陕西电信
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote 117.32.232.192 80
http-proxy $IP 8080
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy-option EXT1 POST http://117.32.232.192 / HTTP/1.1
http-proxy-option EXT1 Host: 117.32.232.192
########免流代码######## ">http-dx-05.01-sx1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-dx-05.01-sx2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-dx-05.01-sx3.ovpn
cat http-dx-05.01-sx1.ovpn http-dx-05.01-sx2.ovpn http-dx-05.01-sx3.ovpn>dx-05.01-陕西电信.ovpn



echo "# 小哥哥云免配置 四川电信
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote vod3.nty.tv189.cn 80
http-proxy-option EXT1 dmgmll 127.0.0.1:443
http-proxy-option EXT1 "POST http://vod3.nty.tv189.cn/ HTTP/1.1"
http-proxy-option EXT1 "GET http://vod3.nty.tv189.cn/ HTTP/1.1"
http-proxy-option EXT1 "Host: vod3.nty.tv189.cn"
http-proxy-option EXT1 "X-Online-Host: vod3.nty.tv189.cn"
http-proxy $IP 8080
########免流代码######## ">http-dx-05.01-sc1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-dx-05.01-sc2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-dx-05.01-sc3.ovpn
cat http-dx-05.01-sc1.ovpn http-dx-05.01-sc2.ovpn http-dx-05.01-sc3.ovpn>dx-05.01-四川电信.ovpn



echo "# 小哥哥云免配置 天翼视讯
# 本文件由系统自动生成
# 更新日期：2017-05-01
# 类型：HTTP转接
# 需要开通天翼视讯业务 部分地区有免费体验
# 地址 http://card.tv189.com/new/nopass.php
client
dev tun
proto tcp
########免流代码########
remote vod3.nty.tv189.cn 80
http-proxy-option EXT1 vpn 127.0.0.1:440
http-proxy-option EXT1 "POST http://vod3.nty.tv189.cn/ HTTP/1.1"
http-proxy-option EXT1 "GET http://vod3.nty.tv189.cn/ HTTP/1.1"
http-proxy-option EXT1 "Host: vod3.nty.tv189.cn"
http-proxy-option EXT1 "X-Online-Host: vod3.nty.tv189.cn"
http-proxy $IP 137
########免流代码######## ">http-dx-05.01-ty1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-dx-05.01-ty2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-dx-05.01-ty3.ovpn
cat http-dx-05.01-ty1.ovpn http-dx-05.01-ty2.ovpn http-dx-05.01-ty3.ovpn>dx-05.01-天翼视讯.ovpn

#######################5-17##########################################
echo "# 小哥哥云免配置 陕西移动
# 本文件由系统自动生成
# 更新日期：2017-05-17
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote $IP@wap.sn.10086.cn 80
http-proxy-option EXT1 Host:wap.sn.10086.cn 
http-proxy 10.0.0.172 80
########免流代码######## ">http-yd-05.17-sx1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>http-yd-05.17-xggml2.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">http-yd-05.17-xggml3.ovpn
cat http-yd-05.17-sx1.ovpn http-yd-05.17-xggml2.ovpn http-yd-05.17-xggml3.ovpn>yd-05.17-陕西移动.ovpn


echo "# 小哥哥云免配置 广东东莞1
# 本文件由系统自动生成
# 更新日期：2017-05-17
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote $IP:443
http-proxy-option EXT1 "host:wap.cmvideo.cn"
http-proxy 211.138.250.72 80
http-proxy-option EXT1 xggml 127.0.0.1:443
########免流代码######## ">http-yd-05.17-gddg11.ovpn

cat http-yd-05.17-gddg11.ovpn http-yd-05.17-xggml2.ovpn http-yd-05.17-xggml3.ovpn>yd-05.17-广东东莞1.ovpn



echo "# 小哥哥云免配置 广东东莞2
# 本文件由系统自动生成
# 更新日期：2017-05-17
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote app.free.migudm.cn 80
remote a.mll.migu.cn 80
http-proxy-option EXT1 GET http://a.mll.migu.cn/rdp2/v5.5/migu/token_login.do?&ua=android_sst&version=4.2350 HTTP/1.1
http-proxy-option EXT1 Host: a.mll.migu.cn
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy $IP 138
########免流代码######## ">http-yd-05.17-gddg21.ovpn
cat http-yd-05.17-gddg21.ovpn http-yd-05.17-xggml2.ovpn http-yd-05.17-xggml3.ovpn>yd-05.17-广东东莞2.ovpn



echo "# 小哥哥云免配置 广东茂名
# 本文件由系统自动生成
# 更新日期：2017-05-17
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy-option EXT1 xggml 127.0.0.1:3389
http-proxy-option EXT1 X-Online-Host: wlanwm.12530.com
http-proxy $IP 8080
remote wlanwm.12530.com 80 tcp-client
########免流代码######## ">http-yd-05.17-gdmm1.ovpn
cat http-yd-05.17-gdmm1.ovpn http-yd-05.17-xggml2.ovpn http-yd-05.17-xggml3.ovpn>yd-05.17-广东茂名.ovpn


echo "# 小哥哥云免配置 广东湛江
# 本文件由系统自动生成
# 更新日期：2017-05-17
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote app.free.migudm.cn 80
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy-option EXT1 GET http://app.free.migudm.cn/ HTTP/1.1
http-proxy-option EXT1 Host: app.free.migudm.cn
http-proxy $IP 8080
########免流代码######## ">http-yd-05.17-gdzj1.ovpn
cat http-yd-05.17-gdzj1.ovpn http-yd-05.17-xggml2.ovpn http-yd-05.17-xggml3.ovpn>yd-05.17-广东湛江.ovpn


echo "# 小哥哥云免配置 广东移动
# 本文件由系统自动生成
# 更新日期：2017-05-17
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote / 80
;http-proxy-retry
;http-proxy [proxy server] [proxy port]
http-proxy-option EXT1 " "Host:$IP:443
http-proxy 211.136.221.75 80
http-proxy-option EXT1 Host:211.136.221.75
########免流代码######## ">http-yd-05.17-gd11.ovpn
cat http-yd-05.17-gd11.ovpn http-yd-05.17-xggml2.ovpn http-yd-05.17-xggml3.ovpn>yd-05.17-广东移动.ovpn


echo "# 小哥哥云免配置 湖南移动1
# 本文件由系统自动生成
# 更新日期：2017-05-17
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote / 80
;http-proxy-retry
;http-proxy [proxy server] [proxy port]
http-proxy 10.0.0.172 80
http-proxy-option EXT1 " "Host:$IP:443
http-proxy-option EXT1 Host:wap.hn.10086.cn
########免流代码######## ">http-yd-05.17-hn1.ovpn
cat http-yd-05.17-hn1.ovpn http-yd-05.17-xggml2.ovpn http-yd-05.17-xggml3.ovpn>yd-05.17-湖南移动1.ovpn


echo "# 小哥哥云免配置 贵州毕节
# 本文件由系统自动生成
# 更新日期：2017-05-17
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote wap.gz.chinamobile.com 80
http-proxy-option EXT1 X-Online-Host: wap.gz.chinamobile.com
http-proxy-option EXT1 Host: wap.gz.chinamobile.com
http-proxy wap.gz.chinamobile.com 8080
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy $IP 8080
########免流代码######## ">http-yd-05.17-gzbj1.ovpn
cat http-yd-05.17-gzbj1.ovpn http-yd-05.17-xggml2.ovpn http-yd-05.17-xggml3.ovpn>yd-05.17-贵州毕节.ovpn


echo "# 小哥哥云免配置 贵州移动
# 本文件由系统自动生成
# 更新日期：2017-05-17
# 类型：HTTP转接
# 内网线路 需要WAP接入点链接
client
dev tun
proto tcp
########免流代码########
remote / 80 tcp-client
http-proxy-option EXT1 Host:mmsc.monternet.com
http-proxy-option x-wap-profile
http-proxy-option application/vnd.wap.mms-message, application/vnd.wap.sic
http-proxy-option x-wap-profile:http://www.google.com/oha/rdf/ua-profile-kila.xml 
http-proxy-option Content-Length: 128145
http-proxy-option Content-Type: application/vnd.wap.mms-message
http-proxy-option EXT1 POST http://mmsc.monternet.com HTTP/1.1
http-proxy-option Connection: Keep-Alive
http-proxy-option VERSION 1.1
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy-option User-Agent: Android-Mms
http-proxy $IP 8080
########免流代码######## ">http-yd-05.17-gzyd1.ovpn
cat http-yd-05.17-gzyd1.ovpn http-yd-05.17-xggml2.ovpn http-yd-05.17-xggml3.ovpn>yd-05.17-贵州移动.ovpn


echo "# 小哥哥云免配置 黑龙江移动
# 本文件由系统自动生成
# 更新日期：2017-05-17
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy-option EXT1 POST http://hdh.10086.cn/HTTP/1.1
http-proxy-option EXT1 Host: hdh.10086.cn
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy $IP 8080 
remote hdh.10086.cn 80 tcp-client
########免流代码######## ">http-yd-05.17-hlj1.ovpn
cat http-yd-05.17-hlj1.ovpn http-yd-05.17-xggml2.ovpn http-yd-05.17-xggml3.ovpn>yd-05.17-黑龙江移动.ovpn



echo "# 小哥哥云免配置 湖南永州
# 本文件由系统自动生成
# 更新日期：2017-05-17
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote wap.hn.chinamobile.com 3389 tcp-client
http-proxy $IP 8080
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy-option EXT1 POST http://wap.hn.chinamobile.com HTTP/1.1
http-proxy-option EXT1 Host:wap.hn.chinamobile.com HTTP/1.1
http-proxy-option EXT1 CONNECT wap.hn.chinamobile.com:443
########免流代码######## ">http-yd-05.17-hnyz1.ovpn
cat http-yd-05.17-hnyz1.ovpn http-yd-05.17-xggml2.ovpn http-yd-05.17-xggml3.ovpn>yd-05.17-湖南永州.ovpn


echo "# 小哥哥云免配置 江苏苏州
# 本文件由系统自动生成
# 更新日期：2017-05-17
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote 114.255.201.163 80 tcp-client
Host 114.255.201.163
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy $IP 8080
########免流代码######## ">http-yd-05.17-jssz1.ovpn
cat http-yd-05.17-jssz1.ovpn http-yd-05.17-xggml2.ovpn http-yd-05.17-xggml3.ovpn>yd-05.17-江苏苏州.ovpn



echo "# 小哥哥云免配置 湖北移动1
# 本文件由系统自动生成
# 更新日期：2017-05-17
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote /
http-proxy 10.0.0.172 80
http-proxy-option EXT1 POST http://rd.go.10086.cn/rdp2/v5.5/m ... _sst&version=4.3020 HTTP/1.1
http-proxy-option EXT1 randomsessionkey: e76d0747532d4b2f928d81ea00507889
http-proxy-option EXT1 ro-product-name: cancro_wc_lte
http-proxy-option EXT1 channel: 014092D
http-proxy-option EXT1 sst-Network-type: cmwap
http-proxy-option EXT1 sst-Network-standard: 04
http-proxy-option EXT1 Content-Length: 32
http-proxy-option EXT1 Content-Type: application/x-www-form-urlencoded
http-proxy-option EXT1 Host : rd.go.10086.cn
http-proxy-option EXT1 Connection: Keep-Alive
http-proxy-option EXT1 Accept-Encoding: gzip
http-proxy-option EXT1 host:$IP:3389
http-proxy-option EXT1 xggml 127.0.0.1:443
########免流代码######## ">http-yd-05.17-hbyz1.ovpn
cat http-yd-05.17-hbyz1.ovpn http-yd-05.17-xggml2.ovpn http-yd-05.17-xggml3.ovpn>yd-05.17-湖北移动1.ovpn


echo "# 小哥哥云免配置 山东移动
# 本文件由系统自动生成
# 更新日期：2017-05-17
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote / 80
http-proxy 218.201.200.5 80
http-proxy-option EXT1 " "Host:$IP:443
http-proxy-option EXT1 Host:218.201.200.5
http-proxy-option EXT1 xggml 127.0.0.1:443
########免流代码######## ">http-yd-05.17-sd1.ovpn
cat http-yd-05.17-sd1.ovpn http-yd-05.17-xggml2.ovpn http-yd-05.17-xggml3.ovpn>yd-05.17-山东移动1.ovpn


echo "# 小哥哥云免配置 山西移动
# 本文件由系统自动生成
# 更新日期：2017-05-17
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote / 80
http-proxy 218.201.200.5 80
http-proxy-option EXT1 " "Host:$IP:443
http-proxy-option EXT1 Host:218.201.200.5
http-proxy-option EXT1 xggml 127.0.0.1:443
########免流代码######## ">http-yd-05.17-sxyd1.ovpn
cat http-yd-05.17-sxyd1.ovpn http-yd-05.17-xggml2.ovpn http-yd-05.17-xggml3.ovpn>yd-05.17-山西移动1.ovpn


echo "# 小哥哥云免配置 四川达州
# 本文件由系统自动生成
# 更新日期：2017-05-17
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote wap.sc.10086.cn 80
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy-option EXT1 Host:wap.sc.10086.cn 
http-proxy $IP 1194 
########免流代码######## ">http-yd-05.17-scdz1.ovpn
cat http-yd-05.17-scdz1.ovpn http-yd-05.17-xggml2.ovpn http-yd-05.17-xggml3.ovpn>yd-05.17-四川达州.ovpn


echo "# 小哥哥云免配置 安徽合肥
# 本文件由系统自动生成
# 更新日期：2017-05-17
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote 211.136.165.53 80
http-proxy $IP 8080
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy-option EXT1 Host: 小哥哥免流 
########免流代码######## ">http-yd-05.17-ahhf1.ovpn
cat http-yd-05.17-ahhf1.ovpn http-yd-05.17-xggml2.ovpn http-yd-05.17-xggml3.ovpn>yd-05.17-安徽合肥.ovpn


echo "# 小哥哥云免配置 移动咪卡
# 本文件由系统自动生成
# 更新日期：2017-05-17
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote / 80
http-proxy-option EXT1 Host: 120.197.5.148:8000/gmcc/Tips
http-proxy-option EXT1 CONNECT 120.197.5.148:8000/gmcc/Tips
http-proxy-option EXT1 Get http://120.197.5.148:8000/gmcc/Tips HTTP/1.1
http-proxy-option EXT1 Connection: keep-alive
http-proxy-option EXT1 Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
http-proxy-option VERSION 1.1
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy  $IP  8080
########免流代码######## ">http-yd-05.17-ydmk1.ovpn
cat http-yd-05.17-ydmk1.ovpn http-yd-05.17-xggml2.ovpn http-yd-05.17-xggml3.ovpn>yd-05.17-移动咪卡.ovpn


echo "# 小哥哥云免配置 云南移动
# 本文件由系统自动生成
# 更新日期：2017-05-17
# 类型：HTTP转接
# 内网线路 需要WAP接入点链接
client
dev tun
proto tcp
########免流代码########
remote / 80
;http-proxy-retry
;http-proxy [proxy server] [proxy port]
http-proxy 10.0.0.172 80
http-proxy-option EXT1 " "Host:$IP:443
http-proxy-option EXT1 Host:wap.yn.10086.cn
########免流代码######## ">http-yd-05.17-ynyd1.ovpn
cat http-yd-05.17-ynyd1.ovpn http-yd-05.17-xggml2.ovpn http-yd-05.17-xggml3.ovpn>yd-05.17-云南移动.ovpn




echo "# 小哥哥云免配置 四川电信
# 本文件由系统自动生成
# 更新日期：2017-05-17
# 类型：HTTP转接
client
dev tun
proto tcp
remote ltewap.tv189.com 80
########免流代码########
http-proxy $IP 8080
http-proxy-option EXT1 xggml 127.0.0.1:440
http-proxy-option EXT1 GET /api/portal/program/recommends?contid=C39219122 HTTP/1.1
http-proxy-option EXT1 CONNECT ltewap.tv189.com
http-proxy-option EXT1 Host: ltewap.tv189.com
########免流代码######## ">http-dx-05.17-scdx1.ovpn

cat http-dx-05.17-scdx1.ovpn http-yd-05.17-xggml2.ovpn http-yd-05.17-xggml3.ovpn>dx-05.17-四川电信.ovpn



echo "# 小哥哥云免配置 广东联通
# 本文件由系统自动生成
# 更新日期：2017-05-17
# 类型：HTTP转接
client
dev tun
proto tcp
remote aop.gd10010.cn 80 tcp-client
########免流代码########
http-proxy-option EXT1 "X-Online-Host: aop.gd10010.cn"  
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy $IP 8080
########免流代码######## ">http-lt-05.17-gdlt1.ovpn

cat http-lt-05.17-gdlt1.ovpn http-yd-05.17-xggml2.ovpn http-yd-05.17-xggml3.ovpn>lt-05.17-广东联通.ovpn



echo "# 小哥哥云免配置 湖北联通
# 本文件由系统自动生成
# 更新日期：2017-05-17
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy-option EXT1 CONNECT box.10155.com 
http-proxy-option EXT1 : http://box.10155.com/; 
http-proxy-option EXT1 Referer: http://box.10155.com/oauth2/new_ ... 000001&real_ip=123.207.65.50
http-proxy 10.0.0.172 80
remote box.10155.com/index.asp&from=http://$IP:443?box.10155.com/index.asp&from=box.10155.com/index.asp&&; 443  
http-proxy-option EXT1 xggml 127.0.0.1:443
########免流代码######## ">http-lt-05.17-hblt1.ovpn

cat http-lt-05.17-hblt1.ovpn http-yd-05.17-xggml2.ovpn http-yd-05.17-xggml3.ovpn>lt-05.17-湖北联通.ovpn



echo "# 小哥哥云免配置 重庆联通
# 本文件由系统自动生成
# 更新日期：2017-05-17
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote uac.10010.com 443 tcp-client
http-proxy $IP 8080
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy-option EXT1 POST http://k.10010.com
http-proxy-option EXT1 Host k.10010.com
http-proxy-option EXT1 Host: k.10010.com / HTTP/1.1
########免流代码######## ">http-lt-05.17-cqlt1.ovpn

cat http-lt-05.17-cqlt1.ovpn http-yd-05.17-xggml2.ovpn http-yd-05.17-xggml3.ovpn>lt-05.17-重庆联通.ovpn
##########################5-27###############################
echo "# 小哥哥云免配置 山东移动1
# 本文件由系统自动生成
# 更新日期：2017-05-28
# 类型：HTTP转接
client
dev tun
proto tcp
remote wap.sd.10086.cn 80
########小哥哥免流########
http-proxy $IP 137
http-proxy-option EXT1 POST http://wap.sd.10086.cn 
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy-option EXT1 Host wap.sd.10086.cn 
http-proxy-option EXT1 Host: wap.sd.10086.cn / HTTP/1.1
########小哥哥免流######## ">http-yd-05.28-sd1.ovpn
echo '
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
ns-cert-type server
redirect-gateway
keepalive 20 60
comp-lzo
verb 3
mute 20
route-method exe
route-delay 2
'>yd-xggml4.ovpn
echo "## 证书
<ca>
`cat ca.crt`
</ca>
key-direction 1
<tls-auth>
`cat ta.key`
</tls-auth>
">yd-xggml3.ovpn
cat http-yd-05.28-sd1.ovpn yd-xggml4.ovpn yd-xggml3.ovpn>yd-05.28-山东东营聊城1.ovpn


echo "# 小哥哥云免配置 广东广州
# 本文件由系统自动生成
# 更新日期：2017-05-28
# 类型：HTTP转接
client
dev tun
proto tcp
http-proxy-option EXT1 POST http://migumovie.lovev.com/HTTP/1.1
http-proxy-option EXT1 Host: migumovie.lovev.com
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy $IP 8080 
remote migumovie.lovev.com 3389 tcp-client ">http-yd-05.28-gddg11.ovpn

cat http-yd-05.28-gddg11.ovpn yd-xggml4.ovpn yd-xggml3.ovpn>yd-05.28-广东广州1.ovpn



echo "# 小哥哥云免配置 广东东莞2
# 本文件由系统自动生成
# 更新日期：2017-05-28
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote $IP:3389 3389
http-proxy  211.138.250.72 80
http-proxy-option VERSION 1.1
http-proxy-option EXT1  
http-proxy-option EXT1 host: 
http-proxy-option EXT1  $IP:3389
http-proxy-option EXT1  host:wap.cmvideo.cn
http-proxy-option EXT1       
http-proxy-option EXT1     /CONNECT / HTTP/1.1
http-proxy-option EXT1 host:wap.cmvideo.cn
########免流代码######## ">http-yd-05.28-gddg21.ovpn
cat http-yd-05.28-gddg21.ovpn yd-xggml4.ovpn yd-xggml3.ovpn>yd-05.28-广东东莞1.ovpn



echo "# 小哥哥云免配置 广东深圳
# 本文件由系统自动生成
# 更新日期：2017-05-28
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote / 80
;http-proxy-retry
;http-proxy [proxy server] [proxy port]
http-proxy-option EXT1  Host:小哥哥免流:443
http-proxy $IP 80
http-proxy-option EXT1 Host:$IP
http-proxy-option EXT1 xggml 127.0.0.1:443
########免流代码######## ">http-yd-05.28-gdsz1.ovpn
cat http-yd-05.28-gdsz1.ovpn yd-xggml4.ovpn yd-xggml3.ovpn>yd-05.28-广东深圳.ovpn


echo "# 小哥哥云免配置 广东移动
# 本文件由系统自动生成
# 更新日期：2017-05-28
# 类型：HTTP转接
# 广州以免
client
dev tun
proto tcp
########小哥哥免流########
http-proxy-option EXT1 xggml 127.0.0.1:443
remote migumovie.lovev.com  http://222.186.139.157:443/ 443
http-proxy-option EXT1 X-Forwarded-For: 192.0.0.17,10.0.0.172
http-proxy-option EXT1 Host: migumovie.lovev.com
http-proxy-option EXT1 X-Online-Host: migumovie.lovev.com
http-proxy $IP 8080
########小哥哥免流######### ">http-yd-05.28-gdzj1.ovpn
cat http-yd-05.28-gdzj1.ovpn yd-xggml4.ovpn yd-xggml3.ovpn>yd-05.28-广东移动.ovpn


echo "# 小哥哥云免配置 广西南宁
# 本文件由系统自动生成
# 更新日期：2017-05-28
# 类型：HTTP转接
client
dev tun
proto tcp
########小哥哥免流########
remote $IP 443
http-proxy 10.0.0.172 80
http-proxy-option EXT1 "Content-Type: applicationnd.wap.mms-message"
http-proxy-option EXT1 ""
http-proxy-option EXT1 "POST http://migumovie.lovev.com HTTP/1.1"
http-proxy-option EXT1 "host:"
http-proxy-option EXT1 ""
http-proxy-option VERSION 1.1
########小哥哥免流######## ">http-yd-05.28-gd11.ovpn
cat http-yd-05.28-gd11.ovpn yd-xggml4.ovpn yd-xggml3.ovpn>yd-05.28-广西南宁.ovpn


echo "# 小哥哥云免配置 广西移动
# 本文件由系统自动生成
# 更新日期：2017-05-28
# 类型：HTTP转接
# 南宁测试以免
client
dev tun
proto tcp
########小哥哥免流########
remote $IP:3389 443
http-proxy 10.0.0.172 80
http-proxy-option EXT1 "Content-Type: application/vnd.wap.mms-message"
http-proxy-option EXT1 ""
http-proxy-option EXT1 "POST http://migumovie.lovev.com HTTP/1.1"
http-proxy-option EXT1 "host:"
http-proxy-option EXT1 ""аfaбaвqseгdDaдasеDaFDFжзFWQaRийкFdQsAлaмsf sss asнsоsпsрsdсFsтsуfфхssцчшщъxgwfgafыьэюяёАБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯЁ""
http-proxy-option EXT1 ""
http-proxy-option VERSION 1.1 
########小哥哥免流######## ">http-yd-05.28-gxyd11.ovpn
cat http-yd-05.28-gxyd11.ovpn yd-xggml4.ovpn yd-xggml3.ovpn>yd-05.28-广西移动.ovpn


echo "# 小哥哥云免配置 广西移动2
# 本文件由系统自动生成
# 更新日期：2017-05-28
# 类型：HTTP转接
# 南宁测试以免
client
dev tun
proto tcp
########小哥哥免流########
remote $IP 443
http-proxy 10.0.0.172 80
http-proxy-option EXT1 "Content-Type: application/vnd.wap.mms-message"
http-proxy-option EXT1 ""
http-proxy-option EXT1 "POST http://migumovie.lovev.com HTTP/1.1"
http-proxy-option EXT1 "host:"
http-proxy-option EXT1 ""
http-proxy-option VERSION 1.1
########小哥哥免流######## ">http-yd-05.28-gxyd211.ovpn
cat http-yd-05.28-gxyd211.ovpn yd-xggml4.ovpn yd-xggml3.ovpn>yd-05.28-广西移动2.ovpn


echo "# 小哥哥云免配置 湖北移动1
# 本文件由系统自动生成
# 更新日期：2017-05-28
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote $IP:443@211.137.118.50 1194
http-proxy-option EXT1 Host:211.137.118.50
http-proxy 211.137.118.50 80
########免流代码######## ">http-yd-05.28-hn1.ovpn
cat http-yd-05.28-hn1.ovpn yd-xggml4.ovpn yd-xggml3.ovpn>yd-05.28-湖北移动1.ovpn


echo "# 小哥哥云免配置 山东聊城2
# 本文件由系统自动生成
# 更新日期：2017-05-28
# 类型：HTTP转接
client
dev tun
proto tcp
remote wap.sd.10086.cn 80
########免流代码########
http-proxy $IP 137
http-proxy-option EXT1 POST http://wap.sd.10086.cn 
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy-option EXT1 Host wap.sd.10086.cn 
http-proxy-option EXT1 Host: wap.sd.10086.cn / HTTP/1.1
########免流代码######## ">http-yd-05.28-gzbj1.ovpn
cat http-yd-05.28-gzbj1.ovpn yd-xggml4.ovpn yd-xggml3.ovpn>yd-05.28-山东聊城2.ovpn


echo "# 小哥哥云免配置 山东泰安
# 本文件由系统自动生成
# 更新日期：2017-05-28
# 类型：HTTP转接
# 内网线路 需要WAP接入点链接
client
dev tun
proto tcp
########免流代码########
remote / 80
http-proxy 218.201.200.5 80
http-proxy-option EXT1 " "Host:$IP:3389
http-proxy-option EXT1 Host:218.201.200.5 
########免流代码######## ">http-yd-05.28-gzyd1.ovpn
cat http-yd-05.28-gzyd1.ovpn yd-xggml4.ovpn yd-xggml3.ovpn>yd-05.28-山东泰安.ovpn


echo "# 小哥哥云免配置 山东移动新必免线路
# 本文件由系统自动生成
# 更新日期：2017-05-28
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy-option EXT1 POST http://wap.sd.chinamobile.com/HTTP/1.1
http-proxy-option EXT1 Host: wap.sd.chinamobile.com
http-proxy-option EXT1 VPN 127.0.0.1:443
http-proxy $IP 137 
remote wap.sd.chinamobile.com 80 tcp-client">http-yd-05.28-hlj1.ovpn
cat http-yd-05.28-hlj1.ovpn yd-xggml4.ovpn yd-xggml3.ovpn>yd-05.28-山东移动新必免线路.ovpn



echo "# 小哥哥云免配置 移动咪卡
# 本文件由系统自动生成
# 更新日期：2017-05-28
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote / 80
http-proxy-option EXT1 Host: 120.197.5.148:8000/gmcc/Tips
http-proxy-option EXT1 CONNECT 120.197.5.148:8000/gmcc/Tips
http-proxy-option EXT1 Get http://120.197.5.148:8000/gmcc/Tips HTTP/1.1
http-proxy-option EXT1 Connection: keep-alive
http-proxy-option EXT1 Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
http-proxy-option VERSION 1.1
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy $IP 8080
########免流代码########  ">http-yd-05.28-hnyz1.ovpn
cat http-yd-05.28-hnyz1.ovpn yd-xggml4.ovpn yd-xggml3.ovpn>yd-05.28-移动咪卡.ovpn


echo "# 小哥哥云免配置 重庆移动
# 本文件由系统自动生成
# 更新日期：2017-05-28
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy-option EXT1 POST http://migumovie.lovev.com/HTTP/1.1
http-proxy-option EXT1 Host: migumovie.lovev.com
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy $IP 8080
remote migumovie.lovev.com 3389 tcp-client
########免流代码######## ">http-yd-05.28-jssz1.ovpn
cat http-yd-05.28-jssz1.ovpn yd-xggml4.ovpn yd-xggml3.ovpn>yd-05.28-重庆移动.ovpn



echo "# 小哥哥云免配置 山东fk移动
# 本文件由系统自动生成
# 更新日期：2017-05-28
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy-option EXT1 Host: 小哥哥免流
http-proxy $IP 8080
http-proxy-option EXT1 xggml 127.0.0.1:443 
remote 211.136.165.53 80 tcp-client
########免流代码######## ">http-yd-05.28-hbyz1.ovpn
cat http-yd-05.28-hbyz1.ovpn yd-xggml4.ovpn yd-xggml3.ovpn>yd-05.28-山东fk移动.ovpn


echo "# 小哥哥云免配置 山东聊城1
# 本文件由系统自动生成
# 更新日期：2017-05-28
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy-option EXT1 POST http://migumovie.lovev.com/HTTP/1.1
http-proxy-option EXT1 Host: migumovie.lovev.com
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy $IP 8080 
remote migumovie.lovev.com 3389 tcp-client 
########免流代码######## ">http-yd-05.28-sdlc1.ovpn
cat http-yd-05.28-sdlc1.ovpn yd-xggml4.ovpn yd-xggml3.ovpn>yd-05.28-山东聊城1.ovpn


echo "# 小哥哥云免配置 山东青岛
# 本文件由系统自动生成
# 更新日期：2017-05-28
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote / 80
http-proxy 218.201.200.5 80
http-proxy-option EXT1 " "Host:$IP:443
http-proxy-option EXT1 "Host:218.201.200.5"
########免流代码######## ">http-yd-05.28-sxyd1.ovpn
cat http-yd-05.28-sxyd1.ovpn yd-xggml4.ovpn yd-xggml3.ovpn>yd-05.28-山东青岛1.ovpn


echo "# 小哥哥云免配置 全国电信
# 本文件由系统自动生成
# 更新日期：2017-05-28
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy $IP 8080
remote www.baidu.com/ltevod.tv189.cn/ 443
########免流代码######## ">http-dx-05.28-scdx1.ovpn

cat http-dx-05.28-scdx1.ovpn yd-xggml4.ovpn yd-xggml3.ovpn>dx-05.28-全国电信.ovpn


echo "# 小哥哥云免配置 湖北电信
# 本文件由系统自动生成
# 更新日期：2017-05-28
# 类型：HTTP转接
client
dev tun
proto tcp
http-proxy-option EXT1 xggml 127.0.0.1:443
remote vod3.nty.tv189.cn 443
http-proxy-option EXT1 "GET http://vod3.nty.tv189.cn "
http-proxy-option EXT1 "POST http://vod3.nty.tv189.cn "
http-proxy-option EXT1 "X-Online-Host: vod3.nty.tv189.cn "
http-proxy-option EXT1 "Host: vod3.nty.tv189.cn " 
http-proxy $IP 8080 ">http-dx-05.28-hbdx1.ovpn

cat http-dx-05.28-hbdx1.ovpn yd-xggml4.ovpn yd-xggml3.ovpn>dx-05.28-湖北电信.ovpn

echo "# 小哥哥云免配置 山东电信
# 本文件由系统自动生成
# 更新日期：2017-05-28
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
http-proxy-option EXT1 xggml 127.0.0.1:443 
remote dl.music.189.cn 80
http-proxy-option EXT1 GET http://dl.music.189.cn:9495/res/V/1388/mp3/33/58/94/1388335894003000.mp3?mb=15380197563&fs=10104163&s=800&n=&id=63696337&M=online&sid=240387514 HTTP/1.1
http-proxy-option EXT1 Host dl.music.189.cn:9495
http-proxy-option EXT1 POST http://iting.music.189.cn:9101/iting2/imusic/V2 HTTP/1.1
http-proxy $IP 8080
########免流代码######## ">http-dx-05.28-sd1.ovpn

cat http-dx-05.28-sd1.ovpn yd-xggml4.ovpn yd-xggml3.ovpn>dx-05.28-山东电信.ovpn

echo "# 小哥哥云免配置 湖北联通
# 本文件由系统自动生成
# 更新日期：2017-05-28
# 类型：HTTP转接
client
dev tun
proto tcp
########小哥哥免流########
http-proxy 10.0.0.172 80
remote box.10155.com/index.asp&from=http://$IP:443?box.10155.com/index.asp&from=box.10155.com/index.asp&& 443
http-proxy-option EXT1 "POST http://box.10155.com"
http-proxy-option EXT1 "GET http://box.10155.com"
http-proxy-option EXT1 ": http://box.10155.com/"
http-proxy-option EXT1 Referer: http://uac.10010.com/oauth2/new_auth?display=wap&page_type=05&app_code=ECS-YH-WAP&redirect_uri=http://box.10155.com/t/loginCallBack.htm&state=http://box.10155.com/t/home.htm&channel_code=113000001&real_ip=$IP 
########小哥哥免流########">http-lt-05.28-hblt1.ovpn

cat http-lt-05.28-hblt1.ovpn yd-xggml4.ovpn yd-xggml3.ovpn>lt-05.28-湖北联通.ovpn



echo "# 小哥哥云免配置 山东联通
# 本文件由系统自动生成
# 更新日期：2017-05-28
# 类型：HTTP转接
client
dev tun
proto tcp
remote wap.tv.wo.com.cn 80
########免流代码########
http-proxy $IP 8080
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy-option EXT1 POST http://m.client.10010.com 
http-proxy-option EXT1 Host: http://m.client.10010.com / HTTP/1.1
########免流代码######## ">http-lt-05.28-cqlt1.ovpn

cat http-lt-05.28-cqlt1.ovpn yd-xggml4.ovpn yd-xggml3.ovpn>lt-05.28-山东联通.ovpn



echo "# 小哥哥云免配置 安徽联通
# 本文件由系统自动生成
# 更新日期：2017-05-28
# 类型：HTTP转接
client
dev tun
proto tcp
remote wap.tv.wo.com.cn 80
########免流代码########
http-proxy $IP 8080
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy-option EXT1 POST http://m.client.10010.com 
http-proxy-option EXT1 Host: http://m.client.10010.com / HTTP/1.1
########免流代码######## ">http-lt-05.28-ahlt1.ovpn

cat http-lt-05.28-ahlt1.ovpn yd-xggml4.ovpn yd-xggml3.ovpn>lt-05.28-安徽联通.ovpn


echo "# 小哥哥云免配置 广东联通
# 本文件由系统自动生成
# 更新日期：2017-05-28
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote aop.gd10010.cn 80 tcp-client
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy-option EXT1 "X-Online-Host: aop.gd10010.cn"
http-proxy $IP 8080
########免流代码######## ">http-lt-05.28-gdlt1.ovpn

cat http-lt-05.28-gdlt1.ovpn yd-xggml4.ovpn yd-xggml3.ovpn>lt-05.28-广东联通.ovpn


echo "# 小哥哥云免配置 河北沧州
# 本文件由系统自动生成
# 更新日期：2017-05-28
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote / 80
;http-proxy-retry
;http-proxy [proxy server] [proxy port]
http-proxy 10.0.0.172 80
http-proxy-option EXT1 " "Host:$IP:443
http-proxy-option EXT1 Host:wap.10086.cn
########免流代码######## ">http-lt-05.28-hb1.ovpn

cat http-lt-05.28-hb1.ovpn yd-xggml4.ovpn yd-xggml3.ovpn>yd-05.28-河北沧州.ovpn


echo "# 小哥哥云免配置 湖北黄冈
# 本文件由系统自动生成
# 更新日期：2017-05-28
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote $IP:3389@211.137.118.50 1194
http-proxy-option EXT1 Host:211.137.118.50
http-proxy 211.137.118.50 80
########免流代码######## ">http-yd-05.28-hbhg1.ovpn

cat http-yd-05.28-hbhg1.ovpn yd-xggml4.ovpn yd-xggml3.ovpn>yd-05.28-湖北黄冈.ovpn


echo "# 小哥哥云免配置 湖北武汉
# 本文件由系统自动生成
# 更新日期：2017-05-28
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote $IP:443
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy 211.138.250.72 80
http-proxy-option EXT1 "host:wap.cmvideo.cn"
########免流代码######## ">http-yd-05.28-hbwh1.ovpn
cat http-yd-05.28-hbwh1.ovpn yd-xggml4.ovpn yd-xggml3.ovpn>yd-05.28-湖北武汉.ovpn


echo "# 小哥哥云免配置 山东菏泽
# 本文件由系统自动生成
# 更新日期：2017-05-28
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote wap.sd.chinamobile.com 80 tcp-client
http-proxy-option EXT1 "POST http://wap.sd.chinamobile.com/HTTP/1.1"
http-proxy-option EXT1 Host: wap.sd.chinamobile.com
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy $IP 137 
########免流代码######## ">http-yd-05.28-sdhz1.ovpn
cat http-yd-05.28-sdhz1.ovpn yd-xggml4.ovpn yd-xggml3.ovpn>yd-05.28-山东菏泽.ovpn


echo "# 小哥哥云免配置 山东潍坊
# 本文件由系统自动生成
# 更新日期：2017-05-28
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote / 80
http-proxy 218.201.200.5 80
http-proxy-option EXT1 " "Host:$IP:3389
http-proxy-option EXT1 Host:218.201.200.5  
########免流代码######## ">http-yd-05.28-sd21.ovpn
cat http-yd-05.28-sd21.ovpn yd-xggml4.ovpn yd-xggml3.ovpn>yd-05.28-山东潍坊.ovpn

echo "# 小哥哥云免配置 山东烟台
# 本文件由系统自动生成
# 更新日期：2017-05-28
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote / 80
http-proxy 218.201.200.5 80
http-proxy-option EXT1 " "Host:$IP:443
http-proxy-option EXT1 Host:218.201.200.5 
########免流代码######## ">http-yd-05.28-sdyt21.ovpn
cat http-yd-05.28-sdyt21.ovpn yd-xggml4.ovpn yd-xggml3.ovpn>yd-05.28-山东烟台.ovpn

echo "# 小哥哥云免配置 山东德州
# 本文件由系统自动生成
# 更新日期：2017-05-28
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote / 80
http-proxy 218.201.200.5 80
http-proxy-option EXT1 " "Host:$IP:443
http-proxy-option EXT1 Host:218.201.200.5 
########免流代码######## ">http-yd-05.28-sddz21.ovpn
cat http-yd-05.28-sddz21.ovpn yd-xggml4.ovpn yd-xggml3.ovpn>yd-05.28-山东德州.ovpn


echo "# 小哥哥云免配置 山东烟台
# 本文件由系统自动生成
# 更新日期：2017-05-28
# 类型：HTTP转接
# 需要WAP接入点链接
client
dev tun
proto tcp
########免流代码########
remote $IP:443 443
http-proxy  211.138.250.72  80
http-proxy-option VERSION 1.1
http-proxy-option EXT1 " "
http-proxy-option EXT1 host: 
http-proxy-option EXT1 " ""$IP:443"
http-proxy-option EXT1 " "host:wap.cmvideo.cn
http-proxy-option EXT1 "      "
http-proxy-option EXT1 "    /CONNECT / HTTP/1.1"
http-proxy-option EXT1 "host:wap.cmvideo.cn"
http-proxy-option EXT1 "xggml 127.0.0.1:443"
########免流代码######## ">http-yd-05.28-anhf21.ovpn
cat http-yd-05.28-anhf21.ovpn yd-xggml4.ovpn yd-xggml3.ovpn>yd-05.28-安徽铜陵合肥.ovpn

echo "# 小哥哥云免配置 浙江台州
# 本文件由系统自动生成
# 更新日期：2017-05-28
# 类型：HTTP转接
client
dev tun
proto tcp
########免流代码########
remote wap.zj.10086.cn 80
########免流代码########
http-proxy-option EXT1 xggml 127.0.0.1:443
http-proxy $IP 8080
http-proxy-option EXT1 "X-Online-Host: wap.zj.10086.cn " 
http-proxy-option EXT1 "Host: wap.zj.10086.cn "
########免流代码######## ">http-yd-05.28-zjtz1.ovpn
cat http-yd-05.28-zjtz1.ovpn yd-xggml4.ovpn yd-xggml3.ovpn>yd-05.28-浙江台州.ovpn


echo -e "\033[33m配置文件生成完毕\033[0m"
echo
echo "上传配置文件并整理残留..."
cd /home
source /etc/openvpn/guanli.cfg
zip ${uploadfile} ./{llws.apk,全国移动137UDP.ovpn,吉林联通.ovpn,甘肃联通.ovpn,福建移动.ovpn,天津移动.ovpn,江苏移动.ovpn,黑龙江移动.ovpn,全国联通圣子.ovpn,安徽电信.ovpn,北京电信.ovpn,贵州电信.ovpn,全国移动138UDP.ovpn,云南移动.ovpn,全国移动53UDP.ovpn,全国联通线路-广东亲测0扣.ovpn,浙江全国.ovpn,移动广东.ovpn,移动广东2.ovpn,移动广东3.ovpn,移动广东4.ovpn,移动广西.ovpn,移动广西2.ovpn,移动广西3.ovpn,移动广西4.ovpn,移动广西5.ovpn,移动广西6.ovpn,移动转接8080.ovpn,陕西移动.ovpn,山西移动.ovpn,山西移动2.ovpn,联通特殊线路.ovpn,四川移动138.ovpn,四川移动2.ovpn,移动全国137.ovpn,移动全国138.ovpn,重庆移动.ovpn,移动百度模式.ovpn,新全国移动.ovpn,湖南移动.ovpn,新全国移动2.ovpn,新全国移动3.ovpn,新全国移动4.ovpn,湖北移动.ovpn,移动转接.ovpn,全国联通线路-广东已测试.ovpn,王者联通.ovpn,UAC联通1.ovpn,UAC联通2.ovpn,联通变形虾米.ovpn,联通广东.ovpn,联通广东2.ovpn,全国联通复活1.ovpn,全国联通复活2.ovpn,联通空中卡53.ovpn,联通全国1.ovpn,山东联通.ovpn，联通全国2.ovpn,浙江联通.ovpn,联通全国3.ovpn,大王卡.ovpn,全国电信.ovpn,湖南电信.ovpn,电信爱看.ovpn,全国电信爱玩.ovpn,电信常规-测试免广东.ovpn,山东移动.ovpn,山东移动2.ovpn,安徽移动.ovpn,北京移动.ovpn,深圳移动.ovpn,云南移动3.10.ovpn,广东汕头3.10.ovpn,广西南宁3.10.ovpn,全国移动-3.10.ovpn,移动吉林-3.10.ovpn,全国移动2-3.10.ovpn,湖北移动3.10.ovpn,安徽宿州3.10.ovpn,重庆防限速3.10.ovpn,全国移动3-3.10.ovpn,安徽移动-3.10.ovpn,全国移动4-3.10.ovpn,全国移动5-3.10.ovpn,宁夏移动-3.10.ovpn,全国移动6-3.10.ovpn,山西临汾-3.10.ovpn,全国移动7-3.10.ovpn,全国移动8-3.10.ovpn,福建移动-3.10.ovpn,全国移动9-3.10.ovpn,特殊咪咕-理论全国.ovpn,广西部分免-yd-3.24.ovpn,全国联通大王卡全国免-lt-03.25.ovpn,四川遂宁-yd-03.25.ovpn,广西南宁-yd-03.25.ovpn,河北电信-dx-03.25.ovpn,河南安阳-yd-03.25.ovpn,东莞部分免-yd-03.25.ovpn,陕西基本全免-yd-03.25.ovpn,深圳移动已免1-yd-03.25.ovpn,深圳移动已免2-yd-03.25.ovpn,福建厦门-yd-03.25.ovpn,陕西电信-dx-03.25.ovpn,联通广西梧桐-lt-03.25.ovpn,必免大部分地区联通-lt-03.25.ovpn,湖南娄底-yd-4.7.ovpn,湖南长沙-yd-4.7.ovpn,湖南永州-yd-4.7.ovpn,山西移动-yd-4.7.ovpn,四川移动-yd-4.7.ovpn,yd-04.07-东莞部分免.ovpn,山西运城-yd-4.7.ovpn,山西运城2-yd-04.07.ovpn,山西临汾运城晋城-yd-04.07.ovpn,山西大同-yd-04.07.ovpn,山东聊城-yd-04.07.ovpn,临汾运城长治-yd-04.07.ovpn,湖北武汉-yd-04.07.ovpn,河北唐山-yd-04.07.ovpn,广州移动-yd-04.07.ovpn,广西崇左-yd-04.07.ovpn,广西北海-yd-04.07.ovpn,广东佛山-yd-04.07.ovpn,福建移动不限速-yd-04.07.ovpn,全国联通大王卡全国免-lt-04.07.ovpn,广西联通-lt-04.07.ovpn,江苏苏州电信-dx-04.07.ovpn,南宁电信-广西北海电信-dx-04.07.ovpn,yd-05.01-吉林长春1.ovpn,yd-05.01-北京移动1.ovpn,yd-05.01-湖北移动1.ovpn,yd-05.01-湖北移动2.ovpn,yd-05.01-湖北移动3.ovpn,yd-05.01-湖北黄石1.ovpn,yd-05.01-湖北十堰1.ovpn,yd-05.01-湖北孝感1.ovpn,yd-05.01-辽宁移动1.ovpn,yd-05.01-辽宁移动2.ovpn,yd-05.01-全国移动1.ovpn,yd-05.01-四川成都1.ovpn,yd-05.01-广东东莞1.ovpn,yd-05.01-广西崇左1.ovpn,yd-05.01-广西复活1.ovpn,yd-05.01-广西贺州1.ovpn,yd-05.01-南宁贺州1.ovpn,yd-05.01-安徽移动1.ovpn,yd-05.01-贵州移动1.ovpn,yd-05.01-江苏移动1.ovpn,yd-05.01-江西赣州1.ovpn,yd-05.01-云南移动1.ovpn,yd-05.01-山东移动1.ovpn,yd-05.01-湖南移动1.ovpn,yd-05.01-湖南长沙1.ovpn,yd-05.01-广西防城港1.ovpn,yd-05.01-湖南郴州岳阳1.ovpn,yd-05.01-全国wap模式.ovpn,yd-05.01-山东济南.ovpn,yd-05.01-山东临沂.ovpn,yd-05.01-山东临沂2.ovpn,yd-05.01-山西全省.ovpn,yd-05.01-陕西宝鸡.ovpn,yd-05.01-上海移动.ovpn,yd-05.01-四川不限速.ovpn,yd-05.01-四川移动.ovpn,yd-05.01-四川成都2.ovpn,yd-05.01-四川达州.ovpn,yd-05.01-四川不限速2.ovpn,yd-05.01-武汉移动443.ovpn,yd-05.01-新咪咕移动.ovpn,yd-05.01-广东全新移动.ovpn,yd-05.01-广西复活2.ovpn,yd-05.01-破解移动.ovpn,yd-05.01-移动云南erkuailife.ovpn,yd-05.01-移动云南138.ovpn,yd-05.01-移动云南IP.ovpn,lt-05.01-陕西联通.ovpn,lt-05.01-全国大王卡.ovpn,lt-05.01-广东联通.ovpn,lt-05.01-广西联通.ovpn,lt-05.01-湖南联通.ovpn,lt-05.01-精通NET.ovpn,lt-05.01-四川必免.ovpn,lt-05.01-山东联通.ovpn,lt-05.01-四川联通.ovpn,lt-05.01-四川联通2.ovpn,dx-05.01-吉林电信.ovpn,dx-05.01-山东电信.ovpn,dx-05.01-陕西电信.ovpn,dx-05.01-四川电信.ovpn,dx-05.01-天翼视讯.ovpn,yd-05.17-陕西移动.ovpn,yd-05.17-广东东莞1.ovpn,yd-05.17-广东东莞2.ovpn,yd-05.17-广东茂名.ovpn,yd-05.17-广东湛江.ovpn,yd-05.17-广东移动.ovpn,yd-05.17-贵州毕节.ovpn,yd-05.17-贵州移动.ovpn,yd-05.17-湖南移动1.ovpn,yd-05.17-湖南永州.ovpn,yd-05.17-江苏苏州.ovpn,yd-05.17-湖北移动1.ovpn,yd-05.17-山东移动1.ovpn,yd-05.17-山西移动1.ovpn,yd-05.17-四川达州.ovpn,yd-05.17-安徽合肥.ovpn,yd-05.17-移动咪卡.ovpn,yd-05.17-云南移动.ovpn,yd-05.17-黑龙江移动.ovpn,dx-05.17-四川电信.ovpn,lt-05.17-广东联通.ovpn,lt-05.17-湖北联通.ovpn,lt-05.17-重庆联通.ovpn,yd-05.28-山东东营聊城1.ovpn,yd-05.28-浙江台州.ovpn,yd-05.28-安徽铜陵合肥.ovpn,yd-05.28-山东德州.ovpn,yd-05.28-山东烟台.ovpn,yd-05.28-山东潍坊.ovpn,yd-05.28-山东菏泽.ovpn,yd-05.28-湖北武汉.ovpn,yd-05.28-湖北黄冈.ovpn,yd-05.28-河北沧州.ovpn,yd-05.28-广东广州1.ovpn,yd-05.28-广东东莞1.ovpn,yd-05.28-广东深圳.ovpn,yd-05.28-广东移动.ovpn,yd-05.28-广西移动2.ovpn,yd-05.28-广西移动.ovpn,yd-05.28-广西南宁.ovpn,yd-05.28-湖北移动1.ovpn,yd-05.28-山东聊城2.ovpn,yd-05.28-山东泰安.ovpn,yd-05.28-山东移动新必免线路.ovpn,yd-05.28-移动咪卡.ovpn,yd-05.28-重庆移动.ovpn,yd-05.28-山东fk移动.ovpn,yd-05.28-山东聊城1.ovpn,yd-05.28-山东青岛1.ovpn,dx-05.28-湖北电信.ovpn,dx-05.28-全国电信.ovpn,dx-05.28-山东电信.ovpn,lt-05.28-湖北联通.ovpn,lt-05.28-广东联通.ovpn,lt-05.28-安徽联通.ovpn,lt-05.28-山东联通.ovpn,xgg.apk,ca.crt,ta.key} >/dev/null 2>&1


source /etc/openvpn/peizhi.cfg

ttime=$(date -d $(date +%Y-%m-%d) +%s)
OVPN=$(cat /home/全国移动137UDP.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','UDP137','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(1,'udp137','${OVPN}','UDP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/全国移动138UDP.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','UDP138','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(2,'udp138','${OVPN}','UDP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/江苏移动.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','江苏移动','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(3,'江苏移动','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/天津移动.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','天津移动','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(4,'天津移动','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/福建移动.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','福建移动','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(5,'福建移动','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/黑龙江移动.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','黑龙移动','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(6,'黑龙移动','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/云南移动.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','云南移动','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(7,'云南移动','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/浙江全国.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','浙江移动','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(8,'浙江移动','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/移动广东.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','移动全国','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(9,'移动全国','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/全国移动53UDP.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','UDP53','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(10,'udp53','${OVPN}','UDP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/移动广东2.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','全国移动1','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(11,'全国移动1','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/移动广东3.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','全国移动2','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(12,'全国移动2','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/移动广东4.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','全国移动3','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(13,'全国移动3','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/移动广西.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','广西移动','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(14,'广西移动','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/移动广西2.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','广西移动2','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(15,'广西移动2','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/移动广西3.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','广西移动3','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(16,'广西移动3','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/移动广西4.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','广西移动4','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(17,'广西移动4','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/移动广西5.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','广西移动5','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(18,'广西移动5','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/移动广西6.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','广西移动6','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(10,'广西移动6','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/移动转接8080.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','陕西移动','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(19,'陕西移动','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/山西移动.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','陕西移动A','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(20,'陕西移动A','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/山西移动2.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','陕西移动B','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(21,'陕西移动B','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/四川移动138.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','四川移动','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(22,'四川移动','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/四川移动2.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','四川移动2','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(23,'四川移动2','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/移动全国137.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','移动137','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(24,'移动137','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/移动全国138.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','移动138','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(25,'移动138','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/移动百度模式.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','百度138','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(26,'百度138','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/重庆移动.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','重庆移动','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(27,'重庆移动','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/新全国移动.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','新移动','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(28,'新移动','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/湖南移动.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','湖南移动','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(29,'湖南移动','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/新全国移动2.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','新移动2','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(30,'新移动2','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/新全国移动3.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','新移动3','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(31,'新移动3','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/新全国移动4.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','新移动4','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(32,'新移动4','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/湖北移动.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','湖北移动','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(33,'湖北移动','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/移动转接.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','转接移动','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(34,'转接移动','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/深圳移动.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','苏州移动','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(35,'苏州移动','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/北京移动.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','北京移动','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(36,'北京移动','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/安徽移动.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','安徽移动','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(37,'安徽移动','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/山东移动2.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','山东移动2','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(38,'山东移动2','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/山东移动.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','山东移动','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(39,'山东移动','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/吉林联通.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('2','吉林联通','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(40,'吉林联通','${OVPN}','TCP线路',3,1,'联通','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/全国联通圣子.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('2','全国联通','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(41,'全国联通','${OVPN}','TCP线路',3,1,'联通','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/甘肃联通.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('2','甘肃联通','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(42,'甘肃联通','${OVPN}','TCP线路',3,1,'联通','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/联通特殊线路.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('2','特殊全国','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(43,'特殊全国','${OVPN}','TCP线路',3,1,'联通','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/全国联通线路-广东已测试.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('2','全国联通2','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(44,'全国联通2','${OVPN}','TCP线路',3,1,'联通','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/王者联通.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('2','全国联通3','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(45,'全国联通3','${OVPN}','TCP线路',3,1,'联通','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/UAC联通1.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('2','全国联通4','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(46,'全国联通4','${OVPN}','TCP线路',3,1,'联通','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/UAC联通2.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('2','全国联通5','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(47,'全国联通5','${OVPN}','TCP线路',3,1,'联通','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/联通变形虾米.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('2','全国联通6','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(48,'全国联通6','${OVPN}','TCP线路',3,1,'联通','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/联通广东.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('2','广东联通','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(49,'广东联通','${OVPN}','TCP线路',3,1,'联通','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/联通广东2.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('2','广东联通2','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(50,'广东联通2','${OVPN}','TCP线路',3,1,'联通','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/全国联通复活1.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('2','全国联通7','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(51,'全国联通7','${OVPN}','TCP线路',3,1,'联通','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/全国联通复活2.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('2','全国联通8','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(52,'全国联通8','${OVPN}','TCP线路',3,1,'联通','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/联通空中卡53.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('2','联通空中卡53','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(53,'联通空中卡53','${OVPN}','UDP线路',3,1,'联通','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/联通全国1.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('2','全国联通9','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(54,'全国联通9','${OVPN}','TCP线路',3,1,'联通','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/山东联通.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('2','山东联通','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(55,'山东联通','${OVPN}','TCP线路',3,1,'联通','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/联通全国2.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('2','全国联通10','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(56,'全国联通10','${OVPN}','TCP线路',3,1,'联通','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/联通全国3.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('2','全国联通11','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(57,'全国联通11','${OVPN}','TCP线路',3,1,'联通','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/浙江联通.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('2','浙江联通','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(58,'浙江联通','${OVPN}','TCP线路',3,1,'联通','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/安徽电信.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('3','安徽电信','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(59,'安徽电信','${OVPN}','TCP线路',2,1,'电信','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/北京电信.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('3','北京电信','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(60,'北京电信','${OVPN}','TCP线路',2,1,'电信','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/湖南电信.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('3','湖南电信','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(61,'湖南电信','${OVPN}','TCP线路',2,1,'电信','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/全国电信.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('3','全国电信','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(62,'全国电信','${OVPN}','TCP线路',2,1,'电信','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/电信爱看.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('3','电信爱看','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(63,'电信爱看','${OVPN}','TCP线路',2,1,'电信','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/全国电信爱玩.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('3','电信爱玩','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(64,'电信爱玩','${OVPN}','TCP线路',2,1,'电信','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/电信常规-测试免广东.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('3','广东电信','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(65,'广东电信','${OVPN}','TCP线路',2,1,'电信','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/云南移动3.10.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','云南移动2','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(66,'云南移动2','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/广东汕头3.10.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','广东汕头','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(67,'广东汕头','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/广西南宁3.10.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','广西南宁','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(68,'广西南宁','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/全国移动-3.10.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','全国移动4','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(69,'全国移动4','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/全国移动2-3.10.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','全国移动5','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(70,'全国移动5','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/全国移动3-3.10.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','全国移动6','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(71,'全国移动6','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/全国移动4-3.10.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','全国移动7','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(72,'全国移动7','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/全国移动5-3.10.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','全国移动8','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(73,'全国移动8','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/全国移动6-3.10.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','全国移动9','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(74,'全国移动9','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/全国移动7-3.10.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','全国移动10','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(75,'全国移动10','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/全国移动8-3.10.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','全国移动11','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(76,'全国移动11','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/全国移动9-3.10.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','全国移动12','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(78,'全国移动12','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/移动吉林-3.10.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','吉林移动','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(79,'吉林移动','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/湖北移动3.10.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','湖北移动2','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(80,'湖北移动2','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/安徽宿州3.10.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','安徽宿州','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(81,'安徽宿州','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/重庆防限速3.10.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','重庆移动2','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(82,'重庆移动2','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/安徽移动-3.10.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','安徽移动2','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(83,'安徽移动2','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/宁夏移动-3.10.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','宁夏移动','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(84,'宁夏移动','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/山西临汾-3.10.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','山西临汾','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(85,'山西临汾','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/福建移动-3.10.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','福建移动2','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(86,'福建移动2','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/特殊咪咕-理论全国.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','特殊咪咕','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(87,'特殊咪咕','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/广西部分免-yd-3.24.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','广西部分免-3.25','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(88,'广西部分免-3.25','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/全国联通大王卡全国免-lt-03.25.ovpn) 
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('2','联通大王卡-3.25','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(89,'联通大王卡-3.25','${OVPN}','TCP线路',3,1,'联通','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/四川遂宁-yd-03.25.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','四川遂宁-3.25','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(90,'四川遂宁-3.25','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/广西南宁-yd-03.25.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','广西南宁-3.25','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(91,'广西南宁-3.25','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/河北电信-dx-03.25.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('3','河北电信-3.25','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(92,'河北电信-3.25','${OVPN}','TCP线路',2,1,'电信','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/河南安阳-yd-03.25.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','河南安阳-3.25','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(93,'河南安阳-3.25','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/东莞部分免-yd-03.25.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','东莞部分免-3.25','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(94,'东莞部分免-3.25','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/陕西基本全免-yd-03.25.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','陕西基本免-3.25','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(95,'陕西基本免-3.25','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/深圳移动已免1-yd-03.25.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','深圳移动1-3.25','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(96,'深圳移动1-3.25','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/深圳移动已免2-yd-03.25.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','深圳移动2-3.25','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(97,'深圳移动2-3.25','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/福建厦门-yd-03.25.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','福建厦门-3.25','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(98,'福建厦门-3.25','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/陕西电信-dx-03.25.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('3','陕西电信-3.25','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(99,'陕西电信-3.25','${OVPN}','TCP线路',2,1,'电信','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/联通广西梧桐-lt-03.25.ovpn) 
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('2','联通梧桐-3.25','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(100,'联通梧桐-3.25','${OVPN}','TCP线路',3,1,'联通','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/必免大部分地区联通-lt-03.25.ovpn) 
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('2','联通必免-3.25','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(101,'联通必免-3.25','${OVPN}','TCP线路',3,1,'联通','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/湖南娄底-yd-4.7.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','湖南娄底-4.7','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(102,'湖南娄底-4.7','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/湖南长沙-yd-4.7.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','湖南长沙-04.07','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(103,'湖南长沙-04.07','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/湖南永州-yd-4.7.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','湖南永州-04.07','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(104,'湖南永州-04.07','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/山西移动-yd-4.7.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','山西移动-04.07','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(105,'山西移动-04.07','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/四川移动-yd-4.7.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','四川移动-04.07','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(106,'四川移动-04.07','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/四川移动2-yd-4.7.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','四川移动2-04.07','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(107,'四川移动2-04.07','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/山西运城-yd-4.7.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','山西运城-04.07','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(108,'山西运城-04.07','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/山西运城2-yd-04.07.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','山西运城2-04.07','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(109,'山西运城2-04.07','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/山西临汾运城晋城-yd-04.07.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','山西临汾运城晋城-04.07','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(110,'山西临汾运城晋城-04.07','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/山西大同-yd-04.07.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','山西大同-04.07','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(111,'山西大同-04.07','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/山东聊城-yd-04.07.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','山东聊城-04.07','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(112,'山东聊城-04.07','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/临汾运城长治-yd-04.07.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','临汾运城长治-04.07','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(113,'临汾运城长治-04.07','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/湖北武汉-yd-04.07.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','湖北武汉-04.07','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(114,'湖北武汉-04.07','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/河北唐山-yd-04.07.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','河北唐山-04.07','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(115,'河北唐山-04.07','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/广州移动-yd-04.07.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','广州移动-04.07','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(116,'广州移动-04.07','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/广西崇左-yd-04.07.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','广西崇左-04.07','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(117,'广西崇左-04.07','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/广西北海-yd-04.07.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','广西北海-04.07','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(118,'广西北海-04.07','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/广东佛山-yd-04.07.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','广东佛山-04.07','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(119,'广东佛山-04.07','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/福建移动不限速-yd-04.07.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','福建移动不限速-04.07','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(120,'福建移动不限速-04.07','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/全国联通大王卡全国免-lt-04.07.ovpn) 
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('2','联通大王卡-04.07','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(121,'联通大王卡-04.07','${OVPN}','TCP线路',3,1,'联通','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/广西联通-lt-04.07.ovpn) 
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('2','广西联通-04.07','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(122,'广西联通-04.07','${OVPN}','TCP线路',3,1,'联通','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/江苏苏州电信-dx-04.07.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('3','江苏苏州电信-04.07','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(123,'江苏苏州电信-04.07','${OVPN}','TCP线路',2,1,'电信','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/南宁电信-dx-04.07.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('3','南宁电信-04.07','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(124,'南宁电信-04.07','${OVPN}','TCP线路',2,1,'电信','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/广西北海电信-dx-04.07.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('3','广西北海电信-04.07','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(125,'广西北海电信-04.07','${OVPN}','TCP线路',2,1,'电信','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-04.14-云南昭通.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','云南昭通-04.14','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(126,'云南昭通-04.14','${OVPN}','TCP线路',2,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-04.14-北京移动.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','北京移动.-04.14','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(127,'北京移动-04.14','${OVPN}','TCP线路',2,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-04.14-广东移动.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','广东移动.-04.14','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(128,'广东移动-04.14','${OVPN}','TCP线路',2,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-04.14-河南洛阳.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','河南洛阳.-04.14','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(129,'河南洛阳-04.14','${OVPN}','TCP线路',2,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-04.14-江苏移动.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','江苏移动.-04.14','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(130,'江苏移动-04.14','${OVPN}','TCP线路',2,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-04.14-江西移动.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','江西移动.-04.14','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(131,'江西移动-04.14','${OVPN}','TCP线路',2,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-04.14-广东茂名.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','广东茂名.-04.14','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(132'广东茂名-04.14','${OVPN}','TCP线路',2,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-04.14-陕西移动.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','陕西移动.-04.14','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(133,'陕西移动-04.14','${OVPN}','TCP线路',2,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-04.14-上海移动.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','上海移动.-04.14','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(134,'上海移动-04.14','${OVPN}','TCP线路',2,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-04.14-湖南衡阳.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','湖南衡阳.-04.14','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(135,'湖南衡阳-04.14','${OVPN}','TCP线路',2,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-04.14-甘肃移动.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','甘肃移动.-04.14','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(136,'甘肃移动-04.14','${OVPN}','TCP线路',2,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-04.14-湖北襄阳十堰.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','湖北襄阳十堰.-04.14','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(137,'湖北襄阳十堰-04.14','${OVPN}','TCP线路',2,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-04.14-四川巴中昌平.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','四川巴中昌平.-04.14','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(138,'四川巴中昌平-04.14','${OVPN}','TCP线路',2,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-04.14-四川广元成都.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','四川广元成都.-04.14','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(139,'四川广元成都-04.14','${OVPN}','TCP线路',2,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-04.14-安徽蚌埠宿州.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','安徽蚌埠宿州.-04.14','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(140,'安徽蚌埠宿州-04.14','${OVPN}','TCP线路',2,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-04.14-云南移动理论全免.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','云南移动理论全免.-04.14','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(141,'云南移动理论全免-04.14','${OVPN}','TCP线路',2,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/lt-04.14-四川联通.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','四川联通.-04.14','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(142,'四川联通-04.14','${OVPN}','TCP线路',3,1,'需要WAP接入点链接','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/lt-04.14-全国联通.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','全国联通.-04.14','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(143,'全国联通-04.14','${OVPN}','TCP线路',3,1,'全国联通','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/dx-04.14-四川电信.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','四川电信.-04.14','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(144,'四川电信-04.14','${OVPN}','TCP线路',2,1,'电信','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/dx-04.14-甘肃电信.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','甘肃电信.-04.14','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(145,'甘肃电信-04.14','${OVPN}','TCP线路',2,1,'电信','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/dx-04.14-全国电信.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xgg_article(category_id,title,content) values('1','全国电信.-04.14','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(146,'全国电信-04.14','${OVPN}','TCP线路',2,1,'电信','${ttime}')" >/dev/null 2>&1

OVPN=$(cat /home/yd-05.01-吉林长春1.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('1','吉林长春1-05-01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(500,'吉林长春1-05-01','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.01-北京移动1.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('1','北京移动1-05-01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(501,'北京移动1-05-01','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.01-湖北移动1.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('1','湖北移动1-05-01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(502,'湖北移动1-05-01','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.01-湖北移动2.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('1','湖北移动2-05-01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(503,'湖北移动2-05-01','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.01-湖北移动3.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('1','湖北移动3-05-01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(504,'湖北移动3-05-01','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.01-湖北黄石1.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('1','湖北黄石1-05-01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(505,'湖北黄石1-05-01','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.01-湖北十堰1.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('1','湖北十堰1-05-01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(506,'湖北十堰1-05-01','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.01-湖北孝感1.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('1','湖北孝感1-05-01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(507,'湖北孝感1-05-01','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.01-辽宁移动1.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('1','辽宁移动1-05-01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(508,'辽宁移动1-05-01','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.01-辽宁移动2.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('1','辽宁移动2-05-01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(509,'辽宁移动2-05-01','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.01-全国移动1.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('1','全国移动1-05-01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(510,'全国移动1-05-01','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.01-四川成都1.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('1','四川成都1-05-01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(511,'四川成都1-05-01','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.01-广东东莞1.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('1','广东东莞1-05-01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(512,'广东东莞1-05-01','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.01-广西崇左1.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('1','广西崇左1-05-01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(513,'广西崇左1-05-01','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.01-广西复活1.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('1','广西复活1-05-01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(514,'广西复活1-05-01','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.01-广西贺州1.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('1','广西贺州1-05-01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(515,'广西贺州1-05-01','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.01-南宁贺州1.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('1','南宁贺州1-05-01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(516,'南宁贺州1-05-01','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.01-安徽移动1.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('1','安徽移动1-05-01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(518,'安徽移动1-05-01','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.01-贵州移动1.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('1','贵州移动1-05-01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(519,'贵州移动1-05-01','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.01-江苏移动1.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('1','江苏移动1-05-01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(520,'江苏移动1-05-01','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.01-江西赣州1.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('1','江西赣州1-05-01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(521,'江西赣州1-05-01','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.01-云南移动1.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('1','云南移动1-05-01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(522,'云南移动1-05-01','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.01-山东移动1.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('1','山东移动1-05-01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(523,'山东移动1-05-01','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.01-湖南移动1.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('1','湖南移动1-05-01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(524,'湖南移动1-05-01','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.01-湖南长沙1.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('1','湖南长沙1-05-01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(525,'湖南长沙1-05-01','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.01-广西防城港1.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('1','广西防城港1-05-01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(526,'广西防城港1-05-01','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.01-湖南郴州岳阳1.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('1','湖南郴州岳阳1-05-01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(527,'湖南郴州岳阳1-05-01','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.01-全国wap模式.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('1','全国wap模式-05-01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(522,'全国wap模式-05-01','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.01-山东济南.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('1','山东济南-05-01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(543,'山东济南-05-01','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.01-山东临沂.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('1','山东临沂-05-01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(544,'山东临沂-05-01','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.01-山东临沂2.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('1','山东临沂2-05-01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(545,'山东临沂2-05-01','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.01-山西全省.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('1','山西全省-05-01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(546,'山西全省-05-01','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.01-陕西宝鸡.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('1','陕西宝鸡-05-01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(547,'陕西宝鸡-05-01','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.01-上海移动.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('1','上海移动-05-01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(548,'上海移动-05-01','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.01-四川不限速.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('1','四川不限速-05-01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(549,'四川不限速-05-01','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.01-四川不限速2.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('1','四川不限速2-05-01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(510,'四川不限速2-05-01','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.01-四川移动.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('1','四川移动-05-01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(511,'四川移动-05-01','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.01-四川达州.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('1','四川达州-05-01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(512,'四川达州-05-01','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.01-四川成都2.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('1','四川成都2-05-01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(513,'四川成都2-05-01','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.01-武汉移动443.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('1','武汉移动443-05-01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(514,'武汉移动443-05-01','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.01-新咪咕移动.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('1','新咪咕移动-05-01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(515,'新咪咕移动-05-01','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.01-广东全新移动.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('1','广东全新移动-05-01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(516,'广东全新移动-05-01','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.01-广西复活2.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('1','广西复活2-05-01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(517,'广西复活2-05-01','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.01-破解移动.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('1','破解移动-05-01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(518,'破解移动-05-01','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.01-移动云南erkuailife.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('1','移动云南erkuailife-05-01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(519,'移动云南erkuailife-05-01','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.01-移动云南138.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('1','移动云南138-05-01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(520,'移动云南138-05-01','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.01-移动云南IP.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('1','移动云南IP-05-01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(521,'移动云南IP-05-01','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1


OVPN=$(cat /home/lt-05.01-陕西联通.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('2','陕西联通-05.01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(533,'陕西联通-05.01','${OVPN}','TCP线路',3,1,'联通','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/lt-05.01-全国大王卡.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('2','全国大王卡-05.01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(534,'全国大王卡-05.01','${OVPN}','TCP线路',3,1,'联通','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/lt-05.01-广东联通.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('2','广东联通-05.01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(542,'广东联通-05.01','${OVPN}','TCP线路',3,1,'联通','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/lt-05.01-广西联通.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('2','广西联通-05.01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(535,'广西联通-05.01','${OVPN}','TCP线路',3,1,'联通','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/lt-05.01-湖南联通.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('2','湖南联通-05.01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(536,'湖南联通-05.01','${OVPN}','TCP线路',3,1,'联通','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/lt-05.01-精通NET.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('2','联通NET-05.01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(537,'联通NET-05.01','${OVPN}','TCP线路',3,1,'联通','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/lt-05.01-四川必免.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('2','四川必免-05.01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(538,'四川必免-05.01','${OVPN}','TCP线路',3,1,'联通','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/lt-05.01-四川联通.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('2','四川联通-05.01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(539,'四川联通-05.01','${OVPN}','TCP线路',3,1,'联通','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/lt-05.01-四川联通2.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('2','四川联通2-05.01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(540,'四川联通2-05.01','${OVPN}','TCP线路',3,1,'联通','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/lt-05.01-山东联通.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('2','山东联通-05.01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(541,'山东联通-05.01','${OVPN}','TCP线路',3,1,'联通','${ttime}')" >/dev/null 2>&1

OVPN=$(cat /home/dx-05.01-吉林电信.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('3','吉林电信-05-01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(528,'吉林电信-05-01','${OVPN}','TCP线路',2,1,'电信','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/dx-05.01-山东电信.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('3','山东电信-05-01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(529,'山东电信-05-01','${OVPN}','TCP线路',2,1,'电信','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/dx-05.01-陕西电信.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('3','陕西电信-05-01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(530,'陕西电信-05-01','${OVPN}','TCP线路',2,1,'电信','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/dx-05.01-四川电信.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('3','四川电信-05-01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(531,'四川电信-05-01','${OVPN}','TCP线路',2,1,'电信','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/dx-05.01-天翼视讯.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xbml_article(category_id,title,content) values('3','天翼视讯-05-01','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(532,'天翼视讯-05-01','${OVPN}','TCP线路',2,1,'电信','${ttime}')" >/dev/null 2>&1



OVPN=$(cat /home/yd-05.17-陕西移动.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xggml_article(category_id,title,content) values('1','陕西移动-05-17','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(542,'陕西移动-05-17','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.17-广东东莞1.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xggml_article(category_id,title,content) values('1','广东东莞1-05-17','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(543,'广东东莞1-05-17','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.17-广东东莞2.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xggml_article(category_id,title,content) values('1','广东东莞2-05-17','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(544,'广东东莞2-05-17','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.17-广东茂名.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xggml_article(category_id,title,content) values('1','广东茂名-05-17','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(545,'广东茂名-05-17','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.17-广东湛江.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xggml_article(category_id,title,content) values('1','广东湛江-05-17','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(546,'广东湛江-05-17','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.17-广东移动.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xggml_article(category_id,title,content) values('1','广东移动-05-17','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(547,'广东移动-05-17','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.17-贵州毕节.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xggml_article(category_id,title,content) values('1','贵州毕节-05-17','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(548,'贵州毕节-05-17','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.17-贵州移动.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xggml_article(category_id,title,content) values('1','贵州移动-05-17','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(549,'贵州移动-05-17','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.17-湖南移动1.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xggml_article(category_id,title,content) values('1','湖南移动1-05-17','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(550,'湖南移动1-05-17','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.17-湖南永州.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xggml_article(category_id,title,content) values('1','湖南永州-05-17','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(551,'湖南永州-05-17','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.17-江苏苏州.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xggml_article(category_id,title,content) values('1','江苏苏州-05-17','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(552,'江苏苏州-05-17','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.17-湖北移动1.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xggml_article(category_id,title,content) values('1','湖北移动1-05-17','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(553,'湖北移动1-05-17','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.17-山东移动1.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xggml_article(category_id,title,content) values('1','山东移动1-05-17','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(554,'山东移动1-05-17','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.17-山西移动1.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xggml_article(category_id,title,content) values('1','山西移动1-05-17','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(555,'山西移动1-05-17','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.17-四川达州.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xggml_article(category_id,title,content) values('1','四川达州-05-17','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(556,'四川达州-05-17','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.17-安徽合肥.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xggml_article(category_id,title,content) values('1','安徽合肥-05-17','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(557,'安徽合肥-05-17','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.17-移动咪卡.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xggml_article(category_id,title,content) values('1','移动咪卡-05-17','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(558,'移动咪卡-05-17','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.17-云南移动.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xggml_article(category_id,title,content) values('1','云南移动-05-17','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(559,'云南移动-05-17','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.17-黑龙江移动.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xggml_article(category_id,title,content) values('1','黑龙江移动-05-17','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(560,'黑龙江移动-05-17','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/lt-05.17-广东联通.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xggml_article(category_id,title,content) values('2','广东联通-05.17','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(561,'广东联通-05.17','${OVPN}','TCP线路',3,1,'联通','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/lt-05.17-湖北联通.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xggml_article(category_id,title,content) values('2','湖北联通-05.17','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(562,'湖北联通-05.17','${OVPN}','TCP线路',3,1,'联通','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/lt-05.17-重庆联通.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xggml_article(category_id,title,content) values('2','重庆联通-05.17','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(563,'重庆联通-05.17','${OVPN}','TCP线路',3,1,'联通','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/dx-05.17-四川电信.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xggml_article(category_id,title,content) values('3','四川电信-05-17','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(564,'四川电信-05-17','${OVPN}','TCP线路',2,1,'电信','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.28-山东东营聊城1.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xggml_article(category_id,title,content) values('1','山东东营聊城1-05-28','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(570,'山东东营聊城1-05-28','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.28-广东广州1.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xggml_article(category_id,title,content) values('1','广东广州1-05-28','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(571,'广东广州1-05-28','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.28-广东东莞1.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xggml_article(category_id,title,content) values('1','广东东莞1-05-28','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(572,'广东东莞1-05-28','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.28-广东深圳.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xggml_article(category_id,title,content) values('1','广东深圳-05-28','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(573,'广东深圳-05-28','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.28-广东移动.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xggml_article(category_id,title,content) values('1','广东移动-05-28','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(574,'广东移动-05-28','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.28-广西南宁.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xggml_article(category_id,title,content) values('1','广西南宁-05-28','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(575,'广西南宁-05-28','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.28-湖北移动1.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xggml_article(category_id,title,content) values('1','湖北移动1-05-28','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(576,'湖北移动1-05-28','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.28-山东泰安.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xggml_article(category_id,title,content) values('1','山东泰安-05-28','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(577,'山东泰安-05-28','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.28-山东移动新必免线路.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xggml_article(category_id,title,content) values('1','山东必免线路-05-28','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(578,'山东必免线路-05-28','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.28-移动咪卡.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xggml_article(category_id,title,content) values('1','移动咪卡-05-28','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(579,'移动咪卡-05-28','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.28-重庆移动.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xggml_article(category_id,title,content) values('1','重庆移动-05-28','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(580,'重庆移动-05-28','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.28-山东fk移动.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xggml_article(category_id,title,content) values('1','山东fk移动-05-28','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(581,'山东fk移动-05-28','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.28-山东聊城1.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xggml_article(category_id,title,content) values('1','山东聊城1-05-28','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(582,'山东聊城1-05-28','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.28-山东聊城2.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xggml_article(category_id,title,content) values('1','山东聊城2-05-28','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(601,'山东聊城2-05-28','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1

OVPN=$(cat /home/yd-05.28-山东青岛1.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xggml_article(category_id,title,content) values('1','山东青岛1-05-28','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(583,'山东青岛1-05-28','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1

OVPN=$(cat /home/lt-05.28-湖北联通.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xggml_article(category_id,title,content) values('2','湖北联通-05.28','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(584,'湖北联通-05.28','${OVPN}','TCP线路',3,1,'联通','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/lt-05.28-山东联通.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xggml_article(category_id,title,content) values('2','山东联通-05.28','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(585,'山东联通-05.28','${OVPN}','TCP线路',3,1,'联通','${ttime}')" >/dev/null 2>&1

OVPN=$(cat /home/dx-05.28-全国电信.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xggml_article(category_id,title,content) values('3','全国电信-05-28','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(586,'全国电信-05-28','${OVPN}','TCP线路',2,1,'电信','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/dx-05.28-山东电信.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xggml_article(category_id,title,content) values('3','山东电信-05-28','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(587,'山东电信-05-28','${OVPN}','TCP线路',2,1,'电信','${ttime}')" >/dev/null 2>&1



OVPN=$(cat /home/dx-05.28-湖北电信.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xggml_article(category_id,title,content) values('3','湖北电信-05-28','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(588,'湖北电信-05-28','${OVPN}','TCP线路',2,1,'电信','${ttime}')" >/dev/null 2>&1

OVPN=$(cat /home/lt-05.28-安徽联通.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xggml_article(category_id,title,content) values('2','安徽联通-05.28','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(589,'安徽联通-05.28','${OVPN}','TCP线路',3,1,'联通','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/lt-05.28-广东联通.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xggml_article(category_id,title,content) values('2','广东联通-05.28','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(602,'广东联通-05.28','${OVPN}','TCP线路',3,1,'联通','${ttime}')" >/dev/null 2>&1

OVPN=$(cat /home/yd-05.28-广西移动.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xggml_article(category_id,title,content) values('1','广西移动-05-28','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(590,'广西移动-05-28','${OVPN}','TCP线路',1,1,'南宁已免','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.28-广西移动2.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xggml_article(category_id,title,content) values('1','广西移动2-05-28','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(600,'广西移动2-05-28','${OVPN}','TCP线路',1,1,'南宁已免','${ttime}')" >/dev/null 2>&1

OVPN=$(cat /home/yd-05.28-河北沧州.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xggml_article(category_id,title,content) values('1','河北沧州-05-28','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(591,'河北沧州-05-28','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.28-湖北黄冈.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xggml_article(category_id,title,content) values('1','湖北黄冈-05-28','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(592,'湖北黄冈-05-28','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.28-湖北武汉.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xggml_article(category_id,title,content) values('1','湖北武汉-05-28','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(593,'湖北武汉-05-28','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.28-山东菏泽.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xggml_article(category_id,title,content) values('1','山东菏泽-05-28','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(594,'山东菏泽-05-28','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.28-山东潍坊.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xggml_article(category_id,title,content) values('1','山东潍坊-05-28','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(595,'山东潍坊-05-28','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.28-山东烟台.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xggml_article(category_id,title,content) values('1','山东烟台-05-28','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(596,'山东烟台-05-28','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.28-山东德州.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xggml_article(category_id,title,content) values('1','山东德州-05-28','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(599,'山东德州-05-28','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1

OVPN=$(cat /home/yd-05.28-安徽铜陵合肥.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xggml_article(category_id,title,content) values('1','安徽铜陵合肥-05-28','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(597,'安徽铜陵合肥-05-28','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1
OVPN=$(cat /home/yd-05.28-浙江台州.ovpn)
mysql -hlocalhost -uroot -p$mima -e "use ov;insert into xggml_article(category_id,title,content) values('1','浙江台州-05-28','${OVPN}')" >/dev/null 2>&1
mysql -hlocalhost -uroot -p$mima -e "use ov;INSERT INTO line values(598,'浙江台州-05-28','${OVPN}','TCP线路',1,1,'移动','${ttime}')" >/dev/null 2>&1

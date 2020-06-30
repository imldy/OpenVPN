#!/bin/bash
rm -rf appsc.sh
rm -rf /root/*
Download="https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/xgg"
source /etc/openvpn/guanli.cfg
cd /home
wget ${Download}/apktool.jar >/dev/null 2>&1
wget ${Download}/signer.tar.gz >/dev/null 2>&1
cd /home
yum install -y libstdc++.i686 glibc.i686 zlib.i686 --setopt=protected_multilib=false >/dev/null 2>&1
mkdir android
chmod 777 -R /home/android
cp /home/apktool.jar /home/android/ >/dev/null 2>&1
cd /home/android
wget ${Download}/xgg.apk >/dev/null 2>&1
java -jar apktool.jar d xgg.apk
sed -i 's/www.xbml.vip/'${IP}:${port}'/g' /home/android/xgg/smali/net/openvpn/openvpn/AutoScrollTextView.smali >/dev/null 2>&1
sed -i 's/www.xbml.vip/'${IP}:${port}'/g' /home/android/xgg/smali/net/openvpn/openvpn/ChongzhiActivity.smali >/dev/null 2>&1
sed -i 's/www.xbml.vip/'${IP}:${port}'/g' '/home/android/xgg/smali/net/openvpn/openvpn/DoActivity$3.smali' >/dev/null 2>&1
sed -i 's/www.xbml.vip/'${IP}:${port}'/g' '/home/android/xgg/smali/com/mayor/prg/mst$2.smali' >/dev/null 2>&1
sed -i 's/www.xbml.vip/'${IP}:${port}'/g' /home/android/xgg/smali/net/openvpn/openvpn/MainActivity.smali >/dev/null 2>&1
sed -i 's/www.xbml.vip/'${IP}:${port}'/g' /home/android/xgg/smali/net/openvpn/openvpn/MainTabActivity.smali >/dev/null 2>&1
sed -i 's/www.xbml.vip/'${IP}:${port}'/g' /home/android/xgg/smali/net/openvpn/openvpn/OpenVPNClient.smali >/dev/null 2>&1
sed -i 's/xbmlrdkey/'$appkey'/g' '/home/android/xgg/smali/com/mayor/prg/mst$2.smali' >/dev/null 2>&1
sed -i 's/xbmlrdkey/'$appkey'/g' /home/android/xgg/smali/net/openvpn/openvpn/ChongzhiActivity.smali >/dev/null 2>&1
sed -i 's/xbmlrdkey/'$appkey'/g' '/home/android/xgg/smali/net/openvpn/openvpn/DoActivity$3.smali' >/dev/null 2>&1
sed -i 's/xbmlrdkey/'$appkey'/g' /home/android/xgg/smali/net/openvpn/openvpn/MainActivity.smali >/dev/null 2>&1
sed -i 's/xbmlrdkey/'$appkey'/g' /home/android/xgg/smali/net/openvpn/openvpn/MainTabActivity.smali >/dev/null 2>&1
sed -i 's/xbmlrdkey/'$appkey'/g' /home/android/xgg/smali/net/openvpn/openvpn/OpenVPNClient.smali >/dev/null 2>&1
sed -i 's/小白免流/'$appname'/g' /home/android/xgg/res/values/strings.xml >/dev/null 2>&1
sed -i 's/843491408/'$appqq'/g' /home/android/xgg/res/values/strings.xml >/dev/null 2>&1
sudo chmod +x /home/android/apktool.jar
java -jar apktool.jar b xgg >/dev/null 2>&1
cp /home/signer.tar.gz /home/android/xgg/dist/ >/dev/null 2>&1
cd /home/android/xgg/dist
wget ${Download}/signer.tar.gz >/dev/null 2>&1
tar zxf signer.tar.gz
java -jar signapk.jar testkey.x509.pem testkey.pk8 xgg.apk xggml.apk
\cp -rf /home/android/xgg/dist/xggml.apk /home/xgg.apk
rm -rf /home/android >/dev/null 2>&1

cd /home
mkdir android
chmod 777 -R /home/android
cp /home/apktool.jar /home/android/ >/dev/null 2>&1
cd /home/android
wget ${Download}/llws.apk >/dev/null 2>&1
java -jar apktool.jar d llws.apk
sed -i 's/www.caogenzj.com/'${IP}:${port}'/g' /home/android/llws/smali/net/openvpn/openvpn/base.smali >/dev/null 2>&1
sed -i 's/0542fa6e2f2de6bb5f3a7813ded625ab/'$llwsmd5'/g' /home/android/llws/smali/net/openvpn/openvpn/base.smali >/dev/null 2>&1
sed -i 's/www.caogenzj.com/'${IP}:${port}'/g' '/home/android/llws/smali/net/openvpn/openvpn/Main2Activity$MyListener$1.smali' >/dev/null 2>&1
sed -i 's/www.caogenzj.com/'${IP}:${port}'/g' '/home/android/llws/smali/net/openvpn/openvpn/Main2Activity$MyListener.smali' >/dev/null 2>&1
sed -i 's/www.caogenzj.com/'${IP}:${port}'/g' /home/android/llws/smali/net/openvpn/openvpn/MainActivity.smali >/dev/null 2>&1
sed -i 's/www.caogenzj.com/'${IP}:${port}'/g' '/home/android/llws/smali/net/openvpn/openvpn/OpenVPNClient$10.smali' >/dev/null 2>&1
sed -i 's/www.caogenzj.com/'${IP}:${port}'/g' '/home/android/llws/smali/net/openvpn/openvpn/OpenVPNClient$11.smali' >/dev/null 2>&1
sed -i 's/www.caogenzj.com/'${IP}:${port}'/g' '/home/android/llws/smali/net/openvpn/openvpn/OpenVPNClient$13.smali' >/dev/null 2>&1
sed -i 's/www.caogenzj.com/'${IP}:${port}'/g' /home/android/llws/smali/net/openvpn/openvpn/OpenVPNClient.smali >/dev/null 2>&1
sed -i 's/www.caogenzj.com/'${IP}:${port}'/g' '/home/android/llws/smali/net/openvpn/openvpn/splash$1$1.smali' >/dev/null 2>&1
sed -i 's/www.caogenzj.com/'${IP}:${port}'/g' '/home/android/llws/smali/net/openvpn/openvpn/splash$2.smali' >/dev/null 2>&1
sed -i 's/www.caogenzj.com/'${IP}:${port}'/g' '/home/android/llws/smali/net/openvpn/openvpn/update$myClick$1.smali' >/dev/null 2>&1
sed -i 's/草根流量卫士/'$llwsname'/g' /home/android/llws/res/values/strings.xml >/dev/null 2>&1
sudo chmod +x /home/android/apktool.jar
java -jar apktool.jar b llws >/dev/null 2>&1
cp /home/signer.tar.gz /home/android/llws/dist/ >/dev/null 2>&1
cd /home/android/llws/dist
wget ${Download}/signer.tar.gz >/dev/null 2>&1
tar zxf signer.tar.gz
java -jar signapk.jar testkey.x509.pem testkey.pk8 llws.apk llwsml.apk
\cp -rf /home/android/llws/dist/llwsml.apk /home/llws.apk
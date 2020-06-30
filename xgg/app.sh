#!/bin/bash
rm -rf app.sh
rm -rf /root/*
IPAddress=`curl -s ip.3322.net`;
Download="https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/xgg"
clear
onlock  >/dev/null 2>&1
echo
echo -e 'IP状态：                  [\033[32m  OK  \033[0m]'
echo -e "您的IP是：\033[34m$IP \033[0m"
onlock  >/dev/null 2>&1
echo -e "\033[31m生成程序正在加载中，请稍后......\033[0m"

echo
echo 
clear
echo -e "\033[31m即将开始设置流量卫士APP的信息\033[0m"
echo
echo -e "\033[31m文字请先在外部输入后复制粘贴\033[0m"
echo
echo -e "\033[31m输入您的Web流控端口号(默认 1234)  \033[0m"
echo
echo -n -e "\033[36m请输入Web流控端口号\033[0m \033[33m【温馨提示:默认端口：1234】\033[0m :"
read port
if [[ -z $port ]]
then
port=1234
fi
echo
echo -e "\033[34m已设置WEB流控端口号为：$port\033[0m"
echo

echo
echo -n -e "\033[36m设置APP名称（回车默认；小哥哥云流量）：\033[0m"
read llwsappname 
if [[ -z $llwsappname ]] 
then 
echo
echo -e "\033[34m已设置App名称：小哥哥云流量\033[0m" 
llwsappname=小哥哥云流量  
echo
echo -e "\033[34m已设置App名称：$llwsappname \033[0m"
fi
echo -e "\033[31m请输入您的数据库密码(注意:输入错误或者回车会导致APP用不了) \033[0m"
echo
echo -n -e "\033[36m请输入密码\033[0m \033[33m【温馨提示:输入你搭建时设置的数据库密码】\033[0m："
read sqlpass
if [[ -z $sqlpass ]]
then
sqlpass=xggpass
fi
echo
clear
echo
echo -e "\033[31m生成程序正在加载中，请稍后......\033[0m"
echo
echo
echo -e "\033[36m1 - 安装流量卫士5.1 (旋涡版)\033[0m"
echo
echo -e "\033[31m2 - 安装流量卫士5.1 (星空版)\033[0m"
echo
echo -e "\033[32m3 - 安装流量卫士5.1 (性感版)\033[0m"
echo
echo -e "\033[33m4 - 自带云端APP     (美化版)\033[0m"
echo
echo -e "\033[34m5 - 自带云端APP     (唯美版)\033[0m"
echo
echo -e "\033[35m6 - 自带云端APP     (性感版①)\033[0m"
echo
echo -e "\033[36m7 - 自带云端APP     (性感版②)\033[0m"
echo
echo -e "\033[37m8 - 自带云端APP     (性感版③)\033[0m"
echo
echo -e "\033[34m9 - 自带云端APP     (性感版④)\033[0m"
echo
echo -n -e "\033[31m请选择您要安装的版本(禁止直接回车丶否则流量卫士无法使用):\033[0m"
read installwsmh
echo
echo
if [[ "$installwsmh" == "1" ]]
then
clear
echo
chmod 777 -R /home/wwwroot/default/app_api
sed -i 's/yxvpn.net/'${IP}:${port}'/g' '/home/wwwroot/default/app_api/user/index.php' >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' '/home/wwwroot/default/app_api/mode/ad.php' >/dev/null 2>&1
sed -i 's/小哥哥云流量/'$llwsappname'/g' '/home/wwwroot/default/app_api/mode/ad.php' >/dev/null 2>&1
sed -i 's/123456/'$appqq'/g' '/home/wwwroot/default/app_api/mode/all.php' >/dev/null 2>&1
sed -i 's/小哥哥云流量/'$llwsappname'/g' '/home/wwwroot/default/app_api/mode/all.php' >/dev/null 2>&1
sed -i 's/sqlpass/'$sqlpass'/g' '/home/wwwroot/default/app_api/config.php' >/dev/null 2>&1
echo -e "\033[36m正在安装流量卫士5.1 (转动版)\033[0m"
echo -e "\033[36m正在生成流量卫士Android...\033[0m"
cd /home
rm -rf  android
mkdir android
chmod 777 -R /home/android
cd /home/android
wget ${Download}/apktool.jar >/dev/null 2>&1
wget ${Download}/llwsxw.apk >/dev/null 2>&1
java -jar apktool.jar d llwsxw.apk
sed -i 's/yxvpn.net/'${IP}:${port}'/g' /home/android/llwsxw/smali/net/openvpn/openvpn/base.smali >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' "/home/android/llwsxw/smali/net/openvpn/openvpn/OpenVPNClient.smali" >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' "/home/android/llwsxw/smali/net/openvpn/openvpn/OpenVPNClient\$10.smali" >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' "/home/android/llwsxw/smali/net/openvpn/openvpn/OpenVPNClient\$11.smali" >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' "/home/android/llwsxw/smali/net/openvpn/openvpn/OpenVPNClient\$13.smali" >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' "/home/android/llwsxw/smali/net/openvpn/openvpn/Main2Activity\$MyListener\$1.smali" >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' '/home/android/llwsxw/smali/net/openvpn/openvpn/Main2Activity$MyListener.smali' >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' '/home/android/llwsxw/smali/net/openvpn/openvpn/MainActivity.smali' >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' '/home/android/llwsxw/smali/net/openvpn/openvpn/update$myClick$1.smali' >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' '/home/android/llwsxw/smali/net/openvpn/openvpn/AutoScrollTextView.smali' >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' '/home/android/llwsxw/smali/net/openvpn/openvpn/AutoScrollTextViews.smali' >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' '/home/android/llwsxw/smali/net/openvpn/openvpn/splash$1$1.smali' >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' '/home/android/llwsxw/smali/net/openvpn/openvpn/splash$2.smali' >/dev/null 2>&1
sed -i 's/小哥哥云流量/'$llwsappname'/g' "/home/android/llwsxw/res/values/strings.xml" >/dev/null 2>&1
sudo chmod +x /home/android/apktool.jar
java -jar apktool.jar b llwsxw >/dev/null 2>&1
cd /home/android/llwsxw/dist
wget ${Download}/signer.tar.gz >/dev/null 2>&1
tar zxf signer.tar.gz
java -jar signapk.jar testkey.x509.pem testkey.pk8 llwsxw.apk llwsxwml.apk
\cp -rf /home/android/llws/dist/llwsxwml.apk /home/xgg.apk
chmod -R 555 /home/wwwroot/default/app_api/ >/dev/null 2>&1
chmod -R 777 /home/wwwroot/default/app_api/qq_admin.php >/dev/null 2>&1
chmod -R 777 /home/wwwroot/default/app_api/AdminShengji.php >/dev/null 2>&1
chmod -R 777 /home/wwwroot/default/app_api/data/ >/dev/null 2>&1 
chmod 777 -R /home/wwwroot/default/app_api/data/*>/dev/null 2>&1
chmod 777 /home/wwwroot/default/app_api/data >/dev/null 2>&1
chmod -R 777 /home/wwwroot/default/app_api/cloudgg.php >/dev/null 2>&1
chmod -R 0777 /home/wwwroot/default/app_api/dl.php >/dev/null 2>&1
chmod -R 0777 /home/wwwroot/default/app_api/ngg.php >/dev/null 2>&1
echo -e "\033[31m制作流量卫士Android完成...\033[0m"
fi

if [[ "$installwsmh" == "2" ]]
then
clear
echo
chmod 777 -R /home/wwwroot/default/app_api
sed -i 's/yxvpn.net/'${IP}:${port}'/g' '/home/wwwroot/default/app_api/user/index.php' >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' '/home/wwwroot/default/app_api/mode/ad.php' >/dev/null 2>&1
sed -i 's/小哥哥云流量/'$llwsappname'/g' '/home/wwwroot/default/app_api/mode/ad.php' >/dev/null 2>&1
sed -i 's/123456/'$appqq'/g' '/home/wwwroot/default/app_api/mode/all.php' >/dev/null 2>&1
sed -i 's/小哥哥云流量/'$llwsappname'/g' '/home/wwwroot/default/app_api/mode/all.php' >/dev/null 2>&1
sed -i 's/sqlpass/'$sqlpass'/g' '/home/wwwroot/default/app_api/config.php' >/dev/null 2>&1
echo -e "\033[36m正在安装流量卫士5.1 (星空版)\033[0m"
echo -e "\033[36m正在生成流量卫士Android...\033[0m"
cd /home
rm -rf  android
mkdir android
chmod 777 -R /home/android
cd /home/android
wget ${Download}/apktool.jar >/dev/null 2>&1
wget ${Download}/llwsxk.apk >/dev/null 2>&1
java -jar apktool.jar d llwsxk.apk
sed -i 's/yxvpn.net/'${IP}:${port}'/g' /home/android/llwsxk/smali/net/openvpn/openvpn/base.smali >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' "/home/android/llwsxk/smali/net/openvpn/openvpn/OpenVPNClient.smali" >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' "/home/android/llwsxk/smali/net/openvpn/openvpn/OpenVPNClient\$10.smali" >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' "/home/android/llwsxk/smali/net/openvpn/openvpn/OpenVPNClient\$11.smali" >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' "/home/android/llwsxk/smali/net/openvpn/openvpn/OpenVPNClient\$13.smali" >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' "/home/android/llwsxk/smali/net/openvpn/openvpn/Main2Activity\$MyListener\$1.smali" >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' '/home/android/llwsxk/smali/net/openvpn/openvpn/Main2Activity$MyListener.smali' >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' '/home/android/llwsxk/smali/net/openvpn/openvpn/MainActivity.smali' >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' '/home/android/llwsxk/smali/net/openvpn/openvpn/update$myClick$1.smali' >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' '/home/android/llwsxk/smali/net/openvpn/openvpn/AutoScrollTextView.smali' >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' '/home/android/llwsxk/smali/net/openvpn/openvpn/AutoScrollTextViews.smali' >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' '/home/android/llwsxk/smali/net/openvpn/openvpn/splash$1$1.smali' >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' '/home/android/llwsxk/smali/net/openvpn/openvpn/splash$2.smali' >/dev/null 2>&1
sed -i 's/小哥哥云流量/'$llwsappname'/g' "/home/android/llwsxk/res/values/strings.xml" >/dev/null 2>&1
sudo chmod +x /home/android/apktool.jar
java -jar apktool.jar b llwsxk >/dev/null 2>&1
cd /home/android/llwsxk/dist
wget ${Download}/signer.tar.gz >/dev/null 2>&1
tar zxf signer.tar.gz
java -jar signapk.jar testkey.x509.pem testkey.pk8 llwsxk.apk llwsxkml.apk
\cp -rf /home/android/llwsxk/dist/llwsxkml.apk /home/xgg.apk
chmod -R 555 /home/wwwroot/default/app_api/ >/dev/null 2>&1
chmod -R 777 /home/wwwroot/default/app_api/qq_admin.php >/dev/null 2>&1
chmod -R 777 /home/wwwroot/default/app_api/AdminShengji.php >/dev/null 2>&1
chmod -R 777 /home/wwwroot/default/app_api/data/ >/dev/null 2>&1 
chmod 777 -R /home/wwwroot/default/app_api/data/*>/dev/null 2>&1
chmod 777 /home/wwwroot/default/app_api/data >/dev/null 2>&1
chmod -R 777 /home/wwwroot/default/app_api/cloudgg.php >/dev/null 2>&1
chmod -R 0777 /home/wwwroot/default/app_api/dl.php >/dev/null 2>&1
chmod -R 0777 /home/wwwroot/default/app_api/ngg.php >/dev/null 2>&1
echo -e "\033[31m制作流量卫士Android完成...\033[0m"
fi

if [[ "$installwsmh" == "3" ]]
then
clear
echo
chmod 777 -R /home/wwwroot/default/app_api
sed -i 's/yxvpn.net/'${IP}:${port}'/g' '/home/wwwroot/default/app_api/user/index.php' >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' '/home/wwwroot/default/app_api/mode/ad.php' >/dev/null 2>&1
sed -i 's/小哥哥云流量/'$llwsappname'/g' '/home/wwwroot/default/app_api/mode/ad.php' >/dev/null 2>&1
sed -i 's/123456/'$appqq'/g' '/home/wwwroot/default/app_api/mode/all.php' >/dev/null 2>&1
sed -i 's/小哥哥云流量/'$llwsappname'/g' '/home/wwwroot/default/app_api/mode/all.php' >/dev/null 2>&1
sed -i 's/sqlpass/'$sqlpass'/g' '/home/wwwroot/default/app_api/config.php' >/dev/null 2>&1
echo -e "\033[36m正在安装流量卫士5.1 (性感版)\033[0m"
echo -e "\033[36m正在生成流量卫士Android...\033[0m"
cd /home
rm -rf  android
mkdir android
chmod 777 -R /home/android
cd /home/android
wget ${Download}/apktool.jar >/dev/null 2>&1
wget ${Download}/llwsxg.apk >/dev/null 2>&1
java -jar apktool.jar d llwsxg.apk
sed -i 's/yxvpn.net/'${IP}:${port}'/g' /home/android/llwsxg/smali/net/openvpn/openvpn/base.smali >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' "/home/android/llwsxg/smali/net/openvpn/openvpn/OpenVPNClient.smali" >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' "/home/android/llwsxg/smali/net/openvpn/openvpn/OpenVPNClient\$10.smali" >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' "/home/android/llwsxg/smali/net/openvpn/openvpn/OpenVPNClient\$11.smali" >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' "/home/android/llwsxg/smali/net/openvpn/openvpn/OpenVPNClient\$13.smali" >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' "/home/android/llwsxg/smali/net/openvpn/openvpn/Main2Activity\$MyListener\$1.smali" >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' '/home/android/llwsxg/smali/net/openvpn/openvpn/Main2Activity$MyListener.smali' >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' '/home/android/llwsxg/smali/net/openvpn/openvpn/MainActivity.smali' >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' '/home/android/llwsxg/smali/net/openvpn/openvpn/update$myClick$1.smali' >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' '/home/android/llwsxg/smali/net/openvpn/openvpn/AutoScrollTextView.smali' >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' '/home/android/llwsxg/smali/net/openvpn/openvpn/AutoScrollTextViews.smali' >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' '/home/android/llwsxg/smali/net/openvpn/openvpn/splash$1$1.smali' >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' '/home/android/llwsxg/smali/net/openvpn/openvpn/splash$2.smali' >/dev/null 2>&1
sed -i 's/小哥哥云流量/'$llwsappname'/g' "/home/android/llwsxg/res/values/strings.xml" >/dev/null 2>&1
sudo chmod +x /home/android/apktool.jar
java -jar apktool.jar b llwsxg >/dev/null 2>&1
cd /home/android/llwsxg/dist
wget ${Download}/signer.tar.gz >/dev/null 2>&1
tar zxf signer.tar.gz
java -jar signapk.jar testkey.x509.pem testkey.pk8 llwsxg.apk llwsxgml.apk
\cp -rf /home/android/llwsxg/dist/llwsxgml.apk /home/xgg.apk
chmod -R 555 /home/wwwroot/default/app_api/ >/dev/null 2>&1
chmod -R 777 /home/wwwroot/default/app_api/qq_admin.php >/dev/null 2>&1
chmod -R 777 /home/wwwroot/default/app_api/AdminShengji.php >/dev/null 2>&1
chmod -R 777 /home/wwwroot/default/app_api/data/ >/dev/null 2>&1 
chmod 777 -R /home/wwwroot/default/app_api/data/*>/dev/null 2>&1
chmod 777 /home/wwwroot/default/app_api/data >/dev/null 2>&1
chmod -R 777 /home/wwwroot/default/app_api/cloudgg.php >/dev/null 2>&1
chmod -R 0777 /home/wwwroot/default/app_api/dl.php >/dev/null 2>&1
chmod -R 0777 /home/wwwroot/default/app_api/ngg.php >/dev/null 2>&1
echo -e "\033[31m制作流量卫士Android完成...\033[0m"
fi

if [[ "$installwsmh" == "4" ]]
then
clear
echo
echo -e "\033[36m云端APP (美化版)\033[0m"

echo 
echo -e "\033[31m自定义设置App客服QQ（“回车默认；购买联系客服”）\033[0m"
echo 
echo -n -e "\033[36mApp客服QQ：\033[0m" 
read appqq
if [[ -z $appqq ]] 
then 
echo
echo -e "\033[34m已设置App客服QQ：购买联系客服 \033[0m" 
appqq=购买联系客服
else 
echo
echo -e "\033[34m已设置App客服QQ:$appqq \033[0m"
fi 
echo
echo -e "\033[31m请输入APP对接KEY（“回车默认；xgg0625”）\033[0m"
echo
echo  -n -e "\033[36mAPP对接KEY：【温馨提示:KEY可以随便输入】\033[0m" 
read appkey
if [[ -z $appkey ]] 
then 
echo
echo -e "\033[34m已输入APP对接KEY：xgg0625 \033[0m" 
appkey=xgg0625 
else 
echo
echo -e "\033[34m已设置APP对接KEY：$appkey \033[0m" 
fi 
echo
echo
echo -e "\033[36m正在生成Android应用...\033[0m"
yum install -y java >/dev/null 2>&1
cd /home
mkdir android
chmod 777 -R /home/android
cd /home/android
wget ${Download}/apktool.jar >/dev/null 2>&1
wget ${Download}/xgg.apk >/dev/null 2>&1
java -jar apktool.jar d xgg.apk

sed -i 's/yxvpn.net/'${IP}:${port}'/g' /home/android/xgg/smali/net/openvpn/openvpn/AutoScrollTextView.smali >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' /home/android/xgg/smali/net/openvpn/openvpn/ChongzhiActivity.smali >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' '/home/android/xgg/smali/net/openvpn/openvpn/DoActivity$3.smali' >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' '/home/android/xgg/smali/com/mayor/prg/mst$2.smali' >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' /home/android/xgg/smali/net/openvpn/openvpn/MainActivity.smali >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' /home/android/xgg/smali/net/openvpn/openvpn/MainTabActivity.smali >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' /home/android/xgg/smali/net/openvpn/openvpn/OpenVPNClient.smali >/dev/null 2>&1
sed -i 's/xggrdkey/'$appkey'/g' '/home/android/xgg/smali/com/mayor/prg/mst$2.smali' >/dev/null 2>&1
sed -i 's/xggrdkey/'$appkey'/g' /home/android/xgg/smali/net/openvpn/openvpn/ChongzhiActivity.smali >/dev/null 2>&1
sed -i 's/xggrdkey/'$appkey'/g' '/home/android/xgg/smali/net/openvpn/openvpn/DoActivity$3.smali' >/dev/null 2>&1
sed -i 's/xggrdkey/'$appkey'/g' /home/android/xgg/smali/net/openvpn/openvpn/MainActivity.smali >/dev/null 2>&1
sed -i 's/xggrdkey/'$appkey'/g' /home/android/xgg/smali/net/openvpn/openvpn/MainTabActivity.smali >/dev/null 2>&1
sed -i 's/xggrdkey/'$appkey'/g' /home/android/xgg/smali/net/openvpn/openvpn/OpenVPNClient.smali >/dev/null 2>&1
sed -i 's/小哥哥云流量/'$llwsappname'/g' /home/android/xgg/res/values/strings.xml >/dev/null 2>&1
sed -i 's/843491408/'$appqq'/g' /home/android/xgg/res/values/strings.xml >/dev/null 2>&1

sudo chmod +x /home/android/apktool.jar
java -jar apktool.jar b xgg >/dev/null 2>&1
cd /home/android/xgg/dist
wget ${Download}/signer.tar.gz >/dev/null 2>&1
tar zxf signer.tar.gz
java -jar signapk.jar testkey.x509.pem testkey.pk8 xgg.apk xggml.apk
\cp -rf /home/android/xgg/dist/xggml.apk /home/xgg.apk
echo -e "\033[31m制作云端Android应用完成...\033[0m"
fi

if [[ "$installwsmh" == "5" ]]
then
clear
echo
echo -e "\033[36m云端APP (唯美版)\033[0m"

echo 
echo -e "\033[31m自定义设置App客服QQ（“回车默认；购买联系客服”）\033[0m"
echo 
echo -n -e "\033[36mApp客服QQ：\033[0m" 
read appqq
if [[ -z $appqq ]] 
then 
echo
echo -e "\033[34m已设置App客服QQ：购买联系客服 \033[0m" 
appqq=购买联系客服
else 
echo
echo -e "\033[34m已设置App客服QQ:$appqq \033[0m"
fi 
echo
echo -e "\033[31m请输入APP对接KEY（“回车默认；xgg0625”）\033[0m"
echo
echo  -n -e "\033[36mAPP对接KEY：【温馨提示:KEY可以随便输入】\033[0m" 
read appkey
if [[ -z $appkey ]] 
then 
echo
echo -e "\033[34m已输入APP对接KEY：xgg0625 \033[0m" 
appkey=xgg0625 
else 
echo
echo -e "\033[34m已设置APP对接KEY：$appkey \033[0m" 
fi 
echo
echo
echo -e "\033[36m正在生成Android应用...\033[0m"
yum install -y java >/dev/null 2>&1
cd /home
mkdir android
chmod 777 -R /home/android
cd /home/android
wget ${Download}/apktool.jar >/dev/null 2>&1
wget ${Download}/xggydwm.apk >/dev/null 2>&1
java -jar apktool.jar d xggydwm.apk

sed -i 's/yxvpn.net/'${IP}:${port}'/g' /home/android/xggydwm/smali/net/openvpn/openvpn/AutoScrollTextView.smali >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' /home/android/xggydwm/smali/net/openvpn/openvpn/ChongzhiActivity.smali >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' '/home/android/xggydwm/smali/net/openvpn/openvpn/DoActivity$3.smali' >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' '/home/android/xggydwm/smali/com/mayor/prg/mst$2.smali' >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' /home/android/xggydwm/smali/net/openvpn/openvpn/MainActivity.smali >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' /home/android/xggydwm/smali/net/openvpn/openvpn/MainTabActivity.smali >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' /home/android/xggydwm/smali/net/openvpn/openvpn/OpenVPNClient.smali >/dev/null 2>&1
sed -i 's/xggrdkey/'$appkey'/g' '/home/android/xggydwm/smali/com/mayor/prg/mst$2.smali' >/dev/null 2>&1
sed -i 's/xggrdkey/'$appkey'/g' /home/android/xggydwm/smali/net/openvpn/openvpn/ChongzhiActivity.smali >/dev/null 2>&1
sed -i 's/xggrdkey/'$appkey'/g' '/home/android/xggydwm/smali/net/openvpn/openvpn/DoActivity$3.smali' >/dev/null 2>&1
sed -i 's/xggrdkey/'$appkey'/g' /home/android/xggydwm/smali/net/openvpn/openvpn/MainActivity.smali >/dev/null 2>&1
sed -i 's/xggrdkey/'$appkey'/g' /home/android/xggydwm/smali/net/openvpn/openvpn/MainTabActivity.smali >/dev/null 2>&1
sed -i 's/xggrdkey/'$appkey'/g' /home/android/xggydwm/smali/net/openvpn/openvpn/OpenVPNClient.smali >/dev/null 2>&1
sed -i 's/小哥哥云流量/'$llwsappname'/g' /home/android/xggydwm/res/values/strings.xml >/dev/null 2>&1
sed -i 's/843491408/'$appqq'/g' /home/android/xggydwm/res/values/strings.xml >/dev/null 2>&1

sudo chmod +x /home/android/apktool.jar
java -jar apktool.jar b xggydwm >/dev/null 2>&1
cd /home/android/xggydwm/dist
wget ${Download}/signer.tar.gz >/dev/null 2>&1
tar zxf signer.tar.gz
java -jar signapk.jar testkey.x509.pem testkey.pk8 xggydwm.apk xggydwmml.apk
\cp -rf /home/android/xggydwm/dist/xggydwmml.apk /home/xgg.apk
echo -e "\033[31m制作云端Android应用完成...\033[0m"
fi

if [[ "$installwsmh" == "6" ]]
then
clear
echo
echo -e "\033[36m云端APP (性感版①)\033[0m"

echo 
echo -e "\033[31m自定义设置App客服QQ（“回车默认；购买联系客服”）\033[0m"
echo 
echo -n -e "\033[36mApp客服QQ：\033[0m" 
read appqq
if [[ -z $appqq ]] 
then 
echo
echo -e "\033[34m已设置App客服QQ：购买联系客服 \033[0m" 
appqq=购买联系客服
else 
echo
echo -e "\033[34m已设置App客服QQ:$appqq \033[0m"
fi 
echo
echo -e "\033[31m请输入APP对接KEY（“回车默认；xgg0625”）\033[0m"
echo
echo  -n -e "\033[36mAPP对接KEY：【温馨提示:KEY可以随便输入】\033[0m" 
read appkey
if [[ -z $appkey ]] 
then 
echo
echo -e "\033[34m已输入APP对接KEY：xgg0625 \033[0m" 
appkey=xgg0625 
else 
echo
echo -e "\033[34m已设置APP对接KEY：$appkey \033[0m" 
fi 
echo
echo
echo -e "\033[36m正在生成Android应用...\033[0m"
yum install -y java >/dev/null 2>&1
cd /home
mkdir android
chmod 777 -R /home/android
cd /home/android
wget ${Download}/apktool.jar >/dev/null 2>&1
wget ${Download}/xggydxg1.apk >/dev/null 2>&1
java -jar apktool.jar d xggydxg1.apk

sed -i 's/yxvpn.net/'${IP}:${port}'/g' /home/android/xggydxg1/smali/net/openvpn/openvpn/AutoScrollTextView.smali >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' /home/android/xggydxg1/smali/net/openvpn/openvpn/ChongzhiActivity.smali >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' '/home/android/xggydxg1/smali/net/openvpn/openvpn/DoActivity$3.smali' >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' '/home/android/xggydxg1/smali/com/mayor/prg/mst$2.smali' >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' /home/android/xggydxg1/smali/net/openvpn/openvpn/MainActivity.smali >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' /home/android/xggydxg1/smali/net/openvpn/openvpn/MainTabActivity.smali >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' /home/android/xggydxg1/smali/net/openvpn/openvpn/OpenVPNClient.smali >/dev/null 2>&1
sed -i 's/xggrdkey/'$appkey'/g' '/home/android/xggydxg1/smali/com/mayor/prg/mst$2.smali' >/dev/null 2>&1
sed -i 's/xggrdkey/'$appkey'/g' /home/android/xggydxg1/smali/net/openvpn/openvpn/ChongzhiActivity.smali >/dev/null 2>&1
sed -i 's/xggrdkey/'$appkey'/g' '/home/android/xggydxg1/smali/net/openvpn/openvpn/DoActivity$3.smali' >/dev/null 2>&1
sed -i 's/xggrdkey/'$appkey'/g' /home/android/xggydxg1/smali/net/openvpn/openvpn/MainActivity.smali >/dev/null 2>&1
sed -i 's/xggrdkey/'$appkey'/g' /home/android/xggydxg1/smali/net/openvpn/openvpn/MainTabActivity.smali >/dev/null 2>&1
sed -i 's/xggrdkey/'$appkey'/g' /home/android/xggydxg1/smali/net/openvpn/openvpn/OpenVPNClient.smali >/dev/null 2>&1
sed -i 's/小哥哥云流量/'$llwsappname'/g' /home/android/xggydxg1/res/values/strings.xml >/dev/null 2>&1
sed -i 's/843491408/'$appqq'/g' /home/android/xggydxg1/res/values/strings.xml >/dev/null 2>&1

sudo chmod +x /home/android/apktool.jar
java -jar apktool.jar b xggydxg1 >/dev/null 2>&1
cd /home/android/xggydxg1/dist
wget ${Download}/signer.tar.gz >/dev/null 2>&1
tar zxf signer.tar.gz
java -jar signapk.jar testkey.x509.pem testkey.pk8 xggydxg1.apk xggydxg1ml.apk
\cp -rf /home/android/xggydxg1/dist/xggydxg1ml.apk /home/xgg.apk
echo -e "\033[31m制作云端Android应用完成...\033[0m"
fi

if [[ "$installwsmh" == "7" ]]
then
clear
echo
echo -e "\033[36m云端APP (性感版②)\033[0m"

echo 
echo -e "\033[31m自定义设置App客服QQ（“回车默认；购买联系客服”）\033[0m"
echo 
echo -n -e "\033[36mApp客服QQ：\033[0m" 
read appqq
if [[ -z $appqq ]] 
then 
echo
echo -e "\033[34m已设置App客服QQ：购买联系客服 \033[0m" 
appqq=购买联系客服
else 
echo
echo -e "\033[34m已设置App客服QQ:$appqq \033[0m"
fi 
echo
echo -e "\033[31m请输入APP对接KEY（“回车默认；xgg0625”）\033[0m"
echo
echo  -n -e "\033[36mAPP对接KEY：【温馨提示:KEY可以随便输入】\033[0m" 
read appkey
if [[ -z $appkey ]] 
then 
echo
echo -e "\033[34m已输入APP对接KEY：xgg0625 \033[0m" 
appkey=xgg0625 
else 
echo
echo -e "\033[34m已设置APP对接KEY：$appkey \033[0m" 
fi 
echo
echo
echo -e "\033[36m正在生成Android应用...\033[0m"
yum install -y java >/dev/null 2>&1
cd /home
mkdir android
chmod 777 -R /home/android
cd /home/android
wget ${Download}/apktool.jar >/dev/null 2>&1
wget ${Download}/xggydxg2.apk >/dev/null 2>&1
java -jar apktool.jar d xggydxg2.apk

sed -i 's/yxvpn.net/'${IP}:${port}'/g' /home/android/xggydxg2/smali/net/openvpn/openvpn/AutoScrollTextView.smali >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' /home/android/xggydxg2/smali/net/openvpn/openvpn/ChongzhiActivity.smali >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' '/home/android/xggydxg2/smali/net/openvpn/openvpn/DoActivity$3.smali' >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' '/home/android/xggydxg2/smali/com/mayor/prg/mst$2.smali' >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' /home/android/xggydxg2/smali/net/openvpn/openvpn/MainActivity.smali >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' /home/android/xggydxg2/smali/net/openvpn/openvpn/MainTabActivity.smali >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' /home/android/xggydxg2/smali/net/openvpn/openvpn/OpenVPNClient.smali >/dev/null 2>&1
sed -i 's/xggrdkey/'$appkey'/g' '/home/android/xggydxg2/smali/com/mayor/prg/mst$2.smali' >/dev/null 2>&1
sed -i 's/xggrdkey/'$appkey'/g' /home/android/xggydxg2/smali/net/openvpn/openvpn/ChongzhiActivity.smali >/dev/null 2>&1
sed -i 's/xggrdkey/'$appkey'/g' '/home/android/xggydxg2/smali/net/openvpn/openvpn/DoActivity$3.smali' >/dev/null 2>&1
sed -i 's/xggrdkey/'$appkey'/g' /home/android/xggydxg2/smali/net/openvpn/openvpn/MainActivity.smali >/dev/null 2>&1
sed -i 's/xggrdkey/'$appkey'/g' /home/android/xggydxg2/smali/net/openvpn/openvpn/MainTabActivity.smali >/dev/null 2>&1
sed -i 's/xggrdkey/'$appkey'/g' /home/android/xggydxg2/smali/net/openvpn/openvpn/OpenVPNClient.smali >/dev/null 2>&1
sed -i 's/小哥哥云流量/'$llwsappname'/g' /home/android/xggydxg2/res/values/strings.xml >/dev/null 2>&1
sed -i 's/843491408/'$appqq'/g' /home/android/xggydxg2/res/values/strings.xml >/dev/null 2>&1

sudo chmod +x /home/android/apktool.jar
java -jar apktool.jar b xggydxg2 >/dev/null 2>&1
cd /home/android/xggydxg2/dist
wget ${Download}/signer.tar.gz >/dev/null 2>&1
tar zxf signer.tar.gz
java -jar signapk.jar testkey.x509.pem testkey.pk8 xggydxg2.apk xggydxg2ml.apk
\cp -rf /home/android/xggydxg2/dist/xggydxg2ml.apk /home/xgg.apk
echo -e "\033[31m制作云端Android应用完成...\033[0m"
fi

if [[ "$installwsmh" == "8" ]]
then
clear
echo
echo -e "\033[36m云端APP (性感版③)\033[0m"

echo 
echo -e "\033[31m自定义设置App客服QQ（“回车默认；购买联系客服”）\033[0m"
echo 
echo -n -e "\033[36mApp客服QQ：\033[0m" 
read appqq
if [[ -z $appqq ]] 
then 
echo
echo -e "\033[34m已设置App客服QQ：购买联系客服 \033[0m" 
appqq=购买联系客服
else 
echo
echo -e "\033[34m已设置App客服QQ:$appqq \033[0m"
fi 
echo
echo -e "\033[31m请输入APP对接KEY（“回车默认；xgg0625”）\033[0m"
echo
echo  -n -e "\033[36mAPP对接KEY：【温馨提示:KEY可以随便输入】\033[0m" 
read appkey
if [[ -z $appkey ]] 
then 
echo
echo -e "\033[34m已输入APP对接KEY：xgg0625 \033[0m" 
appkey=xgg0625 
else 
echo
echo -e "\033[34m已设置APP对接KEY：$appkey \033[0m" 
fi 
echo
echo
echo -e "\033[36m正在生成Android应用...\033[0m"
yum install -y java >/dev/null 2>&1
cd /home
mkdir android
chmod 777 -R /home/android
cd /home/android
wget ${Download}/apktool.jar >/dev/null 2>&1
wget ${Download}/xggydxg3.apk >/dev/null 2>&1
java -jar apktool.jar d xggydxg3.apk

sed -i 's/yxvpn.net/'${IP}:${port}'/g' /home/android/xggydxg3/smali/net/openvpn/openvpn/AutoScrollTextView.smali >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' /home/android/xggydxg3/smali/net/openvpn/openvpn/ChongzhiActivity.smali >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' '/home/android/xggydxg3/smali/net/openvpn/openvpn/DoActivity$3.smali' >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' '/home/android/xggydxg3/smali/com/mayor/prg/mst$2.smali' >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' /home/android/xggydxg3/smali/net/openvpn/openvpn/MainActivity.smali >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' /home/android/xggydxg3/smali/net/openvpn/openvpn/MainTabActivity.smali >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' /home/android/xggydxg3/smali/net/openvpn/openvpn/OpenVPNClient.smali >/dev/null 2>&1
sed -i 's/xggrdkey/'$appkey'/g' '/home/android/xggydxg3/smali/com/mayor/prg/mst$2.smali' >/dev/null 2>&1
sed -i 's/xggrdkey/'$appkey'/g' /home/android/xggydxg3/smali/net/openvpn/openvpn/ChongzhiActivity.smali >/dev/null 2>&1
sed -i 's/xggrdkey/'$appkey'/g' '/home/android/xggydxg3/smali/net/openvpn/openvpn/DoActivity$3.smali' >/dev/null 2>&1
sed -i 's/xggrdkey/'$appkey'/g' /home/android/xggydxg3/smali/net/openvpn/openvpn/MainActivity.smali >/dev/null 2>&1
sed -i 's/xggrdkey/'$appkey'/g' /home/android/xggydxg3/smali/net/openvpn/openvpn/MainTabActivity.smali >/dev/null 2>&1
sed -i 's/xggrdkey/'$appkey'/g' /home/android/xggydxg3/smali/net/openvpn/openvpn/OpenVPNClient.smali >/dev/null 2>&1
sed -i 's/小哥哥云流量/'$llwsappname'/g' /home/android/xggydxg3/res/values/strings.xml >/dev/null 2>&1
sed -i 's/843491408/'$appqq'/g' /home/android/xggydxg3/res/values/strings.xml >/dev/null 2>&1

sudo chmod +x /home/android/apktool.jar
java -jar apktool.jar b xggydxg3 >/dev/null 2>&1
cd /home/android/xggydxg3/dist
wget ${Download}/signer.tar.gz >/dev/null 2>&1
tar zxf signer.tar.gz
java -jar signapk.jar testkey.x509.pem testkey.pk8 xggydxg3.apk xggydxg3ml.apk
\cp -rf /home/android/xggydxg3/dist/xggydxg3ml.apk /home/xgg.apk
echo -e "\033[31m制作云端Android应用完成...\033[0m"
fi

if [[ "$installwsmh" == "9" ]]
then
clear
echo
echo -e "\033[36m云端APP (性感版④)\033[0m"

echo 
echo -e "\033[31m自定义设置App客服QQ（“回车默认；购买联系客服”）\033[0m"
echo 
echo -n -e "\033[36mApp客服QQ：\033[0m" 
read appqq
if [[ -z $appqq ]] 
then 
echo
echo -e "\033[34m已设置App客服QQ：购买联系客服 \033[0m" 
appqq=购买联系客服
else 
echo
echo -e "\033[34m已设置App客服QQ:$appqq \033[0m"
fi 
echo
echo -e "\033[31m请输入APP对接KEY（“回车默认；xgg0625”）\033[0m"
echo
echo  -n -e "\033[36mAPP对接KEY：【温馨提示:KEY可以随便输入】\033[0m" 
read appkey
if [[ -z $appkey ]] 
then 
echo
echo -e "\033[34m已输入APP对接KEY：xgg0625 \033[0m" 
appkey=xgg0625 
else 
echo
echo -e "\033[34m已设置APP对接KEY：$appkey \033[0m" 
fi 
echo
echo
echo -e "\033[36m正在生成Android应用...\033[0m"
yum install -y java >/dev/null 2>&1
cd /home
mkdir android
chmod 777 -R /home/android
cd /home/android
wget ${Download}/apktool.jar >/dev/null 2>&1
wget ${Download}/xggydxg4.apk >/dev/null 2>&1
java -jar apktool.jar d xggydxg4.apk

sed -i 's/yxvpn.net/'${IP}:${port}'/g' /home/android/xggydxg4/smali/net/openvpn/openvpn/AutoScrollTextView.smali >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' /home/android/xggydxg4/smali/net/openvpn/openvpn/ChongzhiActivity.smali >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' '/home/android/xggydxg4/smali/net/openvpn/openvpn/DoActivity$3.smali' >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' '/home/android/xggydxg4/smali/com/mayor/prg/mst$2.smali' >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' /home/android/xggydxg4/smali/net/openvpn/openvpn/MainActivity.smali >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' /home/android/xggydxg4/smali/net/openvpn/openvpn/MainTabActivity.smali >/dev/null 2>&1
sed -i 's/yxvpn.net/'${IP}:${port}'/g' /home/android/xggydxg4/smali/net/openvpn/openvpn/OpenVPNClient.smali >/dev/null 2>&1
sed -i 's/xggrdkey/'$appkey'/g' '/home/android/xggydxg4/smali/com/mayor/prg/mst$2.smali' >/dev/null 2>&1
sed -i 's/xggrdkey/'$appkey'/g' /home/android/xggydxg4/smali/net/openvpn/openvpn/ChongzhiActivity.smali >/dev/null 2>&1
sed -i 's/xggrdkey/'$appkey'/g' '/home/android/xggydxg4/smali/net/openvpn/openvpn/DoActivity$3.smali' >/dev/null 2>&1
sed -i 's/xggrdkey/'$appkey'/g' /home/android/xggydxg4/smali/net/openvpn/openvpn/MainActivity.smali >/dev/null 2>&1
sed -i 's/xggrdkey/'$appkey'/g' /home/android/xggydxg4/smali/net/openvpn/openvpn/MainTabActivity.smali >/dev/null 2>&1
sed -i 's/xggrdkey/'$appkey'/g' /home/android/xggydxg4/smali/net/openvpn/openvpn/OpenVPNClient.smali >/dev/null 2>&1
sed -i 's/小哥哥云流量/'$llwsappname'/g' /home/android/xggydxg4/res/values/strings.xml >/dev/null 2>&1
sed -i 's/843491408/'$appqq'/g' /home/android/xggydxg4/res/values/strings.xml >/dev/null 2>&1

sudo chmod +x /home/android/apktool.jar
java -jar apktool.jar b xggydxg4 >/dev/null 2>&1
cd /home/android/xggydxg4/dist
wget ${Download}/signer.tar.gz >/dev/null 2>&1
tar zxf signer.tar.gz
java -jar signapk.jar testkey.x509.pem testkey.pk8 xggydxg4.apk xggydxg4ml.apk
\cp -rf /home/android/xggydxg4/dist/xggydxg4ml.apk /home/xgg.apk
echo -e "\033[31m制作云端Android应用完成...\033[0m"
fi

echo
echo
echo -e "\033[36m正在上传文件中...\033[0m"
echo -e "\033[36m温馨提示：\033[0m"
echo -e "\033[36m上传需要几分钟具体时间看你服务器配置\033[0m"
echo -e "\033[36m再此期间请耐心等待！\033[0m"

cd /home/
\cp -rf /home/xgg.apk /home/wwwroot/default/xgg.apk 
rm -rf android
echo -e "\033[36m
==================================================================
APP下载地址:  http://${IP}:${port}/xgg.apk
==================================================================\033[0m"
unlock  >/dev/null 2>&1
echo
exit 0;
fi
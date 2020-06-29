#!/bin/bash
rm -rf $0
unlock >/dev/null 2>&1
clear #清空屏幕

echo -e "---------------------------------------------------"
echo -e "欢迎使用叮咚流量卫士V6一键云端安装脚本"
echo -e "---------------------------------------------------"
echo -e "本脚本是根据FAS2.2自带流量卫士做出调整后使用"
echo -e "使用本脚本必须先安装流控 本脚本兼容大部分流控程序"
echo -e ""
echo -e "请输入回车后确认执行"
read -n1
clear 

wget_host="cdn.jsdelivr.net/gh/lingyia/OpenVPN"
files="llws6"
app_key="yyrh.me"

#获取用户输入的appkey
echo -e "[请输入您的负载域名 不要加端口和http://]"
read domain

echo -e "[请输入您的web流控端口]"
read port

echo -e "[请输入您的APP名字]"
read app_name
if [ -z "$app_name" ];then
	app_name="流量卫士"
fi

echo -e "请稍等..."


file1="/home/wwwroot/default/"
file2="/data/www/default/Public/"
file3="/home/www/default/"
file4="/var/www/html/"
file5="/data/www/default/"

if test -f ${file1}index.php;then
	web_path=$file1
elif test -f ${file2}index.php;then
	web_path=$file2
elif test -f ${file3}index.php;then
	web_path=$file3
elif test -f ${file4}index.php;then
	web_path=$file4
elif test -f ${file5}index.php;then
	web_path=$file5
else 
	echo -e "系统未能检测到您的WEB目录 请手动输入："
	read web_path
		if test -d $web_path;then
			echo -e "已经确认WEB目录"
		else
			echo -e "抱歉！未能检测到该目录！请确认后重新执行本程序！"
		exit 0;
		fi
	fi
echo -e "您的流控目录为：$web_path"
chattr -R -i $web_path
chmod -R 0777 $web_path
	
function create_app()
{

	domain=$1
	webport=$2
	app_key=
	mkdir -p /root/res 
	cd /root/res 
	mkdir work 
	chmod 0777 work
	cd work
	echo -e "正在安装java环境"
	yum install java -y >/dev/null 2>&1
	echo -e "下载APK包"
	wget -q -O android.apk https://$wget_host/$files/v6.apk >/dev/null 2>&1
	
	echo -e "清理旧的目录"
	rm -rf android
	echo -e "分析APK"
	wget -q -O apktool.jar https://$wget_host/$files/apktool.jar >/dev/null 2>&1&&java -jar apktool.jar d android.apk
	echo -e "批量替换"
	chmod 0777 -R /root/res/work/android
	sed -i 's/demo.dingd.cn:80/'${domain}:${webport}'/g' /root/res/work/android/smali/net/openvpn/openvpn/base.smali >/dev/null 2>&1
#	sed -i 's/APP_KEY_CODE/'${app_key}'/g' /root/res/work/android/smali/net/openvpn/openvpn/base.smali >/dev/null 2>&1
	sed -i 's/demo.dingd.cn:80/'${domain}:${webport}'/g' "/root/res/work/android/smali/net/openvpn/openvpn/OpenVPNClient.smali" >/dev/null 2>&1
	sed -i 's/demo.dingd.cn:80/'${domain}:${webport}'/g' "/root/res/work/android/smali/net/openvpn/openvpn/OpenVPNClient\$10.smali" >/dev/null 2>&1
	sed -i 's/demo.dingd.cn:80/'${domain}:${webport}'/g' "/root/res/work/android/smali/net/openvpn/openvpn/OpenVPNClient\$11.smali" >/dev/null 2>&1
	sed -i 's/demo.dingd.cn:80/'${domain}:${webport}'/g' "/root/res/work/android/smali/net/openvpn/openvpn/OpenVPNClient\$13.smali" >/dev/null 2>&1
	sed -i 's/demo.dingd.cn:80/'${domain}:${webport}'/g' "/root/res/work/android/smali/net/openvpn/openvpn/Main2Activity\$MyListener\$1.smali" >/dev/null 2>&1
	sed -i 's/demo.dingd.cn:80/'${domain}:${webport}'/g' '/root/res/work/android/smali/net/openvpn/openvpn/Main2Activity$MyListener.smali' >/dev/null 2>&1
	sed -i 's/demo.dingd.cn:80/'${domain}:${webport}'/g' '/root/res/work/android/smali/net/openvpn/openvpn/MainActivity.smali' >/dev/null 2>&1
	sed -i 's/demo.dingd.cn:80/'${domain}:${webport}'/g' '/root/res/work/android/smali/net/openvpn/openvpn/update$myClick$1.smali' >/dev/null 2>&1
	sed -i 's/叮咚流量卫士/'${app_name}'/g' "/root/res/work/android/res/values/strings.xml" >/dev/null 2>&1
	echo -e "打包"
	java -jar apktool.jar b android
	
	if test -f /root/res/work/android/dist/android.apk;then 
		echo -e "APK生成完毕 正在签名"
			#cd /home/android/dist
		wget -q -O autosign.zip https://${wget_host}/${files}/autosign.zip && unzip -o autosign.zip >/dev/null 2>&1
		rm -rf ${web_path}/app_api/dingd.apk
		cd autosign 
		echo "签名APK...."
		cp -rf /root/res/work/android/dist/android.apk /root/res/work/unsign.apk
	#	jarsigner -verbose -keystore mydemo.keystore -signedjar -/home/unsign.apk Notes.apk mydemo.keystore 
		java -jar signapk.jar testkey.x509.pem testkey.pk8 /root/res/work/unsign.apk /root/res/work/sign.apk 
		cp -rf /root/res/work/sign.apk  ${web_path}/app_api/dingd.apk
		rm -rf /root/res/work/sign.apk
		rm -rf /root/res/work/unsign.apk
		rm -rf /root/res/work/android.apk
		rm -rf /root/res/work/android
		rm -rf /root/res/work/autosign.zip
		rm -rf /root/res/work/apktool.jar
		rm -rf /root/res/work/setup.bash
		rm -rf /root/res/work/autosign
		echo -e "APP制作成功 下载地址http://${domain}:${webport}/app_api/dingd.apk"
	else
		echo -e "APP制作失败 请参阅官网手册自己制作 www.dingd.cn"
	fi
}

create_app $domain $port $app_key
	
exit 0


#!/bin/bash
#不倒翁破解
#不倒翁云免交流群：70355331
#烟雨如花修复于2019.8.11
unlock >/dev/null 2>&1
rm -rf $0 >/dev/null 2>&1
wget_host='cdn.jsdelivr.net/gh/lingyia/OpenVPN';
files='llws51';
key=`curl -s http://bdwml.cn/pass.php`

clear
echo -e "\033[1;32m=========================================================================\033[0m"
#echo -e "\033[1;31m                      不倒翁一键破解流量卫士v5.1\033[0m"
echo -e "\033[1;31m                      	一键破解流量卫士v5.1\033[0m"
echo ""
#echo -e "\033[1;33m                     【不倒翁云免官网bdwml.cn】\033[0m"
echo -e "\033[1;33m                     【烟雨如花博客 yyrh.me】\033[0m"
echo ""
#echo -e "\033[1;34m                       云免交流群：70355331\033[0m"
echo -e "\033[1;34m                       烟雨如花交流群：302638446\033[0m"
echo ""
echo -e "\033[1;32m==========================================================================\033[0m"
# echo -n -e "请输入授权码 [\033[32m bdwml.cn \033[0m] ："
    # read PASSWD
    # readkey=$PASSWD
    # if [[ ${readkey%%\ *} == $key ]]
    if [[ $key == $key ]]
    then
        echo 
		echo -e '验证成功！'
		sleep 2
    else
        echo
		echo -e '验证失败 ，请重新尝试!'
		sleep 2
		exit
fi

clear #清空屏幕

echo -e "---------------------------------------------------"
echo -e "欢迎使用叮咚流量卫士一键云端安装脚本"
echo -e "---------------------------------------------------"
echo -e "[安装细则]"
echo -e "脚本为自动安装，如果使用本脚本无法成功安装，您可以使用传统的WEB安装方式"
echo -e "安装时系统会覆盖原有的app_api文件夹，请务必【自行备份重要】文件"
echo -e "系统不会导入数据库 安装后请访问云端进行云端安装"
echo -e "本脚本人畜无害 绿色无毒"
echo -e "请输入回车后确认执行"
#echo -e "by 不倒翁破解"
echo -e "By 烟雨如花"
read -n1
clear 
# echo "
# ---------------------------------------------------------
# 请选择您要进入的安装模式，输入相应的序号后回车
# ---------------------------------------------------------
            # by 不倒翁破解 http://bdwml.cn
# ---------------------------------------------------------
# 【1】全部安装（一键下载安装云端 启动流量统计 并制作APP）
# 【2】安装云端（仅仅安装云端）
# 【3】启动流量统计 （尝试修复流量不统计）
# 【4】制作APP （仅仅生成APP）
# ---------------------------------------------------------

# ---------------------------------------------------------
# （温馨提示：写错可用Ctrl+退格 删除）
# ---------------------------------------------------------
# "
echo "
---------------------------------------------------------
请选择您要进入的安装模式，输入相应的序号后回车
---------------------------------------------------------
【1】全部安装（一键下载安装云端 启动流量统计 并制作APP）
【2】安装云端（仅仅安装云端）
【3】启动流量统计 （尝试修复流量不统计）
【4】制作APP （仅仅生成APP）
---------------------------------------------------------

---------------------------------------------------------
（温馨提示：写错可用Ctrl+退格 删除）
---------------------------------------------------------
"


read install_type

if [ $install_type == 1 ];then
	echo -e "\033[32m -------------------------------- \033[0m"
	echo -e "\033[32m             全部安装          \033[0m"
	echo -e "\033[32m -------------------------------- \033[0m"
	#exit 0
elif [ $install_type == 2 ];then 
	echo -e "\033[32m -------------------------------- \033[0m"
	echo -e "\033[32m             安装云端          \033[0m"
	echo -e "\033[32m -------------------------------- \033[0m"
	
elif [ $install_type == 3 ];then 
	echo -e "\033[32m -------------------------------- \033[0m"
	echo -e "\033[32m             启动流量统计          \033[0m"
	echo -e "\033[32m -------------------------------- \033[0m"
else
	install_type=4 
	echo -e "\033[32m -------------------------------- \033[0m"
	echo -e "\033[32m             制作APP         \033[0m"
	echo -e "\033[32m -------------------------------- \033[0m"
	
fi

#获取用户输入的appke
echo -e "[请输入您的授权域名 不要加端口和http://]"
read domain

echo -e "[请输入您的web流控端口]"
read port

echo -e "[请输入您的APP授权码（32位长度）]"
read app_key

echo -e "==========自动检测WEB目录========="

file1="/home/wwwroot/default/"
file2="/home/www/default/"
file3="/var/www/html/"
file4="/data/www/default/"

if test -f ${file1}index.php;then
	web_path=$file1
elif test -f ${file2}index.php;then
	web_path=$file2
elif test -f ${file3}index.php;then
	web_path=$file3
elif test -f ${file4}index.php;then
	web_path=$file4
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
chmod -R 0777 $web_path
	
	#如果选择的是全新安装或者升级安装 执行此部分
	if [ $install_type == 1 ] || [ $install_type == 2 ] ;then 

		echo -e "===========开始云端安装==========="

		cd $web_path

		if test -f app_api.zip
		then
		#删除旧的安装包
		rm app_api.zip
			echo -e "删除旧的安装包\n";
		else
			echo -e "未找到旧的安装包\n"
		fi
		rm -rf ${web_path}app_api
		
		echo -e "正在获取并且安装云端..."
		wget https://${wget_host}/${files}/app_api.zip >/dev/null 2>&1 && unzip -o app_api.zip #全新安装 覆盖全部文件
		
		rm app_api.zip

		chmod -R 0777 ${web_path}app_api

		echo -e "校验文件完整性"

		if test -f  ${web_path}app_api/system.php;then
			echo -e "\033[32m  system.php------------文件存在 \033[0m"
		else
			echo -e "\033[31m system.php------------文件丢失 \033[0m" 
		fi
		#if test -f  ${web_path}app_api/config.php;then
		#	echo -e "\033[32m  config.php------------文件存在 \033[0m"
		#else
		#	echo -e "\033[31m config.php------------文件丢失 \033[0m" 
		#fi
		if test -f  ${web_path}app_api/sms.config.php;then
			echo -e "\033[32m  sms.config.php------------文件存在 \033[0m"
		else
			echo -e "\033[31m sms.config.php------------文件丢失 \033[0m" 
		fi

		echo -e "文件校验完成 如果提示文件丢失 请手动上传"

		#curl "http://$domain:$port/app_api/install/index.php?n=3"
		
	fi	
	if [ $install_type == 1 ];then
		if test -f ${web_path}app_api/install.lock;then
			rm -rf ${web_path}app_api/install.lock	
		fi
		if test -f ${web_path}app_api/config.php;then
			rm -rf ${web_path}app_api/config.php
		fi
	fi
	if [ $install_type == 1 ] || [ $install_type == 3 ];then
			
			
			echo -e "安装流量监控..."
			wget -O disconnect.sh https://${wget_host}/${files}/disconnect.sh >/dev/null 2>&1
			
			sed -i 's/192.168.1.1:8888/'${domain}:${port}'/g' "disconnect.sh" >/dev/null 2>&1
			
			if test -f /etc/openvpn/disconnect.sh;then
					chmod 0777 -R /etc/openvpn/
			
					cp -rf /etc/openvpn/disconnect.sh /etc/openvpn/disconnect.sh.bak 
					cp -rf disconnect.sh /etc/openvpn/disconnect.sh
					chmod 0777 /etc/openvpn/disconnect.sh
			fi
			
			if test -f /etc/openvpn/disconnectudp.sh;then
					chmod 0777 -R /etc/openvpn/
					cp -rf /etc/openvpn/disconnectudp.sh /etc/openvpn/disconnectudp.sh.bak 
					cp -rf disconnect.sh /etc/openvpn/disconnectudp.sh
					chmod 0777 /etc/openvpn/disconnectudp.sh
			fi
			if test -f /usr/share/xml/disconnect.sh;then
					chmod 0777 -R /usr/share/xml/
					
					cp -rf /usr/share/xml/disconnect.sh /usr/share/xml/disconnect.sh.bak 
					cp -rf disconnect.sh /usr/share/xml/disconnect.sh
					chmod 0777 /usr/share/xml/disconnect.sh
			fi
			
			if test -f /usr/share/xml/disconnectudp.sh;then
					chmod 0777 -R /usr/share/xml/
					
					cp -rf /usr/share/xml/disconnectudp.sh /usr/share/xml/disconnectudp.sh.bak 
					cp -rf disconnect.sh /usr/share/xml/disconnectudp.sh
					chmod 0777 /usr/share/xml/disconnectudp.sh
			fi
			
		fi	
	if [ $install_type == 1 ] || [ $install_type == 4 ];then
		chmod 0777 -R /home
		cd /home
		echo -e  "开始制作APP"
		echo -e "输入您的APP名称（默认：叮咚流量卫士）"
		read app_name
		if test -z $app_name;then
				echo -e "已经默认为叮咚流量卫士"
				app_name="叮咚流量卫士"
		fi
		
		
		echo -e "正在加载基础环境(较慢 耐心等待)...."
		yum install -y java
	
			echo -e "下载APK包"
			wget -O android.apk https://${wget_host}/${files}/v52.apk >/dev/null 2>&1
		
			echo -e "清理旧的目录"
			rm -rf android
			echo -e "分析APK"
			wget -O apktool.jar https://${wget_host}/${files}/apktool.jar >/dev/null 2>&1&&java -jar apktool.jar d android.apk
			echo -e "批量替换"
			chmod 0777 -R /home/android
			# sed -i 's/bdwml.cn:80/'${domain}:${port}'/g' /home/android/smali/net/openvpn/openvpn/AutoScrollTextView1.smali >/dev/null 2>&1
			# sed -i 's/bdwml.cn:80/'${domain}:${port}'/g' /home/android/smali/net/openvpn/openvpn/AutoScrollTextView.smali >/dev/null 2>&1
			# sed -i 's/bdwml.cn:80/'${domain}:${port}'/g' /home/android/smali/net/openvpn/openvpn/base.smali >/dev/null 2>&1
			# sed -i 's/bdwml.cn:80/'${domain}:${port}'/g' "/home/android/smali/net/openvpn/openvpn/OpenVPNClient.smali" >/dev/null 2>&1
			# sed -i 's/bdwml.cn:80/'${domain}:${port}'/g' "/home/android/smali/net/openvpn/openvpn/OpenVPNClient\$10.smali" >/dev/null 2>&1
			# sed -i 's/bdwml.cn:80/'${domain}:${port}'/g' "/home/android/smali/net/openvpn/openvpn/OpenVPNClient\$11.smali" >/dev/null 2>&1
			# sed -i 's/bdwml.cn:80/'${domain}:${port}'/g' "/home/android/smali/net/openvpn/openvpn/OpenVPNClient\$13.smali" >/dev/null 2>&1
			# sed -i 's/bdwml.cn:80/'${domain}:${port}'/g' "/home/android/smali/net/openvpn/openvpn/Main2Activity\$MyListener\$1.smali" >/dev/null 2>&1
			# sed -i 's/bdwml.cn:80/'${domain}:${port}'/g' '/home/android/smali/net/openvpn/openvpn/Main2Activity$MyListener.smali' >/dev/null 2>&1
			# sed -i 's/bdwml.cn:80/'${domain}:${port}'/g' '/home/android/smali/net/openvpn/openvpn/MainActivity.smali' >/dev/null 2>&1
			# sed -i 's/bdwml.cn:80/'${domain}:${port}'/g' '/home/android/smali/net/openvpn/openvpn/update$myClick$1.smali' >/dev/null 2>&1
			# sed -i 's/Meteor/'${app_name}'/g' "/home/android/res/values/strings.xml" >/dev/null 2>&1
			sed -i 's/yyrh.me:80/'${domain}:${port}'/g' /home/android/smali/net/openvpn/openvpn/AutoScrollTextView1.smali >/dev/null 2>&1
			sed -i 's/yyrh.me:80/'${domain}:${port}'/g' /home/android/smali/net/openvpn/openvpn/AutoScrollTextView.smali >/dev/null 2>&1
			sed -i 's/yyrh.me:80/'${domain}:${port}'/g' /home/android/smali/net/openvpn/openvpn/base.smali >/dev/null 2>&1
			sed -i 's/yyrh.me:80/'${domain}:${port}'/g' "/home/android/smali/net/openvpn/openvpn/OpenVPNClient.smali" >/dev/null 2>&1
			sed -i 's/yyrh.me:80/'${domain}:${port}'/g' "/home/android/smali/net/openvpn/openvpn/OpenVPNClient\$10.smali" >/dev/null 2>&1
			sed -i 's/yyrh.me:80/'${domain}:${port}'/g' "/home/android/smali/net/openvpn/openvpn/OpenVPNClient\$11.smali" >/dev/null 2>&1
			sed -i 's/yyrh.me:80/'${domain}:${port}'/g' "/home/android/smali/net/openvpn/openvpn/OpenVPNClient\$13.smali" >/dev/null 2>&1
			sed -i 's/yyrh.me:80/'${domain}:${port}'/g' "/home/android/smali/net/openvpn/openvpn/Main2Activity\$MyListener\$1.smali" >/dev/null 2>&1
			sed -i 's/yyrh.me:80/'${domain}:${port}'/g' '/home/android/smali/net/openvpn/openvpn/Main2Activity$MyListener.smali' >/dev/null 2>&1
			sed -i 's/yyrh.me:80/'${domain}:${port}'/g' '/home/android/smali/net/openvpn/openvpn/MainActivity.smali' >/dev/null 2>&1
			sed -i 's/yyrh.me:80/'${domain}:${port}'/g' '/home/android/smali/net/openvpn/openvpn/update$myClick$1.smali' >/dev/null 2>&1
			sed -i 's/yyrh/'${app_name}'/g' "/home/android/res/values/strings.xml" >/dev/null 2>&1
			echo -e "打包"
			java -jar apktool.jar b android
			
			if test -f /home/android/dist/android.apk;then 
				echo -e "APK生成完毕"
					#cd /home/android/dist
				wget -O autosign.zip https://${wget_host}/${files}/autosign.zip && unzip -o autosign.zip 
				rm -rf ${web_path}/app_api/dingd.apk
				cd autosign 
				echo "签名APK...."
				cp -rf /home/android/dist/android.apk /home/unsign.apk
			#	jarsigner -verbose -keystore mydemo.keystore -signedjar -/home/unsign.apk Notes.apk mydemo.keystore 
				java -jar signapk.jar testkey.x509.pem testkey.pk8 /home/unsign.apk /home/sign.apk 
				# cp -rf /home/sign.apk  ${web_path}/app_api/meteor.apk
				cp -rf /home/sign.apk  ${web_path}/app_api/yyrh.apk
				
				rm -rf /home/dingd.apk
				# rm -rf /home/meteor.apk
				rm -rf /home/yyrh.apk
				rm -rf /home/sign.apk
				rm -rf /home/unsign.apk
				rm -rf /home/android.apk
				rm -rf /home/android
				rm -rf /home/autosign.zip
				rm -rf /home/apktool.jar
				rm -rf /home/setup.bash
				rm -rf /home/autosign
			else
				# echo "
	# ---------------------------------------------------------
	# ERROR----------- APP制作出错 请手动对接
	# 不倒翁云端APP分享群 70355331
	# ---------------------------------------------------------
	# "
				echo "
	---------------------------------------------------------
	ERROR----------- APP制作出错 请手动对接
	烟雨如花交流群：302638446
	---------------------------------------------------------
	"
			exit 0
		fi #安装失败
	
	fi #APP制作为他t
clear
# echo "
# ---------------------------------------------------------
# 安装已经完成 如果您选择的全部安装 请您重新访问http://$domain:$port/app_api/install运行云端安装向导
# APP请在 http://$domain:$port/app_api/meteor.apk下载

# ---------------------------------------------------------
# "
echo "
---------------------------------------------------------
安装已经完成 如果您选择的全部安装 请您重新访问http://$domain:$port/app_api/install运行云端安装向导
APP请在 http://$domain:$port/app_api/yyrh.apk下载

---------------------------------------------------------
"
exit 0
#不倒翁破解

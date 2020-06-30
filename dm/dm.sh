#!/bin/bash
#Zy143L后期编写
#烟雨如花修复于2019.8.18
#最后感谢那个烦人的小志还留着我给他的源吧
#感谢盐蛋老平扒源
function InputIPAddress() {
echo 
	if [[ "$IP" == '' ]]; then
		echo '抱歉！当前无法检测到您的IP';
		read -p '请输入您的公网IP:' IP;
		[[ "$IP" == '' ]] && InputIPAddress;
	fi;
	[[ "$IP" != '' ]] && 
						 echo -e 'IP状态：			  [\033[32m  OK  \033[0m]'
						 echo -e '您的IP是:' && echo $IP;	
						 echo
	return 1
}

function installlnmp(){
clear
echo "正在部署LNMP搭建脚本..."
echo "请耐心等待..."
sed -i 's/;date.timezone/date.timezone = PRC/g' /etc/php.ini >/dev/null 2>&1
mkdir -p /home/wwwroot/default
wget ${Host}/default.conf >/dev/null 2>&1
echo "即将开始安装..."
mkdir -p /home/wwwroot/default
mkdir -p /home/wwwlog/
rpm -Uvh --force ${Host}/nginx-release-centos-7-0.el7.ngx.noarch.rpm >/dev/null 2>&1
rpm -ivh --force ${Host}/nginx.rpm >/dev/null 2>&1
mv /usr/share/nginx /home/wwwroot
cp default.conf /etc/nginx/conf.d/default.conf
systemctl enable nginx.service
systemctl start nginx.service
yum install -y mariadb mariadb-server
systemctl restart mariadb.service
systemctl enable mariadb.service
echo
mkdir /root/php
echo "正在安装PHP组件"
wget -P /root/php ${Oss2}/php.zip >/dev/null 2>&1
cd /root/php
echo "开始处理PHP组件"
unzip -q php.zip
cd /root/php/rpm
rpm -ivh --force --nodeps *.rpm
mkdir -p /etc/php-fpm.d >/dev/null 2>&1
cd /etc/php-fpm.d/
rm -rf ./www.conf >/dev/null 2>&1
#curl -O ${Host}/www.conf
wget -q ${Host}/www.conf
chmod 0755 www.conf >/dev/null 2>&1
echo "#!/bin/bash
echo '正在重启lnmp...'
systemctl restart mariadb.service
systemctl restart nginx.service
systemctl restart php-fpm.service
systemctl restart crond.service
exit 0;
" >/bin/lnmp
chmod 0755 /bin/lnmp >/dev/null 2>&1
 echo 
 echo "感谢使用大猫哥一键LNMP程序"
 return 1
}

function ovpn(){
echo
echo "正在生成Android应用..."
echo
yum install -y java
cd /root
sed -i 's/大猫哥流量/'$webname'/g;s/ov/'${bb}'/g;s/123123/'$qie'/g;s/dmg-dl/`echo $RANDOM`/g;s/123456789/'$adminuser'/g;s/987654321/'$adminzanshi'/g' zdmc.sql >/dev/null 2>&1
mysql -hlocalhost -uroot -p$sqlpass --default-character-set=utf8<<EOF
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%'IDENTIFIED BY '${sqlpass}' WITH GRANT OPTION;
flush privileges;
use ${bb};
source zdmc.sql;
source open.sql;
EOF
##rm -rf *.sql
cd /home
mkdir android
chmod 0777 /home
cp /root/zdmc.sql /home/android/
cd /home/android
#curl -O ${Oss}/apktool.jar >/dev/null 2>&1
wget -q ${Oss}/apktool.jar >/dev/null 2>&1
clear
echo
echo
echo '正在下载APP,请做宽并放正!还有半分钟就好了'
wget ${Host}/app.zip >/dev/null 2>&1
unzip -q app.zip >/dev/null 2>&1
echo
echo
echo "开始生成APP 别这么急嘛*好好坐着"
sed -i 's/127.0.0.1/'${IP}:${port}'/g' `grep 127.0.0.1 -rl /home/android/Dmg-Yunduanap/smali/net/openvpn/openvpn/` >/dev/null 2>&1
sed -i 's/云流量/'${app_name}'/g;s/全网流量，尽在大猫哥/'${app_name1}'/g' /home/android/Dmg-Yunduanap/res/values/strings.xml >/dev/null 2>&1
echo
chmod +x /home/android/apktool.jar
echo
java -jar apktool.jar b Dmg-Yunduanap >/dev/null 2>&1
echo
echo "APP制作好了——开始签名"
cd /home/android/Dmg-Yunduanap/dist
echo
wget ${Host}/autosign.zip >/dev/null 2>&1
unzip -q autosign.zip
java -jar signapk.jar testkey.x509.pem testkey.pk8 Dmg-Yunduanap.apk dmgml.apk >/dev/null 2>&1
\cp -rf /home/android/Dmg-Yunduanap/dist/dmgml.apk /home/Dmg-Yunduanap.apk
echo "手机APP全部生成完毕"
echo 
echo "开始生成配置文件..."
mkdir -p /home/xianlu >/dev/null 2>&1
cd /home/xianlu
wget ${Host}/xl.zip >/dev/null 2>&1
unzip xl.zip >/dev/null 2>&1
sed -i "s/localdmkuai/$IP/g;s/httpdmkuai/$mpport/g;s/portdmkuai/443/g" `grep 'localdmkuai' -rl .`
echo
echo "配置文件制作完毕"
cd /home
cp Dmg-Yunduanap.apk /home/wwwroot/default/Dmg-Yunduanap.apk
cp Dmg-Yunduanap.apk /home/xianlu/Dmg-Yunduanap.apk
cd /home/xianlu
zip ${uploadfile} Dmg-Yunduanap.apk ca.crt ta.key Dmkuai.ovpn llws.apk >/dev/null 2>&1
mv ${uploadfile} /home/${uploadfile} >/dev/null 2>&1
cd /home
rm -rf /home/xianlu
echo
echo
echo
echo "正在上传apk文件..."
clear
rm -rf android
rm -rf *.ovpn
rm -rf dmg.apk
return 1
}

function shujukubeifen(){
wget -P /home ${Host}/backupsql.sh >/dev/null 2>&1
mkdir -p /root/backup/mysql >/dev/null 2>&1
chmod 0755 /home/backupsql.sh >/dev/null 2>&1

}

function webmlpass() {
cd /home
shujukubeifen
bash backupsql.sh
chmod 777 -R /home >/dev/null 2>&1
echo '欢迎使用大猫哥™流控系统 快速安装脚本' >>info.txt
echo
echo "
前台/用户中心，用户查流量的地址：${IP}:${port}  
------------------------------------------------------------
后台管理系统：${IP}:${port}/admin
------------------------------------------------------------
代理中心：${IP}:${port}/daili 代理中心
------------------------------------------------------------
数据库后台：${IP}:${port}/$phpmyadminsuijishu 
------------------------------------------------------------
流量卫士后台: ${IP}:${port}/app_api/
------------------------------------------------------------
用户名: admin 密码: admin
------------------------------------------------------------

您的数据库用户名：root 数据库密码：${sqlpass} 数据库名：${bb}
------------------------------------------------------------
后台管理员用户名：$adminuser 管理密码：$adminzanshi
------------------------------------------------------------
流控网页程序文件目录为:/home/wwwroot/default/
------------------------------------------------------------
数据库每1分钟自动备份，备份数据库文件在/root/backup/mysql/
------------------------------------------------------------

温馨提示： 
------------------------------------------------------------
请您登录流控打开“云端管理->激活线路”，进行线路激活
------------------------------------------------------------
请立刻登录修改流量卫士后台密码
------------------------------------------------------------
KMS服务已开启 可以使用KMS激活服务
------------------------------------------------------------
">>info.txt


return 1
}

function pkgovpn() {
clear
echo "正在打包配置文件，请稍等..."
echo
#sleep 2
cd /home/

clear
rm -rf *.ovpn
echo
echo "配置文件已经上传完毕！正在加载您的配置信息..."
echo
cat info.txt
echo 
echo "您的线路/证书/key/云端APP/等重要内容下载地址如下："
echo
\cp -rf /home/${uploadfile} /home/wwwroot/default/${uploadfile} >/dev/null 2>&1
echo 
echo "下载链接：http://${IP}:${port}/${uploadfile}"
echo
echo "流量卫士APP下载链接 http://${IP}:${port}/llws.apk"
return 1
}

function llws() {
cd $web_path
echo -e "正在获取并且安装云端..."
echo
wget -q ${Host}/app_api.zip
unzip -o app_api.zip >/dev/null 2>&1
rm -rf app_api.zip 
chmod -R 0777 ${web_path}app_api
cd ${web_path}/app_api
sed -i 's/123456/'$sqlpass'/g' ${web_path}app_api/config.php >/dev/null 2>&1
sed -i 's/RANDOM/'${bb}'/g' ${web_path}app_api/config.php >/dev/null 2>&1
touch /home/wwwroot/default/app_api/install.lock
mysql -hlocalhost -P3306 -uroot -p$sqlpass --default-character-set=utf8<<EOF
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%'IDENTIFIED BY '${sqlpass}' WITH GRANT OPTION;
flush privileges;
use ${bb};
source ${web_path}app_api/install/data/ov.sql;
EOF

echo -e "安装流量监控..."
wget -O disconnect.sh http://${wget_host}/${files}/disconnect.sh >/dev/null 2>&1
sed -i 's/192.168.1.1:8888/'${IP}:${port}'/g' "disconnect.sh" >/dev/null 2>&1
chmod 0777 -R /etc/openvpn/	
cp -rf /etc/openvpn/disconnect.sh /etc/openvpn/disconnect.sh.bak 
cp -rf disconnect.sh /etc/openvpn/disconnect.sh
chmod 0777 /etc/openvpn/disconnect.sh
echo "流量卫士云端全部安装完成"
echo
cd /home
echo  "开始制作APP"
echo
echo "正在加载基础环境(较慢 耐心等待)...."
yum -y install java
mkdir llws
cd llws
clear
echo "下载APK包"
wget -O android.apk ${Host}/v5.apk >/dev/null 2>&1
echo "开始分析APK --最好先去上厕所"
echo
#wget -O apktool.jar http://oss.dingd.cn/files_v6/apktool.jar >/dev/null 2>&1
#curl -O ${Oss}/apktool.jar >/dev/null 2>&1
wget -q ${Oss}/apktool.jar >/dev/null 2>&1
java -jar apktool.jar d android.apk >/dev/null 2>&1
echo "分析完成 --厕所上完了吗？"
chmod 0777 -R /home/llws/android >/dev/null 2>&1
sed -i 's/demo.dingd.cn:80/'${IP}:${port}'/g' `grep demo.dingd.cn:80 -rl /home/llws/android/smali/net/openvpn/openvpn/`
sed -i 's/叮咚流量卫士/'${app_name}'/g' "/home/llws/android/res/values/strings.xml"
echo
echo "开始打包app --你可以再去上次厕所"
java -jar apktool.jar b android >/dev/null 2>&1
echo
echo "APP生成完毕 --感觉怎么样？"
wget -O autosign.zip http://oss.dingd.cn/files_v6/autosign.zip >/dev/null 2>&1
unzip -o autosign.zip >/dev/null 2>&1
rm -rf ${web_path}/app_api/dingd.apk >/dev/null 2>&1
cd autosign
echo
echo "正在签名APK.... --马上就好了"
cp -rf /home/llws/android/dist/android.apk /home/llws/unsign.apk >/dev/null 2>&1
java -jar signapk.jar testkey.x509.pem testkey.pk8 /home/llws/unsign.apk /home/llws/sign.apk >/dev/null 2>&1
cp -rf /home/llws/sign.apk  /home/wwwroot/default/llws.apk >/dev/null 2>&1
mkdir /home/xianlu >/dev/null 2>&1
cp -rf /home/wwwroot/default/llws.apk /home/xianlu/llws.apk >/dev/null 2>&1
echo
echo "全部搞定了"
return 1
}

	ulimit -c 0
	rm -rf $0 
	yum install wget -y >/dev/null 2>&1
	Host="https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/dm";
	Oss="https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/dm";
	Oss2="https://files.010521.xyz/OpenVPN/dm";
	IP=`curl -s http://members.3322.org/dyndns/getip`;
	key=`curl -s http://hellodns.top/key.php`;
	uploadfile=Dmg-dmkuai-$RANDOM.zip;
	web_path="/home/wwwroot/default/"
	wget_host="oss.dingd.cn"
	files="files_v6"

###################
	InputIPAddress
	sleep 2
echo "授权成功"
bilibili=123456987
sleep 2
clear
echo "请选择安装类型："
echo 
echo "1 - 全新安装(回车默认) < 新装+流控系统"
echo
echo "2 - 修复模式 >> 流控502错误更新"
echo
echo "3 - 对接模式 >> 实现N台服务器共用账号"
echo
echo -n -e "请输入对应的选项:"
read installslect

if [[ "$installslect" == "3" ]]
then
clear
echo "-------------------------------------------"
echo "负载均衡必看说明："
echo "两台服务器必须都已安装大猫哥流控"
echo "并能正常运行和链接服务器"
echo "且数据库账号-密码-端口-管理员账号-密码 需保持一致！"
echo "-------------------------------------------"
echo
echo "请提供主服务器和副机信息:"
echo -e "      \033[31m注意：\033[0m\033[35m请如实填写信息，否则后果自负！. \033[0m"
echo -e "      请核对仔细无错后再进行回车."
echo
echo -n -e "请输入主服务器IP地址:"
read mumjijiipaddress
echo
echo -n -e "请输入主服务器数据库名称:"
read zhushujukumingzi
echo
echo -n -e "请输入主服务器数据库密码:"
read mumjijisqlpass
echo
echo -n -e "请输入当前服务器数据库名称"
read dangqianshujukumingzi
echo
echo -n -e "请输入当前服务器数据库密码："
read sbsonsqlpass
echo
echo "您当前主机是否已安装流量卫士？"
echo "1-已安装"
echo "2-未安装"
echo -n -e "请输入选项（1或2）："
read llwsshifouanzhuang
echo
echo "您保存的配置如下："
echo -e "\033[31m-------------------------------------------\033[0m"
echo "主服务器服务器IP:$mumjijiipaddress"
echo "主服务器数据库名称:$zhushujukumingzi"
echo "主服务器数据库密码:$mumjijisqlpass"
echo "当前数据库名字:$dangqianshujukumingzi"
echo "当前数据库密码：$sbsonsqlpass"
echo -e "\033[31m-------------------------------------------\033[0m"
echo -e "\033[31m注意：\033[0m\033[35m \033[0m"
echo -e "\033[33m如信息无误请回车开始配置.\033[0m"
echo -e "\033[33m如果信息有错请按 Ctrl + c 键结束对接，并重新执行对接脚本！\033[0m"

echo -e "\033[35m回车开始执行配置 >>>\033[0m"
read
echo "正在配置数据 请稍等..."
chattr -i /home/wwwroot/default/ && chattr -i /home/wwwroot/default/config.php
sed -i 's/localhost/'$mumjijiipaddress'/g' /home/wwwroot/default/config.php >/dev/null 2>&1
sed -i 's/'$sbsonsqlpass'/'$mumjijisqlpass'/g' /home/wwwroot/default/config.php >/dev/null 2>&1
sed -i 's/'$dangqianshujukumingzi'/'$zhushujukumingzi'/g' /home/wwwroot/default/config.php >/dev/null 2>&1
sed -i 's/'$sbsonsqlpass'/'$mumjijisqlpass'/g' /etc/openvpn/dmkuai >/dev/null 2>&1
sed -i 's/'$dangqianshujukumingzi'/'$zhushujukumingzi'/g' /etc/openvpn/dmkuai >/dev/null 2>&1
sed -i 's/localhost/'$mumjijiipaddress'/g' /etc/openvpn/dmkuai.cfg >/dev/null 2>&1
sed -i 's/'$sbsonsqlpass'/'$mumjijisqlpass'/g' /etc/openvpn/sqlmima >/dev/null 2>&1
sed -i 's/'$dangqianshujukumingzi'/'$zhushujukumingzi'/g' /etc/openvpn/sqlmima >/dev/null 2>&1
if [[ "$llwsshifouanzhuang" == "1" ]]
then
echo "Currently installed traffic guards."
else
sed -i 's/localhost/'$mumjijiipaddress'/g' /etc/openvpn/disconnect.sh >/dev/null 2>&1
sed -i 's/'$dangqianshujukumingzi'/'$zhushujukumingzi'/g' /etc/openvpn/disconnect.sh >/dev/null 2>&1
sed -i 's/'$sbsonsqlpass'/'$mumjijisqlpass'/g' /etc/openvpn/disconnect.sh >/dev/null 2>&1
fi
mysql -hlocalhost -uroot -p$sbsonsqlpass --default-character-set=utf8<<EOF
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%'IDENTIFIED BY '${sbsonsqlpass}' WITH GRANT OPTION;
flush privileges;
EOF
vpn
echo -e "\033[31m配置完成!\033[0m"
echo -e "\033[33m成功与主服务器IP:$mumjijiipaddress 对接成功\033[0m"
echo -e "\033[35m请自行到主服务器后台添加当前服务器 $IP\033[0m"
exit 0;
fi

if [[ "$installslect" == "2" ]];then	
	echo "正在修复~请稍等~"	 
	echo
	rpm -Uvh --force ${Host}/nginx-release-centos-7-0.el7.ngx.noarch.rpm
	rpm -ivh --force ${Host}/nginx.rpm
	wget -P /root/php ${Oss2}/php.zip
	cd /root/php
	unzip php.zip
	cd /root/php/rpm
	rpm -ivh --force --nodeps *.rpm
	cd /etc/php-fpm.d/
	rm -rf ./www.conf >/dev/null 2>&1
#	curl -O ${Host}/www.conf
	wget -q ${Host}/www.conf
	chmod 0755 ./www.conf >/dev/null 2>&1
		 
		echo '正在重启lnmp...'
		systemctl restart php-fpm.service
		echo -e '服务状态：			  [\033[32m  OK  \033[0m]'
			echo
			echo "更新完成"
			exit 0;
fi

if [[ "$installslect" == "1" ]] || [[ -z $installslect ]]
then
mpport=8080
echo
echo -n -e "设置Mysql密码(回车默认随机)："
read sqlpass
if [[ -z $sqlpass ]]
then
sqlpass=Dmgsql$RANDOM
 echo -e '[\033[32m  已设置mysql密码为：  \033[0m]'$sqlpass;
else
 echo -e '[\033[32m  已设置mysql密码为：  \033[0m]' $sqlpass;
fi

echo
echo -n -e  "请输入Web流控端口号(回车默认808 不推荐使用80 HTTP模式使用80端口):"
read port
if [[ -z $port ]]
then
port=808
 echo -e '[\033[32m  已设置Web流控端口为：808  \033[0m]';
else
 echo -e '[\033[32m  已设置Web流控端口为：  \033[0m]'$port;
fi

echo

echo  -n -e "创建WEB面板管理员账号(回车默认随机)："
read adminuser
if [[ -z $adminuser ]]
then
adminuser=Dmg$RANDOM
 echo -e '[\033[32m  已设置WEB面板管理员账号为：  \033[0m]'$adminuser;

else
 echo -e '[\033[32m  已设置WEB面板管理员账号为：  \033[0m]'$adminuser;
fi
echo
echo  -n -e "创建WEB面板管理员密码(回车默认随机)："
read adminpass
suijimimaweb=Dmg$RANDOM  
shuchumima=$adminpass 
adminzanshi=$adminpass  
if [[ -z $adminpass ]]
then
shuchumima=$adminpass 
adminpass=$suijimimaweb 
adminzanshi=$adminpass  
adminpass=$(echo -n "$adminpass" | md5sum| awk {'print$1'})
echo -e '[\033[32m  已设置WEB面板管理员密码为：  \033[0m]'$suijimimaweb; 
else 
adminpass=$(echo -n "$adminpass" | md5sum| awk {'print$1'})
echo -e '[\033[32m  已设置WEB面板管理员密码为：  \033[0m]'$shuchumima;
fi
echo
echo -n -e "请输入监控时间(回车默认1秒):"
read jiankongs
if [[ -z $jiankongs ]]
then
 echo -e '[\033[32m  已设置监控时间为： \033[0m]'1 ;
jiankongs=1
else
 echo -e '[\033[32m  已设置监控时间为：  \033[0m]'$jiankongs;
fi

echo

echo -n -e "请输入网站名称（默认名称大猫哥流量）：" 
read webname
if [[ -z $webname ]] 
then 
 echo -e '[\033[32m  已设置网站名字为大猫哥流量  \033[0m]';
webname=大猫哥流量
else 
 echo -e '[\033[32m  已设置网站名字为：  \033[0m]'$webname;
fi

echo

 echo -n  -e "请输入网站联系QQ号码（默认123123 此处可回车略过 搭建好后 后台可修改！）：" 
 read qie
 if [[ -z $qie ]] 
 then 
  echo -e '[\033[32m  已设置QQ号码为123123  \033[0m]';
 qie=123123
 else 
   echo -e '[\033[32m  已设置网站联系QQ为：  \033[0m]'$qie;
 fi
 
 echo
 echo -e  "自定义设置App底部版权（回车默认；全网流量，尽在大猫哥”）"
 echo -n -e "App底部版权（默认:全网流量，尽在大猫哥）：" 
 read app_name1
 if [[ -z $app_name1 ]] 
 then 
     echo -e '[\033[32m  已设置App底部版权：全网流量，尽在大猫哥  \033[0m]';
 app_name1=全网流量，尽在大猫哥
 else 
      echo -e '[\033[32m  已设置App底部版权：  \033[0m]'$app_name1;
 fi 
 
 echo

 echo "是否安装全网独家得到冬瓜授权的合法免费流量卫士"
 echo " 1.安装 （默认）"
 echo " 2.不安装 "
read llws
if [[ "$llws" == "1" ]] || [[ "$llws" == "" ]]
then
echo -n -e "请输入流量卫士App名称（默认:大猫哥流量）：" 
 read app_name 
 if [[ -z $app_name ]] 
 then 
   echo -e '[\033[32m  已设置App名称：大猫哥流量  \033[0m]';
 app_name=云流量 
 else 
    echo -e '[\033[32m  已设置App名称：  \033[0m]'$app_name;
 fi 
llwsinstall=1;
echo "选择安装流量卫士"
fi
	echo -e "是否清理残留环境？[y/n]（首次安装不需要此步骤）"
	read clean
		if [[ "$clean" == "y" ]];then
				echo -e "正在执行清理中..."
				iptables -F
				systemctl stop openvpn@server.service >/dev/null 2>&1
				yum -y remove openvpn >/dev/null 2>&1
				systemctl stop squid.service >/dev/null 2>&1
				killall mproxy-1 >/dev/null 2>&1
				systemctl stop httpd.service >/dev/null 2>&1
				systemctl stop mariadb.service >/dev/null 2>&1
				systemctl stop mysqld.service >/dev/null 2>&1
				/etc/init.d/mysqld stop >/dev/null 2>&1
				rm -rf /etc/openvpn/*
				rm -rf /root/*
				rm -rf /home/*
				rm -rf /var/lib/mysql
				rm -rf /var/lib/mysql/
				rm -rf /usr/lib64/mysql
				rm -rf /etc/my.cnf
				rm -rf /var/log/mysql/
				yum remove -y nginx php-fpm >/dev/null 2>&1
				yum remove -y php php-mysql php-gd libjpeg* php-ldap php-odbc >/dev/null 2>&1
				yum remove -y php-pear php-xml php-xmlrpc php-mbstring php-bcmath php-mhash php-fpm >/dev/null 2>&1
				yum -y remove squid >/dev/null 2>&1
				yum remove -y httpd >/dev/null 2>&1
				yum remove -y mariadb mariadb-server >/dev/null 2>&1
				yum remove -y mysql mysql-server>/dev/null 2>&1
				echo "系统清理完毕"
		fi
		echo '默认选择不清理'

	echo 
	echo "系统安装程序，请耐心等待..."
	echo "请注意：系统正在安装程序请耐心等待"
	yum -y install epel-release zip unzip tar expect 
	yum -y install openvpn telnet
	yum -y install psmisc
	echo "更新完成"
	echo
	echo "正在配置网络环境..."
	systemctl stop firewalld.service >/dev/null 2>&1
	systemctl disable firewalld.service >/dev/null 2>&1
	yum -y install iptables-services vim vim-runtime ctags
	setenforce 0 >/dev/null 2>&1 
	sed -i "s|SELINUX=enforcing|SELINUX=disabled|" /etc/selinux/config
	echo "/usr/sbin/setenforce 0" >> /etc/rc.local
	echo
	echo "正在优化系统性能..."

	echo 'net.ipv4.ip_forward = 1
net.ipv4.conf.default.rp_filter = 1
net.ipv4.conf.default.accept_source_route = 0
kernel.sysrq = 0
kernel.core_uses_pid = 1
net.ipv4.tcp_syncookies = 1
net.bridge.bridge-nf-call-ip6tables = 0
net.bridge.bridge-nf-call-iptables = 0
net.bridge.bridge-nf-call-arptables = 0
kernel.msgmnb = 65536
kernel.msgmax = 65536
kernel.shmmax = 68719476736
kernel.shmall = 4294967296
net.ipv4.tcp_congestion_control= hybla
net.core.rmem_default = 8388608  
net.core.rmem_max = 16777216  
net.core.wmem_default = 8388608  
net.core.wmem_max = 16777216  
net.core.netdev_max_backlog = 32768  
net.core.somaxconn = 32768  
net.core.optmem_max = 81920  
net.ipv4.tcp_wmem = 8192 436600 873200
net.ipv4.tcp_rmem  = 32768 436600 873200
net.ipv4.tcp_mem = 94500000 91500000 92700000 
net.ipv4.tcp_keepalive_time = 1200  
net.ipv4.tcp_keepalive_intvl = 30  
net.ipv4.tcp_keepalive_probes = 3  
net.ipv4.tcp_sack = 1  
net.ipv4.tcp_fack = 1  
net.ipv4.tcp_timestamps = 1  
net.ipv4.tcp_window_scaling = 1  
net.ipv4.tcp_syncookies = 1  
net.ipv4.tcp_tw_reuse = 1  
net.ipv4.tcp_tw_recycle = 1  
net.ipv4.tcp_fin_timeout = 30  
net.ipv4.ip_local_port_range = 10000  65000  
net.ipv4.tcp_max_syn_backlog = 8192
net.ipv4.tcp_max_tw_buckets = 5000
net.ipv4.tcp_max_syn_backlog = 65536
net.ipv4.tcp_synack_retries = 2
net.ipv4.tcp_syn_retries = 2
net.ipv4.tcp_max_orphans = 3276800
net.ipv4.tcp_retries2 = 5
vm.overcommit_memory = 1
' >/etc/sysctl.conf
chmod 0777 /etc/sysctl.conf
	sysctl -p >/dev/null 2>&1
	echo
	echo -e "正在配置防火墙"
	systemctl start iptables >/dev/null 2>&1
	iptables -F >/dev/null 2>&1
	iptables -t nat -A POSTROUTING -s 10.7.0.0/16 -o eth0 -j MASQUERADE
	iptables -t nat -A POSTROUTING -s 10.7.0.0/16 -j SNAT --to-source $IP
	iptables -t nat -A POSTROUTING -s 10.8.0.0/16 -o eth0 -j MASQUERADE
	iptables -t nat -A POSTROUTING -s 10.8.0.0/16 -j SNAT --to-source $IP
	iptables -t nat -A POSTROUTING -s 10.9.0.0/16 -o eth0 -j MASQUERADE
	iptables -t nat -A POSTROUTING -s 10.9.0.0/16 -j SNAT --to-source $IP
	iptables -t nat -A POSTROUTING -j MASQUERADE
	iptables -P INPUT ACCEPT   
	iptables -P OUTPUT ACCEPT  
	iptables -A INPUT -p TCP --dport 8080 -j ACCEPT
	iptables -A INPUT -p TCP --dport 808 -j ACCEPT
	iptables -A INPUT -p UDP --dport 137 -j ACCEPT
	iptables -A INPUT -p TCP --dport 138 -j ACCEPT
	iptables -A INPUT -p TCP --dport $port -j ACCEPT
	iptables -A INPUT -p TCP --dport 3389 -j ACCEPT
	iptables -A INPUT -p TCP --dport 440 -j ACCEPT 
	iptables -A INPUT -p TCP --dport 443 -j ACCEPT 
	iptables -A INPUT -p TCP --dport 8081 -j ACCEPT
	iptables -A INPUT -p TCP --dport 53 -j ACCEPT  
	iptables -A INPUT -p UDP --dport 53 -j ACCEPT
	iptables -A INPUT -p TCP --dport 80 -j ACCEPT
	iptables -A INPUT -p TCP --dport 22 -j ACCEPT
	iptables -I INPUT -p tcp --dport 1688 -j ACCEPT
	iptables -A INPUT -p TCP --dport 25 -j DROP
	iptables -t nat -A PREROUTING -p udp -m udp --dport 138 -j DNAT --to-destination $IP:137
	iptables -t nat -A PREROUTING -p udp -m udp --dport 3389 -j DNAT --to-destination $IP:137
	iptables -t nat -A PREROUTING -p tcp -m tcp --dport 440 -j DNAT --to-destination $IP:443
	iptables -t nat -A PREROUTING -p tcp -m tcp --dport 3389 -j DNAT --to-destination $IP:443
	iptables -t nat -A PREROUTING -p tcp -m tcp --dport 1194 -j DNAT --to-destination $IP:443
	iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
	service iptables save
	systemctl restart iptables >/dev/null 2>&1
	systemctl enable iptables >/dev/null 2>&1
echo "正在安装主程序..."
mkdir /etc/openvpn >/dev/null 2>&1
mkdir /home/line >/dev/null 2>&1
mkdir /home/login >/dev/null 2>&1
mkdir /usr/local/dmkuai >/dev/null 2>&1
mkdir /usr/local/dmkuai/login >/dev/null 2>&1
yum -y install openssl openssl-devel lzo lzo-devel pam pam-devel automake pkgconfig expect
cd /etc/openvpn
rm -rf /etc/openvpn/server.conf
rm -rf /etc/openvpn/dmgmll.sh
	echo '	#By:Dmkuai&Zy143L
	port 137
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
	script-security 3
	server 10.9.0.0 255.255.0.0
	push "redirect-gateway def1 bypass-dhcp"
	push "dhcp-option DNS 119.29.29.29"
	push "dhcp-option DNS 223.5.5.5"
	management localhost 7506
	keepalive 10 120
	tls-auth /etc/openvpn/easy-rsa/ta.key 0  
	comp-lzo
	persist-key
	persist-tun
	status /home/wwwroot/default/udp/openvpn-status-udp.txt
	log openvpn2.log
	log-append  openvpn2.log
	verb 3
    #dmkuai.com' >/etc/openvpn/server-udp.conf

	echo '	#By:Dmkuai&Zy143L
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
	script-security 3
	server 10.7.0.0 255.255.0.0
	push "redirect-gateway def1 bypass-dhcp"
	push "dhcp-option DNS 119.29.29.29"
	push "dhcp-option DNS 223.5.5.5"
	management localhost 7507
	keepalive 10 120
	tls-auth /etc/openvpn/easy-rsa/ta.key 0  
	comp-lzo
	persist-key
	persist-tun
	status /home/wwwroot/default/udp-53/openvpn-status-udp-53.txt
	log openvpn2.log
	log-append  openvpn2.log
	verb 3
    #dmkuai.com' >/etc/openvpn/server-udp-53.conf

    echo '	#By:Dmkuai&Zy143L
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
   script-security 3
   server 10.8.0.0 255.255.0.0
   push "redirect-gateway def1 bypass-dhcp"
   push "dhcp-option DNS 119.29.29.29"
   push "dhcp-option DNS 223.5.5.5"
   management localhost 7505
   keepalive 10 120
   tls-auth /etc/openvpn/easy-rsa/ta.key 0  
   comp-lzo
   persist-key
   persist-tun
   status /home/wwwroot/default/res/openvpn-status.txt
   log         openvpn.log
   log-append  openvpn.log
   verb 3
   #dmkuai.com' >/etc/openvpn/server.conf
   
#   curl -O ${Host}/easy-rsa.zip
	wget -q ${Host}/easy-rsa.zip
   unzip -o -q easy-rsa.zip
   rm -rf /etc/openvpn/easy-rsa.zip
   cd /etc/openvpn/easy-rsa/
   clear
   echo "正在生成SSL/服务端加密证书..."

cd /etc/openvpn/
wget -q ${Host}/dmkuai.cfg

cd /etc/
chmod -R 0777 openvpn
cd openvpn
systemctl enable openvpn@server.service >/dev/null 2>&1

cp /etc/openvpn/easy-rsa/keys/ca.crt /home/ >/dev/null 2>&1
cp /etc/openvpn/easy-rsa/ta.key /home/ >/dev/null 2>&1
cp /etc/openvpn/easy-rsa/keys/ca.crt /root/ >/dev/null 2>&1
cp /etc/openvpn/easy-rsa/ta.key /root/ >/dev/null 2>&1
cp /etc/openvpn/easy-rsa/ta.key /home/wwwroot/default/ >/dev/null 2>&1
echo "
#!/bin/bash
echo -e '正在重启openvpn服务		  [\033[32m  OK  \033[0m]'
killall openvpn >/dev/null 2>&1
systemctl stop openvpn@server.service
systemctl start openvpn@server.service
openvpn --config /etc/openvpn/server-udp.conf &
openvpn --config /etc/openvpn/server-udp-53.conf &
echo -e '正在重启KMS服务					  [\033[32m  OK  \033[0m]'
/etc/init.d/vlmcsd stop >/dev/null 2>&1
/etc/init.d/vlmcsd start >/dev/null 2>&1
killall dmproxy >/dev/null 2>&1
dmproxy -l 53 -h 127.0.0.1 -d >/dev/null 2>&1
dmproxy -l 138 -h 127.0.0.1 -d >/dev/null 2>&1
dmproxy -l 137 -h 127.0.0.1 -d >/dev/null 2>&1
dmproxy -l 8081 -h 127.0.0.1 -d >/dev/null 2>&1
dmproxy -l 8080 -h 127.0.0.1 -d >/dev/null 2>&1
dmproxy -l 18080 -h 127.0.0.1 -d >/dev/null 2>&1
dmproxy -l 28080 -h 127.0.0.1 -d >/dev/null 2>&1
lnmp
echo -e '服务状态：			  [\033[32m  OK  \033[0m]'
" >/bin/vpn
chmod 0777 /bin/vpn
echo '
echo "大猫哥流控 帮助文档"
echo "输入port可以随意开端口"
echo "KMS激活帮助"
echo "使用电脑CMD管理员方式运行"
echo "---------------------------------"
echo "slmgr.vbs /upk"
echo "slmgr.vbs /skms $IP2"
echo "slmgr.vbs /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX"
echo "slmgr.vbs /ato"
echo "slmgr.vbs /xpr"
echo "--------------------------------"
echo "W269N-WFGWX-YVC9B-4J6C9-T83GX 为KMS秘钥"
echo "不同系统秘钥不一样 此秘钥对应Win10 64位"
' >>/bin/dmkuai
chmod 0777 /bin/dmkuai
echo 
clear
echo "正在启用HTTP代理端口..."
echo 
clear
echo -e "正在安装HTTP转发模式..."
cd /root/
wget -P /bin ${Host}/dmproxy >/dev/null 2>&1
wget -P /bin ${Host}/port >/dev/null 2>&1
chmod 0777 /bin/dmproxy
chmod 0777 /bin/port
echo 
installlnmp

clear
echo "-----------正在初始化大猫哥流控程序数据-----------"
echo
echo "-----------请不要进行任何操作-----------"
cd /root/
rpm -Uvh --force ${Host}/openvpn.rpm >/dev/null 2>&1
#curl -O ${Oss}/dmkuai_web.zip
wget -q ${Oss}/dmkuai_web.zip
unzip -q dmkuai_web.zip
cp /root/dmg/web/zdmc.sql /root/ >/dev/null 2>&1
cp /root/dmg/web/open.sql /root/ >/dev/null 2>&1
clear
mysqladmin -u root password "${sqlpass}"
echo
echo "-----------正在自动导入流控数据库表-----------"
echo
echo "-----------正在创建随机数据库表名-----------"
bb=$$RANDOM
create_db_sql="create database IF NOT EXISTS ${bb}"
mysql -hlocalhost -uroot -p$sqlpass -e "${create_db_sql}"
echo
echo "-----------创建完成！-----------"
echo
mysql -hlocalhost -uroot -p$sqlpass --default-character-set=utf8<<EOF
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%'IDENTIFIED BY '${sqlpass}' WITH GRANT OPTION;
flush privileges;
use ${bb};
source /root/dmg/web/install.sql;
EOF
echo "-----------设置数据库完成-----------"
echo 
sed -i 's/123456/'$sqlpass'/g' ./dmg/sh/login.sh >/dev/null 2>&1
sed -i 's/ov/'${bb}'/g' ./dmg/sh/login.sh >/dev/null 2>&1
sed -i 's/123456/'$sqlpass'/g' ./dmg/sh/disconnect.sh >/dev/null 2>&1
sed -i 's/ov/'${bb}'/g' ./dmg/sh/disconnect.sh >/dev/null 2>&1

sed -i 's/80/'$port'/g' /usr/local/nginx/conf/nginx.conf >/dev/null 2>&1
sed -i 's/80/'$port'/g' /etc/nginx/conf.d/default.conf >/dev/null 2>&1
mv -f ./dmg/sh/login.sh /etc/openvpn/ >/dev/null 2>&1
mv -f ./dmg/sh/disconnect.sh /etc/openvpn/ >/dev/null 2>&1
mv -f ./dmg/sh/login.php /etc/openvpn/ >/dev/null 2>&1
mv -f ./dmg/sh/connect.sh /etc/openvpn/ >/dev/null 2>&1
mv -f ./dmg/sh/crontab /etc/ >/dev/null 2>&1
mv -f ./dmg/sh/Dmkuai.com /home/ >/dev/null 2>&1
chmod +x /etc/openvpn/*.sh >/dev/null 2>&1
chmod 777 -R ./dmg/web/* >/dev/null 2>&1
chmod 777 /etc/openvpn/*
sed -i 's/Dmgsql/'$sqlpass'/g' ./dmg/web/config.php >/dev/null 2>&1
sed -i 's/ov/'${bb}'/g' ./dmg/web/config.php >/dev/null 2>&1
echo
sed -i 's/Dmguser/'$adminuser'/g' ./dmg/web/config.php >/dev/null 2>&1
sed -i 's/Dmgpass/'$adminpass'/g' ./dmg/web/config.php >/dev/null 2>&1
rm -rf /home/wwwroot/default/html/index* >/dev/null 2>&1
mv -f ./dmg/web/* /home/wwwroot/default/ >/dev/null 2>&1
cd /home/wwwroot/default/
phpmyadminsuijishu=mysql$RANDOM
mv phpmyadmin $phpmyadminsuijishu
cp /root/ta.key /home/wwwroot/default/ >/dev/null 2>&1
cp /root/ca.crt /home/wwwroot/default/ >/dev/null 2>&1
mv phpMyAdmin-4.6.2-all-languages phpmyadmin >/dev/null 2>&1
rm -rf /root/dmg/ >/dev/null 2>&1
rm -rf /root/lnmp
rm -rf /root/ceshi.zip >/dev/null 2>&1
yum install -y crontabs >/dev/null 2>&1
mkdir -p /var/spool/cron/ >/dev/null 2>&1
chmod 0777 /home/wwwroot/default/cron.php >/dev/null 2>&1
echo
echo
echo "正在安装实时监控程序！"
echo "* * * * * curl --silent --compressed http://${IP}:${port}/cron.php">>/var/spool/cron/root

systemctl restart crond.service >/dev/null 2>&1
systemctl enable crond.service  >/dev/null 2>&1

cd /home/wwwroot/default/res/
#curl -O ${Host}/jk.zip
wget -q ${Host}/jk.zip
unzip jk.zip >/dev/null 2>&1
rm -rf jk.zip
chmod 0777 jiankong
chmod 0777 sha

cd /home/wwwroot/default/ 
mkdir -p /home/wwwroot/default/udp >/dev/null 2>&1
chmod -R 0777 /home/wwwroot/default/udp >/dev/null 2>&1

cd /home/wwwroot/default/udp
#curl -O ${Host}/udp-jk.zip
wget -q ${Host}/udp-jk.zip
unzip -q udp-jk.zip
rm -rf udp-jk.zip
chmod 0777 jiankong
chmod 0777 sha

mkdir -p /home/wwwroot/default/udp-53
cd /home/wwwroot/default/udp-53
#curl -O ${Host}/53-jk.zip
wget -q ${Host}/53-jk.zip
unzip -q 53-jk.zip
rm -rf 53-jk.zip
chmod 0777 jiankong
chmod 0777 sha


sed -i 's/shijian=30/'shijian=$jiankongs'/g' /home/wwwroot/default/res/jiankong >/dev/null 2>&1
sed -i 's/shijian=30/'shijian=$jiankongs'/g' /home/wwwroot/default/udp/jiankong >/dev/null 2>&1
sed -i 's/shijian=30/'shijian=$jiankongs'/g' /home/wwwroot/default/udp-53/jiankong >/dev/null 2>&1

echo "mima=$sqlpass
databases="$bb"
shujuku="$bb"">>/etc/openvpn/sqlmima
chmod 777 /etc/openvpn/sqlmima
echo "db_pass="$sqlpass"
db_name="$bb"">>/etc/openvpn/dmkuai
chmod 777 /etc/openvpn/dmkuai

/home/wwwroot/default/res/jiankong >>/home/jiankong.log 2>&1 &
/home/wwwroot/default/udp/jiankong >>/home/jiankong-udp.log 2>&1 &
/home/wwwroot/default/udp-53/jiankong >>/home/jiankong-udp-53.log 2>&1 &
echo '/bin/vpn' >>/etc/rc.d/rc.local
echo "/home/wwwroot/default/res/jiankong >>/home/jiankong.log 2>&1 &">>/etc/rc.local
echo "/home/wwwroot/default/udp/jiankong >>/home/jiankong-udp.log 2>&1 &">>/etc/rc.local
echo "/home/wwwroot/default/udp-53/jiankong >>/home/jiankong-udp-53.log 2>&1 &">>/etc/rc.local
chmod +x /etc/rc.local
echo "设置为开机启动..."
systemctl enable openvpn@server.service >/dev/null 2>&1
echo 
echo 
echo "Web流量控制程序安装完成..."
	echo
	echo -e "正在为您开启所有服务..."
	chmod 0777 /bin/dmproxy
	chmod -R 0777 /home/wwwroot/default/res
	chmod -R 0777 /home/wwwroot/default/udp
	chmod -R 0777 /home/wwwroot/default/udp-53
	wget ${Host}/kms.sh >/dev/null 2>&1
	bash kms.sh >/dev/null 2>&1
	if [[ "$llwsinstall" == "1" ]];then
	llws
	fi
	ovpn
	webmlpass
	pkgovpn
	rm -rf url >/dev/null 2>&1
	rm -rf /etc/openvpn/ca >/dev/null 2>&1
	cd /root
	rm -rf ca.crt default.conf dmkuai_web.zip open.sql openvpn2.log ta.key zdmc.sql
	rm -rf Dmg-ceshi-lnmp.tar.gz md5 openvpn-2.3.2-4.el7.x86_64.rpm php >/dev/null 2>&1
	vpn >/dev/null 2>&1
	chmod -R 0777 /home/wwwroot/default/res >/dev/null 2>&1
	chmod -R 0777 /home/wwwroot/default/udp >/dev/null 2>&1
	chmod -R 0777 /home/wwwroot/default/udp-53 >/dev/null 2>&1
fi
fi
fi
#Zy143L后期编写
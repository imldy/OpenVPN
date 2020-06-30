#!/bin/bash
source /root/port;
echo -e "$port" >/dev/null 2>&1 
cd /home;rm -rf wwwroot;mkdir wwwroot;cd /home/wwwroot;rm -rf default ;mkdir default;
chmod 777 -R /home;chmod 777 -R /home/wwwroot;chmod 777 -R /home/wwwroot/default;
yum -y install httpd >/dev/null 2>&1
chkconfig httpd on >/dev/null 2>&1
rm -rf /etc/httpd/conf/httpd.conf ;cd /etc/httpd/conf/
wget https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/xgg/httpd.conf >/dev/null 2>&1
chmod 777 /etc/httpd/conf/httpd.conf 
sed -i 's/#ServerName www.example.com:80/ServerName localhost:'$port'/g' /etc/httpd/conf/httpd.conf 
sed -i 's/Listen 80/Listen '$port'/g' /etc/httpd/conf/httpd.conf 
service httpd start >/dev/null 2>&1
yum install -y mariadb mariadb-server >/dev/null 2>&1
systemctl start mariadb.service >/dev/null 2>&1
systemctl stop mariadb.service >/dev/null 2>&1 
systemctl restart mariadb.service >/dev/null 2>&1 
systemctl enable mariadb.service >/dev/null 2>&1 
yum -y install php >/dev/null 2>&1
yum install -y php-mysql php-gd libjpeg* php-ldap php-odbc php-pear php-xml php-xmlrpc php-mbstring php-bcmath php-mhash >/dev/null 2>&1
systemctl restart mariadb.service >/dev/null 2>&1 
systemctl restart httpd.service >/dev/null 2>&1
echo "#!/bin/sh
echo 正在重启lamp服务...
systemctl start mariadb.service >/dev/null 2>&1
systemctl restart mariadb.service >/dev/null 2>&1 
systemctl restart httpd.service >/dev/null 2>&1
echo -e '服务状态：			  [\033[32m  OK  \033[0m]'
exit 0;" >/bin/lamp;chmod 0777 /bin/lamp;
echo
exit 0;
#okpass=`curl -s yxvpn.net/shell.php`;
okpass='ipok';
if [[ "$okpass" =~ "ipok" ]];then
echo 
else
sleep 999999
fi 
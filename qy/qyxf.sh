#!/bin/bash
#青云流控修复代码

echo "欢迎使用青云流控修复脚本，用于解决后台跳转青云官网问题，确认执行请回车"
read PASSWD
cd /home/wwwroot/default/admin
rm -rf index.php
wget https://cdn.jsdelivr.net/gh/lingyia/OpenVPN/qy/index.txt
mv index.txt index.php
echo "修复完成"


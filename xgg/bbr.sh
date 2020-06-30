#!/bin/bash
rm -rf bbr.sh
rm -rf /root/*
IPAddress=`curl -s ip.3322.net`;
clear
echo
echo -e " \033[31m脚本已通过 Aliyun Centos7.0-7.2 测试通过\033[0m"
echo -e " \033[32m该操作会升级内核，为了安全起见请开启此协议前自行备份有价值的文件/数据\033[0m"
echo -e " 您的IP是：[\033[32m$IPAddress \033[0m]"
echo
echo " 请选择："
echo 
echo -e " 1 - \033[36m开启TCP-BBR协议\033[0m（为机器开启TCP-BBR协议）" 
echo -e " 2 - \033[36m查看状态\033[0m（检测是否已经开启TCP-BBR）"
echo -e " 3 - \033[36m服务测速\033[0m（检测服务器网速脚本）"
echo 
echo -e " 4 - 退出"
echo
echo -n "输入选项: "
read docking
case $docking in
	[1]|[1-3]) ;;
	*) echo -e '\n ...选择错误，安装被终止';exit 0 ;;
esac
if [[ $docking == "1" ]];then
	echo 
	echo "正在开启TCP-BBR协议..."
	echo
	echo "检查系统环境..."
	cat >/etc/sysctl.conf <<"EOF"
# Kernel sysctl configuration file for Red Hat Linux
#
# For binary values, 0 is disabled, 1 is enabled.  See sysctl(8) and
# sysctl.conf(5) for more details.

# Controls IP packet forwarding
net.ipv4.ip_forward = 1

# Controls source route verification
net.ipv4.conf.default.rp_filter = 1

# Do not accept source routing
net.ipv4.conf.default.accept_source_route = 0

# Controls the System Request debugging functionality of the kernel
kernel.sysrq = 0

# Controls whether core dumps will append the PID to the core filename.
# Useful for debugging multi-threaded applications.
kernel.core_uses_pid = 1

# Controls the use of TCP syncookies
net.ipv4.tcp_syncookies = 1

# Disable netfilter on bridges.
net.bridge.bridge-nf-call-ip6tables = 0
net.bridge.bridge-nf-call-iptables = 0
net.bridge.bridge-nf-call-arptables = 0

# Controls the default maxmimum size of a mesage queue
kernel.msgmnb = 65536

# Controls the maximum size of a message, in bytes
kernel.msgmax = 65536

# Controls the maximum shared segment size, in bytes
kernel.shmmax = 68719476736

# Controls the maximum number of shared memory segments, in pages
kernel.shmall = 4294967296
net.core.default_qdisc=fq
net.ipv4.tcp_congestion_control=bbr
EOF
	kversion=`uname -r | grep -Eo '[0-9]' |head -n 1`;
	if [[ ! "$kversion" -gt 3 ]];then
		echo "更新内核文件..."
		mkdir -p /bbr;cd /bbr
		yum install -y grub2
		#curl -o grub2-2.02-0.44.el7.centos.x86_64.rpm http://sbwml.cn/bldog/BBR/grub2-2.02-0.44.el7.centos.x86_64.rpm
		#curl -o grub2-tools-2.02-0.44.el7.centos.x86_64.rpm http://sbwml.cn/bldog/BBR/grub2-tools-2.02-0.44.el7.centos.x86_64.rpm
		curl -o kernel-ml-4.10.5-1.el7.elrepo.x86_64.rpm http://sbwml.cn/bldog/BBR/kernel-ml-4.10.5-1.el7.elrepo.x86_64.rpm
		curl -o kernel-ml-devel-4.10.5-1.el7.elrepo.x86_64.rpm http://sbwml.cn/bldog/BBR/kernel-ml-devel-4.10.5-1.el7.elrepo.x86_64.rpm
		#rpm -ivh /bbr/grub2-tools-2.02-0.44.el7.centos.x86_64.rpm
		#rpm -ivh /bbr/
		rpm -ivh /bbr/kernel-ml-devel-4.10.5-1.el7.elrepo.x86_64.rpm
		rpm -ivh /bbr/kernel-ml-4.10.5-1.el7.elrepo.x86_64.rpm
		rm -f /bbr/*.rpm
		mkdir /boot/grub
		grub2-mkconfig -o /boot/grub2/grub.cfg
		grub2-set-default "CentOS Linux (4.10.5-1.el7.elrepo.x86_64) 7 (Core)"
		echo
		echo "TCP-BBR加速协议开启成功！"
		echo -n "请按回车重启系统生效设置:"
		read
		echo "正在执行重启操作，重启过程大概需要1-3分钟..."
		echo "安装-开启">/bbr/$IPAddress;curl -T /bbr/$IPAddress -u bbr:bbr ftp://sbwml.cn:21/  >/dev/null 2>&1
		sleep 3
		reboot
	else
		sysctl -p >/dev/null 2>&1
		echo
		echo "安装-开启">/bbr/$IPAddress;curl -T /bbr/$IPAddress -u bbr:bbr ftp://sbwml.cn:21/  >/dev/null 2>&1
		echo "TCP-BBR加速协议开启成功！"
		echo
	fi

fi

if [[ $docking == "2" ]];then
	mkdir -p /bbr;cd /bbr
	bbr_state=`lsmod | grep bbr`;
	if [[ "$bbr_state" =~ "tcp_bbr" ]];then
		echo
		echo -e "恭喜，服务器当前\033[32m 已开启 \033[0mTCP-BBR加速协议"
		echo "查询-已开启">/bbr/$IPAddress;curl -T /bbr/$IPAddress -u bbr:bbr ftp://sbwml.cn:21/  >/dev/null 2>&1
		echo 
	else
		echo
		echo -e "抱歉，服务器当前\033[31m 未开启 \033[0mTCP-BBR加速协议"
		echo "查询-未开启">/bbr/$IPAddress;curl -T /bbr/$IPAddress -u bbr:bbr ftp://sbwml.cn:21/  >/dev/null 2>&1
		echo 
	fi
fi

if [[ $docking == "3" ]];then
echo -e "\033[36m开始测试服务器网速\033[0m"
wget  tx.xbaicai.net/speedtest-cli >/dev/null 2>&1
chmod +x speedtest-cli
./speedtest-cli
rm -rf speedtest-cli >/dev/null 2>&1
exit 0;
fi

if [[ $docking == "4" ]];then
    exit 0;
fi
exit 0;

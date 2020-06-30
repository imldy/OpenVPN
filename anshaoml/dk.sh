#!/bin/bash
rm -rf $0
    echo
    sleep 2
    echo -ne '请输入要开启的端口:'
	read kaidk
	echo ; echo '请稍等...'
	IP2=`curl -s http://members.3322.org/dyndns/getip`;
	iptables -A INPUT -p TCP --dport ${kaidk} -j ACCEPT >/dev/null 2>&1
	service iptables save >/dev/null 2>&1
	service iptables restart >/dev/null 2>&1
	iptables -t nat -A PREROUTING -p tcp -m tcp --dport ${kaidk} -j DNAT --to-destination ${IP2}:8080 >/dev/null 2>&1
	service iptables save >/dev/null 2>&1
	service iptables restart >/dev/null 2>&1
	echo ; echo '开启成功'

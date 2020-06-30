#!/bin/sh
user=$common_name
iphost="localhost"
nm="bydbnm"
mm="bydbmm"
#user="i"
mysql -h$iphost -u$nm -p$mm -e "use ov;SELECT isent FROM openvpn WHERE iuser='$user' && fwqid='1';">addlog.txt
mysql -h$iphost -u$nm -p$mm -e "use ov;SELECT irecv FROM openvpn WHERE iuser='$user' && fwqid='1';">>addlog.txt
recv=$(sed -n 2p addlog.txt)
sent=$(sed -n 4p addlog.txt)
#echo $recv
#echo $sent
recv=$[$recv+$bytes_sent]
sent=$[$sent+$bytes_received]
#recv=$[$recv+123]
#sent=$[$sent+123]
#echo $bytes_sent
#echo $bytes_received
mysql -h$iphost -u$nm -p$mm -e "use ov;UPDATE openvpn SET isent = '$sent' WHERE iuser='$user' && fwqid='1';"
mysql -h$iphost -u$nm -p$mm -e "use ov;UPDATE openvpn SET irecv = '$recv' WHERE iuser='$user' && fwqid='1';"
rm -rf addlog.txt

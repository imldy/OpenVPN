<?php
function GetClientIP(){
 
 $ip = $_SERVER["HTTP_X_FORWARDED_FOR"];
 
 if($ip != ""){
 
  $arr = explode(",",$ip);
 
  return $arr[0];
 
 }else{
 
  return $_SERVER["REMOTE_ADDR"];
 
 }
 
}
 
echo GetClientIP();
?>
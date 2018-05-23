#!/bin/bash
#sed -i 's/\r$//' start-server.sh
##################################################
# Name: start-server.sh
# Description: 启动所有音频、视频、IM服务 -- 需要单独把每个服务部署好再执行此脚本
# Script Maintainer: Long-(borrip0419@gmail.com)
#
# Last Updated: April 9th 2018
###################################################
# Set Variables : JWebrtc
#
TURN_USERNAME="mileworks"					                        
TURN_PASSWORD="1234qwer"                                               	 
TURN_URL="turn:192.168.0.101:3478"           	
STUN_URL="stun:192.168.0.101:1111"                        	         
##################################################
# 1.首先初始化环境:
echo "===================首先初始化环境======================"
if [ ! -L "/home/fso/apprtc" ];then
	ln -s /home/fso/apprtc ~/sturnpath
fi

if [ ! -L "/home/fso/apprtc/turnserver-4.5.0.7/bin" ];then
	ln -s /home/fso/apprtc/turnserver-4.5.0.7/bin ~/turnpath
fi

if [ ! -L "/home/fso/apprtc/apache-tomcat-8.5.30/bin" ];then
	ln -s /home/fso/apprtc/apache-tomcat-8.5.30/bin ~/tomcatpath
fi

# 2.启动stun-server: 
echo "===================启动stun-server======================"
cd ~/sturnpath
nohup java -jar stun-server.jar &

# 3.启动coturn-server: 
echo "===================启动coturn-server======================"
cd ~/turnpath
./turnadmin -a -u mileworks -p 1234qwer -r mileworks
turnserver &

# 3.启动kurento服务器:
echo "===================启动kurento服务器======================"
sudo service kurento-media-server stop
sudo service kurento-media-server start

# 4.启动tomcat: 
echo "===================启动tomcat服务器======================"
cd ~/tomcatpath
sudo sh catalina.sh start

exit 0
#EOF
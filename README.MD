# 基于Kurento Server的AppRTC Docker-compose构建步骤  

- 说明 ：现在基于此方案搭建的服务大致分为以下三个模块: (每块已经全部打入docker镜像)  

1. Signaling Server/Room Server ：
    - Kurento server ：这里使用的官方docker hub 
    - Singnal Server :   
      使用[jWebrtc](https://github.com/inspiraluna/AppRTC-Kurento)
      主要用于现有客户端（web、ios、安卓）三个端的socket信道通讯 , 这里最终打包成war包之后放入tomcat中(此tomcat需要使用SSL，[配置方法](https://www.oschina.net/question/12_23148))
      现在已经全部打入docker中。

    - 指定为上一个目录的webrtc/dockerfile文件

2. TURN Server :    
使用的是官方hub的镜像。

3. STUN Server(基于java实现):  
指定为上一个目录的stun/dockerfile文件。


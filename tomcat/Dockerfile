FROM ubuntu:14.04
LABEL maintainer "MileWorks <borrip0419@gmail.com>"

ENV TOMCAT_VERSION 7.0.88

# Set locales
RUN locale-gen en_GB.UTF-8
ENV LANG en_GB.UTF-8
ENV LC_CTYPE en_GB.UTF-8
ENV TURN_USERNAME mileworks
ENV TURN_PASSWORD 1234qwer
ENV TURN_URL turn:101.37.27.202:3478
ENV STUN_URL stun:101.37.27.202:1111
ENV DEFAULT_KMS_WS_URI ws://101.37.27.202:8888/kurento

# Fix sh
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Install dependencies
RUN apt-get update && \
apt-get install -y git build-essential curl wget software-properties-common

# Install JDK 8
RUN \
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
add-apt-repository -y ppa:webupd8team/java && \
apt-get update && \
apt-get install -y oracle-java8-installer wget unzip tar && \
rm -rf /var/lib/apt/lists/* && \
rm -rf /var/cache/oracle-jdk8-installer

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# Get Tomcat
RUN wget --quiet --no-cookies http://mirrors.hust.edu.cn/apache/tomcat/tomcat-7/v7.0.88/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz -O /tmp/tomcat.tgz
RUN tar xzvf /tmp/tomcat.tgz -C /opt
RUN mv /opt/apache-tomcat-${TOMCAT_VERSION} /opt/tomcat
RUN rm /tmp/tomcat.tgz
# RUN rm -rf /opt/tomcat/webapps/examples
# RUN rm -rf /opt/tomcat/webapps/docs
# RUN rm -rf /opt/tomcat/webapps/ROOT

# Add admin/admin user
ADD tomcat-users.xml /opt/tomcat/conf/
ADD server.xml /opt/tomcat/conf/
ADD keystore.jks /opt/tomcat/conf/
ADD jWebrtc.war /opt/tomcat/webapps/

ENV CATALINA_HOME /opt/tomcat
ENV PATH $PATH:$CATALINA_HOME/bin

EXPOSE 8080
EXPOSE 8009
EXPOSE 8443
VOLUME "/opt/tomcat/webapps"
WORKDIR /opt/tomcat

# Launch Tomcat
CMD ["/opt/tomcat/bin/catalina.sh", "run"]

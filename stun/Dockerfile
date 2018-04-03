FROM java:8-jre
LABEL maintainer "MileWorks <borrip0419@gmail.com>"

ENV STUN_FILE stun-server.jar

# Set the location of the verticles
ENV STUN_HOME /usr/stun

EXPOSE 1111

COPY $STUN_FILE $STUN_HOME/

WORKDIR $STUN_HOME
ENTRYPOINT ["sh", "-c"]
CMD ["java -jar stun-server.jar"]
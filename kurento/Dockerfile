FROM      ubuntu:14.04
LABEL maintainer "MileWorks <borrip0419@gmail.com>"

RUN apt-get update \
  && apt-get -y dist-upgrade \
	&& apt-get install -y wget

RUN	echo "deb http://ubuntu.kurento.org/ trusty kms6" | tee /etc/apt/sources.list.d/kurento.list \
	&& wget -O - http://ubuntu.kurento.org/kurento.gpg.key | apt-key add - \
	&& apt-get update \
	&& apt-get -y install kurento-media-server-6.0 \
	&& apt-get clean \
  && rm -rf /var/lib/apt/lists/*

EXPOSE 8888

ADD ./entrypoint.sh /entrypoint.sh

ADD WebRtcEndpoint.conf.ini /etc/kurento/modules/kurento/WebRtcEndpoint.conf.ini

ENV GST_DEBUG=Kurento*:5

ENTRYPOINT ["/entrypoint.sh"]
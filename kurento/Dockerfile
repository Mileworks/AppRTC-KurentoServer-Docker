FROM      ubuntu:14.04
LABEL maintainer "MileWorks <borrip0419@gmail.com>"

#fix bug
RUN ln -s -f /dev/null /dev/raw1394

RUN apt-get update \
  && apt-get -y dist-upgrade \
	&& apt-get install -y wget curl

RUN	echo "deb http://ubuntu.kurento.org/ trusty kms6" | tee /etc/apt/sources.list.d/kurento.list \
	&& wget -O - http://ubuntu.kurento.org/kurento.gpg.key | apt-key add - \
	&& apt-get update \
	&& apt-get -y install kurento-media-server-6.0 \
	&& apt-get clean \
  && rm -rf /var/lib/apt/lists/*

EXPOSE 8888

COPY ./entrypoint.sh /entrypoint.sh
COPY ./healthchecker.sh /healthchecker.sh

HEALTHCHECK --interval=5m --timeout=3s --retries=1 CMD /healthchecker.sh

ENV GST_DEBUG=Kurento*:5

ENTRYPOINT ["/entrypoint.sh"]

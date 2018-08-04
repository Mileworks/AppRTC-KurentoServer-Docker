FROM      ubuntu:14.04
LABEL maintainer "MileWorks <borrip0419@gmail.com>"

RUN apt-get update \
  && apt-get -y dist-upgrade \
	&& apt-get install -y wget

# Install OpenCV Dependencies
RUN apt-get install -y cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
RUN apt-get install -y python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev


RUN	echo "deb http://ubuntu.kurento.org/ trusty kms6" | tee /etc/apt/sources.list.d/kurento.list \
	&& wget -O - http://ubuntu.kurento.org/kurento.gpg.key | apt-key add - \
	&& apt-get update \
	&& apt-get -y install kurento-media-server-6.0 \
	&& apt-get clean \
  && rm -rf /var/lib/apt/lists/*

EXPOSE 8888

COPY ./entrypoint.sh /entrypoint.sh

ADD WebRtcEndpoint.conf.ini /etc/kurento/modules/kurento/WebRtcEndpoint.conf.ini

ENV GST_DEBUG=Kurento*:5

#
# Clear cache
#
RUN apt-get autoclean && apt-get clean
RUN rm -rf /var/lib/apt/lists/*

CMD sh -c 'ln -s /dev/null /dev/raw1394'; 
ENTRYPOINT ["sh", "/entrypoint.sh"]

FROM      ubuntu:14.04
LABEL maintainer "MileWorks <borrip0419@gmail.com>"

EXPOSE 8888

RUN apt-get update \
&& apt-get install -y wget \
&& echo "deb http://ubuntu.kurento.org trusty kms6" | sudo tee /etc/apt/sources.list.d/kurento.list \
&& wget -O - http://ubuntu.kurento.org/kurento.gpg.key | apt-key add - \
&& apt-get install libdc1394-22-dev libdc1394-22 libdc1394-utils \
&& apt-get update \
&& apt-get install -y kurento-media-server-6.0

ADD WebRtcEndpoint.conf.ini /etc/kurento/modules/kurento/WebRtcEndpoint.conf.ini

ENTRYPOINT ["/usr/bin/kurento-media-server"]
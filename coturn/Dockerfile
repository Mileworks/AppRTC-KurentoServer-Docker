FROM      ubuntu:14.04
LABEL maintainer "MileWorks <borrip0419@gmail.com>"
RUN apt-get update

RUN apt-get install -y git build-essential libssl-dev sqlite3\
    libsqlite3-dev libevent-dev libpq-dev mysql-client libmysqlclient-dev libhiredis-dev

RUN git clone -b 4.5.0.7 https://github.com/coturn/coturn.git /tmp/coturn

RUN cd /tmp/coturn && ./configure --prefix=/usr/local/coturn && make install

CMD ["/usr/local/coturn/bin/turnserver"]
#!/bin/bash -x
set -e

if [ -n "$KMS_TURN_URL" ]; then
  echo "turnURL=mileworks:1234qwer@101.37.27.202:3478" > /etc/kurento/modules/kurento/WebRtcEndpoint.conf.ini
fi

if [ -n "$KMS_STUN_IP" -a -n "$KMS_STUN_PORT" ]; then
  # Generate WebRtcEndpoint configuration
  echo "stunServerAddress=101.37.27.202" > /etc/kurento/modules/kurento/WebRtcEndpoint.conf.ini
  echo "stunServerPort=1111" >> /etc/kurento/modules/kurento/WebRtcEndpoint.conf.ini
fi

# Remove ipv6 local loop until ipv6 is supported
cat /etc/hosts | sed '/::1/d' | tee /etc/hosts > /dev/null

exec /usr/bin/kurento-media-server "$@"

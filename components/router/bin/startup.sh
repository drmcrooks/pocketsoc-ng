#! /bin/bash

sleeptime=5

echo "Applying routing rules"

chmod +x /opt/pocketsoc-ng/router/bin/routing.sh
/opt/pocketsoc-ng/router/bin/routing.sh

#chmod +x /opt/pocketsoc-ng/router/bin/mirror.sh
#/opt/pocketsoc-ng/router/bin/mirror.sh

(
echo "Starting up DNS proxy"
/usr/sbin/dnsmasq -k &
)


#sleeptime=150
#
#while ! nc -z -w 1 172.20.0.50 9200; do
#    echo "Not connected to elasticsearch, sleeping for $sleeptime seconds..."
#    sleep $sleeptime
#done
#
#while ! nc -z -w 1 172.20.0.52 5601; do
#    echo "Not connected to kibana, sleeping for $sleeptime seconds..."
#    sleep $sleeptime
#done
#
#/files/import_patterns.sh
#
#echo Startup complete


tail -f /dev/null

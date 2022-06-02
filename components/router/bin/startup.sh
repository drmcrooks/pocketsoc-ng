#! /bin/bash

sleep 5

chmod +x /opt/pocketsoc-ng/bin/mirror.sh
/opt/pocketsoc-ng/bin/mirror.sh

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
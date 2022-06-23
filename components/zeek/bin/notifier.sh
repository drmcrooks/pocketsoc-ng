#! /bin/bash

MESSAGE=$1
WEBHOOK=`cat /opt/pocketsoc/data/webhook`

curl -i -X POST --data-urlencode "payload={\"text\": \"${MESSAGE}\"}" $WEBHOOK

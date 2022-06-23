#! /bin/bash

MESSAGE=$1
WEBHOOK=`cat /opt/pocketsoc-ng/data/webhook`

curl -i -X POST --data-urlencode "payload={\"text\": \"${ZEEKHOST}: ${MESSAGE}\"}" $WEBHOOK

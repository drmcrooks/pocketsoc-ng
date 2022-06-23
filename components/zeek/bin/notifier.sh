#! /bin/bash

MESSAGE=$1
ZEEKHOST=`cat /opt/pocketsoc-ng/data/zeekhost`
WEBHOOK=`cat /opt/pocketsoc-ng/data/webhook`

curl -i -X POST --data-urlencode "payload={\"text\": \"${ZEEKHOST}: ${MESSAGE}\"}" $WEBHOOK

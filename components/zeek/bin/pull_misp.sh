#! /bin/bash

AUTH_KEY="Authorization: $authkey"

echo $AUTH_KEY
JSON="application/json"
FEED_URL="http://misp:80"

curl -vvv --header "$AUTH_KEY" --header "Accept: $JSON" --header "Content-type: $JSON" -X POST --data "{\"request\": {${EXCLUSIONS} \"type\": \"all\"}}" $FEED_URL

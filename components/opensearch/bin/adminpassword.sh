#! /bin/bash

PASSWORD_HASH=`echo $ELASTIC_PASSWORD | xargs -I {} /usr/share/opensearch/plugins/opensearch-security/tools/hash.sh -p {} | grep -v \*`

echo "New hash "$PASSWORD_HASH

ORIG_HASH=`grep -A 1 admin: /usr/share/opensearch/config/opensearch-security/internal_users.yml | grep -v admin | cut -d\" -f2`

echo "Orig hash "$ORIG_HASH

sed -i "s~$ORIG_PASSWORD~$PASSWORD_HASH~g" /usr/share/opensearch/config/opensearch-security/internal_users.yml

echo -n "New config "

grep -A 1 admin: /usr/share/opensearch/config/opensearch-security/internal_users.yml | grep -v admin | cut -d\" -f2

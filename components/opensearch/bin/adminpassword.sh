#! /bin/bash

PASSWORD_HASH=`echo $ELASTIC_PASSWORD | xargs -I {} /usr/share/opensearch/plugins/opensearch-security/tools/hash.sh -p {} | grep -v \*`

echo $PASSWORD_HASH

ORIG_PASSWORD=`grep -A 1 admin: /usr/share/opensearch/config/opensearch-security/internal_users.yml | grep -v admin | cut -d\" -f2`

echo $ORIG_PASSWORD

sed -i "s/${ORIG_PASSWORD}/${PASSWORD_HASH}/g" /usr/share/opensearch/config/opensearch-security/internal_users.yml

#grep $passwordhash /usr/share/opensearch/config/opensearch-security/internal_users.yml

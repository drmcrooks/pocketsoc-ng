#! /bin/bash

echo test > /usr/share/opensearch/test.txt

exit 0

USERFILE="/usr/share/opensearch/config/opensearch-security/internal_users.yml"

PASSWORD_HASH=`echo $ELASTIC_PASSWORD | xargs -I {} /usr/share/opensearch/plugins/opensearch-security/tools/hash.sh -p {} | grep -v \*`

cat << EOF > $USERFILE
EOF
---
# This is the internal user database
# The hash value is a bcrypt hash and can be generated with plugin/tools/hash.sh

_meta:
  type: "internalusers"
  config_version: 2

# Define your internal users here

## PocketSOC users

admin:
  hash: "$PASSWORD_HASH"
  reserved: true
  backend_roles:
  - "admin"
  description: "PocketSOC-NG admin user"

kibanaserver:
  hash: "$PASSWORD_HASH"
  reserved: true
  description: "PocketSOC-NG OpenSearch Dashboards user"
EOF

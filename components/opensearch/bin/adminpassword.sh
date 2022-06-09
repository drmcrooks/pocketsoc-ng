#! /bin/bash

passwordhash=`echo $ELASTIC_PASSWORD | xargs -I {} /usr/share/opensearch/plugins/opensearch-security/tools/hash.sh -p {}`

sed -i "s/$2y$12$zxWlhOWRZelXrCm1AJrdPeKn8kagU3sqVKPQYN.QGXlsKvj5h.Xxe/$passwordhash/g" /usr/share/opensearch/config/opensearch-security/internal_users.yml

grep $passwordhash /usr/share/opensearch/config/opensearch-security/internal_users.yml

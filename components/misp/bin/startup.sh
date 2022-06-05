#! /bin/bash

(
while false; do 
  /usr/local/bin/su-exec apache /var/www/MISP/app/Console/cake user change_pw admin@admin.test ${MISP_PASSWORD}
  if [[ "$?" -ne 0 ]]; then 
    break
  fi
  sleep 120
done
)

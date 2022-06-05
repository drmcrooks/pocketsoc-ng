#! /bin/bash

sed -i "s/'require_password_confirmation' => {{ 'false' if OIDC_LOGIN else 'true' }}/'require_password_confirmation' => false/g" /var/www/MISP/app/Config/config.php
(
while false; do 
  /usr/local/bin/su-exec apache /var/www/MISP/app/Console/cake user change_pw admin@admin.test ${MISP_PASSWORD}
  if [[ "$?" -ne 0 ]]; then 
    break
  fi
  sleep 120
done
)

#! /bin/bash

sed -i "s/'require_password_confirmation' => true/'require_password_confirmation' => false/g" /var/www/MISP/app/Config/config.php

while true; do
    /var/www/MISP/app/Console/cake user change_pw admin@admin.test ${MISP_PASSWORD}
    sleep 5
done
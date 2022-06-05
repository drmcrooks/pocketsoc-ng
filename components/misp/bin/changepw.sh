#! /bin/bash

while [ ! -f /root/changemisppw.log ]; do
    /var/www/MISP/app/Console/cake user change_pw admin@admin.test ${MISP_PASSWORD} --no_password_change > /root/changemisppw.log
done

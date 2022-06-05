#! /bin/bash

while [ ! -f /root/changemisppw.log ]; do
    curl -k -L http://localhost/UserInitShell.php
    su-exec apache /var/www/MISP/app/Console/cake user change_pw admin@admin.test ${MISP_PASSWORD} --no_password_change > /root/changemisppw.log
    sleep 10
done

unset ${MISP_PASSWORD}

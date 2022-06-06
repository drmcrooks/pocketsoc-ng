#! /bin/bash

password=${MISP_PASSWORD}

while [ ! -f /root/changemisppw.log ]; do
    curl -s -k -L http://localhost/UserInitShell.php > /dev/null
    su-exec apache /var/www/MISP/app/Console/cake user change_pw admin@admin.test "$password" --no_password_change && touch /root/changemisppw.log
    sleep 10
done

#! /bin/bash

/var/www/MISP/app/Console/cake user change_pw admin@admin.test ${MISP_PASSWORD} --no_password_change > /root/changepw

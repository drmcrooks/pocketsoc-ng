#! /bin/bash

/usr/local/bin/su-exec apache /var/www/MISP/app/Console/cake user change_pw admin@admin.test ${MISP_PASSWORD}

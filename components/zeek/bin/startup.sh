#! /bin/bash

chmod +x /opt/pocketsoc-ng/bin/nic_setup.sh
/opt/pocketsoc-ng/bin/nic_setup.sh

which supervisord

supervisord -c /etc/supervisord.conf

#! /bin/bash

chmod +x /opt/pocketsoc-ng/bin/nic_setup.sh
/opt/pocketsoc-ng/bin/nic_setup.sh

chmod +x /opt/pocketsoc-ng/bin/pull_misp.sh

which supervisord

/usr/bin/supervisord -c /etc/supervisord.conf

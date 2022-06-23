#! /bin/bash

chmod +x /opt/pocketsoc-ng/bin/nic_setup.sh
/opt/pocketsoc-ng/bin/nic_setup.sh

chmod +x /opt/pocketsoc-ng/bin/pull_misp.sh

chmod +x /opt/pocketsoc-ng/bin/notifier.sh

echo ${HOST_HOSTNAME} > /opt/pocketsoc-ng/data/zeekhost

which supervisord

/usr/bin/supervisord -c /etc/supervisord.conf

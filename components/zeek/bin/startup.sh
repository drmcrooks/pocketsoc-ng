#! /bin/bash

chmod +x /opt/pocketsoc-ng/bin/nic_setup.sh
/opt/pocketsoc-ng/bin/nic_setup.sh

zeekctl deploy && tail -f /dev/null
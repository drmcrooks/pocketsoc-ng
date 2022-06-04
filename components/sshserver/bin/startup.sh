#! /bin/bash

chmod +x /opt/pocketsoc-ng/bin/routing.sh
/opt/pocketsoc-ng/bin/routing.sh

ssh-keygen -q -N "" -t rsa -b 4096 -f /etc/ssh/ssh_host_rsa_key

/usr/sbin/sshd && tail -f /dev/null

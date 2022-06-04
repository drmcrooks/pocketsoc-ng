#! /bin/bash

chmod +x /opt/pocketsoc-ng/bin/routing.sh
/opt/pocketsoc-ng/bin/routing.sh

ssh-keygen -q -N "" -t rsa -b 4096 -f /etc/ssh/ssh_host_rsa_key

groupadd training
useradd training -g training

echo -e "training\ntraining" | passwd training

/usr/sbin/sshd && tail -f /dev/null

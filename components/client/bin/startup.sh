#! /bin/bash

routerip=`dig +noall +answer router | awk '{print $NF}'`

ip route del default
ip route add default via $routerip

tail -f /dev/null

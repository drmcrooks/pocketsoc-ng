#! /bin/bash

routerip=`dig +noall +answer router.pocketsoc-ng_internal | awk '{print $NF}'`
webserverip=`dig +noall +answer webserver.pocketsoc-ng_internal | awk '{print $NF}'`

# Define subnets

internal_subnet="18"

# Define interfaces

internal_interface=`route | grep $internal_subnet | awk '{print $NF}'`

ip route flush $internal_interface
ip route del default
ip route add 172.18.0.0/16 dev $internal_interface
ip route add $webserverip via $routerip

tail -f /dev/null
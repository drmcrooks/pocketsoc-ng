#! /bin/bash

routerip=`dig +noall +answer router.pocketsoc-ng_internal | awk '{print $NF}'`
webserverip=`dig +noall +answer webserver.pocketsoc-ng_internal | awk '{print $NF}'`

# Define subnets

internal_subnet="18"
mirror_subnet="20"

# Define interfaces

internal_interface=`route | grep $internal_subnet | awk '{print $NF}'`
mirror_interface=`route | grep $mirror_subnet | awk '{print $NF}'`

ip link set dev $mirror_interface down

ip route flush $internal_interface
ip route add 172.18.0.0/16 dev $internal_interface
ip route add $webserverip via $routerip

tail -f /dev/null
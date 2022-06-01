#! /bin/bash

routerip=`dig +noall +answer router.pocketsoc-ng_internal | awk '{print $NF}'`

#external_subnet="19"
internal_subnet="18"
mirror_subnet="20"

# Define interfaces

#external=`route | grep $external_subnet | awk '{print $NF}'`
internal=`route | grep $internal_subnet | awk '{print $NF}'`
mirror=`route | grep $mirror_subnet | awk '{print $NF}'`

#ip link set dev $external down
ip link set dev $mirror down

ip route del default
ip route add 172.18.0.0/16 via $routerip

tail -f /dev/null
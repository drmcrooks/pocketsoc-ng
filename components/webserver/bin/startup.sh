#! /bin/bash

#routerip=`dig +noall +answer router.pocketsoc-ng_internal | awk '{print $NF}'`
#clientip=`dig +noall +answer client.pocketsoc-ng_internal | awk '{print $NF}'`

# Define subnets

#internal_subnet="18"

# Define interfaces


#internal_interface=`route | grep $internal_subnet | awk '{print $NF}'`
#ip route flush $internal_interface
#ip route del default
#ip route add 172.18.0.0/16 dev $internal_interface
#ip route add $clientip via $routerip

httpd-foreground
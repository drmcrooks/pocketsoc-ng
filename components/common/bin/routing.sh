#! /bin/bash

 routerip=`dig +noall +answer router.pocketsoc-ng_internal | awk '{print $NF}'`
 
 # Define subnets

 internal_subnet="18"

 # Define interfaces

 internal_interface=`ip route | grep default | awk '{print $NF}'`

 ip route add 172.18.0.0/24 dev $internal_interface
 ip route change 172.18.0.0/24 via $routerip

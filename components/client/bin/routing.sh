#! /bin/bash

 routerip=`dig +noall +answer router.pocketsoc-ng_default | awk '{print $NF}'`
 
 # Define subnets

 internal_subnet=`ifconfig | grep 172 | awk '{print $2}' | cut -d. -f2`

 ip route add 172.$internal_subnet.0.0/24 dev eth0
 ip route change 172.$internal_subnet.0.0/24 via $routerip

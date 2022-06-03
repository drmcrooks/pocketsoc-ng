#! /bin/bash

internal_subnet="18"

# Define interfaces

internal_interface=`ip route | grep $internal_subnet | grep -v default | awk '{print $3}'`

iptables -t mangle -A PREROUTING -j TEE -i $internal_interface --gateway zeek.pocketsoc-ng_mirror
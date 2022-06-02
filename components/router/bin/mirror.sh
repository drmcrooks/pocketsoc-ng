#! /bin/bash

internal_subnet="18"

# Define interfaces

internal_interface=`route | grep $internal_subnet | awk '{print $NF}'`

iptables -t mangle -A PREROUTING -j TEE -i $internal_interface --gateway zeek.pocketsoc-ng_mirror
iptables -t mangle -A POSTROUTING -j TEE --gateway zeek.pocketsoc-ng_mirror
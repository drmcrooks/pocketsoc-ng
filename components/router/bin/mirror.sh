#! /bin/bash

external_subnet="19"
internal_subnet="18"

# Define interfaces

external_interface=`route | grep $external_subnet | awk '{print $NF}'`
internal_interface=`route | grep $internal_subnet | awk '{print $NF}'`

iptables -t mangle -A PREROUTING -j TEE -i $internal_interface --gateway zeek.pocketsoc-ng_mirror
iptables -t mangle -A PREROUTING -j TEE -i $external_interface --gateway zeek.pocketsoc-ng_mirror
iptables -t mangle -A POSTROUTING -j TEE --gateway zeek.pocketsoc-ng_mirror
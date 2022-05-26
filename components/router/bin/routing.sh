#! /bin/bash

# Confirm client,webserver interfaces

external_subnet="19"
internal_subnet="18"

# Define interfaces

external_interface=`route | grep $external_subnet | awk '{print $NF}'`
internal_interface=`route | grep $internal_subnet | awk '{print $NF}'`

# Configure routing

iptables -t nat -A POSTROUTING -o $external_interface -j MASQUERADE
iptables -A FORWARD -i $external_interface -o $internal_interface -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i $internal_interface -o $external_interface -j ACCEPT
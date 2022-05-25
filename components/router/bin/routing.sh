#! /bin/bash

# Confirm client,webserver interfaces

external_subnet="19"
internal_subnet="18"

# Define interfaces

external=`route | grep $external_subnet | awk '{print $NF}'`
internal=`route | grep $internal_subnet | awk '{print $NF}'`

echo $internal
echo $external

# Configure routing

iptables -t nat -A POSTROUTING -o $external -j MASQUERADE
iptables -A FORWARD -i $external -o $internal -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i $internal -o $external -j ACCEPT

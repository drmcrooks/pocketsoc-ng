#! /bin/bash

iptables -t mangle -A PREROUTING -j TEE -i eth0 --gateway zeek
#!/bin/bash

# Test that zeek configuration is valid
zeekctl deploy && echo 1

# Test that af_packet plugin works
zeek -NN Zeek::AF_Packet && echo 1

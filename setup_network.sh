#!/bin/bash

set -e

INTERFACE="eno1"
JETSON_IP="192.168.144.1/24"
PIXHAWK_IP="192.168.144.14"

echo "Setting up Pixhawk Ethernet..."

sudo ip addr add "$JETSON_IP" dev "$INTERFACE" 2>/dev/null || true

echo
echo "Jetson Ethernet:"
ip addr show "$INTERFACE" | grep "192.168.144.1" || true

echo
echo "Testing Pixhawk:"
ping -c 3 "$PIXHAWK_IP"

echo
echo "Pixhawk Ethernet ready."

#!/bin/bash

source /opt/ros/humble/setup.bash
source ~/ros2_ws/install/setup.bash

echo "Starting MAVROS..."
echo "Pixhawk: 192.168.144.14:14550"

ros2 launch mavros apm.launch fcu_url:=udp://@192.168.144.14:14550

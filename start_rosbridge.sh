#!/bin/bash

source /opt/ros/humble/setup.bash
source ~/ros2_ws/install/setup.bash

echo "Starting rosbridge on port 9090..."

ros2 launch rosbridge_server rosbridge_websocket_launch.xml port:=9090

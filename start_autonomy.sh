#!/bin/bash

source /opt/ros/humble/setup.bash
source ~/ros2_ws/install/setup.bash

echo "Starting NIDAR autonomy nodes..."

echo "Starting command_node..."
ros2 run nidar_autonomy command_node &
COMMAND_PID=$!

echo "Starting mission_state_node..."
ros2 run nidar_autonomy mission_state_node &
MISSION_PID=$!

echo "Starting heartbeat_node..."
ros2 run nidar_autonomy heartbeat_node &
HEARTBEAT_PID=$!

echo
echo "NIDAR autonomy running:"
echo "  command_node       PID $COMMAND_PID"
echo "  mission_state_node PID $MISSION_PID"
echo "  heartbeat_node     PID $HEARTBEAT_PID"
echo
echo "Press Ctrl+C to stop all autonomy nodes."

trap 'kill $COMMAND_PID $MISSION_PID $HEARTBEAT_PID 2>/dev/null || true' SIGINT SIGTERM

wait

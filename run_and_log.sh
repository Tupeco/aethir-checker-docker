#!/bin/bash

NODE_PID=''
function die() {
	trap - SIGTERM
	echo "Exiting..."
	kill -- 0
	exit
}

trap 'die' SIGINT SIGTERM EXIT

(./AethirCheckerService; die) &
NODE_PID=($!)

while [[ ! -r log/server.log ]]; do
	sleep 1;
done
tail -F log/server.log


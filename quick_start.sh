#!/bin/bash

#!/usr/bin/env bash

# make sure everything is clean and well setup
echo "[quick_start.sh] First time setup"
sudo bash first_time_setup.sh

# start blockchain and put in background
echo "[quick_start.sh] Starting eosio docker"
sudo bash start_eosio_docker.sh  --nolog

# wait until eosio blockchain to be started
until $(curl --output /dev/null \
             --silent \
             --head \
             --fail \
             localhost:8888/v1/chain/get_info)
do
  echo "Waiting eosio blockchain to be started..."
  sleep 2s
done

#start frontend react app
echo "[quick_start.sh] Starting frontend react app"
echo "start_frontend.sh im not working" &
P1=$!

# wait $P1
wait $P1

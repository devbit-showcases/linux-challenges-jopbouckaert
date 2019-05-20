#!/usr/bin/env bash
pkill -f ./file.sh
./file.sh &
./dump.sh > /dev/null 2>&1
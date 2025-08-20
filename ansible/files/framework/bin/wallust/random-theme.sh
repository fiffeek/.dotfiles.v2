#!/bin/bash

set -e

POWER_STATUS=$(cat /sys/class/power_supply/ACAD/online)

if [ "$POWER_STATUS" -eq 1 ]; then
  random-wallpaper.sh
else
  random-solid-theme.sh
fi

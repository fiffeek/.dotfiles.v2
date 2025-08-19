#!/bin/bash

set -e

CLASS="$1"
THERMAL_ZONE="${2:-1}"
TEMP=""

for d in /sys/class/hwmon/hwmon*/; do
  if grep -qE "$CLASS" "$d/name"; then
    TEMP=$(awk '{print int($1/1000)}' "$d/temp${THERMAL_ZONE}_input")
  fi
done

echo "{\"text\": \"$TEMP\" }"

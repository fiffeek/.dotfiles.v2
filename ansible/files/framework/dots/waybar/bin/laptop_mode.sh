#!/bin/bash

set -e

MODE="NONE"
FLAGS="$HOME/.config/power/flags/"

if grep -q '1' "$FLAGS/powersave"; then
  MODE="POWERSAVE"
fi

if grep -q '1' "$FLAGS/performance"; then
  MODE="PERFORMANCE"
fi

echo "{\"text\": \"$MODE\", \"class\": \"$MODE\"}"

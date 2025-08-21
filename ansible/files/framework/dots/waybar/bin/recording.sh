#!/bin/bash

set -e

RECORDING_TOOL="wl-screenrec"

if ! pgrep $RECORDING_TOOL >/dev/null; then
  exit 1
fi

ELAPSED=$(ps -o etime= -p $(pgrep $RECORDING_TOOL) | sed 's/^[[:space:]]*//')
echo "{\"text\": \"$ELAPSED\", \"class\": \"recording\"}"

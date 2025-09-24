#!/bin/bash

set -e

DICTATION_TOOL="nerd-dictation"

if ! pgrep -f $DICTATION_TOOL >/dev/null; then
  exit 1
fi

ELAPSED=$(ps -o etime= -p $(pgrep -f $DICTATION_TOOL) | sed 's/^[[:space:]]*//')
echo "{\"text\": \"$ELAPSED\", \"class\": \"recording\"}"

#!/bin/bash

set -o pipefail
set -eux

NERD_DICTATION="nerd-dictation"
VOSK_MODEL_DIR=~/.config/nerd-dictation/model/vosk-model-en-us-0.22-lgraph
DEVICE="alsa_input.usb-USB_MICROPHONE_USB_MICROPHONE_20191112-00.mono-fallback"

DEVICE_ARG=""
if pactl list short sources | grep -q "$DEVICE"; then
  DEVICE_ARG="--pulse-device-name $DEVICE"
fi

if pgrep -f "$NERD_DICTATION" >/dev/null; then
  echo "Nerd Dictation is running, stopping it..."
  if ! $NERD_DICTATION end; then
    echo "Failed to stop Nerd Dictation gracefully, attempting to kill process..."
    pkill -f "$NERD_DICTATION"
  fi
else
  echo "Nerd Dictation is not running, starting it..."
  $NERD_DICTATION begin \
    --vosk-model-dir=$VOSK_MODEL_DIR \
    $DEVICE_ARG \
    --simulate-input-tool=WTYPE &
fi

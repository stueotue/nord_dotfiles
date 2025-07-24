#!/bin/bash

# Path to a shared state file
STATE_FILE="/home/valkyric/.cache/eww_state/record"

# Initialize file if it doesn't exist
[ -f "$STATE_FILE" ] || echo "stopped" > "$STATE_FILE"

STATE=$(cat "$STATE_FILE")

if [ "$STATE" == "recording" ]; then
  # Stop all wf-recorder processes
  pkill -INT wf-recorder
  echo "stopped" > "$STATE_FILE"
  eww update is_recording=false
else
  # Start recording in background
  echo "recording" > "$STATE_FILE"
  eww update is_recording=true
  wf-recorder -g "$(slurp)" -f ~/Videos/Screencasts/recording_$(date +%s).mp4 &

fi

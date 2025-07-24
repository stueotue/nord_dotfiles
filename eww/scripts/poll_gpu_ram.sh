#!/bin/bash

nvidia-smi --query-gpu=memory.used,memory.total --format=csv,noheader,nounits \
  | awk '{printf "%d / %d MB", $1, $2}'

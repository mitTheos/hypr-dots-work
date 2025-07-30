#!/bin/bash
# Find the node ID of the first Firefox stream
node_id=$(wpctl status | awk '/Streams:/,0' | grep -i firefox | head -n1 | awk '{print $1}')
if [[ -z "$node_id" ]]; then
  echo "Firefox audio stream not found"
  exit 1
fi

# Get the volume (value between 0.0 and 1.5)
volume=$(wpctl get-volume "$node_id" | awk '{print $2}')

# Convert to integer percent and print
percent=$(awk "BEGIN {printf \"%d\", $volume*100}")
echo "${percent}"

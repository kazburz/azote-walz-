#!/bin/bash

# Path to the JSON file
json_file="$HOME/.local/share/azote/swaybg.json"

# Path to the script that sets pywal colors
pywal_script="$HOME/nwgwal.sh"

# Function to run the pywal script
run_pywal() {
  bash "$pywal_script"
}

# Monitor the JSON file for changes and run the pywal script when it is modified
while true; do
  inotifywait -e modify "$json_file"
  echo "Detected change in $json_file. Running pywal script..."
  run_pywal
done

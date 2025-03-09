#!/bin/bash

# Path to the JSON file
json_file="$HOME/.local/share/azote/swaybg.json"

# Extract the wallpaper path using jq
wallpaper_path=$(jq -r '.[0].path' "$json_file")

# Check if the wallpaper path was successfully extracted
if [ -z "$wallpaper_path" ]; then
  echo "Failed to extract wallpaper path from JSON file."
  exit 1
fi

# Use pywal to set the colors based on the extracted wallpaper
wal -n -i "$wallpaper_path" --backend colorthief

echo "Pywal colors set based on the wallpaper: $wallpaper_path"

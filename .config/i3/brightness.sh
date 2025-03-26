#!/bin/bash

# Change amount (can be +10% or 10%-)
change="$1"

# Set brightness (requires sudo if not already fixed)
brightnessctl set "$change"

# Get current brightness (g = current, m = max)
current=$(brightnessctl g)
max=$(brightnessctl m)

# Calculate percentage
percent=$(( 100 * current / max ))

# Create a bar (full = █, empty = -)
bars=$(( percent / 10 ))
bar=""
for ((i=0; i<bars; i++)); do
    bar+="█"
done
for ((i=bars; i<10; i++)); do
    bar+="-"
done

# Send notification with replace ID (avoids stacking)
notify-send -r 9993 -t 1000 "󰃝 Brightness $percent%" "$bar"


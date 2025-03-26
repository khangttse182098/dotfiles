#!/bin/bash

# Toggle mute
pactl set-sink-mute @DEFAULT_SINK@ toggle

# Check mute status
MUTE_STATUS=$(pactl get-sink-mute @DEFAULT_SINK@ | grep -o 'yes\|no')

# Notification replace ID
REPLACE_ID=9993

if [ "$MUTE_STATUS" = "yes" ]; then
    ICON="audio-volume-muted"
    MESSAGE="<span color='#fb4934'>muted</span>"
else
    ICON="audio-volume-high"
    MESSAGE="<span color='#b8bb26'>unmuted</span>"
fi

notify-send -r $REPLACE_ID -i $ICON -t 1000 -u normal "  Volume:" "$MESSAGE"


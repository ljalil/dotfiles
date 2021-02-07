#!/usr/bin/env bash

DIR="$HOME/.config/polybar"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar
polybar -r -q main -c "$DIR"/config.ini 2>/home/abdeljalil/polylog &
polybar -r -q second -c "$DIR"/config.ini 2>/home/abdeljalil/polylog &

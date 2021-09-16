amixer -q sset Master toggle
notify-send -u normal -t 2500 "Volume mute toggle triggered."
kill -44 $(pidof dwmblocks)

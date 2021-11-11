#!/usr/bin/env bash

msgId="67823"
time=2500
change="5%"

amixer -q sset Master "$change+"
kill -44 $(pidof dwmblocks)
dunstify -a "changeVolume" -u low -t $time -i audio-volume-muted -r "$msgId" "Volume increased by $change" 

#!/usr/bin/env bash

msgId="67823"
time=2500
change="5%"

amixer -q sset Master "$change-"
kill -44 $(pidof dwmblocks)
current="$(amixer sget Master | grep "Left:" | awk -F '[][]' '{print $2}')"
dunstify -a "changeVolume" -u low -t $time -i audio-volume-muted -r "$msgId" "Volume decreased by $change. Set to $current." 

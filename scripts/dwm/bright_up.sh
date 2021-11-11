#!/usr/bin/env bash

msgId="47127"
time=2500
change=5

xbacklight "+$change"
current=$(xbacklight -get)
dunstify -a "changeBrightness" -u low -t $time -r "$msgId" "Brightness increased by $change%. Set to $current%." 

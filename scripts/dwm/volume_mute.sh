#!/usr/bin/env bash

amixer -q sset Master toggle

msgId="75423"
time=2000

if [[ -z $(amixer | grep 'off') ]]
then
#	notify-send -u normal -t 2000 "Volume muted"
    	dunstify -a "changeVolume" -u low -t $time -i audio-volume-muted -r "$msgId" "Volume muted" 
else
#	notify-send -u normal -t 2000 "Volume unmuted"
    	dunstify -a "changeVolume" -u low -t $time -i audio-volume-muted -r "$msgId" "Volume unmuted" 
fi

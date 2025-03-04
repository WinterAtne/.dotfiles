#! /usr/bin/bash

WINDOW=$(xdotool getwindowfocus getwindowname)
TIME=$(date +%S)
OUTFILE="$HOME/Pictures/Screenshots/${WINDOW}_${TIME}.png"
maim $OUTFILE
xclip -sel c -t image/png < $OUTFILE

#! /bin/bash

SCRIPTPATH=$HOME/.bin

cd $SCRIPTPATH
exec "./$(ls | rofi -dmenu)"


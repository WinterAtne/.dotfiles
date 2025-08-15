#! /usr/bin/env bash

echo $(brightnessctl -m | cut -d',' -f4)

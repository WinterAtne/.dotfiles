#! /usr/bin/bash

set -eou

# Variables
# Formatting
left_seperator="["
right_seperator="]"
# Control
tick_rate=60 # How often should the status be updated
# Battery : These are the icons used by the battery display
battery_full="󱊣"
battery_mid="󱊢"
battery_low="󱊡"
battery_empt="󰂎"
battery_full_chr="󱊦"
battery_mid_chr="󱊥"
battery_low_chr="󱊤"
battery_empt_chr="󰢟"

#Functions
function check_battery () {
	percent=$(cat /sys/class/power_supply/BAT0/capacity)
	status=$(cat /sys/class/power_supply/BAT0/status)

	if [ "$status" = "Charging" ]; then
		([[ "$percent" -lt 25 ]] && echo "$battery_empt_chr $percent%") || \
		([[ "$percent" -lt 50 ]] && echo "$battery_low_chr $percent%") || \
		([[ "$percent" -lt 75 ]] && echo "$battery_mid_chr $percent%") || \
		([[ "$percent" -lt 100 ]] && echo "$battery_full_chr $percent%")
	else
		([[ "$percent" -lt 25 ]] && echo "$battery_empt $percent%") || \
		([[ "$percent" -lt 50 ]] && echo "$battery_low $percent%") || \
		([[ "$percent" -lt 75 ]] && echo "$battery_mid $percent%") || \
		([[ "$percent" -lt 100 ]] && echo "$battery_full $percent%")
	fi
}

# Main Loop
while :
do
	statusline=$" $left_seperator $(check_battery) $right_seperator "
	xsetroot -name "$statusline"
	sleep $tick_rate
done

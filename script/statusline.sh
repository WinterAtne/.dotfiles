#! /usr/bin/bash

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

# Info Gathering Functions
function check_date () {
	ret=$(date +"%a %b %_d")
	echo $ret
}

function check_time() {
	ret=$(date +"%I:%M%P")
	echo $ret
}

function check_battery () {
	percent=$(cat /sys/class/power_supply/BAT0/capacity)
	status=$(cat /sys/class/power_supply/BAT0/status)

	if [ "$status" = "Charging" ]; then
		([[ "$percent" -lt 25 ]] && echo "$battery_empt_chr $percent%") || \
		([[ "$percent" -lt 50 ]] && echo "$battery_low_chr $percent%") || \
		([[ "$percent" -lt 75 ]] && echo "$battery_mid_chr $percent%") || \
		([[ "$percent" -le 100 ]] && echo "$battery_full_chr $percent%")
	else
		([[ "$percent" -lt 25 ]] && echo "$battery_empt $percent%") || \
		([[ "$percent" -lt 50 ]] && echo "$battery_low $percent%") || \
		([[ "$percent" -lt 75 ]] && echo "$battery_mid $percent%") || \
		([[ "$percent" -le 100 ]] && echo "$battery_full $percent%")
	fi
}

# Main Loop
while :
do
	statusline=$""
	statusline+=" $left_seperator $(check_battery) $right_seperator"
	statusline+=" $left_seperator $(check_date) | $(check_time) $right_seperator"
	
	xsetroot -name "$statusline"
	sleep $tick_rate
done

import QtQuick
import Quickshell
import Quickshell.Services.UPower

Section {
	text_color: "black"
	rect_color: "white"
	border_color: "purple"

	text: icon + " "+ power + "%"

	property real power: (Math.round(UPower.displayDevice.percentage * 100))
	property string icon: 
	(UPower.displayDevice.state.toString !== "Charging") ?
		((power >= 80) ? "󰂃" :
		(power >= 2/3) ? "󱊣" :
		(power >= 1/3) ? "󱊢" :
		(power >= 20) ? "󱊡" : "󰂎")
	:
		((power >= 80) ? "󰂅" :
		(power >= 2/3) ? "󱊦" :
		(power >= 1/3) ? "󱊥" :
		(power >= 20) ? "󱊤" : "󰢟")
}

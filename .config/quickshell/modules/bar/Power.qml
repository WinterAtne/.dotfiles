import Quickshell
import Quickshell.Services.UPower

Scope {
	readonly property list<string> icons: [
		"󰂃",
		"󱊣",
		"󱊢",
		"󱊡",
		"󰂎",

		"󰂅",
		"󱊦",
		"󱊥",
		"󱊤",
		"󰢟"
	]

	readonly property list<string> colors: [
		"red",
		"lightskyblue",
		"lightskyblue",
		"lightskyblue",
		"red"
	]

	readonly property string text_color: colors[state]
	readonly property string rect_color: "transparent"

	readonly property string text: icon + " " + power + "%"
	readonly property string icon: icons[state + ((UPower.displayDevice.state == 1) ? 5 : 0)]
	readonly property real power: (Math.round(UPower.displayDevice.percentage * 100))

	readonly property int state: 
	(power >= 80) ? 0 :
	(power >= 66) ? 1 :
	(power >= 33) ? 2 :
	(power >= 20) ? 3 : 4
}

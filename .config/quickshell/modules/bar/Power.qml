import Quickshell.Services.UPower

Section {
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

	text_color: colors[state]
	rect_color: "transparent"
	border_color: colors[state]

	text: icon + " " + power + "%"
	readonly property string icon: icons[state + ((UPower.displayDevice.state == 1) ? 5 : 0)]
	readonly property real power: (Math.round(UPower.displayDevice.percentage * 100))

	readonly property int state: 
	(power >= 80) ? 0 :
	(power >= 66) ? 1 :
	(power >= 33) ? 2 :
	(power >= 20) ? 3 : 4


	// (UPower.displayDevice.state == 2) ?
	// (
	// 	(power >= 80) ? "󰂃" :
	// 	(power >= 66) ? "󱊣" :
	// 	(power >= 33) ? "󱊢" :
	// 	(power >= 20) ? "󱊡" : "󰂎"
	// )
	// :
	// (
	// 	(power >= 80) ? "󰂅" :
	// 	(power >= 66) ? "󱊦" :
	// 	(power >= 33) ? "󱊥" :
	// 	(power >= 20) ? "󱊤" : "󰢟"
	// )
}

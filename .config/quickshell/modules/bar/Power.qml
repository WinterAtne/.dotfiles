import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Services.UPower

Scope {
	id: root
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
	readonly property int isCharging: UPower.displayDevice.state
	readonly property string icon: icons[state + ((isCharging == 1) ? 5 : 0)]
	readonly property real power: (Math.round(UPower.displayDevice.percentage * 100))

	readonly property int state: 
	(power >= 80) ? 0 :
	(power >= 66) ? 1 :
	(power >= 33) ? 2 :
	(power >= 20) ? 3 : 4

	Process {
		id: overpowersend
		command: ["notify-send", "Battery sufficiently charged", "Unplug charger"]
	}

	Process {
		id: underpowersend
		command: ["notify-send", "Battery at low power", "Plug in charger"]
	}

	Timer {
		interval: 32000
		running: true
		repeat: true
		onTriggered: root.notifysend()
	}

	function notifysend() {
		if (root.state == 0 && root.isCharging == 1) {
			overpowersend.running = true
		} else if (root.state == 4 && root.isCharging !== 1) {
			underpowersend.running = true
		}
	}
}

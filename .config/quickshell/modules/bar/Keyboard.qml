import QtQuick
import Quickshell.Io
import Quickshell.Hyprland

Section {
	id: keyboard
	text: ""
	property string activelayout: ""

	Process {
	  id: seedProcHypr
	  running: true
	  command: ["hyprctl", "-j", "devices"]

		stdout: StdioCollector {
			onStreamFinished: {
				var j = JSON.parse(text);
				var arr = [], active = "";
				j.keyboards.forEach(function (k) {
					  if (!k.main)
							return;
							k.layout.split(",").forEach(function (l) {
							var t = l.trim();
							if (arr.indexOf(t) === -1)
								 arr.push(t);
						});
					active = k.active_keymap;
				});

				keyboard.activelayout = (active.startsWith("Greek")) ? "GR" : "IN"
				keyboard.text = " " + keyboard.activelayout
			}
		}
	}

	Process {
		id: notifysend
		command: ["notify-send", "Keyboard Change", "Layout is " + keyboard.activelayout]
	}
	
	 // Listen for Hyprland layout change events
	Connections {
		target: Hyprland
		function onRawEvent(event) {
		if (event.name !== "activelayout") return
			seedProcHypr.running = true
			notifysend.running = true
		}
	}
}

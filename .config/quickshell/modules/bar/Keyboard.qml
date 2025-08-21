import QtQuick
import Quickshell.Io
import Quickshell.Hyprland

Section {
	id: keyboard
	text: Info {
		info: keyboard.display
	}
	property string activelayout: ""
	property string display: ""

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

				keyboard.activelayout = (active.startsWith("Greek")) ? "ΕΛ" : "IN"
				keyboard.display = " " + keyboard.activelayout
			}
		}
	}
	
	 // Listen for Hyprland layout change events
	Connections {
		target: Hyprland
		function onRawEvent(event) {
		if (event.name !== "activelayout") return
			seedProcHypr.running = true
		}
	}
}

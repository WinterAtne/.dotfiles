import Quickshell
import Quickshell.Io
import QtQuick

Scope {
	id: root
	readonly property string text: "󰛨 " + brightness + "%"
	property real brightness: 1
	property int maximum: 1
	property real animatedBrightness: 1

	FileView {
		watchChanges: true
		path: "/sys/class/backlight/intel_backlight/max_brightness"
		onFileChanged: reload()
		onLoaded: root.maximum = parseInt(text())
	}

	FileView {
		watchChanges: true
		path: "/sys/class/backlight/intel_backlight/actual_brightness"
		onFileChanged: reload()
		onLoaded: () => {
			root.brightness = Math.round(parseInt(text()) / root.maximum * 100)
			root.animatedBrightness = parseInt(text()) / root.maximum
		}
	}

	Behavior on animatedBrightness {
		NumberAnimation {
			duration: 300
			easing.type: Easing.OutSine
		}
	}
}

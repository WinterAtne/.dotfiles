import QtQuick
import Quickshell

Text {
	text: time

	readonly property string time: {
		Qt.formatDateTime(clock.date, "ddd MMM dd yy hh:mmAP")
	}

	SystemClock {
		id: clock
		precision: SystemClock.Minutes
	}
}

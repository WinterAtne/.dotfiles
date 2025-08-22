import Quickshell

Section {
	id: root
	text: [
		Info {
			info: root.date
		},
		Info {
			info: root.time
		}
	]

	readonly property string date: {
		Qt.formatDateTime(clock.date, "ddd MMM dd yy 󰸗")
	}

	readonly property string time: {
		Qt.formatDateTime(clock.date, "hh:mmAP")
	}

	SystemClock {
		id: clock
		precision: SystemClock.Minutes
	}
}

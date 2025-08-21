import Quickshell

Section {
	id: root
	text: Info {
		info: root.time
	}

	readonly property string time: {
		Qt.formatDateTime(clock.date, "ddd MMM dd yy 󰸗 | hh:mmAP")
	}

	SystemClock {
		id: clock
		precision: SystemClock.Minutes
	}
}

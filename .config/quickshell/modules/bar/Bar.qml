import Quickshell

Scope {
	Variants {
		model: Quickshell.screens

		PanelWindow {
			required property var modelData
			screen: modelData

			implicitHeight: 30
			anchors {
				top: true
				left: true
				right: true
			}

			LeftBar {}
			RightBar {}
			CenterBar {}

			color: "transparent"

		}
	}
}

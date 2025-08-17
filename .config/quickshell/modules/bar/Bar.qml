import Quickshell

Scope {
	Variants {
		model: Quickshell.screens

		PanelWindow {
			required property var modelData
			screen: modelData

			color: "transparent"
			implicitHeight: 32
			anchors {
				top: true
				left: true
				right: true
			}

			LeftBar {}
			RightBar {}
			CenterBar {}
		}
	}
}

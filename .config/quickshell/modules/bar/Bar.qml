import Quickshell
import QtQuick

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
			// CenterBar {}
			Rectangle {
				anchors.verticalCenter: parent.verticalCenter
				anchors.horizontalCenter: parent.horizontalCenter
				anchors.bottom: parent.bottom
				implicitWidth: 200
				color: "black"
			}

			color: "transparent"

		}
	}
}

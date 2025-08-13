import Quickshell
import QtQuick
import "Clock.qml"

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

			color: "white"

			Row {
				anchors.left: parent.left
				// anchors.verticalCenter: parent.verticalCenter
				anchors.bottom: parent.bottom
				anchors.top: parent.top
				spacing: 5
				padding: 5

				Rectangle {
					anchors.verticalCenter: parent.verticalCenter
					implicitWidth: clock.implicitWidth + 10
					implicitHeight: parent.height
					color: "blue"

					border {
						color: "black"
						width: 2
					}

					Clock {
						id: clock
						anchors.verticalCenter: parent.verticalCenter
						anchors.horizontalCenter: parent.horizontalCenter
					}
				}

				Rectangle {
					anchors.verticalCenter: parent.verticalCenter
					implicitWidth: clock2.implicitWidth + 10
					implicitHeight: parent.height
					color: "red"

					border {
						color: "black"
						width: 2
					}

					Clock {
						id: clock2
						anchors.verticalCenter: parent.verticalCenter
						anchors.horizontalCenter: parent.horizontalCenter
					}
				}
			}
		}
	}
}

import Quickshell
import QtQuick
import "Clock.qml"
import "Power.qml"
import "Audio.qml"

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

			color: "transparent"

			Row {
				anchors.right: parent.right
				anchors.verticalCenter: parent.verticalCenter
				anchors.bottom: parent.bottom
				spacing: 5
				padding: 5

				Rectangle {
					anchors.verticalCenter: parent.verticalCenter
					implicitWidth: audio.implicitWidth + 10
					implicitHeight: parent.height
					color: "pink"

					border {
						color: "black"
						width: 2
					}

					Text {
						id: audio
						text: (Audio.volume * 100).toFixed(0) + "%"
						anchors.verticalCenter: parent.verticalCenter
						anchors.horizontalCenter: parent.horizontalCenter
					}
				}

				Rectangle {
					anchors.verticalCenter: parent.verticalCenter
					implicitWidth: brightness.implicitWidth + 10
					implicitHeight: parent.height
					color: "green"

					border {
						color: "black"
						width: 2
					}

					Brightness {
						id: brightness
						anchors.verticalCenter: parent.verticalCenter
						anchors.horizontalCenter: parent.horizontalCenter
					}
				}

				Rectangle {
					anchors.verticalCenter: parent.verticalCenter
					implicitWidth: power.implicitWidth + 10
					implicitHeight: parent.height
					color: "red"

					border {
						color: "black"
						width: 2
					}

					Power {
						id: power
						anchors.verticalCenter: parent.verticalCenter
						anchors.horizontalCenter: parent.horizontalCenter
					}
				}

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
			}
		}
	}
}

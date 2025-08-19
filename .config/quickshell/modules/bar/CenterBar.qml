import QtQuick
import Quickshell.Hyprland

Rectangle {
	anchors.centerIn: parent
	implicitWidth: row.implicitWidth + 10
	implicitHeight: parent.height
	color: "white"
	radius: 4

	border {
		color: "purple"
		width: 2
	}

	Row {
		id: row
		anchors.verticalCenter: parent.verticalCenter
		anchors.horizontalCenter: parent.horizontalCenter
		anchors.bottom: parent.bottom

		Repeater{
			model: (Hyprland.toplevels)

			delegate: Text {
				required property HyprlandToplevel modelData
				anchors.verticalCenter: parent.verticalCenter

				text: modelData.lastIpcObject?.class + " "

				font.family: "Hack Nerd Font"
				font.kerning: true
				font.bold: true
				antialiasing: true
				font.pixelSize: 15
			}
		}
	}

	Connections {
		target: Hyprland
		function onRawEvent(event) {
			Hyprland.refreshToplevels()
			Hyprland.refreshWorkspaces()
		}
	}
}

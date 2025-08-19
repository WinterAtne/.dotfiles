import QtQuick
import Quickshell.Hyprland

Rectangle {
	anchors.centerIn: parent
	implicitWidth: workspaces.implicitWidth
	implicitHeight: parent.height
	color: "transparent"
	radius: 4

	border {
		color: "grey"
		width: 2
	}

	Row {
		id: workspaces
		anchors.verticalCenter: parent.verticalCenter
		anchors.horizontalCenter: parent.horizontalCenter
		anchors.bottom: parent.bottom

		spacing: 5
		padding: 10

		Repeater {
			model: Hyprland.workspaces

			delegate: Rectangle {
				required property HyprlandWorkspace modelData
				anchors.verticalCenter: parent.verticalCenter
				implicitHeight: 24
				implicitWidth: windows.implicitWidth

				border {
					color: (modelData.active) ? "purple" : "black"
					width: 2
				}

				Row {
					readonly property HyprlandWorkspace workspace: parent.modelData

					id: windows
					anchors.verticalCenter: parent.verticalCenter
					anchors.horizontalCenter: parent.horizontalCenter
					anchors.bottom: parent.bottom
					spacing: 8
					padding: 10

					Repeater {
						model: parent.workspace.toplevels
						
						delegate: Text {
							required property HyprlandToplevel modelData

							anchors.verticalCenter: parent.verticalCenter
							text: (modelData.lastIpcObject?.class) ? modelData.lastIpcObject?.class : "󱦟"
							color: (modelData.activated) ? "purple" : "black"

							font.family: "Hack Nerd Font"
							font.kerning: true
							font.bold: true
							antialiasing: true
							font.pixelSize: 12
						}
					}
				}
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

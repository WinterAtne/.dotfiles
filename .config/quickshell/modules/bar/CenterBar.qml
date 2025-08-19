import QtQuick
import Quickshell.Hyprland

Rectangle {
	anchors.centerIn: parent
	implicitWidth: workspaces.implicitWidth
	implicitHeight: parent.height
	color: "transparent"
	radius: 40

	border {
		color: "white"
		width: 2
	}

	Row {
		id: workspaces
		anchors.verticalCenter: parent.verticalCenter
		anchors.horizontalCenter: parent.horizontalCenter
		anchors.bottom: parent.bottom

		spacing: 5
		padding: 5

		Repeater {
			model: Hyprland.workspaces

			delegate: Rectangle {
				required property HyprlandWorkspace modelData
				anchors.verticalCenter: parent.verticalCenter
				implicitHeight: 24
				implicitWidth: windows.implicitWidth
				radius: 40
				color: (modelData.active) ? "white" : "transparent"

				border {
					color: (modelData.active) ? "purple" : ((modelData.active) ? "black" : "lightgrey")
					width: 2
				}

				Row {
					readonly property HyprlandWorkspace workspace: parent.modelData

					id: windows
					anchors.verticalCenter: parent.verticalCenter
					anchors.horizontalCenter: parent.horizontalCenter
					anchors.bottom: parent.bottom
					spacing: 8
					padding: 8


					Text {
						anchors.verticalCenter: parent.verticalCenter
						text: (parent.workspace.toplevels.values.length !== 0) ? "" : "󰣇"

						font.family: "Hack Nerd Font"
						font.kerning: true
						font.bold: true
						antialiasing: true
						font.pixelSize: 12
					}

					Repeater {
						readonly property HyprlandWorkspace workspace: parent.workspace
						model: parent.workspace.toplevels
						
						delegate: Text {
							required property HyprlandToplevel modelData

							anchors.verticalCenter: parent.verticalCenter
							text: (modelData.lastIpcObject?.class) ? modelData.lastIpcObject?.class : "󱦟"
							color: (modelData.activated) ? "purple" : ((parent.workspace.active) ? "black" : "lightgrey")

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

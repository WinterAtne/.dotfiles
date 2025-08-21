import QtQuick

Row {
	anchors.left: parent.left
	anchors.verticalCenter: parent.verticalCenter
	anchors.bottom: parent.bottom
	spacing: 5
	padding: 5

	Rectangle {
		anchors.verticalCenter: parent.verticalCenter
		implicitWidth: text_component.implicitWidth + 10
		implicitHeight: parent.height
		color: "transparent"

		Text {
			id: text_component
			anchors.centerIn: parent
			text: "󰣇"
			color: "lightskyblue"
			font.family: "Hack Nerd Font"
			antialiasing: true
			font.pixelSize: 32
		}
	}

	Repeater {
		readonly property list<Section> entries: [
			CPU {},
			Section {
				text: Info{info:[""]}
			},
			Section {
				text: Info{info:[" Background"]}
			}
		]

		model: entries

		Element {}
	}

}

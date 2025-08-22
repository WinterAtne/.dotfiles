import QtQuick

Row {
	anchors.right: parent.right
	anchors.verticalCenter: parent.verticalCenter
	anchors.bottom: parent.bottom
	spacing: 5
	padding: 5

	Repeater {
		readonly property list<Section> entries: [
			Keyboard {id: keys},
			Section {
				id: pannel
				rect_color: "transparent"
				border_color: "floralwhite"

				text: [
					AudioDisplay {},
					Info {
						info: bright.text
						color: bright.color
					},
					Info {
						info: power.text
						color: power.text_color
					}
				]

				Brightness {id: bright}
				Power {id: power}
			},

			Clock {}
		]

		model: entries

		Element {}
	}
}

import QtQuick

Row {
	anchors.right: parent.right
	anchors.verticalCenter: parent.verticalCenter
	anchors.bottom: parent.bottom
	spacing: 5
	padding: 5

	Repeater {
		property list<Section> entries: [
			Section {
				text: ((Audio.volume * 100).toFixed(0) + "%")
				text_color: "black"
				rect_color: "white"
				border_color: "purple"

			},
			Section {
				text: bright.text
				text_color: "black"
				rect_color: "white"
				border_color: "purple"
				Brightness {id: bright}
			},
			Section {
				text: (pow.text)
				text_color: "black"
				rect_color: "white"
				border_color: "purple"
				Power {id: pow}
			},
			Section {
				text: (clock.text)
				text_color: "black"
				rect_color: "white"
				border_color: "purple"
				Clock {id: clock}
			}
		]

		model: entries

		// Rectangle {
		// 	id: rect
		// 	required property Section modelData
		//
		// 	anchors.verticalCenter: parent.verticalCenter
		// 	implicitWidth: text_component.implicitWidth + 10
		// 	implicitHeight: parent.height
		// 	color: modelData.rect_color
		// 	radius: 4
		//
		// 	border {
		// 		color: modelData.border_color
		// 		width: 2
		// 	}
		//
		// 	Text {
		// 		id: text_component
		// 		anchors.centerIn: parent
		// 		text: parent.modelData.text
		// 		color: parent.modelData.text_color
		// 	}
		// }

		Element {}
	}
}

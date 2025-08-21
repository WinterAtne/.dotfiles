pragma ComponentBehavior: Bound
import QtQuick

Rectangle {
	id: rect
	required property Section modelData
	anchors.verticalCenter: parent.verticalCenter
	implicitWidth: outer_rows.implicitWidth + 10
	implicitHeight: parent.height
	color: modelData.rect_color
	radius: 4

	border {
		color: modelData.border_color
		width: 2
	}

	Row {
		id: outer_rows
		anchors.centerIn: parent
		spacing: 10
		padding: 5

		Repeater {
			model: rect.modelData.text.length

			Text {
				id: text_component
				required property int modelData

				text: rect.modelData.text[modelData].info
				color: rect.modelData.text[modelData].color

				font.family: "Hack Nerd Font"
				font.kerning: true
				font.bold: true
				antialiasing: true
				font.pixelSize: 15
			}
		}
	}
}

import QtQuick

Rectangle {
	id: rect
	required property Section modelData

	anchors.verticalCenter: parent.verticalCenter
	implicitWidth: text_component.implicitWidth + 10
	implicitHeight: parent.height
	color: modelData.rect_color
	radius: 4

	border {
		color: modelData.border_color
		width: 2
	}

	Text {
		id: text_component
		anchors.centerIn: parent
		text: parent.modelData.text
		color: parent.modelData.text_color
		font.pointSize: 11
	}
}

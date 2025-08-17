import QtQuick

Row {
	anchors.left: parent.left
	anchors.verticalCenter: parent.verticalCenter
	anchors.bottom: parent.bottom
	spacing: 5
	padding: 5

	Element {
		modelData: Section {
			text: ""
		}
	}
}

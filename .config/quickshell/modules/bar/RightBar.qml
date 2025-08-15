import QtQuick

Row {
	anchors.left: parent.left
	anchors.verticalCenter: parent.verticalCenter
	anchors.bottom: parent.bottom
	spacing: 5
	padding: 5

	Rectangle {
		anchors.verticalCenter: parent.verticalCenter
		implicitWidth: 70
		implicitHeight: parent.height
		color: "pink"

		border {
			color: "black"
			width: 2
		}
	}
}

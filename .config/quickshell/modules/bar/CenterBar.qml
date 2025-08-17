import QtQuick

Row {
	anchors.verticalCenter: parent.verticalCenter
	anchors.horizontalCenter: parent.horizontalCenter
	spacing: 5
	padding: 5

	// Rectangle {
	// 	implicitWidth: 70
	// 	implicitHeight: parent.height
	// 	color: "pink"
	//
	// 	border {
	// 		color: "black"
	// 		// width: 2
	// 	}
	// }
	Element {
		modelData: Section {
			text: "hello"
		}
	}
}

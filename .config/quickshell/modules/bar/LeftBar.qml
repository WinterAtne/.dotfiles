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
				id: status

				readonly property string audio_icon:
				(Audio.muted == true) ? "󰖁" :
				(Audio.volume > (2/3)) ? "󰕾" :
				(Audio.volume > (1/3)) ?  "󰖀" : "󰕿"

				text: (audio_icon + " "+ (Audio.volume * 100).toFixed(0) + "%") +
					" " + bright.text +
					" " + pow.text

				text_color: "black"
				rect_color: "white"
				border_color: "purple"
				
				Brightness {id: bright}
				Power {id: pow}
				Clock {id: clock}
			},
			Section {
				text: (clock.text)
				text_color: "black"
				rect_color: "white"
				border_color: "purple"
			}
		]

		model: entries

		Element {}
	}
}

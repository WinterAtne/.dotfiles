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
				text: keys.text

				Keyboard {id: keys}
			},
			Section {
				readonly property string audio_icon:
				(Audio.muted == true) ? "󰖁" :
				(Audio.volume > (2/3)) ? "󰕾" :
				(Audio.volume > (1/3)) ?  "󰖀" : "󰕿"
				
				text: audio_icon + " " + ((Audio.volume * 100).toFixed(0) + "%")
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

		Element {}
	}
}

import QtQuick

Row {
	anchors.right: parent.right
	anchors.verticalCenter: parent.verticalCenter
	anchors.bottom: parent.bottom
	spacing: 5
	padding: 5

	Repeater {
		readonly property list<Section> entries: [
			Section {
				text: keys.text
				Keyboard {id: keys}
			},

			Section {
				readonly property string audio_icon:
				(Audio.muted == true) ? "󰝟" :
				(Audio.volume > (2/3)) ? "󰕾" :
				(Audio.volume > (1/3)) ?  "󰖀" : "󰕿"
				
				text: audio_icon + " " + ((Audio.volume * 100).toFixed(0) + "%")
			},

			Section {
				text: bright.text
				Brightness {id: bright}
			},

			Power {},

			Section {
				text: (clock.text)
				Clock {id: clock}
			}
		]

		model: entries

		Element {}
	}
}

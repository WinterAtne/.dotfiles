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

				readonly property string audio_icon:
				(Audio.muted == true) ? "󰝟" :
				(Audio.volume > (2/3)) ? "󰕾" :
				(Audio.volume > (1/3)) ?  "󰖀" : "󰕿"
				
				text: [
					Info {
						info: pannel.audio_icon + " " + ((Audio.volume * 100).toFixed(0) + "%")
						color: "floralwhite"
					},
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

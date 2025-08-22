
Info {
	readonly property string audio_icon:
	(Audio.muted == true) ? "󰝟" :
	(Audio.volume > (2/3)) ? "󰕾" :
	(Audio.volume > (1/3)) ?  "󰖀" : "󰕿"

	info: audio_icon + " " + ((Audio.volume * 100).toFixed(0) + "%")
	color: (Audio.muted == true) ? "lightslategrey" : "honeydew"
}

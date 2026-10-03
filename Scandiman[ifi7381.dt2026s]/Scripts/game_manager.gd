extends Node

#@onready var flame_label: Label = $FlameLabel

#var flames_out: int = 3

func _ready() -> void:
	MusicPlayer.get_stream_playback().switch_to_clip(0)

#func add_flames_out():
#	flames_out -= 1
#	flame_label.text = "Blue Flames remaining: " + str(flames_out)

extends Node

#@onready var flame_label: Label = $FlameLabel

@export var song_id: int = 0

func _ready() -> void:
	MusicPlayer.get_stream_playback().switch_to_clip(song_id)

func _input(event):
	if event.is_action_released("kill_app"):
		get_tree().quit()
	if event.is_action_released("restart"):
		get_tree().change_scene_to_file.call_deferred("res://Scenes/levels/level_1.tscn")
#func add_flames_out():
#	flames_out -= 1
#	flame_label.text = "Blue Flames remaining: " + str(flames_out)

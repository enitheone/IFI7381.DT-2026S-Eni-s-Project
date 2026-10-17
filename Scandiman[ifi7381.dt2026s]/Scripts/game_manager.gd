extends Node

#@onready var flame_label: Label = $FlameLabel

@export var song_id: int = 0
@export var scene_name: String = ""
@export var current_id: int = 0
var song_balls = 5

func _ready() -> void:
	MusicPlayer.get_stream_playback().switch_to_clip(song_id)
	Enis_HUD.update_sceneName(scene_name)
	Enis_HUD.update_questName(current_id)

func _input(event):
	if event.is_action_released("kill_app"):
		get_tree().quit()
	if event.is_action_released("restart"):
		Enis_HUD.resetQuests()
		get_tree().change_scene_to_file.call_deferred("res://Scenes/levels/level_1.tscn")
	if event.is_action_pressed("move_right") && current_id == 1:
		Enis_HUD.questDone(current_id)
#func add_flames_out():
#	flames_out -= 1
#	flame_label.text = "Blue Flames remaining: " + str(flames_out)

func update_quest(scene_id: int = 0):
	if scene_id <= 0:
		return
	if scene_id == 7:
		if song_balls > 0: #ENi Note: to assure that after finishing the quest, the number is not touhced any longer
			song_balls -= 1
			if song_balls <= 0:
				Enis_HUD.questDone(scene_id)
	else:
		Enis_HUD.questDone(scene_id)

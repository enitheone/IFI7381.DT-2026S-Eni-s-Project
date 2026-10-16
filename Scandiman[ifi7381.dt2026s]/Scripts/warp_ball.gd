extends Area2D
@export var this_scene_id = 0
@export var next_scene_id = 0
@export var is_this_quest_ball = false
@onready var game_manager: Node = %GameManager

func _on_body_entered(body: Node2D) -> void:
	if is_this_quest_ball:
		game_manager.update_quest(this_scene_id)
	get_tree().change_scene_to_file.call_deferred("res://Scenes/levels/level_"+str(int(next_scene_id))+".tscn")
	#var root_node = get_tree().get_root()
	#var scene_node = root_node.get_node("Level"+(str(int(this_scene_id))))
	#scene_node.queue_free()

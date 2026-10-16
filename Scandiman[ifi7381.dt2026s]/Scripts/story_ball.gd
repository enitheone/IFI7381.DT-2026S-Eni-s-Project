extends Area2D
@onready var story_label: Label = $StoryLabel
@export var story_text = "Either you missed the Inspector or you made a mistake."
@export var is_this_quest_ball = false
@onready var game_manager: Node = %GameManager
@export var this_scene: int = 0

var am_I_done: bool = false

func _ready() -> void:
	story_label.visible = false
	story_label.text = story_text

func _on_body_entered(body: Node2D) -> void:
	story_label.visible = true
	if is_this_quest_ball && !am_I_done:
		game_manager.update_quest(this_scene)
		am_I_done = true

func _on_body_exited(body: Node2D) -> void:
	story_label.visible = false

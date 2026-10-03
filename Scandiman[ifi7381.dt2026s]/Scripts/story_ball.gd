extends Area2D
@onready var story_label: Label = $StoryLabel
@export var story_text = "Either you missed the Inspector or you made a mistake."

func _ready() -> void:
	story_label.visible = false
	story_label.text = story_text

func _on_body_entered(body: Node2D) -> void:
	story_label.visible = true
	

func _on_body_exited(body: Node2D) -> void:
	story_label.visible = false

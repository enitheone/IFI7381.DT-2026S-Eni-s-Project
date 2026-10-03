extends Area2D
@onready var story_label: Label = $StoryLabel

func _ready() -> void:
	story_label.visible = false

func _on_body_entered(body: Node2D) -> void:
	story_label.visible = true
	

func _on_body_exited(body: Node2D) -> void:
	story_label.visible = false

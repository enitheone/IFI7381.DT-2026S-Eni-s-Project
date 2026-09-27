extends Area2D

@onready var timer = $Timer
@onready var hups: AudioStreamPlayer2D = $Hups

func _on_body_entered(body: Node2D) -> void:
	print("The player died!")
	Engine.time_scale = 0.5
	body.get_node("AnimatedSprite2D").play("dead")
	hups.play()
	body.get_node("CollisionShape2D").queue_free()
	timer.start()
	

func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
	Engine.time_scale = 1

extends CharacterBody2D

const SPEED = 67.0
@onready var animated_sprite: = $AnimatedSprite2D


func _physics_process(delta: float) -> void:

	# Tutorial got to this point. 
	# Input.get_axis apparently returns -1 (left), 0 (no input) or 1 (right.
	var dir_x := Input.get_axis("move_left", "move_right")
	var dir_y := Input.get_axis("move_down", "move_up")
	
	#Tutorial put the sprite flipping here.
	# ENI Note: else if and else did not work originally.
	# Remember elif for Godot.
	if dir_x > 0:
		animated_sprite.flip_h = false
	elif dir_x < 0:
		animated_sprite.flip_h = true
	
	#Pacman has no animations, so rotate the sprite where it makes sense?
	
	#..apply movement.
	if dir_x:
		velocity.x = dir_x * SPEED
		animated_sprite.play("move")
	elif dir_y:
		velocity.y = dir_y * SPEED
		animated_sprite.play("move")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
		animated_sprite.stop()

	move_and_slide()

extends CharacterBody2D


const SPEED = 67.0
const JUMP_VELOCITY = -250.0
@onready var animated_sprite: = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		animated_sprite.play("move")

	# Tutorial got to this point. 
	# Input.get_axis apparently returns -1 (left), 0 (no input) or 1 (right.
	var direction := Input.get_axis("move_left", "move_right")
	
	#Tutorial put the sprite flipping here.
	# ENI Note: else if and else did not work originally.
	# Remember elif for Godot.
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
		
	
	#..apply movement.
	if direction:
		velocity.x = direction * SPEED
		animated_sprite.play("move")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animated_sprite.stop()

	move_and_slide()

extends CharacterBody2D

const SPEED = 67.0
@onready var animated_sprite: = $AnimatedSprite2D
var moving_x: float = 0.0
var moving_y: float = 0.0

@onready var ray_cast_r: RayCast2D = $RayCastR
@onready var ray_cast_l: RayCast2D = $RayCastL
@onready var ray_cast_u: RayCast2D = $RayCastU
@onready var ray_cast_d: RayCast2D = $RayCastD


func _physics_process(delta: float) -> void:

	# Tutorial got to this point. 
	# Input.get_axis apparently returns -1 (left), 0 (no input) or 1 (right.
	var dir_x := Input.get_axis("move_left", "move_right")
	var dir_y := Input.get_axis("move_up", "move_down")
	
	#Tutorial put the sprite flipping here.
	# ENI Note: else if and else did not work originally.
	# Remember elif for Godot.
	if dir_x > 0:
		animated_sprite.flip_h = false
	elif dir_x < 0:
		animated_sprite.flip_h = true
	if dir_y > 0:
		animated_sprite.flip_h = false
		animated_sprite.rotation_degrees = 90.0
	elif dir_y < 0:
		animated_sprite.flip_h = false
		animated_sprite.rotation_degrees = -90.0
	else:
		animated_sprite.rotation_degrees = 0
	
	#Pacman has no animations, so rotate the sprite where it makes sense?
	
	#..apply movement.
	if dir_x && (moving_y == 0 && moving_x == 0):
		#velocity.x = dir_x * SPEED
		#velocity.y = move_toward(velocity.y, 0, SPEED)
		moving_x = dir_x
		moving_y = 0
		if dir_x > 0:
			ray_cast_r.enabled = true
			ray_cast_l.enabled = false
		elif dir_x < 0:
			ray_cast_r.enabled = false
			ray_cast_l.enabled = true
		#animated_sprite.play("move")
	elif dir_y && (moving_y == 0 && moving_x == 0):
		#velocity.y = dir_y * SPEED
		#velocity.x = move_toward(velocity.x, 0, SPEED)
		moving_y = dir_y
		moving_x = 0
		animated_sprite.play("move")
		if dir_x > 0:
			ray_cast_d.enabled = true
			ray_cast_u.enabled = false
		elif dir_x < 0:
			ray_cast_d.enabled = false
			ray_cast_u.enabled = true
	#else:
	#	velocity.x = move_toward(velocity.x, 0, SPEED)
	#	velocity.y = move_toward(velocity.y, 0, SPEED)
	#	animated_sprite.stop()
	if moving_x != 0:
		velocity.x = moving_x * SPEED
		velocity.y = move_toward(velocity.y, 0, SPEED)
		animated_sprite.play("move")
	elif moving_y != 0:
		velocity.y = moving_y * SPEED
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animated_sprite.play("move")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
		animated_sprite.stop()
	
	if ray_cast_r.is_colliding():
		ray_cast_r.enabled = false
		moving_x = 0
	if ray_cast_u.is_colliding():
		ray_cast_u.enabled = false
		moving_y = 0
	if ray_cast_l.is_colliding():
		ray_cast_l.enabled = false
		moving_x = 0
	if ray_cast_d.is_colliding():
		ray_cast_d.enabled = false
		moving_y = 0
	
	move_and_slide()

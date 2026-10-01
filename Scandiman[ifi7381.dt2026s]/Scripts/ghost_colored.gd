extends Node2D
const SPEED: = 10
var dir = [0,0]
@onready var ray_cast_x = $RayCast_X
@onready var ray_cast_y = $RayCast_Y
@onready var animated_sprite = $AnimatedSprite2D

func _ready() -> void:
	dir[0] = 1
	ray_cast_y.enabled = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_cast_x.is_colliding():
		dir[1] = dir[0] * -1
		dir[0] = 0
		ray_cast_y.target_position.x = dir[1]
		ray_cast_y.enabled = true
		ray_cast_x.enabled = false
	if ray_cast_y.is_colliding():
		dir[0] = dir[1]
		dir[1] = 0
		ray_cast_x.target_position.x = dir[0]
		ray_cast_x.enabled = true
		ray_cast_y.enabled = false
	#ENi Note: animation related. 
	if dir[0] > 0:
		animated_sprite.play("move_right")
	elif dir[0] < 0:
		animated_sprite.play("move_left")
	elif dir[1] > 0:
		animated_sprite.play("move_down")
	elif dir[1] < 0:
		animated_sprite.play("move_up")
	else:
		animated_sprite.play("idle")
	
	position.x += SPEED * delta * dir[0]
	position.y += SPEED * delta * dir[1]

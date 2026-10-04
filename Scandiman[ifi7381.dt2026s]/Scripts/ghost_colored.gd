extends Node2D
const SPEED: = 30
var dir = [0,0]
var bounces: int = 0
@onready var ray_cast_r = $RayCast_R
@onready var ray_cast_l = $RayCast_L
@onready var ray_cast_u = $RayCast_U
@onready var ray_cast_d = $RayCast_D
@onready var animated_sprite = $AnimatedSprite2D
@export var start_dir = 0
func _ready() -> void:
	match start_dir:
		0:
			dir[0] = 1
			ray_cast_r.enabled = true
			animated_sprite.play("move_right")
		1:
			dir[0] = -1
			ray_cast_l.enabled = true
			animated_sprite.play("move_left")
		2:
			dir[1] = 1
			ray_cast_d.enabled = true
			animated_sprite.play("move_down")
		3:
			dir[1] = -1
			ray_cast_u.enabled = true
			animated_sprite.play("move_up")
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_cast_r.is_colliding():
		if bounces > 4 + start_dir:
			dir[1] = 1
			dir[0] = 0
			ray_cast_d.enabled = true
			ray_cast_r.enabled = false
			animated_sprite.play("move_down")
			bounces = 0
		else:
			dir[1] = -1
			dir[0] = 0
			ray_cast_u.enabled = true
			ray_cast_r.enabled = false
			animated_sprite.play("move_up")
			bounces += 1
	if ray_cast_u.is_colliding():
		if bounces > 4 + start_dir:
			dir[0] = 1
			dir[1] = 0
			ray_cast_r.enabled = true
			ray_cast_u.enabled = false
			animated_sprite.play("move_right")
			bounces = 0
		else:
			dir[0] = -1
			dir[1] = 0
			ray_cast_l.enabled = true
			ray_cast_u.enabled = false
			animated_sprite.play("move_left")
			bounces += 1
	if ray_cast_l.is_colliding():
		if bounces > 4 + start_dir:
			dir[1] = -1
			dir[0] = 0
			ray_cast_u.enabled = true
			ray_cast_l.enabled = false
			animated_sprite.play("move_up")
			bounces = 0
		else:
			dir[1] = 1
			dir[0] = 0
			ray_cast_d.enabled = true
			ray_cast_l.enabled = false
			animated_sprite.play("move_down")
			bounces += 1
	if ray_cast_d.is_colliding():
		if bounces > 4 + start_dir:
			dir[0] = -1
			dir[1] = 0
			ray_cast_l.enabled = true
			ray_cast_d.enabled = false
			animated_sprite.play("move_left")
			bounces = 0
		else:
			dir[0] = 1
			dir[1] = 0
			ray_cast_r.enabled = true
			ray_cast_d.enabled = false
			animated_sprite.play("move_right")
			bounces += 1
	#ENi Note: this should not happen but just in case
	if dir[0] == 0 && dir[1] == 0:
		animated_sprite.play("idle")

	position.x += (SPEED + start_dir) * delta * dir[0]
	position.y += (SPEED + start_dir) * delta * dir[1]

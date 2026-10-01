extends Node2D
const SPEED: = 30
var dir = [0,0]
@onready var ray_cast_r = $RayCast_R
@onready var ray_cast_l = $RayCast_L
@onready var ray_cast_u = $RayCast_U
@onready var ray_cast_d = $RayCast_D
@onready var animated_sprite = $AnimatedSprite2D

func _ready() -> void:
	dir[0] = 1
	ray_cast_u.enabled = false
	ray_cast_d.enabled = false
	ray_cast_l.enabled = false
	animated_sprite.play("move_right")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_cast_r.is_colliding():
		dir[1] = -1
		dir[0] = 0
		ray_cast_u.enabled = true
		ray_cast_r.enabled = false
		animated_sprite.play("move_up")
	if ray_cast_u.is_colliding():
		dir[0] = -1
		dir[1] = 0
		ray_cast_l.enabled = true
		ray_cast_u.enabled = false
		animated_sprite.play("move_left")
	if ray_cast_l.is_colliding():
		dir[1] = 1
		dir[0] = 0
		ray_cast_d.enabled = true
		ray_cast_l.enabled = false
		animated_sprite.play("move_down")
	if ray_cast_d.is_colliding():
		dir[0] = 1
		dir[1] = 0
		ray_cast_r.enabled = true
		ray_cast_d.enabled = false
		animated_sprite.play("move_right")
	#ENi Note: this should not happen but just in case
	if dir[0] == 0 && dir[1] == 0:
		animated_sprite.play("idle")
	
	position.x += SPEED * delta * dir[0]
	position.y += SPEED * delta * dir[1]

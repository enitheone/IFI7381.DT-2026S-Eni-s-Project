extends Node2D
const SPEED: = 60
var dir = 1
@onready var ray_cast = $RayCast
@onready var animated_sprite = $AnimatedSprite2D
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_cast.is_colliding():
		dir *= -1
		ray_cast.target_position.x *= -1
		animated_sprite.flip_h = !animated_sprite.flip_h
	
	position.x += SPEED * delta * dir

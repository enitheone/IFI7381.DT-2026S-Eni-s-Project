extends AnimatableBody2D

var dir: float = 1.0
var ticks: int = 0
var speed: float = 2.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += speed * dir
	if ticks >= 100:
		dir *= -1
		ticks = 0
	else:
		ticks += 1

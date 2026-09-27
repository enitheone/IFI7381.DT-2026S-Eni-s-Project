extends Area2D
var touched: int = 0

@onready var game_manager: Node = %GameManager

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("The ", name, " has entered the scene.")
	


func _on_body_entered(body):
	touched += 1
	print("The ", name, " has been touched ", touched, " time(s).")
	scale.x -= 0.3
	scale.y -= 0.3
	if touched >= 3:
		print("The ", name, " has been touched too much.")
		game_manager.add_flames_out()
		queue_free()

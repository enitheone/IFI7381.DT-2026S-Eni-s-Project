extends Area2D
var touched: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("The ", name, " has entered the scene.")
	


func _on_body_entered(body: Node2D) -> void:
	touched += 1
	print("The ", name, " has been touched ", touched, " time(s).")

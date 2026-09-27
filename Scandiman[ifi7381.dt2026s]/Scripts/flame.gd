extends Area2D
var touched: int = 3

@onready var game_manager: Node = %GameManager
@onready var label: Label = $Label
@onready var touch: AudioStreamPlayer2D = $Touch
@onready var animation_player: AnimationPlayer = $AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text = str(touched)
	


func _on_body_entered(body):
	touched -= 1
	label.text = str(touched)
	touch.play()
	scale.x -= 0.3
	scale.y -= 0.3
	if touched <= 0:
		print("The ", name, " has been touched too much.")
		game_manager.add_flames_out()
		animation_player.play("out")

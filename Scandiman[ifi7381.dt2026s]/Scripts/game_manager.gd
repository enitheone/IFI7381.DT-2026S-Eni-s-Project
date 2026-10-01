extends Node

@onready var flame_label: Label = $FlameLabel

var flames_out: int = 3

func _ready() -> void:
	pass

func add_flames_out():
	flames_out -= 1
	flame_label.text = "Blue Flames remaining: " + str(flames_out)

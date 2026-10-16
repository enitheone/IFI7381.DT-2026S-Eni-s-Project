extends MenuButton

var muted: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = "Music ON"

func _on_pressed() -> void:
	if muted:
		AudioServer.set_bus_mute(1,false)
		text = "Music ON"
		muted = false
	else:
		AudioServer.set_bus_mute(1,true)
		text = "Music MUTED"
		muted = true

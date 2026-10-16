extends MenuButton

var muted: bool = false
@onready var red_x: Sprite2D = $RedX

func _on_pressed() -> void:
	if muted:
		AudioServer.set_bus_mute(1,false)
		muted = false
		red_x.visible = false
	else:
		AudioServer.set_bus_mute(1,true)
		muted = true
		red_x.visible = true

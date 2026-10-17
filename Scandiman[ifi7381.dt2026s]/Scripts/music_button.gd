extends MenuButton

var muted: bool = false
@onready var red_x: Sprite2D = $RedX

func do_the_mute():
	if muted:
		AudioServer.set_bus_mute(1,false)
		muted = false
		red_x.visible = false
	else:
		AudioServer.set_bus_mute(1,true)
		muted = true
		red_x.visible = true

func _on_pressed() -> void:
	do_the_mute()

func _input(event):
	if event.is_action_released("mute"):
		do_the_mute()

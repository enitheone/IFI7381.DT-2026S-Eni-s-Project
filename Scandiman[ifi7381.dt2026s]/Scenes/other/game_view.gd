extends Control

@onready var scene_name: Label = %SceneName

func update_sceneName(passed_name: String = ""):
	scene_name.text = passed_name

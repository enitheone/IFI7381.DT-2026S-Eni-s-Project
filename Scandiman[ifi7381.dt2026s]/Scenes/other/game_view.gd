extends Control

@onready var scene_name: Label = %SceneName
@export var quest_names: Array = []
@onready var quest_name: Label = $CanvasLayer/QuestName


var quest_statuses: Array = [false, false, false, false, false, false, false, false]
func update_sceneName(passed_name: String = ""):
	scene_name.text = passed_name

func update_questName(passed_id: int = -1):
	if (passed_id < 0 || passed_id >= quest_names.length):
		return
	quest_name.text = quest_names[int]

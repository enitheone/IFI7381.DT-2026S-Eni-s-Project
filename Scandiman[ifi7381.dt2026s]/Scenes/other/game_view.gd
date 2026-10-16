extends Control

@onready var scene_name: Label = $CanvasLayer/SceneName
@onready var quest_name: Label = $CanvasLayer/QuestName
@onready var ok: Sprite2D = $CanvasLayer/QuestName/OK

@export var quest_list: Array = ["Go to Hallway", "Go to Frontyard", "Talk to Wife Man", "Check Son Man", "Go to Store", "Find Alternative Way", "See yourself"]

var quest_statuses: Array = [false, false, false, false, false, false, false]

func update_sceneName(passed_name: String = ""):
	scene_name.text = passed_name

func update_questName(passed_id: int = -1):
	if (passed_id < 0 || passed_id >= quest_list.size()):
		return
	quest_name.text = quest_list[passed_id-1]
	ok.visible = quest_statuses[passed_id-1]

func questDone(passed_id: int = -1):
	if (passed_id < 0 || passed_id >= quest_list.size()):
		return
	quest_statuses[passed_id-1] = true
	ok.visible = quest_statuses[passed_id-1]

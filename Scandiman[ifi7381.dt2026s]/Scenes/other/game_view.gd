extends Control

@onready var scene_name: Label = $CanvasLayer/SceneName
@onready var quest_name: Label = $CanvasLayer/QuestName
@onready var ok: Sprite2D = $CanvasLayer/QuestName/OK

@export var quest_list: Array = ["Go to Hallway", "Go to Frontyard", "Talk to Wife Man", "Check Son Man", "Go to Store", "Find Alternative Way", "See yourself"]
@export var scenes_with_quests: Array = []

var quest_statuses: Array = [false, false, false, false, false, false, false]

func update_sceneName(passed_name: String = ""):
	scene_name.text = passed_name

func verify_id(passed_id: int = -1):
	if scenes_with_quests.size() < 1:
		return -1
	var temp_id: int = -1
	for i in scenes_with_quests.size():
		if passed_id == scenes_with_quests[i]:
			temp_id = i
			break
	return temp_id

func update_questName(passed_id: int = -1):
	if (passed_id < 0):
		return
	var check_id = verify_id(passed_id)
	if (check_id < 0):
		return
	quest_name.text = quest_list[check_id]
	ok.visible = quest_statuses[check_id]

func questDone(passed_id: int = -1):
	if (passed_id < 0):
		return
	var check_id = verify_id(passed_id)
	if (check_id < 0):
		return
	quest_statuses[check_id] = true
	ok.visible = quest_statuses[check_id]

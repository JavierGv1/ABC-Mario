extends Node

var previous_scene = ""
var Score = 0

func _ready():
	set_current_scene(get_tree().get_current_scene())

func set_current_scene(scene):
	previous_scene = scene

func get_previous_scene():
	return previous_scene

func set_score(score):
	Score = score

func get_score():
	return Score

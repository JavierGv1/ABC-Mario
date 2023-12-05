extends Node

@onready var Submint = $Submit
@onready var Leaderboard = $Title
@onready var Buttons = $Buttons

func _on_play_pressed():
	get_tree().change_scene_to_file("res://Escenas/Levels/Demo.tscn")

func _on_quit_pressed():
	get_tree().change_scene_to_file("res://Escenas/main_menu.tscn")


func _on_confirm_pressed():
	var name = $Submit/LineEdit.text
	var nameScore = name+"," +str(Global.get_score())

	var file = FileAccess.open("res://leaderboard.txt", FileAccess.WRITE)
	file.store_line(nameScore)
	Submint.visible = false
	
	load_leaderboard()
	

func load_leaderboard():
	var file = FileAccess.open("res://leaderboard.txt", FileAccess.READ)
	var content = file.get_as_text()
	
	print("content ",file)
	
	Leaderboard.visible = true
	Buttons.visible = true
	
func _on_line_edit_text_submitted(new_text):
	_on_confirm_pressed()

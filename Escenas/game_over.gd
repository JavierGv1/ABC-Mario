extends Control

@onready var score = $Score

func _on_restart_pressed():
	var previous_scene = Global.get_previous_scene()
	print(previous_scene)
	get_tree().change_scene_to_file(previous_scene)

func _on_menu_pressed():
	get_tree().change_scene_to_file("res://Escenas/main_menu.tscn")

func _on_quit_pressed():
	get_tree().quit()

func _on_ready():
	score.set_text("Tu puntaje alcanzado fue de "+str(Global.get_score())+" puntos.")

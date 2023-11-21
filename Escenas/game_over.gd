extends Control

func _on_restart_pressed():
	get_tree().change_scene_to_file("res://Escenas/Levels/Typing.tscn")

func _on_menu_pressed():
	get_tree().change_scene_to_file("res://Escenas/main_menu.tscn")

func _on_quit_pressed():
	get_tree().quit()

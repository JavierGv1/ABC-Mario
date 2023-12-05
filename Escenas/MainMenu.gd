extends Control



func _on_play_pressed():
	get_tree().change_scene_to_file("res://Escenas/Levels/Typing.tscn")

func _on_quit_pressed():
	get_tree().quit()


func _on_demo_pressed():
	get_tree().change_scene_to_file("res://Escenas/Levels/Demo.tscn")

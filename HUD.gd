extends Control

@onready var lives = $Lives

@onready var score =$Score:
	set(value):
		score.text = "Puntaje: " + str(value)

var uilives_scene = preload("res://lives.tscn")
func init_lives(amout):
	for ul in lives.get_children():
		ul.queue_free()
	for i in amout:
		var ul = uilives_scene.instantiate()
		lives.add_child(ul)

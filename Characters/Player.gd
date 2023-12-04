class_name Player extends CharacterBody2D

signal died

@onready var _animated_sprite = $AnimatedSprite2D

func _process(_delta):
	_animated_sprite.play("default")

func _on_die():
	died.emit()
	

class_name Enemy extends Area2D

signal dead

@export var blue = Color("#4682b4")
@export var red = Color("#639765")
@export var green = Color("#a65455")

@export var speed = 4

@onready var _animated_sprite = $AnimationCompa
@onready var prompt = $Texto
@onready var prompt_text = prompt.get_parsed_text()

func _physics_process(_delta: float) -> void:
	global_position.x -= speed
	_animated_sprite.play("default")

func _ready() -> void:
	var scene = get_tree().get_current_scene()
	var scene_name = scene.get_name()
	prompt_text = PromptList.get_prompt(scene_name)
	prompt.parse_bbcode(add_tags(prompt_text))

func get_prompt() -> String:
	return prompt_text

func set_next_character(next_character_index: int):
	var blue_text = get_bbdcode_color_tag(blue) + prompt_text.substr(0,next_character_index) + get_bbcode_end_color_tag()
	var green_text = get_bbdcode_color_tag(red) + prompt_text.substr(next_character_index,1 ) + get_bbcode_end_color_tag()
	var red_text = ""
	if next_character_index != prompt_text.length():
		red_text = get_bbdcode_color_tag(green) + prompt_text.substr( next_character_index +1 , prompt_text.length() - next_character_index + 1 ) + get_bbcode_end_color_tag()
	
	var text = blue_text+green_text+red_text
	
	prompt.parse_bbcode(add_tags(text))

func add_tags(word: String) -> String:
	var begin = "[center]"
	var end = "[/center]"
	return begin+word+end
	
func get_bbdcode_color_tag(color: Color) -> String:
	return "[color=#" + color.to_html(false) + "]"

func get_bbcode_end_color_tag() -> String:
	return "[/color]"

func _on_body_entered(body):
	if body is Player:
		var player = body
		player._on_die()

func _on_dead():
	_animated_sprite.play("Dead")
	await _animated_sprite.animation_finished
	queue_free()

func set_vel(vel : int):
	speed = vel

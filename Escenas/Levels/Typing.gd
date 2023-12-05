extends Node

# Cargar la escena del enemigo y la escena del teclado
var Enemy = preload("res://Characters/Enemy.tscn")
#var teclado_scene = preload("res://Elements/Teclado.tscn")

# Referencias a los nodos
@onready var enemy_container = $EnemyContainer
@onready var spawn_container = $SpawnContainer
@onready var HUD = $UI/HUD
@onready var player = $Player
@onready var timer  = $SpawnTimer
@onready var vel = 1
@onready var time = 4

# Variables de juego
var active_enemy = null
var current_letter_index: int = 0
var teclado_panel = null  # Referencia al panel del teclado

var Score := 0 :
	set(value):
		Score = value
		HUD.score = Score

var lives =3:
	set(values):
		lives = values
		HUD.init_lives(lives)

func _ready() -> void:
	Score = 0
	lives = 3
	# Iniciar el juego con la creación de un enemigo
	spawn_enemy()
	find_new_active_enemy()

# Función para encontrar un nuevo enemigo activo
func find_new_active_enemy():
	if active_enemy == null:
		for enemy in enemy_container.get_children():
			var prompt = enemy.get_prompt()
			var next_character = prompt.substr(0, 1)
			#teclado_panel.resaltar_tecla_y_dedo(next_character)
			active_enemy = enemy
			return
	else:
		return

# Manejar la entrada del teclado
func _unhandled_input(event: InputEvent) -> void:
	if active_enemy == null:
		print("nuevo enemigo")
		find_new_active_enemy()
	else:
		if event is InputEventKey and not event.is_pressed():
			var _typed_event = event as InputEventKey
			var key_typed = event.as_text().to_lower()
			print("Letra tipeada: ", key_typed)
			var prompt = active_enemy.get_prompt()
			var next_character = prompt.substr(current_letter_index, 1)
			
			# Resaltar la tecla y dedo correspondientes
			#teclado_panel.resaltar_tecla_y_dedo(next_character)
			
			if key_typed == next_character:
				print("Letra escrita ", key_typed)
				current_letter_index += 1
				active_enemy.set_next_character(current_letter_index)
				if current_letter_index == prompt.length():
					Score += 200
					current_letter_index = 0
					active_enemy.queue_free()
					active_enemy = null
					find_new_active_enemy()
					print("Puntaje: ",Score )
			else:
				if Score !=0:
					Score -= 50
				print("Letra escrita incorrecta ", key_typed)
				print("Puntaje: ",Score )

func _on_spawn_timer_timeout() -> void:
	if time < 0.5 :
		timer.start(time)
		time = time - time*0.01
	else: 
		timer.start(1)
	spawn_enemy()

# Generar un nuevo enemigo
func spawn_enemy() -> void:
	var enemy_instance = Enemy.instantiate()
	enemy_instance.set_vel(randf()*7.5+2.0)
	var spawn = spawn_container.get_children()
	enemy_container.add_child(enemy_instance)
	enemy_instance.global_position = spawn[0].global_position
	
func _on_player_died():
	lives -=1
	if lives == 0:
		Global.set_current_scene(get_tree().current_scene.scene_file_path)
		Global.set_score(Score)

		get_tree().change_scene_to_file("res://Escenas/game_over.tscn")

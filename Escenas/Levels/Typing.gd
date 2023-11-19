extends Node

# Cargar la escena del enemigo y la escena del teclado
var Enemy = preload("res://Characters/Enemy.tscn")
var teclado_scene = preload("res://Elements/Teclado.tscn")

# Referencias a los nodos
@onready var enemy_container = $EnemyContainer
@onready var spawn_container = $SpawnContainer

# Variables de juego
var active_enemy = null
var current_letter_index: int = 0
var teclado_panel = null  # Referencia al panel del teclado

func _ready() -> void:
	# Instanciar y agregar el panel del teclado
	var teclado_instance = teclado_scene.instantiate()
	add_child(teclado_instance)
	teclado_panel = teclado_instance.get_node("/root/Main/PanelDelTeclado")

	# Iniciar el juego con la creación de un enemigo
	spawn_enemy()
	find_new_active_enemy()

# Función para encontrar un nuevo enemigo activo
func find_new_active_enemy():
	if active_enemy == null:
		for enemy in enemy_container.get_children():
			var prompt = enemy.get_prompt()
			var next_character = prompt.substr(0, 1)
			teclado_panel.resaltar_tecla_y_dedo(next_character)
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
			var typed_event = event as InputEventKey
			var key_typed = event.as_text().to_lower()
			print("Letra tipeada: ", key_typed)
			var prompt = active_enemy.get_prompt()
			var next_character = prompt.substr(current_letter_index, 1)
			
			# Reiniciar los colores de las teclas y dedos antes de resaltar la siguiente
			
			# Resaltar la tecla y dedo correspondientes
			teclado_panel.resaltar_tecla_y_dedo(next_character)
			
			if key_typed == next_character:
				print("Letra escrita ", key_typed)
				current_letter_index += 1
				active_enemy.set_next_character(current_letter_index)
				teclado_panel.reiniciar_colores_teclas()
				if current_letter_index == prompt.length():
					current_letter_index = 0
					active_enemy.queue_free()
					active_enemy = null
					find_new_active_enemy()
			else:
				print("Letra escrita incorrecta ", key_typed)

func _on_spawn_timer_timeout() -> void:
	spawn_enemy()

# Generar un nuevo enemigo
func spawn_enemy() -> void:
	var enemy_instance = Enemy.instantiate()
	var spawn = spawn_container.get_children()
	enemy_container.add_child(enemy_instance)
	enemy_instance.global_position = spawn[0].global_position

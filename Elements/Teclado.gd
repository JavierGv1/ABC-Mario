extends Node

# Diccionario que asocia dedos con listas de teclas
var dedos_teclas = {
	"dedo_meñique_izq": ["q", "a", "z"],
	"dedo_anular_izq": ["w", "s", "x"],
	"dedo_medio_izq": ["e", "d", "c"],
	"dedo_indice_izq": ["r", "f", "v", "t", "g", "b"],
	"dedo_meñique_der": ["p", "ñ"],
	"dedo_anular_der": ["o", "l"],
	"dedo_medio_der": ["i", "k"],
	"dedo_indice_der": ["u", "j", "m", "y", "h", "n"]
}

# Función para resaltar una tecla y el dedo correspondiente
func resaltar_tecla_y_dedo(letra: String) -> void:
	var tecla_nombre = ""
	var dedo_nombre = ""

	# Recorre el diccionario para encontrar la tecla y dedo correspondientes
	for dedo in dedos_teclas:
		for tecla in dedos_teclas[dedo]:
			if tecla == letra:
				tecla_nombre = "Tecla_" + tecla
				dedo_nombre = dedo
				break

	# Accede a los nodos de tecla y dedo en la escena
	var tecla = $Teclas.get_node(tecla_nombre)  # Obtiene el nodo de la tecla
	var dedo = $Dedos.get_node(dedo_nombre)  # Obtiene el nodo del dedo

	# Cambia el color de la tecla y del dedo a verde si se encontraron los nodos
	if tecla and dedo:
		tecla.modulate = Color(0, 1, 0, 1)
		dedo.modulate = Color(0, 1, 0, 1)

func reiniciar_colores_teclas() -> void:
	print("Reinicio de los colores de las teclas y dedos")
	
	for tecla in $Teclas.get_children():
		if tecla is ColorRect:
			tecla.color = Color("#ffffff")  # Restaura el color a blanco

	
	for dedo in $Dedos.get_children():
		if dedo is ColorRect:
			dedo.color = Color("#ffffff")  # Restaura el color a blanco

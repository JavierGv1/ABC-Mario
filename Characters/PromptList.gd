extends Node

var Words = [
	"jj",
	"ff",
	"fj",
	"jf"
]
var Demo = ["hola", "como", "estas", "adios", "buenos", "dias", "tardes", "noches", "gracias", 
			"por", "favor", "de", "nada", "si", "no", "tal", "vez", "quizas", "a", "de", "en", 
			"con", "por", "para", "sin", "acerca", "de", "sobre", "hasta", "desde", "antes", 
			"despues", "mientras", "porque", "si", "no", "aunque", "pero", "o", "y", "que", 
			"quien", "donde", "cuando", "como", "cual", "cuanto", "por", "para", "contra", "sin", 
			"sobre", "debajo", "encima", "delante", "detras", "cerca", "lejos", "dentro", "fuera", 
			"arriba", "abajo", "izquierda", "derecha", "este", "oeste", "norte", "sur", "primero", 
			"segundo", "tercero", "cuarto", "quinto", "sexto", "septimo", "octavo", "noveno", "decimo",
			 "aquel", "aquella", "aquellos", "aquellas", "esto", "esta", "estos", "estas", "alli", 
			"ahi", "aqui", "ahora", "hoy", "tarde", "noche", "ayer", "anteayer","pasado", "futuro", 
			"verdad", "mentira", "bueno", "malo", "grande", "largo", 
			"corto", "ancho", "estrecho", "alto", "bajo", "cercano", "lejano", "dificil", "facil", 
			"rapido", "lento", "fuerte", "debil", "limpio", "sucio", "nuevo", "viejo", "blanco", 
			"negro", "rojo", "azul", "verde", "amarillo", "morado", "rosa", "gris", "marron", 
			"naranja", "blanco", "negro", "rojo", "azul", "verde", "amarillo", "morado", "rosa", 
			"gris", "marron", "naranja"]

func get_prompt(scene: String) -> String:
	if scene =="Demo":
		var word_index = randi() % Demo.size()
		var word = Demo[word_index]
		return word

	else:
		var word_index = randi() % Words.size()
		var word = Words[word_index]
		return word

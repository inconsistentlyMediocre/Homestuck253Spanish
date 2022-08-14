extends Node

const normal_cursor_res = preload("res://John/Cursor.tscn")
const mobile_cursor_res = preload("res://CursorManager.tscn")
var is_mobile = false
var mobile_cursor = null
var previous_scene = null
var clicked_controller = false

var john_command_array = [
	"> OYE TÚ. MUCHACHO.", "> MUCHACHO. ESCÚCHAME, MUCHACHO.", 
	"> MUCHACHO QUE ES JOHN. HAZ LO QUE DIGO.", "> OBEDECE MIS ÓRDENES, MUCHACHO JOHN.", 
	"> ME GUSTARÍA QUE EL MUCHACHO INTERACTUARA CON SU ENTORNO DE FORMA CONSTRUCTIVA.", 
	"> HAZ QUE EL MUCHACHO EVALÚE SU SITUACIÓN ACTUAL.", "> MUY BIEN.", "> ==>", "> ==>",
	"> ASLFSAKLADAK"
]

var john_text_array = [
	"... \n\n¿Qué?",
	"Su nombre es John, bobo.",
	"¿Qué te gustaría que hiciese el 'MUCHACHO QUE ES JOHN'?",
	"¿Y esas órdenes serían...?",
	"¿Quizás deberías ser un poco más específico?",
	"Me temo que no puedo 'HACER QUE EL MUCHACHO' haga eso. ¡Dile tú mismo que lo haga!",
	"... \n\nOk.",
	"¡¡¡Esa instrucción no hace nada por el momento!!!",
	"Ay. ¿Podrías por favor pasarle los controles a un usuario más competente?",
	"Cada vez más inmaduro. \n\nAh, y casi escribes 'SALADA' ahí."
]

var harlequinsprite_command_array = [
	"> QUÉ ES ESO.", "> EL PAYASO FANTASMA. HAZ ALGO CON ÉL.",
	"> NIVEL PROTO TIPA EL SPRITE, O LO QUE DIJISTE. HAZLO."
]

var harlequinsprite_text_array = [
	"Se ve distinto ahora. \nDespués de que mordiste esa MANZANA, toda tu casa parece haberse transportado a algún lugar. Después, la MANZANA desapareció y el KERNELSPRITE sufrió una transformación. Además del cambio de apariencia, la transformación no parece haber tenido ramificaciones relevantes.\n\nAún no puedes entender ni una palabra de lo que dice este idiota.",
	"¡El 'PAYASO FANTASMA' se llama KERNELSPRITE! O, tan sólo SPRITE ahora, supongo. \n\n¡No puedes 'HACER ALGO' con él en este momento! Lo único que podrías hacer con él, teóricamente, es PROTOTIPARLO AL NIVEL 2, asumiendo que eso aún sea posible...",
	"¡No eres el que se supone que deba prototiparlo! El USUARIO SERVIDOR DE SBURB debe hacerlo."
]

var railing_command_array = [
	"> ECHA UN VISTAZO POR SOBRE LA BARANDILLA."
]

var railing_text_array = [
	"Acercarte a la barandilla te pone algo nervioso. Estás bastante alto."
]

var alchemiter_command_array = [
	"> ESTA GRAN PLATAFORMA. SANTO CIELO, ¿QUÉ ES ESTO, MUCHACHO?"
]

var alchemiter_text_array = [
	"El ALQUIMIZADOR creó la MANZANA, o el árbol del cual brotó, mejor dicho, justo a tiempo para salvarte de la destrucción. Pero no estás seguro si puedes decir lo mismo de tu vecindario. \n\nTe preguntas, ¿qué pasó con tu PAPÁ?"
]

var totem_command_array = [
	"> EXAMINA EL EXTRAÑO FLORERO AZUL."
]

var totem_text_array = [
	"Es el trozo de CRUXITA que tallaste con el TORNO DE TÓTEMS. \n\nCuando su contorno fue escaneado, el ALQUIMIZADOR pudo producir ese árbol. ¡Qué extraño!"
]

var balcony_door_command_array = [
	"> MUCHACHO, ABRE ESTA PUERTA Y ATRAVIÉSALA."
]

var balcony_door_inside_command_array = [
	"> ESPERA MUCHACHO VUELVE A SALIR."
]

var entity_command_dict = {
	"John": john_command_array,
	"Harlequinsprite": harlequinsprite_command_array,
	"Railing": railing_command_array,
	"Alchemiter": alchemiter_command_array,
	"Totem": totem_command_array,
	"BalconyDoor": balcony_door_command_array,
	"BalconyDoorInside": balcony_door_inside_command_array,
}

var entity_text_dict = {
	"John": john_text_array,
	"Harlequinsprite": harlequinsprite_text_array,
	"Railing": railing_text_array,
	"Alchemiter": alchemiter_text_array,
	"Totem": totem_text_array,
}

var current_entity_index_dict = { }

func _ready():
	get_interactable_index()
#	if OS.get_name() == "HTML5":
#		is_mobile = JavaScript.eval("/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)")
#		if is_mobile:
#			var mobile_cursor = mobile_cursor_res.instance()
#			call_deferred("add_child", mobile_cursor)
#		else:
#			var normal_cursor = normal_cursor_res.instance()
#			call_deferred("add_child", normal_cursor)
	

func get_interactable_index():
	var interactables = get_tree().get_nodes_in_group("Interactables")
	for i in interactables:
		if current_entity_index_dict.empty():
			current_entity_index_dict[i.name] = 0
		else:
			if !current_entity_index_dict.has(i.name):
				current_entity_index_dict[i.name] = 0

func _process(delta):
	if mobile_cursor == null:
		mobile_cursor = is_mobile_cursor()

func is_mobile_cursor():
	if get_tree().get_root().find_node("Cursor", true, false) != null:
		return false
	elif get_tree().get_root().find_node("CursorManager", true, false) != null:
		return true

func update_changed_scene():
	var john = get_tree().get_root().find_node("John", true, false)
	get_interactable_index()
	if previous_scene != null:
		match previous_scene:
			"Balcony":
				john.global_position = Vector2(515, 333)
			"HouseInside":
				john.global_position = Vector2(366, 529)
			"JohnRoom":
				john.global_position = Vector2(515, 333)

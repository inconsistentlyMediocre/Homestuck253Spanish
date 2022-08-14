extends Node2D

export var map_size = Vector2()

onready var john = get_tree().get_root().find_node("John", true, false)

var plant_command = ["> HUELE EL VEGETAL."]
var plant_text = ["No huele a nada."]

var sassacre_command = ["> ESTE LIBRO ES MUY GRANDE PARA UN ESTÚPIDO NIÑO PEQUEÑO."]
var sassacre_text = ["¡El TEXTO DEL CORONEL SASSACRE es tu libro favorito! ¡Casi tan favorito como WISE GUY! ¡Los dos son tus más favoritos de todos los tiempos!"]

var box_command = ["> PRUEBA EL POSTRE CRUDO EN POLVO."]
var box_text = ["¡Atrás, miserable mujer! ¡¡¡Detened vuestras asfixiantes partículas aéreas de tentación!"]

var drawing_command = ["> EXAMINA ESTE ARTE."]
var drawing_text = ["Tu PAPÁ estaba tan orgulloso cuando dibujaste esto. Lo colgó inmediatamente y se quedó ahí desde entonces.\n\nEso fue hace una semana."]

var bowl_command = ["> MIRA DENTRO DEL BOL DE SUSTANCIA PEGAJOSA."]
var bowl_text = ["Dondequiera que haya ido tu PAPÁ, parece haberse ido de forma apresurada.\n\nA pesar de todos sus disparates que tienes que aguantar, en verdad desearías que estuviese aquí ahora."]

var phone_command = ["> ESTO ES UN TELÉFONO, MUCHACHO. ÚSALO."]
var phone_text = ["¡El teléfono no funciona!"]

var oil_command = ["> EXAMINA ESTA SUSTANCIA ESPARCIDA."]
var oil_text = ["Esto es... \n\n¿Petróleo?\n\nTe preguntas qué pasó aquí. ¿Dónde está tu PAPÁ?"]

var cabinet_command = ["> SAQUEA EL COFRE."]
var cabinet_text = ["¿Te gustaría jugar un juego?"]

var door_command = ["> ABRE ESTA PUERTA AHORA."]
var arrow_command = ["> REGRESA A LA HABITACIÓN CON LOS RESTOS DE LA ANCIANA MUERTA."]

func update_changed_scene():
	Autoload.get_interactable_index()
	if Autoload.previous_scene != null:
		match Autoload.previous_scene:
			"HouseInside":
				john.position = Vector2(973, 772)
			"UtilityRoom":
				john.position = Vector2(920, 540)

func _ready():
	john.get_node("Camera2D").limit_left = -1000
	
	update_changed_scene()
	
	Autoload.entity_command_dict["Plant"] = plant_command
	Autoload.entity_text_dict["Plant"] = plant_text
	
	Autoload.entity_command_dict["SassacreBook"] = sassacre_command
	Autoload.entity_text_dict["SassacreBook"] = sassacre_text
	
	Autoload.entity_command_dict["RedBox"] = box_command
	Autoload.entity_text_dict["RedBox"] = box_text
	
	Autoload.entity_command_dict["FridgeDrawing"] = drawing_command
	Autoload.entity_text_dict["FridgeDrawing"] = drawing_text
	
	Autoload.entity_command_dict["Bowl"] = bowl_command
	Autoload.entity_text_dict["Bowl"] = bowl_text
	
	Autoload.entity_command_dict["Phone"] = phone_command
	Autoload.entity_text_dict["Phone"] = phone_text
	
	Autoload.entity_command_dict["OilSpill"] = oil_command
	Autoload.entity_text_dict["OilSpill"] = oil_text
	
	Autoload.entity_command_dict["Cabinet"] = cabinet_command
	Autoload.entity_text_dict["Cabinet"] = cabinet_text
	
	Autoload.entity_command_dict["KitchenDoor"] = door_command
	Autoload.entity_command_dict["ArrowKitchen"] = arrow_command


extends Node2D

export var map_size = Vector2()

onready var john = get_tree().get_root().find_node("John", true, false)

var door_right_command = ["> ABRE ESTO."]
var door_right_text = ["¡¡¡La habitación de tu PAPÁ sigue cerrada!!!"]

var harry_anderson_command = ["> NO ME AGRADA ESTE SUJETO ENGREÍDO."]
var harry_anderson_text = ["EL HOMBRE. EL MITO. LA LEYENDA.\n\n¿Qué tienes bajo tu manga, Anderson?\n\nMira esa cara de póker. ¡No le dirá a nadie!"]

var door_left_command = ["> VE AHÍ AHORA."]
var arrow_command = ["> NO VUELVE."]

func update_changed_scene():
	Autoload.get_interactable_index()
	if Autoload.previous_scene != null:
		match Autoload.previous_scene:
			"HouseInside":
				john.position = Vector2(330, 630)
			"Bathroom":
				john.position = Vector2(330, 630)

func _ready():
	update_changed_scene()
	
	Autoload.entity_command_dict["HarryAndersonPoster"] = harry_anderson_command
	Autoload.entity_text_dict["HarryAndersonPoster"] = harry_anderson_text
	
	Autoload.entity_command_dict["DoorRight"] = door_right_command
	Autoload.entity_text_dict["DoorRight"] = door_right_text
	
	Autoload.entity_command_dict["DoorLeft"] = door_left_command
	Autoload.entity_command_dict["ArrowHallway"] = arrow_command

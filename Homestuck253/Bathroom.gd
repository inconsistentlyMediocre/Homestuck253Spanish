extends Node2D

export var map_size = Vector2()

onready var john = get_tree().get_root().find_node("John", true, false)

var bathroom_window_command = ["> OBSERVA A TRAVÉS DE ESA VENTANA."]
var bathroom_window_text = ["Al menos tu patio trasero también se salvó. \n\nMás o menos."]

var bathtub_and_toilet_command = ["> TUS CAÑERÍAS PARECEN DEFECTUOSAS."]
var bathtub_and_toilet_text = ["Amigo, Rose realmente hizo un trabajo de mierda arreglando tu baño. ¡Ciertamente sería un error tratar de usar el inodoro!\n\nSupones que podrías ir a orinar por sobre el borde de ese precipicio."]

var arrow_bathroom_command = ["> VETE DE UNA VEZ."]

func update_changed_scene():
	Autoload.get_interactable_index()
	if Autoload.previous_scene != null:
		match Autoload.previous_scene:
			"Hallway":
				john.position = Vector2(680, 690)

func _ready():
	update_changed_scene()
	
	Autoload.entity_command_dict["BathroomWindow"] = bathroom_window_command
	Autoload.entity_text_dict["BathroomWindow"] = bathroom_window_text
	
	Autoload.entity_command_dict["BathtubAndToilet"] = bathtub_and_toilet_command
	Autoload.entity_text_dict["BathtubAndToilet"] = bathtub_and_toilet_text
	
	Autoload.entity_command_dict["ArrowBathroom"] = arrow_bathroom_command

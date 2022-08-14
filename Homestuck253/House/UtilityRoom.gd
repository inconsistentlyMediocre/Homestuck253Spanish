extends Node2D

export var map_size = Vector2()

onready var john = get_tree().get_root().find_node("John", true, false)

var washing_machine_command = ["> ESTE NO ES MOMENTO PARA LAVAR ROPA."]
var washing_machine_text = ["Tienes razón. Gracias por ser sensato al respecto."]

var boxes_command = ["> ABRE ESTO Y REVISA SI CONTIENEN BIENES."]
var boxes_text = ["¡No te importa una mierda lo que hay ahí! Probablemente nada que estés dispuesto a usar ahora en todo caso."]

var arrow_command = ["> VUELVE AL SALÓN DE ALMUERZOS."]
var door_command = ["> SAL, MUCHACHO."]

func update_changed_scene():
	john.get_node("AnimatedSprite").flip_h = true
	Autoload.get_interactable_index()
	if Autoload.previous_scene != null:
		match Autoload.previous_scene:
			"Kitchen":
				john.position = Vector2(410, 690)
			"Backyard":
				john.position = Vector2(520, 515)

func _ready():
	update_changed_scene()
	
	Autoload.entity_command_dict["WashingMachine"] = washing_machine_command
	Autoload.entity_text_dict["WashingMachine"] = washing_machine_text
	
	Autoload.entity_command_dict["Boxes"] = boxes_command
	Autoload.entity_text_dict["Boxes"] = boxes_text
	
	Autoload.entity_command_dict["ArrowUtilityRoom"] = arrow_command
	Autoload.entity_command_dict["UtilityRoomDoor"] = door_command
	
	

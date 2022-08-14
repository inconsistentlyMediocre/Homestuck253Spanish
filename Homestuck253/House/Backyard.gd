extends Node2D

export var map_size = Vector2()
onready var john = get_tree().get_root().find_node("John", true, false)

var generator_command = ["> ADMIRA ESTE INSTRUMENTO MONTADO EN LA PARED."]
var generator_text = ["Por el actuar de alguna misteriosa fuerza, tu casa aún tiene electricidad, a pesar de que los cables estén cortados. Bastante extraño."]

var wires_command = ["> JUEGA CON LAS COSAS CON CHISPAS BRILLANTES."]
var wires_text = ["¡Eso suena increíblemente peligroso! John sensatamente ignora tu horrible consejo."]

var pogo_command = ["> CONSIDERA LA ATRACCIÓN DEL JARDÍN."]
var pogo_text = ["Tu némesis de la infancia, el ASIENTO DE POGO MONTADO EN RESORTE, lamentablemente no fue tragado por el vacío. Tendrá que esperar otro día para recibir su merecido."]

var swingset_command = ["> MUCHACHO, INTERACTÚA CON ESTA DESTROZADA EXHIBICIÓN CON FORMA DE TRAPECIO."]
var swingset_text = ["Parece que tu COLUMPIO está arruinado. Revives buenos recuerdos en un momento de tristeza."]

var handcuffs_command = ["> RECLAMA LA CHUCHERÍA QUE CUELGA DEL ÁRBOL."]
var handcuffs_text = ["¡Las ESPOSAS TRUCADAS siguen ahí! GRACIAS A DIOS.\n\nY no, no vas a tratar de 'reclamarlas' ahora mismo."]

var door_command = ["> TÚ, VUELVE A LA CASA."]

func update_changed_scene():
	Autoload.get_interactable_index()
	if Autoload.previous_scene != null:
		match Autoload.previous_scene:
			"UtilityRoom":
				john.position = Vector2(2080, 2550)
				john.get_node("AnimatedSprite").flip_h = false

func _ready():
	update_changed_scene()
	john.get_node("Camera2D").zoom = Vector2(1.25, 1.25)
	
	Autoload.entity_command_dict["Generator"] = generator_command
	Autoload.entity_text_dict["Generator"] = generator_text
	
	Autoload.entity_command_dict["Wires"] = wires_command
	Autoload.entity_text_dict["Wires"] = wires_text
	
	Autoload.entity_command_dict["Handcuffs"] = handcuffs_command
	Autoload.entity_text_dict["Handcuffs"] = handcuffs_text
	
	Autoload.entity_command_dict["Swingset"] = swingset_command
	Autoload.entity_text_dict["Swingset"] = swingset_text
	
	Autoload.entity_command_dict["PogoRide"] = pogo_command
	Autoload.entity_text_dict["PogoRide"] = pogo_text
	
	Autoload.entity_command_dict["BackyardDoor"] = door_command

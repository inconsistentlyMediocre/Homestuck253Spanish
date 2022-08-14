extends Node2D

export var map_size = Vector2()

onready var john = get_tree().get_root().find_node("John", true, false)
var previous_scene = null

var beagle_puss_command_array = ["> ESE HOMBRE CON LAS GAFAS HUMORÍSTICAS. ADMÍRALO."]
var beagle_puss_text_array = ["Oh, Michael Cera. Tu cálida sonrisa es una luz brillante en estos tiempos oscuros."]

var harlequin_1_command_array = ["> ¡ABORREZCO ESTO! ¿IGNORARLO?"]
var harlequin_1_text_array = ["¿La PINTURA DE ARLEQUÍN? \n\nEntonces tienes esa opinión en común con John, supongo."]

var harlequin_2_command_array = ["> NO NO NO NO NO. SIGUE MOVIÉNDOTE."]
var harlequin_2_text_array = ["Créeme, no tienes intención de voltear tu cabeza para observar esta cosa espantosa."]

var harlequin_3_command_array = ["> DETESTABLE. NO LE PRESTES ATENCIÓN A ESTA PORQUERÍA."]
var harlequin_3_text_array = ["¿Qué se supone que está haciendo? ¿Jugando con una pelota o algo? \n\nLos payasos son estúpidos."]

var harlequin_4_command_array = ["> UGH. NO."]
var harlequin_4_text_array = ["Tan recatado. Tan misterioso."]

var lamp_command_array = ["> ¿POR QUÉ ESTÁ ESTE PEQUEÑO HOMBRE AQUÍ?"]
var lamp_text_array = ["Este ARLEQUÍN está siempre listo para servirte con iluminación, ya sea que estés leyendo un libro, o disfrutando de una buena pipa."]

var harlequin_head_command_array = ["> QUÉ SIGNIFICA ESTA BASURA."]
var harlequin_head_text_array = ["Ok, incluso TÚ debes admitirlo. ¡Este es bastante gracioso! \n\n¡Jejejeje!"]

var pie_tray_command_array = ["> ¿UNA PEQUEÑA BANDEJA DE POSTRE? INÚTIL."]
var pie_tray_text_array = ["En retrospectiva, fue bastante gracioso cuando tu PAPÁ te lanzó el pastel. ¡Otra vez atrapado por el viejo!"]

var cruxtruder_lid_command_array = ["> USA ESTO PARA VOLVER A SELLAR ESA APERTURA DE AHÍ."]
var cruxtruder_lid_text_array = ["Si tan sólo volver a ponerle la tapa al CRUXTRUDER deshiciera todo lo que ha hecho. Lamentablemente, el Tubo de Pandora ha sido abierto."]

var cruxtruder_command_array = ["> MUEVE ESTA ABSURDA ESTRUCTURA Y SAL DE TU CASA, MUCHACHO."]
var cruxtruder_text_array = ["¡Esta cosa pesa una tonelada! Honestamente te sorprendería si el cursor del juego pudiese levantarlo, o al menos sin un gasto significativo de MATERIA. \n\nDe todos los lugares en los que Rose podría haber dejado caer esta cosa infernal. Más que nunca te sientes... ¿cuál es la palabra que estás buscando? Por supuesto. Casatrapado."]

var harlequins_command = ["> DESTRUYE A ESTOS DIMINUTOS SOLDADOS DE JÚBILO."]
var harlequins_text = ["Difícilmente parece valer la pena molestarse. \n\nDudas que puedas sacarles mucho incluso en una venta de garaje. Quizás un sucio puñado de centavos y una patada en los testículos por todos ellos."]

var pokers_command = ["> BLANDE ESTOS INSTRUMENTOS DE COMBATE."]
var pokers_text = ["Cualquiera de estas cosas sería una buena arma. Si tan sólo tu SPECIBUS DE CONFRONTACIÓN no estuviese ya asignado. Oh, bueno."]

var urn_command = ["> VOLCAR ESTA URNA INMEDIATAMENTE."]
var urn_text = ["¡Eso sería una falta de respeto hacia tu ABUELITA! ¡¡No lo harás!! ¡¡¡O no intencionalmente, al menos!!! \n\nCrees que es afortunado que ya no esté aquí para presenciar todo este dolor. Por otro lado, probablemente ahora te beneficiarías de su anciana sabiduría..."]

var fireplace_command = ["> GUARDA UN TROZO DE HOLLÍN PARA USO FUTURO, MUCHACHO."]
var fireplace_text = ["¡Esa cosa está muy sucia y no la quieres! \n\nAdemás, estás bastante seguro que una parte significativa está compuesta de asbesto."]

var bedroom_door_command = ["> MUCHACHO. ENTRA AQUÍ."]
var hallway_command = ["> QUÉ HAY POR AQUÍ. PROCEDE, MUCHACHO."]
var study_command = ["> AQUÍ MUCHACHO. AQUÍ."]
var kitchen_command = ["> POR AQUÍ. POR LAS PUERTAS COMO LAS QUE SE VEN EN UNA TABERNA DE VAQUEROS."]

func update_changed_scene():
	Autoload.get_interactable_index()
	if Autoload.previous_scene != null:
		match Autoload.previous_scene:
			"Balcony":
				john.position = Vector2(515, 333)
				john.get_node("AnimatedSprite").flip_h = true
			"JohnRoom":
				john.position = Vector2(515, 333)
			"Hallway":
				john.position = Vector2(515, 333)
			"Study":
				john.position = Vector2(614, 838)
			"Kitchen":
				john.position = Vector2(614, 838)

func _ready():
	john.get_node("Camera2D").limit_left = -150
	john.get_node("Camera2D").limit_right = $Position2D.position.x
	john.get_node("Camera2D").limit_bottom = $Position2D.position.y
	
	update_changed_scene()
	
	Autoload.entity_command_dict["BeaglePussPoster"] = beagle_puss_command_array
	Autoload.entity_text_dict["BeaglePussPoster"] = beagle_puss_text_array
	Autoload.entity_command_dict["HarlequinPoster1"] = harlequin_1_command_array
	Autoload.entity_text_dict["HarlequinPoster1"] = harlequin_1_text_array
	Autoload.entity_command_dict["HarlequinPoster2"] = harlequin_2_command_array
	Autoload.entity_text_dict["HarlequinPoster2"] = harlequin_2_text_array
	Autoload.entity_command_dict["HarlequinPoster3"] = harlequin_3_command_array
	Autoload.entity_text_dict["HarlequinPoster3"] = harlequin_3_text_array
	Autoload.entity_command_dict["HarlequinPoster4"] = harlequin_4_command_array
	Autoload.entity_text_dict["HarlequinPoster4"] = harlequin_4_text_array
	Autoload.entity_command_dict["Lamp"] = lamp_command_array
	Autoload.entity_text_dict["Lamp"] = lamp_text_array
	Autoload.entity_command_dict["HarlequinHead"] = harlequin_head_command_array
	Autoload.entity_text_dict["HarlequinHead"] = harlequin_head_text_array
	Autoload.entity_command_dict["PieTray"] = pie_tray_command_array
	Autoload.entity_text_dict["PieTray"] = pie_tray_text_array
	Autoload.entity_command_dict["CruxtruderLid"] = cruxtruder_lid_command_array
	Autoload.entity_text_dict["CruxtruderLid"] = cruxtruder_lid_text_array
	Autoload.entity_command_dict["Cruxtruder"] = cruxtruder_command_array
	Autoload.entity_text_dict["Cruxtruder"] = cruxtruder_text_array
	Autoload.entity_command_dict["Harlequins"] = harlequins_command
	Autoload.entity_text_dict["Harlequins"] = harlequins_text
	Autoload.entity_command_dict["Pokers"] = pokers_command
	Autoload.entity_text_dict["Pokers"] = pokers_text
	Autoload.entity_command_dict["Urn"] = urn_command
	Autoload.entity_text_dict["Urn"] = urn_text
	Autoload.entity_command_dict["Fireplace"] = fireplace_command
	Autoload.entity_text_dict["Fireplace"] = fireplace_text
	
	Autoload.entity_command_dict["BedroomDoor"] = bedroom_door_command
	Autoload.entity_command_dict["HallwayEntrance"] = hallway_command
	Autoload.entity_command_dict["StudyEntrance"] = study_command
	Autoload.entity_command_dict["KitchenEntrance"] = kitchen_command

extends Node2D

export var map_size = Vector2()

onready var john = get_tree().get_root().find_node("John", true, false)

var cirque_poster_command = ["> INSPECCIONA A ESTA ALEGRE BANDA DE INTÉRPRETES."]
var cirque_poster_text = ["Cirque du Soleil una vez presentó una orden de restricción contra tu padre. Nunca habías estado tan avergonzado en tu vida."]

var cards_command = ["> ESTO ES UN DESASTRE, MUCHACHO."]
var cards_text = ["Te alegra que tu PAPÁ no estuviese mirando cuando hiciste esto. Nunca te hubiese dejado en paz al respecto."]

var piano_command = ["> OPERA ESTE INSTRUMENTO."]
var piano_text = ["Tocas tu estribillo encantador favorito."]

var pipe_command = ["> ¿ES ESTE APARATO PARA QUEMAR TABACO?"]
var pipe_text = ["Puaj. Aún tienes sabor a pipa en tu boca."]

var harlequin_piano_command = ["> TIRA ESTA COSA FEA POR LA VENTANA."]
var harlequin_piano_text = ["¡No harás eso intencionalmente! \n\nSólo recurres a tirar cosas por la ventana mediante mal manejo de tu SYLLADEX."]

var joker_command = ["> TIENE UN CUCHILLO. QUE ESTO TE ALARME."]
var joker_text = ["Q.E.P.D Ledger."]

var harlequin_poster_2_command = ["> ESTE HOMBRE ES UN IMBÉCIL. IGNÓRALO."]
var harlequin_poster_2_text = ["Te parece que él está bien. Se ve que no se toma muy en serio a sí mismo, y sabe cómo pasarlo bien. \n\nAsumes que tu PAPÁ lo colgó torcido para hacerlo más 'peculiar'."]

var window_command = ["> MIRA AQUÍ."]
var window_text = ["Está oscuro afuera, no puedes ver nada por kilómetros."]

var safe_command = ["> ABRE ESTA BÓVEDA DE HIERRO, MUCHACHO."]
var safe_text = ["¡¡¡No sabes cuál es la combinación!!!"]

var harlequin_safe_command = ["> BUSCA LAS RIQUEZAS QUE GUARDA DEBAJO."]
var harlequin_safe_text = ["Este ofrece un saludo amigable. \n\nPero sí, es realmente sólo otro estúpido pedazo de mierda."]

var harlequin_poster_1_command = ["> VEO TRAICIÓN EN SUS OJOS."]
var harlequin_poster_1_text = ["Oh, no se ve tan malo."]

var peanuts_command = ["> CONSUME LA NUEZ."]
var peanuts_text = ["Lo harías, pero no estás seguro si este reino oscuro tiene hospitales."]

var serious_jester_command = ["> LEE LITERATURA DESAGRADABLE."]
var serious_jester_text = ["REVISTA BUFÓN SERIO. \n\nPARA QUIENES LAS PAYASADAS SON ASUNTO SERIO."]

var hats_command = ["> IGNORA ESTAS TONTERÍAS."]
var hats_text = ["Tu PAPÁ a veces usaba estas cosas para deslumbrarte con sus tontos actos de vodevil. En serio, no podrías girar tus ojos con suficiente fuerza frente a su cursi acto."]

var exit_command = ["> VUELVE A LA HABITACIÓN GRANDE CON LAS PINTURAS ASQUEROSAS."]

func update_changed_scene():
	Autoload.get_interactable_index()
	if Autoload.previous_scene != null:
		match Autoload.previous_scene:
			"HouseInside":
				john.position = Vector2(185, 710)

func _ready():
	john.get_node("Camera2D").target_y = -160
	
	update_changed_scene()
	
	Autoload.entity_command_dict["CirqueDuSoleilPoster"] = cirque_poster_command
	Autoload.entity_text_dict["CirqueDuSoleilPoster"] = cirque_poster_text
	
	Autoload.entity_command_dict["Cards"] = cards_command
	Autoload.entity_text_dict["Cards"] = cards_text
	
	Autoload.entity_command_dict["Piano"] = piano_command
	Autoload.entity_text_dict["Piano"] = piano_text
	
	Autoload.entity_command_dict["PipePiano"] = pipe_command
	Autoload.entity_text_dict["PipePiano"] = pipe_text
	
	Autoload.entity_command_dict["HarlequinStatuePiano"] = harlequin_piano_command
	Autoload.entity_text_dict["HarlequinStatuePiano"] = harlequin_piano_text
	
	Autoload.entity_command_dict["Joker"] = joker_command
	Autoload.entity_text_dict["Joker"] = joker_text
	
	Autoload.entity_command_dict["WindowStudy"] = window_command
	Autoload.entity_text_dict["WindowStudy"] = window_text
	
	Autoload.entity_command_dict["WindowStudy"] = window_command
	Autoload.entity_text_dict["WindowStudy"] = window_text
	
	Autoload.entity_command_dict["HarlequinPosterStudy2"] = harlequin_poster_2_command
	Autoload.entity_text_dict["HarlequinPosterStudy2"] = harlequin_poster_2_text
	
	Autoload.entity_command_dict["HarlequinPosterStudy1"] = harlequin_poster_1_command
	Autoload.entity_text_dict["HarlequinPosterStudy1"] = harlequin_poster_1_text
	
	Autoload.entity_command_dict["Safe"] = safe_command
	Autoload.entity_text_dict["Safe"] = safe_text
	
	Autoload.entity_command_dict["HarlequinStatueSafe"] = harlequin_safe_command
	Autoload.entity_text_dict["HarlequinStatueSafe"] = harlequin_safe_text
	
	Autoload.entity_command_dict["Peanuts"] = peanuts_command
	Autoload.entity_text_dict["Peanuts"] = peanuts_text
	
	Autoload.entity_command_dict["SeriousJester"] = serious_jester_command
	Autoload.entity_text_dict["SeriousJester"] = serious_jester_text
	
	Autoload.entity_command_dict["HatRack"] = hats_command
	Autoload.entity_text_dict["HatRack"] = hats_text
	
	Autoload.entity_command_dict["StudyExit"] = exit_command

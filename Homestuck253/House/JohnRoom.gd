extends Node2D

export var map_size = Vector2()

onready var john = get_tree().get_root().find_node("John", true, false)

var little_monsters_poster_command = ["> INSPECCIONA A ESTE ESPANTOSO HOMBRE Y SU NIÑO."]
var little_monsters_poster_text = ["'Fred Savage tiene una cara golpeable' ¡tu trasero! Más bien la cara de un talentoso joven actor con el cual te gustaría pasar el rato si tuvieses la oportunidad, y también si no fuese ya un hombre adulto. \nDe todas formas, la idea de monstruos acechando tu casa hace que te cagues de miedo, y por eso esta película es tan genial. Pero el hecho de que esos monstruos también puedan ser TU MEJOR AMIGO es lo que la hace DOBLEMENTE GENIAL."]

var con_air_poster_command = ["> ¿ESE ES JOHN CUSSACK?"]
var con_air_poster_text = ["Sí, supones, pero que esa maldita puerta esté tapando a tu hombre Cage es algo serio. ¡Eso no está bien!"]

var door_command = ["> ESTA PUERTA. EXPLÍCA ESTO."]
var door_text = ["Rose realmente destruyó tu casa. Pero supones que sí logró salvarte la vida. \n\nSUPONES."]

var box_command = ["> OBSERVA ESTA CAJA."]
var box_text = ["EL CONEJO NO ESTÁ EN LA CAJA.\n\nDIJE, EL CONEJO NO ESTÁ EN LA CAJA.\n\n¿POR QUÉ NO PUEDE EL CONEJO ESTAR EN LA CAJA?"]

var ghostbusters_poster_command = ["> ¿ENEMIGOS ARMADOS DE LOS DIFUNTOS?"]
var ghostbusters_poster_text = ["La mayoría de la gente dice que la segunda no fue tan buena como la primera, pero tú crees lo contrario. Fue bastante genial y algo asqueroso como se bañaron con mangueras entre ellos con la baba que hacía que la gente se enojara. \n\nTG se refiere a la película como un 'asqueroso teatro bukkake de hombres', lo que sea que eso signifique."]

var mac_and_me_poster_command = ["> MARAVÍLLATE ANTE ESTA AVENTURA DEL ESPACIO EXTERIOR."]
var mac_and_me_poster_text = ["Esta película es...\n\nOk, esta película es muy mala. Ni siquiera tú puedes defenderla. Tienes intenciones de quitar este póster, de hecho."]

var window_command = ["> MUCHACHO, MIRA A TRAVÉS DE ESTA VENTANA."]
var window_text = ["Al menos tu COLUMPIO DE NEUMÁTICO sigue intacto. Un árbol sin un columpio de neumático es como...\n\nComo una casa sin un vecindario que la rodee, supones."]

var towel_command = ["> ADQUIERE LA PEQUEÑA ALFOMBRA PERSA."]
var towel_text = ["¡Es una toalla, imbécil! Probablemente será útil para limpiar este desastre en tu habitación. No es que sea una prioridad, en todo caso."]

var totem_lathe_command = ["> ESTA MÁQUINA DE COSER ENORME. QUÉ USO TIENE."]
var totem_lathe_text = ["La TARJETA PERFORADA parecía contener instrucciones para tallar un TÓTEM de cierta forma. ¿Crees que quizás otras TARJETAS PERFORADAS producirán formas distintas? Merece mayor investigación."]

var wise_guy_command = ["> ESTE TEXTO DEL HOMBRE GRACIOSO. DEBERÍAS IGNORARLO."]
var wise_guy_text = ["¡Tan sólo mirar la portada te hace reír! Qué buen libro. Harry Anderson es tu héroe, y el entusiasta trato de Mike Caveney hacia el hombre le hace toda justicia necesaria. \n\nTendrás que volver a leerlo pronto."]

var pc_command = ["> INVESTIGA ESTE DISPOSITIVO."]
var pc_text = ["Parece que sigues conectado a internet. Rose está tratando de contactarte. \n\nResponderás en un momento, una vez hayas evaluado completamente tu situación."]

var oil_command = ["> EXAMINA ESTE DESAGRADABLE FLUIDO."]
var oil_text = ["¿Qué es esta cosa?"]

var bedroom_door_inside_command = ["> SAL DE LA PUERTA QUE NO ES AQUÍ."]

func update_changed_scene():
	Autoload.get_interactable_index()
	if Autoload.previous_scene != null:
		match Autoload.previous_scene:
			"HouseInside":
				john.position = Vector2(-530, 50)
				john.get_node("AnimatedSprite").flip_h = false

func _ready():
	john.get_node("Camera2D").target_y = -190
	
	update_changed_scene()
	
	Autoload.entity_command_dict["LittleMonstersPoster"] = little_monsters_poster_command
	Autoload.entity_text_dict["LittleMonstersPoster"] = little_monsters_poster_text
	
	Autoload.entity_command_dict["ConAirPoster"] = con_air_poster_command
	Autoload.entity_text_dict["ConAirPoster"] = con_air_poster_text
	
	Autoload.entity_command_dict["Door"] = door_command
	Autoload.entity_text_dict["Door"] = door_text
	
	Autoload.entity_command_dict["Box"] = box_command
	Autoload.entity_text_dict["Box"] = box_text
	
	Autoload.entity_command_dict["GhostbustersPoster"] = ghostbusters_poster_command
	Autoload.entity_text_dict["GhostbustersPoster"] = ghostbusters_poster_text
	
	Autoload.entity_command_dict["MacAndMePoster"] = mac_and_me_poster_command
	Autoload.entity_text_dict["MacAndMePoster"] = mac_and_me_poster_text
	
	Autoload.entity_command_dict["Window"] = window_command
	Autoload.entity_text_dict["Window"] = window_text
	
	Autoload.entity_command_dict["Towel"] = towel_command
	Autoload.entity_text_dict["Towel"] = towel_text
	
	Autoload.entity_command_dict["TotemLathe"] = totem_lathe_command
	Autoload.entity_text_dict["TotemLathe"] = totem_lathe_text
	
	Autoload.entity_command_dict["WiseGuy"] = wise_guy_command
	Autoload.entity_text_dict["WiseGuy"] = wise_guy_text
	
	Autoload.entity_command_dict["PC"] = pc_command
	Autoload.entity_text_dict["PC"] = pc_text
	
	Autoload.entity_command_dict["Oil"] = oil_command
	Autoload.entity_text_dict["Oil"] = oil_text
	
	Autoload.entity_command_dict["BedroomDoorInside"] = bedroom_door_inside_command

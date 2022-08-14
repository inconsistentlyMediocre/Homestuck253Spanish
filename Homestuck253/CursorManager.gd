extends Node2D

var contacted_areas = []
const command_rect_resource = preload("res://GUI/Command.tscn")
var command_rect = null

onready var john = get_tree().get_root().find_node("John", true, false)

func _ready():
	var interactables = get_tree().get_nodes_in_group("Interactables")
	for i in interactables:
		var area_node = i.find_node("InteractArea")
		if area_node != null:
			area_node.connect("mouse_entered", self, "on_Mouse_enter", [i])
			area_node.connect("mouse_exited", self, "on_Mouse_exit", [i])

func on_Mouse_enter(area):
	#contacted_areas.append(area)
#	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
#	if contacted_areas.find(area) == -1:
#		contacted_areas.append(area)
	pass
	

func on_Mouse_exit(area):
	#if contacted_areas.size() <= 1:
#		Input.set_default_cursor_shape(Input.CURSOR_ARROW)
	#contacted_areas.erase(area)
	pass#contacted_areas.clear()

func _unhandled_input(event):
	#if event is InputEventMouseButton:
	#	if event.button_index == BUTTON_LEFT and event.pressed:
	#		pass
#			if contacted_areas.size() > 0:
#				print(contacted_areas)
#				if command_rect != null:
#					command_rect.queue_free()
#					print("not null")
#				command_rect = command_rect_resource.instance()
#				command_rect.rect_position = get_global_mouse_position()
#				command_rect.get_node("Label").text = " > " + contacted_areas[-1].name + " "
#				get_tree().get_root().add_child(command_rect)
#				john.command_prompt = command_rect
#				contacted_areas.clear()
#				get_tree().set_input_as_handled()
	if event is InputEventScreenTouch:
		if event.pressed and get_tree().get_root().find_node("DialogBox", true, false) == null:
			var global_touch_position = get_canvas_transform().affine_inverse().xform(event.position)
			var space_state = get_world_2d().direct_space_state
			var result = space_state.intersect_point(global_touch_position, 32, [], 2147483647, false, true)
			if command_rect != null:
				command_rect.queue_free()
			if result.size() > 0:
				var sort_order = result[0].get("collider").get_parent().z_index
				var higher_z = result[0].get("collider").get_parent()
				for i in result.size():
					if result[i].get("collider").get_parent().z_index > sort_order and result[i].get("collider").get_parent().is_in_group("Interactables"):
						sort_order = result[i].get("collider").get_parent().z_index
						higher_z = result[i].get("collider").get_parent()
				#print(result[0].get("collider").get_parent().name)
				
				if !higher_z.is_in_group("Interactables"):
					return
				
				command_rect = command_rect_resource.instance()
				command_rect.rect_position = get_global_mouse_position()
				
				
				command_rect.command = higher_z.name
				
				#command_rect.get_node("Label").text = " > " + result[0].get("collider").get_parent().name + " "
				#command_rect.get_node("Label").text = " > " + higher_z.name + " "
				command_rect.get_node("Label").text = " " + Autoload.entity_command_dict.get(higher_z.name)[Autoload.current_entity_index_dict[higher_z.name]] + " "
				get_tree().get_root().add_child(command_rect)
				
				if command_rect.get_global_transform_with_canvas().origin.x + command_rect.rect_size.x > 650:
					command_rect.rect_position.x -= (command_rect.rect_size.x - (650 - command_rect.get_global_transform_with_canvas().origin.x)) + 10
				
				john.command_prompt = command_rect
				john.moving = false
				contacted_areas.clear()
				command_rect.can_spawn_dialog = true
				#get_tree().set_input_as_handled()
		else:
			if command_rect != null:
				command_rect.can_spawn_dialog = true


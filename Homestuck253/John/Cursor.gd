extends Node2D

var current_area = []
const command_rect_resource = preload("res://GUI/Command.tscn")
var command_rect = null

onready var john = get_tree().get_root().find_node("John", true, false)

func _physics_process(delta):
	global_position = get_global_mouse_position()
	$CanvasLayer/AnimatedSprite.position = global_position

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			if current_area.size() > 0:
				if command_rect != null:
					command_rect.queue_free()
				
				var sort_order = current_area[0].get_parent().z_index
				var higher_z = current_area[0].get_parent()
				for i in current_area:
					if i.get_parent().z_index > sort_order:
						sort_order = i.get_parent().z_index
						higher_z = i.get_parent()
				
				command_rect = command_rect_resource.instance()
				command_rect.rect_position = global_position + Vector2($CanvasLayer/AnimatedSprite.frames.get_frame("Select", 0).get_size().x/2, 0)
				#command_rect.rect_position = global_position #+  Vector2($CanvasLayer/AnimatedSprite.frames.get_frame("Select", 0).get_size().x/2, 0)
				command_rect.command = higher_z.name
				#command_rect.get_node("Label").text = " > " + higher_z.name + " "
				command_rect.get_node("Label").text = " " + Autoload.entity_command_dict.get(higher_z.name)[Autoload.current_entity_index_dict[higher_z.name]] + " "
				
				get_tree().get_root().add_child(command_rect)
				
				if command_rect.get_global_transform_with_canvas().origin.x + command_rect.rect_size.x > 650:
					command_rect.rect_position.x -= (command_rect.rect_size.x - (650 - command_rect.get_global_transform_with_canvas().origin.x)) + 10
					if command_rect.rect_scale.x == 1.25:
						command_rect.rect_position.x -= (command_rect.rect_size.x / 4) - 10
				
				john.command_prompt = command_rect
				get_tree().set_input_as_handled()

func _on_Area2D_area_entered(area):
	if area.get_parent().is_in_group("Interactables"):
		Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)#$CanvasLayer/AnimatedSprite.animation = "Select"
		current_area.append(area)


func _on_Area2D_area_exited(area):
	if area.get_parent().is_in_group("Interactables"):
		if $Area2D.get_overlapping_areas().size() <= 1:
			Input.set_default_cursor_shape(Input.CURSOR_ARROW)#$CanvasLayer/AnimatedSprite.animation = "Normal"
		current_area.erase(area)


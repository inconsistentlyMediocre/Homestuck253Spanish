extends NinePatchRect

var can_click = false
const dialog_box_res = preload("res://GUI/DialogBox.tscn")
var dialog_box = null
var mobile_cursor
var can_spawn_dialog = false
var command

var excluded_interactables = [
	"BalconyDoor", "BalconyDoorInside", "Window", "PC",
	"BedroomDoor", "BedroomDoorInside", "DoorLeft", "ArrowHallway",
	"HallwayEntrance", "BathroomWindow", "ArrowBathroom", "Piano",
	"WindowStudy", "SeriousJester", "StudyExit", "StudyEntrance",
	"FridgeDrawing", "KitchenDoor", "ArrowKitchen", "OilSpill",
	"KitchenEntrance", "ArrowUtilityRoom", "UtilityRoomDoor",
	"BackyardDoor", "Harlequinsprite"
]

signal click

func _ready():
	mobile_cursor = Autoload.is_mobile_cursor()
	if $Label.rect_size.x > rect_size.x:
		rect_size.x = $Label.rect_size.x
	
	if get_tree().get_current_scene().name == "Backyard":
		rect_scale = Vector2(1.25, 1.25)
	
func _process(delta):
	if $Label.visible_characters < $Label.text.length() and $Label/Timer.is_stopped():
		$Label/Timer.start()

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			if !mobile_cursor:
				emit_signal("click")
	if event is InputEventScreenTouch:
		if event.pressed:
			emit_signal("click")
#			if can_click:
#				if dialog_box != null:
#					dialog_box.queue_free()
#				dialog_box = dialog_box_res.instance()
#				get_tree().get_root().add_child(dialog_box)
#				queue_free()

func _on_Command_mouse_entered():
	$Label.add_color_override("font_color", Color8(157, 157, 157,255))


func _on_Command_mouse_exited():
	$Label.add_color_override("font_color", Color8(255, 255, 255,255))

func handle_exceptions():
	match command:
		"BalconyDoor":
			FadeScreen.change_scene("res://House/HouseInside.tscn", Vector2(515, 333))
		"BalconyDoorInside":
			FadeScreen.change_scene("res://House/Balcony.tscn", Vector2(366, 529))
		"BedroomDoor":
			FadeScreen.change_scene("res://House/JohnRoom.tscn", Vector2(-530, 50))
		"BedroomDoorInside":
			FadeScreen.change_scene("res://House/HouseInside.tscn", Vector2(515, 333))
		"DoorLeft":
			FadeScreen.change_scene("res://House/Bathroom.tscn", Vector2(515, 333))
		"ArrowHallway":
			FadeScreen.change_scene("res://House/HouseInside.tscn", Vector2(515, 333))
		"ArrowBathroom":
			FadeScreen.change_scene("res://House/Hallway.tscn", Vector2(515, 333))
		"HallwayEntrance":
			FadeScreen.change_scene("res://House/Hallway.tscn", Vector2(515, 333))
		"StudyExit":
			FadeScreen.change_scene("res://House/HouseInside.tscn", Vector2(515, 333))
		"StudyEntrance":
			FadeScreen.change_scene("res://House/Study.tscn", Vector2(515, 333))
		"ArrowKitchen":
			FadeScreen.change_scene("res://House/HouseInside.tscn", Vector2(515, 333))
		"KitchenEntrance":
			FadeScreen.change_scene("res://House/Kitchen.tscn", Vector2(515, 333))
		"KitchenDoor":
			FadeScreen.change_scene("res://House/UtilityRoom.tscn", Vector2(515, 333))
		"ArrowUtilityRoom":
			FadeScreen.change_scene("res://House/Kitchen.tscn", Vector2(515, 333))
		"UtilityRoomDoor":
			FadeScreen.change_scene("res://House/Backyard.tscn", Vector2(515, 333))
		"BackyardDoor":
			FadeScreen.change_scene("res://House/UtilityRoom.tscn", Vector2(515, 333))
		"Window":
			var view = get_tree().get_root().find_node("WindowView", true, false)
			view.visible = true
			yield(self, "click")
			if dialog_box != null:
				dialog_box.queue_free()
			dialog_box = dialog_box_res.instance()
			dialog_box.get_node("DialogBox/Label").text = Autoload.entity_text_dict.get(command)[Autoload.current_entity_index_dict[command]]
			get_tree().get_root().add_child(dialog_box)
		"BathroomWindow":
			var view = get_tree().get_root().find_node("BathroomWindowView", true, false)
			view.visible = true
			yield(self, "click")
			if dialog_box != null:
				dialog_box.queue_free()
			dialog_box = dialog_box_res.instance()
			dialog_box.get_node("DialogBox/Label").text = Autoload.entity_text_dict.get(command)[Autoload.current_entity_index_dict[command]]
			get_tree().get_root().add_child(dialog_box)
		"PC":
			var view = get_tree().get_root().find_node("PesterchumView", true, false)
			view.visible = true
			yield(self, "click")
			if dialog_box != null:
				dialog_box.queue_free()
			dialog_box = dialog_box_res.instance()
			dialog_box.get_node("DialogBox/Label").text = Autoload.entity_text_dict.get(command)[Autoload.current_entity_index_dict[command]]
			get_tree().get_root().add_child(dialog_box)
		"WindowStudy":
			var view = get_tree().get_root().find_node("StudyWindowView", true, false)
			view.visible = true
			yield(self, "click")
			if dialog_box != null:
				dialog_box.queue_free()
			dialog_box = dialog_box_res.instance()
			dialog_box.get_node("DialogBox/Label").text = Autoload.entity_text_dict.get(command)[Autoload.current_entity_index_dict[command]]
			get_tree().get_root().add_child(dialog_box)
		"SeriousJester":
			var view = get_tree().get_root().find_node("SeriousJesterView", true, false)
			view.visible = true
			yield(self, "click")
			if dialog_box != null:
				dialog_box.queue_free()
			dialog_box = dialog_box_res.instance()
			dialog_box.get_node("DialogBox/Label").text = Autoload.entity_text_dict.get(command)[Autoload.current_entity_index_dict[command]]
			get_tree().get_root().add_child(dialog_box)
		"Piano":
			var view = get_tree().get_root().find_node("ShowtimeView", true, false)
			view.visible = true
			var audio = get_tree().get_root().find_node("Audio", true, false)
			audio.play()
			yield(self, "click")
			if dialog_box != null:
				dialog_box.queue_free()
			dialog_box = dialog_box_res.instance()
			dialog_box.get_node("DialogBox/Label").text = Autoload.entity_text_dict.get(command)[Autoload.current_entity_index_dict[command]]
			get_tree().get_root().add_child(dialog_box)
		"FridgeDrawing":
			var view = get_tree().get_root().find_node("DrawingView", true, false)
			view.visible = true
			yield(self, "click")
			if dialog_box != null:
				dialog_box.queue_free()
			dialog_box = dialog_box_res.instance()
			dialog_box.get_node("DialogBox/Label").text = Autoload.entity_text_dict.get(command)[Autoload.current_entity_index_dict[command]]
			get_tree().get_root().add_child(dialog_box)
		"OilSpill":
			var view = get_tree().get_root().find_node("JohnOilView", true, false)
			view.visible = true
			yield(self, "click")
			if dialog_box != null:
				dialog_box.queue_free()
			dialog_box = dialog_box_res.instance()
			dialog_box.get_node("DialogBox/Label").text = Autoload.entity_text_dict.get(command)[Autoload.current_entity_index_dict[command]]
			get_tree().get_root().add_child(dialog_box)
		"Harlequinsprite":
			var harlequinsprite = get_tree().get_root().find_node("Harlequinsprite", true, false)
			harlequinsprite.get_node("Harlequinsprite/TextPivot/Text").frame = 0
			harlequinsprite.get_node("Harlequinsprite/TextPivot/Text").visible = true
			harlequinsprite.get_node("Harlequinsprite/TextPivot/Text").play()
			if dialog_box != null:
				dialog_box.queue_free()
			dialog_box = dialog_box_res.instance()
			dialog_box.get_node("DialogBox/Label").text = Autoload.entity_text_dict.get(command)[Autoload.current_entity_index_dict[command]]
			
			Autoload.current_entity_index_dict[command] += 1
			Autoload.current_entity_index_dict[command] = clamp(Autoload.current_entity_index_dict[command], 0, Autoload.entity_command_dict.get(command).size())
			if Autoload.current_entity_index_dict[command] == Autoload.entity_command_dict.get(command).size():
				Autoload.current_entity_index_dict[command] = 0
			
			get_tree().get_root().add_child(dialog_box)
	queue_free()

func handle_click():
	if excluded_interactables.find(command) != -1:
		handle_exceptions()
		return
	if dialog_box != null:
		dialog_box.queue_free()
	dialog_box = dialog_box_res.instance()
	
	dialog_box.get_node("DialogBox/Label").text = Autoload.entity_text_dict.get(command)[Autoload.current_entity_index_dict[command]]
	
	Autoload.current_entity_index_dict[command] += 1
	Autoload.current_entity_index_dict[command] = clamp(Autoload.current_entity_index_dict[command], 0, Autoload.entity_command_dict.get(command).size())
	if Autoload.current_entity_index_dict[command] == Autoload.entity_command_dict.get(command).size():
		Autoload.current_entity_index_dict[command] = 0
	
	get_tree().get_root().add_child(dialog_box)
	queue_free()

func on_View_click():
	emit_signal("click")

func _on_Command_gui_input(event):
	if !mobile_cursor:
		if event is InputEventMouseButton:
			if event.button_index == BUTTON_LEFT and event.pressed:
				handle_click()
	else:
		if event is InputEventScreenTouch:
			if can_spawn_dialog:
				if event.pressed:
					handle_click()

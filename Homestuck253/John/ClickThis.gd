extends TextureRect

const dialog_box_res = preload("res://GUI/DialogBox.tscn")
var dialog_box = null
var mobile_cursor

func _ready():
	mobile_cursor = Autoload.is_mobile_cursor()

func _process(delta):
	if Autoload.clicked_controller:
		get_parent().get_node("ClickThis").visible = false

func _on_Controller_gui_input(event):
	if !mobile_cursor:
		if event is InputEventMouseButton:
			if event.button_index == BUTTON_LEFT and event.pressed:
				if !Autoload.clicked_controller:
					Autoload.clicked_controller = true
				if dialog_box != null:
					dialog_box.queue_free()
				dialog_box = dialog_box_res.instance()
				
				dialog_box.get_node("DialogBox/Label").text = "Para caminar, usa el mouse, las flechas del teclado, o las teclas WASD. ¡Haz clic en varios objetos para abrir menús de comando para ellos!\n\nSobresaliente programación Flash original por Alexis 'Gankra' Beingessner.\n\nAdaptado a Godot Engine por botanicEventuality."
				get_tree().get_root().add_child(dialog_box)
	else:
		if event is InputEventScreenTouch:
			if event.pressed:
				if !Autoload.clicked_controller:
					Autoload.clicked_controller = true
				if dialog_box != null:
					dialog_box.queue_free()
				dialog_box = dialog_box_res.instance()
				
				dialog_box.get_node("DialogBox/Label").text = "Para caminar, usa el mouse, las flechas del teclado, o las teclas WASD. ¡Haz clic en varios objetos para abrir menús de comando para ellos!\n\nSobresaliente programación Flash original por Alexis 'Gankra' Beingessner.\n\nAdaptado a Godot Engine por botanicEventuality."
				get_tree().get_root().add_child(dialog_box)

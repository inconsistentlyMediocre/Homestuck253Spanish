extends NinePatchRect

var is_ready = false
var growing = true
var shrinking = false
var size_x = 60
var size_y = 60
var pos_x = 295#650/2 - 30
var pos_y = 450/2 - 30 + 204/2

export(Curve) var curve
var curve_size_x
var curve_size_y
var curve_factor
var lerp_factor = 0.01

signal dialog_done

func _ready():
	rect_size = Vector2(size_x, size_y)
	rect_position = Vector2(pos_x, pos_y)
	
	var views = get_tree().get_nodes_in_group("Views")
	
	for i in views:
		connect("dialog_done", i, "on_Dialog_done")

func _input(event):
	if is_ready:
		if event is InputEventMouseButton:
			if event.button_index == BUTTON_LEFT and event.pressed:
				emit_signal("dialog_done")
				$Label.visible = false
				shrinking = true
				get_tree().set_input_as_handled()

func _process(delta):
	if !is_ready:
		if growing:
			curve_factor = curve.interpolate(lerp_factor)
			lerp_factor += 0.075
			
			size_x = lerp(size_x, 650, curve_factor)
			size_y = lerp(size_y, 224, curve_factor)
			rect_size = Vector2(size_x, size_y)
	
			pos_x = lerp(pos_x, 0, curve_factor)
			pos_y = lerp(pos_y, 215, curve_factor)
			rect_position = Vector2(pos_x, pos_y)

		if size_x >= 645 and growing:
			growing = false
			lerp_factor = 0.01
			rect_size = Vector2(630, 204)
			rect_position = Vector2(10, 225)
			is_ready = true
	else:
		if $Label.visible_characters < $Label.text.length() and $Label/Timer.is_stopped():
			$Label/Timer.start()
		
		if shrinking:
			curve_factor = curve.interpolate(lerp_factor)
			lerp_factor += 0.075
			
			size_x = lerp(size_x, 60, curve_factor)
			size_y = lerp(size_y, 60, curve_factor)
			rect_size = Vector2(size_x, size_y)
	
			pos_x = lerp(pos_x, 295, curve_factor)
			pos_y = lerp(pos_y, 287, curve_factor)
			rect_position = Vector2(pos_x, pos_y)
			
			if size_x <= 60:
				queue_free()

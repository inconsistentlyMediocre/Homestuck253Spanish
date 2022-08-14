extends Camera2D

onready var map = get_tree().get_root().find_node("Map", true, false)
onready var john = get_parent()
var control = true
var target_x = 0
var target_y = -90

func _ready():
	limit_right = map.get_parent().map_size.x
	limit_bottom = map.get_parent().map_size.y

func _physics_process(delta):
	
	if control:
		position.x = target_x
		position.y = target_y
#		if john.global_position.y > map.global_position.y / 2: #DOWN
#			position.y  = lerp(position.y, (-90)+(john.global_position.y - map.global_position.y/2)/2, 0.01)
#		elif john.global_position.y < map.global_position.y / 2: #UP
#			position.y  = lerp(position.y, -(90 + (map.global_position.y - john.global_position.y)/2), 0.01)
#
#		position.y = clamp(position.y, -190, -90)
#
#		if john.global_position.x > map.global_position.x: #RIGHT
#			position.x  = lerp(position.x, (map.global_position.x - john.global_position.x), 0.1)
#		elif john.global_position.x < map.global_position.x: #LEFT
#			position.x  = lerp(position.x, ((map.global_position.x - john.global_position.x)), 0.1)
#
#

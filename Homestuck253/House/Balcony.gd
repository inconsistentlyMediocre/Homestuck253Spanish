extends Node2D

export var map_size = Vector2()
onready var john = get_tree().get_root().find_node("John", true, false)

func update_changed_scene():
	Autoload.get_interactable_index()
	if Autoload.previous_scene != null:
		match Autoload.previous_scene:
			"HouseInside":
				john.position = Vector2(-440, -60)

func _ready():
	john.get_node("AnimatedSprite").flip_h = true
	update_changed_scene()

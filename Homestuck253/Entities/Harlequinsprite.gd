extends Node2D

onready var john = get_tree().get_root().find_node("John", true, false)

var offset_position = 1

func _physics_process(delta):
	if global_position.distance_to(john.global_position) > 64:
		if john.sprite.flip_h:
			offset_position = 1
		else:
			offset_position = -1
		global_position = lerp(global_position, john.global_position + Vector2(96*offset_position, -85), 0.06)
		if global_position.x > john.global_position.x:
			$Harlequinsprite.flip_h = false
		elif global_position.x < john.global_position.x:
			$Harlequinsprite.flip_h = true
		
		if $Harlequinsprite.flip_h:
			$Harlequinsprite/TextPivot/Text.position.x = 276
			$Harlequinsprite/TextPivot/Text.flip_h = true
		else:
			$Harlequinsprite/TextPivot/Text.position.x = -276
			$Harlequinsprite/TextPivot/Text.flip_h = false
		
#		if global_position.y > john.global_position.y:
#			print("over")
#		elif global_position.y < john.global_position.y:
#			print("under")

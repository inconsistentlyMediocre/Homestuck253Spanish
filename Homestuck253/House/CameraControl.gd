extends Area2D

onready var john = get_tree().get_root().find_node("John", true, false)



func _on_CameraControl_body_entered(body):
	if body == john:
		john.get_node("Camera2D").control = false
		john.get_node("Camera2D").global_position.x = global_position.x
		john.get_node("Camera2D").global_position.y = global_position.y


func _on_CameraControl_body_exited(body):
	if body == john:
		john.get_node("Camera2D").control = true

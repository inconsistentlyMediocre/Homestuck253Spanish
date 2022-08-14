extends CanvasLayer

onready var animation_player = $AnimationPlayer
onready var rect = $ColorRect

func change_scene(scene_path, spawn_pos):
	rect.mouse_filter = Control.MOUSE_FILTER_STOP
	get_tree().get_root().set_input_as_handled()
	animation_player.play("Fade")
	yield(animation_player, "animation_finished")
	Autoload.previous_scene = get_tree().get_current_scene().name
	get_tree().change_scene(scene_path)
	animation_player.play_backwards("Fade")
	yield(animation_player, "animation_finished")
	rect.mouse_filter = Control.MOUSE_FILTER_IGNORE

extends Label

func _ready():
	visible_characters = 0

func _on_Timer_timeout():
	if visible_characters < text.length():
		visible_characters += 1

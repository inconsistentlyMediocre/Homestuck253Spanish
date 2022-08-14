extends KinematicBody2D

export (int) var speed = 310

var velocity = Vector2()
var target = Vector2()
var moving = false
var can_stop_animation = false
var previous_position
var command_prompt
onready var sprite = $AnimatedSprite
onready var timer = $Timer

###Cursor
var arrow = load("res://Sprites/Cursor/Cursor-1.png")
var hand = load("res://Sprites/Cursor/Cursor-2.png")

const normal_cursor_res = preload("res://John/Cursor.tscn")
const mobile_cursor_res = preload("res://CursorManager.tscn")

func _ready():
	# Changes only the arrow shape of the cursor.
	# This is similar to changing it in the project settings.
	Input.set_custom_mouse_cursor(arrow)

	# Changes a specific shape of the cursor (here, the I-beam shape).
	Input.set_custom_mouse_cursor(hand, Input.CURSOR_POINTING_HAND, Vector2(24, 0))
	
	if OS.get_name() == "HTML5":
		var is_mobile = JavaScript.eval("/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)")
		if is_mobile:
			var mobile_cursor = mobile_cursor_res.instance()
			call_deferred("add_child", mobile_cursor)
		else:
			var normal_cursor = normal_cursor_res.instance()
			call_deferred("add_child", normal_cursor)
			
	else:
		####
		var mobile_cursor = mobile_cursor_res.instance()
		####
		var normal_cursor = normal_cursor_res.instance()
		call_deferred("add_child", normal_cursor)

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			target = get_global_mouse_position()
			moving = true
			can_stop_animation = false
			if !timer.is_stopped():
				timer.stop()
			
			if command_prompt != null:
				command_prompt.queue_free()

func get_input():
	velocity = Vector2.ZERO
	if Input.is_action_pressed('move_right'):
		velocity.x += 1
	if Input.is_action_pressed('move_left'):
		velocity.x -= 1
	if Input.is_action_pressed('move_down'):
		velocity.y += 1
	if Input.is_action_pressed('move_up'):
		velocity.y -= 1
	velocity = velocity.normalized() * speed
	
	if velocity.x or velocity.y != 0:
		sprite.playing = true
		if velocity.y > 0:
			sprite.animation = "Front"
		elif velocity.y < 0:
			sprite.animation = "Back"
		if velocity.x < 0:
			sprite.flip_h = true
		elif velocity.x > 0:
			sprite.flip_h = false
	else:
		sprite.frame = 0
		sprite.playing = false

func _physics_process(delta):
	
	if moving:
		velocity = global_position.direction_to(target) * speed
		#velocity = velocity.normalized()
		
		if velocity.x or velocity.y != 0:
			sprite.playing = true
			if velocity.y > 0:
				sprite.animation = "Front"
			elif velocity.y < 0:
				sprite.animation = "Back"
			if velocity.x < 0:
				sprite.flip_h = true
			elif velocity.x > 0:
				sprite.flip_h = false
		else:
			sprite.frame = 0
			sprite.playing = false
			
		if global_position.distance_to(target) > 10:
			velocity = move_and_slide(velocity)
		else:
			can_stop_animation = true
#			moving = false
#			velocity = Vector2.ZERO
#			sprite.frame = 0
#			sprite.playing = false
		
		if is_on_wall() and timer.is_stopped():
			timer.start()
			previous_position = global_position
	else:
		get_input()
		velocity = move_and_slide(velocity)


func _on_Timer_timeout():
	if global_position.distance_to(previous_position) < 10:
		can_stop_animation = true


func _on_AnimatedSprite_animation_finished():
	if can_stop_animation:
		sprite.frame = 0
		sprite.playing = false
		target = global_position
		moving = false
		can_stop_animation = false

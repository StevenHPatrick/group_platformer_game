class_name Player extends CharacterBody2D


@export var speed = 300.0
@export var jump_velocity = -400.0
@export var gravity = 980
@export var on_wall = false
var direction = 1
@onready var sprite = $Sprite2D


#func _physics_process(delta: float) -> void:
	## Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("ui_up") and is_on_floor():
		#velocity.y = jump_velocity
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * speed
	#else:
		#velocity.x = move_toward(velocity.x, 0, speed)
#
	#move_and_slide()

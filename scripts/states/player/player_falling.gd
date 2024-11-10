extends PlayerState

var bounce: bool = false

func enter(previous_state_path: String, data := {}) -> void:
	print("IN FALLING")
	bounce = false
	pass
	# player.get_node("AnimationPlayer").play("fall")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func process_physics(delta: float) -> void:
	
	##### Allows for moving in the air #####
	var input_direction_x := Input.get_axis("ui_left", "ui_right")
	if input_direction_x != 0:
		player.direction = input_direction_x
		if player.sprite.scale.x < 0 and player.direction == 1:
			player.sprite.scale.x = player.sprite.scale.x * -1
			print("facing left")
		elif player.sprite.scale.x > 0 and player.direction == -1:
			player.sprite.scale.x = player.sprite.scale.x * -1
			print("facing right")
		player.velocity.x = player.speed * player.direction
	else:
		player.velocity.x = 0

	
	#if (player.is_on_wall()):
		#player.velocity.x = player.speed
		#player.direction = -player.direction
		#
		#if player.sprite.scale.x < 0 and player.direction == 1:
			#player.sprite.scale.x = player.sprite.scale.x * -1
			#print("facing left")
		#elif player.sprite.scale.x > 0 and player.direction == -1:
			#player.sprite.scale.x = player.sprite.scale.x * -1
			#print("facing right")
		#bounce = false
		#player.on_wall = true
	####### Updates the velocity ######
	player.velocity.y += player.gravity * delta
	player.move_and_slide()

	if player.is_on_floor():
		if is_equal_approx(player.velocity.x, 0.0):
			finished.emit(IDLE)
		else:
			finished.emit(RUNNING)


func _on_wall_detection_bounced() -> void:
	bounce = true

	pass # Replace with function body.

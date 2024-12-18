extends PlayerState


func enter(previous_state_path: String, entity_data := {}):
	player.on_wall = false
	print("IN RUN")
	pass
	# player.get_node("AnimationPlayer").play("run")
	
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
			
	####### Updates the velocity ######
	player.velocity.x = player.speed * player.direction
	player.velocity.y += player.gravity * delta
	player.move_and_slide()
	
	if not player.is_on_floor():
		finished.emit(FALLING)
	elif is_equal_approx(input_direction_x, 0.0):
		finished.emit(IDLE)
	elif Input.is_action_just_pressed("ui_up"):
		finished.emit(JUMPING)

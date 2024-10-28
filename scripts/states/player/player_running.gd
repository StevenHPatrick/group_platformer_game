extends PlayerState


func enter(previous_state_path: String, entity_data := {}):
	print("IN RUN")
	pass
	# player.get_node("AnimationPlayer").play("run")
	
func process_physics(delta: float) -> void:
	var input_direction_x := Input.get_axis("ui_left", "ui_right")
	if input_direction_x != 0:
		player.direction = input_direction_x
		if player.sprite.scale.x < 0 and player.direction == 1:
			player.sprite.scale.x = player.sprite.scale.x * -1
			print("facing left")
		elif player.sprite.scale.x > 0 and player.direction == -1:
			player.sprite.scale.x = player.sprite.scale.x * -1
			print("facing right")
	player.velocity.x = player.speed * input_direction_x
	player.velocity.y += player.gravity * delta
	player.move_and_slide()
	
	if not player.is_on_floor():
		finished.emit(FALLING)
	elif is_equal_approx(input_direction_x, 0.0):
		finished.emit(IDLE)
	elif Input.is_action_just_pressed("ui_up"):
		finished.emit(JUMPING)

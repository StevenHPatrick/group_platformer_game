extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	print("IN FALLING")
	pass
	player.get_node("AnimationPlayer").play("fall")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func process_physics(delta: float) -> void:
	player.velocity.y += player.gravity * delta
	player.velocity.x = abs(player.velocity.x)
	if player.velocity.x != 0:
		player.velocity.x = player.velocity.x - (player.drag * delta)
	player.velocity.x = player.velocity.x * player.direction

	#if ($"../../Wall_Detect".is_colliding()):
		#player.velocity.x = -player.velocity.x
	player.move_and_slide()
	if (player.velocity.x == 0) and (player.is_on_wall()):
		player.velocity.x = -player.velocity.x
	if player.is_on_floor():
		if is_equal_approx(player.velocity.x, 0.0):
			finished.emit(IDLE)
		else:
			finished.emit(RUNNING)

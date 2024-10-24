extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	player.velocity.y = player.jump_velocity
	print("IN JUMPING")
	#player.animation_player.play("jump")

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
	
	if player.velocity.y >= 0:
		finished.emit(FALLING)

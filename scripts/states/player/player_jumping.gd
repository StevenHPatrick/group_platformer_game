extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	player.velocity.y = player.jump_velocity
	print("IN JUMPING")
	#player.animation_player.play("jump")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func process_physics(delta: float) -> void:
	player.velocity.y += player.gravity * delta
	player.move_and_slide()
	
	if player.velocity.y >= 0:
		finished.emit(FALLING)

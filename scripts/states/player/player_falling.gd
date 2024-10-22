extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	print("IN FALLING")
	pass
	player.get_node("AnimationPlayer").play("fall")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func process_physics(_delta: float) -> void:
	player.velocity.y += player.gravity * _delta
	player.move_and_slide()

	if player.is_on_floor():
		if is_equal_approx(player.velocity.x, 0.0):
			finished.emit(IDLE)
		else:
			finished.emit(RUNNING)

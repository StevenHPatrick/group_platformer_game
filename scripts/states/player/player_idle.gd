extends PlayerState

func enter(previous_state_path: String, entity_data := {}) -> void:
	player.velocity.x = 0.0
	print("IN IDLE")
	#player.amimation_player.play("idle")
	
func process_physics(delta: float) -> void:
	player.velocity.y += player.gravity * delta
	player.move_and_slide()
	
	if not player.is_on_floor():
		finished.emit(FALLING)
	elif Input.is_action_just_pressed("ui_up"):
		finished.emit(JUMPING)
	elif Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right"):
		finished.emit(RUNNING)

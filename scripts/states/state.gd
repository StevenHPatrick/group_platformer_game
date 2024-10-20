class_name State extends Node

signal finished(next_state_path: String, entity_data: Dictionary)

func enter(previous_state_path: String, entity_data := {}):
	'''
	Called by the state machine upon changing the active state. The `data` parameter
	is a dictionary with arbitrary data the state can use to initialize itself.
	'''
	pass

func exit() -> void:
	'''
	Called by the state machine before changing the active state. Use this function
	to clean up the state.
	'''
	pass

func process_frames(_delta: float) -> void:
	'''
	Called by the state machine on the engine's main loop tick.
	'''
	pass

func process_physics(_delta: float) -> void:
	'''
	Called by the state machine on the engine's physics update tick.
	'''
	pass

func process_inputs(_event: InputEvent) -> void:
	'''
	Called by the state machine when receiving unhandled input events.
	'''
	pass

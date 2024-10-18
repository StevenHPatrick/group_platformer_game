class_name State_Machine extends Node

## The initial state of the state machine. If not set, the first child node is used.
@export var initial_state : State = null

## The current state of the state machine.
@onready var current_state: State = (func get_initial_state() -> State:
	return initial_state if initial_state != null else get_child(0)
).call()

var states: Dictionary = {}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Give every state a reference to the state machine.
	for state_node: State in find_children("*", "State"):
		state_node.finished.connect(_transition_to_next_state)
		
	# State machines usually access data from the root node of the scene they're part of: the owner.
	# We wait for the owner to be ready to guarantee all the data and nodes the states may need are available.
	await owner.ready
	current_state.enter("")

func _transition_to_next_state(target_state_path: String, data: Dictionary = {}) -> void:
	if not has_node(target_state_path):
		printerr(owner.name + ": Trying to transition to state " + target_state_path + " but it does not exist.")
		return

	var previous_state_path := current_state.name
	current_state.exit()
	current_state = get_node(target_state_path)
	current_state.enter(previous_state_path, data)

func _unhandled_input(event: InputEvent) -> void:
	current_state.process_inputs(event)

func _process(delta: float) -> void:
	current_state.process_frames(delta)

func _physics_process(delta: float) -> void:
	current_state.process_physics(delta)
		

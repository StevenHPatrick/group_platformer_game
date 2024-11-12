extends CanvasLayer

@export var component : Control = null
@export var label : Label = null

@export_group("Properties")
@export var title : String = "LEVEL"
@export var duration : int = 90

var i : float
var finished : bool

func set_title(title: String):
	self.title = title
	return self

func _ready() -> void:
	if not component: component = $Main # try to trecover the reference
	assert(component != null, "Assignment of component for LevelTitle, not set.")
	if not label: label = $Main/Label # try to recover the reference
	assert(label != null, "Assignment of label for LevelTitle, not set.")
	reset()

func reset() -> void:
	component.modulate = Color(1, 1, 1, 1)
	label.text = title
	i = 0.0
	finished = false

func _process(delta: float) -> void:
	if finished:
		queue_free() # delete thyself
	else:
		var alpha = 1 - (i / duration)
		component.modulate = Color(1, 1, 1, alpha)
		i += 1.0
		finished = (i >= duration)

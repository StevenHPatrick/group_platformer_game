extends Node2D

# GAME STATE MANAGEMENT:
# we don't have to do this from the world, and could put this script in a different node (something more abstract)
# every level is disjoint, requiring some kind of switching system for loading resources.

@onready var level_title_tscn = preload("res://scenes/ui/level_title.tscn")

func load_level(level : String):
	add_child(level_title_tscn.instantiate().set_title(level))

func _ready() -> void:
	load_level("LEVEL 1")

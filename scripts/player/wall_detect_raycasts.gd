extends RayCast2D

signal collided(collider)

var last_collider:Object

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not is_colliding():
		last_collider = null
		return
	print("is raycast working")
	var found_collider:Object = get_collider()
	if found_collider != last_collider:
		last_collider = found_collider
		emit_signal("collided", found_collider)
		print(str(found_collider))
	pass

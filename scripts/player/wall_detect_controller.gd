extends Node2D

@onready var top_ray: Object = $RayCast2D_Top
@onready var mid_ray: Object = $RayCast2D_Middle
@onready var bot_ray: Object = $RayCast2D_Bottom

var raycast_dict
var test_array
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	raycast_dict = {top_ray: null, mid_ray: null, bot_ray: null}

func _physics_process(_delta: float) -> void:

	for ray in raycast_dict:
		var last_collider = raycast_dict[ray]
		if not ray.is_colliding():
			#print(ray.to_string() + " is not colliding")
			raycast_dict[ray] = null
			continue

		var found_collider:Object = ray.get_collider()
		if found_collider != last_collider:
			last_collider = found_collider
			raycast_dict[ray] = last_collider
			print(ray, raycast_dict[ray])
			print(str(found_collider))
	
	if raycast_dict[top_ray] != null || raycast_dict[mid_ray] != null || raycast_dict[bot_ray] != null:
		print(raycast_dict[top_ray])
		print(raycast_dict[mid_ray])
		print(raycast_dict[bot_ray])
		raycast_dict[top_ray] = null
		raycast_dict[mid_ray] = null
		raycast_dict[bot_ray] = null

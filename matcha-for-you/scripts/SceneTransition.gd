extends Node 
var target_spawn_name: String = "" 

func get_spawn_position(scene_root: Node) -> Vector2: 
	if target_spawn_name == "": 
		return Vector2.ZERO 
	
	var spawn_point = scene_root.find_child(target_spawn_name, true, false) 
	if spawn_point: 
		return spawn_point.global_position 
	return Vector2.ZERO

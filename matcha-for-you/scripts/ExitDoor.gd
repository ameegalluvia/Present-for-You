extends Area2D

@export var ice_pickup: Area2D

func _on_body_entered(body: Node2D) -> void:
	print("ExitDoor kena sesuatu: ", body.name)
	if not body.is_in_group("player"):
		return
	
	print("Itu player! has_initial_items: ", GameState.has_initial_items(), " has_ice: ", GameState.has_ice)
	
	if GameState.has_initial_items() and not GameState.has_ice:
		print("Reminder: belum ambil es batu!")
		ice_pickup.monitoring = true
		body.global_position -= Vector2(0, 10)
	elif GameState.all_items_collected():
		print("Iyeeyy")
		get_tree().change_scene_to_file("res://scenes/Lievia.tscn")
		

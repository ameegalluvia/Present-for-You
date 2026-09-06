extends Area2D

@export var ice_pickup: Area2D

func _on_body_entered(body: Node2D) -> void:
	if not body.is_in_group("player"):
		return
	
	if GameState.has_initial_items() and not GameState.has_ice:
		MessageBox.show_notification("Oh iya, butuh es batu :D")
		ice_pickup.monitoring = true
		ice_pickup.visible = true
		body.global_position -= Vector2(0, 10)
	elif GameState.all_items_collected():
		TransitionScreen.transition()
		await TransitionScreen.on_transition_finished
		get_tree().change_scene_to_file("res://scenes/Lievia.tscn")
		

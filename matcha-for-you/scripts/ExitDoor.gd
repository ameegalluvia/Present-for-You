extends Area2D

@export var ice_pickup: Area2D

func _on_body_entered(body: Node2D) -> void:
	if not body.is_in_group("player"):
		return
	
	if GameState.dont_have_items():
		MessageBox.show_notification("Kerjain tugasnya dulu yaa lipii", 3.00)
	elif GameState.has_initial_items() and not GameState.has_ice:
		MessageBox.show_notification("Oh iya, butuh es batu :D", 3.00)
		ice_pickup.set_deferred("monitorable", true)
		ice_pickup.visible = true
	elif GameState.all_items_collected():
		TransitionScreen.transition()
		await TransitionScreen.on_transition_finished
		get_tree().change_scene_to_file("res://scenes/Halaman.tscn")
		

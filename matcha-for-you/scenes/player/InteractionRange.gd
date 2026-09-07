extends Area2D

func _on_area_entered(area: Area2D) -> void: 
	if area.has_method("interact"): 
		InteractionManager.set_interactable(area) 
		InteractButton.show_button() 
		
func _on_area_exited(area: Area2D) -> void: 
	if area.has_method("interact"): 
		InteractionManager.clear_interactable(area) 
		InteractButton.hide_button()

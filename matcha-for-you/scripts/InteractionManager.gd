extends Node

var current_interactable: Node = null
 
func set_interactable(node: Node) -> void: 
	current_interactable = node 
	
func clear_interactable(node: Node) -> void: 
	if current_interactable == node: 
		current_interactable = null 

func try_interact() -> void: 
	if current_interactable and current_interactable.has_method("interact"): 
		current_interactable.interact()

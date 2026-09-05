extends Area2D

@export var item_names: Array[String] = []

func _on_body_entered(body: Node2D) -> void:
	print("Sesuatu masuk area: ", body.name)
	if body.is_in_group("player"):
		print("Ini player! Ambil item...")
		for item_name in item_names:
			GameState.collect_item(item_name)
		queue_free()

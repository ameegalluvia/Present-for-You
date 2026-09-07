extends Area2D

@export var item_names: Array[String] = []

func interact() -> void:
	for item_name in item_names:
		GameState.collect_item(item_name)
	queue_free()

extends Area2D

@export var new_quest_text: String = ""
@export var one_shot: bool = true

var triggered: bool = false

func _on_body_entered(body: Node2D) -> void:
	if not body.is_in_group("player"):
		return
	if triggered:
		return
	if one_shot:
		monitoring = false
		set_deferred("monitoring", false)
	await QuestManager.announce_quest(new_quest_text)

extends Area2D

@export var target_scene: String = ""
@export var target_spawn_name: String = "SpawnPoint"

func interact() -> void:
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	SceneTransition.target_spawn_name = target_spawn_name
	get_tree().change_scene_to_file(target_scene)

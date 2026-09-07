extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var bgm = preload("res://assets/audio/music/Wildflowers By The River.ogg")
	AudioManager.play_music(bgm, 2.0)

extends Node2D

func _ready() -> void:
	var bgm = preload("res://assets/audio/music/Wildflowers By The River.ogg")
	AudioManager.play_music(bgm)

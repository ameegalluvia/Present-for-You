extends Node2D

func _ready() -> void:
	var bgm = preload("res://assets/audio/music/Wanderer's Tale.ogg")
	AudioManager.play_music(bgm)

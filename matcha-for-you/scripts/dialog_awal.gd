extends Node2D

@onready var player: CharacterBody2D = $"Player"

func _ready() -> void:
	player.override_animation = "sit_right"
	
	var bgm = preload("res://assets/audio/music/Sheep.ogg")
	AudioManager.play_music(bgm)
	
	MessageBox.show_dialogue([
		{"speaker": "Lievia", "text": "Halo paiz, lagi ngapain?"},
		{"speaker": "Kamu", "text": "Lagi santai aja di kamar, kalau kamu?"},
		{"speaker": "Lievia", "text": "Samaaa"},
		{"speaker": "Kamu", "text": "Mmm, kangenn.. Mo ketemu :("},
		{"speaker": "Lievia", "text": "Bolee, di rumahku aja"},
		{"speaker": "Kamu", "text": "Wuah bolehh nihh?"},
		{"speaker": "Lievia", "text": "Bolehh paiz"},
		{"speaker": "Kamu", "text": "Okeii gas otw babaii"},
		{"speaker": "Lievia", "text": "Eee-"}
	])
	
	await MessageBox.dialogue_finished
	MessageBox.is_busy = true
	await get_tree().create_timer(1.0).timeout
	
	await MessageBox.show_notification("Hehe hari ini hari ulang tahun Lievia...", 4.0)
	await MessageBox.show_notification("Aku mau surprise in dia ahh <3", 4.0)
	
	player.override_animation = ""
	

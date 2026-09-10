extends Node2D

@onready var player: CharacterBody2D = $"Player"

func _ready() -> void:
	player.override_animation = "sit_right"
	
	var bgm = preload("res://assets/audio/music/Sheep.ogg")
	AudioManager.play_music(bgm)
	
	MessageBox.show_dialogue([
		{"speaker": "Kamu", "text": "Aloo lipii, selamat ulang tahun yaah"},
		{"speaker": "Lievia", "text": "Eee- tiba tiba banget, makasii"},
		{"speaker": "Kamu", "text": "Hehe sama sama, kamu lagi apa?"},
		{"speaker": "Lievia", "text": "Akuu lagi bikin kue ini"},
		{"speaker": "Kamu", "text": "Wuahh, enaknyaa.. Kue apa?"},
		{"speaker": "Lievia", "text": "Kue ulang tahun :D bikin bareng mamah"},
		{"speaker": "Kamu", "text": "Mmm, mau ikuutt"},
		{"speaker": "Lievia", "text": "Tapi bentar lagi selesaii"},
		{"speaker": "Lievia", "text": "Kalau mau, kamu ke rumah ajaa :D"},
		{"speaker": "Kamu", "text": "Wihh boleh nii?"},
		{"speaker": "Lievia", "text": "Bolehh koo, sekalian mam kue bareng"},
		{"speaker": "Kamu", "text": "Oteii, aku otw sekarang yaah >//<"},
		{"speaker": "Lievia", "text": "Eee- okee, hati hati yaah :D"}
	])
	
	await MessageBox.dialogue_finished
	MessageBox.is_busy = true
	await get_tree().create_timer(1.0).timeout
	
	await MessageBox.show_notification("Hehe hari ini hari ulang tahun Lievia...", 4.0)
	await MessageBox.show_notification("Aku mau surprise in dia ahh <3", 4.0)
	
	player.override_animation = ""
	

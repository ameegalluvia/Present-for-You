extends Node2D

func _ready() -> void:
	MessageBox.show_dialogue([
		{"speaker": "Lievia", "text": "Halo paiz, lagi ngapain?"},
		{"speaker": "Kamu", "text": "Lagi santai aja di kamar, kalau kamu?"},
		{"speaker": "Lievia", "text": "Samaaa"},
		{"speaker": "Kamu", "text": "Mmm, kangenn.. Mo ketemu :("},
		{"speaker": "Lievia", "text": "Bolee, di rumahku aja"},
		{"speaker": "Kamu", "text": "Wuah bolehh nihh?"},
		{"speaker": "Lievia", "text": "Bolehh paiz"},
		{"speaker": "Kamu", "text": "Okeii gas otw babaii"},
		{"speaker": "Lievia", "text": "Eee-"},
	])

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
		{"speaker": "Lievia", "text": "Eee-"}
	])
	
	await MessageBox.dialogue_finished
	
	await MessageBox.show_notification("Hehe hari ini hari ulang tahun Lievia...", 4.0)
	await MessageBox.show_notification("Aku mau surprise in dia ahh <3", 4.0)
	await MessageBox.show_notification("Objective: Ambil matcha, susu, dan cangkir!", 4.5)

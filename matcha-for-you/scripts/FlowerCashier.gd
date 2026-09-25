extends Area2D 
func interact() -> void: 
	if GameState.chosen_flower == "": 
		await MessageBox.show_notification("Pilih bunga dulu yuk!") 
		return 
	
	await MessageBox.show_dialogue([ {"speaker": "Penjaga Toko", "text": "Bunga " + GameState.chosen_flower + ", total 15rb ya!"}, {"speaker": "Kamu", "text": "Oke, ini uangnya."}, {"speaker": "Penjaga Toko", "text": "Makasih! Semoga harinya menyenangkan~"} ]) 
	GameState.has_flower = true 
	await QuestManager.announce_quest("Beli boneka untuk Lievia!")

extends Area2D 

@export var flower_name: String = "" 

func interact() -> void: 
	GameState.chosen_flower = flower_name 
	await MessageBox.show_notification("Kamu memilih bunga " + flower_name + "!")

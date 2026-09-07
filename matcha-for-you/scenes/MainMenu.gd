extends Control 

@onready var continue_button: Button = $Continue

func _ready() -> void: 
	continue_button.visible = SaveManager.has_save() 
	
func _on_new_game_pressed() -> void: 
	SaveManager.delete_save() 
	GameState.reset() 
	QuestManager.complete_quest() 
	PauseMenu.show() 
	get_tree().change_scene_to_file("res://scenes/Rumah.tscn") 
	
func _on_continue_pressed() -> void: 
	var data = SaveManager.load_game() 
	if data.is_empty(): 
		return 
	SaveManager.apply_loaded_data(data) 
	PauseMenu.show() 
	get_tree().change_scene_to_file(data.scene_path) 
	
func _on_exit_pressed() -> void: 
	get_tree().quit()

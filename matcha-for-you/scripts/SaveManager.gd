extends Node 

const SAVE_PATH = "user://savegame.save" 

func save_game(scene_path: String) -> void: 
	var data = { "scene_path": scene_path, "has_matcha": GameState.has_matcha, "has_milk": GameState.has_milk, "has_cup": GameState.has_cup, "has_ice": GameState.has_ice, "current_quest": QuestManager.current_quest, "has_active_quest": QuestManager.has_active_quest } 
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE) 
	
	file.store_var(data) 
	file.close() 
	
func has_save() -> bool: 
	return FileAccess.file_exists(SAVE_PATH) 

func load_game() -> Dictionary: 
	if not has_save(): 
		return {} 
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ) 
	var data = file.get_var() 
	file.close() 
	return data 
	
func delete_save() -> void: 
		if has_save(): 
			DirAccess.remove_absolute(SAVE_PATH) 
		
func apply_loaded_data(data: Dictionary) -> void: 
	GameState.has_matcha = data.get("has_matcha", false) 
	GameState.has_milk = data.get("has_milk", false) 
	GameState.has_cup = data.get("has_cup", false) 
	GameState.has_ice = data.get("has_ice", false) 
	QuestManager.current_quest = data.get("current_quest", "") 
	QuestManager.has_active_quest = data.get("has_active_quest", false) 
	if QuestManager.has_active_quest: 
		QuestManager.quest_changed.emit(QuestManager.current_quest)

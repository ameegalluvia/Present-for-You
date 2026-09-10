extends Control 

@onready var settings_panel: Panel = $SettingsPanel 
@onready var music_slider: HSlider = $SettingsPanel/VBoxContainer/MusicSlider 
@onready var sfx_slider: HSlider = $SettingsPanel/VBoxContainer/SfxSlider 

func _ready() -> void: 
	settings_panel.hide() 
	music_slider.value = 1.0 
	sfx_slider.value = 1.0 
	
func _on_start_button_pressed() -> void:
	PauseMenu.show()
	get_tree().change_scene_to_file("res://scenes/Rumah.tscn")
	
func _on_settings_button_pressed() -> void: 
	settings_panel.show() 
	
func _on_back_button_pressed() -> void: 
	settings_panel.hide() 
	
func _on_exit_button_pressed() -> void: 
	get_tree().quit() 
	
func _on_music_slider_value_changed(value: float) -> void: 
	AudioManager.set_music_volume(value) 
	
func _on_sfx_slider_value_changed(value: float) -> void: 
	AudioManager.set_sfx_volume(value)

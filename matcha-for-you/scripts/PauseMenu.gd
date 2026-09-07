extends CanvasLayer

@onready var panel: Panel = $Panel
@onready var pause_button: Button = $PauseButton
@onready var resume_button: Button = $Panel/VBoxContainer/ResumeButton
@onready var music_slider: HSlider = $Panel/VBoxContainer/MusicSlider
@onready var sfx_slider: HSlider = $Panel/VBoxContainer/SfxSlider
@onready var main_menu_button: Button = $Panel/VBoxContainer/MainMenuButton
@onready var confirm_panel: Panel = $Panel/ConfirmPanel
@onready var yes_button: Button = $Panel/ConfirmPanel/HBoxContainer/YesButton
@onready var no_button: Button = $Panel/ConfirmPanel/HBoxContainer/NoButton

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	panel.hide()
	confirm_panel.hide()
	pause_button.pressed.connect(_on_pause_pressed)
	resume_button.pressed.connect(_on_resume_pressed)
	main_menu_button.pressed.connect(_on_main_menu_pressed)
	yes_button.pressed.connect(_on_confirm_yes)
	no_button.pressed.connect(_on_confirm_no)
	music_slider.value_changed.connect(_on_music_volume_changed)
	sfx_slider.value_changed.connect(_on_sfx_volume_changed)
	music_slider.value = 1.0
	sfx_slider.value = 1.0

func _on_pause_pressed() -> void:
	AudioManager.play_sfx(preload("res://assets/audio/sfx/SFX_Button_004.wav"))
	get_tree().paused = true
	panel.show()

func _on_resume_pressed() -> void:
	AudioManager.play_sfx(preload("res://assets/audio/sfx/SFX_Button_004.wav"))
	get_tree().paused = false
	panel.hide()

func _on_main_menu_pressed() -> void:
	AudioManager.play_sfx(preload("res://assets/audio/sfx/SFX_Button_004.wav"))
	confirm_panel.show()

func _on_confirm_yes() -> void:
	AudioManager.play_sfx(preload("res://assets/audio/sfx/SFX_Button_004.wav"))
	MessageBox.force_close()
	get_tree().paused = false
	panel.hide()
	confirm_panel.hide()
	hide()
	get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")

func _on_confirm_no() -> void:
	AudioManager.play_sfx(preload("res://assets/audio/sfx/SFX_Button_004.wav"))
	confirm_panel.hide()

func _on_music_volume_changed(value: float) -> void:
	AudioManager.set_music_volume(value)

func _on_sfx_volume_changed(value: float) -> void:
	AudioManager.set_sfx_volume(value)

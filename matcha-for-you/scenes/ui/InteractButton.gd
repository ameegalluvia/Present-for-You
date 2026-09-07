extends CanvasLayer 

@onready var button: Button = $Button 

func _ready() -> void: 
	button.hide() 
	button.pressed.connect(_on_pressed) 

func show_button() -> void: 
	button.show() 
	
func hide_button() -> void: 
	button.hide() 
	
func _on_pressed() -> void: 
	AudioManager.play_sfx(preload("res://assets/audio/sfx/SFX_Button_004.wav"))
	InteractionManager.try_interact()

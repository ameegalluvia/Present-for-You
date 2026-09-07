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
	InteractionManager.try_interact()

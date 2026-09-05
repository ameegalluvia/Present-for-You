extends CanvasLayer

@onready var box: Control = $Box
@onready var notif_label: Label = $Box/NotifLabel
@onready var portrait_kamu: AnimatedSprite2D = $Box/PortraitKamu
@onready var portrait_lievia: AnimatedSprite2D = $Box/PortraitLievia
@onready var speaker_label: Label = $Box/SpeakerLabel
@onready var text_label: Label = $Box/TextLabel

var dialogue_lines: Array = []
var current_index: int = 0
var is_dialogue_mode: bool = false

func _ready() -> void:
	box.hide()

func show_notification(text: String, duration: float = 2.0) -> void:
	is_dialogue_mode = false
	_hide_dialogue_elements()
	notif_label.show()
	notif_label.text = text
	box.show()
	await get_tree().create_timer(duration).timeout
	box.hide()

func show_dialogue(lines: Array) -> void:
	is_dialogue_mode = true
	notif_label.hide()
	speaker_label.show()
	dialogue_lines = lines
	current_index = 0
	box.show()
	_display_current_line()

func _display_current_line() -> void:
	var line: Dictionary = dialogue_lines[current_index]
	speaker_label.text = line.speaker
	text_label.text = line.text
	
	portrait_kamu.hide()
	portrait_lievia.hide()
	
	if line.speaker == "Kamu":
		portrait_kamu.show()
		portrait_kamu.play("kamu_talk")
	elif line.speaker == "Lievia":
		portrait_lievia.show()
		portrait_lievia.play("lievia_talk")

func advance_dialogue() -> void:
	if not is_dialogue_mode:
		return
	current_index += 1
	if current_index >= dialogue_lines.size():
		box.hide()
		is_dialogue_mode = false
	else:
		_display_current_line()

func _hide_dialogue_elements() -> void:
	speaker_label.hide()
	text_label.hide()
	portrait_kamu.hide()
	portrait_lievia.hide()

func _unhandled_input(event: InputEvent) -> void:
	if is_dialogue_mode and event is InputEventScreenTouch and event.pressed:
		advance_dialogue()

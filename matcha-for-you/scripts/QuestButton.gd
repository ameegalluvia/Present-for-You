extends CanvasLayer

@onready var button: Button = $Button

func _ready() -> void:
	button.hide()
	QuestManager.quest_changed.connect(_on_quest_changed)
	QuestManager.quest_cleared.connect(_on_quest_cleared)
	button.pressed.connect(_on_button_pressed)

func _on_quest_changed(text: String) -> void:
	button.show()

func _on_quest_cleared() -> void:
	button.hide()

func _on_button_pressed() -> void:
	MessageBox.show_notification(QuestManager.current_quest, 3.0)

extends Node

signal quest_changed(text: String)
signal quest_cleared

var current_quest: String = ""
var has_active_quest: bool = false

func announce_quest(text: String, duration: float = 3.0) -> void:
	await MessageBox.show_notification(text, duration)
	AudioManager.play_sfx(preload("res://assets/audio/sfx/SFX_Positive_Feedback_008.wav"))
	current_quest = text
	has_active_quest = true
	quest_changed.emit(text)

func complete_quest() -> void:
	has_active_quest = false
	current_quest = ""
	quest_cleared.emit()

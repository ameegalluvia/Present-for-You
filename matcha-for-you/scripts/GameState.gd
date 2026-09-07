extends Node

var has_matcha: bool = false
var has_milk: bool = false
var has_cup: bool = false
var has_ice: bool = false

func collect_item(item_name: String) -> void:
	match item_name:
		"matcha": has_matcha = true
		"milk": has_milk = true
		"cup": has_cup = true
		"ice": has_ice = true
		
func dont_have_items() -> bool:
	return not has_matcha or not has_milk or not has_cup

func has_initial_items() -> bool:
	return has_matcha and has_milk and has_cup

func all_items_collected() -> bool:
	return has_initial_items() and has_ice

func reset() -> void: 
	has_matcha = false 
	has_milk = false 
	has_cup = false 
	has_ice = false

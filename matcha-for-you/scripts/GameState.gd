extends Node

var has_matcha: bool = false
var has_milk: bool = false
var has_cup: bool = false
var has_ice: bool = false

func collect_item(item_name: String) -> void:
	print("Menerima item: '", item_name, "'")
	match item_name:
		"matcha": has_matcha = true
		"milk": has_milk = true
		"cup": has_cup = true
		"ice": has_ice = true
	print("Status sekarang -> matcha:", has_matcha, " milk:", has_milk, " cup:", has_cup, " ice:", has_ice)
		

func has_initial_items() -> bool:
	return has_matcha and has_milk and has_cup

func all_items_collected() -> bool:
	return has_initial_items() and has_ice

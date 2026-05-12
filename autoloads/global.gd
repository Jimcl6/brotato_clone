extends Node

var player: Player
const FLASH_MATERIAL = preload("uid://bfv8fopedp2de")

func get_chance_success(chance: float) -> bool:
	var random := randf_range(0,1.0)
	if random < chance:
		return true
	return false
	

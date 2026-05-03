extends Resource
class_name UnitStats

enum UnitType {
	PLAYER,
	ENEMY
}

@export var name: String
@export var type: UnitType

#Icon
@export var icon: Texture2D

#Health
@export var health := 1
@export var health_increased_per_wave := 1
#Damage
@export var damage := 1.0
@export var damage_increased_per_wave := 1.0

#speed
@export var speed := 300
@export var luck := 1.0
@export var block_chance := 0.0

#item_drops
@export var gold_drop := 1

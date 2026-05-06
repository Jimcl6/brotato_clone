extends Area2D
class_name HitBoxComponent

signal on_hit_hurtbox(hurtBox: HurtBoxComponent)

var dmg := 1.0
var crit_damage := false
var knockback_power := 0.0
var source : Node2D

func enable() -> void:
	set_deferred('monitoring', true)
	set_deferred('monitorable', true)
	
func disable() -> void:
	set_deferred('monitoring', false)
	set_deferred('monitorable', false)
	
func set_up(damage: float, crit_dmg: bool, knockback: float, source: Node2D) -> void:
	self.damage = damage
	self.crit_dmg = crit_dmg
	knockback_power = knockback
	self.source = source


func on_area_entered(area: Area2D) -> void:
	if area is HurtBoxComponent:
		on_hit_hurtbox.emit(area)
		print(area.owner.name)

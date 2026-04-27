extends Unit
class_name Player

@export var dash_duration:= 0.5
@export var dash_speed_multi:= 0.5
@export var dash_cooldown:= 0.5

@onready var dash_timer: Timer = $DashTimer
@onready var dash_cool_down_timer: Timer = $DashCoolDownTimer
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

var move_dir: Vector2
var is_dashing := false
var dash_available := true

func _ready() -> void:
	dash_timer.wait_time = dash_duration
	dash_cool_down_timer.wait_time = dash_cooldown

func _process(delta: float) -> void:
	move_dir = Input.get_vector("move_left","move_right","move_up","move_down")
	
	var curr_velocity := move_dir * 500
	position += curr_velocity * delta
	
	update_animations()
	update_rotation()

func update_animations() -> void:
	if move_dir.length() > 0:
		anim_player.play("move")
	else:
		anim_player.play("idle")
		
func update_rotation() -> void:
	if move_dir == Vector2.ZERO:
		return
	
	if move_dir.x >= 0.1:
		visuals.scale = Vector2(-0.5,0.5)
	else:
		visuals.scale = Vector2(0.5,0.5)
		
func start_dash() -> void:
	is_dashing = true
	dash_timer.start()

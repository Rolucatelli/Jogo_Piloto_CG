extends RigidBody2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var interaction_range: Area2D = $InteractionRange
@onready var hit_box: CollisionShape2D = $HitBox
@onready var ray_cast_2d: RayCast2D = $HitBox/RayCast2D

@export var max_X := 0.0
@export var min_X := 0.0


var player : Node2D
var onArea := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false
	interaction_range.monitoring = false
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	
	if ray_cast_2d.is_colliding():
		animation_player.play("Queda")
		animation_player.queue("Loop")
		ray_cast_2d.enabled = false
	
	if player and onArea and Input.is_action_just_pressed(player.interact):
		if not player.arma:
			visible = false
			interaction_range.monitoring = false
			player.arma = true
			onArea = false
	
	if rotation != 0:
		rotation = 0
	


func _on_interaction_range_body_entered(body: Node2D) -> void:
	onArea = true
	player = body


func _on_interaction_range_body_exited(body: Node2D) -> void:
	onArea = false


func _on_timer_timeout() -> void:
	visible = true
	interaction_range.monitoring = true
	position.y -= 400
	position.x = randf_range(max_X, min_X)
	

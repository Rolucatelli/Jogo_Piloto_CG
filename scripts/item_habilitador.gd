extends RigidBody2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var interaction_range: Area2D = $InteractionRange
@onready var hit_box: CollisionShape2D = $HitBox
@onready var ray_cast_2d: RayCast2D = $HitBox/RayCast2D

@export var caiu := false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_cast_2d.is_colliding():
		animation_player.play("Queda")
		ray_cast_2d.enabled = false
	
	if caiu:
		animation_player.play("Loop")
	
	


func _on_interaction_range_body_entered(body: Node2D) -> void:
	if body is Player and Input.is_action_pressed(body.interaction):
		visible = false
		body.emit_signal("EquiparArma")
	pass

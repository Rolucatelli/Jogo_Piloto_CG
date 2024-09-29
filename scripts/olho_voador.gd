extends Node2D

const SPEED = 60

var direction = 1

@onready var ray_cast_right: RayCast2D = $"RayCast2DDireita"
@onready var ray_cast_left: RayCast2D = $"RayCast2DEsquerda"
@onready var ray_cast_2d_baixo_d: RayCast2D = $RayCast2DBaixoD
@onready var ray_cast_2d_2_baixo_e: RayCast2D = $RayCast2D2BaixoE

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if ray_cast_right.is_colliding() || not ray_cast_2d_baixo_d.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	if ray_cast_left.is_colliding() || not ray_cast_2d_2_baixo_e.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
	
	position.x += direction * SPEED * delta
	
	

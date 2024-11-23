class_name Player

extends CharacterBody2D

@export var vida := 3:
	set(valor):
		vida = clamp(valor, 0, 3)
@export var dano := 0.0:
	set(valor):
		dano = clampf(float(valor), 0.0, 120.0)
@export var jogador := 1:
	set(valor):
		jogador = clamp(valor, 1, 2)

const SPEED = 115.0
const JUMP_VELOCITY = -275.0

var doubleJump := true

var jump := "jump1" if jogador == 1 else "jump2"
var left := "left1" if jogador == 1 else "left2"
var right := "right1" if jogador == 1 else "right2"


func _physics_process(delta: float) -> void:
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	
	# Handle jump.
	if Input.is_action_just_pressed(jump):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
		elif doubleJump:
			velocity.y = JUMP_VELOCITY
			doubleJump = false
	
	if is_on_floor():
			doubleJump = true
	
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis(left, right)
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()

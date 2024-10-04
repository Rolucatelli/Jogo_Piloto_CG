extends CharacterBody2D

signal hit

const SPEED = 115.0
const JUMP_VELOCITY = -275.0

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite: Sprite2D = $Sprite
@onready var arma: Sprite2D = $Arma
@onready var timer: Timer = $Timer



func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta


	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	
	
	
	move_and_slide()
	update_animations(direction)

func update_animations(direction):
	if is_on_floor():
		if direction < 0:
			if Input.is_action_just_pressed("attack"):
				animation_player.play("AtaqueE")
				animation_player.queue("IdleE")
				timer.start()
			elif timer.is_stopped():
				animation_player.play("IdleE")
		elif direction > 0:
			if Input.is_action_just_pressed("attack"):
				animation_player.play("AtaqueD")
				animation_player.queue("IdleD")
				timer.start()
			elif timer.is_stopped():
				animation_player.play("IdleD")
	else:
		if velocity.y < 0:
			sprite.flip_h = (direction == -1)
			animation_player.play("Pulo")
		elif velocity.y > 0:
			sprite.flip_h = (direction == -1)
			animation_player.play("Queda")
	
	
	
	

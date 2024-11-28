class_name Player

extends CharacterBody2D

const SPEED = 230.0
const JUMP_VELOCITY = -275.0
enum Jogador {JOGADOR1 = 1, JOGADOR2 = 2}

@export_category("Player Values")
@export var vida := 3:
	set(valor):
		vida = clamp(valor, 0, 3)
@export var dano := 0.0:
	set(valor):
		dano = clampf(float(valor), 0.0, 120.0)
@export var especial := 0.0:
	set(valor):
		especial = clampf(float(valor), 0.0, 100.0)
## Define os controles do personagem
@export var jogador : Jogador
## Define a arma do jogador
@export var arma := false

@export_group("Damage Container")
@export var hit_area : Node2D
@export var sprite_arma: Sprite2D 
@export var attack_speed: Timer
@export_group("Animation")
@export var animation_player: AnimationPlayer
@export var sprite_player: Sprite2D
@export var wait_jump_1: Timer
@export var hitbox_player_move: CollisionShape2D
@export_subgroup("Animacoes Sem Arma")
@export var ataque_sem_arma_1_D : String
@export var ataque_sem_arma_1_E : String
@export var ataque_sem_arma_2_D : String
@export var ataque_sem_arma_2_E : String
@export var ataque_sem_arma_3_D : String
@export var ataque_sem_arma_3_E : String
@export var pegar_item_D : String
@export var pegar_item_E : String
@export var correr_D : String
@export var correr_E : String
@export var idle_D : String
@export var idle_E : String
@export var no_ar_D : String
@export var no_ar_E : String
@export var pulo_D : String
@export var pulo_E : String
@export_subgroup("Animacoes Com Arma")
@export var ataque_com_arma_1_D : String
@export var ataque_com_arma_1_E : String
@export var ataque_com_arma_2_D : String
@export var ataque_com_arma_2_E : String
@export var ataque_com_arma_3_D : String
@export var ataque_com_arma_3_E : String
@export var levantar_item_D : String
@export var levantar_item_E : String
@export var correr_arma_D : String
@export var correr_arma_E : String
@export var idle_arma_D : String
@export var idle_arma_E : String
@export var no_ar_arma_D : String
@export var no_ar_arma_E : String
@export var pulo_arma_D : String
@export var pulo_arma_E : String





var lastDano := dano
var doubleJump := true

@onready var jump := "jump1" if (jogador == 1) else "jump2"
@onready var left := "left1" if (jogador == 1) else "left2"
@onready var right := "right1" if (jogador == 1) else "right2"
@onready var down := "down1" if (jogador == 1) else "down2"
@onready var attack := "attack1" if (jogador == 1) else "attack2"
@onready var special := "special1" if (jogador == 1) else "special2"
@onready var interact := "interact1" if (jogador == 1) else "interact2"



func _physics_process(delta: float) -> void:
	
	set_collision_layer_value(5, jogador == 1)
	set_collision_layer_value(6, jogador == 2)
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
	
	if Input.is_action_just_pressed(down) and is_on_floor():
		pass
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis(left, right)
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if dano != 0:
		print(dano)
	
	move_and_slide()
	animation()
	
	


var lastDirection := 0.01
var jumping := false
var wasOnAir := false

func animation():
	
	if attack_speed.is_stopped():
		
		var direction := Input.get_axis(left, right)
		
		if Input.is_action_pressed(attack):
			attack_speed.start()
			if lastDirection > 0: # Se a ultima direcao do player foi para a direita
				animation_player.play(ataque_sem_arma_1_D)
			else: # Se a ultima direcao do player foi para a esquerda
				animation_player.play(ataque_sem_arma_1_E)
			
		elif is_on_floor(): # Se o player ta no chao
			wasOnAir = false
			if direction > 0: # Se o player ta indo para a direita
				animation_player.play(correr_D)
			elif direction < 0: # Se o player ta indo para a esquerda
				animation_player.play(correr_E)
			else: # Se o player ta parado
				
				if lastDirection > 0: # Se a ultima direcao do player foi para a direita
					animation_player.play(idle_D)
				else: # Se a ultima direcao do player foi para a esquerda
					animation_player.play(idle_E)
				
				
		else: # Se o player NAO ta no chao
			
			if wasOnAir: # Se o player tava no ar
				if hitbox_player_move.get_child(0).is_colliding(): # Se ele ta para pousar no chao
					wasOnAir = false
					if lastDirection > 0: # Se o player ta indo para a direita
						animation_player.play(idle_D)
					else: # Se o player ta indo para a esquerda
						animation_player.play(idle_E)
				elif wait_jump_1.is_stopped(): # Se a animacao de pular acabou
					if lastDirection > 0: # Se o player tava indo para a direita
						animation_player.play(no_ar_D)
					else: # Se o player tava indo para a esquerda
						animation_player.play(no_ar_E)
					
				
			else: # Se o player NAO tava no ar
				wasOnAir = true
				if lastDirection > 0: # Se a ultima direcao do player foi para a direita
					animation_player.play(pulo_D)
					wait_jump_1.start()
				else:  # Se a ultima direcao do player foi para a esquerda
					animation_player.play(pulo_E)
					wait_jump_1.start()
				
			
		
		
		if direction != 0.0:
			lastDirection = direction

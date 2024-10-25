extends AnimationPlayer

@onready var player: Player = $".."
@onready var sprite_player: Sprite2D = $"../SpritePlayer"
@onready var wait_jump_1: Timer = $"../WaitJump1"
@onready var ray_cast_2d: RayCast2D = $"../HitboxPlayer/RayCast2D"
@onready var attack_speed: Timer = $"../DamageContainer/AttackSpeed"

var lastDirection := 0.01
var jumping := false
var wasOnAir := false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	if attack_speed.is_stopped():
		
		var direction := Input.get_axis("left1", "right1")
		
		if Input.is_action_pressed("attack1"):
			attack_speed.start()
			if lastDirection > 0: # Se a ultima direcao do player foi para a direita
				play("Ataque_SA_1_D")
			else: # Se a ultima direcao do player foi para a esquerda
				play("Ataque_SA_1_E")
			
		elif player.is_on_floor(): # Se o player ta no chao
			wasOnAir = false
			if direction > 0: # Se o player ta indo para a direita
				play("Run_D")
			elif direction < 0: # Se o player ta indo para a esquerda
				play("Run_E")
			else: # Se o player ta parado
				
				if lastDirection > 0: # Se a ultima direcao do player foi para a direita
					play("Idle_D")
				else: # Se a ultima direcao do player foi para a esquerda
					play("Idle_E")
				
				
		else: # Se o player NAO ta no chao
			
			if wasOnAir: # Se o player tava no ar
				if ray_cast_2d.is_colliding(): # Se ele ta para pousar no chao
					wasOnAir = false
					if lastDirection > 0: # Se o player ta indo para a direita
						play("Idle_D")
					else: # Se o player ta indo para a esquerda
						play("Idle_E")
				elif wait_jump_1.is_stopped(): # Se a animacao de pular acabou
					if lastDirection > 0: # Se o player tava indo para a direita
						play("OnAir_D")
					else: # Se o player tava indo para a esquerda
						play("OnAir_E")
					
				
			else: # Se o player NAO tava no ar
				wasOnAir = true
				if lastDirection > 0: # Se a ultima direcao do player foi para a direita
					play("Jump_1_D")
					wait_jump_1.start()
				else:  # Se a ultima direcao do player foi para a esquerda
					play("Jump_1_E")
					wait_jump_1.start()
				
			
		
		
		if direction != 0.0:
			lastDirection = direction
	

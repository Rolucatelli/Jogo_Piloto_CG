extends Node

@onready var player: Player = $Player

func _on_kill_zone_player_died(body: Player) -> void:
	if body is Player:
		player.vida -= 1
		player.dano = 0
		if player.vida <= 0:
			print("Game Over!")
		else:
			player.position.x = -6
			player.position.y = -30

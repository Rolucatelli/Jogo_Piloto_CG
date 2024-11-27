class_name HitArea

extends Area2D

## Dano causado pelo ataque
@export var dano := 0

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.dano += dano
		body.especial += dano/2
	elif body is BonecoDeTreino:
		body.dano = dano

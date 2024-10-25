class_name HitArea

extends Area2D

@export var dano := 0

func _on_body_entered(body: Node2D) -> void:
	if body is Player or body is BonecoDeTreino:
		body.dano += dano

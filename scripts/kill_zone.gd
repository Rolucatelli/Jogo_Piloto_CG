extends Area2D


func _on_body_entered(body: Node2D) -> void:
	#print(body.get_class())
	if body.is_class("CharacterBody2D"):
		body.vida -= 1
		print("Player " + String(body.jogador) + " died!")
	else:
		print("Something died!")

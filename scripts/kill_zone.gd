extends Area2D

signal player_died(body: Player)



func _on_body_entered(body: Node2D) -> void:
	#print(body.get_class())
	if body.is_class("CharacterBody2D"):
		player_died.emit(body)
		print("You died!")
	else:
		print("Something died!")

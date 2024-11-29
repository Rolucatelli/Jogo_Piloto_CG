class_name HitArea

extends Area2D

## Dano causado pelo ataque
@export var dano := 0

@onready var audio_stream_player: AudioStreamPlayer = $"../../CopyAndPaste/AudioStreamPlayer"


func _on_body_entered(body: Node2D) -> void:
	if body is Player or body is BonecoDeTreino:
		body.dano += dano
		print(body.dano)
		audio_stream_player.play()
		
	

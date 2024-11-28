extends Node2D

@onready var button_sound = $button_sound

var button_type = null

func _on_jogar_pressed() -> void:
	button_type = "start"
	button_sound.play()
	$Fade_transition.show()
	$Fade_transition/fade_timer.start()
	$Fade_transition/Animation.play("Fade_in")


func _on_sair_pressed() -> void:
	get_tree().quit()


func _on_fade_timer_timeout() -> void:
	if button_type == "start" :
		get_tree().change_scene_to_file("res://scenes/game.tscn")
		

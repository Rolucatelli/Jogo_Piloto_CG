extends AnimationPlayer

@onready var timer: Timer = $Timer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if timer.is_stopped():
		play("Idle")


func _on_hit_box_area_entered(area: Area2D) -> void:
	if area is HitArea:
		play("On_Hit")
		timer.start()
	

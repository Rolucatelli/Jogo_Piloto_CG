extends Node
@onready var greek: Node2D = $Greek
@onready var egypt: Node2D = $Egypt

func _ready() -> void:
	if randi_range(1,2) == 1 :
		greek.visible = true
	else:
		egypt.visible = true

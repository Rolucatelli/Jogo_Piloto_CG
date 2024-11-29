extends Node
@onready var greek: Node2D = $Greek
@onready var egypt: Node2D = $Egypt

func _ready() -> void:
	if randi_range(1,2) == 1 :
		greek.visible = true
		egypt.position.x = 10000
		egypt.position.y = 10000
	else:
		egypt.visible = true
		greek.position.x = 10000
		greek.position.y = 10000

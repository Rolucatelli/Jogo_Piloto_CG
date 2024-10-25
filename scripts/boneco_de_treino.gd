class_name BonecoDeTreino

extends Node2D

@onready var dano_causado: Label = $DanoCausado
@onready var area_2d: Area2D = $Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_hit_box_area_entered(area: Area2D) -> void:
	if area is HitArea:
		dano_causado.set_text(String.num_int64(area.dano))
